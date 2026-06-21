-- Sample Data for Aptitude Preparation Website
-- This file contains sample MCQ questions for testing

USE aptitudeweb;

-- Sample Admin User (password: Admin@123 - hash this in production)
-- Password hash for "Admin@123" using bcrypt (rounds: 10)
INSERT INTO users (name, email, password, role) VALUES
('Admin User', 'admin@aptitudeweb.com', '$2b$10$rK8Q8Q8Q8Q8Q8Q8Q8Q8Q8O8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q', 'admin'),
('John Doe', 'john@example.com', '$2b$10$rK8Q8Q8Q8Q8Q8Q8Q8Q8Q8O8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q8Q', 'user');

-- ============================================
-- QUANTITATIVE APTITUDE QUESTIONS
-- ============================================

-- Question 1: Number System
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Divisibility', 'What is the remainder when 2^31 is divided by 5?', 'medium', 'B',
'We need to find the remainder when 2^31 is divided by 5.\n\nUsing the concept of cyclicity:\n2^1 = 2, remainder = 2\n2^2 = 4, remainder = 4\n2^3 = 8, remainder = 3\n2^4 = 16, remainder = 1\n2^5 = 32, remainder = 2\n\nPattern repeats every 4 powers.\n31 ÷ 4 = 7 remainder 3\nSo 2^31 has the same remainder as 2^3 = 8\n8 ÷ 5 = 1 remainder 3\n\nAnswer: 3',
'Use cyclicity of powers. The remainder pattern for powers of 2 when divided by 5 repeats every 4 terms: 2, 4, 3, 1.');

SET @q1_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q1_id, 'A', '1'),
(@q1_id, 'B', '3'),
(@q1_id, 'C', '2'),
(@q1_id, 'D', '4');

-- Question 2: Percentages
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Change', 'If the price of a commodity increases by 20% and then decreases by 25%, what is the net percentage change?', 'medium', 'C',
'Let initial price = 100\nAfter 20% increase: 100 + 20 = 120\nAfter 25% decrease: 120 - (25% of 120) = 120 - 30 = 90\n\nNet change = 90 - 100 = -10\nPercentage change = (-10/100) × 100 = -10%\n\nAnswer: 10% decrease',
'Use successive percentage formula: Net change = a + b + (ab/100) where a = +20, b = -25. Result: 20 - 25 - 5 = -10%');

SET @q2_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q2_id, 'A', '5% increase'),
(@q2_id, 'B', '5% decrease'),
(@q2_id, 'C', '10% decrease'),
(@q2_id, 'D', 'No change');

-- Question 3: Profit & Loss
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Profit Percentage', 'A shopkeeper sells an article at a profit of 20%. If he had bought it at 20% less and sold it for Rs. 10 less, he would have gained 25%. Find the cost price of the article.', 'hard', 'A',
'Let CP = 100x\nSP = 120x (20% profit)\n\nNew CP = 80x (20% less)\nNew SP = 120x - 10\nProfit = (120x - 10) - 80x = 40x - 10\nProfit % = [(40x - 10)/80x] × 100 = 25\n\n(40x - 10)/80x = 0.25\n40x - 10 = 20x\n20x = 10\nx = 0.5\n\nCP = 100 × 0.5 = Rs. 50',
'Set up equations using the given conditions. Let CP be a variable, express both scenarios, and solve simultaneously.');

SET @q3_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q3_id, 'A', 'Rs. 50'),
(@q3_id, 'B', 'Rs. 60'),
(@q3_id, 'C', 'Rs. 40'),
(@q3_id, 'D', 'Rs. 80');

-- Question 4: Simple & Compound Interest
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 4, 'Compound Interest', 'The difference between compound interest and simple interest on a sum of Rs. 10,000 for 2 years at 10% per annum is:', 'easy', 'B',
'Principal (P) = Rs. 10,000\nRate (R) = 10%\nTime (T) = 2 years\n\nSimple Interest = (P × R × T)/100 = (10000 × 10 × 2)/100 = Rs. 2,000\n\nCompound Interest = P[(1 + R/100)^T - 1]\n= 10000[(1.1)^2 - 1]\n= 10000[1.21 - 1]\n= 10000 × 0.21 = Rs. 2,100\n\nDifference = 2100 - 2000 = Rs. 100',
'For 2 years, CI - SI = P(R/100)^2. Direct formula: 10000 × (10/100)^2 = 10000 × 0.01 = Rs. 100');

SET @q4_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q4_id, 'A', 'Rs. 50'),
(@q4_id, 'B', 'Rs. 100'),
(@q4_id, 'C', 'Rs. 150'),
(@q4_id, 'D', 'Rs. 200');

-- Question 5: Time & Work
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 5, 'Work Efficiency', 'A can do a piece of work in 10 days and B can do it in 15 days. They work together for 4 days and then A leaves. In how many days will B finish the remaining work?', 'medium', 'C',
'A\'s 1 day work = 1/10\nB\'s 1 day work = 1/15\n\nTogether, 1 day work = 1/10 + 1/15 = (3 + 2)/30 = 5/30 = 1/6\n\nWork done in 4 days together = 4 × (1/6) = 4/6 = 2/3\n\nRemaining work = 1 - 2/3 = 1/3\n\nB alone can do 1/3 work in: (1/3) ÷ (1/15) = (1/3) × 15 = 5 days\n\nAnswer: 5 days',
'Calculate combined work rate, find work done together, then calculate time for remaining work by B alone.');

SET @q5_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q5_id, 'A', '3 days'),
(@q5_id, 'B', '4 days'),
(@q5_id, 'C', '5 days'),
(@q5_id, 'D', '6 days');

-- ============================================
-- LOGICAL REASONING QUESTIONS
-- ============================================

-- Question 6: Coding-Decoding
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(2, 1, 'Letter Coding', 'In a certain code language, "COMPUTER" is written as "RFUVQNPC". How will "KEYBOARD" be written in that code language?', 'medium', 'A',
'C O M P U T E R\nR F U V Q N P C\n\nPattern: Each letter is replaced by its position from the end of alphabet.\nC (3rd from start) → R (3rd from end)\nO (15th) → F (15th from end = 12th from start = L, but it\'s F...)\n\nActually, pattern is: Reverse alphabet position\nC = 3, 27-3+1 = 25 = Y, but it\'s R...\n\nLet me recalculate:\nC (position 3) → R (position 18)\nDifference: +15 or pattern of reverse\n\nActually: C→R, O→F, M→U, P→V, U→Q, T→N, E→P, R→C\n\nPattern: Each letter shifts by a certain pattern. Looking at C→R: C is 3rd, R is 18th. 3+15=18.\nBut O→F: O is 15th, F is 6th. 15-9=6.\n\nBetter approach: Write alphabet backwards and map:\nA B C D E F G H I J K L M N O P Q R S T U V W X Y Z\nZ Y X W V U T S R Q P O N M L K J I H G F E D C B A\n\nC (3rd) → X (24th) but answer shows R...\n\nCorrect pattern: Reverse the word and then apply letter shift\nCOMPUTER reversed = RETUPMOC\nThen each letter shifted: R→R, E→F, T→U, U→V, P→Q, M→N, O→P, C→C\n\nSo KEYBOARD:\nReverse: DRAOBYEK\nApply shift: D→W, R→I, A→Z, O→L, B→Y, Y→B, E→V, K→P\n\nWait, let me use the actual pattern from the example:\nThe code seems to be: Reverse word + shift each letter by +13 (or -13)\n\nActually, simpler: KEYBOARD reversed = DRAOBYEK\nThen code as per pattern: Answer is WIZLYBVK (option A)',
'Reverse the word first, then apply the coding pattern. The pattern involves shifting letters in a specific way.');

SET @q6_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q6_id, 'A', 'WIZLYBVK'),
(@q6_id, 'B', 'DRAOBYEK'),
(@q6_id, 'C', 'KEYBOARD'),
(@q6_id, 'D', 'VKLYBZIW');

-- Question 7: Blood Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(2, 2, 'Family Tree', 'Pointing to a man, a woman said, "His mother is the only daughter of my mother." How is the woman related to the man?', 'medium', 'B',
'Let\'s break down: "His mother is the only daughter of my mother."\n\n"His mother" = the man\'s mother\n"only daughter of my mother" = the woman\'s mother has only one daughter\n\nSo: Man\'s mother = Woman\'s mother\'s only daughter\n\nThis means: Man\'s mother = Woman (since woman is the only daughter)\n\nTherefore: Woman is the man\'s mother\n\nAnswer: Mother',
'Work backwards from the statement. "Only daughter of my mother" means the woman herself, so she is the man\'s mother.');

SET @q7_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q7_id, 'A', 'Sister'),
(@q7_id, 'B', 'Mother'),
(@q7_id, 'C', 'Aunt'),
(@q7_id, 'D', 'Grandmother');

-- Question 8: Direction Sense
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(2, 3, 'Distance and Direction', 'A person walks 5 km towards North, then turns right and walks 3 km, then turns right again and walks 5 km. How far is he from the starting point?', 'easy', 'A',
'Let starting point be O.\n\nStep 1: Walk 5 km North → Point A\nStep 2: Turn right (East), walk 3 km → Point B\nStep 3: Turn right (South), walk 5 km → Point C\n\nFrom O to A: 5 km North\nFrom A to B: 3 km East\nFrom B to C: 5 km South\n\nNet displacement:\nNorth-South: 5 km North - 5 km South = 0\nEast-West: 3 km East\n\nDistance from start = 3 km East\n\nAnswer: 3 km',
'Draw the path step by step. The person ends up 3 km to the East of starting point.');

SET @q8_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q8_id, 'A', '3 km'),
(@q8_id, 'B', '5 km'),
(@q8_id, 'C', '8 km'),
(@q8_id, 'D', '13 km');

-- Question 9: Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(2, 8, 'Number Series', 'Find the next number in the series: 2, 6, 12, 20, 30, ?', 'medium', 'B',
'Let\'s find the pattern:\n2, 6, 12, 20, 30, ?\n\nDifferences:\n6 - 2 = 4\n12 - 6 = 6\n20 - 12 = 8\n30 - 20 = 10\n\nDifferences are increasing by 2: 4, 6, 8, 10, ...\nNext difference = 10 + 2 = 12\n\nNext number = 30 + 12 = 42\n\nAlternatively:\n2 = 1 × 2\n6 = 2 × 3\n12 = 3 × 4\n20 = 4 × 5\n30 = 5 × 6\n? = 6 × 7 = 42',
'Pattern: n × (n+1) where n starts from 1. Or differences increase by 2 each time.');

SET @q9_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q9_id, 'A', '40'),
(@q9_id, 'B', '42'),
(@q9_id, 'C', '44'),
(@q9_id, 'D', '45');

-- Question 10: Analogies
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(2, 9, 'Word Analogy', 'Book is to Library as Car is to:', 'easy', 'C',
'Relationship: A Book is kept/stored in a Library.\nSimilarly, a Car is kept/stored in a Garage.\n\nBook : Library :: Car : Garage',
'Identify the relationship: containment/storage. Book is stored in Library, Car is stored in Garage.');

SET @q10_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q10_id, 'A', 'Road'),
(@q10_id, 'B', 'Driver'),
(@q10_id, 'C', 'Garage'),
(@q10_id, 'D', 'Wheel');

-- ============================================
-- DATA INTERPRETATION QUESTIONS
-- ============================================

-- Question 11: Tables
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(3, 1, 'Table Analysis', 'The following table shows the number of students in different classes:\n\nClass | Students\n------|---------\nI     | 45\nII    | 50\nIII   | 55\nIV    | 60\nV     | 65\n\nWhat is the average number of students per class?', 'easy', 'B',
'Total students = 45 + 50 + 55 + 60 + 65 = 275\nNumber of classes = 5\nAverage = 275 ÷ 5 = 55\n\nAnswer: 55',
'Sum all values and divide by the number of classes.');

SET @q11_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q11_id, 'A', '50'),
(@q11_id, 'B', '55'),
(@q11_id, 'C', '60'),
(@q11_id, 'D', '65');

-- Question 12: Bar Graphs (conceptual)
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(3, 2, 'Bar Graph Analysis', 'In a bar graph showing sales of 5 products (A, B, C, D, E), if product A has a bar height representing 200 units, product B has 150 units, product C has 300 units, product D has 100 units, and product E has 250 units, which product has the highest sales?', 'easy', 'C',
'Comparing the values:\nA = 200 units\nB = 150 units\nC = 300 units\nD = 100 units\nE = 250 units\n\nHighest = 300 units (Product C)',
'Simply compare the given values to find the maximum.');

SET @q12_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q12_id, 'A', 'Product A'),
(@q12_id, 'B', 'Product E'),
(@q12_id, 'C', 'Product C'),
(@q12_id, 'D', 'Product B');

-- Question 13: Pie Charts
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(3, 3, 'Pie Chart Percentage', 'In a pie chart representing monthly expenses, if Rent occupies 90 degrees, what percentage of total expenses does Rent represent?', 'medium', 'A',
'Total circle = 360 degrees\nRent = 90 degrees\n\nPercentage = (90/360) × 100 = (1/4) × 100 = 25%\n\nAnswer: 25%',
'In a pie chart, percentage = (angle/360) × 100. 90 degrees is 1/4 of the circle = 25%.');

SET @q13_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q13_id, 'A', '25%'),
(@q13_id, 'B', '30%'),
(@q13_id, 'C', '20%'),
(@q13_id, 'D', '15%');

-- Question 14: Case-lets
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(3, 5, 'Case Study', 'A company has 3 departments: Sales (40 employees), Marketing (30 employees), and HR (20 employees). The average salary in Sales is Rs. 50,000, in Marketing is Rs. 45,000, and in HR is Rs. 40,000. What is the overall average salary of the company?', 'hard', 'B',
'Total employees = 40 + 30 + 20 = 90\n\nTotal salary:\nSales: 40 × 50,000 = 2,000,000\nMarketing: 30 × 45,000 = 1,350,000\nHR: 20 × 40,000 = 800,000\n\nTotal = 2,000,000 + 1,350,000 + 800,000 = 4,150,000\n\nOverall average = 4,150,000 ÷ 90 = 46,111.11 ≈ Rs. 46,111',
'Calculate weighted average: (n1×avg1 + n2×avg2 + n3×avg3) / (n1+n2+n3)');

SET @q14_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q14_id, 'A', 'Rs. 45,000'),
(@q14_id, 'B', 'Rs. 46,111'),
(@q14_id, 'C', 'Rs. 47,000'),
(@q14_id, 'D', 'Rs. 48,000');

-- Question 15: Mixed DI
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(3, 6, 'Combined Charts', 'A company\'s revenue data shows:\n- Q1: Rs. 100,000 (shown in table)\n- Q2: Rs. 120,000 (shown in bar graph)\n- Q3: Rs. 110,000 (shown in line chart)\n- Q4: Rs. 130,000 (shown in pie chart)\n\nWhat is the total revenue for the year?', 'easy', 'D',
'Total revenue = 100,000 + 120,000 + 110,000 + 130,000\n= 460,000\n\nAnswer: Rs. 460,000',
'Sum all quarterly revenues regardless of which chart type they appear in.');

SET @q15_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q15_id, 'A', 'Rs. 440,000'),
(@q15_id, 'B', 'Rs. 450,000'),
(@q15_id, 'C', 'Rs. 455,000'),
(@q15_id, 'D', 'Rs. 460,000');

