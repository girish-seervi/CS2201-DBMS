-- Lab Experiment 05: To implement different types of joins: Inner Join, Outer Join (Left, Right, Full), and Natural Join.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Girish Kailash
-- USN: 1RUA24BCA0028
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT: root@localhost	RVU-PC-050	8.4.6	2025-09-22 11:25:53

-- Write your code below this line along with the output 
create database dblab06;
use dblab06;


-- table 01: Customers
-- CREATE  a TABLE named Customers (customer_id INT PRIMARY KEY,customer_name VARCHAR(50),city VARCHAR(50)
create table Customers
( customer_id int primary key,
customer_name varchar(50),
city varchar(50));

-- insert 5 records
insert into Customers values
(101, 'Girish', 'Rajasthan'),
(102, 'Swaroop', 'Bangalore'),
(103, 'Riyan', 'KTM'),
(104, 'Aryan', 'UP'),
(105, 'Deep', 'Bengal');
 
 select * from Customers;
 -- OUTPUT:
 /* 
customer_id	customer_name	city
101	        Girish	Rajasthan
102	        Swaroop	Bangalore
103	        Riyan	KTM
104     	Aryan	UP
105	        Deep	Bengal
 */
 
-- TABLE:02 Orders Table

-- CREATE a TABLE named Orders (order_id INT PRIMARY KEY,customer_id INT foreign key,product_name VARCHAR(50),order_date DATE,

 create table Orders
 ( order_id int primary key,
 customer_id int, 
 foreign key(customer_id) references Customers(customer_id),
 product_name varchar(50),
 order_date date);
 
 
 -- insert 5 records
insert into Orders values
( 201, 101, 'TV', '2023-08-06'),
( 202, 102, 'Fridge', '2023-12-09'),
( 203, 103, 'Fan', '2024-12-05'),
( 204, 104, 'Smartphone', '2024-08-21'),
( 205, 105, 'PC', '2025-03-31');

select * from Orders;
-- OUTPUT:
/* 
# order_id	customer_id	product_name	order_date
201	101	TV	2023-08-06
202	102	Fridge	2023-12-09
203	103	Fan	2024-12-05
204	104	Smartphone	2024-08-21
205	105	PC	2025-03-31
*/


-- TASK FOR STUDENTS 

-- Write and Execute Queries
/*
1. Inner Join – */

-- Find all orders placed by customers from the city "Bangalore."
select *
from Customers
inner join Orders on Customers.customer_id = Orders.customer_id
and Customers.city = 'Bangalore';
-- OUTPUT:
/*102	Swaroop	Bangalore	202	102	Fridge	2023-12-09*/

-- List all customers with the products they ordered.
select Customers.customer_name, Orders.product_name
from Customers,Orders
where Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
Girish	TV
Swaroop	Fridge
Riyan	Fan
Aryan	Smartphone
Deep	PC
*/

-- Show customer names and their order dates.
select Customers.customer_name, Orders.order_date
from Customers,Orders
where Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
Girish	2023-08-06
Swaroop	2023-12-09
Riyan	2024-12-05
Aryan	2024-08-21
Deep	2025-03-31
*/

-- Display order IDs with the corresponding customer names.
select Orders.order_id, Customers.customer_name 
from Orders,Customers
where Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
201	Girish
202	Swaroop
203	Riyan
204	Aryan
205	Deep
*/

-- Find the number of orders placed by each customer.
select Customers.customer_name, count(Orders.order_id) as number_of_orders
from Customers, Orders
where Customers.customer_id = Orders.customer_id
group by customers.customer_name;
-- OUTPUT:
/* 
Girish	1
Swaroop	1
Riyan	1
Aryan	1
Deep	1
*/

-- Show city names along with the products ordered by customers.
select Customers.city, Orders.product_name
from Customers, Orders
where Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
Rajasthan	TV
Bangalore	Fridge
KTM	Fan
UP	Smartphone
Bengal	PC
*/

/* 
2  Left Outer Join – */

-- Find all customers and their orders, even if a customer has no orders.
select Customers.customer_name, Orders.product_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
Girish	TV
Swaroop	Fridge
Riyan	Fan
Aryan	Smartphone
Deep	PC
*/

-- List all customers and the products they ordered.
select Customers.customer_name, Orders.product_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id;
 -- OUTPUT:
 /* 
 Girish	TV
Swaroop	Fridge
Riyan	Fan
Aryan	Smartphone
Deep	PC
 */
 
-- Show customer IDs, names, and their order IDs.
select Customers.customer_id,Customers.customer_name, Orders.order_id
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
101	Girish	201
102	Swaroop	202
103	Riyan	203
104	Aryan	204
105	Deep	205
*/

-- Find the total number of orders (if any) placed by each customer.
select Customers.customer_name, count(Orders.order_id) as number_of_orders
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
group by Customers.customer_name;
-- OUTPUT:
/* 
Girish	1
Swaroop	1
Riyan	1
Aryan	1
Deep	1
*/

-- Retrieve customers who have not placed any orders.
select Customers.customer_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
where Orders.order_id IS NULL;
-- OUTPUT: NULL

-- Display customer names with their order dates.
select Customers.customer_name, Orders.order_date
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id;
-- OUTPUT:
/* 
Girish	2023-08-06
Swaroop	2023-12-09
Riyan	2024-12-05
Aryan	2024-08-21
Deep	2025-03-31
*/ 

 
/* 3: Right Outer Join – */
-- Find all orders and their corresponding customers, even if an order doesn't have a customer associated with it.
select Orders.order_id, Customers.customer_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
201	Girish
202	Swaroop
203	Riyan
204	Aryan
205	Deep
*/

-- Show all orders with the customer names.
select Orders.order_id, Orders.product_name, Customers.customer_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT: 
/* 
201	TV	Girish
202	Fridge	Swaroop
203	Fan	Riyan
204	Smartphone	Aryan
205	PC	Deep
*/

-- Display product names with the customers who ordered them.
select Orders.product_name, Customers.customer_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
TV	Girish
Fridge	Swaroop
Fan	Riyan
Smartphone	Aryan
PC	Deep
*/

-- List order IDs with customer cities.
select Orders.order_id, Customers.city
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
201	Rajasthan
202	Bangalore
203	KTM
204	UP
205	Bengal
*/

-- Find the number of orders per customer (include those without orders).
select Customers.customer_name, COUNT(Orders.order_id) AS number_of_orders
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id
group by Customers.customer_name;
-- OUTPUT:
/*
Girish	1
Swaroop	1
Riyan	1
Aryan	1
Deep	1
*/

-- Retrieve customers who do not have any matching orders.
select Customers.customer_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id
where Orders.order_id IS NULL;
-- OUTPUT: NULL
 

/* 4: Full Outer Join –  */

-- Find all customers and their orders, including those customers with no orders and orders without a customer.
select Customers.customer_name, Orders.product_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
union
select Customers.customer_name, Orders.product_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
Girish	TV
Swaroop	Fridge
Riyan	Fan
Aryan	Smartphone
Deep	PC
*/

-- List all customers and products, whether they placed an order or not.
select Customers.customer_name, Orders.product_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
union
select Customers.customer_name, Orders.product_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
Girish	TV
Swaroop	Fridge
Riyan	Fan
Aryan	Smartphone
Deep	PC
*/

-- Show customer ids with order ids (include unmatched ones).
select Customers.customer_id, Orders.order_id
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
union
select Customers.customer_id, Orders.order_id
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
101	201
102	202
103	203
104	204
105	205
*/

-- Display customer names with order dates.
select Customers.customer_name, Orders.order_date
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
union
select Customers.customer_name, Orders.order_date
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
Girish	2023-08-06
Swaroop	2023-12-09
Riyan	2024-12-05
Aryan	2024-08-21
Deep	2025-03-31
*/

-- Find all unmatched records (customers without orders and orders without customers).
select Customers.customer_name, Orders.product_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
where orders.product_name IS NULL
union
select Customers.customer_name, Orders.product_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id
where Customers.Customer_name IS NULL;
-- OUTPUT: NULL

-- Show customer cities with products.
select Customers.city, Orders.product_name
from Customers
left outer join Orders on Customers.customer_id = Orders.customer_id
union
select Customers.city, Orders.product_name
from Orders
right outer join Customers on Orders.customer_id = Customers.customer_id;
-- OUTPUT:
/* 
Rajasthan	TV
Bangalore	Fridge
KTM	Fan
UP	Smartphone
Bengal	PC
*/
  /* 5: Natural Join – */
  
-- Find all orders placed by customers.
select * 
from Customers
natural join Orders;
-- OUTPUT:
/* 
101	Girish	Rajasthan	201	TV	2023-08-06
102	Swaroop	Bangalore	202	Fridge	2023-12-09
103	Riyan	KTM	203	Fan	2024-12-05
104	Aryan	UP	204	Smartphone	2024-08-21
105	Deep	Bengal	205	PC	2025-03-31
*/

-- List all customers with the products they ordered using natural join.
select Customers.customer_name, Orders.product_name
from Customers
natural join Orders;
-- OUTPUT:
/* 
Girish	TV
Swaroop	Fridge
Riyan	Fan
Aryan	Smartphone
Deep	PC
*/

-- Show customer names along with their order dates using natural join.
select Customers.customer_name, Orders.order_date
from Customers
natural join Orders;
-- OUTPUT:
/* 
Girish	2023-08-06
Swaroop	2023-12-09
Riyan	2024-12-05
Aryan	2024-08-21
Deep	2025-03-31
*/
-- Find all customer cities and the products ordered by those customers using natural join.
select Customers.city, Orders.product_name
from Customers
natural join Orders;
-- OUTPUT:
/* 
Rajasthan	TV
Bangalore	Fridge
KTM	Fan
UP	Smartphone
Bengal	PC
*/

  -- END OF THE EXPERIMENT