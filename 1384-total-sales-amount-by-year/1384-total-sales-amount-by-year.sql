# Write your MySQL query statement below
with v1 as(
select sales.product_id,p.product_name, case when date_format(period_start,'%Y')='2018' and date_format(period_end,'%Y')='2018' then (DATEDIFF(period_end,period_start)+1)*average_daily_sales when date_format(period_end,'%Y')>'2018' and date_format(period_start,'%Y')='2018' then (DATEDIFF('2018-12-31',period_start)+1)*average_daily_sales else 0 end as sales_2018,

case when date_format(period_start,'%Y')<'2019' and date_format(period_end,'%Y')='2019' then (DATEDIFF(period_end,'2019-01-01')+1)*average_daily_sales when date_format(period_end,'%Y')='2019' and date_format(period_start,'%Y')='2019' then (DATEDIFF(period_end,period_start)+1)*average_daily_sales when date_format(period_start,'%Y')='2019' and date_format(period_end,'%Y')>'2019' then (DATEDIFF('2019-12-31',period_start)+1)*average_daily_sales when date_format(period_start,'%Y')<'2019' and date_format(period_end,'%Y')>'2019' then (DATEDIFF('2019-12-31','2019-01-01')+1)*average_daily_sales else 0  end as sales_2019,

case when date_format(period_start,'%Y')<'2020' and date_format(period_end,'%Y')='2020' then (DATEDIFF(period_end,'2020-01-01')+1)*average_daily_sales when date_format(period_end,'%Y')='2020' and date_format(period_start,'%Y')='2020' then (DATEDIFF(period_end,period_start)+1)*average_daily_sales else 0  end as sales_2020

from sales,product p where p.product_id=sales.product_id
)
select product_id,product_name, '2018' as report_year , sales_2018 as total_amount from v1 where sales_2018!=0
union 
select product_id,product_name, '2019' as report_year , sales_2019 as total_amount from v1 where sales_2019!=0
union 
select product_id,product_name, '2020' as report_year , sales_2020 as total_amount from v1 where sales_2020!=0
order by 1,3

