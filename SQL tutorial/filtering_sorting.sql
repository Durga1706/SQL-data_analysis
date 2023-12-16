/*  * Basics of Filtering with SQL
     https://d3c33hcgiwev3.cloudfront.net/_31f3d7f7e2769ddc96591a0d92915013_Basics-of-Filtering-with-SQL.pdf?Expires=1702252800&Signature=O7SghSOj3f8hEsMAupL19fxWikBLtPHh
     FgxdThDVNXsmNj-g7EdoIFvDlUM~qurWPXOEVaIQgzL10XiTMHW0XMcVA33HRashlOSrMPTjhzQFNLVWkZ5SlWIUSDgYE2da9ytsyefiWCwLyM8BYfKTlnbUYsqyNUDyE~bDfbF65BY_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

    * Advanced Filtering: IN, OR, and NOT
    https://d3c33hcgiwev3.cloudfront.net/_034d905fed357262bbc44ea0ccfe7178_Advanced-Filtering-IN-OR-NOT.pdf?Expires=1702252800&Signature=SwrPeVu0N6ZkmovvZjBHLcd
    MTHHTAuGq2DoQBWS2XxdJeYQLZQ3033ZYqjWfTBX5~kZtOw9yRwWBbaxZNPWS~j4Rhfp28erLGC2rse8zocbVfIdslVJjgj3eW2iLiPEYklJAI0DiVtwQJPWccWY-UKVdh7ftTQPAg13fA6FqLd8_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

    * wildcards
    https://d3c33hcgiwev3.cloudfront.net/_5b62ac24aa1b72bfef6a44c0d0eafb09_Using-Wildcards-in-SQL.pdf?Expires=1702339200&Signature=ULWe0pDnUJXfq7Lh~Z0HhhGEigWFUVK-
    hLghs25RPdBXar02Oe4mYkc3OnnxHw2qQUGirUEEY72l-CO3t1-TwOO5xwkz-QI9JP20E5msf87Mml9CpGZx7fucPK2IqqdmbdLJDp1HoRC6hQyMn5kOmGsylCb~jNW0yKKxdhK6I8k_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A
*/

/* Ordering
     * order by
     https://d3c33hcgiwev3.cloudfront.net/_efe8faebfcc1f2db61064927ea2c29dc_Sorting-with-ORDER-BY.pdf?Expires=1702339200&Signature=WMhabvfEzkSSrSsrfRNvEh44JQQn8aOT8Jiz3IpxqEL
     fatQtlR5MweGBP4WU8ZIIL~qAw6rivJZusnSL1C1REM8IVzeby8sRV78mb-qtkShoH5py2-GfV2M~HC83Jp-pkPB0-TnI5qM-aSOIxrSGqR1AerSCdHSAu4wdX53krmE_&Key-Pair-Id=APKAJLTNE6QMUY6HBC5A

     * 
*/

-- GROPU BY


-- HAVING

-- ORDER BY
CREATE TABLE employee( 
  id INT PRIMARY KEY,
  f_name VARCHAR(50), l_name VARCHAR(50),
  dept varchar(10)
  );
  insert into employee values(1,"John","Smith","HR"), (2,"Jane","Doe","Finance"), (3,"Michael","Tylor","IT"), 
  (4,"Emily","Roberts","Finance");
  
  -- order by multiple columns
SELECT * FROM Employee ORDER BY dept DESC, l_name;

-- sort by department then by id (highest to lowest)
select * from employee order by dept, id desc;

-- add columns phone and city to employye table
alter table employee add phone int, add city varchar(10);

select * from employee;
insert into employee values(5,"Hansen","Ola", "HR",123,"Sandnes"),
(6,"Peter","son","IT", 159,"Stavanger");

SET SQL_SAFE_UPDATES=0; -- safe updates disable
-- update employee set phone=147, city="Sandnes" WHERE phone IS NULL OR city IS NULL; /* If I use this it will add to all the previous records */
-- random data generate for the previous records
UPDATE employee
SET phone = LPAD(FLOOR(RAND() * 1000), 3, '1'),
    city = CASE WHEN RAND() > 0.5 THEN 'Albany' ELSE 'Amarillo' END
WHERE id between 1 and 4;

UPDATE employee
SET city = 'Amarillo' 
WHERE id between 3 and 4;

select * from employee where city="Albany" order by id; -- with WHERE
select f_name, l_name from employee order by city; -- column that is not in the select list
select f_name, l_name from employee order by LENGTH(f_name) desc; -- large f_name
