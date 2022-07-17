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



with t as (
  select '[0-5>' as bin, 0 as min_duration, 300 as max_duration union
  select '[5-10>', 300, 600 union
  select '[10-15>', 600, 900 union
  select '15 or more', 900, null
)
select t.bin, sum(s.duration is not null) as total 
from t left join Sessions s on t.min_duration <= s.duration and (t.max_duration is null or s.duration < t.max_duration)
group by t.bin
;

