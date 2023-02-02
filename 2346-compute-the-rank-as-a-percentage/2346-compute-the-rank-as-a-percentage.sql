# Write your MySQL query statement below

with v1 as(
select department_id,count(*) as ct from students group by 1)
select s.student_id,s.department_id, ifnull(round((rank() over(partition by s.department_id order by s.mark desc)-1)*100/(a.ct-1),2),0) as percentage from students s, v1 a where a.department_id=s.department_id




