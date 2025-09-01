-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Lab Experiment 02: Program 02 - Implementation of DML Commands in SQL ( INSERT , SELECT, UPDATE and DELETE )
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- STUDENT NAME: Girish Kailash
-- USN: 1RUA24BCA0028
-- SECTION: BCA
-- -----------------------------------------------------------------------------------------------------------------------------------------
SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;

-- Paste the Output below by execution of above command
-- root@localhost	RVU-PC-055	9.4.0	2025-09-01 11:25:36

-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Scenario: You are managing a database for a library with two tables: Books and Members.
create database Library01;
use Library01;
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Task 01: Create Tables [ Check the below mentioned Instructions:
-- Create the Books and Members tables with the specified structure.
-- Books Table and Member Table : 
-- -----------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task with the Instructed Column in the session 

create table Books
( Book_ID varchar(10) Primary Key,
Title varchar(15),
Author varchar(15),
Published_Date date,
Genre varchar(15)
);

alter table Books add( Available_copies int, TotalCopies int);
alter table Books drop Genre;
alter table Books modify Title varchar(50);
alter table Books modify Published_Date int;

create table Members
( Member_ID varchar(12) Primary Key,
Name varchar(15),
Email varchar(20),
Phone int,
JoinDate date
);

alter table Members add Membership varchar(20);

-- Paste the Output below for the given command ( DESC TableName;) 
desc Books;
/*Book_ID	varchar(10)	NO	PRI		
Title	varchar(15)	YES			
Author	varchar(15)	YES			
Published_Date	date	YES			
Available_copies	int	YES			
TotalCopies	int	YES					
*/

desc Members;
/*Member_ID	varchar(12)	NO	PRI		
Name	varchar(15)	YES			
Email	varchar(20)	YES			
Phone	int	YES			
JoinDate	date	YES			
Membership	varchar(20)	YES						
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 02: Insert a New Book
-- Instructions: Insert a book titled "1984_The Black Swan" by George Orwell (published in 1949) with 04 available copies and 10 Total copies. 
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
insert into Books values
('LIB001','1984_TheBlackSwan','George Orwell',1949,04,10);

insert into Books values
('LIB002','Build Dont Talk','Raj Shamani',2023,03,12),
('LIB003','War and Peace','Leo Tolstoy',1967,05,07),
('LIB004','Frankenstein','Mary Shelley',1818,06,14),
('LIB005','The Alchemist','Paulo Coelho',1988,04,09);

select * from Books;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).

/*
Book_ID	Title	            Author	      Published_Date	Available_copies	TotalCopies
LIB001	1984_TheBlackSwan  George Orwell   1949	                    4	           10
LIB002	Build Dont Talk	   Raj Shamani	   2023	                    3	           12
LIB003	War and Peace	   Leo Tolstoy	   1967	                    5	            7
LIB004	Frankenstein	   Mary Shelley	   1818	                    6	           14
LIB005	The Alchemist	   Paulo Coelho	   1988	                    4	            9
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 03: Add New Members
-- Instructions: Insert two members: David Lee (Platinum, joined 2024-04-15) and Emma Wilson (Silver, joined 2024-05-22).
-- Populate other fields as needed.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.

insert into Members values
('M01','David Lee','davil200@gmail.com',89891020,'2024-04-15','Platinum'),
('M02','Emma Wilson','emma4699@gmail.com',9576920,'2024-05-22','Silver');

select * from Members;
-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
Member_ID	Name	Email	            Phone	    JoinDate	Membership
M01  	David Lee	davil200@gmail.com	89891020	2024-04-15	Platinum
M02  	Emma Wilson	emma4699@gmail.com	9576920 	2024-05-22	Silver
*/

-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 04: Update Book Details 
-- Instructions: The library acquired 2 additional copies of "1984_The Black Swan". Update the Books table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.
alter table Books add PubLoc varchar(20);
update Books set PubLoc = 'Bengaluru';

select * from Books;

-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).
/*
Book_ID	Title	            Author	      Published_Date	Available_copies TotalCopies	 PubLoc
LIB001	1984_TheBlackSwan  George Orwell	1949	           4	          10	       Bengaluru
LIB002	Build Dont Talk	  Raj Shamani	    2023	           3	          12	       Bengaluru
LIB003	War and Peace	Leo Tolstoy	        1967	           5	           7	       Bengaluru
LIB004	Frankenstein	Mary Shelley	    1818	           6	          14	       Bengaluru
LIB005	The Alchemist	Paulo Coelho	    1988	           4	           9	       Bengaluru
*/


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 05: Modify a Member's Information
-- Instructions: Update a member's membership type. Emma Wilson has upgraded her membership from 'Silver' to 'Gold'.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.







-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 06: Remove a Member
-- Instructions: Delete David Lee’s record from the Members table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 09: Borrowing Table 
-- Instructions: Create a Borrowing table with foreign keys referencing Books and Members.
-- Subtask 1: Borrow a Book
-- Scenario:Emma Wilson (member_id = 2) borrows the book "The Catcher in the Rye" (book_id = 102) on 2024-06-01. Insert this record into the Borrowing table.
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Find the name of Borrower who book = 102 [ Advance and Optional ]
-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Write the SQL Query below for above mentioned task.








-- Paste the Output below for the given command ( SELECT * FROM TABLE_NAME ).


-- ------------------------------------------------------------------------------------------------------------------------------------------
-- Final Task 00: ER Diagram - Instructions:
-- Draw an ER diagram for the library database. Additional Upload the scanned copy of the created ER Daigram in the Google Classroom.



-- END of the Task -- 