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

SELECT DAYNAME(now());  --Wednesday
SELECT EXTRACT(YEAR FROM now()); --2023

SELECT EXTRACT(MONTH FROM now()) this_month,EXTRACT(DAY FROM now()) this_day,  DATEDIFF('2019-09-03', '2019-06-21') days_difference,  DATEDIFF('2019-06-21', '2019-09-03') neg_date_diff;
    this_month this_day days_difference   neg_date_diff
      11          29        74                 -74

SELECT TIME('2023-11-30 08:51:00');  --08:51:00
SELECT MINUTE('2023-11-30 08:51:00'); --51
SELECT TIMEDIFF('2023-11-30 09:51:00', '2023-11-30 08:51:00');  --00:60:00
SELECT DATE_ADD(NOW(), INTERVAL 1 MONTH) add_month; 

-- String-to-date conversions
SELECT CAST('2019-09-17 15:30:00' AS DATETIME);
date_time
2019-09-17 15:30:00

-- date_format
    -- format
       -- %p AM/PM
       -- %r Time 12 hour(hh:mm:ss AM/PM)
       -- %S seconds
       -- %T time 24 hour(hh:mm:ss)
       -- %W weekday name(Sun-Sat)
       -- %w Day of the week(0=Sun, 1=Mon)
       -- %Y Year 4 digits
       -- %y Year 2 digits
       -- %D Day of month(oth, 1st)
       -- %b Abbreviated month name(Jan, Feb)
       -- %i Minutes(00-59)
       -- %h Hour(1-12)
  
SELECT now() today, date_format(now(),'%D %b %Y') format_today, date_format(now(),'%h: %i %p') format_time;
    today                  format_today      format_time
    2023-11-30 09:05:55    30th Nov 2023      09:05 AM

SELECT DATE_FORMAT(CURRENT_DATE(), '%M %e, %Y') formatted_date1, DATE_FORMAT(CURRENT_DATE(), '%W, %M %e,%Y') formatted_date2, 
DATE_FORMAT(CURRENT_DATE(), '%Y/%m/%d') formatted_date3, DATE_FORMAT(CURRENT_TIME(), '%h:%i:%s (%p)') formatted_time1, 
DATE_FORMAT(CURRENT_TIME (), '%H:%i') formatted_time2;
    formatted_date1        formatted_date2            formatted_date3   formatted_time1  formatted_time2
    November 30, 2023    Thursday, November 30,2023     2023/11/30       09:22:12 (AM)     09:22

