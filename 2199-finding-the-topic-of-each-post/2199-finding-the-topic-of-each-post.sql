# Write your MySQL query statement below

with cte0 as(
select distinct p.post_id,k.topic_id as topic from posts p, keywords k where concat(' ', lower(p.content), ' ') LIKE concat('% ', lower(k.word), ' %') order by 1),
cte1 as(
select post_id, 'Ambiguous!' as topic from posts where post_id not in (select distinct post_id from cte0))

select post_id, group_concat(topic order by cast(topic as float) asc) as topic from (
select * from cte0 
union 
select * from cte1)a
group by 1


# select 
#     post_id, 
#     coalesce(group_concat(distinct topic_id order by cast(topic_id as char)), 'Ambiguous!') as topic
# from posts a
# left join keywords b
# on concat(' ', lower(a.content), ' ') like concat('% ', lower(b.word), ' %')
# group by post_id;