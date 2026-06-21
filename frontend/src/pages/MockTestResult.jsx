import { useEffect, useState } from 'react'
import { useParams, useNavigate, useLocation } from 'react-router-dom'
import { 
  Trophy, 
  Target, 
  Clock, 
  Award, 
  AlertCircle, 
  CheckCircle, 
  XCircle, 
  MinusCircle, 
  Printer, 
  ArrowLeft, 
  BookOpen, 
  ChevronDown, 
  ChevronUp, 
  Sparkles 
} from 'lucide-react'
import { 
  ResponsiveContainer, 
  RadarChart, 
  PolarGrid, 
  PolarAngleAxis, 
  PolarRadiusAxis, 
  Radar 
} from 'recharts'
import api from '../services/api'
import BadgeEarnedModal from '../components/BadgeEarnedModal'
import { LoadingSpinner } from '../components/ui/LoadingSpinner'
import { Button } from '../components/ui/Button'
import toast from 'react-hot-toast'

const MockTestResult = () => {
  const { attemptId } = useParams()
  const navigate = useNavigate()
  const location = useLocation()
  
  const [result, setResult] = useState(null)
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)
  
  // Accordion state: map of question indices to boolean
  const [expandedQuestions, setExpandedQuestions] = useState({})
  
  // Filter for review questions: 'all', 'correct', 'wrong', 'skipped'
  const [filterMode, setFilterMode] = useState('all')

  // Badge modal state
  const [activeBadge, setActiveBadge] = useState(null)
  const [badgeQueue, setBadgeQueue] = useState([])
  const [isBadgeModalOpen, setIsBadgeModalOpen] = useState(false)

  useEffect(() => {
    const fetchResults = async () => {
      // If we came directly from MockTestTaking, we might have results in state
      if (location.state?.result) {
        console.log('Results loaded from navigation state', location.state.result)
        const resData = location.state.result
        setResult(resData)
        setLoading(false)

        // Queue any badges earned
        if (resData.newBadges && resData.newBadges.length > 0) {
          setBadgeQueue(resData.newBadges)
        }
      } else {
        // Otherwise, fetch from backend by attemptId
        try {
          setLoading(true)
          const response = await api.get(`/mock-tests/result/${attemptId}`)
          if (response.data.success) {
            setResult(response.data)
          } else {
            setError(response.data.message || 'Failed to load test results')
          }
        } catch (err) {
          console.error('Fetch mock result error:', err)
          setError(err.response?.data?.message || 'Error fetching mock test results')
        } finally {
          setLoading(false)
        }
      }
    }

    fetchResults()
  }, [attemptId, location.state])

  // Handle showing next badge in queue if any
  useEffect(() => {
    if (badgeQueue.length > 0 && !activeBadge) {
      const nextBadge = badgeQueue[0]
      setActiveBadge(nextBadge)
      setIsBadgeModalOpen(true)
      setBadgeQueue(prev => prev.slice(1))
    }
  }, [badgeQueue, activeBadge])

  const handleCloseBadgeModal = () => {
    setIsBadgeModalOpen(false)
    setActiveBadge(null)
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-[60vh]">
        <LoadingSpinner size="lg" />
      </div>
    )
  }

  if (error || !result) {
    return (
      <div className="max-w-md mx-auto text-center py-12">
        <AlertCircle className="h-16 w-16 text-red-500 mx-auto mb-4" />
        <h2 className="text-2xl font-bold text-slate-900 dark:text-white mb-2">Result Not Found</h2>
        <p className="text-slate-600 dark:text-slate-400 mb-6">{error || 'Could not retrieve test attempt results.'}</p>
        <Button onClick={() => navigate('/mock-test')} className="flex items-center gap-2 mx-auto">
          <ArrowLeft className="h-4 w-4" /> Back to Mock Tests
        </Button>
      </div>
    )
  }

  const {
    testName = 'Mock Placement Test',
    correct = 0,
    wrong = 0,
    skipped = 0,
    totalQuestions = 0,
    accuracy = 0,
    timeTaken = 0,
    percentile = 0,
    sectionBreakdown = {},
    weakTopics = [],
    answers = []
  } = result

  // Format Recharts radar data
  // Expected sections in database/config: Quantitative Aptitude, Logical Reasoning, Data Interpretation
  const radarData = [
    {
      subject: 'Quantitative',
      score: sectionBreakdown.quantitative ? Math.round(sectionBreakdown.quantitative.accuracy) : 0,
      fullMark: 100,
    },
    {
      subject: 'Logical',
      score: sectionBreakdown.logical ? Math.round(sectionBreakdown.logical.accuracy) : 0,
      fullMark: 100,
    },
    {
      subject: 'Data Interp.',
      score: sectionBreakdown.di ? Math.round(sectionBreakdown.di.accuracy) : 0,
      fullMark: 100,
    }
  ]

  // Time format helper
  const formatTime = (secs) => {
    const hrs = Math.floor(secs / 3600)
    const mins = Math.floor((secs % 3600) / 60)
    const s = secs % 60
    if (hrs > 0) {
      return `${hrs}h ${mins}m ${s}s`
    }
    return `${mins}m ${s}s`
  }

  // Toggle single question accordion
  const toggleQuestion = (index) => {
    setExpandedQuestions(prev => ({
      ...prev,
      [index]: !prev[index]
    }))
  }

  // Expand or collapse all
  const toggleAll = (expand) => {
    const newExpanded = {}
    if (expand) {
      answers.forEach((_, idx) => {
        newExpanded[idx] = true
      })
    }
    setExpandedQuestions(newExpanded)
  }

  // Filtered answers
  const filteredAnswers = answers.map((ans, idx) => ({ ...ans, originalIndex: idx })).filter(ans => {
    if (filterMode === 'all') return true
    if (filterMode === 'correct') return ans.isCorrect && ans.selectedOption
    if (filterMode === 'wrong') return !ans.isCorrect && ans.selectedOption
    if (filterMode === 'skipped') return !ans.selectedOption
    return true
  })

  // Print PDF handler
  const handlePrint = () => {
    window.print()
  }

  return (
    <div className="max-w-6xl mx-auto space-y-8 pb-16 print:space-y-4 print:pb-0">
      
      {/* Top action bar: Hide in print */}
      <div className="flex flex-col sm:flex-row sm:items-center sm:justify-between gap-4 border-b border-slate-200 dark:border-slate-800 pb-5 print:hidden">
        <div>
          <button 
            onClick={() => navigate('/mock-test')}
            className="flex items-center gap-1.5 text-sm font-semibold text-slate-500 dark:text-slate-400 hover:text-slate-800 dark:hover:text-slate-200 transition-colors mb-2"
          >
            <ArrowLeft className="h-4 w-4" /> Back to Test Center
          </button>
          <h1 className="text-xl sm:text-3xl font-extrabold text-slate-900 dark:text-white tracking-tight">
            {testName} Results
          </h1>
        </div>
        <div className="flex flex-col sm:flex-row gap-3 w-full sm:w-auto">
          <Button 
            onClick={handlePrint}
            variant="outline" 
            className="flex items-center justify-center gap-2 bg-white dark:bg-slate-950 border-slate-200 dark:border-slate-800 text-slate-700 dark:text-slate-300 hover:bg-slate-50 dark:hover:bg-slate-900 w-full sm:w-auto"
          >
            <Printer className="h-4 w-4" /> Download PDF Report
          </Button>
        </div>
      </div>


      {/* Header details visible in print */}
      <div className="hidden print:block border-b border-slate-300 pb-4 mb-4">
        <h1 className="text-2xl font-bold text-slate-900">{testName} - Detailed Performance Report</h1>
        <p className="text-sm text-slate-600">User Attempt ID: {attemptId} | Generated on {new Date().toLocaleDateString()}</p>
      </div>

      {/* Performance Score Summary Cards Grid */}
      <div className="grid grid-cols-2 md:grid-cols-4 gap-4">
        
        {/* Score/Points Card */}
        <div className="bg-gradient-to-br from-indigo-50 to-indigo-100/50 dark:from-indigo-950/20 dark:to-purple-950/15 border border-indigo-100 dark:border-indigo-900/40 rounded-2xl p-5 flex items-center gap-4 shadow-sm">
          <div className="p-3 bg-indigo-500 text-white rounded-xl shadow-md shadow-indigo-500/20">
            <Trophy className="h-6 w-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-indigo-600 dark:text-indigo-400 uppercase tracking-wider">Score</div>
            <div className="text-2xl font-black text-slate-900 dark:text-white">{correct * 10} <span className="text-sm font-semibold text-slate-500">pts</span></div>
            <div className="text-[10px] text-slate-500 mt-0.5">+{correct * 10} Added to Profile</div>
          </div>
        </div>

        {/* Accuracy Card */}
        <div className="bg-gradient-to-br from-emerald-50 to-emerald-100/50 dark:from-emerald-950/20 dark:to-teal-950/15 border border-emerald-100 dark:border-emerald-900/40 rounded-2xl p-5 flex items-center gap-4 shadow-sm">
          <div className="p-3 bg-emerald-500 text-white rounded-xl shadow-md shadow-emerald-500/20">
            <Target className="h-6 w-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-emerald-600 dark:text-emerald-400 uppercase tracking-wider">Accuracy</div>
            <div className="text-2xl font-black text-slate-900 dark:text-white">{parseFloat(accuracy).toFixed(1)}%</div>
            <div className="text-[10px] text-slate-500 mt-0.5">{correct} of {totalQuestions} Correct</div>
          </div>
        </div>

        {/* Time Taken Card */}
        <div className="bg-gradient-to-br from-amber-50 to-amber-100/50 dark:from-amber-950/20 dark:to-orange-950/15 border border-amber-100 dark:border-amber-900/40 rounded-2xl p-5 flex items-center gap-4 shadow-sm">
          <div className="p-3 bg-amber-500 text-white rounded-xl shadow-md shadow-amber-500/20">
            <Clock className="h-6 w-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-amber-600 dark:text-amber-400 uppercase tracking-wider">Time Taken</div>
            <div className="text-2xl font-black text-slate-900 dark:text-white">{formatTime(timeTaken)}</div>
            <div className="text-[10px] text-slate-500 mt-0.5">Average: {totalQuestions > 0 ? (timeTaken / totalQuestions).toFixed(1) : 0}s/q</div>
          </div>
        </div>

        {/* Percentile Card */}
        <div className="bg-gradient-to-br from-pink-50 to-pink-100/50 dark:from-pink-950/20 dark:to-rose-950/15 border border-pink-100 dark:border-pink-900/40 rounded-2xl p-5 flex items-center gap-4 shadow-sm">
          <div className="p-3 bg-pink-500 text-white rounded-xl shadow-md shadow-pink-500/20">
            <Award className="h-6 w-6" />
          </div>
          <div>
            <div className="text-xs font-semibold text-pink-600 dark:text-pink-400 uppercase tracking-wider">Percentile</div>
            <div className="text-2xl font-black text-slate-900 dark:text-white">{percentile}th</div>
            <div className="text-[10px] text-slate-500 mt-0.5">Est. Campus Ranking</div>
          </div>
        </div>

      </div>

      {/* Answer Distribution Bar */}
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-5 shadow-sm space-y-3">
        <h3 className="text-sm font-bold text-slate-800 dark:text-slate-200">Answer Breakdown</h3>
        <div className="h-4 w-full bg-slate-100 dark:bg-slate-800 rounded-full overflow-hidden flex">
          {correct > 0 && (
            <div 
              style={{ width: `${(correct / totalQuestions) * 100}%` }} 
              className="bg-emerald-500 h-full hover:opacity-90 transition-opacity" 
              title={`Correct: ${correct}`}
            />
          )}
          {wrong > 0 && (
            <div 
              style={{ width: `${(wrong / totalQuestions) * 100}%` }} 
              className="bg-rose-500 h-full hover:opacity-90 transition-opacity" 
              title={`Wrong: ${wrong}`}
            />
          )}
          {skipped > 0 && (
            <div 
              style={{ width: `${(skipped / totalQuestions) * 100}%` }} 
              className="bg-slate-400 h-full hover:opacity-90 transition-opacity" 
              title={`Skipped: ${skipped}`}
            />
          )}
        </div>
        <div className="flex flex-wrap gap-4 text-xs font-semibold">
          <div className="flex items-center gap-1.5 text-slate-600 dark:text-slate-400">
            <span className="w-3 h-3 rounded-full bg-emerald-500 block"></span>
            Correct: {correct} ({Math.round((correct / totalQuestions) * 100)}%)
          </div>
          <div className="flex items-center gap-1.5 text-slate-600 dark:text-slate-400">
            <span className="w-3 h-3 rounded-full bg-rose-500 block"></span>
            Incorrect: {wrong} ({Math.round((wrong / totalQuestions) * 100)}%)
          </div>
          <div className="flex items-center gap-1.5 text-slate-600 dark:text-slate-400">
            <span className="w-3 h-3 rounded-full bg-slate-400 block"></span>
            Skipped: {skipped} ({Math.round((skipped / totalQuestions) * 100)}%)
          </div>
        </div>
      </div>

      {/* Grid: Recharts Radar Chart & Recommendations */}
      <div className="grid grid-cols-1 md:grid-cols-5 gap-6">
        
        {/* Radar Chart: Takes 2 cols */}
        <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm flex flex-col items-center justify-between md:col-span-2 min-h-[320px] print:break-inside-avoid">
          <div className="text-center w-full mb-2">
            <h3 className="text-base font-bold text-slate-900 dark:text-white">Section Accuracy Analysis</h3>
            <p className="text-xs text-slate-500">Comparing Quantitative, Logical, and DI</p>
          </div>
          
          <div className="w-full h-56">
            <ResponsiveContainer width="100%" height="100%">
              <RadarChart cx="50%" cy="50%" outerRadius="75%" data={radarData}>
                <PolarGrid stroke="#94a3b8" strokeDasharray="3 3" opacity={0.3} />
                <PolarAngleAxis 
                  dataKey="subject" 
                  tick={{ fill: '#64748b', fontSize: 11, fontWeight: 'bold' }} 
                />
                <PolarRadiusAxis 
                  angle={30} 
                  domain={[0, 100]} 
                  tick={{ fill: '#94a3b8', fontSize: 9 }}
                />
                <Radar
                  name="Accuracy"
                  dataKey="score"
                  stroke="#4f46e5"
                  fill="#818cf8"
                  fillOpacity={0.4}
                />
              </RadarChart>
            </ResponsiveContainer>
          </div>

          <div className="w-full grid grid-cols-1 sm:grid-cols-3 text-center border-t border-slate-100 dark:border-slate-800 pt-4 mt-2 text-xs gap-3 sm:gap-0">
            {Object.keys(sectionBreakdown).map((sec) => {
              const data = sectionBreakdown[sec]
              const label = sec === 'di' ? 'DI' : sec.charAt(0).toUpperCase() + sec.slice(1, 4)
              return (
                <div key={sec}>
                  <div className="font-semibold text-slate-500 capitalize">{label}</div>
                  <div className="font-black text-slate-900 dark:text-white text-sm">{Math.round(data.accuracy)}%</div>
                </div>
              )
            })}
          </div>
        </div>

        {/* Topic Breakdown & Recommendations: Takes 3 cols */}
        <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm flex flex-col justify-between md:col-span-3 print:break-inside-avoid">
          <div className="space-y-4">
            <div className="flex items-center gap-2 pb-3 border-b border-slate-100 dark:border-slate-800">
              <BookOpen className="h-5 w-5 text-indigo-600 dark:text-indigo-400" />
              <h3 className="text-base font-bold text-slate-900 dark:text-white">Weak Areas & Recommendations</h3>
            </div>

            {weakTopics.length > 0 ? (
              <div className="space-y-3">
                <p className="text-sm text-slate-600 dark:text-slate-400">
                  Based on your test answers, we identified low accuracy in the following topic(s). Focus on these areas to raise your percentile.
                </p>
                <div className="flex flex-wrap gap-2.5">
                  {weakTopics.map((topic, i) => (
                    <span 
                      key={i} 
                      className="inline-flex items-center gap-1.5 px-3 py-1.5 rounded-xl text-xs font-bold bg-amber-50 dark:bg-amber-950/40 border border-amber-200/50 dark:border-amber-900/40 text-amber-800 dark:text-amber-300"
                    >
                      <Sparkles className="h-3 w-3" />
                      {topic}
                    </span>
                  ))}
                </div>
                <div className="bg-slate-50 dark:bg-slate-950 border border-slate-150 dark:border-slate-850 rounded-xl p-4 mt-4 space-y-2 text-xs">
                  <div className="font-bold text-slate-800 dark:text-slate-200">Recommended Next Steps:</div>
                  <ul className="list-disc list-inside space-y-1 text-slate-600 dark:text-slate-400">
                    <li>Review basic formulas and explanations in the questions below.</li>
                    <li>Head over to the <button onClick={() => navigate('/practice')} className="text-indigo-600 dark:text-indigo-400 font-bold underline hover:text-indigo-700">Practice Portal</button> and filter by these specific topics.</li>
                    <li>Attempt small 5-question mock tests to gauge your improvement.</li>
                  </ul>
                </div>
              </div>
            ) : (
              <div className="space-y-4 text-center py-6">
                <Sparkles className="h-10 w-10 text-yellow-500 mx-auto animate-pulse" />
                <div className="space-y-1">
                  <h4 className="text-sm font-bold text-slate-800 dark:text-slate-200">Excellent Performance!</h4>
                  <p className="text-xs text-slate-500 dark:text-slate-400 max-w-sm mx-auto">
                    You maintained high accuracy (&gt;60%) across all topics in this test. Keep doing what you're doing!
                  </p>
                </div>
              </div>
            )}
          </div>

          <div className="mt-6 flex justify-end print:hidden">
            <Button 
              onClick={() => navigate('/practice')} 
              className="w-full sm:w-auto bg-gradient-to-r from-indigo-600 to-purple-600 text-white font-bold py-2.5 px-6 rounded-xl hover:shadow-lg transition-all"
            >
              Start Focused Practice
            </Button>
          </div>
        </div>

      </div>

      {/* Accordion Questions Review Section */}
      <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm overflow-hidden print:border-none print:shadow-none print:bg-transparent">
        
        {/* Header toolbar */}
        <div className="p-6 border-b border-slate-200 dark:border-slate-800 flex flex-col md:flex-row md:items-center md:justify-between gap-4 print:px-0">
          <div>
            <h3 className="text-lg font-bold text-slate-900 dark:text-white">Detailed Question Review</h3>
            <p className="text-xs text-slate-500">Go through your test questions, answers, and detailed step-by-step explanations.</p>
          </div>
          
          <div className="flex flex-wrap items-center gap-3 print:hidden">
            <div className="flex rounded-lg bg-slate-100 dark:bg-slate-800 p-0.5 text-xs font-semibold">
              {[
                { id: 'all', label: 'All' },
                { id: 'correct', label: 'Correct' },
                { id: 'wrong', label: 'Incorrect' },
                { id: 'skipped', label: 'Skipped' }
              ].map(opt => (
                <button
                  key={opt.id}
                  onClick={() => setFilterMode(opt.id)}
                  className={`px-3 py-1.5 rounded-md transition-all ${
                    filterMode === opt.id 
                      ? 'bg-white dark:bg-slate-950 text-slate-900 dark:text-white shadow-sm' 
                      : 'text-slate-500 hover:text-slate-850 dark:hover:text-slate-200'
                  }`}
                >
                  {opt.label}
                </button>
              ))}
            </div>

            <div className="flex gap-2">
              <button 
                onClick={() => toggleAll(true)}
                className="text-xs font-bold text-indigo-600 dark:text-indigo-400 hover:underline px-2 py-1"
              >
                Expand All
              </button>
              <button 
                onClick={() => toggleAll(false)}
                className="text-xs font-bold text-slate-500 hover:underline px-2 py-1"
              >
                Collapse All
              </button>
            </div>
          </div>
        </div>

        {/* List of Questions */}
        <div className="divide-y divide-slate-150 dark:divide-slate-800">
          {filteredAnswers.length > 0 ? (
            filteredAnswers.map((ans, idx) => {
              const { questionText, options = [], explanation = '' } = ans.question
              const isExpanded = !!expandedQuestions[ans.originalIndex]
              
              // Status Styling
              let statusBadge = null
              let cardBorderClass = 'hover:bg-slate-50/50 dark:hover:bg-slate-850/50'

              if (!ans.selectedOption) {
                statusBadge = (
                  <span className="flex items-center gap-1 text-xs font-bold text-slate-500 bg-slate-100 dark:bg-slate-800 px-2 py-0.5 rounded-full">
                    <MinusCircle className="h-3 w-3" /> Skipped
                  </span>
                )
              } else if (ans.isCorrect) {
                statusBadge = (
                  <span className="flex items-center gap-1 text-xs font-bold text-emerald-600 bg-emerald-50 dark:bg-emerald-950/30 px-2 py-0.5 rounded-full">
                    <CheckCircle className="h-3 w-3" /> Correct
                  </span>
                )
                cardBorderClass = 'bg-emerald-50/10 hover:bg-emerald-50/20 dark:bg-emerald-950/5 dark:hover:bg-emerald-950/10'
              } else {
                statusBadge = (
                  <span className="flex items-center gap-1 text-xs font-bold text-rose-600 bg-rose-50 dark:bg-rose-950/30 px-2 py-0.5 rounded-full">
                    <XCircle className="h-3 w-3" /> Incorrect
                  </span>
                )
                cardBorderClass = 'bg-rose-50/10 hover:bg-rose-50/20 dark:bg-rose-950/5 dark:hover:bg-rose-950/10'
              }

              return (
                <div key={ans.originalIndex} className={`transition-colors ${cardBorderClass} print:bg-transparent print:border-b print:py-4 print:break-inside-avoid`}>
                  
                  {/* Summary row */}
                  <div 
                    onClick={() => toggleQuestion(ans.originalIndex)}
                    className="p-5 flex items-center justify-between cursor-pointer select-none print:cursor-default print:pointer-events-none"
                  >
                    <div className="flex items-center gap-4 flex-1 min-w-0 pr-4">
                      <span className="text-sm font-bold text-slate-400">Q{ans.originalIndex + 1}</span>
                      <div className="truncate text-sm font-semibold text-slate-800 dark:text-slate-200">
                        {questionText}
                      </div>
                      <div className="flex-shrink-0">{statusBadge}</div>
                    </div>
                    
                    <div className="print:hidden text-slate-400">
                      {isExpanded ? <ChevronUp className="h-5 w-5" /> : <ChevronDown className="h-5 w-5" />}
                    </div>
                  </div>

                  {/* Expanded block */}
                  {(isExpanded || window.matchMedia('print').matches) && (
                    <div className="px-5 pb-6 pt-1 border-t border-slate-100 dark:border-slate-800 bg-slate-50/40 dark:bg-slate-900/40 space-y-4 print:bg-transparent print:border-none print:px-0">
                      
                      {/* Question Content */}
                      <div className="text-slate-800 dark:text-slate-200 font-medium text-sm whitespace-pre-line">
                        {questionText}
                      </div>

                      {/* Options List */}
                      <div className="grid sm:grid-cols-2 gap-3 max-w-3xl">
                        {options.map((opt) => {
                          const isCorrectOption = opt.optionLetter.toUpperCase() === ans.correctOption.toUpperCase()
                          const isSelectedOption = ans.selectedOption && opt.optionLetter.toUpperCase() === ans.selectedOption.toUpperCase()

                          let btnStyle = 'border-slate-200 dark:border-slate-800 bg-white dark:bg-slate-950 text-slate-700 dark:text-slate-300'
                          let labelStyle = 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400'

                          if (isCorrectOption) {
                            btnStyle = 'border-emerald-300 dark:border-emerald-900 bg-emerald-50 dark:bg-emerald-950/20 text-emerald-900 dark:text-emerald-300'
                            labelStyle = 'bg-emerald-500 text-white'
                          } else if (isSelectedOption) {
                            btnStyle = 'border-rose-300 dark:border-rose-900 bg-rose-50 dark:bg-rose-950/20 text-rose-900 dark:text-rose-300'
                            labelStyle = 'bg-rose-500 text-white'
                          }

                          return (
                            <div 
                              key={opt.optionLetter}
                              className={`flex items-center gap-3 border rounded-xl p-3.5 text-xs font-semibold transition-all ${btnStyle}`}
                            >
                              <span className={`w-6 h-6 rounded-full flex items-center justify-center font-bold shadow-sm ${labelStyle}`}>
                                {opt.optionLetter}
                              </span>
                              <span>{opt.optionText}</span>
                            </div>
                          )
                        })}
                      </div>

                      {/* User's Choice Badge */}
                      <div className="flex gap-4 text-xs font-bold text-slate-500 pt-1">
                        <div>
                          Your Answer:{' '}
                          <span className={ans.isCorrect ? 'text-emerald-600' : ans.selectedOption ? 'text-rose-600 font-extrabold' : 'text-slate-500'}>
                            {ans.selectedOption ? ans.selectedOption.toUpperCase() : 'None (Skipped)'}
                          </span>
                        </div>
                        <div>
                          Correct Answer:{' '}
                          <span className="text-emerald-600 font-extrabold">
                            {ans.correctOption.toUpperCase()}
                          </span>
                        </div>
                      </div>

                      {/* Explanation Box */}
                      {explanation && (
                        <div className="bg-white dark:bg-slate-950 border border-slate-200 dark:border-slate-850 rounded-xl p-4 space-y-2 mt-4 print:break-inside-avoid">
                          <h4 className="text-xs font-bold text-slate-900 dark:text-white flex items-center gap-1.5">
                            <BookOpen className="h-4 w-4 text-indigo-500" /> Explanation:
                          </h4>
                          <p className="text-xs text-slate-600 dark:text-slate-400 whitespace-pre-line leading-relaxed">
                            {explanation}
                          </p>
                        </div>
                      )}

                    </div>
                  )}

                </div>
              )
            })
          ) : (
            <div className="text-center py-12 text-slate-500">
              No questions found matching the filter.
            </div>
          )}
        </div>

      </div>

      {/* Confetti celebration for badges */}
      <BadgeEarnedModal 
        isOpen={isBadgeModalOpen} 
        onClose={handleCloseBadgeModal} 
        badge={activeBadge} 
      />

    </div>
  )
}

export default MockTestResult
