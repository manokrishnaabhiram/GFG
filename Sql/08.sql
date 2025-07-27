SELECT COUNT(distinct(BRAND_NAME)) FROM DATA;
SELECT BRAND_NAME,MARKED_PRICE,DISCOUNT_AMOUNT,MARKED_PRICE-DISCOUNT_AMOUNT AS SELLING_PRICE FROM DATA;

SELECT MAX(DISCOUNT_PERCENT) FROM DATA;

#MAXIMUM DISCOUNT PERCENT BY BRANDS
SELECT BRAND_NAME,MAX(DISCOUNT_AMOUNT),MAX(DISCOUNT_PERCENT) FROM DATA GROUP BY BRAND_NAME;

SELECT BRAND_TAG,COUNT(PRODUCT_TAG) FROM DATA GROUP BY BRAND_TAG;


select brand_tag,round(avg(discounted_price)) as 'average_price' from data 
group by brand_tag
order by average_price desc limit 5;

select rating  from data;
select round(sum(rating)) from data;

select * from data;

select count(distinct brand_name) as 'counts',brand_tag from data 
where brand_tag='roadster'
group by brand_tag
order by counts desc limit 5;