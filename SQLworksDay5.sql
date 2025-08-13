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


