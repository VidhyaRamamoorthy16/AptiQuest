import React from 'react'
import { CheckCircle, XCircle, Clock, Star, TrendingUp } from 'lucide-react'

export const Badge = ({ 
  children, 
  variant = 'default', 
  size = 'md', 
  icon: Icon,
  className = '',
  ...props 
}) => {
  const baseClasses = 'inline-flex items-center font-medium rounded-full'
  
  const variantClasses = {
    default: 'bg-gray-100 text-gray-800 dark:bg-gray-700 dark:text-gray-200',
    primary: 'bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200',
    success: 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200',
    warning: 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200',
    danger: 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200',
    emerald: 'bg-emerald-100 text-emerald-800 dark:bg-emerald-900 dark:text-emerald-200',
    purple: 'bg-purple-100 text-purple-800 dark:bg-purple-900 dark:text-purple-200'
  }
  
  const sizeClasses = {
    sm: 'px-2 py-0.5 text-xs',
    md: 'px-3 py-1 text-sm',
    lg: 'px-4 py-1.5 text-base'
  }

  const iconSize = {
    sm: 'h-3 w-3',
    md: 'h-4 w-4',
    lg: 'h-5 w-5'
  }

  const classes = `${baseClasses} ${variantClasses[variant]} ${sizeClasses[size]} ${className}`

  return (
    <span className={classes} {...props}>
      {Icon && <Icon className={`${iconSize[size]} mr-1`} />}
      {children}
    </span>
  )
}

// Pre-configured badge variants
export const DifficultyBadge = ({ difficulty, size = 'sm' }) => {
  const config = {
    easy: { variant: 'success', text: 'EASY' },
    medium: { variant: 'warning', text: 'MEDIUM' },
    hard: { variant: 'danger', text: 'HARD' }
  }
  
  const { variant, text } = config[difficulty] || config.medium
  
  return (
    <Badge variant={variant} size={size}>
      {text}
    </Badge>
  )
}

export const StatusBadge = ({ status, size = 'sm' }) => {
  const config = {
    completed: { variant: 'success', text: 'COMPLETED', icon: CheckCircle },
    incorrect: { variant: 'danger', text: 'INCORRECT', icon: XCircle },
    pending: { variant: 'warning', text: 'PENDING', icon: Clock },
    bookmarked: { variant: 'primary', text: 'BOOKMARKED', icon: Star },
    trending: { variant: 'success', text: 'TRENDING', icon: TrendingUp }
  }
  
  const { variant, text, icon } = config[status] || config.pending
  
  return (
    <Badge variant={variant} size={size} icon={icon}>
      {text}
    </Badge>
  )
}

export const TopicBadge = ({ topic, size = 'sm' }) => (
  <Badge variant="primary" size={size}>
    {topic}
  </Badge>
)

export const ProgressBadge = ({ percentage, size = 'sm' }) => {
  const getVariant = (percentage) => {
    if (percentage >= 80) return 'success'
    if (percentage >= 50) return 'warning'
    return 'danger'
  }
  
  return (
    <Badge variant={getVariant(percentage)} size={size}>
      {percentage}%
    </Badge>
  )
}

export const StreakBadge = ({ days, size = 'sm' }) => (
  <Badge variant="warning" size={size} icon={TrendingUp}>
    {days} day streak
  </Badge>
)

export const AccuracyBadge = ({ accuracy, size = 'sm' }) => {
  const getVariant = (accuracy) => {
    if (accuracy >= 90) return 'success'
    if (accuracy >= 70) return 'warning'
    return 'danger'
  }
  
  return (
    <Badge variant={getVariant(accuracy)} size={size}>
      {accuracy}% accuracy
    </Badge>
  )
}

export const TimeBadge = ({ time, size = 'sm' }) => (
  <Badge variant="default" size={size} icon={Clock}>
    {time}s
  </Badge>
)

export const PointsBadge = ({ points, size = 'sm' }) => (
  <Badge variant="primary" size={size}>
    {points} pts
  </Badge>
)

export const LevelBadge = ({ level, size = 'sm' }) => (
  <Badge variant="purple" size={size}>
    Level {level}
  </Badge>
)
