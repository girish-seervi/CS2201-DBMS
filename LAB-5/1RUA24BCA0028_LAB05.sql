-- Lab Experiment 04: Implement arithmetic, logical, comparison, special, and set operators in SQL using the Employees and Departments tables.

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Girish Kailash
-- USN: 1RUA24BCA0028
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
       
-- OUTPUT:
-- root@localhost	RVU-PC-050	8.4.6	2025-09-15 06:05:11

-- Write your code below this line along with the output \

create database lab03;
use lab03;

CREATE TABLE Employees (  
    EmployeeID INT PRIMARY KEY,  
    Name VARCHAR(100),  
    Age INT,  
    Salary DECIMAL(10,2),  
    DepartmentID INT,  
    HireDate DATE,  
    Address VARCHAR(255)  
);  

INSERT INTO Employees VALUES  
(1, 'Alice Johnson', 30, 60000, 1, '2020-03-15', '123 Main St, City A'),  
(2, 'Bob Smith', 28, 55000, 2, '2021-06-20', '456 Oak St, City B'),  
(3, 'Charlie Brown', 35, 75000, 3, '2019-01-10', '789 Pine St, City C'),  
(4, 'David Wilson', 40, 90000, 3, '2018-07-25', '101 Maple St, City D'),  
(5, 'Emma Davis', 27, 50000, 4, '2022-09-30', '202 Birch St, City E'),  
(6, 'Frank Miller', 32, 70000, 5, '2020-11-18', '303 Cedar St, City F'),  
(7, 'Grace Lee', 29, 58000, 1, '2021-04-05', '404 Walnut St, City G'),  
(8, 'Hank Adams', 45, 98000, 2, '2017-12-12', '505 Spruce St, City H'),  
(9, 'Ivy Green', 31, 64000, 4, '2023-02-14', '606 Redwood St, City I'),  
(10, 'Jack White', 38, 85000, 5, '2019-08-08', '707 Elm St, City J');  

-- TABLE:02 Department Table

CREATE TABLE Departments (  
    DepartmentID INT PRIMARY KEY,  
    DepartmentName VARCHAR(50)  
);  

INSERT INTO Departments VALUES  
(1, 'HR'),  
(2, 'Finance'),  
(3, 'Engineering'),  
(4, 'Marketing'),  
(5, 'Sales');  


-- TASK FOR STUDENTS 

/* 
Exercise 1: Arithmetic Operators
Addition, Subtraction, Multiplication, Division */

-- Q1 - Add a bonus (10% of Salary) to each employee’s salary.
select Name, Salary, Salary + (Salary * 0.10) AS BonusSalary
from Employees;

-- OUTPUT:
/* 
# Name	Salary	BonusSalary
Alice Johnson	60000.00	66000.0000
Bob Smith	55000.00	60500.0000
Charlie Brown	75000.00	82500.0000
David Wilson	90000.00	99000.0000
Emma Davis	50000.00	55000.0000
Frank Miller	70000.00	77000.0000
Grace Lee	58000.00	63800.0000
Hank Adams	98000.00	107800.0000
Ivy Green	64000.00	70400.0000
Jack White	85000.00	93500.0000
*/

-- Q2 - Subtract tax (15% of Salary) from each employee’s salary.
select Name,Salary, Salary - (Salary*0.15) AS TaxedSalary
from Employees;
  
-- OUTPUT:
/* 
# Name	Salary	TaxedSalary
Alice Johnson	60000.00	51000.0000
Bob Smith	55000.00	46750.0000
Charlie Brown	75000.00	63750.0000
David Wilson	90000.00	76500.0000
Emma Davis	50000.00	42500.0000
Frank Miller	70000.00	59500.0000
Grace Lee	58000.00	49300.0000
Hank Adams	98000.00	83300.0000
Ivy Green	64000.00	54400.0000
Jack White	85000.00	72250.0000
*/

-- Q3 - Calculate the yearly salary from the monthly salary.
select Name,Salary,Salary*12 AS YearlySalary
from Employees;

-- OUTPUT:
/* 
# Name	Salary	YearlySalary
Alice Johnson	60000.00	720000.00
Bob Smith	55000.00	660000.00
Charlie Brown	75000.00	900000.00
David Wilson	90000.00	1080000.00
Emma Davis	50000.00	600000.00
Frank Miller	70000.00	840000.00
Grace Lee	58000.00	696000.00
Hank Adams	98000.00	1176000.00
Ivy Green	64000.00	768000.00
Jack White	85000.00	1020000.00
*/

-- Modulus Operator
-- Q4 - Find the remainder when employees’ ages are divided by 5.
select Name,Age, Age % 5 from Employees;
  
  -- OUTPUT:
/* 
# Name          Age	Age % 5
Alice Johnson	30	0
Bob Smith	    28	3
Charlie Brown	35	0
David Wilson	40	0
Emma Davis	    27	2
Frank Miller	32	2
Grace Lee	    29	4
Hank Adams	    45	0
Ivy Green	    31	1
Jack White	    38	3
*/

/* Exercise 2: Logical Operators: AND, OR, NOT */

-- Q5 - Retrieve employees older than 30 AND with salary > 50000.
select * from Employees
where Age>30 AND Salary>50000;

-- OUTPUT:
/* 
EmployeeID	Name	        Age	Salary	DepartmentID HireDate	Address
3	        Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	        David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
6	        Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
8	        Hank Adams	    45	98000.00	2	2017-12-12	505 Spruce St, City H
9	        Ivy Green	    31	64000.00	4	2023-02-14	606 Redwood St, City I
10	        Jack White	    38	85000.00	5	2019-08-08	707 Elm St, City J
*/

-- Q6 - Retrieve employees in the HR department (ID=1) OR earning > 70000.
select * from Employees
where DepartmentID=1 OR Salary>70000;

-- OUTPUT:
/* 
EmployeeID	Name	        Age	Salary	DepartmentID HireDate	Address
1	        Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
3	        Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	        David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
7	        Grace Lee 	    29	58000.00	1	2021-04-05	404 Walnut St, City G
8	        Hank Adams	    45	98000.00	2	2017-12-12	505 Spruce St, City H
10	        Jack White	    38	85000.00	5	2019-08-08	707 Elm St, City J
*/

-- Q7 - Retrieve employees NOT living in City G.
select * from Employees
where Address NOT LIKE '%City G';

-- OUTPUT:
/* 
EmployeeID	Name	        Age	Salary	DepartmentID HireDate	Address
1	        Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	        Bob Smith	    28	55000.00	2	2021-06-20	456 Oak St, City B
3	        Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	        David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
5	        Emma Davis	    27	50000.00	4	2022-09-30	202 Birch St, City E
6	        Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
8	        Hank Adams	    45	98000.00	2	2017-12-12	505 Spruce St, City H
9	        Ivy Green	    31	64000.00	4	2023-02-14	606 Redwood St, City I
10	        Jack White	    38	85000.00	5	2019-08-08	707 Elm St, City J
 */

 
/* Exercise 3: Comparison Operators */

-- Q8 - Equality, Inequality, Greater Than, Less Than

-- Q9 - Find employees with salary = 60000.
select * from Employees 
where Salary = 60000;

-- OUTPUT:
-- 1	Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A

-- Q10 - List employees not in the IT department (no IT department exists; returns all).
select * from Employees
 where DepartmentID !='IT';
 
 -- OUTPUT:
 /* 
EmployeeID	Name	        Age	Salary	DepartmentID HireDate	Address
1	        Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	        Bob Smith	    28	55000.00	2	2021-06-20	456 Oak St, City B
3	        Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	        David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
5	        Emma Davis	    27	50000.00	4	2022-09-30	202 Birch St, City E
6	        Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
7	        Grace Lee	    29	58000.00	1	2021-04-05	404 Walnut St, City G
8	        Hank Adams	    45	98000.00	2	2017-12-12	505 Spruce St, City H
9	        Ivy Green	    31	64000.00	4	2023-02-14	606 Redwood St, City I
10	        Jack White	    38	85000.00	5	2019-08-08	707 Elm St, City J
 */

-- Q11 - Retrieve employees younger than 25 with salary > 50000 
select * from Employees 
where Age<25 AND Salary>50000;

-- OUTPUT: NULL

-- Q12 - List employees aged 25–35.
select * from Employees
where Age BETWEEN 25 AND 35; 

-- OUTPUT:
/*  
EmployeeID	Name	        Age	Salary	DepartmentID HireDate	Address
1	        Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	        Bob Smith	    28	55000.00	2	2021-06-20	456 Oak St, City B
3	        Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
5	        Emma Davis	    27	50000.00	4	2022-09-30	202 Birch St, City E
6	        Frank Miller	32	70000.00	5	2020-11-18	303 Cedar St, City F
7	        Grace Lee	    29	58000.00	1	2021-04-05	404 Walnut St, City G
9	        Ivy Green	    31	64000.00	4	2023-02-14	606 Redwood St, City I
*/

-- Q13 - Find employees in HR, Finance, or Engineering (IDs 1, 2, 3).
select * from Employees
where DepartmentID IN (1,2,3);

-- OUTPUT:
/* 
EmployeeID	Name	        Age	Salary	DepartmentID HireDate	Address
1	        Alice Johnson	30	60000.00	1	2020-03-15	123 Main St, City A
2	        Bob Smith	    28	55000.00	2	2021-06-20	456 Oak St, City B
3	        Charlie Brown	35	75000.00	3	2019-01-10	789 Pine St, City C
4	        David Wilson	40	90000.00	3	2018-07-25	101 Maple St, City D
7	        Grace Lee	    29	58000.00	1	2021-04-05	404 Walnut St, City G
8	        Hank Adams	    45	98000.00	2	2017-12-12	505 Spruce St, City H
*/

-- Q14 - Find employees with names starting with A.
select Name from Employees
where Name LIKE 'A%';

-- OUTPUT: Alice Johnson

-- Q15 - List employees with no address.
select Name,Address from Employees 
where Address IS NULL;

-- OUTPUT: NULL

/* 
Exercise 5: Set Operators: UNION.*/

-- Q16 - Retrieve names from the HR department hired in 2022 OR 2023.


-- Q17 - Find common employees in the Engineering department (ID=3) hired before and after 2020.

-- Q18 - Find employees hired in 2023 but not in 2022.

