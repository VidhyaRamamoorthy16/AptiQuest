import { useEffect, useState, useRef } from 'react'
import { useParams, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'
import { Clock, ShieldAlert, ChevronLeft, ChevronRight, Bookmark, Circle, CheckCircle, X } from 'lucide-react'
import toast from 'react-hot-toast'


const MockTestTaking = () => {
  const { testId } = useParams()
  const navigate = useNavigate()
  const { user } = useAuth()
  const { darkMode } = useTheme()
  const [loading, setLoading] = useState(true)
  const [test, setTest] = useState(null)
  
  // Navigation states
  const [currentQuestion, setCurrentQuestion] = useState(0)
  const [answers, setAnswers] = useState({})
  const [markedForReview, setMarkedForReview] = useState({})
  const [visited, setVisited] = useState({ 0: true })
  const [showNavigator, setShowNavigator] = useState(false)


  // Timers states
  const [timeLeft, setTimeLeft] = useState(0) // total timer
  const [sectionTimeLeft, setSectionTimeLeft] = useState(null) // current section timer
  const [activeSection, setActiveSection] = useState('') // e.g. 'quantitative', 'logical', 'di'

  // Modals & Warnings
  const [showSubmitModal, setShowSubmitModal] = useState(false)
  const [showSectionSwitchModal, setShowSectionSwitchModal] = useState(false)
  const [nextSectionToSwitch, setNextSectionToSwitch] = useState('')
  const [warnings, setWarnings] = useState(0)

  // Section configs mapping
  const [sectionsConfig, setSectionsConfig] = useState(null)
  const [sectionIndices, setSectionIndices] = useState([]) // Array of objects mapping indices to questions

  useEffect(() => {
    fetchTest()
  }, [testId])

  // Save progress to local storage every 30 seconds
  useEffect(() => {
    if (!test || !user) return
    const interval = setInterval(() => {
      const storageKey = `mock_test_progress_${testId}_${user.id}`
      localStorage.setItem(storageKey, JSON.stringify({
        answers,
        markedForReview,
        visited,
        timeLeft,
        sectionTimeLeft,
        activeSection,
        currentQuestion
      }))
    }, 30000)

    return () => clearInterval(interval)
  }, [test, answers, markedForReview, visited, timeLeft, sectionTimeLeft, activeSection, currentQuestion, user, testId])

  // Handle Tab Switch (Anti-cheat detection)
  useEffect(() => {
    const handleVisibilityChange = () => {
      if (document.hidden) {
        setWarnings((prev) => {
          const next = prev + 1
          if (next >= 3) {
            toast.error('Multiple tab switches detected. Test auto-submitting...')
            submitTestImmediate()
            return 3
          } else {
            toast.error(`Warning ${next}/3: Please do not leave the test page!`)
            return next
          }
        })
      }
    }

    document.addEventListener('visibilitychange', handleVisibilityChange)
    return () => document.removeEventListener('visibilitychange', handleVisibilityChange)
  }, [test, answers])

  // Timers countdown interval
  useEffect(() => {
    if (!test) return

    const timer = setInterval(() => {
      // 1. Total timer countdown
      setTimeLeft((prevTotal) => {
        if (prevTotal <= 1) {
          clearInterval(timer)
          toast.error("Time is up! Submitting your test...")
          submitTestImmediate()
          return 0
        }
        return prevTotal - 1
      })

      // 2. Section timer countdown
      if (sectionTimeLeft !== null) {
        setSectionTimeLeft((prevSec) => {
          if (prevSec <= 1) {
            handleSectionTimeExpiry()
            return 0
          }
          return prevSec - 1
        })
      }
    }, 1000)

    return () => clearInterval(timer)
  }, [test, sectionTimeLeft, activeSection])

  const fetchTest = async () => {
    try {
      setLoading(true)
      const response = await api.get(`/mock-tests/${testId}`)
      const data = response.data
      setTest(data)

      // Initialize timers
      setTimeLeft(data.duration * 60)

      // Setup sections and group indices
      const config = data.sections_config 
        ? (typeof data.sections_config === 'string' ? JSON.parse(data.sections_config) : data.sections_config)
        : null;
      
      setSectionsConfig(config)

      if (config) {
        // Group indices by sections
        const sectionsList = Object.keys(config);
        const mappedIndices = [];
        
        let currentIndex = 0;
        sectionsList.forEach(sec => {
          const count = config[sec].count;
          mappedIndices.push({
            name: sec,
            start: currentIndex,
            end: currentIndex + count - 1,
            time: config[sec].time // in seconds
          });
          currentIndex += count;
        });

        setSectionIndices(mappedIndices)
        // Set first section active
        const firstSec = mappedIndices[0];
        setActiveSection(firstSec.name)
        setSectionTimeLeft(firstSec.time)
        setCurrentQuestion(firstSec.start)
      } else {
        // Simple default fallback
        setActiveSection('mixed')
        setSectionTimeLeft(null)
        setCurrentQuestion(0)
      }

      // Check for resume progress in localStorage
      if (user) {
        const saved = localStorage.getItem(`mock_test_progress_${testId}_${user.id}`)
        if (saved) {
          try {
            const parsed = JSON.parse(saved)
            setAnswers(parsed.answers || {})
            setMarkedForReview(parsed.markedForReview || {})
            setVisited(parsed.visited || { 0: true })
            setTimeLeft(parsed.timeLeft)
            setSectionTimeLeft(parsed.sectionTimeLeft)
            setActiveSection(parsed.activeSection)
            setCurrentQuestion(parsed.currentQuestion)
            toast.success('Resumed test from last saved point!')
          } catch (e) {
            console.error('Failed to parse saved state', e)
          }
        }
      }
    } catch (error) {
      console.error('Failed to load mock test:', error)
      toast.error('Failed to fetch test details')
      navigate('/mock-test')
    } finally {
      setLoading(false)
    }
  }

  const handleSectionTimeExpiry = () => {
    toast.error(`Time expired for ${activeSection.toUpperCase()} section. Switching section...`)
    const currentSecInfo = sectionIndices.find(s => s.name === activeSection)
    const nextIndex = sectionIndices.indexOf(currentSecInfo) + 1
    
    if (nextIndex < sectionIndices.length) {
      const nextSec = sectionIndices[nextIndex]
      setActiveSection(nextSec.name)
      setSectionTimeLeft(nextSec.time)
      setCurrentQuestion(nextSec.start)
      setVisited(prev => ({ ...prev, [nextSec.start]: true }))
    } else {
      // No sections left, submit
      toast.success('All sections completed. Submitting test...')
      submitTestImmediate()
    }
  }

  const handleAnswer = (option) => {
    setAnswers(prev => ({ ...prev, [currentQuestion]: option }))
  }

  const handleMarkForReview = () => {
    setMarkedForReview(prev => ({
      ...prev,
      [currentQuestion]: !prev[currentQuestion]
    }))
  }

  const handleQuestionJump = (index) => {
    if (sectionsConfig) {
      // Find what section the target index belongs to
      const targetSec = sectionIndices.find(s => index >= s.start && index <= s.end);
      const currentSecInfo = sectionIndices.find(s => s.name === activeSection);
      
      const targetSecIdx = sectionIndices.indexOf(targetSec);
      const currentSecIdx = sectionIndices.indexOf(currentSecInfo);

      if (targetSecIdx < currentSecIdx) {
        toast.error(`You cannot return to the locked ${targetSec.name.toUpperCase()} section!`)
        return
      }
      
      if (targetSecIdx > currentSecIdx) {
        // Warn user before switching to a new section
        setNextSectionToSwitch(targetSec.name)
        setShowSectionSwitchModal(true)
        return
      }
    }
    
    setCurrentQuestion(index)
    setVisited(prev => ({ ...prev, [index]: true }))
  }

  const confirmSwitchSection = () => {
    const targetSec = sectionIndices.find(s => s.name === nextSectionToSwitch);
    setActiveSection(targetSec.name)
    setSectionTimeLeft(targetSec.time)
    setCurrentQuestion(targetSec.start)
    setVisited(prev => ({ ...prev, [targetSec.start]: true }))
    setShowSectionSwitchModal(false)
    toast.success(`Entered ${targetSec.name.toUpperCase()} section!`)
  }

  const handlePrevious = () => {
    const currentSecInfo = sectionIndices.find(s => s.name === activeSection)
    if (sectionsConfig && currentQuestion <= currentSecInfo.start) {
      toast.error('Already at the first question of this section')
      return
    }
    
    if (currentQuestion > 0) {
      const nextIdx = currentQuestion - 1
      setCurrentQuestion(nextIdx)
      setVisited(prev => ({ ...prev, [nextIdx]: true }))
    }
  }

  const handleNext = () => {
    const currentSecInfo = sectionIndices.find(s => s.name === activeSection)
    if (sectionsConfig && currentQuestion >= currentSecInfo.end) {
      // Check if there is a next section
      const nextSecIndex = sectionIndices.indexOf(currentSecInfo) + 1
      if (nextSecIndex < sectionIndices.length) {
        setNextSectionToSwitch(sectionIndices[nextSecIndex].name)
        setShowSectionSwitchModal(true)
      } else {
        setShowSubmitModal(true)
      }
      return
    }

    if (currentQuestion < test.questions.length - 1) {
      const nextIdx = currentQuestion + 1
      setCurrentQuestion(nextIdx)
      setVisited(prev => ({ ...prev, [nextIdx]: true }))
    }
  }

  const submitTestImmediate = async () => {
    try {
      setLoading(true)
      const durationSeconds = test.duration * 60
      const actualTimeTaken = durationSeconds - timeLeft

      const response = await api.post(`/mock-tests/${testId}/submit`, {
        answers,
        timeTaken: actualTimeTaken
      })

      // Clean up localStorage
      if (user) {
        localStorage.removeItem(`mock_test_progress_${testId}_${user.id}`)
      }

      toast.success('Test submitted successfully!')
      navigate(`/mock-test/${response.data.attemptId}/result`, { state: { result: response.data } })
    } catch (error) {
      console.error('Submit mock test error:', error)
      toast.error('Failed to submit test. Try again.')
      setLoading(false)
    }
  }

  const getQuestionStatus = (index) => {
    if (markedForReview[index]) return 'review'
    if (answers[index] !== undefined) return 'answered'
    if (visited[index]) return 'visited'
    return 'not-visited'
  }

  const formatTime = (seconds) => {
    const m = Math.floor(seconds / 60)
    const s = seconds % 60
    return `${m.toString().padStart(2, '0')}:${s.toString().padStart(2, '0')}`
  }

  if (loading) {
    return (
      <div className="flex items-center justify-center min-h-screen bg-slate-50 dark:bg-slate-950">
        <div className="text-center space-y-4">
          <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-indigo-600 mx-auto"></div>
          <p className="text-sm font-semibold text-slate-600 dark:text-slate-400">Loading mock test conditions...</p>
        </div>
      </div>
    )
  }

  const activeQuestionData = test.questions[currentQuestion]
  const currentSecInfo = sectionsConfig ? sectionIndices.find(s => s.name === activeSection) : null

  return (
    <div className="fixed inset-0 z-50 bg-slate-50 dark:bg-slate-950 flex flex-col h-full font-sans select-none">
      {/* Top Navbar */}
      <header className="bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800 px-4 lg:px-6 py-4 flex items-center justify-between shadow-sm flex-shrink-0 relative z-40">
        <div>
          <h1 className="text-sm sm:text-lg font-bold text-slate-900 dark:text-white line-clamp-1">{test.name}</h1>
          <p className="text-[10px] sm:text-xs text-slate-500 dark:text-slate-400">Distraction-Free Exam Mode</p>
        </div>

        <div className="flex items-center gap-2 sm:gap-6">
          {/* Section Timer */}
          {sectionsConfig && sectionTimeLeft !== null && (
            <div className="flex items-center gap-1 sm:gap-2 px-2.5 sm:px-4 py-1.5 sm:py-2 bg-indigo-50 dark:bg-indigo-950/40 rounded-xl border border-indigo-100 dark:border-indigo-900/60">
              <span className="text-[10px] sm:text-xs font-bold text-indigo-600 dark:text-indigo-400 uppercase tracking-wider hidden sm:inline">
                {activeSection} time:
              </span>
              <span className={`text-xs sm:text-sm font-black font-mono ${sectionTimeLeft < 300 ? 'text-red-500 animate-pulse' : 'text-indigo-600 dark:text-indigo-400'}`}>
                {formatTime(sectionTimeLeft)}
              </span>
            </div>
          )}

          {/* Total Timer */}
          <div className="flex items-center gap-1.5 sm:gap-2 px-2.5 sm:px-4 py-1.5 sm:py-2 bg-slate-100 dark:bg-slate-800 rounded-xl border border-slate-200 dark:border-slate-700">
            <Clock className="h-3.5 w-3.5 sm:h-4 sm:w-4 text-slate-500" />
            <span className="text-[10px] sm:text-xs font-bold text-slate-600 dark:text-slate-400 uppercase tracking-wider hidden sm:inline">Total:</span>
            <span className={`text-xs sm:text-sm font-black font-mono ${timeLeft < 300 ? 'text-red-500 animate-pulse' : 'text-slate-700 dark:text-slate-350'}`}>
              {formatTime(timeLeft)}
            </span>
          </div>

          <button
            onClick={() => setShowSubmitModal(true)}
            className="hidden sm:inline-block px-5 py-2 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold transition-all shadow-md"
          >
            Submit Test
          </button>
        </div>
      </header>

      {/* Main Content Area */}
      <div className="flex-1 flex overflow-hidden">
        {/* Left Side: Question and Options */}
        <main className="flex-1 overflow-y-auto p-4 sm:p-8 bg-white dark:bg-slate-900 border-r border-slate-200 dark:border-slate-850">
          <div className="max-w-3xl mx-auto space-y-8">
            <div className="flex items-center justify-between border-b border-slate-100 dark:border-slate-800/80 pb-4">
              <span className="text-xs font-bold text-slate-500 uppercase tracking-wider bg-slate-100 dark:bg-slate-800 px-3 py-1 rounded-md">
                Section: {activeQuestionData.sectionName || activeSection} &middot; Question {currentQuestion + 1}
              </span>

              <button
                onClick={handleMarkForReview}
                className={`flex items-center gap-1.5 px-3 py-1 rounded-lg text-xs font-semibold border transition-all ${
                  markedForReview[currentQuestion]
                    ? 'bg-yellow-50 dark:bg-yellow-950/20 border-yellow-300 text-yellow-700 dark:text-yellow-400'
                    : 'border-slate-200 dark:border-slate-700 hover:bg-slate-50 text-slate-600 dark:text-slate-400'
                }`}
              >
                <Bookmark className={`h-4 w-4 ${markedForReview[currentQuestion] ? 'fill-current' : ''}`} />
                {markedForReview[currentQuestion] ? 'Marked for Review' : 'Mark for Review'}
              </button>
            </div>

            {/* Question Text */}
            <div className="text-lg font-semibold text-slate-900 dark:text-white leading-relaxed">
              {activeQuestionData.questionText}
            </div>

            {/* MCQ Options */}
            <div className="grid grid-cols-1 gap-4">
              {activeQuestionData.options?.map((option) => {
                const isSelected = answers[currentQuestion] === option.optionLetter
                return (
                  <button
                    key={option.optionLetter}
                    onClick={() => handleAnswer(option.optionLetter)}
                    className={`flex items-center gap-4 p-5 rounded-xl border-2 text-left transition-all ${
                      isSelected
                        ? 'border-indigo-600 bg-indigo-50/50 dark:bg-indigo-950/30'
                        : 'border-slate-200 dark:border-slate-800 hover:border-slate-350 dark:hover:border-slate-700 hover:bg-slate-50/30'
                    }`}
                  >
                    <div className={`w-6 h-6 rounded-full border-2 flex items-center justify-center font-bold text-xs ${
                      isSelected
                        ? 'border-indigo-600 bg-indigo-600 text-white shadow-sm'
                        : 'border-slate-300 dark:border-slate-600 text-slate-500'
                    }`}>
                      {option.optionLetter}
                    </div>
                    <span className="text-sm font-medium text-slate-800 dark:text-slate-250">
                      {option.optionText}
                    </span>
                  </button>
                )
              })}
            </div>

            {/* Prev / Next controls */}
            <div className="flex items-center justify-between pt-6 border-t border-slate-100 dark:border-slate-800/80">
              <button
                onClick={handlePrevious}
                className="px-5 py-2.5 bg-slate-100 hover:bg-slate-200 dark:bg-slate-800 dark:hover:bg-slate-750 text-slate-700 dark:text-slate-300 rounded-lg text-sm font-bold transition-all disabled:opacity-50 disabled:cursor-not-allowed"
                disabled={sectionsConfig && currentQuestion <= currentSecInfo.start}
              >
                &larr; Previous
              </button>

              <button
                onClick={handleNext}
                className="px-5 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-lg text-sm font-bold transition-all shadow-md"
              >
                {sectionsConfig && currentQuestion >= currentSecInfo.end && (sectionIndices.indexOf(currentSecInfo) === sectionIndices.length - 1)
                  ? 'Submit Test'
                  : 'Save & Next \u2192'}
              </button>
            </div>
          </div>
        </main>

        {/* Right Side: Question Grid Navigator */}
        <aside className="hidden lg:flex w-80 overflow-y-auto bg-slate-50 dark:bg-slate-900 p-6 flex-col justify-between">
          <div className="space-y-6">
            <h3 className="text-sm font-extrabold text-slate-800 dark:text-slate-350 uppercase tracking-widest border-b border-slate-200 dark:border-slate-800 pb-2">
              Question Navigator
            </h3>

            {/* Sections grouping */}
            {sectionsConfig ? (
              <div className="space-y-6">
                {sectionIndices.map((sec) => (
                  <div key={sec.name} className="space-y-2">
                    <span className="text-[10px] font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider block">
                      {sec.name} ({sec.end - sec.start + 1})
                    </span>
                    <div className="grid grid-cols-5 gap-2">
                      {Array.from({ length: sec.end - sec.start + 1 }, (_, i) => sec.start + i).map((idx) => {
                        const status = getQuestionStatus(idx)
                        const isActive = currentQuestion === idx
                        return (
                          <button
                            key={idx}
                            onClick={() => handleQuestionJump(idx)}
                            className={`w-9 h-9 rounded-lg text-xs font-bold transition-all border flex items-center justify-center ${
                              isActive ? 'ring-2 ring-indigo-500 ring-offset-2 dark:ring-offset-slate-900' : ''
                            } ${
                              status === 'review'
                                ? 'bg-yellow-500 border-yellow-500 text-white shadow-sm'
                                : status === 'answered'
                                ? 'bg-indigo-600 border-indigo-600 text-white shadow-sm'
                                : status === 'visited'
                                ? 'bg-slate-200 border-slate-300 dark:bg-slate-800 dark:border-slate-700 text-slate-700 dark:text-slate-300'
                                : 'bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 text-slate-400 dark:text-slate-600'
                            }`}
                          >
                            {idx + 1}
                          </button>
                        )
                      })}
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="grid grid-cols-5 gap-2">
                {test.questions.map((_, idx) => {
                  const status = getQuestionStatus(idx)
                  const isActive = currentQuestion === idx
                  return (
                    <button
                      key={idx}
                      onClick={() => handleQuestionJump(idx)}
                      className={`w-9 h-9 rounded-lg text-xs font-bold transition-all border flex items-center justify-center ${
                        isActive ? 'ring-2 ring-indigo-500 ring-offset-2 dark:ring-offset-slate-900' : ''
                      } ${
                        status === 'review'
                          ? 'bg-yellow-500 border-yellow-500 text-white'
                          : status === 'answered'
                          ? 'bg-indigo-600 border-indigo-600 text-white'
                          : status === 'visited'
                          ? 'bg-slate-200 border-slate-300 dark:bg-slate-800 dark:border-slate-750 text-slate-700 dark:text-slate-300'
                          : 'bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 text-slate-400 dark:text-slate-600'
                      }`}
                    >
                      {idx + 1}
                    </button>
                  )
                })}
              </div>
            )}
          </div>

          {/* Legend */}
          <div className="mt-8 border-t border-slate-200 dark:border-slate-800 pt-4 text-xs space-y-2">
            <h4 className="font-bold text-slate-600 dark:text-slate-400 uppercase tracking-widest text-[9px] mb-2">Legend</h4>
            <div className="flex items-center gap-2">
              <span className="w-3.5 h-3.5 rounded bg-indigo-600 border border-indigo-600 inline-block" />
              <span className="text-slate-600 dark:text-slate-400 font-medium">Answered</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="w-3.5 h-3.5 rounded bg-yellow-500 border border-yellow-500 inline-block" />
              <span className="text-slate-600 dark:text-slate-400 font-medium">Marked for review</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="w-3.5 h-3.5 rounded bg-slate-200 dark:bg-slate-800 border border-slate-300 dark:border-slate-700 inline-block" />
              <span className="text-slate-600 dark:text-slate-400 font-medium">Visited, unanswered</span>
            </div>
            <div className="flex items-center gap-2">
              <span className="w-3.5 h-3.5 rounded bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-850 inline-block" />
              <span className="text-slate-600 dark:text-slate-400 font-medium">Not visited</span>
            </div>
          </div>
        </aside>
      </div>

      {/* Warning Bar (Cheat detection warnings info) */}
      {warnings > 0 && (
        <div className="bg-red-500 text-white px-6 py-2 flex items-center justify-center gap-2 font-bold text-sm shadow-inner z-50">
          <ShieldAlert className="h-5 w-5 fill-current animate-bounce" />
          <span>Security Alert: Tab switches detected ({warnings}/3). Switching tabs again will cause automatic test submission!</span>
        </div>
      )}

      {/* Section Switch Modal */}
      {showSectionSwitchModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm">
          <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-8 max-w-sm w-full shadow-2xl text-center">
            <ShieldAlert className="h-16 w-16 text-yellow-500 mx-auto mb-4 animate-pulse" />
            <h3 className="text-lg font-bold text-slate-900 dark:text-white mb-2">Switch Sections?</h3>
            <p className="text-sm text-slate-500 dark:text-slate-400 mb-6">
              You are switching to the {nextSectionToSwitch.toUpperCase()} section. Once you leave, the current section will be locked and you cannot return!
            </p>
            <div className="flex gap-4">
              <button
                onClick={confirmSwitchSection}
                className="flex-1 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-xs font-bold transition-all"
              >
                Yes, Lock & Switch
              </button>
              <button
                onClick={() => setShowSectionSwitchModal(false)}
                className="flex-1 py-2.5 bg-slate-100 hover:bg-slate-200 dark:bg-slate-850 dark:hover:bg-slate-800 text-slate-700 dark:text-slate-300 rounded-xl text-xs font-bold transition-all"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}

      {/* Submit Confirmation Modal */}
      {showSubmitModal && (
        <div className="fixed inset-0 z-50 flex items-center justify-center p-4 bg-black/60 backdrop-blur-sm">
          <div className="bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-8 max-w-sm w-full shadow-2xl text-center">
            <CheckCircle className="h-16 w-16 text-indigo-500 mx-auto mb-4" />
            <h3 className="text-lg font-bold text-slate-900 dark:text-white mb-2">Submit Mock Test?</h3>
            <p className="text-sm text-slate-500 dark:text-slate-400 mb-6">
              Are you sure you want to finish and submit? You have answered {Object.keys(answers).length} of {test.questions.length} questions.
            </p>
            <div className="flex gap-4">
              <button
                onClick={submitTestImmediate}
                className="flex-1 py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-xs font-bold transition-all"
              >
                Yes, Submit
              </button>
              <button
                onClick={() => setShowSubmitModal(false)}
                className="flex-1 py-2.5 bg-slate-100 hover:bg-slate-200 dark:bg-slate-850 dark:hover:bg-slate-800 text-slate-700 dark:text-slate-300 rounded-xl text-xs font-bold transition-all"
              >
                Cancel
              </button>
            </div>
          </div>
        </div>
      )}
      {/* Mobile bottom navigation bar */}
      <div className="lg:hidden sticky bottom-0 bg-white dark:bg-slate-900 border-t border-slate-200 dark:border-slate-850 px-4 py-3 flex items-center justify-between gap-3 z-30">
        <button
          onClick={handlePrevious}
          disabled={sectionsConfig && currentQuestion <= currentSecInfo.start}
          className="flex-1 py-2 rounded-lg border border-slate-200 dark:border-slate-800 text-xs font-bold text-slate-700 dark:text-slate-300 disabled:opacity-50 disabled:cursor-not-allowed min-h-[44px]"
        >
          ← Prev
        </button>
        <button
          onClick={() => setShowNavigator(true)} 
          className="px-4 py-2 rounded-lg bg-slate-100 dark:bg-slate-800 text-xs font-bold text-slate-700 dark:text-slate-300 min-h-[44px]"
        >
          📋 {Object.keys(answers).length}/{test.questions.length}
        </button>
        <button
          onClick={handleNext}
          className="flex-1 py-2 rounded-lg bg-indigo-600 text-white text-xs font-bold min-h-[44px]"
        >
          {sectionsConfig && currentQuestion >= currentSecInfo.end && (sectionIndices.indexOf(currentSecInfo) === sectionIndices.length - 1)
            ? 'Submit'
            : 'Next →'}
        </button>
      </div>

      {/* Mobile navigator bottom sheet */}
      {showNavigator && (
        <div className="lg:hidden fixed inset-0 z-50 flex flex-col justify-end">
          {/* Backdrop */}
          <div className="absolute inset-0 bg-black/50" onClick={() => setShowNavigator(false)} />
          
          {/* Sheet */}
          <div className="relative bg-white dark:bg-slate-900 rounded-t-3xl max-h-[75vh] overflow-y-auto p-6 z-10 shadow-2xl border-t border-slate-200 dark:border-slate-800">
            <div className="flex items-center justify-between mb-4 pb-2 border-b border-slate-100 dark:border-slate-800">
              <h3 className="font-extrabold text-sm text-slate-800 dark:text-slate-350 uppercase tracking-widest">Question Navigator</h3>
              <button onClick={() => setShowNavigator(false)} className="p-2 text-slate-500 hover:text-slate-800 dark:hover:text-white">
                <X size={20} />
              </button>
            </div>
            
            {sectionsConfig ? (
              <div className="space-y-6">
                {sectionIndices.map((sec) => (
                  <div key={sec.name} className="space-y-2">
                    <span className="text-[10px] font-bold text-slate-400 dark:text-slate-500 uppercase tracking-wider block">
                      {sec.name} ({sec.end - sec.start + 1})
                    </span>
                    <div className="grid grid-cols-6 gap-2">
                      {Array.from({ length: sec.end - sec.start + 1 }, (_, i) => sec.start + i).map((idx) => {
                        const status = getQuestionStatus(idx)
                        const isActive = currentQuestion === idx
                        return (
                          <button
                            key={idx}
                            onClick={() => {
                              handleQuestionJump(idx)
                              setShowNavigator(false)
                            }}
                            className={`w-9 h-9 rounded-lg text-xs font-bold transition-all border flex items-center justify-center ${
                              isActive ? 'ring-2 ring-indigo-500 ring-offset-2 dark:ring-offset-slate-900' : ''
                            } ${
                              status === 'review'
                                ? 'bg-yellow-500 border-yellow-500 text-white shadow-sm'
                                : status === 'answered'
                                ? 'bg-indigo-600 border-indigo-600 text-white shadow-sm'
                                : status === 'visited'
                                ? 'bg-slate-200 border-slate-300 dark:bg-slate-800 dark:border-slate-700 text-slate-700 dark:text-slate-300'
                                : 'bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 text-slate-400 dark:text-slate-600'
                            }`}
                          >
                            {idx + 1}
                          </button>
                        )
                      })}
                    </div>
                  </div>
                ))}
              </div>
            ) : (
              <div className="grid grid-cols-6 gap-2">
                {test.questions.map((_, idx) => {
                  const status = getQuestionStatus(idx)
                  const isActive = currentQuestion === idx
                  return (
                    <button
                      key={idx}
                      onClick={() => {
                        handleQuestionJump(idx)
                        setShowNavigator(false)
                      }}
                      className={`w-9 h-9 rounded-lg text-xs font-bold transition-all border flex items-center justify-center ${
                        isActive ? 'ring-2 ring-indigo-500 ring-offset-2 dark:ring-offset-slate-900' : ''
                      } ${
                        status === 'review'
                          ? 'bg-yellow-500 border-yellow-500 text-white'
                          : status === 'answered'
                          ? 'bg-indigo-600 border-indigo-600 text-white'
                          : status === 'visited'
                          ? 'bg-slate-200 border-slate-300 dark:bg-slate-800 dark:border-slate-750 text-slate-700 dark:text-slate-300'
                          : 'bg-white dark:bg-slate-900 border-slate-200 dark:border-slate-800 text-slate-400 dark:text-slate-600'
                      }`}
                    >
                      {idx + 1}
                    </button>
                  )
                })}
              </div>
            )}
            
            <div className="border-t border-slate-100 dark:border-slate-800 pt-4 mt-6 flex justify-center">
              <button
                onClick={() => {
                  setShowNavigator(false)
                  setShowSubmitModal(true)
                }}
                className="w-full py-3 bg-rose-600 hover:bg-rose-700 text-white rounded-xl text-xs font-bold transition-all shadow-md"
              >
                Submit Test
              </button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}

export default MockTestTaking
