# Write your MySQL query statement below


with v1 as(
    select a.player,sum(a.score) as score from(
select m.first_player as player,sum(m.first_score) as score from matches m group by m.first_player
union all
select m.second_player as player,sum(m.second_score) as score from matches m group by m.second_player) a group by a.player 
),
v2 as(
select m.player,m.score,p.group_id from v1 m,players p where p.player_id=m.player order by 1),
v3 as(
select group_id, max(score) as score from v2 group by group_id),
v4 as(
select a.player,b.group_id from v2 a, v3 b where a.group_id=b.group_id and a.score=b.score order by 2)
select group_id,min(player) as player_id from v4 group by group_id

