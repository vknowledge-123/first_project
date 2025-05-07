use sql830;
 create table emp(
 name varchar (15) not null,
 occupation varchar (20) not null,
 working_date date,
 working_hours varchar (10)
 );
 insert into emp values
 ("Robin","Scientist","2020-10-04",12),
 ("Warner","Engineer","2020-10-04",10),
 ("Peter","Doctor","2020-10-04",9),
 ("Marco","Teacher","2020-10-04",11),
 ("Antonio","Analyst","2020-10-04",13);
 insert into emp values ("Bincy","Scientist","2020-10-04",-2);
 select * from emp;
 #create a BEFORE INSERT trigger. This trigger is invoked automaticaaly
 # and will insert the working_hours = 0 if someone tries to insert working_hours < 0
 DELIMITER //
 create trigger before_insert_empworkinghours
 Before Insert on emp for each row
 Begin
	if new.working_hours < 0 then
		set new.workung_hours = 0;
end if;
end //
#Now, we can use the following statements to invoke this trigger:
insert into emp values ("Markus","Former","2020-10-08",14);
insert into emp values ("Alexandar","Actor","2020-10-08",-13);

Delimiter //
create trigger before_insert_occupation
Before Insert on emp for each row
Begin
	if new.occupation = 'Scientist' then
		set new.occupation = 'Doctor';
end if;
end //
select * from emp;
insert into emp values ("Rubina","Scientist","2020-10-08",14);
insert into emp values ("Dom","Actor","2020-10-12",-13);
insert into emp values ("Markus","Scientist","2020-10-12",-10);
show triggers;
show triggers in dataset;
-- show triggers in (database name).trigger name
dropn trigger employeedb.before_update_salaries;

/*
After INSERT Trigger Example
-- CReate an after insert trigger using the create trigger statement in Mysql with an example:
-- Suppose we have created a table named "student_info" as folllows:
*/

use sql830;
show tables;
create table student_info
(	stud_id int not null,
	stud_code varchar(15) default null,
	stud_name varchar(35) default null,
    subject varchar(15) default null,
    marks int default null,
    phone varchar(15) default null,
    Primary key(stud_id)
);
insert into student_info values(1,"s1","Shruti","DS",90,"8080805050"),
(2,"s2","Shreys","DS",90,"8080805050"),(3,"s3","Shreyas","DS",95,"7070805050");
select * from student_info;
# Next we will create a new table named "student detail" as follows:
create table student_detail
(	stud_id int not null,
	stud_code varchar(15) default null,
	stud_name varchar(35) default null,
    subject varchar(15) default null,
    marks int default null,
    phone varchar(15) default null,
    Lastinserted Time,
    Primary key(stud_id)
);
select * from Student_detail;
# Now use a Create Trigger statement to create as after_insert_details trigger
# on the student_info table. This trigger will be fired after an insert operation is
# performed on table table.
Delimiter //
create trigger after_insert_occupation
After Insert on emp for each row
Begin
	Insert into student_detail values(new.stud_id,new.stud_code,
    new.stud_name, new.subject,new.marks,new.phone, curtime());
end //
show triggers;
# How to check working of the after insert trigger?
# we can use the follwing statements to invoke the above-created trigger:
insert into student_info values(4,"104","Alexander","Biology",78,"9025365871");
select * from student_info;
# The table that has been modified after the update query executes is student_detail.
# we can verify it by using the select statement as follows:

select * from student_detail;
-- In this output, we can see that on inserting values into the student_info table,
-- the student_Detail table will automatically fill the records by invoking a trigger.
