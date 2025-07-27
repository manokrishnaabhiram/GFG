use gfgda3;

create table employee(
	eid int,
    `joining date` date,
    department enum('salse','marketing'),
    salary float(2),
    feedback longtext,
    `start time` time,
    `end time` time
);

desc employee;

alter table employee drop column feedback;

alter table employee add column rating float;


drop table employee;