# Write your MySQL query statement below


with v1 as(
select distinct sub_id as post_id from submissions where isnull(parent_id))
select a.post_id,count(distinct b.sub_id) as number_of_comments from v1 a left join submissions b on a.post_id=b.parent_id group by a.post_id



