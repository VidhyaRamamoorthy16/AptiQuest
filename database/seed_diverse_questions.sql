-- Diverse Aptitude Questions Seed File
-- Generated on 2026-01-18 17:55:45.754928
-- Adds varied questions for all topics

USE aptitudeweb;


-- Topic: Number System (ID: 1, Section: 1)

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 229 is divided by 17?', 'easy', 'A', '229 divided by 17 gives integer quotient 13 and remainder 8.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '8'),
(@q_id, 'B', '10'),
(@q_id, 'C', '9'),
(@q_id, 'D', '7');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 612 is divided by 16?', 'hard', 'C', '612 divided by 16 gives integer quotient 38 and remainder 4.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '6'),
(@q_id, 'B', '5'),
(@q_id, 'C', '4'),
(@q_id, 'D', '3');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 617 is divided by 17?', 'medium', 'B', '617 divided by 17 gives integer quotient 36 and remainder 5.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '7'),
(@q_id, 'B', '5'),
(@q_id, 'C', '6'),
(@q_id, 'D', '4');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 393 is divided by 3?', 'easy', 'A', '393 divided by 3 gives integer quotient 131 and remainder 0.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '0'),
(@q_id, 'B', '2'),
(@q_id, 'C', '1'),
(@q_id, 'D', '3');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 534 is divided by 17?', 'medium', 'B', '534 divided by 17 gives integer quotient 31 and remainder 7.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '9'),
(@q_id, 'B', '7'),
(@q_id, 'C', '6'),
(@q_id, 'D', '8');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 830 is divided by 4?', 'hard', 'A', '830 divided by 4 gives integer quotient 207 and remainder 2.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '2'),
(@q_id, 'B', '1'),
(@q_id, 'C', '4'),
(@q_id, 'D', '3');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 625 is divided by 2?', 'easy', 'A', '625 divided by 2 gives integer quotient 312 and remainder 1.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '1'),
(@q_id, 'B', '0'),
(@q_id, 'C', '3'),
(@q_id, 'D', '2');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 900 is divided by 18?', 'medium', 'D', '900 divided by 18 gives integer quotient 50 and remainder 0.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '3'),
(@q_id, 'B', '1'),
(@q_id, 'C', '2'),
(@q_id, 'D', '0');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 979 is divided by 5?', 'hard', 'C', '979 divided by 5 gives integer quotient 195 and remainder 4.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '3'),
(@q_id, 'B', '5'),
(@q_id, 'C', '4'),
(@q_id, 'D', '6');

-- Divisibility
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 1, 'Divisibility', 'What is the remainder when 329 is divided by 8?', 'hard', 'C', '329 divided by 8 gives integer quotient 41 and remainder 1.', 'Basic division rule: Dividend = Divisor x Quotient + Remainder.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '0'),
(@q_id, 'B', '3'),
(@q_id, 'C', '1'),
(@q_id, 'D', '2');

-- Topic: Percentages (ID: 2, Section: 1)

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 75% of 353?', 'easy', 'A', '75% of 353 = (75/100) * 353 = 264.75', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '264.75'),
(@q_id, 'B', '274.75'),
(@q_id, 'C', '259.75'),
(@q_id, 'D', '529.5');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 25% of 126?', 'easy', 'B', '25% of 126 = (25/100) * 126 = 31.5', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '41.5'),
(@q_id, 'B', '31.5'),
(@q_id, 'C', '63.0'),
(@q_id, 'D', '26.5');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 20% of 377?', 'easy', 'C', '20% of 377 = (20/100) * 377 = 75.4', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '85.4'),
(@q_id, 'B', '150.8'),
(@q_id, 'C', '75.4'),
(@q_id, 'D', '70.4');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 10% of 377?', 'easy', 'D', '10% of 377 = (10/100) * 377 = 37.7', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '75.4'),
(@q_id, 'B', '47.7'),
(@q_id, 'C', '32.7'),
(@q_id, 'D', '37.7');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 20% of 321?', 'easy', 'B', '20% of 321 = (20/100) * 321 = 64.2', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '74.2'),
(@q_id, 'B', '64.2'),
(@q_id, 'C', '59.2'),
(@q_id, 'D', '128.4');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 75% of 390?', 'easy', 'C', '75% of 390 = (75/100) * 390 = 292.5', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '302.5'),
(@q_id, 'B', '585.0'),
(@q_id, 'C', '292.5'),
(@q_id, 'D', '287.5');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 10% of 311?', 'easy', 'C', '10% of 311 = (10/100) * 311 = 31.1', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '26.1'),
(@q_id, 'B', '62.2'),
(@q_id, 'C', '31.1'),
(@q_id, 'D', '41.1');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 20% of 303?', 'easy', 'B', '20% of 303 = (20/100) * 303 = 60.6', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '121.2'),
(@q_id, 'B', '60.6'),
(@q_id, 'C', '70.6'),
(@q_id, 'D', '55.6');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 25% of 277?', 'easy', 'C', '25% of 277 = (25/100) * 277 = 69.25', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '138.5'),
(@q_id, 'B', '79.25'),
(@q_id, 'C', '69.25'),
(@q_id, 'D', '64.25');

-- Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 2, 'Calculation', 'What is 75% of 169?', 'easy', 'D', '75% of 169 = (75/100) * 169 = 126.75', 'Percentage formula: (P / 100) * N');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '253.5'),
(@q_id, 'B', '136.75'),
(@q_id, 'C', '121.75'),
(@q_id, 'D', '126.75');

-- Topic: Time & Work (ID: 3, Section: 1)

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 58 hours and Machine B takes 116 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '38.67'),
(@q_id, 'B', '37.67'),
(@q_id, 'C', '40.67'),
(@q_id, 'D', '58');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 35 hours and Machine B takes 70 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '23.33'),
(@q_id, 'B', '35'),
(@q_id, 'C', '22.33'),
(@q_id, 'D', '25.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 19 hours and Machine B takes 38 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '12.67'),
(@q_id, 'B', '11.67'),
(@q_id, 'C', '14.67'),
(@q_id, 'D', '19');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 68 hours and Machine B takes 136 hours, together they take?', 'medium', 'D', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '47.33'),
(@q_id, 'B', '44.33'),
(@q_id, 'C', '68'),
(@q_id, 'D', '45.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 80 hours and Machine B takes 160 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '52.33'),
(@q_id, 'B', '53.33'),
(@q_id, 'C', '55.33'),
(@q_id, 'D', '80');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 84 hours and Machine B takes 168 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '55.0'),
(@q_id, 'B', '58.0'),
(@q_id, 'C', '56.0'),
(@q_id, 'D', '84');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 28 hours and Machine B takes 56 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '28'),
(@q_id, 'B', '18.67'),
(@q_id, 'C', '17.67'),
(@q_id, 'D', '20.67');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 21 hours and Machine B takes 42 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '13.0'),
(@q_id, 'B', '21'),
(@q_id, 'C', '14.0'),
(@q_id, 'D', '16.0');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 93 hours and Machine B takes 186 hours, together they take?', 'medium', 'D', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '93'),
(@q_id, 'B', '61.0'),
(@q_id, 'C', '64.0'),
(@q_id, 'D', '62.0');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 3, 'Work Calculation', 'If Machine A takes 13 hours and Machine B takes 26 hours, together they take?', 'medium', 'D', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '7.67'),
(@q_id, 'B', '13'),
(@q_id, 'C', '10.67'),
(@q_id, 'D', '8.67');

-- Topic: Time, Speed & Distance (ID: 4, Section: 1)

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 19 hours and Machine B takes 38 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '12.67'),
(@q_id, 'B', '19'),
(@q_id, 'C', '11.67'),
(@q_id, 'D', '14.67');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 94 hours and Machine B takes 188 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '64.67'),
(@q_id, 'B', '62.67'),
(@q_id, 'C', '61.67'),
(@q_id, 'D', '94');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 64 hours and Machine B takes 128 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '41.67'),
(@q_id, 'B', '44.67'),
(@q_id, 'C', '42.67'),
(@q_id, 'D', '64');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 40 hours and Machine B takes 80 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '25.67'),
(@q_id, 'B', '28.67'),
(@q_id, 'C', '26.67'),
(@q_id, 'D', '40');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 95 hours and Machine B takes 190 hours, together they take?', 'medium', 'D', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '95'),
(@q_id, 'B', '62.33'),
(@q_id, 'C', '65.33'),
(@q_id, 'D', '63.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 28 hours and Machine B takes 56 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '17.67'),
(@q_id, 'B', '28'),
(@q_id, 'C', '18.67'),
(@q_id, 'D', '20.67');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 95 hours and Machine B takes 190 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '62.33'),
(@q_id, 'B', '63.33'),
(@q_id, 'C', '65.33'),
(@q_id, 'D', '95');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 26 hours and Machine B takes 52 hours, together they take?', 'medium', 'D', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '16.33'),
(@q_id, 'B', '19.33'),
(@q_id, 'C', '26'),
(@q_id, 'D', '17.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 99 hours and Machine B takes 198 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '99'),
(@q_id, 'B', '66.0'),
(@q_id, 'C', '65.0'),
(@q_id, 'D', '68.0');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 4, 'Work Calculation', 'If Machine A takes 26 hours and Machine B takes 52 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '16.33'),
(@q_id, 'B', '19.33'),
(@q_id, 'C', '17.33'),
(@q_id, 'D', '26');

-- Topic: Profit and Loss (ID: 10, Section: 1)

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 115 and SP is 154, what is the profit?', 'easy', 'B', 'Profit = SP - CP = 154 - 115 = 39', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '34'),
(@q_id, 'B', '39'),
(@q_id, 'C', '78'),
(@q_id, 'D', '49');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 168 and SP is 200, what is the profit?', 'easy', 'D', 'Profit = SP - CP = 200 - 168 = 32', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '64'),
(@q_id, 'B', '27'),
(@q_id, 'C', '42'),
(@q_id, 'D', '32');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 266 and SP is 286, what is the profit?', 'easy', 'C', 'Profit = SP - CP = 286 - 266 = 20', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '30'),
(@q_id, 'B', '40'),
(@q_id, 'C', '20'),
(@q_id, 'D', '15');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 361 and SP is 389, what is the profit?', 'easy', 'A', 'Profit = SP - CP = 389 - 361 = 28', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '28'),
(@q_id, 'B', '38'),
(@q_id, 'C', '56'),
(@q_id, 'D', '23');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 213 and SP is 252, what is the profit?', 'easy', 'A', 'Profit = SP - CP = 252 - 213 = 39', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '39'),
(@q_id, 'B', '34'),
(@q_id, 'C', '49'),
(@q_id, 'D', '78');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 114 and SP is 134, what is the profit?', 'easy', 'C', 'Profit = SP - CP = 134 - 114 = 20', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '40'),
(@q_id, 'B', '15'),
(@q_id, 'C', '20'),
(@q_id, 'D', '30');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 101 and SP is 142, what is the profit?', 'easy', 'D', 'Profit = SP - CP = 142 - 101 = 41', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '82'),
(@q_id, 'B', '36'),
(@q_id, 'C', '51'),
(@q_id, 'D', '41');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 307 and SP is 339, what is the profit?', 'easy', 'D', 'Profit = SP - CP = 339 - 307 = 32', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '42'),
(@q_id, 'B', '64'),
(@q_id, 'C', '27'),
(@q_id, 'D', '32');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 288 and SP is 319, what is the profit?', 'easy', 'D', 'Profit = SP - CP = 319 - 288 = 31', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '41'),
(@q_id, 'B', '26'),
(@q_id, 'C', '62'),
(@q_id, 'D', '31');

-- Profit Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 10, 'Profit Calculation', 'If CP is 480 and SP is 491, what is the profit?', 'easy', 'A', 'Profit = SP - CP = 491 - 480 = 11', 'Basic profit definition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '11'),
(@q_id, 'B', '21'),
(@q_id, 'C', '6'),
(@q_id, 'D', '22');

-- Topic: Time and Work (ID: 11, Section: 1)

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 64 hours and Machine B takes 128 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '42.67'),
(@q_id, 'B', '41.67'),
(@q_id, 'C', '64'),
(@q_id, 'D', '44.67');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 17 hours and Machine B takes 34 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '10.33'),
(@q_id, 'B', '17'),
(@q_id, 'C', '11.33'),
(@q_id, 'D', '13.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 37 hours and Machine B takes 74 hours, together they take?', 'medium', 'C', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '26.67'),
(@q_id, 'B', '37'),
(@q_id, 'C', '24.67'),
(@q_id, 'D', '23.67');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 44 hours and Machine B takes 88 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '44'),
(@q_id, 'B', '29.33'),
(@q_id, 'C', '31.33'),
(@q_id, 'D', '28.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 69 hours and Machine B takes 138 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '48.0'),
(@q_id, 'B', '46.0'),
(@q_id, 'C', '45.0'),
(@q_id, 'D', '69');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 93 hours and Machine B takes 186 hours, together they take?', 'medium', 'D', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '61.0'),
(@q_id, 'B', '93'),
(@q_id, 'C', '64.0'),
(@q_id, 'D', '62.0');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 44 hours and Machine B takes 88 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '29.33'),
(@q_id, 'B', '28.33'),
(@q_id, 'C', '44'),
(@q_id, 'D', '31.33');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 14 hours and Machine B takes 28 hours, together they take?', 'medium', 'A', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '9.33'),
(@q_id, 'B', '11.33'),
(@q_id, 'C', '8.33'),
(@q_id, 'D', '14');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 70 hours and Machine B takes 140 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '48.67'),
(@q_id, 'B', '46.67'),
(@q_id, 'C', '70'),
(@q_id, 'D', '45.67');

-- Work Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (1, 11, 'Work Calculation', 'If Machine A takes 33 hours and Machine B takes 66 hours, together they take?', 'medium', 'B', 'Formula: (A*B)/(A+B)', 'Work equivalence.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '21.0'),
(@q_id, 'B', '22.0'),
(@q_id, 'C', '24.0'),
(@q_id, 'D', '33');

-- Topic: Number Series (ID: 5, Section: 2)

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 10, 14, 18, 22, ?', 'easy', 'B', 'AP with diff 4. Next: 22 + 4 = 26.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '25'),
(@q_id, 'B', '26'),
(@q_id, 'C', '27'),
(@q_id, 'D', '28');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 3, 6, 9, 12, ?', 'easy', 'B', 'AP with diff 3. Next: 12 + 3 = 15.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '17'),
(@q_id, 'B', '15'),
(@q_id, 'C', '16'),
(@q_id, 'D', '14');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 3, 6, 9, 12, ?', 'easy', 'A', 'AP with diff 3. Next: 12 + 3 = 15.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '15'),
(@q_id, 'B', '14'),
(@q_id, 'C', '17'),
(@q_id, 'D', '16');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 9, 14, 19, 24, ?', 'easy', 'D', 'AP with diff 5. Next: 24 + 5 = 29.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '30'),
(@q_id, 'B', '31'),
(@q_id, 'C', '28'),
(@q_id, 'D', '29');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 1, 6, 11, 16, ?', 'easy', 'B', 'AP with diff 5. Next: 16 + 5 = 21.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '23'),
(@q_id, 'B', '21'),
(@q_id, 'C', '20'),
(@q_id, 'D', '22');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 8, 11, 14, 17, ?', 'easy', 'D', 'AP with diff 3. Next: 17 + 3 = 20.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '21'),
(@q_id, 'B', '19'),
(@q_id, 'C', '22'),
(@q_id, 'D', '20');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 9, 14, 19, 24, ?', 'easy', 'C', 'AP with diff 5. Next: 24 + 5 = 29.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '31'),
(@q_id, 'B', '30'),
(@q_id, 'C', '29'),
(@q_id, 'D', '28');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 1, 5, 9, 13, ?', 'easy', 'B', 'AP with diff 4. Next: 13 + 4 = 17.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '18'),
(@q_id, 'B', '17'),
(@q_id, 'C', '16'),
(@q_id, 'D', '19');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 1, 6, 11, 16, ?', 'easy', 'B', 'AP with diff 5. Next: 16 + 5 = 21.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '23'),
(@q_id, 'B', '21'),
(@q_id, 'C', '22'),
(@q_id, 'D', '20');

-- Number Series
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 5, 'Number Series', 'Find the next number: 6, 8, 10, 12, ?', 'easy', 'B', 'AP with diff 2. Next: 12 + 2 = 14.', 'Pattern recognition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '15'),
(@q_id, 'B', '14'),
(@q_id, 'C', '16'),
(@q_id, 'D', '13');

-- Topic: Blood Relations (ID: 6, Section: 2)

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Relations
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 6, 'Relations', 'Pointing to a man, a woman said ''His mother is the only daughter of my mother''. How is the woman related to the man?', 'medium', 'A', 'The woman is the mother of the man.', 'Breakdown: Only daughter of my mother = Myself.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Mother'),
(@q_id, 'B', 'Aunt'),
(@q_id, 'C', 'Sister'),
(@q_id, 'D', 'Grandmother');

-- Topic: Direction Sense (ID: 7, Section: 2)

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Theory', 'Which of the following describes the core concept of ''Direction Sense''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Conceptual', 'In a problem involving ''Direction Sense'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Conceptual', 'In a problem involving ''Direction Sense'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Conceptual', 'In a problem involving ''Direction Sense'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Theory', 'Which of the following describes the core concept of ''Direction Sense''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Conceptual', 'In a problem involving ''Direction Sense'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Theory', 'Which of the following describes the core concept of ''Direction Sense''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Theory', 'Which of the following describes the core concept of ''Direction Sense''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Theory', 'Which of the following describes the core concept of ''Direction Sense''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 7, 'Theory', 'Which of the following describes the core concept of ''Direction Sense''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Topic: Seating Arrangement (ID: 12, Section: 2)

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Theory', 'Which of the following describes the core concept of ''Seating Arrangement''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Theory', 'Which of the following describes the core concept of ''Seating Arrangement''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Theory
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Theory', 'Which of the following describes the core concept of ''Seating Arrangement''?', 'medium', 'A', 'Concept A is the fundamental definition.', 'Theoretical understanding.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Concept A'),
(@q_id, 'B', 'Concept B'),
(@q_id, 'C', 'Concept C'),
(@q_id, 'D', 'None of the above');

-- Conceptual
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (2, 12, 'Conceptual', 'In a problem involving ''Seating Arrangement'', if the primary variable increases, the result usually:', 'medium', 'A', 'Direct proportionality assumption.', 'Linear relationship.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Increases'),
(@q_id, 'B', 'Decreases'),
(@q_id, 'C', 'Remains Constant'),
(@q_id, 'D', 'Varies');

-- Topic: Bar Graphs (ID: 8, Section: 3)

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 160 and Group B has 194. What is the total?', 'easy', 'A', 'Total = 160 + 194 = 354', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '354'),
(@q_id, 'B', '404'),
(@q_id, 'C', '364'),
(@q_id, 'D', '344');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 188 and Group B has 227. What is the total?', 'easy', 'A', 'Total = 188 + 227 = 415', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '415'),
(@q_id, 'B', '405'),
(@q_id, 'C', '425'),
(@q_id, 'D', '465');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 175 and Group B has 195. What is the total?', 'easy', 'D', 'Total = 175 + 195 = 370', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '380'),
(@q_id, 'B', '360'),
(@q_id, 'C', '420'),
(@q_id, 'D', '370');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 150 and Group B has 189. What is the total?', 'easy', 'D', 'Total = 150 + 189 = 339', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '349'),
(@q_id, 'B', '389'),
(@q_id, 'C', '329'),
(@q_id, 'D', '339');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 169 and Group B has 207. What is the total?', 'easy', 'D', 'Total = 169 + 207 = 376', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '366'),
(@q_id, 'B', '386'),
(@q_id, 'C', '426'),
(@q_id, 'D', '376');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 147 and Group B has 184. What is the total?', 'easy', 'A', 'Total = 147 + 184 = 331', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '331'),
(@q_id, 'B', '341'),
(@q_id, 'C', '381'),
(@q_id, 'D', '321');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 192 and Group B has 230. What is the total?', 'easy', 'A', 'Total = 192 + 230 = 422', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '422'),
(@q_id, 'B', '472'),
(@q_id, 'C', '412'),
(@q_id, 'D', '432');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 154 and Group B has 177. What is the total?', 'easy', 'C', 'Total = 154 + 177 = 331', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '341'),
(@q_id, 'B', '381'),
(@q_id, 'C', '331'),
(@q_id, 'D', '321');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 106 and Group B has 149. What is the total?', 'easy', 'D', 'Total = 106 + 149 = 255', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '265'),
(@q_id, 'B', '305'),
(@q_id, 'C', '245'),
(@q_id, 'D', '255');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 8, 'Data Interpretation', 'In a Bar Graphs representation, Group A has 105 and Group B has 141. What is the total?', 'easy', 'A', 'Total = 105 + 141 = 246', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '246'),
(@q_id, 'B', '256'),
(@q_id, 'C', '236'),
(@q_id, 'D', '296');

-- Topic: Pie Charts (ID: 9, Section: 3)

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 120 and Group B has 163. What is the total?', 'easy', 'C', 'Total = 120 + 163 = 283', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '333'),
(@q_id, 'B', '273'),
(@q_id, 'C', '283'),
(@q_id, 'D', '293');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 133 and Group B has 182. What is the total?', 'easy', 'B', 'Total = 133 + 182 = 315', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '325'),
(@q_id, 'B', '315'),
(@q_id, 'C', '305'),
(@q_id, 'D', '365');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 140 and Group B has 172. What is the total?', 'easy', 'C', 'Total = 140 + 172 = 312', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '362'),
(@q_id, 'B', '302'),
(@q_id, 'C', '312'),
(@q_id, 'D', '322');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 167 and Group B has 206. What is the total?', 'easy', 'A', 'Total = 167 + 206 = 373', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '373'),
(@q_id, 'B', '363'),
(@q_id, 'C', '423'),
(@q_id, 'D', '383');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 164 and Group B has 204. What is the total?', 'easy', 'A', 'Total = 164 + 204 = 368', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '368'),
(@q_id, 'B', '378'),
(@q_id, 'C', '358'),
(@q_id, 'D', '418');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 180 and Group B has 212. What is the total?', 'easy', 'C', 'Total = 180 + 212 = 392', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '442'),
(@q_id, 'B', '402'),
(@q_id, 'C', '392'),
(@q_id, 'D', '382');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 172 and Group B has 220. What is the total?', 'easy', 'D', 'Total = 172 + 220 = 392', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '402'),
(@q_id, 'B', '442'),
(@q_id, 'C', '382'),
(@q_id, 'D', '392');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 155 and Group B has 179. What is the total?', 'easy', 'A', 'Total = 155 + 179 = 334', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '334'),
(@q_id, 'B', '344'),
(@q_id, 'C', '324'),
(@q_id, 'D', '384');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 117 and Group B has 158. What is the total?', 'easy', 'B', 'Total = 117 + 158 = 275', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '265'),
(@q_id, 'B', '275'),
(@q_id, 'C', '285'),
(@q_id, 'D', '325');

-- Data Interpretation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES (3, 9, 'Data Interpretation', 'In a Pie Charts representation, Group A has 185 and Group B has 221. What is the total?', 'easy', 'A', 'Total = 185 + 221 = 406', 'Data addition.');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '406'),
(@q_id, 'B', '396'),
(@q_id, 'C', '416'),
(@q_id, 'D', '456');
