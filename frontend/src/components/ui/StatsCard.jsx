import React from 'react'
import { 
  CheckCircle, 
  Target, 
  Clock, 
  TrendingUp, 
  Award,
  BookOpen,
  Users,
  Star
} from 'lucide-react'

export const StatsCard = ({ 
  title, 
  value, 
  subtitle, 
  icon: Icon, 
  color = 'blue',
  trend = null,
  size = 'md'
}) => {
  const colorClasses = {
    blue: 'from-blue-500 to-blue-600',
    green: 'from-green-500 to-green-600',
    red: 'from-red-500 to-red-600',
    yellow: 'from-yellow-500 to-yellow-600',
    purple: 'from-purple-500 to-purple-600',
    orange: 'from-orange-500 to-orange-600',
    emerald: 'from-emerald-500 to-emerald-600'
  }

  const iconColorClasses = {
    blue: 'text-blue-200',
    green: 'text-green-200',
    red: 'text-red-200',
    yellow: 'text-yellow-200',
    purple: 'text-purple-200',
    orange: 'text-orange-200',
    emerald: 'text-emerald-200'
  }

  const sizeClasses = {
    sm: 'p-3',
    md: 'p-4',
    lg: 'p-6'
  }

  return (
    <div className={`bg-gradient-to-r ${colorClasses[color]} rounded-xl text-white ${sizeClasses[size]}`}>
      <div className="flex items-center justify-between">
        <div>
          <p className={`text-white/80 text-sm ${size === 'lg' ? 'text-base' : ''}`}>
            {title}
          </p>
          <p className={`font-bold ${size === 'sm' ? 'text-xl' : size === 'md' ? 'text-2xl' : 'text-3xl'}`}>
            {value}
          </p>
          {subtitle && (
            <p className="text-white/70 text-xs mt-1">
              {subtitle}
            </p>
          )}
          {trend && (
            <div className="flex items-center gap-1 mt-2">
              {trend.isPositive ? (
                <TrendingUp className="h-3 w-3" />
              ) : (
                <TrendingUp className="h-3 w-3 rotate-180" />
              )}
              <span className="text-xs">
                {trend.value}% {trend.isPositive ? 'up' : 'down'}
              </span>
            </div>
          )}
        </div>
        <Icon className={`h-8 w-8 ${iconColorClasses[color]}`} />
      </div>
    </div>
  )
}

export const UserStatsGrid = ({ stats }) => (
  <div className="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-4 gap-4">
    <StatsCard
      title="Total Solved"
      value={stats.totalSolved || 0}
      subtitle="Questions completed"
      icon={CheckCircle}
      color="blue"
      trend={stats.totalSolvedTrend}
    />
    <StatsCard
      title="Accuracy"
      value={`${stats.accuracy || 0}%`}
      subtitle="Success rate"
      icon={Target}
      color="green"
      trend={stats.accuracyTrend}
    />
    <StatsCard
      title="Avg Time"
      value={`${stats.avgTime || 0}s`}
      subtitle="Per question"
      icon={Clock}
      color="purple"
      trend={stats.avgTimeTrend}
    />
    <StatsCard
      title="Streak"
      value={`${stats.streak || 0} days`}
      subtitle="Current streak"
      icon={TrendingUp}
      color="orange"
      trend={stats.streakTrend}
    />
  </div>
)

export const TopicStatsCard = ({ topic, stats }) => (
  <div className="bg-white dark:bg-gray-800 rounded-xl shadow-lg p-6 border border-gray-200 dark:border-gray-700">
    <div className="flex items-start justify-between mb-4">
      <div className="p-3 bg-gradient-to-br from-blue-500 to-purple-600 rounded-lg">
        <BookOpen className="h-6 w-6 text-white" />
      </div>
      <span className="text-sm font-medium text-gray-500 dark:text-gray-400">
        {stats.total} questions
      </span>
    </div>
    
    <h3 className="text-xl font-bold mb-3 text-gray-900 dark:text-white">
      {topic}
    </h3>
    
    <div className="space-y-3">
      <div className="flex items-center justify-between">
        <span className="text-sm text-gray-600 dark:text-gray-400">Progress</span>
        <span className="font-medium text-gray-900 dark:text-white">
          {Math.round((stats.completed / stats.total) * 100)}%
        </span>
      </div>
      
      <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
        <div 
          className="bg-gradient-to-r from-blue-500 to-purple-600 h-2 rounded-full transition-all duration-500"
          style={{ width: `${(stats.completed / stats.total) * 100}%` }}
        />
      </div>
      
      <div className="flex items-center justify-between text-sm">
        <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
          <CheckCircle className="h-3 w-3" />
          <span>{stats.completed} completed</span>
        </div>
        <div className="flex items-center gap-1 text-gray-500 dark:text-gray-400">
          <Clock className="h-3 w-3" />
          <span>{stats.avgTime}s avg</span>
        </div>
      </div>
    </div>
  </div>
)

export const LeaderboardCard = ({ rank, user, score, avatar, isCurrentUser = false }) => (
  <div className={`flex items-center gap-4 p-4 rounded-lg transition-all ${
    isCurrentUser 
      ? 'bg-blue-50 dark:bg-blue-900/20 border-2 border-blue-200 dark:border-blue-800' 
      : 'bg-white dark:bg-gray-800 border border-gray-200 dark:border-gray-700'
  }`}>
    <div className={`flex items-center justify-center w-8 h-8 rounded-full font-bold text-sm ${
      rank === 1 ? 'bg-yellow-100 text-yellow-800' :
      rank === 2 ? 'bg-gray-100 text-gray-800' :
      rank === 3 ? 'bg-orange-100 text-orange-800' :
      'bg-gray-100 text-gray-600'
    }`}>
      {rank}
    </div>
    
    <div className="flex-1">
      <div className="flex items-center gap-3">
        {avatar && (
          <img 
            src={avatar} 
            alt={user.name}
            className="w-10 h-10 rounded-full object-cover"
          />
        )}
        <div>
          <p className="font-semibold text-gray-900 dark:text-white">
            {user.name}
            {isCurrentUser && (
              <span className="ml-2 text-xs bg-blue-100 text-blue-800 px-2 py-1 rounded-full">
                YOU
              </span>
            )}
          </p>
          <p className="text-sm text-gray-500 dark:text-gray-400">
            Level {user.level || 1}
          </p>
        </div>
      </div>
    </div>
    
    <div className="text-right">
      <p className="font-bold text-lg text-gray-900 dark:text-white">
        {score}
      </p>
      <p className="text-xs text-gray-500 dark:text-gray-400">
        points
      </p>
    </div>
  </div>
)
