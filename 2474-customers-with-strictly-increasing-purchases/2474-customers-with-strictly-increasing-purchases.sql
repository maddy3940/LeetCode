# Write your MySQL query statement below

with v1 as(
select customer_id, year(order_date) as yr, sum(price) as tot_purchases from orders group by 1,2
),
v2 as(
select customer_id, yr , tot_purchases, ifnull(yr - lag(yr) over(partition by customer_id order by yr asc),1) as yr_diff, ifnull(tot_purchases - lag(tot_purchases) over(partition by customer_id order by yr asc),1) as price_diff from v1)
select distinct customer_id from v2 where customer_id in 
    (select customer_id from 
        (select customer_id, max(yr_diff) as yr_diff, min(price_diff) as price_diff from v2 group by 1 having max(yr_diff)<=1 and min(price_diff)>0 )a)


