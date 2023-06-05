-- cleanup if necessary
drop table if exists exams;
drop table if exists students;
drop sequence if exists seq_studentid;
drop sequence if exists seq_examid;
-- generate tables
create table students (
    id bigint, 
    name text
);
create table exams (
    id bigint,
    sid bigint,
    grade int,
    course text
);
create sequence seq_studentid start 1;
create sequence seq_examid start 1;
-- generate 100000 students
insert into students (id, name)
select nextval('seq_studentid'), md5(random()::text)
from generate_series(1, 100000);
-- generate 10 exams per student
insert into exams (id, sid, grade, course)
select nextval('seq_examid'),
    students.id,
    floor(random() * (101))::int,
    md5(random()::text)
from generate_series(1, 10),
    students;
-- demo data
select count(s.name)
from students s
    join exams e on s.id = e.sid
    and s.id = 999;
