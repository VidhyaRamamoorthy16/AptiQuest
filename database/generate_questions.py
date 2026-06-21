#!/usr/bin/env python3
"""
Script to generate comprehensive aptitude questions for database import.
Generates 15+ questions per topic with proper SQL format.
"""

# Topic mappings (topic_id: topic_name)
QUANTITATIVE_TOPICS = {
    1: "Number System",
    2: "Percentages", 
    3: "Profit & Loss",
    4: "Simple & Compound Interest",
    5: "Time & Work",
    6: "Time, Speed & Distance",
    7: "Ratio & Proportion",
    8: "Averages",
    9: "Algebra",
    10: "Permutations & Combinations",
    11: "Probability",
    13: "Pipes & Cisterns",
    14: "Mixtures & Alligations"
}

def generate_sql_header():
    return """-- Comprehensive Aptitude Questions
-- Generated for Recent Interview Patterns (2023-2025)
-- 15+ questions per topic

USE aptitudeweb;

"""

def generate_question_sql(section_id, topic_id, topic_name, subtopic, question, 
                          options, correct_answer, difficulty, solution, explanation):
    """Generate SQL for a single question with options."""
    
    # Escape single quotes in strings
    def escape_sql(s):
        return s.replace("'", "''")
    
    sql = f"""
-- {topic_name} - {subtopic}
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES
({section_id}, {topic_id}, '{escape_sql(subtopic)}', '{escape_sql(question)}', '{difficulty}', '{correct_answer}',
'{escape_sql(solution)}',
'{escape_sql(explanation)}');

SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
"""
    
    for opt_label, opt_text in options:
        sql += f"(@q_id, '{opt_label}', '{escape_sql(opt_text)}'),\n"
    
    sql = sql.rstrip(',\n') + ";\n\n"
    return sql

# This is a template - actual questions will be generated below
print("Question generator script created. Use this to generate SQL files.")

