# Write your MySQL query statement below

with v1 as(
select b.passenger_id as driver_id, count(distinct b.ride_id) as cnt from rides a, rides b where a.driver_id=b.passenger_id group by 1)
select distinct driver_id,0 as cnt from rides where driver_id not in (select driver_id from v1)
union select * from v1







