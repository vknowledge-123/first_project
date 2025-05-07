create database SQL16;
show databases;
use SQL16;
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




select * from stud;
insert into stud values(1,"Asha","DA",90),(2,"Disha","DA",80),(3,"Risha","DA",75),(4,"Sasha","DA",59);
commit;
insert into stud values(5,"Nisha","DA",59);
commit;
insert into stud values(6,"Disha","DA",88);

update stud set marks=90 where rollno=5;
set sql_safe_updates=0;

delete from stud where rollno=5;

select * from stud;

delete from stud where rollno=4;
savepoint s1;
insert into stud values(9,"Prisha","DA",59);

rollback to s1;
rollback;

update student set name"Disha" where rollno=4;

commit

delete from student;



