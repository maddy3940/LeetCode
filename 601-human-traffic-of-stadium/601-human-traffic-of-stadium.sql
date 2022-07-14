# Write your MySQL query statement below

with v1 as(
select *,row_number() over(order by id asc) as rn from stadium where people>=100),
v2 as(select id-rn as rn from v1 group by id-rn having count(id-rn) >=3)
select id,visit_date,people from v1 where id-rn in (select * from v2)








