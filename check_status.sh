#!/bin/bash

echo "🔍 Checking AptitudeWeb Status..."
echo ""

# Check Backend
echo "Backend (Port 5500):"
if curl -s http://localhost:5500/api/health > /dev/null 2>&1; then
    echo "  ✅ Running - http://localhost:5500"
    curl -s http://localhost:5500/api/health | head -1
else
    echo "  ❌ Not running"
    echo "  Start with: cd backend && npm run dev"
fi

echo ""

# Check Frontend
echo "Frontend (Port 3000):"
if curl -s http://localhost:3000 > /dev/null 2>&1; then
    echo "  ✅ Running - http://localhost:3000"
else
    echo "  ❌ Not running"
    echo "  Start with: cd frontend && npm run dev"
fi

echo ""

# Check Database
echo "Database:"
QUESTIONS=$(mysql -u root aptitudeweb -e "SELECT COUNT(*) FROM questions;" 2>/dev/null | tail -1)
if [ ! -z "$QUESTIONS" ]; then
    echo "  ✅ Connected - $QUESTIONS questions loaded"
else
    echo "  ❌ Not connected"
    echo "  Start MySQL: brew services start mysql"
fi

echo ""
echo "🌐 Open http://localhost:3000 in your browser!"

