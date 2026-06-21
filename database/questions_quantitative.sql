-- Quantitative Aptitude Questions
-- Generated for Recent Interview Patterns (2023-2025)
-- 15+ questions per topic

USE aptitudeweb;

-- ============================================
-- NUMBER SYSTEM (Topic ID: 1)
-- ============================================

-- Q1: Divisibility and Remainders
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Divisibility', 'What is the remainder when 7^2024 is divided by 5?', 'hard', 'B',
'We need to find remainder when 7^2024 is divided by 5.\n\nUsing cyclicity of 7:\n7^1 = 7, remainder = 2\n7^2 = 49, remainder = 4\n7^3 = 343, remainder = 3\n7^4 = 2401, remainder = 1\n7^5 = 16807, remainder = 2\n\nPattern repeats every 4 powers: 2, 4, 3, 1\n\n2024 ÷ 4 = 506 (exact division)\nSo 7^2024 has same remainder as 7^4 = 1\n\nAnswer: 1',
'Cyclicity pattern: 7^n mod 5 repeats every 4 terms. Since 2024 is divisible by 4, remainder is same as 7^4 = 1.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '2'), (@q_id, 'B', '1'), (@q_id, 'C', '3'), (@q_id, 'D', '4');

-- Q2: LCM and HCF
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'LCM & HCF', 'The LCM of two numbers is 120 and their HCF is 8. If one number is 24, what is the other number?', 'medium', 'C',
'Given: LCM = 120, HCF = 8, First number = 24\n\nWe know: LCM × HCF = Product of two numbers\n120 × 8 = 24 × Second number\n960 = 24 × Second number\nSecond number = 960 ÷ 24 = 40\n\nAnswer: 40',
'Direct formula: Second number = (LCM × HCF) ÷ First number = (120 × 8) ÷ 24 = 40.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '32'), (@q_id, 'B', '36'), (@q_id, 'C', '40'), (@q_id, 'D', '48');

-- Q3: Prime Numbers
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Prime Numbers', 'How many prime numbers are there between 50 and 100?', 'medium', 'B',
'Prime numbers between 50 and 100:\n53, 59, 61, 67, 71, 73, 79, 83, 89, 97\n\nCount: 10 prime numbers\n\nAnswer: 10',
'List all primes: 53, 59, 61, 67, 71, 73, 79, 83, 89, 97. Total = 10.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '9'), (@q_id, 'B', '10'), (@q_id, 'C', '11'), (@q_id, 'D', '12');

-- Q4: Number Properties
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Number Properties', 'If a number is divided by 3, 4, 5, and 6, the remainders are 2, 3, 4, and 5 respectively. What is the smallest such number?', 'hard', 'A',
'Let the number be N.\nN = 3a + 2 = 4b + 3 = 5c + 4 = 6d + 5\n\nNotice: In each case, remainder is (divisor - 1)\nSo N + 1 is divisible by 3, 4, 5, 6\n\nLCM of 3, 4, 5, 6 = 60\nN + 1 = 60\nN = 59\n\nAnswer: 59',
'When remainder is (divisor - 1), add 1 to get LCM. N + 1 = LCM(3,4,5,6) = 60, so N = 59.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '59'), (@q_id, 'B', '119'), (@q_id, 'C', '179'), (@q_id, 'D', '239');

-- Q5: Unit Digit
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Unit Digit', 'What is the unit digit of 3^47 + 7^23?', 'medium', 'D',
'Unit digit of 3^47:\n3^1 = 3, 3^2 = 9, 3^3 = 27 (7), 3^4 = 81 (1)\nPattern: 3, 9, 7, 1 (repeats every 4)\n47 ÷ 4 = 11 remainder 3\nSo unit digit is 7\n\nUnit digit of 7^23:\n7^1 = 7, 7^2 = 49 (9), 7^3 = 343 (3), 7^4 = 2401 (1)\nPattern: 7, 9, 3, 1 (repeats every 4)\n23 ÷ 4 = 5 remainder 3\nSo unit digit is 3\n\nSum: 7 + 3 = 10\nUnit digit = 0\n\nAnswer: 0',
'Find unit digits separately using cyclicity, then add: 7 + 3 = 10, unit digit = 0.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '1'), (@q_id, 'B', '3'), (@q_id, 'C', '7'), (@q_id, 'D', '0');

-- Q6: Divisibility Rules
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Divisibility Rules', 'A 5-digit number 7A3B5 is divisible by 11. What is the maximum value of A + B?', 'hard', 'C',
'For divisibility by 11: (Sum of digits at odd positions) - (Sum of digits at even positions) should be divisible by 11.\n\nOdd positions: 7, 3, 5 → Sum = 15\nEven positions: A, B → Sum = A + B\n\nDifference: 15 - (A + B) should be divisible by 11\n\nFor maximum A + B:\n15 - (A + B) = 0 (or 11, -11, etc.)\n15 - (A + B) = 0\nA + B = 15\n\nBut A and B are single digits (0-9), so max A + B = 9 + 9 = 18\n\nCheck: 15 - 18 = -3 (not divisible by 11)\n15 - 15 = 0 ✓ (divisible by 11)\n15 - 4 = 11 ✓ (divisible by 11)\n\nMaximum A + B = 15\n\nAnswer: 15',
'Use divisibility rule for 11. Maximum occurs when difference is 0 or 11. A + B = 15 is maximum possible.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '18'), (@q_id, 'B', '16'), (@q_id, 'C', '15'), (@q_id, 'D', '14');

-- Q7: Factors
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Factors', 'How many factors does 360 have?', 'easy', 'C',
'Prime factorization of 360:\n360 = 2³ × 3² × 5¹\n\nNumber of factors = (3+1) × (2+1) × (1+1)\n= 4 × 3 × 2\n= 24 factors\n\nAnswer: 24',
'Formula: If N = a^p × b^q × c^r, then number of factors = (p+1)(q+1)(r+1).');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '18'), (@q_id, 'B', '20'), (@q_id, 'C', '24'), (@q_id, 'D', '30');

-- Q8: Sum of Factors
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Sum of Factors', 'What is the sum of all factors of 100?', 'medium', 'B',
'Prime factorization: 100 = 2² × 5²\n\nSum of factors = (2^0 + 2^1 + 2^2) × (5^0 + 5^1 + 5^2)\n= (1 + 2 + 4) × (1 + 5 + 25)\n= 7 × 31\n= 217\n\nAnswer: 217',
'Sum formula: (a^0+a^1+...+a^p) × (b^0+b^1+...+b^q) for N = a^p × b^q.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '195'), (@q_id, 'B', '217'), (@q_id, 'C', '225'), (@q_id, 'D', '250');

-- Q9: Perfect Square
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Perfect Square', 'What is the smallest number by which 1800 should be multiplied to make it a perfect square?', 'medium', 'A',
'Prime factorization: 1800 = 2³ × 3² × 5²\n\nFor perfect square, all exponents must be even.\nCurrent: 2³ (odd), 3² (even), 5² (even)\n\nNeed to multiply by 2 to make 2³ → 2⁴\n\nSmallest number = 2\n\nAnswer: 2',
'Make all prime exponents even. Only 2³ needs to become 2⁴, so multiply by 2.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '2'), (@q_id, 'B', '3'), (@q_id, 'C', '5'), (@q_id, 'D', '6');

-- Q10: Number System
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Number System', 'The product of two numbers is 2024 and their HCF is 2. What is their LCM?', 'easy', 'C',
'Given: Product = 2024, HCF = 2\n\nWe know: LCM × HCF = Product\nLCM × 2 = 2024\nLCM = 2024 ÷ 2 = 1012\n\nAnswer: 1012',
'Direct formula: LCM = Product ÷ HCF = 2024 ÷ 2 = 1012.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '506'), (@q_id, 'B', '1008'), (@q_id, 'C', '1012'), (@q_id, 'D', '2022');

-- Q11: Remainder Theorem
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Remainder Theorem', 'What is the remainder when 2^100 is divided by 7?', 'hard', 'B',
'We need remainder when 2^100 ÷ 7\n\nUsing Fermat\'s little theorem or pattern:\n2^1 = 2 mod 7 = 2\n2^2 = 4 mod 7 = 4\n2^3 = 8 mod 7 = 1\n2^4 = 16 mod 7 = 2\n2^5 = 32 mod 7 = 4\n2^6 = 64 mod 7 = 1\n\nPattern: 2, 4, 1 (repeats every 3)\n\n100 ÷ 3 = 33 remainder 1\nSo remainder = 2\n\nAnswer: 2',
'Cyclicity of 2^n mod 7 is 3. 100 mod 3 = 1, so remainder = 2^1 mod 7 = 2.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '1'), (@q_id, 'B', '2'), (@q_id, 'C', '4'), (@q_id, 'D', '6');

-- Q12: Number Properties
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Number Properties', 'A number when divided by 5, 6, and 7 leaves remainders 3, 4, and 5 respectively. What is the smallest such number?', 'hard', 'D',
'Let number be N.\nN = 5a + 3 = 6b + 4 = 7c + 5\n\nNotice: Remainder = Divisor - 2 in each case\nSo N + 2 is divisible by 5, 6, 7\n\nLCM of 5, 6, 7 = 210\nN + 2 = 210\nN = 208\n\nAnswer: 208',
'When remainder pattern is consistent, find LCM and adjust. N + 2 = LCM(5,6,7) = 210, so N = 208.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '104'), (@q_id, 'B', '154'), (@q_id, 'C', '180'), (@q_id, 'D', '208');

-- Q13: Digit Sum
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Digit Sum', 'What is the sum of digits of the number 9^20?', 'medium', 'C',
'9^20 = (10-1)^20\n\nUsing binomial expansion, last few terms matter for digit sum.\n\nActually, easier approach:\n9^1 = 9 (sum = 9)\n9^2 = 81 (sum = 9)\n9^3 = 729 (sum = 18, reduce = 9)\n9^4 = 6561 (sum = 18, reduce = 9)\n\nPattern: Sum of digits of 9^n is always 9 (or reduces to 9)\n\n9^20: Sum of digits = 9\n\nAnswer: 9',
'Property: Sum of digits of 9^n always equals 9 (or reduces to 9 by digital root).');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '1'), (@q_id, 'B', '3'), (@q_id, 'C', '9'), (@q_id, 'D', '18');

-- Q14: Number System
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Number System', 'If the sum of two numbers is 50 and their difference is 10, what is the product of the numbers?', 'easy', 'B',
'Let numbers be x and y.\nx + y = 50\nx - y = 10\n\nAdding: 2x = 60, x = 30\nSubtracting: 2y = 40, y = 20\n\nProduct = 30 × 20 = 600\n\nAnswer: 600',
'x = (sum + diff)/2 = 30, y = (sum - diff)/2 = 20. Product = 600.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '500'), (@q_id, 'B', '600'), (@q_id, 'C', '700'), (@q_id, 'D', '800');

-- Q15: Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Divisibility', 'How many numbers between 100 and 300 are divisible by both 6 and 8?', 'medium', 'A',
'Numbers divisible by both 6 and 8 are divisible by LCM(6,8) = 24\n\nFirst number ≥ 100 divisible by 24: 120 (24 × 5)\nLast number ≤ 300 divisible by 24: 288 (24 × 12)\n\nSequence: 120, 144, 168, ..., 288\n\nNumber of terms = (288 - 120)/24 + 1 = 168/24 + 1 = 7 + 1 = 8\n\nAnswer: 8',
'Find LCM = 24. Count multiples of 24 between 100 and 300: (288-120)/24 + 1 = 8.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '8'), (@q_id, 'B', '9'), (@q_id, 'C', '10'), (@q_id, 'D', '12');

-- Q16: Number System (Bonus)
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 'Number System', 'What is the unit digit of the sum 1! + 2! + 3! + ... + 2024!?', 'hard', 'A',
'Factorials:\n1! = 1\n2! = 2\n3! = 6\n4! = 24\n5! = 120 (ends with 0)\n6! = 720 (ends with 0)\n...\nAll factorials from 5! onwards end with 0.\n\nSo unit digit of sum = unit digit of (1 + 2 + 6 + 24 + 0 + 0 + ...)\n= unit digit of (1 + 2 + 6 + 24)\n= unit digit of 33\n= 3\n\nAnswer: 3',
'Only first 4 factorials contribute to unit digit. Sum = 1+2+6+24 = 33, unit digit = 3.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '3'), (@q_id, 'B', '1'), (@q_id, 'C', '7'), (@q_id, 'D', '9');


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

