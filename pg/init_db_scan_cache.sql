-- cleanup if necessary
drop table if exists exams_cache;
drop table if exists students_cache;
-- create cache tables
create table students_cache (
    id bigint, 
    name text
);
create table exams_cache (
    id bigint,
    sid bigint,
    grade int,
    course text
);
-- copy cache data
insert into students_cache select * from students;
insert into exams_cache select * from exams;
