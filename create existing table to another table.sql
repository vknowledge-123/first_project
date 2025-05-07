use sql830;
show tables;
select * from employee;

 # creating new table from existing table where structure as well as data is copied.
 create table new_emp11 as (select * from Employee);
 desc new_emp11;
 select * from new_emp11;

# Creating new table from existing table where selected columns as well as their data is copied.
 create table new_emp12 as (select emp_id,fname,lname jod_id,salary from Employeee);
desc emp12;
select * from new_emp12;

# Creating new table from existing table where steucture as well as satisfying some condition is copied.
 create table new_emp13 as (select emp_id,fname,lname jod_id,salary 
 from Employeee where salary>25000);
desc emp13;
select * from new_emp13;

 # Creating new table from existing table where complete structure selected but data satisfying some condition is copied.
 create table new_emp14 as (select * from Employee where salary>25000);
 desc new_emp14;
 select * from new_emp14;
 
# Creating new table from existing table where complete structure is copied without records.
create table new_emp15 as(select * from employee where 1=2);
desc new_emp15;
select * from new_emp15;

create table new_emp16 as(select emp_id,fname,lname from employee where 1=2);
desc new_emp16;
select * from new_emp16;

select * from employee limit 5;
select * from employee limit 5 offset 12;