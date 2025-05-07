use sql830;
create table agents1
(	agent_code varchar(5),
	name varchar(20),
    city varchar(10),
    commission decimal(6,2),
    phone varchar(15)
);
desc agents1;
select * from agents1;

insert into agents1 values
("A0010",'Akshay','Nagpur',0.10,'091-22558899'),
("A0011",'Anish','Nagpur',0.20,'091-22558899'),
("A0020",'Akshad','Nagpur',0.10,'091-22558899'),
("A0021",'Nishad','Nagpur',0.10,'091-22558899');

# While using decimal datatype.
insert into agents1 values
("A0024",'Akshay','Nagpur',50,'091-22558899'),
("A0024",'Anish','Nagpur',50.1,'091-22558899'),
("A0024",'Akshad','Nagpur',50.122,'091-22558899');

create table agents2 as (select * from agents1 where 1=2);
select * from agents2;

insert into agents2 values
("A0010",'Akshay','Nagpur',0.10,'091-22558899'),
("A0020",'Akshad','Nagpur',0.10,'091-22558899'),
("A0021",'Nishad','Nagpur',0.10,'091-22558899'),
("A0022",'Akshad','Nagpur',0.10,'091-22558899'),
("A0023",'Akshad','Nagpur',0.10,'091-22558899');

select * from agents1 Union select * from agents2;

select * from agents1 Union all select * from agents2;

select * from agents1 Intersect  select * from agents2;

select * from agents1 except select * from agents2;

select * from agents2 except select * from agents1;