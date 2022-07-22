# Write your MySQL query statement below



# select c.customer_id,c.customer_name from customers c where c.customer_id in (select distinct customer_id from orders where product_name="A") and c.customer_id in (select distinct customer_id from orders where product_name="B") and c.customer_id not in (select distinct customer_id from orders where product_name="C")

select a.customer_id, a.customer_name
from customers a , orders b
where a.customer_id  = b.customer_id
group by a.customer_id
having sum(b.product_name="A") >0 and sum(b.product_name="B") > 0 and sum(b.product_name="C")=0



