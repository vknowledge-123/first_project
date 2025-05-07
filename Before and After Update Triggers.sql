/*Creating a before update trigger with its syntax and example.
Syntax
The following is the syntax to create a BEFORE UPDATE trigger in MySQL:
1.	CREATE TRIGGER trigger_name   
2.	BEFORE UPDATE  
3.	ON table_name FOR EACH ROW  
4.	trigger_body ;  
The BEFORE UPDATE trigger syntax parameter are explained as below:
o	First, we will specify the trigger name that we want to create. It should be unique within 
the schema.
o	Second, we will specify the trigger action time, which should be BEFORE UPDATE. 
This trigger will be invoked before each row of alterations occurs on the table.
o	Third, we will specify the name of a table to which the trigger is associated. 
It must be written after the ON keyword. If we did not specify the table name, a trigger would 
not exist.
o	Finally, we will specify the trigger body that contains a statement for execution 
when the trigger is activated.
If we want to execute multiple statements, we will use the BEGIN END block that contains 
a set of queries to define the logic for the trigger. See the below syntax:
1.	DELIMITER $$   
2.	CREATE TRIGGER trigger_name BEFORE UPDATE  
3.	ON table_name FOR EACH ROW  
4.	BEGIN  
5.	   variable declarations  
6.	   trigger code  
7.	END$$  
8.	DELIMITER ;  
Restrictions
o	We cannot update the OLD values in a BEFORE UPDATE trigger.
o	We can change the NEW values.
o	We cannot create a BEFORE UPDATE trigger on a VIEW.
BEFORE UPDATE Trigger Example
Let us understand how to create a BEFORE UPDATE trigger using the CREATE TRIGGER statement 
in MySQL with an example.
Suppose we have created a table named sales_info as follows:
*/
use sql815;
show tables;

CREATE TABLE sales_info (  
id INT AUTO_INCREMENT,  
product VARCHAR(100) NOT NULL,  
quantity INT NOT NULL DEFAULT 0,  
fiscalYear SMALLINT NOT NULL,  
CHECK(fiscalYear BETWEEN 2000 and 2050),  
CHECK (quantity >=0),   
PRIMARY KEY(id)  
);  

#Insert some records into the sales_info table as follows:
INSERT INTO sales_info(product, quantity, fiscalYear)  
VALUES  
('2003 Maruti Suzuki',110, 2020),  
('2015 Avenger', 120,2020),  
('2018 Honda Shine', 150,2020),  
('2014 Apache', 150,2020);  

select * from sales_info;
#Next, we will use a CREATE TRIGGER statement to create a BEFORE UPDATE trigger. 
#This trigger is invoked automatically before an update event occurs in the table.
DELIMITER $$  
CREATE TRIGGER before_update_sinfo 
BEFORE UPDATE  
ON sales_info FOR EACH ROW  
BEGIN  
	DECLARE error_msg VARCHAR(255);  
	SET error_msg = ('The new quantity cannot be Less than current quantity');  
	IF new.quantity < old.quantity THEN  
		SIGNAL SQLSTATE '45000'
		SET MESSAGE_TEXT = error_msg;
	END IF;  
END $$  
DELIMITER ; 
 show triggers;
drop trigger before_update_sInfo;
/*The trigger produces an error message and stops the updation 
if we update the value in the quantity column to a new value two times greater 
than the current value.
Let us understand the created trigger in details:
First, we have specified the trigger name as befor_update_salesInfo in the 
CREATE TRIGGER clause. 
Second, specify the triggering event and then the table name on which the trigger is associated. 
Third, we have declared a variable and set its value. 
Finally, we have specified the trigger body that checks if the new value is two times greater 
than the old value 
and then raises an error.*/
drop trigger 
#How to call the BEFORE UPDATE trigger?
#First, we can use the following statements that update the quantity of the row whose id = 2:
UPDATE sales_info SET quantity = 150 WHERE id = 2;   
select * from sales_info;
#This statement works well because it does not violate the rule. 
#Next, we will execute the below statements that update the quantity of the row as 600 whose id = 2

UPDATE sales_info SET quantity = 160 WHERE id = 2;   

UPDATE sales_info SET quantity = 105 WHERE id = 2;   

#It will give the error as follows because it violates the rule.



/*MySQL AFTER UPDATE TRIGGER
The AFTER UPDATE trigger in MySQL is invoked automatically whenever an UPDATE event is fired 
on the table associated with the triggers. here we will learn how to create 
an AFTER UPDATE trigger with its syntax and example.
Syntax
The following is the syntax to create an AFTER UPDATE trigger in MySQL:
1.	CREATE TRIGGER trigger_name   
2.	AFTER UPDATE  
3.	ON table_name FOR EACH ROW  
4.	trigger_body ;  
We can explain the parameters of AFTER UPDATE trigger syntax as below:
o	First, we will specify the trigger name that we want to create. It should be unique 
within the schema.
o	Second, we will specify the trigger action time, which should be AFTER UPDATE. 
This trigger will be invoked after each row of alterations occurs on the table.
o	Third, we will specify the table name to which the trigger is associated. 
It must be written after the ON If we did not specify the table name, a trigger would not exist.
o	Finally, we will specify the trigger body that contains a statement for 
execution when the trigger is activated.
If we want to execute more than one statement, we will use the BEGIN END block 
that contains a set of SQL queries to define the logic for the trigger. See the below syntax:
1.	DELIMITER $$   
2.	CREATE TRIGGER trigger_name AFTER UPDATE  
3.	ON table_name FOR EACH ROW  
4.	BEGIN  
5.	   variable declarations  
6.	   trigger code  
7.	END$$  
8.	DELIMITER ;  
Restrictions
o	We can access the OLD rows but cannot update them.
o	We can access the NEW rows but cannot update them.
o	We cannot create an AFTER UPDATE trigger on a VIEW.
AFTER UPDATE Trigger Example
Let us understand how to create an AFTER UPDATE trigger using the CREATE TRIGGER statement 
in MySQL with an example.
Suppose we have created a table named students to store the student's information as follows:
*/
use sql630;
show tables;
CREATE TABLE stud9(    
id int NOT NULL AUTO_INCREMENT,    
name varchar(45) NOT NULL,    
class int NOT NULL,    
email_id varchar(65) NOT NULL,    
PRIMARY KEY (id)    
);  
desc stud9;

#Insert some records into this table using the below statement:
INSERT INTO stud9 (name, class, email_id)     
VALUES ('Stephen', 6, 'stephen@javatpoint.com'),   
('Bob', 7, 'bob@javatpoint.com'),   
('Steven', 8, 'steven@javatpoint.com'),   
('Alexandar', 7, 'alexandar@javatpoint.com');  
Select * from stud9;
#Third, we will create another table named students_log that keeps the updated 
#information in the selected user.
CREATE TABLE stud9_log(    
user varchar(45) NOT NULL,    
descriptions varchar(65) NOT NULL  
);
select * from stud9_log;  
/*
We will then create an AFTER UPDATE trigger that promotes all students in the next class, 
i.e., 6 will be 7, 7 will be 8, and so on. 
Whenever an updation is performed on a single row in the "students" table, 
a new row will be inserted in the "students_log" table. 
This table keeps the current user id and a description regarding the current update.*/

DELIMITER $$  
CREATE TRIGGER after_update_stud9Info  
AFTER UPDATE  
ON stud9 FOR EACH ROW  
BEGIN  
	INSERT into stud9_log VALUES (user(),   
	CONCAT('Updated ', OLD.name, ' Previous Class :',  
	OLD.class, ' Present Class ', NEW.class));  
END $$  
DELIMITER ;  
drop trigger after_update_stud63Info
/* 
In this trigger, we have first specified the trigger name after_update_studentsInfo. 
Then, specify the triggering event. Third, we have specified the table name on which the trigger 
s associated. 
Finally, we have written the trigger logic inside the trigger body that performs updation 
in the "students" table and keeps the log information in the "students_log" table.
How to call the AFTER UPDATE trigger?
First, we will update the "students" table using the following statements that invoke the 
above-created trigger:*/
set sql_safe_updates=0;
UPDATE stud9 SET class = class + 1;  
/*Next, we will query data from the students and students_log table. 
We can see that table has been updated after the execution of the query. See the below output:*/
set SQl_Safe_updates=0;
select * from stud9;

select * from stud9_log;



