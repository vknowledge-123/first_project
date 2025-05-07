			##------  If() --------##
-- In MySQL, the IF() function is a control flow function 
-- that acts as a conditional operator.
-- It's similar to an "if-then-else" statement found in many programming languages.
-- However, it's used within SQL queries, 
-- primarily for selecting or manipulating data based on conditions.

## IF(condition, value_if_true, value_if_false)
-- Explanation:
-- condition: This is an expression that evaluates to a boolean value (TRUE or FALSE).
--  MySQL treats any non-zero value as TRUE and zero as FALSE.
-- value_if_true: If the condition is TRUE, the IF() function returns this value.
-- value_if_false: If the condition is FALSE, the IF() function returns this value
# Example-1:
select if(400>350,'Yes','No') as result;

select if(250=250, 'Correct','Wrong');

select if(strcmp('Yuvraj Singh','Yuvraj Singh')=0,'Correct','Wrong');

use sql830;
select * from employee;
select emp_id, fname, lname,commission,
if(commission>0,'Senior', 'Fresher')
as result
from employee;

			##------  IfNULL() --------##
-- In MySQL, the IFNULL() function is a handy tool for dealing with NULL values.
-- Essentially, it allows you to provide an alternative value to be used 
-- when a given expression evaluates to NULL.
-- Purpose:
-- The primary purpose of IFNULL() is to replace NULL values with a specified alternative. 
-- This is particularly useful in situations where you want to:
-- Prevent errors in calculations.
-- Display more user-friendly results.
-- Ensure data consistency.
-- Syntax:
-- IFNULL(expression, alt_value)
-- Explanation:
-- expression: This is the value or column that you want to check for NULL.
-- alt_value: If expression is NULL, then IFNULL() returns this value. 
-- Otherwise, it returns the value of expression. 

select ifnull("Hello","javapoint");
select ifnull(null,5);
use sql830;
create table student_contacts
(	studentid int not null,
	contactname varchar(45) not null,
    cellphone varchar(20) default null,
    homephone varchar(20) default null
);
insert into student_contacts values(1,"Anish",'9856326574','9822446666');
insert into student_contacts (studentid,contactname,cellphone)
values(2,"Anisha",'9045963258');
insert into student_contacts (studentid,contactname,homephone)
values(3,"Amitabh",'9045458258');
insert into student_contacts (studentid,contactname,homephone)
values(4,"Abhishek",'9777763258');
insert into student_contacts (studentid,contactname,homephone)
values(5,"Aishwarya",'9456238258');

select * from student_contacts;

select contactname, cellphone, homephone
from student_contacts;
select contactname, ifnull (cellphone, homephone) phone
from student_contacts;

-- Note : You should avoid the use of IFNULL() function in the 
-- Where clause because this function reduces the performance of the query.

		##------  NULLIF() --------##
-- The NULLIF() function in MySQL is a control flow function that compares two expressions.
-- Purpose:
-- NULLIF() compares two expressions.
-- If the two expressions are equal, it returns NULL.
-- If they are not equal, it returns the value of the first expression.
-- A common use case is to prevent division by zero errors.
-- NULLIF(expression1, expression2)
-- Explanation:
-- expression1: The first expression to be compared.
-- expression2: The second expression to be compared.
-- How it works:
-- The function checks if expression1 is equal to expression2.
-- If they are equal, the function returns NULL.
-- If they are not equal, the function returns the value of expression1.

select Nullif("Boffins","Boffin");
select nullif("Hello","404");
select nullif(9,9);
use sql830;
select * from employee;
select fname, lname, job_id,
nullif(job_id,"Analyst")result
from employee;
