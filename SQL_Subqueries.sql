use sql830;
select * from employee;
select avg(salary) from employee;
show tables;
select lname, salary
from employee
where salary < (select avg(salary) from employee);

select min(salary) from employee;
select lname, salary
from employee
where salary = (select min(salary) from employee);

select fname,salary
from employee 
where salary < (select avg(salary) from employee);

select dept_id,avg(salary) as Average_Salary 
from employee 
group by Dept_Id
having avg(salary) > (select avg(salary) from employee where dept_id=30 group by dept_id);



