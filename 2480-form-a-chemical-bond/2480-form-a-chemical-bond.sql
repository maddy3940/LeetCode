# Write your MySQL query statement below


select a.symbol as metal, b.symbol as nonmetal from 
(select symbol from elements where type='metal') a join (select symbol from elements where type='nonmetal') b on 1=1
