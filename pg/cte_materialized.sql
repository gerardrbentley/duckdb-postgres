-- src: dbfiddle.uk/wLZ4H496 @FranckPachot
explain analyze
with 
    min_exam_grades as materialized (
        select e2.sid as id,
            min(e2.grade) as best
        from exams e2
        group by e2.sid
    )
select students.name,
    exams.course
from students,
    exams,
    min_exam_grades
where students.id = exams.sid
    and min_exam_grades.id = students.id
    and exams.grade = min_exam_grades.best;
