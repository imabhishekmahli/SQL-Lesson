-- create database bangalore;
-- use bangalore

create table btm_1
(
	pg_id int,
    pg_name varchar(50),
    pg_sector int,
    pg_strength int,
    pg_address varchar(50),
    primary key(pg_id)
)

insert into btm_1(pg_id,pg_name,pg_sector,pg_strength,pg_address)
values(001,'jairam',2,50,'near vibgyor'),
		(002,'sriram',4,30,'near sambhaji'),
        (003,'laxman',6,40,'near shivaji'),
        (004,'hanuman',8,25,'near gandhi'),
        (005,'shiva',10,15,'near bose'),
        (006,'ganesh',12,60,'near bhagatsingh')
        
select * from btm_1;

create table btm_2
(
	pg_id int,
    pg_name varchar(50),
    pg_sector int,
    pg_strength int,
    pg_address varchar(50),
    primary key(pg_id),
    foreign key (pg_id) references btm_1(pg_id)
)

insert into btm_2(pg_id,pg_name,pg_sector,pg_strength,pg_address)
values(001,'laxminagar',1,25,'near jhar'),
		(002,'ramgarh',3,15,'near bihar'),
        (003,'jivanjyoti',5,25,'near up'),
        (004,'pahadi',7,50,'near mp'),
        (005,'bihari',9,30,'near maharastra'),
        (006,'aadivasi',77,30,'near karnataka')

select * from btm_2;

select * from btm_1,btm_2
where btm_2.pg_name='ramgarh' and btm_1.pg_id=btm_2.pg_id