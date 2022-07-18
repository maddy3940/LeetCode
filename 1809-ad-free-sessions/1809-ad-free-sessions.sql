# Write your MySQL query statement below

select distinct session_id from playback where session_id not in (
select distinct a.session_id from playback a, ads b where  a.customer_id=b.customer_id and b.timestamp between start_time and end_time)







