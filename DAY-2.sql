create database SQL830;
show databases;
use SQL830;
show tables;
create table student
(
rollno int(15),
name varchar(15),
marks int(2),
class varchar(50)
);
describe student;
desc student;
Alter table student
add per integer;

Alter table student
add address varchar(50) after name;

Alter table student
add id integer first;

Alter table student
add subject varchar(15),
add grade varchar(2);

Alter table student
add (hobby varchar(15),bgrp varchar(2));

desc student;

alter table student
modify name varchar(20);

alter table student
modify address varchar (35) after marks;

alter table student
modify rollno integer first ;

alter table student
drop dob;
desc student;

alter table student
drop column address,
drop column per,
drop column subject,
drop column hobby,
drop column bgrp;

alter table student 
add class varchar(50) after name;

alter table student
change rollno  Roll_N0 integer;

alter table student
rename column name to Name;

alter table student
rename to stud;

desc student;
desc stud;
show tables;

desc employees;
drop table stud;








