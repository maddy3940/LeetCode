# Write your MySQL query statement below


with v1 as (
select company,floor((count(*)+1)/2) as ct1, floor((count(*)+2)/2) as ct2 from employee group by company
),
v2 as(
select a.id,a.company,a.salary, row_number() over(partition by a.company order by a.salary asc) as rn from employee a)
select distinct a.id,a.company,a.salary from v2 a, v1 b where a.company=b.company and a.rn=b.ct1
union
select distinct a.id,a.company,a.salary from v2 a, v1 b where a.company=b.company and a.rn=b.ct2 order by 2