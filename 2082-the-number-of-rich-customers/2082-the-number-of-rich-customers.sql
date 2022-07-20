# Write your MySQL query statement below
select count(*) as rich_count from (
select customer_id,count(*) from store where amount>500 group by customer_id) a






