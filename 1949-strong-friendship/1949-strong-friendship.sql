# Write your MySQL query statement below

with v1 as(
select user1_id,user2_id from friendship union select user2_id,user1_id from friendship),
v2 as(
select f1.user1_id as u11,f2.user1_id as u12,f1.user2_id as u21,f2.user2_id as u22 from v1 f1, v1 f2 where f1.user1_id<>f2.user1_id and f1.user2_id=f2.user2_id and f1.user1_id<f2.user1_id)
select u11 as user1_id, u12 as user2_id, count(*) as common_friend from v2 where (u11,u12) in (select user1_id,user2_id from friendship) group by 1,2 having count(*)>=3 order by 1,2,3




