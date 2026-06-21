const express = require('express');
const router = express.Router();
const { getLeaderboard } = require('../controllers/leaderboardController');
const { authenticate } = require('../middleware/auth');

// All leaderboard routes require authentication
router.use(authenticate);

router.get('/', getLeaderboard);

module.exports = router;
