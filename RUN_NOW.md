# 🚀 RUN THE WEBSITE NOW

## Quick Start (Copy & Paste These Commands)

### Step 1: Start Backend (Terminal 1)
```bash
cd /Users/deekshith/VScode/aptitudeweb/backend
npm run dev
```

**Wait for:** `🚀 Server running on port 5500`

### Step 2: Start Frontend (Terminal 2 - NEW TERMINAL)
```bash
cd /Users/deekshith/VScode/aptitudeweb/frontend
npm run dev
```

**Wait for:** `➜  Local:   http://localhost:3000/`

### Step 3: Open Browser
**Open:** http://localhost:3000

---

## ✅ What You Should See

1. **Backend Terminal:**
   ```
   🚀 Server running on port 5500
   📝 Environment: development
   ✅ Database connected successfully
   ```

2. **Frontend Terminal:**
   ```
   VITE v4.x.x  ready in xxx ms
   ➜  Local:   http://localhost:3000/
   ```

3. **Browser:**
   - AptitudeWeb homepage
   - Sections: Quantitative, Logical Reasoning, Data Interpretation
   - Register/Login buttons

---

## 🔍 Verify It's Working

1. **Test Backend:** http://localhost:5500/api/health
   - Should show: `{"success":true,"message":"Server is running"}`

2. **Test Questions:** http://localhost:5500/api/questions
   - Should show list of questions

3. **Frontend:** http://localhost:3000
   - Should show the website homepage

---

## 🛠️ If Servers Don't Start

### Check MySQL:
```bash
brew services start mysql
# OR
mysql.server start
```

### Check Ports:
```bash
lsof -i :5500  # Should be empty if port is free
lsof -i :3000  # Should be empty if port is free
```

### Kill Existing Processes:
```bash
killall node
killall vite
```

---

## 📊 Current Database Status

- **176+ questions** loaded
- **Topics:** Number System, Percentages, Profit & Loss, Interest, Time & Work, etc.
- **Ready to use!**

---

## 🎯 Next Steps After Starting

1. Open http://localhost:3000
2. Click "Sign Up" to create account
3. Login and start practicing!
4. Browse questions by topic
5. Practice and track your progress

---

**Status:** ✅ All files ready | 🚀 Just need to start servers manually

