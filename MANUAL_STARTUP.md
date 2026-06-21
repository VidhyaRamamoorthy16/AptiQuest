# 🚀 Manual Startup Commands for Aptitude Web

## Quick Start (3 Steps)

### Step 1: Start MySQL
```bash
brew services start mysql
```

### Step 2: Start Backend (Terminal 1)
```bash
cd /Users/deekshith/VScode/aptitudeweb/backend
npm run dev
```
**Wait for:** `🚀 Server running on port 5500`

### Step 3: Start Frontend (Terminal 2 - NEW TERMINAL)
```bash
cd /Users/deekshith/VScode/aptitudeweb/frontend
npm run dev
```
**Wait for:** `➜  Local:   http://localhost:3000/`

---

## 🌐 Access the Application
Open your browser and go to: **http://localhost:3000**

---

## 🛑 Stop Servers

### Stop Backend/Frontend
Press `Ctrl + C` in each terminal

### Stop MySQL
```bash
brew services stop mysql
```

---

## 🔧 Troubleshooting

### If ports are already in use:
```bash
# Check what's using the ports
lsof -i :3000
lsof -i :5500

# Kill processes (replace PID with actual process ID)
kill -9 <PID>
```

### If MySQL won't start:
```bash
# Check MySQL status
brew services list | grep mysql

# Restart MySQL
brew services restart mysql
```

---

## ✅ Verify Everything is Running

1. **Backend Health Check:** http://localhost:5500/api/health
2. **Frontend:** http://localhost:3000
3. **Questions API:** http://localhost:5500/api/questions

---

**Note:** You now have **120+ diverse questions** across all topics!
