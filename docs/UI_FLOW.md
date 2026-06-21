# UI Flow Documentation

## 1. User Journey

### 1.1 Landing Page
- **Hero Section**: Welcome message, key features
- **Sections Overview**: Cards for Quantitative, Logical Reasoning, DI
- **CTA Buttons**: "Get Started" / "Login"
- **Statistics**: Total questions, users, tests

### 1.2 Authentication Flow
- **Registration Page**:
  - Form: Name, Email, Password, Confirm Password
  - Validation feedback
  - Redirect to dashboard after registration
  
- **Login Page**:
  - Form: Email, Password
  - "Forgot Password?" link
  - "Don't have an account? Sign up" link
  - Redirect to dashboard after login

### 1.3 Dashboard (After Login)
- **Header**: Logo, Navigation, User menu (Profile, Logout), Theme toggle
- **Sidebar** (Desktop):
  - Home
  - Practice (Quantitative, Logical, DI)
  - Tests
  - Bookmarks
  - Progress
  - Leaderboard
  
- **Main Content**:
  - **Quick Stats Cards**: Total attempted, Accuracy, Current streak
  - **Progress Chart**: Performance over time
  - **Recent Activity**: Last attempted questions/tests
  - **Recommended Topics**: Based on weak areas
  - **Upcoming Tests**: Scheduled mock tests

### 1.4 Practice Flow

#### Topic Selection
- **Section Page** (e.g., Quantitative Aptitude):
  - Grid of topic cards (Number System, Percentages, etc.)
  - Each card shows: Topic name, Questions count, User's accuracy
  
- **Topic Page**:
  - Subtopic list
  - Filter by difficulty
  - "Start Practice" button
  - "Generate Random Quiz" button

#### Question Practice Interface
- **Layout**:
  - Left: Question panel (Question text, options)
  - Right: Navigation panel (Question list, Timer, Submit button)
  - Bottom: Previous/Next buttons
  
- **Question Display**:
  - Question number and text
  - 4 radio buttons (A, B, C, D)
  - "Show Solution" button (after answering)
  - Bookmark icon
  
- **After Answering**:
  - Immediate feedback (Correct/Incorrect)
  - Show correct answer
  - Display solution and explanation
  - Update stats

#### Practice Results
- **Summary Card**: Total attempted, Correct, Accuracy, Time taken
- **Topic-wise Breakdown**: Performance per topic
- **Review Section**: List of questions with answers
- **Action Buttons**: "Practice More", "Review Answers", "Back to Topics"

### 1.5 Test Flow

#### Test List Page
- **Filters**: Section, Type (Section-wise/Full-length), Status
- **Test Cards**: Name, Duration, Questions count, Difficulty, "Start Test" button

#### Test Taking Interface
- **Header**: Test name, Timer (countdown), Progress bar
- **Question Panel**: Similar to practice interface
- **Navigation Panel**:
  - Question grid (numbered boxes)
  - Color coding: Answered (green), Current (blue), Unanswered (gray)
  - "Submit Test" button (with confirmation)
  
- **Timer Warning**: Alert when 5 minutes remaining
- **Auto-submit**: Submit automatically when time expires

#### Test Results
- **Score Card**: Large display of score, accuracy, rank
- **Performance Breakdown**:
  - Section-wise scores
  - Topic-wise accuracy
  - Time per question
- **Question Review**:
  - Expandable list of all questions
  - Show user's answer vs correct answer
  - Solutions for all questions
- **Action Buttons**: "Retake Test", "View Solutions", "Share Results"

### 1.6 Progress Dashboard
- **Overview Section**:
  - Total questions attempted
  - Overall accuracy
  - Current streak
  - Time spent
  
- **Performance Charts**:
  - Line chart: Accuracy over time
  - Bar chart: Topic-wise performance
  - Pie chart: Section-wise distribution
  
- **Weak Areas**: Highlighted topics with low accuracy
- **Strengths**: Topics with high accuracy
- **Activity Timeline**: Recent practice/test history

### 1.7 Leaderboard Page
- **Filters**: Overall/Section-wise, Time period (Daily/Weekly/Monthly/All-time)
- **Table View**:
  - Rank, User name, Score, Accuracy, Questions attempted
  - Highlight current user's row
- **Pagination**: For large leaderboards

### 1.8 Bookmarks Page
- **Filter**: By section, topic, difficulty
- **Question Cards**: Question preview, topic tag, "Remove Bookmark" button
- **Click to Practice**: Opens question in practice mode

## 2. Admin Panel Flow

### 2.1 Admin Dashboard
- **Statistics Cards**: Total users, Questions, Tests, Attempts
- **Charts**: User growth, Question distribution, Popular topics
- **Recent Activity**: New users, recent questions added

### 2.2 Question Management
- **Question List**:
  - Table with filters (Section, Topic, Difficulty)
  - Search functionality
  - Actions: Edit, Delete, Preview
  
- **Add/Edit Question Form**:
  - Section dropdown
  - Topic dropdown (dynamic based on section)
  - Subtopic input
  - Question textarea (rich text editor)
  - Options (4 inputs)
  - Correct answer dropdown
  - Difficulty dropdown
  - Solution textarea
  - Explanation textarea
  - Tags input
  - Save/Cancel buttons

### 2.3 Bulk Upload
- **Upload Interface**:
  - File input (CSV/Excel)
  - Template download link
  - Upload button
  - Progress indicator
  
- **Upload Results**:
  - Success count
  - Failed count with errors
  - Download error report

### 2.4 User Management
- **User List Table**:
  - Columns: Name, Email, Joined, Attempts, Accuracy, Status
  - Actions: View details, Deactivate/Activate, Delete
  
- **User Details Modal**: Full user profile and statistics

### 2.5 Analytics Page
- **Overview Metrics**: Key statistics
- **Charts**:
  - Most attempted topics
  - Average accuracy by topic
  - User engagement over time
  - Difficulty distribution
- **Export Options**: Download reports as CSV/PDF

## 3. Responsive Design

### Mobile View (< 768px)
- **Hamburger Menu**: Collapsible sidebar
- **Bottom Navigation**: Quick access to main sections
- **Stacked Layout**: Single column for question/options
- **Touch-friendly**: Larger buttons, swipe gestures

### Tablet View (768px - 1024px)
- **Adaptive Layout**: 2-column where appropriate
- **Sidebar**: Collapsible but accessible

### Desktop View (> 1024px)
- **Full Layout**: Sidebar always visible
- **Multi-column**: Optimal use of screen space

## 4. Dark Mode Implementation

- **Theme Toggle**: In header/navigation
- **Color Scheme**:
  - Light: White background, dark text
  - Dark: Dark background (#1a1a1a), light text
- **Persistent**: Saved in localStorage
- **Smooth Transition**: CSS transitions for theme switch

## 5. Accessibility Features

- **Keyboard Navigation**: Full keyboard support
- **ARIA Labels**: Screen reader support
- **Focus Indicators**: Visible focus states
- **Color Contrast**: WCAG AA compliant
- **Alt Text**: Images have descriptive alt text

## 6. Performance Optimizations

- **Lazy Loading**: Load questions on scroll
- **Code Splitting**: Route-based code splitting
- **Image Optimization**: Compressed images, lazy loading
- **Caching**: Cache API responses where appropriate

