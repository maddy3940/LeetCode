# Write your MySQL query statement below

with v1 as(
select customer_id,product_id, count(*) as ct from orders group by 1,2),
v2 as(
select customer_id,product_id,rank() over(partition by customer_id order by ct desc) as rn from v1)
select a.customer_id,a.product_id,p.product_name from v2 a,products p where a.rn=1 and p.product_id=a.product_id






