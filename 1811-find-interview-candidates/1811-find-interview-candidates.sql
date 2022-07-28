# Write your MySQL query statement below

# with v1 as(
# select gold_medal as user_id from contests group by gold_medal having count(gold_medal)>=3),
# v2 as(
# select contest_id, gold_medal as user_id from contests
# union all
# select contest_id, silver_medal as user_id from contests
# union all
# select contest_id, bronze_medal as user_id from contests
# ),
# v3 as(
# select user_id,contest_id as c1,lead(contest_id,1) over(partition by user_id order by contest_id asc) as c2,lead(contest_id,2) over(partition by user_id order by contest_id asc) as c3  from v2),
# v4 as(
# select distinct user_id from v3 where c1+1=c2 and c2+1=c3)
# select u.name,u.mail from users u, v4 a where u.user_id=a.user_id
# union 
# select u.name,u.mail from users u, v1 a where u.user_id=a.user_id


with t0 as (
    select gold_medal as user, contest_id 
    from contests 
    union all 
    select silver_medal as user, contest_id 
    from contests 
    union all 
    select bronze_medal as user, contest_id 
    from contests 
)
, t1 as (
    select user, contest_id, row_number() over(partition by user order by contest_id) as rn 
    from t0 
)
, t2 as (
    select user as user_id -- consecutive medal winners
    from t1 
    group by user, contest_id - rn 
    having count(*) >= 3 -- replace 3 with any number to solve the N problem
    union all
    select gold_medal as user_id  -- gold medal winners
    from contests 
    group by gold_medal 
    having count(*) >= 3
)
select distinct u.name, u.mail 
from t2 
inner join users u
on t2.user_id = u.user_id




