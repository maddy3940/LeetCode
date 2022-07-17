# Write your MySQL query statement below


# with v1 as(
# select bin,count(bin) as total from(
# select case when (duration/60<5) then "[0-5>"
# when (duration/60>=5 and duration/60<10) then "[5-10>"
# when (duration/60>=10 and duration/60<=15) then "[10-15>"
# when (duration/60>=15) then "15 or more"
# end as bin
# from sessions)a group by bin),
# v2 as(
# select "[0-5>" as bin,0 as total
# union
# select "[5-10>" as bin,0 as total
# union
# select "[10-15>" as bin,0 as total
# union
# select "15 or more" as bin,0 as total)
# select * from v1 
# union 
# select * from v2 where bin not in (select bin from v1)



SELECT '[0-5>' AS 'bin', SUM(duration/60 < 5) AS 'total'
FROM Sessions
UNION
SELECT '[5-10>' AS 'bin', SUM(duration/60 >= 5 AND duration/60 < 10) AS 'total'
FROM Sessions
UNION
SELECT '[10-15>' AS 'bin', SUM(duration/60 >= 10 AND duration/60 < 15) AS 'total'
FROM Sessions
UNION
SELECT '15 or more' AS 'bin', SUM(duration/60 >= 15) AS 'total'
FROM Sessions