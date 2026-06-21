import { useEffect, useState } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import api from '../services/api'
import { Shield, Clock, Award, Sliders, Play, RotateCcw, AlertTriangle, Loader2 } from 'lucide-react'
import toast from 'react-hot-toast'

const MockTestLanding = () => {
  const navigate = useNavigate()
  const [loading, setLoading] = useState(true)
  const [history, setHistory] = useState([])
  const [presets, setPresets] = useState([])

  // Custom builder states
  const [quantCount, setQuantCount] = useState(25)
  const [logicalCount, setLogicalCount] = useState(20)
  const [diCount, setDiCount] = useState(15)
  const [duration, setDuration] = useState(60) // in minutes
  const [generating, setGenerating] = useState(false)

  useEffect(() => {
    fetchData()
  }, [])

  // Auto-calculate duration based on total questions (1 min per question)
  useEffect(() => {
    setDuration(quantCount + logicalCount + diCount)
  }, [quantCount, logicalCount, diCount])

  const fetchData = async () => {
    try {
      setLoading(true)
      const [presetsRes, historyRes] = await Promise.all([
        api.get('/mock-tests'),
        api.get('/mock-tests/history')
      ])
      setPresets(presetsRes.data || [])
      setHistory(historyRes.data || [])
    } catch (error) {
      console.error('Failed to fetch mock test data:', error)
      toast.error('Failed to load mock tests')
    } finally {
      setLoading(false)
    }
  }

  const handleStartPreset = (id) => {
    navigate(`/mock-test/${id}`)
  }

  const handleGenerateTest = async () => {
    try {
      setGenerating(true)
      const response = await api.post('/mock-tests/generate', {
        sections: {
          quantitative: quantCount,
          logical: logicalCount,
          di: diCount
        },
        duration
      })
      toast.success('Mock test generated!')
      navigate(`/mock-test/${response.data.testId}`)
    } catch (error) {
      console.error('Error generating custom test:', error)
      toast.error('Failed to generate mock test. Ensure sufficient questions exist.')
    } finally {
      setGenerating(false)
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
    <div className="space-y-10 max-w-6xl mx-auto px-4">
      {/* Header */}
      <div>
        <h1 className="text-3xl font-extrabold text-slate-900 dark:text-white flex items-center gap-2">
          🎯 Mock Test Center
        </h1>
        <p className="text-slate-600 dark:text-slate-400 mt-2">
          Simulate real campus placement exam conditions. Track your scores, percentiles, and sections performance.
        </p>
      </div>

      {/* Preset cards */}
      <div className="grid md:grid-cols-3 gap-6">
        {/* Full Mock Test Preset */}
        <div className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-2xl p-6 shadow-sm flex flex-col">
          <div className="text-3xl mb-4">📋</div>
          <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-2">Full Mock Test</h3>
          <p className="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-1">
            Standard 60-question mock test combining Quantitative, Logical Reasoning, and Data Interpretation. Ideal for placement assessments.
          </p>
          <button
            onClick={() => handleStartPreset(presets.find(p => p.test_type === 'mock')?.id || 1)}
            className="w-full py-2.5 bg-indigo-600 hover:bg-indigo-700 text-white rounded-xl text-xs font-bold transition-all flex items-center justify-center gap-2"
          >
            <Play className="h-4 w-4 fill-current" /> Start Test
          </button>
        </div>

        {/* Speed Challenge */}
        <div className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-2xl p-6 shadow-sm flex flex-col">
          <div className="text-3xl mb-4">⚡</div>
          <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-2">Speed Challenge</h3>
          <p className="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-1">
            Quick 20-question mixed topic speed run. Complete questions under extreme time pressure to build confidence and muscle memory.
          </p>
          <button
            onClick={() => handleStartPreset(presets.find(p => p.test_type === 'speed')?.id || 3)}
            className="w-full py-2.5 bg-amber-600 hover:bg-amber-700 text-white rounded-xl text-xs font-bold transition-all flex items-center justify-center gap-2"
          >
            <Play className="h-4 w-4 fill-current" /> Start Speed Challenge
          </button>
        </div>

        {/* Accuracy Mode */}
        <div className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-2xl p-6 shadow-sm flex flex-col">
          <div className="text-3xl mb-4">🛡️</div>
          <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-2">Accuracy Mode</h3>
          <p className="text-sm text-slate-500 dark:text-slate-400 mb-6 flex-1">
            Focus purely on accuracy with 30 mock questions and relaxed timers. Learn concepts thoroughly without racing against the clock.
          </p>
          <button
            onClick={() => handleStartPreset(presets.find(p => p.test_type === 'accuracy')?.id || 4)}
            className="w-full py-2.5 bg-green-600 hover:bg-green-700 text-white rounded-xl text-xs font-bold transition-all flex items-center justify-center gap-2"
          >
            <Play className="h-4 w-4 fill-current" /> Start Accuracy Test
          </button>
        </div>
      </div>

      {/* Custom Test Builder */}
      <div className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-2xl p-8 shadow-sm">
        <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-6 flex items-center gap-2">
          <Sliders className="h-5 w-5 text-indigo-500" /> Custom Mock Test Builder
        </h3>

        <div className="grid md:grid-cols-3 gap-8 mb-8">
          {/* Quantitative count */}
          <div className="space-y-2">
            <div className="flex justify-between text-sm font-semibold text-slate-700 dark:text-slate-300">
              <span>Quantitative Questions</span>
              <span className="text-indigo-600 dark:text-indigo-400">{quantCount} Qs</span>
            </div>
            <input
              type="range"
              min="5"
              max="30"
              step="5"
              value={quantCount}
              onChange={(e) => setQuantCount(parseInt(e.target.value))}
              className="w-full accent-indigo-600"
            />
          </div>

          {/* Logical count */}
          <div className="space-y-2">
            <div className="flex justify-between text-sm font-semibold text-slate-700 dark:text-slate-300">
              <span>Logical Reasoning Questions</span>
              <span className="text-indigo-600 dark:text-indigo-400">{logicalCount} Qs</span>
            </div>
            <input
              type="range"
              min="5"
              max="25"
              step="5"
              value={logicalCount}
              onChange={(e) => setLogicalCount(parseInt(e.target.value))}
              className="w-full accent-indigo-600"
            />
          </div>

          {/* DI count */}
          <div className="space-y-2">
            <div className="flex justify-between text-sm font-semibold text-slate-700 dark:text-slate-300">
              <span>Data Interpretation Questions</span>
              <span className="text-indigo-600 dark:text-indigo-400">{diCount} Qs</span>
            </div>
            <input
              type="range"
              min="5"
              max="15"
              step="5"
              value={diCount}
              onChange={(e) => setDiCount(parseInt(e.target.value))}
              className="w-full accent-indigo-600"
            />
          </div>
        </div>

        <div className="flex flex-col sm:flex-row items-center justify-between gap-6 border-t border-slate-100 dark:border-slate-700/60 pt-6">
          <div className="flex items-center gap-6">
            <div className="text-center sm:text-left">
              <span className="text-xs text-slate-400 uppercase tracking-widest block font-semibold">Total Duration</span>
              <span className="text-2xl font-black text-slate-900 dark:text-white flex items-center gap-1.5 justify-center sm:justify-start mt-0.5">
                <Clock className="h-5 w-5 text-indigo-500" />
                {duration} Mins
              </span>
            </div>
            <div className="text-center sm:text-left">
              <span className="text-xs text-slate-400 uppercase tracking-widest block font-semibold">Total Questions</span>
              <span className="text-2xl font-black text-slate-900 dark:text-white flex items-center gap-1.5 justify-center sm:justify-start mt-0.5">
                <Award className="h-5 w-5 text-indigo-500" />
                {quantCount + logicalCount + diCount} Qs
              </span>
            </div>
          </div>

          <button
            onClick={handleGenerateTest}
            disabled={generating}
            className="w-full sm:w-auto px-8 py-3 bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white font-bold rounded-xl shadow-md hover:shadow-lg transition-all flex items-center justify-center gap-2 disabled:opacity-50"
          >
            {generating ? (
              <>
                <Loader2 className="h-5 w-5 animate-spin" /> Generating Test...
              </>
            ) : (
              <>
                <Play className="h-4 w-4 fill-current" /> Generate & Start Test
              </>
            )}
          </button>
        </div>
      </div>

      {/* Past Mock Test History */}
      <div className="bg-white dark:bg-slate-800 border border-slate-200 dark:border-slate-700 rounded-2xl shadow-sm overflow-hidden">
        <div className="p-6 border-b border-slate-100 dark:border-slate-700">
          <h3 className="text-lg font-bold text-slate-900 dark:text-white flex items-center gap-2">
            <RotateCcw className="h-5 w-5 text-indigo-500" /> Mock Test Attempt History
          </h3>
        </div>

        {history.length === 0 ? (
          <div className="p-12 text-center text-slate-500">
            <AlertTriangle className="h-8 w-8 text-slate-350 mx-auto mb-3" />
            <p className="text-sm font-semibold">No mock test history found.</p>
            <p className="text-xs text-slate-400 mt-1">Complete your first mock test to see performance details here.</p>
          </div>
        ) : (
          <div className="overflow-x-auto">
            <table className="w-full text-left">
              <thead>
                <tr className="bg-slate-50 dark:bg-slate-900 text-xs font-bold text-slate-500 dark:text-slate-400 border-b border-slate-100 dark:border-slate-700">
                  <th className="px-6 py-4">Test Name</th>
                  <th className="px-6 py-4">Date</th>
                  <th className="px-6 py-4">Score</th>
                  <th className="px-6 py-4">Accuracy</th>
                  <th className="px-6 py-4">Time Taken</th>
                  <th className="px-6 py-4">Actions</th>
                </tr>
              </thead>
              <tbody className="divide-y divide-slate-150 dark:divide-slate-700 text-slate-700 dark:text-slate-300 text-sm">
                {history.map((h) => (
                  <tr key={h.id} className="hover:bg-slate-50/50 dark:hover:bg-slate-850/50">
                    <td className="px-6 py-4 font-semibold text-slate-900 dark:text-white">{h.testName}</td>
                    <td className="px-6 py-4 text-xs">{new Date(h.date).toLocaleDateString()}</td>
                    <td className="px-6 py-4 font-bold">{h.score} pts</td>
                    <td className="px-6 py-4">
                      <span className={`px-2 py-0.5 rounded-full text-xs font-bold ${
                        h.accuracy >= 80 
                          ? 'bg-green-100 text-green-800 dark:bg-green-950 dark:text-green-300'
                          : h.accuracy >= 50
                          ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-950 dark:text-yellow-300'
                          : 'bg-red-100 text-red-800 dark:bg-red-950 dark:text-red-300'
                      }`}>
                        {parseFloat(h.accuracy).toFixed(1)}%
                      </span>
                    </td>
                    <td className="px-6 py-4 text-xs font-medium">
                      {Math.floor(h.timeTaken / 60)}m {h.timeTaken % 60}s
                    </td>
                    <td className="px-6 py-4">
                      <Link
                        to={`/mock-test/${h.id}/result`}
                        className="text-xs font-bold text-indigo-600 hover:text-indigo-800 dark:text-indigo-400 dark:hover:text-indigo-300 bg-indigo-50 dark:bg-indigo-950/40 px-3 py-1 rounded-md transition-all"
                      >
                        Review
                      </Link>
                    </td>
                  </tr>
                ))}
              </tbody>
            </table>
          </div>
        )}
      </div>
    </div>
  )
}

export default MockTestLanding
