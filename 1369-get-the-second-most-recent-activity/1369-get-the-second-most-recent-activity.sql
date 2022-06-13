# Write your MySQL query statement below

# with v1 as(
# select *,dense_rank() over(partition by username order by startDate desc) as rn from useractivity)
# select username,activity,startDate,endDate from v1 where rn=2
# union
# select username,activity,startDate,endDate from useractivity where username in(
# select username from useractivity group by username having count(*) =1
# )

select username, activity, startDate, endDate
from (
select *, count(*) over(partition by username)cnt, 
ROW_NUMBER() over(partition by username order by startdate desc) n from UserActivity) tbl
where n=2 or cnt<2