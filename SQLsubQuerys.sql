-- A query inside another querys
-- we have to find out stduent who are having greater marks then avg

--   select * from students
--   where marks > (select avg(marks) from students) 

  create database SQLSubqueryex;
  use SQLSubqueryex;
  
  create table Employees(
  employee_id int primary key,
  employee_name varchar(50) not null,
  salary decimal(10,2) not null,
  department_id int,
  join_date date
  );

  create table departments(
  department_id int primary key,
  department_name varchar(50) not null,
  location varchar(50),
  manager_id int
  );
  INSERT INTO departments (department_id, department_name, location, manager_id) VALUES
(1, 'Human Resources',   'Mumbai',     101),
(2, 'Finance',           'Delhi',      102),
(3, 'Engineering',       'Bangalore',  104),
(4, 'Marketing',         'Chennai',    109),
(5, 'Sales',             'Hyderabad',  NULL);
  
  INSERT INTO Employees (employee_id, employee_name, salary, department_id, join_date) VALUES
(101, 'Aarav Mehta',       55000.00, 1, '2022-03-15'),
(102, 'Sneha Reddy',       62000.50, 2, '2021-07-01'),
(103, 'Rohan Sharma',      48000.75, 1, '2023-01-10'),
(104, 'Priya Nair',        71000.00, 3, '2020-11-25'),
(105, 'Karthik Iyer',      53000.25, 2, '2022-06-30'),
(106, 'Meena Joshi',       59000.00, 4, '2023-04-18'),
(107, 'Vikram Desai',      64000.80, 3, '2021-09-12'),
(108, 'Divya Kapoor',      50000.00, 1, '2022-12-05'),
(109, 'Anil Kumar',        67000.90, 4, '2020-08-20'),
(110, 'Neha Verma',        56000.60, 2, '2023-02-14');

  
  select * from Employees;
  select * from departments;
  
  select * from Employees
  where salary > (select avg(salary) from Employees);
  
  -- employee working in department located in new delhi
  select department_id,location from departments 
  where location = 'Delhi';

select * from Employees where department_id 
in (select department_id from departments where location = 'Delhi');

--  multiple -- column sub query

-- find out employees highest paid in their department

select department_id ,max(salary) from Employees
group by department_id;

Select * from Employees 
where (department_id , salary) in (select department_id ,max(salary) from Employees
group by department_id);


-- find out salary who have paid company avg salary greater then employee salary  

select * from Employees
where salary > (select avg(salary) from Employees);
 
select * from Employees as e1
where salary > (select avg(salary) from Employees as e2
where e1.department_id = e2.department_id);

