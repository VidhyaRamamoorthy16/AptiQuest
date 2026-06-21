const pool = require('../config/database');
const { getTodayIST } = require('./streakController');


// Helper to map frontend section keys to DB section names
const mapSectionKeyToName = (key) => {
  const mapping = {
    'quantitative': 'Quantitative Aptitude',
    'logical': 'Logical Reasoning',
    'di': 'Data Interpretation',
    'verbal': 'Verbal Ability'
  };
  return mapping[(key || '').toLowerCase()] || 'Quantitative Aptitude';
};

// GET /api/data/topics - Get topics for a section
const getTopics = async (req, res) => {
  try {
    const { section } = req.query;
    const userId = req.user.id;

    const sectionName = mapSectionKeyToName(section);

    const [rows] = await pool.execute(`
      SELECT t.id, t.name, t.description,
             COUNT(DISTINCT q.id) as total_questions,
             COUNT(DISTINCT CASE WHEN q.difficulty = 'easy' THEN q.id END) as easy_count,
             COUNT(DISTINCT CASE WHEN q.difficulty = 'medium' THEN q.id END) as medium_count,
             COUNT(DISTINCT CASE WHEN q.difficulty = 'hard' THEN q.id END) as hard_count,
             COUNT(DISTINCT ua.question_id) as attempted_questions,
             COUNT(DISTINCT CASE WHEN ua.is_correct = 1 THEN ua.question_id END) as correct_questions
      FROM topics t
      LEFT JOIN questions q ON q.topic_id = t.id
      JOIN sections s ON t.section_id = s.id
      LEFT JOIN user_attempts ua ON ua.question_id = q.id AND ua.user_id = ?
      WHERE LOWER(s.name) = LOWER(?)
      GROUP BY t.id, t.name, t.description
      ORDER BY t.id ASC
    `, [userId, sectionName]);

    res.json({
      success: true,
      topics: rows.map(r => ({
        id: r.id,
        name: r.name,
        description: r.description,
        totalQuestions: r.total_questions,
        easyCount: r.easy_count,
        mediumCount: r.medium_count,
        hardCount: r.hard_count,
        attemptedCount: r.attempted_questions,
        correctCount: r.correct_questions
      }))
    });
  } catch (error) {
    console.error('Get topics error:', error);
    res.status(500).json({ success: false, message: 'Error fetching topics' });
  }
};

// GET /api/data/questions - Get questions by topic/section with filters
const getQuestions = async (req, res) => {
  try {
    const userId = req.user.id;
    const { 
      section, 
      topic, 
      topicId, 
      difficulty, 
      search, 
      status, 
      sort = 'newest', 
      page = 1, 
      limit = 20 
    } = req.query;

    const sectionName = section ? mapSectionKeyToName(section) : null;

    const queryParams = [userId, userId];
    let whereClause = ' WHERE 1=1';

    if (sectionName) {
      whereClause += ' AND LOWER(s.name) = LOWER(?)';
      queryParams.push(sectionName);
    }

    if (topic) {
      whereClause += ' AND LOWER(t.name) = LOWER(?)';
      queryParams.push(topic);
    }

    if (topicId) {
      whereClause += ' AND t.id = ?';
      queryParams.push(topicId);
    }

    if (difficulty && difficulty !== 'all' && difficulty !== 'All') {
      whereClause += ' AND LOWER(q.difficulty) = LOWER(?)';
      queryParams.push(difficulty);
    }

    if (search) {
      whereClause += ' AND q.question LIKE ?';
      queryParams.push(`%${search}%`);
    }

    // Status filter
    if (status && status !== 'all' && status !== 'All') {
      const statusLower = status.toLowerCase();
      if (statusLower === 'unattempted' || statusLower === 'new') {
        whereClause += ' AND NOT EXISTS(SELECT 1 FROM user_attempts ua WHERE ua.question_id = q.id AND ua.user_id = ?)';
        queryParams.push(userId);
      } else if (statusLower === 'attempted') {
        whereClause += ' AND EXISTS(SELECT 1 FROM user_attempts ua WHERE ua.question_id = q.id AND ua.user_id = ?)';
        queryParams.push(userId);
      } else if (statusLower === 'wrong' || statusLower === 'incorrect') {
        whereClause += `
          AND (
            SELECT ua.is_correct 
            FROM user_attempts ua 
            WHERE ua.question_id = q.id AND ua.user_id = ? 
            ORDER BY ua.attempted_at DESC LIMIT 1
          ) = 0
        `;
        queryParams.push(userId);
      } else if (statusLower === 'bookmarked') {
        whereClause += ' AND EXISTS(SELECT 1 FROM bookmarks b WHERE b.question_id = q.id AND b.user_id = ?)';
        queryParams.push(userId);
      }
    }

    // Count query for pagination
    const countQuery = `
      SELECT COUNT(DISTINCT q.id) as total
      FROM questions q
      JOIN topics t ON q.topic_id = t.id
      JOIN sections s ON q.section_id = s.id
      ${whereClause}
    `;
    
    // We need to slice the queryParams for the count query (it only has the parameters for whereClause + userId prefixes)
    // Wait, queryParams starts with [userId, userId] (for the SELECT select-list) which are NOT used in the count query.
    // So count parameters are queryParams without the first 2 elements.
    const countParams = queryParams.slice(2);
    const [[{ total }]] = await pool.execute(countQuery, countParams);

    // Sorting
    let orderBy = ' ORDER BY q.id DESC';
    if (sort === 'hardest') {
      orderBy = " ORDER BY CASE q.difficulty WHEN 'hard' THEN 1 WHEN 'medium' THEN 2 WHEN 'easy' THEN 3 END ASC, q.id DESC";
    } else if (sort === 'most_attempted') {
      orderBy = ' ORDER BY attempt_count DESC, q.id DESC';
    } else if (sort === 'accuracy_asc') {
      orderBy = ' ORDER BY (correct_count / NULLIF(attempt_count, 0)) ASC, q.id DESC';
    }

    // Limit & Offset
    const limitVal = parseInt(limit);
    const offsetVal = (parseInt(page) - 1) * limitVal;
    
    const selectQuery = `
      SELECT q.id, q.question, q.difficulty, q.correct_answer, q.explanation, q.solution,
             t.name as topic_name, s.name as section_name,
             (SELECT COUNT(*) FROM user_attempts ua WHERE ua.question_id = q.id) as attempt_count,
             (SELECT COUNT(*) FROM user_attempts ua WHERE ua.question_id = q.id AND ua.is_correct = 1) as correct_count,
             EXISTS(SELECT 1 FROM bookmarks b WHERE b.question_id = q.id AND b.user_id = ?) as is_bookmarked,
             (SELECT ua.is_correct FROM user_attempts ua WHERE ua.question_id = q.id AND ua.user_id = ? ORDER BY ua.attempted_at DESC LIMIT 1) as user_last_answer
      FROM questions q
      JOIN topics t ON q.topic_id = t.id
      JOIN sections s ON q.section_id = s.id
      ${whereClause}
      ${orderBy}
      LIMIT ${limitVal} OFFSET ${offsetVal}
    `;

    const [questions] = await pool.execute(selectQuery, queryParams);

    // Get options for each question
    for (let q of questions) {
      const [options] = await pool.execute(`
        SELECT option_label as option_label, option_text as option_text
        FROM question_options
        WHERE question_id = ?
        ORDER BY option_label
      `, [q.id]);

      q.questionText = q.question;
      q.correctAnswer = q.correct_answer;
      q.options = options;
      q.isBookmarked = !!q.is_bookmarked;
      q.userLastAnswer = q.user_last_answer;
    }

    // Get all unique topic names in this section
    const [uniqueTopics] = await pool.execute(`
      SELECT DISTINCT t.name 
      FROM topics t 
      JOIN sections s ON t.section_id = s.id 
      WHERE LOWER(s.name) = LOWER(?)
      ORDER BY t.name
    `, [sectionName || 'quantitative']);

    res.json({
      success: true,
      questions,
      topics: uniqueTopics.map(t => t.name),
      pagination: {
        page: parseInt(page),
        limit: parseInt(limit),
        total,
        pages: Math.ceil(total / limitVal)
      }
    });
  } catch (error) {
    console.error('Get questions error:', error);
    res.status(500).json({ success: false, message: 'Error fetching questions' });
  }
};

// GET /api/data/:id - Get question by ID
const getQuestionById = async (req, res) => {
  try {
    const { id } = req.params;
    const userId = req.user.id;

    const [rows] = await pool.execute(`
      SELECT q.id, q.question, q.difficulty, q.correct_answer, q.explanation, q.solution,
             t.name as topic_name, s.name as section_name,
             EXISTS(SELECT 1 FROM bookmarks b WHERE b.question_id = q.id AND b.user_id = ?) as isBookmarked
      FROM questions q
      JOIN topics t ON q.topic_id = t.id
      JOIN sections s ON q.section_id = s.id
      WHERE q.id = ?
    `, [userId, id]);

    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Question not found' });
    }

    const question = rows[0];

    // Fetch options
    const [options] = await pool.execute(`
      SELECT option_label, option_text FROM question_options WHERE question_id = ? ORDER BY option_label
    `, [id]);

    // Fetch user attempt
    const [attempts] = await pool.execute(`
      SELECT selected_answer, is_correct, time_taken 
      FROM user_attempts 
      WHERE user_id = ? AND question_id = ? 
      ORDER BY attempted_at DESC LIMIT 1
    `, [userId, id]);

    const formattedQuestion = {
      id: question.id,
      question: question.question,
      questionText: question.question,
      difficulty: question.difficulty,
      correct_answer: question.correct_answer,
      correctAnswer: question.correct_answer,
      solution: question.solution,
      explanation: question.explanation,
      topic_name: question.topic_name,
      section_name: question.section_name,
      options: options.map(o => ({
        option_label: o.option_label,
        option_text: o.option_text
      }))
    };

    res.json({
      success: true,
      question: formattedQuestion,
      isBookmarked: !!question.isBookmarked,
      userAttempt: attempts.length > 0 ? {
        selected_answer: attempts[0].selected_answer,
        isCorrect: !!attempts[0].is_correct,
        timeTaken: attempts[0].time_taken
      } : null
    });
  } catch (error) {
    console.error('Get question error:', error);
    res.status(500).json({ success: false, message: 'Error fetching question' });
  }
};

// POST /api/data/:id/attempt - Submit practice answer
const submitAnswer = async (req, res) => {
  try {
    const { id } = req.params;
    const { selectedAnswer, timeTaken } = req.body;
    const userId = req.user.id;

    const [rows] = await pool.execute('SELECT correct_answer, solution, explanation FROM questions WHERE id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Question not found' });
    }

    const question = rows[0];
    const isCorrect = question.correct_answer === selectedAnswer.toUpperCase();

    // Insert attempt
    await pool.execute(`
      INSERT INTO user_attempts (user_id, question_id, selected_answer, is_correct, time_taken)
      VALUES (?, ?, ?, ?, ?)
    `, [userId, id, selectedAnswer.toUpperCase(), isCorrect, timeTaken || 0]);

    // Log daily activity
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, 1)
      ON DUPLICATE KEY UPDATE questions_done = questions_done + 1
    `, [userId, getTodayIST()]);


    // Update user points
    if (isCorrect) {
      await pool.execute('UPDATE users SET total_points = total_points + 10 WHERE id = ?', [userId]);
    }

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
      isCorrect,
      correctAnswer: question.correct_answer,
      solution: question.solution,
      explanation: question.explanation,
      newBadges
    });
  } catch (error) {
    console.error('Submit answer error:', error);
    res.status(500).json({ success: false, message: 'Error submitting answer' });
  }
};

module.exports = { getTopics, getQuestions, getQuestionById, submitAnswer };
