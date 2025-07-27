Create table If Not Exists Weather (id int, recordDate date, temperature int);
Truncate table Weather;
insert into Weather (id, recordDate, temperature) values ('1', '2015-01-01', '10');
insert into Weather (id, recordDate, temperature) values ('2', '2015-01-02', '25');
insert into Weather (id, recordDate, temperature) values ('3', '2015-01-03', '20');
insert into Weather (id, recordDate, temperature) values ('4', '2015-01-04', '30');

select * from weather;

select id from(
select *, lag(temperature) over() as 'lag_rate' from weather) k
where temperature>lag_rate;

select id from(
select *, lag(temperature) over(order by recordDate ) as 'lag_rate' from weather) k
where temperature>lag_rate
order by recordDate;