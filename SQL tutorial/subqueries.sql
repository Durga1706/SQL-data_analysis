/* pdf: https://d3c33hcgiwev3.cloudfront.net/_2b6e63ad88b510f8fa14637ebb12b3d9_Using-Subqueries.pdf?Expires=1702512000&Signature=XICnbCx8H6cJUKFvANetzTO0gb0~
        5Zd9ueVzFyz2CciyjvPBhS0ca9a0mgW6Ldiw14XobJvWgACWy32ZYBv8IvGOxs6tLR7JE9P9RAN0H98YOJmoLGm0dOFIbNVIJQjxDe1QFFEbAQAoq4r76S0oL3MJ4EHz-TEDJc2MYD7zZHI_&Key-Pair-
        Id=APKAJLTNE6QMUY6HBC5A
        https://d3c33hcgiwev3.cloudfront.net/_80462ee9a1ab3649ad8a01efbe279206_Subquery-Best-Practices-and-Considerations.pdf?Expires=1702512000&Signature=
        ZEW0lA3YvsrZvj-Bvvwy4lnv9Np6RZ1uakMCSAuxPRiCL2~-ZExQ6ZkglFn~oaxIzewCJoA081rzxrGRulJ7lag-syEk2lhMRnlTJIWb3iWY5niLes9BcFg8~ramRdI2AGiRid5NvjU71G9lkeMF1QSwV4v
        -oMe8UoHEZgRCduE_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A
*/
/* Sub-queries are queries within another query.  The result of the inner sub-query is fed to the outer query, which uses that to produce its outcome.
    SELECT column_name  -- main / outer query
    FROM table_name WHERE column_name expression operator   
    (SELECT column_name  from table_name WHERE ... );   -- subquery/ inner query


   1. Uncorrelated Sub-query
      sub-query where inner query doesn’t depend upon the outer query for its execution.
   2. Correlated Sub-query
      sub-query where inner query depends upon the outcome of the outer query in order to perform its execution.
*/

CREATE TABLE department( 
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL, 
  capacity INT NOT NULL
  );
  
INSERT INTO department 
  VALUES (1, 'English', 300), (2, 'Computer', 450), (3, 'Civil', 400), (4, 'Maths', 400), (5, 'History', 300);

CREATE TABLE Student(  
  id INT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  gender VARCHAR(50) NOT NULL,
  age INT NOT NULL,
  dep_id INT NOT NULL    
);
INSERT INTO student
  VALUES (1, 'Jolly', 'Female', 20, 4), (2, 'Jon', 'Male', 22, 3), (3, 'Sara', 'Female', 25, 4), (4, 'Laura', 'Female', 18, 2),(5, 'Alan', 'Male', 20, 3), 
         (6, 'Kate', 'Female', 22, 2), (7, 'Joseph', 'Male', 18, 2), (8, 'Mice', 'Male', 23, 1), (9, 'Wise', 'Male', 21, 5), (10, 'Elis', 'Female', 27, 2);

-- uncorrelated example
   --  all the students who belong to “Computer” department
select * from student where dep_id= (SELECT id from department WHERE name = 'Computer');

-- correlated example
	-- all the students with age greater than average age within their department
SELECT name, gender, age FROM student s1 WHERE s1.age> (SELECT AVG (s2.age) FROM student s2 WHERE s2.dep_id = s1.dep_id) ;
