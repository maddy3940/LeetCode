# Write your MySQL query statement below

select p.name, ifnull(sum(i.rest),0) rest, ifnull(sum(i.paid),0) paid, ifnull(sum(i.canceled),0) canceled, ifnull(sum(i.refunded),0) refunded from product p left join invoice i on p.product_id=i.product_id group by 1 order by 1









