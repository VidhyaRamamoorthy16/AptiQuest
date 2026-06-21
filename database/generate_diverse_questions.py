#!/usr/bin/env python3
import random
import datetime

# Output file
OUTPUT_FILE = "database/seed_diverse_questions.sql"

# Data structures for generation based on ACTUAL DB STATE
# ID: (Name, SectionID)
TOPIC_MAP = {
    # Quantitative (Section 1)
    1: ("Number System", 1),
    2: ("Percentages", 1),
    3: ("Time & Work", 1),
    4: ("Time, Speed & Distance", 1),
    10: ("Profit and Loss", 1),
    11: ("Time and Work", 1), # Seemingly duplicate, but exists in DB
    
    # Logical (Section 2)
    5: ("Number Series", 2),
    6: ("Blood Relations", 2),
    7: ("Direction Sense", 2),
    12: ("Seating Arrangement", 2),
    
    # DI (Section 3)
    8: ("Bar Graphs", 3),
    9: ("Pie Charts", 3)
}

def generate_header():
    return f"""-- Diverse Aptitude Questions Seed File
-- Generated on {datetime.datetime.now()}
-- Adds varied questions for all topics

USE aptitudeweb;

"""

def get_difficulty():
    return random.choice(['easy', 'medium', 'hard'])

def generate_number_system_q(topic_id):
    num1 = random.randint(100, 999)
    num2 = random.randint(2, 20)
    
    # Type 1: Divisibility
    q1 = f"What is the remainder when {num1} is divided by {num2}?"
    ans1 = num1 % num2
    opts1 = [ans1, ans1+1, ans1+2, ans1-1 if ans1>0 else ans1+3]
    random.shuffle(opts1)
    
    return {
        "question": q1,
        "options": opts1,
        "correct": ans1,
        "solution": f"{num1} divided by {num2} gives integer quotient {num1//num2} and remainder {ans1}.",
        "explanation": f"Basic division rule: Dividend = Divisor x Quotient + Remainder.",
        "difficulty": get_difficulty(),
        "subtopic": "Divisibility"
    }

def generate_percentages_q(topic_id):
    base = random.randint(100, 500)
    pct = random.choice([10, 20, 25, 50, 75])
    
    # Type 1: Basic calc
    q = f"What is {pct}% of {base}?"
    ans = (pct / 100) * base
    ans = int(ans) if ans.is_integer() else ans
    opts = [ans, ans+10, ans-5, ans*2]
    random.shuffle(opts)
    
    return {
        "question": q,
        "options": opts,
        "correct": ans,
        "solution": f"{pct}% of {base} = ({pct}/100) * {base} = {ans}",
        "explanation": "Percentage formula: (P / 100) * N",
        "difficulty": "easy",
        "subtopic": "Calculation"
    }

GENERIC_TEMPLATES = [
    {
        "q": "Which of the following describes the core concept of '{topic}'?",
        "opts": ["Concept A", "Concept B", "Concept C", "None of the above"],
        "corr": "Concept A",
        "sol": "Concept A is the fundamental definition.",
        "expl": "Theoretical understanding.",
        "sub": "Theory"
    },
    {
        "q": "In a problem involving '{topic}', if the primary variable increases, the result usually:",
        "opts": ["Increases", "Decreases", "Remains Constant", "Varies"],
        "corr": "Increases",
        "sol": "Direct proportionality assumption.",
        "expl": "Linear relationship.",
        "sub": "Conceptual"
    }
]

def generate_generic_q(topic_name):
    base_val = random.randint(10, 100)
    
    if "Time" in topic_name:
        q = f"If Machine A takes {base_val} hours and Machine B takes {base_val*2} hours, together they take?"
        ans = round((base_val * (base_val*2)) / (base_val + base_val*2), 2)
        opts = [ans, ans+2, ans-1, base_val]
        random.shuffle(opts)
        return {
            "question": q,
            "options": opts,
            "correct": ans,
            "solution": "Formula: (A*B)/(A+B)",
            "explanation": "Work equivalence.",
            "difficulty": "medium",
            "subtopic": "Work Calculation"
        }
    
    elif "Distance" in topic_name:
        speed = random.randint(40, 100)
        time = random.randint(2, 5)
        q = f"A train travels at {speed} km/hr for {time} hours. Distance covered?"
        ans = speed * time
        opts = [ans, ans+10, ans-10, ans+50]
        random.shuffle(opts)
        return {
            "question": q,
            "options": opts,
            "correct": ans,
            "solution": "Distance = Speed x Time",
            "explanation": "Basic motion physics.",
            "difficulty": "easy",
            "subtopic": "Distance Calculation"
        }
    
    elif "Profit" in topic_name:
        cp = random.randint(100, 500)
        sp = cp + random.randint(10, 50)
        profit = sp - cp
        q = f"If CP is {cp} and SP is {sp}, what is the profit?"
        opts = [profit, profit+10, profit-5, profit*2]
        random.shuffle(opts)
        return {
            "question": q,
            "options": opts,
            "correct": profit,
            "solution": f"Profit = SP - CP = {sp} - {cp} = {profit}",
            "explanation": "Basic profit definition.",
            "difficulty": "easy",
            "subtopic": "Profit Calculation"
        }
    
    # Default fallback
    q_stub = random.choice(GENERIC_TEMPLATES)
    return {
        "question": q_stub["q"].format(topic=topic_name),
        "options": q_stub["opts"],
        "correct": q_stub["corr"],
        "solution": q_stub["sol"],
        "explanation": q_stub["expl"],
        "difficulty": "medium",
        "subtopic": q_stub["sub"]
    }

def generate_logical_q(topic_name):
    if "Series" in topic_name:
        start = random.randint(1, 10)
        diff = random.randint(2, 5)
        series = [start + i*diff for i in range(5)]
        missing = series[-1]
        display_series = series[:-1]
        
        q = f"Find the next number: {', '.join(map(str, display_series))}, ?"
        opts = [missing, missing+1, missing-1, missing+2]
        random.shuffle(opts)
        
        return {
            "question": q,
            "options": opts,
            "correct": missing,
            "solution": f"AP with diff {diff}. Next: {series[-2]} + {diff} = {missing}.",
            "explanation": "Pattern recognition.",
            "difficulty": "easy",
            "subtopic": "Number Series"
        }
    
    if "Blood" in topic_name:
        relations = ["Father", "Uncle", "Brother", "Grandfather"]
        q = "Pointing to a man, a woman said 'His mother is the only daughter of my mother'. How is the woman related to the man?"
        opts = ["Mother", "Aunt", "Sister", "Grandmother"]
        # Classic riddle: only daughter of my mother = myself. So His mother = myself. Woman is Mother.
        return {
            "question": q,
            "options": opts,
            "correct": "Mother",
            "solution": "The woman is the mother of the man.",
            "explanation": "Breakdown: Only daughter of my mother = Myself.",
            "difficulty": "medium",
            "subtopic": "Relations"
        }
        
    return generate_generic_q(topic_name)

def generate_di_q(topic_name):
    # Text-based DI question
    val1 = random.randint(100, 200)
    val2 = val1 + random.randint(20, 50)
    q = f"In a {topic_name} representation, Group A has {val1} and Group B has {val2}. What is the total?"
    ans = val1 + val2
    opts = [ans, ans+10, ans-10, ans+50]
    random.shuffle(opts)
    
    return {
        "question": q,
        "options": opts,
        "correct": ans,
        "solution": f"Total = {val1} + {val2} = {ans}",
        "explanation": "Data addition.",
        "difficulty": "easy",
        "subtopic": "Data Interpretation"
    }


def format_sql_insert(topic_id, section_id, q_data):
    # Escape quotes
    q_text = str(q_data['question']).replace("'", "''")
    subtopic = str(q_data['subtopic']).replace("'", "''")
    sol = str(q_data['solution']).replace("'", "''")
    expl = str(q_data['explanation']).replace("'", "''")
    
    diff = q_data['difficulty']
    
    # Options handling
    opts_list = q_data['options']
    correct_val = q_data['correct']
    
    # Assign labels A, B, C, D
    labels = ['A', 'B', 'C', 'D']
    correct_label = 'A' # Default fallback
    
    opts_sql_parts = []
    
    for i, opt_val in enumerate(opts_list):
        if i >= 4: break # Max 4 options
        label = labels[i]
        val_str = str(opt_val).replace("'", "''")
        opts_sql_parts.append(f"(@q_id, '{label}', '{val_str}')")
        
        # Simple equality check
        if str(opt_val) == str(correct_val):
            correct_label = label
            
    opts_sql = ",\n".join(opts_sql_parts)
    
    sql = f"""
-- {q_data['subtopic']}
INSERT INTO questions (section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) 
VALUES ({section_id}, {topic_id}, '{subtopic}', '{q_text}', '{diff}', '{correct_label}', '{sol}', '{expl}');
SET @q_id = LAST_INSERT_ID();
INSERT INTO question_options (question_id, option_label, option_text) VALUES
{opts_sql};
"""
    return sql

def main():
    with open(OUTPUT_FILE, 'w') as f:
        f.write(generate_header())
        
        for topic_id, (topic_name, sec_id) in TOPIC_MAP.items():
            f.write(f"\n-- Topic: {topic_name} (ID: {topic_id}, Section: {sec_id})\n")
            
            # Generate 10 questions per topic for more variety
            for _ in range(10): 
                q_data = None
                if sec_id == 1:
                    if "Number" in topic_name and "System" in topic_name:
                        q_data = generate_number_system_q(topic_id)
                    elif "Percentage" in topic_name:
                        q_data = generate_percentages_q(topic_id)
                    else:
                        q_data = generate_generic_q(topic_name)
                elif sec_id == 2:
                    q_data = generate_logical_q(topic_name)
                else: # DI
                    q_data = generate_di_q(topic_name)
                
                f.write(format_sql_insert(topic_id, sec_id, q_data))
                
    print(f"Generated questions in {OUTPUT_FILE}")

if __name__ == "__main__":
    main()
