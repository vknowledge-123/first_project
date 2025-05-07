create database SQL830;
show databases;
use SQL830;
show tables;
create table student
(
rollno int(15),
name varchar(15),
marks int(2),
dob date
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
