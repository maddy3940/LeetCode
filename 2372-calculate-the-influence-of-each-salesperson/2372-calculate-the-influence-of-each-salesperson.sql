# Write your MySQL query statement below

select s.*,coalesce(a.tot_sales,0) as total from salesperson s left join(
select c.salesperson_id,sum(s.price) as tot_sales from sales s, customer c where c.customer_id=s.customer_id group by 1) a on s.salesperson_id= a.salesperson_id


