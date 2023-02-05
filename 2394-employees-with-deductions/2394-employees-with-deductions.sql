# Write your MySQL query statement below

select employee_id from (
select employee_id, case when hrs%60<>0 then hrs +(60-mod(hrs,60)) else hrs end as hrs, needed_hours from ( 

select e.employee_id, ifnull(sum(timestampdiff(second,l.in_time,l.out_time)),0) as hrs, e.needed_hours*60*60 as needed_hours from employees e left join logs l on e.employee_id=l.employee_id group by 1 ) a) b where hrs<needed_hours

