const express = require('express');
const router = express.Router();
const { 
  getQuestions, 
  getQuestionById, 
  submitAnswer, 
  getTopics,
  createQuestion,
  updateQuestion,
  deleteQuestion,
  bulkUpload
} = require('../controllers/questionController');
const { authenticate, isAdmin } = require('../middleware/auth');
const multer = require('multer');
const os = require('os');

const upload = multer({ dest: os.tmpdir() });

// Public routes
router.get('/topics', getTopics);
router.get('/', getQuestions);
router.get('/:id', getQuestionById);

// Protected routes (users & admins)
router.post('/:id/attempt', authenticate, submitAnswer);

// Admin-only question CRUD routes
router.post('/', authenticate, isAdmin, createQuestion);
router.put('/:id', authenticate, isAdmin, updateQuestion);
router.delete('/:id', authenticate, isAdmin, deleteQuestion);
router.post('/bulk-upload', authenticate, isAdmin, upload.single('file'), bulkUpload);

module.exports = router;
