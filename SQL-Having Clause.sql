use sql830;

CREATE TABLE customer (
    cust_id INT PRIMARY KEY,
    cust_name VARCHAR(100),
    cust_city VARCHAR(100),
    cust_country VARCHAR(100),
    grade INT,
    opening_amt DECIMAL(10,2),
    receive_amt DECIMAL(10,2),
    payment_amt DECIMAL(10,2)
);
desc customer;
INSERT INTO customer (cust_id, cust_name, cust_city, cust_country, grade, opening_amt, receive_amt, payment_amt) VALUES
(1, 'John Doe', 'New York', 'USA', 2, 1000.00, 700.00, 500.00),
(2, 'Jane Smith', 'Los Angeles', 'USA', 2, 2000.00, 800.00, 600.00),
(3, 'Ali Khan', 'Mumbai', 'India', 1, 1500.00, 900.00, 550.00),
(4, 'Priya Sharma', 'Delhi', 'India', 2, 2500.00, 1000.00, 700.00),
(5, 'Robert Brown', 'Sydney', 'Australia', 3, 1800.00, 600.00, 450.00),
(6, 'Emily Davis', 'Toronto', 'Canada', 2, 2200.00, 750.00, 500.00),
(7, 'William Wilson', 'London', 'UK', 1, 1700.00, 850.00, 520.00),
(8, 'Sophia Lee', 'Melbourne', 'Australia', 2, 1900.00, 720.00, 490.00),
(9, 'Michael Scott', 'Chicago', 'USA', 3, 1600.00, 670.00, 530.00),
(10, 'Angela Martin', 'Vancouver', 'Canada', 2, 2100.00, 780.00, 560.00);

select * from customer;

SELECT cust_country, COUNT(grade) 
FROM customer 
GROUP BY cust_country 
HAVING COUNT(grade) > 2;

-- SQL Having using Where:
SELECT cust_city, SUM(opening_amt), 
AVG(receive_amt), MAX(payment_amt) 
FROM customer 
WHERE grade = 2 
GROUP BY cust_city 
HAVING AVG(receive_amt) > 500;

-- SQL Having using with Order by:
SELECT cust_city, SUM(opening_amt), 
AVG(receive_amt), MAX(payment_amt) 
FROM customer 
WHERE grade = 2 
GROUP BY cust_city 
HAVING AVG(receive_amt) > 500 
ORDER BY SUM(opening_amt);
