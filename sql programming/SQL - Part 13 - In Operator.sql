-- ## the process of providing the multiple values to the same columns

-- select * from '''table ''' where id=1 or id=2 or id=5 or id=9;

-- use college;
-- show tables;
-- select * from college.student;

/*select * from student 
where id=1 or id=3 or id=4;*/

select * from student 
where id in(1,3,4);