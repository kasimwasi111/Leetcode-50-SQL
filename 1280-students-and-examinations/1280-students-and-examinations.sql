# Select the student ID
# Select the student name
# Select the subject name
# Count how many exams this student attended for this subject
select 
    s.student_id, 
    s.student_name, 
    sub.subject_name,
    count(e.subject_name) as attended_exams
# Start with the Students table
from Students s
# CROSS JOIN creates every possible combination
# of every student with every subject
cross join Subjects sub
# LEFT JOIN examinations so that we keep
# students/subjects even when they attended 0 exams
left join Examinations e
# Match the student
on s.student_id = e.student_id
# AND match the subject
and sub.subject_name = e.subject_name
# Group by student and subject
# so COUNT() can calculate exams for each combination
group by 
    s.student_id, 
    sub.subject_name
# First sort by student ID
# Then sort subjects alphabetically
order by 
    s.student_id, 
    sub.subject_name;