use swiggy;

select * from restaurants;

select * from 
(select *,dense_rank() over(partition by city order by cost desc) as 'rank' from restaurants) as y; 


select cuisine,sum(rating_count*cost) as 'revenue' from restaurants
group by cuisine
order by revenue desc limit 5;

select cuisine,sum(cost*rating_count) as 'revenue'from
(select *,cost*rating_count,
row_number() over(partition by cuisine order by cost*rating_count desc) from restaurants) as k
group by cuisine
order by revenue desc;

select sum(cost*rating_count) as 'revenue' from 
(select *,cost*rating_count,
row_number() over(partition by cuisine order by cost*rating_count desc) as 'rank' from restaurants) AS K
where K.rank <(SELECT COUNT(*)/100 FROM RESTAURANTS) ;
