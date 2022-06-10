# Write your MySQL query statement below


select  avg(n.num) median
from Numbers n
where n.Frequency >= abs((select sum(Frequency) from Numbers where num<=n.num) -
                         (select sum(Frequency) from Numbers where num>=n.num))