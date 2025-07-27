use gfg;
select * from data;

SELECT 
    *, 
    ROUND(AVG(discount_amount) OVER (), 2) AS avg_dis_amt,
    ROUND(ROUND(AVG(discount_amount) OVER (), 2) - discount_amount, 2) AS diff_from_avg
FROM data;