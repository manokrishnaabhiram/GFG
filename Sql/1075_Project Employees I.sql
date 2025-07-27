Create table If Not Exists Project (project_id int, employee_id int);
Create table If Not Exists Employee_3 (employee_id int, name varchar(10), experience_years int);
Truncate table Project;
insert into Project (project_id, employee_id) values ('1', '1');
insert into Project (project_id, employee_id) values ('1', '2');
insert into Project (project_id, employee_id) values ('1', '3');
insert into Project (project_id, employee_id) values ('2', '1');
insert into Project (project_id, employee_id) values ('2', '4');
Truncate table Employee_3;
insert into Employee_3 (employee_id, name, experience_years) values ('1', 'Khaled', '3');
insert into Employee_3 (employee_id, name, experience_years) values ('2', 'Ali', '2');
insert into Employee_3 (employee_id, name, experience_years) values ('3', 'John', '1');
insert into Employee_3 (employee_id, name, experience_years) values ('4', 'Doe', '2');

select project_id,round(avg(experience_years),2) from (
select * from Project join employee_3 using(employee_id)) k
group by project_id;