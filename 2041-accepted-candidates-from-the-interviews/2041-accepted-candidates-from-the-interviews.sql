# Write your MySQL query statement below

select candidate_id from candidates where years_of_exp>=2 and interview_id in(
select interview_id from rounds group by 1 having sum(score)>15)




