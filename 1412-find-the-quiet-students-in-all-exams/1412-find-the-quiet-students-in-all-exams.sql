# Write your MySQL query statement below

with v1 as(
select exam_id, max(score) as max_score, min(score) as min_score from exam group by exam_id),
v2 as(
select s.student_id from exam s, v1 a where s.exam_id=a.exam_id and s.score=a.min_score
union
select s.student_id from exam s, v1 a where s.exam_id=a.exam_id and s.score=a.max_score)
select distinct e.student_id,s.student_name from exam e,student s where e.student_id=s.student_id and e.student_id not in (select * from v2) order by 1
