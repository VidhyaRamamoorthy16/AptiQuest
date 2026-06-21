import { useEffect, useState } from 'react'
import { useParams, useNavigate, useLocation } from 'react-router-dom'
import api from '../services/api'
import { useTheme } from '../context/ThemeContext'
import { ArrowLeft, CheckCircle2, XCircle, Clock, Target, TrendingUp, RotateCcw, BookOpen } from 'lucide-react'
import toast from 'react-hot-toast'

const TestResult = () => {
  const { testId } = useParams()
  const navigate = useNavigate()
  const location = useLocation()
  const { darkMode } = useTheme()
  const [loading, setLoading] = useState(true)
  const [result, setResult] = useState(null)
  const [test, setTest] = useState(null)

  useEffect(() => {
    if (location.state?.result) {
      setResult(location.state.result)
      setLoading(false)
    } else {
      fetchResult()
    }
    fetchTestDetails()
  }, [testId, location])

  const fetchResult = async () => {
    try {
      const response = await api.get(`/tests/${testId}/result`)
      setResult(response.data)
    } catch (error) {
      console.error('Failed to fetch result:', error)
      toast.error('Failed to load result')
    } finally {
      setLoading(false)
    }
  }

  const fetchTestDetails = async () => {
    try {
      const response = await api.get(`/tests/${testId}`)
      setTest(response.data)
    } catch (error) {
      console.error('Failed to fetch test details:', error)
    }
  }

  const getScoreColor = (percentage) => {
    if (percentage >= 80) return 'text-green-600 dark:text-green-400'
    if (percentage >= 60) return 'text-yellow-600 dark:text-yellow-400'
    return 'text-red-600 dark:text-red-400'
  }

  const getScoreBgColor = (percentage) => {
    if (percentage >= 80) return 'bg-green-100 dark:bg-green-900/30'
    if (percentage >= 60) return 'bg-yellow-100 dark:bg-yellow-900/30'
    return 'bg-red-100 dark:bg-red-900/30'
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600"></div>
      </div>
    )
  }

  if (!result) {
    return null
  }

  const accuracy = result.totalQuestions > 0 
    ? ((result.correct / result.totalQuestions) * 100).toFixed(1) 
    : 0
  const circumference = 2 * Math.PI * 54
  const strokeDashoffset = circumference - (accuracy / 100) * circumference

  return (
    <div className="space-y-6">
      {/* Header */}
      <div className="flex items-center justify-between">
        <div>
          <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
            Test Results
          </h1>
          <p className="text-gray-600 dark:text-gray-400">
            {test?.name || 'Test'} - {result.totalQuestions} Questions
          </p>
        </div>
        <button
          onClick={() => navigate('/tests')}
          className="flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-colors bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-700"
        >
          <ArrowLeft className="h-5 w-5" />
          Back to Tests
        </button>
      </div>

      {/* Score Summary */}
      <div className="grid md:grid-cols-4 gap-4">
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <CheckCircle2 className="h-5 w-5 text-green-600 dark:text-green-400" />
            <span className="text-xs text-gray-500 dark:text-gray-400">Correct</span>
          </div>
          <div className="text-2xl font-bold text-gray-900 dark:text-white">
            {result.correct}
          </div>
          <div className="text-sm text-gray-600 dark:text-gray-400">Correct Answers</div>
        </div>

        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <XCircle className="h-5 w-5 text-red-600 dark:text-red-400" />
            <span className="text-xs text-gray-500 dark:text-gray-400">Wrong</span>
          </div>
          <div className="text-2xl font-bold text-gray-900 dark:text-white">
            {result.wrong}
          </div>
          <div className="text-sm text-gray-600 dark:text-gray-400">Wrong Answers</div>
        </div>

        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <Target className="h-5 w-5 text-gray-600 dark:text-gray-400" />
            <span className="text-xs text-gray-500 dark:text-gray-400">Skipped</span>
          </div>
          <div className="text-2xl font-bold text-gray-900 dark:text-white">
            {result.skipped}
          </div>
          <div className="text-sm text-gray-600 dark:text-gray-400">Skipped Questions</div>
        </div>

        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <Clock className="h-5 w-5 text-blue-600 dark:text-blue-400" />
            <span className="text-xs text-gray-500 dark:text-gray-400">Time</span>
          </div>
          <div className="text-2xl font-bold text-gray-900 dark:text-white">
            {result.timeTaken || 'N/A'}
          </div>
          <div className="text-sm text-gray-600 dark:text-gray-400">Time Taken</div>
        </div>
      </div>

      {/* Accuracy Circle */}
      <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-8 shadow-sm">
        <div className="flex flex-col md:flex-row items-center gap-8">
          <div className="relative">
            <svg className="w-36 h-36 transform -rotate-90">
              <circle
                cx="72"
                cy="72"
                r="54"
                stroke={darkMode ? '#374151' : '#e5e7eb'}
                strokeWidth="12"
                fill="none"
              />
              <circle
                cx="72"
                cy="72"
                r="54"
                stroke={accuracy >= 80 ? '#22c55e' : accuracy >= 60 ? '#eab308' : '#ef4444'}
                strokeWidth="12"
                fill="none"
                strokeLinecap="round"
                strokeDasharray={circumference}
                strokeDashoffset={strokeDashoffset}
                className="transition-all duration-1000 ease-out"
              />
            </svg>
            <div className="absolute inset-0 flex items-center justify-center">
              <div className="text-center">
                <div className={`text-3xl font-bold ${getScoreColor(accuracy)}`}>
                  {accuracy}%
                </div>
                <div className="text-xs text-gray-500 dark:text-gray-400">Accuracy</div>
              </div>
            </div>
          </div>

          <div className="flex-1 space-y-4">
            <div>
              <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
                Performance Summary
              </h3>
              <p className="text-gray-600 dark:text-gray-400">
                {accuracy >= 80 
                  ? 'Excellent performance! You have a strong grasp of the concepts.'
                  : accuracy >= 60 
                  ? 'Good effort! Keep practicing to improve further.'
                  : 'Keep practicing! Review the explanations below to understand the concepts better.'}
              </p>
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => navigate(`/tests/${testId}`)}
                className="flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-colors bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white"
              >
                <RotateCcw className="h-4 w-4" />
                Retake Test
              </button>
              <button
                onClick={() => navigate('/practice')}
                className="flex items-center gap-2 px-4 py-2 rounded-lg font-medium transition-colors bg-white dark:bg-gray-700 border border-gray-200 dark:border-gray-600 text-gray-700 dark:text-gray-300 hover:bg-gray-50 dark:hover:bg-gray-600"
              >
                <BookOpen className="h-4 w-4" />
                Practice More
              </button>
            </div>
          </div>
        </div>
      </div>

      {/* Question Review */}
      <div>
        <h2 className="text-2xl font-bold text-gray-900 dark:text-white mb-4">
          Question Review
        </h2>
        <div className="space-y-4">
          {result.answers?.map((answer, index) => {
            const isCorrect = answer.isCorrect
            const question = answer.question
            
            return (
              <div
                key={index}
                className={`bg-white dark:bg-gray-800 rounded-xl border ${
                  isCorrect 
                    ? 'border-green-200 dark:border-green-800' 
                    : 'border-red-200 dark:border-red-800'
                } p-6 shadow-sm`}
              >
                <div className="flex items-start gap-4">
                  <div className={`p-2 rounded-full ${
                    isCorrect 
                      ? 'bg-green-100 dark:bg-green-900/30' 
                      : 'bg-red-100 dark:bg-red-900/30'
                  }`}>
                    {isCorrect ? (
                      <CheckCircle2 className="h-5 w-5 text-green-600 dark:text-green-400" />
                    ) : (
                      <XCircle className="h-5 w-5 text-red-600 dark:text-red-400" />
                    )}
                  </div>
                  
                  <div className="flex-1">
                    <div className="flex items-center gap-2 mb-3">
                      <span className="text-sm font-medium text-gray-500 dark:text-gray-400">
                        Question {index + 1}
                      </span>
                      {isCorrect ? (
                        <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300">
                          Correct
                        </span>
                      ) : (
                        <span className="px-2 py-0.5 rounded-full text-xs font-medium bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300">
                          Incorrect
                        </span>
                      )}
                    </div>

                    <p className="text-gray-900 dark:text-white mb-4">
                      {question?.questionText}
                    </p>

                    <div className="space-y-2 mb-4">
                      {question?.options?.map((option, optIndex) => (
                        <div
                          key={optIndex}
                          className={`p-3 rounded-lg border-2 ${
                            option.optionLetter === answer.selectedOption
                              ? 'border-indigo-600 bg-indigo-50 dark:bg-indigo-900/20'
                              : option.optionLetter === answer.correctOption
                              ? 'border-green-600 bg-green-50 dark:bg-green-900/20'
                              : 'border-gray-200 dark:border-gray-700'
                          }`}
                        >
                          <div className="flex items-start gap-2">
                            <span className="font-semibold text-gray-700 dark:text-gray-300">
                              {option.optionLetter}.
                            </span>
                            <span className="text-gray-700 dark:text-gray-300">
                              {option.optionText}
                            </span>
                            {option.optionLetter === answer.correctOption && (
                              <CheckCircle2 className="h-4 w-4 text-green-600 dark:text-green-400 ml-auto" />
                            )}
                          </div>
                        </div>
                      ))}
                    </div>

                    {!isCorrect && question?.explanation && (
                      <div className="bg-gray-50 dark:bg-gray-900 rounded-lg p-4">
                        <h4 className="font-semibold text-gray-900 dark:text-white mb-2">
                          Explanation:
                        </h4>
                        <p className="text-gray-600 dark:text-gray-400 text-sm">
                          {question.explanation}
                        </p>
                      </div>
                    )}
                  </div>
                </div>
              </div>
            )
          })}
        </div>
      </div>
    </div>
  )
}

export default TestResult
