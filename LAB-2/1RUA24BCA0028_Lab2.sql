-- Lab Experiment 02: Implementation of DDL Commands in SQL for the given scenarios
-- STUDENT NAME: Girish Kailash
-- USN: 1RUA24BCA0028
-- SECTION: BCA

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- root@localhost, RVU-PC-058, 9.4.0, 2025-08-25 11:24:42

-- Scenario: College Student Management System

-- CREATE AND LOAD THE database
-- Write your SQL query below Codespace:

create database DBLab002;
use DBLab002;

-- Task 1: Create the Tables under this system (min 5 tables)
  -- Table 01: Departments ( DepartmentID, DepartmentName, HOD,ContactEmail,PhoneNumber,Location )
  -- Table 02: Course (CourseID, CourseName,Credits,DepartmentID,Duration,Fee )
  -- Table 03: Students (StudentID,FirstName,LastName,Email,DateOfBirth,CourseID)
  -- Table 04: Faculty FacultyID,FacultyName,DepartmentID,Qualification,Email,PhoneNumber)
  -- Table 05: Enrollments (  EnrollmentID,StudentID,CourseID,Semester,Year,Grade)
-- Specify the Key (Primary and Foreign) for each table while creating


-- Write your SQL query below Codespace:

create table Departments
( DepartmentID int primary key,
DepartmentName varchar(15),
HOD varchar(10),
ContactEmail varchar(20),
PhoneNumber int,
Location varchar(15));

create table Course
( CourseID varchar(5) primary key,
CourseName varchar(15),
Credits int,
DepartmentID int,
Foreign Key(DepartmentID) references Departments(DepartmentID),
Duration varchar(5),
Fee int);

create table Students
( StudentID varchar(12) primary key,
FirstName varchar(10),
LastName varchar(10),
Email varchar(20),
DateOfBirth date,
CourseID varchar(5),
Foreign Key(CourseID) references Course(CourseID));

create table Faculty
( FacultyID varchar(12) primary key,
FacultyName varchar(15),
DepartmentID int,
Foreign Key(DepartmentID) references Departments(DepartmentID),
Qualification varchar(15),
Email varchar(20),
PhoneNumber int);

create table Enrollments
( EnrollmentID varchar(10) primary key,
StudentID varchar(12),
CourseID varchar(5),
Foreign Key(StudentID) references Students(StudentID),
Foreign Key(CourseID) references Course(CourseID),
Semester int,
Year int,
Grade numeric);


-- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

--  describe the structure of each table and copy paste the Output 
desc Departments;
/*DepartmentID	int	NO	PRI		
DepartmentName	varchar(15)	YES			
HOD	varchar(10)	YES			
ContactEmail	varchar(20)	YES			
PhoneNumber	int	YES			
Location	varchar(15)	YES			
*/

desc Course;
/*CourseID	varchar(5)	NO	PRI		
CourseName	varchar(15)	YES			
Credits	int	YES			
DepartmentID	int	YES	MUL		
Duration	varchar(5)	YES			
Fee	int	YES			
*/

desc Students;
/*StudentID	varchar(12)	NO	PRI		
FirstName	varchar(10)	YES			
LastName	varchar(10)	YES			
Email	varchar(20)	YES			
DateOfBirth	date	YES			
CourseID	varchar(5)	YES	MUL		
*/

desc Faculty;
/*FacultyID	varchar(12)	NO	PRI		
FacultyName	varchar(15)	YES			
DepartmentID	int	YES	MUL		
Qualification	varchar(15)	YES			
Email	varchar(20)	YES			
PhoneNumber	int	YES			
*/

desc Enrollments;
/*EnrollmentID	varchar(10)	NO	PRI		
StudentID	varchar(12)	YES	MUL		
CourseID	varchar(5)	YES	MUL		
Semester	int	YES			
Year	int	YES			
Grade	decimal(10,0)	YES			
*/

-- Perform the following operations on the each of the tables

-- 01: add 2 new columns for each table
alter table Departments add( Manager varchar(15), EstablishedYear int);
alter table Course add(Syllabus varchar(25), Instructor varchar(20));
alter table Students add(Gender varchar(5), Address varchar(25));
alter table Faculty add(DepartmentName varchar(20), JoiningDate date);
alter table Enrollments add(EnrollmentDate date, Status varchar(10));
 
-- 02: Modify the existing column from each table
alter table Departments modify HOD varchar(20);
alter table Course modify Duration varchar(10);
alter table Students modify FirstName varchar(15);
alter table Faculty modify FacultyName varchar(20);
alter table Enrollments modify Grade decimal(2,2);

-- 03 change the datatypes
alter table Course modify fee decimal(10,2);
alter table Faculty modify PhoneNumber varchar(15);

-- 04: Rename a column
alter table Students rename column DateOfBirth to DOB;

-- 05: Drop a column
alter table Departments drop column PhoneNumber;

-- 06: Rename the table
alter table Students rename to StudentDetails;

-- 07: describe the structure of the new table
desc StudentDetails;

-- Output:
/*StudentID	varchar(12)	NO	PRI		
FirstName	varchar(15)	YES			
LastName	varchar(10)	YES			
Email	varchar(20)	YES			
DOB	date	YES			
CourseID	varchar(5)	YES	MUL		
Gender	varchar(5)	YES			
Address	varchar(25)	YES			
*/

--  Additional set of questions 
-- 1 Add a new column Address (VARCHAR(100)) to the Students table.
-- done

-- 2 Add a column Gender (CHAR(1)) to the Students table.
-- done

-- 3 Add a column JoiningDate (DATE) to the Faculty table.
-- done

-- 4 Modify the column CourseName in the Courses table to increase its size from VARCHAR(50) to VARCHAR(100).
alter table Course modify CourseName varchar(100); 

-- 5 Modify the column Location in the Departments table to VARCHAR(80).
alter table Departments modify Location varchar(80);

-- 6 Rename the column Qualification in the Faculty table to Degree.
alter table Faculty rename column Qualification to Degree;

-- 7 Rename the table Faculty to Teachers.
alter table Faculty rename to Teachers;

-- 8 Drop the column PhoneNumber from the Departments table.
-- done 

-- 9 Drop the column Email from the Students table.
alter table StudentDetails drop column Email;

-- 10 Drop the column Duration from the Courses table.
alter table Course drop column Duration;


SHOW TABLES; -- Before dropping the table
-- OUTPUT:
/*course
departments
enrollments
studentdetails
teachers
*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table Enrollments;
-- cant drop courses table because it has a foreign key constraint

SHOW TABLES; -- After dropping the table Enrollement and Course
-- OUTPUT:
/*course
departments
studentdetails
teachers
*/
-- Note: Perform the specified operations on all the 5 tables in the system
-- End of Lab Experiment 02
-- Upload the Completed worksheet in the google classroom with file name USN _ LabScenario01