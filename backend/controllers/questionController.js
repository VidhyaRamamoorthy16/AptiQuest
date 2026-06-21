const { buildQuestionQuery } = require('../utils/queryBuilder');
const pool = require('../config/database');
const { getTodayIST } = require('./streakController');

const fs = require('fs');
const xlsx = require('xlsx');

// Get questions with filters
const getQuestions = async (req, res) => {
  try {
    const { section, topic, difficulty, page, limit } = req.query;

    // If no pagination/filtering parameters are provided (e.g. from QuestionManager)
    if (!page && !limit && !section && !topic && !difficulty) {
      const [questions] = await pool.execute(`
        SELECT q.id, q.question as questionText, q.difficulty, q.correct_answer as correctAnswer, q.explanation, t.name as topic
        FROM questions q
        LEFT JOIN topics t ON q.topic_id = t.id
        ORDER BY q.id DESC
      `);

      for (let question of questions) {
        const [options] = await pool.execute(`
          SELECT option_label as optionLetter, option_text as optionText 
          FROM question_options 
          WHERE question_id = ? 
          ORDER BY option_label
        `, [question.id]);
        question.options = options;
      }
      return res.json(questions);
    }

    // Get questions with filters (paginated)
    const { query, params } = buildQuestionQuery({ section, topic, difficulty, page: page || 1, limit: limit || 10 });
    const [questions] = await pool.execute(query, params);

    // Get total count
    const { query: countQuery, params: countParams } = buildQuestionQuery({ section, topic, difficulty }, true);
    const [countResult] = await pool.execute(countQuery, countParams);
    const total = countResult[0].total;

    // Get options for each question
    for (let question of questions) {
      const [options] = await pool.execute(
        'SELECT option_label as optionLetter, option_text as optionText FROM question_options WHERE question_id = ? ORDER BY option_label',
        [question.id]
      );
      // Map properties for frontend compatibility
      question.questionText = question.question;
      question.correctAnswer = question.correct_answer;
      question.options = options;
    }

    res.json({
      success: true,
      questions,
      pagination: {
        page: parseInt(page || 1),
        limit: parseInt(limit || 10),
        total,
        pages: Math.ceil(total / (limit || 10))
      }
    });
  } catch (error) {
    console.error('Get questions error:', error);
    res.status(500).json({
      success: false,
      message: 'Error fetching questions',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

// Get single question by ID
const getQuestionById = async (req, res) => {
  try {
    const { id } = req.params;

    const [questions] = await pool.execute(
      `SELECT q.*, s.name as section_name, t.name as topic_name
       FROM questions q
       JOIN sections s ON q.section_id = s.id
       JOIN topics t ON q.topic_id = t.id
       WHERE q.id = ?`,
      [id]
    );

    if (questions.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Question not found'
      });
    }

    const question = questions[0];

    // Get options
    const [options] = await pool.execute(
      'SELECT option_label as optionLetter, option_text as optionText FROM question_options WHERE question_id = ? ORDER BY option_label',
      [id]
    );

    question.questionText = question.question;
    question.correctAnswer = question.correct_answer;
    question.options = options;

    res.json({
      success: true,
      question
    });
  } catch (error) {
    console.error('Get question error:', error);
    res.status(500).json({
      success: false,
      message: 'Error fetching question',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

// Submit answer for a question
const submitAnswer = async (req, res) => {
  try {
    const { id } = req.params;
    const { selectedAnswer, timeTaken } = req.body;
    const userId = req.user.id;

    if (!selectedAnswer) {
      return res.status(400).json({
        success: false,
        message: 'Please provide selected answer'
      });
    }

    // Get question
    const [questions] = await pool.execute(
      'SELECT correct_answer FROM questions WHERE id = ?',
      [id]
    );

    if (questions.length === 0) {
      return res.status(404).json({
        success: false,
        message: 'Question not found'
      });
    }

    const question = questions[0];
    const isCorrect = question.correct_answer === selectedAnswer.toUpperCase();

    // Save attempt
    await pool.execute(
      'INSERT INTO user_attempts (user_id, question_id, selected_answer, is_correct, time_taken) VALUES (?, ?, ?, ?, ?)',
      [userId, id, selectedAnswer.toUpperCase(), isCorrect, timeTaken || 0]
    );

    // Log daily activity
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, 1)
      ON DUPLICATE KEY UPDATE questions_done = questions_done + 1
    `, [userId, getTodayIST()]);


    // Update user points: e.g. +10 for correct, 0 for wrong
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

    // Get solution and explanation
    const [questionDetails] = await pool.execute(
      'SELECT solution, explanation FROM questions WHERE id = ?',
      [id]
    );

    res.json({
      success: true,
      isCorrect,
      correctAnswer: question.correct_answer,
      solution: questionDetails[0].solution,
      explanation: questionDetails[0].explanation,
      newBadges
    });
  } catch (error) {
    console.error('Submit answer error:', error);
    res.status(500).json({
      success: false,
      message: 'Error submitting answer',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

// Get topics for a section
const getTopics = async (req, res) => {
  try {
    const { section } = req.query;

    let sectionName = section;
    if (section && section.toLowerCase() === 'di') {
      sectionName = 'data interpretation';
    }

    let query = `
      SELECT DISTINCT t.id, t.name, COUNT(q.id) as question_count
      FROM topics t
      JOIN questions q ON q.topic_id = t.id
      JOIN sections s ON q.section_id = s.id
      WHERE 1=1
    `;
    const params = [];

    if (sectionName) {
      query += ' AND s.name = ?';
      params.push(sectionName);
    }

    query += ' GROUP BY t.id, t.name ORDER BY t.name';

    const [topics] = await pool.execute(query, params);

    res.json({
      success: true,
      topics
    });
  } catch (error) {
    console.error('Get topics error:', error);
    res.status(500).json({
      success: false,
      message: 'Error fetching topics',
      error: process.env.NODE_ENV === 'development' ? error.message : undefined
    });
  }
};

// POST /api/questions - Create a question (Admin)
const createQuestion = async (req, res) => {
  try {
    const { questionText, topic, difficulty, optionA, optionB, optionC, optionD, correctAnswer, explanation } = req.body;
    const userId = req.user.id;

    // Find topic
    let [topicRows] = await pool.execute('SELECT id, section_id FROM topics WHERE name = ?', [topic]);
    let topicId;
    let sectionId = 1; // default to quant

    if (topicRows.length === 0) {
      // Auto-create topic under Section 1
      const [insertTopic] = await pool.execute('INSERT INTO topics (section_id, name, description) VALUES (?, ?, ?)', [1, topic, `${topic} practice`]);
      topicId = insertTopic.insertId;
    } else {
      topicId = topicRows[0].id;
      sectionId = topicRows[0].section_id;
    }

    // Insert question
    const [questionInsert] = await pool.execute(`
      INSERT INTO questions (section_id, topic_id, question, difficulty, correct_answer, solution, explanation, created_by)
      VALUES (?, ?, ?, ?, ?, ?, ?, ?)
    `, [sectionId, topicId, questionText, difficulty, correctAnswer, explanation || '', explanation || '', userId]);

    const questionId = questionInsert.insertId;

    // Insert options
    const options = [
      { label: 'A', text: optionA },
      { label: 'B', text: optionB },
      { label: 'C', text: optionC },
      { label: 'D', text: optionD }
    ];

    for (const opt of options) {
      await pool.execute(`
        INSERT INTO question_options (question_id, option_label, option_text)
        VALUES (?, ?, ?)
      `, [questionId, opt.label, opt.text]);
    }

    res.json({ success: true, message: 'Question created successfully', questionId });
  } catch (error) {
    console.error('Create question error:', error);
    res.status(500).json({ success: false, message: 'Error creating question' });
  }
};

// PUT /api/questions/:id - Update a question (Admin)
const updateQuestion = async (req, res) => {
  try {
    const { id } = req.params;
    const { questionText, topic, difficulty, optionA, optionB, optionC, optionD, correctAnswer, explanation } = req.body;

    // Find topic
    let [topicRows] = await pool.execute('SELECT id, section_id FROM topics WHERE name = ?', [topic]);
    let topicId;
    let sectionId = 1;

    if (topicRows.length === 0) {
      const [insertTopic] = await pool.execute('INSERT INTO topics (section_id, name, description) VALUES (?, ?, ?)', [1, topic, `${topic} practice`]);
      topicId = insertTopic.insertId;
    } else {
      topicId = topicRows[0].id;
      sectionId = topicRows[0].section_id;
    }

    // Update question
    const [result] = await pool.execute(`
      UPDATE questions 
      SET section_id = ?, topic_id = ?, question = ?, difficulty = ?, correct_answer = ?, solution = ?, explanation = ?
      WHERE id = ?
    `, [sectionId, topicId, questionText, difficulty, correctAnswer, explanation || '', explanation || '', id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ success: false, message: 'Question not found' });
    }

    // Update options
    const options = [
      { label: 'A', text: optionA },
      { label: 'B', text: optionB },
      { label: 'C', text: optionC },
      { label: 'D', text: optionD }
    ];

    for (const opt of options) {
      await pool.execute(`
        INSERT INTO question_options (question_id, option_label, option_text)
        VALUES (?, ?, ?)
        ON DUPLICATE KEY UPDATE option_text = VALUES(option_text)
      `, [id, opt.label, opt.text]);
    }

    res.json({ success: true, message: 'Question updated successfully' });
  } catch (error) {
    console.error('Update question error:', error);
    res.status(500).json({ success: false, message: 'Error updating question' });
  }
};

// DELETE /api/questions/:id - Delete a question (Admin)
const deleteQuestion = async (req, res) => {
  try {
    const { id } = req.params;

    const [result] = await pool.execute('DELETE FROM questions WHERE id = ?', [id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ success: false, message: 'Question not found' });
    }

    res.json({ success: true, message: 'Question deleted successfully' });
  } catch (error) {
    console.error('Delete question error:', error);
    res.status(500).json({ success: false, message: 'Error deleting question' });
  }
};

// POST /api/questions/bulk-upload - Bulk upload questions (Admin)
const bulkUpload = async (req, res) => {
  try {
    if (!req.file) {
      return res.status(400).json({ success: false, message: 'No file uploaded' });
    }

    const filePath = req.file.path;
    const workbook = xlsx.readFile(filePath);
    const sheetName = workbook.SheetNames[0];
    const sheet = workbook.Sheets[sheetName];
    const rawData = xlsx.utils.sheet_to_json(sheet);

    // Delete temp file
    fs.unlinkSync(filePath);

    let total = rawData.length;
    let successful = 0;
    let updated = 0;
    let failed = 0;
    const errors = [];

    const userId = req.user.id;

    for (let index = 0; index < rawData.length; index++) {
      const row = rawData[index];
      const { questionText, topic, difficulty, optionA, optionB, optionC, optionD, correctAnswer, explanation } = row;

      if (!questionText || !topic || !optionA || !optionB || !optionC || !optionD || !correctAnswer) {
        failed++;
        errors.push(`Row ${index + 2}: Missing required fields`);
        continue;
      }

      try {
        // Find or create topic
        let [topicRows] = await pool.execute('SELECT id, section_id FROM topics WHERE name = ?', [topic]);
        let topicId;
        let sectionId = 1;

        if (topicRows.length === 0) {
          const [insertTopic] = await pool.execute('INSERT INTO topics (section_id, name, description) VALUES (?, ?, ?)', [1, topic, `${topic} practice`]);
          topicId = insertTopic.insertId;
        } else {
          topicId = topicRows[0].id;
          sectionId = topicRows[0].section_id;
        }

        // Insert question
        const [questionInsert] = await pool.execute(`
          INSERT INTO questions (section_id, topic_id, question, difficulty, correct_answer, solution, explanation, created_by)
          VALUES (?, ?, ?, ?, ?, ?, ?, ?)
        `, [
          sectionId, 
          topicId, 
          questionText, 
          (difficulty || 'medium').toLowerCase(), 
          correctAnswer.toUpperCase(), 
          explanation || '', 
          explanation || '', 
          userId
        ]);

        const questionId = questionInsert.insertId;

        // Insert options
        const options = [
          { label: 'A', text: optionA },
          { label: 'B', text: optionB },
          { label: 'C', text: optionC },
          { label: 'D', text: optionD }
        ];

        for (const opt of options) {
          await pool.execute(`
            INSERT INTO question_options (question_id, option_label, option_text)
            VALUES (?, ?, ?)
          `, [questionId, opt.label, opt.text]);
        }

        successful++;
      } catch (err) {
        failed++;
        errors.push(`Row ${index + 2}: Database error (${err.message})`);
      }
    }

    res.json({
      success: true,
      message: `Successfully processed file. Added ${successful} questions, ${failed} failed.`,
      stats: {
        total,
        successful,
        updated,
        failed
      },
      errors
    });
  } catch (error) {
    console.error('Bulk upload error:', error);
    res.status(500).json({ success: false, message: 'Error processing bulk upload file' });
  }
};

module.exports = { 
  getQuestions, 
  getQuestionById, 
  submitAnswer, 
  getTopics,
  createQuestion,
  updateQuestion,
  deleteQuestion,
  bulkUpload
};
