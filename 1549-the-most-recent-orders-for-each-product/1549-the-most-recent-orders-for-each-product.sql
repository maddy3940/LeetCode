# Write your MySQL query statement below
with v1 as(
select p.product_name,p.product_id, max(o.order_date) as order_date from products p, orders o where p.product_id=o.product_id group by p.product_name,p.product_id order by 1)
select a.product_name,a.product_id, o.order_id,a.order_date from v1 a,orders o where a.product_id=o.product_id  and a.order_date=o.order_date order by 1,2,3





