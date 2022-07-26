# Write your MySQL query statement below

select user_id,max(biggest_window) as biggest_window from(
select user_id, datediff(lead(visit_date,1,'2021-1-1') over(partition by user_id order by visit_date asc),visit_date) as biggest_window from uservisits) a group by user_id










