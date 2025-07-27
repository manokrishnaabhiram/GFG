USE GFG;

SELECT * FROM EMPLOYEES;
-- Add a column to show each employee’s salary difference from the previous employee’s salary (ordered by employee_id).
SELECT EMPLOYEE_ID,salary,lag(salary) over() 
FROM EMPLOYEES;

-- Add a column to show each employee’s next employee’s salary in the order of salary (ascending).
select employee_id,salary,lead(salary) over(order by salary) 
from EMPLOYEES;

-- Show each employee’s running total of salary ordered by employee_id.
SELECT EMPLOYEE_ID,SUM(SALARY) OVER(ORDER BY EMPLOYEE_ID) FROM EMPLOYEES;

-- Show each employee’s average salary within their department, along with their own salary.
SELECT EMPLOYEE_ID,DEPARTMENT,SALARY,AVG(SALARY) OVER(PARTITION BY DEPARTMENT) FROM EMPLOYEES;

-- Show each employee’s rank in their department based on salary (highest salary = rank 1).
SELECT EMPLOYEE_ID,DEPARTMENT,SALARY,RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY DESC) FROM EMPLOYEES;

-- Show each employee’s dense rank across all employees based on salary (highest salary = 1).
SELECT EMPLOYEE_ID,DEPARTMENT,SALARY,DENSE_RANK() OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) FROM EMPLOYEES;

-- Divide employees into 5 buckets (quintiles) based on their salary.
SELECT EMPLOYEE_ID,DEPARTMENT,SALARY,NTILE(4) OVER(PARTITION BY DEPARTMENT ORDER BY SALARY) FROM EMPLOYEES;

-- TOP 2 MOST SOLD PRODUCT IN EACH COUNTRY.

-- SUB QUERY
USE GFG;
SELECT PRODUCT_NAME,(SELECT avg(RATING) FROM DATA) AS K FROM DATA;

SELECT PRODUCT_NAME,AVG(RATING) OVER() AS K FROM DATA;





