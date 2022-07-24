# Write your MySQL query statement below

with v1 as(
select customer_id,product_id, count(*) as ct from orders group by 1,2),
v2 as(
select customer_id,product_id,rank() over(partition by customer_id order by ct desc) as rn from v1)
select a.customer_id,a.product_id,p.product_name from v2 a,products p where a.rn=1 and p.product_id=a.product_id



# SELECT customer_id, product_id, product_name
# FROM (
#     SELECT O.customer_id, O.product_id, P.product_name, 
#     RANK() OVER (PARTITION BY customer_id ORDER BY COUNT(O.product_id) DESC) AS rnk
#     FROM Orders O
#     JOIN Products P
#     ON O.product_id = P.product_id  
#     GROUP BY customer_id, product_id
# ) temp
# WHERE rnk = 1 
# ORDER BY customer_id, product_id


