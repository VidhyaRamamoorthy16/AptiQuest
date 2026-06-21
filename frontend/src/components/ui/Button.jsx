import React from 'react'
import { 
  CheckCircle, 
  XCircle, 
  Clock, 
  Star, 
  BookOpen,
  Target,
  ArrowRight,
  Plus,
  Edit,
  Trash2,
  Download,
  Upload
} from 'lucide-react'

export const Button = ({ 
  children, 
  variant = 'primary', 
  size = 'md', 
  disabled = false,
  loading = false,
  icon: Icon,
  iconPosition = 'left',
  className = '',
  ...props 
}) => {
  const baseClasses = 'inline-flex items-center justify-center font-medium rounded-lg transition-all duration-200 focus:outline-none focus:ring-2 focus:ring-offset-2'
  
  const variantClasses = {
    primary: 'bg-blue-600 text-white hover:bg-blue-700 focus:ring-blue-500 disabled:bg-gray-300 disabled:cursor-not-allowed',
    secondary: 'bg-gray-200 text-gray-900 hover:bg-gray-300 focus:ring-gray-500 dark:bg-gray-700 dark:text-gray-100 dark:hover:bg-gray-600',
    success: 'bg-green-600 text-white hover:bg-green-700 focus:ring-green-500',
    danger: 'bg-red-600 text-white hover:bg-red-700 focus:ring-red-500',
    warning: 'bg-yellow-600 text-white hover:bg-yellow-700 focus:ring-yellow-500',
    outline: 'border border-gray-300 text-gray-700 hover:bg-gray-50 focus:ring-blue-500 dark:border-gray-600 dark:text-gray-300 dark:hover:bg-gray-700',
    ghost: 'text-gray-700 hover:bg-gray-100 focus:ring-gray-500 dark:text-gray-300 dark:hover:bg-gray-700',
    link: 'text-blue-600 hover:text-blue-800 focus:ring-blue-500 dark:text-blue-400 dark:hover:text-blue-300'
  }
  
  const sizeClasses = {
    sm: 'px-3 py-1.5 text-sm',
    md: 'px-4 py-2 text-sm',
    lg: 'px-6 py-3 text-base',
    xl: 'px-8 py-4 text-lg'
  }

  const iconSize = {
    sm: 'h-4 w-4',
    md: 'h-4 w-4',
    lg: 'h-5 w-5',
    xl: 'h-6 w-6'
  }

  const classes = `${baseClasses} ${variantClasses[variant]} ${sizeClasses[size]} ${className}`

  return (
    <button 
      className={classes}
      disabled={disabled || loading}
      {...props}
    >
      {loading && (
        <div className="animate-spin rounded-full h-4 w-4 border-b-2 border-current mr-2" />
      )}
      
      {Icon && iconPosition === 'left' && !loading && (
        <Icon className={`${iconSize[size]} mr-2`} />
      )}
      
      {children}
      
      {Icon && iconPosition === 'right' && !loading && (
        <Icon className={`${iconSize[size]} ml-2`} />
      )}
    </button>
  )
}

export const IconButton = ({ 
  icon: Icon, 
  variant = 'ghost', 
  size = 'md', 
  tooltip,
  className = '',
  ...props 
}) => {
  const sizeClasses = {
    sm: 'p-1.5',
    md: 'p-2',
    lg: 'p-2.5'
  }

  const iconSize = {
    sm: 'h-3 w-3',
    md: 'h-4 w-4',
    lg: 'h-5 w-5'
  }

  return (
    <button 
      className={`rounded-lg transition-colors ${sizeClasses[size]} ${className}`}
      title={tooltip}
      {...props}
    >
      <Icon className={iconSize[size]} />
    </button>
  )
}

// Pre-configured button variants
export const SolveButton = ({ completed, ...props }) => (
  <Button
    variant={completed ? 'success' : 'primary'}
    icon={completed ? CheckCircle : Target}
    {...props}
  >
    {completed ? 'Review Solution' : 'Solve Question'}
  </Button>
)

export const BookmarkButton = ({ bookmarked, ...props }) => (
  <IconButton
    icon={Star}
    variant={bookmarked ? 'warning' : 'ghost'}
    className={bookmarked ? 'text-yellow-600 bg-yellow-100 hover:bg-yellow-200' : ''}
    tooltip={bookmarked ? 'Remove bookmark' : 'Bookmark question'}
    {...props}
  />
)

export const ResetButton = (props) => (
  <Button
    variant="outline"
    icon={ArrowRight}
    {...props}
  >
    Try Again
  </Button>
)

export const HintButton = ({ show, ...props }) => (
  <Button
    variant="outline"
    icon={BookOpen}
    {...props}
  >
    {show ? 'Hide' : 'Show'} Hint
  </Button>
)

export const SubmitButton = ({ disabled, ...props }) => (
  <Button
    variant="primary"
    icon={Target}
    disabled={disabled}
    {...props}
  >
    Submit Answer
  </Button>
)

export const BackButton = (props) => (
  <Button
    variant="ghost"
    icon={ArrowRight}
    iconPosition="right"
    {...props}
  >
    Back
  </Button>
)

export const AddButton = (props) => (
  <Button
    variant="primary"
    icon={Plus}
    {...props}
  >
    Add New
  </Button>
)

export const EditButton = (props) => (
  <IconButton
    icon={Edit}
    variant="ghost"
    tooltip="Edit"
    className="text-blue-600 hover:bg-blue-50 dark:text-blue-400 dark:hover:bg-blue-900/20"
    {...props}
  />
)

export const DeleteButton = (props) => (
  <IconButton
    icon={Trash2}
    variant="ghost"
    tooltip="Delete"
    className="text-red-600 hover:bg-red-50 dark:text-red-400 dark:hover:bg-red-900/20"
    {...props}
  />
)

export const DownloadButton = (props) => (
  <Button
    variant="outline"
    icon={Download}
    {...props}
  >
    Download
  </Button>
)

export const UploadButton = (props) => (
  <Button
    variant="outline"
    icon={Upload}
    {...props}
  >
    Upload
  </Button>
)
