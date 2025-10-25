create database Office;
use Office;
create table Books(
BookID int Primary key,
Title varchar(30),
Author varchar(30),
Price int,
Publisher varchar(30));

create table Customers(
CustID int Primary key,
Name varchar(30),
Email varchar(30) unique,
JoinDate date);

create table Orders (
OrderID int Primary key,
CustID int,
BookID int,
OrderDate date,
Quantity int,
Foreign key(CustID) references Customers(CustID),
Foreign key(BookID) references Books(BookID));

-- inserting the values
insert into Books values
(601, 'Wings of Fire', 'A. P. J. Abdul Kalam', 450, 'India'),
(602, '1984', 'George Orwell', 650, 'UK'),
(603, 'The Great Gatsby', 'F. Scott Fitzgerald', 550, 'USA'),
(604, 'Sapiens', 'Yuval Noah Harari', 800, 'Israel'),
(605, 'To Kill a Mockingbird', 'Harper Lee', 600, 'USA');
select * from Books;
-- Ouptut:
/*  
BookID	Title	             Author	               Price	Publisher
601	    Wings of Fire	     A. P. J. Abdul Kalam	450	     India
602	    1984	             George Orwell	        650	     UK
603	    The Great Gatsby.    F. Scott Fitzgerald	550	     USA
604	    Sapiens	             Yuval Noah Harari	    800	     Israel
605	    To Kill a Mockingbird Harper Lee	        600	     USA
*/

insert into Customers values
(201, 'Rahul Sharma', 'rahul.sharma@gmail.com', '2023-02-15'),
(202, 'Emily Davis', 'emily.davis@gmail.com', '2023-05-10'),
(203, 'Arjun Patel', 'arjun.patel@gmail.com', '2024-01-20'),
(204, 'Sophia Johnson', 'sophia.johnson@gmail.com', '2024-06-25'),
(205, 'Kiran Rao', 'kiran.rao@gmail.com', '2024-09-05');
select * from Customers;

-- OUTPUT:
/* 
# CustID	Name	     Email	                JoinDate
201	      Rahul Sharma	rahul.sharma@gmail.com	2023-02-15
202	      Emily Davis	emily.davis@gmail.com	2023-05-10
203	      Arjun Patel	arjun.patel@gmail.com	2024-01-20
204	      Sophia Johnson sophia.johnson@gmail.com	2024-06-25
205	      Kiran Rao	     kiran.rao@gmail.com	2024-09-05
*/

insert into Orders values
(301, 201, 601, '2024-03-01', 1),
(302, 202, 603, '2024-05-12', 2),
(303, 203, 604, '2024-07-18', 1),
(304, 204, 602, '2024-09-20', 3),
(305, 205, 605, '2024-12-05', 2);
select * from Orders;

-- OUTPUT:
/* 
# OrderID	CustID	BookID	OrderDate	Quantity
301	201	601	2024-03-01	1
302	202	603	2024-05-12	2
303	203	604	2024-07-18	1
304	204	602	2024-09-20	3
305	205	605	2024-12-05	2
*/

-- 1. Display all customer names in uppercase.
select Upper(Name) from Customers;
/* OUTPUT: 
RAHUL SHARMA
EMILY DAVIS
ARJUN PATEL
SOPHIA JOHNSON
KIRAN RAO
*/

-- 2. Show all customer names in lowercase. 
select Lower(Name) from Customers;
/* OUTPUT:
rahul sharma
emily davis
arjun patel
sophia johnson
kiran rao
*/

-- 3.Extract the first 3 letters of each book title.
select left(Title, 3) from Books;
/* OUTPUT: 
Win
198
The
Sap
To 
*/

-- 4. Display each customer’s email domain (after @).
select substring_index(email, '@', -1) as domain
 from customers;
 /* OUTPUT: 
domain
gmail.com
gmail.com
gmail.com
gmail.com
gmail.com
 */

-- 5.Find the length of each book title.
select length(Title) from Books;
/* OUTPUT: 
13
4
16
7
21
*/

-- 6. Replace the word "Book" with "Text" in titles (if present).
select replace(Title, 'Book','Text') As BookToText
from Books;
/* OUTPUT: 
# BookToText
Wings of Fire
1984
The Great Gatsby
Sapiens
To Kill a Mockingbird
*/

-- 7. Concatenate Author name and Book title as a single string.
select concat(Title,Author) from Books;
/* OUTPUT: 
Wings of FireA. P. J. Abdul Kalam
1984George Orwell
The Great GatsbyF. Scott Fitzgerald
SapiensYuval Noah Harari
To Kill a MockingbirdHarper Lee
*/

-- 8.Show book titles where the author’s name contains ‘a’.
select Title, Author from books 
where Author Like '%a%';
/* OUTPUT: 
# Title	          Author
Wings of Fire	 A. P. J. Abdul Kalam
The Great Gatsby	 F. Scott Fitzgerald
Sapiens	          Yuval Noah Harari
To Kill a Mockingbird	Harper Lee
*/

-- 9.Display the year in which each book was published.
alter table books add column publishdate date;
update books set publishdate = '1999-06-15' where bookid = 601;
update books set publishdate = '2018-10-16' where bookid = 602;
update books set publishdate = '2008-08-01' where bookid = 603;
update books set publishdate = '2020-09-08' where bookid = 604;
update books set publishdate = '2019-05-10' where bookid = 605;
select title,publishdate from Books;

/* OUTPUT: 
Wings of Fire	1999-06-15
1984	2018-10-16
The Great Gatsby	2008-08-01
Sapiens	2020-09-08
To Kill a Mockingbird	2019-05-10
*/

-- 10.Find the month name in which each customer joined.
select Name, MONTHNAME(JoinDate) AS JoinMonth 
from Customers;
/* OUTPUT: 
# Name	       JoinMonth
Rahul Sharma	February
Emily Davis     	May
Arjun Patel	     January
Sophia Johnson  	June
Kiran Rao	    September
*/

-- 11.List customers who joined in 2021.
select * from Customers where Year(JoinDate)=2021; 
/* OUTPUT : NULL */

-- 12.Find the day name on which each order was placed.
select DAYNAME(OrderDate) As OrderDay 
from Orders;
/* OUTPUT: 
# OrderDay
Friday
Sunday
Thursday
Friday
Thursday
*/

-- 13.Display the age of each book (in years since published).
select Title, YEAR(CURDATE()) - YEAR(PublishDate) As BookAge 
from Books;
/* OUTPUT: 
Wings of Fire	26
1984	7
The Great Gatsby	17
Sapiens	5
To Kill a Mockingbird	6
*/

-- 14.Find the number of days between today and each customer’s join date.
select Name, DATEDIFF(Now(), JoinDate) AS DaysSinceJoin 
from Customers;
/* OUTPUT: 
Rahul Sharma	945
Emily Davis	861
Arjun Patel	606
Sophia Johnson	449
Kiran Rao	377
*/

-- 15.Show all orders placed in the month of December (any year).
select * from orders where month(OrderDate)= 12;
/* OUTPUT: 
OrderID	CustID	BookID OrderDate Quantity
305	    205	    605	   2024-12-05 2
*/

-- 16.Find the total number of books available in the store.
select COUNT(*) As TotalBooks 
from Books;
/* OUTPUT: 5 */

-- 17.Find the average price of books.
select avg(Price) As AveragePrice 
from Books;
/* OUTPUT: 610.0000 */

-- 18.Find the maximum and minimum book price.
select max(Price),min(Price)
from Books;
/* OUTPUT: 
max(Price)	min(Price)
800	        450
*/

-- 19.Count how many customers joined after 2020.
select count(*) from Customers where JoinDate > 2020;
/* OUTPUT: 5 */

-- 20.Find the total number of books ordered (all orders combined).
select Sum(Quantity) from Orders;
/* OUTPUT: 9 */

-- 21.Show the total quantity of books ordered per customer.
select CustID, Sum(Quantity) from Orders group by CustID;
/* OUTPUT:
# CustID	Sum(Quantity)
201	1
202	2
203	1
204	3
205	2
*/

-- 22. Find the average order quantity per book.
select BookID, Avg(Quantity) from Orders group by BookID;
/* OUTPUT:
# BookID	Avg(Quantity)
601	1.0000
602	3.0000
603	2.0000
604	1.0000
605	2.0000
*/


-- 23. Find the book with the highest total quantity ordered.
select BookID, Sum(Quantity) from Orders 
group by BookID order by Sum(Quantity) 
desc limit 1;
/* OUTPUT:
# BookID	Sum(Quantity)
602	3
*/

-- 24. Show the total revenue generated per book (Price × Quantity).
select BookID, Sum(Price * Quantity) from Books 
join Orders using(BookID) group by BookID;
/* OUTPUT:
# BookID	Sum(Price * Quantity)
601	450
602	1950
603	1100
604	800
605	1200
*/

-- 25. Find the total number of orders placed each year.
select year(OrderDate), count(OrderID) from Orders group by year(OrderDate);
/* OUTPUT:
# year(OrderDate)	count(OrderID)
2024	5
*/
