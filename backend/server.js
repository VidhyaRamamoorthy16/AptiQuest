const express = require('express');
const cors = require('cors');
require('dotenv').config();

const app = express();

// CORS
const corsOptions = {
  origin: [
    'http://localhost:3000',
    'http://localhost:3002',
    'https://aptiquest-web.vercel.app'
  ],
  credentials: true,
  methods: ['GET', 'POST', 'PUT', 'DELETE', 'OPTIONS'],
  allowedHeaders: ['Content-Type', 'Authorization']
};
app.use(cors(corsOptions));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Health check
app.get('/api/health', (req, res) => {
  res.json({
    success: true,
    status: 'OK',
    message: 'AptiQuest API running',
    timestamp: new Date().toISOString()
  });
});

// Load routes
const authRoutes = require('./routes/authRoutes');
const dataRoutes = require('./routes/dataRoutes');
const questionRoutes = require('./routes/questionRoutes');
const progressRoutes = require('./routes/progressRoutes');
const testRoutes = require('./routes/testRoutes');
const bookmarkRoutes = require('./routes/bookmarkRoutes');
const leaderboardRoutes = require('./routes/leaderboardRoutes');
const adminRoutes = require('./routes/adminRoutes');
const streakRoutes = require('./routes/streakRoutes');
const mockTestRoutes = require('./routes/mockTestRoutes');
const challengeRoutes = require('./routes/challengeRoutes');

// Mount routes
app.use('/api/auth', authRoutes);
app.use('/api/data', dataRoutes);
app.use('/api/questions', questionRoutes);
app.use('/api/progress', progressRoutes);
app.use('/api/tests', testRoutes);
app.use('/api/bookmarks', bookmarkRoutes);
app.use('/api/leaderboard', leaderboardRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/streak', streakRoutes);
app.use('/api/mock-tests', mockTestRoutes);
app.use('/api/daily-challenge', challengeRoutes);

// Additional routes
const { authenticate } = require('./middleware/auth');
const { getWeakAreas } = require('./controllers/progressController');
app.get('/api/weak-areas', authenticate, getWeakAreas);

// 404 handler
app.use((req, res) => {
  res.status(404).json({ success: false, message: 'Route not found' });
});

// Error handler
app.use((err, req, res, next) => {
  console.error('Error:', err);
  res.status(err.status || 500).json({
    success: false,
    message: err.message || 'Internal server error',
    error: process.env.NODE_ENV === 'development' ? err.stack : undefined
  });
});

const PORT = process.env.PORT || 5500;
app.listen(PORT, () => {
  console.log(`🚀 Server running on port ${PORT}`);
  console.log(`📦 Environment: ${process.env.NODE_ENV || 'development'}`);
});

module.exports = app;
