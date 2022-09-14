# Write your MySQL query statement below
with v1 as(
select account_id, date_format(day,"%m-%y") as dt, sum(amount) as income from transactions where type="Creditor" group by 1,2),
v2 as(
select account_id, dt, lead(dt) over(partition by account_id order by dt asc) as dt_1, income,lead(income) over(partition by account_id order by dt asc) as income_1 from v1),
v3 as(
select v2.account_id,period_diff(dt_1,dt) as diff,case when income>a.max_income and income_1>a.max_income then 1 else 0 end as flag from v2,accounts a where a.account_id=v2.account_id)
select distinct account_id from v3 where flag=1 and diff=1






