import { useEffect, useState } from 'react'
import api from '../services/api'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'
import { Trophy, Medal, Award, Crown, Loader2, TrendingUp } from 'lucide-react'

const Leaderboard = () => {
  const { user } = useAuth()
  const { darkMode } = useTheme()
  const [loading, setLoading] = useState(true)
  const [leaderboard, setLeaderboard] = useState([])
  const [filter, setFilter] = useState('all')

  useEffect(() => {
    fetchLeaderboard()
  }, [filter])

  const fetchLeaderboard = async () => {
    try {
      const response = await api.get(`/leaderboard?period=${filter}`)
      setLeaderboard(response.data)
    } catch (error) {
      console.error('Failed to fetch leaderboard:', error)
    } finally {
      setLoading(false)
    }
  }

  const getInitials = (username) => {
    return username
      .split(' ')
      .map(word => word[0])
      .join('')
      .toUpperCase()
      .slice(0, 2)
  }

  const getRankIcon = (rank) => {
    switch (rank) {
      case 1:
        return <Crown className="h-6 w-6 text-yellow-500" />
      case 2:
        return <Medal className="h-6 w-6 text-gray-400" />
      case 3:
        return <Award className="h-6 w-6 text-amber-600" />
      default:
        return <span className="text-lg font-bold text-gray-600 dark:text-gray-400">#{rank}</span>
    }
  }

  const getRankStyle = (rank) => {
    switch (rank) {
      case 1:
        return 'bg-gradient-to-br from-yellow-400 to-yellow-600 text-white border-yellow-500'
      case 2:
        return 'bg-gradient-to-br from-gray-300 to-gray-500 text-white border-gray-400'
      case 3:
        return 'bg-gradient-to-br from-amber-500 to-amber-700 text-white border-amber-600'
      default:
        return 'bg-white dark:bg-gray-800 border-gray-200 dark:border-gray-700'
    }
  }

  const getPodiumHeight = (rank) => {
    switch (rank) {
      case 1:
        return 'h-32'
      case 2:
        return 'h-24'
      case 3:
        return 'h-20'
      default:
        return 'h-16'
    }
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <Loader2 className="h-8 w-8 animate-spin text-indigo-600 dark:text-indigo-400" />
      </div>
    )
  }

  const top3 = leaderboard.slice(0, 3)
  const remaining = leaderboard.slice(3)

  return (
    <div className="space-y-6">
      <div>
        <h1 className="text-3xl font-bold text-gray-900 dark:text-white mb-2">
          Leaderboard
        </h1>
        <p className="text-gray-600 dark:text-gray-400">
          See how you rank against other top performers
        </p>
      </div>

      {/* Filter Tabs */}
      <div className="flex overflow-x-auto gap-2 pb-1 scrollbar-hide">
        {['all', 'week', 'month'].map((period) => (
          <button
            key={period}
            onClick={() => setFilter(period)}
            className={`px-4 py-2 rounded-lg text-sm font-medium transition-colors flex-shrink-0 ${
              filter === period
                ? 'bg-indigo-600 text-white dark:bg-indigo-500'
                : 'bg-white dark:bg-gray-800 text-gray-700 dark:text-gray-300 border border-gray-200 dark:border-gray-700 hover:bg-gray-50 dark:hover:bg-gray-700'
            }`}
          >
            {period.charAt(0).toUpperCase() + period.slice(1)} Time
          </button>
        ))}
      </div>


      {leaderboard.length === 0 ? (
        <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-12 text-center">
          <Trophy className="h-12 w-12 text-gray-400 mx-auto mb-4" />
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white mb-2">
            No leaderboard data yet
          </h3>
          <p className="text-gray-600 dark:text-gray-400">
            Complete tests to appear on the leaderboard!
          </p>
        </div>
      ) : (
        <>
          {/* Top 3 Podium */}
          {top3.length > 0 && (
            <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 p-4 sm:p-8 shadow-sm">
              <div className="flex items-end justify-center gap-2 sm:gap-8">
                {/* 2nd Place */}
                {top3[1] && (
                  <div className="flex flex-col items-center">
                    <div className={`w-12 h-12 xs:w-16 xs:h-16 md:w-20 md:h-20 rounded-full flex items-center justify-center text-sm xs:text-xl font-bold mb-4 ${getRankStyle(2)}`}>
                      {getInitials(top3[1].username)}
                    </div>
                    <div className={`w-16 xs:w-20 md:w-24 ${getPodiumHeight(2)} bg-gradient-to-t from-gray-300 to-gray-400 rounded-t-lg flex items-end justify-center pb-2`}>
                      <span className="text-white font-bold text-sm xs:text-lg">2</span>
                    </div>
                    <p className="mt-2 font-semibold text-gray-900 dark:text-white text-xs xs:text-sm md:text-base max-w-[80px] xs:max-w-[100px] truncate text-center">
                      {top3[1].username}
                    </p>
                    <p className="text-[10px] xs:text-xs text-gray-500 dark:text-gray-400">
                      {top3[1].score} pts
                    </p>
                  </div>
                )}

                {/* 1st Place */}
                {top3[0] && (
                  <div className="flex flex-col items-center">
                    <Crown className="h-6 w-6 xs:h-8 xs:w-8 text-yellow-500 mb-1 xs:mb-2" />
                    <div className={`w-16 h-16 xs:w-20 xs:h-20 md:w-24 md:h-24 rounded-full flex items-center justify-center text-base xs:text-2xl font-bold mb-4 ${getRankStyle(1)}`}>
                      {getInitials(top3[0].username)}
                    </div>
                    <div className={`w-20 xs:w-24 md:w-28 ${getPodiumHeight(1)} bg-gradient-to-t from-yellow-400 to-yellow-600 rounded-t-lg flex items-end justify-center pb-2`}>
                      <span className="text-white font-bold text-base xs:text-xl">1</span>
                    </div>
                    <p className="mt-2 font-semibold text-gray-900 dark:text-white text-sm xs:text-base md:text-lg max-w-[90px] xs:max-w-[110px] truncate text-center">
                      {top3[0].username}
                    </p>
                    <p className="text-xs xs:text-sm text-gray-500 dark:text-gray-400">
                      {top3[0].score} pts
                    </p>
                  </div>
                )}

                {/* 3rd Place */}
                {top3[2] && (
                  <div className="flex flex-col items-center">
                    <div className={`w-12 h-12 xs:w-16 xs:h-16 md:w-20 md:h-20 rounded-full flex items-center justify-center text-sm xs:text-xl font-bold mb-4 ${getRankStyle(3)}`}>
                      {getInitials(top3[2].username)}
                    </div>
                    <div className={`w-16 xs:w-20 md:w-24 ${getPodiumHeight(3)} bg-gradient-to-t from-amber-500 to-amber-700 rounded-t-lg flex items-end justify-center pb-2`}>
                      <span className="text-white font-bold text-sm xs:text-lg">3</span>
                    </div>
                    <p className="mt-2 font-semibold text-gray-900 dark:text-white text-xs xs:text-sm md:text-base max-w-[80px] xs:max-w-[100px] truncate text-center">
                      {top3[2].username}
                    </p>
                    <p className="text-[10px] xs:text-xs text-gray-500 dark:text-gray-400">
                      {top3[2].score} pts
                    </p>
                  </div>
                )}
              </div>
            </div>
          )}


          {/* Full Leaderboard Table */}
          <div className="bg-white dark:bg-gray-800 rounded-xl border border-gray-200 dark:border-gray-700 shadow-sm overflow-hidden">
            <div className="overflow-x-auto">
              <table className="w-full">
                <thead>
                  <tr className="bg-gray-50 dark:bg-gray-900 border-b border-gray-200 dark:border-gray-700">
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-600 dark:text-gray-400 uppercase tracking-wider">
                      Rank
                    </th>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-600 dark:text-gray-400 uppercase tracking-wider">
                      User
                    </th>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-600 dark:text-gray-400 uppercase tracking-wider">
                      Score
                    </th>
                    <th className="px-6 py-4 text-left text-xs font-semibold text-gray-600 dark:text-gray-400 uppercase tracking-wider">
                      Accuracy
                    </th>
                    <th className="hidden sm:table-cell px-6 py-4 text-left text-xs font-semibold text-gray-600 dark:text-gray-400 uppercase tracking-wider">
                      Tests
                    </th>
                  </tr>
                </thead>
                <tbody className="divide-y divide-gray-200 dark:divide-gray-700">
                  {leaderboard.map((entry, index) => {
                    const isCurrentUser = entry.username === user?.name || entry.userId === user?.id
                    return (
                      <tr
                        key={index}
                        className={`transition-colors ${
                          isCurrentUser
                            ? 'bg-indigo-50 dark:bg-indigo-900/20 border-l-4 border-indigo-600'
                            : 'hover:bg-gray-50 dark:hover:bg-gray-700/50'
                        }`}
                      >
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="flex items-center">
                            {index < 3 ? (
                              <div className="flex items-center justify-center w-8 h-8">
                                {getRankIcon(entry.rank)}
                              </div>
                            ) : (
                              <span className="text-lg font-bold text-gray-600 dark:text-gray-400">
                                #{entry.rank}
                              </span>
                            )}
                          </div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="flex items-center">
                            <div className={`flex-shrink-0 h-10 w-10 rounded-full flex items-center justify-center text-sm font-semibold ${
                              index < 3 ? getRankStyle(entry.rank) : 'bg-indigo-100 dark:bg-indigo-900 text-indigo-600 dark:text-indigo-300'
                            }`}>
                              {getInitials(entry.username)}
                            </div>
                            <div className="ml-4">
                              <div className={`text-sm font-medium ${isCurrentUser ? 'text-indigo-600 dark:text-indigo-400' : 'text-gray-900 dark:text-white'}`}>
                                {entry.username}
                                {isCurrentUser && (
                                  <span className="ml-2 text-xs bg-indigo-100 text-indigo-800 dark:bg-indigo-900 dark:text-indigo-300 px-2 py-0.5 rounded-full">
                                    You
                                  </span>
                                )}
                              </div>
                            </div>
                          </div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <div className="flex items-center">
                            <TrendingUp className="h-4 w-4 text-indigo-600 dark:text-indigo-400 mr-2" />
                            <span className="text-sm font-semibold text-gray-900 dark:text-white">
                              {entry.score}
                            </span>
                          </div>
                        </td>
                        <td className="px-6 py-4 whitespace-nowrap">
                          <span className={`text-sm font-semibold ${
                            entry.accuracy >= 80
                              ? 'text-green-600 dark:text-green-400'
                              : entry.accuracy >= 60
                              ? 'text-yellow-600 dark:text-yellow-400'
                              : 'text-red-600 dark:text-red-400'
                          }`}>
                            {entry.accuracy.toFixed(1)}%
                          </span>
                        </td>
                        <td className="hidden sm:table-cell px-6 py-4 whitespace-nowrap">
                          <span className="text-sm text-gray-600 dark:text-gray-400">
                            {entry.testsCompleted}
                          </span>
                        </td>
                      </tr>
                    )
                  })}
                </tbody>
              </table>
            </div>
          </div>
        </>
      )}
    </div>
  )
}

export default Leaderboard
