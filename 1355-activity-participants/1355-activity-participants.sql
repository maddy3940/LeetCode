# Write your MySQL query statement below

with v1 as(
select activity,count(*) as ct from friends group by activity)
select activity from v1 where ct not in ((select max(ct) from v1) union (select min(ct) from v1))




