# Write your MySQL query statement below


select sum(apple_count + b_apple_count) as apple_count, sum(orange_count+b_orange_count) as orange_count from(
select a.apple_count,a.orange_count, ifnull(b.apple_count,0) as b_apple_count, ifnull(b.orange_count,0) as b_orange_count from boxes a left join chests b on a.chest_id=b.chest_id)a






