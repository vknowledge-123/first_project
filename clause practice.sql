use sql830;
select * from employee;

select fname, job_id,salary
from employee
where salary >= 50000;

select fname, job_id
from employee
where job_id="manager";

select fname, job_id,HireDate
from employee
where HireDate<"2022-05-11";

select dept_id, Job_Id,
count(*) "no of employees"
from employee
group by dept_id,job_id;

select dept_id,Job_Id,
avg(salary) as "Avearge Salary"
from employee
group by Dept_Id,Job_Id
having avg(salary)>30000;

SELECT Dept_Id, Job_Id, 
       AVG(salary) AS "Average Salary"
FROM employee
GROUP BY Dept_Id, Job_Id
HAVING AVG(salary) > 30000
ORDER BY AVG(salary) DESC;

select fname,job_id,salary
from employee
order by Salary asc;

select job_id,salary
from employee
order by salary desc
limit 3;

select dept_id, Job_Id,
count(*) "no of employees"
from employee
group by dept_id,job_id
having count(*)> 2;

select dept_id,
sum(salary) as "Total Salary"
from employee
group by Dept_Id
having sum(salary) > 50000;

CREATE TABLE salespeople (
    salesman_id INT PRIMARY KEY,
    name VARCHAR(50),
    city VARCHAR(50),
    commission DECIMAL(4,2)
);
INSERT INTO salespeople (salesman_id, name, city, commission) VALUES
(5001, 'James Hoog', 'New York', 0.15),
(5002, 'Nail Knite', 'Paris', 0.13),
(5005, 'Pit Alex', 'London', 0.11),
(5006, 'Mc Lyon', 'Paris', 0.14),
(5007, 'Paul Adam', 'Rome', 0.13),
(5003, 'Lauson Hen', 'San Jose', 0.12);

SELECT salesman_id, name, city, commission
FROM salespeople
WHERE name LIKE 'B%'  
OR name LIKE 'K%';

CREATE TABLE customers1 (
    customer_id INT PRIMARY KEY,
    cust_name VARCHAR(50),
    city VARCHAR(50),
    grade INT,
    salesman_id INT
);
INSERT INTO customers1 (customer_id, cust_name, city, grade, salesman_id) VALUES
(3002, 'Nick Rimando', 'New York', 100, 5001),
(3007, 'Brad Davis', 'New York', 200, 5001),
(3005, 'Graham Zusi', 'California', 200, 5002),
(3008, 'Julian Green', 'London', 300, 5002),
(3004, 'Fabian Johnson', 'Paris', 300, 5006),
(3009, 'Geoff Cameron', 'Berlin', 100, 5003);
SELECT customer_id, cust_name, city, grade
FROM customers1
WHERE cust_name LIKE 'B%'
AND cust_name LIKE '%l%';
