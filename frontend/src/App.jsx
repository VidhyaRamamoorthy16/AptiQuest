import { useState, useEffect } from 'react'
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom'
import { Toaster } from 'react-hot-toast'
import { AuthProvider } from './context/AuthContext'
import { ThemeProvider } from './context/ThemeContext'
import Navbar from './components/Navbar'
import Home from './pages/Home'
import Login from './pages/Login'
import Register from './pages/Register'
import Dashboard from './pages/Dashboard'
import Practice from './pages/Practice'
import QuestionPage from './pages/QuestionPage'
import Tests from './pages/Tests'
import TestTaking from './pages/TestTaking'
import TestResult from './pages/TestResult'
import MockTestLanding from './pages/MockTestLanding'
import MockTestTaking from './pages/MockTestTaking'
import MockTestResult from './pages/MockTestResult'
import Leaderboard from './pages/Leaderboard'
import Bookmarks from './pages/Bookmarks'
import Admin from './pages/Admin'
import QuestionManager from './pages/QuestionManager'
import UserManagement from './pages/UserManagement'
import BulkUpload from './pages/BulkUpload'
import ProtectedRoute from './components/ProtectedRoute'
import './App.css'

function App() {
  return (
    <ThemeProvider>
      <AuthProvider>
        <Router>
          <div className="min-h-screen bg-slate-50 dark:bg-slate-950 transition-colors font-sans selection:bg-primary-500/20 selection:text-primary-700">
            <Navbar />
            <main className="container mx-auto px-4 py-8 pt-24 max-w-7xl">
              <Routes>
                <Route path="/" element={<Home />} />
                <Route path="/login" element={<Login />} />
                <Route path="/register" element={<Register />} />
                <Route
                  path="/dashboard"
                  element={
                    <ProtectedRoute>
                      <Dashboard />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/practice"
                  element={
                    <ProtectedRoute>
                      <Practice />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/practice/:section"
                  element={
                    <ProtectedRoute>
                      <Practice />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/question/:id"
                  element={
                    <ProtectedRoute>
                      <QuestionPage />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/tests"
                  element={
                    <ProtectedRoute>
                      <Tests />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/tests/:testId"
                  element={
                    <ProtectedRoute>
                      <TestTaking />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/tests/:testId/result"
                  element={
                    <ProtectedRoute>
                      <TestResult />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/mock-test"
                  element={
                    <ProtectedRoute>
                      <MockTestLanding />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/mock-test/:testId"
                  element={
                    <ProtectedRoute>
                      <MockTestTaking />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/mock-test/:attemptId/result"
                  element={
                    <ProtectedRoute>
                      <MockTestResult />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/leaderboard"
                  element={
                    <ProtectedRoute>
                      <Leaderboard />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/bookmarks"
                  element={
                    <ProtectedRoute>
                      <Bookmarks />
                    </ProtectedRoute>
                  }
                />
                <Route
                  path="/admin"
                  element={
                    <ProtectedRoute>
                      <Admin />
                    </ProtectedRoute>
                  }
                >
                  <Route index element={<Admin />} />
                  <Route path="questions" element={<QuestionManager />} />
                  <Route path="bulk-upload" element={<BulkUpload />} />
                  <Route path="users" element={<UserManagement />} />
                </Route>
                <Route path="*" element={<Navigate to="/" replace />} />
              </Routes>
            </main>
            <Toaster position="top-right" />
          </div>
        </Router>
      </AuthProvider>
    </ThemeProvider>
  )
}

export default App

