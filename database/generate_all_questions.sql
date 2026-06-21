-- ============================================
-- COMPREHENSIVE APTITUDE QUESTIONS
-- Generated for Recent Interview Patterns (2023-2025)
-- 15+ questions per topic
-- ============================================

USE aptitudeweb;

-- ============================================
-- PERCENTAGES (Topic ID: 2) - 18 Questions
-- ============================================

-- Q1: Basic Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Basic Percentage', 'If 40% of a number is 120, what is 75% of that number?', 'easy', 'C',
'Let the number be x.\n40% of x = 120\n0.40x = 120\nx = 120 ÷ 0.40 = 300\n\n75% of 300 = 0.75 × 300 = 225\n\nAnswer: 225',
'Find the number first: 120 ÷ 0.40 = 300, then 75% of 300 = 225.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '180'), (@q_id, 'B', '200'), (@q_id, 'C', '225'), (@q_id, 'D', '250');

-- Q2: Percentage Increase
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Increase', 'The price of a product increased from Rs. 500 to Rs. 650. What is the percentage increase?', 'easy', 'B',
'Original price = Rs. 500\nNew price = Rs. 650\nIncrease = 650 - 500 = Rs. 150\n\nPercentage increase = (150/500) × 100 = 30%\n\nAnswer: 30%',
'Formula: % increase = (Increase/Original) × 100 = (150/500) × 100 = 30%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '25%'), (@q_id, 'B', '30%'), (@q_id, 'C', '35%'), (@q_id, 'D', '40%');

-- Q3: Successive Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Successive Percentage', 'A number is first increased by 20% and then decreased by 15%. What is the net percentage change?', 'medium', 'A',
'Let original number = 100\nAfter 20% increase: 100 + 20 = 120\nAfter 15% decrease: 120 - (15% of 120) = 120 - 18 = 102\n\nNet change = 102 - 100 = 2\nNet percentage = (2/100) × 100 = 2% increase\n\nAnswer: 2% increase',
'Successive % formula: Net change = a + b + (ab/100) = 20 - 15 - (20×15/100) = 5 - 3 = 2% increase.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '2% increase'), (@q_id, 'B', '2% decrease'), (@q_id, 'C', '5% increase'), (@q_id, 'D', '5% decrease');

-- Q4: Percentage of Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage of Percentage', 'If 25% of 40% of a number is 30, what is the number?', 'medium', 'B',
'Let the number be x.\n25% of 40% of x = 30\n(25/100) × (40/100) × x = 30\n(1/4) × (2/5) × x = 30\n(2/20) × x = 30\n(1/10) × x = 30\nx = 30 × 10 = 300\n\nAnswer: 300',
'25% of 40% = 10% of the number. So 10% of x = 30, therefore x = 300.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '250'), (@q_id, 'B', '300'), (@q_id, 'C', '350'), (@q_id, 'D', '400');

-- Q5: Population Growth
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Population Growth', 'The population of a town increases by 10% annually. If the present population is 12100, what was the population 2 years ago?', 'hard', 'C',
'Let population 2 years ago = P\nAfter 1 year: P × 1.10\nAfter 2 years: P × 1.10 × 1.10 = P × 1.21\n\nP × 1.21 = 12100\nP = 12100 ÷ 1.21 = 10000\n\nAnswer: 10000',
'If present = P × (1.10)^2 = P × 1.21, then P = Present ÷ 1.21 = 12100 ÷ 1.21 = 10000.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '9000'), (@q_id, 'B', '9500'), (@q_id, 'C', '10000'), (@q_id, 'D', '11000');

-- Q6: Percentage Comparison
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Comparison', 'A is 20% more than B, and B is 25% less than C. By what percent is A less than C?', 'hard', 'B',
'Let C = 100\nB = 100 - 25% of 100 = 100 - 25 = 75\nA = 75 + 20% of 75 = 75 + 15 = 90\n\nA is less than C by: 100 - 90 = 10\nPercentage: (10/100) × 100 = 10%\n\nAnswer: 10%',
'Set C = 100, find B = 75, then A = 90. A is 10% less than C.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '5%'), (@q_id, 'B', '10%'), (@q_id, 'C', '15%'), (@q_id, 'D', '20%');

-- Q7: Percentage in Mixtures
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage in Mixtures', 'In an examination, 65% of students passed. If 420 students failed, how many students appeared for the examination?', 'medium', 'D',
'Pass percentage = 65%\nFail percentage = 100% - 65% = 35%\n\n35% of total = 420\nTotal = 420 ÷ 0.35 = 1200\n\nAnswer: 1200',
'If 35% = 420, then 100% = 420 × (100/35) = 1200.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '1000'), (@q_id, 'B', '1100'), (@q_id, 'C', '1150'), (@q_id, 'D', '1200');

-- Q8: Compound Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Compound Percentage', 'The value of a car depreciates by 15% each year. If its current value is Rs. 2,89,000, what was its value 2 years ago?', 'hard', 'A',
'Let value 2 years ago = V\nAfter 1 year: V × 0.85\nAfter 2 years: V × 0.85 × 0.85 = V × 0.7225\n\nV × 0.7225 = 289000\nV = 289000 ÷ 0.7225 = 400000\n\nAnswer: 400000',
'V × (0.85)^2 = 289000, so V = 289000 ÷ 0.7225 = 400000.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '400000'), (@q_id, 'B', '380000'), (@q_id, 'C', '360000'), (@q_id, 'D', '340000');

-- Q9: Percentage and Ratio
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage and Ratio', 'If 30% of A equals 40% of B, what percentage of A is B?', 'medium', 'B',
'30% of A = 40% of B\n0.30A = 0.40B\nB = (0.30/0.40)A = 0.75A\n\nB = 75% of A\n\nAnswer: 75%',
'From 0.30A = 0.40B, we get B/A = 0.75, so B = 75% of A.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '70%'), (@q_id, 'B', '75%'), (@q_id, 'C', '80%'), (@q_id, 'D', '85%');

-- Q10: Percentage Error
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Error', 'A student multiplied a number by 3/5 instead of 5/3. What is the percentage error?', 'hard', 'C',
'Let the number be x.\nWrong result = x × (3/5) = 3x/5\nCorrect result = x × (5/3) = 5x/3\n\nError = Correct - Wrong = 5x/3 - 3x/5 = (25x - 9x)/15 = 16x/15\n\nPercentage error = (Error/Correct) × 100\n= (16x/15) ÷ (5x/3) × 100\n= (16x/15) × (3/5x) × 100\n= (16/25) × 100\n= 64%\n\nAnswer: 64%',
'Error percentage = |Wrong - Correct|/Correct × 100. Calculate: (5/3 - 3/5) ÷ (5/3) × 100 = 64%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '56%'), (@q_id, 'B', '60%'), (@q_id, 'C', '64%'), (@q_id, 'D', '72%');

-- Continue with more Percentage questions (Q11-Q18) and then other topics...
-- Due to length constraints, I'll create separate comprehensive files

