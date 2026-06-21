const express = require('express');
const router = express.Router();
const { 
  getQuestions, 
  getQuestionById, 
  submitAnswer, 
  getTopics 
} = require('../controllers/dataController');
const { authenticate } = require('../middleware/auth');

// All data routes require authentication
router.use(authenticate);

router.get('/topics', getTopics);
router.get('/questions', getQuestions);
router.get('/', getQuestions);
router.post('/:id/attempt', submitAnswer);
router.get('/:id', getQuestionById);

module.exports = router;
