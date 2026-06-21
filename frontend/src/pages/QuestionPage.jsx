import { useEffect, useState } from 'react'
import { useParams } from 'react-router-dom'
import api from '../services/api'
import toast from 'react-hot-toast'

const QuestionPage = () => {
  const { id } = useParams()
  const [question, setQuestion] = useState(null)
  const [selectedAnswer, setSelectedAnswer] = useState('')
  const [submitted, setSubmitted] = useState(false)
  const [result, setResult] = useState(null)
  const [loading, setLoading] = useState(true)

  useEffect(() => {
    fetchQuestion()
  }, [id])

  const fetchQuestion = async () => {
    try {
      const response = await api.get(`/questions/${id}`)
      setQuestion(response.data.question)
    } catch (error) {
      toast.error('Failed to load question')
    } finally {
      setLoading(false)
    }
  }

  const handleSubmit = async () => {
    if (!selectedAnswer) {
      toast.error('Please select an answer')
      return
    }

    try {
      const response = await api.post(
        `/questions/${id}/attempt`,
        { selectedAnswer }
      )
      setResult(response.data)
      setSubmitted(true)
      if (response.data.isCorrect) {
        toast.success('Correct!')
      } else {
        toast.error('Incorrect. Check the solution.')
      }
    } catch (error) {
      toast.error('Failed to submit answer')
    }
  }

  if (loading) {
    return (
      <div className="flex justify-center items-center min-h-screen">
        <div className="animate-spin rounded-full h-12 w-12 border-b-2 border-primary-600"></div>
      </div>
    )
  }

  if (!question) {
    return <div>Question not found</div>
  }

  return (
    <div className="max-w-4xl mx-auto">
      <div className="card mb-6">
        <div className="flex justify-between items-center mb-4">
          <span className="px-3 py-1 bg-primary-100 dark:bg-primary-900 rounded-full text-sm font-medium">
            {question.topic_name}
          </span>
          <span className={`px-3 py-1 rounded-full text-sm font-medium ${
            question.difficulty === 'easy' ? 'bg-green-100 dark:bg-green-900' :
            question.difficulty === 'medium' ? 'bg-yellow-100 dark:bg-yellow-900' :
            'bg-red-100 dark:bg-red-900'
          }`}>
            {question.difficulty}
          </span>
        </div>

        <h2 className="text-xl font-semibold mb-4 text-gray-900 dark:text-white">
          {question.question}
        </h2>

        <div className="space-y-3 mb-6">
          {question.options?.map((option, index) => (
            <label
              key={index}
              className={`flex items-center p-4 border-2 rounded-lg cursor-pointer transition-colors ${
                selectedAnswer === option.option_label
                  ? 'border-primary-500 bg-primary-50 dark:bg-primary-900'
                  : 'border-gray-300 dark:border-gray-600 hover:border-primary-300'
              }`}
            >
              <input
                type="radio"
                name="answer"
                value={option.option_label}
                checked={selectedAnswer === option.option_label}
                onChange={(e) => setSelectedAnswer(e.target.value)}
                disabled={submitted}
                className="mr-3"
              />
              <span className="font-medium mr-2">{option.option_label}.</span>
              <span className="text-gray-700 dark:text-gray-300">{option.option_text}</span>
            </label>
          ))}
        </div>

        {!submitted && (
          <button onClick={handleSubmit} className="btn-primary w-full">
            Submit Answer
          </button>
        )}

        {submitted && result && (
          <div className="mt-6 p-4 rounded-lg bg-gray-50 dark:bg-gray-800">
            <div className={`text-lg font-semibold mb-4 ${
              result.isCorrect ? 'text-green-600 dark:text-green-400' : 'text-red-600 dark:text-red-400'
            }`}>
              {result.isCorrect ? '✓ Correct!' : '✗ Incorrect'}
            </div>
            {!result.isCorrect && (
              <div className="mb-4">
                <p className="text-gray-700 dark:text-gray-300">
                  Correct Answer: <span className="font-bold">{result.correctAnswer}</span>
                </p>
              </div>
            )}
            <div className="mb-4">
              <h3 className="font-semibold mb-2 text-gray-900 dark:text-white">Solution:</h3>
              <p className="text-gray-700 dark:text-gray-300 whitespace-pre-line">
                {result.solution}
              </p>
            </div>
            {result.explanation && (
              <div>
                <h3 className="font-semibold mb-2 text-gray-900 dark:text-white">Explanation:</h3>
                <p className="text-gray-700 dark:text-gray-300 whitespace-pre-line">
                  {result.explanation}
                </p>
              </div>
            )}
          </div>
        )}
      </div>
    </div>
  )
}

export default QuestionPage

