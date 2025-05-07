create database Mydata;
show databases;
use Mydata;
show tables;
create table stud
(
rollno int(15),
name varchar(15),
marks int(2),
class varchar(50)
);
describe stud;

select * from stud;
select name from stud;
select rollno,name from stud;

insert into stud values (1,"Akash","DS",70);
insert into stud values(2,"Shruti","DA",75);
insert into stud values 

select rollno,name,marks from stud;
select class from stud;

