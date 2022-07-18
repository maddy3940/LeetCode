# Write your MySQL query statement below


select product_id,'store1' as store, store1 as price from products where !isnull(store1)
union
select product_id,'store2' as store, store2 as price from products where !isnull(store2)
union
select product_id,'store3' as store, store3 as price from products where !isnull(store3)








