create database pharmacy;
use pharmacy;

create table patient(
	patient_id int,
	name varchar(20),
    address varchar(20),
    cell varchar(20),
    district varchar(20) ,
    primary key (patient_id) );

create table pharmacy(
	pharmacy_id int,
	pharmacy_name varchar(20) ,
    pharmacy_address varchar(20),
    pharmacy_phone varchar(20) ,
    primary key(pharmacy_id));

create table company(
	company_id int,
	company_name varchar(20),
    country varchar(20),
    phone varchar(20),
    primary key(company_id));

create table medi_details(
	medi_detail_id int,
	category varchar(20),
    weight numeric(12,2),
    dimension varchar(20),
    price numeric(12,2),
    company_id int,
    primary key(medi_detail_id),
    foreign key(company_id) references company(company_id));
    
 create table medicine(
	medicine_id int,
    pharmacy_id int,
    medicine_name varchar(20),
    medi_detail_id int,
    count int ,
    primary key(medicine_id),
    foreign key(pharmacy_id) references pharmacy(pharmacy_id),
    foreign key(medi_detail_id) references medi_details(medi_detail_id));
  
drop table if exists bill;
create table bill(
	patient_id int,
	medicine_id int,
    bill_time varchar(20),
    price numeric(12,2),
    primary key(patient_id, medicine_id, bill_time),
    foreign key(medicine_id) references medicine(medicine_id),
    foreign key(patient_id) references patient(patient_id));
    
insert into patient values(1001, 'kalam', '21/b colony' , '0821111' , 'sylhet');    
insert into patient values(1002, 'salam', '22/b colony' , '0821112' , 'dhaka');    
insert into patient values(1003, 'alam', '23/b housing' , '0821113' , 'chittagong');    
insert into patient values(1004, 'khan', '24/b colony' , '0821114' , 'cumilla');    
insert into patient values(1005, 'abul', '21/b baker street' , '0821115' , 'rajshahi');    
insert into patient values(1006, 'babul', '26/b colony estate' , '0821116' , 'rajshahi');    
insert into patient values(1007, 'babul', '27/b molony estate' , '0821116' , 'cumilla');    
insert into patient values(1008, 'babul', '27/c bolony estate' , '0821116' , 'dhaka');    

insert into pharmacy values(91, 'A1', 'A-storehouse' , '08211161' );    
insert into pharmacy values(92, 'B11', 'B-storehouse' , '0821112' );    
insert into pharmacy values(93, 'X8', 'X-storehouse' , '08211168' );    
insert into pharmacy values(94, 'J1', 'J-storehouse' , '0821114' );    
insert into pharmacy values(95, 'B2', 'B-storehouse' , '08211163' );    
insert into pharmacy values(96, 'D1', 'D-storehouse' , '08211166' );

insert into company values(9001, 'Osborne', 'switzerland' , '12121201');    
insert into company values(9002, 'Basic', 'sweeden' , '12121202');    
insert into company values(9003, 'Haveet', 'england' , '0821112');    
insert into company values(9004, 'harrys', 'France' , '12121204');    
insert into company values(9005, 'greg and brothers', 'america' , '12121205');    
insert into company values(9006, 'kentasys', 'slovakia' , '08211166');    
insert into company values(9007, 'kentasys', 'advon mericha' , '09211166');    

delete from medi_details;
insert into medi_details values(121, 'typical', 25 , 'solid' , 100 , 9001);    
insert into medi_details values(122, 'typical', 250 , 'solid' , 100 , 9002);    
insert into medi_details values(123, 'sleeping pill', 125 , 'solid' , 150 , 9003);    
insert into medi_details values(124, 'head pill', 50 , 'syrup' , 1000 , 9004);    
insert into medi_details values(125, 'heart', 100 , 'solid' , 800 , 9002);    
insert into medi_details values(126, 'cough', 500 , 'syrup' , 900 , 9006);   
insert into medi_details values(129, 'dying', 500 , 'syrup' , 900 , 9004);   
insert into medi_details values(130, 'rocking', 500 , 'syrup' , 900 , 9007);   
insert into medi_details values(147, 'low', 500 , 'syrup' , 900 , 9003);   

delete from medicine;
insert into medicine values(1, 91, 'napa' , 121 , 500);    
insert into medicine values(2, 92, 'ace' , 122 , 600);    
insert into medicine values(3, 94, 'milam' , 123 , 100);    
insert into medicine values(4, 94, 'indever' , 124 , 1500);    
insert into medicine values(5, 95, 'ramoril' , 126 , 700);    
insert into medicine values(6, 96, 'tusca' , 126 , 1000);    
insert into medicine values(7, 91, 'forming' , 147 , 10);    
insert into medicine values(8, 95, 'catlin' , 129 , 10);    
insert into medicine values(9, 95, 'darwing' , 130 , 110);    

select * from bill;
delete from bill;
insert into bill values(1001, 5, '11-11-2011 11:11:11' , 800);    
insert into bill values(1001, 5, '31-03-2019 11:11:11' , 900);    
insert into bill values(1006, 6, '03-03-2019 23:36:42' , 100);    
insert into bill values(1003, 1, '07-03-2019 23:36:42' , 100);    
insert into bill values(1005, 6, '08-03-2019 23:36:42' , 900);    
insert into bill values(1005, 6, '09-03-2019 23:36:00' , 900);    
insert into bill values(1002, 3, '05-03-2019 23:36:42' , 150);    
insert into bill values(1004, 4, '09-03-2018 23:36:42' , 1000);    
insert into bill values(1004, 6, '09-03-2017 23:36:00' , 501);    

-- 1.find the names of those patients who have bought at least one medicine having more than 500tk.

select * from patient;
select * from bill;

-- actual query --
select distinct name from patient natural join bill  where(bill.price > 500);



-- 2. list the names of those medicine which belongs to a company situated in 'Paris'

select * from medicine;
select * from medi_details;
select * from company;

-- actual query --
-- with sub-query
select medicine_name from medicine where medi_detail_id in (select medi_detail_id from
medi_details where company_id in(select company_id from company where country = 'France'));

-- with join
select medicine_name from medicine natural join medi_details m natural join company c 
where (c.country = 'France'); 

-- 3. find the names along with total bills of all patients.
select * from patient;
select * from bill;

-- actual query
select name, sum(price) as 'total_bills' from patient   natural join bill group by patient_id,name;

-- 4. List the phone number of patients who have bought any medicine in between 7 to 9 march,2019

-- with sub-query
select distinct cell from patient where patient_id in (select patient_id from bill 
where bill_time like '07-03-2019%' or bill_time like '08-03-2019%' 
or bill_time like '09-03-2019%');

-- with join
select distinct cell from patient natural join bill where bill_time like '07-03-2019%' or
 bill_time like '08-03-2019%' or bill_time like '09-03-2019%';

-- 5. find the name and district of each patients along with their phone numbers where the list
-- should firstly be sorted on their name in the ascending order and secondly sorted on their district in
-- descending order.

select name,district,cell from patient order by name asc,district desc;

-- 6. list the name of the medicines along with their category which have exactly three characters
-- in their name or exactly five characters if the third character is an 'i' 

select medicine_name, category from medicine natural join medi_details where category like '___'
or category like '__i__';


-- 7. find all the medicines from countries which have 'd' in the second letter and 'a' in the last letter
-- of their name

select medicine_name from medicine natural join medi_details natural join company 
where country like '_d%a';


-- 8. find the names of the patients along with their company names if they have used same phone numbers

-- natural join (actually cartesian product)
select * from patient n natural join company c where (n.cell = c.phone);
select * from patient n natural join company c;

-- inner join
select n.name, c.company_name from patient n inner join company c on(n.cell = c.phone);

-- 9. list the name of the patients who have spent the most amount 
-- of money to get medical services in their life time among with
-- district mates according to the record of the above database.

select * from
(select z.patient_id, z.name, z.district,sum(b.price) as 'total_exp' from patient z natural join bill b 
group by z.patient_id,z.name,z.district) aaa inner join 
(select k.district,max(k.total) as 'max_exp' from (select p.patient_id, p.name,p.district,sum(bb.price) as 'total' 
from patient p natural join bill bb group by p.patient_id,p.name,p.district) k group by k.district) bbb
on (aaa.district=bbb.district) where total_exp >= max_exp ;

-- first table
select z.patient_id, z.name, z.district,sum(b.price) as 'total_exp' from patient z natural join bill b 
 group by z.patient_id,z.name,z.district;

-- second table
select k.district,max(k.total) as 'max_exp' from (select p.patient_id, p.name,p.district,sum(bb.price) as 'total' 
from patient p natural join bill bb group by p.patient_id,p.name,p.district) k group by k.district;

-- 10. list the names and phone numbers of those pharmacy which have at least one  
-- type of medicine which is taking a total weight more than 5kg. 

-- sub query
select pharmacy_name, pharmacy_phone from pharmacy where pharmacy_id in (select pharmacy_id 
from medicine a natural join medi_details b where a.count*b.weight > 5000);

-- join
select distinct pharmacy_name, pharmacy_phone from pharmacy natural join medicine a 
natural join medi_details b where a.count*b.weight > 5000;

-- 11. find the name of the medicine which is consumed by the people of sylhet in this month [march,2019] 
select distinct medicine_name from medicine natural join bill natural join patient where district ='Sylhet'
and bill_time like '__-03-2019 %';

