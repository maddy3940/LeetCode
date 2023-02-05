# Write your MySQL query statement below



WITH cte AS (SELECT id, drink, ROW_NUMBER() OVER () AS nb FROM CoffeeShop), -- nb = initial row order
     cte2 AS (SELECT id, drink, nb, SUM(1-ISNULL(drink)) OVER (ORDER BY nb) AS group_id FROM cte) -- same group_id -> same drink
SELECT id, FIRST_VALUE(drink) OVER (PARTITION BY group_id) AS drink
FROM cte2
ORDER BY nb;