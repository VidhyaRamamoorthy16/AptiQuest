import { useEffect, useState } from 'react'
import { useParams, Link, useSearchParams, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { Clock, CheckCircle, BookOpen, Target, TrendingUp, Star, ArrowRight, RotateCcw, Trophy, Flame } from 'lucide-react'

const Practice = () => {
  const { section } = useParams()
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const topic = searchParams.get('topic')
  
  const [topics, setTopics] = useState([])
  const [questions, setQuestions] = useState([])
  const [loading, setLoading] = useState(true)
  const [showQuestions, setShowQuestions] = useState(false)
  const [completedQuestions, setCompletedQuestions] = useState(new Set())
  const [userStats, setUserStats] = useState(null)
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0)
  const [sessionQuestions, setSessionQuestions] = useState([])
  const [sessionProgress, setSessionProgress] = useState({ completed: 0, total: 0 })
  const [showSessionComplete, setShowSessionComplete] = useState(false)
  const [isSessionMode, setIsSessionMode] = useState(false)

  useEffect(() => {
    console.log('Practice component mounted', { section, topic, isSessionMode })
    
    if (isSessionMode) {
      if (sessionQuestions.length === 0) {
        fetchSessionQuestions()
      }
    } else if (topic) {
      fetchQuestions()
      fetchUserStats()
    } else {
      fetchTopics()
    }
  }, [section, topic, isSessionMode, currentQuestionIndex])

  const fetchTopics = async () => {
    console.log('Fetching topics for section:', section)
    try {
      const response = await api.get('/data/topics', { 
        params: { section } 
      })
      console.log('Topics response:', response.data)
      
      setTopics(response.data.topics || [])
      setLoading(false)
    } catch (error) {
      console.error('Error fetching topics:', error)
      const mockTopics = {
        quantitative: [
          { name: 'Number System', count: 45, difficulty: { easy: 15, medium: 20, hard: 10 } },
          { name: 'Percentages', count: 38, difficulty: { easy: 12, medium: 18, hard: 8 } },
          { name: 'Profit & Loss', count: 32, difficulty: { easy: 10, medium: 15, hard: 7 } },
          { name: 'Simple & Compound Interest', count: 28, difficulty: { easy: 8, medium: 12, hard: 8 } },
          { name: 'Time & Work', count: 35, difficulty: { easy: 10, medium: 15, hard: 10 } },
          { name: 'Time, Speed & Distance', count: 30, difficulty: { easy: 12, medium: 10, hard: 8 } }
        ],
        logical: [
          { name: 'Number Series', count: 42, difficulty: { easy: 10, medium: 20, hard: 12 } },
          { name: 'Blood Relations', count: 28, difficulty: { easy: 8, medium: 12, hard: 8 } },
          { name: 'Direction Sense', count: 25, difficulty: { easy: 10, medium: 10, hard: 5 } },
          { name: 'Coding-Decoding', count: 35, difficulty: { easy: 5, medium: 15, hard: 15 } },
          { name: 'Seating Arrangement', count: 30, difficulty: { easy: 5, medium: 15, hard: 10 } },
          { name: 'Puzzles', count: 32, difficulty: { easy: 8, medium: 12, hard: 12 } },
          { name: 'Syllogism', count: 25, difficulty: { easy: 5, medium: 10, hard: 10 } }
        ],
        di: [
          { name: 'Tables', count: 28, difficulty: { easy: 8, medium: 12, hard: 8 } },
          { name: 'Bar Graphs', count: 24, difficulty: { easy: 6, medium: 10, hard: 8 } },
          { name: 'Line Charts', count: 20, difficulty: { easy: 6, medium: 8, hard: 6 } },
          { name: 'Pie Charts', count: 18, difficulty: { easy: 4, medium: 8, hard: 6 } },
          { name: 'Case-lets', count: 22, difficulty: { easy: 6, medium: 8, hard: 8 } },
          { name: 'Mixed DI', count: 25, difficulty: { easy: 5, medium: 10, hard: 10 } }
        ]
      }
      setTopics(mockTopics[section] || [])
      setLoading(false)
    }
  }

  const fetchSessionQuestions = async () => {
    console.log('Fetching session questions for section:', section)
    try {
      const response = await api.get('/data/questions', { 
        params: { section, limit: 20 } 
      })
      console.log('Session questions response:', response.data)
      
      setSessionQuestions(response.data.questions || [])
      setSessionProgress({ completed: 0, total: response.data.questions.length })
      setCurrentQuestionIndex(0)
      setShowQuestions(true)
      setLoading(false)
    } catch (error) {
      console.error('Error fetching session questions:', error)
      setLoading(false)
    }
  }

  const fetchQuestions = async () => {
    console.log('Fetching questions for topic:', topic, 'section:', section)
    try {
      const response = await api.get('/data/questions', { 
        params: { section, topic, limit: 50 } 
      })
      console.log('Questions response:', response.data)
      setQuestions(response.data.questions || [])
      setShowQuestions(true)
      setLoading(false)
      
      try {
        const completedResponse = await api.get('/progress/completed-questions')
        setCompletedQuestions(new Set(completedResponse.data.completedQuestions || []))
      } catch (error) {
        console.log('Completed questions endpoint not available, using empty set')
        setCompletedQuestions(new Set())
      }
    } catch (error) {
      console.error('Error fetching questions:', error)
      setLoading(false)
    }
  }

  const fetchUserStats = async () => {
    try {
      const response = await api.get('/progress/stats')
      setUserStats(response.data.data || {
        totalSolved: 47,
        accuracy: 73,
        avgTime: 42,
        streak: 3,
        totalSolvedTrend: { isPositive: true, value: 12 },
        accuracyTrend: { isPositive: true, value: 5 },
        avgTimeTrend: { isPositive: false, value: 8 },
        streakTrend: { isPositive: true, value: 2 }
      })
    } catch (error) {
      console.log('User stats endpoint not available, using mock data')
      setUserStats({
        totalSolved: 47,
        accuracy: 73,
        avgTime: 42,
        streak: 3,
        totalSolvedTrend: { isPositive: true, value: 12 },
        accuracyTrend: { isPositive: true, value: 5 },
        avgTimeTrend: { isPositive: false, value: 8 },
        streakTrend: { isPositive: true, value: 2 }
      })
    }
  }

  const handleQuestionSubmit = async (questionId, selectedAnswer) => {
    try {
      const response = await api.post(`/data/${questionId}/attempt`, { 
        selectedAnswer,
        timeSpent: 30
      })
      
      if (response.data.isCorrect) {
        await api.post('/progress/mark-completed', { questionId })
        setCompletedQuestions(prev => new Set([...prev, questionId]))
      }
      
      return response.data
    } catch (error) {
      console.error('Error submitting answer:', error)
      return { isCorrect: false }
    }
  }

  const handleBookmarkToggle = async (questionId) => {
    try {
      const response = await api.post('/progress/toggle-bookmark', { questionId })
      return response.data
    } catch (error) {
      console.error('Error toggling bookmark:', error)
      return null
    }
  }

  const handleNextQuestion = () => {
    if (currentQuestionIndex < sessionQuestions.length - 1) {
      setCurrentQuestionIndex(currentQuestionIndex + 1)
      setSessionProgress(prev => ({
        ...prev,
        completed: prev.completed + 1
      }))
    }
  }

  const handleSessionComplete = () => {
    setShowSessionComplete(true)
    setIsSessionMode(false)
  }

  const startSessionMode = () => {
    setIsSessionMode(true)
    setShowQuestions(false)
    setCurrentQuestionIndex(0)
    setSessionProgress({ completed: 0, total: 0 })
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-b-4 border-blue-600 mb-4"></div>
          <p className="text-gray-600 dark:text-gray-400">Loading questions...</p>
        </div>
      </div>
    )
  }

  if (isSessionMode && sessionQuestions.length > 0) {
    const currentQuestion = sessionQuestions[currentQuestionIndex]
    const progressPercentage = sessionProgress.total > 0 ? (sessionProgress.completed / sessionProgress.total) * 100 : 0

    return (
      <div className="max-w-4xl mx-auto p-4">
        <div className="mb-6 bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6">
          <div className="flex items-center justify-between mb-4">
            <div>
              <h1 className="text-2xl font-bold text-gray-900 dark:text-white">
                Practice Session
              </h1>
              <p className="text-gray-600 dark:text-gray-400">
                {section.charAt(0).toUpperCase() + section.slice(1)} • {topic}
              </p>
            </div>
            <button
              onClick={() => setIsSessionMode(false)}
              className="text-gray-500 hover:text-gray-700 dark:text-gray-400 dark:hover:text-gray-200"
            >
              Exit Session
            </button>
          </div>

          <div className="mb-6">
            <div className="flex items-center justify-between text-sm mb-2">
              <span className="text-gray-600 dark:text-gray-400">Progress</span>
              <span className="font-medium text-gray-900 dark:text-white">
                {sessionProgress.completed} / {sessionProgress.total} questions
              </span>
            </div>
            <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-3">
              <div 
                className="bg-gradient-to-r from-blue-500 to-purple-600 h-3 rounded-full transition-all duration-500"
                style={{ width: `${progressPercentage}%` }}
              />
            </div>
          </div>

          <div className="grid grid-cols-4 gap-4">
            <div className="text-center">
              <Flame className="h-8 w-8 text-orange-500 mx-auto mb-2" />
              <p className="text-2xl font-bold text-gray-900 dark:text-white">
                {sessionProgress.completed}
              </p>
              <p className="text-sm text-gray-600 dark:text-gray-400">Completed</p>
            </div>
            <div className="text-center">
              <Target className="h-8 w-8 text-blue-500 mx-auto mb-2" />
              <p className="text-2xl font-bold text-gray-900 dark:text-white">
                {sessionProgress.total - sessionProgress.completed}
              </p>
              <p className="text-sm text-gray-600 dark:text-gray-400">Remaining</p>
            </div>
            <div className="text-center">
              <Trophy className="h-8 w-8 text-yellow-500 mx-auto mb-2" />
              <p className="text-2xl font-bold text-gray-900 dark:text-white">
                {Math.round(progressPercentage)}%
              </p>
              <p className="text-sm text-gray-600 dark:text-gray-400">Accuracy</p>
            </div>
            <div className="text-center">
              <Clock className="h-8 w-8 text-green-500 mx-auto mb-2" />
              <p className="text-2xl font-bold text-gray-900 dark:text-white">
                {currentQuestionIndex + 1}
              </p>
              <p className="text-sm text-gray-600 dark:text-gray-400">Question</p>
            </div>
          </div>
        </div>

        <div className="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 mb-6">
          <h3 className="text-xl font-semibold mb-4 text-gray-900 dark:text-white leading-relaxed">
            {currentQuestion.question}
          </h3>
          
          <div className="grid grid-cols-1 md:grid-cols-2 gap-3 mb-6">
            {currentQuestion.options?.map((option) => (
              <button
                key={option.option_label}
                onClick={() => handleQuestionSubmit(currentQuestion.id, option.option_label)}
                className="flex items-center gap-3 p-4 bg-gray-50 dark:bg-gray-700 rounded-lg hover:bg-blue-50 dark:hover:bg-blue-900 transition-colors text-left"
              >
                <div className="w-6 h-6 rounded-full border-2 border-gray-300 dark:border-gray-600 flex items-center justify-center">
                  <span className="font-semibold text-gray-600 dark:text-gray-400 text-sm">
                    {option.option_label}
                  </span>
                </div>
                <span className="text-gray-700 dark:text-gray-300 text-sm">
                  {option.option_text}
                </span>
              </button>
            ))}
          </div>

          <div className="flex items-center justify-between">
            <button
              onClick={() => handleQuestionSubmit(currentQuestion.id, 'A')}
              className="px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
            >
              Submit Answer (A)
            </button>
            
            {currentQuestionIndex < sessionQuestions.length - 1 && (
              <button
                onClick={handleNextQuestion}
                className="px-6 py-3 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors flex items-center gap-2"
              >
                Next Question
                <ArrowRight className="h-4 w-4" />
              </button>
            )}
          </div>
        </div>

        {showSessionComplete && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="bg-white dark:bg-gray-800 rounded-xl p-8 max-w-md mx-4">
              <div className="text-center mb-6">
                <Trophy className="h-16 w-16 text-yellow-500 mx-auto mb-4" />
                <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
                  Session Complete!
                </h2>
                <p className="text-gray-600 dark:text-gray-400">
                  You've completed {sessionProgress.completed} out of {sessionProgress.total} questions
                </p>
              </div>
              <div className="flex gap-4">
                <button
                  onClick={() => window.location.reload()}
                  className="flex-1 px-6 py-3 bg-blue-600 text-white rounded-lg hover:bg-blue-700 transition-colors"
                >
                  Start New Session
                </button>
                <button
                  onClick={() => setIsSessionMode(false)}
                  className="flex-1 px-6 py-3 bg-gray-200 text-gray-800 rounded-lg hover:bg-gray-300 transition-colors"
                >
                  Back to Topics
                </button>
              </div>
            </div>
          </div>
        )}
      </div>
    )
  }

  if (showQuestions) {
    return (
      <div className="max-w-6xl mx-auto p-4">
        <div className="mb-8 grid grid-cols-1 md:grid-cols-4 gap-4">
          <div className="bg-gradient-to-r from-blue-500 to-blue-600 p-4 rounded-lg text-white">
            <div className="flex items-center justify-between">
              <div>
                  <p className="text-blue-100 text-sm">Total Solved</p>
                  <p className="text-2xl font-bold">{userStats.totalSolved}</p>
                </div>
              <CheckCircle className="h-8 w-8 text-blue-200" />
            </div>
          </div>
          <div className="bg-gradient-to-r from-green-500 to-green-600 p-4 rounded-lg text-white">
            <div className="flex items-center justify-between">
              <div>
                  <p className="text-green-100 text-sm">Accuracy</p>
                  <p className="text-2xl font-bold">{userStats.accuracy}%</p>
                </div>
              <Target className="h-8 w-8 text-green-200" />
            </div>
          </div>
          <div className="bg-gradient-to-r from-purple-500 to-purple-600 p-4 rounded-lg text-white">
            <div className="flex items-center justify-between">
              <div>
                  <p className="text-purple-100 text-sm">Avg Time</p>
                  <p className="text-2xl font-bold">{userStats.avgTime}s</p>
                </div>
              <Clock className="h-8 w-8 text-purple-200" />
            </div>
          </div>
          <div className="bg-gradient-to-r from-orange-500 to-orange-600 p-4 rounded-lg text-white">
            <div className="flex items-center justify-between">
              <div>
                  <p className="text-orange-100 text-sm">Streak</p>
                  <p className="text-2xl font-bold">{userStats.streak} days</p>
                </div>
              <TrendingUp className="h-8 w-8 text-orange-200" />
            </div>
          </div>
        </div>

        <div className="mb-6">
          <div className="flex items-center justify-between">
            <button 
              onClick={() => setShowQuestions(false)}
              className="mb-4 text-blue-600 hover:text-blue-800 flex items-center gap-2 transition-colors"
            >
              ← Back to Topics
            </button>
            <div className="flex items-center gap-4">
              <h2 className="text-3xl font-bold text-gray-900 dark:text-white">
                {topic} Questions
              </h2>
              <button
                onClick={startSessionMode}
                className="px-4 py-2 bg-purple-600 text-white rounded-lg hover:bg-purple-700 transition-colors flex items-center gap-2"
              >
                <Flame className="h-4 w-4" />
                Start Session Mode
              </button>
            </div>
          </div>
        </div>

        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {questions.map((question) => {
            const isCompleted = completedQuestions.has(question.id)
            const stats = {
              successRate: Math.floor(Math.random() * 100) + 50,
              avgTime: Math.floor(Math.random() * 30) + 30
            }
            
            return (
              <div key={question.id} className="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-lg hover:shadow-xl transition-all duration-300 overflow-hidden border border-gray-200 dark:border-gray-700">
                <div className="flex items-start justify-between mb-4">
                  <div className="flex items-center gap-3">
                    <span className={`px-3 py-1 text-xs font-semibold rounded-full ${
                      question.difficulty === 'easy' 
                        ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200' 
                        : question.difficulty === 'medium' 
                        ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200' 
                        : 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200'
                    }`}>
                      {question.difficulty?.toUpperCase()}
                    </span>
                    <span className="px-3 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200">
                      {question.topic_name}
                    </span>
                    {isCompleted && (
                      <span className="px-3 py-1 text-xs font-semibold rounded-full bg-emerald-100 text-emerald-800 dark:bg-emerald-900 dark:text-emerald-200 flex items-center gap-1">
                        <CheckCircle className="h-3 w-3" />
                        COMPLETED
                      </span>
                    )}
                  </div>
                  <div className="flex items-center gap-2 text-sm text-gray-500 dark:text-gray-400">
                    <Clock className="h-4 w-4" />
                    <span>{question.estimated_time || 60}s</span>
                  </div>
                </div>
                
                <h3 className="text-lg font-semibold mb-4 text-gray-900 dark:text-white leading-relaxed">
                  {question.question}
                </h3>
                
                <div className="grid grid-cols-1 md:grid-cols-2 gap-3 mb-6">
                  {question.options?.slice(0, 2).map((option) => (
                    <div key={option.option_label} className="flex items-center gap-2 p-2 bg-gray-50 dark:bg-gray-700 rounded-lg">
                      <span className="font-semibold text-gray-600 dark:text-gray-400 text-sm">
                        {option.option_label}.
                      </span>
                      <span className="text-gray-700 dark:text-gray-300 text-sm truncate">
                        {option.option_text}
                      </span>
                    </div>
                  ))}
                  {question.options?.length > 2 && (
                    <div className="text-sm text-gray-500 dark:text-gray-400 italic">
                      +{question.options.length - 2} more options...
                    </div>
                  )}
                </div>
                
                <div className="flex items-center justify-between">
                  <div className="flex items-center gap-2">
                    <button 
                      onClick={() => navigate(`/question/${question.id}`)}
                      className={`inline-flex items-center gap-2 px-6 py-2.5 rounded-lg font-medium transition-all duration-200 ${
                        isCompleted 
                          ? 'bg-emerald-100 text-emerald-700 hover:bg-emerald-200 dark:bg-emerald-900 dark:text-emerald-300 dark:hover:bg-emerald-800' 
                          : 'bg-blue-600 text-white hover:bg-blue-700 shadow-md hover:shadow-lg'
                      }`}
                    >
                      {isCompleted ? (
                        <>
                          <CheckCircle className="h-4 w-4" />
                          Review Solution
                        </>
                      ) : (
                        <>
                          <Target className="h-4 w-4" />
                          Solve Question
                        </>
                      )}
                    </button>
                    
                    <button 
                      onClick={async () => {
                        const bookmarkStatus = await handleBookmarkToggle(question.id)
                        console.log('Bookmark toggled:', bookmarkStatus)
                      }}
                      className={`p-2.5 rounded-lg border transition-colors ${
                        completedQuestions.has(question.id)
                          ? 'bg-yellow-100 border-yellow-300 text-yellow-700 hover:bg-yellow-200 dark:bg-yellow-900 dark:border-yellow-700 dark:text-yellow-300' 
                          : 'border-gray-300 dark:border-gray-600 hover:bg-gray-50 dark:hover:bg-gray-700'
                      }`}
                      title={completedQuestions.has(question.id) ? 'Remove bookmark' : 'Bookmark question'}
                    >
                      <Star className={`h-4 w-4 ${completedQuestions.has(question.id) ? 'fill-current text-yellow-600' : 'text-gray-600 dark:text-gray-400'}`} />
                    </button>
                  </div>
                  
                  <div className="flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400">
                    <span className="flex items-center gap-1">
                      <CheckCircle className="h-3 w-3" />
                      {stats.successRate}% correct
                    </span>
                    <span className="flex items-center gap-1">
                      <Clock className="h-3 w-3" />
                      {stats.avgTime}s avg
                    </span>
                  </div>
                </div>
              </div>
            )
          })}
        </div>
      </div>
    )
  }

  return (
    <div className="max-w-6xl mx-auto p-4">
      <h1 className="text-3xl font-bold mb-8 text-gray-900 dark:text-white">
        {section ? section.charAt(0).toUpperCase() + section.slice(1) : 'Practice'} Topics
      </h1>
      
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {topics.map((topic, index) => {
          const topicStats = topic
          const completionRate = topic.count > 0 ? Math.round((topic.difficulty.easy / topic.count) * 100) : 0
          
          return (
            <div key={index} className="group relative bg-white dark:bg-gray-800 rounded-xl shadow-md hover:shadow-xl transition-all duration-300 overflow-hidden border border-gray-200 dark:border-gray-700 block">
              <div className="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-purple-500/5 opacity-0 group-hover:opacity-100 transition-opacity" />
              
              <div className="relative p-6">
                <div className="flex items-start justify-between mb-4">
                  <div className="p-3 bg-gradient-to-br from-blue-500 to-purple-600 rounded-lg">
                    <BookOpen className="h-6 w-6 text-white" />
                  </div>
                  <div className="text-right">
                    <span className="text-sm font-medium text-gray-500 dark:text-gray-400">
                      {topic.count} questions
                    </span>
                  </div>
                </div>
                
                <h3 className="text-xl font-bold mb-3 text-gray-900 dark:text-white group-hover:text-blue-600 dark:group-hover:text-blue-400 transition-colors">
                  {topic.name}
                </h3>
                
                <p className="text-gray-600 dark:text-gray-400 mb-4 line-clamp-2">
                  Master {topic.name.toLowerCase()} concepts with comprehensive practice questions
                </p>
                
                <div className="mb-4">
                  <div className="flex items-center justify-between text-sm mb-2">
                    <span className="text-gray-600 dark:text-gray-400">Progress</span>
                    <span className="font-medium text-gray-900 dark:text-white">{completionRate}%</span>
                  </div>
                  <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
                    <div 
                      className="bg-gradient-to-r from-blue-500 to-purple-600 h-2 rounded-full transition-all duration-500"
                      style={{ width: `${completionRate}%` }}
                    />
                  </div>
                </div>
                
                <div className="flex items-center justify-between text-sm">
                  <div className="flex items-center gap-4">
                    <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
                      <span className="font-medium">Easy:</span>
                      <span className="text-gray-900 dark:text-white">{topic.difficulty.easy}</span>
                    </div>
                    <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
                      <span className="font-medium">Medium:</span>
                      <span className="text-gray-900 dark:text-white">{topic.difficulty.medium}</span>
                    </div>
                    <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
                      <span className="font-medium">Hard:</span>
                      <span className="text-gray-900 dark:text-white">{topic.difficulty.hard}</span>
                    </div>
                  </div>
                  <div className="flex items-center gap-4">
                    <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
                      <span className="font-medium text-gray-900 dark:text-white">
                        {Math.floor((topic.difficulty.easy + topic.difficulty.medium) / topic.count * 100)}% completed
                      </span>
                    </div>
                    <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
                      <Clock className="h-3 w-3" />
                      <span className="font-medium text-gray-900 dark:text-white">~45s avg</span>
                    </div>
                  </div>
                </div>
                
                <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700">
                  <div className="flex items-center justify-between">
                    <span className="text-sm font-medium text-blue-600 dark:text-blue-400">
                      Start Practice
                    </span>
                    <div className="transform group-hover:translate-x-1 transition-transform">
                      <Target className="h-4 w-4 text-blue-600 dark:text-blue-400" />
                    </div>
                  </div>
                </div>
              </div>
            </div>
          )
        })}
      </div>
    </div>
  )
}

export default Practice
