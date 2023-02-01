# Write your MySQL query statement below

with v1 as(
select user_id, gender, row_number() over(partition by gender order by user_id asc) as rn from genders),
v2 as(
select * from v1 order by 3,2)
select user_id, gender from v2



