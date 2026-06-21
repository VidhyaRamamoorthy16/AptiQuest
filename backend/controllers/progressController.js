const pool = require('../config/database');
const { getTodayIST } = require('./streakController');


// GET /api/progress/dashboard - Get user progress stats for dashboard
const getDashboardStats = async (req, res) => {
  try {
    const userId = req.user.id;

    // 1. Total Attempted & Correct (combining user_attempts and test_attempt_answers)
    const [practiceStats] = await pool.execute(`
      SELECT COUNT(*) as attempted, SUM(is_correct) as correct
      FROM user_attempts
      WHERE user_id = ?
    `, [userId]);

    const [testStats] = await pool.execute(`
      SELECT COUNT(*) as attempted, SUM(taa.is_correct) as correct
      FROM test_attempt_answers taa
      JOIN test_attempts ta ON taa.attempt_id = ta.id
      WHERE ta.user_id = ?
    `, [userId]);

    const practiceAttempted = parseInt(practiceStats[0].attempted || 0);
    const practiceCorrect = parseInt(practiceStats[0].correct || 0);
    const testAttempted = parseInt(testStats[0].attempted || 0);
    const testCorrect = parseInt(testStats[0].correct || 0);

    const totalAttempted = practiceAttempted + testAttempted;
    const totalCorrect = practiceCorrect + testCorrect;
    const accuracy = totalAttempted > 0 ? (totalCorrect / totalAttempted) * 100 : 0;

    // 2. Section Stats
    const [sectionStatsRows] = await pool.execute(`
      SELECT s.name as section, COUNT(*) as attempted
      FROM (
        SELECT q.section_id FROM user_attempts ua JOIN questions q ON ua.question_id = q.id WHERE ua.user_id = ?
        UNION ALL
        SELECT q.section_id FROM test_attempt_answers taa JOIN test_attempts ta ON taa.attempt_id = ta.id JOIN questions q ON taa.question_id = q.id WHERE ta.user_id = ?
      ) combined
      JOIN sections s ON combined.section_id = s.id
      GROUP BY s.id, s.name
    `, [userId, userId]);

    // 3. Topic-wise Stats (attempted and accuracy per topic)
    const [topicWiseStatsRows] = await pool.execute(`
      SELECT t.name as topic, COUNT(*) as attempted, SUM(combined.is_correct) as correct
      FROM (
        SELECT q.topic_id, ua.is_correct FROM user_attempts ua JOIN questions q ON ua.question_id = q.id WHERE ua.user_id = ?
        UNION ALL
        SELECT q.topic_id, taa.is_correct FROM test_attempt_answers taa JOIN test_attempts ta ON taa.attempt_id = ta.id JOIN questions q ON taa.question_id = q.id WHERE ta.user_id = ?
      ) combined
      JOIN topics t ON combined.topic_id = t.id
      GROUP BY t.id, t.name
    `, [userId, userId]);

    const topicWiseStats = topicWiseStatsRows.map(row => {
      const attempted = parseInt(row.attempted || 0);
      const correct = parseInt(row.correct || 0);
      return {
        topic: row.topic,
        attempted,
        correct,
        accuracy: attempted > 0 ? (correct / attempted) * 100 : 0
      };
    });

    // 4. Daily Activity (Last 7 Days) for Recharts LineChart
    const recentActivity = [];
    const dateOptions = { month: 'short', day: 'numeric' };
    
    for (let i = 6; i >= 0; i--) {
      const d = new Date();
      d.setDate(d.getDate() - i);
      const dateKey = d.toISOString().split('T')[0];
      const displayLabel = d.toLocaleDateString('en-US', dateOptions);

      const [activityCount] = await pool.execute(`
        SELECT
          (SELECT COUNT(*) FROM user_attempts WHERE user_id = ? AND DATE(attempted_at) = ?) +
          (SELECT COUNT(*) FROM test_attempt_answers taa JOIN test_attempts ta ON taa.attempt_id = ta.id WHERE ta.user_id = ? AND DATE(ta.submitted_at) = ?) as attempted,
          (SELECT COUNT(*) FROM user_attempts WHERE user_id = ? AND is_correct = 1 AND DATE(attempted_at) = ?) +
          (SELECT COUNT(*) FROM test_attempt_answers taa JOIN test_attempts ta ON taa.attempt_id = ta.id WHERE ta.user_id = ? AND taa.is_correct = 1 AND DATE(ta.submitted_at) = ?) as correct
      `, [userId, dateKey, userId, dateKey, userId, dateKey, userId, dateKey]);

      recentActivity.push({
        date: displayLabel,
        attempted: parseInt(activityCount[0].attempted || 0),
        correct: parseInt(activityCount[0].correct || 0)
      });
    }

    res.json({
      success: true,
      totalAttempted,
      totalCorrect,
      accuracy,
      sectionStats: sectionStatsRows,
      topicWiseStats,
      recentActivity
    });
  } catch (error) {
    console.error('Get dashboard stats error:', error);
    res.status(500).json({ success: false, message: 'Error fetching dashboard stats' });
  }
};

// GET /api/progress/stats - Legacy/Practice progress stats
const getUserStats = async (req, res) => {
  try {
    const userId = req.user.id;
    const [rows] = await pool.execute(`
      SELECT COUNT(*) as totalSolved, 
             IFNULL(SUM(is_correct), 0) as correctCount
      FROM user_attempts
      WHERE user_id = ?
    `, [userId]);

    const totalSolved = parseInt(rows[0].totalSolved || 0);
    const correctCount = parseInt(rows[0].correctCount || 0);
    const accuracy = totalSolved > 0 ? Math.round((correctCount / totalSolved) * 100) : 0;

    res.json({
      success: true,
      data: {
        totalSolved,
        accuracy,
        avgTime: 30, // Default average time per question in seconds
        streak: 1
      }
    });
  } catch (error) {
    console.error('Get user stats error:', error);
    res.status(500).json({ success: false, message: 'Error fetching user stats' });
  }
};

// GET /api/progress/completed-questions - List of completed question IDs
const getCompletedQuestions = async (req, res) => {
  try {
    const userId = req.user.id;
    const [rows] = await pool.execute(`
      SELECT DISTINCT question_id FROM user_attempts WHERE user_id = ? AND is_correct = 1
    `, [userId]);

    res.json({
      success: true,
      data: {
        completedQuestions: rows.map(r => r.question_id)
      }
    });
  } catch (error) {
    console.error('Get completed questions error:', error);
    res.status(500).json({ success: false, message: 'Error fetching completed questions' });
  }
};

// GET /api/progress/bookmarked-questions - List of bookmarked question IDs
const getBookmarkedQuestions = async (req, res) => {
  try {
    const userId = req.user.id;
    const [rows] = await pool.execute(`
      SELECT question_id FROM bookmarks WHERE user_id = ?
    `, [userId]);

    res.json({
      success: true,
      data: {
        bookmarkedQuestions: rows.map(r => r.question_id)
      }
    });
  } catch (error) {
    console.error('Get bookmarked questions error:', error);
    res.status(500).json({ success: false, message: 'Error fetching bookmarked questions' });
  }
};

// GET /api/progress/recent-activity - Recent activity list
const getRecentActivity = async (req, res) => {
  try {
    const userId = req.user.id;
    const [rows] = await pool.execute(`
      SELECT 'practice' as type, q.question as name, ua.is_correct as correct, ua.attempted_at as date
      FROM user_attempts ua
      JOIN questions q ON ua.question_id = q.id
      WHERE ua.user_id = ?
      ORDER BY ua.attempted_at DESC
      LIMIT 10
    `, [userId]);

    res.json({
      success: true,
      data: rows
    });
  } catch (error) {
    console.error('Get recent activity error:', error);
    res.status(500).json({ success: false, message: 'Error fetching recent activity' });
  }
};

// POST /api/progress/mark-completed - Mark question completed (save practice attempt)
const markQuestionCompleted = async (req, res) => {
  try {
    const userId = req.user.id;
    const { questionId, isCorrect = true, timeTaken = 0 } = req.body;

    await pool.execute(`
      INSERT INTO user_attempts (user_id, question_id, selected_answer, is_correct, time_taken)
      VALUES (?, ?, NULL, ?, ?)
    `, [userId, questionId, isCorrect, timeTaken]);

    // Log daily activity
    await pool.execute(`
      INSERT INTO daily_activity (user_id, activity_date, questions_done)
      VALUES (?, ?, 1)
      ON DUPLICATE KEY UPDATE questions_done = questions_done + 1
    `, [userId, getTodayIST()]);


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
      message: 'Question marked as completed',
      newBadges
    });
  } catch (error) {
    console.error('Mark question completed error:', error);
    res.status(500).json({ success: false, message: 'Error marking question as completed' });
  }
};

// POST /api/progress/toggle-bookmark - Toggle bookmark for a question
const toggleBookmark = async (req, res) => {
  try {
    const userId = req.user.id;
    const { questionId } = req.body;

    const [rows] = await pool.execute(`
      SELECT * FROM bookmarks WHERE user_id = ? AND question_id = ?
    `, [userId, questionId]);

    let isBookmarked = false;

    if (rows.length > 0) {
      await pool.execute(`
        DELETE FROM bookmarks WHERE user_id = ? AND question_id = ?
      `, [userId, questionId]);
    } else {
      await pool.execute(`
        INSERT INTO bookmarks (user_id, question_id) VALUES (?, ?)
      `, [userId, questionId]);
      isBookmarked = true;
    }

    res.json({
      success: true,
      message: isBookmarked ? 'Bookmark added' : 'Bookmark removed',
      isBookmarked
    });
  } catch (error) {
    console.error('Toggle bookmark error:', error);
    res.status(500).json({ success: false, message: 'Error toggling bookmark' });
  }
};

// GET /api/weak-areas - Get user's weak areas (attempts > 5, accuracy < 50%)
const getWeakAreas = async (req, res) => {
  try {
    const userId = req.user.id;

    const [rows] = await pool.execute(`
      SELECT topic_id, topic_name, section_name, 
             COUNT(*) as attempts, 
             SUM(is_correct) as correct,
             ROUND((SUM(is_correct) / COUNT(*)) * 100) as accuracy
      FROM (
        -- Practice attempts
        SELECT q.topic_id, t.name as topic_name, s.name as section_name, ua.is_correct
        FROM user_attempts ua
        JOIN questions q ON ua.question_id = q.id
        JOIN topics t ON q.topic_id = t.id
        JOIN sections s ON q.section_id = s.id
        WHERE ua.user_id = ?
        
        UNION ALL
        
        -- Test attempts
        SELECT q.topic_id, t.name as topic_name, s.name as section_name, taa.is_correct
        FROM test_attempt_answers taa
        JOIN test_attempts ta ON taa.attempt_id = ta.id
        JOIN questions q ON taa.question_id = q.id
        JOIN topics t ON q.topic_id = t.id
        JOIN sections s ON q.section_id = s.id
        WHERE ta.user_id = ?
      ) combined
      GROUP BY topic_id, topic_name, section_name
      HAVING attempts > 5 AND accuracy < 50
      ORDER BY accuracy ASC
    `, [userId, userId]);

    res.json({
      success: true,
      weakAreas: rows
    });
  } catch (error) {
    console.error('Get weak areas error:', error);
    res.status(500).json({ success: false, message: 'Error fetching weak areas' });
  }
};

module.exports = {
  getDashboardStats,
  getUserStats,
  getCompletedQuestions,
  getBookmarkedQuestions,
  getRecentActivity,
  markQuestionCompleted,
  toggleBookmark,
  getWeakAreas
};
