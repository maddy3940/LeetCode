# Write your MySQL query statement below

select city_id, min(day) as day, degree from (
select city_id, day,degree, dense_rank() over (partition by city_id order by degree desc,day asc) as max_deg from weather) a
where max_deg =1 group by 1,3 order by 1 asc

