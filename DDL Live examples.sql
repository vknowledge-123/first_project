# Commands to be run by Host(Root):
show grants for current_user;
Create user 'userVA'@'localhost' identified by '1234';

Grant insert, update on sql830.student to 'userVA'@'localhost';

Revoke insert, update on sql830.student from 'userVA'@'localhost';

Flush privileges;

show grants for 'user1'@'localhost'; # error as no such user created and granted with any permission.
show grants for 'user2'@'localhost';
show grants for 'user3'@'localhost';

show grants for current_user;
select * from student;