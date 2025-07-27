create database company;
use company;

-- For a clean slate, you can drop the tables if they already exist.
-- Use with caution!
DROP TABLE IF EXISTS Order_Items;
DROP TABLE IF EXISTS Orders;
DROP TABLE IF EXISTS Products;
DROP TABLE IF EXISTS Customers;
DROP TABLE IF EXISTS Employees;
DROP TABLE IF EXISTS Departments;

-- Create Departments Table
CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(50) NOT NULL
);

-- Create Employees Table
CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10, 2),
    department_id INT,
    -- This sets up the relationship between Employees and Departments
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

-- Create Customers Table
CREATE TABLE Customers (
    customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE
);

-- Create Products Table
CREATE TABLE Products (
    product_id INT PRIMARY KEY AUTO_INCREMENT,
    product_name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL
);

-- Create Orders Table
CREATE TABLE Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATE NOT NULL,
    customer_id INT,
    -- This sets up the relationship between Orders and Customers
    FOREIGN KEY (customer_id) REFERENCES Customers(customer_id)
);

-- Create Order_Items Table (A "Junction Table" for the many-to-many relationship)
CREATE TABLE Order_Items (
    order_item_id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);

-- =================================================================
-- POPULATE TABLES WITH SAMPLE DATA
-- =================================================================

-- Insert Departments
-- Note: 'Logistics' department is created but will have no employees.
INSERT INTO Departments (department_name) VALUES
('Sales'),
('HR'),
('IT'),
('Marketing'),
('Logistics');

-- Insert Employees
-- Note: Eve Holt is an employee with no assigned department (department_id is NULL).
INSERT INTO Employees (first_name, last_name, salary, department_id) VALUES
('John', 'Doe', 70000.00, 1),
('Jane', 'Smith', 75000.00, 1),
('Alice', 'Johnson', 90000.00, 3),
('Bob', 'Williams', 55000.00, 3),
('Charlie', 'Brown', 60000.00, 2),
('Diana', 'Prince', 85000.00, 4),
('Eve', 'Holt', 50000.00, NULL); -- Employee without a department

-- Insert Customers
-- Note: Frank Green is a customer who has never placed an order.
INSERT INTO Customers (first_name, last_name, email) VALUES
('Peter', 'Jones', 'peter.jones@example.com'),
('Mary', 'Taylor', 'mary.t@example.com'),
('David', 'Miller', 'd.miller@example.com'),
('Frank', 'Green', 'frank.g@example.com'); -- Customer with no orders

-- Insert Products
-- Note: 'Smart Watch' is a product that has never been ordered.
INSERT INTO Products (product_name, price) VALUES
('Laptop', 1200.00),
('Mouse', 25.00),
('Keyboard', 75.00),
('Monitor', 300.00),
('Smart Watch', 250.00); -- Product that has never been ordered

-- Insert Orders
INSERT INTO Orders (order_date, customer_id) VALUES
('2023-10-15', 1), -- Peter Jones's order
('2023-10-16', 2), -- Mary Taylor's order
('2023-10-17', 1), -- Peter Jones's second order
('2023-10-18', 3); -- David Miller's order

-- Insert Order Items (linking products to orders)
INSERT INTO Order_Items (order_id, product_id, quantity) VALUES
(1, 1, 1), -- Order 1 has 1 Laptop
(1, 2, 1), -- Order 1 also has 1 Mouse
(2, 4, 2), -- Order 2 has 2 Monitors
(3, 3, 1), -- Order 3 has 1 Keyboard
(4, 1, 1), -- Order 4 has 1 Laptop
(4, 3, 1); -- Order 4 also has 1 Keyboard