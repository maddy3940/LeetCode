

# with recursive numbers as (
# select 0 as ct
#    union all
#    select ct + 1
#    from numbers
#    where ct < (select max(a.ct) as ct from (select user_id,transaction_date,count(*) as ct from transactions group by user_id,transaction_date)a)),
# v1 as(
# select user_id,transaction_date,count(*) as ct from transactions group by user_id,transaction_date ),
# v2 as(
# select user_id,visit_date, 0 as ct from visits where (user_id,visit_date) not in (select user_id,transaction_date as visit_date from v1)),
# v3 as(
# select * from v1
# union
# select * from v2),
# v4 as(
# select ct as transactions_count,count(*) as visits_count from v3 group by ct order by 1)
# select * from v4
# union
# select ct as transactions_count, 0 from numbers where ct not in (select transactions_count from v4) order by 1



# This t table calculates the number of transactions for each user, for each visit (including if the user had zero transactions for that visit)
WITH t AS (SELECT v.user_id as user_id, visit_date, IF(transaction_date is null, 0, count(*)) as transaction_count
            FROM Visits v LEFT JOIN Transactions t on v.visit_date = t.transaction_date and v.user_id=t.user_id
            GROUP BY 1, 2),
	# This simply generates a table with numbers from zero to [number of rows in Transactions table]
	# This will be necessary later to deal with edge cases for when there are zero of that number of transactions
	# but we still want to see that in the end result (eg there were zero cases of two-transactions but there were cases with three-transactions)
    row_nums AS (SELECT ROW_NUMBER() OVER () as rn 
                 FROM Transactions 
                 UNION 
                 SELECT 0) 
				 
# If transaction_count is null (due to the right join below), then insert a zero, otherwise simply count the times that number appears
SELECT rn as transactions_count, IF(transaction_count is null, 0, count(*)) as visits_count
# Right Join on row_nums (right join because we don't want to lose, for example, two-transactions being zero)
FROM t RIGHT JOIN row_nums ON transaction_count = rn
# We can remove excess transaction-numbers (eg if the max transaction-number is four, we don't need five+ in our end result)
WHERE rn <= (SELECT MAX(transaction_count) FROM t)
GROUP BY rn
ORDER BY 1





