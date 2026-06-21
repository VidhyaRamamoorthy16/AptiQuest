import { Link } from 'react-router-dom'
import { useAuth } from '../context/AuthContext'

const Home = () => {
  const { isAuthenticated } = useAuth()

  const sections = [
    {
      name: 'Quantitative Aptitude',
      description: 'Master mathematics and numerical problem solving',
      topics: ['Number System', 'Percentages', 'Profit & Loss', 'Time & Work', 'Algebra', 'Probability'],
      color: 'bg-blue-500'
    },
    {
      name: 'Logical Reasoning',
      description: 'Enhance your analytical and logical thinking',
      topics: ['Coding-Decoding', 'Blood Relations', 'Puzzles', 'Syllogism', 'Series', 'Analogies'],
      color: 'bg-green-500'
    },
    {
      name: 'Data Interpretation',
      description: 'Analyze and interpret data effectively',
      topics: ['Tables', 'Bar Graphs', 'Line Charts', 'Pie Charts', 'Case-lets', 'Mixed DI'],
      color: 'bg-purple-500'
    }
  ]

  return (
    <div className="space-y-12">
      {/* Hero Section */}
      <section className="text-center py-16">
        <h1 className="text-5xl font-bold text-gray-900 dark:text-white mb-4">
          Prepare for Campus Placements
        </h1>
        <p className="text-xl text-gray-600 dark:text-gray-300 mb-8">
          Master Quantitative Aptitude, Logical Reasoning, and Data Interpretation
        </p>
        {!isAuthenticated && (
          <div className="flex gap-4 justify-center">
            <Link to="/register" className="btn-primary text-lg px-8 py-3">
              Get Started
            </Link>
            <Link to="/login" className="btn-secondary text-lg px-8 py-3">
              Login
            </Link>
          </div>
        )}
      </section>

      {/* Features Section */}
      <section>
        <h2 className="text-3xl font-bold text-center mb-8 text-gray-900 dark:text-white">
          Why Choose AptitudeWeb?
        </h2>
        <div className="grid md:grid-cols-3 gap-6">
          <div className="card text-center">
            <div className="text-4xl mb-4">📚</div>
            <h3 className="text-xl font-semibold mb-2">Comprehensive Question Bank</h3>
            <p className="text-gray-600 dark:text-gray-400">
              Thousands of questions covering all topics with detailed solutions
            </p>
          </div>
          <div className="card text-center">
            <div className="text-4xl mb-4">⏱️</div>
            <h3 className="text-xl font-semibold mb-2">Timed Tests</h3>
            <p className="text-gray-600 dark:text-gray-400">
              Practice with realistic timed tests to improve your speed
            </p>
          </div>
          <div className="card text-center">
            <div className="text-4xl mb-4">📊</div>
            <h3 className="text-xl font-semibold mb-2">Track Progress</h3>
            <p className="text-gray-600 dark:text-gray-400">
              Monitor your performance and identify areas for improvement
            </p>
          </div>
        </div>
      </section>

      {/* Sections Overview */}
      <section>
        <h2 className="text-3xl font-bold text-center mb-8 text-gray-900 dark:text-white">
          Practice Sections
        </h2>
        <div className="grid md:grid-cols-3 gap-6">
          {sections.map((section, index) => (
            <div key={index} className="card hover:shadow-lg transition-shadow">
              <div className={`${section.color} text-white p-4 rounded-lg mb-4`}>
                <h3 className="text-2xl font-bold">{section.name}</h3>
              </div>
              <p className="text-gray-600 dark:text-gray-400 mb-4">
                {section.description}
              </p>
              <div className="flex flex-wrap gap-2 mb-4">
                {section.topics.slice(0, 3).map((topic, i) => (
                  <span
                    key={i}
                    className="px-2 py-1 bg-gray-200 dark:bg-gray-700 rounded text-sm"
                  >
                    {topic}
                  </span>
                ))}
                <span className="px-2 py-1 bg-gray-200 dark:bg-gray-700 rounded text-sm">
                  +{section.topics.length - 3} more
                </span>
              </div>
              {isAuthenticated && (
                <Link
                  to={`/practice/${section.name.toLowerCase().replace(' ', '-')}`}
                  className="btn-primary w-full text-center"
                >
                  Start Practice
                </Link>
              )}
            </div>
          ))}
        </div>
      </section>
    </div>
  )
}

export default Home

