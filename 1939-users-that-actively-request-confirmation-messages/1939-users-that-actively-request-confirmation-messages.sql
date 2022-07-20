# Write your MySQL query statement below

# with v1 as(
# select user_id, timestampdiff(second,time_stamp,lead(time_stamp,1,"2031-01-01") over(partition by user_id order by time_stamp asc)) as lead_time_stamp from confirmations
# )
# select distinct user_id from v1 where lead_time_stamp<=86400

select
distinct c.user_id
from confirmations c
join confirmations d
on c.user_id=d.user_id and c.time_stamp>d.time_stamp and 
timestampdiff(second, d.time_stamp,c.time_stamp)<=86400




