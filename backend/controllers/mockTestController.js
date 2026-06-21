const pool = require('../config/database');
const { getTodayIST } = require('./streakController');


// GET /api/mock-tests - List mock test presets
const getMockTestPresets = async (req, res) => {
  try {
    const [rows] = await pool.execute(`
      SELECT id, name, description, duration / 60 as duration, total_questions, test_type, sections_config
      FROM tests
      WHERE test_type IN ('mock', 'speed', 'accuracy') AND is_active = 1
      ORDER BY id ASC
    `);
    res.json(rows);
  } catch (error) {
    console.error('Get mock presets error:', error);
    res.status(500).json({ success: false, message: 'Error fetching mock test presets' });
  }
};

// POST /api/mock-tests/generate - Auto-generate a custom mock test
const generateMockTest = async (req, res) => {
  try {
    const userId = req.user.id;
    const { sections = { quantitative: 25, logical: 20, di: 15 }, duration = 60 } = req.body;

    const quantCount = parseInt(sections.quantitative || 25);
    const logicalCount = parseInt(sections.logical || 20);
    const diCount = parseInt(sections.di || 15);
    const totalQuestions = quantCount + logicalCount + diCount;

    // 1. Find question IDs from user's last 3 mock test attempts to exclude
    const [recentAttempts] = await pool.execute(`
      SELECT id FROM test_attempts 
      WHERE user_id = ?
      ORDER BY submitted_at DESC 
      LIMIT 3
    `, [userId]);

    const excludeIds = [];
    if (recentAttempts.length > 0) {
      const attemptIds = recentAttempts.map(a => a.id).join(',');
      const [attemptedQuestions] = await pool.execute(`
        SELECT DISTINCT question_id FROM test_attempt_answers 
        WHERE attempt_id IN (${attemptIds})
      `);
      attemptedQuestions.forEach(q => excludeIds.push(q.question_id));
    }

    const excludeClause = excludeIds.length > 0 ? `AND id NOT IN (${excludeIds.join(',')})` : '';

    // 2. Query helper to fetch balanced questions per section
    const getSectionQuestions = async (sectionName, totalRequired) => {
      // Find section ID
      const [secRows] = await pool.execute('SELECT id FROM sections WHERE LOWER(name) = LOWER(?)', [sectionName]);
      if (secRows.length === 0) return [];
      const sectionId = secRows[0].id;

      // Balanced difficulty: 30% Easy, 50% Medium, 20% Hard
      const easyLimit = Math.round(totalRequired * 0.3);
      const hardLimit = Math.round(totalRequired * 0.2);
      const mediumLimit = totalRequired - easyLimit - hardLimit;

      const limits = { easy: easyLimit, medium: mediumLimit, hard: hardLimit };
      const selected = [];

      for (const difficulty of ['easy', 'medium', 'hard']) {
        const limit = limits[difficulty];
        if (limit <= 0) continue;

        const [rows] = await pool.execute(`
          SELECT id FROM questions 
          WHERE section_id = ? AND LOWER(difficulty) = ? ${excludeClause}
          ORDER BY RAND() 
          LIMIT ?
        `, [sectionId, difficulty, limit]);

        rows.forEach(r => selected.push(r.id));
      }

      // If we don't have enough, pad with any random questions from that section
      if (selected.length < totalRequired) {
        const padCount = totalRequired - selected.length;
        const avoidClause = selected.length > 0 
          ? `AND id NOT IN (${selected.join(',')}) ${excludeIds.length > 0 ? 'AND id NOT IN (' + excludeIds.join(',') + ')' : ''}`
          : excludeClause;

        const [padRows] = await pool.execute(`
          SELECT id FROM questions 
          WHERE section_id = ? ${avoidClause}
          ORDER BY RAND() 
          LIMIT ?
        `, [sectionId, padCount]);

        padRows.forEach(r => selected.push(r.id));
      }

      return selected;
    };

    const quantIds = await getSectionQuestions('quantitative', quantCount);
    const logicalIds = await getSectionQuestions('logical', logicalCount);
    const diIds = await getSectionQuestions('data interpretation', diCount);

    const allQuestionIds = [...quantIds, ...logicalIds, ...diIds];

    if (allQuestionIds.length === 0) {
      return res.status(400).json({ success: false, message: 'Not enough questions available to generate mock test' });
    }

    // 3. Create new custom test entry
    const testName = `Custom Mock Test - ${new Date().toLocaleDateString()}`;
    const [testInsert] = await pool.execute(`
      INSERT INTO tests (name, description, duration, total_questions, type, test_type, sections_config, created_by, is_active)
      VALUES (?, 'Auto-generated custom placement test simulation.', ?, ?, 'full-length', 'mock', ?, ?, 1)
    `, [testName, duration * 60, allQuestionIds.length, JSON.stringify(sections), userId]);

    const testId = testInsert.insertId;

    // 4. Create question mapping
    for (let order = 0; order < allQuestionIds.length; order++) {
      await pool.execute(`
        INSERT INTO test_questions (test_id, question_id, question_order)
        VALUES (?, ?, ?)
      `, [testId, allQuestionIds[order], order + 1]);
    }

    // 5. Fetch full generated test questions
    const [questionRows] = await pool.execute(`
      SELECT q.id, q.question as questionText, q.difficulty, q.correct_answer as correctAnswer, q.explanation, s.name as sectionName
      FROM questions q
      JOIN test_questions tq ON q.id = tq.question_id
      JOIN sections s ON q.section_id = s.id
      WHERE tq.test_id = ?
      ORDER BY tq.question_order
    `, [testId]);

    // Options
    for (let q of questionRows) {
      const [optionRows] = await pool.execute(`
        SELECT option_label as optionLetter, option_text as optionText
        FROM question_options
        WHERE question_id = ?
        ORDER BY option_label
      `, [q.id]);
      q.options = optionRows;
    }

    res.json({
      success: true,
      testId,
      name: testName,
      duration,
      totalQuestions: allQuestionIds.length,
      questions: questionRows
    });
  } catch (error) {
    console.error('Generate mock test error:', error);
    res.status(500).json({ success: false, message: 'Error generating mock test' });
  }
};

// GET /api/mock-tests/:id - Get mock test with questions
const getMockTestById = async (req, res) => {
  try {
    const { id } = req.params;

    const [testRows] = await pool.execute(`
      SELECT id, name, description, duration / 60 as duration, total_questions, test_type, sections_config
      FROM tests
      WHERE id = ?
    `, [id]);

    if (testRows.length === 0) {
      return res.status(404).json({ success: false, message: 'Mock test not found' });
    }

    const test = testRows[0];

    const [questionRows] = await pool.execute(`
      SELECT q.id, q.question as questionText, q.difficulty, q.correct_answer as correctAnswer, q.explanation, s.name as sectionName
      FROM questions q
      JOIN test_questions tq ON q.id = tq.question_id
      JOIN sections s ON q.section_id = s.id
      WHERE tq.test_id = ?
      ORDER BY tq.question_order
    `, [id]);

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
    console.error('Get mock test by ID error:', error);
    res.status(500).json({ success: false, message: 'Error fetching mock test details' });
  }
};

// POST /api/mock-tests/:id/submit - Submit mock test
const submitMockTest = async (req, res) => {
  try {
    const { id } = req.params;
    const { answers, timeTaken = 0 } = req.body;
    const userId = req.user.id;

    // Get test details
    const [testRows] = await pool.execute('SELECT * FROM tests WHERE id = ?', [id]);
    if (testRows.length === 0) {
      return res.status(404).json({ success: false, message: 'Mock test not found' });
    }
    const test = testRows[0];

    // Get test questions with sections
    const [questionRows] = await pool.execute(`
      SELECT q.id, q.question as questionText, q.correct_answer as correctAnswer, q.explanation, s.name as sectionName, t.name as topicName
      FROM questions q
      JOIN test_questions tq ON q.id = tq.question_id
      JOIN sections s ON q.section_id = s.id
      JOIN topics t ON q.topic_id = t.id
      WHERE tq.test_id = ?
      ORDER BY tq.question_order
    `, [id]);

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
    
    // Section-wise aggregations
    const sectionBreakdown = {
      quantitative: { correct: 0, total: 0, timeTaken: 0 },
      logical: { correct: 0, total: 0, timeTaken: 0 },
      di: { correct: 0, total: 0, timeTaken: 0 }
    };

    // Topic-wise accuracy to find weak areas
    const topicAggregates = {};

    const submittedAnswers = [];

    for (let index = 0; index < questionRows.length; index++) {
      const question = questionRows[index];
      const selectedOption = answers[index];

      const hasSelected = selectedOption !== undefined && selectedOption !== null && selectedOption !== '';
      const isCorrect = hasSelected && selectedOption.toUpperCase() === question.correctAnswer.toUpperCase();

      // Normalize section key
      let secKey = question.sectionName.toLowerCase();
      if (secKey === 'data interpretation') secKey = 'di';

      if (!sectionBreakdown[secKey]) {
        sectionBreakdown[secKey] = { correct: 0, total: 0, timeTaken: 0 };
      }
      sectionBreakdown[secKey].total += 1;

      if (!topicAggregates[question.topicName]) {
        topicAggregates[question.topicName] = { correct: 0, total: 0 };
      }
      topicAggregates[question.topicName].total += 1;

      if (!hasSelected) {
        skipped++;
      } else if (isCorrect) {
        correct++;
        sectionBreakdown[secKey].correct += 1;
        topicAggregates[question.topicName].correct += 1;
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
    const score = correct * 10;

    // Save mock test attempt
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
    await pool.execute('UPDATE users SET total_points = total_points + ? WHERE id = ?', [score, userId]);

    // Log daily activity
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, ?)
      ON DUPLICATE KEY UPDATE questions_done = questions_done + VALUES(questions_done)
    `, [userId, getTodayIST(), totalQuestions]);


    // Dynamic percentile estimation: Math.round((score / totalQuestions) * 100 * 0.85)
    const percentile = Math.min(Math.round((correct / totalQuestions) * 100 * 0.85 + 10), 100);

    // Section stats calculation
    // Approximate division of total time taken
    const activeSections = Object.keys(sectionBreakdown).filter(k => sectionBreakdown[k].total > 0);
    const avgSectionTime = Math.round(timeTaken / (activeSections.length || 1));
    
    const formattedBreakdown = {};
    for (const key of activeSections) {
      const data = sectionBreakdown[key];
      formattedBreakdown[key] = {
        correct: data.correct,
        total: data.total,
        accuracy: data.total > 0 ? (data.correct / data.total) * 100 : 0,
        timeTaken: avgSectionTime
      };
    }

    // Find weak areas (accuracy < 60%)
    const weakTopics = Object.keys(topicAggregates)
      .filter(t => (topicAggregates[t].correct / topicAggregates[t].total) < 0.6)
      .slice(0, 3); // top 3 weak areas

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
      percentile,
      sectionBreakdown: formattedBreakdown,
      weakTopics,
      answers: submittedAnswers,
      newBadges
    });
  } catch (error) {
    console.error('Submit mock test error:', error);
    res.status(500).json({ success: false, message: 'Error submitting mock test answers' });
  }
};

// GET /api/mock-tests/history - User's mock test attempts history
const getMockTestHistory = async (req, res) => {
  try {
    const userId = req.user.id;
    const [rows] = await pool.execute(`
      SELECT ta.id, t.name as testName, ta.score, ta.total_questions as totalQuestions, 
             ta.accuracy, ta.time_taken as timeTaken, ta.submitted_at as date
      FROM test_attempts ta
      JOIN tests t ON ta.test_id = t.id
      WHERE ta.user_id = ? AND t.test_type = 'mock' AND ta.submitted_at IS NOT NULL
      ORDER BY ta.submitted_at DESC
    `, [userId]);

    res.json(rows);
  } catch (error) {
    console.error('Get mock history error:', error);
    res.status(500).json({ success: false, message: 'Error fetching mock test history' });
  }
};

// GET /api/mock-tests/result/:attemptId - Get mock test result by attempt ID
const getMockTestResult = async (req, res) => {
  try {
    const { attemptId } = req.params;
    const userId = req.user.id;

    // 1. Fetch attempt details
    const [attempts] = await pool.execute(`
      SELECT ta.id, ta.test_id as testId, ta.score, ta.total_questions as totalQuestions, 
             ta.accuracy, ta.time_taken as timeTaken, ta.submitted_at as date,
             t.name as testName, t.sections_config
      FROM test_attempts ta
      JOIN tests t ON ta.test_id = t.id
      WHERE ta.id = ? AND ta.user_id = ?
    `, [attemptId, userId]);

    if (attempts.length === 0) {
      return res.status(404).json({ success: false, message: 'Mock test result not found' });
    }

    const attempt = attempts[0];

    // 2. Fetch answers
    const [answerRows] = await pool.execute(`
      SELECT taa.question_id as questionId, taa.selected_answer as selectedOption, taa.is_correct as isCorrect,
             q.question as questionText, q.correct_answer as correctOption, q.explanation,
             s.name as sectionName, tp.name as topicName
      FROM test_attempt_answers taa
      JOIN questions q ON taa.question_id = q.id
      JOIN sections s ON q.section_id = s.id
      JOIN topics tp ON q.topic_id = tp.id
      WHERE taa.attempt_id = ?
    `, [attemptId]);

    // Options
    for (let ans of answerRows) {
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

    // 3. Compute stats
    let correct = 0;
    let wrong = 0;
    let skipped = 0;
    
    const sectionBreakdown = {
      quantitative: { correct: 0, total: 0, timeTaken: 0 },
      logical: { correct: 0, total: 0, timeTaken: 0 },
      di: { correct: 0, total: 0, timeTaken: 0 }
    };

    const topicAggregates = {};

    for (const ans of answerRows) {
      const hasSelected = ans.selectedOption !== null && ans.selectedOption !== '';
      const isCorrect = ans.isCorrect === 1 || ans.isCorrect === true;

      let secKey = ans.sectionName.toLowerCase();
      if (secKey === 'data interpretation') secKey = 'di';

      if (!sectionBreakdown[secKey]) {
        sectionBreakdown[secKey] = { correct: 0, total: 0, timeTaken: 0 };
      }
      sectionBreakdown[secKey].total += 1;

      if (!topicAggregates[ans.topicName]) {
        topicAggregates[ans.topicName] = { correct: 0, total: 0 };
      }
      topicAggregates[ans.topicName].total += 1;

      if (!hasSelected) {
        skipped++;
      } else if (isCorrect) {
        correct++;
        sectionBreakdown[secKey].correct += 1;
        topicAggregates[ans.topicName].correct += 1;
      } else {
        wrong++;
      }
    }

    const totalQuestions = attempt.totalQuestions;
    const percentile = Math.min(Math.round((correct / (totalQuestions || 1)) * 100 * 0.85 + 10), 100);

    // Section stats time allocation
    const activeSections = Object.keys(sectionBreakdown).filter(k => sectionBreakdown[k].total > 0);
    const avgSectionTime = Math.round(attempt.timeTaken / (activeSections.length || 1));
    
    const formattedBreakdown = {};
    for (const key of activeSections) {
      const data = sectionBreakdown[key];
      formattedBreakdown[key] = {
        correct: data.correct,
        total: data.total,
        accuracy: data.total > 0 ? (data.correct / data.total) * 100 : 0,
        timeTaken: avgSectionTime
      };
    }

    // Find weak areas (accuracy < 60%)
    const weakTopics = Object.keys(topicAggregates)
      .filter(t => (topicAggregates[t].correct / topicAggregates[t].total) < 0.6)
      .slice(0, 3);

    res.json({
      success: true,
      attemptId: attempt.id,
      testName: attempt.testName,
      correct,
      wrong,
      skipped,
      totalQuestions,
      accuracy: parseFloat(attempt.accuracy),
      timeTaken: attempt.timeTaken,
      percentile,
      sectionBreakdown: formattedBreakdown,
      weakTopics,
      answers: answerRows.map(ans => ({
        questionId: ans.questionId,
        selectedOption: ans.selectedOption,
        isCorrect: ans.isCorrect,
        correctOption: ans.correctOption,
        question: ans.question
      })),
      newBadges: [] // No new badges awarded during a reload review
    });
  } catch (error) {
    console.error('Get mock test result error:', error);
    res.status(500).json({ success: false, message: 'Error fetching mock test results' });
  }
};

module.exports = {
  getMockTestPresets,
  generateMockTest,
  getMockTestById,
  submitMockTest,
  getMockTestHistory,
  getMockTestResult
};
