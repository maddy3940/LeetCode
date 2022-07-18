# Write your MySQL query statement below

with v1 as(
select machine_id,process_id, round(sum(case when activity_type="start" then -1*timestamp else timestamp end),3) as processing_time from activity group by 1,2)
select machine_id,round(sum(processing_time)/count(machine_id),3) processing_time from v1 group by 1








