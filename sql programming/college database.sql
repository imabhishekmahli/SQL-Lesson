create database college;
use college;

create table student(
	id int(10),
    name varchar(30),
    address varchar(30));
    
show tables;

insert into student(id,name,address)
values(1,'abhishek','dhanbad'),
		(2,'kumar','rachi'),
        (3,'rohan','bokaro');
        
select * from student

select name from student 
where address='bokaro';

select * from student

select address,name from student 
where id=2;

show tables;

select * from student;

alter table student
add email varchar(30);

select * from student;

