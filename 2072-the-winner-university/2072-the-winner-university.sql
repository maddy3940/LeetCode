# Write your MySQL query statement below

# select case when (select count(*) from NewYork where score>=90)>(select count(*) from California where score>=90) then "New York University"
# when (select count(*) from NewYork where score>=90)<(select count(*) from California where score>=90) then "California University"
# else "No Winner" end as winner

select
case when t.ny_score > t.cal_score then 'New York University'
when t.ny_score < t.cal_score then 'California University'
else 'No Winner'
end as winner
from
(
select (select count(student_id) from NewYork where score >= 90 ) as ny_score , (select count(student_id) from California where score >= 90) as cal_score
) t