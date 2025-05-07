use sql830;
/*
syntax :
select <column_list>
from <table_name>
where <condition
Group By <columns>
Having <condition>;
*/
-- SQL Group By with COUNT() function :
select dept_id "Department Code",
Count(*) "No of Employees"
from employee
group by Dept_Id;

-- SQL Group By with SUM() function :
select dept_id,
Sum(salary) "Total Salary"
from employee
group by dept_id;

-- SQL Group By with COUNT() and SUM() function :
select dept_id "Department Code",
count(*) "No of Employees",
sum(salary) "Total Salary"
from employee
group by dept_id;

-- SQL Group By on more than one columns :
select dept_id "Department Code", job_id,
Sum(salary) "Total Salary"
from employee
group by dept_id,Job_Id;

select * from employee;

-- SQL Groun By with Where clause :
select dept_id "Department Code",
sum(salary) "Total Salary"
from employee
where Manager=7839
group by dept_id;

-- SQL Groun By with Where clause :
select dept_id ,
Count(*) "No of Employees"
from employee
group by Dept_Id
Having count(*) >2;