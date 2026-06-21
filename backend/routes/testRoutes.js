const express = require('express');
const router = express.Router();
const { getTests, getTestById, submitTest, getTestResult } = require('../controllers/testController');
const { authenticate } = require('../middleware/auth');

// All test routes require authentication
router.use(authenticate);

router.get('/', getTests);
router.get('/:id', getTestById);
router.post('/:id/submit', submitTest);
router.get('/:id/result', getTestResult);

module.exports = router;
