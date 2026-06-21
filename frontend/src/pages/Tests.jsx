import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'
import { Clock, FileText, AlertCircle, Loader2, Filter } from 'lucide-react'
import toast from 'react-hot-toast'

const Tests = () => {
  const { user } = useAuth()
  const { darkMode } = useTheme()
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [tests, setTests] = useState([])
  const [filter, setFilter] = useState('all')
  const [showStartModal, setShowStartModal] = useState(false)
  const [selectedTest, setSelectedTest] = useState(null)

  useEffect(() => {
    fetchTests()
  }, [])

  const fetchTests = async () => {
    try {
      const response = await api.get('/tests')
      setTests(response.data)
    } catch (error) {
      console.error('Failed to fetch tests:', error)
      toast.error('Failed to load tests')
    } finally {
      setLoading(false)
    }
  }

  const filteredTests = tests.filter(test => {
    if (filter === 'all') return true
    return test.section?.toLowerCase() === filter.toLowerCase()
  })

  const handleStartTest = (test) => {
    setSelectedTest(test)
    setShowStartModal(true)
  }

  const confirmStartTest = () => {
    setShowStartModal(false)
    navigate(`/tests/${selectedTest.id}`)
  }

  const getDifficultyColor = (difficulty) => {
    switch (difficulty?.toLowerCase()) {
      case 'easy':
        return 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-300'
      case 'medium':
        return 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-300'
      case 'hard':
        return 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-300'
      default:
        return 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300'
    }
  }

  const getSectionColor = (section) => {
    switch (section?.toLowerCase()) {
      case 'quantitative':
        return 'bg-indigo-100 text-indigo-800 dark:bg-indigo-900 dark:text-indigo-300'
      case 'logical':
        return 'bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-300'
      case 'data interpretation':
      case 'di':
        return 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-300'
      default:
        return 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-300'
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <Loader2 className="h-8 w-8 animate-spin text-indigo-600 dark:text-indigo-400" />
      </div>
    )
  }

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
          Timed Tests
        </h1>
        <p className="text-gray-600 dark:text-gray-400">
          Challenge yourself with timed tests to improve your speed and accuracy
        </p>
      </div>

      {/* Filter */}
      <div className="flex items-center gap-4">
        <Filter className="h-5 w-5 text-gray-500 dark:text-gray-400 flex-shrink-0" />
        <div className="flex overflow-x-auto gap-2 scrollbar-hide pb-1">
          {['all', 'quantitative', 'logical', 'di'].map((f) => (
            <button
              key={f}
              onClick={() => setFilter(f)}
              className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors flex-shrink-0 ${
                filter === f
                  ? 'bg-indigo-600 text-white dark:bg-indigo-500'
                  : 'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 border border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700'
              }`}
            >
              {f.charAt(0).toUpperCase() + f.slice(1)}
            </button>
          ))}
        </div>
      </div>


      {/* Tests Grid */}
      {filteredTests.length === 0 ? (
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-12 text-center">
          <FileText className="h-12 w-12 text-gray-400 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
            No tests available
          </h3>
          <p className="text-gray-600 dark:text-gray-400">
            {filter === 'all' ? 'Check back later for new tests' : `No tests found for ${filter}`}
          </p>
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredTests.map((test) => (
            <div
              key={test.id}
              className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-6 shadow-sm hover:shadow-md transition-shadow"
            >
              <div className="flex items-start justify-between mb-4">
                <div>
                  <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
                    {test.name}
                  </h3>
                  <div className="flex gap-2 flex-wrap">
                    <span className={`px-2 py-1 rounded-full text-xs font-medium ${getSectionColor(test.section)}`}>
                      {test.section}
                    </span>
                    <span className={`px-2 py-1 rounded-full text-xs font-medium ${getDifficultyColor(test.difficulty)}`}>
                      {test.difficulty}
                    </span>
                  </div>
                </div>
              </div>

              <div className="space-y-3 mb-6">
                <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
                  <FileText className="h-4 w-4" />
                  <span>{test.totalQuestions || test.questionCount || 0} questions</span>
                </div>
                <div className="flex items-center gap-2 text-sm text-gray-600 dark:text-gray-400">
                  <Clock className="h-4 w-4" />
                  <span>{test.duration || 0} minutes</span>
                </div>
              </div>

              <button
                onClick={() => handleStartTest(test)}
                className="w-full bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Start Test
              </button>
            </div>
          ))}
        </div>
      )}

      {/* Start Test Confirmation Modal */}
      {showStartModal && selectedTest && (
        <div className="fixed inset-0 bg-black/50 backdrop-blur-sm z-50 flex items-end sm:items-center justify-center p-0 sm:p-4">
          <div className="bg-white dark:bg-gray-800 rounded-t-2xl sm:rounded-2xl border border-gray-200 dark:border-gray-700 p-6 max-w-md w-full shadow-xl max-h-[90vh] overflow-y-auto">
            <div className="flex items-center gap-3 mb-4">
              <div className="p-3 bg-indigo-100 dark:bg-indigo-900 rounded-full">
                <AlertCircle className="h-6 w-6 text-indigo-600 dark:text-indigo-400" />
              </div>
              <h3 className="text-xl font-semibold text-gray-900 dark:text-white">
                Ready to start?
              </h3>
            </div>

            <div className="space-y-4 mb-6">
              <div className="bg-gray-50 dark:bg-gray-900 rounded-lg p-4">
                <h4 className="font-semibold text-gray-900 dark:text-white mb-2">
                  {selectedTest.name}
                </h4>
                <div className="space-y-2 text-sm text-gray-600 dark:text-gray-400">
                  <p>• {selectedTest.totalQuestions || selectedTest.questionCount || 0} questions</p>
                  <p>• {selectedTest.duration || 0} minutes</p>
                  <p>• Section: {selectedTest.section}</p>
                </div>
              </div>

              <div className="space-y-2 text-sm text-gray-600 dark:text-gray-400">
                <p className="font-semibold text-gray-900 dark:text-white">Rules:</p>
                <p>• Timer will start as soon as you begin</p>
                <p>• Test will auto-submit when time expires</p>
                <p>• You cannot go back to previous questions</p>
                <p>• Make sure you have a stable internet connection</p>
              </div>
            </div>

            <div className="flex gap-3">
              <button
                onClick={() => setShowStartModal(false)}
                className="flex-1 bg-gray-100 hover:bg-gray-200 dark:bg-gray-700 dark:hover:bg-gray-600 text-gray-900 dark:text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Cancel
              </button>
              <button
                onClick={confirmStartTest}
                className="flex-1 bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white font-medium py-2.5 px-4 rounded-lg transition-colors"
              >
                Start Now
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

export default Tests
