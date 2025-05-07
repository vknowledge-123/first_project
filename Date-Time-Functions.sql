/*
1. Some Useful date and time functions:
CURDATE() ot CURRENT_DATE: Returns the current date.
CURTIME() ot CURRENT_TIME: Returns the current time.
NOW() or CURRENT_TIMESTAMP: Returns the current date and time.
DATE(datetime): extracts thr date part from a datetime value.
TIME(datetime): extracts thr time part from a datetime value
*/
select curdate();
select curtime();
select now();

select curdate() As formatted_datetime;
select curtime() As formatted_datetime;
select now() As formatted_datetime;

/* Extracting Information:
Year(date) : returns the year part of a date(e.g.,2024).
Month(date): returns the month part of a date(1-12).
Day(date): returns the day of a month(1-31).
Dayname(date): returns the name of the weekday("Tuesday").
Dayofweek(date): returns the weekday index( 1 for Sunday, 2 for monday)
weekday(date): same as dayofweek, but 0 for monday, 6 for sunday.
Hour(time): Returns the hour part of the time (0-23).
minute(time): Returns the minute part of the time (0-59).
Second(time): Returns the second part of the time (0-59).
*/
use sql830;
select * from payment;
select p_date, year(p_date), monthname(p_date),dayname(p_date)
from payment;
select year(curdate()), monthname(curdate()), dayname(curdate());
