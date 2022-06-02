# Write your MySQL query statement below
with v1 as(
select m.user_id,u.name,count(m.user_id) as ct from movierating m,users u where u.user_id=m.user_id group by m.user_id order by 3 desc,2 asc limit 1),
v2 as(
select m.movie_id,mo.title,avg(m.rating) from movierating m,movies mo  where m.movie_id=mo.movie_id and m.created_at between '2020-02-01' and '2020-02-28' group by m.movie_id order by 3 desc, 2 asc limit 1)
select va.name as results from v1 va
union 
select va.title as results from v2 va