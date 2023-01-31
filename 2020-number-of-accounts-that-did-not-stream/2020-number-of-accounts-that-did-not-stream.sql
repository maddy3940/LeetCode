# Write your MySQL query statement below

select count(account_id) as accounts_count from(
select distinct account_id from subscriptions where start_date between '2021-01-01' and '2021-12-31' or end_date between '2021-01-01' and '2021-12-31' ) a where account_id not in (select account_id from streams where stream_date between '2021-01-01' and '2021-12-31')