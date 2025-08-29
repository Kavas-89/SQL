create database Sqlpracticeallcmd;
use Sqlpracticeallcmd;

Create table Users(
Name varchar(50) not null,
lastName varchar(50),
age int,
ph_number bigint
);



INSERT INTO Users (Name, lastName, age, ph_number) VALUES
('Alice', 'Johnson', 28, 9876543210),
('Bob', 'Smith', 35, 9123456789),
('Charlie', null , 22, 9988776655),
('Diana', 'Prince', 30, 9012345678),
('Ethan', 'Hunt', 40, 9090909090),
('Fiona', 'Gallagher', 27, 9345678901),
('George', 'Martin', 33, 9456123789),
('Hannah', null, 25, 9567890123),
('Ian', 'Wright', null, 9678901234),
('Julia', 'Roberts', null , 9789012345);

select * from Users;


Select * from Users
where lastName is Not null;

Select * from Users
where  age is null;

Select * from Users
order by age;

-- update comment 

update Users 
set age = 25 
where Name  = "George" and lastName  = "Martin";

-- like Query 

Select * from Users 
Where Name like 'J%';

-- IN query

select * from Users
where age in (22,35); 

-- between
select * from Users
where age between 22 and 35; 

-- joins concepts 
-- inner join
create table department (
dept_name varchar(50),
dept_id int primary key,
dept_city varchar(50)
);
Create table Employee (
emp_Name varchar(50) not null,
emp_id int primary key,
dept_id int,
emp_age int,
salary decimal(10,2),
foreign key (dept_id) references department(dept_id));

INSERT INTO Employee (emp_Name, emp_id, dept_id, emp_age, salary) VALUES
('Amit Sharma',     1, 101, 29, 75000.00),
('Priya Verma',     2, 102, 32, 68000.00),
('Rahul Mehta',     3, 101, 27, 72000.00),
('Sneha Iyer',      4, 103, 35, 65000.00),
('Vikram Singh',    5, 101, null, 80000.00),
('Neha Kapoor',     6, 102, 28, 70000.00),
('Arjun Reddy',     7, 103, null, 67000.00),
('Divya Joshi',     8, 101, 26, 71000.00),
('Karan Malhotra',  9, 102, 33, 69000.00),
('Meera Nair',     10, 103, 34, 66000.00);

INSERT INTO Department (dept_name, dept_id, dept_city) VALUES
('Engineering', 101, 'Bangalore'),
('Marketing',   102, 'Mumbai'),
('HR',          103, 'Chennai');

-- inner join exection

-- if need two side table commen persons data

Select * from employee as e
inner join department as d
on e.dept_id = d.dept_id
where d.dept_name = "HR";

-- left join

select * from department as d
left join Employee as e
on d.dept_id = e.dept_id;

-- right join
select * from department as d
right join Employee as e
on d.dept_id = e.dept_id;

