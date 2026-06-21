import { Flame, Star, Zap, Calendar } from 'lucide-react'

const StreakBanner = ({ currentStreak = 0, longestStreak = 0, totalPoints = 0, lastActiveDate, isActiveToday, weeklyActivity = [] }) => {
  const isHighStreak = currentStreak >= 7

  // Helper to determine status text for last active date
  const getLastActiveText = () => {
    if (isActiveToday) return 'Today'
    
    if (lastActiveDate) {
      const today = new Date().toISOString().split('T')[0]
      const yesterday = new Date()
      yesterday.setDate(yesterday.getDate() - 1)
      const yesterdayStr = yesterday.toISOString().split('T')[0]
      
      if (lastActiveDate === yesterdayStr) return 'Yesterday'
      return lastActiveDate
    }
    
    return 'Never'
  }

  return (
    <div className={`relative bg-gradient-to-r from-orange-500 via-red-500 to-indigo-600 rounded-3xl p-6 text-white overflow-hidden shadow-xl border border-orange-400/20 ${
      isHighStreak ? 'shadow-orange-500/20' : ''
    }`}>
      {/* Decorative background shapes */}
      <div className="absolute right-0 top-0 w-64 h-64 bg-white/10 rounded-full blur-3xl -mr-16 -mt-16 pointer-events-none" />
      <div className="absolute left-1/3 bottom-0 w-32 h-32 bg-white/5 rounded-full blur-2xl -ml-16 pointer-events-none" />

      <div className="flex flex-col lg:flex-row lg:items-center justify-between gap-6 relative z-10">
        
        {/* Left Side: Flame + Streak Stats */}
        <div className="flex items-center gap-5">
          {/* Flame Icon Container */}
          <div className={`relative inline-flex items-center justify-center w-16 h-16 rounded-2xl bg-white/15 text-orange-200 text-3xl shadow-inner ${
            currentStreak > 0 ? 'animate-pulse' : ''
          }`}>
            <Flame className={`h-9 w-9 ${currentStreak > 0 ? 'fill-orange-400 text-orange-400 drop-shadow-[0_0_8px_rgba(251,146,60,0.8)]' : 'text-slate-300'}`} />
          </div>

          <div className="space-y-1">
            <h2 className="text-2xl font-black tracking-tight">
              {currentStreak > 0 ? `${currentStreak}-Day Active Streak!` : 'Start Your Streak Today!'}
            </h2>
            <div className="flex flex-wrap gap-x-4 gap-y-1 text-orange-100 text-xs font-semibold">
              <span className="flex items-center gap-1">
                <Star className="h-3.5 w-3.5 fill-current" />
                Longest: {longestStreak} days
              </span>
              <span className="flex items-center gap-1">
                <Calendar className="h-3.5 w-3.5" />
                Last active: {getLastActiveText()}
              </span>
            </div>
          </div>
        </div>

        {/* Middle: 7-Day activity Calendar Strip */}
        <div className="bg-white/10 backdrop-blur-md rounded-2xl p-4 border border-white/10 shadow-sm flex flex-col gap-2">
          <div className="text-[10px] uppercase font-black tracking-widest text-orange-100">7-Day Activity Strip</div>
          <div className="flex gap-1 sm:gap-2">
            {weeklyActivity.length > 0 ? (
              weeklyActivity.map((day, idx) => (
                <div key={idx} className="flex flex-col items-center gap-1 w-7 sm:w-8">
                  <span className="text-[10px] font-black text-orange-100">{day.day}</span>
                  <div className={`h-5.5 w-5.5 sm:h-6 sm:w-6 rounded-lg flex items-center justify-center text-[10px] font-black transition-all ${
                    day.active 
                      ? 'bg-orange-500 text-white shadow-md shadow-orange-500/30' 
                      : 'bg-white/10 text-white/50 border border-white/10'
                  }`}>
                    {day.active ? '🔥' : ''}
                  </div>
                </div>
              ))
            ) : (
              <div className="text-xs text-orange-100 font-medium">Activity data unavailable</div>
            )}
          </div>
        </div>

        {/* Right Side: total points reward stats */}
        <div className="flex items-center gap-4 bg-white/15 backdrop-blur-md rounded-2xl p-4 border border-white/10 shadow-sm justify-center lg:justify-start">
          <div className="text-center px-4 border-r border-white/10">
            <p className="text-[10px] text-orange-100 uppercase tracking-widest font-black">Total Points</p>
            <p className="text-2xl font-black text-white flex items-center justify-center gap-1 mt-0.5">
              <Zap className="h-5 w-5 fill-yellow-400 text-yellow-400" />
              {totalPoints}
            </p>
          </div>
          <div className="text-center px-4">
            <p className="text-[10px] text-orange-100 uppercase tracking-widest font-black">Level</p>
            <p className="text-xs font-black text-white mt-2 bg-white/20 px-3 py-1 rounded-full uppercase tracking-wider">
              {currentStreak >= 30 ? '⚡ Unstoppable' : currentStreak >= 7 ? '🔥 Consistent' : '🌱 Aspirant'}
            </p>
          </div>
        </div>

      </div>
    </div>
  )
}

export default StreakBanner

