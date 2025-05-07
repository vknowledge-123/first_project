use sql830;
show tables;
desc employee;

 create table payment 
 ( id int primary key,
   P_date date,
   e_id int references employee(emp_id),
   amount int
);
insert into payment values(101,'2023-10-06',9369,28000),
(102,'2023-10-10',9566,35070),(103,'2023-10-06',9782,29400),
(104,'2023-10-06',9900,28000),(105,'2023-10-06',9999,50000);
select * from payment;

-- SQL INNER JOIN :-
-- The INNER JOIN returns only matching rows from the tables involved.

select emp_id, fname, dept_id,amount
from employee e, payment p
where e.emp_id=p.e_id;

-- SQL OUTER JOIN :-
-- The LEFT OUTER JOIN returns all rows from the left table and 
-- matching rows from the right table.
-- Syntax :
/* select Tablename1.columnname1 , Tablename2.columnname2
from
Tablename1 LEFT OUTER JOIN Tablename2
ON 
Tablename1.columnname = Tablename2.columnname;
*/
select e.emp_id, e.fname, e.salary, p.ID as payment_id, p.amount
FROM
employee e left outer join payment p
ON
e.emp_id = p.e_id;

/*	The RIGHT OUTER JOIN -- returns all rows from the right table and 
	matching rows from the left table.
    SYNTAX :-
    select Tablename1.columnname1 , Tablename2.columnname2
	from
	Tablename1 RIGHT OUTER JOIN Tablename2
	ON 
	Tablename1.columnname = Tablename2.columnname; */
    
 select e.emp_id, e.fname, e.salary, p.ID as pay_id, p.amount
 from 
 employee e RIGHT OUTER JOIN payment p
 ON
 e.emp_id=p.e_id;
/*
 The FULL OUTER JOIN -- returns rows when there is a match in one of 
 the tables; it includes all rows from both tables.
syntax:-
	select Tablename1.columnname1 , Tablename2.columnname2
	from
	Tablename1 LEFT OUTER JOIN Tablename2
	ON 
	Tablename1.columnname = Tablename2.columnname
	UNIION
	select Tablename1.columnname1 , Tablename2.columnname2
	from
	Tablename1 RIGHT OUTER JOIN Tablename2
	ON 
	Tablename1.columnname = Tablename2.columnname;
*/
select e.emp_id, e.fname, e.salary, p.ID as payment_id, p.amount
FROM
employee e left outer join payment p ON e.emp_id = p.e_id
UNION
select e.emp_id, e.fname, e.salary, p.ID as pay_id, p.amount
 from 
 employee e RIGHT OUTER JOIN payment p ON e.emp_id=p.e_id;
 
 /*
 SQL CROSS JOIN :-----
 
 The CROSS JOIN (also known as a Cartesian product) pairs every row from 
 the first table with every row from the second table.
 syntax:
	select Tablename1.columnname1 ,Tablename2.columnname2
	from
	Tablename1 CROSS JOIN Tablename2
	ON 
	Tablename1.columnname = Tablename2.columnname;
*/
select * from employee CROSS JOIN payment;