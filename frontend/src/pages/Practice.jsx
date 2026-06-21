import { useEffect, useState, useRef } from 'react'
import { useParams, Link, useSearchParams, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { 
  Calculator, 
  Brain, 
  BarChart, 
  BookOpen, 
  Clock, 
  Star, 
  CheckCircle2, 
  XCircle, 
  Sparkles, 
  Trophy, 
  ArrowLeft, 
  ChevronRight,
  HelpCircle,
  Play
} from 'lucide-react'
import toast from 'react-hot-toast'

// Map section parameter keys to display details
const SECTION_CONFIG = {
  quantitative: {
    name: 'Quantitative Aptitude',
    icon: Calculator,
    color: 'from-blue-500 to-indigo-600',
    lightColor: 'bg-blue-50 dark:bg-blue-950/20 text-blue-600 dark:text-blue-400'
  },
  logical: {
    name: 'Logical Reasoning',
    icon: Brain,
    color: 'from-purple-500 to-pink-600',
    lightColor: 'bg-purple-50 dark:bg-purple-950/20 text-purple-600 dark:text-purple-400'
  },
  di: {
    name: 'Data Interpretation',
    icon: BarChart,
    color: 'from-amber-500 to-orange-600',
    lightColor: 'bg-amber-50 dark:bg-amber-950/20 text-amber-600 dark:text-amber-400'
  },
  verbal: {
    name: 'Verbal Ability',
    icon: BookOpen,
    color: 'from-emerald-500 to-teal-600',
    lightColor: 'bg-emerald-50 dark:bg-emerald-950/20 text-emerald-600 dark:text-emerald-400'
  }
}

const Practice = () => {
  const { section: urlSection } = useParams()
  const navigate = useNavigate()
  const [searchParams, setSearchParams] = useSearchParams()
  
  // Topic selected in URL params
  const topicParam = searchParams.get('topic')
  
  // Section active state (defaults to quantitative if empty or invalid)
  const currentSection = SECTION_CONFIG[urlSection] ? urlSection : 'quantitative'
  
  const [topics, setTopics] = useState([])
  const [loadingTopics, setLoadingTopics] = useState(true)
  
  // Question Player States
  const [questions, setQuestions] = useState([])
  const [currentIdx, setCurrentIdx] = useState(0)
  const [loadingQuestions, setLoadingQuestions] = useState(false)
  const [selectedOpt, setSelectedOpt] = useState('')
  const [answeredState, setAnsweredState] = useState(null) // { isCorrect, correctAnswer, explanation }
  const [bookmarkedList, setBookmarkedList] = useState(new Set())
  const [attemptedMap, setAttemptedMap] = useState({}) // { questionId: { isCorrect, selectedAnswer } }
  
  // Timer States
  const [timer, setTimer] = useState(0)
  const timerRef = useRef(null)

  // Fetch topics list
  useEffect(() => {
    const fetchTopics = async () => {
      setLoadingTopics(true)
      try {
        const res = await api.get('/data/topics', { params: { section: currentSection } })
        if (res.data.success) {
          setTopics(res.data.topics)
        }
      } catch (err) {
        console.error('Error fetching topics:', err)
        toast.error('Failed to load practice topics.')
      } finally {
        setLoadingTopics(false)
      }
    }
    
    fetchTopics()
  }, [currentSection])

  // Load questions when topic is active
  useEffect(() => {
    if (topicParam) {
      const fetchQuestions = async () => {
        setLoadingQuestions(true)
        try {
          // Fetch bookmarks first
          const bookmarkRes = await api.get('/progress/bookmarked-questions')
          if (bookmarkRes.data.bookmarkedQuestions) {
            setBookmarkedList(new Set(bookmarkRes.data.bookmarkedQuestions))
          }
          
          // Fetch questions
          const res = await api.get('/data/questions', {
            params: {
              section: currentSection,
              topic: topicParam,
              limit: 50 // load up to 50 questions for seamless practice
            }
          })
          if (res.data.success) {
            const qList = res.data.questions || []
            setQuestions(qList)
            setCurrentIdx(0)
            setSelectedOpt('')
            setAnsweredState(null)
            
            // Map already solved attempts
            const attempts = {}
            qList.forEach(q => {
              if (q.user_last_answer !== undefined && q.user_last_answer !== null) {
                attempts[q.id] = {
                  isCorrect: q.user_last_answer === 1,
                  selectedAnswer: q.user_selected_answer || ''
                }
              }
            })
            setAttemptedMap(attempts)
          }
        } catch (err) {
          console.error('Error loading questions:', err)
          toast.error('Failed to load topic questions.')
        } finally {
          setLoadingQuestions(false)
        }
      }

      fetchQuestions()
      startTimer()
    } else {
      stopTimer()
    }
    
    return () => stopTimer()
  }, [topicParam, currentSection])

  // Timer helpers
  const startTimer = () => {
    stopTimer()
    setTimer(0)
    timerRef.current = setInterval(() => {
      setTimer(prev => prev + 1)
    }, 1000)
  }

  const stopTimer = () => {
    if (timerRef.current) {
      clearInterval(timerRef.current)
      timerRef.current = null
    }
  }

  const formatTime = (totalSeconds) => {
    const mins = Math.floor(totalSeconds / 60)
    const secs = totalSeconds % 60
    return `${mins.toString().padStart(2, '0')}:${secs.toString().padStart(2, '0')}`
  }

  // Answer Submission
  const handleSubmitAnswer = async () => {
    if (!selectedOpt) {
      toast.error('Please select an option before submitting!')
      return
    }

    const activeQuestion = questions[currentIdx]
    try {
      const res = await api.post(`/data/${activeQuestion.id}/attempt`, {
        selectedAnswer: selectedOpt,
        timeTaken: timer
      })
      
      const isCorrect = res.data.isCorrect
      setAnsweredState({
        isCorrect,
        correctAnswer: res.data.correctAnswer,
        explanation: res.data.explanation
      })

      // Update local attempt map
      setAttemptedMap(prev => ({
        ...prev,
        [activeQuestion.id]: {
          isCorrect,
          selectedAnswer: selectedOpt
        }
      }))

      if (isCorrect) {
        toast.success(`Correct! +10 Points earned.`)
      } else {
        toast.error(`Wrong answer. Review the explanation below.`)
      }
    } catch (err) {
      console.error('Error submitting answer:', err)
      toast.error('Could not submit answer. Try again.')
    }
  }

  // Next Question Navigation
  const handleNext = () => {
    if (currentIdx < questions.length - 1) {
      setCurrentIdx(prev => prev + 1)
      setSelectedOpt('')
      setAnsweredState(null)
      startTimer()
    } else {
      toast.success('Congratulations! You completed all questions in this topic.')
      navigate(`/practice/${currentSection}`)
    }
  }

  // Bookmark toggler
  const handleBookmarkToggle = async (questionId) => {
    try {
      const res = await api.post('/progress/toggle-bookmark', { questionId })
      if (res.data.success) {
        setBookmarkedList(prev => {
          const next = new Set(prev)
          if (next.has(questionId)) {
            next.delete(questionId)
            toast.success('Bookmark removed')
          } else {
            next.add(questionId)
            toast.success('Question bookmarked!')
          }
          return next
        })
      }
    } catch (err) {
      console.error('Bookmark toggle error:', err)
      toast.error('Failed to update bookmark.')
    }
  }

  // Section Selector Tab Switcher
  const handleSectionSwitch = (secKey) => {
    navigate(`/practice/${secKey}`)
  }

  // Render question state color indicator
  const getNavStatusClass = (qId, index) => {
    const isCurrent = index === currentIdx
    const attempt = attemptedMap[qId]
    
    if (isCurrent) return 'ring-2 ring-indigo-600 bg-indigo-50 border-indigo-600 text-indigo-700 dark:bg-indigo-950 dark:text-indigo-300'
    if (attempt) {
      return attempt.isCorrect
        ? 'bg-emerald-100 border-emerald-300 text-emerald-800 dark:bg-emerald-950/60 dark:border-emerald-900 dark:text-emerald-300'
        : 'bg-rose-100 border-rose-300 text-rose-800 dark:bg-rose-950/60 dark:border-rose-900 dark:text-rose-300'
    }
    return 'bg-white border-slate-200 text-slate-700 dark:bg-slate-900 dark:border-slate-800 dark:text-slate-400 hover:bg-slate-50 dark:hover:bg-slate-800/50'
  }

  return (
    <div className="max-w-7xl mx-auto space-y-6">
      
      {/* 1. Header and Subtitle */}
      <div className="flex flex-col gap-2">
        <h1 className="text-3xl font-extrabold text-slate-900 dark:text-white tracking-tight">
          📚 Practice Arena
        </h1>
        <p className="text-slate-500 dark:text-slate-400 text-sm">
          Challenge yourself with detailed, topic-wise practice problems, get instant results, and climb the platform leaderboard.
        </p>
      </div>

      {/* 2. Top Section Switcher Tabs */}
      <div className="flex overflow-x-auto gap-2 pb-2 scrollbar-hide md:grid md:grid-cols-4 md:gap-3">
        {Object.keys(SECTION_CONFIG).map((key) => {
          const config = SECTION_CONFIG[key]
          const Icon = config.icon
          const isActive = currentSection === key
          
          return (
            <button
              key={key}
              onClick={() => handleSectionSwitch(key)}
              disabled={!!topicParam} // lock tabs when practicing a topic
              className={`flex items-center gap-3 p-4 rounded-2xl border text-left transition-all duration-300 flex-shrink-0 min-w-[150px] md:min-w-0 md:w-auto ${
                isActive 
                  ? 'bg-white dark:bg-slate-900 border-indigo-500/80 shadow-md shadow-indigo-500/5 dark:shadow-none translate-y-[-2px]' 
                  : 'bg-slate-50/50 dark:bg-slate-900/40 border-slate-200 dark:border-slate-850 hover:bg-white dark:hover:bg-slate-900 hover:border-slate-350 dark:hover:border-slate-750'
              } ${!!topicParam ? 'opacity-50 cursor-not-allowed' : ''}`}
            >
              <div className={`p-2.5 rounded-xl bg-gradient-to-br ${config.color} text-white shadow-sm`}>
                <Icon className="h-5 w-5" />
              </div>
              <div className="min-w-0">
                <div className="text-xs text-slate-400 dark:text-slate-500 font-semibold uppercase tracking-wider">Section</div>
                <div className="text-sm font-extrabold text-slate-800 dark:text-slate-250 truncate">{config.name}</div>
              </div>
            </button>
          )
        })}
      </div>

      {/* 3. Main Body */}
      {topicParam ? (
        
        // ==========================================
        // TOPIC QUESTION PLAYER VIEW
        // ==========================================
        <div className="space-y-6">
          
          {/* Top navigation back link */}
          <div className="flex items-center justify-between pb-3 border-b border-slate-200 dark:border-slate-800">
            <button
              onClick={() => navigate(`/practice/${currentSection}`)}
              className="inline-flex items-center gap-1.5 text-sm font-bold text-slate-500 hover:text-slate-800 dark:hover:text-slate-250 transition-colors"
            >
              <ArrowLeft className="h-4 w-4" /> Back to {SECTION_CONFIG[currentSection].name}
            </button>
            <div className="flex items-center gap-4 text-xs font-semibold text-slate-400">
              <span>Section: <strong className="text-slate-600 dark:text-slate-300 capitalize">{currentSection}</strong></span>
              <span>Topic: <strong className="text-slate-600 dark:text-slate-300">{topicParam}</strong></span>
            </div>
          </div>

          {loadingQuestions ? (
            <div className="flex justify-center items-center py-20">
              <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-indigo-600"></div>
            </div>
          ) : questions.length === 0 ? (
            <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-10 text-center space-y-4">
              <HelpCircle className="h-12 w-12 text-slate-450 mx-auto" />
              <h3 className="text-lg font-bold text-slate-950 dark:text-white">No Questions Seeded</h3>
              <p className="text-sm text-slate-500 max-w-sm mx-auto">We couldn't find any questions for {topicParam} practice. Please check back later.</p>
            </div>
          ) : (
            
            // Grid layout: Left-nav indicators (2 cols) & Right question area (6 cols)
            <div className="flex flex-col-reverse md:flex-row gap-6 items-start">
              
              {/* Question list indicator grid */}
              <div className="w-full md:w-1/4 flex-shrink-0 bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-5 shadow-sm space-y-4">
                <h4 className="text-xs font-black text-slate-400 uppercase tracking-widest">Question Index</h4>
                <div className="grid grid-cols-5 gap-2 max-h-[300px] overflow-y-auto pr-1">
                  {questions.map((q, idx) => (
                    <button
                      key={q.id}
                      onClick={() => {
                        setCurrentIdx(idx)
                        setSelectedOpt('')
                        setAnsweredState(null)
                        startTimer()
                      }}
                      className={`h-9 w-9 text-xs font-black rounded-lg border flex items-center justify-center transition-all ${getNavStatusClass(q.id, idx)}`}
                    >
                      {idx + 1}
                    </button>
                  ))}
                </div>
                <div className="border-t border-slate-100 dark:border-slate-800 pt-3 space-y-2 text-[10px] font-bold text-slate-500">
                  <div className="flex items-center gap-1.5">
                    <span className="w-2.5 h-2.5 rounded-full bg-emerald-500 block"></span>
                    Correct Solve
                  </div>
                  <div className="flex items-center gap-1.5">
                    <span className="w-2.5 h-2.5 rounded-full bg-rose-500 block"></span>
                    Incorrect Attempt
                  </div>
                  <div className="flex items-center gap-1.5">
                    <span className="w-2.5 h-2.5 rounded-full bg-white border border-slate-200 block dark:bg-slate-900 dark:border-slate-800"></span>
                    Not Solved
                  </div>
                </div>
              </div>

              {/* Core question player card */}
              <div className="w-full md:flex-1 space-y-6">
                
                <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl shadow-sm p-6 space-y-6">
                  
                  {/* Status header: Question count, timer, bookmark */}
                  <div className="sticky top-16 z-10 bg-white dark:bg-slate-900 flex justify-between items-center pb-4 border-b border-slate-100 dark:border-slate-800 md:relative md:top-0 md:z-0 py-2">
                    <div className="flex items-center gap-2">
                      <span className="text-sm font-bold text-indigo-600 bg-indigo-50 dark:bg-indigo-950/40 dark:text-indigo-400 px-3 py-1 rounded-full capitalize">
                        {questions[currentIdx].difficulty}
                      </span>
                      <span className="text-xs text-slate-400 font-semibold">
                        Question {currentIdx + 1} of {questions.length}
                      </span>
                    </div>
                    <div className="flex items-center gap-3">
                      <div className="flex items-center gap-1.5 text-xs text-slate-500 bg-slate-50 dark:bg-slate-950 border border-slate-200 dark:border-slate-800 px-2.5 py-1.5 rounded-lg font-mono">
                        <Clock className="h-3.5 w-3.5 text-slate-400 animate-pulse" />
                        {formatTime(timer)}
                      </div>
                      <button
                        onClick={() => handleBookmarkToggle(questions[currentIdx].id)}
                        className={`p-2 rounded-lg border transition-colors ${
                          bookmarkedList.has(questions[currentIdx].id)
                            ? 'bg-yellow-50 border-yellow-200 text-yellow-600 dark:bg-yellow-950/20 dark:border-yellow-900'
                            : 'border-slate-200 dark:border-slate-800 text-slate-450 hover:bg-slate-50 dark:hover:bg-slate-800'
                        }`}
                        title="Bookmark question"
                      >
                        <Star className={`h-4 w-4 ${bookmarkedList.has(questions[currentIdx].id) ? 'fill-current' : ''}`} />
                      </button>
                    </div>
                  </div>

                  {/* Question Prompt */}
                  <div className="space-y-4">
                    <h3 className="text-base font-bold text-slate-850 dark:text-slate-150 leading-relaxed whitespace-pre-line">
                      {questions[currentIdx].questionText}
                    </h3>
                  </div>

                  {/* Options List */}
                  <div className="grid md:grid-cols-2 gap-3 pt-2">
                    {questions[currentIdx].options && questions[currentIdx].options.map((opt) => {
                      const letter = opt.optionLetter.toUpperCase()
                      const isSelected = selectedOpt === letter
                      const isSubmitted = answeredState !== null
                      const isCorrectAnswer = letter === answeredState?.correctAnswer
                      const isUserIncorrect = isSubmitted && isSelected && !answeredState.isCorrect

                      let optionCardClass = 'border-slate-200 dark:border-slate-800 hover:border-slate-350 dark:hover:border-slate-700 bg-white dark:bg-slate-950 text-slate-700 dark:text-slate-350'
                      let labelBadgeClass = 'bg-slate-100 dark:bg-slate-800 text-slate-600 dark:text-slate-400'

                      if (isSubmitted) {
                        if (isCorrectAnswer) {
                          optionCardClass = 'border-emerald-300 dark:border-emerald-900 bg-emerald-50/50 dark:bg-emerald-950/15 text-emerald-900 dark:text-emerald-300 font-bold'
                          labelBadgeClass = 'bg-emerald-500 text-white'
                        } else if (isUserIncorrect) {
                          optionCardClass = 'border-rose-300 dark:border-rose-900 bg-rose-50/50 dark:bg-rose-950/15 text-rose-900 dark:text-rose-300'
                          labelBadgeClass = 'bg-rose-500 text-white'
                        } else {
                          optionCardClass = 'opacity-60 border-slate-200 dark:border-slate-850 bg-white dark:bg-slate-950 text-slate-400'
                          labelBadgeClass = 'bg-slate-100 dark:bg-slate-800 text-slate-400'
                        }
                      } else if (isSelected) {
                        optionCardClass = 'border-indigo-500 dark:border-indigo-600 bg-indigo-50/20 dark:bg-indigo-950/10 text-indigo-700 dark:text-indigo-300 font-bold'
                        labelBadgeClass = 'bg-indigo-600 text-white'
                      }

                      return (
                        <button
                          key={letter}
                          disabled={isSubmitted}
                          onClick={() => setSelectedOpt(letter)}
                          className={`flex items-center gap-3 p-4 min-h-[52px] active:scale-95 transition-all rounded-xl border text-left text-xs font-semibold ${optionCardClass}`}
                        >
                          <span className={`h-6.5 w-6.5 rounded-full flex items-center justify-center font-bold text-xs shadow-sm ${labelBadgeClass}`}>
                            {letter}
                          </span>
                          <span className="flex-1 pr-2">{opt.optionText}</span>
                        </button>
                      )
                    })}
                  </div>

                  {/* Submission triggers */}
                  {!answeredState ? (
                    <div className="flex justify-end pt-4 border-t border-slate-100 dark:border-slate-800">
                      <button
                        onClick={handleSubmitAnswer}
                        disabled={!selectedOpt}
                        className={`px-6 py-2.5 font-bold rounded-xl text-xs transition-all shadow-sm ${
                          selectedOpt 
                            ? 'bg-gradient-to-r from-indigo-600 to-purple-600 text-white hover:shadow-md hover:from-indigo-700 hover:to-purple-700' 
                            : 'bg-slate-100 dark:bg-slate-800 text-slate-400 cursor-not-allowed'
                        }`}
                      >
                        Submit Answer
                      </button>
                    </div>
                  ) : (
                    <div className="flex justify-between items-center pt-4 border-t border-slate-100 dark:border-slate-800">
                      <div className="flex items-center gap-2">
                        {answeredState.isCorrect ? (
                          <span className="flex items-center gap-1 text-xs font-bold text-emerald-600 dark:text-emerald-400 bg-emerald-50 dark:bg-emerald-950/30 px-3 py-1.5 rounded-lg border border-emerald-100 dark:border-emerald-900/30">
                            <CheckCircle2 className="h-4 w-4" /> Correct Answer (+10 Pts)
                          </span>
                        ) : (
                          <span className="flex items-center gap-1 text-xs font-bold text-rose-600 dark:text-rose-400 bg-rose-50 dark:bg-rose-950/30 px-3 py-1.5 rounded-lg border border-rose-100 dark:border-rose-900/30">
                            <XCircle className="h-4 w-4" /> Incorrect Answer
                          </span>
                        )}
                      </div>
                      <button
                        onClick={handleNext}
                        className="px-6 py-2.5 bg-slate-900 dark:bg-white text-white dark:text-slate-950 hover:bg-slate-800 dark:hover:bg-slate-100 font-bold rounded-xl text-xs transition-all shadow-sm flex items-center gap-1.5"
                      >
                        {currentIdx < questions.length - 1 ? 'Next Question' : 'Finish Practice'}
                        <ChevronRight className="h-4 w-4" />
                      </button>
                    </div>
                  )}

                </div>

                {/* Explanation block: visible after submission */}
                {answeredState && (
                  <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-6 shadow-sm space-y-3 animate-fade-in">
                    <h4 className="text-xs font-black text-slate-800 dark:text-slate-150 uppercase tracking-widest flex items-center gap-1.5">
                      <Sparkles className="h-4 w-4 text-yellow-500" /> Explanation
                    </h4>
                    <p className="text-xs text-slate-600 dark:text-slate-450 leading-relaxed whitespace-pre-line bg-slate-50/50 dark:bg-slate-950/40 p-4 rounded-xl border border-slate-100 dark:border-slate-850">
                      {answeredState.explanation}
                    </p>
                  </div>
                )}

              </div>

            </div>
          )}

        </div>

      ) : (
        
        // ==========================================
        // DEFAULT LIST OF TOPICS IN SECTION
        // ==========================================
        <div className="space-y-6">
          {loadingTopics ? (
            <div className="flex justify-center items-center py-20">
              <div className="animate-spin rounded-full h-10 w-10 border-b-2 border-indigo-600"></div>
            </div>
          ) : topics.length === 0 ? (
            <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-10 text-center">
              <BookOpen className="h-10 w-10 text-slate-400 mx-auto mb-3" />
              <h3 className="text-lg font-bold text-slate-900 dark:text-white">No Topics Found</h3>
              <p className="text-sm text-slate-550 max-w-sm mx-auto mt-1">This section is currently being updated with new syllabus topics.</p>
            </div>
          ) : (
            
            // Grid of topic cards
            <div className="grid grid-cols-1 sm:grid-cols-2 lg:grid-cols-3 xl:grid-cols-4 gap-6">
              {topics.map((t) => {
                const totalQ = t.totalQuestions || 0
                const attempted = t.attemptedCount || 0
                const correct = t.correctCount || 0
                const completionPct = totalQ > 0 ? Math.round((attempted / totalQ) * 100) : 0
                const accuracyPct = attempted > 0 ? Math.round((correct / attempted) * 100) : 0
                
                const isNew = attempted === 0

                return (
                  <div
                    key={t.id}
                    className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-4 sm:p-6 shadow-sm hover:shadow-md hover:border-slate-300 dark:hover:border-slate-750 transition-all duration-300 flex flex-col justify-between"
                  >
                    <div className="space-y-4">
                      
                      {/* Topic Name + Badge */}
                      <div className="flex justify-between items-start gap-4">
                        <h3 className="text-lg font-black text-slate-900 dark:text-white leading-tight">
                          {t.name}
                        </h3>
                        {isNew ? (
                          <span className="flex-shrink-0 text-[10px] font-black uppercase tracking-widest text-indigo-600 bg-indigo-50 dark:bg-indigo-950/40 dark:text-indigo-400 px-2 py-0.5 rounded-md border border-indigo-100/50 dark:border-indigo-900/30">
                            New
                          </span>
                        ) : (
                          <span className="flex-shrink-0 text-[10px] font-black uppercase tracking-widest text-emerald-600 bg-emerald-50 dark:bg-emerald-950/40 dark:text-emerald-400 px-2 py-0.5 rounded-md border border-emerald-100/50 dark:border-emerald-900/30">
                            🎯 {accuracyPct}% Acc
                          </span>
                        )}
                      </div>

                      {/* Topic Description */}
                      <p className="text-xs text-slate-500 dark:text-slate-400 line-clamp-2 leading-relaxed">
                        {t.description || 'Master key placement interview concepts with specialized practice questions.'}
                      </p>

                      {/* Progress Bar */}
                      <div className="space-y-1">
                        <div className="flex justify-between text-[10px] font-bold text-slate-400">
                          <span>{attempted} of {totalQ} questions solved</span>
                          <span>{completionPct}%</span>
                        </div>
                        <div className="h-1.5 w-full bg-slate-100 dark:bg-slate-800 rounded-full overflow-hidden">
                          <div 
                            style={{ width: `${completionPct}%` }}
                            className="bg-indigo-600 h-full rounded-full transition-all duration-500"
                          />
                        </div>
                      </div>

                      {/* Difficulty Distribution */}
                      <div className="flex items-center gap-4 text-[10px] font-bold text-slate-400 pt-1">
                        <div className="flex items-center gap-1">
                          <span className="w-1.5 h-1.5 rounded-full bg-emerald-500 block"></span>
                          Easy: {t.easyCount || 0}
                        </div>
                        <div className="flex items-center gap-1">
                          <span className="w-1.5 h-1.5 rounded-full bg-amber-500 block"></span>
                          Med: {t.mediumCount || 0}
                        </div>
                        <div className="flex items-center gap-1">
                          <span className="w-1.5 h-1.5 rounded-full bg-rose-500 block"></span>
                          Hard: {t.hardCount || 0}
                        </div>
                      </div>

                    </div>

                    {/* Action button */}
                    <div className="pt-5 border-t border-slate-100 dark:border-slate-800/80 mt-5">
                      <button
                        onClick={() => setSearchParams({ topic: t.name })}
                        className="w-full py-2.5 bg-slate-50 dark:bg-slate-950 hover:bg-indigo-600 hover:text-white dark:hover:bg-indigo-600 text-slate-700 dark:text-slate-300 font-bold rounded-xl text-xs transition-all flex items-center justify-center gap-1.5 group border border-slate-100 dark:border-slate-850"
                      >
                        <Play className="h-3 w-3 fill-current opacity-70 group-hover:opacity-100 transition-opacity" />
                        {attempted > 0 ? 'Resume Practice' : 'Start Solving'}
                      </button>
                    </div>

                  </div>
                )
              })}
            </div>
          )}
        </div>
      )}

    </div>
  )
}

export default Practice
