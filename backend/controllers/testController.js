const pool = require('../config/database');
const { getTodayIST } = require('./streakController');


// GET /api/tests - List all standard timed tests
const getTests = async (req, res) => {
  try {
    const [tests] = await pool.execute(`
      SELECT t.id, t.name, t.description, t.duration / 60 as duration, t.total_questions, s.name as section, 'medium' as difficulty
      FROM tests t
      LEFT JOIN sections s ON t.section_id = s.id
      WHERE t.test_type = 'topic' OR t.test_type IS NULL OR t.test_type = ''
    `);
    
    res.json(tests);
  } catch (error) {
    console.error('Get tests error:', error);
    res.status(500).json({ success: false, message: 'Error fetching tests' });
  }
};

// GET /api/tests/:id - Get test details + questions
const getTestById = async (req, res) => {
  try {
    const { id } = req.params;

    // Get test details
    const [testRows] = await pool.execute(`
      SELECT t.id, t.name, t.description, t.duration / 60 as duration, t.total_questions, s.name as section
      FROM tests t
      LEFT JOIN sections s ON t.section_id = s.id
      WHERE t.id = ?
    `, [id]);

    if (testRows.length === 0) {
      return res.status(404).json({ success: false, message: 'Test not found' });
    }

    const test = testRows[0];

    // Get questions mapped to the test
    const [questionRows] = await pool.execute(`
      SELECT q.id, q.question as questionText, q.difficulty, q.correct_answer as correctAnswer, q.explanation
      FROM questions q
      JOIN test_questions tq ON q.id = tq.question_id
      WHERE tq.test_id = ?
      ORDER BY tq.question_order
    `, [id]);

    // For each question, get options
    for (let q of questionRows) {
      const [optionRows] = await pool.execute(`
        SELECT option_label as optionLetter, option_text as optionText
        FROM question_options
        WHERE question_id = ?
        ORDER BY option_label
      `, [q.id]);
      q.options = optionRows;
    }

    test.questions = questionRows;
    res.json(test);
  } catch (error) {
    console.error('Get test by ID error:', error);
    res.status(500).json({ success: false, message: 'Error fetching test details' });
  }
};

// POST /api/tests/:id/submit - Submit test answers
const submitTest = async (req, res) => {
  try {
    const { id } = req.params;
    const { answers, timeTaken = 0 } = req.body;
    const userId = req.user.id;

    // Fetch test details & questions
    const [testRows] = await pool.execute('SELECT * FROM tests WHERE id = ?', [id]);
    if (testRows.length === 0) {
      return res.status(404).json({ success: false, message: 'Test not found' });
    }
    const test = testRows[0];

    const [questionRows] = await pool.execute(`
      SELECT q.id, q.question as questionText, q.correct_answer as correctAnswer, q.explanation
      FROM questions q
      JOIN test_questions tq ON q.id = tq.question_id
      WHERE tq.test_id = ?
      ORDER BY tq.question_order
    `, [id]);

    // Gather question options
    for (let q of questionRows) {
      const [optionRows] = await pool.execute(`
        SELECT option_label as optionLetter, option_text as optionText
        FROM question_options
        WHERE question_id = ?
        ORDER BY option_label
      `, [q.id]);
      q.options = optionRows;
    }

    let correct = 0;
    let wrong = 0;
    let skipped = 0;
    const submittedAnswers = [];

    // Evaluate answers
    for (let index = 0; index < questionRows.length; index++) {
      const question = questionRows[index];
      const selectedOption = answers[index]; // Note: Frontend keys answers by question index

      const hasSelected = selectedOption !== undefined && selectedOption !== null && selectedOption !== '';
      const isCorrect = hasSelected && selectedOption.toUpperCase() === question.correctAnswer.toUpperCase();

      if (!hasSelected) {
        skipped++;
      } else if (isCorrect) {
        correct++;
      } else {
        wrong++;
      }

      submittedAnswers.push({
        questionId: question.id,
        selectedOption: selectedOption || null,
        isCorrect: hasSelected ? isCorrect : false,
        correctOption: question.correctAnswer,
        question: {
          questionText: question.questionText,
          options: question.options,
          explanation: question.explanation
        }
      });
    }

    const totalQuestions = questionRows.length;
    const accuracy = totalQuestions > 0 ? (correct / totalQuestions) * 100 : 0;
    const score = correct * 10; // e.g., 10 points per correct answer

    // Save test attempt
    const [attemptInsert] = await pool.execute(`
      INSERT INTO test_attempts (user_id, test_id, started_at, submitted_at, score, total_questions, accuracy, time_taken)
      VALUES (?, ?, DATE_SUB(NOW(), INTERVAL ? SECOND), NOW(), ?, ?, ?, ?)
    `, [userId, id, timeTaken, score, totalQuestions, accuracy, timeTaken]);

    const attemptId = attemptInsert.insertId;

    // Save individual answers
    for (const ans of submittedAnswers) {
      await pool.execute(`
        INSERT INTO test_attempt_answers (attempt_id, question_id, selected_answer, is_correct, time_taken)
        VALUES (?, ?, ?, ?, 0)
      `, [attemptId, ans.questionId, ans.selectedOption, ans.isCorrect]);
    }

    // Award user points
    await pool.execute(`
      UPDATE users SET total_points = total_points + ? WHERE id = ?
    `, [score, userId]);

    // Log daily activity
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, ?)
      ON DUPLICATE KEY UPDATE questions_done = questions_done + VALUES(questions_done)
    `, [userId, getTodayIST(), totalQuestions]);


    // Check badges dynamically
    let newBadges = [];
    try {
      const { checkAndAwardBadges } = require('./streakController');
      newBadges = await checkAndAwardBadges(userId);
    } catch (badgeErr) {
      console.error('Error awarding badges:', badgeErr);
    }

    res.json({
      success: true,
      attemptId,
      correct,
      wrong,
      skipped,
      totalQuestions,
      accuracy,
      timeTaken,
      answers: submittedAnswers,
      newBadges
    });
  } catch (error) {
    console.error('Submit test error:', error);
    res.status(500).json({ success: false, message: 'Error submitting test answers' });
  }
};

// GET /api/tests/:id/result - Get results for latest attempt
const getTestResult = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.id;

    // Find latest completed attempt
    const [attempts] = await pool.execute(`
      SELECT id, score, total_questions as totalQuestions, accuracy, time_taken as timeTaken
      FROM test_attempts
      WHERE user_id = ? AND test_id = ? AND submitted_at IS NOT NULL
      ORDER BY submitted_at DESC
      LIMIT 1
    `, [userId, id]);

    if (attempts.length === 0) {
      return res.status(404).json({ success: false, message: 'No result found for this test' });
    }

    const attempt = attempts[0];

    // Fetch individual answers
    const [answers] = await pool.execute(`
      SELECT taa.question_id as questionId, taa.selected_answer as selectedOption, taa.is_correct as isCorrect,
             q.question as questionText, q.correct_answer as correctOption, q.explanation
      FROM test_attempt_answers taa
      JOIN questions q ON taa.question_id = q.id
      WHERE taa.attempt_id = ?
    `, [attempt.id]);

    // Add options to each question review
    for (let ans of answers) {
      const [optionRows] = await pool.execute(`
        SELECT option_label as optionLetter, option_text as optionText
        FROM question_options
        WHERE question_id = ?
        ORDER BY option_label
      `, [ans.questionId]);
      
      ans.question = {
        questionText: ans.questionText,
        options: optionRows,
        explanation: ans.explanation
      };
    }

    // Calculate correct, wrong, skipped counts
    let correct = 0;
    let wrong = 0;
    let skipped = 0;

    for (const ans of answers) {
      if (ans.selectedOption === null || ans.selectedOption === '') {
        skipped++;
      } else if (ans.isCorrect) {
        correct++;
      } else {
        wrong++;
      }
    }

    res.json({
      success: true,
      correct,
      wrong,
      skipped,
      totalQuestions: attempt.totalQuestions,
      accuracy: parseFloat(attempt.accuracy),
      timeTaken: attempt.timeTaken,
      answers
    });
  } catch (error) {
    console.error('Get test result error:', error);
    res.status(500).json({ success: false, message: 'Error fetching test result' });
  }
};

module.exports = { getTests, getTestById, submitTest, getTestResult };
