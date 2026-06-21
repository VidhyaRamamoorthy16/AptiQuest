SET FOREIGN_KEY_CHECKS = 0;
TRUNCATE TABLE test_attempt_answers;
TRUNCATE TABLE test_attempts;
TRUNCATE TABLE user_attempts;
TRUNCATE TABLE question_options;
TRUNCATE TABLE questions;
TRUNCATE TABLE topics;
SET FOREIGN_KEY_CHECKS = 1;

INSERT INTO topics (id, section_id, name, description) VALUES (1, 1, 'Percentages', 'Percentage calculations and applications');
INSERT INTO topics (id, section_id, name, description) VALUES (2, 1, 'Profit & Loss', 'Business math and trade calculations');
INSERT INTO topics (id, section_id, name, description) VALUES (3, 1, 'Time & Work', 'Work rate problems');
INSERT INTO topics (id, section_id, name, description) VALUES (4, 1, 'Time, Speed & Distance', 'Motion and travel problems');
INSERT INTO topics (id, section_id, name, description) VALUES (5, 1, 'Simple & Compound Interest', 'Interest calculations');
INSERT INTO topics (id, section_id, name, description) VALUES (6, 1, 'Ratio & Proportion', 'Comparative quantities');
INSERT INTO topics (id, section_id, name, description) VALUES (7, 1, 'Number System', 'Divisibility, factors, HCF, LCM');
INSERT INTO topics (id, section_id, name, description) VALUES (8, 1, 'Averages', 'Mean, weighted average');
INSERT INTO topics (id, section_id, name, description) VALUES (9, 1, 'Mixtures & Alligations', 'Mixing problems');
INSERT INTO topics (id, section_id, name, description) VALUES (10, 1, 'Permutation & Combination', 'Counting methods');
INSERT INTO topics (id, section_id, name, description) VALUES (11, 1, 'Probability', 'Chance and likelihood');
INSERT INTO topics (id, section_id, name, description) VALUES (12, 1, 'Geometry & Mensuration', 'Shapes, areas, volumes');
INSERT INTO topics (id, section_id, name, description) VALUES (13, 2, 'Blood Relations', 'Family relationship puzzles');
INSERT INTO topics (id, section_id, name, description) VALUES (14, 2, 'Seating Arrangement', 'Linear and circular arrangements');
INSERT INTO topics (id, section_id, name, description) VALUES (15, 2, 'Syllogisms', 'Logical deduction from statements');
INSERT INTO topics (id, section_id, name, description) VALUES (16, 2, 'Coding-Decoding', 'Pattern-based encoding');
INSERT INTO topics (id, section_id, name, description) VALUES (17, 2, 'Direction Sense', 'Navigation and direction problems');
INSERT INTO topics (id, section_id, name, description) VALUES (18, 2, 'Number Series', 'Finding missing numbers in patterns');
INSERT INTO topics (id, section_id, name, description) VALUES (19, 2, 'Analogies', 'Relationship-based reasoning');
INSERT INTO topics (id, section_id, name, description) VALUES (20, 2, 'Puzzles', 'Multi-constraint logical puzzles');
INSERT INTO topics (id, section_id, name, description) VALUES (21, 2, 'Clocks & Calendars', 'Time and date reasoning');
INSERT INTO topics (id, section_id, name, description) VALUES (22, 2, 'Input-Output', 'Machine-based transformation');
INSERT INTO topics (id, section_id, name, description) VALUES (23, 3, 'Bar Charts', 'Reading and analyzing bar graphs');
INSERT INTO topics (id, section_id, name, description) VALUES (24, 3, 'Line Graphs', 'Trend analysis from line charts');
INSERT INTO topics (id, section_id, name, description) VALUES (25, 3, 'Pie Charts', 'Percentage-based circular charts');
INSERT INTO topics (id, section_id, name, description) VALUES (26, 3, 'Tables', 'Tabular data analysis');
INSERT INTO topics (id, section_id, name, description) VALUES (27, 3, 'Mixed Charts', 'Combined chart types');
INSERT INTO topics (id, section_id, name, description) VALUES (28, 3, 'Caselets', 'Paragraph-based data');
INSERT INTO topics (id, section_id, name, description) VALUES (29, 4, 'Reading Comprehension', 'Passage-based questions');
INSERT INTO topics (id, section_id, name, description) VALUES (30, 4, 'Vocabulary', 'Synonyms, antonyms, one-word substitution');
INSERT INTO topics (id, section_id, name, description) VALUES (31, 4, 'Grammar', 'Error spotting, sentence correction');
INSERT INTO topics (id, section_id, name, description) VALUES (32, 4, 'Sentence Completion', 'Fill in the blanks');
INSERT INTO topics (id, section_id, name, description) VALUES (33, 4, 'Para Jumbles', 'Rearranging scrambled sentences');
INSERT INTO topics (id, section_id, name, description) VALUES (34, 4, 'Idioms & Phrases', 'Meaning and usage');

-- Topic: Percentages, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 1, 1, 'Finding percentage of a number', 'What is 4% of 220?', 'easy', 'A', '8.8', '4% of 220 = (4/100) * 220 = 8.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(1, 'A', '8.8'),
(1, 'B', '13.8'),
(1, 'C', '-1.1999999999999993'),
(1, 'D', '13.200000000000001');

-- Topic: Percentages, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(2, 1, 1, 'Finding percentage of a number', 'What is 8% of 240?', 'easy', 'A', '19.2', '8% of 240 = (8/100) * 240 = 19.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(2, 'A', '19.2'),
(2, 'B', '24.2'),
(2, 'C', '9.2'),
(2, 'D', '28.799999999999997');

-- Topic: Percentages, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(3, 1, 1, 'Finding percentage of a number', 'What is 12% of 260?', 'easy', 'A', '31.2', '12% of 260 = (12/100) * 260 = 31.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(3, 'A', '31.2'),
(3, 'B', '36.2'),
(3, 'C', '21.2'),
(3, 'D', '46.8');

-- Topic: Percentages, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(4, 1, 1, 'Finding percentage of a number', 'What is 16% of 280?', 'easy', 'A', '44.800000000000004', '16% of 280 = (16/100) * 280 = 44.800000000000004.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(4, 'A', '44.800000000000004'),
(4, 'B', '49.800000000000004'),
(4, 'C', '34.800000000000004'),
(4, 'D', '67.2');

-- Topic: Percentages, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(5, 1, 1, 'Finding percentage of a number', 'What is 20% of 300?', 'easy', 'A', '60.0', '20% of 300 = (20/100) * 300 = 60.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(5, 'A', '60.0'),
(5, 'B', '65.0'),
(5, 'C', '50.0'),
(5, 'D', '90.0');

-- Topic: Percentages, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(6, 1, 1, 'Finding percentage of a number', 'What is 24% of 320?', 'easy', 'A', '76.8', '24% of 320 = (24/100) * 320 = 76.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(6, 'A', '76.8'),
(6, 'B', '81.8'),
(6, 'C', '66.8'),
(6, 'D', '115.19999999999999');

-- Topic: Percentages, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(7, 1, 1, 'Finding percentage of a number', 'What is 28% of 340?', 'easy', 'A', '95.2', '28% of 340 = (28/100) * 340 = 95.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(7, 'A', '95.2'),
(7, 'B', '100.2'),
(7, 'C', '85.2'),
(7, 'D', '142.8');

-- Topic: Percentages, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(8, 1, 1, 'Finding percentage of a number', 'What is 32% of 360?', 'easy', 'A', '115.2', '32% of 360 = (32/100) * 360 = 115.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(8, 'A', '115.2'),
(8, 'B', '120.2'),
(8, 'C', '105.2'),
(8, 'D', '172.8');

-- Topic: Percentages, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(9, 1, 1, 'Finding percentage of a number', 'What is 36% of 380?', 'medium', 'A', '136.79999999999998', '36% of 380 = (36/100) * 380 = 136.79999999999998.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(9, 'A', '136.79999999999998'),
(9, 'B', '141.79999999999998'),
(9, 'C', '126.79999999999998'),
(9, 'D', '205.2');

-- Topic: Percentages, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(10, 1, 1, 'Finding percentage of a number', 'What is 40% of 400?', 'medium', 'A', '160.0', '40% of 400 = (40/100) * 400 = 160.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(10, 'A', '160.0'),
(10, 'B', '165.0'),
(10, 'C', '150.0'),
(10, 'D', '240.0');

-- Topic: Percentages, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(11, 1, 1, 'Finding percentage of a number', 'What is 44% of 420?', 'medium', 'A', '184.8', '44% of 420 = (44/100) * 420 = 184.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(11, 'A', '184.8'),
(11, 'B', '189.8'),
(11, 'C', '174.8'),
(11, 'D', '277.20000000000005');

-- Topic: Percentages, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(12, 1, 1, 'Finding percentage of a number', 'What is 48% of 440?', 'medium', 'A', '211.2', '48% of 440 = (48/100) * 440 = 211.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(12, 'A', '211.2'),
(12, 'B', '216.2'),
(12, 'C', '201.2'),
(12, 'D', '316.79999999999995');

-- Topic: Percentages, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(13, 1, 1, 'Finding percentage of a number', 'What is 52% of 460?', 'medium', 'A', '239.20000000000002', '52% of 460 = (52/100) * 460 = 239.20000000000002.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(13, 'A', '239.20000000000002'),
(13, 'B', '244.20000000000002'),
(13, 'C', '229.20000000000002'),
(13, 'D', '358.8');

-- Topic: Percentages, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(14, 1, 1, 'Finding percentage of a number', 'What is 56% of 480?', 'medium', 'A', '268.8', '56% of 480 = (56/100) * 480 = 268.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(14, 'A', '268.8'),
(14, 'B', '273.8'),
(14, 'C', '258.8'),
(14, 'D', '403.20000000000005');

-- Topic: Percentages, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(15, 1, 1, 'Finding percentage of a number', 'What is 60% of 500?', 'medium', 'A', '300.0', '60% of 500 = (60/100) * 500 = 300.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(15, 'A', '300.0'),
(15, 'B', '305.0'),
(15, 'C', '290.0'),
(15, 'D', '450.0');

-- Topic: Percentages, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(16, 1, 1, 'Finding percentage of a number', 'What is 64% of 520?', 'medium', 'A', '332.8', '64% of 520 = (64/100) * 520 = 332.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(16, 'A', '332.8'),
(16, 'B', '337.8'),
(16, 'C', '322.8'),
(16, 'D', '499.20000000000005');

-- Topic: Percentages, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(17, 1, 1, 'Finding percentage of a number', 'What is 68% of 540?', 'medium', 'A', '367.20000000000005', '68% of 540 = (68/100) * 540 = 367.20000000000005.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(17, 'A', '367.20000000000005'),
(17, 'B', '372.20000000000005'),
(17, 'C', '357.20000000000005'),
(17, 'D', '550.8000000000001');

-- Topic: Percentages, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(18, 1, 1, 'Finding percentage of a number', 'What is 72% of 560?', 'medium', 'A', '403.2', '72% of 560 = (72/100) * 560 = 403.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(18, 'A', '403.2'),
(18, 'B', '408.2'),
(18, 'C', '393.2'),
(18, 'D', '604.8');

-- Topic: Percentages, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(19, 1, 1, 'Finding percentage of a number', 'What is 76% of 580?', 'hard', 'A', '440.8', '76% of 580 = (76/100) * 580 = 440.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(19, 'A', '440.8'),
(19, 'B', '445.8'),
(19, 'C', '430.8'),
(19, 'D', '661.2');

-- Topic: Percentages, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(20, 1, 1, 'Finding percentage of a number', 'What is 80% of 600?', 'hard', 'A', '480.0', '80% of 600 = (80/100) * 600 = 480.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(20, 'A', '480.0'),
(20, 'B', '485.0'),
(20, 'C', '470.0'),
(20, 'D', '720.0');

-- Topic: Percentages, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(21, 1, 1, 'Finding percentage of a number', 'What is 84% of 620?', 'hard', 'A', '520.8', '84% of 620 = (84/100) * 620 = 520.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(21, 'A', '520.8'),
(21, 'B', '525.8'),
(21, 'C', '510.79999999999995'),
(21, 'D', '781.1999999999999');

-- Topic: Percentages, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(22, 1, 1, 'Finding percentage of a number', 'What is 88% of 640?', 'hard', 'A', '563.2', '88% of 640 = (88/100) * 640 = 563.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(22, 'A', '563.2'),
(22, 'B', '568.2'),
(22, 'C', '553.2'),
(22, 'D', '844.8000000000001');

-- Topic: Percentages, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(23, 1, 1, 'Finding percentage of a number', 'What is 92% of 660?', 'hard', 'A', '607.2', '92% of 660 = (92/100) * 660 = 607.2.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(23, 'A', '607.2'),
(23, 'B', '612.2'),
(23, 'C', '597.2'),
(23, 'D', '910.8000000000001');

-- Topic: Percentages, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(24, 1, 1, 'Finding percentage of a number', 'What is 96% of 680?', 'hard', 'A', '652.8', '96% of 680 = (96/100) * 680 = 652.8.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(24, 'A', '652.8'),
(24, 'B', '657.8'),
(24, 'C', '642.8'),
(24, 'D', '979.1999999999999');

-- Topic: Percentages, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(25, 1, 1, 'Finding percentage of a number', 'What is 100% of 700?', 'hard', 'A', '700.0', '100% of 700 = (100/100) * 700 = 700.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(25, 'A', '700.0'),
(25, 'B', '705.0'),
(25, 'C', '690.0'),
(25, 'D', '1050.0');

-- Topic: Profit & Loss, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(26, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹315 and sold at a profit of 10%. Find the selling price.', 'easy', 'B', '₹346.5', 'SP = CP * (100 + Profit%)/100 = 315 * 110/100 = ₹346.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(26, 'A', '₹366.5'),
(26, 'B', '₹346.5'),
(26, 'C', '₹336.5'),
(26, 'D', '₹320');

-- Topic: Profit & Loss, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(27, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹330 and sold at a profit of 15%. Find the selling price.', 'easy', 'B', '₹379.49999999999994', 'SP = CP * (100 + Profit%)/100 = 330 * 115/100 = ₹379.49999999999994.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(27, 'A', '₹399.49999999999994'),
(27, 'B', '₹379.49999999999994'),
(27, 'C', '₹369.49999999999994'),
(27, 'D', '₹335');

-- Topic: Profit & Loss, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(28, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹345 and sold at a profit of 20%. Find the selling price.', 'easy', 'B', '₹414.0', 'SP = CP * (100 + Profit%)/100 = 345 * 120/100 = ₹414.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(28, 'A', '₹434.0'),
(28, 'B', '₹414.0'),
(28, 'C', '₹404.0'),
(28, 'D', '₹350');

-- Topic: Profit & Loss, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(29, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹360 and sold at a profit of 25%. Find the selling price.', 'easy', 'B', '₹450.0', 'SP = CP * (100 + Profit%)/100 = 360 * 125/100 = ₹450.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(29, 'A', '₹470.0'),
(29, 'B', '₹450.0'),
(29, 'C', '₹440.0'),
(29, 'D', '₹365');

-- Topic: Profit & Loss, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(30, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹375 and sold at a profit of 5%. Find the selling price.', 'easy', 'B', '₹393.75', 'SP = CP * (100 + Profit%)/100 = 375 * 105/100 = ₹393.75.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(30, 'A', '₹413.75'),
(30, 'B', '₹393.75'),
(30, 'C', '₹383.75'),
(30, 'D', '₹380');

-- Topic: Profit & Loss, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(31, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹390 and sold at a profit of 10%. Find the selling price.', 'easy', 'B', '₹429.00000000000006', 'SP = CP * (100 + Profit%)/100 = 390 * 110/100 = ₹429.00000000000006.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(31, 'A', '₹449.00000000000006'),
(31, 'B', '₹429.00000000000006'),
(31, 'C', '₹419.00000000000006'),
(31, 'D', '₹395');

-- Topic: Profit & Loss, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(32, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹405 and sold at a profit of 15%. Find the selling price.', 'easy', 'B', '₹465.74999999999994', 'SP = CP * (100 + Profit%)/100 = 405 * 115/100 = ₹465.74999999999994.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(32, 'A', '₹485.74999999999994'),
(32, 'B', '₹465.74999999999994'),
(32, 'C', '₹455.74999999999994'),
(32, 'D', '₹410');

-- Topic: Profit & Loss, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(33, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹420 and sold at a profit of 20%. Find the selling price.', 'easy', 'B', '₹504.0', 'SP = CP * (100 + Profit%)/100 = 420 * 120/100 = ₹504.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(33, 'A', '₹524.0'),
(33, 'B', '₹504.0'),
(33, 'C', '₹494.0'),
(33, 'D', '₹425');

-- Topic: Profit & Loss, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(34, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹435 and sold at a profit of 25%. Find the selling price.', 'medium', 'B', '₹543.75', 'SP = CP * (100 + Profit%)/100 = 435 * 125/100 = ₹543.75.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(34, 'A', '₹563.75'),
(34, 'B', '₹543.75'),
(34, 'C', '₹533.75'),
(34, 'D', '₹440');

-- Topic: Profit & Loss, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(35, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹450 and sold at a profit of 5%. Find the selling price.', 'medium', 'B', '₹472.5', 'SP = CP * (100 + Profit%)/100 = 450 * 105/100 = ₹472.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(35, 'A', '₹492.5'),
(35, 'B', '₹472.5'),
(35, 'C', '₹462.5'),
(35, 'D', '₹455');

-- Topic: Profit & Loss, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(36, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹465 and sold at a profit of 10%. Find the selling price.', 'medium', 'B', '₹511.50000000000006', 'SP = CP * (100 + Profit%)/100 = 465 * 110/100 = ₹511.50000000000006.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(36, 'A', '₹531.5'),
(36, 'B', '₹511.50000000000006'),
(36, 'C', '₹501.50000000000006'),
(36, 'D', '₹470');

-- Topic: Profit & Loss, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(37, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹480 and sold at a profit of 15%. Find the selling price.', 'medium', 'B', '₹552.0', 'SP = CP * (100 + Profit%)/100 = 480 * 115/100 = ₹552.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(37, 'A', '₹572.0'),
(37, 'B', '₹552.0'),
(37, 'C', '₹542.0'),
(37, 'D', '₹485');

-- Topic: Profit & Loss, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(38, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹495 and sold at a profit of 20%. Find the selling price.', 'medium', 'B', '₹594.0', 'SP = CP * (100 + Profit%)/100 = 495 * 120/100 = ₹594.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(38, 'A', '₹614.0'),
(38, 'B', '₹594.0'),
(38, 'C', '₹584.0'),
(38, 'D', '₹500');

-- Topic: Profit & Loss, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(39, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹510 and sold at a profit of 25%. Find the selling price.', 'medium', 'B', '₹637.5', 'SP = CP * (100 + Profit%)/100 = 510 * 125/100 = ₹637.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(39, 'A', '₹657.5'),
(39, 'B', '₹637.5'),
(39, 'C', '₹627.5'),
(39, 'D', '₹515');

-- Topic: Profit & Loss, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(40, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹525 and sold at a profit of 5%. Find the selling price.', 'medium', 'B', '₹551.25', 'SP = CP * (100 + Profit%)/100 = 525 * 105/100 = ₹551.25.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(40, 'A', '₹571.25'),
(40, 'B', '₹551.25'),
(40, 'C', '₹541.25'),
(40, 'D', '₹530');

-- Topic: Profit & Loss, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(41, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹540 and sold at a profit of 10%. Find the selling price.', 'medium', 'B', '₹594.0', 'SP = CP * (100 + Profit%)/100 = 540 * 110/100 = ₹594.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(41, 'A', '₹614.0'),
(41, 'B', '₹594.0'),
(41, 'C', '₹584.0'),
(41, 'D', '₹545');

-- Topic: Profit & Loss, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(42, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹555 and sold at a profit of 15%. Find the selling price.', 'medium', 'B', '₹638.25', 'SP = CP * (100 + Profit%)/100 = 555 * 115/100 = ₹638.25.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(42, 'A', '₹658.25'),
(42, 'B', '₹638.25'),
(42, 'C', '₹628.25'),
(42, 'D', '₹560');

-- Topic: Profit & Loss, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(43, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹570 and sold at a profit of 20%. Find the selling price.', 'medium', 'B', '₹684.0', 'SP = CP * (100 + Profit%)/100 = 570 * 120/100 = ₹684.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(43, 'A', '₹704.0'),
(43, 'B', '₹684.0'),
(43, 'C', '₹674.0'),
(43, 'D', '₹575');

-- Topic: Profit & Loss, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(44, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹585 and sold at a profit of 25%. Find the selling price.', 'hard', 'B', '₹731.25', 'SP = CP * (100 + Profit%)/100 = 585 * 125/100 = ₹731.25.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(44, 'A', '₹751.25'),
(44, 'B', '₹731.25'),
(44, 'C', '₹721.25'),
(44, 'D', '₹590');

-- Topic: Profit & Loss, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(45, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹600 and sold at a profit of 5%. Find the selling price.', 'hard', 'B', '₹630.0', 'SP = CP * (100 + Profit%)/100 = 600 * 105/100 = ₹630.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(45, 'A', '₹650.0'),
(45, 'B', '₹630.0'),
(45, 'C', '₹620.0'),
(45, 'D', '₹605');

-- Topic: Profit & Loss, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(46, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹615 and sold at a profit of 10%. Find the selling price.', 'hard', 'B', '₹676.5', 'SP = CP * (100 + Profit%)/100 = 615 * 110/100 = ₹676.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(46, 'A', '₹696.5'),
(46, 'B', '₹676.5'),
(46, 'C', '₹666.5'),
(46, 'D', '₹620');

-- Topic: Profit & Loss, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(47, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹630 and sold at a profit of 15%. Find the selling price.', 'hard', 'B', '₹724.5', 'SP = CP * (100 + Profit%)/100 = 630 * 115/100 = ₹724.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(47, 'A', '₹744.5'),
(47, 'B', '₹724.5'),
(47, 'C', '₹714.5'),
(47, 'D', '₹635');

-- Topic: Profit & Loss, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(48, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹645 and sold at a profit of 20%. Find the selling price.', 'hard', 'B', '₹774.0', 'SP = CP * (100 + Profit%)/100 = 645 * 120/100 = ₹774.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(48, 'A', '₹794.0'),
(48, 'B', '₹774.0'),
(48, 'C', '₹764.0'),
(48, 'D', '₹650');

-- Topic: Profit & Loss, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(49, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹660 and sold at a profit of 25%. Find the selling price.', 'hard', 'B', '₹825.0', 'SP = CP * (100 + Profit%)/100 = 660 * 125/100 = ₹825.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(49, 'A', '₹845.0'),
(49, 'B', '₹825.0'),
(49, 'C', '₹815.0'),
(49, 'D', '₹665');

-- Topic: Profit & Loss, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(50, 1, 2, 'Selling Price Calculation', 'An article is purchased for ₹675 and sold at a profit of 5%. Find the selling price.', 'hard', 'B', '₹708.75', 'SP = CP * (100 + Profit%)/100 = 675 * 105/100 = ₹708.75.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(50, 'A', '₹728.75'),
(50, 'B', '₹708.75'),
(50, 'C', '₹698.75'),
(50, 'D', '₹680');

-- Topic: Time & Work, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(51, 1, 3, 'Joint Work Rates', 'A can complete a task in 12 days, and B can complete the same task in 18 days. How many days will they take to complete it working together?', 'easy', 'A', '7.20 days', 'Combined time = (A * B) / (A + B) = (12 * 18) / (12 + 18) = 7.20 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(51, 'A', '7.20 days'),
(51, 'B', '8.20 days'),
(51, 'C', '6.70 days'),
(51, 'D', '30 days');

-- Topic: Time & Work, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(52, 1, 3, 'Joint Work Rates', 'A can complete a task in 14 days, and B can complete the same task in 21 days. How many days will they take to complete it working together?', 'easy', 'A', '8.40 days', 'Combined time = (A * B) / (A + B) = (14 * 21) / (14 + 21) = 8.40 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(52, 'A', '8.40 days'),
(52, 'B', '9.40 days'),
(52, 'C', '7.90 days'),
(52, 'D', '35 days');

-- Topic: Time & Work, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(53, 1, 3, 'Joint Work Rates', 'A can complete a task in 16 days, and B can complete the same task in 24 days. How many days will they take to complete it working together?', 'easy', 'A', '9.60 days', 'Combined time = (A * B) / (A + B) = (16 * 24) / (16 + 24) = 9.60 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(53, 'A', '9.60 days'),
(53, 'B', '10.60 days'),
(53, 'C', '9.10 days'),
(53, 'D', '40 days');

-- Topic: Time & Work, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(54, 1, 3, 'Joint Work Rates', 'A can complete a task in 18 days, and B can complete the same task in 27 days. How many days will they take to complete it working together?', 'easy', 'A', '10.80 days', 'Combined time = (A * B) / (A + B) = (18 * 27) / (18 + 27) = 10.80 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(54, 'A', '10.80 days'),
(54, 'B', '11.80 days'),
(54, 'C', '10.30 days'),
(54, 'D', '45 days');

-- Topic: Time & Work, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(55, 1, 3, 'Joint Work Rates', 'A can complete a task in 10 days, and B can complete the same task in 15 days. How many days will they take to complete it working together?', 'easy', 'A', '6.00 days', 'Combined time = (A * B) / (A + B) = (10 * 15) / (10 + 15) = 6.00 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(55, 'A', '6.00 days'),
(55, 'B', '7.00 days'),
(55, 'C', '5.50 days'),
(55, 'D', '25 days');

-- Topic: Time & Work, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(56, 1, 3, 'Joint Work Rates', 'A can complete a task in 12 days, and B can complete the same task in 18 days. How many days will they take to complete it working together?', 'easy', 'A', '7.20 days', 'Combined time = (A * B) / (A + B) = (12 * 18) / (12 + 18) = 7.20 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(56, 'A', '7.20 days'),
(56, 'B', '8.20 days'),
(56, 'C', '6.70 days'),
(56, 'D', '30 days');

-- Topic: Time & Work, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(57, 1, 3, 'Joint Work Rates', 'A can complete a task in 14 days, and B can complete the same task in 21 days. How many days will they take to complete it working together?', 'easy', 'A', '8.40 days', 'Combined time = (A * B) / (A + B) = (14 * 21) / (14 + 21) = 8.40 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(57, 'A', '8.40 days'),
(57, 'B', '9.40 days'),
(57, 'C', '7.90 days'),
(57, 'D', '35 days');

-- Topic: Time & Work, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(58, 1, 3, 'Joint Work Rates', 'A can complete a task in 16 days, and B can complete the same task in 24 days. How many days will they take to complete it working together?', 'easy', 'A', '9.60 days', 'Combined time = (A * B) / (A + B) = (16 * 24) / (16 + 24) = 9.60 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(58, 'A', '9.60 days'),
(58, 'B', '10.60 days'),
(58, 'C', '9.10 days'),
(58, 'D', '40 days');

-- Topic: Time & Work, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(59, 1, 3, 'Joint Work Rates', 'A can complete a task in 18 days, and B can complete the same task in 27 days. How many days will they take to complete it working together?', 'medium', 'A', '10.80 days', 'Combined time = (A * B) / (A + B) = (18 * 27) / (18 + 27) = 10.80 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(59, 'A', '10.80 days'),
(59, 'B', '11.80 days'),
(59, 'C', '10.30 days'),
(59, 'D', '45 days');

-- Topic: Time & Work, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(60, 1, 3, 'Joint Work Rates', 'A can complete a task in 10 days, and B can complete the same task in 15 days. How many days will they take to complete it working together?', 'medium', 'A', '6.00 days', 'Combined time = (A * B) / (A + B) = (10 * 15) / (10 + 15) = 6.00 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(60, 'A', '6.00 days'),
(60, 'B', '7.00 days'),
(60, 'C', '5.50 days'),
(60, 'D', '25 days');

-- Topic: Time & Work, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(61, 1, 3, 'Joint Work Rates', 'A can complete a task in 12 days, and B can complete the same task in 18 days. How many days will they take to complete it working together?', 'medium', 'A', '7.20 days', 'Combined time = (A * B) / (A + B) = (12 * 18) / (12 + 18) = 7.20 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(61, 'A', '7.20 days'),
(61, 'B', '8.20 days'),
(61, 'C', '6.70 days'),
(61, 'D', '30 days');

-- Topic: Time & Work, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(62, 1, 3, 'Joint Work Rates', 'A can complete a task in 14 days, and B can complete the same task in 21 days. How many days will they take to complete it working together?', 'medium', 'A', '8.40 days', 'Combined time = (A * B) / (A + B) = (14 * 21) / (14 + 21) = 8.40 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(62, 'A', '8.40 days'),
(62, 'B', '9.40 days'),
(62, 'C', '7.90 days'),
(62, 'D', '35 days');

-- Topic: Time & Work, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(63, 1, 3, 'Joint Work Rates', 'A can complete a task in 16 days, and B can complete the same task in 24 days. How many days will they take to complete it working together?', 'medium', 'A', '9.60 days', 'Combined time = (A * B) / (A + B) = (16 * 24) / (16 + 24) = 9.60 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(63, 'A', '9.60 days'),
(63, 'B', '10.60 days'),
(63, 'C', '9.10 days'),
(63, 'D', '40 days');

-- Topic: Time & Work, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(64, 1, 3, 'Joint Work Rates', 'A can complete a task in 18 days, and B can complete the same task in 27 days. How many days will they take to complete it working together?', 'medium', 'A', '10.80 days', 'Combined time = (A * B) / (A + B) = (18 * 27) / (18 + 27) = 10.80 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(64, 'A', '10.80 days'),
(64, 'B', '11.80 days'),
(64, 'C', '10.30 days'),
(64, 'D', '45 days');

-- Topic: Time & Work, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(65, 1, 3, 'Joint Work Rates', 'A can complete a task in 10 days, and B can complete the same task in 15 days. How many days will they take to complete it working together?', 'medium', 'A', '6.00 days', 'Combined time = (A * B) / (A + B) = (10 * 15) / (10 + 15) = 6.00 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(65, 'A', '6.00 days'),
(65, 'B', '7.00 days'),
(65, 'C', '5.50 days'),
(65, 'D', '25 days');

-- Topic: Time & Work, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(66, 1, 3, 'Joint Work Rates', 'A can complete a task in 12 days, and B can complete the same task in 18 days. How many days will they take to complete it working together?', 'medium', 'A', '7.20 days', 'Combined time = (A * B) / (A + B) = (12 * 18) / (12 + 18) = 7.20 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(66, 'A', '7.20 days'),
(66, 'B', '8.20 days'),
(66, 'C', '6.70 days'),
(66, 'D', '30 days');

-- Topic: Time & Work, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(67, 1, 3, 'Joint Work Rates', 'A can complete a task in 14 days, and B can complete the same task in 21 days. How many days will they take to complete it working together?', 'medium', 'A', '8.40 days', 'Combined time = (A * B) / (A + B) = (14 * 21) / (14 + 21) = 8.40 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(67, 'A', '8.40 days'),
(67, 'B', '9.40 days'),
(67, 'C', '7.90 days'),
(67, 'D', '35 days');

-- Topic: Time & Work, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(68, 1, 3, 'Joint Work Rates', 'A can complete a task in 16 days, and B can complete the same task in 24 days. How many days will they take to complete it working together?', 'medium', 'A', '9.60 days', 'Combined time = (A * B) / (A + B) = (16 * 24) / (16 + 24) = 9.60 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(68, 'A', '9.60 days'),
(68, 'B', '10.60 days'),
(68, 'C', '9.10 days'),
(68, 'D', '40 days');

-- Topic: Time & Work, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(69, 1, 3, 'Joint Work Rates', 'A can complete a task in 18 days, and B can complete the same task in 27 days. How many days will they take to complete it working together?', 'hard', 'A', '10.80 days', 'Combined time = (A * B) / (A + B) = (18 * 27) / (18 + 27) = 10.80 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(69, 'A', '10.80 days'),
(69, 'B', '11.80 days'),
(69, 'C', '10.30 days'),
(69, 'D', '45 days');

-- Topic: Time & Work, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(70, 1, 3, 'Joint Work Rates', 'A can complete a task in 10 days, and B can complete the same task in 15 days. How many days will they take to complete it working together?', 'hard', 'A', '6.00 days', 'Combined time = (A * B) / (A + B) = (10 * 15) / (10 + 15) = 6.00 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(70, 'A', '6.00 days'),
(70, 'B', '7.00 days'),
(70, 'C', '5.50 days'),
(70, 'D', '25 days');

-- Topic: Time & Work, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(71, 1, 3, 'Joint Work Rates', 'A can complete a task in 12 days, and B can complete the same task in 18 days. How many days will they take to complete it working together?', 'hard', 'A', '7.20 days', 'Combined time = (A * B) / (A + B) = (12 * 18) / (12 + 18) = 7.20 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(71, 'A', '7.20 days'),
(71, 'B', '8.20 days'),
(71, 'C', '6.70 days'),
(71, 'D', '30 days');

-- Topic: Time & Work, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(72, 1, 3, 'Joint Work Rates', 'A can complete a task in 14 days, and B can complete the same task in 21 days. How many days will they take to complete it working together?', 'hard', 'A', '8.40 days', 'Combined time = (A * B) / (A + B) = (14 * 21) / (14 + 21) = 8.40 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(72, 'A', '8.40 days'),
(72, 'B', '9.40 days'),
(72, 'C', '7.90 days'),
(72, 'D', '35 days');

-- Topic: Time & Work, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(73, 1, 3, 'Joint Work Rates', 'A can complete a task in 16 days, and B can complete the same task in 24 days. How many days will they take to complete it working together?', 'hard', 'A', '9.60 days', 'Combined time = (A * B) / (A + B) = (16 * 24) / (16 + 24) = 9.60 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(73, 'A', '9.60 days'),
(73, 'B', '10.60 days'),
(73, 'C', '9.10 days'),
(73, 'D', '40 days');

-- Topic: Time & Work, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(74, 1, 3, 'Joint Work Rates', 'A can complete a task in 18 days, and B can complete the same task in 27 days. How many days will they take to complete it working together?', 'hard', 'A', '10.80 days', 'Combined time = (A * B) / (A + B) = (18 * 27) / (18 + 27) = 10.80 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(74, 'A', '10.80 days'),
(74, 'B', '11.80 days'),
(74, 'C', '10.30 days'),
(74, 'D', '45 days');

-- Topic: Time & Work, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(75, 1, 3, 'Joint Work Rates', 'A can complete a task in 10 days, and B can complete the same task in 15 days. How many days will they take to complete it working together?', 'hard', 'A', '6.00 days', 'Combined time = (A * B) / (A + B) = (10 * 15) / (10 + 15) = 6.00 days.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(75, 'A', '6.00 days'),
(75, 'B', '7.00 days'),
(75, 'C', '5.50 days'),
(75, 'D', '25 days');

-- Topic: Time, Speed & Distance, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(76, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 35 km/h. How much distance will it cover in 3 hours?', 'easy', 'C', '105 km', 'Distance = Speed * Time = 35 * 3 = 105 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(76, 'A', '85 km'),
(76, 'B', '120 km'),
(76, 'C', '105 km'),
(76, 'D', '126.0 km');

-- Topic: Time, Speed & Distance, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(77, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 40 km/h. How much distance will it cover in 4 hours?', 'easy', 'C', '160 km', 'Distance = Speed * Time = 40 * 4 = 160 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(77, 'A', '140 km'),
(77, 'B', '175 km'),
(77, 'C', '160 km'),
(77, 'D', '192.0 km');

-- Topic: Time, Speed & Distance, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(78, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 45 km/h. How much distance will it cover in 2 hours?', 'easy', 'C', '90 km', 'Distance = Speed * Time = 45 * 2 = 90 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(78, 'A', '70 km'),
(78, 'B', '105 km'),
(78, 'C', '90 km'),
(78, 'D', '108.0 km');

-- Topic: Time, Speed & Distance, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(79, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 50 km/h. How much distance will it cover in 3 hours?', 'easy', 'C', '150 km', 'Distance = Speed * Time = 50 * 3 = 150 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(79, 'A', '130 km'),
(79, 'B', '165 km'),
(79, 'C', '150 km'),
(79, 'D', '180.0 km');

-- Topic: Time, Speed & Distance, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(80, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 55 km/h. How much distance will it cover in 4 hours?', 'easy', 'C', '220 km', 'Distance = Speed * Time = 55 * 4 = 220 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(80, 'A', '200 km'),
(80, 'B', '235 km'),
(80, 'C', '220 km'),
(80, 'D', '264.0 km');

-- Topic: Time, Speed & Distance, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(81, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 60 km/h. How much distance will it cover in 2 hours?', 'easy', 'C', '120 km', 'Distance = Speed * Time = 60 * 2 = 120 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(81, 'A', '100 km'),
(81, 'B', '135 km'),
(81, 'C', '120 km'),
(81, 'D', '144.0 km');

-- Topic: Time, Speed & Distance, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(82, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 65 km/h. How much distance will it cover in 3 hours?', 'easy', 'C', '195 km', 'Distance = Speed * Time = 65 * 3 = 195 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(82, 'A', '175 km'),
(82, 'B', '210 km'),
(82, 'C', '195 km'),
(82, 'D', '234.0 km');

-- Topic: Time, Speed & Distance, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(83, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 70 km/h. How much distance will it cover in 4 hours?', 'easy', 'C', '280 km', 'Distance = Speed * Time = 70 * 4 = 280 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(83, 'A', '260 km'),
(83, 'B', '295 km'),
(83, 'C', '280 km'),
(83, 'D', '336.0 km');

-- Topic: Time, Speed & Distance, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(84, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 75 km/h. How much distance will it cover in 2 hours?', 'medium', 'C', '150 km', 'Distance = Speed * Time = 75 * 2 = 150 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(84, 'A', '130 km'),
(84, 'B', '165 km'),
(84, 'C', '150 km'),
(84, 'D', '180.0 km');

-- Topic: Time, Speed & Distance, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(85, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 80 km/h. How much distance will it cover in 3 hours?', 'medium', 'C', '240 km', 'Distance = Speed * Time = 80 * 3 = 240 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(85, 'A', '220 km'),
(85, 'B', '255 km'),
(85, 'C', '240 km'),
(85, 'D', '288.0 km');

-- Topic: Time, Speed & Distance, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(86, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 85 km/h. How much distance will it cover in 4 hours?', 'medium', 'C', '340 km', 'Distance = Speed * Time = 85 * 4 = 340 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(86, 'A', '320 km'),
(86, 'B', '355 km'),
(86, 'C', '340 km'),
(86, 'D', '408.0 km');

-- Topic: Time, Speed & Distance, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(87, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 90 km/h. How much distance will it cover in 2 hours?', 'medium', 'C', '180 km', 'Distance = Speed * Time = 90 * 2 = 180 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(87, 'A', '160 km'),
(87, 'B', '195 km'),
(87, 'C', '180 km'),
(87, 'D', '216.0 km');

-- Topic: Time, Speed & Distance, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(88, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 95 km/h. How much distance will it cover in 3 hours?', 'medium', 'C', '285 km', 'Distance = Speed * Time = 95 * 3 = 285 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(88, 'A', '265 km'),
(88, 'B', '300 km'),
(88, 'C', '285 km'),
(88, 'D', '342.0 km');

-- Topic: Time, Speed & Distance, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(89, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 100 km/h. How much distance will it cover in 4 hours?', 'medium', 'C', '400 km', 'Distance = Speed * Time = 100 * 4 = 400 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(89, 'A', '380 km'),
(89, 'B', '415 km'),
(89, 'C', '400 km'),
(89, 'D', '480.0 km');

-- Topic: Time, Speed & Distance, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(90, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 105 km/h. How much distance will it cover in 2 hours?', 'medium', 'C', '210 km', 'Distance = Speed * Time = 105 * 2 = 210 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(90, 'A', '190 km'),
(90, 'B', '225 km'),
(90, 'C', '210 km'),
(90, 'D', '252.0 km');

-- Topic: Time, Speed & Distance, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(91, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 110 km/h. How much distance will it cover in 3 hours?', 'medium', 'C', '330 km', 'Distance = Speed * Time = 110 * 3 = 330 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(91, 'A', '310 km'),
(91, 'B', '345 km'),
(91, 'C', '330 km'),
(91, 'D', '396.0 km');

-- Topic: Time, Speed & Distance, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(92, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 115 km/h. How much distance will it cover in 4 hours?', 'medium', 'C', '460 km', 'Distance = Speed * Time = 115 * 4 = 460 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(92, 'A', '440 km'),
(92, 'B', '475 km'),
(92, 'C', '460 km'),
(92, 'D', '552.0 km');

-- Topic: Time, Speed & Distance, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(93, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 120 km/h. How much distance will it cover in 2 hours?', 'medium', 'C', '240 km', 'Distance = Speed * Time = 120 * 2 = 240 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(93, 'A', '220 km'),
(93, 'B', '255 km'),
(93, 'C', '240 km'),
(93, 'D', '288.0 km');

-- Topic: Time, Speed & Distance, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(94, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 125 km/h. How much distance will it cover in 3 hours?', 'hard', 'C', '375 km', 'Distance = Speed * Time = 125 * 3 = 375 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(94, 'A', '355 km'),
(94, 'B', '390 km'),
(94, 'C', '375 km'),
(94, 'D', '450.0 km');

-- Topic: Time, Speed & Distance, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(95, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 130 km/h. How much distance will it cover in 4 hours?', 'hard', 'C', '520 km', 'Distance = Speed * Time = 130 * 4 = 520 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(95, 'A', '500 km'),
(95, 'B', '535 km'),
(95, 'C', '520 km'),
(95, 'D', '624.0 km');

-- Topic: Time, Speed & Distance, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(96, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 135 km/h. How much distance will it cover in 2 hours?', 'hard', 'C', '270 km', 'Distance = Speed * Time = 135 * 2 = 270 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(96, 'A', '250 km'),
(96, 'B', '285 km'),
(96, 'C', '270 km'),
(96, 'D', '324.0 km');

-- Topic: Time, Speed & Distance, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(97, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 140 km/h. How much distance will it cover in 3 hours?', 'hard', 'C', '420 km', 'Distance = Speed * Time = 140 * 3 = 420 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(97, 'A', '400 km'),
(97, 'B', '435 km'),
(97, 'C', '420 km'),
(97, 'D', '504.0 km');

-- Topic: Time, Speed & Distance, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(98, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 145 km/h. How much distance will it cover in 4 hours?', 'hard', 'C', '580 km', 'Distance = Speed * Time = 145 * 4 = 580 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(98, 'A', '560 km'),
(98, 'B', '595 km'),
(98, 'C', '580 km'),
(98, 'D', '696.0 km');

-- Topic: Time, Speed & Distance, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(99, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 150 km/h. How much distance will it cover in 2 hours?', 'hard', 'C', '300 km', 'Distance = Speed * Time = 150 * 2 = 300 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(99, 'A', '280 km'),
(99, 'B', '315 km'),
(99, 'C', '300 km'),
(99, 'D', '360.0 km');

-- Topic: Time, Speed & Distance, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(100, 1, 4, 'Distance Covered', 'A car travels at a constant speed of 155 km/h. How much distance will it cover in 3 hours?', 'hard', 'C', '465 km', 'Distance = Speed * Time = 155 * 3 = 465 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(100, 'A', '445 km'),
(100, 'B', '480 km'),
(100, 'C', '465 km'),
(100, 'D', '558.0 km');

-- Topic: Simple & Compound Interest, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(101, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹1500 at an annual interest rate of 6% for 3 years.', 'easy', 'A', '₹270.0', 'SI = (P * R * T) / 100 = (1500 * 6 * 3) / 100 = ₹270.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(101, 'A', '₹270.0'),
(101, 'B', '₹320.0'),
(101, 'C', '₹245.0'),
(101, 'D', '₹297.0');

-- Topic: Simple & Compound Interest, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(102, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹2000 at an annual interest rate of 8% for 4 years.', 'easy', 'A', '₹640.0', 'SI = (P * R * T) / 100 = (2000 * 8 * 4) / 100 = ₹640.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(102, 'A', '₹640.0'),
(102, 'B', '₹690.0'),
(102, 'C', '₹615.0'),
(102, 'D', '₹704.0');

-- Topic: Simple & Compound Interest, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(103, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹2500 at an annual interest rate of 10% for 2 years.', 'easy', 'A', '₹500.0', 'SI = (P * R * T) / 100 = (2500 * 10 * 2) / 100 = ₹500.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(103, 'A', '₹500.0'),
(103, 'B', '₹550.0'),
(103, 'C', '₹475.0'),
(103, 'D', '₹550.0');

-- Topic: Simple & Compound Interest, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(104, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹3000 at an annual interest rate of 4% for 3 years.', 'easy', 'A', '₹360.0', 'SI = (P * R * T) / 100 = (3000 * 4 * 3) / 100 = ₹360.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(104, 'A', '₹360.0'),
(104, 'B', '₹410.0'),
(104, 'C', '₹335.0'),
(104, 'D', '₹396.00000000000006');

-- Topic: Simple & Compound Interest, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(105, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹3500 at an annual interest rate of 6% for 4 years.', 'easy', 'A', '₹840.0', 'SI = (P * R * T) / 100 = (3500 * 6 * 4) / 100 = ₹840.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(105, 'A', '₹840.0'),
(105, 'B', '₹890.0'),
(105, 'C', '₹815.0'),
(105, 'D', '₹924.0000000000001');

-- Topic: Simple & Compound Interest, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(106, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹4000 at an annual interest rate of 8% for 2 years.', 'easy', 'A', '₹640.0', 'SI = (P * R * T) / 100 = (4000 * 8 * 2) / 100 = ₹640.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(106, 'A', '₹640.0'),
(106, 'B', '₹690.0'),
(106, 'C', '₹615.0'),
(106, 'D', '₹704.0');

-- Topic: Simple & Compound Interest, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(107, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹4500 at an annual interest rate of 10% for 3 years.', 'easy', 'A', '₹1350.0', 'SI = (P * R * T) / 100 = (4500 * 10 * 3) / 100 = ₹1350.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(107, 'A', '₹1350.0'),
(107, 'B', '₹1400.0'),
(107, 'C', '₹1325.0'),
(107, 'D', '₹1485.0000000000002');

-- Topic: Simple & Compound Interest, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(108, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹5000 at an annual interest rate of 4% for 4 years.', 'easy', 'A', '₹800.0', 'SI = (P * R * T) / 100 = (5000 * 4 * 4) / 100 = ₹800.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(108, 'A', '₹800.0'),
(108, 'B', '₹850.0'),
(108, 'C', '₹775.0'),
(108, 'D', '₹880.0000000000001');

-- Topic: Simple & Compound Interest, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(109, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹5500 at an annual interest rate of 6% for 2 years.', 'medium', 'A', '₹660.0', 'SI = (P * R * T) / 100 = (5500 * 6 * 2) / 100 = ₹660.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(109, 'A', '₹660.0'),
(109, 'B', '₹710.0'),
(109, 'C', '₹635.0'),
(109, 'D', '₹726.0000000000001');

-- Topic: Simple & Compound Interest, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(110, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹6000 at an annual interest rate of 8% for 3 years.', 'medium', 'A', '₹1440.0', 'SI = (P * R * T) / 100 = (6000 * 8 * 3) / 100 = ₹1440.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(110, 'A', '₹1440.0'),
(110, 'B', '₹1490.0'),
(110, 'C', '₹1415.0'),
(110, 'D', '₹1584.0000000000002');

-- Topic: Simple & Compound Interest, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(111, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹6500 at an annual interest rate of 10% for 4 years.', 'medium', 'A', '₹2600.0', 'SI = (P * R * T) / 100 = (6500 * 10 * 4) / 100 = ₹2600.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(111, 'A', '₹2600.0'),
(111, 'B', '₹2650.0'),
(111, 'C', '₹2575.0'),
(111, 'D', '₹2860.0000000000005');

-- Topic: Simple & Compound Interest, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(112, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹7000 at an annual interest rate of 4% for 2 years.', 'medium', 'A', '₹560.0', 'SI = (P * R * T) / 100 = (7000 * 4 * 2) / 100 = ₹560.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(112, 'A', '₹560.0'),
(112, 'B', '₹610.0'),
(112, 'C', '₹535.0'),
(112, 'D', '₹616.0');

-- Topic: Simple & Compound Interest, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(113, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹7500 at an annual interest rate of 6% for 3 years.', 'medium', 'A', '₹1350.0', 'SI = (P * R * T) / 100 = (7500 * 6 * 3) / 100 = ₹1350.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(113, 'A', '₹1350.0'),
(113, 'B', '₹1400.0'),
(113, 'C', '₹1325.0'),
(113, 'D', '₹1485.0000000000002');

-- Topic: Simple & Compound Interest, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(114, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹8000 at an annual interest rate of 8% for 4 years.', 'medium', 'A', '₹2560.0', 'SI = (P * R * T) / 100 = (8000 * 8 * 4) / 100 = ₹2560.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(114, 'A', '₹2560.0'),
(114, 'B', '₹2610.0'),
(114, 'C', '₹2535.0'),
(114, 'D', '₹2816.0');

-- Topic: Simple & Compound Interest, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(115, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹8500 at an annual interest rate of 10% for 2 years.', 'medium', 'A', '₹1700.0', 'SI = (P * R * T) / 100 = (8500 * 10 * 2) / 100 = ₹1700.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(115, 'A', '₹1700.0'),
(115, 'B', '₹1750.0'),
(115, 'C', '₹1675.0'),
(115, 'D', '₹1870.0000000000002');

-- Topic: Simple & Compound Interest, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(116, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹9000 at an annual interest rate of 4% for 3 years.', 'medium', 'A', '₹1080.0', 'SI = (P * R * T) / 100 = (9000 * 4 * 3) / 100 = ₹1080.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(116, 'A', '₹1080.0'),
(116, 'B', '₹1130.0'),
(116, 'C', '₹1055.0'),
(116, 'D', '₹1188.0');

-- Topic: Simple & Compound Interest, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(117, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹9500 at an annual interest rate of 6% for 4 years.', 'medium', 'A', '₹2280.0', 'SI = (P * R * T) / 100 = (9500 * 6 * 4) / 100 = ₹2280.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(117, 'A', '₹2280.0'),
(117, 'B', '₹2330.0'),
(117, 'C', '₹2255.0'),
(117, 'D', '₹2508.0');

-- Topic: Simple & Compound Interest, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(118, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹10000 at an annual interest rate of 8% for 2 years.', 'medium', 'A', '₹1600.0', 'SI = (P * R * T) / 100 = (10000 * 8 * 2) / 100 = ₹1600.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(118, 'A', '₹1600.0'),
(118, 'B', '₹1650.0'),
(118, 'C', '₹1575.0'),
(118, 'D', '₹1760.0000000000002');

-- Topic: Simple & Compound Interest, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(119, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹10500 at an annual interest rate of 10% for 3 years.', 'hard', 'A', '₹3150.0', 'SI = (P * R * T) / 100 = (10500 * 10 * 3) / 100 = ₹3150.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(119, 'A', '₹3150.0'),
(119, 'B', '₹3200.0'),
(119, 'C', '₹3125.0'),
(119, 'D', '₹3465.0000000000005');

-- Topic: Simple & Compound Interest, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(120, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹11000 at an annual interest rate of 4% for 4 years.', 'hard', 'A', '₹1760.0', 'SI = (P * R * T) / 100 = (11000 * 4 * 4) / 100 = ₹1760.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(120, 'A', '₹1760.0'),
(120, 'B', '₹1810.0'),
(120, 'C', '₹1735.0'),
(120, 'D', '₹1936.0000000000002');

-- Topic: Simple & Compound Interest, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(121, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹11500 at an annual interest rate of 6% for 2 years.', 'hard', 'A', '₹1380.0', 'SI = (P * R * T) / 100 = (11500 * 6 * 2) / 100 = ₹1380.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(121, 'A', '₹1380.0'),
(121, 'B', '₹1430.0'),
(121, 'C', '₹1355.0'),
(121, 'D', '₹1518.0000000000002');

-- Topic: Simple & Compound Interest, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(122, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹12000 at an annual interest rate of 8% for 3 years.', 'hard', 'A', '₹2880.0', 'SI = (P * R * T) / 100 = (12000 * 8 * 3) / 100 = ₹2880.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(122, 'A', '₹2880.0'),
(122, 'B', '₹2930.0'),
(122, 'C', '₹2855.0'),
(122, 'D', '₹3168.0000000000005');

-- Topic: Simple & Compound Interest, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(123, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹12500 at an annual interest rate of 10% for 4 years.', 'hard', 'A', '₹5000.0', 'SI = (P * R * T) / 100 = (12500 * 10 * 4) / 100 = ₹5000.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(123, 'A', '₹5000.0'),
(123, 'B', '₹5050.0'),
(123, 'C', '₹4975.0'),
(123, 'D', '₹5500.0');

-- Topic: Simple & Compound Interest, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(124, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹13000 at an annual interest rate of 4% for 2 years.', 'hard', 'A', '₹1040.0', 'SI = (P * R * T) / 100 = (13000 * 4 * 2) / 100 = ₹1040.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(124, 'A', '₹1040.0'),
(124, 'B', '₹1090.0'),
(124, 'C', '₹1015.0'),
(124, 'D', '₹1144.0');

-- Topic: Simple & Compound Interest, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(125, 1, 5, 'Simple Interest Calculation', 'Find the Simple Interest on a principal sum of ₹13500 at an annual interest rate of 6% for 3 years.', 'hard', 'A', '₹2430.0', 'SI = (P * R * T) / 100 = (13500 * 6 * 3) / 100 = ₹2430.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(125, 'A', '₹2430.0'),
(125, 'B', '₹2480.0'),
(125, 'C', '₹2405.0'),
(125, 'D', '₹2673.0');

-- Topic: Ratio & Proportion, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(126, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹710 between A and B in the ratio 3:4. What is A''s share?', 'easy', 'C', '₹304.2857142857143', 'A''s share = (a / (a+b)) * Total = (3/7) * 710 = ₹304.2857142857143.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(126, 'A', '₹354.2857142857143'),
(126, 'B', '₹274.2857142857143'),
(126, 'C', '₹304.2857142857143'),
(126, 'D', '₹355.0');

-- Topic: Ratio & Proportion, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(127, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹920 between A and B in the ratio 4:5. What is A''s share?', 'easy', 'C', '₹408.88888888888886', 'A''s share = (a / (a+b)) * Total = (4/9) * 920 = ₹408.88888888888886.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(127, 'A', '₹458.88888888888886'),
(127, 'B', '₹378.88888888888886'),
(127, 'C', '₹408.88888888888886'),
(127, 'D', '₹460.0');

-- Topic: Ratio & Proportion, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(128, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹830 between A and B in the ratio 2:6. What is A''s share?', 'easy', 'C', '₹207.5', 'A''s share = (a / (a+b)) * Total = (2/8) * 830 = ₹207.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(128, 'A', '₹257.5'),
(128, 'B', '₹177.5'),
(128, 'C', '₹207.5'),
(128, 'D', '₹415.0');

-- Topic: Ratio & Proportion, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(129, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹640 between A and B in the ratio 3:3. What is A''s share?', 'easy', 'C', '₹320.0', 'A''s share = (a / (a+b)) * Total = (3/6) * 640 = ₹320.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(129, 'A', '₹370.0'),
(129, 'B', '₹290.0'),
(129, 'C', '₹320.0'),
(129, 'D', '₹320.0');

-- Topic: Ratio & Proportion, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(130, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹850 between A and B in the ratio 4:4. What is A''s share?', 'easy', 'C', '₹425.0', 'A''s share = (a / (a+b)) * Total = (4/8) * 850 = ₹425.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(130, 'A', '₹475.0'),
(130, 'B', '₹395.0'),
(130, 'C', '₹425.0'),
(130, 'D', '₹425.0');

-- Topic: Ratio & Proportion, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(131, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹760 between A and B in the ratio 2:5. What is A''s share?', 'easy', 'C', '₹217.14285714285714', 'A''s share = (a / (a+b)) * Total = (2/7) * 760 = ₹217.14285714285714.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(131, 'A', '₹267.1428571428571'),
(131, 'B', '₹187.14285714285714'),
(131, 'C', '₹217.14285714285714'),
(131, 'D', '₹380.0');

-- Topic: Ratio & Proportion, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(132, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹970 between A and B in the ratio 3:6. What is A''s share?', 'easy', 'C', '₹323.3333333333333', 'A''s share = (a / (a+b)) * Total = (3/9) * 970 = ₹323.3333333333333.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(132, 'A', '₹373.3333333333333'),
(132, 'B', '₹293.3333333333333'),
(132, 'C', '₹323.3333333333333'),
(132, 'D', '₹485.0');

-- Topic: Ratio & Proportion, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(133, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹780 between A and B in the ratio 4:3. What is A''s share?', 'easy', 'C', '₹445.71428571428567', 'A''s share = (a / (a+b)) * Total = (4/7) * 780 = ₹445.71428571428567.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(133, 'A', '₹495.71428571428567'),
(133, 'B', '₹415.71428571428567'),
(133, 'C', '₹445.71428571428567'),
(133, 'D', '₹390.0');

-- Topic: Ratio & Proportion, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(134, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹690 between A and B in the ratio 2:4. What is A''s share?', 'medium', 'C', '₹230.0', 'A''s share = (a / (a+b)) * Total = (2/6) * 690 = ₹230.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(134, 'A', '₹280.0'),
(134, 'B', '₹200.0'),
(134, 'C', '₹230.0'),
(134, 'D', '₹345.0');

-- Topic: Ratio & Proportion, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(135, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹900 between A and B in the ratio 3:5. What is A''s share?', 'medium', 'C', '₹337.5', 'A''s share = (a / (a+b)) * Total = (3/8) * 900 = ₹337.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(135, 'A', '₹387.5'),
(135, 'B', '₹307.5'),
(135, 'C', '₹337.5'),
(135, 'D', '₹450.0');

-- Topic: Ratio & Proportion, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(136, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹1110 between A and B in the ratio 4:6. What is A''s share?', 'medium', 'C', '₹444.0', 'A''s share = (a / (a+b)) * Total = (4/10) * 1110 = ₹444.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(136, 'A', '₹494.0'),
(136, 'B', '₹414.0'),
(136, 'C', '₹444.0'),
(136, 'D', '₹555.0');

-- Topic: Ratio & Proportion, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(137, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹620 between A and B in the ratio 2:3. What is A''s share?', 'medium', 'C', '₹248.0', 'A''s share = (a / (a+b)) * Total = (2/5) * 620 = ₹248.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(137, 'A', '₹298.0'),
(137, 'B', '₹218.0'),
(137, 'C', '₹248.0'),
(137, 'D', '₹310.0');

-- Topic: Ratio & Proportion, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(138, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹830 between A and B in the ratio 3:4. What is A''s share?', 'medium', 'C', '₹355.7142857142857', 'A''s share = (a / (a+b)) * Total = (3/7) * 830 = ₹355.7142857142857.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(138, 'A', '₹405.7142857142857'),
(138, 'B', '₹325.7142857142857'),
(138, 'C', '₹355.7142857142857'),
(138, 'D', '₹415.0');

-- Topic: Ratio & Proportion, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(139, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹1040 between A and B in the ratio 4:5. What is A''s share?', 'medium', 'C', '₹462.2222222222222', 'A''s share = (a / (a+b)) * Total = (4/9) * 1040 = ₹462.2222222222222.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(139, 'A', '₹512.2222222222222'),
(139, 'B', '₹432.2222222222222'),
(139, 'C', '₹462.2222222222222'),
(139, 'D', '₹520.0');

-- Topic: Ratio & Proportion, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(140, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹950 between A and B in the ratio 2:6. What is A''s share?', 'medium', 'C', '₹237.5', 'A''s share = (a / (a+b)) * Total = (2/8) * 950 = ₹237.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(140, 'A', '₹287.5'),
(140, 'B', '₹207.5'),
(140, 'C', '₹237.5'),
(140, 'D', '₹475.0');

-- Topic: Ratio & Proportion, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(141, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹760 between A and B in the ratio 3:3. What is A''s share?', 'medium', 'C', '₹380.0', 'A''s share = (a / (a+b)) * Total = (3/6) * 760 = ₹380.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(141, 'A', '₹430.0'),
(141, 'B', '₹350.0'),
(141, 'C', '₹380.0'),
(141, 'D', '₹380.0');

-- Topic: Ratio & Proportion, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(142, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹970 between A and B in the ratio 4:4. What is A''s share?', 'medium', 'C', '₹485.0', 'A''s share = (a / (a+b)) * Total = (4/8) * 970 = ₹485.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(142, 'A', '₹535.0'),
(142, 'B', '₹455.0'),
(142, 'C', '₹485.0'),
(142, 'D', '₹485.0');

-- Topic: Ratio & Proportion, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(143, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹880 between A and B in the ratio 2:5. What is A''s share?', 'medium', 'C', '₹251.42857142857142', 'A''s share = (a / (a+b)) * Total = (2/7) * 880 = ₹251.42857142857142.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(143, 'A', '₹301.42857142857144'),
(143, 'B', '₹221.42857142857142'),
(143, 'C', '₹251.42857142857142'),
(143, 'D', '₹440.0');

-- Topic: Ratio & Proportion, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(144, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹1090 between A and B in the ratio 3:6. What is A''s share?', 'hard', 'C', '₹363.3333333333333', 'A''s share = (a / (a+b)) * Total = (3/9) * 1090 = ₹363.3333333333333.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(144, 'A', '₹413.3333333333333'),
(144, 'B', '₹333.3333333333333'),
(144, 'C', '₹363.3333333333333'),
(144, 'D', '₹545.0');

-- Topic: Ratio & Proportion, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(145, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹900 between A and B in the ratio 4:3. What is A''s share?', 'hard', 'C', '₹514.2857142857142', 'A''s share = (a / (a+b)) * Total = (4/7) * 900 = ₹514.2857142857142.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(145, 'A', '₹564.2857142857142'),
(145, 'B', '₹484.2857142857142'),
(145, 'C', '₹514.2857142857142'),
(145, 'D', '₹450.0');

-- Topic: Ratio & Proportion, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(146, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹810 between A and B in the ratio 2:4. What is A''s share?', 'hard', 'C', '₹270.0', 'A''s share = (a / (a+b)) * Total = (2/6) * 810 = ₹270.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(146, 'A', '₹320.0'),
(146, 'B', '₹240.0'),
(146, 'C', '₹270.0'),
(146, 'D', '₹405.0');

-- Topic: Ratio & Proportion, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(147, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹1020 between A and B in the ratio 3:5. What is A''s share?', 'hard', 'C', '₹382.5', 'A''s share = (a / (a+b)) * Total = (3/8) * 1020 = ₹382.5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(147, 'A', '₹432.5'),
(147, 'B', '₹352.5'),
(147, 'C', '₹382.5'),
(147, 'D', '₹510.0');

-- Topic: Ratio & Proportion, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(148, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹1230 between A and B in the ratio 4:6. What is A''s share?', 'hard', 'C', '₹492.0', 'A''s share = (a / (a+b)) * Total = (4/10) * 1230 = ₹492.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(148, 'A', '₹542.0'),
(148, 'B', '₹462.0'),
(148, 'C', '₹492.0'),
(148, 'D', '₹615.0');

-- Topic: Ratio & Proportion, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(149, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹740 between A and B in the ratio 2:3. What is A''s share?', 'hard', 'C', '₹296.0', 'A''s share = (a / (a+b)) * Total = (2/5) * 740 = ₹296.0.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(149, 'A', '₹346.0'),
(149, 'B', '₹266.0'),
(149, 'C', '₹296.0'),
(149, 'D', '₹370.0');

-- Topic: Ratio & Proportion, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(150, 1, 6, 'Dividing a Quantity into Ratios', 'Divide ₹950 between A and B in the ratio 3:4. What is A''s share?', 'hard', 'C', '₹407.1428571428571', 'A''s share = (a / (a+b)) * Total = (3/7) * 950 = ₹407.1428571428571.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(150, 'A', '₹457.1428571428571'),
(150, 'B', '₹377.1428571428571'),
(150, 'C', '₹407.1428571428571'),
(150, 'D', '₹475.0');

-- Topic: Number System, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(151, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(151, 'A', 'Yes'),
(151, 'B', 'No'),
(151, 'C', 'Depends on the integers'),
(151, 'D', 'Cannot be determined');

-- Topic: Number System, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(152, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(152, 'A', 'Yes'),
(152, 'B', 'No'),
(152, 'C', 'Depends on the integers'),
(152, 'D', 'Cannot be determined');

-- Topic: Number System, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(153, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(153, 'A', 'Yes'),
(153, 'B', 'No'),
(153, 'C', 'Depends on the integers'),
(153, 'D', 'Cannot be determined');

-- Topic: Number System, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(154, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(154, 'A', 'Yes'),
(154, 'B', 'No'),
(154, 'C', 'Depends on the integers'),
(154, 'D', 'Cannot be determined');

-- Topic: Number System, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(155, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(155, 'A', 'Yes'),
(155, 'B', 'No'),
(155, 'C', 'Depends on the integers'),
(155, 'D', 'Cannot be determined');

-- Topic: Number System, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(156, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(156, 'A', 'Yes'),
(156, 'B', 'No'),
(156, 'C', 'Depends on the integers'),
(156, 'D', 'Cannot be determined');

-- Topic: Number System, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(157, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(157, 'A', 'Yes'),
(157, 'B', 'No'),
(157, 'C', 'Depends on the integers'),
(157, 'D', 'Cannot be determined');

-- Topic: Number System, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(158, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'easy', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(158, 'A', 'Yes'),
(158, 'B', 'No'),
(158, 'C', 'Depends on the integers'),
(158, 'D', 'Cannot be determined');

-- Topic: Number System, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(159, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(159, 'A', 'Yes'),
(159, 'B', 'No'),
(159, 'C', 'Depends on the integers'),
(159, 'D', 'Cannot be determined');

-- Topic: Number System, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(160, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(160, 'A', 'Yes'),
(160, 'B', 'No'),
(160, 'C', 'Depends on the integers'),
(160, 'D', 'Cannot be determined');

-- Topic: Number System, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(161, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(161, 'A', 'Yes'),
(161, 'B', 'No'),
(161, 'C', 'Depends on the integers'),
(161, 'D', 'Cannot be determined');

-- Topic: Number System, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(162, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(162, 'A', 'Yes'),
(162, 'B', 'No'),
(162, 'C', 'Depends on the integers'),
(162, 'D', 'Cannot be determined');

-- Topic: Number System, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(163, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(163, 'A', 'Yes'),
(163, 'B', 'No'),
(163, 'C', 'Depends on the integers'),
(163, 'D', 'Cannot be determined');

-- Topic: Number System, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(164, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(164, 'A', 'Yes'),
(164, 'B', 'No'),
(164, 'C', 'Depends on the integers'),
(164, 'D', 'Cannot be determined');

-- Topic: Number System, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(165, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(165, 'A', 'Yes'),
(165, 'B', 'No'),
(165, 'C', 'Depends on the integers'),
(165, 'D', 'Cannot be determined');

-- Topic: Number System, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(166, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(166, 'A', 'Yes'),
(166, 'B', 'No'),
(166, 'C', 'Depends on the integers'),
(166, 'D', 'Cannot be determined');

-- Topic: Number System, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(167, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(167, 'A', 'Yes'),
(167, 'B', 'No'),
(167, 'C', 'Depends on the integers'),
(167, 'D', 'Cannot be determined');

-- Topic: Number System, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(168, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'medium', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(168, 'A', 'Yes'),
(168, 'B', 'No'),
(168, 'C', 'Depends on the integers'),
(168, 'D', 'Cannot be determined');

-- Topic: Number System, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(169, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(169, 'A', 'Yes'),
(169, 'B', 'No'),
(169, 'C', 'Depends on the integers'),
(169, 'D', 'Cannot be determined');

-- Topic: Number System, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(170, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(170, 'A', 'Yes'),
(170, 'B', 'No'),
(170, 'C', 'Depends on the integers'),
(170, 'D', 'Cannot be determined');

-- Topic: Number System, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(171, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(171, 'A', 'Yes'),
(171, 'B', 'No'),
(171, 'C', 'Depends on the integers'),
(171, 'D', 'Cannot be determined');

-- Topic: Number System, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(172, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(172, 'A', 'Yes'),
(172, 'B', 'No'),
(172, 'C', 'Depends on the integers'),
(172, 'D', 'Cannot be determined');

-- Topic: Number System, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(173, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(173, 'A', 'Yes'),
(173, 'B', 'No'),
(173, 'C', 'Depends on the integers'),
(173, 'D', 'Cannot be determined');

-- Topic: Number System, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(174, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 6?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(174, 'A', 'Yes'),
(174, 'B', 'No'),
(174, 'C', 'Depends on the integers'),
(174, 'D', 'Cannot be determined');

-- Topic: Number System, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(175, 1, 7, 'Properties of Numbers', 'Is the product of any three consecutive integers always divisible by 3?', 'hard', 'A', 'Yes', 'Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(175, 'A', 'Yes'),
(175, 'B', 'No'),
(175, 'C', 'Depends on the integers'),
(175, 'D', 'Cannot be determined');

-- Topic: Averages, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(176, 1, 8, 'Finding Arithmetic Mean', 'The average of 6 numbers is 12. What is the sum of these numbers?', 'easy', 'B', '72', 'Sum = Average * Count = 12 * 6 = 72.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(176, 'A', '67'),
(176, 'B', '72'),
(176, 'C', '82'),
(176, 'D', '86.39999999999999');

-- Topic: Averages, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(177, 1, 8, 'Finding Arithmetic Mean', 'The average of 7 numbers is 14. What is the sum of these numbers?', 'easy', 'B', '98', 'Sum = Average * Count = 14 * 7 = 98.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(177, 'A', '93'),
(177, 'B', '98'),
(177, 'C', '108'),
(177, 'D', '117.6');

-- Topic: Averages, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(178, 1, 8, 'Finding Arithmetic Mean', 'The average of 8 numbers is 16. What is the sum of these numbers?', 'easy', 'B', '128', 'Sum = Average * Count = 16 * 8 = 128.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(178, 'A', '123'),
(178, 'B', '128'),
(178, 'C', '138'),
(178, 'D', '153.6');

-- Topic: Averages, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(179, 1, 8, 'Finding Arithmetic Mean', 'The average of 9 numbers is 18. What is the sum of these numbers?', 'easy', 'B', '162', 'Sum = Average * Count = 18 * 9 = 162.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(179, 'A', '157'),
(179, 'B', '162'),
(179, 'C', '172'),
(179, 'D', '194.4');

-- Topic: Averages, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(180, 1, 8, 'Finding Arithmetic Mean', 'The average of 5 numbers is 20. What is the sum of these numbers?', 'easy', 'B', '100', 'Sum = Average * Count = 20 * 5 = 100.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(180, 'A', '95'),
(180, 'B', '100'),
(180, 'C', '110'),
(180, 'D', '120.0');

-- Topic: Averages, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(181, 1, 8, 'Finding Arithmetic Mean', 'The average of 6 numbers is 22. What is the sum of these numbers?', 'easy', 'B', '132', 'Sum = Average * Count = 22 * 6 = 132.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(181, 'A', '127'),
(181, 'B', '132'),
(181, 'C', '142'),
(181, 'D', '158.4');

-- Topic: Averages, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(182, 1, 8, 'Finding Arithmetic Mean', 'The average of 7 numbers is 24. What is the sum of these numbers?', 'easy', 'B', '168', 'Sum = Average * Count = 24 * 7 = 168.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(182, 'A', '163'),
(182, 'B', '168'),
(182, 'C', '178'),
(182, 'D', '201.6');

-- Topic: Averages, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(183, 1, 8, 'Finding Arithmetic Mean', 'The average of 8 numbers is 26. What is the sum of these numbers?', 'easy', 'B', '208', 'Sum = Average * Count = 26 * 8 = 208.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(183, 'A', '203'),
(183, 'B', '208'),
(183, 'C', '218'),
(183, 'D', '249.6');

-- Topic: Averages, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(184, 1, 8, 'Finding Arithmetic Mean', 'The average of 9 numbers is 28. What is the sum of these numbers?', 'medium', 'B', '252', 'Sum = Average * Count = 28 * 9 = 252.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(184, 'A', '247'),
(184, 'B', '252'),
(184, 'C', '262'),
(184, 'D', '302.4');

-- Topic: Averages, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(185, 1, 8, 'Finding Arithmetic Mean', 'The average of 5 numbers is 30. What is the sum of these numbers?', 'medium', 'B', '150', 'Sum = Average * Count = 30 * 5 = 150.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(185, 'A', '145'),
(185, 'B', '150'),
(185, 'C', '160'),
(185, 'D', '180.0');

-- Topic: Averages, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(186, 1, 8, 'Finding Arithmetic Mean', 'The average of 6 numbers is 32. What is the sum of these numbers?', 'medium', 'B', '192', 'Sum = Average * Count = 32 * 6 = 192.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(186, 'A', '187'),
(186, 'B', '192'),
(186, 'C', '202'),
(186, 'D', '230.39999999999998');

-- Topic: Averages, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(187, 1, 8, 'Finding Arithmetic Mean', 'The average of 7 numbers is 34. What is the sum of these numbers?', 'medium', 'B', '238', 'Sum = Average * Count = 34 * 7 = 238.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(187, 'A', '233'),
(187, 'B', '238'),
(187, 'C', '248'),
(187, 'D', '285.59999999999997');

-- Topic: Averages, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(188, 1, 8, 'Finding Arithmetic Mean', 'The average of 8 numbers is 36. What is the sum of these numbers?', 'medium', 'B', '288', 'Sum = Average * Count = 36 * 8 = 288.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(188, 'A', '283'),
(188, 'B', '288'),
(188, 'C', '298'),
(188, 'D', '345.59999999999997');

-- Topic: Averages, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(189, 1, 8, 'Finding Arithmetic Mean', 'The average of 9 numbers is 38. What is the sum of these numbers?', 'medium', 'B', '342', 'Sum = Average * Count = 38 * 9 = 342.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(189, 'A', '337'),
(189, 'B', '342'),
(189, 'C', '352'),
(189, 'D', '410.4');

-- Topic: Averages, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(190, 1, 8, 'Finding Arithmetic Mean', 'The average of 5 numbers is 40. What is the sum of these numbers?', 'medium', 'B', '200', 'Sum = Average * Count = 40 * 5 = 200.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(190, 'A', '195'),
(190, 'B', '200'),
(190, 'C', '210'),
(190, 'D', '240.0');

-- Topic: Averages, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(191, 1, 8, 'Finding Arithmetic Mean', 'The average of 6 numbers is 42. What is the sum of these numbers?', 'medium', 'B', '252', 'Sum = Average * Count = 42 * 6 = 252.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(191, 'A', '247'),
(191, 'B', '252'),
(191, 'C', '262'),
(191, 'D', '302.4');

-- Topic: Averages, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(192, 1, 8, 'Finding Arithmetic Mean', 'The average of 7 numbers is 44. What is the sum of these numbers?', 'medium', 'B', '308', 'Sum = Average * Count = 44 * 7 = 308.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(192, 'A', '303'),
(192, 'B', '308'),
(192, 'C', '318'),
(192, 'D', '369.59999999999997');

-- Topic: Averages, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(193, 1, 8, 'Finding Arithmetic Mean', 'The average of 8 numbers is 46. What is the sum of these numbers?', 'medium', 'B', '368', 'Sum = Average * Count = 46 * 8 = 368.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(193, 'A', '363'),
(193, 'B', '368'),
(193, 'C', '378'),
(193, 'D', '441.59999999999997');

-- Topic: Averages, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(194, 1, 8, 'Finding Arithmetic Mean', 'The average of 9 numbers is 48. What is the sum of these numbers?', 'hard', 'B', '432', 'Sum = Average * Count = 48 * 9 = 432.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(194, 'A', '427'),
(194, 'B', '432'),
(194, 'C', '442'),
(194, 'D', '518.4');

-- Topic: Averages, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(195, 1, 8, 'Finding Arithmetic Mean', 'The average of 5 numbers is 50. What is the sum of these numbers?', 'hard', 'B', '250', 'Sum = Average * Count = 50 * 5 = 250.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(195, 'A', '245'),
(195, 'B', '250'),
(195, 'C', '260'),
(195, 'D', '300.0');

-- Topic: Averages, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(196, 1, 8, 'Finding Arithmetic Mean', 'The average of 6 numbers is 52. What is the sum of these numbers?', 'hard', 'B', '312', 'Sum = Average * Count = 52 * 6 = 312.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(196, 'A', '307'),
(196, 'B', '312'),
(196, 'C', '322'),
(196, 'D', '374.4');

-- Topic: Averages, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(197, 1, 8, 'Finding Arithmetic Mean', 'The average of 7 numbers is 54. What is the sum of these numbers?', 'hard', 'B', '378', 'Sum = Average * Count = 54 * 7 = 378.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(197, 'A', '373'),
(197, 'B', '378'),
(197, 'C', '388'),
(197, 'D', '453.59999999999997');

-- Topic: Averages, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(198, 1, 8, 'Finding Arithmetic Mean', 'The average of 8 numbers is 56. What is the sum of these numbers?', 'hard', 'B', '448', 'Sum = Average * Count = 56 * 8 = 448.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(198, 'A', '443'),
(198, 'B', '448'),
(198, 'C', '458'),
(198, 'D', '537.6');

-- Topic: Averages, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(199, 1, 8, 'Finding Arithmetic Mean', 'The average of 9 numbers is 58. What is the sum of these numbers?', 'hard', 'B', '522', 'Sum = Average * Count = 58 * 9 = 522.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(199, 'A', '517'),
(199, 'B', '522'),
(199, 'C', '532'),
(199, 'D', '626.4');

-- Topic: Averages, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(200, 1, 8, 'Finding Arithmetic Mean', 'The average of 5 numbers is 60. What is the sum of these numbers?', 'hard', 'B', '300', 'Sum = Average * Count = 60 * 5 = 300.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(200, 'A', '295'),
(200, 'B', '300'),
(200, 'C', '310'),
(200, 'D', '360.0');

-- Topic: Mixtures & Alligations, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(201, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹11/kg be mixed with rice at ₹21/kg so that the mixture is worth ₹16/kg?', 'easy', 'A', '5:5', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (21 - 16) : (16 - 11) = 5:5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(201, 'A', '5:5'),
(201, 'B', '5:5'),
(201, 'C', '1:1'),
(201, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(202, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹12/kg be mixed with rice at ₹22/kg so that the mixture is worth ₹17/kg?', 'easy', 'A', '5:5', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (22 - 17) : (17 - 12) = 5:5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(202, 'A', '5:5'),
(202, 'B', '5:5'),
(202, 'C', '1:1'),
(202, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(203, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹13/kg be mixed with rice at ₹23/kg so that the mixture is worth ₹18/kg?', 'easy', 'A', '5:5', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (23 - 18) : (18 - 13) = 5:5.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(203, 'A', '5:5'),
(203, 'B', '5:5'),
(203, 'C', '1:1'),
(203, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(204, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹14/kg be mixed with rice at ₹24/kg so that the mixture is worth ₹15/kg?', 'easy', 'A', '9:1', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (24 - 15) : (15 - 14) = 9:1.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(204, 'A', '9:1'),
(204, 'B', '1:9'),
(204, 'C', '1:1'),
(204, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(205, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹15/kg be mixed with rice at ₹25/kg so that the mixture is worth ₹16/kg?', 'easy', 'A', '9:1', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (25 - 16) : (16 - 15) = 9:1.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(205, 'A', '9:1'),
(205, 'B', '1:9'),
(205, 'C', '1:1'),
(205, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(206, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹16/kg be mixed with rice at ₹26/kg so that the mixture is worth ₹17/kg?', 'easy', 'A', '9:1', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (26 - 17) : (17 - 16) = 9:1.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(206, 'A', '9:1'),
(206, 'B', '1:9'),
(206, 'C', '1:1'),
(206, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(207, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹17/kg be mixed with rice at ₹27/kg so that the mixture is worth ₹18/kg?', 'easy', 'A', '9:1', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (27 - 18) : (18 - 17) = 9:1.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(207, 'A', '9:1'),
(207, 'B', '1:9'),
(207, 'C', '1:1'),
(207, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(208, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹18/kg be mixed with rice at ₹28/kg so that the mixture is worth ₹15/kg?', 'easy', 'A', '13:-3', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (28 - 15) : (15 - 18) = 13:-3.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(208, 'A', '13:-3'),
(208, 'B', '-3:13'),
(208, 'C', '1:1'),
(208, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(209, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹19/kg be mixed with rice at ₹29/kg so that the mixture is worth ₹16/kg?', 'medium', 'A', '13:-3', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (29 - 16) : (16 - 19) = 13:-3.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(209, 'A', '13:-3'),
(209, 'B', '-3:13'),
(209, 'C', '1:1'),
(209, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(210, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹20/kg be mixed with rice at ₹30/kg so that the mixture is worth ₹17/kg?', 'medium', 'A', '13:-3', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (30 - 17) : (17 - 20) = 13:-3.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(210, 'A', '13:-3'),
(210, 'B', '-3:13'),
(210, 'C', '1:1'),
(210, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(211, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹21/kg be mixed with rice at ₹31/kg so that the mixture is worth ₹18/kg?', 'medium', 'A', '13:-3', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (31 - 18) : (18 - 21) = 13:-3.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(211, 'A', '13:-3'),
(211, 'B', '-3:13'),
(211, 'C', '1:1'),
(211, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(212, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹22/kg be mixed with rice at ₹32/kg so that the mixture is worth ₹15/kg?', 'medium', 'A', '17:-7', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (32 - 15) : (15 - 22) = 17:-7.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(212, 'A', '17:-7'),
(212, 'B', '-7:17'),
(212, 'C', '1:1'),
(212, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(213, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹23/kg be mixed with rice at ₹33/kg so that the mixture is worth ₹16/kg?', 'medium', 'A', '17:-7', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (33 - 16) : (16 - 23) = 17:-7.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(213, 'A', '17:-7'),
(213, 'B', '-7:17'),
(213, 'C', '1:1'),
(213, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(214, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹24/kg be mixed with rice at ₹34/kg so that the mixture is worth ₹17/kg?', 'medium', 'A', '17:-7', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (34 - 17) : (17 - 24) = 17:-7.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(214, 'A', '17:-7'),
(214, 'B', '-7:17'),
(214, 'C', '1:1'),
(214, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(215, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹25/kg be mixed with rice at ₹35/kg so that the mixture is worth ₹18/kg?', 'medium', 'A', '17:-7', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (35 - 18) : (18 - 25) = 17:-7.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(215, 'A', '17:-7'),
(215, 'B', '-7:17'),
(215, 'C', '1:1'),
(215, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(216, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹26/kg be mixed with rice at ₹36/kg so that the mixture is worth ₹15/kg?', 'medium', 'A', '21:-11', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (36 - 15) : (15 - 26) = 21:-11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(216, 'A', '21:-11'),
(216, 'B', '-11:21'),
(216, 'C', '1:1'),
(216, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(217, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹27/kg be mixed with rice at ₹37/kg so that the mixture is worth ₹16/kg?', 'medium', 'A', '21:-11', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (37 - 16) : (16 - 27) = 21:-11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(217, 'A', '21:-11'),
(217, 'B', '-11:21'),
(217, 'C', '1:1'),
(217, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(218, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹28/kg be mixed with rice at ₹38/kg so that the mixture is worth ₹17/kg?', 'medium', 'A', '21:-11', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (38 - 17) : (17 - 28) = 21:-11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(218, 'A', '21:-11'),
(218, 'B', '-11:21'),
(218, 'C', '1:1'),
(218, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(219, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹29/kg be mixed with rice at ₹39/kg so that the mixture is worth ₹18/kg?', 'hard', 'A', '21:-11', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (39 - 18) : (18 - 29) = 21:-11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(219, 'A', '21:-11'),
(219, 'B', '-11:21'),
(219, 'C', '1:1'),
(219, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(220, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹30/kg be mixed with rice at ₹40/kg so that the mixture is worth ₹15/kg?', 'hard', 'A', '25:-15', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (40 - 15) : (15 - 30) = 25:-15.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(220, 'A', '25:-15'),
(220, 'B', '-15:25'),
(220, 'C', '1:1'),
(220, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(221, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹31/kg be mixed with rice at ₹41/kg so that the mixture is worth ₹16/kg?', 'hard', 'A', '25:-15', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (41 - 16) : (16 - 31) = 25:-15.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(221, 'A', '25:-15'),
(221, 'B', '-15:25'),
(221, 'C', '1:1'),
(221, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(222, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹32/kg be mixed with rice at ₹42/kg so that the mixture is worth ₹17/kg?', 'hard', 'A', '25:-15', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (42 - 17) : (17 - 32) = 25:-15.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(222, 'A', '25:-15'),
(222, 'B', '-15:25'),
(222, 'C', '1:1'),
(222, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(223, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹33/kg be mixed with rice at ₹43/kg so that the mixture is worth ₹18/kg?', 'hard', 'A', '25:-15', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (43 - 18) : (18 - 33) = 25:-15.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(223, 'A', '25:-15'),
(223, 'B', '-15:25'),
(223, 'C', '1:1'),
(223, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(224, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹34/kg be mixed with rice at ₹44/kg so that the mixture is worth ₹15/kg?', 'hard', 'A', '29:-19', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (44 - 15) : (15 - 34) = 29:-19.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(224, 'A', '29:-19'),
(224, 'B', '-19:29'),
(224, 'C', '1:1'),
(224, 'D', '2:3');

-- Topic: Mixtures & Alligations, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(225, 1, 9, 'Finding Alligation Ratio', 'In what ratio must rice at ₹35/kg be mixed with rice at ₹45/kg so that the mixture is worth ₹16/kg?', 'hard', 'A', '29:-19', 'By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = (45 - 16) : (16 - 35) = 29:-19.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(225, 'A', '29:-19'),
(225, 'B', '-19:29'),
(225, 'C', '1:1'),
(225, 'D', '2:3');

-- Topic: Permutation & Combination, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(226, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'easy', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(226, 'A', '120'),
(226, 'B', '130'),
(226, 'C', '60'),
(226, 'D', '240');

-- Topic: Permutation & Combination, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(227, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'easy', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(227, 'A', '720'),
(227, 'B', '730'),
(227, 'C', '360'),
(227, 'D', '1440');

-- Topic: Permutation & Combination, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(228, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'easy', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(228, 'A', '24'),
(228, 'B', '34'),
(228, 'C', '12'),
(228, 'D', '48');

-- Topic: Permutation & Combination, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(229, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'easy', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(229, 'A', '120'),
(229, 'B', '130'),
(229, 'C', '60'),
(229, 'D', '240');

-- Topic: Permutation & Combination, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(230, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'easy', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(230, 'A', '720'),
(230, 'B', '730'),
(230, 'C', '360'),
(230, 'D', '1440');

-- Topic: Permutation & Combination, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(231, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'easy', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(231, 'A', '24'),
(231, 'B', '34'),
(231, 'C', '12'),
(231, 'D', '48');

-- Topic: Permutation & Combination, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(232, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'easy', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(232, 'A', '120'),
(232, 'B', '130'),
(232, 'C', '60'),
(232, 'D', '240');

-- Topic: Permutation & Combination, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(233, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'easy', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(233, 'A', '720'),
(233, 'B', '730'),
(233, 'C', '360'),
(233, 'D', '1440');

-- Topic: Permutation & Combination, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(234, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'medium', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(234, 'A', '24'),
(234, 'B', '34'),
(234, 'C', '12'),
(234, 'D', '48');

-- Topic: Permutation & Combination, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(235, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'medium', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(235, 'A', '120'),
(235, 'B', '130'),
(235, 'C', '60'),
(235, 'D', '240');

-- Topic: Permutation & Combination, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(236, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'medium', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(236, 'A', '720'),
(236, 'B', '730'),
(236, 'C', '360'),
(236, 'D', '1440');

-- Topic: Permutation & Combination, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(237, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'medium', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(237, 'A', '24'),
(237, 'B', '34'),
(237, 'C', '12'),
(237, 'D', '48');

-- Topic: Permutation & Combination, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(238, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'medium', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(238, 'A', '120'),
(238, 'B', '130'),
(238, 'C', '60'),
(238, 'D', '240');

-- Topic: Permutation & Combination, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(239, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'medium', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(239, 'A', '720'),
(239, 'B', '730'),
(239, 'C', '360'),
(239, 'D', '1440');

-- Topic: Permutation & Combination, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(240, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'medium', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(240, 'A', '24'),
(240, 'B', '34'),
(240, 'C', '12'),
(240, 'D', '48');

-- Topic: Permutation & Combination, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(241, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'medium', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(241, 'A', '120'),
(241, 'B', '130'),
(241, 'C', '60'),
(241, 'D', '240');

-- Topic: Permutation & Combination, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(242, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'medium', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(242, 'A', '720'),
(242, 'B', '730'),
(242, 'C', '360'),
(242, 'D', '1440');

-- Topic: Permutation & Combination, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(243, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'medium', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(243, 'A', '24'),
(243, 'B', '34'),
(243, 'C', '12'),
(243, 'D', '48');

-- Topic: Permutation & Combination, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(244, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'hard', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(244, 'A', '120'),
(244, 'B', '130'),
(244, 'C', '60'),
(244, 'D', '240');

-- Topic: Permutation & Combination, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(245, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'hard', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(245, 'A', '720'),
(245, 'B', '730'),
(245, 'C', '360'),
(245, 'D', '1440');

-- Topic: Permutation & Combination, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(246, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'hard', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(246, 'A', '24'),
(246, 'B', '34'),
(246, 'C', '12'),
(246, 'D', '48');

-- Topic: Permutation & Combination, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(247, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'hard', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(247, 'A', '120'),
(247, 'B', '130'),
(247, 'C', '60'),
(247, 'D', '240');

-- Topic: Permutation & Combination, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(248, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 6 distinct letters be arranged?', 'hard', 'A', '720', 'Number of arrangements of 6 distinct items = 6! = 720.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(248, 'A', '720'),
(248, 'B', '730'),
(248, 'C', '360'),
(248, 'D', '1440');

-- Topic: Permutation & Combination, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(249, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 4 distinct letters be arranged?', 'hard', 'A', '24', 'Number of arrangements of 4 distinct items = 4! = 24.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(249, 'A', '24'),
(249, 'B', '34'),
(249, 'C', '12'),
(249, 'D', '48');

-- Topic: Permutation & Combination, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(250, 1, 10, 'Permutation Arrangements', 'In how many ways can letters of a word of length 5 distinct letters be arranged?', 'hard', 'A', '120', 'Number of arrangements of 5 distinct items = 5! = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(250, 'A', '120'),
(250, 'B', '130'),
(250, 'C', '60'),
(250, 'D', '240');

-- Topic: Probability, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(251, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 6 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '5/11', 'Probability = Favorable / Total = 5/11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(251, 'A', '5/11'),
(251, 'B', '6/11'),
(251, 'C', '1/2'),
(251, 'D', '1/4');

-- Topic: Probability, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(252, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 6 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '6/12', 'Probability = Favorable / Total = 6/12.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(252, 'A', '6/12'),
(252, 'B', '6/12'),
(252, 'C', '1/2'),
(252, 'D', '1/4');

-- Topic: Probability, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(253, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 9 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '4/13', 'Probability = Favorable / Total = 4/13.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(253, 'A', '4/13'),
(253, 'B', '9/13'),
(253, 'C', '1/2'),
(253, 'D', '1/4');

-- Topic: Probability, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(254, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 9 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '5/14', 'Probability = Favorable / Total = 5/14.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(254, 'A', '5/14'),
(254, 'B', '9/14'),
(254, 'C', '1/2'),
(254, 'D', '1/4');

-- Topic: Probability, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(255, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 4 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '6/10', 'Probability = Favorable / Total = 6/10.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(255, 'A', '6/10'),
(255, 'B', '4/10'),
(255, 'C', '1/2'),
(255, 'D', '1/4');

-- Topic: Probability, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(256, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 7 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '4/11', 'Probability = Favorable / Total = 4/11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(256, 'A', '4/11'),
(256, 'B', '7/11'),
(256, 'C', '1/2'),
(256, 'D', '1/4');

-- Topic: Probability, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(257, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 7 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '5/12', 'Probability = Favorable / Total = 5/12.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(257, 'A', '5/12'),
(257, 'B', '7/12'),
(257, 'C', '1/2'),
(257, 'D', '1/4');

-- Topic: Probability, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(258, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 7 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'easy', 'A', '6/13', 'Probability = Favorable / Total = 6/13.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(258, 'A', '6/13'),
(258, 'B', '7/13'),
(258, 'C', '1/2'),
(258, 'D', '1/4');

-- Topic: Probability, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(259, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 10 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '4/14', 'Probability = Favorable / Total = 4/14.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(259, 'A', '4/14'),
(259, 'B', '10/14'),
(259, 'C', '1/2'),
(259, 'D', '1/4');

-- Topic: Probability, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(260, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 5 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '5/10', 'Probability = Favorable / Total = 5/10.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(260, 'A', '5/10'),
(260, 'B', '5/10'),
(260, 'C', '1/2'),
(260, 'D', '1/4');

-- Topic: Probability, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(261, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 5 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '6/11', 'Probability = Favorable / Total = 6/11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(261, 'A', '6/11'),
(261, 'B', '5/11'),
(261, 'C', '1/2'),
(261, 'D', '1/4');

-- Topic: Probability, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(262, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 8 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '4/12', 'Probability = Favorable / Total = 4/12.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(262, 'A', '4/12'),
(262, 'B', '8/12'),
(262, 'C', '1/2'),
(262, 'D', '1/4');

-- Topic: Probability, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(263, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 8 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '5/13', 'Probability = Favorable / Total = 5/13.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(263, 'A', '5/13'),
(263, 'B', '8/13'),
(263, 'C', '1/2'),
(263, 'D', '1/4');

-- Topic: Probability, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(264, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 8 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '6/14', 'Probability = Favorable / Total = 6/14.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(264, 'A', '6/14'),
(264, 'B', '8/14'),
(264, 'C', '1/2'),
(264, 'D', '1/4');

-- Topic: Probability, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(265, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 6 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '4/10', 'Probability = Favorable / Total = 4/10.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(265, 'A', '4/10'),
(265, 'B', '6/10'),
(265, 'C', '1/2'),
(265, 'D', '1/4');

-- Topic: Probability, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(266, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 6 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '5/11', 'Probability = Favorable / Total = 5/11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(266, 'A', '5/11'),
(266, 'B', '6/11'),
(266, 'C', '1/2'),
(266, 'D', '1/4');

-- Topic: Probability, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(267, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 6 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '6/12', 'Probability = Favorable / Total = 6/12.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(267, 'A', '6/12'),
(267, 'B', '6/12'),
(267, 'C', '1/2'),
(267, 'D', '1/4');

-- Topic: Probability, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(268, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 9 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'medium', 'A', '4/13', 'Probability = Favorable / Total = 4/13.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(268, 'A', '4/13'),
(268, 'B', '9/13'),
(268, 'C', '1/2'),
(268, 'D', '1/4');

-- Topic: Probability, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(269, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 9 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '5/14', 'Probability = Favorable / Total = 5/14.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(269, 'A', '5/14'),
(269, 'B', '9/14'),
(269, 'C', '1/2'),
(269, 'D', '1/4');

-- Topic: Probability, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(270, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 4 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '6/10', 'Probability = Favorable / Total = 6/10.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(270, 'A', '6/10'),
(270, 'B', '4/10'),
(270, 'C', '1/2'),
(270, 'D', '1/4');

-- Topic: Probability, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(271, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 7 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '4/11', 'Probability = Favorable / Total = 4/11.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(271, 'A', '4/11'),
(271, 'B', '7/11'),
(271, 'C', '1/2'),
(271, 'D', '1/4');

-- Topic: Probability, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(272, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 7 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '5/12', 'Probability = Favorable / Total = 5/12.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(272, 'A', '5/12'),
(272, 'B', '7/12'),
(272, 'C', '1/2'),
(272, 'D', '1/4');

-- Topic: Probability, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(273, 1, 11, 'Simple Probability of Events', 'A bag contains 6 red balls and 7 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '6/13', 'Probability = Favorable / Total = 6/13.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(273, 'A', '6/13'),
(273, 'B', '7/13'),
(273, 'C', '1/2'),
(273, 'D', '1/4');

-- Topic: Probability, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(274, 1, 11, 'Simple Probability of Events', 'A bag contains 4 red balls and 10 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '4/14', 'Probability = Favorable / Total = 4/14.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(274, 'A', '4/14'),
(274, 'B', '10/14'),
(274, 'C', '1/2'),
(274, 'D', '1/4');

-- Topic: Probability, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(275, 1, 11, 'Simple Probability of Events', 'A bag contains 5 red balls and 5 blue balls. If a ball is drawn at random, what is the probability that it is red?', 'hard', 'A', '5/10', 'Probability = Favorable / Total = 5/10.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(275, 'A', '5/10'),
(275, 'B', '5/10'),
(275, 'C', '1/2'),
(275, 'D', '1/4');

-- Topic: Geometry & Mensuration, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(276, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'easy', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(276, 'A', '565 sq cm'),
(276, 'B', '645 sq cm'),
(276, 'C', '615 sq cm'),
(276, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(277, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'easy', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(277, 'A', '1335 sq cm'),
(277, 'B', '1415 sq cm'),
(277, 'C', '1385 sq cm'),
(277, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(278, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'easy', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(278, 'A', '103 sq cm'),
(278, 'B', '183 sq cm'),
(278, 'C', '153 sq cm'),
(278, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(279, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'easy', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(279, 'A', '565 sq cm'),
(279, 'B', '645 sq cm'),
(279, 'C', '615 sq cm'),
(279, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(280, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'easy', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(280, 'A', '1335 sq cm'),
(280, 'B', '1415 sq cm'),
(280, 'C', '1385 sq cm'),
(280, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(281, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'easy', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(281, 'A', '103 sq cm'),
(281, 'B', '183 sq cm'),
(281, 'C', '153 sq cm'),
(281, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(282, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'easy', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(282, 'A', '565 sq cm'),
(282, 'B', '645 sq cm'),
(282, 'C', '615 sq cm'),
(282, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(283, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'easy', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(283, 'A', '1335 sq cm'),
(283, 'B', '1415 sq cm'),
(283, 'C', '1385 sq cm'),
(283, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(284, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'medium', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(284, 'A', '103 sq cm'),
(284, 'B', '183 sq cm'),
(284, 'C', '153 sq cm'),
(284, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(285, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'medium', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(285, 'A', '565 sq cm'),
(285, 'B', '645 sq cm'),
(285, 'C', '615 sq cm'),
(285, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(286, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'medium', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(286, 'A', '1335 sq cm'),
(286, 'B', '1415 sq cm'),
(286, 'C', '1385 sq cm'),
(286, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(287, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'medium', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(287, 'A', '103 sq cm'),
(287, 'B', '183 sq cm'),
(287, 'C', '153 sq cm'),
(287, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(288, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'medium', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(288, 'A', '565 sq cm'),
(288, 'B', '645 sq cm'),
(288, 'C', '615 sq cm'),
(288, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(289, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'medium', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(289, 'A', '1335 sq cm'),
(289, 'B', '1415 sq cm'),
(289, 'C', '1385 sq cm'),
(289, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(290, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'medium', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(290, 'A', '103 sq cm'),
(290, 'B', '183 sq cm'),
(290, 'C', '153 sq cm'),
(290, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(291, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'medium', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(291, 'A', '565 sq cm'),
(291, 'B', '645 sq cm'),
(291, 'C', '615 sq cm'),
(291, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(292, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'medium', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(292, 'A', '1335 sq cm'),
(292, 'B', '1415 sq cm'),
(292, 'C', '1385 sq cm'),
(292, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(293, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'medium', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(293, 'A', '103 sq cm'),
(293, 'B', '183 sq cm'),
(293, 'C', '153 sq cm'),
(293, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(294, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'hard', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(294, 'A', '565 sq cm'),
(294, 'B', '645 sq cm'),
(294, 'C', '615 sq cm'),
(294, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(295, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'hard', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(295, 'A', '1335 sq cm'),
(295, 'B', '1415 sq cm'),
(295, 'C', '1385 sq cm'),
(295, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(296, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'hard', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(296, 'A', '103 sq cm'),
(296, 'B', '183 sq cm'),
(296, 'C', '153 sq cm'),
(296, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(297, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'hard', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(297, 'A', '565 sq cm'),
(297, 'B', '645 sq cm'),
(297, 'C', '615 sq cm'),
(297, 'D', '922 sq cm');

-- Topic: Geometry & Mensuration, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(298, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 21 cm. (Use pi = 3.14)', 'hard', 'C', '1385 sq cm', 'Area = pi * r^2 = 3.14 * 21 * 21 = approx 1385 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(298, 'A', '1335 sq cm'),
(298, 'B', '1415 sq cm'),
(298, 'C', '1385 sq cm'),
(298, 'D', '2078 sq cm');

-- Topic: Geometry & Mensuration, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(299, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 7 cm. (Use pi = 3.14)', 'hard', 'C', '153 sq cm', 'Area = pi * r^2 = 3.14 * 7 * 7 = approx 153 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(299, 'A', '103 sq cm'),
(299, 'B', '183 sq cm'),
(299, 'C', '153 sq cm'),
(299, 'D', '230 sq cm');

-- Topic: Geometry & Mensuration, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(300, 1, 12, 'Area of Circle', 'Find the approximate area of a circle with a radius of 14 cm. (Use pi = 3.14)', 'hard', 'C', '615 sq cm', 'Area = pi * r^2 = 3.14 * 14 * 14 = approx 615 sq cm.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(300, 'A', '565 sq cm'),
(300, 'B', '645 sq cm'),
(300, 'C', '615 sq cm'),
(300, 'D', '922 sq cm');

-- Topic: Blood Relations, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(301, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 1)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(301, 'A', 'Brother'),
(301, 'B', 'Father'),
(301, 'C', 'Husband'),
(301, 'D', 'Cousin');

-- Topic: Blood Relations, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(302, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 2)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(302, 'A', 'Brother'),
(302, 'B', 'Father'),
(302, 'C', 'Husband'),
(302, 'D', 'Cousin');

-- Topic: Blood Relations, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(303, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 3)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(303, 'A', 'Brother'),
(303, 'B', 'Father'),
(303, 'C', 'Husband'),
(303, 'D', 'Cousin');

-- Topic: Blood Relations, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(304, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 4)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(304, 'A', 'Brother'),
(304, 'B', 'Father'),
(304, 'C', 'Husband'),
(304, 'D', 'Cousin');

-- Topic: Blood Relations, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(305, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 5)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(305, 'A', 'Brother'),
(305, 'B', 'Father'),
(305, 'C', 'Husband'),
(305, 'D', 'Cousin');

-- Topic: Blood Relations, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(306, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 6)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(306, 'A', 'Brother'),
(306, 'B', 'Father'),
(306, 'C', 'Husband'),
(306, 'D', 'Cousin');

-- Topic: Blood Relations, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(307, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 7)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(307, 'A', 'Brother'),
(307, 'B', 'Father'),
(307, 'C', 'Husband'),
(307, 'D', 'Cousin');

-- Topic: Blood Relations, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(308, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 8)', 'easy', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(308, 'A', 'Brother'),
(308, 'B', 'Father'),
(308, 'C', 'Husband'),
(308, 'D', 'Cousin');

-- Topic: Blood Relations, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(309, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 9)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(309, 'A', 'Brother'),
(309, 'B', 'Father'),
(309, 'C', 'Husband'),
(309, 'D', 'Cousin');

-- Topic: Blood Relations, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(310, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 10)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(310, 'A', 'Brother'),
(310, 'B', 'Father'),
(310, 'C', 'Husband'),
(310, 'D', 'Cousin');

-- Topic: Blood Relations, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(311, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 11)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(311, 'A', 'Brother'),
(311, 'B', 'Father'),
(311, 'C', 'Husband'),
(311, 'D', 'Cousin');

-- Topic: Blood Relations, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(312, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 12)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(312, 'A', 'Brother'),
(312, 'B', 'Father'),
(312, 'C', 'Husband'),
(312, 'D', 'Cousin');

-- Topic: Blood Relations, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(313, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 13)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(313, 'A', 'Brother'),
(313, 'B', 'Father'),
(313, 'C', 'Husband'),
(313, 'D', 'Cousin');

-- Topic: Blood Relations, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(314, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 14)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(314, 'A', 'Brother'),
(314, 'B', 'Father'),
(314, 'C', 'Husband'),
(314, 'D', 'Cousin');

-- Topic: Blood Relations, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(315, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 15)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(315, 'A', 'Brother'),
(315, 'B', 'Father'),
(315, 'C', 'Husband'),
(315, 'D', 'Cousin');

-- Topic: Blood Relations, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(316, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 16)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(316, 'A', 'Brother'),
(316, 'B', 'Father'),
(316, 'C', 'Husband'),
(316, 'D', 'Cousin');

-- Topic: Blood Relations, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(317, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 17)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(317, 'A', 'Brother'),
(317, 'B', 'Father'),
(317, 'C', 'Husband'),
(317, 'D', 'Cousin');

-- Topic: Blood Relations, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(318, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 18)', 'medium', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(318, 'A', 'Brother'),
(318, 'B', 'Father'),
(318, 'C', 'Husband'),
(318, 'D', 'Cousin');

-- Topic: Blood Relations, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(319, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 19)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(319, 'A', 'Brother'),
(319, 'B', 'Father'),
(319, 'C', 'Husband'),
(319, 'D', 'Cousin');

-- Topic: Blood Relations, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(320, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 20)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(320, 'A', 'Brother'),
(320, 'B', 'Father'),
(320, 'C', 'Husband'),
(320, 'D', 'Cousin');

-- Topic: Blood Relations, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(321, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 21)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(321, 'A', 'Brother'),
(321, 'B', 'Father'),
(321, 'C', 'Husband'),
(321, 'D', 'Cousin');

-- Topic: Blood Relations, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(322, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 22)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(322, 'A', 'Brother'),
(322, 'B', 'Father'),
(322, 'C', 'Husband'),
(322, 'D', 'Cousin');

-- Topic: Blood Relations, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(323, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 23)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(323, 'A', 'Brother'),
(323, 'B', 'Father'),
(323, 'C', 'Husband'),
(323, 'D', 'Cousin');

-- Topic: Blood Relations, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(324, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 24)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(324, 'A', 'Brother'),
(324, 'B', 'Father'),
(324, 'C', 'Husband'),
(324, 'D', 'Cousin');

-- Topic: Blood Relations, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(325, 2, 13, 'Family Tree Deduction', 'Pointing to a man, a woman says: ''He is the only son of my mother''s husband.'' How is the man related to the woman? (Scenario 25)', 'hard', 'A', 'Brother', 'Mother''s husband is the woman''s father. His only son is the woman''s brother.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(325, 'A', 'Brother'),
(325, 'B', 'Father'),
(325, 'C', 'Husband'),
(325, 'D', 'Cousin');

-- Topic: Seating Arrangement, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(326, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 1)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(326, 'A', 'A'),
(326, 'B', 'B'),
(326, 'C', 'C'),
(326, 'D', 'D');

-- Topic: Seating Arrangement, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(327, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 2)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(327, 'A', 'A'),
(327, 'B', 'B'),
(327, 'C', 'C'),
(327, 'D', 'D');

-- Topic: Seating Arrangement, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(328, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 3)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(328, 'A', 'A'),
(328, 'B', 'B'),
(328, 'C', 'C'),
(328, 'D', 'D');

-- Topic: Seating Arrangement, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(329, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 4)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(329, 'A', 'A'),
(329, 'B', 'B'),
(329, 'C', 'C'),
(329, 'D', 'D');

-- Topic: Seating Arrangement, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(330, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 5)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(330, 'A', 'A'),
(330, 'B', 'B'),
(330, 'C', 'C'),
(330, 'D', 'D');

-- Topic: Seating Arrangement, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(331, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 6)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(331, 'A', 'A'),
(331, 'B', 'B'),
(331, 'C', 'C'),
(331, 'D', 'D');

-- Topic: Seating Arrangement, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(332, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 7)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(332, 'A', 'A'),
(332, 'B', 'B'),
(332, 'C', 'C'),
(332, 'D', 'D');

-- Topic: Seating Arrangement, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(333, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 8)', 'easy', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(333, 'A', 'A'),
(333, 'B', 'B'),
(333, 'C', 'C'),
(333, 'D', 'D');

-- Topic: Seating Arrangement, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(334, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 9)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(334, 'A', 'A'),
(334, 'B', 'B'),
(334, 'C', 'C'),
(334, 'D', 'D');

-- Topic: Seating Arrangement, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(335, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 10)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(335, 'A', 'A'),
(335, 'B', 'B'),
(335, 'C', 'C'),
(335, 'D', 'D');

-- Topic: Seating Arrangement, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(336, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 11)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(336, 'A', 'A'),
(336, 'B', 'B'),
(336, 'C', 'C'),
(336, 'D', 'D');

-- Topic: Seating Arrangement, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(337, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 12)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(337, 'A', 'A'),
(337, 'B', 'B'),
(337, 'C', 'C'),
(337, 'D', 'D');

-- Topic: Seating Arrangement, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(338, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 13)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(338, 'A', 'A'),
(338, 'B', 'B'),
(338, 'C', 'C'),
(338, 'D', 'D');

-- Topic: Seating Arrangement, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(339, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 14)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(339, 'A', 'A'),
(339, 'B', 'B'),
(339, 'C', 'C'),
(339, 'D', 'D');

-- Topic: Seating Arrangement, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(340, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 15)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(340, 'A', 'A'),
(340, 'B', 'B'),
(340, 'C', 'C'),
(340, 'D', 'D');

-- Topic: Seating Arrangement, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(341, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 16)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(341, 'A', 'A'),
(341, 'B', 'B'),
(341, 'C', 'C'),
(341, 'D', 'D');

-- Topic: Seating Arrangement, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(342, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 17)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(342, 'A', 'A'),
(342, 'B', 'B'),
(342, 'C', 'C'),
(342, 'D', 'D');

-- Topic: Seating Arrangement, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(343, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 18)', 'medium', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(343, 'A', 'A'),
(343, 'B', 'B'),
(343, 'C', 'C'),
(343, 'D', 'D');

-- Topic: Seating Arrangement, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(344, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 19)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(344, 'A', 'A'),
(344, 'B', 'B'),
(344, 'C', 'C'),
(344, 'D', 'D');

-- Topic: Seating Arrangement, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(345, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 20)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(345, 'A', 'A'),
(345, 'B', 'B'),
(345, 'C', 'C'),
(345, 'D', 'D');

-- Topic: Seating Arrangement, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(346, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 21)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(346, 'A', 'A'),
(346, 'B', 'B'),
(346, 'C', 'C'),
(346, 'D', 'D');

-- Topic: Seating Arrangement, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(347, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 22)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(347, 'A', 'A'),
(347, 'B', 'B'),
(347, 'C', 'C'),
(347, 'D', 'D');

-- Topic: Seating Arrangement, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(348, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 23)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(348, 'A', 'A'),
(348, 'B', 'B'),
(348, 'C', 'C'),
(348, 'D', 'D');

-- Topic: Seating Arrangement, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(349, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 24)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(349, 'A', 'A'),
(349, 'B', 'B'),
(349, 'C', 'C'),
(349, 'D', 'D');

-- Topic: Seating Arrangement, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(350, 2, 14, 'Linear Sitting Order', 'Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case 25)', 'hard', 'B', 'B', 'Placing them in sequence shows B occupies the middle seat.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(350, 'A', 'A'),
(350, 'B', 'B'),
(350, 'C', 'C'),
(350, 'D', 'D');

-- Topic: Syllogisms, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(351, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 1)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(351, 'A', 'All cats are birds'),
(351, 'B', 'All birds are cats'),
(351, 'C', 'Some dogs are not cats'),
(351, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(352, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 2)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(352, 'A', 'All cats are birds'),
(352, 'B', 'All birds are cats'),
(352, 'C', 'Some dogs are not cats'),
(352, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(353, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 3)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(353, 'A', 'All cats are birds'),
(353, 'B', 'All birds are cats'),
(353, 'C', 'Some dogs are not cats'),
(353, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(354, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 4)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(354, 'A', 'All cats are birds'),
(354, 'B', 'All birds are cats'),
(354, 'C', 'Some dogs are not cats'),
(354, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(355, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 5)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(355, 'A', 'All cats are birds'),
(355, 'B', 'All birds are cats'),
(355, 'C', 'Some dogs are not cats'),
(355, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(356, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 6)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(356, 'A', 'All cats are birds'),
(356, 'B', 'All birds are cats'),
(356, 'C', 'Some dogs are not cats'),
(356, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(357, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 7)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(357, 'A', 'All cats are birds'),
(357, 'B', 'All birds are cats'),
(357, 'C', 'Some dogs are not cats'),
(357, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(358, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 8)', 'easy', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(358, 'A', 'All cats are birds'),
(358, 'B', 'All birds are cats'),
(358, 'C', 'Some dogs are not cats'),
(358, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(359, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 9)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(359, 'A', 'All cats are birds'),
(359, 'B', 'All birds are cats'),
(359, 'C', 'Some dogs are not cats'),
(359, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(360, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 10)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(360, 'A', 'All cats are birds'),
(360, 'B', 'All birds are cats'),
(360, 'C', 'Some dogs are not cats'),
(360, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(361, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 11)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(361, 'A', 'All cats are birds'),
(361, 'B', 'All birds are cats'),
(361, 'C', 'Some dogs are not cats'),
(361, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(362, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 12)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(362, 'A', 'All cats are birds'),
(362, 'B', 'All birds are cats'),
(362, 'C', 'Some dogs are not cats'),
(362, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(363, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 13)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(363, 'A', 'All cats are birds'),
(363, 'B', 'All birds are cats'),
(363, 'C', 'Some dogs are not cats'),
(363, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(364, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 14)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(364, 'A', 'All cats are birds'),
(364, 'B', 'All birds are cats'),
(364, 'C', 'Some dogs are not cats'),
(364, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(365, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 15)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(365, 'A', 'All cats are birds'),
(365, 'B', 'All birds are cats'),
(365, 'C', 'Some dogs are not cats'),
(365, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(366, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 16)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(366, 'A', 'All cats are birds'),
(366, 'B', 'All birds are cats'),
(366, 'C', 'Some dogs are not cats'),
(366, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(367, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 17)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(367, 'A', 'All cats are birds'),
(367, 'B', 'All birds are cats'),
(367, 'C', 'Some dogs are not cats'),
(367, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(368, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 18)', 'medium', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(368, 'A', 'All cats are birds'),
(368, 'B', 'All birds are cats'),
(368, 'C', 'Some dogs are not cats'),
(368, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(369, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 19)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(369, 'A', 'All cats are birds'),
(369, 'B', 'All birds are cats'),
(369, 'C', 'Some dogs are not cats'),
(369, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(370, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 20)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(370, 'A', 'All cats are birds'),
(370, 'B', 'All birds are cats'),
(370, 'C', 'Some dogs are not cats'),
(370, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(371, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 21)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(371, 'A', 'All cats are birds'),
(371, 'B', 'All birds are cats'),
(371, 'C', 'Some dogs are not cats'),
(371, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(372, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 22)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(372, 'A', 'All cats are birds'),
(372, 'B', 'All birds are cats'),
(372, 'C', 'Some dogs are not cats'),
(372, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(373, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 23)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(373, 'A', 'All cats are birds'),
(373, 'B', 'All birds are cats'),
(373, 'C', 'Some dogs are not cats'),
(373, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(374, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 24)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(374, 'A', 'All cats are birds'),
(374, 'B', 'All birds are cats'),
(374, 'C', 'Some dogs are not cats'),
(374, 'D', 'No birds are dogs');

-- Topic: Syllogisms, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(375, 2, 15, 'Deductive Logics', 'Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise 25)', 'hard', 'A', 'All cats are birds', 'Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(375, 'A', 'All cats are birds'),
(375, 'B', 'All birds are cats'),
(375, 'C', 'Some dogs are not cats'),
(375, 'D', 'No birds are dogs');

-- Topic: Coding-Decoding, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(376, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(376, 'A', 'NBOBP'),
(376, 'B', 'NZOFP'),
(376, 'C', 'NBOPH'),
(376, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(377, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(377, 'A', 'NBOBP'),
(377, 'B', 'NZOFP'),
(377, 'C', 'NBOPH'),
(377, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(378, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(378, 'A', 'NBOBP'),
(378, 'B', 'NZOFP'),
(378, 'C', 'NBOPH'),
(378, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(379, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(379, 'A', 'NBOBP'),
(379, 'B', 'NZOFP'),
(379, 'C', 'NBOPH'),
(379, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(380, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(380, 'A', 'NBOBP'),
(380, 'B', 'NZOFP'),
(380, 'C', 'NBOPH'),
(380, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(381, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(381, 'A', 'NBOBP'),
(381, 'B', 'NZOFP'),
(381, 'C', 'NBOPH'),
(381, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(382, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(382, 'A', 'NBOBP'),
(382, 'B', 'NZOFP'),
(382, 'C', 'NBOPH'),
(382, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(383, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'easy', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(383, 'A', 'NBOBP'),
(383, 'B', 'NZOFP'),
(383, 'C', 'NBOPH'),
(383, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(384, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(384, 'A', 'NBOBP'),
(384, 'B', 'NZOFP'),
(384, 'C', 'NBOPH'),
(384, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(385, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(385, 'A', 'NBOBP'),
(385, 'B', 'NZOFP'),
(385, 'C', 'NBOPH'),
(385, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(386, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(386, 'A', 'NBOBP'),
(386, 'B', 'NZOFP'),
(386, 'C', 'NBOPH'),
(386, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(387, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(387, 'A', 'NBOBP'),
(387, 'B', 'NZOFP'),
(387, 'C', 'NBOPH'),
(387, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(388, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(388, 'A', 'NBOBP'),
(388, 'B', 'NZOFP'),
(388, 'C', 'NBOPH'),
(388, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(389, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(389, 'A', 'NBOBP'),
(389, 'B', 'NZOFP'),
(389, 'C', 'NBOPH'),
(389, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(390, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(390, 'A', 'NBOBP'),
(390, 'B', 'NZOFP'),
(390, 'C', 'NBOPH'),
(390, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(391, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(391, 'A', 'NBOBP'),
(391, 'B', 'NZOFP'),
(391, 'C', 'NBOPH'),
(391, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(392, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(392, 'A', 'NBOBP'),
(392, 'B', 'NZOFP'),
(392, 'C', 'NBOPH'),
(392, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(393, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'medium', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(393, 'A', 'NBOBP'),
(393, 'B', 'NZOFP'),
(393, 'C', 'NBOPH'),
(393, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(394, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(394, 'A', 'NBOBP'),
(394, 'B', 'NZOFP'),
(394, 'C', 'NBOPH'),
(394, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(395, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(395, 'A', 'NBOBP'),
(395, 'B', 'NZOFP'),
(395, 'C', 'NBOPH'),
(395, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(396, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(396, 'A', 'NBOBP'),
(396, 'B', 'NZOFP'),
(396, 'C', 'NBOPH'),
(396, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(397, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(397, 'A', 'NBOBP'),
(397, 'B', 'NZOFP'),
(397, 'C', 'NBOPH'),
(397, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(398, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(398, 'A', 'NBOBP'),
(398, 'B', 'NZOFP'),
(398, 'C', 'NBOPH'),
(398, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(399, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(399, 'A', 'NBOBP'),
(399, 'B', 'NZOFP'),
(399, 'C', 'NBOPH'),
(399, 'D', 'NBOFP');

-- Topic: Coding-Decoding, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(400, 2, 16, 'Pattern Recognition in Strings', 'If in a certain code, ''APPLE'' is written as ''BQQMF'' (+1 shift), how is ''MANGO'' coded?', 'hard', 'D', 'NBOFP', 'Shifting each letter of ''MANGO'' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(400, 'A', 'NBOBP'),
(400, 'B', 'NZOFP'),
(400, 'C', 'NBOPH'),
(400, 'D', 'NBOFP');

-- Topic: Direction Sense, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(401, 2, 17, 'Compass Directions', 'A person walks 6 km North, turns right, and walks 6 km. What is the straight-line distance from the start?', 'easy', 'B', '8 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(6^2 + 6^2) = approx 8 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(401, 'A', '6 km'),
(401, 'B', '8 km'),
(401, 'C', '12 km'),
(401, 'D', '11 km');

-- Topic: Direction Sense, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(402, 2, 17, 'Compass Directions', 'A person walks 7 km North, turns right, and walks 7 km. What is the straight-line distance from the start?', 'easy', 'B', '9 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(7^2 + 7^2) = approx 9 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(402, 'A', '7 km'),
(402, 'B', '9 km'),
(402, 'C', '14 km'),
(402, 'D', '12 km');

-- Topic: Direction Sense, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(403, 2, 17, 'Compass Directions', 'A person walks 8 km North, turns right, and walks 8 km. What is the straight-line distance from the start?', 'easy', 'B', '11 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(8^2 + 8^2) = approx 11 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(403, 'A', '8 km'),
(403, 'B', '11 km'),
(403, 'C', '16 km'),
(403, 'D', '14 km');

-- Topic: Direction Sense, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(404, 2, 17, 'Compass Directions', 'A person walks 9 km North, turns right, and walks 9 km. What is the straight-line distance from the start?', 'easy', 'B', '12 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(9^2 + 9^2) = approx 12 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(404, 'A', '9 km'),
(404, 'B', '12 km'),
(404, 'C', '18 km'),
(404, 'D', '15 km');

-- Topic: Direction Sense, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(405, 2, 17, 'Compass Directions', 'A person walks 10 km North, turns right, and walks 10 km. What is the straight-line distance from the start?', 'easy', 'B', '14 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(10^2 + 10^2) = approx 14 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(405, 'A', '10 km'),
(405, 'B', '14 km'),
(405, 'C', '20 km'),
(405, 'D', '17 km');

-- Topic: Direction Sense, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(406, 2, 17, 'Compass Directions', 'A person walks 11 km North, turns right, and walks 11 km. What is the straight-line distance from the start?', 'easy', 'B', '15 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(11^2 + 11^2) = approx 15 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(406, 'A', '11 km'),
(406, 'B', '15 km'),
(406, 'C', '22 km'),
(406, 'D', '18 km');

-- Topic: Direction Sense, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(407, 2, 17, 'Compass Directions', 'A person walks 12 km North, turns right, and walks 12 km. What is the straight-line distance from the start?', 'easy', 'B', '16 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(12^2 + 12^2) = approx 16 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(407, 'A', '12 km'),
(407, 'B', '16 km'),
(407, 'C', '24 km'),
(407, 'D', '19 km');

-- Topic: Direction Sense, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(408, 2, 17, 'Compass Directions', 'A person walks 13 km North, turns right, and walks 13 km. What is the straight-line distance from the start?', 'easy', 'B', '18 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(13^2 + 13^2) = approx 18 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(408, 'A', '13 km'),
(408, 'B', '18 km'),
(408, 'C', '26 km'),
(408, 'D', '21 km');

-- Topic: Direction Sense, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(409, 2, 17, 'Compass Directions', 'A person walks 14 km North, turns right, and walks 14 km. What is the straight-line distance from the start?', 'medium', 'B', '19 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(14^2 + 14^2) = approx 19 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(409, 'A', '14 km'),
(409, 'B', '19 km'),
(409, 'C', '28 km'),
(409, 'D', '22 km');

-- Topic: Direction Sense, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(410, 2, 17, 'Compass Directions', 'A person walks 15 km North, turns right, and walks 15 km. What is the straight-line distance from the start?', 'medium', 'B', '21 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(15^2 + 15^2) = approx 21 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(410, 'A', '15 km'),
(410, 'B', '21 km'),
(410, 'C', '30 km'),
(410, 'D', '24 km');

-- Topic: Direction Sense, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(411, 2, 17, 'Compass Directions', 'A person walks 16 km North, turns right, and walks 16 km. What is the straight-line distance from the start?', 'medium', 'B', '22 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(16^2 + 16^2) = approx 22 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(411, 'A', '16 km'),
(411, 'B', '22 km'),
(411, 'C', '32 km'),
(411, 'D', '25 km');

-- Topic: Direction Sense, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(412, 2, 17, 'Compass Directions', 'A person walks 17 km North, turns right, and walks 17 km. What is the straight-line distance from the start?', 'medium', 'B', '24 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(17^2 + 17^2) = approx 24 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(412, 'A', '17 km'),
(412, 'B', '24 km'),
(412, 'C', '34 km'),
(412, 'D', '27 km');

-- Topic: Direction Sense, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(413, 2, 17, 'Compass Directions', 'A person walks 18 km North, turns right, and walks 18 km. What is the straight-line distance from the start?', 'medium', 'B', '25 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(18^2 + 18^2) = approx 25 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(413, 'A', '18 km'),
(413, 'B', '25 km'),
(413, 'C', '36 km'),
(413, 'D', '28 km');

-- Topic: Direction Sense, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(414, 2, 17, 'Compass Directions', 'A person walks 19 km North, turns right, and walks 19 km. What is the straight-line distance from the start?', 'medium', 'B', '26 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(19^2 + 19^2) = approx 26 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(414, 'A', '19 km'),
(414, 'B', '26 km'),
(414, 'C', '38 km'),
(414, 'D', '29 km');

-- Topic: Direction Sense, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(415, 2, 17, 'Compass Directions', 'A person walks 20 km North, turns right, and walks 20 km. What is the straight-line distance from the start?', 'medium', 'B', '28 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(20^2 + 20^2) = approx 28 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(415, 'A', '20 km'),
(415, 'B', '28 km'),
(415, 'C', '40 km'),
(415, 'D', '31 km');

-- Topic: Direction Sense, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(416, 2, 17, 'Compass Directions', 'A person walks 21 km North, turns right, and walks 21 km. What is the straight-line distance from the start?', 'medium', 'B', '29 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(21^2 + 21^2) = approx 29 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(416, 'A', '21 km'),
(416, 'B', '29 km'),
(416, 'C', '42 km'),
(416, 'D', '32 km');

-- Topic: Direction Sense, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(417, 2, 17, 'Compass Directions', 'A person walks 22 km North, turns right, and walks 22 km. What is the straight-line distance from the start?', 'medium', 'B', '31 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(22^2 + 22^2) = approx 31 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(417, 'A', '22 km'),
(417, 'B', '31 km'),
(417, 'C', '44 km'),
(417, 'D', '34 km');

-- Topic: Direction Sense, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(418, 2, 17, 'Compass Directions', 'A person walks 23 km North, turns right, and walks 23 km. What is the straight-line distance from the start?', 'medium', 'B', '32 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(23^2 + 23^2) = approx 32 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(418, 'A', '23 km'),
(418, 'B', '32 km'),
(418, 'C', '46 km'),
(418, 'D', '35 km');

-- Topic: Direction Sense, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(419, 2, 17, 'Compass Directions', 'A person walks 24 km North, turns right, and walks 24 km. What is the straight-line distance from the start?', 'hard', 'B', '33 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(24^2 + 24^2) = approx 33 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(419, 'A', '24 km'),
(419, 'B', '33 km'),
(419, 'C', '48 km'),
(419, 'D', '36 km');

-- Topic: Direction Sense, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(420, 2, 17, 'Compass Directions', 'A person walks 25 km North, turns right, and walks 25 km. What is the straight-line distance from the start?', 'hard', 'B', '35 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(25^2 + 25^2) = approx 35 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(420, 'A', '25 km'),
(420, 'B', '35 km'),
(420, 'C', '50 km'),
(420, 'D', '38 km');

-- Topic: Direction Sense, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(421, 2, 17, 'Compass Directions', 'A person walks 26 km North, turns right, and walks 26 km. What is the straight-line distance from the start?', 'hard', 'B', '36 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(26^2 + 26^2) = approx 36 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(421, 'A', '26 km'),
(421, 'B', '36 km'),
(421, 'C', '52 km'),
(421, 'D', '39 km');

-- Topic: Direction Sense, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(422, 2, 17, 'Compass Directions', 'A person walks 27 km North, turns right, and walks 27 km. What is the straight-line distance from the start?', 'hard', 'B', '38 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(27^2 + 27^2) = approx 38 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(422, 'A', '27 km'),
(422, 'B', '38 km'),
(422, 'C', '54 km'),
(422, 'D', '41 km');

-- Topic: Direction Sense, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(423, 2, 17, 'Compass Directions', 'A person walks 28 km North, turns right, and walks 28 km. What is the straight-line distance from the start?', 'hard', 'B', '39 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(28^2 + 28^2) = approx 39 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(423, 'A', '28 km'),
(423, 'B', '39 km'),
(423, 'C', '56 km'),
(423, 'D', '42 km');

-- Topic: Direction Sense, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(424, 2, 17, 'Compass Directions', 'A person walks 29 km North, turns right, and walks 29 km. What is the straight-line distance from the start?', 'hard', 'B', '41 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(29^2 + 29^2) = approx 41 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(424, 'A', '29 km'),
(424, 'B', '41 km'),
(424, 'C', '58 km'),
(424, 'D', '44 km');

-- Topic: Direction Sense, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(425, 2, 17, 'Compass Directions', 'A person walks 30 km North, turns right, and walks 30 km. What is the straight-line distance from the start?', 'hard', 'B', '42 km', 'Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt(30^2 + 30^2) = approx 42 km.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(425, 'A', '30 km'),
(425, 'B', '42 km'),
(425, 'C', '60 km'),
(425, 'D', '45 km');

-- Topic: Number Series, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(426, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 2, 6, 10, ____?', 'easy', 'B', '14', 'The common difference is 4. The next term is 10 + 4 = 14.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(426, 'A', '16'),
(426, 'B', '14'),
(426, 'C', '11'),
(426, 'D', '17');

-- Topic: Number Series, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(427, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 4, 9, 14, ____?', 'easy', 'B', '19', 'The common difference is 5. The next term is 14 + 5 = 19.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(427, 'A', '21'),
(427, 'B', '19'),
(427, 'C', '16'),
(427, 'D', '23');

-- Topic: Number Series, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(428, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 6, 9, 12, ____?', 'easy', 'B', '15', 'The common difference is 3. The next term is 12 + 3 = 15.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(428, 'A', '17'),
(428, 'B', '15'),
(428, 'C', '12'),
(428, 'D', '18');

-- Topic: Number Series, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(429, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 8, 12, 16, ____?', 'easy', 'B', '20', 'The common difference is 4. The next term is 16 + 4 = 20.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(429, 'A', '22'),
(429, 'B', '20'),
(429, 'C', '17'),
(429, 'D', '24');

-- Topic: Number Series, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(430, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 10, 15, 20, ____?', 'easy', 'B', '25', 'The common difference is 5. The next term is 20 + 5 = 25.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(430, 'A', '27'),
(430, 'B', '25'),
(430, 'C', '22'),
(430, 'D', '30');

-- Topic: Number Series, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(431, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 12, 15, 18, ____?', 'easy', 'B', '21', 'The common difference is 3. The next term is 18 + 3 = 21.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(431, 'A', '23'),
(431, 'B', '21'),
(431, 'C', '18'),
(431, 'D', '25');

-- Topic: Number Series, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(432, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 14, 18, 22, ____?', 'easy', 'B', '26', 'The common difference is 4. The next term is 22 + 4 = 26.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(432, 'A', '28'),
(432, 'B', '26'),
(432, 'C', '23'),
(432, 'D', '31');

-- Topic: Number Series, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(433, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 16, 21, 26, ____?', 'easy', 'B', '31', 'The common difference is 5. The next term is 26 + 5 = 31.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(433, 'A', '33'),
(433, 'B', '31'),
(433, 'C', '28'),
(433, 'D', '37');

-- Topic: Number Series, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(434, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 18, 21, 24, ____?', 'medium', 'B', '27', 'The common difference is 3. The next term is 24 + 3 = 27.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(434, 'A', '29'),
(434, 'B', '27'),
(434, 'C', '24'),
(434, 'D', '32');

-- Topic: Number Series, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(435, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 20, 24, 28, ____?', 'medium', 'B', '32', 'The common difference is 4. The next term is 28 + 4 = 32.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(435, 'A', '34'),
(435, 'B', '32'),
(435, 'C', '29'),
(435, 'D', '38');

-- Topic: Number Series, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(436, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 22, 27, 32, ____?', 'medium', 'B', '37', 'The common difference is 5. The next term is 32 + 5 = 37.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(436, 'A', '39'),
(436, 'B', '37'),
(436, 'C', '34'),
(436, 'D', '44');

-- Topic: Number Series, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(437, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 24, 27, 30, ____?', 'medium', 'B', '33', 'The common difference is 3. The next term is 30 + 3 = 33.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(437, 'A', '35'),
(437, 'B', '33'),
(437, 'C', '30'),
(437, 'D', '40');

-- Topic: Number Series, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(438, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 26, 30, 34, ____?', 'medium', 'B', '38', 'The common difference is 4. The next term is 34 + 4 = 38.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(438, 'A', '40'),
(438, 'B', '38'),
(438, 'C', '35'),
(438, 'D', '46');

-- Topic: Number Series, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(439, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 28, 33, 38, ____?', 'medium', 'B', '43', 'The common difference is 5. The next term is 38 + 5 = 43.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(439, 'A', '45'),
(439, 'B', '43'),
(439, 'C', '40'),
(439, 'D', '52');

-- Topic: Number Series, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(440, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 30, 33, 36, ____?', 'medium', 'B', '39', 'The common difference is 3. The next term is 36 + 3 = 39.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(440, 'A', '41'),
(440, 'B', '39'),
(440, 'C', '36'),
(440, 'D', '47');

-- Topic: Number Series, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(441, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 32, 36, 40, ____?', 'medium', 'B', '44', 'The common difference is 4. The next term is 40 + 4 = 44.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(441, 'A', '46'),
(441, 'B', '44'),
(441, 'C', '41'),
(441, 'D', '53');

-- Topic: Number Series, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(442, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 34, 39, 44, ____?', 'medium', 'B', '49', 'The common difference is 5. The next term is 44 + 5 = 49.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(442, 'A', '51'),
(442, 'B', '49'),
(442, 'C', '46'),
(442, 'D', '59');

-- Topic: Number Series, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(443, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 36, 39, 42, ____?', 'medium', 'B', '45', 'The common difference is 3. The next term is 42 + 3 = 45.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(443, 'A', '47'),
(443, 'B', '45'),
(443, 'C', '42'),
(443, 'D', '54');

-- Topic: Number Series, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(444, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 38, 42, 46, ____?', 'hard', 'B', '50', 'The common difference is 4. The next term is 46 + 4 = 50.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(444, 'A', '52'),
(444, 'B', '50'),
(444, 'C', '47'),
(444, 'D', '60');

-- Topic: Number Series, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(445, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 40, 45, 50, ____?', 'hard', 'B', '55', 'The common difference is 5. The next term is 50 + 5 = 55.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(445, 'A', '57'),
(445, 'B', '55'),
(445, 'C', '52'),
(445, 'D', '66');

-- Topic: Number Series, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(446, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 42, 45, 48, ____?', 'hard', 'B', '51', 'The common difference is 3. The next term is 48 + 3 = 51.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(446, 'A', '53'),
(446, 'B', '51'),
(446, 'C', '48'),
(446, 'D', '61');

-- Topic: Number Series, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(447, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 44, 48, 52, ____?', 'hard', 'B', '56', 'The common difference is 4. The next term is 52 + 4 = 56.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(447, 'A', '58'),
(447, 'B', '56'),
(447, 'C', '53'),
(447, 'D', '67');

-- Topic: Number Series, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(448, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 46, 51, 56, ____?', 'hard', 'B', '61', 'The common difference is 5. The next term is 56 + 5 = 61.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(448, 'A', '63'),
(448, 'B', '61'),
(448, 'C', '58'),
(448, 'D', '73');

-- Topic: Number Series, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(449, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 48, 51, 54, ____?', 'hard', 'B', '57', 'The common difference is 3. The next term is 54 + 3 = 57.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(449, 'A', '59'),
(449, 'B', '57'),
(449, 'C', '54'),
(449, 'D', '68');

-- Topic: Number Series, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(450, 2, 18, 'Finding the Next Term', 'Find the next term in the arithmetic progression: 50, 54, 58, ____?', 'hard', 'B', '62', 'The common difference is 4. The next term is 58 + 4 = 62.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(450, 'A', '64'),
(450, 'B', '62'),
(450, 'C', '59'),
(450, 'D', '74');

-- Topic: Analogies, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(451, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 1)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(451, 'A', 'School'),
(451, 'B', 'Office'),
(451, 'C', 'Field'),
(451, 'D', 'Shop');

-- Topic: Analogies, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(452, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 2)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(452, 'A', 'School'),
(452, 'B', 'Office'),
(452, 'C', 'Field'),
(452, 'D', 'Shop');

-- Topic: Analogies, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(453, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 3)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(453, 'A', 'School'),
(453, 'B', 'Office'),
(453, 'C', 'Field'),
(453, 'D', 'Shop');

-- Topic: Analogies, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(454, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 4)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(454, 'A', 'School'),
(454, 'B', 'Office'),
(454, 'C', 'Field'),
(454, 'D', 'Shop');

-- Topic: Analogies, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(455, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 5)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(455, 'A', 'School'),
(455, 'B', 'Office'),
(455, 'C', 'Field'),
(455, 'D', 'Shop');

-- Topic: Analogies, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(456, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 6)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(456, 'A', 'School'),
(456, 'B', 'Office'),
(456, 'C', 'Field'),
(456, 'D', 'Shop');

-- Topic: Analogies, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(457, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 7)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(457, 'A', 'School'),
(457, 'B', 'Office'),
(457, 'C', 'Field'),
(457, 'D', 'Shop');

-- Topic: Analogies, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(458, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 8)', 'easy', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(458, 'A', 'School'),
(458, 'B', 'Office'),
(458, 'C', 'Field'),
(458, 'D', 'Shop');

-- Topic: Analogies, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(459, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 9)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(459, 'A', 'School'),
(459, 'B', 'Office'),
(459, 'C', 'Field'),
(459, 'D', 'Shop');

-- Topic: Analogies, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(460, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 10)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(460, 'A', 'School'),
(460, 'B', 'Office'),
(460, 'C', 'Field'),
(460, 'D', 'Shop');

-- Topic: Analogies, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(461, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 11)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(461, 'A', 'School'),
(461, 'B', 'Office'),
(461, 'C', 'Field'),
(461, 'D', 'Shop');

-- Topic: Analogies, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(462, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 12)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(462, 'A', 'School'),
(462, 'B', 'Office'),
(462, 'C', 'Field'),
(462, 'D', 'Shop');

-- Topic: Analogies, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(463, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 13)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(463, 'A', 'School'),
(463, 'B', 'Office'),
(463, 'C', 'Field'),
(463, 'D', 'Shop');

-- Topic: Analogies, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(464, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 14)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(464, 'A', 'School'),
(464, 'B', 'Office'),
(464, 'C', 'Field'),
(464, 'D', 'Shop');

-- Topic: Analogies, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(465, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 15)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(465, 'A', 'School'),
(465, 'B', 'Office'),
(465, 'C', 'Field'),
(465, 'D', 'Shop');

-- Topic: Analogies, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(466, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 16)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(466, 'A', 'School'),
(466, 'B', 'Office'),
(466, 'C', 'Field'),
(466, 'D', 'Shop');

-- Topic: Analogies, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(467, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 17)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(467, 'A', 'School'),
(467, 'B', 'Office'),
(467, 'C', 'Field'),
(467, 'D', 'Shop');

-- Topic: Analogies, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(468, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 18)', 'medium', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(468, 'A', 'School'),
(468, 'B', 'Office'),
(468, 'C', 'Field'),
(468, 'D', 'Shop');

-- Topic: Analogies, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(469, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 19)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(469, 'A', 'School'),
(469, 'B', 'Office'),
(469, 'C', 'Field'),
(469, 'D', 'Shop');

-- Topic: Analogies, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(470, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 20)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(470, 'A', 'School'),
(470, 'B', 'Office'),
(470, 'C', 'Field'),
(470, 'D', 'Shop');

-- Topic: Analogies, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(471, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 21)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(471, 'A', 'School'),
(471, 'B', 'Office'),
(471, 'C', 'Field'),
(471, 'D', 'Shop');

-- Topic: Analogies, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(472, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 22)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(472, 'A', 'School'),
(472, 'B', 'Office'),
(472, 'C', 'Field'),
(472, 'D', 'Shop');

-- Topic: Analogies, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(473, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 23)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(473, 'A', 'School'),
(473, 'B', 'Office'),
(473, 'C', 'Field'),
(473, 'D', 'Shop');

-- Topic: Analogies, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(474, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 24)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(474, 'A', 'School'),
(474, 'B', 'Office'),
(474, 'C', 'Field'),
(474, 'D', 'Shop');

-- Topic: Analogies, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(475, 2, 19, 'Conceptual Analogies', 'Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item 25)', 'hard', 'A', 'School', 'A doctor works in a hospital; similarly, a teacher works in a school.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(475, 'A', 'School'),
(475, 'B', 'Office'),
(475, 'C', 'Field'),
(475, 'D', 'Shop');

-- Topic: Puzzles, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(476, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 1)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(476, 'A', 'B'),
(476, 'B', 'C'),
(476, 'C', 'D'),
(476, 'D', 'E');

-- Topic: Puzzles, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(477, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 2)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(477, 'A', 'B'),
(477, 'B', 'C'),
(477, 'C', 'D'),
(477, 'D', 'E');

-- Topic: Puzzles, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(478, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 3)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(478, 'A', 'B'),
(478, 'B', 'C'),
(478, 'C', 'D'),
(478, 'D', 'E');

-- Topic: Puzzles, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(479, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 4)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(479, 'A', 'B'),
(479, 'B', 'C'),
(479, 'C', 'D'),
(479, 'D', 'E');

-- Topic: Puzzles, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(480, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 5)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(480, 'A', 'B'),
(480, 'B', 'C'),
(480, 'C', 'D'),
(480, 'D', 'E');

-- Topic: Puzzles, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(481, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 6)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(481, 'A', 'B'),
(481, 'B', 'C'),
(481, 'C', 'D'),
(481, 'D', 'E');

-- Topic: Puzzles, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(482, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 7)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(482, 'A', 'B'),
(482, 'B', 'C'),
(482, 'C', 'D'),
(482, 'D', 'E');

-- Topic: Puzzles, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(483, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 8)', 'easy', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(483, 'A', 'B'),
(483, 'B', 'C'),
(483, 'C', 'D'),
(483, 'D', 'E');

-- Topic: Puzzles, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(484, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 9)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(484, 'A', 'B'),
(484, 'B', 'C'),
(484, 'C', 'D'),
(484, 'D', 'E');

-- Topic: Puzzles, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(485, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 10)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(485, 'A', 'B'),
(485, 'B', 'C'),
(485, 'C', 'D'),
(485, 'D', 'E');

-- Topic: Puzzles, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(486, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 11)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(486, 'A', 'B'),
(486, 'B', 'C'),
(486, 'C', 'D'),
(486, 'D', 'E');

-- Topic: Puzzles, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(487, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 12)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(487, 'A', 'B'),
(487, 'B', 'C'),
(487, 'C', 'D'),
(487, 'D', 'E');

-- Topic: Puzzles, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(488, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 13)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(488, 'A', 'B'),
(488, 'B', 'C'),
(488, 'C', 'D'),
(488, 'D', 'E');

-- Topic: Puzzles, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(489, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 14)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(489, 'A', 'B'),
(489, 'B', 'C'),
(489, 'C', 'D'),
(489, 'D', 'E');

-- Topic: Puzzles, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(490, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 15)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(490, 'A', 'B'),
(490, 'B', 'C'),
(490, 'C', 'D'),
(490, 'D', 'E');

-- Topic: Puzzles, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(491, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 16)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(491, 'A', 'B'),
(491, 'B', 'C'),
(491, 'C', 'D'),
(491, 'D', 'E');

-- Topic: Puzzles, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(492, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 17)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(492, 'A', 'B'),
(492, 'B', 'C'),
(492, 'C', 'D'),
(492, 'D', 'E');

-- Topic: Puzzles, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(493, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 18)', 'medium', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(493, 'A', 'B'),
(493, 'B', 'C'),
(493, 'C', 'D'),
(493, 'D', 'E');

-- Topic: Puzzles, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(494, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 19)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(494, 'A', 'B'),
(494, 'B', 'C'),
(494, 'C', 'D'),
(494, 'D', 'E');

-- Topic: Puzzles, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(495, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 20)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(495, 'A', 'B'),
(495, 'B', 'C'),
(495, 'C', 'D'),
(495, 'D', 'E');

-- Topic: Puzzles, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(496, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 21)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(496, 'A', 'B'),
(496, 'B', 'C'),
(496, 'C', 'D'),
(496, 'D', 'E');

-- Topic: Puzzles, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(497, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 22)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(497, 'A', 'B'),
(497, 'B', 'C'),
(497, 'C', 'D'),
(497, 'D', 'E');

-- Topic: Puzzles, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(498, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 23)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(498, 'A', 'B'),
(498, 'B', 'C'),
(498, 'C', 'D'),
(498, 'D', 'E');

-- Topic: Puzzles, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(499, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 24)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(499, 'A', 'B'),
(499, 'B', 'C'),
(499, 'C', 'D'),
(499, 'D', 'E');

-- Topic: Puzzles, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(500, 2, 20, 'Constraint Logic Puzzle', 'In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle 25)', 'hard', 'B', 'C', 'Sequence of finishing: E > A > B > D > C. Thus, C finished last.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(500, 'A', 'B'),
(500, 'B', 'C'),
(500, 'C', 'D'),
(500, 'D', 'E');

-- Topic: Clocks & Calendars, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(501, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 4:00?', 'easy', 'A', '120.0 degrees', 'Angle = |30*H - 5.5*M| = |30*4 - 0| = 120.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(501, 'A', '120.0 degrees'),
(501, 'B', '130.0 degrees'),
(501, 'C', '105.0 degrees'),
(501, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(502, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 5:00?', 'easy', 'A', '150.0 degrees', 'Angle = |30*H - 5.5*M| = |30*5 - 0| = 150.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(502, 'A', '150.0 degrees'),
(502, 'B', '160.0 degrees'),
(502, 'C', '135.0 degrees'),
(502, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(503, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 6:00?', 'easy', 'A', '180.0 degrees', 'Angle = |30*H - 5.5*M| = |30*6 - 0| = 180.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(503, 'A', '180.0 degrees'),
(503, 'B', '190.0 degrees'),
(503, 'C', '165.0 degrees'),
(503, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(504, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 7:00?', 'easy', 'A', '210.0 degrees', 'Angle = |30*H - 5.5*M| = |30*7 - 0| = 210.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(504, 'A', '210.0 degrees'),
(504, 'B', '220.0 degrees'),
(504, 'C', '195.0 degrees'),
(504, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(505, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 3:00?', 'easy', 'A', '90.0 degrees', 'Angle = |30*H - 5.5*M| = |30*3 - 0| = 90.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(505, 'A', '90.0 degrees'),
(505, 'B', '100.0 degrees'),
(505, 'C', '75.0 degrees'),
(505, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(506, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 4:00?', 'easy', 'A', '120.0 degrees', 'Angle = |30*H - 5.5*M| = |30*4 - 0| = 120.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(506, 'A', '120.0 degrees'),
(506, 'B', '130.0 degrees'),
(506, 'C', '105.0 degrees'),
(506, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(507, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 5:00?', 'easy', 'A', '150.0 degrees', 'Angle = |30*H - 5.5*M| = |30*5 - 0| = 150.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(507, 'A', '150.0 degrees'),
(507, 'B', '160.0 degrees'),
(507, 'C', '135.0 degrees'),
(507, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(508, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 6:00?', 'easy', 'A', '180.0 degrees', 'Angle = |30*H - 5.5*M| = |30*6 - 0| = 180.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(508, 'A', '180.0 degrees'),
(508, 'B', '190.0 degrees'),
(508, 'C', '165.0 degrees'),
(508, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(509, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 7:00?', 'medium', 'A', '210.0 degrees', 'Angle = |30*H - 5.5*M| = |30*7 - 0| = 210.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(509, 'A', '210.0 degrees'),
(509, 'B', '220.0 degrees'),
(509, 'C', '195.0 degrees'),
(509, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(510, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 3:00?', 'medium', 'A', '90.0 degrees', 'Angle = |30*H - 5.5*M| = |30*3 - 0| = 90.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(510, 'A', '90.0 degrees'),
(510, 'B', '100.0 degrees'),
(510, 'C', '75.0 degrees'),
(510, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(511, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 4:00?', 'medium', 'A', '120.0 degrees', 'Angle = |30*H - 5.5*M| = |30*4 - 0| = 120.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(511, 'A', '120.0 degrees'),
(511, 'B', '130.0 degrees'),
(511, 'C', '105.0 degrees'),
(511, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(512, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 5:00?', 'medium', 'A', '150.0 degrees', 'Angle = |30*H - 5.5*M| = |30*5 - 0| = 150.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(512, 'A', '150.0 degrees'),
(512, 'B', '160.0 degrees'),
(512, 'C', '135.0 degrees'),
(512, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(513, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 6:00?', 'medium', 'A', '180.0 degrees', 'Angle = |30*H - 5.5*M| = |30*6 - 0| = 180.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(513, 'A', '180.0 degrees'),
(513, 'B', '190.0 degrees'),
(513, 'C', '165.0 degrees'),
(513, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(514, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 7:00?', 'medium', 'A', '210.0 degrees', 'Angle = |30*H - 5.5*M| = |30*7 - 0| = 210.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(514, 'A', '210.0 degrees'),
(514, 'B', '220.0 degrees'),
(514, 'C', '195.0 degrees'),
(514, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(515, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 3:00?', 'medium', 'A', '90.0 degrees', 'Angle = |30*H - 5.5*M| = |30*3 - 0| = 90.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(515, 'A', '90.0 degrees'),
(515, 'B', '100.0 degrees'),
(515, 'C', '75.0 degrees'),
(515, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(516, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 4:00?', 'medium', 'A', '120.0 degrees', 'Angle = |30*H - 5.5*M| = |30*4 - 0| = 120.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(516, 'A', '120.0 degrees'),
(516, 'B', '130.0 degrees'),
(516, 'C', '105.0 degrees'),
(516, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(517, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 5:00?', 'medium', 'A', '150.0 degrees', 'Angle = |30*H - 5.5*M| = |30*5 - 0| = 150.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(517, 'A', '150.0 degrees'),
(517, 'B', '160.0 degrees'),
(517, 'C', '135.0 degrees'),
(517, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(518, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 6:00?', 'medium', 'A', '180.0 degrees', 'Angle = |30*H - 5.5*M| = |30*6 - 0| = 180.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(518, 'A', '180.0 degrees'),
(518, 'B', '190.0 degrees'),
(518, 'C', '165.0 degrees'),
(518, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(519, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 7:00?', 'hard', 'A', '210.0 degrees', 'Angle = |30*H - 5.5*M| = |30*7 - 0| = 210.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(519, 'A', '210.0 degrees'),
(519, 'B', '220.0 degrees'),
(519, 'C', '195.0 degrees'),
(519, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(520, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 3:00?', 'hard', 'A', '90.0 degrees', 'Angle = |30*H - 5.5*M| = |30*3 - 0| = 90.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(520, 'A', '90.0 degrees'),
(520, 'B', '100.0 degrees'),
(520, 'C', '75.0 degrees'),
(520, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(521, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 4:00?', 'hard', 'A', '120.0 degrees', 'Angle = |30*H - 5.5*M| = |30*4 - 0| = 120.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(521, 'A', '120.0 degrees'),
(521, 'B', '130.0 degrees'),
(521, 'C', '105.0 degrees'),
(521, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(522, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 5:00?', 'hard', 'A', '150.0 degrees', 'Angle = |30*H - 5.5*M| = |30*5 - 0| = 150.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(522, 'A', '150.0 degrees'),
(522, 'B', '160.0 degrees'),
(522, 'C', '135.0 degrees'),
(522, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(523, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 6:00?', 'hard', 'A', '180.0 degrees', 'Angle = |30*H - 5.5*M| = |30*6 - 0| = 180.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(523, 'A', '180.0 degrees'),
(523, 'B', '190.0 degrees'),
(523, 'C', '165.0 degrees'),
(523, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(524, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 7:00?', 'hard', 'A', '210.0 degrees', 'Angle = |30*H - 5.5*M| = |30*7 - 0| = 210.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(524, 'A', '210.0 degrees'),
(524, 'B', '220.0 degrees'),
(524, 'C', '195.0 degrees'),
(524, 'D', '90 degrees');

-- Topic: Clocks & Calendars, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(525, 2, 21, 'Clock Angle Hand Formula', 'What is the angle between the hour hand and the minute hand of a clock at 3:00?', 'hard', 'A', '90.0 degrees', 'Angle = |30*H - 5.5*M| = |30*3 - 0| = 90.0 degrees.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(525, 'A', '90.0 degrees'),
(525, 'B', '100.0 degrees'),
(525, 'C', '75.0 degrees'),
(525, 'D', '90 degrees');

-- Topic: Input-Output, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(526, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 1)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(526, 'A', 'blue red green'),
(526, 'B', 'green red blue'),
(526, 'C', 'red green blue'),
(526, 'D', 'blue green red');

-- Topic: Input-Output, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(527, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 2)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(527, 'A', 'blue red green'),
(527, 'B', 'green red blue'),
(527, 'C', 'red green blue'),
(527, 'D', 'blue green red');

-- Topic: Input-Output, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(528, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 3)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(528, 'A', 'blue red green'),
(528, 'B', 'green red blue'),
(528, 'C', 'red green blue'),
(528, 'D', 'blue green red');

-- Topic: Input-Output, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(529, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 4)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(529, 'A', 'blue red green'),
(529, 'B', 'green red blue'),
(529, 'C', 'red green blue'),
(529, 'D', 'blue green red');

-- Topic: Input-Output, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(530, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 5)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(530, 'A', 'blue red green'),
(530, 'B', 'green red blue'),
(530, 'C', 'red green blue'),
(530, 'D', 'blue green red');

-- Topic: Input-Output, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(531, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 6)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(531, 'A', 'blue red green'),
(531, 'B', 'green red blue'),
(531, 'C', 'red green blue'),
(531, 'D', 'blue green red');

-- Topic: Input-Output, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(532, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 7)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(532, 'A', 'blue red green'),
(532, 'B', 'green red blue'),
(532, 'C', 'red green blue'),
(532, 'D', 'blue green red');

-- Topic: Input-Output, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(533, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 8)', 'easy', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(533, 'A', 'blue red green'),
(533, 'B', 'green red blue'),
(533, 'C', 'red green blue'),
(533, 'D', 'blue green red');

-- Topic: Input-Output, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(534, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 9)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(534, 'A', 'blue red green'),
(534, 'B', 'green red blue'),
(534, 'C', 'red green blue'),
(534, 'D', 'blue green red');

-- Topic: Input-Output, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(535, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 10)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(535, 'A', 'blue red green'),
(535, 'B', 'green red blue'),
(535, 'C', 'red green blue'),
(535, 'D', 'blue green red');

-- Topic: Input-Output, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(536, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 11)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(536, 'A', 'blue red green'),
(536, 'B', 'green red blue'),
(536, 'C', 'red green blue'),
(536, 'D', 'blue green red');

-- Topic: Input-Output, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(537, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 12)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(537, 'A', 'blue red green'),
(537, 'B', 'green red blue'),
(537, 'C', 'red green blue'),
(537, 'D', 'blue green red');

-- Topic: Input-Output, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(538, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 13)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(538, 'A', 'blue red green'),
(538, 'B', 'green red blue'),
(538, 'C', 'red green blue'),
(538, 'D', 'blue green red');

-- Topic: Input-Output, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(539, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 14)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(539, 'A', 'blue red green'),
(539, 'B', 'green red blue'),
(539, 'C', 'red green blue'),
(539, 'D', 'blue green red');

-- Topic: Input-Output, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(540, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 15)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(540, 'A', 'blue red green'),
(540, 'B', 'green red blue'),
(540, 'C', 'red green blue'),
(540, 'D', 'blue green red');

-- Topic: Input-Output, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(541, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 16)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(541, 'A', 'blue red green'),
(541, 'B', 'green red blue'),
(541, 'C', 'red green blue'),
(541, 'D', 'blue green red');

-- Topic: Input-Output, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(542, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 17)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(542, 'A', 'blue red green'),
(542, 'B', 'green red blue'),
(542, 'C', 'red green blue'),
(542, 'D', 'blue green red');

-- Topic: Input-Output, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(543, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 18)', 'medium', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(543, 'A', 'blue red green'),
(543, 'B', 'green red blue'),
(543, 'C', 'red green blue'),
(543, 'D', 'blue green red');

-- Topic: Input-Output, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(544, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 19)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(544, 'A', 'blue red green'),
(544, 'B', 'green red blue'),
(544, 'C', 'red green blue'),
(544, 'D', 'blue green red');

-- Topic: Input-Output, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(545, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 20)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(545, 'A', 'blue red green'),
(545, 'B', 'green red blue'),
(545, 'C', 'red green blue'),
(545, 'D', 'blue green red');

-- Topic: Input-Output, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(546, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 21)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(546, 'A', 'blue red green'),
(546, 'B', 'green red blue'),
(546, 'C', 'red green blue'),
(546, 'D', 'blue green red');

-- Topic: Input-Output, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(547, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 22)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(547, 'A', 'blue red green'),
(547, 'B', 'green red blue'),
(547, 'C', 'red green blue'),
(547, 'D', 'blue green red');

-- Topic: Input-Output, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(548, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 23)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(548, 'A', 'blue red green'),
(548, 'B', 'green red blue'),
(548, 'C', 'red green blue'),
(548, 'D', 'blue green red');

-- Topic: Input-Output, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(549, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 24)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(549, 'A', 'blue red green'),
(549, 'B', 'green red blue'),
(549, 'C', 'red green blue'),
(549, 'D', 'blue green red');

-- Topic: Input-Output, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(550, 2, 22, 'Iterative Step Transformations', 'If Step 1 of an input ''cat dog bat'' is ''dog cat bat'', what is Step 1 of input ''red blue green'' under the same alphabetical sort? (Case 25)', 'hard', 'A', 'blue red green', 'Swap the first two items based on alphabetical order: ''blue'' comes before ''red''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(550, 'A', 'blue red green'),
(550, 'B', 'green red blue'),
(550, 'C', 'red green blue'),
(550, 'D', 'blue green red');

-- Topic: Bar Charts, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(551, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 112 units, Company B sales is 168 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(551, 'A', '25%'),
(551, 'B', '50%'),
(551, 'C', '75%'),
(551, 'D', '100%');

-- Topic: Bar Charts, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(552, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 124 units, Company B sales is 186 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(552, 'A', '25%'),
(552, 'B', '50%'),
(552, 'C', '75%'),
(552, 'D', '100%');

-- Topic: Bar Charts, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(553, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 136 units, Company B sales is 204 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(553, 'A', '25%'),
(553, 'B', '50%'),
(553, 'C', '75%'),
(553, 'D', '100%');

-- Topic: Bar Charts, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(554, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 148 units, Company B sales is 222 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(554, 'A', '25%'),
(554, 'B', '50%'),
(554, 'C', '75%'),
(554, 'D', '100%');

-- Topic: Bar Charts, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(555, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 160 units, Company B sales is 240 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(555, 'A', '25%'),
(555, 'B', '50%'),
(555, 'C', '75%'),
(555, 'D', '100%');

-- Topic: Bar Charts, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(556, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 172 units, Company B sales is 258 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(556, 'A', '25%'),
(556, 'B', '50%'),
(556, 'C', '75%'),
(556, 'D', '100%');

-- Topic: Bar Charts, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(557, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 184 units, Company B sales is 276 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(557, 'A', '25%'),
(557, 'B', '50%'),
(557, 'C', '75%'),
(557, 'D', '100%');

-- Topic: Bar Charts, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(558, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 196 units, Company B sales is 294 units. By what percentage are B''s sales higher than A''s?', 'easy', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(558, 'A', '25%'),
(558, 'B', '50%'),
(558, 'C', '75%'),
(558, 'D', '100%');

-- Topic: Bar Charts, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(559, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 208 units, Company B sales is 312 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(559, 'A', '25%'),
(559, 'B', '50%'),
(559, 'C', '75%'),
(559, 'D', '100%');

-- Topic: Bar Charts, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(560, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 220 units, Company B sales is 330 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(560, 'A', '25%'),
(560, 'B', '50%'),
(560, 'C', '75%'),
(560, 'D', '100%');

-- Topic: Bar Charts, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(561, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 232 units, Company B sales is 348 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(561, 'A', '25%'),
(561, 'B', '50%'),
(561, 'C', '75%'),
(561, 'D', '100%');

-- Topic: Bar Charts, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(562, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 244 units, Company B sales is 366 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(562, 'A', '25%'),
(562, 'B', '50%'),
(562, 'C', '75%'),
(562, 'D', '100%');

-- Topic: Bar Charts, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(563, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 256 units, Company B sales is 384 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(563, 'A', '25%'),
(563, 'B', '50%'),
(563, 'C', '75%'),
(563, 'D', '100%');

-- Topic: Bar Charts, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(564, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 268 units, Company B sales is 402 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(564, 'A', '25%'),
(564, 'B', '50%'),
(564, 'C', '75%'),
(564, 'D', '100%');

-- Topic: Bar Charts, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(565, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 280 units, Company B sales is 420 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(565, 'A', '25%'),
(565, 'B', '50%'),
(565, 'C', '75%'),
(565, 'D', '100%');

-- Topic: Bar Charts, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(566, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 292 units, Company B sales is 438 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(566, 'A', '25%'),
(566, 'B', '50%'),
(566, 'C', '75%'),
(566, 'D', '100%');

-- Topic: Bar Charts, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(567, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 304 units, Company B sales is 456 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(567, 'A', '25%'),
(567, 'B', '50%'),
(567, 'C', '75%'),
(567, 'D', '100%');

-- Topic: Bar Charts, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(568, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 316 units, Company B sales is 474 units. By what percentage are B''s sales higher than A''s?', 'medium', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(568, 'A', '25%'),
(568, 'B', '50%'),
(568, 'C', '75%'),
(568, 'D', '100%');

-- Topic: Bar Charts, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(569, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 328 units, Company B sales is 492 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(569, 'A', '25%'),
(569, 'B', '50%'),
(569, 'C', '75%'),
(569, 'D', '100%');

-- Topic: Bar Charts, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(570, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 340 units, Company B sales is 510 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(570, 'A', '25%'),
(570, 'B', '50%'),
(570, 'C', '75%'),
(570, 'D', '100%');

-- Topic: Bar Charts, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(571, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 352 units, Company B sales is 528 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(571, 'A', '25%'),
(571, 'B', '50%'),
(571, 'C', '75%'),
(571, 'D', '100%');

-- Topic: Bar Charts, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(572, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 364 units, Company B sales is 546 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(572, 'A', '25%'),
(572, 'B', '50%'),
(572, 'C', '75%'),
(572, 'D', '100%');

-- Topic: Bar Charts, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(573, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 376 units, Company B sales is 564 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(573, 'A', '25%'),
(573, 'B', '50%'),
(573, 'C', '75%'),
(573, 'D', '100%');

-- Topic: Bar Charts, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(574, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 388 units, Company B sales is 582 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(574, 'A', '25%'),
(574, 'B', '50%'),
(574, 'C', '75%'),
(574, 'D', '100%');

-- Topic: Bar Charts, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(575, 3, 23, 'Bar Chart Analysis', 'Refer to the bar chart: Company A sales is 400 units, Company B sales is 600 units. By what percentage are B''s sales higher than A''s?', 'hard', 'B', '50%', 'B''s sales are 1.5 times A''s sales, which means B is 50% higher than A.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(575, 'A', '25%'),
(575, 'B', '50%'),
(575, 'C', '75%'),
(575, 'D', '100%');

-- Topic: Line Graphs, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(576, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹54k and in 2021 was ₹108k. Find the absolute increase in profit.', 'easy', 'A', '₹54k', 'Increase = Profit(2021) - Profit(2020) = 108 - 54 = ₹54k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(576, 'A', '₹54k'),
(576, 'B', '₹108k'),
(576, 'C', '₹27k'),
(576, 'D', '₹10k');

-- Topic: Line Graphs, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(577, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹58k and in 2021 was ₹116k. Find the absolute increase in profit.', 'easy', 'A', '₹58k', 'Increase = Profit(2021) - Profit(2020) = 116 - 58 = ₹58k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(577, 'A', '₹58k'),
(577, 'B', '₹116k'),
(577, 'C', '₹29k'),
(577, 'D', '₹10k');

-- Topic: Line Graphs, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(578, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹62k and in 2021 was ₹124k. Find the absolute increase in profit.', 'easy', 'A', '₹62k', 'Increase = Profit(2021) - Profit(2020) = 124 - 62 = ₹62k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(578, 'A', '₹62k'),
(578, 'B', '₹124k'),
(578, 'C', '₹31k'),
(578, 'D', '₹10k');

-- Topic: Line Graphs, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(579, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹66k and in 2021 was ₹132k. Find the absolute increase in profit.', 'easy', 'A', '₹66k', 'Increase = Profit(2021) - Profit(2020) = 132 - 66 = ₹66k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(579, 'A', '₹66k'),
(579, 'B', '₹132k'),
(579, 'C', '₹33k'),
(579, 'D', '₹10k');

-- Topic: Line Graphs, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(580, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹70k and in 2021 was ₹140k. Find the absolute increase in profit.', 'easy', 'A', '₹70k', 'Increase = Profit(2021) - Profit(2020) = 140 - 70 = ₹70k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(580, 'A', '₹70k'),
(580, 'B', '₹140k'),
(580, 'C', '₹35k'),
(580, 'D', '₹10k');

-- Topic: Line Graphs, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(581, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹74k and in 2021 was ₹148k. Find the absolute increase in profit.', 'easy', 'A', '₹74k', 'Increase = Profit(2021) - Profit(2020) = 148 - 74 = ₹74k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(581, 'A', '₹74k'),
(581, 'B', '₹148k'),
(581, 'C', '₹37k'),
(581, 'D', '₹10k');

-- Topic: Line Graphs, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(582, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹78k and in 2021 was ₹156k. Find the absolute increase in profit.', 'easy', 'A', '₹78k', 'Increase = Profit(2021) - Profit(2020) = 156 - 78 = ₹78k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(582, 'A', '₹78k'),
(582, 'B', '₹156k'),
(582, 'C', '₹39k'),
(582, 'D', '₹10k');

-- Topic: Line Graphs, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(583, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹82k and in 2021 was ₹164k. Find the absolute increase in profit.', 'easy', 'A', '₹82k', 'Increase = Profit(2021) - Profit(2020) = 164 - 82 = ₹82k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(583, 'A', '₹82k'),
(583, 'B', '₹164k'),
(583, 'C', '₹41k'),
(583, 'D', '₹10k');

-- Topic: Line Graphs, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(584, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹86k and in 2021 was ₹172k. Find the absolute increase in profit.', 'medium', 'A', '₹86k', 'Increase = Profit(2021) - Profit(2020) = 172 - 86 = ₹86k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(584, 'A', '₹86k'),
(584, 'B', '₹172k'),
(584, 'C', '₹43k'),
(584, 'D', '₹10k');

-- Topic: Line Graphs, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(585, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹90k and in 2021 was ₹180k. Find the absolute increase in profit.', 'medium', 'A', '₹90k', 'Increase = Profit(2021) - Profit(2020) = 180 - 90 = ₹90k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(585, 'A', '₹90k'),
(585, 'B', '₹180k'),
(585, 'C', '₹45k'),
(585, 'D', '₹10k');

-- Topic: Line Graphs, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(586, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹94k and in 2021 was ₹188k. Find the absolute increase in profit.', 'medium', 'A', '₹94k', 'Increase = Profit(2021) - Profit(2020) = 188 - 94 = ₹94k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(586, 'A', '₹94k'),
(586, 'B', '₹188k'),
(586, 'C', '₹47k'),
(586, 'D', '₹10k');

-- Topic: Line Graphs, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(587, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹98k and in 2021 was ₹196k. Find the absolute increase in profit.', 'medium', 'A', '₹98k', 'Increase = Profit(2021) - Profit(2020) = 196 - 98 = ₹98k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(587, 'A', '₹98k'),
(587, 'B', '₹196k'),
(587, 'C', '₹49k'),
(587, 'D', '₹10k');

-- Topic: Line Graphs, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(588, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹102k and in 2021 was ₹204k. Find the absolute increase in profit.', 'medium', 'A', '₹102k', 'Increase = Profit(2021) - Profit(2020) = 204 - 102 = ₹102k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(588, 'A', '₹102k'),
(588, 'B', '₹204k'),
(588, 'C', '₹51k'),
(588, 'D', '₹10k');

-- Topic: Line Graphs, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(589, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹106k and in 2021 was ₹212k. Find the absolute increase in profit.', 'medium', 'A', '₹106k', 'Increase = Profit(2021) - Profit(2020) = 212 - 106 = ₹106k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(589, 'A', '₹106k'),
(589, 'B', '₹212k'),
(589, 'C', '₹53k'),
(589, 'D', '₹10k');

-- Topic: Line Graphs, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(590, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹110k and in 2021 was ₹220k. Find the absolute increase in profit.', 'medium', 'A', '₹110k', 'Increase = Profit(2021) - Profit(2020) = 220 - 110 = ₹110k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(590, 'A', '₹110k'),
(590, 'B', '₹220k'),
(590, 'C', '₹55k'),
(590, 'D', '₹10k');

-- Topic: Line Graphs, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(591, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹114k and in 2021 was ₹228k. Find the absolute increase in profit.', 'medium', 'A', '₹114k', 'Increase = Profit(2021) - Profit(2020) = 228 - 114 = ₹114k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(591, 'A', '₹114k'),
(591, 'B', '₹228k'),
(591, 'C', '₹57k'),
(591, 'D', '₹10k');

-- Topic: Line Graphs, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(592, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹118k and in 2021 was ₹236k. Find the absolute increase in profit.', 'medium', 'A', '₹118k', 'Increase = Profit(2021) - Profit(2020) = 236 - 118 = ₹118k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(592, 'A', '₹118k'),
(592, 'B', '₹236k'),
(592, 'C', '₹59k'),
(592, 'D', '₹10k');

-- Topic: Line Graphs, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(593, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹122k and in 2021 was ₹244k. Find the absolute increase in profit.', 'medium', 'A', '₹122k', 'Increase = Profit(2021) - Profit(2020) = 244 - 122 = ₹122k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(593, 'A', '₹122k'),
(593, 'B', '₹244k'),
(593, 'C', '₹61k'),
(593, 'D', '₹10k');

-- Topic: Line Graphs, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(594, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹126k and in 2021 was ₹252k. Find the absolute increase in profit.', 'hard', 'A', '₹126k', 'Increase = Profit(2021) - Profit(2020) = 252 - 126 = ₹126k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(594, 'A', '₹126k'),
(594, 'B', '₹252k'),
(594, 'C', '₹63k'),
(594, 'D', '₹10k');

-- Topic: Line Graphs, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(595, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹130k and in 2021 was ₹260k. Find the absolute increase in profit.', 'hard', 'A', '₹130k', 'Increase = Profit(2021) - Profit(2020) = 260 - 130 = ₹130k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(595, 'A', '₹130k'),
(595, 'B', '₹260k'),
(595, 'C', '₹65k'),
(595, 'D', '₹10k');

-- Topic: Line Graphs, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(596, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹134k and in 2021 was ₹268k. Find the absolute increase in profit.', 'hard', 'A', '₹134k', 'Increase = Profit(2021) - Profit(2020) = 268 - 134 = ₹134k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(596, 'A', '₹134k'),
(596, 'B', '₹268k'),
(596, 'C', '₹67k'),
(596, 'D', '₹10k');

-- Topic: Line Graphs, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(597, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹138k and in 2021 was ₹276k. Find the absolute increase in profit.', 'hard', 'A', '₹138k', 'Increase = Profit(2021) - Profit(2020) = 276 - 138 = ₹138k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(597, 'A', '₹138k'),
(597, 'B', '₹276k'),
(597, 'C', '₹69k'),
(597, 'D', '₹10k');

-- Topic: Line Graphs, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(598, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹142k and in 2021 was ₹284k. Find the absolute increase in profit.', 'hard', 'A', '₹142k', 'Increase = Profit(2021) - Profit(2020) = 284 - 142 = ₹142k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(598, 'A', '₹142k'),
(598, 'B', '₹284k'),
(598, 'C', '₹71k'),
(598, 'D', '₹10k');

-- Topic: Line Graphs, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(599, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹146k and in 2021 was ₹292k. Find the absolute increase in profit.', 'hard', 'A', '₹146k', 'Increase = Profit(2021) - Profit(2020) = 292 - 146 = ₹146k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(599, 'A', '₹146k'),
(599, 'B', '₹292k'),
(599, 'C', '₹73k'),
(599, 'D', '₹10k');

-- Topic: Line Graphs, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(600, 3, 24, 'Line Trend Interpolation', 'A line graph shows profit growth. Profit in 2020 was ₹150k and in 2021 was ₹300k. Find the absolute increase in profit.', 'hard', 'A', '₹150k', 'Increase = Profit(2021) - Profit(2020) = 300 - 150 = ₹150k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(600, 'A', '₹150k'),
(600, 'B', '₹300k'),
(600, 'C', '₹75k'),
(600, 'D', '₹10k');

-- Topic: Pie Charts, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(601, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 21% of the total students. What is its central angle?', 'easy', 'A', '75.6°', 'Central angle = Percentage * 3.6 = 21 * 3.6 = 75.6°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(601, 'A', '75.6°'),
(601, 'B', '85.6°'),
(601, 'C', '70.6°'),
(601, 'D', '90°');

-- Topic: Pie Charts, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(602, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 22% of the total students. What is its central angle?', 'easy', 'A', '79.2°', 'Central angle = Percentage * 3.6 = 22 * 3.6 = 79.2°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(602, 'A', '79.2°'),
(602, 'B', '89.2°'),
(602, 'C', '74.2°'),
(602, 'D', '90°');

-- Topic: Pie Charts, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(603, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 23% of the total students. What is its central angle?', 'easy', 'A', '82.8°', 'Central angle = Percentage * 3.6 = 23 * 3.6 = 82.8°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(603, 'A', '82.8°'),
(603, 'B', '92.8°'),
(603, 'C', '77.8°'),
(603, 'D', '90°');

-- Topic: Pie Charts, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(604, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 24% of the total students. What is its central angle?', 'easy', 'A', '86.4°', 'Central angle = Percentage * 3.6 = 24 * 3.6 = 86.4°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(604, 'A', '86.4°'),
(604, 'B', '96.4°'),
(604, 'C', '81.4°'),
(604, 'D', '90°');

-- Topic: Pie Charts, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(605, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 25% of the total students. What is its central angle?', 'easy', 'A', '90.0°', 'Central angle = Percentage * 3.6 = 25 * 3.6 = 90.0°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(605, 'A', '90.0°'),
(605, 'B', '100.0°'),
(605, 'C', '85.0°'),
(605, 'D', '90°');

-- Topic: Pie Charts, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(606, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 26% of the total students. What is its central angle?', 'easy', 'A', '93.6°', 'Central angle = Percentage * 3.6 = 26 * 3.6 = 93.6°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(606, 'A', '93.6°'),
(606, 'B', '103.6°'),
(606, 'C', '88.6°'),
(606, 'D', '90°');

-- Topic: Pie Charts, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(607, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 27% of the total students. What is its central angle?', 'easy', 'A', '97.2°', 'Central angle = Percentage * 3.6 = 27 * 3.6 = 97.2°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(607, 'A', '97.2°'),
(607, 'B', '107.2°'),
(607, 'C', '92.2°'),
(607, 'D', '90°');

-- Topic: Pie Charts, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(608, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 28% of the total students. What is its central angle?', 'easy', 'A', '100.8°', 'Central angle = Percentage * 3.6 = 28 * 3.6 = 100.8°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(608, 'A', '100.8°'),
(608, 'B', '110.8°'),
(608, 'C', '95.8°'),
(608, 'D', '90°');

-- Topic: Pie Charts, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(609, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 29% of the total students. What is its central angle?', 'medium', 'A', '104.4°', 'Central angle = Percentage * 3.6 = 29 * 3.6 = 104.4°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(609, 'A', '104.4°'),
(609, 'B', '114.4°'),
(609, 'C', '99.4°'),
(609, 'D', '90°');

-- Topic: Pie Charts, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(610, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 30% of the total students. What is its central angle?', 'medium', 'A', '108.0°', 'Central angle = Percentage * 3.6 = 30 * 3.6 = 108.0°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(610, 'A', '108.0°'),
(610, 'B', '118.0°'),
(610, 'C', '103.0°'),
(610, 'D', '90°');

-- Topic: Pie Charts, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(611, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 31% of the total students. What is its central angle?', 'medium', 'A', '111.6°', 'Central angle = Percentage * 3.6 = 31 * 3.6 = 111.6°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(611, 'A', '111.6°'),
(611, 'B', '121.6°'),
(611, 'C', '106.6°'),
(611, 'D', '90°');

-- Topic: Pie Charts, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(612, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 32% of the total students. What is its central angle?', 'medium', 'A', '115.2°', 'Central angle = Percentage * 3.6 = 32 * 3.6 = 115.2°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(612, 'A', '115.2°'),
(612, 'B', '125.2°'),
(612, 'C', '110.2°'),
(612, 'D', '90°');

-- Topic: Pie Charts, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(613, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 33% of the total students. What is its central angle?', 'medium', 'A', '118.8°', 'Central angle = Percentage * 3.6 = 33 * 3.6 = 118.8°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(613, 'A', '118.8°'),
(613, 'B', '128.8°'),
(613, 'C', '113.8°'),
(613, 'D', '90°');

-- Topic: Pie Charts, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(614, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 34% of the total students. What is its central angle?', 'medium', 'A', '122.4°', 'Central angle = Percentage * 3.6 = 34 * 3.6 = 122.4°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(614, 'A', '122.4°'),
(614, 'B', '132.4°'),
(614, 'C', '117.4°'),
(614, 'D', '90°');

-- Topic: Pie Charts, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(615, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 35% of the total students. What is its central angle?', 'medium', 'A', '126.0°', 'Central angle = Percentage * 3.6 = 35 * 3.6 = 126.0°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(615, 'A', '126.0°'),
(615, 'B', '136.0°'),
(615, 'C', '121.0°'),
(615, 'D', '90°');

-- Topic: Pie Charts, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(616, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 36% of the total students. What is its central angle?', 'medium', 'A', '129.6°', 'Central angle = Percentage * 3.6 = 36 * 3.6 = 129.6°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(616, 'A', '129.6°'),
(616, 'B', '139.6°'),
(616, 'C', '124.6°'),
(616, 'D', '90°');

-- Topic: Pie Charts, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(617, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 37% of the total students. What is its central angle?', 'medium', 'A', '133.2°', 'Central angle = Percentage * 3.6 = 37 * 3.6 = 133.2°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(617, 'A', '133.2°'),
(617, 'B', '143.2°'),
(617, 'C', '128.2°'),
(617, 'D', '90°');

-- Topic: Pie Charts, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(618, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 38% of the total students. What is its central angle?', 'medium', 'A', '136.8°', 'Central angle = Percentage * 3.6 = 38 * 3.6 = 136.8°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(618, 'A', '136.8°'),
(618, 'B', '146.8°'),
(618, 'C', '131.8°'),
(618, 'D', '90°');

-- Topic: Pie Charts, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(619, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 39% of the total students. What is its central angle?', 'hard', 'A', '140.4°', 'Central angle = Percentage * 3.6 = 39 * 3.6 = 140.4°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(619, 'A', '140.4°'),
(619, 'B', '150.4°'),
(619, 'C', '135.4°'),
(619, 'D', '90°');

-- Topic: Pie Charts, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(620, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 40% of the total students. What is its central angle?', 'hard', 'A', '144.0°', 'Central angle = Percentage * 3.6 = 40 * 3.6 = 144.0°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(620, 'A', '144.0°'),
(620, 'B', '154.0°'),
(620, 'C', '139.0°'),
(620, 'D', '90°');

-- Topic: Pie Charts, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(621, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 41% of the total students. What is its central angle?', 'hard', 'A', '147.6°', 'Central angle = Percentage * 3.6 = 41 * 3.6 = 147.6°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(621, 'A', '147.6°'),
(621, 'B', '157.6°'),
(621, 'C', '142.6°'),
(621, 'D', '90°');

-- Topic: Pie Charts, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(622, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 42% of the total students. What is its central angle?', 'hard', 'A', '151.2°', 'Central angle = Percentage * 3.6 = 42 * 3.6 = 151.2°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(622, 'A', '151.2°'),
(622, 'B', '161.2°'),
(622, 'C', '146.2°'),
(622, 'D', '90°');

-- Topic: Pie Charts, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(623, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 43% of the total students. What is its central angle?', 'hard', 'A', '154.8°', 'Central angle = Percentage * 3.6 = 43 * 3.6 = 154.8°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(623, 'A', '154.8°'),
(623, 'B', '164.8°'),
(623, 'C', '149.8°'),
(623, 'D', '90°');

-- Topic: Pie Charts, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(624, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 44% of the total students. What is its central angle?', 'hard', 'A', '158.4°', 'Central angle = Percentage * 3.6 = 44 * 3.6 = 158.4°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(624, 'A', '158.4°'),
(624, 'B', '168.4°'),
(624, 'C', '153.4°'),
(624, 'D', '90°');

-- Topic: Pie Charts, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(625, 3, 25, 'Sector Angle Calculation', 'In a pie chart representing student distributions, the science department accounts for 45% of the total students. What is its central angle?', 'hard', 'A', '162.0°', 'Central angle = Percentage * 3.6 = 45 * 3.6 = 162.0°.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(625, 'A', '162.0°'),
(625, 'B', '172.0°'),
(625, 'C', '157.0°'),
(625, 'D', '90°');

-- Topic: Tables, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(626, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 10, Year 2 = 15, Year 3 = 20. Find the average annual production.', 'easy', 'B', '15', 'Average = ((10) + 15 + (20)) / 3 = 15.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(626, 'A', '13'),
(626, 'B', '15'),
(626, 'C', '18'),
(626, 'D', '18');

-- Topic: Tables, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(627, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 15, Year 2 = 20, Year 3 = 25. Find the average annual production.', 'easy', 'B', '20', 'Average = ((15) + 20 + (25)) / 3 = 20.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(627, 'A', '18'),
(627, 'B', '20'),
(627, 'C', '23'),
(627, 'D', '24');

-- Topic: Tables, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(628, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 20, Year 2 = 25, Year 3 = 30. Find the average annual production.', 'easy', 'B', '25', 'Average = ((20) + 25 + (30)) / 3 = 25.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(628, 'A', '23'),
(628, 'B', '25'),
(628, 'C', '28'),
(628, 'D', '30');

-- Topic: Tables, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(629, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 25, Year 2 = 30, Year 3 = 35. Find the average annual production.', 'easy', 'B', '30', 'Average = ((25) + 30 + (35)) / 3 = 30.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(629, 'A', '28'),
(629, 'B', '30'),
(629, 'C', '33'),
(629, 'D', '36');

-- Topic: Tables, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(630, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 30, Year 2 = 35, Year 3 = 40. Find the average annual production.', 'easy', 'B', '35', 'Average = ((30) + 35 + (40)) / 3 = 35.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(630, 'A', '33'),
(630, 'B', '35'),
(630, 'C', '38'),
(630, 'D', '42');

-- Topic: Tables, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(631, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 35, Year 2 = 40, Year 3 = 45. Find the average annual production.', 'easy', 'B', '40', 'Average = ((35) + 40 + (45)) / 3 = 40.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(631, 'A', '38'),
(631, 'B', '40'),
(631, 'C', '43'),
(631, 'D', '48');

-- Topic: Tables, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(632, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 40, Year 2 = 45, Year 3 = 50. Find the average annual production.', 'easy', 'B', '45', 'Average = ((40) + 45 + (50)) / 3 = 45.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(632, 'A', '43'),
(632, 'B', '45'),
(632, 'C', '48'),
(632, 'D', '54');

-- Topic: Tables, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(633, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 45, Year 2 = 50, Year 3 = 55. Find the average annual production.', 'easy', 'B', '50', 'Average = ((45) + 50 + (55)) / 3 = 50.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(633, 'A', '48'),
(633, 'B', '50'),
(633, 'C', '53'),
(633, 'D', '60');

-- Topic: Tables, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(634, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 50, Year 2 = 55, Year 3 = 60. Find the average annual production.', 'medium', 'B', '55', 'Average = ((50) + 55 + (60)) / 3 = 55.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(634, 'A', '53'),
(634, 'B', '55'),
(634, 'C', '58'),
(634, 'D', '66');

-- Topic: Tables, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(635, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 55, Year 2 = 60, Year 3 = 65. Find the average annual production.', 'medium', 'B', '60', 'Average = ((55) + 60 + (65)) / 3 = 60.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(635, 'A', '58'),
(635, 'B', '60'),
(635, 'C', '63'),
(635, 'D', '72');

-- Topic: Tables, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(636, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 60, Year 2 = 65, Year 3 = 70. Find the average annual production.', 'medium', 'B', '65', 'Average = ((60) + 65 + (70)) / 3 = 65.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(636, 'A', '63'),
(636, 'B', '65'),
(636, 'C', '68'),
(636, 'D', '78');

-- Topic: Tables, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(637, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 65, Year 2 = 70, Year 3 = 75. Find the average annual production.', 'medium', 'B', '70', 'Average = ((65) + 70 + (75)) / 3 = 70.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(637, 'A', '68'),
(637, 'B', '70'),
(637, 'C', '73'),
(637, 'D', '84');

-- Topic: Tables, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(638, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 70, Year 2 = 75, Year 3 = 80. Find the average annual production.', 'medium', 'B', '75', 'Average = ((70) + 75 + (80)) / 3 = 75.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(638, 'A', '73'),
(638, 'B', '75'),
(638, 'C', '78'),
(638, 'D', '90');

-- Topic: Tables, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(639, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 75, Year 2 = 80, Year 3 = 85. Find the average annual production.', 'medium', 'B', '80', 'Average = ((75) + 80 + (85)) / 3 = 80.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(639, 'A', '78'),
(639, 'B', '80'),
(639, 'C', '83'),
(639, 'D', '96');

-- Topic: Tables, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(640, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 80, Year 2 = 85, Year 3 = 90. Find the average annual production.', 'medium', 'B', '85', 'Average = ((80) + 85 + (90)) / 3 = 85.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(640, 'A', '83'),
(640, 'B', '85'),
(640, 'C', '88'),
(640, 'D', '102');

-- Topic: Tables, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(641, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 85, Year 2 = 90, Year 3 = 95. Find the average annual production.', 'medium', 'B', '90', 'Average = ((85) + 90 + (95)) / 3 = 90.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(641, 'A', '88'),
(641, 'B', '90'),
(641, 'C', '93'),
(641, 'D', '108');

-- Topic: Tables, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(642, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 90, Year 2 = 95, Year 3 = 100. Find the average annual production.', 'medium', 'B', '95', 'Average = ((90) + 95 + (100)) / 3 = 95.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(642, 'A', '93'),
(642, 'B', '95'),
(642, 'C', '98'),
(642, 'D', '114');

-- Topic: Tables, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(643, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 95, Year 2 = 100, Year 3 = 105. Find the average annual production.', 'medium', 'B', '100', 'Average = ((95) + 100 + (105)) / 3 = 100.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(643, 'A', '98'),
(643, 'B', '100'),
(643, 'C', '103'),
(643, 'D', '120');

-- Topic: Tables, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(644, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 100, Year 2 = 105, Year 3 = 110. Find the average annual production.', 'hard', 'B', '105', 'Average = ((100) + 105 + (110)) / 3 = 105.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(644, 'A', '103'),
(644, 'B', '105'),
(644, 'C', '108'),
(644, 'D', '126');

-- Topic: Tables, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(645, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 105, Year 2 = 110, Year 3 = 115. Find the average annual production.', 'hard', 'B', '110', 'Average = ((105) + 110 + (115)) / 3 = 110.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(645, 'A', '108'),
(645, 'B', '110'),
(645, 'C', '113'),
(645, 'D', '132');

-- Topic: Tables, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(646, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 110, Year 2 = 115, Year 3 = 120. Find the average annual production.', 'hard', 'B', '115', 'Average = ((110) + 115 + (120)) / 3 = 115.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(646, 'A', '113'),
(646, 'B', '115'),
(646, 'C', '118'),
(646, 'D', '138');

-- Topic: Tables, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(647, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 115, Year 2 = 120, Year 3 = 125. Find the average annual production.', 'hard', 'B', '120', 'Average = ((115) + 120 + (125)) / 3 = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(647, 'A', '118'),
(647, 'B', '120'),
(647, 'C', '123'),
(647, 'D', '144');

-- Topic: Tables, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(648, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 120, Year 2 = 125, Year 3 = 130. Find the average annual production.', 'hard', 'B', '125', 'Average = ((120) + 125 + (130)) / 3 = 125.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(648, 'A', '123'),
(648, 'B', '125'),
(648, 'C', '128'),
(648, 'D', '150');

-- Topic: Tables, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(649, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 125, Year 2 = 130, Year 3 = 135. Find the average annual production.', 'hard', 'B', '130', 'Average = ((125) + 130 + (135)) / 3 = 130.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(649, 'A', '128'),
(649, 'B', '130'),
(649, 'C', '133'),
(649, 'D', '156');

-- Topic: Tables, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(650, 3, 26, 'Row Average Calculation', 'Refer to the table of production values: Year 1 = 130, Year 2 = 135, Year 3 = 140. Find the average annual production.', 'hard', 'B', '135', 'Average = ((130) + 135 + (140)) / 3 = 135.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(650, 'A', '133'),
(650, 'B', '135'),
(650, 'C', '138'),
(650, 'D', '162');

-- Topic: Mixed Charts, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(651, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹101k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹40.4k', 'Expenditure = Budget * 40% = 101 * 0.4 = ₹40.4k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(651, 'A', '₹40.4k'),
(651, 'B', '₹45.4k'),
(651, 'C', '₹38.4k'),
(651, 'D', '₹50k');

-- Topic: Mixed Charts, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(652, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹102k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹40.8k', 'Expenditure = Budget * 40% = 102 * 0.4 = ₹40.8k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(652, 'A', '₹40.8k'),
(652, 'B', '₹45.8k'),
(652, 'C', '₹38.8k'),
(652, 'D', '₹50k');

-- Topic: Mixed Charts, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(653, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹103k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹41.2k', 'Expenditure = Budget * 40% = 103 * 0.4 = ₹41.2k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(653, 'A', '₹41.2k'),
(653, 'B', '₹46.2k'),
(653, 'C', '₹39.2k'),
(653, 'D', '₹50k');

-- Topic: Mixed Charts, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(654, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹104k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹41.6k', 'Expenditure = Budget * 40% = 104 * 0.4 = ₹41.6k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(654, 'A', '₹41.6k'),
(654, 'B', '₹46.6k'),
(654, 'C', '₹39.6k'),
(654, 'D', '₹50k');

-- Topic: Mixed Charts, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(655, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹105k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹42.0k', 'Expenditure = Budget * 40% = 105 * 0.4 = ₹42.0k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(655, 'A', '₹42.0k'),
(655, 'B', '₹47.0k'),
(655, 'C', '₹40.0k'),
(655, 'D', '₹50k');

-- Topic: Mixed Charts, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(656, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹106k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹42.4k', 'Expenditure = Budget * 40% = 106 * 0.4 = ₹42.4k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(656, 'A', '₹42.4k'),
(656, 'B', '₹47.4k'),
(656, 'C', '₹40.4k'),
(656, 'D', '₹50k');

-- Topic: Mixed Charts, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(657, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹107k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹42.8k', 'Expenditure = Budget * 40% = 107 * 0.4 = ₹42.8k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(657, 'A', '₹42.8k'),
(657, 'B', '₹47.8k'),
(657, 'C', '₹40.8k'),
(657, 'D', '₹50k');

-- Topic: Mixed Charts, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(658, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹108k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'easy', 'A', '₹43.2k', 'Expenditure = Budget * 40% = 108 * 0.4 = ₹43.2k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(658, 'A', '₹43.2k'),
(658, 'B', '₹48.2k'),
(658, 'C', '₹41.2k'),
(658, 'D', '₹50k');

-- Topic: Mixed Charts, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(659, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹109k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹43.6k', 'Expenditure = Budget * 40% = 109 * 0.4 = ₹43.6k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(659, 'A', '₹43.6k'),
(659, 'B', '₹48.6k'),
(659, 'C', '₹41.6k'),
(659, 'D', '₹50k');

-- Topic: Mixed Charts, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(660, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹110k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹44.0k', 'Expenditure = Budget * 40% = 110 * 0.4 = ₹44.0k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(660, 'A', '₹44.0k'),
(660, 'B', '₹49.0k'),
(660, 'C', '₹42.0k'),
(660, 'D', '₹50k');

-- Topic: Mixed Charts, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(661, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹111k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹44.4k', 'Expenditure = Budget * 40% = 111 * 0.4 = ₹44.4k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(661, 'A', '₹44.4k'),
(661, 'B', '₹49.4k'),
(661, 'C', '₹42.4k'),
(661, 'D', '₹50k');

-- Topic: Mixed Charts, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(662, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹112k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹44.8k', 'Expenditure = Budget * 40% = 112 * 0.4 = ₹44.8k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(662, 'A', '₹44.8k'),
(662, 'B', '₹49.8k'),
(662, 'C', '₹42.8k'),
(662, 'D', '₹50k');

-- Topic: Mixed Charts, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(663, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹113k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹45.2k', 'Expenditure = Budget * 40% = 113 * 0.4 = ₹45.2k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(663, 'A', '₹45.2k'),
(663, 'B', '₹50.2k'),
(663, 'C', '₹43.2k'),
(663, 'D', '₹50k');

-- Topic: Mixed Charts, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(664, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹114k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹45.6k', 'Expenditure = Budget * 40% = 114 * 0.4 = ₹45.6k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(664, 'A', '₹45.6k'),
(664, 'B', '₹50.6k'),
(664, 'C', '₹43.6k'),
(664, 'D', '₹50k');

-- Topic: Mixed Charts, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(665, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹115k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹46.0k', 'Expenditure = Budget * 40% = 115 * 0.4 = ₹46.0k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(665, 'A', '₹46.0k'),
(665, 'B', '₹51.0k'),
(665, 'C', '₹44.0k'),
(665, 'D', '₹50k');

-- Topic: Mixed Charts, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(666, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹116k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹46.4k', 'Expenditure = Budget * 40% = 116 * 0.4 = ₹46.4k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(666, 'A', '₹46.4k'),
(666, 'B', '₹51.4k'),
(666, 'C', '₹44.4k'),
(666, 'D', '₹50k');

-- Topic: Mixed Charts, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(667, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹117k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹46.8k', 'Expenditure = Budget * 40% = 117 * 0.4 = ₹46.8k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(667, 'A', '₹46.8k'),
(667, 'B', '₹51.8k'),
(667, 'C', '₹44.8k'),
(667, 'D', '₹50k');

-- Topic: Mixed Charts, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(668, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹118k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'medium', 'A', '₹47.2k', 'Expenditure = Budget * 40% = 118 * 0.4 = ₹47.2k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(668, 'A', '₹47.2k'),
(668, 'B', '₹52.2k'),
(668, 'C', '₹45.2k'),
(668, 'D', '₹50k');

-- Topic: Mixed Charts, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(669, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹119k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹47.6k', 'Expenditure = Budget * 40% = 119 * 0.4 = ₹47.6k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(669, 'A', '₹47.6k'),
(669, 'B', '₹52.6k'),
(669, 'C', '₹45.6k'),
(669, 'D', '₹50k');

-- Topic: Mixed Charts, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(670, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹120k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹48.0k', 'Expenditure = Budget * 40% = 120 * 0.4 = ₹48.0k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(670, 'A', '₹48.0k'),
(670, 'B', '₹53.0k'),
(670, 'C', '₹46.0k'),
(670, 'D', '₹50k');

-- Topic: Mixed Charts, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(671, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹121k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹48.4k', 'Expenditure = Budget * 40% = 121 * 0.4 = ₹48.4k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(671, 'A', '₹48.4k'),
(671, 'B', '₹53.4k'),
(671, 'C', '₹46.4k'),
(671, 'D', '₹50k');

-- Topic: Mixed Charts, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(672, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹122k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹48.8k', 'Expenditure = Budget * 40% = 122 * 0.4 = ₹48.8k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(672, 'A', '₹48.8k'),
(672, 'B', '₹53.8k'),
(672, 'C', '₹46.8k'),
(672, 'D', '₹50k');

-- Topic: Mixed Charts, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(673, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹123k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹49.2k', 'Expenditure = Budget * 40% = 123 * 0.4 = ₹49.2k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(673, 'A', '₹49.2k'),
(673, 'B', '₹54.2k'),
(673, 'C', '₹47.2k'),
(673, 'D', '₹50k');

-- Topic: Mixed Charts, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(674, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹124k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹49.6k', 'Expenditure = Budget * 40% = 124 * 0.4 = ₹49.6k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(674, 'A', '₹49.6k'),
(674, 'B', '₹54.6k'),
(674, 'C', '₹47.6k'),
(674, 'D', '₹50k');

-- Topic: Mixed Charts, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(675, 3, 27, 'Dual Source Extraction', 'A pie chart shows total budget is ₹125k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X.', 'hard', 'A', '₹50.0k', 'Expenditure = Budget * 40% = 125 * 0.4 = ₹50.0k.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(675, 'A', '₹50.0k'),
(675, 'B', '₹55.0k'),
(675, 'C', '₹48.0k'),
(675, 'D', '₹50k');

-- Topic: Caselets, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(676, 3, 28, 'Passage Data Solving', 'In a class of 210 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '84', 'Girls account for 40% of total students. Girls = 210 * 40/100 = 84.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(676, 'A', '94'),
(676, 'B', '79'),
(676, 'C', '84'),
(676, 'D', '126');

-- Topic: Caselets, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(677, 3, 28, 'Passage Data Solving', 'In a class of 220 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '88', 'Girls account for 40% of total students. Girls = 220 * 40/100 = 88.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(677, 'A', '98'),
(677, 'B', '83'),
(677, 'C', '88'),
(677, 'D', '132');

-- Topic: Caselets, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(678, 3, 28, 'Passage Data Solving', 'In a class of 230 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '92', 'Girls account for 40% of total students. Girls = 230 * 40/100 = 92.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(678, 'A', '102'),
(678, 'B', '87'),
(678, 'C', '92'),
(678, 'D', '138');

-- Topic: Caselets, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(679, 3, 28, 'Passage Data Solving', 'In a class of 240 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '96', 'Girls account for 40% of total students. Girls = 240 * 40/100 = 96.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(679, 'A', '106'),
(679, 'B', '91'),
(679, 'C', '96'),
(679, 'D', '144');

-- Topic: Caselets, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(680, 3, 28, 'Passage Data Solving', 'In a class of 250 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '100', 'Girls account for 40% of total students. Girls = 250 * 40/100 = 100.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(680, 'A', '110'),
(680, 'B', '95'),
(680, 'C', '100'),
(680, 'D', '150');

-- Topic: Caselets, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(681, 3, 28, 'Passage Data Solving', 'In a class of 260 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '104', 'Girls account for 40% of total students. Girls = 260 * 40/100 = 104.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(681, 'A', '114'),
(681, 'B', '99'),
(681, 'C', '104'),
(681, 'D', '156');

-- Topic: Caselets, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(682, 3, 28, 'Passage Data Solving', 'In a class of 270 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '108', 'Girls account for 40% of total students. Girls = 270 * 40/100 = 108.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(682, 'A', '118'),
(682, 'B', '103'),
(682, 'C', '108'),
(682, 'D', '162');

-- Topic: Caselets, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(683, 3, 28, 'Passage Data Solving', 'In a class of 280 students, 60% are boys. How many girls are there in the class?', 'easy', 'C', '112', 'Girls account for 40% of total students. Girls = 280 * 40/100 = 112.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(683, 'A', '122'),
(683, 'B', '107'),
(683, 'C', '112'),
(683, 'D', '168');

-- Topic: Caselets, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(684, 3, 28, 'Passage Data Solving', 'In a class of 290 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '116', 'Girls account for 40% of total students. Girls = 290 * 40/100 = 116.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(684, 'A', '126'),
(684, 'B', '111'),
(684, 'C', '116'),
(684, 'D', '174');

-- Topic: Caselets, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(685, 3, 28, 'Passage Data Solving', 'In a class of 300 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '120', 'Girls account for 40% of total students. Girls = 300 * 40/100 = 120.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(685, 'A', '130'),
(685, 'B', '115'),
(685, 'C', '120'),
(685, 'D', '180');

-- Topic: Caselets, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(686, 3, 28, 'Passage Data Solving', 'In a class of 310 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '124', 'Girls account for 40% of total students. Girls = 310 * 40/100 = 124.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(686, 'A', '134'),
(686, 'B', '119'),
(686, 'C', '124'),
(686, 'D', '186');

-- Topic: Caselets, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(687, 3, 28, 'Passage Data Solving', 'In a class of 320 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '128', 'Girls account for 40% of total students. Girls = 320 * 40/100 = 128.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(687, 'A', '138'),
(687, 'B', '123'),
(687, 'C', '128'),
(687, 'D', '192');

-- Topic: Caselets, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(688, 3, 28, 'Passage Data Solving', 'In a class of 330 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '132', 'Girls account for 40% of total students. Girls = 330 * 40/100 = 132.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(688, 'A', '142'),
(688, 'B', '127'),
(688, 'C', '132'),
(688, 'D', '198');

-- Topic: Caselets, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(689, 3, 28, 'Passage Data Solving', 'In a class of 340 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '136', 'Girls account for 40% of total students. Girls = 340 * 40/100 = 136.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(689, 'A', '146'),
(689, 'B', '131'),
(689, 'C', '136'),
(689, 'D', '204');

-- Topic: Caselets, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(690, 3, 28, 'Passage Data Solving', 'In a class of 350 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '140', 'Girls account for 40% of total students. Girls = 350 * 40/100 = 140.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(690, 'A', '150'),
(690, 'B', '135'),
(690, 'C', '140'),
(690, 'D', '210');

-- Topic: Caselets, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(691, 3, 28, 'Passage Data Solving', 'In a class of 360 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '144', 'Girls account for 40% of total students. Girls = 360 * 40/100 = 144.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(691, 'A', '154'),
(691, 'B', '139'),
(691, 'C', '144'),
(691, 'D', '216');

-- Topic: Caselets, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(692, 3, 28, 'Passage Data Solving', 'In a class of 370 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '148', 'Girls account for 40% of total students. Girls = 370 * 40/100 = 148.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(692, 'A', '158'),
(692, 'B', '143'),
(692, 'C', '148'),
(692, 'D', '222');

-- Topic: Caselets, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(693, 3, 28, 'Passage Data Solving', 'In a class of 380 students, 60% are boys. How many girls are there in the class?', 'medium', 'C', '152', 'Girls account for 40% of total students. Girls = 380 * 40/100 = 152.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(693, 'A', '162'),
(693, 'B', '147'),
(693, 'C', '152'),
(693, 'D', '228');

-- Topic: Caselets, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(694, 3, 28, 'Passage Data Solving', 'In a class of 390 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '156', 'Girls account for 40% of total students. Girls = 390 * 40/100 = 156.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(694, 'A', '166'),
(694, 'B', '151'),
(694, 'C', '156'),
(694, 'D', '234');

-- Topic: Caselets, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(695, 3, 28, 'Passage Data Solving', 'In a class of 400 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '160', 'Girls account for 40% of total students. Girls = 400 * 40/100 = 160.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(695, 'A', '170'),
(695, 'B', '155'),
(695, 'C', '160'),
(695, 'D', '240');

-- Topic: Caselets, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(696, 3, 28, 'Passage Data Solving', 'In a class of 410 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '164', 'Girls account for 40% of total students. Girls = 410 * 40/100 = 164.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(696, 'A', '174'),
(696, 'B', '159'),
(696, 'C', '164'),
(696, 'D', '246');

-- Topic: Caselets, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(697, 3, 28, 'Passage Data Solving', 'In a class of 420 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '168', 'Girls account for 40% of total students. Girls = 420 * 40/100 = 168.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(697, 'A', '178'),
(697, 'B', '163'),
(697, 'C', '168'),
(697, 'D', '252');

-- Topic: Caselets, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(698, 3, 28, 'Passage Data Solving', 'In a class of 430 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '172', 'Girls account for 40% of total students. Girls = 430 * 40/100 = 172.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(698, 'A', '182'),
(698, 'B', '167'),
(698, 'C', '172'),
(698, 'D', '258');

-- Topic: Caselets, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(699, 3, 28, 'Passage Data Solving', 'In a class of 440 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '176', 'Girls account for 40% of total students. Girls = 440 * 40/100 = 176.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(699, 'A', '186'),
(699, 'B', '171'),
(699, 'C', '176'),
(699, 'D', '264');

-- Topic: Caselets, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(700, 3, 28, 'Passage Data Solving', 'In a class of 450 students, 60% are boys. How many girls are there in the class?', 'hard', 'C', '180', 'Girls account for 40% of total students. Girls = 450 * 40/100 = 180.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(700, 'A', '190'),
(700, 'B', '175'),
(700, 'C', '180'),
(700, 'D', '270');

-- Topic: Reading Comprehension, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(701, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 1)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(701, 'A', 'Industrial emissions'),
(701, 'B', 'Solar flares'),
(701, 'C', 'Volcanic activity'),
(701, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(702, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 2)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(702, 'A', 'Industrial emissions'),
(702, 'B', 'Solar flares'),
(702, 'C', 'Volcanic activity'),
(702, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(703, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 3)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(703, 'A', 'Industrial emissions'),
(703, 'B', 'Solar flares'),
(703, 'C', 'Volcanic activity'),
(703, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(704, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 4)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(704, 'A', 'Industrial emissions'),
(704, 'B', 'Solar flares'),
(704, 'C', 'Volcanic activity'),
(704, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(705, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 5)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(705, 'A', 'Industrial emissions'),
(705, 'B', 'Solar flares'),
(705, 'C', 'Volcanic activity'),
(705, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(706, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 6)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(706, 'A', 'Industrial emissions'),
(706, 'B', 'Solar flares'),
(706, 'C', 'Volcanic activity'),
(706, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(707, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 7)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(707, 'A', 'Industrial emissions'),
(707, 'B', 'Solar flares'),
(707, 'C', 'Volcanic activity'),
(707, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(708, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 8)', 'easy', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(708, 'A', 'Industrial emissions'),
(708, 'B', 'Solar flares'),
(708, 'C', 'Volcanic activity'),
(708, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(709, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 9)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(709, 'A', 'Industrial emissions'),
(709, 'B', 'Solar flares'),
(709, 'C', 'Volcanic activity'),
(709, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(710, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 10)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(710, 'A', 'Industrial emissions'),
(710, 'B', 'Solar flares'),
(710, 'C', 'Volcanic activity'),
(710, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(711, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 11)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(711, 'A', 'Industrial emissions'),
(711, 'B', 'Solar flares'),
(711, 'C', 'Volcanic activity'),
(711, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(712, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 12)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(712, 'A', 'Industrial emissions'),
(712, 'B', 'Solar flares'),
(712, 'C', 'Volcanic activity'),
(712, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(713, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 13)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(713, 'A', 'Industrial emissions'),
(713, 'B', 'Solar flares'),
(713, 'C', 'Volcanic activity'),
(713, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(714, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 14)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(714, 'A', 'Industrial emissions'),
(714, 'B', 'Solar flares'),
(714, 'C', 'Volcanic activity'),
(714, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(715, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 15)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(715, 'A', 'Industrial emissions'),
(715, 'B', 'Solar flares'),
(715, 'C', 'Volcanic activity'),
(715, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(716, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 16)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(716, 'A', 'Industrial emissions'),
(716, 'B', 'Solar flares'),
(716, 'C', 'Volcanic activity'),
(716, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(717, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 17)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(717, 'A', 'Industrial emissions'),
(717, 'B', 'Solar flares'),
(717, 'C', 'Volcanic activity'),
(717, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(718, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 18)', 'medium', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(718, 'A', 'Industrial emissions'),
(718, 'B', 'Solar flares'),
(718, 'C', 'Volcanic activity'),
(718, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(719, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 19)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(719, 'A', 'Industrial emissions'),
(719, 'B', 'Solar flares'),
(719, 'C', 'Volcanic activity'),
(719, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(720, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 20)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(720, 'A', 'Industrial emissions'),
(720, 'B', 'Solar flares'),
(720, 'C', 'Volcanic activity'),
(720, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(721, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 21)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(721, 'A', 'Industrial emissions'),
(721, 'B', 'Solar flares'),
(721, 'C', 'Volcanic activity'),
(721, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(722, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 22)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(722, 'A', 'Industrial emissions'),
(722, 'B', 'Solar flares'),
(722, 'C', 'Volcanic activity'),
(722, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(723, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 23)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(723, 'A', 'Industrial emissions'),
(723, 'B', 'Solar flares'),
(723, 'C', 'Volcanic activity'),
(723, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(724, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 24)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(724, 'A', 'Industrial emissions'),
(724, 'B', 'Solar flares'),
(724, 'C', 'Volcanic activity'),
(724, 'D', 'Earthquakes');

-- Topic: Reading Comprehension, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(725, 4, 29, 'Contextual Inference', 'Read the passage: ''Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.'' What is the primary driver of sea level rise? (Passage 25)', 'hard', 'A', 'Industrial emissions', 'The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(725, 'A', 'Industrial emissions'),
(725, 'B', 'Solar flares'),
(725, 'C', 'Volcanic activity'),
(725, 'D', 'Earthquakes');

-- Topic: Vocabulary, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(726, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'easy', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(726, 'A', 'Unclear'),
(726, 'B', 'Certain'),
(726, 'C', 'Soft'),
(726, 'D', 'Poor');

-- Topic: Vocabulary, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(727, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'easy', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(727, 'A', 'Kind'),
(727, 'B', 'Cruel'),
(727, 'C', 'Loud'),
(727, 'D', 'Rich');

-- Topic: Vocabulary, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(728, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'easy', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(728, 'A', 'Unclear'),
(728, 'B', 'Certain'),
(728, 'C', 'Soft'),
(728, 'D', 'Poor');

-- Topic: Vocabulary, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(729, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'easy', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(729, 'A', 'Kind'),
(729, 'B', 'Cruel'),
(729, 'C', 'Loud'),
(729, 'D', 'Rich');

-- Topic: Vocabulary, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(730, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'easy', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(730, 'A', 'Unclear'),
(730, 'B', 'Certain'),
(730, 'C', 'Soft'),
(730, 'D', 'Poor');

-- Topic: Vocabulary, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(731, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'easy', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(731, 'A', 'Kind'),
(731, 'B', 'Cruel'),
(731, 'C', 'Loud'),
(731, 'D', 'Rich');

-- Topic: Vocabulary, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(732, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'easy', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(732, 'A', 'Unclear'),
(732, 'B', 'Certain'),
(732, 'C', 'Soft'),
(732, 'D', 'Poor');

-- Topic: Vocabulary, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(733, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'easy', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(733, 'A', 'Kind'),
(733, 'B', 'Cruel'),
(733, 'C', 'Loud'),
(733, 'D', 'Rich');

-- Topic: Vocabulary, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(734, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'medium', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(734, 'A', 'Unclear'),
(734, 'B', 'Certain'),
(734, 'C', 'Soft'),
(734, 'D', 'Poor');

-- Topic: Vocabulary, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(735, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'medium', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(735, 'A', 'Kind'),
(735, 'B', 'Cruel'),
(735, 'C', 'Loud'),
(735, 'D', 'Rich');

-- Topic: Vocabulary, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(736, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'medium', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(736, 'A', 'Unclear'),
(736, 'B', 'Certain'),
(736, 'C', 'Soft'),
(736, 'D', 'Poor');

-- Topic: Vocabulary, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(737, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'medium', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(737, 'A', 'Kind'),
(737, 'B', 'Cruel'),
(737, 'C', 'Loud'),
(737, 'D', 'Rich');

-- Topic: Vocabulary, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(738, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'medium', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(738, 'A', 'Unclear'),
(738, 'B', 'Certain'),
(738, 'C', 'Soft'),
(738, 'D', 'Poor');

-- Topic: Vocabulary, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(739, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'medium', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(739, 'A', 'Kind'),
(739, 'B', 'Cruel'),
(739, 'C', 'Loud'),
(739, 'D', 'Rich');

-- Topic: Vocabulary, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(740, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'medium', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(740, 'A', 'Unclear'),
(740, 'B', 'Certain'),
(740, 'C', 'Soft'),
(740, 'D', 'Poor');

-- Topic: Vocabulary, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(741, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'medium', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(741, 'A', 'Kind'),
(741, 'B', 'Cruel'),
(741, 'C', 'Loud'),
(741, 'D', 'Rich');

-- Topic: Vocabulary, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(742, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'medium', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(742, 'A', 'Unclear'),
(742, 'B', 'Certain'),
(742, 'C', 'Soft'),
(742, 'D', 'Poor');

-- Topic: Vocabulary, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(743, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'medium', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(743, 'A', 'Kind'),
(743, 'B', 'Cruel'),
(743, 'C', 'Loud'),
(743, 'D', 'Rich');

-- Topic: Vocabulary, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(744, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'hard', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(744, 'A', 'Unclear'),
(744, 'B', 'Certain'),
(744, 'C', 'Soft'),
(744, 'D', 'Poor');

-- Topic: Vocabulary, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(745, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'hard', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(745, 'A', 'Kind'),
(745, 'B', 'Cruel'),
(745, 'C', 'Loud'),
(745, 'D', 'Rich');

-- Topic: Vocabulary, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(746, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'hard', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(746, 'A', 'Unclear'),
(746, 'B', 'Certain'),
(746, 'C', 'Soft'),
(746, 'D', 'Poor');

-- Topic: Vocabulary, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(747, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'hard', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(747, 'A', 'Kind'),
(747, 'B', 'Cruel'),
(747, 'C', 'Loud'),
(747, 'D', 'Rich');

-- Topic: Vocabulary, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(748, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'hard', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(748, 'A', 'Unclear'),
(748, 'B', 'Certain'),
(748, 'C', 'Soft'),
(748, 'D', 'Poor');

-- Topic: Vocabulary, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(749, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''BENEVOLENT''?', 'hard', 'A', 'Kind', '''BENEVOLENT'' stands for kind and generous.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(749, 'A', 'Kind'),
(749, 'B', 'Cruel'),
(749, 'C', 'Loud'),
(749, 'D', 'Rich');

-- Topic: Vocabulary, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(750, 4, 30, 'Synonym Matching', 'What is the closest synonym of the word ''AMBIGUOUS''?', 'hard', 'A', 'Unclear', '''AMBIGUOUS'' stands for having double meaning or unclear.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(750, 'A', 'Unclear'),
(750, 'B', 'Certain'),
(750, 'C', 'Soft'),
(750, 'D', 'Poor');

-- Topic: Grammar, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(751, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 1)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(751, 'A', 'Neither of the students is present.'),
(751, 'B', 'Neither of the students are present.'),
(751, 'C', 'Neither of the student are present.'),
(751, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(752, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 2)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(752, 'A', 'Neither of the students is present.'),
(752, 'B', 'Neither of the students are present.'),
(752, 'C', 'Neither of the student are present.'),
(752, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(753, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 3)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(753, 'A', 'Neither of the students is present.'),
(753, 'B', 'Neither of the students are present.'),
(753, 'C', 'Neither of the student are present.'),
(753, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(754, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 4)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(754, 'A', 'Neither of the students is present.'),
(754, 'B', 'Neither of the students are present.'),
(754, 'C', 'Neither of the student are present.'),
(754, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(755, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 5)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(755, 'A', 'Neither of the students is present.'),
(755, 'B', 'Neither of the students are present.'),
(755, 'C', 'Neither of the student are present.'),
(755, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(756, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 6)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(756, 'A', 'Neither of the students is present.'),
(756, 'B', 'Neither of the students are present.'),
(756, 'C', 'Neither of the student are present.'),
(756, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(757, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 7)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(757, 'A', 'Neither of the students is present.'),
(757, 'B', 'Neither of the students are present.'),
(757, 'C', 'Neither of the student are present.'),
(757, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(758, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 8)', 'easy', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(758, 'A', 'Neither of the students is present.'),
(758, 'B', 'Neither of the students are present.'),
(758, 'C', 'Neither of the student are present.'),
(758, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(759, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 9)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(759, 'A', 'Neither of the students is present.'),
(759, 'B', 'Neither of the students are present.'),
(759, 'C', 'Neither of the student are present.'),
(759, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(760, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 10)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(760, 'A', 'Neither of the students is present.'),
(760, 'B', 'Neither of the students are present.'),
(760, 'C', 'Neither of the student are present.'),
(760, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(761, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 11)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(761, 'A', 'Neither of the students is present.'),
(761, 'B', 'Neither of the students are present.'),
(761, 'C', 'Neither of the student are present.'),
(761, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(762, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 12)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(762, 'A', 'Neither of the students is present.'),
(762, 'B', 'Neither of the students are present.'),
(762, 'C', 'Neither of the student are present.'),
(762, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(763, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 13)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(763, 'A', 'Neither of the students is present.'),
(763, 'B', 'Neither of the students are present.'),
(763, 'C', 'Neither of the student are present.'),
(763, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(764, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 14)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(764, 'A', 'Neither of the students is present.'),
(764, 'B', 'Neither of the students are present.'),
(764, 'C', 'Neither of the student are present.'),
(764, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(765, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 15)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(765, 'A', 'Neither of the students is present.'),
(765, 'B', 'Neither of the students are present.'),
(765, 'C', 'Neither of the student are present.'),
(765, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(766, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 16)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(766, 'A', 'Neither of the students is present.'),
(766, 'B', 'Neither of the students are present.'),
(766, 'C', 'Neither of the student are present.'),
(766, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(767, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 17)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(767, 'A', 'Neither of the students is present.'),
(767, 'B', 'Neither of the students are present.'),
(767, 'C', 'Neither of the student are present.'),
(767, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(768, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 18)', 'medium', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(768, 'A', 'Neither of the students is present.'),
(768, 'B', 'Neither of the students are present.'),
(768, 'C', 'Neither of the student are present.'),
(768, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(769, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 19)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(769, 'A', 'Neither of the students is present.'),
(769, 'B', 'Neither of the students are present.'),
(769, 'C', 'Neither of the student are present.'),
(769, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(770, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 20)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(770, 'A', 'Neither of the students is present.'),
(770, 'B', 'Neither of the students are present.'),
(770, 'C', 'Neither of the student are present.'),
(770, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(771, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 21)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(771, 'A', 'Neither of the students is present.'),
(771, 'B', 'Neither of the students are present.'),
(771, 'C', 'Neither of the student are present.'),
(771, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(772, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 22)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(772, 'A', 'Neither of the students is present.'),
(772, 'B', 'Neither of the students are present.'),
(772, 'C', 'Neither of the student are present.'),
(772, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(773, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 23)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(773, 'A', 'Neither of the students is present.'),
(773, 'B', 'Neither of the students are present.'),
(773, 'C', 'Neither of the student are present.'),
(773, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(774, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 24)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(774, 'A', 'Neither of the students is present.'),
(774, 'B', 'Neither of the students are present.'),
(774, 'C', 'Neither of the student are present.'),
(774, 'D', 'Neither of student is present.');

-- Topic: Grammar, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(775, 4, 31, 'Subject-Verb Agreement', 'Identify the grammatically correct sentence from the choices below. (Case 25)', 'hard', 'A', 'Neither of the students is present.', '''Neither'' is a singular pronoun and takes the singular verb ''is''.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(775, 'A', 'Neither of the students is present.'),
(775, 'B', 'Neither of the students are present.'),
(775, 'C', 'Neither of the student are present.'),
(775, 'D', 'Neither of student is present.');

-- Topic: Sentence Completion, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(776, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 1)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(776, 'A', 'mixed'),
(776, 'B', 'unanimous'),
(776, 'C', 'favorable'),
(776, 'D', 'hostile');

-- Topic: Sentence Completion, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(777, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 2)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(777, 'A', 'mixed'),
(777, 'B', 'unanimous'),
(777, 'C', 'favorable'),
(777, 'D', 'hostile');

-- Topic: Sentence Completion, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(778, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 3)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(778, 'A', 'mixed'),
(778, 'B', 'unanimous'),
(778, 'C', 'favorable'),
(778, 'D', 'hostile');

-- Topic: Sentence Completion, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(779, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 4)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(779, 'A', 'mixed'),
(779, 'B', 'unanimous'),
(779, 'C', 'favorable'),
(779, 'D', 'hostile');

-- Topic: Sentence Completion, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(780, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 5)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(780, 'A', 'mixed'),
(780, 'B', 'unanimous'),
(780, 'C', 'favorable'),
(780, 'D', 'hostile');

-- Topic: Sentence Completion, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(781, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 6)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(781, 'A', 'mixed'),
(781, 'B', 'unanimous'),
(781, 'C', 'favorable'),
(781, 'D', 'hostile');

-- Topic: Sentence Completion, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(782, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 7)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(782, 'A', 'mixed'),
(782, 'B', 'unanimous'),
(782, 'C', 'favorable'),
(782, 'D', 'hostile');

-- Topic: Sentence Completion, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(783, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 8)', 'easy', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(783, 'A', 'mixed'),
(783, 'B', 'unanimous'),
(783, 'C', 'favorable'),
(783, 'D', 'hostile');

-- Topic: Sentence Completion, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(784, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 9)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(784, 'A', 'mixed'),
(784, 'B', 'unanimous'),
(784, 'C', 'favorable'),
(784, 'D', 'hostile');

-- Topic: Sentence Completion, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(785, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 10)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(785, 'A', 'mixed'),
(785, 'B', 'unanimous'),
(785, 'C', 'favorable'),
(785, 'D', 'hostile');

-- Topic: Sentence Completion, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(786, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 11)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(786, 'A', 'mixed'),
(786, 'B', 'unanimous'),
(786, 'C', 'favorable'),
(786, 'D', 'hostile');

-- Topic: Sentence Completion, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(787, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 12)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(787, 'A', 'mixed'),
(787, 'B', 'unanimous'),
(787, 'C', 'favorable'),
(787, 'D', 'hostile');

-- Topic: Sentence Completion, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(788, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 13)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(788, 'A', 'mixed'),
(788, 'B', 'unanimous'),
(788, 'C', 'favorable'),
(788, 'D', 'hostile');

-- Topic: Sentence Completion, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(789, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 14)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(789, 'A', 'mixed'),
(789, 'B', 'unanimous'),
(789, 'C', 'favorable'),
(789, 'D', 'hostile');

-- Topic: Sentence Completion, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(790, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 15)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(790, 'A', 'mixed'),
(790, 'B', 'unanimous'),
(790, 'C', 'favorable'),
(790, 'D', 'hostile');

-- Topic: Sentence Completion, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(791, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 16)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(791, 'A', 'mixed'),
(791, 'B', 'unanimous'),
(791, 'C', 'favorable'),
(791, 'D', 'hostile');

-- Topic: Sentence Completion, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(792, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 17)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(792, 'A', 'mixed'),
(792, 'B', 'unanimous'),
(792, 'C', 'favorable'),
(792, 'D', 'hostile');

-- Topic: Sentence Completion, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(793, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 18)', 'medium', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(793, 'A', 'mixed'),
(793, 'B', 'unanimous'),
(793, 'C', 'favorable'),
(793, 'D', 'hostile');

-- Topic: Sentence Completion, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(794, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 19)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(794, 'A', 'mixed'),
(794, 'B', 'unanimous'),
(794, 'C', 'favorable'),
(794, 'D', 'hostile');

-- Topic: Sentence Completion, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(795, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 20)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(795, 'A', 'mixed'),
(795, 'B', 'unanimous'),
(795, 'C', 'favorable'),
(795, 'D', 'hostile');

-- Topic: Sentence Completion, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(796, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 21)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(796, 'A', 'mixed'),
(796, 'B', 'unanimous'),
(796, 'C', 'favorable'),
(796, 'D', 'hostile');

-- Topic: Sentence Completion, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(797, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 22)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(797, 'A', 'mixed'),
(797, 'B', 'unanimous'),
(797, 'C', 'favorable'),
(797, 'D', 'hostile');

-- Topic: Sentence Completion, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(798, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 23)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(798, 'A', 'mixed'),
(798, 'B', 'unanimous'),
(798, 'C', 'favorable'),
(798, 'D', 'hostile');

-- Topic: Sentence Completion, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(799, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 24)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(799, 'A', 'mixed'),
(799, 'B', 'unanimous'),
(799, 'C', 'favorable'),
(799, 'D', 'hostile');

-- Topic: Sentence Completion, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(800, 4, 32, 'Context Word Filling', 'Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence 25)', 'hard', 'A', 'mixed', 'The word ''mixed'' fits the description of both praise and criticism.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(800, 'A', 'mixed'),
(800, 'B', 'unanimous'),
(800, 'C', 'favorable'),
(800, 'D', 'hostile');

-- Topic: Para Jumbles, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(801, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 1)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(801, 'A', 'QRP'),
(801, 'B', 'PRQ'),
(801, 'C', 'PQR'),
(801, 'D', 'RQP');

-- Topic: Para Jumbles, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(802, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 2)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(802, 'A', 'QRP'),
(802, 'B', 'PRQ'),
(802, 'C', 'PQR'),
(802, 'D', 'RQP');

-- Topic: Para Jumbles, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(803, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 3)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(803, 'A', 'QRP'),
(803, 'B', 'PRQ'),
(803, 'C', 'PQR'),
(803, 'D', 'RQP');

-- Topic: Para Jumbles, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(804, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 4)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(804, 'A', 'QRP'),
(804, 'B', 'PRQ'),
(804, 'C', 'PQR'),
(804, 'D', 'RQP');

-- Topic: Para Jumbles, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(805, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 5)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(805, 'A', 'QRP'),
(805, 'B', 'PRQ'),
(805, 'C', 'PQR'),
(805, 'D', 'RQP');

-- Topic: Para Jumbles, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(806, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 6)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(806, 'A', 'QRP'),
(806, 'B', 'PRQ'),
(806, 'C', 'PQR'),
(806, 'D', 'RQP');

-- Topic: Para Jumbles, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(807, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 7)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(807, 'A', 'QRP'),
(807, 'B', 'PRQ'),
(807, 'C', 'PQR'),
(807, 'D', 'RQP');

-- Topic: Para Jumbles, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(808, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 8)', 'easy', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(808, 'A', 'QRP'),
(808, 'B', 'PRQ'),
(808, 'C', 'PQR'),
(808, 'D', 'RQP');

-- Topic: Para Jumbles, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(809, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 9)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(809, 'A', 'QRP'),
(809, 'B', 'PRQ'),
(809, 'C', 'PQR'),
(809, 'D', 'RQP');

-- Topic: Para Jumbles, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(810, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 10)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(810, 'A', 'QRP'),
(810, 'B', 'PRQ'),
(810, 'C', 'PQR'),
(810, 'D', 'RQP');

-- Topic: Para Jumbles, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(811, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 11)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(811, 'A', 'QRP'),
(811, 'B', 'PRQ'),
(811, 'C', 'PQR'),
(811, 'D', 'RQP');

-- Topic: Para Jumbles, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(812, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 12)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(812, 'A', 'QRP'),
(812, 'B', 'PRQ'),
(812, 'C', 'PQR'),
(812, 'D', 'RQP');

-- Topic: Para Jumbles, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(813, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 13)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(813, 'A', 'QRP'),
(813, 'B', 'PRQ'),
(813, 'C', 'PQR'),
(813, 'D', 'RQP');

-- Topic: Para Jumbles, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(814, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 14)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(814, 'A', 'QRP'),
(814, 'B', 'PRQ'),
(814, 'C', 'PQR'),
(814, 'D', 'RQP');

-- Topic: Para Jumbles, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(815, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 15)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(815, 'A', 'QRP'),
(815, 'B', 'PRQ'),
(815, 'C', 'PQR'),
(815, 'D', 'RQP');

-- Topic: Para Jumbles, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(816, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 16)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(816, 'A', 'QRP'),
(816, 'B', 'PRQ'),
(816, 'C', 'PQR'),
(816, 'D', 'RQP');

-- Topic: Para Jumbles, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(817, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 17)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(817, 'A', 'QRP'),
(817, 'B', 'PRQ'),
(817, 'C', 'PQR'),
(817, 'D', 'RQP');

-- Topic: Para Jumbles, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(818, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 18)', 'medium', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(818, 'A', 'QRP'),
(818, 'B', 'PRQ'),
(818, 'C', 'PQR'),
(818, 'D', 'RQP');

-- Topic: Para Jumbles, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(819, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 19)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(819, 'A', 'QRP'),
(819, 'B', 'PRQ'),
(819, 'C', 'PQR'),
(819, 'D', 'RQP');

-- Topic: Para Jumbles, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(820, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 20)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(820, 'A', 'QRP'),
(820, 'B', 'PRQ'),
(820, 'C', 'PQR'),
(820, 'D', 'RQP');

-- Topic: Para Jumbles, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(821, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 21)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(821, 'A', 'QRP'),
(821, 'B', 'PRQ'),
(821, 'C', 'PQR'),
(821, 'D', 'RQP');

-- Topic: Para Jumbles, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(822, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 22)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(822, 'A', 'QRP'),
(822, 'B', 'PRQ'),
(822, 'C', 'PQR'),
(822, 'D', 'RQP');

-- Topic: Para Jumbles, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(823, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 23)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(823, 'A', 'QRP'),
(823, 'B', 'PRQ'),
(823, 'C', 'PQR'),
(823, 'D', 'RQP');

-- Topic: Para Jumbles, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(824, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 24)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(824, 'A', 'QRP'),
(824, 'B', 'PRQ'),
(824, 'C', 'PQR'),
(824, 'D', 'RQP');

-- Topic: Para Jumbles, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(825, 4, 33, 'Cohesive Rearrangement', 'Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set 25)', 'hard', 'A', 'QRP', 'The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P).');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(825, 'A', 'QRP'),
(825, 'B', 'PRQ'),
(825, 'C', 'PQR'),
(825, 'D', 'RQP');

-- Topic: Idioms & Phrases, Q1
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(826, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(826, 'A', 'To reveal a secret'),
(826, 'B', 'To perform hard work'),
(826, 'C', 'To waste food'),
(826, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q2
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(827, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(827, 'A', 'To reveal a secret'),
(827, 'B', 'To perform hard work'),
(827, 'C', 'To waste food'),
(827, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q3
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(828, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(828, 'A', 'To reveal a secret'),
(828, 'B', 'To perform hard work'),
(828, 'C', 'To waste food'),
(828, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q4
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(829, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(829, 'A', 'To reveal a secret'),
(829, 'B', 'To perform hard work'),
(829, 'C', 'To waste food'),
(829, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q5
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(830, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(830, 'A', 'To reveal a secret'),
(830, 'B', 'To perform hard work'),
(830, 'C', 'To waste food'),
(830, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q6
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(831, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(831, 'A', 'To reveal a secret'),
(831, 'B', 'To perform hard work'),
(831, 'C', 'To waste food'),
(831, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q7
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(832, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(832, 'A', 'To reveal a secret'),
(832, 'B', 'To perform hard work'),
(832, 'C', 'To waste food'),
(832, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q8
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(833, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'easy', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(833, 'A', 'To reveal a secret'),
(833, 'B', 'To perform hard work'),
(833, 'C', 'To waste food'),
(833, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q9
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(834, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(834, 'A', 'To reveal a secret'),
(834, 'B', 'To perform hard work'),
(834, 'C', 'To waste food'),
(834, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q10
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(835, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(835, 'A', 'To reveal a secret'),
(835, 'B', 'To perform hard work'),
(835, 'C', 'To waste food'),
(835, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q11
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(836, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(836, 'A', 'To reveal a secret'),
(836, 'B', 'To perform hard work'),
(836, 'C', 'To waste food'),
(836, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q12
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(837, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(837, 'A', 'To reveal a secret'),
(837, 'B', 'To perform hard work'),
(837, 'C', 'To waste food'),
(837, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q13
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(838, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(838, 'A', 'To reveal a secret'),
(838, 'B', 'To perform hard work'),
(838, 'C', 'To waste food'),
(838, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q14
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(839, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(839, 'A', 'To reveal a secret'),
(839, 'B', 'To perform hard work'),
(839, 'C', 'To waste food'),
(839, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q15
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(840, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(840, 'A', 'To reveal a secret'),
(840, 'B', 'To perform hard work'),
(840, 'C', 'To waste food'),
(840, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q16
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(841, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(841, 'A', 'To reveal a secret'),
(841, 'B', 'To perform hard work'),
(841, 'C', 'To waste food'),
(841, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q17
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(842, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(842, 'A', 'To reveal a secret'),
(842, 'B', 'To perform hard work'),
(842, 'C', 'To waste food'),
(842, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q18
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(843, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'medium', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(843, 'A', 'To reveal a secret'),
(843, 'B', 'To perform hard work'),
(843, 'C', 'To waste food'),
(843, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q19
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(844, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(844, 'A', 'To reveal a secret'),
(844, 'B', 'To perform hard work'),
(844, 'C', 'To waste food'),
(844, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q20
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(845, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(845, 'A', 'To reveal a secret'),
(845, 'B', 'To perform hard work'),
(845, 'C', 'To waste food'),
(845, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q21
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(846, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(846, 'A', 'To reveal a secret'),
(846, 'B', 'To perform hard work'),
(846, 'C', 'To waste food'),
(846, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q22
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(847, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(847, 'A', 'To reveal a secret'),
(847, 'B', 'To perform hard work'),
(847, 'C', 'To waste food'),
(847, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q23
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(848, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(848, 'A', 'To reveal a secret'),
(848, 'B', 'To perform hard work'),
(848, 'C', 'To waste food'),
(848, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q24
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(849, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(849, 'A', 'To reveal a secret'),
(849, 'B', 'To perform hard work'),
(849, 'C', 'To waste food'),
(849, 'D', 'To speak loudly');

-- Topic: Idioms & Phrases, Q25
INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(850, 4, 34, 'Idiom Interpretations', 'What is the meaning of the popular idiom ''Spill the beans''?', 'hard', 'A', 'To reveal a secret', '''Spill the beans'' is a common idiom meaning to reveal secret information prematurely.');
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(850, 'A', 'To reveal a secret'),
(850, 'B', 'To perform hard work'),
(850, 'C', 'To waste food'),
(850, 'D', 'To speak loudly');

