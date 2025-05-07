use sql830;
create table sales_data
(	emp_id int primary key,
	name varchar(20),
    department varchar(20),
    total_sales int
);
select * from sales_data;

insert into sales_data VALUES
(1, 'Alice', 'Electronics', 50000),
(2, 'Bob', 'Electronics', 40000),
(3, 'Charlie', 'Electronics', 40000),
(4, 'David', 'Clothing', 35000),
(5, 'Eve', 'Clothing', 30000);
insert into sales_data values (6, 'john', 'Marketing', 45000);

-- ROW_NUMBER() WITH AND WITHOUT PARTITION BY() :
select emp_id, name, department, total_sales,
ROW_NUMBER() over(order by total_sales desc) as 'Sales rank'
from sales_data; 
select emp_id, name, department, total_sales,
ROW_NUMBER() over(partition by department order by total_sales desc) as 'Sales rank'
from sales_data; 

-- RANK() WITH AND WITHOUT PARTITION BY() :
select emp_id, name, department, total_sales,
Rank() over(order by total_sales desc) as 'rank'
from sales_data; 
select emp_id, name, department, total_sales,
Rank() over(partition by department order by total_sales desc) as 'rank'
from sales_data; 

-- DENSE_RANK() WITH AND WITHOUT PARTITION BY() :
select emp_id, name, department, total_sales,
dense_rank() over(order by total_sales desc) as 'dense rank'
from sales_data; 
select emp_id, name, department, total_sales,
dense_rank() over(partition by department order by total_sales desc) as 'rank'
from sales_data;

select emp_id, name, department, total_sales,
row_number() over(order by total_sales desc) as 'row_number',
rank() over (order by total_sales desc) as 'row_rank',
dense_rank() over (order by total_sales desc) as 'DENSE_rank'
from sales_data ;

select emp_id, name, department, total_sales,
row_number() over(partition by department order by total_sales desc) as 'row_number',
rank() over (partition by department order by total_sales desc) as 'row_rank',
dense_rank() over (partition by department order by total_sales desc) as 'DENSE_rank'
from sales_data ;
