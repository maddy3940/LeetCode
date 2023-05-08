# Write your MySQL query statement below


with v1 as(

    select p.invoice_id, sum((p.quantity*pr.price)) as price from products pr, purchases p where p.product_id=pr.product_id group by 1 
),
v2 as(
    select invoice_id, rank() over(order by price desc, invoice_id asc) as rn from v1 
)
select pr.product_id, pr.quantity,pr.quantity*p.price as price from products p, purchases pr where p.product_id=pr.product_id and pr.invoice_id in (select invoice_id from v2 where rn=1)