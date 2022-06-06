# Write your MySQL query statement below


with v1 as(
select t.id,t.country,t.state,t.amount,date_format(t.trans_date,'%Y-%m') as month, ifnull(date_format(c.trans_date,'%Y-%m'),0) as c_month from transactions t left join chargebacks c on c.trans_id=t.id),
v2 as(
select month,country, count(*) as approved_count, sum(amount) as approved_amount from v1 where state='approved' group by month,country),
v3 as(
select c_month as month,country, count(*) as chargeback_count, sum(amount) as chargeback_amount  from v1 where c_month!=0 group by c_month,country
)
select ifnull(v2.month,v3.month) as month, ifnull(v2.country,v3.country) as country, ifnull(v2.approved_count,0) as approved_count, ifnull(v2.approved_amount,0) as approved_amount, ifnull(v3.chargeback_count,0) as chargeback_count, ifnull(v3.chargeback_amount,0) as chargeback_amount from v2 left join v3 on v2.month=v3.month and v2.country=v3.country
union
select ifnull(v2.month,v3.month) as month, ifnull(v2.country,v3.country) as country, ifnull(v2.approved_count,0) as approved_count, ifnull(v2.approved_amount,0) as approved_amount, ifnull(v3.chargeback_count,0) as chargeback_count, ifnull(v3.chargeback_amount,0) as chargeback_amount from v2 right join v3 on v2.month=v3.month  and v2.country=v3.country

# select c_month, count(*), sum(amount) from v1 where c_month=0 group by c_month