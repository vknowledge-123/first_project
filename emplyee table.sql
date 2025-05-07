use sql830;
CREATE TABLE Employee (
    Emp_id INT PRIMARY KEY,
    FName VARCHAR(50),
    LName VARCHAR(50),
    Job_Id VARCHAR(50),
    Manager INT,
    HireDate DATE,
    Salary DECIMAL(10,2),
    Commission DECIMAL(10,2),
    DEPT_Id INT
);
desc employee;
select * from employee;

INSERT INTO Employee (Emp_id, FName, LName, Job_Id, Manager, HireDate, Salary, Commission, DEPT_Id) VALUES
(9369, 'Neha', 'Sharma', 'SOFTWARE ENGINEER', 7902, '2022-12-17', 28000, 0, 20),
(9499, 'Nisha', 'Joshi', 'SALESMAN', 7698, '2022-02-20', 16000, 30, 30),
(9566, 'Akash', 'Chaudhary', 'MANAGER', 7839, '2022-04-02', 35070, 0, 20),
(9647, 'Samiksha', 'Deshpande', 'SALESMAN', 7698, '2022-09-03', 14250, 10, NULL),
(9782, 'Lina', 'Umre', 'MANAGER', 7839, '2022-06-09', 29400, 0, 30),
(9788, 'Lisha', 'Dhule', 'ANALYST', 7566, '2022-12-09', 30000, 0, 10),
(9839, 'Avi', 'Patil', 'PRESIDENT', 7566, '2022-11-17', 59000, 0, 50),
(9844, 'Kartik', 'Dev', 'SALESMAN', 7698, '2022-09-08', 15000, 0, 30),
(9876, 'Swara', 'Meshram', 'SOFTWARE ENGINEER', 7902, '2022-12-03', 28000, 0, 20),
(9900, 'Rahul', 'Sing', 'TECHNICAL LEAD', 7698, '2022-12-03', 52950, 0, 50),
(9902, 'Dev', 'Ladha', 'ANALYST', 7566, '2022-12-03', 30000, 0, 10),
(9904, 'Kishan', 'Mathur', 'SOFTWARE ENGINEER', 7782, '2022-07-06', 32000, 0, 20),
(9591, 'Swarada', 'B', 'SALESMAN', 7698, '2022-02-22', 25000, 0, 30),
(9581, 'Vivek', 'B', 'MANAGER', 7839, '2022-02-02', 40000, 0, 30),
(9777, 'Nilay', 'Ramekar', 'ANALYST', 7839, '2022-05-01', 50000, 30, NULL),
(9860, 'Prakash', 'Dive', 'ANALYST', 7839, '2022-06-21', 70000, 100, 50),
(9861, 'Pooja', 'Joshi', 'ANALYST', 7839, '2022-07-01', 50000, 100, 50);
