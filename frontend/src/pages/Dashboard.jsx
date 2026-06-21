import { useEffect, useState, useRef } from 'react'
import { Link } from 'react-router-dom'
import api from '../services/api'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'
import { BarChart, Bar, LineChart, Line, PieChart, Pie, Cell, XAxis, YAxis, CartesianGrid, Tooltip, Legend, ResponsiveContainer } from 'recharts'
import { TrendingUp, Target, BookOpen, Award, Loader2, Sparkles, AlertCircle, Play, CheckCircle2, HelpCircle } from 'lucide-react'
import StreakBanner from '../components/StreakBanner'
import BadgeGrid from '../components/BadgeGrid'
import BadgeEarnedModal from '../components/BadgeEarnedModal'
import toast from 'react-hot-toast'

const Dashboard = () => {
  const { user } = useAuth()
  const { darkMode } = useTheme()
  const [loading, setLoading] = useState(true)
  const [stats, setStats] = useState({
    totalAttempted: 0,
    totalCorrect: 0,
    accuracy: 0,
    topicsCovered: 0
  })
  const [topicWiseStats, setTopicWiseStats] = useState([])
  const [recentActivity, setRecentActivity] = useState([])
  const [sectionStats, setSectionStats] = useState([])
  
  // Streak & Badge States
  const [streakData, setStreakData] = useState({
    currentStreak: 0,
    longestStreak: 0,
    totalPoints: 0,
    lastActiveDate: null,
    isActiveToday: false
  })
  const [badges, setBadges] = useState([])
  const [weeklyActivity, setWeeklyActivity] = useState([])
  const [earnedBadgeToShow, setEarnedBadgeToShow] = useState(null)
  const [isBadgeModalOpen, setIsBadgeModalOpen] = useState(false)
  const checkinCalledRef = useRef(false)


  // Daily Challenge States
  const [dailyChallenge, setDailyChallenge] = useState(null)
  const [loadingChallenge, setLoadingChallenge] = useState(true)
  const [selectedChallengeOpt, setSelectedChallengeOpt] = useState('')
  const [challengeResult, setChallengeResult] = useState(null)

  // Weak Areas (Focus Areas)
  const [weakAreas, setWeakAreas] = useState([])
  const [loadingWeakAreas, setLoadingWeakAreas] = useState(true)

  useEffect(() => {
    const initDashboard = async () => {
      setLoading(true)
      await fetchDashboardData()
      await handleStreakCheckIn()
      await fetchWeeklyActivity()
      await fetchUserBadges()
      await fetchDailyChallenge()
      await fetchWeakAreas()
      setLoading(false)
    }
    initDashboard()
  }, [])


  const fetchDashboardData = async () => {
    try {
      const response = await api.get('/progress/dashboard')
      const data = response.data
      setStats({
        totalAttempted: data.totalAttempted,
        totalCorrect: data.totalCorrect,
        accuracy: data.accuracy,
        topicsCovered: data.topicWiseStats?.length || 0
      })
      setTopicWiseStats(data.topicWiseStats || [])
      setRecentActivity(data.recentActivity || [])
      setSectionStats(data.sectionStats || [])
    } catch (error) {
      console.error('Failed to fetch dashboard data:', error)
    }
  }

  const fetchWeeklyActivity = async () => {
    try {
      const response = await api.get('/streak/weekly')
      setWeeklyActivity(response.data || [])
    } catch (error) {
      console.error('Failed to fetch weekly activity:', error)
    }
  }

  const handleStreakCheckIn = async () => {
    if (!user?.id) return
    if (checkinCalledRef.current) return
    checkinCalledRef.current = true

    const storageKey = `streak_checkin_${user.id}`
    const todayStr = new Date().toLocaleDateString('en-CA')
    const lastCheckedInDate = localStorage.getItem(storageKey)

    try {
      if (lastCheckedInDate !== todayStr) {
        await api.post('/streak/checkin')
        localStorage.setItem(storageKey, todayStr)
      }
      
      const response = await api.get('/streak')
      const data = response.data
      setStreakData({
        currentStreak: data.current_streak,
        longestStreak: data.longest_streak,
        totalPoints: data.total_points,
        lastActiveDate: data.last_active_date,
        isActiveToday: data.is_active_today
      })
    } catch (error) {
      console.error('Streak check-in failed:', error)
    }
  }

  const fetchUserBadges = async () => {
    try {
      const response = await api.get('/streak/badges')
      setBadges(response.data)
    } catch (error) {
      console.error('Failed to fetch user badges:', error)
    }
  }

  const fetchDailyChallenge = async () => {
    try {
      setLoadingChallenge(true)
      const res = await api.get('/daily-challenge')
      setDailyChallenge(res.data)
      if (res.data.alreadyAnswered) {
        setChallengeResult({
          isCorrect: res.data.isCorrect,
          correctAnswer: res.data.correctAnswer,
          explanation: res.data.explanation
        })
      }
    } catch (err) {
      console.error('Failed to load daily challenge:', err)
    } finally {
      setLoadingChallenge(false)
    }
  }

  const handleSubmitChallenge = async () => {
    if (!selectedChallengeOpt) {
      toast.error('Select an option first!')
      return
    }
    try {
      const res = await api.post('/daily-challenge/submit', { answer: selectedChallengeOpt })
      if (res.data.success) {
        setChallengeResult({
          isCorrect: res.data.isCorrect,
          correctAnswer: res.data.correctAnswer,
          explanation: res.data.explanation
        })
        setDailyChallenge(prev => ({
          ...prev,
          alreadyAnswered: true
        }))
        setStreakData(prev => ({
          ...prev,
          totalPoints: prev.totalPoints + res.data.pointsAwarded
        }))
        if (res.data.isCorrect) {
          toast.success('Awesome! Correct answer (+20 Points!)')
        } else {
          toast.error('Incorrect. Better luck tomorrow!')
        }
      }
    } catch (err) {
      console.error('Failed to submit challenge:', err)
      toast.error('Error submitting challenge answer.')
    }
  }

  const fetchWeakAreas = async () => {
    try {
      setLoadingWeakAreas(true)
      const res = await api.get('/weak-areas')
      setWeakAreas(res.data.weakAreas || [])
    } catch (err) {
      console.error('Failed to load weak areas:', err)
    } finally {
      setLoadingWeakAreas(false)
    }
  }

  const getAccuracyColor = (accuracy) => {
    if (accuracy >= 70) return 'bg-green-500'
    if (accuracy >= 40) return 'bg-yellow-500'
    return 'bg-red-500'
  }

  const getAccuracyTextColor = (accuracy) => {
    if (accuracy >= 70) return 'text-green-600 dark:text-green-400'
    if (accuracy >= 40) return 'text-yellow-600 dark:text-yellow-400'
    return 'text-red-600 dark:text-red-400'
  }

  const COLORS = ['#6366f1', '#22c55e', '#f59e0b', '#ef4444', '#8b5cf6']

  const pieData = sectionStats.map((section, index) => ({
    name: section.section,
    value: section.attempted,
    color: COLORS[index % COLORS.length]
  }))

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-[60vh]">
        <Loader2 className="h-8 w-8 animate-spin text-indigo-600 dark:text-indigo-400" />
      </div>
    )
  }

  return (
    <div className="space-y-8">
      
      {/* 1. Welcome and Streak Header */}
      <div className="space-y-4">
        <div>
          <h1 className="text-xl sm:text-2xl lg:text-3xl font-extrabold text-slate-900 dark:text-white tracking-tight mb-1">
            Welcome back, {user?.name}!
          </h1>
          <p className="text-slate-500 dark:text-slate-400 text-sm">
            Track your progress, unlock achievements, and practice daily to stay placement-ready.
          </p>
        </div>
        
        <StreakBanner 
          currentStreak={streakData.currentStreak} 
          longestStreak={streakData.longestStreak} 
          totalPoints={streakData.totalPoints} 
          lastActiveDate={streakData.lastActiveDate}
          isActiveToday={streakData.isActiveToday}
          weeklyActivity={weeklyActivity}
        />

      </div>

      {/* 2. Stat Cards Grid */}
      <div className="grid grid-cols-2 lg:grid-cols-4 gap-4">
        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <Target className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Attempted</span>
          </div>
          <div className="text-2xl font-black text-slate-900 dark:text-white">
            {stats.totalAttempted}
          </div>
          <div className="text-xs text-slate-500 dark:text-slate-400 mt-1">Questions Answered</div>
        </div>

        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <Award className="h-5 w-5 text-emerald-600 dark:text-emerald-400" />
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Correct</span>
          </div>
          <div className="text-2xl font-black text-slate-900 dark:text-white">
            {stats.totalCorrect}
          </div>
          <div className="text-xs text-slate-500 dark:text-slate-400 mt-1">Accurate Answers</div>
        </div>

        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <TrendingUp className="h-5 w-5 text-blue-600 dark:text-blue-400" />
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Accuracy</span>
          </div>
          <div className="text-2xl font-black text-slate-900 dark:text-white">
            {stats.accuracy.toFixed(1)}%
          </div>
          <div className="text-xs text-slate-500 dark:text-slate-400 mt-1">Overall Accuracy</div>
        </div>

        <div className="bg-white dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-5 shadow-sm">
          <div className="flex items-center justify-between mb-2">
            <BookOpen className="h-5 w-5 text-purple-600 dark:text-purple-400" />
            <span className="text-[10px] font-black text-slate-400 uppercase tracking-wider">Topics</span>
          </div>
          <div className="text-2xl font-black text-slate-900 dark:text-white">
            {stats.topicsCovered}
          </div>
          <div className="text-xs text-slate-500 dark:text-slate-400 mt-1">Topics Completed</div>
        </div>
      </div>

      {/* 3. New Live Features: Daily Challenge & Focus Areas side-by-side */}
      <div className="grid lg:grid-cols-8 gap-6">
        
        {/* Daily Challenge Card: Takes 5 cols */}
        <div className="lg:col-span-5 bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 shadow-sm flex flex-col justify-between">
          <div className="space-y-4">
            <div className="flex justify-between items-center pb-3 border-b border-slate-100 dark:border-slate-800">
              <div className="flex items-center gap-2">
                <Sparkles className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
                <h3 className="text-lg font-black text-slate-900 dark:text-white">Daily Challenge</h3>
              </div>
              <span className="text-[10px] font-black uppercase tracking-widest text-indigo-600 bg-indigo-50 dark:bg-indigo-950/40 dark:text-indigo-400 px-3 py-1 rounded-full">
                ⚡ 2x Points (20 pts)
              </span>
            </div>

            {loadingChallenge ? (
              <div className="py-10 flex justify-center"><Loader2 className="h-6 w-6 animate-spin text-slate-400" /></div>
            ) : dailyChallenge ? (
              <div className="space-y-4">
                <div className="text-xs font-bold text-slate-400 flex items-center gap-2">
                  <span>Section: <strong className="text-slate-650 dark:text-slate-350 capitalize">{dailyChallenge.sectionName}</strong></span>
                  <span>•</span>
                  <span>Topic: <strong className="text-slate-650 dark:text-slate-350">{dailyChallenge.topicName}</strong></span>
                </div>
                
                <h4 className="text-sm font-bold text-slate-850 dark:text-slate-150 leading-relaxed">
                  {dailyChallenge.questionText}
                </h4>

                {/* Options List */}
                <div className="grid sm:grid-cols-2 gap-3 pt-2">
                  {dailyChallenge.options && dailyChallenge.options.map((opt) => {
                    const letter = opt.optionLetter.toUpperCase()
                    const isSelected = selectedChallengeOpt === letter
                    const isSubmitted = dailyChallenge.alreadyAnswered
                    const isCorrectAnswer = letter === challengeResult?.correctAnswer
                    const isUserIncorrect = isSubmitted && isSelected && !challengeResult.isCorrect

                    let optionClass = 'border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-950 text-slate-700 dark:text-slate-300'
                    let badgeClass = 'bg-slate-100 dark:bg-slate-800 text-slate-500'

                    if (isSubmitted) {
                      if (isCorrectAnswer) {
                        optionClass = 'border-emerald-300 dark:border-emerald-900 bg-emerald-50/50 dark:bg-emerald-950/15 text-emerald-900 dark:text-emerald-300 font-bold'
                        badgeClass = 'bg-emerald-500 text-white'
                      } else if (isUserIncorrect) {
                        optionClass = 'border-rose-300 dark:border-rose-900 bg-rose-50/50 dark:bg-rose-950/15 text-rose-900 dark:text-rose-300'
                        badgeClass = 'bg-rose-500 text-white'
                      } else {
                        optionClass = 'opacity-60 border-slate-200 dark:border-slate-850 text-slate-400 bg-white dark:bg-slate-950'
                        badgeClass = 'bg-slate-100 dark:bg-slate-800'
                      }
                    } else if (isSelected) {
                      optionClass = 'border-indigo-500 dark:border-indigo-650 bg-indigo-50/20 dark:bg-indigo-950/10 text-indigo-700 dark:text-indigo-300 font-bold'
                      badgeClass = 'bg-indigo-600 text-white'
                    }

                    return (
                      <button
                        key={letter}
                        disabled={isSubmitted}
                        onClick={() => setSelectedChallengeOpt(letter)}
                        className={`flex items-center gap-3 p-3.5 rounded-xl border text-left text-xs font-semibold transition-all ${optionClass}`}
                      >
                        <span className={`h-6.5 w-6.5 rounded-full flex items-center justify-center font-bold text-xs shadow-sm ${badgeClass}`}>
                          {letter}
                        </span>
                        <span className="flex-1 truncate">{opt.optionText}</span>
                      </button>
                    )
                  })}
                </div>

                {/* Explanation or submit actions */}
                {challengeResult && (
                  <div className="bg-slate-50 dark:bg-slate-950 border border-slate-100 dark:border-slate-850 p-4 rounded-xl space-y-2 mt-4 text-xs">
                    <h5 className="font-bold text-slate-800 dark:text-slate-200 flex items-center gap-1">
                      {challengeResult.isCorrect ? (
                        <span className="text-emerald-600 flex items-center gap-1 font-black">✓ Correct answer!</span>
                      ) : (
                        <span className="text-rose-600 flex items-center gap-1 font-black">✗ Wrong. Correct was {challengeResult.correctAnswer}</span>
                      )}
                    </h5>
                    <p className="text-slate-600 dark:text-slate-400 whitespace-pre-line leading-relaxed">
                      <strong>Explanation:</strong> {challengeResult.explanation}
                    </p>
                  </div>
                )}

              </div>
            ) : (
              <div className="py-6 text-center text-slate-400 text-xs font-medium">Daily challenge question not available.</div>
            )}
          </div>

          {!loadingChallenge && dailyChallenge && !dailyChallenge.alreadyAnswered && (
            <div className="pt-4 border-t border-slate-100 dark:border-slate-800/80 mt-4 flex justify-end">
              <button
                onClick={handleSubmitChallenge}
                disabled={!selectedChallengeOpt}
                className={`px-6 py-2.5 font-bold rounded-xl text-xs transition-all shadow-sm ${
                  selectedChallengeOpt 
                    ? 'bg-gradient-to-r from-indigo-600 to-purple-600 text-white hover:from-indigo-700 hover:to-purple-700' 
                    : 'bg-slate-100 dark:bg-slate-800 text-slate-400 cursor-not-allowed'
                }`}
              >
                Submit Challenge
              </button>
            </div>
          )}
        </div>

        {/* Focus Areas Card: Takes 3 cols */}
        <div className="lg:col-span-3 bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-3xl p-6 shadow-sm flex flex-col justify-between">
          <div className="space-y-4">
            <div className="flex items-center gap-2 pb-3 border-b border-slate-100 dark:border-slate-800">
              <AlertCircle className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
              <h3 className="text-lg font-black text-slate-900 dark:text-white">Focus Areas</h3>
            </div>

            {loadingWeakAreas ? (
              <div className="py-10 flex justify-center"><Loader2 className="h-6 w-6 animate-spin text-slate-400" /></div>
            ) : weakAreas.length > 0 ? (
              <div className="space-y-3">
                <p className="text-xs text-slate-500 dark:text-slate-400 leading-relaxed mb-1">
                  We identified sub-50% accuracy on these topics. Revise and solve them to improve.
                </p>
                <div className="space-y-3.5">
                  {weakAreas.slice(0, 3).map((w, idx) => {
                    let secKey = w.section_name.toLowerCase()
                    if (secKey === 'data interpretation') secKey = 'di'
                    
                    return (
                      <div key={idx} className="flex justify-between items-center bg-slate-50/50 dark:bg-slate-950/20 border border-slate-100 dark:border-slate-850/60 rounded-xl p-3">
                        <div>
                          <div className="text-xs font-bold text-slate-800 dark:text-slate-200">{w.topic_name}</div>
                          <div className="text-[10px] text-slate-450 mt-0.5 capitalize">{secKey} • {w.attempts} attempts</div>
                        </div>
                        <div className="text-right flex items-center gap-3">
                          <div className="text-xs font-black text-rose-600 bg-rose-50 dark:bg-rose-950/30 px-2 py-0.5 rounded-md border border-rose-100/50 dark:border-rose-900/30">
                            {w.accuracy}% Acc
                          </div>
                          <Link
                            to={`/practice/${secKey}?topic=${encodeURIComponent(w.topic_name)}`}
                            className="p-1.5 bg-indigo-50 dark:bg-indigo-950/50 text-indigo-600 dark:text-indigo-400 rounded-lg hover:bg-indigo-600 hover:text-white dark:hover:bg-indigo-600 dark:hover:text-white transition-all shadow-sm"
                            title="Direct practice link"
                          >
                            <Play className="h-3 w-3 fill-current" />
                          </Link>
                        </div>
                      </div>
                    )
                  })}
                </div>
              </div>
            ) : (
              <div className="text-center py-10 space-y-3">
                <CheckCircle2 className="h-10 w-10 text-emerald-500 mx-auto animate-pulse" />
                <div>
                  <h4 className="text-xs font-bold text-slate-800 dark:text-slate-200">Looking Good!</h4>
                  <p className="text-[10px] text-slate-550 dark:text-slate-450 max-w-[200px] mx-auto leading-relaxed mt-0.5">
                    No focus areas identified. Keep maintaining accuracy above 50%!
                  </p>
                </div>
              </div>
            )}
          </div>
        </div>

      </div>

      {/* 4. Charts Row */}
      <div className="grid lg:grid-cols-2 gap-6">
        {/* Topic-wise Accuracy Bar Chart */}
        <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm">
          <h3 className="text-lg font-semibold text-slate-900 dark:text-white mb-4">
            Topic-wise Accuracy
          </h3>
          <ResponsiveContainer width="100%" height={300}>
            <BarChart data={topicWiseStats}>
              <CartesianGrid strokeDasharray="3 3" stroke={darkMode ? '#374151' : '#e5e7eb'} />
              <XAxis 
                dataKey="topic" 
                stroke={darkMode ? '#9ca3af' : '#6b7280'}
                fontSize={12}
                angle={-45}
                textAnchor="end"
                height={80}
              />
              <YAxis stroke={darkMode ? '#9ca3af' : '#6b7280'} fontSize={12} />
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: darkMode ? '#1f2937' : '#ffffff',
                  border: `1px solid ${darkMode ? '#374151' : '#e5e7eb'}`,
                  borderRadius: '8px'
                }}
              />
              <Bar dataKey="accuracy" fill="#6366f1" radius={[4, 4, 0, 0]} />
            </BarChart>
          </ResponsiveContainer>
        </div>

        {/* Section-wise Pie Chart */}
        <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm">
          <h3 className="text-lg font-semibold text-slate-900 dark:text-white mb-4">
            Section-wise Distribution
          </h3>
          <ResponsiveContainer width="100%" height={300}>
            <PieChart>
              <Pie
                data={pieData}
                cx="50%"
                cy="50%"
                labelLine={false}
                label={({ name, percent }) => `${name} ${(percent * 100).toFixed(0)}%`}
                outerRadius={80}
                fill="#8884d8"
                dataKey="value"
              >
                {pieData.map((entry, index) => (
                  <Cell key={`cell-${index}`} fill={entry.color} />
                ))}
              </Pie>
              <Tooltip 
                contentStyle={{ 
                  backgroundColor: darkMode ? '#1f2937' : '#ffffff',
                  border: `1px solid ${darkMode ? '#374151' : '#e5e7eb'}`,
                  borderRadius: '8px'
                }}
              />
            </PieChart>
          </ResponsiveContainer>
        </div>
      </div>

      {/* 5. Daily Activity Line Chart */}
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm">
        <h3 className="text-lg font-semibold text-slate-900 dark:text-white mb-4">
          Daily Activity (Last 7 Days)
        </h3>
        <ResponsiveContainer width="100%" height={300}>
          <LineChart data={recentActivity}>
            <CartesianGrid strokeDasharray="3 3" stroke={darkMode ? '#374151' : '#e5e7eb'} />
            <XAxis 
              dataKey="date" 
              stroke={darkMode ? '#9ca3af' : '#6b7280'}
              fontSize={12}
            />
            <YAxis stroke={darkMode ? '#9ca3af' : '#6b7280'} fontSize={12} />
            <Tooltip 
              contentStyle={{ 
                backgroundColor: darkMode ? '#1f2937' : '#ffffff',
                border: `1px solid ${darkMode ? '#374151' : '#e5e7eb'}`,
                borderRadius: '8px'
              }}
            />
            <Legend />
            <Line type="monotone" dataKey="attempted" stroke="#6366f1" strokeWidth={2} name="Attempted" />
            <Line type="monotone" dataKey="correct" stroke="#22c55e" strokeWidth={2} name="Correct" />
          </LineChart>
        </ResponsiveContainer>
      </div>

      {/* 6. Topic Progress Bars */}
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm">
        <h3 className="text-lg font-semibold text-slate-900 dark:text-white mb-4">
          Topic Progress
        </h3>
        <div className="space-y-4">
          {topicWiseStats.map((topic) => (
            <div key={topic.topic}>
              <div className="flex justify-between items-center mb-2">
                <span className="text-sm font-medium text-slate-900 dark:text-white">
                  {topic.topic}
                </span>
                <span className={`text-sm font-semibold ${getAccuracyTextColor(topic.accuracy)}`}>
                  {topic.accuracy.toFixed(1)}%
                </span>
              </div>
              <div className="w-full bg-slate-100 dark:bg-slate-850 rounded-full h-2.5">
                <div
                  className={`${getAccuracyColor(topic.accuracy)} h-2.5 rounded-full transition-all duration-300`}
                  style={{ width: `${topic.accuracy}%` }}
                />
              </div>
              <div className="flex justify-between mt-1 text-xs text-slate-500 dark:text-slate-400">
                <span>{topic.attempted} attempted</span>
                <span>{topic.correct} correct</span>
              </div>
            </div>
          ))}
        </div>
      </div>

      {/* 7. Achievements and Badges Grid */}
      {badges.length > 0 && (
        <BadgeGrid badges={badges} />
      )}

      {/* 8. Quick Actions */}
      <div>
        <h2 className="text-2xl font-bold mb-4 text-slate-900 dark:text-white">
          Quick Actions
        </h2>
        <div className="grid md:grid-cols-3 gap-6">
          <Link
            to="/practice"
            className="bg-white dark:bg-slate-950 hover:bg-slate-50 dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm hover:shadow-md transition-all cursor-pointer"
          >
            <div className="text-4xl mb-4">📚</div>
            <h3 className="text-xl font-semibold mb-2 text-slate-900 dark:text-white">
              Practice
            </h3>
            <p className="text-slate-655 dark:text-slate-450 text-xs">
              Start practicing questions by topic
            </p>
          </Link>
          <Link
            to="/tests"
            className="bg-white dark:bg-slate-950 hover:bg-slate-50 dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm hover:shadow-md transition-all cursor-pointer"
          >
            <div className="text-4xl mb-4">⏱️</div>
            <h3 className="text-xl font-semibold mb-2 text-slate-900 dark:text-white">
              Take a Test
            </h3>
            <p className="text-slate-655 dark:text-slate-450 text-xs">
              Challenge yourself with timed tests
            </p>
          </Link>
          <Link
            to="/leaderboard"
            className="bg-white dark:bg-slate-950 hover:bg-slate-50 dark:bg-slate-900 rounded-2xl border border-slate-200 dark:border-slate-800 p-6 shadow-sm hover:shadow-md transition-all cursor-pointer"
          >
            <div className="text-4xl mb-4">🏆</div>
            <h3 className="text-xl font-semibold mb-2 text-slate-900 dark:text-white">
              Leaderboard
            </h3>
            <p className="text-slate-655 dark:text-slate-450 text-xs">
              See how you rank against others
            </p>
          </Link>
        </div>
      </div>

      {/* Badge Earned Celebrate Modal */}
      <BadgeEarnedModal
        isOpen={isBadgeModalOpen}
        onClose={() => setIsBadgeModalOpen(false)}
        badge={earnedBadgeToShow}
      />
    </div>
  )
}

export default Dashboard
