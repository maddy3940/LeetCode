# Write your MySQL query statement below



select c.customer_id,c.customer_name from customers c where c.customer_id in (select distinct customer_id from orders where product_name="A") and c.customer_id in (select distinct customer_id from orders where product_name="B") and c.customer_id not in (select distinct customer_id from orders where product_name="C")





