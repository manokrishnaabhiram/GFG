use classicmodels;

with c as 
(select customernumber,customernumber from customers
inner join payments on customers.customernumber = payments.customernumber);

with result_1 as (
select customernumber,count(customernumber) as cnt from payments
group by customernumber
order by customernumber)
select customernumber,cnt,sum(amount) as total from payments
join result_1 using(customernumber) group by customernumber;

select customernumber from customers
where customernumber not in  (select customernumber from orders);

-- 2
select productcode,productname from products
where productcode not in (select productcode from orderdetails);

select *,
case 
when creditlimit<50000 then "low"
when creditlimit between 50000 and 100000 then "mid"
else "high"
end as status from customers;

-- 3
select * from
(select customernumber,creditlimit,
case 
when creditlimit > lead(creditlimit) over() then "high"
when creditlimit < lead(creditlimit) over() then "low"
when creditlimit = lead(creditlimit) over() then "same"
end as status from customers) as k
where k.status = 'same';

SELECT COUNTRY,(SELECT SUM(CREDITLIMIT) FROM CUSTOMERS WHERE COUNTRY = COPY.COUNTRY) AS TOTAL 
FROM CUSTOMERS AS COPY;

-- find out 2nd highest credit limit from each country
select country,(select CREDITLIMIT FROM CUSTOMERS order by creditlimit limit 1 offset 1) AS K from customers;


select CREDITLIMIT FROM CUSTOMERS 
order by creditlimit desc limit 1 offset 1;

-- find the customers whose credit limit is 

select customername,creditlimit,country from customers as copy
where creditlimit >(select avg(creditlimit) from customers where country = copy.country);

select country,customename from customers;


-- fetch country and no of orders from each country.
select distinct country,cnt from customers
where customernumber in (select customernumber,count(customernumber) from orders);

alter table customers add column maxorders int;

-- failed to update more values at once in mssql its posible.
update customers set maxorders = 
(select count(ordernumber) from orders where customernumber = copy.customernumber);




