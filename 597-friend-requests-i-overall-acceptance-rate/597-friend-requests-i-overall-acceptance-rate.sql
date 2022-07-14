# Write your MySQL query statement below



with v1 as(
select round(ifnull(count(distinct b.requester_id,b.accepter_id)/count(distinct a.sender_id,a.send_to_id),0.00),2) as accept_rate from FriendRequest a, RequestAccepted b)
select * from v1







