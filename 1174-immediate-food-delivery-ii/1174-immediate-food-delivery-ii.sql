# Write your MySQL query statement below

with v1 as(
select *,rank() over(partition by customer_id order by order_date asc) as rn, case when order_date=customer_pref_delivery_date then "im" else "sc" end as pref from delivery)
select round(sum(case when pref="im" then 1 else 0 end)*100/count(*),2) as immediate_percentage  from v1 where rn=1


