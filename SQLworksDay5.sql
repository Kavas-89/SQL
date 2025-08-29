create database SubQueryWork;
use SubQueryWork;

CREATE TABLE department (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50),
    city VARCHAR(50)
);
CREATE TABLE employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(100),
    salary DECIMAL(10, 2),
    dept_id INT,
    job_title VARCHAR(50),
    manager_id INT,
    join_date DATE,
    age INT,
    FOREIGN KEY (dept_id) REFERENCES department(dept_id),
    FOREIGN KEY (manager_id) REFERENCES employee(emp_id)
);

INSERT INTO department (dept_id, dept_name, city) VALUES
(1, 'Human Resources', 'Mumbai'),
(2, 'Engineering', 'Bangalore'),
(3, 'Sales', 'Delhi');

INSERT INTO employee (emp_id, emp_name, salary, dept_id, job_title, manager_id, join_date, age) VALUES
(101, 'Amit Sharma', 75000.00, 2, 'Software Engineer', NULL, '2022-06-15', 28),
(102, 'Priya Mehta', 85000.00, 2, 'Senior Engineer', 101, '2021-03-10', 32),
(103, 'Ravi Kumar', 60000.00, 1, 'HR Executive', NULL, '2023-01-20', 26),
(104, 'Neha Singh', 95000.00, 3, 'Sales Manager', NULL, '2020-11-05', 35),
(105, 'Karan Patel', 55000.00, 3, 'Sales Executive', 104, '2023-07-01', 27);


SELECT * from employee
WHERE dept_id = (
    SELECT dept_id
    FROM department
    WHERE dept_id = 3
);

select emp_name from employee
where salary > (select avg(salary) from employee);

select emp_name,salary from employee
where salary = (select max(salary) from employee);

select * from department 
where dept_id = (select dept_id from employee 
where emp_name = 'Ravi Kumar');

-- Display the names of employees who joined after the average joining date.

select * from employee 
where join_date > (select date'2024-08-13'+ avg(join_date - date '2024-08-13')
from employee
);

-- Get the employee(s) whose salary is equal to the minimum salary.

select * from employee 
where salary = ( select min(salary) from employee); 

-- List employees who work in the same department as 'Amit Sharma'

select * from employee 
where dept_id = (Select dept_id from employee 
where emp_name = 'Amit Sharma');

-- Show employee(s) whose salary is higher than the salary of employee 'Amit Sharma'.

select * from employee
where salary >(select salary from employee where emp_name = 'Amit Sharma');

-- List employees whose department is in the location 'Bangalore'.

select * from employee 
where dept_id = (select dept_id from department where city = 'Bangalore');

-- Find employees whose job title matches that of employee ID 102.

select * from employee
where job_title = (select job_title from employee 
where emp_id = '102'); 

-- Get names of employees who have the same salary as someone in department 3.

select * from employee
where salary in (select salary from employee 
where dept_id = '3');

-- List employees who do not belong to any department listed in the departments table.
select * from employee
where dept_id not in ( select dept_id from department);


-- Display all departments that have more than 2 employees.

select dept_name from department
where dept_id in (
select dept_id 
from employee 
group by dept_id having count(*) >=2);

-- Find employees who work in departments where the average salary is above 50,000.

select emp_name,salary from employee
where dept_id in (select dept_id from employee
group by dept_id
having salary >50000.00 ); 

-- 	Show employees whose salary is within 10% of the maximum salary.
select * from employee
where salary >= (select max(salary) * 0.90 from employee);

-- Get employees who joined on the same date as someone in department 2.

select * from employee as e
where  e.join_date in (select e2.join_date from employee as e2
where e2.dept_id = '2'); 

-- List all employees who earn more than the average salary of their department.

SELECT e.*
FROM employee e
WHERE e.salary > (
    SELECT AVG(e2.salary)
    FROM employee e2
    WHERE e2.dept_id = e.dept_id
);

-- 	Show employees whose department has fewer than 3 employees.

select * from employee
where dept_id in (select dept_id from employee
group by dept_id 
having count(*)< 3); 

-- 19.	Get the name of the department where the highest paid employee works.

select * from employee
where salary in( select max(salary)from employee);

-- 20.	Display employees who have the same job title as someone with salary > 70,000

select * from employee
where job_title in (select distinct job_title employee
where salary>70000
);

-- 21. Find employees whose salary is above the average salary of their own department.

select * from employee as e1
where e1.salary > (select avg(e2.salary) from employee as e2
where e2.dept_id = e1.dept_id);

-- 22.	List departments where all employees earn more than 30,000.

select * from department as d
where 30000 < all ( select salary from employee as e
where e.dept_id = d.dept_id);

-- 23.	Find employees who have the maximum salary in their department.

select emp_name ,salary,dept_id from employee as e
where salary = (select max(salary) from employee 
where dept_id = e.dept_id);
-- 24.	Get the top 2 highest paid employees from each department.
SELECT emp_id, emp_name, salary, dept_id
FROM employee e
WHERE 2 > (
    SELECT COUNT(*)
    FROM employee
    WHERE dept_id = e.dept_id AND salary > e.salary
);

-- 25.	List employees who are the only ones in their department.

SELECT emp_id, emp_name, dept_id
FROM employee e
WHERE 1 = (
    SELECT COUNT(*)
    FROM employee
    WHERE dept_id = e.dept_id
);

-- 26.	Display employees whose salary is higher than any employee in department 10.
SELECT emp_id, emp_name, salary
FROM employee
WHERE salary > (
    SELECT MAX(salary)
    FROM employee
    WHERE dept_id = 10
);

-- 27.	Find employees whose salary is greater than all employees in department 20.
SELECT emp_id, emp_name, salary
FROM employee
WHERE salary > ALL (
    SELECT salary
    FROM employee
    WHERE dept_id = 20
);

-- 28.	List the second highest salary in each department.
SELECT dept_id, MAX(salary) AS second_highest
FROM employee
WHERE salary < (
    SELECT MAX(salary)
    FROM employee e2
    WHERE e2.dept_id = employee.dept_id
)
GROUP BY dept_id;
-- 29.	Get names of employees who have more than one subordinate (based on manager_id).
SELECT emp_name
FROM employee
WHERE emp_id IN (
    SELECT manager_id
    FROM employee
    GROUP BY manager_id
    HAVING COUNT(*) > 1
);

-- 30.	Find the average salary of the youngest employee in each department.

SELECT dept_id, AVG(salary) AS avg_salary_of_youngest
FROM employee
WHERE (dept_id, age) IN (
    SELECT dept_id, MIN(age)
    FROM employee
    GROUP BY dept_id
)
GROUP BY dept_id;