use sql830;
select * from employee;
show tables;
# Total number of employee:
select count(*) from employee;
select count(*) As total_employee from employee;
select count(*) As total_employee from employee group by job_id;

select job_id,count(*) as total_employee from employee group by job_id;

# Average Salary value per job_id:
select job_id,AVG(Salary) As avg_salary
from employee
group by job_id;

# Avg of all employees;
select avg(salary) from employee;

# Minimum and maximun salary in employee table;
select min(salary) as min_salary, max(salary) as max_salary
from employee;
select * from employee;

# Number of distinct countries with orders;
select count(job_id) from employee;
select count(distinct job_id) from employee;
select count(distinct job_id) "Total Jobs" from employee;
select distinct(job_id) from employee;
select job_id from employee; # repeated job_id show