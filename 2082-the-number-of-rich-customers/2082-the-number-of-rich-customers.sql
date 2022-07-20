# Write your MySQL query statement below
# select count(*) as rich_count from (
# select customer_id,count(*) from store where amount>500 group by customer_id) a

SELECT COUNT(DISTINCT customer_id) AS rich_count FROM Store WHERE amount > 500




