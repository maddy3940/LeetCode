# Write your MySQL query statement below

with v1 as(
select product_id,year(purchase_date) as yr, count(*) as cnt from orders group by 1,2 having count(*)>=3)
select distinct a.product_id from v1 a,v1 b where a.product_id=b.product_id and a.yr-b.yr=1 




