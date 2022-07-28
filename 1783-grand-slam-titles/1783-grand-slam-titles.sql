# Write your MySQL query statement below



select p.player_id,p.player_name,count(a.Wimbledon) as grand_slams_count from(
select Wimbledon from Championships
union all
select Fr_open from Championships
union all
select US_open from Championships
union all
select Au_open from Championships)a, players p where p.player_id=a.Wimbledon group by 1






