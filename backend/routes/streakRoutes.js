const express = require('express');
const router = express.Router();
const { getStreak, checkIn, getWeeklyActivity, getMyBadges, getAllBadges } = require('../controllers/streakController');
const { authenticate } = require('../middleware/auth');

router.get('/', authenticate, getStreak);
router.post('/checkin', authenticate, checkIn);
router.get('/weekly', authenticate, getWeeklyActivity);
router.get('/badges', authenticate, getMyBadges);
router.get('/badges/all', getAllBadges);

module.exports = router;
