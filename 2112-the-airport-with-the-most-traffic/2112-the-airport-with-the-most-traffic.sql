# Write your MySQL query statement below

with v1 as(
select airport_id, sum(tot) as tot from (
select departure_airport as airport_id, flights_count as tot from flights 
union all
select arrival_airport as airport_id, flights_count as tot from flights 
) a group by 1)
select airport_id from v1 where tot = (select max(tot) from v1)
