show databases;
use lco_car_rentals;

show tables;

select * from customer;
select * from rental_invoice;
select * from location;
select * from rental;
select * from fuel_option;
select * from vehicle_type;
select * from equipment;
select * from vehicle_has_equiment;
select * from vehicle;
select * from equipment_type;
select * from insurance;
select * from rental_has_equipment_type;
select * from rental_has_insurance;

-- Q1) How would you fetch details of the customers  who cancelled orders?
show tables;
SELECT * FROM customers LEFT JOIN orders ON orders.customer_id = customers.customer_id WHERE orders.status = "Cancelled";