show grants for current_user;

# to run through new user login:
use sql815;
select * from employee;
select * from student;
desc student;
insert into student values(10,"Chetna","DS",75);
select * from student;
set sql_safe_Updates=0;
delete from student where roll_no=10; # acess denied

update student set marks=90 where roll_no=10; 