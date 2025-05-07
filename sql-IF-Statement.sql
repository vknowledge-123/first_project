-- The IF.. ENDIF --
-- block exceutes eith stored programs and terminates with a semicolon,
-- as shown in the below example.
use sql830;
delimiter $$
create procedure myresult8(original_rate numeric(6,2),OUT discount_rate numeric(6,2))
no sql
begin
	if(original_rate>200) then
		set discount_rate = original_rate*.5;
	end if;
	# select discount_rate;
end $$
delimiter ;
-- take two variables and set the value for both as below.
set @p = 250;
-- now call the stored procedure function to check the outout.
 call myresult(300,@dp);
 select @dp as result;
 
-- IF-THEN-ELSE Statement :
delimiter $$
create procedure myresult2 (original_rate numeric(6,2),OUT discount_rate numeric(6,2))
no sql
begin
	if (original_rate>200) then
		set discount_rate = original_rate*.5;
	else 
		set discount_rate=0;
	end if;
end $$
delimiter ;
-- next, create variable and set the value as below:
set @p = 150;
-- now call the record procedure function to get the output.
call myresult2(@p,@dp);
select @dp;

-- IF-THEN-ELSEIF-ELSE-Statement :
delimiter $$
create procedure myresult4 (original_rate numeric(6,2),OUT discount_rate numeric(6,2))
no sql
begin
	if (original_rate>500) then
		set discount_rate = original_rate*.8;
	elseif(orginal_rate<=500 And orginal_rate>250) then
		set discount_rate = original_rate*.5;
	else 
		set discount_rate=0;
	end if;
end $$
delimiter ;
set @original = 600;
call myresult4(@original,@dp);
select @dp;