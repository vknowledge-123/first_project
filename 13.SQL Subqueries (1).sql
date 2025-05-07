/*A subquery is a query embedded within another SQL satement,which can be another query 
or a DML statement.
It is a SELECT statement whose output is used as input to another Select statement.
It can return a set of rows or just one row to its parent query.
Subquery result set can be Used of For Comparison purposes also

syntax:
select <column_name>  from  <table_name >
where <column_name>=(select <column_name> from <table_name> where <condition>);
*/
#Subquery:1)
#Which employees have a salary that is less than the average salary?
use dataset;
select * from employee;
select avg(salary) from employee;

select lname,salary from employee where salary<(select avg(salary) from employee);
/*Types of subquery
1.Single row subquery:Return one result row consisting of one column to outer query.
(used with where,having,select clauses)*/
#With where clause:Find all employees who earn the lowest salary.
#(comparison against individual value.)
select min(salary) from employee;

select fname,lname,salary
from employee 
where salary=(select min(salary) from employee);

/*With having clause:Find all departments having average salary  
greater than the average salary of dept_no = 30.
(comparison against grouped data.)*/
select avg(salary) from employee;
select avg(salary) from employee group by dept_id;
select dept_id,avg(salary) from employee group by dept_id;
select dept_id,avg(salary) as Average_Salary from employee group by Dept_id;

select dept_id,avg(salary) "Average Salary" from employee group by Dept_id;

select avg(salary) from employee where dept_id=30 group by dept_id;
#Final Query
select dept_id,avg(salary) "Average salary"
from employee
group by dept_id
having avg(salary) >
(select avg(salary) from employee where dept_id=30);

/*Multiple row subquery:Returns more than one row of results to the outer query.
With where clause: Find all employees earning lowest salary in each 
department.
*/
select dept_id,min(salary) from employee group by dept_id;

select fname,salary,dept_id
from employee where(dept_id,salary)
in(select dept_id,min(salary) from employee group by dept_id);

/*Correlated subquery:References a column in the outer query.
Executes the subquery once for every row in the outer query.

Find the employees whose salary is less than average salary
*/

select fname from employee where salary<(select avg(salary) from employee);

/*find the name,salary and department of those employees whose 
salary is less than the average salary of their department*/

select fname,salary,dept_id
from employee e
where salary<
(select avg(salary) from employee where dept_id=e.dept_id);


#Nested Subquery
/*Find the list of department IDs and their corresponding average salaries, 
but only for those departments where the average salary is 
less than the maximum average salary across all departments.*/

SELECT dept_id, AVG(salary) AS avg_salary
FROM employee
GROUP BY dept_id
HAVING avg_salary < (
    SELECT MAX(avg_salary)
    FROM (
        SELECT dept_id, AVG(salary) AS avg_salary
        FROM employee
        GROUP BY dept_id
    ) AS avg_salaries
);

/*In this revised query, the subquery first calculates the average salary 
for each department and assigns it an alias avg_salary. 
Then, it selects the maximum value of avg_salary from this derived table avg_salaries. 
This eliminates the nested aggregate function and allows the query to run without errors.*/