use sql830;

create table boffins_stud
(
student_id int,
student_batch varchar(40),
student_name varchar(40),
student_stream varchar(30),
student_marks int,
student_mail_id varchar(50)
);

insert into boffins_stud values
(119,'fsdc','sandeep','ECE',65,'sandeep@gmail.com'),
(100,'fsda','saurabh','cs',80,'saurabh@gmail.com'),
(102,'fsda','sanket','cs',81,'sanket@gmail.com'),
(103,'fsda','shyam','cs',80,'shyam@gmail.com'),
(104,'fsda','sanket','cs',82,'sanket@gmail.com'),
(105,'fsda','shyam','ME',67,'shyam@gmail.com'),
(106,'fsds','ajay','ME',45,'ajay@gmail.com'),
(106,'fsds','ajay','ME',78,'ajay@gmail.com'),
(108,'fsds','snehal','CI',89,'snehal@gmail.com'),
(109,'fsds','manisha','CI',34,'manisha@gmail.com'),
(110,'fsds','rakesh','CI',45,'rakesh@gmail.com'),
(111,'fsde','anuj','CI',43,'anuj@gmail.com'),
(112,'fsde','mohit','EE',67,'mohit@gmail.com'),
(113,'fsde','vivek','EE',23,'vivek@gmail.com'),
(114,'fsde','gaurav','EE',45,'gaurav@gmail.com'),
(115,'fsde','prateek','EE',89,'prateek@gmail.com'),
(116,'fsde','mithun','ECE',23,'mithun@gmail.com'),
(117,'fsdc','chitra','ECE',23,'chitra@gmail.com'),
(118,'fsdc','pranay','ECE',45,'pranay@gmail.com'),
(119,'fsdc','sandeep','ECE',65,'sandeep@gmail.com');

select * from boffins_stud;

select sum(student_marks) from boffins_stud;
select student_batch, sum(student_marks) from boffins_stud group by student_batch;
select student_batch, max(student_marks) from boffins_stud group by student_batch;
select student_batch, sum(student_marks) from boffins_stud group by student_batch;

/*Window functions in MySQL workbench are a special type of function
that allows you to perform calculations on a set of rows within
a query, similar to how you would with
aggregate functions.
However, unlike aggregate functions that summarize data into a 
single row per group,
window function returns a value for each row in thr result set.

Key Concepts:
WINDOW : The window defines the set of rows that the window function operations on.
Its relative to the current row being processed in the query.

OVER CLAUSE: This clause specifies how window is defined
It can include:
**Text from the image:**

It can include:  
PARTITION BY: This clause divides the data into partitions, 
and the window function is applied independently within each partition.  
ORDER BY: This clause sorts the data within the window.  

Here are some categories of window functions you can use in MySQL Workbench:  
Aggregate Window Functions: These functions perform calculations like SUM, COUNT, AVG, MAX, and MIN on rows within the window.  
For example, you can calculate the running total of sales for each month.  

Ranking Window Functions: These functions assign a rank or order to each row within the window.
 Examples include RANK, DENSE_RANK, and ROW_NUMBER.
 You can use these to rank customers based on their total purchase amount.  

Value Window Functions: These functions allow you to access the value of another column
for a specific row within the window. Examples include LAG, LEAD, FIRST_VALUE, and LAST_VALUE.
 You can use these to compare a product's current sales with its sales from the previous month.  

Overall, window functions are a powerful tool for data analysis in MySQL Workbench. 
They can help you solve complex queries and analyze data without needing subqueries or joins.

The ROW_NUMBER() function in SQL is a window function that assigns a sequential integer number 
(starting from 1) to each row within a query's result set. 
It considers a specified order when assigning these row numbers.
SELECT column_list,
       ROW_NUMBER() OVER (PARTITION BY partition_expression ORDER BY order_expression) 
       AS row_number
FROM table_name;

Breakdown:

column_list: The columns you want to retrieve from the table.

ROW_NUMBER() OVER (...): This is the window clause that assigns the row numbers.

PARTITION BY partition_expression (Optional): This clause divides the result set into partitions. 
Rows within each partition are numbered independently, starting from 1 again for each new partition. 
If omitted, the entire result set is considered a single partition.

ORDER BY order_expression: This clause determines the order in which the rows are numbered within each partition.
 The rows are assigned numbers based on the sort order defined here (ascending or descending).
 */

select * from boffins_stud;

select * from boffins_stud order by student_marks desc;

select student_id, student_batch , student_stream, student_marks,
row_number() over (order by student_marks desc) as 'row_number'
from boffins_stud;

select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_number'
from boffins_stud;

select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_num'
from boffins_stud where row_num = 1;  # This will create an error as row_num is created ans accessed at the same time.

select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_num'
from boffins_stud) as test where row_num = 1;  # SEARCH FOR ERROR HERE

select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_num'
from boffins_stud);

/*

*/
select student_id, student_batch, student_stream, student_marks,
row_number() over(order by student_marks desc) as 'row_number',
rank() over (order by student_marks) as 'row_rank'
from boffins_stud;

select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
rank() over(partition by student_batch order by student_marks desc) as 'row_rank'
from boffins_stud;

select * from (select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
rank() over(partition by student_batch order by student_marks desc) as 'row_rank'
from boffins_stud) as test where row_rank =1 ;

select student_id, student_batch , student_stream, student_marks,
row_number() over(order by student_marks desc) as 'row_number',
rank() over (order by student_marks desc) as 'row_rank',
dense_rank() over (order by student_marks desc) as 'DENSE_rank'
from boffins_stud ;

select * from (select student_id, student_batch , student_stream, student_marks,
row_number() over (partition by student_batch order by student_marks desc) as 'row_number',
rank() over(partition by student_batch order by student_marks desc) as 'row_rank',
dense_rank() over (partition by student_batch order by student_marks desc) as 'dense_rank'
from boffins_stud) as test where 'dense_rank' = 3;

