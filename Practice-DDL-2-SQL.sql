use sql16;
create table Employees
( EmployeeID integer ,
FirstName varchar(50),
LasttName varchar(50),
Department varchar(50),
Salary integer,
HireDate date
);
desc employees;
select * from employees;
alter table employees
add column Email varchar(50);
alter table employees
change column  Department DeptName varchar(50);
alter table employees
add column Phone varchar(15);

insert into employees (EmployeeID, FirstName, LasttName, DeptName, HireDate)
values  (101, 'John', 'Doe', 'Sales', '2022-01-15'),
(102, 'Jane', 'Smith', 'HR', '2022-02-20'),
(103, 'David', 'Johnson', 'IT', '2022-03-25'),
(104, 'Mary', 'Wilson', 'Marketing', '2022-04-10'),
(105, 'Michael', 'Brown', 'Sales', '2022-05-15'),
(106, 'Emily', 'Jones', 'HR', '2022-06-20'),
(107, 'James', 'Garcia', 'IT', '2022-07-25'),
(108, 'Emma', 'Martinez', 'Marketing', '2022-08-10'),
(109, 'William', 'Hernandez', 'IT', '2022-09-15'),
(110, 'Olivia', 'Young', 'Sales', '2022-10-20');

create table Departments
( DepartmentID int ,
DepartmentName varchar(100),
Location varchar(100)
);
desc Departments;
alter table departments
modify column Location varchar(150);
select * from departments;
insert into departments values
 (201, "Sales","Nagpur"),
(202, "HR","Pune"),
(203, "Finance","Nashik"),
(204, "Marketing","Akola"),
(205, "IT","Mumbai");
