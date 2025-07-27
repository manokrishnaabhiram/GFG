use gfgda3;

desc student;

insert into student values(1,'jhon',60.5);

select * from student;

insert into student values(null,'paul',65.5);

insert into student(`student name`,marks) values("hell",50.4);

update student set sid =2 where sid is null;

#desable safe update

SET SQL_SAFE_UPDATES =0;

#UPDATE THE MARKS BY 20% WHOSE STUDENT ID IS GRATER THEN 1.
UPDATE STUDENT SET MARKS=MARKS+(MARKS*0.2) WHERE SID>1; 

