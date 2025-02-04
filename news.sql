CREATE table newspaper (feature varchar(100), section varchar(100), page int);
INSERT INTO 'newspaper' ('feature','section','page') values('Business','E','1');
INSERT INTO 'newspaper' ('feature','section','page') values('Classified','F','8');
INSERT INTO 'newspaper' ('feature','section','page') values('Comics','C','4');
INSERT INTO 'newspaper' ('feature','section','page') values('Editorial','A','12');
INSERT INTO 'newspaper' ('feature','section','page') values('Movies','B','4');
INSERT INTO 'newspaper' ('feature','section','page') values('Sports','D','8');
INSERT INTO 'newspaper' ('feature','section','page') values('Weather','C','2');


-- 1. list all features and sections of the newspaper

select `Features`,`Section` from newspaper;

-- 2. find all rows of section c with page 3 to 8

select * from newspaper where Section='C' and page BETWEEN '3' and '8';


-- 3. features containing "ie" but section not 'B'.

select * from newspaper where features like '%ie%' and `Section` not like '%B%';


-- 4. find all features whose right most 2nd character is 'e'

SELECT * FROM `newspaper` WHERE Features like '%e_';


-- 5. set the section 'null' to rows that have section 'c' and page bellow 5;

UPDATE `newspaper` SET Section='null' where Section='c' AND Page <5;


-- 6. find all null valued sections

SELECT * FROM newspaper WHERE Section='null';


-- 7. find all rows whose section is A,B,C or F

SELECT * FROM newspaper WHERE Section IN('A','B','C') or Section in('F');


--8 find all uniqe sections from newspaper.
 
SELECT DISTINCT Section from newspaper;

