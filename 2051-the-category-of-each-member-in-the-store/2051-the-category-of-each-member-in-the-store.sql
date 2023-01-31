# Write your MySQL query statement below



with v1 as(
select m.member_id,ifnull(count(v.visit_id),0) as tot_visits from members m left join visits v on m.member_id=v.member_id group by 1),
v2 as(
select m.member_id,ifnull(count(p.visit_id),0) as tot_purchases from members m left join visits v on m.member_id=v.member_id left join purchases p on v.visit_id=p.visit_id group by 1),
v3 as(
select m.member_id, ifnull(100*m2.tot_purchases/m1.tot_visits,-1) as score from members m left join v1 m1 on m.member_id=m1.member_id left join v2 m2 on m.member_id=m2.member_id group by 1 order by 1)
select m.member_id,m.name, case when a.score >=80 then 'Diamond' 
when a.score>=50 and a.score<=80 then "Gold"
when a.score<=50 and a.score>=0 then "Silver"
else "Bronze"
end as category from v3 a, members m where m.member_id= a.member_id order by 1



