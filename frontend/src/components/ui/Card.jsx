import React from 'react'

export const Card = ({ 
  children, 
  className = '', 
  hover = false, 
  padding = 'md',
  border = true,
  shadow = true,
  ...props 
}) => {
  const baseClasses = 'bg-white dark:bg-gray-800 rounded-xl transition-all duration-200'
  
  const paddingClasses = {
    none: '',
    sm: 'p-3',
    md: 'p-6',
    lg: 'p-8',
    xl: 'p-10'
  }
  
  const hoverClasses = hover ? 'hover:shadow-xl hover:-translate-y-1' : ''
  const borderClasses = border ? 'border border-gray-200 dark:border-gray-700' : ''
  const shadowClasses = shadow ? 'shadow-lg' : ''

  const classes = `${baseClasses} ${paddingClasses[padding]} ${hoverClasses} ${borderClasses} ${shadowClasses} ${className}`

  return (
    <div className={classes} {...props}>
      {children}
    </div>
  )
}

export const CardHeader = ({ children, className = '', ...props }) => (
  <div className={`mb-4 ${className}`} {...props}>
    {children}
  </div>
)

export const CardTitle = ({ children, className = '', ...props }) => (
  <h3 className={`text-lg font-semibold text-gray-900 dark:text-white ${className}`} {...props}>
    {children}
  </h3>
)

export const CardDescription = ({ children, className = '', ...props }) => (
  <p className={`text-sm text-gray-600 dark:text-gray-400 mt-1 ${className}`} {...props}>
    {children}
  </p>
)

export const CardContent = ({ children, className = '', ...props }) => (
  <div className={className} {...props}>
    {children}
  </div>
)

export const CardFooter = ({ children, className = '', ...props }) => (
  <div className={`mt-4 pt-4 border-t border-gray-200 dark:border-gray-700 ${className}`} {...props}>
    {children}
  </div>
)

// Specialized card components
export const QuestionCard = ({ 
  question, 
  isCompleted = false, 
  onSolve, 
  onBookmark, 
  isBookmarked = false,
  stats = null,
  ...props 
}) => (
  <Card hover className="overflow-hidden" {...props}>
    <div className="flex items-start justify-between mb-4">
      <div className="flex items-center gap-3">
        <span className={`px-3 py-1 text-xs font-semibold rounded-full ${
          question.difficulty === 'easy' 
            ? 'bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200' 
            : question.difficulty === 'medium' 
            ? 'bg-yellow-100 text-yellow-800 dark:bg-yellow-900 dark:text-yellow-200' 
            : 'bg-red-100 text-red-800 dark:bg-red-900 dark:text-red-200'
        }`}>
          {question.difficulty.toUpperCase()}
        </span>
        <span className="px-3 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200">
          {question.topic_name}
        </span>
        {isCompleted && (
          <span className="px-3 py-1 text-xs font-semibold rounded-full bg-emerald-100 text-emerald-800 dark:bg-emerald-900 dark:text-emerald-200 flex items-center gap-1">
            ✓ COMPLETED
          </span>
        )}
      </div>
    </div>
    
    <h3 className="text-lg font-semibold mb-4 text-gray-900 dark:text-white leading-relaxed">
      {question.question}
    </h3>
    
    <div className="grid grid-cols-1 md:grid-cols-2 gap-2 mb-6">
      {question.options?.slice(0, 2).map((option) => (
        <div key={option.option_label} className="flex items-center gap-2 p-2 bg-gray-50 dark:bg-gray-700 rounded-lg">
          <span className="font-semibold text-gray-600 dark:text-gray-400 text-sm">
            {option.option_label}.
          </span>
          <span className="text-gray-700 dark:text-gray-300 text-sm truncate">
            {option.option_text}
          </span>
        </div>
      ))}
      {question.options?.length > 2 && (
        <div className="text-sm text-gray-500 dark:text-gray-400 italic">
          +{question.options.length - 2} more options...
        </div>
      )}
    </div>
    
    <div className="flex items-center justify-between">
      <div className="flex items-center gap-2">
        <button 
          onClick={onSolve}
          className={`inline-flex items-center gap-2 px-6 py-2.5 rounded-lg font-medium transition-all duration-200 ${
            isCompleted 
              ? 'bg-emerald-100 text-emerald-700 hover:bg-emerald-200 dark:bg-emerald-900 dark:text-emerald-300 dark:hover:bg-emerald-800' 
              : 'bg-blue-600 text-white hover:bg-blue-700 shadow-md hover:shadow-lg'
          }`}
        >
          {isCompleted ? 'Review Solution' : 'Solve Question'}
        </button>
        
        <button 
          onClick={onBookmark}
          className={`p-2.5 rounded-lg border transition-colors ${
            isBookmarked 
              ? 'bg-yellow-100 border-yellow-300 text-yellow-600 hover:bg-yellow-200 dark:bg-yellow-900 dark:border-yellow-700 dark:text-yellow-400' 
              : 'border-gray-300 dark:border-gray-600 hover:bg-gray-50 dark:hover:bg-gray-700'
          }`}
          title={isBookmarked ? 'Remove bookmark' : 'Bookmark question'}
        >
          <Star className={`h-4 w-4 ${isBookmarked ? 'fill-current' : ''}`} />
        </button>
      </div>
      
      {stats && (
        <div className="flex items-center gap-4 text-sm text-gray-500 dark:text-gray-400">
          <span className="flex items-center gap-1">
            <CheckCircle className="h-3 w-3" />
            {stats.successRate}% correct
          </span>
          <span className="flex items-center gap-1">
            <Clock className="h-3 w-3" />
            {stats.avgTime}s avg
          </span>
        </div>
      )}
    </div>
  </Card>
)

export const TopicCard = ({ 
  topic, 
  stats, 
  onClick, 
  ...props 
}) => {
  const completionRate = Math.round((stats.completed / stats.total) * 100)
  
  return (
    <Card hover className="group cursor-pointer overflow-hidden" onClick={onClick} {...props}>
      <div className="absolute inset-0 bg-gradient-to-br from-blue-500/5 to-purple-500/5 opacity-0 group-hover:opacity-100 transition-opacity" />
      
      <div className="relative">
        <div className="flex items-start justify-between mb-4">
          <div className="p-3 bg-gradient-to-br from-blue-500 to-purple-600 rounded-lg">
            <BookOpen className="h-6 w-6 text-white" />
          </div>
          <span className="text-sm font-medium text-gray-500 dark:text-gray-400">
            {stats.total} questions
          </span>
        </div>
        
        <h3 className="text-xl font-bold mb-3 text-gray-900 dark:text-white group-hover:text-blue-600 dark:group-hover:text-blue-400 transition-colors">
          {topic}
        </h3>
        
        <p className="text-gray-600 dark:text-gray-400 mb-4 line-clamp-2">
          Master {topic.toLowerCase()} concepts with comprehensive practice questions
        </p>
        
        <div className="mb-4">
          <div className="flex items-center justify-between text-sm mb-2">
            <span className="text-gray-600 dark:text-gray-400">Progress</span>
            <span className="font-medium text-gray-900 dark:text-white">{completionRate}%</span>
          </div>
          <div className="w-full bg-gray-200 dark:bg-gray-700 rounded-full h-2">
            <div 
              className="bg-gradient-to-r from-blue-500 to-purple-600 h-2 rounded-full transition-all duration-500"
              style={{ width: `${completionRate}%` }}
            />
          </div>
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
        
        <div className="mt-4 pt-4 border-t border-gray-200 dark:border-gray-700">
          <div className="flex items-center justify-between">
            <span className="text-sm font-medium text-blue-600 dark:text-blue-400">
              Start Practice
            </span>
            <div className="transform group-hover:translate-x-1 transition-transform">
              <Target className="h-4 w-4 text-blue-600 dark:text-blue-400" />
            </div>
          </div>
        </div>
      </div>
    </Card>
  )
}

export const StatsCard = ({ 
  title, 
  value, 
  subtitle, 
  icon: Icon, 
  color = 'blue',
  trend = null 
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

  return (
    <div className={`bg-gradient-to-r ${colorClasses[color]} p-4 rounded-lg text-white`}>
      <div className="flex items-center justify-between">
        <div>
          <p className="text-white/80 text-sm">{title}</p>
          <p className="text-2xl font-bold">{value}</p>
          {subtitle && (
            <p className="text-white/70 text-xs mt-1">{subtitle}</p>
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
