show databases;
use lco_motors;

show tables;

-- Q1) How would you fetch details of the customers  who cancelled orders?

select c.*,o.* from customers as c 
join orders as o on c.customer_id = o.customer_id 
where o.status = 'cancelled';




-- Q2) Fetch the details of customers who have done payments between the amount 5,000 and 35,000?

select * from customers;
select * from payments;

select c.*,p.* from customers as c left join payments as p on c.customer_id = p.customer_id
where p.amount between  5000 and 35000;




-- Q3) Add new employee/salesman with following details:-
-- EMP ID - 15657
-- First Name : Lakshmi
-- Last Name: Roy
-- Extension : x4065
-- Email: lakshmiroy1@lcomotors.com
-- Office Code: 4
-- Reports To: 1088
-- Job Title: Sales Rep

select * from employees;
insert into employees (employee_id,last_name,first_name,extension,email,office_code,reports_to,job_title) VALUES
(15657,'Roy','Lakshmi','x4065','lakshmiroy1@lcomotors.com',4,1088,'Sales Rep');




-- Q4) Assign the new employee to the customer whose phone is 2125557413 
select * from customers;
select * from customers where phone = 2125557413;




-- Q5) Write a SQL query to fetch shipped motorcycles.

select * from orders;
select * from orderdetails;
select * from products;

select *  from ((orders as o
right join orderdetails as od on o.order_id = od.order_id)
left join products as p on od.product_code = p.product_code)
where status = 'shipped' and p.product_line = 'motorcycles';

-- SELECT * FROM orders 
-- LEFT JOIN orderdetails ON orderdetails.order_id=orders.order_id 
-- LEFT JOIN products ON orderdetails.product_code = products.product_code 
-- WHERE products.product_line = "Motorcycles" AND orders.status = "Shipped";



-- Q6) Write a SQL query to get details of all employees/salesmen in the office located in Sydney.
select * from offices;
select * from employees;

select * from employees 
left join offices on offices.office_code = employees.office_code
where city = 'sydney';

-- SELECT employees.employee_id, employees.first_name, employees.last_name, employees.email, employees.extension, employees.job_title, employees.office_code FROM employees 
-- LEFT JOIN offices ON employees.office_code=offices.office_code 
-- WHERE offices.city="Sydney"; 



-- Q7) How would you fetch the details of customers whose orders are in process?
select * from customers;
select * from orders;

select * from customers left join orders on customers.customer_id = orders.customer_id 
where status = 'in process';

-- SELECT customers.customer_id, customers.first_name, customers.last_name, customers.phone, customers.address_line1, customers.address_line2, customers.city, customers.state, customers.postal_code, customers.country, customers.credit_limit, orders.order_id, orders.status  FROM customers 
-- LEFT JOIN orders ON orders.customer_id = customers.customer_id 
-- WHERE orders.status = "In Process";




-- Q8) How would you fetch the details of products with less than 30 orders?
select * from products;
select * from orders;
select * from orderdetails;

select * from products as p 
left join orderdetails as od on p.product_code = od.product_code
left join orders as o on od.order_id = o.order_id
where quantity_ordered < 30;

-- SELECT products.product_code, products.product_name, products.product_scale, products.product_vendor, products.product_description, products.stock, products.buy_price, products.mrp, productlines.product_line,productlines.description AS productline_description, orderdetails.quantity_ordered, orderdetails.order_id 
-- FROM products 
-- RIGHT JOIN productlines ON productlines.product_line=products.product_line 
-- LEFT JOIN orderdetails ON orderdetails.product_code = products.product_code 
-- WHERE orderdetails.quantity_ordered < 30;



-- Q9) It is noted that the payment (check number OM314933) was actually 2575. Update the record.
select * from payments where check_number = 'OM314933';
update payments set amount = 2575 where customer_id = 103;



-- Q10) Fetch the details of salesmen/employees dealing with customers whose orders are resolved.
select * from employees;
select * from customers;
select status,count(status) from orders group by status;

select * from employees 
left join customers on employees.employee_id = customers.sales_employee_id
left join orders on customers.customer_id = orders.customer_id
where status = 'resolved';

-- SELECT DISTINCT employees.employee_id, employees.first_name ,employees.last_name, employees.email, employees.job_title, employees.extension, customers.customer_id, orders.order_id, orders.status FROM employees 
-- LEFT JOIN customers ON customers.sales_employee_id = employees.employee_id 
-- RIGHT JOIN orders ON orders.customer_id = customers.customer_id 
-- WHERE orders.status = "Resolved";



-- Q11) Get the details of the customer who made the maximum payment.
select * from customers;
select * from payments;

select * from customers  join payments on customers.customer_id = payments.customer_id
order by (amount) desc limit 1;

-- SELECT * FROM customers 
-- RIGHT JOIN payments ON customers.customer_id = payments.customer_id 
-- WHERE payments.amount = (SELECT MAX(amount) from payments);



-- Q12) Fetch list of orders shipped to France.
select * from orders;
select * from customers;

select * from orders join customers on orders.customer_id = customers.customer_id
where customers.country = 'france' and orders.status = 'shipped';

-- SELECT orders.order_id, orders.order_date, orders.required_date, orders.shipped_date, orders.status, orders.comments , orders.customer_id, customers.country FROM orders 
-- LEFT JOIN customers ON customers.customer_id = orders.customer_id 
-- WHERE customers.country = "France" AND orders.status="Shipped";



-- Q13) How many customers are from Finland who placed orders.
select * from customers;
select * from orders;
select * from orderdetails;

select * from customers where country = 'finland';

SELECT customers.customer_id, orders.order_id, COUNT(customers.customer_id) FROM customers 
RIGHT JOIN orders ON orders.customer_id=customers.customer_id 
WHERE customers.country = "Finland";



-- Q14) Get the details of the customer who made the maximum payment.
select * from customers  join payments on customers.customer_id = payments.customer_id
order by (amount) desc limit 1;



-- Q15) Get the details of the customer and payments they made between May 2019 and June 2019.
select * from customers;
select * from payments;

select * from customers join payments on customers.customer_id = payments.customer_id
where payments.payment_date between '2019-05-01' and '2019-06-30';

-- SELECT customers.customer_id, customers.first_name, customers.last_name, customers.phone, customers.address_line1, customers.address_line2, customers.city, customers.state, customers.postal_code, customers.country, customers.credit_limit,payments.payment_date FROM customers 
-- LEFT JOIN payments on payments.customer_id = customers.customer_id 
-- WHERE payments.payment_date BETWEEN '2019-05-01' AND '2019-06-30';



-- Q16) How many orders shipped to Belgium in 2018?
select * from orders;
select * from customers;

select status ,count(status) from orders group by status; 

select count(orders.order_id) from customers join orders on customers.customer_id = orders.customer_id
where country = 'belgium' and order_date between '2018-01-01' and '2018-12-31';

SELECT  COUNT(orders.order_id) FROM orders 
INNER JOIN customers ON customers.customer_id = orders.customer_id 
WHERE customers.country = "Belgium" AND orders.shipped_date BETWEEN '2018-01-01' AND '2018-12-31';



-- Q17) Get the details of the salesman/employee with offices dealing with customers in Germany.
select * from employees;
select * from customers;

select * from customers join employees on customers.sales_employee_id = employees.employee_id
where customers.country = 'germany';

SELECT employees.employee_id, employees.first_name ,employees.last_name, employees.email, employees.job_title, employees.extension, customers.customer_id, offices.office_code, offices.address_line1, offices.address_line2, offices.phone, offices.city, offices.state, offices.country, offices.postal_code, offices.territory FROM employees 
CROSS JOIN offices ON  offices.office_code=employees.office_code 
LEFT JOIN customers on customers.sales_employee_id = employees.employee_id 
WHERE customers.country = "Germany";



-- Q18) The customer (id:496 ) made a new order today and the details are as follows:

-- Order id : 10426
-- Product Code: S12_3148
-- Quantity : 41
-- Each price : 151
-- Order line number : 11
-- Order date : <today’s date>
-- Required date: <10 days from today>
-- Status: In Process

select * from customers;
select * from orders;
select * from orderdetails;

INSERT INTO `orders`(`order_id`, `order_date`, `required_date`, `status`,`customer_id`) VALUES 
(10426, CURRENT_DATE(), (CURRENT_DATE() + INTERVAL 10 DAY), "In Process" , 496);

INSERT INTO `orderdetails`(`order_id`, `product_code`, `quantity_ordered`, `each_price`, `order_line_number`) VALUES 
( 10426 , "S12_3148" ,  41, 151, 11);




-- Q19) Fetch details of employees who were reported for the payments made by the customers 
-- between June 2018 and July 2018.









