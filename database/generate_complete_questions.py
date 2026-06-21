#!/usr/bin/env python3
"""
Complete Question Generator for AptitudeWeb
Generates 15+ interview-oriented questions per topic
"""

questions_data = {
    "quantitative": {
        "Percentages": [
            {
                "subtopic": "Basic Percentage",
                "question": "If 40% of a number is 120, what is 75% of that number?",
                "options": ["180", "200", "225", "250"],
                "correct": "C",
                "difficulty": "easy",
                "solution": "Let the number be x.\n40% of x = 120\n0.40x = 120\nx = 120 ÷ 0.40 = 300\n\n75% of 300 = 0.75 × 300 = 225",
                "explanation": "Find the number first: 120 ÷ 0.40 = 300, then 75% of 300 = 225."
            },
            # Add more questions here...
        ]
    }
}

def generate_sql(questions, section_id, topic_id, topic_name):
    """Generate SQL INSERT statements for questions"""
    sql = f"\n-- ============================================\n-- {topic_name.upper()} (Topic ID: {topic_id}) - {len(questions)} Questions\n-- ============================================\n\n"
    
    for i, q in enumerate(questions, 1):
        # Escape single quotes
        def escape(s):
            return s.replace("'", "''")
        
        sql += f"-- Q{i}: {q['subtopic']}\n"
        sql += f"INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES\n"
        sql += f"({section_id}, {topic_id}, '{escape(q['subtopic'])}', '{escape(q['question'])}', '{q['difficulty']}', '{q['correct']}',\n"
        sql += f"'{escape(q['solution'])}',\n"
        sql += f"'{escape(q['explanation'])}');\n\n"
        sql += "SET @q_id = LAST_INSERT_ID();\n"
        sql += "INSERT INTO question_options (question_id, option_label, option_text) VALUES\n"
        
        for opt in ['A', 'B', 'C', 'D']:
            idx = ord(opt) - ord('A')
            sql += f"(@q_id, '{opt}', '{escape(q['options'][idx])}'),\n"
        
        sql = sql.rstrip(',\n') + ";\n\n"
    
    return sql

if __name__ == "__main__":
    print("Question generator script ready.")
    print("This script can be extended to generate all 420+ questions.")
    print("For now, use the SQL files provided.")

