Create database SQLQuerys;
use SQLQuerys;

Create table studentsMarks(
 student_id INT,
 student_name varchar(100),
 subject varchar(50),
 marks INT,
 exam_date DATE,
 department varchar(50)
 );
 
 desc studentsMarks;
 
 INSERT INTO studentsMarks (student_id, student_name, subject, marks, exam_date, department)
VALUES
(1, 'Aarav Kumar', 'Mathematics', 88, '2025-07-01', 'Science'),
(2, 'Diya Sharma', 'Physics', 92, '2025-07-01', 'Science'),
(3, 'Rohan Mehta', 'Chemistry', 76, '2025-07-01', 'Science'),
(4, 'Sneha Reddy', 'Biology', 85, '2025-07-01', 'Science'),
(5, 'Karthik Iyer', 'English', 90, '2025-07-01', 'Arts'),
(6, 'Meera Nair', 'History', 78, '2025-07-01', 'Arts'),
(7, 'Aditya Verma', 'Geography', 82, '2025-07-01', 'Arts'),
(8, 'Lakshmi Menon', 'Computer Science', 95, '2025-07-01', 'Engineering'),
(9, 'Rahul Das', 'Electronics', 89, '2025-07-01', 'Engineering'),
(10, 'Nisha Patel', 'Mechanical', 84, '2025-07-01', 'Engineering');
 
 INSERT INTO studentsMarks
VALUES
(11, 'Vikram Joshi', 'Data Structures', 91, '2025-07-01', 'ComputerScience'),
(12, 'Ananya Rao', 'Algorithms', 87, '2025-07-01', 'ComputerScience');

 select * from studentsMarks;
 
 select student_name,marks from studentsMarks;
 
 select DISTINCT department
  FROM studentsMarks; 

select * from studentsMarks
where marks > 75;

select * from studentsMarks
where department = 'ComputerScience';

select * from studentsMarks 
where exam_date > '2024-06-01';

select * from studentsMarks 
where subject = 'Mathematics';

select * from studentsMarks 
where marks between 60 and 90;

select count(*) as total_records
from studentsMarks;

select department, count(*) as 
deparment_count from studentsMarks
group by department;

select * from studentsMarks
order by  marks desc 
limit 1; 

SELECT department
FROM studentsMarks
WHERE subject IN ('Mathematics', 'Physics', 'Chemistry')
GROUP BY department
HAVING SUM(marks) > 200;

SELECT department, COUNT(DISTINCT student_id) AS student_count
FROM studentsMarks
WHERE marks BETWEEN 60 AND 90
GROUP BY department
HAVING COUNT(DISTINCT student_id) > 5;


SELECT subject, AVG(marks) AS average_marks
FROM studentsMarks
WHERE department = 'ComputerScience'
GROUP BY subject
HAVING AVG(marks) < 65;

SELECT subject, MAX(marks) AS top_score
FROM studentsMarks
GROUP BY subject;

SELECT department, MIN(marks) AS min_marks
FROM studentsMarks
WHERE subject IN ('English', 'History')
GROUP BY department
HAVING MIN(marks) > 40;

SELECT DISTINCT student_name
FROM studentsMarks
WHERE department IN ('ComputerScience', 'Electronics')
  AND marks BETWEEN 70 AND 90
  AND exam_date > '2024-06-01';

SELECT subject, AVG(marks) AS avg_marks
FROM studentsMarks
GROUP BY subject
HAVING AVG(marks) > 75;

SELECT student_name, SUM(marks) AS total_marks
FROM studentsMarks
WHERE student_name IN ('Ravi', 'Sneha', 'Arjun')
GROUP BY student_name;

SELECT department, AVG(avg_student_marks) AS avg_marks, COUNT(*) AS student_count
FROM (
    SELECT department, student_id, AVG(marks) AS avg_student_marks
    FROM studentsMarks
    GROUP BY department, student_id
    HAVING AVG(marks) > 80
) AS subquery
GROUP BY department
HAVING COUNT(*) > 3;





