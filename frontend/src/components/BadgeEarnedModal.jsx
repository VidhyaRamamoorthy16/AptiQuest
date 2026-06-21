import { useEffect } from 'react'
import confetti from 'canvas-confetti'
import { Award, Zap, X } from 'lucide-react'

const BadgeEarnedModal = ({ isOpen, onClose, badge }) => {
  useEffect(() => {
    if (isOpen && badge) {
      // Trigger a nice confetti explosion
      const duration = 2 * 1000
      const end = Date.now() + duration

      const frame = () => {
        confetti({
          particleCount: 5,
          angle: 60,
          spread: 55,
          origin: { x: 0 },
          colors: ['#6366f1', '#22c55e', '#f59e0b']
        })
        confetti({
          particleCount: 5,
          angle: 120,
          spread: 55,
          origin: { x: 1 },
          colors: ['#6366f1', '#22c55e', '#f59e0b']
        })

        if (Date.now() < end) {
          requestAnimationFrame(frame)
        }
      }
      frame()
    }
  }, [isOpen, badge])

  if (!isOpen || !badge) return null

  return (
    <div className="fixed inset-0 z-50 flex items-center justify-center p-4">
      {/* Backdrop */}
      <div 
        className="fixed inset-0 bg-black/60 backdrop-blur-sm transition-opacity" 
        onClick={onClose}
      />

      {/* Modal Content */}
      <div className="relative bg-white dark:bg-slate-900 border border-slate-200 dark:border-slate-800 rounded-2xl p-8 max-w-sm w-full shadow-2xl text-center z-10 transform scale-100 transition-transform">
        <button
          onClick={onClose}
          className="absolute right-4 top-4 p-1.5 rounded-lg text-slate-400 hover:text-slate-600 dark:hover:text-slate-200 hover:bg-slate-100 dark:hover:bg-slate-800 transition-colors"
        >
          <X className="h-5 w-5" />
        </button>

        {/* Badge Icon Container */}
        <div className="relative inline-flex items-center justify-center w-24 h-24 rounded-full bg-gradient-to-br from-indigo-500 to-purple-600 text-white text-5xl mb-6 shadow-lg shadow-indigo-500/20 animate-bounce">
          {badge.icon}
          <div className="absolute -top-1 -right-1 bg-yellow-500 text-white p-1 rounded-full border-2 border-white dark:border-slate-900">
            <Award className="h-4 w-4" />
          </div>
        </div>

        {/* Title */}
        <h3 className="text-2xl font-bold text-slate-900 dark:text-white mb-2">
          New Badge Unlocked!
        </h3>
        <p className="text-xl font-semibold text-indigo-600 dark:text-indigo-400 mb-4">
          {badge.name}
        </p>

        {/* Description */}
        <p className="text-sm text-slate-600 dark:text-slate-400 mb-6 px-2">
          {badge.description}
        </p>

        {/* Reward */}
        {badge.pointsReward > 0 && (
          <div className="inline-flex items-center gap-2 px-4 py-2 bg-yellow-100 dark:bg-yellow-900/30 text-yellow-800 dark:text-yellow-300 rounded-full text-sm font-semibold mb-6">
            <Zap className="h-4 w-4 fill-current" />
            +{badge.pointsReward} Points Claimed
          </div>
        )}

        {/* Action Button */}
        <button
          onClick={onClose}
          className="w-full py-3 bg-gradient-to-r from-indigo-600 to-purple-600 hover:from-indigo-700 hover:to-purple-700 text-white rounded-xl font-bold transition-all shadow-md hover:shadow-lg focus:outline-none focus:ring-2 focus:ring-indigo-500"
        >
          Keep Going!
        </button>
      </div>
    </div>
  )
}

export default BadgeEarnedModal
