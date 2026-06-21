const express = require('express')
const router = express.Router()

// Mock user stats endpoint
router.get('/stats', (req, res) => {
  const mockStats = {
    totalSolved: Math.floor(Math.random() * 50) + 10,
    accuracy: Math.floor(Math.random() * 30) + 70,
    avgTime: Math.floor(Math.random() * 30) + 30,
    streak: Math.floor(Math.random() * 7) + 1,
    totalSolvedTrend: { isPositive: true, value: 12 },
    accuracyTrend: { isPositive: true, value: 5 },
    avgTimeTrend: { isPositive: false, value: 8 },
    streakTrend: { isPositive: true, value: 2 }
  }
  
  res.json({
    success: true,
    data: mockStats
  })
})

// Mock completed questions endpoint
router.get('/completed-questions', (req, res) => {
  // Return some mock completed question IDs
  const completedQuestions = [1, 3, 5, 7, 9]
  
  res.json({
    success: true,
    data: { completedQuestions }
  })
})

module.exports = router
