USE UNI_PRO;

SELECT * FROM DEPARTMENTS;
SELECT * FROM EMPLOYEEPROJECTS;
SELECT * FROM EMPLOYEES;
SELECT * FROM PROJECTS;



-- Find the employee(s) with the highest salary.
SELECT FIRST_NAME,SALARY FROM EMPLOYEES
WHERE SALARY = (SELECT MAX(SALARY) FROM EMPLOYEES);

-- Find all employees who work in the 'Engineering' department.
SELECT FIRST_NAME FROM EMPLOYEES
WHERE DEPT_ID = (SELECT DEPT_ID FROM DEPARTMENTS WHERE DEPT_NAME = 'ENGINEERING');

-- Find all employees who earn more than the average salary of all employees.
SELECT FIRST_NAME FROM EMPLOYEES 
WHERE SALARY > (SELECT AVG(SALARY) FROM EMPLOYEES);

-- Find all employees who work on 'Project Phoenix'.
SELECT FIRST_NAME,LAST_NAME FROM EMPLOYEES 
WHERE EMP_ID IN (SELECT EMP_ID FROM employeeprojects WHERE PROJECT_ID = (SELECT PROJECT_ID FROM PROJECTS WHERE PROJECT_NAME = 'Project Phoenix') ) ;

-- Find the names of all employees who are NOT assigned to any project.


-- Find all departments that have employees.

