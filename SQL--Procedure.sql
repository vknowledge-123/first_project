/* Syntax 
Creating procedure:
Delimiter && 
Create PROCEDURE procedure_name([IN | OUT | INOUT]) parameter_name datatype[,parameter datatype])
BEGIN
	Declaration_section
    Executable_section
END &&
Delimiter ;
*/
use sql830;
show procedure status where db = 'sql830';

# procedure without Parameter
/* Suppose we want to display all records of this tables
whose salaries are greater than 50000
 and count all the table rows.
 The following code create a precedure named 
 get_senior_emp:*/
 
 Delimiter &&
 Create procedure get_senior_emp()
 Begin
	select * from employee where salary > 20000 ;
    select count(emp_id) As total_employees from employee;
End &&
delimiter ; 
call get_senior_emp();

	## procedure with IN Parameter :

Delimiter &&
create procedure get_emp (In var1 Int)
Begin
	select * from employee limit var1;
    select count(emp_id) as Total_employee from employee;
End &&
Delimiter ;
call get_emp(); # this will give error
call get_emp(5);

	## procedure with OUT Parameter -- 
Delimiter &&
create procedure display_max_sal (out highestsalary int)
begin
	select Max(salary) into highestsalary from employee;
end &&
delimiter ;
call display_max_sal(); 
call display_max_sal(5); # this will give error.
call display_max_sal(@S);
select @S;

	## Using 2 Variables fro input and output separately.
delimiter &&
create procedure display_sal1(in id int, out sal int)
begin
	select salary into sal from employee where emp_id = id;
end &&
delimiter ;
call display_sal1(9369,@res);
select @res;

set @n = 9369;
select @n;
call display_sal(@n,@R);
select @R;

-- Procedures with INOUT Parameter ; ---
/* In this procedure, we have used the 'INOUT' Parameter as 'var1'
 of integer type.
 Its body part first fetches the salary from the table with the specified id and then
 stores it into the same variable var1.
 The var1 first acts as the IN parameter and then out parameter.
 Therefore, we can call it the INOUT parameter mode. See the procedure code:*/
 
 Delimiter %%
 create procedure display_salary1 (INOUT var1 Int)
 begin
	select salary INTO var1 From employee where Emp_id = var1;
end %%
delimiter ;
set @R = 9369;
select @R;
call display_salary1(@R);
select @R;

# How to show or list of stored Procedure in MYSQL ?
# show procedure  status [ LIKE 'pattern' | Where search_condition ]
show procedure status where db = 'sql830';