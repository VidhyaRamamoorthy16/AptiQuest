# Implementation Guide - Enhanced Aptitude Platform

## 🚀 Quick Start Implementation

### Phase 1: Database Schema Migration

```sql
-- 1. Backup existing data
CREATE TABLE users_backup AS SELECT * FROM users;
CREATE TABLE questions_backup AS SELECT * FROM questions;

-- 2. Add new columns to existing tables
ALTER TABLE users 
ADD COLUMN status ENUM('active', 'inactive', 'suspended') DEFAULT 'active',
ADD COLUMN email_verified BOOLEAN DEFAULT FALSE,
ADD COLUMN phone VARCHAR(20),
ADD COLUMN avatar_url VARCHAR(500),
ADD COLUMN timezone VARCHAR(50) DEFAULT 'UTC',
ADD COLUMN language VARCHAR(10) DEFAULT 'en',
ADD COLUMN preferences JSON,
ADD COLUMN last_login_at TIMESTAMP NULL;

ALTER TABLE questions
ADD COLUMN question_type ENUM('mcq', 'true_false', 'fill_blank', 'numerical') DEFAULT 'mcq',
ADD COLUMN estimated_time INT DEFAULT 60,
ADD COLUMN tags JSON,
ADD COLUMN source VARCHAR(100),
ADD COLUMN status ENUM('draft', 'pending_approval', 'approved', 'rejected') DEFAULT 'draft',
ADD COLUMN created_by INT NOT NULL,
ADD COLUMN approved_by INT NULL,
ADD COLUMN approved_at TIMESTAMP NULL,
ADD COLUMN usage_count INT DEFAULT 0,
ADD COLUMN correct_count INT DEFAULT 0;

-- 3. Create new tables
-- (See ENHANCED_ARCHITECTURE.md for complete schema)

-- 4. Migrate existing data
UPDATE users SET created_by = id WHERE created_by IS NULL;
UPDATE questions SET created_by = 1, status = 'approved' WHERE created_by IS NULL;
```

### Phase 2: Backend Setup

```bash
# Install new dependencies
npm install @prisma/client prisma
npm install jsonwebtoken bcryptjs
npm install redis ioredis
npm install socket.io
npm install bull
npm install winston morgan
npm install zod
npm install multer sharp
npm install express-rate-limit helmet cors
npm install compression

# Install dev dependencies
npm install -D @types/node @types/express
npm install -D typescript ts-node
npm install -D jest @types/jest supertest
npm install -D eslint prettier
```

### Phase 3: Prisma Setup

```prisma
// prisma/schema.prisma
generator client {
  provider = "prisma-client-js"
}

datasource db {
  provider = "mysql"
  url      = env("DATABASE_URL")
}

model User {
  id            Int      @id @default(autoincrement())
  name          String   @db.VarChar(100)
  email         String   @unique @db.VarChar(100)
  passwordHash  String   @map("password_hash") @db.VarChar(255)
  role          Role     @default(USER)
  status        UserStatus @default(ACTIVE)
  emailVerified Boolean  @default(false) @map("email_verified")
  phone         String?  @db.VarChar(20)
  avatarUrl     String?  @map("avatar_url") @db.VarChar(500)
  timezone      String   @default("UTC") @db.VarChar(50)
  language      String   @default("en") @db.VarChar(10)
  preferences   Json?
  lastLoginAt   DateTime? @map("last_login_at")
  createdAt     DateTime @default(now()) @map("created_at")
  updatedAt     DateTime @updatedAt @map("updated_at")

  @@map("users")
}

enum Role {
  SUPER_ADMIN
  ADMIN
  CONTENT_CREATOR
  USER
}

enum UserStatus {
  ACTIVE
  INACTIVE
  SUSPENDED
}
```

### Phase 4: Frontend Setup

```bash
# Create new React project with TypeScript
npx create-react-app frontend --template typescript
cd frontend

# Install dependencies
npm install @headlessui/react @heroicons/react
npm install @tanstack/react-query @tanstack/react-query-devtools
npm install zustand
npm install react-router-dom
npm install axios
npm install recharts
npm install framer-motion
npm install react-hook-form @hookform/resolvers zod
npm install react-hot-toast
npm install socket.io-client

# Install dev dependencies
npm install -D tailwindcss postcss autoprefixer
npm install -D @types/react @types/react-dom
npm install -D vitest @testing-library/react
npm install -D eslint prettier
```

---

## 📁 Project Structure

```
aptitudeweb/
├── backend/
│   ├── src/
│   │   ├── controllers/
│   │   │   ├── authController.ts
│   │   │   ├── questionController.ts
│   │   │   ├── testController.ts
│   │   │   ├── analyticsController.ts
│   │   │   └── adminController.ts
│   │   ├── middleware/
│   │   │   ├── auth.ts
│   │   │   ├── validation.ts
│   │   │   ├── rateLimit.ts
│   │   │   └── errorHandler.ts
│   │   ├── routes/
│   │   │   ├── auth.ts
│   │   │   ├── questions.ts
│   │   │   ├── tests.ts
│   │   │   ├── analytics.ts
│   │   │   └── admin.ts
│   │   ├── services/
│   │   │   ├── authService.ts
│   │   │   ├── emailService.ts
│   │   │   ├── cacheService.ts
│   │   │   ├── aiService.ts
│   │   │   └── notificationService.ts
│   │   ├── utils/
│   │   │   ├── database.ts
│   │   │   ├── logger.ts
│   │   │   ├── validators.ts
│   │   │   └── helpers.ts
│   │   ├── types/
│   │   │   ├── auth.ts
│   │   │   ├── question.ts
│   │   │   ├── test.ts
│   │   │   └── analytics.ts
│   │   └── app.ts
│   ├── prisma/
│   │   ├── schema.prisma
│   │   ├── migrations/
│   │   └── seed.ts
│   ├── tests/
│   ├── docker/
│   │   └── Dockerfile
│   ├── package.json
│   └── tsconfig.json
├── frontend/
│   ├── src/
│   │   ├── components/
│   │   │   ├── ui/
│   │   │   │   ├── Button/
│   │   │   │   ├── Input/
│   │   │   │   ├── Modal/
│   │   │   │   ├── Card/
│   │   │   │   └── Badge/
│   │   │   ├── layout/
│   │   │   │   ├── Header/
│   │   │   │   ├── Sidebar/
│   │   │   │   └── Footer/
│   │   │   ├── features/
│   │   │   │   ├── auth/
│   │   │   │   ├── questions/
│   │   │   │   ├── tests/
│   │   │   │   ├── analytics/
│   │   │   │   └── admin/
│   │   │   └── charts/
│   │   ├── pages/
│   │   ├── hooks/
│   │   │   ├── useAuth.ts
│   │   │   ├── useQuestions.ts
│   │   │   ├── useTests.ts
│   │   │   └── useAnalytics.ts
│   │   ├── stores/
│   │   │   ├── authStore.ts
│   │   │   ├── questionStore.ts
│   │   │   └── testStore.ts
│   │   ├── services/
│   │   │   ├── api.ts
│   │   │   ├── auth.ts
│   │   │   └── websocket.ts
│   │   ├── utils/
│   │   │   ├── constants.ts
│   │   │   ├── helpers.ts
│   │   │   └── validators.ts
│   │   ├── types/
│   │   │   ├── auth.ts
│   │   │   ├── question.ts
│   │   │   ├── test.ts
│   │   │   └── analytics.ts
│   │   └── App.tsx
│   ├── public/
│   ├── tests/
│   ├── docker/
│   │   └── Dockerfile
│   ├── package.json
│   ├── tailwind.config.js
│   └── vite.config.ts
├── docs/
├── docker-compose.yml
├── .github/
│   └── workflows/
│       └── deploy.yml
└── README.md
```

---

## 🔧 Key Implementation Files

### Backend: Enhanced Auth Controller

```typescript
// backend/src/controllers/authController.ts
import { Request, Response } from 'express';
import { AuthService } from '../services/authService';
import { validateRegister, validateLogin } from '../utils/validators';
import { logger } from '../utils/logger';

export class AuthController {
  constructor(private authService: AuthService) {}

  async register(req: Request, res: Response) {
    try {
      const validatedData = validateRegister(req.body);
      const result = await this.authService.register(validatedData);
      
      logger.info(`User registered: ${result.user.email}`);
      
      res.status(201).json({
        success: true,
        message: 'User registered successfully',
        data: {
          user: result.user,
          tokens: result.tokens
        }
      });
    } catch (error) {
      logger.error('Registration error:', error);
      res.status(400).json({
        success: false,
        message: error.message
      });
    }
  }

  async login(req: Request, res: Response) {
    try {
      const validatedData = validateLogin(req.body);
      const result = await this.authService.login(validatedData);
      
      // Set refresh token in HTTP-only cookie
      res.cookie('refreshToken', result.refreshToken, {
        httpOnly: true,
        secure: process.env.NODE_ENV === 'production',
        maxAge: 7 * 24 * 60 * 60 * 1000 // 7 days
      });
      
      logger.info(`User logged in: ${result.user.email}`);
      
      res.json({
        success: true,
        message: 'Login successful',
        data: {
          user: result.user,
          accessToken: result.accessToken
        }
      });
    } catch (error) {
      logger.error('Login error:', error);
      res.status(401).json({
        success: false,
        message: error.message
      });
    }
  }

  async refreshToken(req: Request, res: Response) {
    try {
      const refreshToken = req.cookies.refreshToken;
      if (!refreshToken) {
        throw new Error('No refresh token provided');
      }

      const result = await this.authService.refreshToken(refreshToken);
      
      res.json({
        success: true,
        data: {
          accessToken: result.accessToken
        }
      });
    } catch (error) {
      res.status(401).json({
        success: false,
        message: 'Invalid refresh token'
      });
    }
  }
}
```

### Frontend: Enhanced Question Component

```typescript
// frontend/src/components/features/questions/QuestionCard.tsx
import React, { useState } from 'react';
import { Clock, Bookmark, CheckCircle, XCircle } from '@heroicons/react/24/outline';
import { Question, Answer } from '../../types/question';
import { Button } from '../../ui/Button';
import { Card } from '../../ui/Card';

interface QuestionCardProps {
  question: Question;
  showSolution?: boolean;
  onAnswer?: (answer: string) => void;
  onBookmark?: () => void;
  variant: 'practice' | 'test' | 'review';
  userAnswer?: string;
}

export const QuestionCard: React.FC<QuestionCardProps> = ({
  question,
  showSolution = false,
  onAnswer,
  onBookmark,
  variant,
  userAnswer
}) => {
  const [selectedAnswer, setSelectedAnswer] = useState<string>(userAnswer || '');
  const [isSubmitted, setIsSubmitted] = useState(false);

  const handleSubmit = () => {
    if (onAnswer && selectedAnswer) {
      onAnswer(selectedAnswer);
      setIsSubmitted(true);
    }
  };

  const getOptionStyle = (option: string) => {
    if (!isSubmitted || !showSolution) return 'default';
    
    const isCorrect = option === question.correctAnswer;
    const isSelected = option === selectedAnswer;
    
    if (isCorrect) return 'correct';
    if (isSelected && !isCorrect) return 'incorrect';
    return 'default';
  };

  return (
    <Card className="p-6 space-y-4">
      {/* Question Header */}
      <div className="flex items-start justify-between">
        <div className="flex-1">
          <div className="flex items-center gap-2 mb-2">
            <span className={`px-2 py-1 text-xs font-semibold rounded ${
              question.difficulty === 'easy' ? 'bg-green-100 text-green-800' :
              question.difficulty === 'medium' ? 'bg-yellow-100 text-yellow-800' :
              'bg-red-100 text-red-800'
            }`}>
              {question.difficulty}
            </span>
            <span className="text-sm text-gray-500">
              {question.estimatedTime}s
            </span>
          </div>
          
          <h3 className="text-lg font-semibold text-gray-900 dark:text-white">
            {question.questionText}
          </h3>
        </div>
        
        {variant === 'practice' && (
          <Button
            variant="ghost"
            size="sm"
            onClick={onBookmark}
            className="ml-4"
          >
            <Bookmark className="h-5 w-5" />
          </Button>
        )}
      </div>

      {/* Options */}
      <div className="space-y-2">
        {question.options.map((option) => (
          <div
            key={option.id}
            className={`p-3 rounded-lg border-2 cursor-pointer transition-colors ${
              getOptionStyle(option.label) === 'correct' ? 'border-green-500 bg-green-50' :
              getOptionStyle(option.label) === 'incorrect' ? 'border-red-500 bg-red-50' :
              selectedAnswer === option.label ? 'border-blue-500 bg-blue-50' :
              'border-gray-200 hover:border-gray-300'
            }`}
            onClick={() => !isSubmitted && setSelectedAnswer(option.label)}
          >
            <div className="flex items-center">
              <div className={`w-5 h-5 rounded-full border-2 mr-3 flex items-center justify-center ${
                selectedAnswer === option.label ? 'border-blue-500' : 'border-gray-300'
              }`}>
                {selectedAnswer === option.label && (
                  <div className="w-2 h-2 rounded-full bg-blue-500" />
                )}
              </div>
              <span className="flex-1">{option.text}</span>
              {isSubmitted && showSolution && (
                option.label === question.correctAnswer ? (
                  <CheckCircle className="h-5 w-5 text-green-500" />
                ) : selectedAnswer === option.label ? (
                  <XCircle className="h-5 w-5 text-red-500" />
                ) : null
              )}
            </div>
          </div>
        ))}
      </div>

      {/* Solution */}
      {showSolution && isSubmitted && (
        <div className="mt-4 p-4 bg-blue-50 rounded-lg">
          <h4 className="font-semibold text-blue-900 mb-2">Solution:</h4>
          <p className="text-blue-800">{question.solution}</p>
          {question.explanation && (
            <div className="mt-2">
              <h5 className="font-semibold text-blue-900 mb-1">Explanation:</h5>
              <p className="text-blue-800">{question.explanation}</p>
            </div>
          )}
        </div>
      )}

      {/* Action Buttons */}
      {variant !== 'review' && !isSubmitted && (
        <div className="flex gap-2">
          <Button
            onClick={handleSubmit}
            disabled={!selectedAnswer}
            className="flex-1"
          >
            Submit Answer
          </Button>
          {variant === 'practice' && (
            <Button variant="outline" onClick={() => setShowSolution(true)}>
              Show Solution
            </Button>
          )}
        </div>
      )}
    </Card>
  );
};
```

### Backend: AI Recommendation Service

```typescript
// backend/src/services/aiService.ts
import { PrismaClient } from '@prisma/client';
import { UserPerformance, Recommendation } from '../types/analytics';

export class AIRecommendationService {
  constructor(private prisma: PrismaClient) {}

  async generateRecommendations(userId: string): Promise<Recommendation[]> {
    const userProfile = await this.getUserProfile(userId);
    const performance = await this.getPerformanceData(userId);
    
    const recommendations: Recommendation[] = [];

    // 1. Weak topic recommendations
    const weakTopics = this.identifyWeakTopics(performance);
    weakTopics.forEach(topic => {
      recommendations.push({
        type: 'topic',
        confidence: 0.8,
        data: {
          topicId: topic.id,
          topicName: topic.name,
          suggestedDifficulty: this.suggestDifficulty(topic.performance),
          studyPlan: this.generateStudyPlan(topic)
        },
        reason: `You need improvement in ${topic.name} (accuracy: ${topic.performance.accuracy}%)`
      });
    });

    // 2. Question recommendations
    const recommendedQuestions = await this.getRecommendedQuestions(userId, weakTopics);
    recommendedQuestions.forEach(question => {
      recommendations.push({
        type: 'question',
        confidence: question.confidence,
        data: {
          questionId: question.id,
          reason: question.reason,
          difficulty: question.difficulty
        },
        reason: question.reason
      });
    });

    // 3. Test recommendations
    const testRecommendations = await this.generateTestRecommendations(userProfile, performance);
    recommendations.push(...testRecommendations);

    // Save recommendations to database
    await this.saveRecommendations(userId, recommendations);

    return recommendations;
  }

  private identifyWeakTopics(performance: UserPerformance[]) {
    return performance
      .filter(p => p.accuracy < 70) // Topics with less than 70% accuracy
      .sort((a, b) => a.accuracy - b.accuracy)
      .slice(0, 3); // Top 3 weak topics
  }

  private suggestDifficulty(topicPerformance: UserPerformance): string {
    if (topicPerformance.accuracy < 50) return 'easy';
    if (topicPerformance.accuracy < 80) return 'medium';
    return 'hard';
  }

  private async getRecommendedQuestions(userId: string, weakTopics: any[]) {
    const questions = [];
    
    for (const topic of weakTopics) {
      const topicQuestions = await this.prisma.question.findMany({
        where: {
          topicId: topic.id,
          difficulty: this.suggestDifficulty(topic),
          status: 'approved'
        },
        include: {
          options: true
        },
        take: 5,
        orderBy: {
          usage_count: 'asc' // Less used questions first
        }
      });

      questions.push(...topicQuestions.map(q => ({
        id: q.id,
        confidence: 0.7,
        reason: `Practice ${q.difficulty} questions for ${topic.name}`,
        difficulty: q.difficulty
      })));
    }

    return questions;
  }
}
```

---

## 🐳 Docker Configuration

### Backend Dockerfile

```dockerfile
# backend/docker/Dockerfile
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./
COPY prisma ./prisma/

# Install dependencies
RUN npm ci --only=production && npm cache clean --force

# Generate Prisma client
RUN npx prisma generate

# Copy source code
COPY . .

# Build TypeScript
RUN npm run build

# Production stage
FROM node:20-alpine AS runner

WORKDIR /app

# Create non-root user
RUN addgroup -g 1001 -S nodejs
RUN adduser -S nodejs -u 1001

# Copy built application
COPY --from=builder --chown=nodejs:nodejs /app/dist ./dist
COPY --from=builder --chown=nodejs:nodejs /app/node_modules ./node_modules
COPY --from=builder --chown=nodejs:nodejs /app/package*.json ./
COPY --from=builder --chown=nodejs:nodejs /app/prisma ./prisma

USER nodejs

EXPOSE 3000

ENV NODE_ENV=production

CMD ["npm", "start"]
```

### Frontend Dockerfile

```dockerfile
# frontend/docker/Dockerfile
FROM node:20-alpine AS builder

WORKDIR /app

# Copy package files
COPY package*.json ./

# Install dependencies
RUN npm ci --only=production && npm cache clean --force

# Copy source code
COPY . .

# Build application
RUN npm run build

# Production stage
FROM nginx:alpine AS runner

# Copy built application
COPY --from=builder /app/dist /usr/share/nginx/html

# Copy nginx configuration
COPY nginx.conf /etc/nginx/nginx.conf

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
```

### Docker Compose

```yaml
# docker-compose.yml
version: '3.8'

services:
  backend:
    build:
      context: ./backend
      dockerfile: docker/Dockerfile
    ports:
      - "3000:3000"
    environment:
      - DATABASE_URL=mysql://user:password@mysql:3306/aptitudeweb
      - REDIS_URL=redis://redis:6379
      - JWT_SECRET=${JWT_SECRET}
      - NODE_ENV=production
    depends_on:
      - mysql
      - redis
    volumes:
      - ./uploads:/app/uploads

  frontend:
    build:
      context: ./frontend
      dockerfile: docker/Dockerfile
    ports:
      - "80:80"
    depends_on:
      - backend

  mysql:
    image: mysql:8.0
    environment:
      - MYSQL_ROOT_PASSWORD=rootpassword
      - MYSQL_DATABASE=aptitudeweb
      - MYSQL_USER=user
      - MYSQL_PASSWORD=password
    volumes:
      - mysql_data:/var/lib/mysql
      - ./database/schema.sql:/docker-entrypoint-initdb.d/01-schema.sql
    ports:
      - "3306:3306"

  redis:
    image: redis:7-alpine
    ports:
      - "6379:6379"
    volumes:
      - redis_data:/data

  nginx:
    image: nginx:alpine
    ports:
      - "443:443"
    volumes:
      - ./nginx/nginx.conf:/etc/nginx/nginx.conf
      - ./nginx/ssl:/etc/nginx/ssl
    depends_on:
      - frontend
      - backend

volumes:
  mysql_data:
  redis_data:
```

---

## 🚀 Deployment Steps

### 1. Environment Setup

```bash
# Create production environment variables
cp .env.example .env.production

# Edit .env.production with production values
DATABASE_URL="mysql://user:password@localhost:3306/aptitudeweb"
REDIS_URL="redis://localhost:6379"
JWT_SECRET="your-super-secret-jwt-key"
NODE_ENV="production"
```

### 2. Database Migration

```bash
# Generate Prisma migrations
npx prisma migrate dev --name init

# Seed database with initial data
npx prisma db seed
```

### 3. Build and Deploy

```bash
# Build Docker images
docker-compose build

# Start services
docker-compose up -d

# Check logs
docker-compose logs -f
```

### 4. SSL Certificate Setup

```bash
# Install Certbot
sudo apt install certbot python3-certbot-nginx

# Get SSL certificate
sudo certbot --nginx -d yourdomain.com

# Auto-renewal
sudo crontab -e
# Add: 0 12 * * * /usr/bin/certbot renew --quiet
```

---

## 📊 Monitoring Setup

### Prometheus Configuration

```yaml
# prometheus.yml
global:
  scrape_interval: 15s

scrape_configs:
  - job_name: 'aptitude-backend'
    static_configs:
      - targets: ['backend:3000']
    metrics_path: '/metrics'
```

### Grafana Dashboard

```json
{
  "dashboard": {
    "title": "Aptitude Platform Metrics",
    "panels": [
      {
        "title": "API Response Time",
        "type": "graph",
        "targets": [
          {
            "expr": "histogram_quantile(0.95, rate(http_request_duration_seconds_bucket[5m]))"
          }
        ]
      },
      {
        "title": "Active Users",
        "type": "stat",
        "targets": [
          {
            "expr": "active_users_total"
          }
        ]
      }
    ]
  }
}
```

---

## 🧪 Testing Strategy

### Backend Tests

```typescript
// backend/tests/auth.test.ts
import request from 'supertest';
import { app } from '../src/app';

describe('Authentication', () => {
  describe('POST /api/v1/auth/register', () => {
    it('should register a new user', async () => {
      const userData = {
        name: 'Test User',
        email: 'test@example.com',
        password: 'password123'
      };

      const response = await request(app)
        .post('/api/v1/auth/register')
        .send(userData)
        .expect(201);

      expect(response.body.success).toBe(true);
      expect(response.body.data.user.email).toBe(userData.email);
      expect(response.body.data.tokens.accessToken).toBeDefined();
    });

    it('should not register user with invalid email', async () => {
      const userData = {
        name: 'Test User',
        email: 'invalid-email',
        password: 'password123'
      };

      const response = await request(app)
        .post('/api/v1/auth/register')
        .send(userData)
        .expect(400);

      expect(response.body.success).toBe(false);
    });
  });
});
```

### Frontend Tests

```typescript
// frontend/src/components/features/questions/__tests__/QuestionCard.test.tsx
import { render, screen, fireEvent } from '@testing-library/react';
import { QuestionCard } from '../QuestionCard';

const mockQuestion = {
  id: 1,
  questionText: 'What is 2 + 2?',
  difficulty: 'easy',
  estimatedTime: 30,
  options: [
    { id: 1, label: 'A', text: '3' },
    { id: 2, label: 'B', text: '4' },
    { id: 3, label: 'C', text: '5' },
    { id: 4, label: 'D', text: '6' }
  ],
  correctAnswer: 'B',
  solution: '2 + 2 = 4'
};

describe('QuestionCard', () => {
  it('renders question correctly', () => {
    render(<QuestionCard question={mockQuestion} variant="practice" />);
    
    expect(screen.getByText('What is 2 + 2?')).toBeInTheDocument();
    expect(screen.getByText('3')).toBeInTheDocument();
    expect(screen.getByText('4')).toBeInTheDocument();
  });

  it('allows selecting an answer', () => {
    const onAnswer = jest.fn();
    render(<QuestionCard question={mockQuestion} variant="practice" onAnswer={onAnswer} />);
    
    fireEvent.click(screen.getByText('4'));
    fireEvent.click(screen.getByText('Submit Answer'));
    
    expect(onAnswer).toHaveBeenCalledWith('B');
  });
});
```

---

## 📈 Performance Optimization

### Database Indexing

```sql
-- Create optimized indexes
CREATE INDEX idx_questions_section_difficulty ON questions(section_id, difficulty);
CREATE INDEX idx_user_analytics_user_date ON user_analytics(user_id, date);
CREATE INDEX idx_test_sessions_user_status ON test_sessions(user_id, status);
CREATE INDEX idx_question_options_question ON question_options(question_id);

-- Full-text search index
CREATE FULLTEXT INDEX idx_questions_search ON questions(question_text, explanation);
```

### Redis Caching Strategy

```typescript
// backend/src/services/cacheService.ts
import Redis from 'ioredis';

export class CacheService {
  private redis: Redis;

  constructor() {
    this.redis = new Redis(process.env.REDIS_URL);
  }

  async get<T>(key: string): Promise<T | null> {
    const value = await this.redis.get(key);
    return value ? JSON.parse(value) : null;
  }

  async set(key: string, value: any, ttl: number = 300): Promise<void> {
    await this.redis.setex(key, ttl, JSON.stringify(value));
  }

  async invalidate(pattern: string): Promise<void> {
    const keys = await this.redis.keys(pattern);
    if (keys.length > 0) {
      await this.redis.del(...keys);
    }
  }

  // Cache user session
  async cacheUserSession(userId: string, sessionData: any): Promise<void> {
    await this.set(`session:${userId}`, sessionData, 3600); // 1 hour
  }

  // Cache question list
  async cacheQuestions(filters: any, questions: any[]): Promise<void> {
    const key = `questions:${JSON.stringify(filters)}`;
    await this.set(key, questions, 600); // 10 minutes
  }
}
```

---

## 🔒 Security Checklist

- [ ] JWT tokens with proper expiration
- [ ] Refresh token rotation
- [ ] Rate limiting on all endpoints
- [ ] Input validation and sanitization
- [ ] SQL injection prevention (using Prisma)
- [ ] XSS protection
- [ ] CSRF protection
- [ ] Secure HTTP headers (helmet)
- [ ] Environment variable protection
- [ ] File upload validation
- [ ] API key management
- [ ] SSL/TLS encryption
- [ ] Database connection encryption
- [ ] Regular security audits

---

## 📱 PWA Configuration

```typescript
// frontend/public/manifest.json
{
  "name": "Aptitude Preparation Platform",
  "short_name": "AptitudeWeb",
  "description": "Master aptitude skills with interactive practice",
  "start_url": "/",
  "display": "standalone",
  "background_color": "#ffffff",
  "theme_color": "#0ea5e9",
  "icons": [
    {
      "src": "/icons/icon-192x192.png",
      "sizes": "192x192",
      "type": "image/png"
    },
    {
      "src": "/icons/icon-512x512.png",
      "sizes": "512x512",
      "type": "image/png"
    }
  ]
}
```

```typescript
// frontend/src/serviceWorker.ts
import { precacheAndRoute } from 'workbox-precaching';

precacheAndRoute(self.__WB_MANIFEST);

// Cache API responses
self.addEventListener('fetch', (event) => {
  if (event.request.url.includes('/api/questions')) {
    event.respondWith(
      caches.match(event.request).then((response) => {
        return response || fetch(event.request);
      })
    );
  }
});
```

This implementation guide provides a comprehensive roadmap to transform your existing aptitude platform into an industry-ready, scalable system with modern features and professional architecture.
