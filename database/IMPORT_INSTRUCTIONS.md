# Question Import Instructions

## Current Status

✅ **Completed:**
- Number System: 16 questions (exceeds requirement)
- SQL format verified and ready for import

🚧 **To Be Generated:**
- Remaining 11 Quantitative topics (165+ questions)
- 10 Logical Reasoning topics (150+ questions)
- 6 Data Interpretation topics (90+ questions)

## Import Existing Questions

```bash
# Import Number System questions
mysql -u root aptitudeweb < questions_quantitative.sql

# Verify import
mysql -u root aptitudeweb -e "SELECT COUNT(*) FROM questions WHERE topic_id = 1;"
```

## Question Format Reference

Each question follows this SQL structure:

```sql
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
(1, 2, 'Subtopic', 'Question text?', 'medium', 'B',
'Step-by-step solution...',
'Shortcut explanation.');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
(@q_id, 'A', 'Option A'),
(@q_id, 'B', 'Option B'),
(@q_id, 'C', 'Option C'),
(@q_id, 'D', 'Option D');
```

## Topic IDs Reference

### Quantitative (Section 1)
- 1: Number System ✅
- 2: Percentages
- 3: Profit & Loss
- 4: Simple & Compound Interest
- 5: Time & Work
- 6: Time, Speed & Distance
- 7: Ratio & Proportion
- 8: Averages
- 9: Algebra
- 10: Permutations & Combinations
- 11: Probability
- 13: Pipes & Cisterns
- 14: Mixtures & Alligations

### Logical Reasoning (Section 2)
- 15: Coding-Decoding
- 16: Blood Relations
- 17: Direction Sense
- 18: Seating Arrangement
- 19: Puzzles
- 20: Syllogism
- 21: Statements & Conclusions
- 22: Series
- 23: Analogies
- 24: Venn Diagrams

### Data Interpretation (Section 3)
- 25: Tables
- 26: Bar Graphs
- 27: Line Charts
- 28: Pie Charts
- 29: Case-lets
- 30: Mixed DI

## Generating More Questions

You can:
1. **Extend existing SQL files** - Add more INSERT statements following the format
2. **Use the Python script** - Modify `generate_complete_questions.py` to generate questions
3. **Manual entry** - Use the format above to add questions directly

## Quality Checklist

Each question should have:
- ✅ Clear, unambiguous question text
- ✅ 4 distinct options (A, B, C, D)
- ✅ One clearly correct answer
- ✅ Detailed step-by-step solution
- ✅ Shortcut/trick explanation
- ✅ Appropriate difficulty level
- ✅ Interview relevance (2023-2025 patterns)

## Testing After Import

```sql
-- Check question count per topic
SELECT t.name, COUNT(q.id) as question_count 
FROM topics t 
LEFT JOIN questions q ON t.id = q.topic_id 
GROUP BY t.id, t.name 
ORDER BY t.section_id, t.id;

-- Test a question retrieval
SELECT q.*, GROUP_CONCAT(CONCAT(o.option_label, ': ', o.option_text) SEPARATOR ' | ') as options
FROM questions q
JOIN question_options o ON q.id = o.question_id
WHERE q.id = 1
GROUP BY q.id;
```

## Next Actions

1. ✅ Import existing Number System questions
2. Generate questions for remaining topics using the format above
3. Import all questions
4. Test the application with new questions

