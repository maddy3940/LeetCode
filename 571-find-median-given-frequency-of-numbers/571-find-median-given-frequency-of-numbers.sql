# Write your MySQL query statement below


WITH cte AS (SELECT floor((sum(frequency) + 1) / 2) AS m1
    , FLOOR((SUM(frequency) + 2) / 2) AS m2
FROM numbers )
    , cte2 AS (select num
    , SUM(frequency) OVER (ORDER BY num ROWS UNBOUNDED PRECEDING) AS presum
FROM numbers )
    , n1 AS ( SELECT num
FROM cte2 WHERE presum >= (SELECT m1 FROM cte) LIMIT 1)
    , n2 AS ( SELECT num 
FROM cte2 WHERE presum >= (SELECT m2 FROM cte) LIMIT 1)

SELECT AVG(num) AS median 
FROM (select * FROM n1 UNION SELECT * FROM n2) t