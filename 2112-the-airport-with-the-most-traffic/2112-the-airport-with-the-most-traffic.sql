# Write your MySQL query statement below

with v1 as(
select airport_id, sum(tot) as tot from (
select departure_airport as airport_id, sum(flights_count)as tot from flights group by 1
union 
select arrival_airport as airport_id, sum(flights_count)as tot from flights group by 1
) a group by 1)
select airport_id from v1 where tot = (select max(tot) from v1)
