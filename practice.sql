use sql830;
create table custom
(	id integer,
	name varchar(255) NOT NULL,
    email varchar(255) NOT NULL,
    primary key(id)
);
show tables;
desc custom;

create table products
(	product_id int Unique,
	name varchar(255) NOT NULL,
    description TEXT, 
	price DECIMAL(10,2) NOT NULL, 
	PRIMARY KEY (product_id) 
);
desc products;
create table Bank
(	account_no integer unique,
	acc_balance integer not  null check(acc_balance >=0)
);
desc bank;

	