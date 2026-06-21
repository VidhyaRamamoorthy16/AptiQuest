# Aptitude Preparation Website

A comprehensive web platform for students preparing for campus placements, competitive exams, and interviews.

## 🎯 Features

### Core Sections
- **Quantitative Aptitude**: Number System, Percentages, Profit & Loss, Interest, Time & Work, Speed & Distance, Ratio & Proportion, Averages, Algebra, Permutations & Combinations, Probability, Mensuration, Pipes & Cisterns, Mixtures & Alligations
- **Logical Reasoning**: Coding-Decoding, Blood Relations, Direction Sense, Seating Arrangement, Puzzles, Syllogism, Statements & Conclusions, Series, Analogies, Venn Diagrams
- **Data Interpretation**: Tables, Bar Graphs, Line Charts, Pie Charts, Case-lets, Mixed DI

### User Features
- User registration & authentication (JWT)
- Topic-wise practice
- Random quiz generator
- Timed tests (section-wise & full-length)
- Instant results & score analysis
- Review answers with detailed explanations
- Bookmark questions
- Progress tracking dashboard
- Leaderboard
- Dark/Light mode
- Mobile-responsive UI

### Admin Features
- Add/Edit/Delete questions
- Bulk upload (Excel/CSV)
- User management
- Analytics dashboard
- Mock test management

## 🏗️ Project Structure

```
aptitudeweb/
├── backend/                 # Node.js/Express backend
│   ├── config/             # Database & app configuration
│   ├── controllers/        # Route controllers
│   ├── middleware/          # Auth & validation middleware
│   ├── models/             # Database models
│   ├── routes/             # API routes
│   ├── utils/              # Helper functions
│   └── server.js           # Entry point
├── frontend/               # React frontend
│   ├── public/
│   ├── src/
│   │   ├── components/     # React components
│   │   ├── pages/         # Page components
│   │   ├── context/       # Context API
│   │   ├── services/      # API services
│   │   ├── utils/         # Utilities
│   │   └── App.js
│   └── package.json
├── database/               # Database schemas & migrations
│   ├── schema.sql          # MySQL schema
│   └── sample_data.sql     # Sample questions
└── docs/                   # Documentation
    ├── SYSTEM_DESIGN.md
    ├── API_ENDPOINTS.md
    └── UI_FLOW.md
```

## 🚀 Quick Start

### Prerequisites
- Node.js (v16+)
- MySQL (v8+) or PostgreSQL
- npm or yarn

### Backend Setup
```bash
cd backend
npm install
# Configure database in config/database.js
npm run dev
```

### Frontend Setup
```bash
cd frontend
npm install
npm start
```

### Database Setup
```bash
mysql -u root -p < database/schema.sql
mysql -u root -p aptitudeweb < database/sample_data.sql
```

## 📚 Technology Stack

- **Frontend**: React.js, Tailwind CSS, React Router
- **Backend**: Node.js, Express.js
- **Database**: MySQL/PostgreSQL
- **Authentication**: JWT
- **File Upload**: Multer (for bulk question upload)

## 📝 License

MIT

