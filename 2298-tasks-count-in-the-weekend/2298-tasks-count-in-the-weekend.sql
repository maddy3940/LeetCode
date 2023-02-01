# Write your MySQL query statement below

select sum(case when dayname(submit_date) in ('Saturday','Sunday') then 1 else 0 end) as weekend_cnt,
 sum(case when dayname(submit_date) in ('Saturday','Sunday') then 0 else 1 end) as working_cnt from tasks


