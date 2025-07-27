USE GFG;

-- 1️⃣ Drop if exists
DROP TABLE IF EXISTS employees;

-- 2️⃣ Create table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    employee_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- 3️⃣ Insert 50 rows
INSERT INTO employees (employee_id, employee_name, department, salary) VALUES
(1, 'Alice', 'HR', 5000),
(2, 'Bob', 'IT', 6000),
(3, 'Charlie', 'Finance', 7000),
(4, 'Diana', 'IT', 8000),
(5, 'Ethan', 'Finance', 5500),
(6, 'Fiona', 'HR', 6200),
(7, 'George', 'IT', 7500),
(8, 'Hannah', 'Finance', 6800),
(9, 'Ian', 'HR', 5300),
(10, 'Jane', 'IT', 7700),
(11, 'Kevin', 'Finance', 6600),
(12, 'Laura', 'HR', 5800),
(13, 'Mike', 'IT', 8100),
(14, 'Nina', 'Finance', 6900),
(15, 'Oscar', 'HR', 5200),
(16, 'Paula', 'IT', 7950),
(17, 'Quinn', 'Finance', 7150),
(18, 'Rachel', 'HR', 6050),
(19, 'Steve', 'IT', 8200),
(20, 'Tina', 'Finance', 7400),
(21, 'Uma', 'HR', 5100),
(22, 'Victor', 'IT', 8300),
(23, 'Wendy', 'Finance', 7000),
(24, 'Xavier', 'HR', 6000),
(25, 'Yara', 'IT', 8050),
(26, 'Zack', 'Finance', 7200),
(27, 'Aaron', 'HR', 5900),
(28, 'Bella', 'IT', 8400),
(29, 'Carter', 'Finance', 7300),
(30, 'Daisy', 'HR', 5800),
(31, 'Eli', 'IT', 8150),
(32, 'Faith', 'Finance', 7100),
(33, 'Gavin', 'HR', 6200),
(34, 'Hazel', 'IT', 8350),
(35, 'Ivy', 'Finance', 7500),
(36, 'Jasper', 'HR', 6100),
(37, 'Kara', 'IT', 8250),
(38, 'Liam', 'Finance', 7650),
(39, 'Mia', 'HR', 5950),
(40, 'Noah', 'IT', 8450),
(41, 'Olivia', 'Finance', 7800),
(42, 'Peter', 'HR', 6050),
(43, 'Queen', 'IT', 8550),
(44, 'Riley', 'Finance', 7900),
(45, 'Sam', 'HR', 6150),
(46, 'Tara', 'IT', 8600),
(47, 'Umar', 'Finance', 8000),
(48, 'Vera', 'HR', 6250),
(49, 'Will', 'IT', 8700),
(50, 'Zoe', 'Finance', 8100);