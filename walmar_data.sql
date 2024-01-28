-- Walmart sales analysis
create database if not exists walmartData;
use walmartData;
create table if not exists sales(
	invoice_id varchar(30) not null primary key, branch varchar(10) not null, city varchar(30) not null, customer_type varchar(30) not null, gender varchar(8) not null,
  product_line varchar(100) not null, unit_price decimal(10) not null, quantity INT NOT NULL, tax_pct FLOAT NOT NULL, total DECIMAL(12, 4) NOT NULL, date DATETIME NOT NULL,
  time TIME NOT NULL, payment VARCHAR(15) NOT NULL, cogs DECIMAL(10,2) NOT NULL, gross_margin_pct FLOAT, gross_income DECIMAL(12, 4), rating FLOAT
);

-- importing data from our files
  -- Right click the table name and in the result grid click on import records from an external file option which is right to the Export/Import option
  -- select the data file from the device click the 'use existing table' option and enable truncate table option
select * from sales;

-- -------------------------Feature Engineering -----------------------
-- Create a column named time_of_day to give the insights of sales in the morning, afternoon, evening) to tell which part of the day most sales are made
select time from sales;
describe sales;
SELECT time,
  CASE 
    WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
  END AS time_of_day
FROM sales;

alter table sales add column time_of_day varchar(10); -- created a column
-- to insert data into the new column
update sales set time_of_day=(
CASE 
    WHEN time BETWEEN '00:00:00' AND '12:00:00' THEN 'Morning'
    WHEN time BETWEEN '12:01:00' AND '16:00:00' THEN 'Afternoon'
    ELSE 'Evening'
END
);

--  add a new column 'day_name' which has days of the week
select date, dayname(date) from sales;

alter table sales add column day_name varchar(10);
update sales set day_name=dayname(date);         select day_name from sales;

-- add a new column 'month name'
alter table sales add column month_name varchar(15);
update sales set month_name=monthname(date);         select month_name from sales;

-- unique cities
select distinct(city) from sales;

-- city with branch?
SELECT distinct city, branch from sales;

-- the most selling product line
select sum(quantity) qty, product_line from sales group by product_line order by qty desc limit 1;

-- What is the total revenue by month
SELECT distinct month_name from sales;
select month_name month, SUM(total) total_revenue from sales group by month_name order by total_revenue;

-- product line had the largest revenue
select product_line, SUM(total) total_revenue from sales group by product_line order by total_revenue desc;

-- city with the largest revenue
select branch, city, SUM(total) total_revenue from sales group by city order by total_revenue desc limit 1;

-- most used payment method
select payment from sales;
select payment, count(payment) count from sales group by payment order by count desc limit 1;

-- month had the largest COGS
select month_name, sum(cogs) cog from sales group by month_name order by cog desc;

-- branch sold more products than the average product sold
select branch, sum(quantity) qty from sales group by branch having sum(quantity) > (select avg(quantity) from sales);

-- product line and its remark Good if its greater than average sales or Bad
select product_line, case when avg(quantity)>6 then "Good"
							   else "Bad"
	  end remark
from sales group by product_line;

-- average rating of each product line
select product_line, round(avg(rating),2) avg_rating from sales group by product_line order by avg_rating desc;

-- time of day most sales made
select time_of_day, count(*) tot_sales from sales group by time_of_day order by tot_sales desc;

-- time of the day do customers give most ratings
select time_of_day, round(AVG(rating),2) avg_rating from sales group by time_of_day order by avg_rating desc;

-- time of the day do customers give most ratings per branch
select time_of_day, round(AVG(rating),2) avg_rating from sales where branch="A" group by time_of_day order by avg_rating desc;

-- customer type brings the most revenue
select customer_type, count(*) tot_sales from sales group by customer_type;
