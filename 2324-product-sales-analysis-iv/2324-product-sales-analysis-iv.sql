# Write your MySQL query statement below


select user_id, product_id from (
select user_id, product_id,dense_rank() over(partition by user_id order by tot desc) as rn from (
select s.user_id, s.product_id, sum(s.quantity*p.price) as tot from sales s, product p where p.product_id=s.product_id group by 1,2) a) b where rn=1


