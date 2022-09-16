# Write your MySQL query statement below

# with v1 as(
# select r1.user_id as user1_id,r2.user_id as user2_id, count(*) as ct from relations r1, relations r2 where r1.user_id<>r2.user_id and r1.follower_id=r2.follower_id and r1.user_id<r2.user_id group by 1,2)
# select user1_id, user2_id from v1 where ct=(select max(ct) from v1)

select user1_id, user2_id
from
(select r1.user_id as user1_id, r2.user_id as user2_id, dense_rank()over(order by count(r1.follower_id) desc) as rk
from Relations r1, Relations r2
where r1.user_id < r2.user_id and r1.follower_id = r2.follower_id 
group by r1.user_id, r2.user_id) temp
where rk = 1
