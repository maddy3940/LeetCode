# Write your MySQL query statement below


select s.school_id,ifnull(min(e.score),-1) as score from schools s left join exam e on s.capacity>=e.student_count group by 1 





