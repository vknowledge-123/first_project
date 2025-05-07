use mydata;
create table CarSales(
OrderNumber varchar(50),
OrderDate integer,
Unit_Price decimal(10,2),
Total_Revenue decimal(10,2),
Total_Unit_Cost decimal(10,2)
);
desc carsales;

alter table carsales
add column customer_name varchar(50) after orderid;

ALTER TABLE CarSales  
MODIFY COLUMN OrderNumber VARCHAR(20);

select * from carsales;

INSERT INTO CarSales (OrderNumber, OrderDate, Unit_Price, Total_Revenue, Total_Unit_Cost, customer_name)  
VALUES  
('SO - 000101', 41275, 1963.1, 9815.5, 1001.181, 'Alice Johnson'),  
('SO - 000102', 41275, 3939.6, 19698, 3348.66, 'Bob Smith'),  
('SO - 000103', 41275, 1775.5, 17755, 781.22, 'Charlie Brown'),  
('SO - 000104', 41275, 2324.9, 13949.4, 1464.687, 'David Williams'),  
('SO - 000105', 41275, 1822.4, 10934.4, 1476.144, 'Emma Davis'),  
('SO - 000106', 41276, 1038.5, 6231, 446.555, 'Frank Miller'),  
('SO - 000107', 41276, 1192.6, 11926, 536.67, 'Grace Wilson'),  
('SO - 000108', 41276, 1815.7, 18157, 1525.188, 'Henry Taylor'),  
('SO - 000109', 41277, 3879.3, 27155.1, 2211.201, 'Ivy Moore'),  
('SO - 000110', 41277, 1956.4, 11738.4, 1212.968, 'Jack Anderson');  

alter table carsales
change column Ordernumber OrderID varchar(20);

alter table carsales
drop column orderdate;

rename table carsales to Car;
select * from  car;
drop table  car;