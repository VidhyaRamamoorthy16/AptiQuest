import { useEffect, useState } from 'react'
import { Link } from 'react-router-dom'
import api from '../services/api'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'
import { Bookmark, Filter, Loader2, BookOpen, Trash2, Star } from 'lucide-react'
import toast from 'react-hot-toast'

const Bookmarks = () => {
  const { user } = useAuth()
  const { darkMode } = useTheme()
  const [loading, setLoading] = useState(true)
  const [bookmarks, setBookmarks] = useState([])
  const [filter, setFilter] = useState('all')

  useEffect(() => {
    fetchBookmarks()
  }, [])

  const fetchBookmarks = async () => {
    try {
      const response = await api.get('/bookmarks')
      setBookmarks(response.data)
    } catch (error) {
      console.error('Failed to fetch bookmarks:', error)
      toast.error('Failed to load bookmarks')
    } finally {
      setLoading(false)
    }
  }

  const handleRemoveBookmark = async (questionId) => {
    try {
      await api.delete(`/bookmarks/${questionId}`)
      toast.success('Bookmark removed')
      setBookmarks(bookmarks.filter(b => b.questionId !== questionId))
    } catch (error) {
      console.error('Failed to remove bookmark:', error)
      toast.error('Failed to remove bookmark')
    }
  }

  const filteredBookmarks = filter === 'all' 
    ? bookmarks 
    : bookmarks.filter(b => b.topic === filter)

  const topics = [...new Set(bookmarks.map(b => b.topic).filter(Boolean))]

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

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <Loader2 className="h-8 w-8 animate-spin text-indigo-600 dark:text-indigo-400" />
      </div>
    )
  }

  return (
    <div className="space-y-6">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
          Bookmarks
        </h1>
        <p className="text-gray-600 dark:text-gray-400">
          Questions you've saved for later review
        </p>
      </div>

      {/* Filter */}
      <div className="flex items-center gap-4">
        <Filter className="h-5 w-5 text-gray-500 dark:text-gray-400 flex-shrink-0" />
        <div className="flex overflow-x-auto gap-2 scrollbar-hide pb-1">
          <button
            onClick={() => setFilter('all')}
            className={`px-4 py-2.5 rounded-lg text-sm font-medium transition-colors flex-shrink-0 min-h-[40px] ${
              filter === 'all'
                ? 'bg-indigo-600 text-white dark:bg-indigo-500'
                : 'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 border border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700'
            }`}
          >
            All Topics
          </button>
          {topics.map((topic) => (
            <button
              key={topic}
              onClick={() => setFilter(topic)}
              className={`px-4 py-2.5 rounded-lg text-sm font-medium transition-colors flex-shrink-0 min-h-[40px] ${
                filter === topic
                  ? 'bg-indigo-600 text-white dark:bg-indigo-500'
                  : 'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 border border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700'
              }`}
            >
              {topic}
            </button>
          ))}
        </div>
      </div>

      {/* Bookmarks Grid */}
      {filteredBookmarks.length === 0 ? (
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-12 text-center">
          <Star className="h-16 w-16 text-gray-400 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
            {filter === 'all' ? 'No bookmarks yet' : `No bookmarks for ${filter}`}
          </h3>
          <p className="text-gray-600 dark:text-gray-400 mb-6">
            {filter === 'all' 
              ? 'Bookmark questions while practicing to see them here'
              : 'Try a different topic filter'}
          </p>
          {filter === 'all' && (
            <Link
              to="/practice"
              className="inline-flex items-center gap-2 px-6 py-3 bg-indigo-600 hover:bg-indigo-700 dark:bg-indigo-500 dark:hover:bg-indigo-600 text-white rounded-lg font-medium transition-colors min-h-[44px]"
            >
              <BookOpen className="h-5 w-5" />
              Start Practicing
            </Link>
          )}
        </div>
      ) : (
        <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 gap-6">
          {filteredBookmarks.map((bookmark) => (
            <div
              key={bookmark.questionId}
              className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-4 sm:p-6 shadow-sm hover:shadow-md transition-shadow"
            >
              <div className="flex items-start justify-between mb-4">
                <div className="flex-1">
                  <div className="flex gap-2 flex-wrap mb-2">
                    <span className="px-2 py-1 rounded-full text-xs font-medium bg-indigo-100 text-indigo-800 dark:bg-indigo-900 dark:text-indigo-300">
                      {bookmark.topic}
                    </span>
                    <span className={`px-2 py-1 rounded-full text-xs font-medium ${getDifficultyColor(bookmark.difficulty)}`}>
                      {bookmark.difficulty}
                    </span>
                  </div>
                </div>
                <button
                  onClick={() => handleRemoveBookmark(bookmark.questionId)}
                  className="p-2 rounded-lg hover:bg-red-100 dark:hover:bg-red-900/30 text-red-600 dark:text-red-400 transition-colors min-h-[36px] min-w-[36px] flex items-center justify-center flex-shrink-0"
                  title="Remove bookmark"
                >
                  <Trash2 className="h-4 w-4" />
                </button>
              </div>

              <p className="text-gray-900 dark:text-white mb-4 line-clamp-3">
                {bookmark.questionText}
              </p>

              <div className="flex items-center justify-between pt-4 border-t border-gray-200 dark:border-gray-700">
                <span className="text-xs text-gray-500 dark:text-gray-400">
                  Bookmarked {new Date(bookmark.bookmarkedAt).toLocaleDateString()}
                </span>
                <Link
                  to={`/question/${bookmark.questionId}`}
                  className="inline-flex items-center gap-2 px-3 py-2 text-sm font-medium text-indigo-600 dark:text-indigo-400 hover:bg-indigo-50 dark:hover:bg-indigo-900/20 rounded-lg transition-colors min-h-[40px]"
                >
                  <BookOpen className="h-4 w-4" />
                  Practice
                </Link>
              </div>
            </div>
          ))}
        </div>
      )}
    </div>
  )
}

export default Bookmarks
