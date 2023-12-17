/*
   websitte: https://sites.google.com/cs.washington.edu/cse344-23su
             https://sites.google.com/cs.washington.edu/cse414-23sp
*/

CREATE DATABASE Company;
USE Company;

CREATE TABLE Employee (
  Id INT PRIMARY KEY,
  Name VARCHAR(45) NOT NULL,
  Department VARCHAR(45) NOT NULL,
  Salary FLOAT NOT NULL,
  Gender VARCHAR(45) NOT NULL,
  Age INT NOT NULL,
  City VARCHAR(45) NOT NULL
);

INSERT INTO Employee VALUES (1001, 'John Doe', 'IT', 35000, 'Male', 25, 'London'), (1002, 'Mary Smith', 'HR', 45000, 'Female', 27, 'London'),
(1003, 'James Brown', 'Finance', 50000, 'Male', 28, 'London')
, (1004, 'Mike Walker', 'Finance', 50000, 'Male', 28, 'London')
, (1005, 'Linda Jones', 'HR', 75000, 'Female', 26, 'London')
, (1006, 'Anurag Mohanty', 'IT', 35000, 'Male', 25, 'Mumbai')
, (1007, 'Priyanla Dewangan', 'HR', 45000, 'Female', 27, 'Mumbai')
, (1008, 'Sambit Mohanty', 'IT', 50000, 'Male', 28, 'Mumbai')
, (1009, 'Pranaya Kumar', 'IT', 50000, 'Male', 28, 'Mumbai')
, (1010, 'Hina Sharma', 'HR', 75000, 'Female', 26, 'Mumbai'); 

select * from employee;

CREATE TABLE Projects (
 ProjectId INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(200) NOT NULL,
    ClientId INT,
    EmployeeId INT,
    StartDate DATETIME DEFAULT NOW(),
    EndDate DATETIME,
    FOREIGN KEY (EmployeeId) REFERENCES Employee(Id)
);

INSERT INTO Projects ( Title, ClientId, EmployeeId, EndDate) VALUES 
('Develop ecommerse website from scratch', 1, 1003, DATE_ADD(NOW(), INTERVAL 30 DAY)),
('WordPress website for our company', 1, 1002, DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Manage our company servers', 2, 1007, DATE_ADD(NOW(), INTERVAL 45 DAY)),
('Hosting account is not working', 3, 1009, DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1010, DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, DATE_ADD(NOW(), INTERVAL 10 DAY)),
('Migrate web application and database to new server', 2, NULL, DATE_ADD(NOW(), INTERVAL 5 DAY)),
('Android Application development', 4, 1004, DATE_ADD(NOW(), INTERVAL 30 DAY)),
('Hosting account is not working', 3, 1001, DATE_ADD(NOW(), INTERVAL 7 DAY)),
('MySQL database from my desktop application', 4, 1008, DATE_ADD(NOW(), INTERVAL 15 DAY)),
('Develop new WordPress plugin for my business website', 2, NULL, DATE_ADD(NOW(), INTERVAL 10 DAY));

select * from projects;

-- CREATE DATABASE Company;
-- USE Company;

select * from employee;
select * from projects;

-- inner join: to return only the matching rows from both the tables based on join condition
-- retrieve EmployeeId, Name, Department, City, Title as Project, and ClientId
select e.Id, e.Name, e.Department, e.City, p.title project, p.ClientId from employee e join projects p on e.Id=p.EmployeeId;

-- Outer Join: returns matched data rows as well as unmatched data rows from both the tables
	-- 1. Left outer join : inner join + all remaining records from left table
    -- 2. Right outer join : inner join + all remaining records from right table
    -- 3. Full outer join: left outer + right outer
    
-- 1. Left outer: retrieves all the matching rows from both the tables as well as non-matching rows from the left side table.
 -- retrieve EmployeeId, Name, Department, City, and Title as Project
 select e.Id, e.Name, e.Department, e.City, p.title project from employee e left join projects p on e.Id=p.EmployeeId;
    -- here we also got the details of employees who are not working on any project.
/* So we use this when we want to retrieve all the matching rows from both the tables as well as the non-matching rows from the left side table */

-- 2. Right outer: retrieves all the matching rows from both the tables as well as non-matching rows from the right-side table.
select e.Id, e.Name, e.Department, e.City, p.title project from employee e right join projects p on e.Id=p.EmployeeId;
/* here, we got all the matching records from both the tables Employee and Projects as well as all the non-matching rows from the right-side table i.e. the Projects Table */

-- 3. Full Outer: all the matching rows from both the tables as well as non-matching rows from both the tables
select e.Id, e.Name, e.Department, e.City, p.title project from employee e left join projects p on e.Id=p.EmployeeId
union
select e.Id, e.Name, e.Department, e.City, p.title project from employee e right join projects p on e.Id=p.EmployeeId;

-- Cross Join: returns matched data rows as well as unmatched data rows from the table(cartesian product)
  -- In this each record of a table is joined with each record of the other table involved in the join.
select e.Id, e.Name, e.Department, e.City, p.title project from employee e cross join projects p;
/* Employee is the LEFT Table which contains 10 rows and Projects is the RIGHT Table which contains 11 rows. So,we will get 110 records in the result set. */

create table comp(
  comp_id varchar(5),
  comp_name varchar(30),
  location varchar(30)
);

insert into comp values( 'C001', "Durga Solutions", "Hyderabad");
select * from projects cross join comp;

 /* Here we don't have any common column in both tables but we fetched the data */

-- Natural join: It decides the condition, here we are giving control to the sql to decide the condition which column should do join/  which join should happen  we don't use it normaly
select * from employee e1 natural join employee e2;
select * from projects natural join comp;  -- here it joined based on cross join

-- Self join: joining the same table itself. We can do inner join, outer join and cross join with self join
CREATE TABLE manager
(
  EmployeeID INT Primary Key,
  Name VARCHAR(20),
  ManagerID INT
);
-- Insert the following records
INSERT INTO manager VALUES(1, 'Pranaya', 3), (2, 'Priyanka', 1), (3, 'Preety', NULL)
, (4, 'Anurag', 1), (5, 'Sambit', 1);

-- here one employee is manager to other employee
select m1.name employee, m2.name manager from manager m1 inner join manager m2 on m1.ManagerID=m2.EmployeeID;

-- employee who does not have manager, manager who doesn't have employee
select e.name employee, m.name manager from manager e left join manager m on e.employeeid=m.managerid;
select m.name manager, e.name employee from manager e right join manager m on e.employeeid=m.managerid;










CREATE TABLE employees (
    id int,
    emp_name varchar(100),
    salary int,
    dept_id int,
    manager_id int
);

INSERT INTO employees VALUES (1, 'Idris', 1000, 1, 1), (2, 'Aweda', 2000, 2, 2), (3, 'Zubair', 3000, 3, 2), (4, 'Young', 4000, 3, 3), (5, 'Babu', 5000, 1, 3), (6, 'John', 1000, 8, 1);

select * from employees;

CREATE TABLE departments (
    id int,
    dept_name varchar(100)
);

INSERT INTO departments VALUES (1, 'Engineering'), (2, 'Product'), (3, 'Marketing'), (4, 'Support');

select * from departments; 

CREATE TABLE managers (
    id int,
    manager_name varchar(100),
    dept_id int
);

INSERT INTO managers VALUES (1, 'Doe', 1), (2, 'Jane', 2), (3, 'May', 4);

select * from managers;

CREATE TABLE projects (
    id int,
    project_name varchar(100),
    emp_id int
);

INSERT INTO projects VALUES (1, 'Fintech App', 1), (1, 'Fintech App', 5), (1, 'Fintech App', 6), (2, 'Cooking Website', 1), (2, 'Cooking Website', 2);

select * from projects;

