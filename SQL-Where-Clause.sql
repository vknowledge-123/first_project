use sql830;

Create table Employee
(	Emp_id Int,
    Fname Varchar(15),
    Lname Varchar(15),
    Job_Id Varchar(45),
    Manager int,
    HireDate Date,
    Salary int,
    Commission int,
    Dept_Id int
);
select * from employee;

INSERT INTO EMPLOYEE VALUES 
(9369, 'Neha', 'Sharma', 'SOFTWARE ENGINEER', 7902, '2022-12-17', 28000, 0, 20),
(9499, 'Nisha', 'Joshi', 'SALESMAN', 7698, '2022-02-20', 16000, 300, 30),
(9566, 'Akash', 'Chaudhary', 'MANAGER', 7839, '2022-04-02', 35070, 0, 90),
(9654, 'Samiksha', 'Deshpande', 'SALESMAN', 7698, '2022-10-28', 12500, 1400, 30),
(9782, 'Lina', 'Urme', 'MANAGER', 7839, '2022-06-09', 29400, 0, 90),
(9788, 'Lisha', 'Dhule', 'ANALYST', 7566, '2022-12-09', 30000, 0, 20),
(9839, 'Avi', 'Patil', 'PRESIDENT', 7566, '2022-11-17', 95000, 0, 10),
(9844, 'Kartik', 'Dev', 'SALESMAN', 7698, '2022-02-21', 15000, 0, 30),
(9876, 'Swara', 'Meshram', 'SOFTWARE ENGINEER', 7788, '2022-01-12', 30100, 0, 20),
(9900, 'Rahul', 'Sing', 'TECHNICAL LEAD', 7698, '2022-01-12', 52950, 0, 60),
(9902, 'Dev', 'Laddha', 'ANAYLIST', 7566, '2022-03-30', 30000, 0, 10),
(9934, 'Kishan', 'Mathur', 'SOFTWARE ENGINEER', 7782, '2022-02-23', 33000, 0, 20),
(9591, 'Swapnashil', 'B', 'SAKESMAN', 7698, '2022-12-01', 25000, 0, 100),
(9698, 'Vivek', 'B', 'MANAGER', 7839, '2022-05-01', 34200, 0,30),
(9777, 'Nilay', 'Ramekar', 'ANALYST', 7839, '2022-02-21', 50000, 200, NULL),
(9860, 'Prakash', 'Dive', 'ANALYST', 7839, '2022-02-01', 70000, 100, 50),
(9861, 'Pooja', 'Joshi', 'ANALYST', 7839, '2022-07-01', 50000, 100, 50);

/* Syntax :
Select <column list>
From <table name>
Where <condition>; */

select emp_id,fname,lname,dept_id
from employee
where dept_id=20;

select emp_id,job_id,salary
from employee
where lname="deshpande";

select emp_id,fname,lname,salary
from employee
where salary>=40000;

-- WHERE Clause using BETWWEN AND Condition in SQL :-
select fname,lname,salary,(salary+(salary*commission))"Net Salary"
from employee where
(salary+(salary*commission))
Between 10000 AND 40000
AND commission>0;

select fname,lname,salary
from employee 
where salary Between 20000 AND 40000;

-- WHERE Clause using IN Condition in SQL :-
select emp_id, fname, lname, dept_id, salary
from employee
where dept_id IN(60,90,100);

-- WHERE Clause using LIKE Condition in SQL :-
select emp_id, fname, lname, dept_id, salary
from employee
where lname Like("S%"); # starting letter of name '%'

select emp_id, fname, lname, dept_id, salary
from employee
where fname Like("_v%"); # '_' reprents the second letter of word

-- WHERE Clause using NULL Condition in SQL :-
SELECT emp_id, fname, lname, dept_id, salary  
FROM employee  
WHERE dept_id IS NULL;

-- WHERE Clause using Logical Conditions in SQL :-
-- WHERE Clause using AND Operator in SQL :-
SELECT emp_id, fname, lname, dept_id, salary  
FROM employee  
WHERE fname LIKE 'S%'  
AND salary >= 25000;

-- WHERE Clause using OR Operator in SQL :-
SELECT emp_id, fname, lname, dept_id, salary  
FROM employee  
WHERE fname LIKE 'S%'  
OR fname LIKE 'A%';

-- WHERE Clause using NOT Operator in SQL :-
SELECT emp_id, fname, lname, dept_id, salary  
FROM employee  
WHERE dept_id NOT IN (90, 60, 100);
