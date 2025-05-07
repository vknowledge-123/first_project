/*MySQL BEFORE DELETE Trigger
BEFORE DELETE Trigger in MySQL is invoked automatically whenever a delete operation is fired on the table. 
Now are going to learn how to create a before delete trigger with its syntax and example.
Syntax
The following is the syntax to create a BEFORE DELETE trigger in MySQL:
1.	CREATE TRIGGER trigger_name   
2.	BEFORE DELETE  
3.	ON table_name FOR EACH ROW  
4.	Trigger_body ;  

The BEFORE DELETE trigger syntax parameter can be explained as below:
o	First, we will specify the name of the trigger that we want to create. It should be unique within the schema.
o	Second, we will specify the trigger action time, which should be BEFORE DELETE. This trigger will be invoked before each row of alterations occurs on the table.
o	Third, we will specify the name of a table to which the trigger is associated. It must be written after the ON keyword. If we did not specify the table name, a trigger would not exist.
o	Finally, we will specify the statement for execution when the trigger is activated.

If we want to execute multiple statements, we will use the BEGIN END block that contains a set of queries to define the logic for the trigger. See the below syntax:
1.	DELIMITER $$   
2.	CREATE TRIGGER trigger_name BEFORE DELETE  
3.	ON table_name FOR EACH ROW  
4.	BEGIN  
5.	   variable declarations  
6.	   trigger code  
7.	END$$  
8.	DELIMITER ;  

Restrictions
o	We can access the OLD rows but cannot update them in a BEFORE DELETE trigger.
o	We cannot access the NEW rows. It is because there are no new row exists.
o	We cannot create a BEFORE DELETE trigger on a VIEW.

BEFORE DELETE Trigger Example
Let us understand how to create a BEFORE DELETE trigger using the CREATE TRIGGER statement in MySQL with an example.
Suppose we have created a table named salaries to store the salary information of an employee as follows:
*/
use sql815;
show tables;
CREATE TABLE salaries (  
emp_num INT PRIMARY KEY,  
valid_from DATE NOT NULL,  
amount DEC(8 , 2 ) NOT NULL DEFAULT 0  
);  
#Next, we will insert some records into this table using the below statement:
INSERT INTO salaries (emp_num, valid_from, amount)  
VALUES  
(102, '2020-01-10', 45000),  
(103, '2020-01-10', 65000),  
(105, '2020-01-10', 55000),  
(107, '2020-01-10', 70000),  
(109, '2020-01-10', 40000);  

select * from salaries;
 
#Third, we will create another table named salary_archives that keeps 
#the information of deleted salary.
CREATE TABLE salary_archives (  
id INT PRIMARY KEY AUTO_INCREMENT,  
emp_num INT,  
valid_from DATE NOT NULL,  
amount DEC(18 , 2 ) NOT NULL DEFAULT 0,  
deleted_time TIMESTAMP DEFAULT NOW()  
);  
select * from salary_archives;
DELETE FROM salaries WHERE emp_num = 105;#this will not add backup data 
#in archieves table as no such trigger is created.

/*We will then create a BEFORE DELETE trigger that inserts a 
new record into the salary_archives table 
before a row is deleted from the salaries table.*/
DELIMITER $$  	  
CREATE TRIGGER before_delete_salaries  
BEFORE DELETE  
ON salaries FOR EACH ROW  
BEGIN  
INSERT INTO salary_archives (emp_num, valid_from, amount)  
VALUES(OLD. emp_num, OLD.valid_from, OLD.amount);  
END$$   
DELIMITER ;  

/* 
In this trigger, we have first specified the trigger name before_delete_salaries. 
Then, specify the triggering event. Third, we have specified the table name on which the trigger is associated. 
Finally, we have written the trigger logic inside the trigger body that insert the deleted row into the salary_archives table.

How to call the BEFORE DELETE trigger?
Let us test the above created BEFORE DELETE trigger and how we can call them. 
So first, we will remove a row from the salaries table:*/

select * from salaries;
#Second, we will query data from the salary_archives table to verify the above-created trigger is invoked 
#or not by using the select statement:
SELECT * FROM salary_archives;  
DELETE FROM salaries WHERE emp_num = 107;  

/*After executing a statement, we can see that the trigger was invoked successfully and 
inserted a new record into the salary_archives table.
 */

#Third, we will remove all rows from the salaries table:
SET sql_sAFE_UPDATES=0;
DELETE FROM salaries;  

/*
Finally, we will query data from the salary_archives table again. 
The trigger was called four times because the DELETE statement removed four records from the salaries table. 
*/

/*MySQL AFTER DELETE Trigger
The AFTER DELETE Trigger in MySQL is invoked automatically whenever a delete event is fired on the table. 
Now we are going to learn how to create an AFTER DELETE trigger with its syntax and example.

Syntax
The following is the syntax to create an AFTER DELETE trigger in MySQL:
1.	CREATE TRIGGER trigger_name   
2.	AFTER DELETE  
3.	ON table_name FOR EACH ROW  
4.	Trigger_body ;  

The AFTER DELETE trigger syntax parameter can be explained as below:
o	First, we will specify the name of the trigger that we want to create. It should be unique within the schema.
o	Second, we will specify the trigger action time, which should be AFTER DELETE. This trigger will be invoked after each row of alterations occurs on the table.
o	Third, we will specify the name of a table to which the trigger is associated. It must be written after the ON keyword. If we did not specify the table name, a trigger would not exist.
o	Finally, we will specify the trigger body that contains a statement for execution when the trigger is activated.

If we want to execute multiple statements, we will use the BEGIN END block that contains a set of SQL queries to define the logic for the trigger. See the below syntax:
1.	DELIMITER $$   
2.	CREATE TRIGGER trigger_name AFTER DELETE  
3.	ON table_name FOR EACH ROW  
4.	BEGIN  
5.	   variable declarations  
6.	   trigger code  
7.	END$$  
8.	DELIMITER ;  

Restrictions
o	We can access the OLD rows but cannot update them in the AFTER DELETE trigger.
o	We cannot access the NEW rows. It is because there are no NEW row exists.
o	We cannot create an AFTER DELETE trigger on a VIEW.

AFTER DELETE Trigger Example
Let us understand how to create an AFTER DELETE trigger using the CREATE TRIGGER statement in MySQL with an example.
Suppose we have created a table named salaries to store the salary information of an employee as follows:
*/
CREATE TABLE salaries (  
emp_num INT PRIMARY KEY,  
valid_from DATE NOT NULL,  
amount DEC(8 , 2 ) NOT NULL DEFAULT 0  
);  

#Next, we will insert some records into this table using the below statement:
INSERT INTO salaries (emp_num, valid_from, amount)  
VALUES  
(102, '2020-01-10', 45000),  
(103, '2020-01-10', 65000),  
(105, '2020-01-10', 55000),  
(107, '2020-01-10', 70000),  
(109, '2020-01-10', 40000);  

select * from Salaries;
 
#Third, we will create another table named total_salary_budget that keeps the salary information from the salaries table.
CREATE TABLE total_salary_budget(  
total_budget DECIMAL(10,2) NOT NULL  
);  
select * from total_salary_budget;
#Fourth, we will use the SUM() function that returns the total salary from the salaries table and 
#keep this information in the total_salary_budget table:
INSERT INTO total_salary_budget (total_budget) SELECT SUM(amount) FROM salaries;  
select * from total_salary_budget;
/*
We will then create an AFTER DELETE trigger that updates the total salary into the total_salary_budget table 
after a row is deleted from the salaries table.
*/
DELIMITER $$  
CREATE TRIGGER after_delete_salaries  
AFTER DELETE  
ON salaries FOR EACH ROW  
BEGIN  
UPDATE total_salary_budget SET total_budget = total_budget - old.amount;  
END$$   
DELIMITER ;  
/*
In this trigger, we have first specified the trigger name after_delete_salaries. 
Then, specify the triggering event. Third, we have specified the table name on which the trigger is associated. 
Finally, we have written the trigger logic inside the trigger body that updates the total salary into 
the total_salary_budget table after a row is deleted from the salaries table.

How to call the AFTER DELETE trigger?
First, we will delete a salary from the salaries table using the following statements to invoke 
the above-created trigger:*/
set sql_safe_updates=0;

DELETE FROM salaries WHERE emp_num = 109;  
select * from salaries;
#Next, we will query data from the total_salary_budget table. 
#We can see that table has been modified after the execution of the query. See the below output:

SELECT * FROM total_salary_budget;  

/* 
In the output, we can see that the deleted salary reduces the total_budget.
Third, we will remove all data from the salaries table:
*/
DELETE FROM salaries;  
select * from salaries;
SELECT * FROM total_salary_budget;  
