import React from 'react'

export const LoadingSpinner = ({ size = 'md', text = 'Loading...' }) => {
  const sizeClasses = {
    sm: 'h-8 w-8',
    md: 'h-12 w-12',
    lg: 'h-16 w-16'
  }

  return (
    <div className="flex flex-col justify-center items-center min-h-screen">
      <div className={`animate-spin rounded-full ${sizeClasses[size]} border-b-4 border-primary-600 mb-4`}></div>
      <p className="text-gray-600 dark:text-gray-400">{text}</p>
    </div>
  )
}

export const PageLoader = ({ text = 'Loading...' }) => (
  <div className="flex flex-col justify-center items-center min-h-[60vh]">
    <div className="animate-spin rounded-full h-16 w-16 border-b-4 border-primary-600 mb-4"></div>
    <p className="text-gray-600 dark:text-gray-400 text-lg">{text}</p>
  </div>
)

export const InlineLoader = () => (
  <div className="flex items-center justify-center py-8">
    <div className="animate-spin rounded-full h-8 w-8 border-b-2 border-primary-600"></div>
  </div>
)
