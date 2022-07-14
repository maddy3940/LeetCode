# Write your MySQL query statement below



with v1 as(
select users_id from users where banned='Yes'
),
v2 as(
select * from trips where client_id  not in (select * from v1) and driver_id not in (select * from v1) and request_at between '2013-10-01' and '2013-10-03')
select request_at as Day, round(sum(case when status ='cancelled_by_driver' then 1 when status ='cancelled_by_client' then 1 else 0 end)/count(*),2) as `Cancellation Rate` from v2 group by request_at