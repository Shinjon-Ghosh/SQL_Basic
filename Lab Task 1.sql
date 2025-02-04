Create table newspaper (feature varchar(100),section varchar(100),page int);
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Business','E','1');
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Classified','F','8');
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Comics','C','4');
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Editorial','A','12');
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Movies','B','4');
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Sports','D','8');
INSERT INTO `newspaper` (`feature`,`section`,`page`) values ('Weather','C','2');

-- 1. List all feature, section from newspaper where section is 'C' and page greater than 4.
SELECT feature, section From `newspaper` where section= 'C' and page> '4' ; 
-- 2. List all from newspaper where page is between 1 to 10.
SELECT * From `newspaper` where page between '1' and '10' ;
-- 3. List all from newspaper where feature is 'classified'.
SELECT * From `newspaper` where feature= 'Classified'  



-- like %_
SELECT * FROM newspaper where feature like 'classified';
SELECT * FROM newspaper where feature like '%ss%';
SELECT * FROM newspaper where feature like '%ss_%';
SELECT * FROM newspaper where feature like '%';
SELECT * FROM newspaper where feature like 'M%';
SELECT * FROM newspaper where feature like '_o%';
-- in/not in_
SELECT * FROM newspaper where page in (6,12,2,4);
SELECT * FROM newspaper where feature in ('classified','movies','sports');
SELECT * FROM newspaper where feature not in ('classified','movies','sports');
-- subquery_
SELECT * FROM newspaper where feature not in (select feature from newspaper where page>4);
-- creating table_
Create table abc (a varchar(100),b int(20),c varchar(50));
-- insert some values
SELECT * FROM newspaper order by page;
SELECT * FROM newspaper order by page asc;
SELECT * FROM newspaper order by page desc;
SELECT * FROM newspaper order by page asc,section;
SELECT * FROM newspaper order by section,page asc;
SELECT * FROM newspaper order by section,feature asc;
SELECT * FROM newspaper order by page dessc;
-- aggregate function
select * from newspaper 
select count(*) from newspaper where page >=8; 
select max(page) from newspaper where page >=8; 
select min(page) from newspaper where page >=8; 
select sum(page) from newspaper where page >=8; 
select avg(page) from newspaper where page >=8; 

-- destinct
select distinct page from newspaper;
select distinct * from newspaper;
select distinct page from newspaper order by page;
select distinct page*2 from newspaper order by page;
select distinct page*2+2 from newspaper order by page;
select distinct page, page*2+2 from newspaper order by page;
