# Write your MySQL query statement below

# select i.invoice_id, c.customer_name,i.price,count(co.user_id) as contacts_cnt,count(co1.user_id) as trusted_contacts_cnt from invoices i left join contacts co on co.user_id=i.user_id, contacts co1 ,customers c on c.customer_id=i.user_id and co1.user_id=i.user_id and co1.user_id in (select customer_id from customers) group by i.invoice_id order by 1

with v1 as(
select i.invoice_id,count(co.user_id) as contacts_cnt from invoices i left join contacts co on i.user_id=co.user_id group by i.invoice_id),
v2 as(
select i.invoice_id,count(co.user_id) as trusted_contacts_cnt from invoices i left join contacts co on i.user_id=co.user_id and co.contact_name in (select customer_name from customers) group by i.invoice_id)
select a.invoice_id,c.customer_name,i.price, a.contacts_cnt, b.trusted_contacts_cnt from v1 a, v2 b, customers c,invoices i where a.invoice_id=b.invoice_id and a.invoice_id=i.invoice_id and i.user_id=c.customer_id order by 1







