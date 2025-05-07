use sql830;
CREATE TABLE Employee10 (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    department_id INT
);
desc employee10;
INSERT INTO Employees10 (employee_id, first_name, last_name, department_id) 
VALUES (1, 'John', 'Doe', 101),
(2, 'Jane', 'Smith', 102),
(3, 'Bob', 'Brown', 101),
(4, 'Alice', 'Davis', 105);
select * from employee10;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY,
    department_name VARCHAR(50)
);
INSERT INTO Departments VALUES(101, 'Sales'),
(102, 'Marketing'),
(103, 'HR'),
(104, 'IT');

select employee_id, first_name, department_name
from employee10 e ,departments d
where e.department_id = d.department_id;

SELECT e.employee_id,
       e.first_name,
       d.department_name
FROM Employee10 e
left outer JOIN Departments d
    ON e.department_id = d.department_id;
