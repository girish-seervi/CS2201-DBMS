create database School1;
use School1;

-- Student Table
create table Student (
    StudentID int PRIMARY KEY,
    FirstName varchar(20),
    LastName varchar(15),
    DOB date,
    Class varchar(10),
    Marks int,
    City varchar(20)
);

-- Teacher Table
create table Teacher (
    TeacherID int PRIMARY KEY,
    FirstName varchar(20),
    LastName varchar(15),
    Subject varchar(20),
    HireDate date,
    Salary decimal(7,2)
);

-- Course Table
create table Courses (
    CourseID int PRIMARY KEY,
    CourseName varchar(25),
    Credits int
);

-- Enrollment Table 
create table Enrollment (
    EnrollID int PRIMARY KEY,
    StudentID int,
    CourseID int,
    Grade varchar(2),
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

insert into Student values
(1, 'Girish', 'Seervi', '2006-03-12', 'F104', 76, 'Mumbai'),
(2, 'Riyan', 'Shrestha', '2007-11-05', 'F104', 89, 'Delhi'),
(3, 'Aryan', 'Yadav', '2008-07-29', 'F104', 83, 'Bangalore'),
(4, 'Sumuk', 'Ravikumar', '2008-01-21', 'F104', 94, 'Chennai'),
(5, 'Swaroop', 'Gowda', '2007-12-18', 'D212', 78, 'Kolkata'),
(6, 'Deep', 'Paul', '2008-08-30', 'F113', 91, 'Hyderabad'),
(7, 'Aryaman', 'Kanoi', '2007-10-04', 'F112', 87, 'Pune'),
(8, 'Pranav', 'Singh', '2008-02-14', 'F112', 80, 'Coimbatore');

insert into Teacher values
(1, 'Sharath', 'Shetty', 'DBMS', '2020-06-25', 54000),
(2, 'Maneesh', 'Ranjan', 'FDSA', '2022-09-12', 47000),
(3, 'Manish', 'Kumar', 'JAVA', '2018-04-03', 60000),
(4, 'Sasikala', 'J', 'MATHS', '2023-07-19', 49500),
(5, 'Bharath', 'Manchikodi', 'LINUX', '2019-11-27', 51000),
(6, 'Sumitha', 'Suresh', 'ENGLISH', '2018-12-05', 62000);

insert into Courses values
(101, 'Mathematics', 4),
(102, 'English Literature', 3),
(103, 'Science', 4),
(104, 'Social Studies', 3),
(105, 'Computer Science', 3);

insert into Enrollment values
(211, 1, 101, 'A'),
(212, 2, 102, 'A'),
(213, 3, 101, 'B'),
(214, 4, 104, 'C'),
(215, 5, 103, 'F'),
(216, 6, 105, 'A'),
(217, 7, 101, 'B'),
(218, 8, 102, 'A');

-- Display the details  of all students. 
select *from Student;
/*# StudentID	FirstName	LastName	DOB	Class	Marks	City
1	Girish	Seervi	2006-03-12	F104	76	Mumbai
2	Riyan	Shrestha	2007-11-05	F104	89	Delhi
3	Aryan	Yadav	2008-07-29	F104	83	Bangalore
4	Sumuk	Ravikumar	2008-01-21	F104	94	Chennai
5	Swaroop	Gowda	2007 c -12-18	D212	78	Kolkata
6	Deep	Paul	2008-08-30	F113	91	Hyderabad
7	Aryaman	Kanoi	2007-10-04	F112	87	Pune
8	Pranav	Singh	2008-02-14	F112	80	Coimbatore
*/

-- Show the  last 3 characters of course names.
select right(Coursename, 3) from Courses;
-- OUTPUT:
/* 
ics
ure
nce
ies
nce
*/

-- Concatenate FirstName and LastName of teachers as fullname.
select concat(FirstName,LastName) as FullName from Teacher;
-- OUTPUT:
/* 
# FullName
SharathShetty
ManeeshRanjan
ManishKumar
SasikalaJ
BharathManchikodi
SumithaSuresh
*/

-- Find the length of each student’s name.
select StudentID, length(concat(FirstName,LastName)) as namelength 
from Student;
-- OUTPUT
/* 
# StudentID	namelength
1	           12
2	           13
3	           10
4	           14
5	           12
6	           8
7	           12
8	           11
*/

-- Replace the word "Mathematics" with "Maths" in the Course table. (use REPLACE function)
select replace(CourseName, 'Mathematics', 'Maths') from Courses;
-- OUTPUT:
/* 
Maths
English Literature
Science
Social Studies
Computer Science
*/

-- Find the absolute difference between maximum and minimum marks.
select abs(max(marks) - min(marks)) from Student;
-- OUTPUT:
/* 
# abs(max(marks) - min(marks))
18
*/

-- Round off teachers’ salaries to the nearest thousand.
select TeacherID, round(Salary/1000)*1000 As RoundedSalary 
from Teacher;
-- OUTPUT:
/* 
# TeacherID	RoundedSalary
1	54000
2	47000
3	60000
4	50000
5	51000
6	62000
*/

-- Show the square root of each course credit.
select CourseID, sqrt(Credits) from Courses;
-- OUTPUT:
/*   
# CourseID	sqrt(Credits)
101	          2
102    	1.7320508075688772
103           2
104 	1.7320508075688772
105 	1.7320508075688772
*/

-- Display students’ marks along with ceiling and floor values.
select StudentID, Marks, ceil(Marks), floor(Marks) from Student;
-- OUTPUT:
/* 
# StudentID	Marks	ceil(Marks)	floor(Marks)
    1	76	76	76
    2	89	89	89
    3	83	83	83
    4	94	94	94
    5	78	78	78
    6	91	91	91
    7	87	87	87
    8	80	80	80
*/

-- Find the modulus of total marks divided by 5.
select (sum(Marks) % 5) from Student;
-- OUTPUT:
-- 3

-- Display the current date and time.
select now();
-- OUTPUT: 
-- 2025-09-10 12:17:12

-- Show the year and month of hire for all teachers.
select TeacherID, extract(year from HireDate), extract(month from HireDate) 
from Teacher;
-- OUTPUT:
/* 
1	2020	6
2	2022	9
3	2018	4
4	2023	7
5	2019	11
6	2018	12
*/

-- List students who were born in January. 
select * from Student where month(DOB) = 1;
-- OUTPUT:
-- 4	Sumuk	Ravikumar	2008-01-21	F104	94	Chennai

-- Find the difference in days between today and a teacher’s HireDate.
select TeacherID, datediff(current_date, HireDate) from Teacher;
-- OUTPUT:
/* 
1	1903
2	1094
3	2717
4	784
5	2114
6	2471
*/

-- Find the total number of students in the school. 
select count(*) from Student;
-- OUTPUT:
-- 8

-- Calculate the average salary of teachers.
select avg(Salary) from Teacher;
-- OUTPUT:
-- 53916.666667

-- Find the highest and lowest marks in the Student table.
select max(marks), min(marks) from student;
-- OUTPUT:
/* 
# max(marks)	min(marks)
     94	           76
*/