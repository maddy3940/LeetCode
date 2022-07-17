# Write your MySQL query statement below

# select trim(lower(product_name)) as product_name,date_format(sale_date,"%Y-%m") as sale_date,count(*) as total from sales group by trim(lower(product_name)),date_format(sale_date,"%Y-%m") order by 1 asc,2 asc
SELECT LOWER(TRIM(product_name)) product_name, DATE_FORMAT(sale_date, "%Y-%m") sale_date, count(sale_id) total
FROM sales
GROUP BY 1, 2
ORDER BY 1, 2







