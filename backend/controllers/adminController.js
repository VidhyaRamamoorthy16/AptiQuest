const pool = require('../config/database');
const { getTodayIST } = require('./streakController');

// GET /api/admin/analytics - Overview statistics
const getAnalytics = async (req, res) => {
  try {
    const [[{ totalUsers }]] = await pool.execute('SELECT COUNT(*) as totalUsers FROM users');
    const [[{ totalQuestions }]] = await pool.execute('SELECT COUNT(*) as totalQuestions FROM questions');
    const [[{ testsTakenToday }]] = await pool.execute(
      `SELECT COUNT(*) as testsTakenToday 
       FROM test_attempts 
       WHERE DATE(CONVERT_TZ(submitted_at, @@session.time_zone, '+05:30')) = ?`,
      [getTodayIST()]
    );

    const [[{ avgAccuracy }]] = await pool.execute('SELECT ROUND(IFNULL(AVG(accuracy), 0), 1) as avgAccuracy FROM test_attempts WHERE submitted_at IS NOT NULL');

    res.json({
      totalUsers,
      totalQuestions,
      testsTakenToday,
      avgAccuracy: parseFloat(avgAccuracy)
    });
  } catch (error) {
    console.error('Get admin analytics error:', error);
    res.status(500).json({ success: false, message: 'Error fetching analytics' });
  }
};

// GET /api/admin/users - Get all user accounts
const getUsers = async (req, res) => {
  try {
    const [users] = await pool.execute(`
      SELECT id, name, email, role, active, created_at as createdAt
      FROM users
      ORDER BY id ASC
    `);

    // Ensure active is parsed as boolean
    const parsedUsers = users.map(user => ({
      ...user,
      active: !!user.active
    }));

    res.json(parsedUsers);
  } catch (error) {
    console.error('Get admin users error:', error);
    res.status(500).json({ success: false, message: 'Error fetching users' });
  }
};

// PUT /api/admin/users/:id - Toggle user active status
const toggleUserStatus = async (req, res) => {
  try {
    const { id } = req.params;
    const { active } = req.body;

    const [result] = await pool.execute(`
      UPDATE users SET active = ? WHERE id = ?
    `, [active ? 1 : 0, id]);

    if (result.affectedRows === 0) {
      return res.status(404).json({ success: false, message: 'User not found' });
    }

    res.json({ success: true, message: 'User status updated successfully' });
  } catch (error) {
    console.error('Toggle user status error:', error);
    res.status(500).json({ success: false, message: 'Error updating user status' });
  }
};

module.exports = { getAnalytics, getUsers, toggleUserStatus };
