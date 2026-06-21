const express = require('express');
const router = express.Router();
const { getBookmarks, deleteBookmark } = require('../controllers/bookmarkController');
const { authenticate } = require('../middleware/auth');

// All bookmark routes require authentication
router.use(authenticate);

router.get('/', getBookmarks);
router.delete('/:questionId', deleteBookmark);

module.exports = router;
