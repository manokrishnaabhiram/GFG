-- handling outlayers

-- We can handle the outlayers using z-score.

-- z = val-mean/sd

use northwind;

select count(*) from (
select *, abs(freight - avg(freight) over())/stddev(freight) over() 
as 'standard_deviation' from salesorder) k
where standard_deviation>2;