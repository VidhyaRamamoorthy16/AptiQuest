import React from 'react'

export const ProgressBar = ({ 
  value, 
  max = 100, 
  size = 'md', 
  color = 'blue', 
  showLabel = true,
  animated = true 
}) => {
  const percentage = Math.min((value / max) * 100, 100)
  
  const sizeClasses = {
    sm: 'h-1',
    md: 'h-2',
    lg: 'h-3'
  }
  
  const colorClasses = {
    blue: 'bg-blue-600',
    green: 'bg-green-600',
    red: 'bg-red-600',
    yellow: 'bg-yellow-600',
    purple: 'bg-purple-600',
    emerald: 'bg-emerald-600'
  }

  return (
    <div className="w-full">
      {showLabel && (
        <div className="flex items-center justify-between text-sm mb-2">
          <span className="text-gray-600 dark:text-gray-400">Progress</span>
          <span className="font-medium text-gray-900 dark:text-white">{Math.round(percentage)}%</span>
        </div>
      )}
      <div className={`w-full bg-gray-200 dark:bg-gray-700 rounded-full ${sizeClasses[size]}`}>
        <div 
          className={`${colorClasses[color]} ${sizeClasses[size]} rounded-full transition-all duration-500 ${
            animated ? 'ease-out' : ''
          }`}
          style={{ width: `${percentage}%` }}
        />
      </div>
    </div>
  )
}

export const CircularProgress = ({ 
  value, 
  max = 100, 
  size = 'md', 
  color = 'blue',
  showLabel = true 
}) => {
  const percentage = Math.min((value / max) * 100, 100)
  
  const sizeClasses = {
    sm: 'w-16 h-16',
    md: 'w-24 h-24',
    lg: 'w-32 h-32'
  }
  
  const colorClasses = {
    blue: 'text-blue-600',
    green: 'text-green-600',
    red: 'text-red-600',
    yellow: 'text-yellow-600',
    purple: 'text-purple-600',
    emerald: 'text-emerald-600'
  }

  const strokeWidth = {
    sm: 2,
    md: 3,
    lg: 4
  }

  const radius = {
    sm: 28,
    md: 40,
    lg: 52
  }

  const circumference = 2 * Math.PI * radius[size]
  const strokeDashoffset = circumference - (percentage / 100) * circumference

  return (
    <div className={`relative ${sizeClasses[size]}`}>
      <svg 
        className={`transform -rotate-90 ${sizeClasses[size]}`}
        viewBox="0 0 100 100"
      >
        <circle
          cx="50"
          cy="50"
          r={radius[size]}
          stroke="currentColor"
          strokeWidth={strokeWidth[size]}
          fill="none"
          className="text-gray-200 dark:text-gray-700"
        />
        <circle
          cx="50"
          cy="50"
          r={radius[size]}
          stroke="currentColor"
          strokeWidth={strokeWidth[size]}
          fill="none"
          strokeDasharray={circumference}
          strokeDashoffset={strokeDashoffset}
          className={`${colorClasses[color]} transition-all duration-500 ease-out`}
          strokeLinecap="round"
        />
      </svg>
      {showLabel && (
        <div className="absolute inset-0 flex items-center justify-center">
          <span className="text-sm font-semibold text-gray-900 dark:text-white">
            {Math.round(percentage)}%
          </span>
        </div>
      )}
    </div>
  )
}
