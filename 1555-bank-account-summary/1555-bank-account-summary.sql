# Write your MySQL query statement below

with v1 as(
select a.user_id,sum(a.total) as credit from(
select t.paid_by as user_id, sum(-1*t.amount) as total from transactions t group by t.paid_by
union
select t.paid_to as user_id,sum(t.amount) as total from transactions t group by t.paid_to) a group by a.user_id)
select u.user_id,u.user_name,(ifnull(a.credit,0)+u.credit) as credit, case when (ifnull(a.credit,0)+u.credit)<0 then "Yes" else "No" end as credit_limit_breached from users u left join v1 a on u.user_id=a.user_id





