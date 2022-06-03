# Write your MySQL query statement below
with v1 as(
select gender,day, sum(score_points) as total from scores group by gender, day order by 1 asc,2 asc)
select gender, day, sum(total) over(partition by gender order by day asc ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW) as total from v1 order by 1 asc,2 asc

