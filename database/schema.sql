-- Aptitude Preparation Website Database Schema
-- MySQL Database

CREATE DATABASE IF NOT EXISTS aptitudeweb;
USE aptitudeweb;

-- Users table
CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    role ENUM('user', 'admin') DEFAULT 'user',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email)
);

-- Sections table
CREATE TABLE sections (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) UNIQUE NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Topics table
CREATE TABLE topics (
    id INT PRIMARY KEY AUTO_INCREMENT,
    section_id INT NOT NULL,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE CASCADE,
    INDEX idx_section (section_id),
    UNIQUE KEY unique_section_topic (section_id, name)
);

-- Questions table
CREATE TABLE questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    section_id INT NOT NULL,
    topic_id INT NOT NULL,
    subtopic VARCHAR(100),
    question TEXT NOT NULL,
    difficulty ENUM('easy', 'medium', 'hard') DEFAULT 'medium',
    correct_answer CHAR(1) NOT NULL,
    solution TEXT NOT NULL,
    explanation TEXT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    created_by INT,
    FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE CASCADE,
    FOREIGN KEY (topic_id) REFERENCES topics(id) ON DELETE CASCADE,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_section (section_id),
    INDEX idx_topic (topic_id),
    INDEX idx_difficulty (difficulty),
    FULLTEXT INDEX idx_question_text (question)
);

-- Question options table
CREATE TABLE question_options (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT NOT NULL,
    option_label CHAR(1) NOT NULL,
    option_text TEXT NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_question_option (question_id, option_label),
    INDEX idx_question (question_id)
);

-- User attempts table (for practice mode)
CREATE TABLE user_attempts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    selected_answer CHAR(1),
    is_correct BOOLEAN,
    time_taken INT DEFAULT 0,
    attempted_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    INDEX idx_user (user_id),
    INDEX idx_question (question_id),
    INDEX idx_attempted_at (attempted_at)
);

-- Tests table
CREATE TABLE tests (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(200) NOT NULL,
    description TEXT,
    type ENUM('section', 'full-length') DEFAULT 'section',
    section_id INT,
    duration INT NOT NULL COMMENT 'Duration in seconds',
    total_questions INT NOT NULL,
    is_active BOOLEAN DEFAULT TRUE,
    created_by INT,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE SET NULL,
    FOREIGN KEY (created_by) REFERENCES users(id) ON DELETE SET NULL,
    INDEX idx_type (type),
    INDEX idx_section (section_id)
);

-- Test questions mapping table
CREATE TABLE test_questions (
    id INT PRIMARY KEY AUTO_INCREMENT,
    test_id INT NOT NULL,
    question_id INT NOT NULL,
    question_order INT NOT NULL,
    FOREIGN KEY (test_id) REFERENCES tests(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_test_question (test_id, question_id),
    INDEX idx_test (test_id),
    INDEX idx_order (test_id, question_order)
);

-- Test attempts table
CREATE TABLE test_attempts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    test_id INT NOT NULL,
    started_at TIMESTAMP NOT NULL,
    submitted_at TIMESTAMP,
    score INT DEFAULT 0,
    total_questions INT NOT NULL,
    accuracy DECIMAL(5,2) DEFAULT 0,
    time_taken INT DEFAULT 0 COMMENT 'Time taken in seconds',
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (test_id) REFERENCES tests(id) ON DELETE CASCADE,
    INDEX idx_user (user_id),
    INDEX idx_test (test_id),
    INDEX idx_submitted_at (submitted_at)
);

-- Test attempt answers table
CREATE TABLE test_attempt_answers (
    id INT PRIMARY KEY AUTO_INCREMENT,
    attempt_id INT NOT NULL,
    question_id INT NOT NULL,
    selected_answer CHAR(1),
    is_correct BOOLEAN,
    time_taken INT DEFAULT 0,
    FOREIGN KEY (attempt_id) REFERENCES test_attempts(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_attempt_question (attempt_id, question_id),
    INDEX idx_attempt (attempt_id)
);

-- Bookmarks table
CREATE TABLE bookmarks (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    question_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    UNIQUE KEY unique_user_bookmark (user_id, question_id),
    INDEX idx_user (user_id)
);

-- Leaderboard cache table (for performance)
CREATE TABLE leaderboard (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT NOT NULL,
    section_id INT,
    score INT DEFAULT 0,
    accuracy DECIMAL(5,2) DEFAULT 0,
    total_attempts INT DEFAULT 0,
    period_type ENUM('daily', 'weekly', 'monthly', 'all-time') DEFAULT 'all-time',
    period_date DATE,
    `rank` INT,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    FOREIGN KEY (section_id) REFERENCES sections(id) ON DELETE SET NULL,
    INDEX idx_user (user_id),
    INDEX idx_section (section_id),
    INDEX idx_period (period_type, period_date),
    INDEX idx_rank (section_id, period_type, period_date, `rank`)
);

-- Question tags table (for advanced filtering)
CREATE TABLE question_tags (
    id INT PRIMARY KEY AUTO_INCREMENT,
    question_id INT NOT NULL,
    tag VARCHAR(50) NOT NULL,
    FOREIGN KEY (question_id) REFERENCES questions(id) ON DELETE CASCADE,
    INDEX idx_question (question_id),
    INDEX idx_tag (tag)
);

-- Insert default sections
INSERT INTO sections (name, description) VALUES
('quantitative', 'Quantitative Aptitude - Mathematics and numerical problem solving'),
('logical', 'Logical Reasoning - Analytical and logical thinking'),
('di', 'Data Interpretation - Analyzing and interpreting data');

-- Insert topics for Quantitative Aptitude
INSERT INTO topics (section_id, name, description) VALUES
(1, 'Number System', 'Basic number properties, divisibility, factors, multiples'),
(1, 'Percentages', 'Percentage calculations, percentage change, applications'),
(1, 'Profit & Loss', 'Cost price, selling price, profit, loss calculations'),
(1, 'Simple & Compound Interest', 'Interest calculations, principal, rate, time'),
(1, 'Time & Work', 'Work efficiency, time calculations, work done'),
(1, 'Time, Speed & Distance', 'Speed, distance, time relationships'),
(1, 'Ratio & Proportion', 'Ratios, proportions, mixtures'),
(1, 'Averages', 'Mean, weighted average, average speed'),
(1, 'Algebra', 'Equations, inequalities, polynomials'),
(1, 'Permutations & Combinations', 'Arrangements, selections, counting principles'),
(1, 'Probability', 'Probability calculations, events, outcomes'),
(1, 'Mensuration', 'Area, volume, perimeter calculations'),
(1, 'Pipes & Cisterns', 'Work rate problems with pipes'),
(1, 'Mixtures & Alligations', 'Mixing problems, alligation rule');

-- Insert topics for Logical Reasoning
INSERT INTO topics (section_id, name, description) VALUES
(2, 'Coding-Decoding', 'Pattern recognition in codes'),
(2, 'Blood Relations', 'Family relationship problems'),
(2, 'Direction Sense', 'Direction and distance problems'),
(2, 'Seating Arrangement', 'Linear and circular arrangements'),
(2, 'Puzzles', 'Logical puzzles and brain teasers'),
(2, 'Syllogism', 'Logical reasoning with statements'),
(2, 'Statements & Conclusions', 'Drawing conclusions from statements'),
(2, 'Series', 'Number and alphabet series'),
(2, 'Analogies', 'Finding relationships and analogies'),
(2, 'Venn Diagrams', 'Set theory and Venn diagram problems');

-- Insert topics for Data Interpretation
INSERT INTO topics (section_id, name, description) VALUES
(3, 'Tables', 'Data interpretation from tables'),
(3, 'Bar Graphs', 'Bar chart interpretation'),
(3, 'Line Charts', 'Line graph interpretation'),
(3, 'Pie Charts', 'Pie chart interpretation'),
(3, 'Case-lets', 'Case study based DI'),
(3, 'Mixed DI', 'Combination of multiple chart types');

