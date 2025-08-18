-- Lab Experiment 01: Implementation of DDL Commands in SQL
-- STUDENT NAME: Girish Kailash      
-- USN: 1RUA24BCA0028
-- SECTION: BCA

SELECT USER(), 
       @@hostname AS Host_Name, 
       VERSION() AS MySQL_Version, 
       NOW() AS Current_Date_Time;
-- OUTPUT : [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- 'root@localhost', 'RVU-PC-055', '9.4.0', '2025-08-18 11:34:35'

-- Scenario: University Course Management System
-- CREATE AND LOAD THE database DBLab001
-- Write your SQL query below Codespace:

create database DBLab001;
use DBLab001;

-- Task 1: Create the Students Table
-- Create a table to store information about students.
-- Include the following columns:
-- 1. StudentID (Primary Key)
-- 2. FirstName
-- 3. LastName
-- 4. Email (Unique Constraint)
-- 5. DateOfBirth

-- Write your SQL query below Codespace:

create table Students
( StudentID varchar(12) primary key,
FirstName varchar(15),
LastName varchar(10),
Email varchar(15) unique,
DateOfBirth date
);

DESC STUDENTS; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]
-- OUTPUT : Disclaimer - This code is not the part of the SQL Code

/*Field  		Type     Null	Key	  Default	Extra
 StudentID   varchar(12)  NO	    PRI		
FirstName   varchar(15)	 YES			
LastName	varchar(10)	 YES			
Email	    varchar(15)	 YES	UNI		
DateOfBirth	 date	     YES	
*/

-- Alter the table and 2 new columns
alter table Students add(Gender varchar(2), age int);
desc Students;

-- Modify a column data type
alter table Students modify Email varchar(20);
desc Students;

-- Rename a column
alter table Students rename column DateOfBirth to DOB;
desc Students;

-- Drop a column
alter table Students drop column age;
desc Students;

-- Rename the table
alter table Student_Details rename to StudentDetails;


-- Task 2: Create the Courses Table
-- Create a table to store information about courses.
-- Include the following columns:
-- - CourseID (Primary Key)
-- - CourseName
-- - Credits

-- Write your SQL query below Codespace:
create table Courses
( CourseID varchar(6) primary key,
CourseName varchar(15),
Credits int); 

desc Courses; -- [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]

-- OUTPUT :
/* Field	Type	   Null	Key	Default	Extra
CourseID	varchar(6)	NO	PRI		
CourseName	varchar(15)	YES			
Credits	         int	YES			
*/

-- Alter the table and add 2 new columns
alter table Courses add(Attendance varchar(2), Department varchar(10));

-- Modify a column data type
alter table Courses modify Attendance varchar(6);

-- Rename a column
alter table Courses rename column Department to DepartmentName;
desc Courses;

-- Drop a column
alter table Courses drop column Attendance;

-- Rename the table
alter table Courses rename to CourseDetails;
desc CourseDetails;



-- Task 3: Create the Enrollments Table
-- Create a table to store course enrollment information.
-- Include the following columns:
-- - EnrollmentID (Primary Key)
-- - StudentID (Foreign Key referencing Students table)
-- - CourseID (Foreign Key referencing Courses table)
-- - EnrollmentDate

-- Write your SQL query below Codespace:
create table enrollments
( EnrollmentID int Primary Key,
StudentID varchar(12),
CourseID varchar(6),
Foreign Key(StudentID) references StudentDetails(StudentID),
Foreign Key(CourseID) references CourseDetails(CourseID),
EnrollmentDate date);


desc enrollments; -- [ [ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ] ]
-- OUTPUT :
/*Field	       Type	    Null  Key	Default	Extra
EnrollmentID	int	     NO	  PRI		
StudentID	varchar(12)	YES	  MUL		
CourseID	varchar(6)	YES	  MUL		
EnrollmentDate	date	YES			
*/

-- Alter the table and 2 new columns
alter table enrollments add( semester varchar(3), status varchar(5));
desc enrollments;

-- Modify a column data type
alter table enrollments modify EnrollmentID varchar(10);

-- Rename a column
alter table enrollments rename column StudentID to USN;

-- Drop a column
alter table enrollments drop semester;

-- Rename the table
alter table enrollments rename to Enrollment_Details;
desc Enrollment_Details;

-- Task 4: Alter the Students Table
-- Add a column 'PhoneNumber' to store student contact numbers.

-- Write your SQL query below Codespace:
alter table StudentDetails add  PhoneNumber int;

desc StudentDetails; -- [[ COPYPASTE OF THE OUTPUT in CSV Format and terminate with ; ]]
-- OUTPUT :
/*# Field	Type	     Null	Key	 Default	Extra
StudentID	varchar(12)	 NO	    PRI		
FirstName	varchar(15)	 YES			
LastName	varchar(10)	 YES			
Email	    varchar(20)	 YES	UNI		
DOB	        date	     YES			
Gender	    varchar(2)	 YES			
PhoneNumber	 int	     YES			
*/


-- Task 5: Modify the Courses Table
-- Change the data type of the 'Credits' column to DECIMAL.
-- Write your SQL query below Codespace:
alter table CourseDetails modify credits decimal;

-- Task 6: Drop Tables

SHOW TABLES; -- Before dropping the table
-- OUTPUT :
/*# Tables_in_dblab001
coursedetails
enrollment_details
studentdetails
*/

-- Drop the 'Courses' and 'Enrollments' tables from the database.
-- Write your SQL query below Codespace:
drop table coursedetails,enrollment_details;

SHOW TABLES; -- After dropping the table Enrollement and Course
-- OUTPUT :
/*# Tables_in_dblab001
studentdetails
*/

-- End of Lab Experiment 01
-- Upload the Completed worksheet in the google classroom with file name USN _ LabExperiment01
