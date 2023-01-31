# Write your MySQL query statement below
with v1 as(
select team_id, name, points, ran from ( select t.team_id, t.name, t.points + p.points_change as points, dense_rank() over(order by t.points + p.points_change desc,t.name) as ran from teampoints t, pointschange p where t.team_id=p.team_id order by 1) a),
v2 as(select team_id, name, points, dense_rank() over(order by points desc, name) as ran from teampoints)
select a.team_id, a.name, cast(b.ran as signed)-cast(a.ran as signed) as rank_diff from v1 a, v2 b where a.team_id=b.team_id






