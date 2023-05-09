# Write your MySQL query statement below

# WITH RECURSIVE id AS (
# SELECT task_id, subtasks_count, 1 AS subtask_id 
# FROM Tasks
# UNION ALL 
# SELECT task_id, subtasks_count, subtask_id + 1 AS subtask_id 
# FROM id WHERE subtask_id < (SELECT MAX(subtasks_count) FROM Tasks))

# SELECT id.task_id, id.subtask_id 
# FROM id 
# LEFT JOIN Executed e ON id.task_id = e.task_id AND id.subtask_id = e.subtask_id 
# WHERE e.subtask_id IS NULL 
# AND id.subtasks_count >= id.subtask_id




with RECURSIVE id as(
    select distinct task_id, 1 as subtask_id  from tasks
    union all
    select r.task_id, r.subtask_id+1 as subtask_id from id r, tasks t where t.task_id=r.task_id and r.subtask_id+1<= t.subtasks_count 
)

SELECT id.task_id, id.subtask_id 
FROM id 
LEFT JOIN Executed e ON id.task_id = e.task_id AND id.subtask_id = e.subtask_id 
WHERE e.subtask_id IS NULL 
