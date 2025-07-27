use website;
Create table If Not Exists Employee (id int, name varchar(255), salary int, departmentId int);
Create table If Not Exists Department (id int, name varchar(255));
Truncate table Employee;
insert into Employee (id, name, salary, departmentId) values ('1', 'Joe', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('2', 'Henry', '80000', '2');
insert into Employee (id, name, salary, departmentId) values ('3', 'Sam', '60000', '2');
insert into Employee (id, name, salary, departmentId) values ('4', 'Max', '90000', '1');
insert into Employee (id, name, salary, departmentId) values ('5', 'Janet', '69000', '1');
insert into Employee (id, name, salary, departmentId) values ('6', 'Randy', '85000', '1');
insert into Employee (id, name, salary, departmentId) values ('7', 'Will', '70000', '1');
Truncate table Department;
insert into Department (id, name) values ('1', 'IT');
insert into Department (id, name) values ('2', 'Sales');

select employee.id,employee.name,employee.salary,department.name from employee
join department on employee.departmentId = department.id
order by salary desc;




with ranked_employees as (
  select 
    e.id, e.name, e.salary, d.name as dept_name,
    dense_rank() over (partition by d.name order by e.salary desc) as rn
  from employee e
  join department d on e.departmentId = d.id
  where d.name in ('it', 'sales')
)
select id, name, salary, dept_name
from ranked_employees
where rn <= 3
order by salary desc;
