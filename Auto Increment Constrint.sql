use SQL830;
create table students1
(
roll_no integer primary key auto_increment,
name varchar(60),
class varchar(50)
);
desc students1;
select * from students1;
insert into students1 values("Reha","DS");
insert into students1(name,class) values("Neha","DS");
insert into students1(name,class) values("Kanha","DA");

insert into students1 values(10,"lina","DS");
insert into students1(name,class) values("Akash","DA");

# to set auto increment startting value we have to use alter command
alter table students1 auto_increment=101;

insert into students1 (name,class) values("Nisha","DA");
insert into students1 (name,class) values("Nishad","FSD");
select * from students1;

drop table students1;
/* to set auto_increment to some other value instead of 1.
create table students1
(
roll_no integer primary key auto_increment,
name varchar(50),
class varchar(50),
auto_increment=101
);
*/

# Primary Key Constraint :

create table students2
(
roll_no integer primary key,
name varchar(60),
class varchar(50)
);
insert into students2 values(1,"Neha","DS");
insert into students2 values(1,"Nehal","DS");
insert into students2 (name,class) values("Neha","DS");
desc students2;

# Forign key Constraint

create table customers(
C_id int primary key,
CUST_NAME varchar(40) not null,
CUST_CITY varchar(35) default null
);

insert into customers values(1,"Akash","Nagpur");
insert into customers values(2,"Ajay","Delhi");
insert into customers values(3,"Nisha","Pune");
insert into customers values(5,"Akashy","Nagpur");
desc customers;
select * from customers;

# Creating Foriegn key
# Method 1 : Creating Foreign key at Table level

create table orders
(order_id int primary key auto_increment,
customer_id int not null,
order_date date not null,
total_price decimal(10,2)not null,
foreign key(customer_id) references customers(C_id)
);

/* Method 2 Another old way (Defining foreign key at column level).
Not supported in MYSQL
create table orders(
order_id int primary key ,
customer_id int not null Refrences customer(C_id),
order_date date not null,
total_price decimal(10,2)not null
);
*/
drop table orders;
desc orders;
alter table orders
modify order_date date not null;

select * from customers;

insert into orders (customer_id,order_date,total_price) values(2,"2023-12-29",15600);
select * from orders;
insert into orders (customer_id,order_date,total_price) values(6,"2023-12-29",15600);

insert into customers values(6,"Ajit","Delhi");

insert into orders (customer_id,order_date,total_price) values(1,"2023-12-29",16000);
insert into orders (customer_id,order_date,total_price) values(3,"2023-12-29",16000);

delete from customer where C_id=5;
select * from customers;

delete from customer where c_id=1; # this gives error

delete from orders where customers_id=1;
select * from orders;
delete from customer where C_id=1;
