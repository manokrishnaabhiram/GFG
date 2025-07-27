CREATE DATABASE UNI_PRO;
USE UNI_PRO;

-- Main table for departments
CREATE TABLE Departments (
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(50) NOT NULL UNIQUE,
    location VARCHAR(50)
);

-- Main table for employees
CREATE TABLE Employees (
    emp_id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE,
    dept_id INT,
    FOREIGN KEY (dept_id) REFERENCES Departments(dept_id) ON DELETE SET NULL
);

-- Main table for projects
CREATE TABLE Projects (
    project_id INT PRIMARY KEY,
    project_name VARCHAR(100) NOT NULL,
    start_date DATE,
    end_date DATE
);

-- Junction table to link employees and projects
CREATE TABLE EmployeeProjects (
    emp_id INT,
    project_id INT,
    PRIMARY KEY (emp_id, project_id), -- Composite primary key
    FOREIGN KEY (emp_id) REFERENCES Employees(emp_id) ON DELETE CASCADE,
    FOREIGN KEY (project_id) REFERENCES Projects(project_id) ON DELETE CASCADE
);


-- Populate Departments
INSERT INTO Departments (dept_id, dept_name, location) VALUES
(1, 'Engineering', 'New York'),
(2, 'Sales', 'London'),
(3, 'HR', 'New York'),
(4, 'Marketing', 'San Francisco'),
(5, 'Finance', 'Chicago');

-- Populate Employees
INSERT INTO Employees (emp_id, first_name, last_name, salary, hire_date, dept_id) VALUES
(101, 'Alice', 'Johnson', 90000.00, '2020-05-15', 1),
(102, 'Bob', 'Smith', 110000.00, '2019-03-22', 1),
(103, 'Charlie', 'Brown', 85000.00, '2021-08-01', 2),
(104, 'Diana', 'Prince', 120000.00, '2018-06-11', 2),
(105, 'Eve', 'Adams', 75000.00, '2022-01-10', 3),
(106, 'Frank', 'Miller', 150000.00, '2017-11-30', 1),
(107, 'Grace', 'Hopper', 95000.00, '2020-09-01', 4),
(108, 'Henry', 'Ford', 70000.00, '2023-02-20', 3),
(109, 'Ivy', 'Green', 88000.00, '2021-11-15', 4),
(110, 'Jack', 'White', 130000.00, '2019-07-19', NULL); -- This employee has no department

-- Populate Projects
INSERT INTO Projects (project_id, project_name, start_date, end_date) VALUES
(1, 'Project Phoenix', '2021-01-01', '2023-12-31'),
(2, 'Project Titan', '2022-06-01', '2024-06-30'),
(3, 'Project Odyssey', '2023-03-15', NULL),
(4, 'Project Nova', '2022-09-01', '2023-09-30');

-- Populate EmployeeProjects
INSERT INTO EmployeeProjects (emp_id, project_id) VALUES
(101, 1),
(102, 1),
(102, 2),
(103, 3),
(104, 2),
(104, 3),
(106, 1),
(107, 4),
(109, 4);
-- Note: Employees 105, 108, and 110 are not on any projects.
