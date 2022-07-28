# Write your MySQL query statement below



# select p.player_id,p.player_name,count(a.Wimbledon) as grand_slams_count from(
# select Wimbledon from Championships
# union all
# select Fr_open from Championships
# union all
# select US_open from Championships
# union all
# select Au_open from Championships)a, players p where p.player_id=a.Wimbledon group by 1


SELECT player_id,player_name,
SUM(player_id=Wimbledon)+SUM(player_id=Fr_open)+SUM(player_id=US_open)+SUM(player_id=Au_open)
as grand_slams_count
FROM Players
JOIN Championships
ON player_id=Wimbledon or player_id=Fr_open or player_id=US_open or player_id=Au_open
GROUP BY player_id;




