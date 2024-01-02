-- ref: https://learnsql.com/blog/what-is-common-table-expression/

CREATE TABLE sales (
    branch VARCHAR(50),
    date DATE,
    seller VARCHAR(50),
    item VARCHAR(50),
    quantity INT,
    unit_price DECIMAL(10, 2)
);

INSERT INTO sales (branch, date, seller, item, quantity, unit_price) VALUES
    ('Paris-1', '2021-12-07', 'Charles', 'Headphones A2', 1, 80),
    ('London-1', '2021-12-06', 'John', 'Cell Phone X2', 2, 120),
    ('London-2', '2021-12-07', 'Mary', 'Headphones A1', 1, 60),
    ('Paris-1', '2021-12-07', 'Charles', 'Battery Charger', 1, 50),
    ('London-2', '2021-12-07', 'Mary', 'Cell Phone B2', 2, 90),
    ('London-1', '2021-12-07', 'John', 'Headphones A0', 5, 75),
    ('London-1', '2021-12-07', 'Sean', 'Cell Phone X1', 2, 100);

-- calculating daily revenue
WITH daily_revenue AS (
  SELECT
    branch,
    date,
    SUM(unit_price * quantity) AS daily_revenue
  FROM sales
  WHERE EXTRACT(YEAR FROM date) = 2021
  GROUP BY 1, 2
)

SELECT
  branch,
  MAX(daily_revenue) AS max_daily_revenue
FROM daily_revenue
GROUP BY 1
ORDER BY 2 DESC;

/*
  Suppose we want a report with the total monthly revenue in London in 2021, but we also want the revenue for each branch in London in the same report. 
  Here, we create two CTEs then join them in the main query.
*/
WITH london1_monthly_revenue AS (
  SELECT
    EXTRACT(MONTH FROM date) as month,
    SUM(unit_price * quantity) AS revenue
  FROM sales
  WHERE EXTRACT(YEAR FROM date) = 2021
    AND branch = 'London-1'
  GROUP BY 1
),
london2_monthly_revenue AS (
  SELECT
    EXTRACT(MONTH FROM date) as month,
    SUM(unit_price * quantity) AS revenue
  FROM sales
  WHERE EXTRACT(YEAR FROM date) = 2021
    AND branch = 'London-2'
  GROUP BY 1
)
SELECT
  l1.month,
  l1.revenue + l2.revenue AS london_revenue,
  l1.revenue AS london1_revenue,
  l2.revenue AS london2_revenue
FROM london1_monthly_revenue l1, london2_monthly_revenue l2
WHERE l1.month = l2.month
