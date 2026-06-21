#!/bin/bash

echo "🚀 Starting AptitudeWeb Application..."
echo ""

# Check and install backend dependencies
echo "📦 Checking backend dependencies..."
cd /Users/deekshith/VScode/aptitudeweb/backend
if [ ! -d "node_modules" ]; then
    echo "Installing backend dependencies..."
    npm install
fi

# Check and install frontend dependencies
echo "📦 Checking frontend dependencies..."
cd /Users/deekshith/VScode/aptitudeweb/frontend
if [ ! -d "node_modules" ]; then
    echo "Installing frontend dependencies..."
    npm install
fi

# Check MySQL
echo "🗄️  Checking MySQL..."
if ! mysql -u root -e "SELECT 1;" > /dev/null 2>&1; then
    echo "Starting MySQL..."
    brew services start mysql 2>/dev/null || mysql.server start 2>/dev/null
    sleep 2
fi

# Kill existing processes
echo "🧹 Cleaning up existing processes..."
pkill -f "node.*server.js" 2>/dev/null
pkill -f "vite" 2>/dev/null
pkill -f "nodemon" 2>/dev/null
sleep 1

# Start backend
echo "🔧 Starting backend server..."
cd /Users/deekshith/VScode/aptitudeweb/backend
nohup npm run dev > ../backend.log 2>&1 &
BACKEND_PID=$!
echo "Backend PID: $BACKEND_PID"

# Wait for backend
sleep 4

# Start frontend
echo "🎨 Starting frontend server..."
cd /Users/deekshith/VScode/aptitudeweb/frontend
nohup npm run dev > ../frontend.log 2>&1 &
FRONTEND_PID=$!
echo "Frontend PID: $FRONTEND_PID"

# Wait for frontend
sleep 6

# Check status
echo ""
echo "=== STATUS CHECK ==="
echo ""

# Check backend
if curl -s http://localhost:5500/api/health > /dev/null 2>&1; then
    echo "✅ Backend: Running on http://localhost:5500"
else
    echo "❌ Backend: Not responding (check backend.log)"
fi

# Check frontend
if curl -s http://localhost:3000 > /dev/null 2>&1; then
    echo "✅ Frontend: Running on http://localhost:3000"
else
    echo "❌ Frontend: Not responding (check frontend.log)"
fi

# Check database
QUESTIONS=$(mysql -u root aptitudeweb -e "SELECT COUNT(*) FROM questions;" 2>/dev/null | tail -1)
echo "✅ Database: $QUESTIONS questions loaded"

echo ""
echo "🌐 Open http://localhost:3000 in your browser!"
echo ""
echo "To stop servers:"
echo "  kill $BACKEND_PID $FRONTEND_PID"
echo "  OR: pkill -f 'node.*server.js' && pkill -f 'vite'"

