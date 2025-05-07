/* MySQL Date and Time Functions: Mastering Temporal Data Handling

My SQL offers a rich set of functions specifically designed to work with
date and time values.
Those functions empower you to extract information, perform calculations,
format dates, and manipulate temporal data with ease.
*/
/* 1. Some Useful date and time functions:

CURDATE() or CURRENT_DATE: Returns the current date.
CURTIME() or CURRENT_TIME: Returns the current time.
NOW() or CURRENT_TIMESTAMP: Returns the current date and time.
DATE(datetime): Extracts the date part from a datetime value.
TIME(datetime): Extracts the time part from a datetime value.
*/
select curdate();
select curtime();
select now();

select curdate() as formatted_datetime;
select curtime() as formatted_datetime;
select now() as formatted_datetime;

/* 2. Extracting Information:
YEAR(date): Returns the year part of a date (e.g. 2024).
MONTH(date): Returns the month part of a date (1-12).
DAY(date): Returns the day of the month (1-31).
DAYNAME(date): Returns the name of the weekday (e.g. 'Wednesday').
DAYOFWEEK(date): Returns the weekday index (1 for Sunday, 2 for Monday, etc.).
WEEKDAY(date): Same as DAYOFWEEK, but 0 for Monday, 6 for Sunday.
HOUR(time): Returns the hour part of a time (0-23).
MINUTE(time): Returns the minute part of a time (0-59).
SECOND(time): Returns the second part of a time (0-59).
*/
#Example:
use SQL815;

select * from payment;
desc payment;
#Example 1:
select p_date,
 year(p_date) ,
 monthname(p_date), 
 dayname(p_date)
from payment;

#Example 2:
select hour(now()), minute(now()), second(now()) as second;

/* Performing Calculations:
DATE_ADD(date, INTERVAL expr unit): Adds a specified interval to a date.
DATE_SUB(date, INTERVAL expr unit): Substract a specified interval from a date.
DATEDIFF(date1,date2): Calculates the difference between two dates in days.
TIMESTAMPDIFF(unit, datetime1, datetime2): Calculates the difference between two
datetime values in various units
(e.g., seconds, minute, hours).
*/
use sql815;

select date_add(curdate(), interval 7 day) as next_week;
select date_sub(curdate(), interval 7 day) as last_week;
select date_add(curdate(), interval 7 month) as next_week;
select date_sub(curdate(), interval 2 year) as last_week;
select datediff('2024-09-30','2024-07-31');

/* 4. Formatting Date:
dateformat(date,format): formats a date according to a specified format string
*/
-- DATE_FORMAT(date, format)
SELECT DATE_FORMAT('2024-03-26', '%d-%M-%Y') AS formatted_date;
SELECT DATE_FORMAT(CURDATE(), '%W, %d %M %Y') AS formatted_date;
SELECT DATE_FORMAT(NOW(), '%d-%m-%Y %h:%i:%s %p') AS formatted_datetime;
/*
Y	Year (4 digits)	2024
%y	Year (2 digits)	24
%M	Full month name	March
%m	Month (2 digits)	03
%D	Day with suffix	26th
%d	Day (2 digits)	26
%W	Weekday name	Tuesday
%H	Hour (24-hour format)	23
%h	Hour (12-hour format)	11
%i	Minutes (2 digits)	45
%s	Seconds (2 digits)	30
%p	AM/PM	AM
*/