/*https://www.youtube.com/watch?v=v8Ec1MsbNig */
-- IFF
select e_id,e_name iif(e_age>30,"Old employee","young employee") as employee_generation from employee;

--Scalar valued function
create function add_five(@num as int) RETURNS int AS BEGIN RETURN(@num+5) end;
select dob.add_five(100)

