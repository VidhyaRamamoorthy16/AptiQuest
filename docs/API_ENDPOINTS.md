# API Endpoints Documentation

Base URL: `http://localhost:5500/api`

## Authentication Endpoints

### POST /auth/register
Register a new user.

**Request Body:**
```json
{
  "name": "John Doe",
  "email": "john@example.com",
  "password": "SecurePass123"
}
```

**Response:**
```json
{
  "success": true,
  "message": "User registered successfully",
  "token": "jwt_token_here"
}
```

### POST /auth/login
Login user.

**Request Body:**
```json
{
  "email": "john@example.com",
  "password": "SecurePass123"
}
```

**Response:**
```json
{
  "success": true,
  "token": "jwt_token_here",
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com"
  }
}
```

### GET /auth/me
Get current user profile (requires authentication).

**Headers:**
```
Authorization: Bearer jwt_token_here
```

**Response:**
```json
{
  "success": true,
  "user": {
    "id": 1,
    "name": "John Doe",
    "email": "john@example.com",
    "createdAt": "2024-01-01T00:00:00.000Z"
  }
}
```

## Question Endpoints

### GET /questions
Get questions with filters.

**Query Parameters:**
- `section` (optional): quantitative | logical | di
- `topic` (optional): topic name
- `difficulty` (optional): easy | medium | hard
- `page` (optional): page number (default: 1)
- `limit` (optional): items per page (default: 10)

**Response:**
```json
{
  "success": true,
  "questions": [...],
  "pagination": {
    "page": 1,
    "limit": 10,
    "total": 100,
    "pages": 10
  }
}
```

### GET /questions/:id
Get a single question with options and solution.

**Response:**
```json
{
  "success": true,
  "question": {
    "id": 1,
    "section": "quantitative",
    "topic": "Number System",
    "subtopic": "Divisibility",
    "question": "What is the remainder when...",
    "difficulty": "medium",
    "options": [...],
    "correctAnswer": "A",
    "solution": "Step-by-step solution...",
    "explanation": "Shortcut explanation..."
  }
}
```

### POST /questions/:id/attempt
Submit an answer for a question.

**Request Body:**
```json
{
  "selectedAnswer": "A",
  "timeTaken": 45
}
```

**Response:**
```json
{
  "success": true,
  "isCorrect": true,
  "correctAnswer": "A",
  "explanation": "..."
}
```

## Practice Endpoints

### GET /practice/topics
Get all topics organized by section.

**Response:**
```json
{
  "success": true,
  "topics": {
    "quantitative": ["Number System", "Percentages", ...],
    "logical": ["Coding-Decoding", "Blood Relations", ...],
    "di": ["Tables", "Bar Graphs", ...]
  }
}
```

### POST /practice/generate-quiz
Generate a random quiz.

**Request Body:**
```json
{
  "section": "quantitative",
  "topic": "Number System",
  "difficulty": "medium",
  "count": 10
}
```

**Response:**
```json
{
  "success": true,
  "quizId": "quiz_123",
  "questions": [...]
}
```

## Test Endpoints

### GET /tests
Get available tests.

**Query Parameters:**
- `type` (optional): section | full-length
- `status` (optional): active | completed

**Response:**
```json
{
  "success": true,
  "tests": [...]
}
```

### GET /tests/:id
Get test details.

**Response:**
```json
{
  "success": true,
  "test": {
    "id": 1,
    "name": "Quantitative Aptitude Mock Test",
    "duration": 3600,
    "totalQuestions": 30,
    "sections": [...]
  }
}
```

### POST /tests/:id/start
Start a test attempt.

**Response:**
```json
{
  "success": true,
  "attemptId": 123,
  "startTime": "2024-01-01T10:00:00.000Z",
  "endTime": "2024-01-01T11:00:00.000Z"
}
```

### POST /tests/:id/submit
Submit test answers.

**Request Body:**
```json
{
  "attemptId": 123,
  "answers": {
    "1": "A",
    "2": "B",
    "3": "C"
  }
}
```

**Response:**
```json
{
  "success": true,
  "score": 25,
  "totalQuestions": 30,
  "accuracy": 83.33,
  "timeTaken": 3200,
  "detailedResults": [...]
}
```

### GET /tests/:id/results/:attemptId
Get detailed test results.

**Response:**
```json
{
  "success": true,
  "results": {
    "score": 25,
    "totalQuestions": 30,
    "accuracy": 83.33,
    "topicWisePerformance": {...},
    "questions": [...]
  }
}
```

## Progress Endpoints

### GET /progress/dashboard
Get user progress dashboard.

**Response:**
```json
{
  "success": true,
  "stats": {
    "totalAttempted": 150,
    "totalCorrect": 120,
    "overallAccuracy": 80,
    "streak": 5,
    "topicWiseStats": {...}
  }
}
```

### GET /progress/topic/:topicName
Get progress for a specific topic.

**Response:**
```json
{
  "success": true,
  "topic": "Number System",
  "attempted": 25,
  "correct": 20,
  "accuracy": 80,
  "averageTime": 45
}
```

## Bookmark Endpoints

### POST /bookmarks
Add a question to bookmarks.

**Request Body:**
```json
{
  "questionId": 123
}
```

### GET /bookmarks
Get user's bookmarked questions.

**Response:**
```json
{
  "success": true,
  "bookmarks": [...]
}
```

### DELETE /bookmarks/:questionId
Remove a bookmark.

## Leaderboard Endpoints

### GET /leaderboard
Get leaderboard.

**Query Parameters:**
- `type` (optional): overall | section (default: overall)
- `section` (optional): quantitative | logical | di
- `period` (optional): daily | weekly | monthly | all-time (default: all-time)

**Response:**
```json
{
  "success": true,
  "leaderboard": [
    {
      "rank": 1,
      "userId": 5,
      "userName": "John Doe",
      "score": 950,
      "accuracy": 95
    },
    ...
  ]
}
```

## Admin Endpoints

### POST /admin/questions
Create a new question (Admin only).

**Request Body:**
```json
{
  "section": "quantitative",
  "topic": "Number System",
  "subtopic": "Divisibility",
  "question": "Question text...",
  "options": ["A", "B", "C", "D"],
  "correctAnswer": "A",
  "difficulty": "medium",
  "solution": "Solution text...",
  "explanation": "Explanation text..."
}
```

### PUT /admin/questions/:id
Update a question (Admin only).

### DELETE /admin/questions/:id
Delete a question (Admin only).

### POST /admin/questions/bulk-upload
Upload questions via CSV/Excel (Admin only).

**Request:** Multipart form data with file.

**Response:**
```json
{
  "success": true,
  "uploaded": 50,
  "failed": 2,
  "errors": [...]
}
```

### GET /admin/users
Get all users (Admin only).

### GET /admin/analytics
Get analytics data (Admin only).

**Response:**
```json
{
  "success": true,
  "analytics": {
    "totalUsers": 1000,
    "totalQuestions": 5000,
    "totalAttempts": 50000,
    "mostAttemptedTopics": [...],
    "averageAccuracy": 75.5
  }
}
```

## Error Responses

All endpoints return errors in this format:

```json
{
  "success": false,
  "message": "Error message",
  "error": "Detailed error (in development)"
}
```

**HTTP Status Codes:**
- 200: Success
- 201: Created
- 400: Bad Request
- 401: Unauthorized
- 403: Forbidden
- 404: Not Found
- 500: Internal Server Error

