# Write your MySQL query statement below


# With v1 as(
#     select experience, sum(salary) over(partition by experience order by salary asc rows between unbounded preceding and current row) as sum_sal from candidates
# ),
# v2 as(
# select experience, max(sum_sal) as sal, count(*) as ct_senior from v1 where sum_sal<=70000 and experience='Senior' group by 1 ),
# v3 as(
# select experience,count(*) as ct_junior from v1 where experience='Junior' and sum_sal< ifnull((select 70000-sal from v2),70000)
# )

# select experience,sum(accepted_candidates) as accepted_candidates from(
# select 'Senior' as experience, ct_senior as accepted_candidates from v2
# union
# select 'Junior' as experience, ct_junior as accepted_candidates from v3
# union
# select 'Senior' as experience, 0 as accepted_candidates 
# union
# select 'Junior' as experience, 0 as accepted_candidates ) a group by 1


WITH CTE AS (SELECT employee_id, experience, SUM(salary) OVER(PARTITION BY experience ORDER BY salary,employee_id ASC) AS RN FROM Candidates)
      
SELECT 'Senior' AS experience, COUNT(employee_id) AS accepted_candidates FROM CTE WHERE experience = 'Senior' AND RN < 70000
UNION
SELECT 'Junior' AS experience, COUNT(employee_id) AS accepted_candidates FROM CTE WHERE experience = 'Junior' AND RN < (SELECT 70000 - IFNULL(MAX(RN),0) FROM CTE WHERE experience = 'Senior' AND RN < 70000)