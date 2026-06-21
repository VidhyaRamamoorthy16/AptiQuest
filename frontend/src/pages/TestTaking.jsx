import { useEffect, useState } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'
import { Clock, ChevronLeft, ChevronRight, AlertCircle, Bookmark, CheckCircle2, Circle } from 'lucide-react'
import toast from 'react-hot-toast'

const TestTaking = () => {
  const { testId } = useParams()
  const navigate = useNavigate()
  const { darkMode } = useTheme()
  const [loading, setLoading] = useState(true)
  const [test, setTest] = useState(null)
  const [currentQuestion, setCurrentQuestion] = useState(0)
  const [answers, setAnswers] = useState({})
  const [markedForReview, setMarkedForReview] = useState({})
  const [visited, setVisited] = useState({})
  const [timeLeft, setTimeLeft] = useState(0)
  const [showSubmitModal, setShowSubmitModal] = useState(false)
  const [showWarningModal, setShowWarningModal] = useState(false)

  useEffect(() => {
    fetchTest()
  }, [testId])

  useEffect(() => {
    if (test && timeLeft > 0) {
      const timer = setInterval(() => {
        setTimeLeft((prev) => {
          if (prev <= 1) {
            clearInterval(timer)
            handleSubmit()
            return 0
          }
          return prev - 1
        })
      }, 1000)
      return () => clearInterval(timer)
    }
  }, [test, timeLeft])

  const fetchTest = async () => {
    try {
      const response = await api.get(`/tests/${testId}`)
      setTest(response.data)
      setTimeLeft(response.data.duration * 60)
      setVisited({ 0: true })
    } catch (error) {
      console.error('Failed to fetch test:', error)
      toast.error('Failed to load test')
      navigate('/tests')
    } finally {
      setLoading(false)
    }
  }

  const handleAnswer = (option) => {
    setAnswers({ ...answers, [currentQuestion]: option })
  }

  const handleMarkForReview = () => {
    setMarkedForReview({
      ...markedForReview,
      [currentQuestion]: !markedForReview[currentQuestion]
    })
  }

  const handlePrevious = () => {
    if (currentQuestion > 0) {
      const newIndex = currentQuestion - 1
      setCurrentQuestion(newIndex)
      setVisited({ ...visited, [newIndex]: true })
    }
  }

  const handleNext = () => {
    if (currentQuestion < test.questions.length - 1) {
      const newIndex = currentQuestion + 1
      setCurrentQuestion(newIndex)
      setVisited({ ...visited, [newIndex]: true })
    }
  }

  const handleQuestionJump = (index) => {
    setCurrentQuestion(index)
    setVisited({ ...visited, [index]: true })
  }

  const handleSubmit = () => {
    setShowSubmitModal(true)
  }

  const confirmSubmit = async () => {
    try {
      const unansweredCount = test.questions.length - Object.keys(answers).length
      if (unansweredCount > 0 && !showWarningModal) {
        setShowSubmitModal(false)
        setShowWarningModal(true)
        return
      }

      const response = await api.post(`/tests/${testId}/submit`, {
        answers,
        markedForReview
      })
      
      toast.success('Test submitted successfully!')
      navigate(`/tests/${testId}/result`, { state: { result: response.data } })
    } catch (error) {
      console.error('Failed to submit test:', error)
      toast.error('Failed to submit test')
    }
  }

  const formatTime = (seconds) => {
    const mins = Math.floor(seconds / 60)
    const secs = seconds % 60
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`
  }

  const getQuestionStatus = (index) => {
    if (markedForReview[index]) return 'review'
    if (answers[index] !== undefined) return 'answered'
    if (visited[index]) return 'visited'
    return 'not-visited'
  }

  const getQuestionColor = (status) => {
    switch (status) {
      case 'answered':
        return 'bg-green-500 text-white border-green-500'
      case 'review':
        return 'bg-yellow-500 text-white border-yellow-500'
      case 'visited':
        return 'bg-gray-300 dark:bg-gray-600 text-gray-700 dark:text-gray-300 border-gray-300 dark:border-gray-600'
      default:
        return 'bg-gray-100 dark:bg-gray-700 text-gray-500 dark:text-gray-400 border-gray-200 dark:border-gray-700'
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
      </div>
    )
  }

  if (!test) {
    return null
  }

  const question = test.questions[currentQuestion]
  const isTimeRunningOut = timeLeft < 300 // 5 minutes

  return (
    <div className="flex flex-col lg:flex-row gap-6">
      {/* Main Question Area */}
      <div className="flex-1">
        {/* Timer Header */}
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-4 mb-6 sticky top-20 z-10 shadow-sm">
          <div className="flex items-center justify-between">
            <div>
              <h2 className="text-lg font-semibold text-gray-900 dark:text-white">
                {test.name}
              </h2>
              <p className="text-sm text-gray-600 dark:text-gray-400">
                Question {currentQuestion + 1} of {test.questions.length}
              </p>
            </div>
            <div className={`flex items-center gap-2 px-4 py-2 rounded-lg font-mono text-lg font-semibold ${
              isTimeRunningOut 
                ? 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300' 
                : 'bg-indigo-100 text-indigo-800 dark:bg-indigo-900 dark:text-indigo-300'
            }`}>
              <Clock className="h-5 w-5" />
              {formatTime(timeLeft)}
            </div>
          </div>
        </div>

        {/* Question Card */}
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm mb-6">
          <div className="mb-6">
            <p className="text-lg text-gray-900 dark:text-white leading-relaxed">
              {question.questionText}
            </p>
          </div>

          {/* Options */}
          <div className="space-y-3">
            {question.options && question.options.map((option, index) => (
              <button
                key={index}
                onClick={() => handleAnswer(option.optionLetter)}
                className={`w-full p-4 rounded-lg border-2 text-left transition-all ${
                  answers[currentQuestion] === option.optionLetter
                    ? 'border-indigo-600 bg-indigo-50 dark:bg-indigo-900/20'
                    : 'border-gray-200 dark:border-gray-700 hover:border-gray-300 dark:hover:border-gray-600'
                }`}
              >
                <div className="flex items-start gap-3">
                  <div className={`w-8 h-8 rounded-full flex items-center justify-center font-semibold text-sm ${
                    answers[currentQuestion] === option.optionLetter
                      ? 'bg-indigo-600 text-white'
                      : 'bg-gray-100 dark:bg-gray-700 text-gray-600 dark:text-gray-400'
                  }`}>
                    {option.optionLetter}
                  </div>
                  <p className="text-gray-700 dark:text-gray-300 flex-1">
                    {option.optionText}
                  </p>
                  {answers[currentQuestion] === option.optionLetter && (
                    <CheckCircle2 className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
                  )}
                </div>
              </button>
            ))}
          </div>
        </div>

        {/* Navigation Buttons */}
        <div className="flex items-center justify-between">
          <button
            onClick={handlePrevious}
            disabled={currentQuestion === 0}
            className="flex items-center gap-2 px-6 py-2.5 rounded-lg font-medium transition-colors disabled:opacity-50 disabled:cursor-not-allowed bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-700"
          >
            <ChevronLeft className="h-5 w-5" />
            Previous
          </button>

          <div className="flex items-center gap-3">
            <button
              onClick={handleMarkForReview}
              className={`flex items-center gap-2 px-4 py-2.5 rounded-lg font-medium transition-colors ${
                markedForReview[currentQuestion]
                  ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300'
                  : 'bg-gray-100 dark:bg-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-200 dark:hover:bg-gray-600'
              }`}
            >
              <Bookmark className={`h-5 w-5 ${markedForReview[currentQuestion] ? 'fill-current' : ''}`} />
              {markedForReview[currentQuestion] ? 'Marked' : 'Mark for Review'}
            </button>
          </div>

          {currentQuestion === test.questions.length - 1 ? (
            <button
              onClick={handleSubmit}
              className="flex items-center gap-2 px-6 py-2.5 rounded-lg font-medium transition-colors bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white"
            >
              Submit Test
            </button>
          ) : (
            <button
              onClick={handleNext}
              className="flex items-center gap-2 px-6 py-2.5 rounded-lg font-medium transition-colors bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white"
            >
              Next
              <ChevronRight className="h-5 w-5" />
            </button>
          )}
        </div>
      </div>

      {/* Question Navigator Sidebar */}
      <div className="lg:w-72">
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-4 shadow-sm sticky top-20">
          <h3 className="font-semibold text-gray-900 dark:text-white mb-4">
            Question Navigator
          </h3>

          {/* Legend */}
          <div className="grid grid-cols-2 gap-2 mb-4 text-xs">
            <div className="flex items-center gap-2">
              <div className="w-4 h-4 rounded bg-green-500"></div>
              <span className="text-gray-600 dark:text-gray-400">Answered</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-4 h-4 rounded bg-yellow-500"></div>
              <span className="text-gray-600 dark:text-gray-400">Review</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-4 h-4 rounded bg-gray-300 dark:bg-gray-600"></div>
              <span className="text-gray-600 dark:text-gray-400">Visited</span>
            </div>
            <div className="flex items-center gap-2">
              <div className="w-4 h-4 rounded bg-gray-100 dark:bg-gray-700"></div>
              <span className="text-gray-600 dark:text-gray-400">Not Visited</span>
            </div>
          </div>

          {/* Question Grid */}
          <div className="grid grid-cols-5 gap-2">
            {test.questions.map((_, index) => (
              <button
                key={index}
                onClick={() => handleQuestionJump(index)}
                className={`w-10 h-10 rounded-lg text-sm font-medium transition-all border-2 ${
                  currentQuestion === index
                    ? 'ring-2 ring-indigo-600 ring-offset-2 dark:ring-offset-gray-800'
                    : ''
                } ${getQuestionColor(getQuestionStatus(index))}`}
              >
                {index + 1}
              </button>
            ))}
          </div>

          {/* Stats */}
          <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700 space-y-2 text-sm">
            <div className="flex justify-between text-gray-600 dark:text-gray-400">
              <span>Answered:</span>
              <span className="font-semibold text-gray-900 dark:text-white">
                {Object.keys(answers).length}
              </span>
            </div>
            <div className="flex justify-between text-gray-600 dark:text-gray-400">
              <span>Marked for Review:</span>
              <span className="font-semibold text-gray-900 dark:text-white">
                {Object.keys(markedForReview).filter(k => markedForReview[k]).length}
              </span>
            </div>
            <div className="flex justify-between text-gray-600 dark:text-gray-400">
              <span>Remaining:</span>
              <span className="font-semibold text-gray-900 dark:text-white">
                {test.questions.length - Object.keys(answers).length}
              </span>
            </div>
          </div>
        </div>
      </div>

      {/* Submit Confirmation Modal */}
      {showSubmitModal && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white dark:bg-gray-800 rounded-2xl border border-gray-200 dark:border-gray-700 p-6 max-w-md w-full shadow-xl">
            <div className="flex items-center gap-3 mb-4">
              <div className="p-3 bg-indigo-100 dark:bg-indigo-900 rounded-full">
                <AlertCircle className="h-6 w-6 text-indigo-600 dark:text-indigo-400" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                Submit Test?
              </h3>
            </div>

            <div className="space-y-3 mb-6 text-sm text-gray-600 dark:text-gray-400">
              <p>• Answered: {Object.keys(answers).length} questions</p>
              <p>• Unanswered: {test.questions.length - Object.keys(answers).length} questions</p>
              <p>• Marked for Review: {Object.keys(markedForReview).filter(k => markedForReview[k]).length} questions</p>
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => setShowSubmitModal(false)}
                className="flex-1 bg-gray-100 hover:bg-gray-200 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-900 dark:text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Continue
              </button>
              <button
                onClick={confirmSubmit}
                className="flex-1 bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Submit
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Warning Modal */}
      {showWarningModal && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-center justify-center p-4">
          <div className="bg-white dark:bg-gray-800 rounded-2xl border border-gray-200 dark:border-gray-700 p-6 max-w-md w-full shadow-xl">
            <div className="flex items-center gap-3 mb-4">
              <div className="p-3 bg-yellow-100 dark:bg-yellow-900 rounded-full">
                <AlertCircle className="h-6 w-6 text-yellow-600 dark:text-yellow-400" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                Unanswered Questions
              </h3>
            </div>

            <p className="text-gray-600 dark:text-gray-400 mb-6">
              You have {test.questions.length - Object.keys(answers).length} unanswered questions. Are you sure you want to submit?
            </p>

            <div className="flex gap-3">
              <button
                onClick={() => {
                  setShowWarningModal(false)
                  setShowSubmitModal(true)
                }}
                className="flex-1 bg-gray-100 hover:bg-gray-200 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-900 dark:text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Go Back
              </button>
              <button
                onClick={() => {
                  setShowWarningModal(false)
                  setShowSubmitModal(true)
                  confirmSubmit()
                }}
                className="flex-1 bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Submit Anyway
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

export default TestTaking
