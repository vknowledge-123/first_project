use sql830;
/* MYSQL VIEW
A view is a database object that has no values.
Its contents are based on the base table. it contains rows and columns similar to the real table.
In mysql, the view is  VIRTUAL table created bt a query by joining one or more tables.
it os operated similary to the  base table but does not contain any data of its own.
the view and table have one main difference that the views are definations built on top of other tables or views.
if any changes occur in the underlying table,the same changes reflected in the view alse.
*/
/* MYSQL command Syntax
following is the syntax to creaete a view in mysql:

create [or replace] VIEW view name in AS;
select columns
[where conditions];
*/

select * from employee;
create view emp1 as
select emp_id , fname, job_id
from employee;

select  * from emp1;
desc emp1;

select * from emp1 where job_id="analyst";
select * from emp1 where salary > 50000 ;
/* MYSQL update view 
In mysql the alter view statement is used to modify or update the already
created view without dropping it.
syntax;
following is the syntax used to update the existing view in mysql:
alter view view_name as
select columns
from table
where conditions;
*/
alter view emp1 as select emp_id,fname,salary from employee;

select * from emp1;

alter view emp1 as select emp_id,fname from employee where salary>50000;

select * from emp1 where salary>50000;
select * from emp1 where emp_id>9782;
/* MYSQL Drop View
we can drop the existing view by using the drop view statement.
syntax:
the following is the syntax used to delete the view:
Drop view [if exists ] view_name;
*/
drop view emp1;
drop view emp8;
drop view if exists emp8;