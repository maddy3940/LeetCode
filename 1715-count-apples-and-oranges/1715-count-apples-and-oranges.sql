# Write your MySQL query statement below


SELECT SUM(b.apple_count + IFNULL(c.apple_count,0)) AS apple_count,SUM(b.orange_count + IFNULL(c.orange_count,0)) AS orange_count
FROM Boxes AS b
LEFT JOIN Chests AS c
USING(chest_id)






