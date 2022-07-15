# Write your MySQL query statement below

with v1 as(
select *, row_number() over(partition by user_id order by activity_date asc) as rn from traffic where activity='login')
select activity_date as login_date,count(*) as user_count from v1 where rn=1 and activity_date between date_sub('2019-06-30',interval 90 day) and date_add('2019-06-30',interval 90 day) group by login_date