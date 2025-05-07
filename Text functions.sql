use sql830;
/*
Mysql Text Functions : Manipulating Textual data with precision.
Mysql provides a robust set of text functions to manipulate and analyze text data within your database.
These functions enable you to search, format, modify and extract insights from text values, 
enhancing your to work text effectively.

1. String Manipulation
CONCAT(str1, str2,...): combines mulitiple strings into a single string
UPPER(str): Converts a string to uppercase.
LOWER(str): Converts a string to lowercase.
SUBSTRING(str,start,length):Extracts substring from a string
LENGTH(str): returns the length of a string in charaters
Trim(str):removes leading and trailing spaces from a string.
*/
select concat(fname, ' ', lname) as full_name
from employee;
select upper(fname) from employee;
select lower(fname) from employee;

/* 2. Pattern Matchong and functions:
LOCATE(substring, string): Returns the position of the first occurenc of substring within a string.
REPLACE(str, from_str, to_str): Replaces occurences of a substring with another string.
REGEXP_LIKE(str, pattern): checks if a string matches a regular expression pattern.
EXample:
select email from employee
where Regexp_like(email, '@email\.com$');
*/

select locate("a",fname) from employee;
select replace(fname, "N","R") from employee where fname="Neha";
/*
 3. Formatting and spacing:
Lpad(str,len,pad): Pads the left side of a string with specified character.
Rpad(str,len,pad): Pads the right side of a string with specified character.
*/

select * from orders;
select order_id,lpad(customer_id,2,"C") AS padded_id,total_price
from orders;