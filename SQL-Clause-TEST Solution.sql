use mydata;
-- Employees Table
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    DepartmentID INT,
    Salary INT
);
INSERT INTO Employees VALUES
(1, 'John', 'Doe', 'john.doe@company.com', 1, 60000),
(2, 'Jane', 'Smith', 'jane.smith@company.com', 1, 55000),
(3, 'Michael', 'Johnson', 'michael.johnson@company.com', 2, 65000),
(4, 'Emily', 'Williams', 'emily.williams@company.com', 2, 58000),
(5, 'David', 'Brown', 'david.brown@company.com', 3, 72000),
(6, 'Sarah', 'Davis', 'sarah.davis@company.com', 3, 62000),
(7, 'Andrew', 'Wilson', 'andrew.wilson@company.com', 4, 53000),
(8, 'Jessica', 'Taylor', 'jessica.taylor@company.com', 4, 53000),
(9, 'Christopher', 'Anderson', 'christopher.anderson@company.com', 5, 50000),
(10, 'Olivia', 'Thompson', 'olivia.thompson@company.com', 5, 56000);
select * from employees;

-- Departments Table
CREATE TABLE Departments (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50),
    Location VARCHAR(50)
);
INSERT INTO Departments VALUES
(1, 'Sales', 'New York'),
(2, 'Marketing', 'Chicago'),
(3, 'Engineering', 'Seattle'),
(4, 'Finance', 'Boston'),
(5, 'Human Resources', 'San Francisco');

-- Projects Table
CREATE TABLE Projects (
    ProjectID INT PRIMARY KEY,
    ProjectName VARCHAR(100),
    StartDate DATE,
    EndDate DATE,
    Budget INT
);
INSERT INTO Projects VALUES
(1, 'Project Alpha', '2022-01-01', '2022-12-31', 150000),
(2, 'Project Beta', '2023-03-15', '2024-06-30', 250000),
(3, 'Project Gamma', '2023-09-01', '2024-02-28', 120000),
(4, 'Project Delta', '2024-04-01', '2024-12-31', 180000),
(5, 'Project Epsilon', '2024-07-01', '2025-01-31', 220000);

-- EmployeeProjects Table
CREATE TABLE EmployeeProjects (
    EmployeeProjectID INT PRIMARY KEY,
    EmployeeID INT,
    ProjectID INT,
    Role VARCHAR(50),
    FOREIGN KEY (EmployeeID) REFERENCES Employees(EmployeeID),
    FOREIGN KEY (ProjectID) REFERENCES Projects(ProjectID)
);
INSERT INTO EmployeeProjects VALUES
(1, 1, 1, 'Project Manager'),
(2, 2, 1, 'Developer'),
(3, 3, 2, 'Project Manager'),
(4, 4, 2, 'Developer'),
(5, 5, 2, 'Developer'),
(6, 6, 3, 'Tester'),
(7, 7, 4, 'Business Analyst'),
(8, 8, 4, 'Developer'),
(9, 9, 5, 'Project Manager'),
(10, 10, 5, 'Developer');
