create database univ_db;

use univ_db;



drop table if exists dept;
create table dept(
dept_code varchar(20),

dept_title varchar(100),
building varchar(10),
budget numeric(12,2),
primary key (dept_code)
);
drop table if exists student;

create table student(
reg varchar(20),
fname varchar(50),
lname varchar(50),
dept_code varchar(20),
session int,
semester varchar(20),
section int,

primary key (reg),
foreign key(dept_code) references dept(dept_code)
);
 
drop table if exists course;
create table course(
  course_id varchar(10),
  title varchar(50),
  dept_name varchar(20),
  credits numeric(3,1),
  primary key(course_id),
  foreign key(dept_name) references dept(dept_code)

);
drop table if exists instructor;
create table instructor(
id varchar(5),
fname varchar(20),
lname varchar(50),
dept_name varchar(20),
sallary numeric(8,2),
primary key(id),
foreign key(dept_name) references dept(dept_code)
);

drop table if exists section;

create table section(
course_id varchar(10),
section int,
semester varchar(20),
session int,
building varchar(15),
room_number varchar(7),
time_slot_id varchar(4),
primary key(course_id,section,semester,session),
foreign key(course_id) references course(course_id)
);
drop table if exists teaches;

create table teaches(
id varchar(5),
course_id varchar(10),
section int,
semester varchar(20),
session int,
primary key(id,course_id,section,semester,session),
foreign key(course_id,section,semester,session) 
references section(course_id,section,semester,session),

foreign key(id) references instructor(id)
);


insert into dept values('CSE','Computer Science and Enginieering','IICT',20000), 
('EEE','Electrical and Electronic Enginieering','IICT',20000), 
('STA','Statistics','C',30000), 
('BMB','Biochemistry and Moliculer Biology','A-Ext',18000), 
('MAT','Mathematics','C',25000), 
('PHY','PHYSICS','A',30000),
('FET','Food Enginieering and Tea Technology','E',18000); 

select * from dept;
-- delete from student;

insert into student values('2019134001','Gennady','Karotkavich','STA',2019,'FALL',1),
('2019134002','Steve','Jobs','STA',2019,'FALL',2),
('2019331003','Dipjol','Mama','CSE',2019,'FALL',2);
insert into student values('2019331056','Yan Tun' , 'khaijan', 'PHY' , 2019 , 'spring' , 1);

insert into student values('2018338056','Leo Neng' , 'Ofenoshsho', 'EEE' , 2018 , 'Fall' , 2);

insert into student values('2018338102','Saban' , 'Ali', 'MAT' , 2018 , 'Spring' , 2);

insert into student values('2018338103','To To' , 'Company', 'MAT' , 2018 , 'Spring' , 2);


select * from student;



insert into course values('CSE205O','Database Management and Programming','CSE','2.0');
insert into course values('CSE206O','Database Management and Programming Lab','CSE','3.0');
insert into course values('STA101','Basic Probability','STA','3.0');
insert into course values('STA103','Basic Statistics','STA','3.0');
insert into course values('MAT101O','Basic Algebra','MAT','2.0');
insert into course values('CSE133','Structured Programming Language','CSE','3.0');
insert into course values('CSE134','Structured Programming Language Lab','CSE','3.0');
insert into course values('EEE203','Circuits','EEE','3.0');
insert into course values('MAT103D','Calculus','MAT','3.0');
insert into course values('MAT103O','Calculus','MAT','3.0');
insert into course values('PHY106','Physics','PHY','3.0');

select * from course;

-- delete from instructor

insert into instructor values (1111, 'MZI' , 'MZI' , 'CSE' , 70);

insert into instructor values (3112, 'MSN' , 'MSN' , 'MAT' , 35);

insert into instructor values (2111, 'HT' , 'HT' , 'EEE' , 20);

insert into instructor values (2112, 'TAC' , 'TAC' , 'EEE' , 15);

insert into instructor values (1515, 'EH' , 'EH' , 'CSE' , 10);

insert into instructor values (3125, 'SS' , 'SS' , 'STA' , 50);

insert into instructor values (1115, 'MSI' , 'MSI' , 'STA' , 35);

insert into instructor values (2122, 'MSA' , 'MSA' , 'PHY' , 75);

select * from instructor;

-- delete * from section;

insert into section values('CSE 205O' , 1, 'Fall' , 2019 , 'C' , 314 , 'A');

insert into section values('CSE 206O' , 1, 'Fall' , 2019 , 'C' , 314 , 'A');

insert into section values('PHY 106' , 2, 'Fall' , 2018 , 'A' , 309 , 'B');

insert into section values('MAT 103O' , 2, 'Spring' , 2019 , 'A' , 310 , 'A');

insert into section values('MAT 103O' , 2, 'Spring' , 2018 , 'A' , 120 , 'B');

insert into section values('MAT 103O' , 1, 'Fall' , 2019 , 'C' , 220 , 'A');

insert into section values('MAT 103O' , 2, 'Fall' , 2019 , 'C' , 218 , 'A');

insert into section values('STA 103' , 1, 'Fall' , 2019 , 'C' , 214 , 'A');

insert into section values('STA 101' , 1, 'Fall' , 2019 , 'C' , 214 , 'B');

insert into section values('EEE 203' , 1, 'Fall' , 2019 , 'IICY' , 434 , 'B');

select * from section;

-- delete from teaches

insert into teaches values(1515 , 'CSE 205O' , 1, 'Fall' , 2019);

insert into teaches values(1515 , 'CSE 206O' , 1, 'Fall' , 2019);

insert into teaches values(3112 , 'MAT 103O' , 2, 'Spring' , 2018);

insert into teaches values(3125 , 'STA 101' , 1, 'Fall' , 2019);

insert into teaches values(2111 , 'EEE 203' , 1, 'Fall' , 2019);

insert into teaches values(3112 , 'MAT 103O' , 1, 'Fall' , 2019);

select * from teaches;




-- questions....
-- QUERIES
-- 1. Find All dept whose building start with 'A' with Budget less or equal 30000.
   select * from dept where building='A' and budget<=30000;


-- 2. Find the building names of each courses [in course title].
select distinct c.course_id, building from course c natural join section s;

-- 3. Find out the instructor which name length is 3.
select fname,lname from instructor where length(fname)=3;


-- 4. List out the id, course_id , together with room_no.
select distinct t.id,t.course_id,s.room_number from teaches t natural join section s;

-- 5. List all teachers id, sec_id, semester, year and building name where building is 'C'.
select distinct  t.id,s.section,s.semester,s.session,s.building from teaches t natural join section s where s.building='C';

-- 6. list the course in course table along with their title
select course_id,dept_title from course c join dept d on  c.dept_name=d.dept_code;


-- 7 count the number of courses taught by 'EH'.

	select  count(teaches.id) from teaches natural join instructor  where fname='EH';


-- 7 list the total expenses of the departments in a month as salary of he instructor.

select dept_name,sum(sallary) as 'Total Expense'from instructor group by dept_name order by dept_name desc;


select dept_name,count(dept_name) from course group by dept_name;


