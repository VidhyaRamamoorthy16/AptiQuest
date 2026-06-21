const express = require('express');
const router = express.Router();
const { getAnalytics, getUsers, toggleUserStatus } = require('../controllers/adminController');
const { authenticate, isAdmin } = require('../middleware/auth');

// All admin routes require authentication and admin privileges
router.use(authenticate, isAdmin);

router.get('/analytics', getAnalytics);
router.get('/users', getUsers);
router.put('/users/:id', toggleUserStatus);

module.exports = router;
