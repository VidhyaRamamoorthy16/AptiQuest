const express = require('express');
const router = express.Router();
const {
  getDashboardStats,
  getUserStats,
  getCompletedQuestions,
  getBookmarkedQuestions,
  getRecentActivity,
  markQuestionCompleted,
  toggleBookmark
} = require('../controllers/progressController');
const { authenticate } = require('../middleware/auth');

// All progress routes require authentication
router.use(authenticate);

router.get('/dashboard', getDashboardStats);
router.get('/stats', getUserStats);
router.get('/completed-questions', getCompletedQuestions);
router.get('/bookmarked-questions', getBookmarkedQuestions);
router.get('/recent-activity', getRecentActivity);
router.post('/mark-completed', markQuestionCompleted);
router.post('/toggle-bookmark', toggleBookmark);

module.exports = router;
