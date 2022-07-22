# Write your MySQL query statement below

select
    i.invoice_id,
    c.customer_name,
    i.price,
    count(con.user_id) as contacts_cnt,
    count(c2.email) as trusted_contacts_cnt
from invoices i
join customers c on c.customer_id = i.user_id
left join contacts con on con.user_id = c.customer_id
left join customers c2 on c2.email = con.contact_email
group by i.invoice_id, c.customer_name, i.price
order by i.invoice_id

# with v1 as(
# select i.invoice_id,count(co.user_id) as contacts_cnt from invoices i left join contacts co on i.user_id=co.user_id group by i.invoice_id),
# v2 as(
# select i.invoice_id,count(co.user_id) as trusted_contacts_cnt from invoices i left join contacts co on i.user_id=co.user_id and co.contact_name in (select customer_name from customers) group by i.invoice_id)
# select a.invoice_id,c.customer_name,i.price, a.contacts_cnt, b.trusted_contacts_cnt from v1 a, v2 b, customers c,invoices i where a.invoice_id=b.invoice_id and a.invoice_id=i.invoice_id and i.user_id=c.customer_id order by 1







