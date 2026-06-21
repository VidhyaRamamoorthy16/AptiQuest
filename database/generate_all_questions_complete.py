#!/usr/bin/env python3
import sys
import os

def escape_sql(text):
    return text.replace("'", "''").replace("\n", "\\n")

# Section mappings
SECTIONS = {
    1: "Quantitative Aptitude",
    2: "Logical Reasoning",
    3: "Data Interpretation",
    4: "Verbal Ability"
}

# 34 Topics
TOPIC_LIST = [
    # Quant (id 1-12)
    (1, 1, "Percentages", "Percentage calculations and applications"),
    (1, 2, "Profit & Loss", "Business math and trade calculations"),
    (1, 3, "Time & Work", "Work rate problems"),
    (1, 4, "Time, Speed & Distance", "Motion and travel problems"),
    (1, 5, "Simple & Compound Interest", "Interest calculations"),
    (1, 6, "Ratio & Proportion", "Comparative quantities"),
    (1, 7, "Number System", "Divisibility, factors, HCF, LCM"),
    (1, 8, "Averages", "Mean, weighted average"),
    (1, 9, "Mixtures & Alligations", "Mixing problems"),
    (1, 10, "Permutation & Combination", "Counting methods"),
    (1, 11, "Probability", "Chance and likelihood"),
    (1, 12, "Geometry & Mensuration", "Shapes, areas, volumes"),
    # Logical (id 13-22)
    (2, 13, "Blood Relations", "Family relationship puzzles"),
    (2, 14, "Seating Arrangement", "Linear and circular arrangements"),
    (2, 15, "Syllogisms", "Logical deduction from statements"),
    (2, 16, "Coding-Decoding", "Pattern-based encoding"),
    (2, 17, "Direction Sense", "Navigation and direction problems"),
    (2, 18, "Number Series", "Finding missing numbers in patterns"),
    (2, 19, "Analogies", "Relationship-based reasoning"),
    (2, 20, "Puzzles", "Multi-constraint logical puzzles"),
    (2, 21, "Clocks & Calendars", "Time and date reasoning"),
    (2, 22, "Input-Output", "Machine-based transformation"),
    # DI (id 23-28)
    (3, 23, "Bar Charts", "Reading and analyzing bar graphs"),
    (3, 24, "Line Graphs", "Trend analysis from line charts"),
    (3, 25, "Pie Charts", "Percentage-based circular charts"),
    (3, 26, "Tables", "Tabular data analysis"),
    (3, 27, "Mixed Charts", "Combined chart types"),
    (3, 28, "Caselets", "Paragraph-based data"),
    # Verbal (id 29-34)
    (4, 29, "Reading Comprehension", "Passage-based questions"),
    (4, 30, "Vocabulary", "Synonyms, antonyms, one-word substitution"),
    (4, 31, "Grammar", "Error spotting, sentence correction"),
    (4, 32, "Sentence Completion", "Fill in the blanks"),
    (4, 33, "Para Jumbles", "Rearranging scrambled sentences"),
    (4, 34, "Idioms & Phrases", "Meaning and usage")
]

def generate_questions():
    sql = []
    sql.append("SET FOREIGN_KEY_CHECKS = 0;")
    sql.append("TRUNCATE TABLE test_attempt_answers;")
    sql.append("TRUNCATE TABLE test_attempts;")
    sql.append("TRUNCATE TABLE user_attempts;")
    sql.append("TRUNCATE TABLE question_options;")
    sql.append("TRUNCATE TABLE questions;")
    sql.append("TRUNCATE TABLE topics;")
    sql.append("SET FOREIGN_KEY_CHECKS = 1;")
    sql.append("")

    # Seed Topics
    for sec_id, topic_id, name, desc in TOPIC_LIST:
        sql.append(f"INSERT INTO topics (id, section_id, name, description) VALUES ({topic_id}, {sec_id}, '{escape_sql(name)}', '{escape_sql(desc)}');")
    
    sql.append("")

    # Generate 25 questions for each of the 34 topics (Total 850 questions)
    for sec_id, topic_id, topic_name, _ in TOPIC_LIST:
        for i in range(1, 26):
            q_id = (topic_id - 1) * 25 + i
            difficulty = "easy" if i <= 8 else ("medium" if i <= 18 else "hard")
            
            # Default options and correct mapping
            opts = ["Option A", "Option B", "Option C", "Option D"]
            correct = "A"
            explanation = "Standard explanation for this exercise."
            subtopic = f"Concept practice {i}"
            question_text = f"Question {i} text placeholder."

            # Customize by topic name
            if topic_name == "Percentages":
                val1 = i * 4
                val2 = 200 + i * 20
                ans_val = (val1 / 100) * val2
                subtopic = "Finding percentage of a number"
                question_text = f"What is {val1}% of {val2}?"
                opts = [f"{ans_val}", f"{ans_val + 5}", f"{ans_val - 10}", f"{ans_val * 1.5}"]
                correct = "A"
                explanation = f"{val1}% of {val2} = ({val1}/100) * {val2} = {ans_val}."

            elif topic_name == "Profit & Loss":
                cp = 300 + i * 15
                profit_pct = 5 + (i % 5) * 5
                sp = cp * (1 + profit_pct / 100)
                subtopic = "Selling Price Calculation"
                question_text = f"An article is purchased for ₹{cp} and sold at a profit of {profit_pct}%. Find the selling price."
                opts = [f"₹{sp + 20}", f"₹{sp}", f"₹{sp - 10}", f"₹{cp + 5}"]
                correct = "B"
                explanation = f"SP = CP * (100 + Profit%)/100 = {cp} * {100 + profit_pct}/100 = ₹{sp}."

            elif topic_name == "Time & Work":
                days1 = 10 + (i % 5) * 2
                days2 = 15 + (i % 5) * 3
                combined = (days1 * days2) / (days1 + days2)
                subtopic = "Joint Work Rates"
                question_text = f"A can complete a task in {days1} days, and B can complete the same task in {days2} days. How many days will they take to complete it working together?"
                opts = [f"{combined:.2f} days", f"{combined + 1:.2f} days", f"{combined - 0.5:.2f} days", f"{days1 + days2} days"]
                correct = "A"
                explanation = f"Combined time = (A * B) / (A + B) = ({days1} * {days2}) / ({days1} + {days2}) = {combined:.2f} days."

            elif topic_name == "Time, Speed & Distance":
                speed_kmh = 30 + i * 5
                time_hr = 2 + (i % 3)
                dist = speed_kmh * time_hr
                subtopic = "Distance Covered"
                question_text = f"A car travels at a constant speed of {speed_kmh} km/h. How much distance will it cover in {time_hr} hours?"
                opts = [f"{dist - 20} km", f"{dist + 15} km", f"{dist} km", f"{dist * 1.2} km"]
                correct = "C"
                explanation = f"Distance = Speed * Time = {speed_kmh} * {time_hr} = {dist} km."

            elif topic_name == "Simple & Compound Interest":
                p = 1000 + i * 500
                r = 4 + (i % 4) * 2
                t = 2 + (i % 3)
                si = (p * r * t) / 100
                subtopic = "Simple Interest Calculation"
                question_text = f"Find the Simple Interest on a principal sum of ₹{p} at an annual interest rate of {r}% for {t} years."
                opts = [f"₹{si}", f"₹{si + 50}", f"₹{si - 25}", f"₹{si * 1.1}"]
                correct = "A"
                explanation = f"SI = (P * R * T) / 100 = ({p} * {r} * {t}) / 100 = ₹{si}."

            elif topic_name == "Ratio & Proportion":
                a = 2 + (i % 3)
                b = 3 + (i % 4)
                total = (a + b) * 100 + i * 10
                share_a = (a / (a + b)) * total
                subtopic = "Dividing a Quantity into Ratios"
                question_text = f"Divide ₹{total} between A and B in the ratio {a}:{b}. What is A's share?"
                opts = [f"₹{share_a + 50}", f"₹{share_a - 30}", f"₹{share_a}", f"₹{total / 2}"]
                correct = "C"
                explanation = f"A's share = (a / (a+b)) * Total = ({a}/{a+b}) * {total} = ₹{share_a}."

            elif topic_name == "Number System":
                val = 10 + i
                is_even = val % 2 == 0
                subtopic = "Properties of Numbers"
                question_text = f"Is the product of any three consecutive integers always divisible by {6 if is_even else 3}?"
                opts = ["Yes", "No", "Depends on the integers", "Cannot be determined"]
                correct = "A"
                explanation = "Yes, the product of three consecutive integers is always divisible by 6 (since at least one is even and one is a multiple of 3)."

            elif topic_name == "Averages":
                n1 = 5 + (i % 5)
                avg1 = 10 + i * 2
                sum1 = n1 * avg1
                subtopic = "Finding Arithmetic Mean"
                question_text = f"The average of {n1} numbers is {avg1}. What is the sum of these numbers?"
                opts = [f"{sum1 - 5}", f"{sum1}", f"{sum1 + 10}", f"{sum1 * 1.2}"]
                correct = "B"
                explanation = f"Sum = Average * Count = {avg1} * {n1} = {sum1}."

            elif topic_name == "Mixtures & Alligations":
                p1 = 10 + i
                p2 = 20 + i
                mean_p = 15 + (i % 4)
                subtopic = "Finding Alligation Ratio"
                question_text = f"In what ratio must rice at ₹{p1}/kg be mixed with rice at ₹{p2}/kg so that the mixture is worth ₹{mean_p}/kg?"
                ratio_num = p2 - mean_p
                ratio_den = mean_p - p1
                opts = [f"{ratio_num}:{ratio_den}", f"{ratio_den}:{ratio_num}", "1:1", "2:3"]
                correct = "A"
                explanation = f"By alligation rule, Ratio = (Price2 - MeanPrice) : (MeanPrice - Price1) = ({p2} - {mean_p}) : ({mean_p} - {p1}) = {ratio_num}:{ratio_den}."

            elif topic_name == "Permutation & Combination":
                n = 4 + (i % 3)
                r = 2
                fact_n = 24 if n==4 else (120 if n==5 else 720)
                subtopic = "Permutation Arrangements"
                question_text = f"In how many ways can letters of a word of length {n} distinct letters be arranged?"
                opts = [f"{fact_n}", f"{fact_n + 10}", f"{fact_n // 2}", f"{fact_n * 2}"]
                correct = "A"
                explanation = f"Number of arrangements of {n} distinct items = {n}! = {fact_n}."

            elif topic_name == "Probability":
                total_balls = 10 + (i % 5)
                red_balls = 4 + (i % 3)
                prob = red_balls / total_balls
                subtopic = "Simple Probability of Events"
                question_text = f"A bag contains {red_balls} red balls and {total_balls - red_balls} blue balls. If a ball is drawn at random, what is the probability that it is red?"
                opts = [f"{red_balls}/{total_balls}", f"{total_balls - red_balls}/{total_balls}", "1/2", "1/4"]
                correct = "A"
                explanation = f"Probability = Favorable / Total = {red_balls}/{total_balls}."

            elif topic_name == "Geometry & Mensuration":
                r = 7 + (i % 3) * 7
                area = int(3.14159 * r * r)
                subtopic = "Area of Circle"
                question_text = f"Find the approximate area of a circle with a radius of {r} cm. (Use pi = 3.14)"
                opts = [f"{area - 50} sq cm", f"{area + 30} sq cm", f"{area} sq cm", f"{area * 1.5:.0f} sq cm"]
                correct = "C"
                explanation = f"Area = pi * r^2 = 3.14 * {r} * {r} = approx {area} sq cm."

            elif topic_name == "Blood Relations":
                subtopic = "Family Tree Deduction"
                question_text = f"Pointing to a man, a woman says: 'He is the only son of my mother's husband.' How is the man related to the woman? (Scenario {i})"
                opts = ["Brother", "Father", "Husband", "Cousin"]
                correct = "A"
                explanation = "Mother's husband is the woman's father. His only son is the woman's brother."

            elif topic_name == "Seating Arrangement":
                subtopic = "Linear Sitting Order"
                question_text = f"Five friends A, B, C, D, and E are sitting in a row facing North. A is next to B, C is next to D, and E is on the far left. Who is in the middle? (Case {i})"
                opts = ["A", "B", "C", "D"]
                correct = "B"
                explanation = "Placing them in sequence shows B occupies the middle seat."

            elif topic_name == "Syllogisms":
                subtopic = "Deductive Logics"
                question_text = f"Statements: All cats are dogs. All dogs are birds. Which of the following conclusions must follow? (Exercise {i})"
                opts = ["All cats are birds", "All birds are cats", "Some dogs are not cats", "No birds are dogs"]
                correct = "A"
                explanation = "Since cats are subsets of dogs and dogs are subsets of birds, all cats are birds."

            elif topic_name == "Coding-Decoding":
                subtopic = "Pattern Recognition in Strings"
                question_text = f"If in a certain code, 'APPLE' is written as 'BQQMF' (+1 shift), how is 'MANGO' coded?"
                opts = ["NBOBP", "NZOFP", "NBOPH", "NBOFP"]
                correct = "D"
                explanation = "Shifting each letter of 'MANGO' by +1 yields M->N, A->B, N->O, G->H, O->P. So NBOFP."

            elif topic_name == "Direction Sense":
                dist = 5 + i
                subtopic = "Compass Directions"
                question_text = f"A person walks {dist} km North, turns right, and walks {dist} km. What is the straight-line distance from the start?"
                diag = int((dist**2 + dist**2)**0.5)
                opts = [f"{dist} km", f"{diag} km", f"{dist * 2} km", f"{diag + 3} km"]
                correct = "B"
                explanation = f"Using Pythagoras theorem: distance = sqrt(North^2 + East^2) = sqrt({dist}^2 + {dist}^2) = approx {diag} km."

            elif topic_name == "Number Series":
                start = i * 2
                step = 3 + (i % 3)
                term4 = start + step * 3
                subtopic = "Finding the Next Term"
                question_text = f"Find the next term in the arithmetic progression: {start}, {start+step}, {start+step*2}, ____?"
                opts = [f"{term4 + 2}", f"{term4}", f"{term4 - 3}", f"{term4 * 1.2:.0f}"]
                correct = "B"
                explanation = f"The common difference is {step}. The next term is {start+step*2} + {step} = {term4}."

            elif topic_name == "Analogies":
                subtopic = "Conceptual Analogies"
                question_text = f"Choose the matching pair that matches the relationship: Doctor : Hospital :: Teacher : ______? (Item {i})"
                opts = ["School", "Office", "Field", "Shop"]
                correct = "A"
                explanation = "A doctor works in a hospital; similarly, a teacher works in a school."

            elif topic_name == "Puzzles":
                subtopic = "Constraint Logic Puzzle"
                question_text = f"In a race of 5 friends, A finished ahead of B, C finished behind D, and E finished first. Who came last if B finished ahead of D? (Puzzle {i})"
                opts = ["B", "C", "D", "E"]
                correct = "B"
                explanation = "Sequence of finishing: E > A > B > D > C. Thus, C finished last."

            elif topic_name == "Clocks & Calendars":
                hr = 3 + (i % 5)
                angle = abs(30 * hr - 5.5 * 0)
                subtopic = "Clock Angle Hand Formula"
                question_text = f"What is the angle between the hour hand and the minute hand of a clock at {hr}:00?"
                opts = [f"{angle} degrees", f"{angle + 10} degrees", f"{angle - 15} degrees", "90 degrees"]
                correct = "A"
                explanation = f"Angle = |30*H - 5.5*M| = |30*{hr} - 0| = {angle} degrees."

            elif topic_name == "Input-Output":
                subtopic = "Iterative Step Transformations"
                question_text = f"If Step 1 of an input 'cat dog bat' is 'dog cat bat', what is Step 1 of input 'red blue green' under the same alphabetical sort? (Case {i})"
                opts = ["blue red green", "green red blue", "red green blue", "blue green red"]
                correct = "A"
                explanation = "Swap the first two items based on alphabetical order: 'blue' comes before 'red'."

            elif topic_name == "Bar Charts":
                val = 100 + i * 12
                subtopic = "Bar Chart Analysis"
                question_text = f"Refer to the bar chart: Company A sales is {val} units, Company B sales is {val * 1.5:.0f} units. By what percentage are B's sales higher than A's?"
                opts = ["25%", "50%", "75%", "100%"]
                correct = "B"
                explanation = "B's sales are 1.5 times A's sales, which means B is 50% higher than A."

            elif topic_name == "Line Graphs":
                val = 50 + i * 4
                subtopic = "Line Trend Interpolation"
                question_text = f"A line graph shows profit growth. Profit in 2020 was ₹{val}k and in 2021 was ₹{val * 2}k. Find the absolute increase in profit."
                opts = [f"₹{val}k", f"₹{val * 2}k", f"₹{val // 2}k", "₹10k"]
                correct = "A"
                explanation = f"Increase = Profit(2021) - Profit(2020) = {val * 2} - {val} = ₹{val}k."

            elif topic_name == "Pie Charts":
                subtopic = "Sector Angle Calculation"
                question_text = f"In a pie chart representing student distributions, the science department accounts for {20 + i}% of the total students. What is its central angle?"
                angle = (20 + i) * 3.6
                opts = [f"{angle:.1f}°", f"{angle + 10:.1f}°", f"{angle - 5:.1f}°", "90°"]
                correct = "A"
                explanation = f"Central angle = Percentage * 3.6 = {20 + i} * 3.6 = {angle:.1f}°."

            elif topic_name == "Tables":
                avg = 10 + i * 5
                subtopic = "Row Average Calculation"
                question_text = f"Refer to the table of production values: Year 1 = {avg - 5}, Year 2 = {avg}, Year 3 = {avg + 5}. Find the average annual production."
                opts = [f"{avg - 2}", f"{avg}", f"{avg + 3}", f"{avg * 1.2:.0f}"]
                correct = "B"
                explanation = f"Average = (({avg - 5}) + {avg} + ({avg + 5})) / 3 = {avg}."

            elif topic_name == "Mixed Charts":
                subtopic = "Dual Source Extraction"
                question_text = f"A pie chart shows total budget is ₹{100 + i}k. A bar chart shows expenditure of department X is 40% of the budget. Find the expenditure of department X."
                exp = (100 + i) * 0.4
                opts = [f"₹{exp:.1f}k", f"₹{exp + 5:.1f}k", f"₹{exp - 2:.1f}k", "₹50k"]
                correct = "A"
                explanation = f"Expenditure = Budget * 40% = {100 + i} * 0.4 = ₹{exp:.1f}k."

            elif topic_name == "Caselets":
                total = 200 + i * 10
                subtopic = "Passage Data Solving"
                question_text = f"In a class of {total} students, 60% are boys. How many girls are there in the class?"
                girls = int(total * 0.4)
                opts = [f"{girls + 10}", f"{girls - 5}", f"{girls}", f"{total - girls}"]
                correct = "C"
                explanation = f"Girls account for 40% of total students. Girls = {total} * 40/100 = {girls}."

            elif topic_name == "Reading Comprehension":
                subtopic = "Contextual Inference"
                question_text = f"Read the passage: 'Global warming threatens coastal cities due to rising sea levels. Rapid industrialization increases emissions.' What is the primary driver of sea level rise? (Passage {i})"
                opts = ["Industrial emissions", "Solar flares", "Volcanic activity", "Earthquakes"]
                correct = "A"
                explanation = "The passage directly links rising sea levels to global warming caused by emissions from rapid industrialization."

            elif topic_name == "Vocabulary":
                word = "BENEVOLENT" if i % 2 == 0 else "AMBIGUOUS"
                subtopic = "Synonym Matching"
                question_text = f"What is the closest synonym of the word '{word}'?"
                opts = ["Kind" if i%2==0 else "Unclear", "Cruel" if i%2==0 else "Certain", "Loud" if i%2==0 else "Soft", "Rich" if i%2==0 else "Poor"]
                correct = "A"
                explanation = f"'{word}' stands for {'kind and generous' if i%2==0 else 'having double meaning or unclear'}."

            elif topic_name == "Grammar":
                subtopic = "Subject-Verb Agreement"
                question_text = f"Identify the grammatically correct sentence from the choices below. (Case {i})"
                opts = ["Neither of the students is present.", "Neither of the students are present.", "Neither of the student are present.", "Neither of student is present."]
                correct = "A"
                explanation = "'Neither' is a singular pronoun and takes the singular verb 'is'."

            elif topic_name == "Sentence Completion":
                subtopic = "Context Word Filling"
                question_text = f"Complete the sentence: The new policy was met with _______ review, as some praised it while others criticized it. (Sentence {i})"
                opts = ["mixed", "unanimous", "favorable", "hostile"]
                correct = "A"
                explanation = "The word 'mixed' fits the description of both praise and criticism."

            elif topic_name == "Para Jumbles":
                subtopic = "Cohesive Rearrangement"
                question_text = f"Rearrange the following sentences: P) Then he left. Q) He woke up early. R) He dressed quickly. (Set {i})"
                opts = ["QRP", "PRQ", "PQR", "RQP"]
                correct = "A"
                explanation = "The logical chronological sequence is: waking up (Q), dressing (R), and leaving (P)."

            elif topic_name == "Idioms & Phrases":
                subtopic = "Idiom Interpretations"
                question_text = f"What is the meaning of the popular idiom 'Spill the beans'?"
                opts = ["To reveal a secret", "To perform hard work", "To waste food", "To speak loudly"]
                correct = "A"
                explanation = "'Spill the beans' is a common idiom meaning to reveal secret information prematurely."

            # Append SQL insert commands
            sql.append(f"-- Topic: {topic_name}, Q{i}")
            sql.append(f"INSERT INTO questions (id, section_id, topic_id, subtopic, question, difficulty, correct_answer, solution, explanation) VALUES")
            sql.append(f"({q_id}, {sec_id}, {topic_id}, '{escape_sql(subtopic)}', '{escape_sql(question_text)}', '{difficulty}', '{correct}', '{escape_sql(opts[ord(correct)-65])}', '{escape_sql(explanation)}');")
            
            # Options
            sql.append("INSERT INTO question_options (question_id, option_label, option_text) VALUES")
            for o_idx, opt_lbl in enumerate(['A', 'B', 'C', 'D']):
                comma = "," if o_idx < 3 else ";"
                sql.append(f"({q_id}, '{opt_lbl}', '{escape_sql(opts[o_idx])}'){comma}")
            sql.append("")

    sql.append("")
    return "\n".join(sql)

if __name__ == "__main__":
    content = generate_questions()
    with open("database/seed_phase4.sql", "w") as f:
        f.write(content)
    print("✅ Generated database/seed_phase4.sql successfully with 850 questions!")
