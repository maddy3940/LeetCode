# Write your MySQL query statement below

with cte0 as(
select user_id, datediff(lead(created_at) over(partition by user_id order by created_at asc),created_at) as diff from users
    )
    
# select * from cte0


select distinct user_id from cte0 where diff<=7