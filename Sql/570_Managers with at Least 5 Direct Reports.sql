Create table If Not Exists Employeee (id int, name varchar(255), department varchar(255), managerId int);
Truncate table Employeee;
insert into Employeee (id, name, department, managerId) values ('101', 'John', 'A', NULL);
insert into Employeee (id, name, department, managerId) values ('102', 'Dan', 'A', '101');
insert into Employeee (id, name, department, managerId) values ('103', 'James', 'A', '101');
insert into Employeee (id, name, department, managerId) values ('104', 'Amy', 'A', '101');
insert into Employeee (id, name, department, managerId) values ('105', 'Anne', 'A', '101');
insert into Employeee (id, name, department, managerId) values ('106', 'Ron', 'B', '101');

desc Employeee;

select * from Employeee e1 join Employeee e2;
select * from Employeee;

select * from employeee join (
select managerId,count(managerId) from employeee 
group by managerId) k;