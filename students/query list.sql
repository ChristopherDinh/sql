-- Inner Join
select user.name, course.name
from user
inner join course on user.courseID = Course.CourseID;

select user.name as UserName, course.name as CourseName
from user, course
where user.CourseID = course.courseid;

-- Get all students without course assignments
select * from user
where courseid is null;

select * from course
where courseid not in
(select distinct(courseid) from user where courseid is not null);

-- Left Join
select user.name, course.name
from user
left join course on user.CourseID = Course.courseID;


-- Right Join (Not Used, Too Slow)
select user.name, course.name
from user
right join course on user.courseid = course.courseid;

-- Outer Join
select user.name, course.name
from user 
left join course on user.CourseID = course.courseid

union

select user.name, course.name
from user
right join course on user.courseid = course.courseid;





