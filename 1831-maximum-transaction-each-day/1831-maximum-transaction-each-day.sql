# Write your MySQL query statement below



select distinct t.transaction_id from transactions t,(select date_format(day,"%Y-%m-%d") as dt,max(amount) amt from transactions group by date_format(day,"%Y-%m-%d")) a where t.amount=a.amt and date_format(t.day,"%Y-%m-%d")=a.dt order by 1




