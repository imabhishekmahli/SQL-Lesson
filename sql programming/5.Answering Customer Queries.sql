show databases;
-- select database();
-- use photo_store;

-- show tables;

-- desc canon_cameras;

-- select * from canon_cameras;

/* WHAT MODELS OF CANON CAMERAS DO YOU HAVE ? */

select model_name,quantity from canon_cameras;

/* HOW MANY 80D CAN YOU GIVE RIGHT NOW? */

select model_name,quantity from canon_cameras
where model_name='80-d';

/* I WANT TO BUY 50 CAMERAS OF SAME MODEL. WHAT CAN YOU SUPPLY ME AT THE MOMENT ? */

SELECT model_name,quantity from canon_cameras
where quantity>=50;