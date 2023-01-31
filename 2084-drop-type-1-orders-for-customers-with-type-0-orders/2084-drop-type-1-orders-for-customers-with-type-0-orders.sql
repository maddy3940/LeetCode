# Write your MySQL query statement below

select order_id, customer_id, order_type from orders where customer_id not in (select customer_id from orders where order_type=0)
union
select order_id, customer_id, order_type from orders where order_type=0