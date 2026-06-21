import { useEffect, useState } from 'react'
import { useParams, Link, useSearchParams, useNavigate } from 'react-router-dom'
import api from '../services/api'

const PracticeDebug = () => {
  const { section } = useParams()
  const navigate = useNavigate()
  const [searchParams] = useSearchParams()
  const topic = searchParams.get('topic')
  
  const [topics, setTopics] = useState([])
  const [questions, setQuestions] = useState([])
  const [loading, setLoading] = useState(true)
  const [error, setError] = useState(null)

  useEffect(() => {
    console.log('PracticeDebug mounted', { section, topic })
    
    if (topic) {
      fetchQuestions()
    } else {
      fetchTopics()
    }
  }, [section, topic])

  const fetchTopics = async () => {
    console.log('Fetching topics for section:', section)
    try {
      const response = await api.get('/questions', { 
        params: { section, limit: 100 } 
      })
      console.log('Topics response:', response.data)
      
      const uniqueTopics = [...new Set(response.data.questions.map(q => q.topic_name))]
      console.log('Unique topics:', uniqueTopics)
      setTopics(uniqueTopics)
      setLoading(false)
    } catch (error) {
      console.error('Error fetching topics:', error)
      setError('Failed to fetch topics')
      setLoading(false)
    }
  }

  const fetchQuestions = async () => {
    console.log('Fetching questions for topic:', topic, 'section:', section)
    try {
      const response = await api.get('/questions', { 
        params: { section, topic, limit: 20 } 
      })
      console.log('Questions response:', response.data)
      setQuestions(response.data.questions)
      setLoading(false)
    } catch (error) {
      console.error('Error fetching questions:', error)
      setError('Failed to fetch questions')
      setLoading(false)
    }
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        <div className="text-center">
          <div className="animate-spin rounded-full h-16 w-16 border-b-4 border-blue-600 mb-4"></div>
          <p className="text-gray-600 dark:text-gray-400">Loading...</p>
        </div>
      </div>
    )
  }

  if (error) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        <div className="text-center">
          <p className="text-red-600 text-xl mb-4">Error: {error}</p>
          <button 
            onClick={() => window.location.reload()}
            className="px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700"
          >
            Retry
          </button>
        </div>
      </div>
    )
  }

  if (topic) {
    return (
      <div className="max-w-6xl mx-auto p-4">
        <div className="mb-6">
          <button 
            onClick={() => navigate('/practice')}
            className="mb-4 text-blue-600 hover:text-blue-800 flex items-center gap-2"
          >
            ← Back to Topics
          </button>
          <h2 className="text-3xl font-bold text-gray-900 dark:text-white mb-4">
            {topic} Questions ({questions.length})
          </h2>
        </div>
        
        <div className="grid grid-cols-1 lg:grid-cols-2 gap-6">
          {questions.map((question) => (
            <div key={question.id} className="bg-white dark:bg-gray-800 p-6 rounded-lg shadow-md border border-gray-200 dark:border-gray-700">
              <div className="mb-4">
                <span className="px-3 py-1 text-xs font-semibold rounded-full bg-blue-100 text-blue-800 dark:bg-blue-900 dark:text-blue-200">
                  {question.difficulty?.toUpperCase()}
                </span>
                <span className="ml-2 px-3 py-1 text-xs font-semibold rounded-full bg-green-100 text-green-800 dark:bg-green-900 dark:text-green-200">
                  {question.topic_name}
                </span>
              </div>
              
              <h3 className="text-lg font-semibold mb-4 text-gray-900 dark:text-white">
                {question.question}
              </h3>
              
              <div className="space-y-2 mb-4">
                {question.options?.map((option) => (
                  <div key={option.option_label} className="flex items-center gap-2 p-2 bg-gray-50 dark:bg-gray-700 rounded">
                    <span className="font-medium text-gray-700 dark:text-gray-300">
                      {option.option_label}:
                    </span>
                    <span className="text-gray-600 dark:text-gray-400">
                      {option.option_text}
                    </span>
                  </div>
                ))}
              </div>
              
              <Link 
                to={`/question/${question.id}`}
                className="inline-block px-4 py-2 bg-blue-600 text-white rounded hover:bg-blue-700 transition-colors"
              >
                Solve Question
              </Link>
            </div>
          ))}
        </div>
      </div>
    )
  }

  return (
    <div className="max-w-6xl mx-auto p-4">
      <h1 className="text-3xl font-bold mb-8 text-gray-900 dark:text-white">
        {section ? section.charAt(0).toUpperCase() + section.slice(1) : 'Practice'} Topics ({topics.length})
      </h1>
      
      <div className="grid md:grid-cols-2 lg:grid-cols-3 gap-6">
        {topics.map((topic, index) => (
          <Link
            key={index}
            to={`/practice?section=${section}&topic=${encodeURIComponent(topic)}`}
            className="block p-6 bg-white dark:bg-gray-800 rounded-lg shadow-md hover:shadow-lg transition-shadow border border-gray-200 dark:border-gray-700"
          >
            <h3 className="text-xl font-semibold mb-2 text-gray-900 dark:text-white">
              {topic}
            </h3>
            <p className="text-gray-600 dark:text-gray-400">
              Practice questions on {topic}
            </p>
          </Link>
        ))}
      </div>
    </div>
  )
}

export default PracticeDebug
