# Write your MySQL query statement below


select account_id, day, sum(case when type='Deposit' then amount else -amount end) over(partition by account_id order by day asc) as balance from transactions order by 1,2