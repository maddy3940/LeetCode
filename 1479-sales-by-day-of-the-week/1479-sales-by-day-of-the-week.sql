# Write your MySQL query statement below

with v1 as(
select cat.item_category as Category, upper(dayname(o.order_date)) as day_name, sum(o.quantity) as ct from orders o, items cat where cat.item_id=o.item_id group by 1,2)

select i.item_category as CATEGORY,
sum(case when j.day_name='MONDAY' then j.ct else 0 end) as 'MONDAY',
sum(case when j.day_name='TUESDAY' then j.ct else 0 end) as 'TUESDAY',
sum(case when j.day_name='WEDNESDAY' then j.ct else 0 end) as 'WEDNESDAY',
sum(case when j.day_name='THURSDAY' then j.ct else 0 end) as 'THURSDAY',
sum(case when j.day_name='FRIDAY' then j.ct else 0 end) as 'FRIDAY',
sum(case when j.day_name='SATURDAY' then j.ct else 0 end) as 'SATURDAY',
sum(case when j.day_name='SUNDAY' then j.ct else 0 end) as 'SUNDAY'
from (select distinct item_category from items) i left join v1 j on i.item_category=j.Category group by 1 order by 1