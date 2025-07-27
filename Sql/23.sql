#Interview Based Questions

use classicmodels;

select * from customers;


select customername,country,creditlimit from customers 
where creditlimit > (select country ,avg(creditlimit) from customers group by country);

select c1.customername,c1.country,c1.creditlimit from customers c1 join (select country,avg(creditlimit) as avg_creditlimit from customers group by country) c2 
on c1.country = c2.country
where c1.creditlimit < c2.avg_creditlimit
;

SELECT c1.customername, c1.country, c1.creditlimit
FROM customers c1
JOIN (
    SELECT country, AVG(creditlimit) AS avg_creditlimit
    FROM customers
    GROUP BY country
) c2 ON c1.country = c2.country
WHERE c1.creditlimit < c2.avg_creditlimit;


select distinct customername;

select avg(creditlimit) from customers
where country = 'usa';

select customernumber,sum(amount) from payments
group by customernumber
order by customernumber desc
limit 5;

-- no products have placed order
select productCode from products 
where productCode not in (select productCode from orderdetails) ;

SELECT products.productCode,products.productname
FROM products
LEFT JOIN orderdetails ON products.productCode = orderdetails.productCode
WHERE orderdetails.productCode IS NULL;#not null is important



select employeeNumber from employees 
where employeeNumber not in (select salesRepEmployeeNumber from customers where salesRepEmployeeNumber is not null );

-- customers who placed order in every month.
select * from orders;


-- 
use users;
select customernumber, orderdate,lag(orderdate) over(partition by customernumber) from orders
where year(orderdate) = '2004';









