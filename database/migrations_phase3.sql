-- Phase 3 Database Migrations

USE aptitudeweb;

-- 1. Add streak and point columns to users table
ALTER TABLE users ADD COLUMN current_streak INT DEFAULT 0;
ALTER TABLE users ADD COLUMN longest_streak INT DEFAULT 0;
ALTER TABLE users ADD COLUMN last_active_date DATE NULL;
ALTER TABLE users ADD COLUMN total_points INT DEFAULT 0;

-- 2. Create badges table
CREATE TABLE IF NOT EXISTS badges (
  id INT PRIMARY KEY AUTO_INCREMENT,
  badge_key VARCHAR(50) UNIQUE NOT NULL,  -- 'first_attempt', 'century_club' etc
  name VARCHAR(100) NOT NULL,
  description VARCHAR(255) NOT NULL,
  icon VARCHAR(50) NOT NULL,             -- emoji or lucide icon name
  points_reward INT DEFAULT 0,
  condition_type ENUM('questions_attempted', 'accuracy', 'streak', 'tests_completed', 'milestone') NOT NULL,
  condition_value INT NOT NULL           -- e.g. 100 for "attempt 100 questions"
);

-- 3. Create user earned badges table
CREATE TABLE IF NOT EXISTS user_badges (
  id INT PRIMARY KEY AUTO_INCREMENT,
  user_id INT NOT NULL,
  badge_key VARCHAR(50) NOT NULL,
  earned_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
  UNIQUE KEY unique_user_badge (user_id, badge_key)
);

-- 4. Seed badge definitions
INSERT INTO badges (id, badge_key, name, description, icon, points_reward, condition_type, condition_value) VALUES
(1, 'first_step', 'First Step', 'Answered your first question', '🎯', 10, 'questions_attempted', 1),
(2, 'getting_started', 'Getting Started', 'Answered 10 questions', '📚', 25, 'questions_attempted', 10),
(3, 'century_club', 'Century Club', 'Answered 100 questions', '💯', 100, 'questions_attempted', 100),
(4, 'question_master', 'Question Master', 'Answered 500 questions', '🏆', 500, 'questions_attempted', 500),
(5, 'sharp_mind', 'Sharp Mind', 'Achieved 90%+ accuracy (min 20 questions)', '🧠', 200, 'accuracy', 90),
(6, 'consistent', 'Consistent', 'Maintained a 7-day streak', '🔥', 150, 'streak', 7),
(7, 'unstoppable', 'Unstoppable', 'Maintained a 30-day streak', '⚡', 500, 'streak', 30),
(8, 'test_taker', 'Test Taker', 'Completed your first test', '📝', 50, 'tests_completed', 1),
(9, 'exam_ready', 'Exam Ready', 'Completed 10 tests', '🎓', 200, 'tests_completed', 10),
(10, 'perfectionist', 'Perfectionist', 'Scored 100% on any test', '⭐', 300, 'milestone', 100)
ON DUPLICATE KEY UPDATE 
  name = VALUES(name),
  description = VALUES(description),
  icon = VALUES(icon),
  points_reward = VALUES(points_reward),
  condition_type = VALUES(condition_type),
  condition_value = VALUES(condition_value);

-- 5. Add columns to tests table
ALTER TABLE tests ADD COLUMN test_type ENUM('topic', 'mock', 'speed', 'accuracy') DEFAULT 'topic';
ALTER TABLE tests ADD COLUMN sections_config JSON NULL;

-- 6. Seed mock tests
INSERT INTO tests (name, description, duration, total_questions, test_type, sections_config, is_active) VALUES
('Full Mock Test - 1', 'Complete aptitude mock test simulating exam conditions', 3600, 60, 'mock', 
  '{"quantitative": {"count": 25, "time": 1500}, "logical": {"count": 20, "time": 1200}, "di": {"count": 15, "time": 900}}', 1),
('Full Mock Test - 2', 'Complete aptitude mock test simulating placement papers', 3600, 60, 'mock',
  '{"quantitative": {"count": 25, "time": 1500}, "logical": {"count": 20, "time": 1200}, "di": {"count": 15, "time": 900}}', 1),
('Speed Test', 'Quick 20-question speed challenge', 1200, 20, 'speed', NULL, 1),
('Accuracy Test', 'No timer — focus on accuracy', 99999, 30, 'accuracy', NULL, 1)
ON DUPLICATE KEY UPDATE name=name;
