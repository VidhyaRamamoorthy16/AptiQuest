# ✅ Complete Setup Guide - All Issues Fixed

## 🚀 Quick Start (Easiest Method)

### Option 1: Use the Startup Script
```bash
cd /Users/deekshith/VScode/aptitudeweb
./START_ALL.sh
```

This script will:
- ✅ Install all dependencies
- ✅ Start MySQL if needed
- ✅ Start backend server
- ✅ Start frontend server
- ✅ Show status

### Option 2: Manual Start (Step by Step)

#### Step 1: Install All Dependencies
```bash
cd /Users/deekshith/VScode/aptitudeweb
npm run setup
```

OR manually:
```bash
cd backend && npm install
cd ../frontend && npm install
```

#### Step 2: Ensure MySQL is Running
```bash
brew services start mysql
# OR
mysql.server start
```

Verify:
```bash
mysql -u root -e "SELECT 1;"
```

#### Step 3: Start Backend (Terminal 1)
```bash
cd /Users/deekshith/VScode/aptitudeweb/backend
npm run dev
```

Wait for: `🚀 Server running on port 5500`

#### Step 4: Start Frontend (Terminal 2)
```bash
cd /Users/deekshith/VScode/aptitudeweb/frontend
npm run dev
```

Wait for: `➜  Local:   http://localhost:3000/`

#### Step 5: Open Browser
```
http://localhost:3000
```

---

## 📋 Pre-Installation Checklist

### Required Software:
- ✅ Node.js (v16+) - Check: `node --version`
- ✅ npm - Check: `npm --version`
- ✅ MySQL - Check: `mysql --version`

### If Missing:
```bash
# Install Node.js (if needed)
brew install node

# Install MySQL (if needed)
brew install mysql
brew services start mysql
```

---

## 🔧 Troubleshooting

### Issue: Backend won't start
**Solution:**
```bash
cd backend
# Check .env file exists
ls -la .env

# If missing, create it:
cat > .env << 'EOF'
PORT=5500
NODE_ENV=development
DB_HOST=localhost
DB_USER=root
DB_PASSWORD=
DB_NAME=aptitudeweb
JWT_SECRET=aptitudeweb_secret_key_change_in_production_2024
JWT_EXPIRE=7d
CORS_ORIGIN=http://localhost:3000
EOF

# Install dependencies
npm install

# Start server
npm run dev
```

### Issue: Frontend won't start
**Solution:**
```bash
cd frontend
npm install
npm run dev
```

### Issue: Database connection error
**Solution:**
```bash
# Start MySQL
brew services start mysql

# Verify database exists
mysql -u root -e "USE aptitudeweb; SELECT COUNT(*) FROM questions;"

# If database doesn't exist, create it:
mysql -u root < database/schema.sql
mysql -u root aptitudeweb < database/sample_data.sql
mysql -u root aptitudeweb < database/questions_quantitative.sql
mysql -u root aptitudeweb < database/questions_quantitative_part2.sql
mysql -u root aptitudeweb < database/questions_quantitative_part3.sql
mysql -u root aptitudeweb < database/questions_quantitative_part4.sql
```

### Issue: Port already in use
**Solution:**
```bash
# Kill processes on ports
lsof -ti:5500 | xargs kill -9
lsof -ti:3000 | xargs kill -9

# Or kill all node processes
killall node
```

---

## ✅ Verification Commands

### Check Backend:
```bash
curl http://localhost:5500/api/health
# Should return: {"success":true,"message":"Server is running"}
```

### Check Frontend:
```bash
curl http://localhost:3000
# Should return HTML content
```

### Check Database:
```bash
mysql -u root aptitudeweb -e "SELECT COUNT(*) FROM questions;"
# Should show: 176+ questions
```

### Check Questions API:
```bash
curl http://localhost:5500/api/questions
# Should return JSON with questions
```

---

## 📊 Current Status

- ✅ **Backend Code**: Complete
- ✅ **Frontend Code**: Complete
- ✅ **Database Schema**: Complete
- ✅ **Questions**: 176+ loaded
- ✅ **Configuration**: Complete
- ✅ **Dependencies**: Ready to install

---

## 🎯 What's Ready

1. **176+ Questions** in database
2. **All Topics**: Number System, Percentages, Profit & Loss, etc.
3. **User Authentication**: JWT-based login/register
4. **Question Practice**: MCQ interface with solutions
5. **Progress Tracking**: Dashboard ready
6. **Dark/Light Mode**: Theme toggle
7. **Responsive Design**: Mobile-friendly

---

## 🚀 Next Steps After Starting

1. Open http://localhost:3000
2. Click "Sign Up" to create account
3. Login and browse topics
4. Start practicing questions!
5. Track your progress

---

## 📝 Useful Commands

```bash
# Install all dependencies
npm run setup

# Check MySQL status
npm run check:mysql

# Check database questions
npm run check:db

# Start backend only
npm run start:backend

# Start frontend only
npm run start:frontend
```

---

**Status**: ✅ All setup complete | 🚀 Ready to run!

**Just run:** `./START_ALL.sh` or follow manual steps above.

