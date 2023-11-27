Create table tblDepartment
(
     ID int primary key,
     DepartmentName nvarchar(50),
     Location nvarchar(50),
     DepartmentHead nvarchar(50)
)
Insert into tblDepartment values (1, 'IT', 'London', 'Rick'), (2, 'Payroll', 'Delhi', 'Ron'), (3, 'HR', 'New York', 'Christie'), (4, 'Other Department', 'Sydney', 'Cindrella');
select * from tbldepartment;
output: 
    ID DepartmentName Location DepartmentHead
    1	    IT	        London	  Rick
    2	    Payroll	    Delhi	    Ron
    3	    HR	        New York	Christie
    4	    Other Department	Sydney	Cindrella

Create table tblEmployee
(
     e_ID int primary key,
     Name nvarchar(50),
     Gender nvarchar(50),
     Salary int,
     DeptId int
);
Insert into tblEmployee values (1, 'Tom', 'Male', 4000, 1), (2, 'Pam', 'Female', 3000, 3), (3, 'John', 'Male', 3500, 1),
(4, 'Sam', 'Male', 4500, 2), (5, 'Todd', 'Male', 2800, 2), (6, 'Ben', 'Male', 7000, 1), (7, 'Sara', 'Female', 4800, 3),
(8, 'Valarie', 'Female', 5500, 1), (9, 'James', 'Male', 6500, NULL), (10, 'Russell', 'Male', 8800, NULL);
select * from tblEmployee;

-- 3 ways to replace null values- ISNULL(), CASE & COALESCE()
