# Write your MySQL query statement below

# with v1 as(
# select max(aq) as max_order from (select order_id,avg(quantity) over(partition by order_id) as aq from ordersdetails) a),
# v2 as(
# select order_id, case when max(quantity)>(select * from v1) then 1 else 0 end as flag from ordersdetails group by 1)
# select order_id from v2 where flag=1


with cte as (
    select order_id,
    avg(quantity) as avg_qty,
    max(quantity) as max_qty
    from ordersdetails
    group by order_id
)
select order_id from cte where max_qty>(select max(avg_qty) from cte)






