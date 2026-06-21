import { Lock, Check, ShieldAlert } from 'lucide-react'

const BadgeGrid = ({ badges }) => {
  return (
    <div className="bg-white dark:bg-slate-800 rounded-2xl border border-slate-200 dark:border-slate-700 p-6 shadow-sm">
      <h3 className="text-xl font-bold text-slate-900 dark:text-white mb-6 flex items-center gap-2">
        🏅 Achievements & Badges
      </h3>

      <div className="grid grid-cols-3 sm:grid-cols-4 lg:grid-cols-5 gap-4">
        {badges.map((badge) => {
          const isEarned = badge.isEarned
          const progressPercent = Math.min(Math.round((badge.progress / badge.target) * 100), 100)

          return (
            <div
              key={badge.badgeKey}
              className={`relative flex flex-col items-center p-5 rounded-xl border text-center transition-all ${
                isEarned
                  ? 'bg-gradient-to-br from-indigo-50/50 to-purple-50/50 dark:from-indigo-950/20 dark:to-purple-950/20 border-indigo-200 dark:border-indigo-800/60 shadow-sm'
                  : 'bg-slate-50/50 dark:bg-slate-900/40 border-slate-200 dark:border-slate-800 opacity-75'
              }`}
            >
              {/* Badge Icon (Emoji) */}
              <div className={`relative inline-flex items-center justify-center w-16 h-16 rounded-full text-4xl mb-3 shadow-inner ${
                isEarned 
                  ? 'bg-gradient-to-br from-indigo-500 to-purple-500 text-white drop-shadow-[0_4px_8px_rgba(99,102,241,0.2)]'
                  : 'bg-slate-200 dark:bg-slate-800 text-slate-400 grayscale'
              }`}>
                {badge.icon}

                {/* Status Indicator overlay */}
                <div className={`absolute -bottom-1 -right-1 p-1 rounded-full text-white border border-white dark:border-slate-800 ${
                  isEarned 
                    ? 'bg-green-500' 
                    : 'bg-slate-400'
                }`}>
                  {isEarned ? (
                    <Check className="h-3 w-3 stroke-[3]" />
                  ) : (
                    <Lock className="h-3 w-3" />
                  )}
                </div>
              </div>

              {/* Name */}
              <h4 className="text-sm font-bold text-slate-900 dark:text-white mb-1 line-clamp-1">
                {badge.name}
              </h4>
              
              {/* Description */}
              <p className="text-xs text-slate-500 dark:text-slate-400 line-clamp-2 min-h-[2rem] leading-relaxed mb-3">
                {badge.description}
              </p>

              {/* Progress bar */}
              <div className="w-full mt-auto">
                <div className="flex items-center justify-between text-[10px] text-slate-500 dark:text-slate-400 font-semibold mb-1">
                  <span>{badge.progress} / {badge.target}</span>
                  <span>{progressPercent}%</span>
                </div>
                <div className="w-full bg-slate-200 dark:bg-slate-700 h-1.5 rounded-full overflow-hidden">
                  <div
                    className={`h-full rounded-full transition-all duration-500 ${
                      isEarned 
                        ? 'bg-gradient-to-r from-indigo-500 to-purple-500' 
                        : 'bg-slate-400 dark:bg-slate-500'
                    }`}
                    style={{ width: `${progressPercent}%` }}
                  />
                </div>
              </div>

              {/* Earned Date / points label overlay */}
              {isEarned && badge.earnedAt && (
                <div className="absolute top-2 left-2 bg-indigo-600 text-[9px] font-bold text-white px-2 py-0.5 rounded-full">
                  +{badge.pointsReward} pts
                </div>
              )}
            </div>
          )
        })}
      </div>
    </div>
  )
}

export default BadgeGrid
