# Write your MySQL query statement below
# with v1 as(
# select case when income<20000 then 'Low Salary' when income between 20000 and 50000 then 'Average Salary' else 'High Salary' end as category from accounts
# union all
# select 'Low Salary' as category
# union all
# select 'Average Salary' as category
# union all
# select 'High Salary' as category
# )
# select category, count(*)-1 as accounts_count from v1 group by 1



select "Low Salary" as category,
sum(case when income<20000 then 1 else 0 end) as accounts_count
from Accounts
union
select "Average Salary" category,
sum(case when income >= 20000 and income <= 50000 then 1 else 0 end) as accounts_count
from Accounts
union
select "High Salary" category,
sum(case when income>50000 then 1 else 0 end) as accounts_count
from Accounts

