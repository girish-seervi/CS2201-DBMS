create database School1;
use School1;
create table student
( USN varchar(15),
name varchar(15),
age int,
m1 int,
m2 int);
create table staff
( name varchar(15),
age int,
designation varchar(20),
salary int);
create table course
( coursecode varchar(10),
coursename varchar(20),
credits int);
create table classrooms
( classnum int,
buildingname varchar(5),
capacity int);
desc classrooms;
alter table classrooms modify buildingname varchar(10);
alter table student
add ( total int,
average numeric(5,2));
desc student;
