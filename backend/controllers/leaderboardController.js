const pool = require('../config/database');

// GET /api/leaderboard - Get ranked leaderboard entries
const getLeaderboard = async (req, res) => {
  try {
    const { period = 'all' } = req.query;

    let periodConditionTa = '';
    let periodConditionUa = '';

    if (period === 'week') {
      periodConditionTa = 'AND ta.submitted_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)';
      periodConditionUa = 'AND attempted_at >= DATE_SUB(NOW(), INTERVAL 7 DAY)';
    } else if (period === 'month') {
      periodConditionTa = 'AND ta.submitted_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)';
      periodConditionUa = 'AND attempted_at >= DATE_SUB(NOW(), INTERVAL 30 DAY)';
    }

    let query = '';
    if (period === 'all') {
      query = `
        SELECT
          u.id as userId,
          u.name as username,
          (SELECT COUNT(*) FROM test_attempts ta WHERE ta.user_id = u.id AND ta.submitted_at IS NOT NULL) as tests,
          u.total_points as score,
          ROUND(IFNULL(
            (
              SELECT (SUM(is_correct) / COUNT(*)) * 100
              FROM (
                SELECT is_correct FROM user_attempts WHERE user_id = u.id
                UNION ALL
                SELECT taa.is_correct FROM test_attempt_answers taa JOIN test_attempts ta ON taa.attempt_id = ta.id WHERE ta.user_id = u.id
              ) combined
            ), 0
          ), 1) as accuracy
        FROM users u
        WHERE u.total_points > 0 OR EXISTS(SELECT 1 FROM user_attempts ua WHERE ua.user_id = u.id)
        ORDER BY score DESC, accuracy DESC
        LIMIT 50
      `;
    } else {
      // Period specific (week/month)
      query = `
        SELECT 
          u.id as userId,
          u.name as username,
          (SELECT COUNT(*) FROM test_attempts ta WHERE ta.user_id = u.id AND ta.submitted_at IS NOT NULL ${periodConditionTa}) as tests,
          (
            IFNULL((SELECT SUM(ta.score) FROM test_attempts ta WHERE ta.user_id = u.id AND ta.submitted_at IS NOT NULL ${periodConditionTa}), 0) +
            IFNULL((SELECT COUNT(*) * 10 FROM user_attempts ua WHERE ua.user_id = u.id AND ua.is_correct = 1 ${periodConditionUa}), 0)
          ) as score,
          ROUND(IFNULL(
            (
              SELECT (SUM(is_correct) / COUNT(*)) * 100
              FROM (
                SELECT is_correct FROM user_attempts WHERE user_id = u.id ${periodConditionUa}
                UNION ALL
                SELECT taa.is_correct FROM test_attempt_answers taa JOIN test_attempts ta ON taa.attempt_id = ta.id WHERE ta.user_id = u.id ${periodConditionTa}
              ) combined
            ), 0
          ), 1) as accuracy
        FROM users u
        HAVING score > 0
        ORDER BY score DESC, accuracy DESC
        LIMIT 50
      `;
    }

    const [rows] = await pool.execute(query);

    // Map rank to each row
    const leaderboard = rows.map((row, index) => ({
      ...row,
      rank: index + 1,
      score: parseInt(row.score),
      accuracy: parseFloat(row.accuracy),
      tests: parseInt(row.tests)
    }));

    res.json(leaderboard);
  } catch (error) {
    console.error('Get leaderboard error:', error);
    res.status(500).json({ success: false, message: 'Error fetching leaderboard' });
  }
};

module.exports = { getLeaderboard };
