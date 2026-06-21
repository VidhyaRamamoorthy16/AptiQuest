# System Design Document

## 1. Architecture Overview

### High-Level Architecture
```
┌─────────────┐
│   Browser   │
│  (React UI) │
└──────┬──────┘
       │ HTTP/REST API
       │
┌──────▼──────────────────┐
│   Express.js Backend    │
│  ┌──────────────────┐   │
│  │  Auth Middleware │   │
│  │  Route Handlers  │   │
│  │  Business Logic  │   │
│  └──────────────────┘   │
└──────┬───────────────────┘
       │ SQL Queries
       │
┌──────▼──────┐
│   MySQL DB  │
└─────────────┘
```

## 2. Core Modules

### 2.1 Authentication Module
- **Registration**: Email, password, name validation
- **Login**: JWT token generation
- **Password Reset**: Email-based reset flow
- **Session Management**: Token refresh mechanism

### 2.2 Question Management Module
- **CRUD Operations**: Create, read, update, delete questions
- **Bulk Upload**: Excel/CSV parsing and validation
- **Question Filtering**: By topic, difficulty, section
- **Question Tagging**: Multiple tags per question

### 2.3 Practice Module
- **Topic-wise Practice**: Filter by section → topic → sub-topic
- **Random Quiz**: Generate random questions based on filters
- **Question Navigation**: Next/Previous, Jump to question
- **Answer Submission**: Single/Multiple question submission

### 2.4 Test Module
- **Test Creation**: Admin creates timed tests
- **Test Taking**: Timer, question navigation, auto-submit
- **Test Submission**: Calculate score, store results
- **Result Analysis**: Accuracy, time per question, topic-wise performance

### 2.5 Progress Tracking Module
- **User Statistics**: Total questions attempted, accuracy, streaks
- **Topic-wise Progress**: Questions attempted per topic, accuracy per topic
- **Performance Graphs**: Time-series data for progress visualization
- **Achievements**: Badges for milestones

### 2.6 Leaderboard Module
- **Global Leaderboard**: Overall rankings
- **Section-wise Leaderboard**: Rankings per section
- **Weekly/Monthly Leaderboards**: Time-based rankings

### 2.7 Admin Module
- **Dashboard**: Overview statistics
- **Question Management**: CRUD interface
- **User Management**: View, edit, delete users
- **Analytics**: Most attempted topics, average accuracy, user engagement

## 3. Database Design

See `database/schema.sql` for detailed schema.

### Key Tables:
- `users`: User accounts and profiles
- `questions`: Question bank
- `question_options`: MCQ options
- `user_attempts`: Individual question attempts
- `tests`: Test definitions
- `test_attempts`: User test submissions
- `bookmarks`: User bookmarked questions
- `leaderboard`: Cached leaderboard data

## 4. Security Considerations

- **Password Hashing**: bcrypt with salt rounds
- **JWT Tokens**: Secure token generation with expiration
- **Input Validation**: Server-side validation for all inputs
- **SQL Injection Prevention**: Parameterized queries
- **CORS**: Configured for frontend origin only
- **Rate Limiting**: Prevent abuse of APIs

## 5. Performance Optimization

- **Database Indexing**: Indexes on frequently queried columns
- **Caching**: Redis for leaderboard and frequently accessed data
- **Pagination**: Limit results per page
- **Lazy Loading**: Load questions on demand
- **CDN**: Static assets served via CDN

## 6. Scalability

- **Horizontal Scaling**: Stateless backend, load balancer
- **Database Replication**: Read replicas for heavy read operations
- **Microservices**: Separate services for different modules (future)
- **Queue System**: Background jobs for analytics processing

## 7. Deployment Architecture

```
┌─────────────┐
│   Nginx     │ (Reverse Proxy)
└──────┬──────┘
       │
┌──────▼──────────┐
│  Load Balancer │
└──────┬──────────┘
       │
   ┌───┴───┐
   │       │
┌──▼──┐ ┌──▼──┐
│App1 │ │App2 │ (Express.js instances)
└──┬──┘ └──┬──┘
   │       │
   └───┬───┘
       │
┌──────▼──────┐
│   MySQL     │ (Primary + Replicas)
└─────────────┘
```

