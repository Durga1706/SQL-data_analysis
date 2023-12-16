/*
   websitte: https://sites.google.com/cs.washington.edu/cse344-23su
             https://sites.google.com/cs.washington.edu/cse414-23sp
*/

-- Joins
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

