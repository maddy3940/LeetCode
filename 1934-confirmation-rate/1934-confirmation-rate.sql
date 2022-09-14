# Write your MySQL query statement below


select s.user_id, round(ifnull(confirmation_rate,0),2) as confirmation_rate from (
select c1.user_id,(select count(*) from confirmations c2 where c1.user_id=c2.user_id and c2.action='confirmed')/count(*) as confirmation_rate from confirmations c1 group by 1) a right join signups s on a.user_id=s.user_id

