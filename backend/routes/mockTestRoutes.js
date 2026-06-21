const express = require('express');
const router = express.Router();
const { 
  getMockTestPresets, 
  generateMockTest, 
  getMockTestById, 
  submitMockTest, 
  getMockTestHistory,
  getMockTestResult
} = require('../controllers/mockTestController');
const { authenticate } = require('../middleware/auth');

router.use(authenticate);

router.get('/', getMockTestPresets);
router.post('/generate', generateMockTest);
router.get('/history', getMockTestHistory);
router.get('/result/:attemptId', getMockTestResult);
router.get('/:id', getMockTestById);
router.post('/:id/submit', submitMockTest);

module.exports = router;
