# Quick Setup Guide

## 🚀 Getting Started

Follow these steps to get the AptitudeWeb application running on your local machine.

### Prerequisites

- **Node.js** (v16 or higher) - [Download](https://nodejs.org/)
- **MySQL** (v8 or higher) - [Download](https://dev.mysql.com/downloads/)
- **npm** or **yarn** package manager

### Step 1: Database Setup

1. **Start MySQL service:**
```bash
# On macOS
brew services start mysql

# On Linux
sudo systemctl start mysql

# On Windows
# Start MySQL from Services
```

2. **Create database and load schema:**
```bash
mysql -u root -p < database/schema.sql
mysql -u root -p aptitudeweb < database/sample_data.sql
```

### Step 2: Backend Setup

1. **Navigate to backend directory:**
```bash
cd backend
```

2. **Install dependencies:**
```bash
npm install
```

3. **Configure environment:**
```bash
# Create .env file
cp .env.example .env

# Edit .env file with your database credentials:
# DB_HOST=localhost
# DB_USER=root
# DB_PASSWORD=your_mysql_password
# DB_NAME=aptitudeweb
# JWT_SECRET=your_random_secret_key_here
# PORT=5500
```

4. **Start backend server:**
```bash
npm run dev
```

Backend will run on `http://localhost:5500`

### Step 3: Frontend Setup

1. **Open a new terminal and navigate to frontend:**
```bash
cd frontend
```

2. **Install dependencies:**
```bash
npm install
```

3. **Start frontend development server:**
```bash
npm run dev
```

Frontend will run on `http://localhost:3000`

### Step 4: Access the Application

1. Open your browser and go to `http://localhost:3000`
2. Register a new account or use existing test credentials
3. Start practicing!

## 📝 Default Test Credentials

After loading sample data, you can use:
- **Email:** admin@aptitudeweb.com
- **Password:** Admin@123 (you'll need to set this up properly with bcrypt)

Or register a new account.

## 🛠️ Troubleshooting

### Database Connection Error
- Verify MySQL is running: `mysql -u root -p`
- Check credentials in `backend/.env`
- Ensure database `aptitudeweb` exists

### Port Already in Use
- Backend (5500): Change `PORT` in `backend/.env`
- Frontend (3000): Change port in `frontend/vite.config.js`

### Module Not Found Errors
- Delete `node_modules` and `package-lock.json`
- Run `npm install` again

### CORS Errors
- Ensure backend is running on port 5500
- Check `CORS_ORIGIN` in `backend/.env`

## 📚 Next Steps

1. **Explore the API:** Visit `http://localhost:5500/api/health`
2. **Check Documentation:** Read `docs/API_ENDPOINTS.md`
3. **View Sample Questions:** They're loaded in the database
4. **Customize:** Modify questions, add more topics, etc.

## 🎯 Development Tips

- Backend uses **nodemon** for auto-restart on file changes
- Frontend uses **Vite** for fast hot module replacement
- Use **Postman** or **Thunder Client** to test API endpoints
- Check browser console and terminal for error messages

## 📖 Documentation

- **System Design:** `docs/SYSTEM_DESIGN.md`
- **API Endpoints:** `docs/API_ENDPOINTS.md`
- **UI Flow:** `docs/UI_FLOW.md`
- **Deployment:** `docs/DEPLOYMENT.md`

Happy Coding! 🎉

