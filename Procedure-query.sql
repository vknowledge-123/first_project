use sql830;
select * from customers;
-- Stored Procedure to Update a Customer's Email
delimiter //
create procedure custemail
(in p_custid int, in p_email varchar(20))
begin
update customer
set email = p_email
where id = p_custid;
end //
delimiter ;
set @R = 2;
set @T = 'nagpur';
call custemail(@R,@T);
select @R,@T;

-- Stored Procedure to Calculate Total Orders of a Customer :--
DELIMITER //
CREATE PROCEDURE GetTotalOrder(
    IN p_CustomerID INT,
    OUT p_OrderCount INT)
BEGIN
    select count(*) into p_ordercount
    from orders
    where id=p_customerid;
END //
DELIMITER ;
call GetTotalOrders(2,@T);
select @T;
select * from customer;
DELIMITER //
CREATE PROCEDURE GetCustomersByCitys(IN p_City VARCHAR(50))
BEGIN
    IF p_City = 'New York' OR p_City = 'Los Angeles' THEN
        SELECT Cust_Name FROM Customer WHERE cust_City = p_City;
    ELSE
        SELECT 'No Customers Found' AS Message;
    END IF;
END //
DELIMITER ;
set @R = 'new york';
call GetCustomersByCitys(@R);

GRANT privilege_name 
ON database_name.table_name
TO 'username'@'host';

REVOKE privilege_name 
ON database_name.table_name 
FROM 'username'@'host';
SHOW GRANTS;
SHOW GRANTS FOR 'john'@'localhost';

