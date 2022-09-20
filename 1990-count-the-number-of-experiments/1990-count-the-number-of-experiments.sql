# Write your MySQL query statement below

with v1 as(
select 'Android' as platform
union
select 'IOS' as platform
union 
select 'Web' as platform
),
v2 as(
select 'Reading' as experiment_name
union
select 'Sports' as experiment_name
union 
select 'Programming' as experiment_name),
v3 as(
select platform, experiment_name from v1, v2 where 1<>0),
v4 as(
select platform,experiment_name, count(*) as num_experiments from experiments e group by 1,2)
select a.platform, a.experiment_name, ifnull(b.num_experiments,0) as num_experiments from v3 a left join v4 b on a.platform=b.platform and a.experiment_name=b.experiment_name 
