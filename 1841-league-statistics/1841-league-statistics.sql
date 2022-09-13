# Write your MySQL query statement below


with v1 as(
select a.team_id,sum(a.ct) as matches_played from (select home_team_id as team_id, count(home_team_id) as ct from matches group by 1 union all select away_team_id as team_id, count(away_team_id) as ct from matches group by 1) a group by 1),
v2 as(
select m.home_team_id, sum(case when m.home_team_goals>m.away_team_goals then 3 when m.home_team_goals=m.away_team_goals then 1 else 0 end) as points from matches m group by 1),
v3 as(
select m.away_team_id, sum(case when m.home_team_goals<m.away_team_goals then 3 when m.home_team_goals=m.away_team_goals then 1 else 0 end) as points from matches m group by 1),
v4 as(
select * from v2
union all
select * from v3),
v5 as(
select home_team_id as team_id, sum(points) as points from v4 group by 1),
v6 as(
select home_team_id as team_id, sum(home_team_goals) as goal_for, sum(away_team_goals) as goal_against from matches group by 1),
v7 as(
select away_team_id as team_id, sum(away_team_goals) as goal_for, sum(home_team_goals) as goal_against from matches group by 1),
v8 as(
select * from v6
union all 
select * from v7),
v9 as(
select team_id,sum(goal_for) as goal_for, sum(goal_against) as goal_against from v8 group by 1)
select t.team_name, v1.matches_played, v5.points,v9.goal_for,v9.goal_against,(v9.goal_for-v9.goal_against) as goal_diff from teams t, v1,v5,v9 where t.team_id=v1.team_id and t.team_id=v5.team_id and t.team_id=v9.team_id order by 3 desc,6 desc,1