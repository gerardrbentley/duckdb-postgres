-- src: dbfiddle.uk/wLZ4H496 @FrankPachot
explain analyze
select name,
    course
from (
        select s.name,
            e.course,
            e.grade,
            min(e.grade) over(partition by s.id) student_min_grade
        from students_cache s,
            exams_cache e
        where s.id = e.sid
    ) as student_grade
where grade = student_min_grade;