-- ============================================
-- QUANTITATIVE APTITUDE - PART 2
-- Continuing from questions_quantitative.sql
-- Completing Percentages and adding remaining topics
-- ============================================

USE aptitudeweb;

-- Continue Percentages (Q6-Q18 to reach 18 total)
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

-- Q11: Percentage Change
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Change', 'If the salary of a person is first increased by 25% and then decreased by 20%, what is the net percentage change?', 'medium', 'A',
'Let original salary = 100\nAfter 25% increase: 100 + 25 = 125\nAfter 20% decrease: 125 - (20% of 125) = 125 - 25 = 100\n\nNet change = 100 - 100 = 0\nNet percentage = 0%\n\nAnswer: No change',
'Successive %: 25 - 20 - (25×20/100) = 25 - 20 - 5 = 0%. No net change.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'No change'), (@q_id, 'B', '5% increase'), (@q_id, 'C', '5% decrease'), (@q_id, 'D', '10% increase');

-- Q12: Percentage Marks
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Marks', 'A student scores 85% marks in an exam. If he scored 340 marks, what are the maximum marks?', 'easy', 'C',
'85% of maximum marks = 340\nMaximum marks = 340 ÷ 0.85 = 400\n\nAnswer: 400',
'Direct calculation: Max = Marks ÷ Percentage = 340 ÷ 0.85 = 400.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '350'), (@q_id, 'B', '380'), (@q_id, 'C', '400'), (@q_id, 'D', '420');

-- Q13: Percentage Profit
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Profit', 'If the cost price of an article is 80% of its selling price, what is the profit percentage?', 'medium', 'D',
'Let SP = 100\nCP = 80% of 100 = 80\nProfit = SP - CP = 100 - 80 = 20\n\nProfit % = (Profit/CP) × 100 = (20/80) × 100 = 25%\n\nAnswer: 25%',
'If CP = 0.8 × SP, then Profit = SP - 0.8SP = 0.2SP. Profit % = (0.2SP/0.8SP) × 100 = 25%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '20%'), (@q_id, 'B', '22%'), (@q_id, 'C', '24%'), (@q_id, 'D', '25%');

-- Q14: Three Successive Percentages
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Three Successive Percentages', 'A number is increased by 10%, then decreased by 15%, and then increased by 20%. What is the net percentage change?', 'hard', 'B',
'Let original number = 100\nAfter 10% increase: 100 × 1.10 = 110\nAfter 15% decrease: 110 × 0.85 = 93.5\nAfter 20% increase: 93.5 × 1.20 = 112.2\n\nNet change = 112.2 - 100 = 12.2\nNet percentage = 12.2%\n\nAnswer: 12.2% increase',
'Calculate step by step: 100 → 110 → 93.5 → 112.2. Net = 12.2% increase.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '10% increase'), (@q_id, 'B', '12.2% increase'), (@q_id, 'C', '15% increase'), (@q_id, 'D', '18% increase');

-- Q15: Percentage Distribution
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Distribution', 'In a class of 60 students, 40% are girls. If 25% of the girls and 50% of the boys play cricket, how many students play cricket?', 'hard', 'C',
'Total students = 60\nGirls = 40% of 60 = 24\nBoys = 60 - 24 = 36\n\nGirls playing cricket = 25% of 24 = 6\nBoys playing cricket = 50% of 36 = 18\n\nTotal playing cricket = 6 + 18 = 24\n\nAnswer: 24',
'Calculate each group separately: Girls (24 × 0.25) + Boys (36 × 0.50) = 6 + 18 = 24.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '20'), (@q_id, 'B', '22'), (@q_id, 'C', '24'), (@q_id, 'D', '26');

-- Q16: Percentage and Fractions
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage and Fractions', 'If 2/5 of a number is 40, what is 60% of that number?', 'easy', 'B',
'Let the number be x.\n2/5 of x = 40\nx = 40 × (5/2) = 100\n\n60% of 100 = 0.60 × 100 = 60\n\nAnswer: 60',
'2/5 = 40%, so if 40% = 40, then 60% = 60. Or: x = 40 × 5/2 = 100, then 60% of 100 = 60.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '50'), (@q_id, 'B', '60'), (@q_id, 'C', '70'), (@q_id, 'D', '80');

-- Q17: Percentage Discount
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Discount', 'A shopkeeper gives 20% discount on marked price and still makes a profit of 25%. If the cost price is Rs. 200, what is the marked price?', 'hard', 'D',
'CP = Rs. 200\nProfit = 25% of CP = 25% of 200 = Rs. 50\nSP = CP + Profit = 200 + 50 = Rs. 250\n\nSP = MP - Discount\nSP = MP - 20% of MP\n250 = MP × 0.80\nMP = 250 ÷ 0.80 = Rs. 312.50\n\nAnswer: Rs. 312.50',
'SP = CP × 1.25 = 250. Since SP = 0.8 × MP, then MP = SP ÷ 0.8 = 250 ÷ 0.8 = 312.50.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 280'), (@q_id, 'B', 'Rs. 300'), (@q_id, 'C', 'Rs. 310'), (@q_id, 'D', 'Rs. 312.50');

-- Q18: Percentage Voting
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Percentage Voting', 'In an election, a candidate got 55% of the votes and won by a margin of 3000 votes. What is the total number of votes?', 'medium', 'C',
'Let total votes = 100x\nWinner got = 55x\nLoser got = 45x\nMargin = 55x - 45x = 10x\n\n10x = 3000\nx = 300\nTotal votes = 100 × 300 = 30000\n\nAnswer: 30000',
'Margin = 10% of total = 3000, so total = 3000 ÷ 0.10 = 30000.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '25000'), (@q_id, 'B', '28000'), (@q_id, 'C', '30000'), (@q_id, 'D', '32000');

-- ============================================
-- PROFIT & LOSS (Topic ID: 3) - 18 Questions
-- ============================================

-- Q1: Basic Profit
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Basic Profit', 'A shopkeeper buys an article for Rs. 500 and sells it for Rs. 600. What is his profit percentage?', 'easy', 'B',
'CP = Rs. 500\nSP = Rs. 600\nProfit = SP - CP = 600 - 500 = Rs. 100\n\nProfit % = (Profit/CP) × 100 = (100/500) × 100 = 20%\n\nAnswer: 20%',
'Direct formula: Profit % = ((SP-CP)/CP) × 100 = (100/500) × 100 = 20%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '15%'), (@q_id, 'B', '20%'), (@q_id, 'C', '25%'), (@q_id, 'D', '30%');

-- Q2: Loss Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Loss Percentage', 'A man sells an article at a loss of 10%. If he had sold it for Rs. 45 more, he would have gained 5%. What is the cost price?', 'medium', 'C',
'Let CP = 100x\nAt 10% loss, SP = 90x\nAt 5% gain, SP = 105x\n\nDifference = 105x - 90x = 15x = 45\nx = 3\nCP = 100 × 3 = Rs. 300\n\nAnswer: Rs. 300',
'Difference between selling prices = 15% of CP = 45, so CP = 45 ÷ 0.15 = 300.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 250'), (@q_id, 'B', 'Rs. 280'), (@q_id, 'C', 'Rs. 300'), (@q_id, 'D', 'Rs. 320');

-- Q3: Successive Profit/Loss
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Successive Profit/Loss', 'A shopkeeper marks his goods 20% above cost price and gives a discount of 10%. What is his profit percentage?', 'medium', 'A',
'Let CP = 100\nMP = 100 + 20% of 100 = 120\nDiscount = 10% of 120 = 12\nSP = MP - Discount = 120 - 12 = 108\n\nProfit = SP - CP = 108 - 100 = 8\nProfit % = (8/100) × 100 = 8%\n\nAnswer: 8%',
'Net effect: 20% markup then 10% discount = 20 - 10 - (20×10/100) = 20 - 10 - 2 = 8% profit.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '8%'), (@q_id, 'B', '10%'), (@q_id, 'C', '12%'), (@q_id, 'D', '15%');

-- Continue with more Profit & Loss questions (Q4-Q18)...
-- Due to length, I'll create this as a separate continuation


-- Q4: Profit on Cost vs Selling Price
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Profit Calculation', 'If a shopkeeper sells an article at 20% profit, what is the profit percentage on the selling price?', 'medium', 'C',
'Let CP = 100\nProfit = 20% of CP = 20\nSP = CP + Profit = 100 + 20 = 120\n\nProfit % on SP = (Profit/SP) × 100 = (20/120) × 100 = 16.67%\n\nAnswer: 16.67%',
'If profit is 20% on CP, then profit on SP = 20/(100+20) × 100 = 16.67%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '15%'), (@q_id, 'B', '16%'), (@q_id, 'C', '16.67%'), (@q_id, 'D', '18%');

-- Q5: Two Articles Same SP
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Two Articles', 'A man sells two articles for Rs. 2400 each. On one he gains 20% and on the other he loses 20%. What is his overall profit or loss?', 'hard', 'B',
'First article:\nSP = 2400, Profit = 20%\nCP1 = SP/(1 + profit%) = 2400/1.20 = 2000\n\nSecond article:\nSP = 2400, Loss = 20%\nCP2 = SP/(1 - loss%) = 2400/0.80 = 3000\n\nTotal CP = 2000 + 3000 = 5000\nTotal SP = 2400 + 2400 = 4800\nLoss = 5000 - 4800 = 200\nLoss % = (200/5000) × 100 = 4%\n\nAnswer: 4% loss',
'When SP is same and profit% = loss%, there is always a loss. Loss % = (profit%)²/(100² - profit²) = 400/10000 = 4%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'No profit no loss'), (@q_id, 'B', '4% loss'), (@q_id, 'C', '4% profit'), (@q_id, 'D', '8% loss');

-- Q6: Discount and Profit
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Discount and Profit', 'A shopkeeper marks his goods 30% above cost price and allows a discount of 15%. What is his profit percentage?', 'medium', 'C',
'Let CP = 100\nMP = 100 + 30% of 100 = 130\nDiscount = 15% of 130 = 19.5\nSP = MP - Discount = 130 - 19.5 = 110.5\n\nProfit = SP - CP = 110.5 - 100 = 10.5\nProfit % = (10.5/100) × 100 = 10.5%\n\nAnswer: 10.5%',
'Net effect: 30% markup then 15% discount = 30 - 15 - (30×15/100) = 30 - 15 - 4.5 = 10.5% profit.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '9%'), (@q_id, 'B', '10%'), (@q_id, 'C', '10.5%'), (@q_id, 'D', '12%');

-- Q7: Finding CP from SP
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Finding CP', 'By selling an article for Rs. 720, a shopkeeper loses 10%. At what price should he sell it to gain 20%?', 'medium', 'D',
'SP = 720, Loss = 10%\nCP = SP/(1 - loss%) = 720/0.90 = 800\n\nTo gain 20%:\nNew SP = CP × (1 + profit%) = 800 × 1.20 = 960\n\nAnswer: Rs. 960',
'First find CP = 720/0.90 = 800, then new SP = 800 × 1.20 = 960.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 900'), (@q_id, 'B', 'Rs. 920'), (@q_id, 'C', 'Rs. 940'), (@q_id, 'D', 'Rs. 960');

-- Q8: Equal Profit Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Equal Profit', 'A shopkeeper sells two articles at the same selling price. On the first article, he gains 25% and on the second, he loses 25%. What is his overall profit or loss percentage?', 'hard', 'C',
'Let SP of each = 100\n\nFirst article: Profit = 25%\nCP1 = 100/1.25 = 80\n\nSecond article: Loss = 25%\nCP2 = 100/0.75 = 133.33\n\nTotal CP = 80 + 133.33 = 213.33\nTotal SP = 100 + 100 = 200\nLoss = 213.33 - 200 = 13.33\nLoss % = (13.33/213.33) × 100 = 6.25%\n\nAnswer: 6.25% loss',
'When profit% = loss% and SP is same, loss% = (profit%)²/(100² - profit²) = 625/10000 = 6.25%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'No profit no loss'), (@q_id, 'B', '5% loss'), (@q_id, 'C', '6.25% loss'), (@q_id, 'D', '10% loss');

-- Q9: Profit Percentage Calculation
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Profit Percentage', 'A man buys 10 articles for Rs. 8 and sells 8 articles for Rs. 10. What is his profit percentage?', 'hard', 'D',
'CP of 10 articles = Rs. 8\nCP of 1 article = 8/10 = Rs. 0.80\n\nSP of 8 articles = Rs. 10\nSP of 1 article = 10/8 = Rs. 1.25\n\nProfit per article = 1.25 - 0.80 = Rs. 0.45\nProfit % = (0.45/0.80) × 100 = 56.25%\n\nAnswer: 56.25%',
'CP per article = 0.80, SP per article = 1.25. Profit % = (0.45/0.80) × 100 = 56.25%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '50%'), (@q_id, 'B', '52%'), (@q_id, 'C', '54%'), (@q_id, 'D', '56.25%');

-- Q10: Successive Discounts
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Successive Discounts', 'A shopkeeper gives two successive discounts of 20% and 15% on an article. If the marked price is Rs. 1000, what is the selling price?', 'medium', 'B',
'MP = Rs. 1000\nFirst discount = 20%\nPrice after first discount = 1000 × 0.80 = 800\n\nSecond discount = 15%\nSP = 800 × 0.85 = 680\n\nAnswer: Rs. 680',
'Successive discounts: SP = MP × (1-d1) × (1-d2) = 1000 × 0.80 × 0.85 = 680.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 650'), (@q_id, 'B', 'Rs. 680'), (@q_id, 'C', 'Rs. 700'), (@q_id, 'D', 'Rs. 720');

-- Q11: Profit and Loss Mix
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Profit and Loss Mix', 'A trader marks his goods 40% above cost price but allows a discount of 20% on marked price. What is his profit percentage?', 'medium', 'A',
'Let CP = 100\nMP = 100 + 40% of 100 = 140\nDiscount = 20% of 140 = 28\nSP = MP - Discount = 140 - 28 = 112\n\nProfit = SP - CP = 112 - 100 = 12\nProfit % = (12/100) × 100 = 12%\n\nAnswer: 12%',
'Net effect: 40% markup then 20% discount = 40 - 20 - (40×20/100) = 40 - 20 - 8 = 12% profit.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '12%'), (@q_id, 'B', '15%'), (@q_id, 'C', '18%'), (@q_id, 'D', '20%');

-- Q12: Finding Original CP
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Finding Original CP', 'By selling an article for Rs. 900, a person gains 12.5%. If he sells it for Rs. 800, what is his gain or loss percentage?', 'medium', 'C',
'SP = 900, Profit = 12.5%\nCP = SP/(1 + profit%) = 900/1.125 = 800\n\nIf SP = 800 and CP = 800:\nNo profit, no loss\n\nAnswer: No profit no loss',
'CP = 900/1.125 = 800. If SP = 800, then no profit no loss.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '10% loss'), (@q_id, 'B', '5% loss'), (@q_id, 'C', 'No profit no loss'), (@q_id, 'D', '5% profit');

-- Q13: Profit on Each Article
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Profit on Each', 'A shopkeeper buys 20 articles for Rs. 1000 and sells them at a profit of 25%. Find the selling price of each article.', 'easy', 'B',
'CP of 20 articles = Rs. 1000\nCP of 1 article = 1000/20 = Rs. 50\n\nProfit = 25% of CP = 25% of 50 = Rs. 12.50\nSP of 1 article = CP + Profit = 50 + 12.50 = Rs. 62.50\n\nAnswer: Rs. 62.50',
'CP per article = 50, SP = 50 × 1.25 = 62.50.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 60'), (@q_id, 'B', 'Rs. 62.50'), (@q_id, 'C', 'Rs. 65'), (@q_id, 'D', 'Rs. 67.50');

-- Q14: Loss Percentage
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Loss Percentage', 'A man sells an article for Rs. 450 and incurs a loss of 10%. What was the cost price?', 'easy', 'C',
'SP = Rs. 450, Loss = 10%\nCP = SP/(1 - loss%) = 450/0.90 = 500\n\nAnswer: Rs. 500',
'Direct formula: CP = SP ÷ (1 - loss%) = 450 ÷ 0.90 = 500.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 480'), (@q_id, 'B', 'Rs. 490'), (@q_id, 'C', 'Rs. 500'), (@q_id, 'D', 'Rs. 510');

-- Q15: Complex Profit Loss
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Complex Profit Loss', 'A shopkeeper sells an article at 20% profit. If he had bought it at 10% less and sold it for Rs. 10 more, he would have gained 30%. Find the cost price.', 'hard', 'A',
'Let original CP = 100x\nOriginal SP = 120x (20% profit)\n\nNew CP = 90x (10% less)\nNew SP = 120x + 10\nNew profit = 30%\n\nNew SP = New CP × 1.30\n120x + 10 = 90x × 1.30\n120x + 10 = 117x\n3x = 10\nx = 10/3\n\nOriginal CP = 100 × (10/3) = 1000/3 = Rs. 333.33\n\nAnswer: Rs. 333.33',
'Set up equations: Original SP = 1.2CP, New SP = 0.9CP + 10 = 1.3(0.9CP). Solve for CP.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 333.33'), (@q_id, 'B', 'Rs. 350'), (@q_id, 'C', 'Rs. 400'), (@q_id, 'D', 'Rs. 450');

-- Q16: Marked Price and Discount
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Marked Price', 'A shopkeeper marks his goods 25% above cost price and gives a discount of 10%. If the cost price is Rs. 400, what is the selling price?', 'easy', 'B',
'CP = Rs. 400\nMP = 400 + 25% of 400 = 400 + 100 = 500\nDiscount = 10% of 500 = 50\nSP = MP - Discount = 500 - 50 = 450\n\nAnswer: Rs. 450',
'MP = CP × 1.25 = 500, SP = MP × 0.90 = 450.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 440'), (@q_id, 'B', 'Rs. 450'), (@q_id, 'C', 'Rs. 460'), (@q_id, 'D', 'Rs. 470');

-- Q17: Profit on Selling Price
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Profit on SP', 'If the profit is 25% of the selling price, what is the profit percentage on the cost price?', 'medium', 'D',
'Let SP = 100\nProfit = 25% of SP = 25\nCP = SP - Profit = 100 - 25 = 75\n\nProfit % on CP = (Profit/CP) × 100 = (25/75) × 100 = 33.33%\n\nAnswer: 33.33%',
'If profit = 25% of SP, then CP = 75% of SP. Profit on CP = 25/75 × 100 = 33.33%.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', '30%'), (@q_id, 'B', '31%'), (@q_id, 'C', '32%'), (@q_id, 'D', '33.33%');

-- Q18: Final Profit & Loss Question
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 3, 'Final P&L', 'A trader sells two articles. On the first, he gains 20% and on the second, he loses 20%. If the selling prices are equal and the total loss is Rs. 100, find the cost price of the first article.', 'hard', 'C',
'Let SP of each = 100x\n\nFirst article: Profit = 20%\nCP1 = 100x/1.20 = 83.33x\n\nSecond article: Loss = 20%\nCP2 = 100x/0.80 = 125x\n\nTotal CP = 83.33x + 125x = 208.33x\nTotal SP = 100x + 100x = 200x\nLoss = 208.33x - 200x = 8.33x = 100\nx = 12\n\nCP1 = 83.33 × 12 = Rs. 1000\n\nAnswer: Rs. 1000',
'Set up equations with equal SP. Total loss = 100. Solve for x, then find CP1.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Rs. 800'), (@q_id, 'B', 'Rs. 900'), (@q_id, 'C', 'Rs. 1000'), (@q_id, 'D', 'Rs. 1200');

