# Write your MySQL query statement below

select distinct user_id from (
select user_id, datediff(lead(purchase_date,1,'2998-01-01') over(partition by user_id order by purchase_date asc),purchase_date) as diff from purchases) a where diff<=7 order by 1

