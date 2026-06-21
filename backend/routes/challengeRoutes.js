const express = require('express');
const router = express.Router();
const { getDailyChallenge, submitDailyChallenge } = require('../controllers/challengeController');
const { authenticate } = require('../middleware/auth');

router.use(authenticate);

router.get('/', getDailyChallenge);
router.post('/submit', submitDailyChallenge);

module.exports = router;
