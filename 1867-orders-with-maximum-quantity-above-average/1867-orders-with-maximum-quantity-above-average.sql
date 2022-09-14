# Write your MySQL query statement below

with v1 as(
select max(aq) as max_order from (select order_id,avg(quantity) over(partition by order_id) as aq from ordersdetails) a),
v2 as(
select order_id, case when max(quantity)>(select * from v1) then 1 else 0 end as flag from ordersdetails group by 1)
select order_id from v2 where flag=1







