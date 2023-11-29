-- Date and time data types
  -- time hh:mm:ss
  -- date YYYY-MM-DD
  -- datetime YYYY-MM-DD hh:mm:ss

-- Current System Date and Time
SELECT sysdate();    -- 2023-11-29 19:34:36

SELECT CURRENT_DATE() date, CURRENT_TIME() time, CURRENT_TIMESTAMP() date_time, DATE_ADD(now(), INTERVAL '3:27:11' HOUR_SECOND) today_after_3hrs,
DATE_ADD(now(), INTERVAL '9-11' YEAR_MONTH) nine_years_after, LAST_DAY('2019-09-17') last_day;  
date	        time	   date_time	              today_after_3hrs	      nine_years_after	       last_day
2023-11-29	14:29:03	2023-11-29 14:29:03	    2023-11-29 17:56:14	    2033-10-29 14:29:03	      2019-09-30

-- String-to-date conversions
SELECT CAST('2019-09-17 15:30:00' AS DATETIME);
date_time
2019-09-17 15:30:00

