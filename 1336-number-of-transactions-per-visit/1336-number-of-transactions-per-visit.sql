# Write your MySQL query statement below
# with v1 as(
# select user_id,transaction_date,count(*) as ct from transactions group by user_id,transaction_date ),
# v2 as(
# select user_id,visit_date, 0 as ct from visits where (user_id,visit_date) not in (select user_id,transaction_date as visit_date from v1)),
# v3 as(
# select * from v1
# union
# select * from v2),
# v4 as(
# select ct as transactions_count,count(*) as visits_count from v3 group by ct order by 1),
# recursive numbers as (
# select 0 as ct
#    union all
#    select ct + 1
#    from numbers
#    where ct < select max(visits_count) from v4)
# select * from v4;


#(select max(visits_count) from v4)

with recursive numbers as (
select 0 as ct
   union all
   select ct + 1
   from numbers
   where ct < (select max(a.ct) as ct from (select user_id,transaction_date,count(*) as ct from transactions group by user_id,transaction_date)a)),
v1 as(
select user_id,transaction_date,count(*) as ct from transactions group by user_id,transaction_date ),
v2 as(
select user_id,visit_date, 0 as ct from visits where (user_id,visit_date) not in (select user_id,transaction_date as visit_date from v1)),
v3 as(
select * from v1
union
select * from v2),
v4 as(
select ct as transactions_count,count(*) as visits_count from v3 group by ct order by 1)
select * from v4
union
select ct as transactions_count, 0 from numbers where ct not in (select transactions_count from v4) order by 1






