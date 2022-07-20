# Write your MySQL query statement below

with v1 as(
select user_id, timestampdiff(second,time_stamp,lead(time_stamp,1,"2031-01-01") over(partition by user_id order by time_stamp asc)) as lead_time_stamp from confirmations
)
select distinct user_id from v1 where lead_time_stamp<=86400

# select user_id, time_stamp,lead(time_stamp,1,"2031-01-01") over(partition by user_id order by time_stamp asc) as lead_time_stamp, timestampdiff(second,time_stamp,lead(time_stamp,1,"2031-01-01") over(partition by user_id order by time_stamp asc)) as lea from confirmations






