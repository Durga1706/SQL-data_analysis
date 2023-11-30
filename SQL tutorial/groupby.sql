/* GROUP BY is a SQL query clause used to group data rows based on one or more columns in a table.
   It is often combined with aggregate functions such as SUM, AVG, COUNT, MAX, and MIN to calculate statistics or summarize data.
*/

CREATE TABLE Sales ( Country VARCHAR(50), Region VARCHAR(50), Sales INT );

INSERT INTO sales VALUES (N'Canada', N'Alberta', 100);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 200);
INSERT INTO sales VALUES (N'Canada', N'British Columbia', 300);
INSERT INTO sales VALUES (N'United States', N'Montana', 100);

    Country	      Region	             Sales
    Canada	      Alberta	             100
    Canada	      British Columbia     200
    Canada	      British Columbia     300
    United States	Montana	             100

-- aggregate sum for each combination of values.
SELECT Country, Region, SUM(sales) AS TotalSales FROM Sales GROUP BY Country, Region;
    Country	       Region	          TotalSales
    Canada	       Alberta	         100
    Canada	       British Columbia	 500
    United States	 Montana	         100

-- group by with rollup
SELECT Country, Region, SUM(Sales) AS TotalSales FROM Sales GROUP BY ROLLUP (Country, Region);
    Country	        Region	            TotalSales
    Canada	        Alberta	            100
    Canada	        British Columbia	  500
    Canada	        NULL	              600
    United States	  Montana	            100
    United States	  NULL	              100
    NULL	          NULL	              700
