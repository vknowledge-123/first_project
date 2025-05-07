use mydata;
select * from employees;
desc employees;

CREATE TABLE departments (
    DepartmentID INT PRIMARY KEY AUTO_INCREMENT,
    Department_Name VARCHAR(100) NOT NULL
);
desc departments;
INSERT INTO departments VALUES
(1, 'Human Resources'),
(2, 'Finance'),
(3, 'Marketing'),
(4, 'IT'),
(5, 'Operations');
select * from departments;

-- find employees with salary above department average : --
select firstname, departmentid, salary 
from employees e
where salary > 
(select avg(salary) from employees where departmentid = e.departmentid);
select departmentid, avg(salary) from employees group by departmentid; 

-- Find Departments with No Employees : --
select * from departments;


--  Find all Employees in the 'Marketing' Department : --
select * from employees 
where departmentid =
(select departmentid from departments where department_name = "Marketing");

-- Find all Departments with an Average Salary Above $70,000 :--
select * from departments 
where departmentid IN
(select departmentid from employees 
group by departmentid having avg(salary)>60000);

select * from employees e1
where salary =
(select max(salary) from employees where departmentid = e1.departmentid);
select employees where (select count(employeeid) from employees)=0;
