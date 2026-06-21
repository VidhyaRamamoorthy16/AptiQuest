# Questions Generation Guide

## Overview
This document provides a systematic approach to generating 15+ interview-oriented questions per topic for the AptitudeWeb platform.

## Current Status

### ✅ Completed
- Number System: 16 questions (exceeds requirement)

### 🚧 In Progress
- Need to generate 15+ questions for remaining 11 Quantitative topics
- Need to generate 15+ questions for 10 Logical Reasoning topics  
- Need to generate 15+ questions for 6 Data Interpretation topics

## Question Format Template

```sql
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(section_id, topic_id, 'Subtopic Name', 'Question text here?', 'easy|medium|hard', 'A|B|C|D',
'Detailed step-by-step solution here...',
'Shortcut/trick explanation here.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Option A text'),
(@q_id, 'B', 'Option B text'),
(@q_id, 'C', 'Option C text'),
(@q_id, 'D', 'Option D text');
```

## Topic Priority (Based on Interview Frequency)

### 🔥 HIGH PRIORITY (Generate First)
1. Percentages
2. Profit & Loss
3. Time & Work
4. Ratio & Proportion
5. Coding & Decoding
6. Blood Relations
7. Table-based DI

### ⚡ MEDIUM PRIORITY
1. Simple & Compound Interest
2. Time, Speed & Distance
3. Averages
4. Number & Alphabet Series
5. Direction Sense
6. Bar Graph DI

### 📚 STANDARD PRIORITY
1. Mixtures & Alligations
2. Pipes & Cisterns
3. Probability
4. Permutations & Combinations
5. Seating Arrangement
6. Puzzles
7. Line Chart DI
8. Pie Chart DI

## Question Difficulty Distribution

For each topic, aim for:
- Easy: 30% (5 questions)
- Medium: 50% (8 questions)
- Hard: 20% (3 questions)

## Interview Relevance Tags

Mark questions with:
- **Service-based**: TCS, Infosys, Wipro, Cognizant, Capgemini
- **Product-based**: Google, Microsoft, Amazon, Flipkart
- **Freshers**: Entry-level positions
- **Experienced**: 2+ years experience

## Next Steps

1. Complete Quantitative Aptitude questions (11 topics remaining)
2. Generate Logical Reasoning questions (10 topics)
3. Generate Data Interpretation questions (6 topics)
4. Validate all questions for accuracy
5. Import into database

## Usage

To import questions:
```bash
mysql -u root aptitudeweb < questions_quantitative.sql
mysql -u root aptitudeweb < questions_logical.sql
mysql -u root aptitudeweb < questions_di.sql
```

