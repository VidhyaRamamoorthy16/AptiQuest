const pool = require('../config/database');
const { getTodayIST } = require('./streakController');


// Helper to get deterministic question ID based on date
const getDailyQuestionId = (totalQuestions) => {
  const todayStr = getTodayIST();
  let hash = 0;
  for (let i = 0; i < todayStr.length; i++) {
    hash = todayStr.charCodeAt(i) + ((hash << 5) - hash);
  }
  hash = Math.abs(hash);
  return (hash % (totalQuestions || 850)) + 1;
};


// GET /api/daily-challenge - Get today's daily challenge
const getDailyChallenge = async (req, res) => {
  try {
    const userId = req.user.id;

    // 1. Get total questions count to bounds-check hash
    const [[{ total }]] = await pool.execute('SELECT COUNT(*) as total FROM questions');
    if (total === 0) {
      return res.status(404).json({ success: false, message: 'No questions available' });
    }

    const dailyQId = getDailyQuestionId(total);

    // 2. Fetch the question details
    const [qRows] = await pool.execute(`
      SELECT q.id, q.question as questionText, q.difficulty, q.correct_answer, q.explanation, s.name as sectionName, t.name as topicName
      FROM questions q
      JOIN sections s ON q.section_id = s.id
      JOIN topics t ON q.topic_id = t.id
      WHERE q.id = ?
    `, [dailyQId]);

    if (qRows.length === 0) {
      return res.status(404).json({ success: false, message: 'Daily challenge question not found' });
    }

    const question = qRows[0];

    // 3. Fetch options
    const [options] = await pool.execute(`
      SELECT option_label as optionLetter, option_text as optionText
      FROM question_options
      WHERE question_id = ?
      ORDER BY option_label
    `, [dailyQId]);

    // 4. Check if user already completed this challenge today
    const [attempts] = await pool.execute(`
      SELECT is_correct, selected_answer 
      FROM user_attempts
      WHERE user_id = ? AND question_id = ? AND DATE(CONVERT_TZ(attempted_at, @@session.time_zone, '+05:30')) = ?
      ORDER BY id DESC LIMIT 1
    `, [userId, dailyQId, getTodayIST()]);


    const alreadyAnswered = attempts.length > 0;

    const payload = {
      id: question.id,
      questionText: question.questionText,
      difficulty: question.difficulty,
      sectionName: question.sectionName,
      topicName: question.topicName,
      options,
      alreadyAnswered
    };

    if (alreadyAnswered) {
      payload.isCorrect = attempts[0].is_correct === 1;
      payload.selectedAnswer = attempts[0].selected_answer;
      payload.correctAnswer = question.correct_answer;
      payload.explanation = question.explanation;
    }

    res.json(payload);
  } catch (error) {
    console.error('Get daily challenge error:', error);
    res.status(500).json({ success: false, message: 'Error fetching daily challenge' });
  }
};

// POST /api/daily-challenge/submit - Submit answer for daily challenge
const submitDailyChallenge = async (req, res) => {
  try {
    const userId = req.user.id;
    const { answer } = req.body; // 'A', 'B', 'C', 'D'

    if (!answer) {
      return res.status(400).json({ success: false, message: 'Answer selection is required' });
    }

    // 1. Get total questions count
    const [[{ total }]] = await pool.execute('SELECT COUNT(*) as total FROM questions');
    const dailyQId = getDailyQuestionId(total);

    // 2. Check if already answered today
    const [attempts] = await pool.execute(`
      SELECT id FROM user_attempts
      WHERE user_id = ? AND question_id = ? AND DATE(CONVERT_TZ(attempted_at, @@session.time_zone, '+05:30')) = ?
    `, [userId, dailyQId, getTodayIST()]);


    if (attempts.length > 0) {
      return res.status(400).json({ success: false, message: "You have already completed today's challenge!" });
    }

    // 3. Verify answer
    const [qRows] = await pool.execute(
      'SELECT correct_answer, explanation FROM questions WHERE id = ?',
      [dailyQId]
    );

    const question = qRows[0];
    const isCorrect = question.correct_answer.toUpperCase() === answer.toUpperCase();
    const pointsReward = isCorrect ? 20 : 0; // 2x points bonus (20 pts) if correct

    // 4. Save attempt
    await pool.execute(`
      INSERT INTO user_attempts (user_id, question_id, selected_answer, is_correct, time_taken)
      VALUES (?, ?, ?, ?, 0)
    `, [userId, dailyQId, answer.toUpperCase(), isCorrect]);

    // 5. Update user points
    if (isCorrect) {
      await pool.execute('UPDATE users SET total_points = total_points + ? WHERE id = ?', [pointsReward, userId]);
    }

    // 6. Log daily activity
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, 1)
      ON DUPLICATE KEY UPDATE questions_done = questions_done + 1
    `, [userId, getTodayIST()]);


    // Check badges
    let newBadges = [];
    try {
      const { checkAndAwardBadges } = require('./streakController');
      newBadges = await checkAndAwardBadges(userId);
    } catch (badgeErr) {
      console.error('Error awarding badges:', badgeErr);
    }

    res.json({
      success: true,
      isCorrect,
      correctAnswer: question.correct_answer,
      explanation: question.explanation,
      pointsAwarded: pointsReward,
      newBadges
    });
  } catch (error) {
    console.error('Submit daily challenge error:', error);
    res.status(500).json({ success: false, message: 'Error submitting daily challenge' });
  }
};

module.exports = {
  getDailyChallenge,
  submitDailyChallenge
};
