create database project;
use project;

drop table Enroll;
drop table Attendance;
drop table Student;
create table Student (
st_ID int primary key,
st_firstname varchar(50),
st_lastname varchar(50),
st_GPA decimal(4,3),
level_ID int,
level_name varchar(50),
st_birthdate date,
faculty_name varchar(100)
);
insert into Student
(st_ID, st_firstname, st_lastname, st_GPA, level_ID, level_name, st_birthdate, faculty_name)
values
(1, 'Reem', 'Magdy', 3.345, 2, 'Level Two', '2006-07-21', 'Faculty of Computers and Artificial Intelligence'),
(2, 'Mai', 'Elgendy', 2.560, 2, 'Level Two', '2006-03-14', 'Faculty of Computers and Artificial Intelligence'),
(3, 'Ahmed', 'Abdelsalam', 1.987, 3, 'Level Three', '2005-12-12', 'Faculty of Computers and Artificial Intelligence'),
(4, 'Nour', 'Ahmed', 3.780, 2, 'Level Two', '2006-05-08', 'Faculty of Computers and Artificial Intelligence'),
(5, 'Maha', 'Omran', 2.180, 3, 'Level Three', '2005-07-29', 'Faculty of Computers and Artificial Intelligence'),
(6, 'Ahmed', 'Aantar', 1.537, 3, 'Level Three', '2005-11-17', 'Faculty of Computers and Artificial Intelligence'),
(7, 'Mariam', 'Kamal', 4.000, 2, 'Level Two', '2006-03-13', 'Faculty of Computers and Artificial Intelligence'),
(8, 'Amr', 'Sameeh', 2.847, 3, 'Level Three', '2005-08-08', 'Faculty of Computers and Artificial Intelligence'),
(9, 'Emad', 'Ali', 2.924, 2, 'Level Two', '2006-05-25', 'Faculty of Computers and Artificial Intelligence'),
(10, 'Hadeer', 'Abdo', 3.678, 3, 'Level Three', '2004-08-02', 'Faculty of Computers and Artificial Intelligence'),
(11, 'Noha', 'Gamal', 2.924, 2, 'Level Two', '2006-05-25', 'Faculty of Computers and Artificial Intelligence'),
(12, 'Anas', 'Hazem', 4.000, 2, 'Level Two', '2006-05-13', 'Faculty of Computers and Artificial Intelligence'),
(13, 'Mohamed', 'Khalil', 0.019, 2, 'Level Two', '2006-08-28', 'Faculty of Computers and Artificial Intelligence'),
(14, 'Bishoy', 'Hani', 1.687, 2, 'Level Two', '2006-07-07', 'Faculty of Computers and Artificial Intelligence'),
(15, 'Sarah', 'Salem', 2.871, 2, 'Level Two', '2006-09-26', 'Faculty of Computers and Artificial Intelligence'),
(16, 'Yasmin', 'Osama', 3.567, 2, 'Level Two', '2006-04-13', 'Faculty of Computers and Artificial Intelligence'),
(17, 'Hazem', 'Said', 1.037, 3, 'Level Three', '2004-09-22', 'Faculty of Computers and Artificial Intelligence'),
(18, 'Alaa', 'Fahmy', 3.800, 2, 'Level Two', '2007-01-09', 'Faculty of Computers and Artificial Intelligence'),
(19, 'Hamza', 'Hamdy', 3.996, 2, 'Level Two', '2006-05-01', 'Faculty of Computers and Artificial Intelligence'),
(20, 'Malak', 'Aaser', 0.752, 3, 'Level Three', '2005-01-27', 'Faculty of Computers and Artificial Intelligence'),
(21, 'Nada', 'Zaher', 4.000, 2, 'Level Two', '2006-02-21', 'Faculty of Computers and Artificial Intelligence'),
(22, 'Tamer', 'Ismail', 3.250, 2, 'Level Two', '2005-12-28', 'Faculty of Computers and Artificial Intelligence'),
(23, 'Amany', 'Yasser', 2.102, 2, 'Level Two', '2006-06-12', 'Faculty of Computers and Artificial Intelligence'),
(24, 'Saif', 'Tamer', 4.000, 2, 'Level Two', '2006-02-01', 'Faculty of Computers and Artificial Intelligence'),
(25, 'Tarek', 'Mahmoud', 2.980, 2, 'Level Two', '2006-10-06', 'Faculty of Computers and Artificial Intelligence'),
(26, 'Jovana', 'Goubran', 3.300, 2, 'Level Two', '2005-11-11', 'Faculty of Computers and Artificial Intelligence'),
(27, 'Tia', 'Mohamed', 2.500, 2, 'Level Two', '2006-07-17', 'Faculty of Computers and Artificial Intelligence'),
(28, 'Ali', 'Tawfik', 0.427, 2, 'Level Two', '2006-10-02', 'Faculty of Computers and Artificial Intelligence'),
(29, 'Youssef', 'Ahmed', 4.000, 2, 'Level Two', '2005-12-12', 'Faculty of Computers and Artificial Intelligence'),
(30, 'Kholoud', 'Samir', 1.620, 3, 'Level Three', '2004-08-20', 'Faculty of Computers and Artificial Intelligence');
select * from Student;
select st_firstname, st_lastname from Student;

select * from Student
where st_GPA >= 3.000;

select * from Student
where st_GPA <= 2.000;

update Student 
set st_GPA = 1.800
where st_ID=003;

select * from Student
where level_name = 'Level Three';

alter table Student add email varchar(100);
alter table Student drop column email;

select * from Student where st_GPA >=1.000 and level_ID=03;
select * from Student where not level_ID=02;

select min(st_GPA) from Student;
select max(st_GPA) from Student;
select count(*) from Student;
select avg(st_GPA) from Student;
select sum(st_GPA) from Student;

select * from Student where st_firstname like 'M%';

select * from Student where level_ID in (2, 3);

select * from Student where st_GPA between 3.000 and 4.000;

select st_firstname as FirstName, st_GPA as GPA from Student;

select level_name, max(st_GPA) as MAX_GPA
from Student
group by level_name
having max(st_GPA) > 3.0;

drop table Course;
create table Course (
  course_code varchar(50) primary key,
  course_name varchar(50),
  credit_hrs int,
  Dr_ID int,
  Dr_name varchar(50)
);
insert into Course 
(course_code , course_name, credit_hrs, Dr_ID, Dr_name)
values
('SW212', 'Software Engineering', 3, 12024, 'Dr.Eman Salah'),
('MT110', 'Math3', 3, 12025, 'Dr.Ahmed Fathy'),
('CR011', 'Math0', 0, 12026, 'Dr.Ahmed Sobhy'),
('CS202', 'Data Structure', 4, 12027, 'Dr.Heba Askar'),
('DB102', 'Database Management', 3, 12028, 'Dr.Mohamed Badawy'),
('CP200', 'Advanced Programming', 4, 12026, 'Dr.Ahmed Sobhy'),
('DS310', 'DSP', 3, 12025, 'Dr.Ahmed Fathy'),
('LD222', 'Logic Design', 3, 12029, 'Dr.Sahar Mohamed'),
('OP270', 'Operating System', 4, 12024, 'Dr.Eman Salah');

select * from Course
where Dr_ID=12025;

select * from Course 
where course_name like 'D%';

select * from Course 
where credit_hrs=4;

select * from Course 
where credit_hrs=3;

select * from Course 
where credit_hrs=0;

select * from Course
where Dr_name like 'Dr.Eman Salah';

select * from Course
where Dr_name like 'Dr.Ahmed Fathy';

select * from Course
where Dr_name like 'Dr.Ahmed Sobhy';

select * from Course
where Dr_name like 'Dr.Heba Askar';

select * from Course
where Dr_name like 'Dr.Mohamed Badawy';

select * from Course
where Dr_name like 'Dr.Sahar Mohamed';

create table Enroll (
    st_ID int,
    course_code varchar(50),

    primary key (st_ID, course_code),

    foreign key (st_ID) references Student(st_ID),
    foreign key (course_code) references Course(course_code)
);
insert into Enroll
(st_Id , course_code)
values
(001,'SW212'),(001,'MT110'),(001,'CS202'),(001,'LD222'),(001,'DB102'),
(002,'SW212'),(002,'MT110'),(002,'CS202'),(002,'LD222'),(002,'DB102'),(002,'CR011'),
(003,'CR011'),(003,'DS310'),(003,'CS202'),(003,'MT110'),
(004,'SW212'),(004,'MT110'),(004,'CS202'),(004,'LD222'),
(005,'OP270'),(005,'DS310'),(005,'CR011'),
(006,'OP270'),(006,'CS202'),
(007,'SW212'),(007,'MT110'),(007,'CS202'),(007,'DB102'),
(008,'DS310'),(008,'CS202'),
(009,'SW212'),(009,'CS202'),(009,'LD222'),
(010,'OP270'),(010,'DS310'),
(011,'SW212'),(011,'MT110'),(011,'CR011'),
(012,'SW212'),(012,'CS202'),(012,'DB102'),
(013,'SW212'),(013,'MT110'),
(014,'CS202'),(014,'LD222'),
(015,'SW212'),(015,'CR011'),
(016,'SW212'),(016,'MT110'),(016,'DB102'),
(017,'OP270'),(017,'CR011'),
(018,'SW212'),(018,'CS202'),
(019,'SW212'),(019,'MT110'),(019,'CS202'),(019,'LD222'),
(020,'DS310'),(020,'CS202'),
(021,'SW212'),(021,'CS202'),(021,'DB102'),
(022,'SW212'),(022,'MT110'),
(023,'SW212'),(023,'CS202'),
(024,'SW212'),(024,'MT110'),(024,'CS202'),
(025,'CS202'),(025,'LD222'),
(026,'SW212'),(026,'CR011'),
(027,'SW212'),(027,'MT110'),
(028,'SW212'),
(029,'SW212'),(029,'CS202'),
(030,'OP270'),(030,'DS310');
select * from Enroll
where course_code like 'DS310';
select * from Enroll
where course_code like 'SW212';
select * from Enroll
where course_code like 'CR011';
select * from Enroll
where course_code like 'MT110';
select * from Enroll 
where course_code like 'OP270';
select * from Enroll 
where course_code like 'DB102';
select * from Enroll
where course_code like 'CS202';
select * from Enroll
where course_code like 'CP200';
select * from Enroll 
where course_code like 'LD222'; 

--students who enroll specific course
select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'DS310';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'SW212';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'CR011';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'MT110';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'OP270';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'DB102';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'CS202';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'CP200';

select s.st_firstname, s.st_lastname
from Student s
join Enroll e on s.st_ID = e.st_ID
where e.course_code = 'LD222';

--number of students who enrolled each course
select course_code, count(st_ID) as total_students
from Enroll 
group by course_code;

--courses that've enrolled by an individual student
select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 001;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 002;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 003;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 004;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 005;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 006;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 007;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 008;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 009;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 010;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 011;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 012;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 013;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 014;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 015;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 016;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 017;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 018;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 019;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 020;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 021;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 022;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 023;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 024;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 025;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 026;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 027;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 028;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 029;

select c.course_name
from Course c
join Enroll e on c.course_code = e.course_code
where e.st_ID = 030;


--Attendance Table 

create table Attendance (
    st_ID int,
	st_firstname varchar(50),
	st_lastname varchar(50),
    course_code varchar(50),
	course_name varchar(50),
    att_date date,
    status bit,
    primary key (st_ID, course_code, att_date),
    foreign key (st_ID) references Student(st_ID),
    foreign key (course_code) references Course(course_code)
);

insert into Attendance 
(st_ID, st_firstname, st_lastname, course_code, course_name ,att_date,status)
values
(001, 'Reem', 'Magdy', 'SW212', 'Software Engineering', '2025-12-07', 1),
(001, 'Reem', 'Magdy', 'MT110', 'Math3', '2025-12-07', 1),
(001, 'Reem', 'Magdy', 'CS202', 'Data Structure', '2025-12-07', 0),
(001, 'Reem', 'Magdy', 'LD222', 'Logic Design', '2025-12-07', 1),
(001, 'Reem', 'Magdy', 'DB102', 'Database Management', '2025-12-07', 1),

(002, 'Mai', 'Elgendy', 'SW212', 'Software Engineering', '2025-12-07', 1),
(002, 'Mai', 'Elgendy', 'MT110', 'Math3', '2025-12-07', 0),
(002, 'Mai', 'Elgendy', 'CS202', 'Data Structure', '2025-12-07', 1),
(002, 'Mai', 'Elgendy', 'LD222', 'Logic Design', '2025-12-07', 1),
(002, 'Mai', 'Elgendy', 'DB102', 'Database Management', '2025-12-07', 0),
(002, 'Mai', 'Elgendy', 'CR011', 'Math0', '2025-12-07', 1),

(003, 'Ahmed', 'Abdelsalam', 'CR011', 'Math0', '2025-12-07', 1),
(003, 'Ahmed', 'Abdelsalam', 'DS310', 'DSP', '2025-12-07', 1),
(003, 'Ahmed', 'Abdelsalam', 'CS202', 'Data Structure', '2025-12-07', 0),
(003, 'Ahmed', 'Abdelsalam', 'MT110', 'Math3', '2025-12-07', 1),

(004, 'Nour', 'Ahmed', 'SW212', 'Software Engineering', '2025-12-07', 1),
(004, 'Nour', 'Ahmed', 'MT110', 'Math3', '2025-12-07', 1),
(004, 'Nour', 'Ahmed', 'CS202', 'Data Structure', '2025-12-07', 1),
(004, 'Nour', 'Ahmed', 'LD222', 'Logic Design', '2025-12-07', 0),

(005, 'Maha', 'Omran', 'OP270', 'Operating System', '2025-12-07', 1),
(005, 'Maha', 'Omran', 'DS310', 'DSP', '2025-12-07', 0),
(005, 'Maha', 'Omran', 'CR011', 'Math0', '2025-12-07', 1),

(006, 'Ahmed', 'Aantar', 'OP270', 'Operating System', '2025-12-07', 1),
(006, 'Ahmed', 'Aantar', 'CS202', 'Data Structure', '2025-12-07', 0),

(007, 'Mariam', 'Kamal', 'SW212', 'Software Engineering', '2025-12-07', 1),
(007, 'Mariam', 'Kamal', 'MT110', 'Math3', '2025-12-07', 1),
(007, 'Mariam', 'Kamal', 'CS202', 'Data Structure', '2025-12-07', 1),
(007, 'Mariam', 'Kamal', 'DB102', 'Database Management', '2025-12-07', 0),

(008, 'Amr', 'Sameeh', 'DS310', 'DSP', '2025-12-07', 1),
(008, 'Amr', 'Sameeh', 'CS202', 'Data Structure', '2025-12-07', 1),

(009, 'Emad', 'Ali', 'SW212', 'Software Engineering', '2025-12-07', 0),
(009, 'Emad', 'Ali', 'CS202', 'Data Structure', '2025-12-07', 1),
(009, 'Emad', 'Ali', 'LD222', 'Logic Design', '2025-12-07', 1),

(010, 'Hadeer', 'Abdo', 'OP270', 'Operating System', '2025-12-07', 1),
(010, 'Hadeer', 'Abdo', 'DS310', 'DSP', '2025-12-07', 0),

(011, 'Noha', 'Gamal', 'SW212', 'Software Engineering', '2025-12-07', 1),
(011, 'Noha', 'Gamal', 'MT110', 'Math3', '2025-12-07', 1),
(011, 'Noha', 'Gamal', 'CR011', 'Math0', '2025-12-07', 0),

(012, 'Anas', 'Hazem', 'SW212', 'Software Engineering', '2025-12-07', 1),
(012, 'Anas', 'Hazem', 'CS202', 'Data Structure', '2025-12-07', 1),
(012, 'Anas', 'Hazem', 'DB102', 'Database Management', '2025-12-07', 0),

(013, 'Mohamed', 'Khalil', 'SW212', 'Software Engineering', '2025-12-07', 1),
(013, 'Mohamed', 'Khalil', 'MT110', 'Math3', '2025-12-07', 0),

(014, 'Bishoy', 'Hani', 'CS202', 'Data Structure', '2025-12-07', 1),
(014, 'Bishoy', 'Hani', 'LD222', 'Logic Design', '2025-12-07', 0),

(015, 'Sarah', 'Salem', 'SW212', 'Software Engineering', '2025-12-07', 1),
(015, 'Sarah', 'Salem', 'CR011', 'Math0', '2025-12-07', 0),

(016, 'Yasmin', 'Osama', 'SW212', 'Software Engineering', '2025-12-07', 1),
(016, 'Yasmin', 'Osama', 'MT110', 'Math3', '2025-12-07', 1),
(016, 'Yasmin', 'Osama', 'DB102', 'Database Management', '2025-12-07', 0),

(017, 'Hazem', 'Said', 'OP270', 'Operating System', '2025-12-07', 1),
(017, 'Hazem', 'Said', 'CR011', 'Math0', '2025-12-07', 0),

(018, 'Alaa', 'Fahmy', 'SW212', 'Software Engineering', '2025-12-07', 1),
(018, 'Alaa', 'Fahmy', 'CS202', 'Data Structure', '2025-12-07', 0),

(019, 'Hamza', 'Hamdy', 'SW212', 'Software Engineering', '2025-12-07', 1),
(019, 'Hamza', 'Hamdy', 'MT110', 'Math3', '2025-12-07', 1),
(019, 'Hamza', 'Hamdy', 'CS202', 'Data Structure', '2025-12-07', 0),
(019, 'Hamza', 'Hamdy', 'LD222', 'Logic Design', '2025-12-07', 1),

(020, 'Malak', 'Aaser', 'DS310', 'DSP', '2025-12-07', 1),
(020, 'Malak', 'Aaser', 'CS202', 'Data Structure', '2025-12-07', 0),

(021, 'Nada', 'Zaher', 'SW212', 'Software Engineering', '2025-12-07', 1),
(021, 'Nada', 'Zaher', 'CS202', 'Data Structure', '2025-12-07', 1),
(021, 'Nada', 'Zaher', 'DB102', 'Database Management', '2025-12-07', 0),

(022, 'Tamer', 'Ismail', 'SW212', 'Software Engineering', '2025-12-07', 1),
(022, 'Tamer', 'Ismail', 'MT110', 'Math3', '2025-12-07', 0),

(023, 'Amany', 'Yasser', 'SW212', 'Software Engineering', '2025-12-07', 1),
(023, 'Amany', 'Yasser', 'CS202', 'Data Structure', '2025-12-07', 0),

(024, 'Saif', 'Tamer', 'SW212', 'Software Engineering', '2025-12-07', 1),
(024, 'Saif', 'Tamer', 'MT110', 'Math3', '2025-12-07', 1),
(024, 'Saif', 'Tamer', 'CS202', 'Data Structure', '2025-12-07', 0),

(025, 'Tarek', 'Mahmoud', 'CS202', 'Data Structure', '2025-12-07', 1),
(025, 'Tarek', 'Mahmoud', 'LD222', 'Logic Design', '2025-12-07', 0),

(026, 'Jovana', 'Goubran', 'SW212', 'Software Engineering', '2025-12-07', 1),
(026, 'Jovana', 'Goubran', 'CR011', 'Math0', '2025-12-07', 0),

(027, 'Tia', 'Mohamed', 'SW212', 'Software Engineering', '2025-12-07', 1),
(027, 'Tia', 'Mohamed', 'MT110', 'Math3', '2025-12-07', 0),

(028, 'Ali', 'Tawfik', 'SW212', 'Software Engineering', '2025-12-07', 1),

(029, 'Youssef', 'Ahmed', 'SW212', 'Software Engineering', '2025-12-07', 0),
(029, 'Youssef', 'Ahmed', 'CS202', 'Data Structure', '2025-12-07', 1),

(030, 'Kholoud', 'Samir', 'OP270', 'Operating System', '2025-12-07', 1),
(030, 'Kholoud', 'Samir', 'DS310', 'DSP', '2025-12-07', 0);

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Software Engineering';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Math3';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Math0';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Data Structure';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Database Management';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Advanced Programming';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'DSP';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Logic Design';

select 
st_ID,
st_firstname,
st_lastname,
course_code,
course_name,
att_date,
case
when status = 1 then 'present'
else 'absent'
end as status_text
from Attendance
where course_name = 'Operating System';
--select * from Attendance 

--classroom Table
drop table Classroom_Student;
drop table Classroom;
create table Classroom (
    class_ID int primary key,
	Dr_ID int,
    course_code varchar(50),
    course_name varchar(50),
    buildingNo varchar(50),
	Dr_name varchar(100),
    lecture_cancelled bit default 0
);
insert into Classroom 
(class_ID, course_code, course_name, buildingNo, lecture_cancelled, Dr_ID , Dr_name)
values
(1, 'SW212', 'Software Engineering', 'B1', 1, 12024 , 'Eman Salah' ),
(2, 'MT110', 'Math3', 'B2', 1, 12025 , 'Ahmed Fathy' ),
(3, 'CR011', 'Math0', 'B1', 0, 12026 , 'Ahmed Sobhy'),
(4, 'CS202', 'Data Structure', 'B3', 1, 12027 , 'Heba Askar' ),
(5, 'DB102', 'Database Management', 'B2', 0, 12028, 'Mohamed Badawy'),
(6, 'CP200', 'Advanced Programming', 'B4', 0, 12026, 'Ahmed Sobhy'),
(7, 'DS310', 'DSP', 'B3', 0, 12025, 'Ahmed Fathy'),
(8, 'LD222', 'Logic Design', 'B1', 0, 12029, 'Sahar Mohamed'),
(9, 'OP270', 'Operating System', 'B2', 0, 12024, 'Eman Salah');
select 
    class_ID,
    course_code,
    course_name,
    buildingNo,
    case 
        when lecture_cancelled = 1 then 'Lecture is cancelled'
        else 'Lecture is not cancelled'
    end as lecture_status
from Classroom;


select 
    class_ID,
    course_code,
    course_name,
    buildingNo,
    case 
        when lecture_cancelled = 1 then 'Lecture is cancelled'
        else 'Lecture is not cancelled'
    end as lecture_status
from Classroom where lecture_cancelled = 1;

select 
    class_ID,
    course_code,
    course_name,
    buildingNo,
    case 
        when lecture_cancelled = 1 then 'Lecture is cancelled'
        else 'Lecture is not cancelled'
    end as lecture_status
from Classroom where buildingNo like 'B1';

select 
    class_ID,
    course_code,
    course_name,
    buildingNo,
    case 
        when lecture_cancelled = 1 then 'Lecture is cancelled'
        else 'Lecture is not cancelled'
    end as lecture_status
from Classroom where buildingNo like 'B2';

select 
    class_ID,
    course_code,
    course_name,
    buildingNo,
    case 
        when lecture_cancelled = 1 then 'Lecture is cancelled'
        else 'Lecture is not cancelled'
    end as lecture_status
from Classroom where buildingNo like 'B3' and lecture_cancelled = 0;

select 
    class_ID,
    course_code,
    course_name,
    buildingNo,
    case 
        when lecture_cancelled = 1 then 'Lecture is cancelled'
        else 'Lecture is not cancelled'
    end as lecture_status
from Classroom where buildingNo like 'B4';

create table Classroom_Student(
class_ID int,
st_ID int,
primary key (class_ID, st_ID),
foreign key (class_ID) references Classroom(class_ID),
foreign key (st_ID) references Student(st_ID)
);

INSERT INTO Classroom_Student
(class_ID, st_ID)
VALUES
-- Class 1 (SW212)
(1,001),(1,002),(1,003),(1,004),(1,005),(1,006),(1,007),(1,008),

-- Class 2 (MT110)
(2,001),(2,002),(2,004),(2,007),(2,009),(2,011),(2,012),(2,013),

-- Class 3 (CR011)
(3,003),(3,005),(3,006),(3,010),(3,014),(3,015),

-- Class 4 (CS202)
(4,001),(4,002),(4,004),(4,007),(4,009),(4,012),(4,016),(4,018),

-- Class 5 (DB102)
(5,007),(5,011),(5,012),(5,016),(5,019),(5,021),

-- Class 6 (CP200)
(6,003),(6,006),(6,010),(6,017),(6,020),

-- Class 7 (DS310)
(7,003),(7,005),(7,008),(7,010),(7,017),(7,020),(7,030),

-- Class 8 (LD222)
(8,001),(8,004),(8,009),(8,014),(8,019),(8,025),

-- Class 9 (OP270)
(9,005),(9,006),(9,010),(9,017),(9,020),(9,030);

alter table Classroom
add foreign key (Dr_ID) references Doctor(Dr_ID);

alter table Classroom
add foreign key (course_code) references Course(course_code);

select * from Classroom_Student;
select * from Classroom_Student
where class_ID=1;

select * from Classroom_Student
where class_ID=2;

select * from Classroom_Student
where class_ID=3;

select * from Classroom_Student
where class_ID=4;

select * from Classroom_Student
where class_ID=5;

select * from Classroom_Student
where class_ID=6;

select * from Classroom_Student
where class_ID=7;

select * from Classroom_Student
where class_ID=8;

select * from Classroom_Student
where class_ID=9;

--Schedule Table 

drop table Schedule;

create table Schedule(
schedule_ID int ,
course_code varchar(50),
course_name varchar(50),
class_ID int,
day varchar(15),
start_time varchar(10),
end_time varchar(10), 
Dr_ID int,
primary key (schedule_ID , course_code),
foreign key (class_ID) references Classroom(class_ID),
foreign key (course_code) references Course(course_code),
foreign key(Dr_ID) references Doctor(Dr_ID)
);
insert into Schedule 
(schedule_ID, course_code, course_name, class_ID, day, start_time, end_time, Dr_ID)
values
(1, 'SW212', 'Software Engineering', 1, 'Saturday', '09:00', '11:00', 12024),
(2, 'SW212', 'Software Engineering', 1, 'Monday',   '11:00', '01:00', 12024),

(1, 'MT110', 'Math3', 2, 'Sunday',  '10:00', '12:00', 12025),
(2, 'MT110', 'Math3', 2, 'Tuesday', '12:00', '02:00', 12025),

(1, 'CS202', 'Data Structure', 4, 'Sunday',   '09:00', '11:00', 12026),
(2, 'CS202', 'Data Structure', 4, 'Thursday', '11:00', '01:00', 12026),

(1, 'DB102', 'Database Management', 5, 'Monday',   '10:00', '12:00', 12027),
(2, 'DB102', 'Database Management', 5, 'Thursday', '12:00', '02:00', 12027),

(1, 'CP200', 'Advanced Programming', 6, 'Saturday', '11:00', '01:00', 12028),
(2, 'CP200', 'Advanced Programming', 6, 'Tuesday',  '01:00', '03:00', 12028),

(1, 'DS310', 'DSP', 7, 'Sunday',   '02:00', '04:00', 12029),
(2, 'DS310', 'DSP', 7, 'Wednesday','12:00', '02:00', 12029),

(1, 'LD222', 'Logic Design', 8, 'Monday',   '09:00', '11:00', 12024),
(2, 'LD222', 'Logic Design', 8, 'Thursday', '01:00', '03:00', 12024),

(1, 'OP270', 'Operating System', 9, 'Tuesday',  '10:00', '12:00', 12025),
(2, 'OP270', 'Operating System', 9, 'Saturday', '12:00', '02:00', 12025);
select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID;

select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID
where day like 'Saturday';

select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID
where day like 'Sunday'

select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID
where day like 'Monday'

select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID
where day like 'Tuesday'

select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID
where day like 'Wednesday'

select 
    S.schedule_ID,
    S.course_name,
    S.day,
    S.start_time,
    S.end_time,
    D.Dr_name
from Schedule S
JOIN Doctor D
on S.Dr_ID = D.Dr_ID
where day like 'Thursday'

--Project Table 

drop table Project;
create table Project (
    course_code varchar(50),
	course_name varchar(50),
    project_name varchar(100),
    deadline date,
    description varchar(255),
    primary key (course_code),
    foreign key (course_code) references Course(course_code)
);
insert into Project
(course_code , course_name , project_name , deadline , description)
values
('SW212', 'Software Engineering', 'Hospital Management System', '2025-12-20', 'Design and implementation of a hospital system'),

('MT110', 'Math3', 'Numerical Methods Project', '2025-12-18', 'Apply numerical methods to solve equations'),

('CS202', 'Data Structure', 'Sorting Visualizer', '2025-12-22', 'Build a visual tool for sorting algorithms'),

('DB102', 'Database Management', 'Library Database System', '2025-12-25', 'Design a complete database for a library'),

('CP200', 'Advanced Programming', 'Banking System', '2025-12-27', 'Advanced OOP banking application'),

('DS310', 'DSP', 'Signal Processing Tool', '2025-12-23', 'Process and analyze digital signals'),

('LD222', 'Logic Design', 'Digital Circuit Design', '2025-12-19', 'Design a complete digital circuit'),

('OP270', 'Operating System', 'CPU Scheduler Simulator', '2025-12-26', 'Simulate different CPU scheduling algorithms');
select * from Project;
select * from Project
where course_name like 'Software Engineering';

select * from Project
where course_name like 'Math3';

select * from Project
where course_name like 'Data Sructure';

select * from Project
where course_name like 'Database Management';

select * from Project
where course_name like 'Advanced Programming';

select * from Project
where course_name like 'DSP';

select * from Project
where course_name like 'Logic Design';

select * from Project
where course_name like 'Operating System';

--Doctor Table 

DROP TABLE Manage;
DROP TABLE Teach;
DROP TABLE Classroom_Student;
DROP TABLE Classroom;
DROP TABLE Doctor;
create table Doctor (
    Dr_ID int primary key,  
    Dr_name varchar(100),
    Dr_firstname varchar(50),
    Dr_lastname varchar(50),
	Dr_email varchar(100),
    Dr_username varchar(50),
    Dr_password varchar(50),
    constraint uq_Dr_email unique (Dr_email),
    constraint ck_Dr_email
	check (Dr_email like '%@%.%')
);

insert into Doctor
(Dr_ID , Dr_name , Dr_firstname , Dr_lastname , Dr_email , Dr_username , Dr_password)
values
(12024 , 'Eman Salah' , 'Eman' , 'Salah', 'eman.salah@rst.com' , 'EmanSalah' , 'ema123456'),
(12025 , 'Ahmed Fathy' , 'Ahmed' , 'Fathy', 'ahmed.fathy@rst.com' , 'AhmedFathy' , 'ah78261'),
(12026 , 'Ahmed Sobhy' , 'Ahmed' , 'Sobhy' , 'ahmed.sobhy@rst.com', 'AhmedSobhy' , 'so175279'),
(12027 , 'Heba Askar' , 'Heba' , 'Askar' , 'heba.askar@rst.com' , 'HebaAskar' , 'he3161'),
(12028 , 'Mohamed Badawy' , 'Mohamed' , 'Badawy' , 'mohamedbadawy@rst.com' , 'MohamedBadawy' , 'moh7812t'),
(12029 , 'Sahar Mohamed' , 'Sahar' , 'Mohamed' , 'saharMoh@rst.com' , 'SaharMohamed' , 'sah13621fg' );
select * from Doctor;
insert into Doctor 
(Dr_ID , Dr_name , Dr_firstname , Dr_lastname , Dr_email , Dr_username , Dr_password)
values
(12030, 'Yehia Elhalawagy', 'Yehia', 'Elhalawagy', 'yehia@rst.com', 'YehiaElhalawagy', 'yehia123');
select * from Doctor;

--Teach Relationship
create table Teach (
    Dr_ID int,
	Dr_name varchar(100),
	course_code varchar(50),
	course_name varchar(50),
    primary key (Dr_ID, course_code),
	foreign key (Dr_ID) references Doctor(Dr_ID),
    foreign key (course_code) references Course(course_code)
);
insert into Teach 
(Dr_ID , Dr_name, course_code , course_name)
values
(12024 , 'Eman Salah' , 'SW212' , 'Software Engineering'),
(12024 , 'Eman Salah' , 'OP270' , 'Operating System'),
(12025 , 'Ahmed Fathy' , 'MT110' , 'Math 3' ),
(12025 , 'Ahmed Fathy' , 'DS310' , 'DSP'), 
(12026 , 'Ahmed Sobhy' , 'CR011' , 'Math 0'),
(12026 , 'Ahmed Sobhy' , 'CP200' , 'Advanced Programming'),
(12027 , 'Heba Askar' , 'CS202' , 'Data Structure'),
(12028 , 'Mohamed Badawy' , 'DB102' , 'Database Management'),
(12029 , 'Sahar Mohamed' , 'LD222' , 'Logic Design');
select * from Teach;
select * from Teach
where Dr_name like 'Eman Salah';
select * from Teach
where Dr_name like 'Ahmed Fathy';
select * from Teach
where Dr_name like 'Ahmed Sobhy';
select * from Teach
where Dr_name like 'Heba Askar';
select * from Teach
where Dr_name like 'Mohamed Badawy';
select * from Teach
where Dr_name like 'Sahar Mohamed';

--Assistants Table 
drop table Assistants;
create table Assistants (
    TA_ID int PRIMARY KEY,  
    TA_name varchar(100),
    TA_firstname varchar(50),
    TA_lastname varchar(50),
	TA_email varchar(100),
    TA_username varchar(50),
    TA_password varchar(50),
	);
	create table Manage (
    Dr_ID int,
    TA_ID int,
	Dr_name varchar(50),
	TA_name varchar(50),
    primary key (Dr_ID, TA_ID),
    foreign key (Dr_ID) references Doctor(Dr_ID),
    foreign key (TA_ID) references Assistants(TA_ID)
);
insert into Assistants 
(TA_ID , TA_name ,TA_firstname, TA_lastname, TA_email , TA_username , TA_password)
values 
(101, 'Sara Ahmed','Sara' , 'Ahmed', 'sara.ahmed@rst.com', 'SaraAhmed', 'pw101'),
(102, 'Mona Khaled','Mona' , 'Khaled', 'mona.khaled@rst.com', 'MonaKhaled', 'pw102'),
(103, 'Omar Tarek','Omar' , 'Tarek' ,'omar.tarek@rst.com', 'OmarTarek', 'pw103'),
(104, 'Nada Hany','Nada' ,'Hany' , 'nada.hany@rst.com', 'NadaHany', 'pw104'),
(105, 'Youssef Ali','Youssef' , 'Ali' , 'youssef.ali@rst.com', 'YoussefAli', 'pw105'),
(106, 'Lina Mostafa','Lina' , 'mostafa', 'lina.mostafa@rst.com', 'LinaMustafa', 'pw106'),
(107, 'Hossam Samir','Hossam' , 'Samir', 'hossam.samir@rst.com', 'HossamSamir', 'pw107'),
(108, 'Amira Fawzy','Amira' , 'Fawzy' , 'amira.fawzy@rst.com', 'AmiraFawzy', 'pw108'),
(109, 'Khaled Mohamed','Khaled' , 'Mohamed', 'khaled.mohamed@rst.com', 'KhaledMohamed','pw109'),
(110, 'Reem Mahdy', 'Reem' , 'Mahdy','reem.magdy@rst.com', 'ReemMahdy', 'pw110'),
(111, 'Ahmed Samir','Ahmed' , 'Samir', 'ahmed.samir@rst.com', 'AhmedSamir', 'pw111'),
(112, 'Mariam Khalil','Mariam' , 'Khalil', 'mariam.khalil@rst.com', 'MariamKhalil', 'pw112'),
(113, 'Salma Hossam', 'Salma' , 'Hossam' ,'salma.hossam@rst.com', 'SalmaHossam', 'pw113'),
(114, 'Tamer Osama', 'Tamer' , 'Osama' ,'tamer.osama@rst.com', 'TamerOsama', 'pw114'),
(115, 'Yasmin Adel', 'Yasmin' , 'Adel','yasmin.adel@rst.com', 'YasminAdel', 'pw115');
select * from Assistants;

select*from Assistants 
where TA_name like 'Sara Ahmed';

select*from Assistants 
where TA_name like 'Mona Khaled';

select*from Assistants 
where TA_name like 'Omar Tarek';

select*from Assistants 
where TA_name like 'Nada Hany';

select*from Assistants 
where TA_name like 'Youssef Ali';

select*from Assistants 
where TA_name like 'Lina Mostafa';

select*from Assistants 
where TA_name like 'Hossam Samir';

select*from Assistants 
where TA_name like 'Amira Fawzy';

select*from Assistants 
where TA_name like 'Khaled Mohamed';

select*from Assistants 
where TA_name like 'Reem Mahdy';

select*from Assistants 
where TA_name like 'Ahmed Samir';

select*from Assistants 
where TA_name like 'Mariam Khalil';

select*from Assistants 
where TA_name like 'Salma Hossam';

select*from Assistants 
where TA_name like 'Tamer Osama';

select*from Assistants 
where TA_name like 'Yasmin Adel';

insert into Manage (Dr_ID,Dr_name,TA_ID,TA_name)
values
(12024, 'Eman Salah', 101, 'Sara Ahmed'),
(12024, 'Eman Salah', 109, 'Khaled Mohamed'),
(12024, 'Eman Salah', 110, 'Reem Mahdy'),

(12025, 'Ahmed Fathy', 102, 'Mona Khaled'),
(12025, 'Ahmed Fathy', 107, 'Hossam Samir'),
(12025, 'Ahmed Fathy', 112, 'Mariam Khalil'),

(12026, 'Ahmed Sobhy', 103, 'Omar Tarek'),
(12026, 'Ahmed Sobhy', 106, 'Lina Mostafa'),
(12026, 'Ahmed Sobhy', 114, 'Tamer Osama'),

(12027, 'Heba Askar', 104, 'Nada Hany'),
(12027, 'Heba Askar', 111, 'Ahmed Samir'),

(12028, 'Mohamed Badawy', 105, 'Youssef Ali'),
(12028, 'Mohamed Badawy', 113, 'Salma Hossam'),

(12029, 'Sahar Mohamed', 108, 'Amira Fawzy'),
(12029, 'Sahar Mohamed', 115, 'Yasmin Adel');
select * from Manage;

select*from Manage 
where Dr_Name like 'Eman Salah';

select*from Manage 
where Dr_Name like 'Ahmed Fathy';

select*from Manage 
where Dr_Name like 'Ahmed Sobhy';

select*from Manage 
where Dr_Name like 'Heba Askar';

select*from Manage 
where Dr_Name like 'Mohamed Badawy';

select*from Manage 
where Dr_Name like 'Sahar Mohamed';

--Dr_Office_hours Table 
create table Dr_office_hours (
    DR_office_hrs_ID int primary key,
	Dr_name varchar(50),
    Dr_ID int not null,
    day varchar(20) not null,
    start_time varchar(20),
    end_time varchar(20),

    foreign key (Dr_ID) references Doctor(Dr_ID)
);

insert into Dr_office_hours
(DR_office_hrs_ID,Dr_name, Dr_ID, day, start_time, end_time)
values
(301, 'Eman Salah', 12024, 'Sunday', '15:00', '16:00'),
(302, 'Eman Salah', 12024, 'Monday', '15:00', '16:00'),
(303, 'Eman Salah', 12024, 'Tuesday', '09:00', '11:00'),
(304, 'Eman Salah', 12024, 'Wednesday', '15:00', '16:00'),

(305, 'Ahmed Fathy', 12025, 'Monday', '09:00', '10:00'),
(306, 'Ahmed Fathy', 12025, 'Tuesday', '09:00', '11:00'),
(307, 'Ahmed Fathy', 12025, 'Wednesday', '15:00', '16:00'),
(308, 'Ahmed Fathy', 12025, 'Thursday', '15:00', '16:00'),

(309, 'Ahmed Sobhy', 12026, 'Sunday', '09:00', '10:00'),
(310, 'Ahmed Sobhy', 12026, 'Monday', '09:00', '10:00'),
(311, 'Ahmed Sobhy', 12026, 'Wednesday', '15:00', '16:00'),
(312, 'Ahmed Sobhy', 12026, 'Thursday', '15:00', '16:00'),

(313, 'Heba Askar', 12027, 'Monday', '09:00', '10:00'),
(314, 'Heba Askar', 12027, 'Tuesday', '09:00', '10:00'),
(315, 'Heba Askar', 12027, 'Wednesday', '15:00', '16:00'),
(316, 'Heba Askar', 12027, 'Thursday', '15:00', '16:00'),

(317, 'Mohamed Badawy', 12028, 'Monday', '09:00', '10:00'),
(318, 'Sahar Mohamed', 12029, 'Tuesday', '15:00', '16:00');
select*from Dr_office_hours;

select*from Dr_office_hours
where Dr_name like 'Eman Salah';

select*from Dr_office_hours
where Dr_name like 'Ahmed Fathy';

select*from Dr_office_hours
where Dr_name like 'Ahmed Sobhy';

select*from Dr_office_hours
where Dr_name like 'Heba Askar';

select*from Dr_office_hours
where Dr_name like 'Mohamed Badawy';

select*from Dr_office_hours
where Dr_name like 'Sahar Mohamed';

--TA_office_hours

create table TA_office_hours (
    ta_office_ID int primary key,
    TA_ID int not null,
	TA_name varchar(100),
    day varchar(20) not null,
    start_time varchar(50) not null,
    end_time varchar(50) not null,

    foreign key (TA_ID) references Assistants(TA_ID)
);

insert into TA_office_hours
(ta_office_ID,TA_name, TA_ID , day, start_time, end_time)
values
(401, 'Sara Ahmed', 101, 'Sunday', '09:00', '10:00'),
(402, 'Sara Ahmed', 101, 'Monday', '15:00', '16:00'),
(403, 'Sara Ahmed', 101, 'Tuesday', '09:00', '10:00'),
(404, 'Sara Ahmed', 101, 'Wednesday', '15:00', '16:00'),

(405, 'Mona Khaled', 102, 'Monday', '09:00', '10:00'),
(406, 'Mona Khaled', 102, 'Tuesday', '15:00', '16:00'),
(407, 'Mona Khaled', 102, 'Wednesday', '09:00', '11:00'),
(408, 'Mona Khaled', 102, 'Thursday', '11:00', '12:00'),

(409, 'Omar Tarek', 103, 'Monday', '10:00', '12:00'),
(410, 'Omar Tarek', 103, 'Tuesday', '11:00', '13:00'),
(411, 'Omar Tarek', 103, 'Wednesday', '11:00', '13:00'),
(412, 'Omar Tarek', 103, 'Thursday', '09:00', '10:00'),

(413, 'Nada Hany', 104, 'Sunday', '09:00', '10:00'),
(414, 'Nada Hany', 104, 'Monday', '15:00', '16:00'),

(415, 'Youssef Ali', 105, 'Tuesday', '09:00', '10:00'),
(416, 'Youssef Ali', 105, 'Wednesday', '15:00', '16:00'),

(417, 'Lina Mostafa', 106, 'Monday', '09:00', '11:00'),
(418, 'Lina Mostafa', 106, 'Tuesday', '14:00', '16:00'),

(419, 'Hossam Samir', 107, 'Wednesday', '09:00', '10:00'),
(420, 'Hossam Samir', 107, 'Thursday', '11:00', '12:00'),

(421, 'Amira Fawzy', 108, 'Monday', '15:00', '16:00'),
(422, 'Amira Fawzy', 108, 'Tuesday', '09:00', '10:00'),

(423, 'Khaled Mohamed', 109, 'Wednesday', '11:00', '13:00'),
(424, 'Khaled Mohamed', 109, 'Thursday', '14:00', '16:00'),

(425, 'Reem Mahdy', 110, 'Sunday', '09:00', '11:00'),
(426, 'Reem Mahdy', 110, 'Monday', '15:00', '16:00'),

(427, 'Ahmed Samir', 111, 'Tuesday', '09:00', '10:00'),
(428, 'Ahmed Samir', 111, 'Wednesday', '15:00', '16:00'),

(429, 'Mariam Khalil', 112, 'Monday', '09:00', '10:00'),
(430, 'Mariam Khalil', 112, 'Tuesday', '15:00', '16:00'),

(431, 'Salma Hossam', 113, 'Wednesday', '09:00', '11:00'),
(432, 'Salma Hossam', 113, 'Thursday', '11:00', '12:00'),

(433, 'Tamer Osama', 114, 'Monday', '09:00', '10:00'),
(434, 'Tamer Osama', 114, 'Tuesday', '14:00', '16:00'),

(435, 'Yasmin Adel', 115, 'Wednesday', '15:00', '16:00'),
(436, 'Yasmin Adel', 115, 'Thursday', '09:00', '11:00');
select*from TA_office_hours;

select*from TA_office_hours
where TA_name like 'Sara Ahmed';

select*from TA_office_hours
where TA_name like 'Mona Khaled';

select*from TA_office_hours
where TA_name like 'Omar Tarek';

select*from TA_office_hours
where TA_name like 'Nada Hany';

select*from TA_office_hours
where TA_name like 'Youssef Ali';

select*from TA_office_hours
where TA_name like 'Lina Mostafa';

select*from TA_office_hours
where TA_name like 'Hossam Samir';

select*from TA_office_hours
where TA_name like 'Amira Fawzy';

select*from TA_office_hours
where TA_name like 'Khaled Mohamed';

select*from TA_office_hours
where TA_name like 'Reem Mahdy';

select*from TA_office_hours
where TA_name like 'Ahmed Samir';

select*from TA_office_hours
where TA_name like 'Mariam Khalil';

select*from TA_office_hours
where TA_name like 'Tamer Osama';

select*from TA_office_hours
where TA_name like 'Yasmin Adel';

--Faculty Table 

create table Faculty (
    faculty_code int primary key,  
    faculty_name varchar(100),
    building_number varchar(20),
    university varchar(200),
	dean_name varchar(100)
);

insert into Faculty 
(dean_name, faculty_code,faculty_name, building_number, university)
values
('Yehia Elhalawagy',101, 'Faculty of Computers and Artificial Intelligence', 'Bldg A', 'RST University'),  -- Yehia Elhalawagy
('Mohaned Soliman',102, 'Faculty of Physical Therapy', 'Bldg B', 'RST University'),
('Mokhtar Salem',103, 'Faculty of Dentistry', 'Bldg C', 'RST University'),
('Yara Elgendy',104, 'Faculty of Engineering', 'Bldg D', 'RST University'),
('Saeed Elhawary',105, 'Faculty of Nursing', 'Bldg E', 'RST University'),
('Mai Masoud',106, 'Faculty of Business and Administration', 'Bldg F', 'RST University');
select*from Faculty;

select*from Faculty
where faculty_name like 'Faculty of Computers and Artificial Intelligence';

select*from Faculty
where faculty_name like 'Faculty of Physical Therapy';

select*from Faculty
where faculty_name like 'Faculty of Dentistry';

select*from Faculty
where faculty_name like 'Faculty of Engineering';

select*from Faculty
where faculty_name like 'Faculty of Nursing';

select*from Faculty
where faculty_name like 'Faculty of Business and Administration';
--Dean Table 
drop table Dean;
create table Dean (
    dean_ID int primary key,  
    dean_name varchar(100) NOT NULL,
    dean_firstname varchar(50) NOT NULL,
    dean_lastname varchar(50)NOT NULL,
    dean_email varchar(100) UNIQUE NOT NULL,
    dean_username varchar(50) UNIQUE NOT NULL,
    dean_password varchar(50)NOT NULL,
	faculty_name varchar(100),
	--Manage Relationship
	faculty_code int unique,
	constraint fk_dean_faculty foreign key (faculty_code)
    references Faculty(faculty_code),
	constraint ck_dean_email
    check (dean_email LIKE '%@%.%'),
	--Is_a Relationship
	Dr_ID int ,
	constraint fk_dean_doctor
	foreign key (Dr_ID) references Doctor(Dr_ID)
);

insert into Dean 
(dean_ID, dean_name, dean_firstname, dean_lastname, dean_email, dean_username, dean_password,faculty_name, faculty_code, Dr_ID)
values
(22001, 'Yehia Elhalawagy', 'Yehia', 'Elhalawagy', 'yehia@rst.com', 'YehiaElhalawagy', 'yehia123','Faculty of Computers and Artificial Intelligence' ,101, 12030),

(22002, 'Mohaned Soliman', 'Mohaned', 'Soliman', 'mohaned.soliman@rst.com', 'MohanedSoliman', 'sa12345','Faculty of Physical Therapy', 102, null),
(22003, 'Mokhtar Salem', 'Mokhtar', 'Salem', 'mokhtar.salem@rst.com', 'MokhtarSalem', 'oh7890','Faculty of Dentistry' ,103, null),
(22004, 'Yara Elgendy', 'Yara', 'Elgendy', 'yara.elgendy@rst.com', 'YaraElgendy', 'mf45678','Faculty of Engineering' ,104, null),
(22005, 'Saeed Elhawary', 'Saeed', 'Elhawary', 'saeed.elhawary@rst.com', 'SaeedElhawary', 'am1122','Faculty of Nursing' ,105, null),
(22006, 'Mai Masoud', 'Mai' , 'Masoud', 'mail.masoud@rst.com', 'MaiMasoud' , 'ma6832','Faculty of Business and Administration' ,106, null);
select * from Dean;
select * from Dean
where dean_firstname like 'Yehia';
 
select * from Dean
where dean_firstname like 'Mohaned';

select * from Dean
where dean_firstname like 'Mokhtar';

select * from Dean
where dean_firstname like 'Yara';

select * from Dean
where dean_firstname like 'Saeed';

select * from Dean
where dean_firstname like 'Mai';

--Vacation_course

create table Vacation_course(
vacation_ID int,
track_ID int,
track_name varchar(100),
Dr_name varchar(100),
startDate varchar(100),
endDate varchar(100),
dean_name varchar(100),
dean_ID int,
faculty_code int,
primary key (vacation_ID, faculty_code),
foreign key (faculty_code) references Faculty(faculty_code)
);

insert into Vacation_course
(vacation_ID, track_ID, track_name, Dr_name, startDate, endDate, faculty_code, dean_name, dean_ID)
values
(1, 201, 'Artificial Intelligence Fundamentals', 'Ahmed Sobhy', '2025-07-01', '2025-08-01', 101, 'Yehia Elhalawagy', 22001),
(2, 202, 'Full Stack Web Development', 'Eman Salah', '2025-07-10', '2025-08-10', 101, 'Yehia Elhalawagy', 22001),

(1, 203, 'Programming for Healthcare Systems', 'Ahmed Fathy', '2025-07-05', '2025-08-05', 102, 'Mohaned Soliman', 22002),
(2, 204, 'Medical Data Analysis with Python', 'Sahar Mohamed', '2025-07-15', '2025-08-15', 102, 'Mohaned Soliman', 22002),

(1, 205, 'Dental Management Systems', 'Eman Salah', '2025-07-03', '2025-08-03', 103, 'Mokhtar Salem', 22003),
(2, 206, 'AI in Dental Imaging', 'Ahmed Sobhy', '2025-07-12', '2025-08-12', 103, 'Mokhtar Salem', 22003),

(1, 207, 'Embedded Systems Programming', 'Heba Askar', '2025-07-01', '2025-08-01', 104, 'Yara Elgendy', 22004),
(2, 208, 'Internet of Things (IoT)', 'Mohamed Badawy', '2025-07-08', '2025-08-08', 104, 'Yara Elgendy', 22004),

(1, 209, 'Hospital Information Systems', 'Sahar Mohamed', '2025-07-04', '2025-08-04', 105, 'Saeed Elhawary', 22005),
(2, 210, 'Database Systems for Healthcare', 'Ahmed Fathy', '2025-07-14', '2025-08-14', 105, 'Saeed Elhawary', 22005),

(1, 211, 'Business Information Systems', 'Mohamed Badawy', '2025-07-02', '2025-08-02', 106, 'Mai Masoud', 22006),
(2, 212, 'E-Commerce Systems', 'Heba Askar', '2025-07-11', '2025-08-11', 106, 'Mai Masoud', 22006);

select * from Vacation_course;

select*from Vacation_course
where track_name like 'Artificial Intelligence Fundamentals';

select * from Vacation_course
where track_name LIKE 'Full Stack Web Development';

select * from Vacation_course
where track_name LIKE 'Programming for Healthcare Systems';

select * from Vacation_course
where track_name LIKE 'Medical Data Analysis with Python';

select * from Vacation_course
where track_name LIKE 'Dental Management Systems';

select * from Vacation_course
where track_name LIKE 'AI in Dental Imaging';

select * from Vacation_course
where track_name LIKE 'Embedded Systems Programming';

select * from Vacation_course
where track_name LIKE 'Internet of Things (IoT)';

select * from Vacation_course
where track_name LIKE 'Hospital Information Systems';

select * from Vacation_course
where track_name LIKE 'Database Systems for Healthcare';

select * from Vacation_course
where track_name LIKE 'Business Information Systems';

select * from Vacation_course
where track_name LIKE 'E-Commerce Systems';


SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 001;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 002;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 003;

SELECT 
    s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 004;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 005;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 006;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 007;

SELECT 
    s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 008;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 009;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 010;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 011;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 012;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 013;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 014;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 015;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 016;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 017;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 018;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 019;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 020;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 021;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 022;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 023;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 024;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 025;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 026;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 027;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 028;

SELECT 
     s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 029;

SELECT 
    s.st_firstname + ' ' + s.st_lastname AS Student_Name,
    c.course_name,
    d.Dr_name,
	a.TA_name,
    doh.day AS Dr_Day,
    doh.start_time,
    doh.end_time,
	toh.day AS TA_Day,
    toh.start_time,
    toh.end_time
FROM Student s
JOIN Enroll e ON s.st_ID = e.st_ID
JOIN Course c ON e.course_code = c.course_code
JOIN Teach t ON c.course_code = t.course_code
JOIN Doctor d ON t.Dr_ID = d.Dr_ID
JOIN Dr_office_hours doh ON d.Dr_ID = doh.Dr_ID
JOIN Manage m ON t.Dr_ID = m.Dr_ID
JOIN Assistants a ON m.TA_ID = a.TA_ID
JOIN TA_office_hours toh ON a.TA_ID = toh.TA_ID
WHERE s.st_ID = 030;

