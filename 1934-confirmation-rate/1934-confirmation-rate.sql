# Write your MySQL query statement below


# select s.user_id, round(ifnull(confirmation_rate,0),2) as confirmation_rate from (
# select c1.user_id,(select count(*) from confirmations c2 where c1.user_id=c2.user_id and c2.action='confirmed')/count(*) as confirmation_rate from confirmations c1 group by 1) a right join signups s on a.user_id=s.user_id

SELECT 
  s.user_id,
  ROUND(AVG(CASE WHEN action = 'confirmed' THEN 1.00 ELSE 0.00 END),2) AS confirmation_rate
FROM Signups s LEFT JOIN Confirmations c ON s.user_id = c.user_id
GROUP BY s.user_id