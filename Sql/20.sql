use northwind;

select * from category;
select * from custcustdemographics; -- empty
select * from customer;
select * from customerdemographics; -- empty
select * from employee;
select * from employeeterritory; 
select * from orderdetail;
select * from product;
select * from region;
select * from salesorder;
select * from shipper;
select * from supplier;
select * from territory;


-- Salse Analysis..
select * from salesorder;

-- Avg delivary charge by country.
select ShipCountry,avg(freight) as 'avg_charge' from salesorder
group by shipcountry
order by avg_charge asc;

-- which Employee has most orders in salesorders.
select employeeid,count(employeeid) as 'no_of_orders' from salesorder
group by employeeid 
order by no_of_orders desc
limit 1;

-- Who are the top 5 customers by total order value and what is their countrubution to ovaral revenue.

select *,(order_value /1354458.59)*100 as countribution from(
select custId,sum(unitPrice * quantity) as order_value from customer 
join salesorder using(custId)
join orderdetail using(orderId)
group by custid
order by order_value desc
limit 5) as k;

-- which customer had placed the most orders in last year, and what are theit order frequency.

select year(orderdate) as yr,contactname,count(orderid) as freq from customer 
join salesorder using(custId)
join orderdetail using(orderId)
group by yr,custId
order by yr desc,freq desc
limit 1;

-- what is the geographical distrubition of customers by country and which country have haghest revenue.

select country,no_of_customers,revenue;


select shipCountry,count(custId) as no_of_customers from salesorder 
group by shipCountry
order by no_of_customers desc;

select shipCountry,sum(unitPrice * quantity) as 'revenue' from salesorder
join orderdetail using(orderId)
group by shipCountry
order by revenue desc;

-- which customer have not placed order from 6 months.

select distinct contactname from customer join salesorder using(custId)
where orderdate not in(
select  orderDate from salesorder 
where orderdate between '2007-05-06 00:00:00' and '2008-11-06 00:00:00');

-- yy

select year(orderdate) as yr,
		productname,
        sum(quantity) as 'sold'
from salesorder 
join orderdetail using(orderid) 
join product using(productid)
group by yr, productname;

-- Which products are frequently purchased together in the same order?

select * from(
select orderid,count(productid) as count from orderdetail
group by orderid) k
where count>1;
#for 693 orders we have to find the combinations from above query.

SELECT 
    a.productid AS product1,
    b.productid AS product2,
    COUNT(*) AS times_bought_together
FROM orderdetail a
JOIN orderdetail b 
    ON a.orderid = b.orderid AND a.productid < b.productid
GROUP BY 
    a.productid, b.productid
ORDER BY 
    times_bought_together DESC;

-- What is the sales performance by employee, and how does it correlate with order processing time?
select employeeid,
		count(employeeid) as 'no_of_orders',
        avg(datediff(shippedDate,orderdate)) as 'avg_processing_time' #average diff between orderdate and shipped date of every employee
from salesorder
group by employeeid 
order by no_of_orders desc;

--  Whichsuppliers provide the most products, and what is their average product price compared to sales performance?
select supplierid,
		count(productname) as no_of_products,
        avg(p.unitprice) as avg_price_of_supplier ,
        avg(o.unitprice) as avg_price_of_buyyer from product p
join orderdetail o on p.productid = o.productid
group by supplierid
order by no_of_products desc;

-- Are there suppliers whose products have higher-than-average reorder rates?

select * from orderdetail join salesorder using(orderId);



SELECT custid, productid, COUNT(*) AS order_count
FROM orderdetail 
JOIN salesorder USING(orderId)
GROUP BY custid, productid
HAVING order_count > 1 and order_count>( select avg(order_count) as avg_order_repeat from (
SELECT custid, productid, COUNT(*) AS order_count
FROM orderdetail 
JOIN salesorder USING(orderId)
GROUP BY custid, productid
HAVING COUNT(*) > 1) as k
);


-- What are the peak months or seasons for sales, and which products drive these peaks?
select * from salesorder;
select year(orderdate) as 'year',
		month(orderdate) as 'month',
        count(orderdate) as cnt
from salesorder
group by year,month
having cnt > (select avg(cnt) from (select year(orderdate) as 'year',
		month(orderdate) as 'month',
        count(orderdate) as cnt
from salesorder
group by year,month) k)
order by year, month;

-- How does order volume and revenue trend year-over-year for specific product categories?

select year(orderdate) as yr ,
		categoryName,
        sum(o.quantity)volume,
        sum(o.unitprice*quantity) as revenue
from category c join product p on c.categoryid = p.categoryid
join orderdetail o on p.productid = o.productid
join salesorder s on s.orderid = o.orderid
group by yr,categoryName;














