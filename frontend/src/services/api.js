import axios from 'axios'

const API_BASE_URL = import.meta.env.VITE_API_URL || '/api'

const api = axios.create({
  baseURL: API_BASE_URL,
  headers: {
    'Content-Type': 'application/json'
  }
})

// Add token to requests if available
api.interceptors.request.use((config) => {
  const token = localStorage.getItem('token')
  if (token) {
    config.headers.Authorization = `Bearer ${token}`
  }
  return config
})

export default api

// Ping backend every 14 mins to keep it alive
setInterval(() => {
  fetch('https://aptiquest-ke42.onrender.com/api/health')
    .catch(() => {});
}, 14 * 60 * 1000);
