import { useState, useEffect } from 'react'
import { Link, useNavigate } from 'react-router-dom'
import { Sun, Moon, Menu, X } from 'lucide-react'
import { useAuth } from '../context/AuthContext'
import { useTheme } from '../context/ThemeContext'

const Navbar = () => {
  const { user, logout, isAuthenticated } = useAuth()
  const { darkMode, toggleTheme } = useTheme()
  const [mobileMenuOpen, setMobileMenuOpen] = useState(false)
  const navigate = useNavigate()

  const handleLogout = () => {
    logout()
    navigate('/')
  }

  useEffect(() => {
    const handleClickOutside = () => setMobileMenuOpen(false)
    if (mobileMenuOpen) {
      const timer = setTimeout(() => {
        document.addEventListener('click', handleClickOutside)
      }, 0)
      return () => {
        clearTimeout(timer)
        document.removeEventListener('click', handleClickOutside)
      }
    }
  }, [mobileMenuOpen])

  return (
    <nav className="fixed top-0 w-full z-50 border-b border-slate-200 bg-white/80 backdrop-blur-md dark:border-slate-800 dark:bg-slate-950/80">
      <div className="container mx-auto px-4 h-16 flex items-center justify-between relative">
        <Link to="/" className="text-xl font-display font-bold tracking-tight text-slate-900 dark:text-white flex items-center gap-2">
          <img src="/logo.png" alt="AptitudeWeb Logo" className="h-8 w-8 object-contain" />
          AptitudeWeb
        </Link>

        <div className="flex items-center gap-6">
          {isAuthenticated ? (
            <>
              <div className="hidden md:flex items-center gap-6 text-sm font-medium">
                <Link to="/dashboard" className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors">
                  Dashboard
                </Link>
                <Link to="/practice" className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors">
                  Practice
                </Link>
                <Link to="/tests" className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors">
                  Tests
                </Link>
                <Link to="/leaderboard" className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors">
                  Leaderboard
                </Link>
                <Link to="/bookmarks" className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors">
                  Bookmarks
                </Link>
                {user?.role === 'admin' && (
                  <Link to="/admin" className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors">
                    Admin
                  </Link>
                )}
              </div>

              <div className="hidden md:flex items-center gap-4 pl-6 border-l border-slate-200 dark:border-slate-800">
                <span className="text-sm font-medium text-slate-900 dark:text-slate-100 flex items-center gap-2">
                  <span>{user?.name}</span>
                  {user?.total_points !== undefined && (
                    <span className="inline-flex items-center gap-0.5 px-2 py-0.5 bg-yellow-100 dark:bg-yellow-900/30 text-yellow-800 dark:text-yellow-400 rounded-full text-xs font-bold border border-yellow-200 dark:border-yellow-900/40">
                      ⚡ {user.total_points}
                    </span>
                  )}
                </span>
                <button
                  onClick={handleLogout}
                  className="text-sm text-slate-500 hover:text-rose-600 dark:text-slate-400 dark:hover:text-rose-400 transition-colors"
                >
                  Sign out
                </button>
              </div>
            </>
          ) : (
            <div className="flex items-center gap-4">
              <Link to="/login" className="text-sm font-medium text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50">
                Log in
              </Link>
              <Link to="/register" className="btn-primary">
                Get Started
              </Link>
            </div>
          )}

          <button
            onClick={toggleTheme}
            className="p-2 rounded-full text-slate-500 hover:bg-slate-100 dark:text-slate-400 dark:hover:bg-slate-800 transition-all"
            aria-label="Toggle theme"
          >
            {darkMode ? (
              <Sun className="h-5 w-5" />
            ) : (
              <Moon className="h-5 w-5" />
            )}
          </button>

          {isAuthenticated && (
            <button
              onClick={() => setMobileMenuOpen(!mobileMenuOpen)}
              className="p-2 rounded-lg text-slate-500 hover:bg-slate-100 dark:text-slate-400 dark:hover:bg-slate-800 transition-all md:hidden"
              aria-label="Toggle navigation menu"
            >
              {mobileMenuOpen ? <X className="h-6 w-6" /> : <Menu className="h-6 w-6" />}
            </button>
          )}
        </div>

        {/* Mobile Dropdown */}
        {isAuthenticated && mobileMenuOpen && (
          <div className="md:hidden absolute top-16 left-0 right-0 z-50 bg-white dark:bg-slate-900 border-b border-slate-200 dark:border-slate-800 shadow-lg py-4 px-6 flex flex-col gap-2">
            <Link to="/dashboard" onClick={() => setMobileMenuOpen(false)} className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors py-2 font-medium">
              Dashboard
            </Link>
            <Link to="/practice" onClick={() => setMobileMenuOpen(false)} className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors py-2 font-medium">
              Practice
            </Link>
            <Link to="/tests" onClick={() => setMobileMenuOpen(false)} className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors py-2 font-medium">
              Tests
            </Link>
            <Link to="/leaderboard" onClick={() => setMobileMenuOpen(false)} className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors py-2 font-medium">
              Leaderboard
            </Link>
            <Link to="/bookmarks" onClick={() => setMobileMenuOpen(false)} className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors py-2 font-medium">
              Bookmarks
            </Link>
            {user?.role === 'admin' && (
              <Link to="/admin" onClick={() => setMobileMenuOpen(false)} className="text-slate-600 hover:text-slate-900 dark:text-slate-400 dark:hover:text-slate-50 transition-colors py-2 font-medium">
                Admin
              </Link>
            )}
            
            <div className="border-t border-slate-200 dark:border-slate-800 pt-4 mt-2 flex flex-col gap-2">
              <div className="flex items-center justify-between">
                <span className="text-sm font-semibold text-slate-900 dark:text-slate-100 flex items-center gap-2">
                  <span>{user?.name}</span>
                  {user?.total_points !== undefined && (
                    <span className="inline-flex items-center gap-0.5 px-2 py-0.5 bg-yellow-100 dark:bg-yellow-900/30 text-yellow-800 dark:text-yellow-400 rounded-full text-xs font-bold border border-yellow-200 dark:border-yellow-900/40">
                      ⚡ {user.total_points}
                    </span>
                  )}
                </span>
              </div>
              <button
                onClick={() => {
                  setMobileMenuOpen(false)
                  handleLogout()
                }}
                className="text-sm text-left font-medium text-slate-500 hover:text-rose-600 dark:text-slate-400 dark:hover:text-rose-400 py-2 transition-colors"
              >
                Sign out
              </button>
            </div>
          </div>
        )}
      </div>
    </nav>
  )
}

export default Navbar


