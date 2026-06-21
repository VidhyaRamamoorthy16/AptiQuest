import { useEffect, useState } from 'react'
import { useParams, Link, useSearchParams, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { Clock, CheckCircle, BookOpen, Target, TrendingUp, Star, ArrowRight, Trophy, Flame } from 'lucide-react'
import FilterBar from '../components/FilterBar'
import Pagination from '../components/Pagination'

const Practice = () => {
  const { section } = useParams()
  const navigate = useNavigate()
  const [searchParams, setSearchParams] = useSearchParams()
  const topic = searchParams.get('topic')
  
  // Filter States from URL Params
  const searchTerm = searchParams.get('search') || ''
  const difficulty = searchParams.get('difficulty') || 'all'
  const status = searchParams.get('status') || 'all'
  const sort = searchParams.get('sort') || 'newest'
  const page = parseInt(searchParams.get('page') || '1')

  const [topics, setTopics] = useState([])
  const [questions, setQuestions] = useState([])
  const [loading, setLoading] = useState(true)
  const [showQuestions, setShowQuestions] = useState(false)
  const [completedQuestions, setCompletedQuestions] = useState(new Set())
  const [bookmarkedQuestions, setBookmarkedQuestions] = useState(new Set())
  const [userStats, setUserStats] = useState(null)
  
  // Pagination details
  const [totalPages, setTotalPages] = useState(1)
  const [totalItems, setTotalItems] = useState(0)

  // Session mode details
  const [currentQuestionIndex, setCurrentQuestionIndex] = useState(0)
  const [sessionQuestions, setSessionQuestions] = useState([])
  const [sessionProgress, setSessionProgress] = useState({ completed: 0, total: 0 })
  const [showSessionComplete, setShowSessionComplete] = useState(false)
  const [isSessionMode, setIsSessionMode] = useState(false)

  useEffect(() => {
    console.log('Practice component mounted', { section, topic, isSessionMode, searchParams: searchParams.toString() })
    
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
  }, [section, topic, isSessionMode, searchParams])

  const fetchTopics = async () => {
    setLoading(true)
    console.log('Fetching topics for section:', section)
    try {
      const response = await api.get('/data/topics', { 
        params: { section } 
      })
      
      // Topics response returns an array of topic objects from MySQL
      // To format them cleanly with counts, let's query backend topics
      setTopics(response.data.topics || [])
      setLoading(false)
    } catch (error) {
      console.error('Error fetching topics:', error)
      setLoading(false)
    }
  }

  const fetchSessionQuestions = async () => {
    setLoading(true)
    console.log('Fetching session questions for section:', section)
    try {
      const response = await api.get('/data/questions', { 
        params: { section, limit: 20 } 
      })
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
    setLoading(true)
    console.log('Fetching questions with filters:', { section, topic, searchTerm, difficulty, status, sort, page })
    try {
      const response = await api.get('/data/questions', { 
        params: { 
          section, 
          topic, 
          search: searchTerm,
          difficulty,
          status,
          sort,
          page,
          limit: 10
        } 
      })
      setQuestions(response.data.questions || [])
      setTotalPages(response.data.pagination?.pages || 1)
      setTotalItems(response.data.pagination?.total || 0)
      setShowQuestions(true)
      
      // Fetch user completed questions
      try {
        const completedResponse = await api.get('/progress/completed-questions')
        setCompletedQuestions(new Set(completedResponse.data.completedQuestions || []))
      } catch (error) {
        setCompletedQuestions(new Set())
      }

      // Fetch user bookmarked questions
      try {
        const bookmarksResponse = await api.get('/progress/bookmarked-questions')
        setBookmarkedQuestions(new Set(bookmarksResponse.data.bookmarkedQuestions || []))
      } catch (error) {
        setBookmarkedQuestions(new Set())
      }
    } catch (error) {
      console.error('Error fetching questions:', error)
    } finally {
      setLoading(false)
    }
  }

  const fetchUserStats = async () => {
    try {
      const response = await api.get('/progress/stats')
      setUserStats(response.data.data)
    } catch (error) {
      console.log('User stats error, using default mock details')
      setUserStats({
        totalSolved: 0,
        accuracy: 0,
        avgTime: 0,
        streak: 0
      })
    }
  }

  const updateFilters = (key, value) => {
    const newParams = new URLSearchParams(searchParams)
    if (value === 'all' || value === '' || (key === 'sort' && value === 'newest')) {
      newParams.delete(key)
    } else {
      newParams.set(key, value)
    }
    // Reset page index on filter change
    if (key !== 'page') {
      newParams.delete('page')
    }
    setSearchParams(newParams)
  }

  const clearFilters = () => {
    const newParams = new URLSearchParams()
    if (topic) newParams.set('topic', topic)
    setSearchParams(newParams)
  }

  const handleBookmarkToggle = async (questionId) => {
    try {
      const response = await api.post('/progress/toggle-bookmark', { questionId })
      const isBookmarked = response.data.isBookmarked
      
      setBookmarkedQuestions(prev => {
        const updated = new Set(prev)
        if (isBookmarked) {
          updated.add(questionId)
        } else {
          updated.delete(questionId)
        }
        return updated
      })

      return response.data
    } catch (error) {
      console.error('Error toggling bookmark:', error)
      return null
    }
  }

  const handleQuestionSubmit = async (questionId, selectedOption) => {
    try {
      const response = await api.post(`/data/${questionId}/attempt`, {
        selectedAnswer: selectedOption,
        timeTaken: 15
      })
      
      // Update local completed list if correct
      if (response.data.isCorrect) {
        setCompletedQuestions(prev => {
          const next = new Set(prev)
          next.add(questionId)
          return next
        })
      }
      
      return response.data
    } catch (error) {
      console.error('Error submitting answer:', error)
      return { isCorrect: false }
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
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
      </div>
    )
  }

  // Session mode interface
  if (isSessionMode && sessionQuestions.length > 0) {
    const currentQuestion = sessionQuestions[currentQuestionIndex]
    return (
      <div className="max-w-3xl mx-auto p-4">
        {/* Progress header */}
        <div className="mb-6 flex items-center justify-between">
          <span className="text-sm font-semibold text-slate-500">
            Question {currentQuestionIndex + 1} of {sessionQuestions.length}
          </span>
          <span className="text-sm font-semibold text-indigo-600 bg-indigo-50 px-3 py-1 rounded-full">
            Session Progress: {Math.round((sessionProgress.completed / sessionProgress.total) * 100)}%
          </span>
        </div>

        {/* Question card */}
        <div className="bg-white dark:bg-gray-800 rounded-xl p-8 shadow-lg border border-gray-200 dark:border-gray-700">
          <h3 className="text-xl font-bold mb-6 text-gray-900 dark:text-white leading-relaxed">
            {currentQuestion.questionText}
          </h3>

          <div className="grid grid-cols-1 md:grid-cols-2 gap-3 mb-6">
            {currentQuestion.options?.map((option) => (
              <button
                key={option.option_label}
                onClick={() => handleQuestionSubmit(currentQuestion.id, option.option_label)}
                className="flex items-center gap-3 p-4 bg-gray-50 dark:bg-gray-700 rounded-lg hover:bg-indigo-50 dark:hover:bg-indigo-900 transition-colors text-left border border-slate-100 dark:border-slate-800"
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
              onClick={() => handleSessionComplete()}
              className="px-6 py-2.5 bg-slate-100 dark:bg-slate-700 hover:bg-slate-200 text-slate-700 dark:text-slate-200 rounded-lg transition-colors font-semibold"
            >
              End Session
            </button>
            
            {currentQuestionIndex < sessionQuestions.length - 1 ? (
              <button
                onClick={handleNextQuestion}
                className="px-6 py-2.5 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors flex items-center gap-2 font-semibold shadow-md"
              >
                Next Question
                <ArrowRight className="h-4 w-4" />
              </button>
            ) : (
              <button
                onClick={handleSessionComplete}
                className="px-6 py-2.5 bg-green-600 text-white rounded-lg hover:bg-green-700 transition-colors flex items-center gap-2 font-semibold shadow-md"
              >
                Finish Session
              </button>
            )}
          </div>
        </div>

        {/* Session Complete Modal */}
        {showSessionComplete && (
          <div className="fixed inset-0 bg-black bg-opacity-50 flex items-center justify-center z-50">
            <div className="bg-white dark:bg-gray-800 rounded-xl p-8 max-w-md mx-4 shadow-2xl border border-slate-200 dark:border-slate-700">
              <div className="text-center mb-6">
                <Trophy className="h-16 w-16 text-yellow-500 mx-auto mb-4" />
                <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-2">
                  Session Complete!
                </h2>
                <p className="text-gray-600 dark:text-gray-400">
                  Great job practicing {sessionQuestions.length} questions in this session!
                </p>
              </div>
              <div className="flex gap-4">
                <button
                  onClick={() => {
                    setShowSessionComplete(false)
                    fetchSessionQuestions()
                  }}
                  className="flex-1 px-6 py-3 bg-indigo-600 text-white rounded-lg hover:bg-indigo-700 transition-colors font-semibold shadow-md"
                >
                  Start New
                </button>
                <button
                  onClick={() => {
                    setShowSessionComplete(false)
                    setIsSessionMode(false)
                  }}
                  className="flex-1 px-6 py-3 bg-gray-100 hover:bg-gray-200 dark:bg-gray-700 dark:hover:bg-gray-600 text-slate-700 dark:text-slate-200 rounded-lg transition-colors font-semibold"
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

  // Question list view (when a topic is selected)
  if (showQuestions) {
    return (
      <div className="max-w-6xl mx-auto p-4 space-y-6">
        {/* User stats widget */}
        {userStats && (
          <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
            <div className="bg-gradient-to-r from-blue-500 to-blue-600 p-4 rounded-xl text-white shadow-md">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-blue-100 text-xs uppercase tracking-wider font-semibold">Total Solved</p>
                  <p className="text-2xl font-bold mt-1">{userStats.totalSolved}</p>
                </div>
                <CheckCircle className="h-8 w-8 text-blue-200/50" />
              </div>
            </div>
            <div className="bg-gradient-to-r from-green-500 to-green-600 p-4 rounded-xl text-white shadow-md">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-green-100 text-xs uppercase tracking-wider font-semibold">Accuracy</p>
                  <p className="text-2xl font-bold mt-1">{userStats.accuracy}%</p>
                </div>
                <Target className="h-8 w-8 text-green-200/50" />
              </div>
            </div>
            <div className="bg-gradient-to-r from-purple-500 to-purple-600 p-4 rounded-xl text-white shadow-md">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-purple-100 text-xs uppercase tracking-wider font-semibold">Avg Time</p>
                  <p className="text-2xl font-bold mt-1">{userStats.avgTime}s</p>
                </div>
                <Clock className="h-8 w-8 text-purple-200/50" />
              </div>
            </div>
            <div className="bg-gradient-to-r from-orange-500 to-orange-600 p-4 rounded-xl text-white shadow-md">
              <div className="flex items-center justify-between">
                <div>
                  <p className="text-orange-100 text-xs uppercase tracking-wider font-semibold">Streak</p>
                  <p className="text-2xl font-bold mt-1">{userStats.streak} days</p>
                </div>
                <Flame className="h-8 w-8 text-orange-200/50" />
              </div>
            </div>
          </div>
        )}

        <div className="flex flex-col sm:flex-row sm:items-center justify-between gap-4">
          <Link 
            to={`/practice/${section}`}
            className="text-indigo-600 hover:text-indigo-800 dark:text-indigo-400 dark:hover:text-indigo-300 flex items-center gap-2 transition-colors text-sm font-semibold"
          >
            &larr; Back to Topics
          </Link>
          <div className="flex items-center gap-4">
            <h2 className="text-2xl font-bold text-gray-900 dark:text-white">
              {topic} Questions
            </h2>
            <button
              onClick={startSessionMode}
              className="px-4 py-2 bg-gradient-to-r from-indigo-600 to-purple-600 text-white rounded-lg hover:from-indigo-700 hover:to-purple-700 transition-all flex items-center gap-2 text-sm font-bold shadow-md hover:shadow-lg"
            >
              <Flame className="h-4 w-4 fill-current" />
              Session Mode
            </button>
          </div>
        </div>

        {/* Filter Bar */}
        <FilterBar 
          searchTerm={searchTerm}
          onSearchChange={(val) => updateFilters('search', val)}
          difficulty={difficulty}
          onDifficultyChange={(val) => updateFilters('difficulty', val)}
          status={status}
          onStatusChange={(val) => updateFilters('status', val)}
          sort={sort}
          onSortChange={(val) => updateFilters('sort', val)}
          totalCount={totalItems}
          filteredCount={questions.length}
          onClearFilters={clearFilters}
        />

        {/* Questions Grid */}
        {questions.length === 0 ? (
          <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-12 text-center shadow-sm">
            <BookOpen className="h-12 w-12 text-gray-400 mx-auto mb-4" />
            <h3 className="text-lg font-bold text-gray-900 dark:text-white mb-2">No Questions Found</h3>
            <p className="text-gray-600 dark:text-gray-400 mb-6">No questions match your current search and filter selections.</p>
            <button
              onClick={clearFilters}
              className="px-6 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg font-bold transition-colors shadow-sm"
            >
              Clear Filters
            </button>
          </div>
        ) : (
          <>
            <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
              {questions.map((question) => {
                const isCompleted = completedQuestions.has(question.id)
                const isBookmarked = bookmarkedQuestions.has(question.id)
                
                return (
                  <div key={question.id} className="bg-white dark:bg-gray-800 p-6 rounded-xl shadow-sm hover:shadow-md transition-all border border-gray-200 dark:border-gray-700 flex flex-col justify-between">
                    <div>
                      <div className="flex items-start justify-between mb-4">
                        <div className="flex items-center gap-3">
                          <span className={`px-2.5 py-0.5 text-xs font-bold rounded-full capitalize ${
                            question.difficulty === 'easy' 
                              ? 'bg-green-100 text-green-800 dark:bg-green-950 dark:text-green-300 border border-green-200 dark:border-green-900' 
                              : question.difficulty === 'medium' 
                              ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-950 dark:text-yellow-300 border border-yellow-200 dark:border-yellow-900' 
                              : 'bg-red-100 text-red-800 dark:bg-red-950 dark:text-red-300 border border-red-200 dark:border-red-900'
                          }`}>
                            {question.difficulty}
                          </span>
                          {isCompleted && (
                            <span className="px-2.5 py-0.5 text-xs font-bold rounded-full bg-emerald-100 text-emerald-800 dark:bg-emerald-950 dark:text-emerald-300 border border-emerald-200 dark:border-emerald-900 flex items-center gap-1">
                              <CheckCircle className="h-3 w-3" />
                              Completed
                            </span>
                          )}
                        </div>
                        <div className="flex items-center gap-2 text-xs font-semibold text-gray-500 dark:text-gray-400 bg-slate-100 dark:bg-slate-700/50 px-2 py-1 rounded-md">
                          <Clock className="h-3.5 w-3.5 text-slate-400" />
                          <span>60s avg</span>
                        </div>
                      </div>
                      
                      <h3 className="text-base font-semibold mb-4 text-gray-900 dark:text-white leading-relaxed">
                        {question.question}
                      </h3>
                      
                      {/* Short list of options */}
                      <div className="grid grid-cols-1 md:grid-cols-2 gap-2 mb-6">
                        {question.options?.slice(0, 2).map((option) => (
                          <div key={option.option_label} className="flex items-center gap-2 p-2 bg-slate-50 dark:bg-slate-900 rounded-lg border border-slate-100 dark:border-slate-800/80 text-xs">
                            <span className="font-bold text-indigo-600 dark:text-indigo-400">
                              {option.option_label}.
                            </span>
                            <span className="text-gray-700 dark:text-slate-300 truncate">
                              {option.option_text}
                            </span>
                          </div>
                        ))}
                        {question.options?.length > 2 && (
                          <div className="text-xs text-gray-500 dark:text-gray-400 italic pl-1 self-center">
                            +{question.options.length - 2} more options...
                          </div>
                        )}
                      </div>
                    </div>
                    
                    <div className="flex items-center justify-between pt-4 border-t border-slate-100 dark:border-slate-750">
                      <div className="flex items-center gap-2">
                        <Link 
                          to={`/question/${question.id}`}
                          className={`inline-flex items-center gap-1.5 px-4 py-2 rounded-lg text-xs font-bold transition-all ${
                            isCompleted 
                              ? 'bg-slate-100 text-slate-700 hover:bg-slate-200 dark:bg-slate-700 dark:text-slate-200' 
                              : 'bg-indigo-600 text-white hover:bg-indigo-700 shadow-sm'
                          }`}
                        >
                          {isCompleted ? 'Review Solution' : 'Solve Question'}
                        </Link>
                        
                        <button 
                          onClick={() => handleBookmarkToggle(question.id)}
                          className={`p-2 rounded-lg border transition-colors ${
                            isBookmarked
                              ? 'bg-yellow-50 border-yellow-200 text-yellow-600 dark:bg-yellow-950/20 dark:border-yellow-900' 
                              : 'border-slate-200 dark:border-slate-700 hover:bg-slate-50 dark:hover:bg-slate-800'
                          }`}
                          title={isBookmarked ? 'Remove Bookmark' : 'Bookmark Question'}
                        >
                          <Star className={`h-4 w-4 ${isBookmarked ? 'fill-current' : 'text-slate-400 dark:text-slate-500'}`} />
                        </button>
                      </div>
                      
                      <div className="flex items-center gap-1.5 text-xs text-slate-500 dark:text-slate-400 bg-slate-50 dark:bg-slate-900 px-2 py-1 rounded-md">
                        <Target className="h-3 w-3" />
                        <span>{question.attempt_count > 0 ? Math.round((question.correct_count / question.attempt_count) * 100) : 75}% correct</span>
                      </div>
                    </div>
                  </div>
                )
              })}
            </div>

            {/* Pagination Component */}
            <Pagination 
              page={page}
              totalPages={totalPages}
              totalItems={totalItems}
              onPageChange={(num) => updateFilters('page', num)}
            />
          </>
        )}
      </div>
    )
  }

  // Topics Grid View (default entry page)
  return (
    <div className="max-w-6xl mx-auto p-4 space-y-6">
      <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
        {section ? section.charAt(0).toUpperCase() + section.slice(1) : 'Practice'} Topics
      </h1>
      <p className="text-slate-600 dark:text-slate-400 -mt-4 mb-6">
        Select a topic to start solving practice questions and gain points
      </p>
      
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {topics.map((topic, index) => {
          return (
            <Link 
              key={index} 
              to={`/practice/${section}?topic=${encodeURIComponent(topic)}`}
              className="group relative bg-white dark:bg-gray-800 rounded-xl shadow-sm hover:shadow-md transition-all duration-300 border border-gray-200 dark:border-gray-700 block p-6"
            >
              <div className="flex items-center justify-between mb-4">
                <div className="p-3 bg-gradient-to-br from-indigo-500 to-purple-600 rounded-lg text-white">
                  <BookOpen className="h-6 w-6" />
                </div>
                <span className="text-xs font-semibold text-indigo-600 bg-indigo-50 dark:bg-indigo-950/40 dark:text-indigo-400 px-3 py-1 rounded-full">
                  Topic Mode
                </span>
              </div>
              
              <h3 className="text-lg font-bold text-gray-900 dark:text-white group-hover:text-indigo-600 dark:group-hover:text-indigo-400 transition-colors mb-2">
                {topic}
              </h3>
              
              <p className="text-sm text-gray-600 dark:text-gray-400 line-clamp-2 leading-relaxed mb-4">
                Master your {topic.toLowerCase()} concepts with interactive step-by-step challenges.
              </p>
              
              <div className="flex items-center justify-between text-xs font-semibold text-indigo-600 dark:text-indigo-400 pt-4 border-t border-slate-100 dark:border-slate-700/60">
                <span>Start Practice</span>
                <ArrowRight className="h-4 w-4 transform group-hover:translate-x-1 transition-transform" />
              </div>
            </Link>
          )
        })}
      </div>
    </div>
  )
}

export default Practice
