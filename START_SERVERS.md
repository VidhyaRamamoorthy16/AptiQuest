# How to Start the Website - Manual Instructions

## Issue Resolution

If commands are failing, follow these manual steps:

## Step 1: Start Backend Server

Open Terminal 1 and run:
```bash
cd /Users/deekshith/VScode/aptitudeweb/backend
npm run dev
```

You should see:
```
🚀 Server running on port 5500
📝 Environment: development
✅ Database connected successfully
```

## Step 2: Start Frontend Server

Open Terminal 2 (new terminal) and run:
```bash
cd /Users/deekshith/VScode/aptitudeweb/frontend
npm run dev
```

You should see:
```
VITE v4.x.x  ready in xxx ms
➜  Local:   http://localhost:3000/
```

## Step 3: Verify Database

In Terminal 3, verify database has questions:
```bash
mysql -u root aptitudeweb -e "SELECT COUNT(*) FROM questions;"
```

## Step 4: Access Website

1. Open browser: http://localhost:3000
2. Test API: http://localhost:5500/api/health

## Troubleshooting

### If Backend Fails:
1. Check MySQL is running: `brew services start mysql` or `mysql.server start`
2. Verify .env file exists in backend folder
3. Check backend.log for errors

### If Frontend Fails:
1. Check node_modules: `cd frontend && npm install`
2. Check frontend.log for errors
3. Verify port 3000 is free

### Quick Fix Scripts

I've created startup scripts:
- `start_backend.sh` - Start backend
- `start_frontend.sh` - Start frontend

Run them with:
```bash
./start_backend.sh
./start_frontend.sh
```

## Current Status

- ✅ Database: 176+ questions loaded
- ✅ Backend: Ready to start
- ✅ Frontend: Ready to start
- ✅ Configuration: Complete

## Expected URLs

- Frontend: http://localhost:3000
- Backend API: http://localhost:5500/api/health
- Questions API: http://localhost:5500/api/questions

