create database Student_Marks;
use Student_Marks;

create table Students(
  USN varchar(12) Primary Key,
  Name varchar(20),
  Age int,
  Course varchar(10),
  M1 int,
  M2 int,
  M3 int
);

insert into Students values
('1RUA24BCA028','Girish',18,'BCA',79,85,69),
('1RUA24BCA041','Aryan',17,'BCA',34,55,100),
('1RUA24BBA025','Riyan',18,'BBA',82,78,94),
('1RUA24BBA089','Swarop',18,'BCA',32,35,41),
('1RUA24BCA086','Sumukh',19,'BCA',38,79,07),
('1RUA24CSC025','Deep',20,'BSc',78,69,85),
('1RUA24CSC032','Indranil',21,'BSc',88,99,95),
('1RUA24BBA088','Avani',19,'BBA',88,92,100),
('1RUA24BBA081','OJAL',21,'BBA',85,95,19),
('1RUA24BBA041','Piyush',17,'BBA',17,19,28);

alter table Students 
add Total int, 
add Avg numeric, 
add Result varchar(10);

update Students set Total = M1 + M2 + M3;
alter table Students modify Avg Decimal(10,2);
update Student set Avg = Total / 3.0;

update Students set Result = 'Pass'
where M1 >= 35 AND 
      M2 >= 35 AND 
      M3 >= 35;

update Students set Result = 'Fail'
where M1 <= 35 AND 
      M2 <= 35 AND
      M3 <= 35;
      
select * from Student;

/*OUTPUT:
# USN	Name	Age	Course	M1	M2	M3	Total	Avg	Result
1RU24BBA025	Riyan	18	BBA	82	78	94	254	84.67	Pass
1RU24BBA041	Piyush	17	BBA	17	19	28	64	21.33	Fail
1RU24BBA081	OJAL	21	BBA	85	95	19	199	66.33	
1RU24BBA088	Avani	19	BBA	88	92	100	280	93.33	Pass
1RU24BBA089	Swarop	18	BCA	32	35	41	108	36.00	
1RU24BCA028	Girish	18	BCA	79	85	69	233	77.67	Pass
1RU24BCA041	Aryan	17	BCA	34	55	100	189	63.00	
1RU24BCA086	Sumukh	19	BCA	38	79	7	124	41.33	
1RU24CSC025	Deep	20	BSc	78	69	85	232	77.33	Pass
1RU24CSC032	Indranil	21	BSc	88	99	95	282	94.00	Pass
*/
