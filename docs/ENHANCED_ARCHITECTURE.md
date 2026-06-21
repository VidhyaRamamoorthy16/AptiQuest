# Enhanced Aptitude Preparation Website - Architecture Design

## 🎯 Executive Summary

Transform the existing aptitude preparation platform into an industry-ready, scalable system with modern architecture, AI-powered features, and professional UI/UX design.

---

## 📊 Current System Analysis

### Existing Strengths
- ✅ Basic React + Node.js + MySQL setup
- ✅ User authentication foundation
- ✅ Question management system
- ✅ 176+ questions in database

### Enhancement Opportunities
- 🔄 Upgrade to modern tech stack
- 🔄 Implement role-based access control
- 🔄 Add real-time features and caching
- 🔄 Enhance UI/UX with modern design
- 🔄 Implement AI-powered recommendations
- 🔄 Add comprehensive analytics and reporting

---

## 🏗️ Enhanced System Architecture

```
┌─────────────────────────────────────────────────────────────┐
│                    Frontend Layer                          │
├─────────────────────────────────────────────────────────────┤
│  React 18 + TypeScript + Vite                              │
│  ├── UI Framework: Tailwind CSS + Headless UI             │
│  ├── State Management: Zustand + React Query              │
│  ├── Charts: Recharts + D3.js                             │
│  ├── PWA: Workbox + Service Workers                        │
│  └── Real-time: Socket.io Client                           │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    API Gateway                              │
├─────────────────────────────────────────────────────────────┤
│  Nginx + Rate Limiting + SSL Termination                   │
│  ├── API Load Balancing                                    │
│  ├── Static Asset Serving                                 │
│  ├── Caching Layer                                        │
│  └── Security Headers                                      │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                  Backend Services                           │
├─────────────────────────────────────────────────────────────┤
│  Node.js + Express + TypeScript                            │
│  ├── Auth Service (JWT + Refresh Tokens)                   │
│  ├── Question Service                                      │
│  ├── Test Service                                         │
│  ├── Analytics Service                                     │
│  ├── Recommendation Service (AI)                           │
│  ├── Notification Service                                  │
│  └── File Upload Service                                   │
└─────────────────────────────────────────────────────────────┘
                              │
                              ▼
┌─────────────────────────────────────────────────────────────┐
│                    Data Layer                               │
├─────────────────────────────────────────────────────────────┤
│  MySQL (Primary) + Redis (Cache) + MinIO (Files)          │
│  ├── User Management                                       │
│  ├── Questions & Tests                                     │
│  ├── Analytics & Reports                                   │
│  ├── Session Management                                    │
│  └── File Storage                                          │
└─────────────────────────────────────────────────────────────┘
```

---

## 🗄️ Enhanced Database Schema

### Core Tables (Enhanced)

```sql
-- Enhanced Users Table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    role ENUM('super_admin', 'admin', 'content_creator', 'user') DEFAULT 'user',
    status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
    email_verified BOOLEAN DEFAULT FALSE,
    phone VARCHAR(20),
    avatar_url VARCHAR(500),
    timezone VARCHAR(50) DEFAULT 'UTC',
    language VARCHAR(10) DEFAULT 'en',
    preferences JSON, -- UI preferences, notifications, etc.
    last_login_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_role (role),
    INDEX idx_status (status)
);

-- Refresh Tokens Table
CREATE TABLE refresh_tokens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    token_hash VARCHAR(255) NOT NULL,
    device_info JSON,
    ip_address VARCHAR(45),
    expires_at TIMESTAMP NOT NULL,
    revoked_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_token (user_id, token_hash),
    INDEX idx_expires (expires_at)
);

-- Enhanced Questions Table
CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    section_id INT NOT NULL,
    topic_id INT NOT NULL,
    subtopic VARCHAR(100),
    question_text TEXT NOT NULL,
    question_type ENUM('mcq', 'true_false', 'fill_blank', 'numerical') DEFAULT 'mcq',
    difficulty ENUM('easy', 'medium', 'hard') DEFAULT 'medium',
    estimated_time INT DEFAULT 60, -- seconds
    correct_answer TEXT NOT NULL, -- Support for multiple answer types
    solution TEXT NOT NULL,
    explanation TEXT,
    hints JSON, -- Array of hints
    tags JSON, -- Array of tags for better categorization
    source VARCHAR(100), -- Question source/reference
    status ENUM('draft', 'pending_approval', 'approved', 'rejected') DEFAULT 'draft',
    created_by INT NOT NULL,
    approved_by INT NULL,
    approved_at TIMESTAMP NULL,
    usage_count INT DEFAULT 0,
    correct_count INT DEFAULT 0,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (section_id) REFERENCES sections(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id),
    FOREIGN KEY (created_by) REFERENCES users(id),
    FOREIGN KEY (approved_by) REFERENCES users(id),
    INDEX idx_section_topic (section_id, topic_id),
    INDEX idx_difficulty (difficulty),
    INDEX idx_status (status),
    INDEX idx_created_by (created_by),
    FULLTEXT idx_question_search (question_text, explanation)
);

-- Enhanced Question Options
CREATE TABLE question_options (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT NOT NULL,
    option_label CHAR(1) NOT NULL,
    option_text TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    explanation TEXT, -- Why this option is correct/incorrect
    position INT DEFAULT 0, -- For ordering
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_question_option (question_id, option_label),
    INDEX idx_question (question_id)
);

-- Mock Tests Table
CREATE TABLE mock_tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(200) NOT NULL,
    description TEXT,
    test_type ENUM('sectional', 'full_length', 'adaptive', 'speed_test') DEFAULT 'full_length',
    duration_minutes INT NOT NULL,
    total_marks INT NOT NULL,
    passing_marks INT,
    sections JSON, -- Array of section configs with question counts
    instructions TEXT,
    status ENUM('draft', 'published', 'archived') DEFAULT 'draft',
    is_free BOOLEAN DEFAULT TRUE,
    price DECIMAL(10,2) DEFAULT 0.00,
    max_attempts INT DEFAULT 3,
    shuffle_questions BOOLEAN DEFAULT TRUE,
    show_results_immediately BOOLEAN DEFAULT TRUE,
    negative_marking DECIMAL(3,2) DEFAULT 0.00,
    created_by INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (created_by) REFERENCES users(id),
    INDEX idx_test_type (test_type),
    INDEX idx_status (status),
    INDEX idx_created_by (created_by)
);

-- Test Sessions Table
CREATE TABLE test_sessions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    test_id INT NOT NULL,
    session_token VARCHAR(100) UNIQUE NOT NULL,
    start_time TIMESTAMP NOT NULL,
    end_time TIMESTAMP NULL,
    duration_taken INT NULL, -- seconds
    status ENUM('in_progress', 'completed', 'abandoned', 'expired') DEFAULT 'in_progress',
    total_questions INT NOT NULL,
    attempted_questions INT DEFAULT 0,
    correct_answers INT DEFAULT 0,
    total_marks INT DEFAULT 0,
    obtained_marks INT DEFAULT 0,
    accuracy DECIMAL(5,2) DEFAULT 0.00,
    percentile DECIMAL(5,2) DEFAULT 0.00,
    rank INT NULL,
    device_info JSON,
    ip_address VARCHAR(45),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (test_id) REFERENCES mock_tests(id),
    INDEX idx_user_test (user_id, test_id),
    INDEX idx_session_token (session_token),
    INDEX idx_status (status),
    INDEX idx_start_time (start_time)
);

-- Test Answers Table
CREATE TABLE test_answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    session_id INT NOT NULL,
    question_id INT NOT NULL,
    selected_answer TEXT NOT NULL,
    is_correct BOOLEAN DEFAULT FALSE,
    time_taken INT DEFAULT 0, -- seconds
    marks_obtained DECIMAL(5,2) DEFAULT 0.00,
    confidence_level ENUM('low', 'medium', 'high') DEFAULT 'medium',
    bookmarked BOOLEAN DEFAULT FALSE,
    review_later BOOLEAN DEFAULT FALSE,
    answered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (session_id) REFERENCES test_sessions(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id),
    INDEX idx_session_question (session_id, question_id),
    INDEX idx_correct (is_correct)
);

-- User Analytics Table
CREATE TABLE user_analytics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    date DATE NOT NULL,
    section_id INT NULL,
    topic_id INT NULL,
    total_time_spent INT DEFAULT 0, -- seconds
    questions_attempted INT DEFAULT 0,
    questions_correct INT DEFAULT 0,
    accuracy DECIMAL(5,2) DEFAULT 0.00,
    average_time_per_question DECIMAL(5,2) DEFAULT 0.00,
    difficulty_breakdown JSON, -- easy/medium/hard performance
    weak_areas JSON, -- Array of weak topics
    strong_areas JSON, -- Array of strong topics
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES sections(id),
    FOREIGN KEY (topic_id) REFERENCES topics(id),
    UNIQUE KEY unique_user_date_section_topic (user_id, date, section_id, topic_id),
    INDEX idx_user_date (user_id, date),
    INDEX idx_section_topic (section_id, topic_id)
);

-- Bookmarks Table
CREATE TABLE bookmarks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    folder VARCHAR(50) DEFAULT 'default',
    notes TEXT,
    difficulty_when_attempted ENUM('easy', 'medium', 'hard'),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_question (user_id, question_id),
    INDEX idx_user_folder (user_id, folder),
    INDEX idx_created_at (created_at)
);

-- Revision List Table
CREATE TABLE revision_list (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    reason ENUM('incorrect', 'difficult', 'important', 'review') DEFAULT 'review',
    priority ENUM('low', 'medium', 'high') DEFAULT 'medium',
    next_review_date DATE,
    review_count INT DEFAULT 0,
    last_reviewed_at TIMESTAMP NULL,
    mastered BOOLEAN DEFAULT FALSE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_question (user_id, question_id),
    INDEX idx_user_priority (user_id, priority),
    INDEX idx_next_review (next_review_date)
);

-- Leaderboard Table
CREATE TABLE leaderboard (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    test_type ENUM('daily', 'weekly', 'monthly', 'all_time'),
    score INT NOT NULL,
    rank INT NOT NULL,
    percentile DECIMAL(5,2) NOT NULL,
    total_participants INT NOT NULL,
    period_start DATE NOT NULL,
    period_end DATE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_test_period (user_id, test_type, period_start),
    INDEX idx_test_type_period (test_type, period_start),
    INDEX idx_rank (rank)
);

-- Notifications Table
CREATE TABLE notifications (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    type ENUM('test_reminder', 'achievement', 'recommendation', 'system', 'marketing') NOT NULL,
    title VARCHAR(200) NOT NULL,
    message TEXT NOT NULL,
    data JSON, -- Additional notification data
    is_read BOOLEAN DEFAULT FALSE,
    email_sent BOOLEAN DEFAULT FALSE,
    push_sent BOOLEAN DEFAULT FALSE,
    expires_at TIMESTAMP NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_unread (user_id, is_read),
    INDEX idx_type_created (type, created_at),
    INDEX idx_expires (expires_at)
);

-- AI Recommendations Table
CREATE TABLE ai_recommendations (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    recommendation_type ENUM('question', 'topic', 'test', 'study_plan') NOT NULL,
    confidence_score DECIMAL(3,2) NOT NULL, -- 0.00 to 1.00
    recommendation_data JSON NOT NULL,
    reason TEXT,
    implemented BOOLEAN DEFAULT FALSE,
    feedback ENUM('helpful', 'not_helpful', 'neutral') NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    expires_at TIMESTAMP NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_user_type (user_id, recommendation_type),
    INDEX idx_confidence (confidence_score),
    INDEX idx_expires (expires_at)
);
```

---

## 🔌 Comprehensive API Structure

### Authentication APIs
```typescript
// Auth Routes (/api/v1/auth)
POST   /register              // User registration
POST   /login                 // User login
POST   /logout                // User logout
POST   /refresh-token         // Refresh access token
POST   /forgot-password       // Forgot password
POST   /reset-password        // Reset password
POST   /verify-email          // Email verification
GET    /me                   // Get current user profile
PUT    /profile              // Update profile
PUT    /password             // Change password
POST   /avatar               // Upload avatar
```

### Question Management APIs
```typescript
// Question Routes (/api/v1/questions)
GET    /                     // List questions with filters
GET    /:id                 // Get single question
POST   /                    // Create question (Admin/Content Creator)
PUT    /:id                 // Update question (Admin/Content Creator)
DELETE /:id                 // Delete question (Admin)
POST   /:id/like            // Like/dislike question
POST   /:id/report          // Report question
GET    /random              // Get random questions
POST   /bulk-upload         // Bulk upload questions (Excel/CSV)
GET    /export              // Export questions
```

### Test Management APIs
```typescript
// Test Routes (/api/v1/tests)
GET    /                     // List available tests
GET    /:id                 // Get test details
POST   /                    // Create test (Admin)
PUT    /:id                 // Update test (Admin)
DELETE /:id                 // Delete test (Admin)
POST   /:id/start           // Start test session
GET    /:id/session/:token  // Get test session
POST   /:id/submit          // Submit test
GET    /:id/results         // Get test results
GET    /:id/analysis        // Get detailed analysis
```

### Analytics & Progress APIs
```typescript
// Analytics Routes (/api/v1/analytics)
GET    /dashboard           // User dashboard analytics
GET    /progress            // Progress tracking
GET    /performance         // Performance metrics
GET    /weak-areas          // Weak areas analysis
GET    /strengths           // Strength analysis
GET    /recommendations     // AI recommendations
GET    /accuracy-trends     // Accuracy trends over time
GET    /speed-analysis      // Speed and time analysis
```

### User Features APIs
```typescript
// User Features Routes (/api/v1/user)
GET    /bookmarks           // Get bookmarks
POST   /bookmarks           // Add bookmark
DELETE /bookmarks/:id       // Remove bookmark
GET    /revision            // Get revision list
POST   /revision            // Add to revision
PUT    /revision/:id        // Update revision item
DELETE /revision/:id        // Remove from revision
GET    /history             // Practice history
GET    /achievements        // User achievements
```

### Admin APIs
```typescript
// Admin Routes (/api/v1/admin)
GET    /users               // List users
GET    /users/:id           // Get user details
PUT    /users/:id           // Update user
DELETE /users/:id           // Delete user
GET    /analytics           // Platform analytics
GET    /reports             // Various reports
POST   /notifications       // Send notifications
GET    /content-approval    // Content approval queue
PUT    /content-approval/:id // Approve/reject content
```

### Real-time APIs (WebSockets)
```typescript
// WebSocket Events
socket.on('test:start')     // Test started
socket.on('test:progress')  // Real-time progress
socket.on('leaderboard')    // Live leaderboard updates
socket.on('notification')    // Real-time notifications
socket.on('user:online')    // User online status
```

---

## 🎨 Modern UI/UX Component Architecture

### Design System
```typescript
// Design Tokens
const theme = {
  colors: {
    primary: { 50: '#f0f9ff', 500: '#0ea5e9', 900: '#0c4a6e' },
    semantic: { success: '#10b981', warning: '#f59e0b', error: '#ef4444' },
    neutral: { 50: '#f8fafc', 900: '#0f172a' }
  },
  typography: {
    fontFamily: { sans: ['Inter', 'system-ui'], mono: ['JetBrains Mono'] },
    fontSize: { xs: '0.75rem', base: '1rem', xl: '1.25rem', '3xl': '1.875rem' }
  },
  spacing: { xs: '0.5rem', md: '1rem', lg: '1.5rem', xl: '2rem' },
  borderRadius: { sm: '0.25rem', md: '0.375rem', lg: '0.5rem', xl: '0.75rem' }
}
```

### Component Structure
```
src/
├── components/
│   ├── ui/                    # Base UI components
│   │   ├── Button/
│   │   ├── Input/
│   │   ├── Modal/
│   │   ├── Card/
│   │   └── Badge/
│   ├── layout/                # Layout components
│   │   ├── Header/
│   │   ├── Sidebar/
│   │   ├── Footer/
│   │   └── Container/
│   ├── features/              # Feature-specific components
│   │   ├── auth/
│   │   ├── questions/
│   │   ├── tests/
│   │   ├── analytics/
│   │   └── admin/
│   └── charts/                # Data visualization
│       ├── ProgressChart/
│       ├── AccuracyChart/
│       └── PerformanceChart/
├── pages/                     # Page components
├── hooks/                     # Custom hooks
├── utils/                     # Utility functions
├── stores/                    # State management
└── styles/                    # Global styles
```

### Key UI Components
```typescript
// Question Card Component
interface QuestionCardProps {
  question: Question;
  showSolution?: boolean;
  onAnswer?: (answer: string) => void;
  onBookmark?: () => void;
  variant: 'practice' | 'test' | 'review';
}

// Test Timer Component
interface TestTimerProps {
  duration: number; // seconds
  onTimeUp: () => void;
  onPause: () => void;
  autoSubmit: boolean;
}

// Progress Dashboard
interface ProgressDashboardProps {
  userId: string;
  timeframe: 'week' | 'month' | 'year';
  showComparison?: boolean;
}

// Analytics Chart
interface AnalyticsChartProps {
  type: 'accuracy' | 'speed' | 'progress';
  data: ChartData;
  filters: ChartFilters;
}
```

---

## 🚀 Technology Stack Upgrades

### Frontend Enhancements
```json
{
  "framework": "React 18 + TypeScript",
  "bundler": "Vite",
  "styling": "Tailwind CSS + Headless UI",
  "state": "Zustand + React Query",
  "routing": "React Router v6",
  "forms": "React Hook Form + Zod",
  "charts": "Recharts + D3.js",
  "animations": "Framer Motion",
  "pwa": "Workbox",
  "testing": "Vitest + Testing Library",
  "linting": "ESLint + Prettier"
}
```

### Backend Enhancements
```json
{
  "runtime": "Node.js 20 + TypeScript",
  "framework": "Express.js",
  "validation": "Zod",
  "authentication": "JWT + Refresh Tokens",
  "database": "MySQL 8.0 + Redis",
  "orm": "Prisma",
  "file-storage": "MinIO/AWS S3",
  "queue": "Bull Queue",
  "cache": "Redis",
  "websockets": "Socket.io",
  "testing": "Jest + Supertest",
  "monitoring": "Winston + Morgan"
}
```

### DevOps & Infrastructure
```json
{
  "containerization": "Docker + Docker Compose",
  "orchestration": "Kubernetes",
  "ci_cd": "GitHub Actions",
  "monitoring": "Prometheus + Grafana",
  "logging": "ELK Stack",
  "cdn": "Cloudflare",
  "hosting": "AWS/Vercel/Render",
  "database": "AWS RDS + ElastiCache",
  "storage": "AWS S3",
  "secrets": "AWS Secrets Manager"
}
```

---

## 🔒 Security & Performance Optimizations

### Security Measures
```typescript
// Security Middleware Stack
const securityMiddleware = [
  helmet(),                    // Security headers
  cors({ origin: allowedOrigins }),
  rateLimit({                  // Rate limiting
    windowMs: 15 * 60 * 1000, // 15 minutes
    max: 100                   // limit each IP to 100 requests
  }),
  express.json({ limit: '10mb' }),
  express.urlencoded({ extended: true }),
  cookieParser(),
  session({                    // Secure sessions
    secret: process.env.SESSION_SECRET,
    resave: false,
    saveUninitialized: false,
    cookie: {
      secure: process.env.NODE_ENV === 'production',
      httpOnly: true,
      maxAge: 24 * 60 * 60 * 1000 // 24 hours
    }
  })
];

// Input Validation
const questionSchema = z.object({
  question_text: z.string().min(10).max(1000),
  question_type: z.enum(['mcq', 'true_false', 'fill_blank']),
  difficulty: z.enum(['easy', 'medium', 'hard']),
  options: z.array(z.object({
    text: z.string().min(1),
    is_correct: z.boolean()
  })).min(2).max(6)
});

// SQL Injection Prevention (using Prisma)
const getQuestions = async (filters: QuestionFilters) => {
  return await prisma.question.findMany({
    where: {
      AND: [
        filters.section && { section: { name: filters.section } },
        filters.difficulty && { difficulty: filters.difficulty },
        filters.topic && { topic: { name: { contains: filters.topic } } }
      ].filter(Boolean)
    },
    include: {
      options: true,
      topic: true,
      section: true
    },
    orderBy: { created_at: 'desc' },
    take: filters.limit || 10,
    skip: (filters.page - 1) * (filters.limit || 10)
  });
};
```

### Performance Optimizations
```typescript
// Redis Caching Strategy
const cacheMiddleware = (duration: number = 300) => {
  return async (req: Request, res: Response, next: NextFunction) => {
    const key = `cache:${req.originalUrl}`;
    const cached = await redis.get(key);
    
    if (cached) {
      return res.json(JSON.parse(cached));
    }
    
    res.locals.cacheKey = key;
    res.locals.cacheDuration = duration;
    next();
  };
};

// Database Query Optimization
const optimizedQueries = {
  // Use indexes effectively
  getUserAnalytics: async (userId: string, dateRange: DateRange) => {
    return await prisma.user_analytics.findMany({
      where: {
        user_id: userId,
        date: {
          gte: dateRange.start,
          lte: dateRange.end
        }
      },
      // Use covering index
      select: {
        date: true,
        questions_attempted: true,
        questions_correct: true,
        accuracy: true,
        average_time_per_question: true
      },
      orderBy: { date: 'desc' }
    });
  },
  
  // Batch operations
  bulkUpdateQuestionStats: async (updates: QuestionStatsUpdate[]) => {
    return await prisma.$transaction(
      updates.map(update => 
        prisma.question.update({
          where: { id: update.id },
          data: {
            usage_count: { increment: update.usage_count },
            correct_count: { increment: update.correct_count }
          }
        })
      )
    );
  }
};

// API Response Compression
app.use(compression({
  filter: (req, res) => {
    if (req.headers['x-no-compression']) {
      return false;
    }
    return compression.filter(req, res);
  },
  level: 6,
  threshold: 1024
}));
```

---

## 📦 Deployment & Scaling Strategy

### Docker Configuration
```dockerfile
# Multi-stage Dockerfile
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm ci --only=production

FROM node:20-alpine AS runner
WORKDIR /app
COPY --from=builder /app/node_modules ./node_modules
COPY . .
EXPOSE 3000
USER node
CMD ["npm", "start"]
```

### Kubernetes Deployment
```yaml
# deployment.yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: aptitude-backend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: aptitude-backend
  template:
    metadata:
      labels:
        app: aptitude-backend
    spec:
      containers:
      - name: backend
        image: aptitude-backend:latest
        ports:
        - containerPort: 3000
        env:
        - name: DATABASE_URL
          valueFrom:
            secretKeyRef:
              name: db-secret
              key: url
        resources:
          requests:
            memory: "256Mi"
            cpu: "250m"
          limits:
            memory: "512Mi"
            cpu: "500m"
```

### CI/CD Pipeline
```yaml
# .github/workflows/deploy.yml
name: Deploy to Production
on:
  push:
    branches: [main]

jobs:
  test:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - uses: actions/setup-node@v3
        with:
          node-version: '20'
      - run: npm ci
      - run: npm run test
      - run: npm run lint

  build:
    needs: test
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
      - name: Build Docker image
        run: docker build -t aptitude-backend:${{ github.sha }} .
      - name: Push to registry
        run: |
          echo ${{ secrets.DOCKER_PASSWORD }} | docker login -u ${{ secrets.DOCKER_USERNAME }} --password-stdin
          docker push aptitude-backend:${{ github.sha }}

  deploy:
    needs: build
    runs-on: ubuntu-latest
    steps:
      - name: Deploy to Kubernetes
        run: |
          kubectl set image deployment/aptitude-backend backend=aptitude-backend:${{ github.sha }}
          kubectl rollout status deployment/aptitude-backend
```

---

## 🤖 AI-Powered Features

### Adaptive Learning Algorithm
```typescript
// AI Recommendation Engine
class AdaptiveLearningEngine {
  async generateRecommendations(userId: string): Promise<Recommendation[]> {
    const userProfile = await this.getUserProfile(userId);
    const performance = await this.getPerformanceData(userId);
    
    // Machine learning model for recommendations
    const recommendations = await this.mlModel.predict({
      userStrengths: userProfile.strengths,
      userWeaknesses: userProfile.weaknesses,
      recentPerformance: performance.recent,
      learningStyle: userProfile.preferences.learningStyle,
      timeAvailable: userProfile.preferences.dailyStudyTime
    });
    
    return recommendations.map(rec => ({
      type: rec.type,
      confidence: rec.confidence,
      data: rec.data,
      reason: rec.explanation
    }));
  }
  
  async adjustDifficulty(userId: string, topicId: string): Promise<string> {
    const recentPerformance = await this.getTopicPerformance(userId, topicId);
    
    if (recentPerformance.accuracy > 0.8 && recentPerformance.avgTime < this.getAverageTime(topicId)) {
      return 'hard';
    } else if (recentPerformance.accuracy < 0.5) {
      return 'easy';
    }
    return 'medium';
  }
}
```

### Real-time Leaderboard
```typescript
// WebSocket Leaderboard Service
class LeaderboardService {
  private io: Server;
  
  constructor(io: Server) {
    this.io = io;
    this.setupEventHandlers();
  }
  
  private setupEventHandlers() {
    this.io.on('connection', (socket) => {
      socket.on('join:test', (testId) => {
        socket.join(`test:${testId}`);
        this.updateLeaderboard(testId);
      });
      
      socket.on('test:progress', async (data) => {
        await this.updateUserProgress(data);
        this.updateLeaderboard(data.testId);
      });
    });
  }
  
  private async updateLeaderboard(testId: string) {
    const leaderboard = await this.getLiveLeaderboard(testId);
    this.io.to(`test:${testId}`).emit('leaderboard:update', leaderboard);
  }
}
```

---

## 📊 Analytics & Reporting

### Comprehensive Dashboard
```typescript
interface AnalyticsDashboard {
  overview: {
    totalUsers: number;
    activeUsers: number;
    questionsAttempted: number;
    averageAccuracy: number;
  };
  performanceMetrics: {
    accuracyTrends: TimeSeriesData[];
    speedAnalysis: SpeedData[];
    topicBreakdown: TopicPerformance[];
    difficultyDistribution: DifficultyStats[];
  };
  userEngagement: {
    dailyActiveUsers: DailyStats[];
    sessionDuration: SessionData[];
    featureUsage: FeatureStats[];
    retentionRates: RetentionData[];
  };
  contentAnalytics: {
    questionPerformance: QuestionStats[];
    topicPopularity: TopicStats[];
    difficultyEffectiveness: DifficultyAnalysis[];
    contentGaps: ContentGapAnalysis[];
  };
}
```

---

## 🎯 Implementation Roadmap

### Phase 1: Foundation (4-6 weeks)
- [ ] Database schema enhancement
- [ ] Authentication system upgrade
- [ ] Basic UI/UX redesign
- [ ] API structure refactoring
- [ ] Testing framework setup

### Phase 2: Core Features (6-8 weeks)
- [ ] Mock test system
- [ ] Real-time leaderboard
- [ ] Analytics dashboard
- [ ] Admin panel
- [ ] Mobile responsiveness

### Phase 3: Advanced Features (4-6 weeks)
- [ ] AI recommendations
- [ ] Advanced analytics
- [ ] PWA implementation
- [ ] Performance optimization
- [ ] Security hardening

### Phase 4: Deployment & Scaling (2-4 weeks)
- [ ] Docker containerization
- [ ] CI/CD pipeline
- [ ] Production deployment
- [ ] Monitoring setup
- [ ] Load testing

---

## 💰 Cost Estimation

### Infrastructure (Monthly)
- **AWS EC2**: $200-400 (3 instances)
- **AWS RDS**: $150-300 (MySQL)
- **ElastiCache**: $100-200 (Redis)
- **S3 Storage**: $50-100
- **CloudFront CDN**: $50-150
- **Load Balancer**: $25-50
- **Total**: $575-1,200/month

### Development (One-time)
- **Frontend Development**: $8,000-12,000
- **Backend Development**: $10,000-15,000
- **UI/UX Design**: $4,000-6,000
- **DevOps Setup**: $3,000-5,000
- **Testing & QA**: $3,000-5,000
- **Total**: $28,000-43,000

---

## 🎉 Expected Outcomes

### User Experience Improvements
- **50% faster** page load times
- **40% increase** in user engagement
- **30% improvement** in learning outcomes
- **25% reduction** in bounce rate

### Business Metrics
- **200% increase** in user retention
- **150% growth** in premium conversions
- **300% improvement** in user satisfaction
- **500% increase** in daily active users

### Technical Benefits
- **99.9% uptime** with proper scaling
- **Sub-second** API response times
- **Auto-scaling** based on traffic
- **Zero-downtime** deployments

This enhanced architecture transforms your aptitude preparation platform into an industry-leading, scalable system that can compete with the best educational platforms in the market.
