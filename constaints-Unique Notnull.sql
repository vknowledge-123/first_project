use sql830;
# 1. Unique and 2.Not Null Constraint
#defining at column level 
create table cust(
id int unique,
name varchar(255) NOT NULL,
email varchar(255) NOT NULL
);
desc cust;
# Defining at tablr level
create table customers(
id int,
name varchar(255) not null,
email varchar(255) not null,
unique(id)
);

insert into cust values(1,"akash","akash@gamil.com");
insert into cust values(2,"Nisha","akash@gamil.com");
insert into cust values(1,"Akshay","akshay@gamil.com");
insert into cust values(3,"Nisha"," ");
insert into cust values(3,"Nisha",null);

select * from cust;

alter table cust
modify email varchar(50)unique;

update cust set email="nisha@gamil.com" where id=2;

alter table cust
modify email varchar(50)unique;

select * from cust;
insert into cust values(2,"Nishad","nisha@gamil.com");
insert into cust values(4,"Nishad","nisha@gamil.com");

alter table  cust
add column phone integer not null;

desc cust;

insert into cust values(5,"Shashi","shashi@gamil.com",null);
insert into cust values(5,"Shashi","shashi@gamil.com"," ");
insert into cust values(5,"Shashi","shashi@gamil.com");
insert into cust(id,name,email) values(5,"Shashi","shashi@gamil.com");

insert into cust(id,name,phone) values(5,"Shashi",57546);

Set SQL_SAFE_UPDATES=0;
update CUST SET PHONE=778855;
#/alter table cust modify phone_no integer not null;*/

select * from cust;
insert into cust values(15,"Simran","simaran@gmail.com");
select * from cust;
update cust set phone=142 where id=1;
update cust set phone_no=146 where id=2;

# checking default masking value for varchar datatype when we create new column with not null.
alter table cust
add column bloodgrp varchar(15) not null;

select * from cust;

# adding new column with unique key when few records already exixts;
alter table cust
add column hobby varchar(15) unique;

alter table cust
add column tid integer unique;

# 3.Check Constraint;
desc cust;

alter table cust
add column age integer check (age>18);

select * from cust;

update cust set age=42 where id=1;
update cust set age=19 where id=2;
update cust set age=16 where id=3;

# 4 Default Constraint:
create table user(
id int,
name varchar(255) NOT NULL,
age INT NOT NULL Default 18,
primary key(ID)
);
desc user;
#applying unique and not null at the same time.(Implements primary key indirectly.)
create table user2(
id int unique not null,
name varchar(255) NOT NULL,
age INT NOT NULL Default 18
);
desc user2;
#Checking if another column can be added with primary key
alter table user2
add column phNo integer primary key after id;

#adding another column with primary key unique and not null.
alter table user2
add column email varchar(56) primary key after id;

#adding another column with unique and not null.
alter table user2
add column email varchar(56) unique not null;

select id,name from user2;
insert into user2 values(1,"Sagar",19);
insert into user2 values(2,"Amisha");#error
select * from user2;
insert into user2(id,name) values(2,"Amisha");
