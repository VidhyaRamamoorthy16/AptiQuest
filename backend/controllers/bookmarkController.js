const pool = require('../config/database');

// GET /api/bookmarks - List all bookmarked questions for the user
const getBookmarks = async (req, res) => {
  try {
    const userId = req.user.id;
    const [bookmarks] = await pool.execute(`
      SELECT b.question_id as questionId, b.created_at as bookmarkedAt, q.question as questionText, q.difficulty, t.name as topic
      FROM bookmarks b
      JOIN questions q ON b.question_id = q.id
      JOIN topics t ON q.topic_id = t.id
      WHERE b.user_id = ?
      ORDER BY b.created_at DESC
    `, [userId]);

    res.json(bookmarks);
  } catch (error) {
    console.error('Get bookmarks error:', error);
    res.status(500).json({ success: false, message: 'Error fetching bookmarks' });
  }
};

// DELETE /api/bookmarks/:questionId - Remove bookmark for a question
const deleteBookmark = async (req, res) => {
  try {
    const userId = req.user.id;
    const { questionId } = req.params;

    await pool.execute(`
      DELETE FROM bookmarks WHERE user_id = ? AND question_id = ?
    `, [userId, questionId]);

    res.json({ success: true, message: 'Bookmark removed successfully' });
  } catch (error) {
    console.error('Delete bookmark error:', error);
    res.status(500).json({ success: false, message: 'Error removing bookmark' });
  }
};

module.exports = { getBookmarks, deleteBookmark };
