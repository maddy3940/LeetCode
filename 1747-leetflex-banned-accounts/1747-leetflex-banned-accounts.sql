# Write your MySQL query statement below

# with v1 as(
# select account_id, ip_address,lead(ip_address) over(partition by account_id order by login asc) as next_ip, login, lead(login,1,'2050-01-01') over(partition by account_id order by login asc) as next_login, logout from loginfo)
# select distinct account_id from(
# select account_id, case when next_login<=logout and ip_address!=next_ip then 1 else 0 end as check1 from v1) a where check1=1





select
distinct a.account_id
from LogInfo a, LogInfo b
where a.login between (b.login) and (b.logout)
and a.account_id = b.account_id
and a.ip_address !=b.ip_address