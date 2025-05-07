use sql830;
create table Region_sale
(	Country varchar(50) default "United States",
	Region varchar(50) not null,
    profit decimal(10,3),
    sales decimal(10,2),
    quantity integer check(quantity >= 0),
    order_ID integer primary key
);
desc region_sale;
select * from region_sale;
insert into region_sale (region,profit,sales,quantity,order_id)
values("west",4.56,4,13.01,88522);
INSERT INTO Region_Sale (Region, Profit, Quantity, Sales, Order_ID)
VALUES
	('West', 4390.37, 12, 6362.85, 90193),
    ('East', -53.81, 22, 211.15, 90192),
    ('Central', 803.471, 16, 1164.45, 86838),
    ('Central', -24.03, 7, 22.23, 86840),
    ('Central', -37.03, 3, 13.99, 86841),
    ('Central', -803.71, 4, 14.26, 86842),
    ('Central', -59.82, 7, 33.47, 86837),
    ('East', 261.876, 10, 379.53, 86839),
    ('East', 2.63, 6, 18.8, 86836),
    ('East', 652.73, 10, 945.99, 86843),
    ('West', 314.481, 17, 455.77, 90031),
    ('West', -114.64, 18, 231.79, 90032);
    
    
    
    