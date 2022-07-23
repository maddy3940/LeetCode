# Write your MySQL query statement below

with v1 as(
select a.id as P1, b.id as P2,abs((a.x_value-b.x_value)*(a.y_value-b.y_value)) as AREA from points a, points b where (a.x_value<>b.x_value and a.y_value<>b.y_value) and a.id<b.id) 
select * from v1 order by 3 desc, 1 asc,2 asc

