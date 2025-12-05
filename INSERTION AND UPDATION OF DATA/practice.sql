
-- 1.Insert records into customer table

INSERT INTO customer (CID, FNAME, LNAME, GENDER, STATE, PIN, DOB, AGE) VALUES
(100, 'Anjali', 'Suresh', 'F', 'Gujarat', NULL, TO_DATE('03-FEB-04','DD-MON-RR'), NULL),
(101, 'Anu', 'Joseph', 'F', 'Tamil Nadu', 600020, TO_DATE('05-JUL-03','DD-MON-RR'), NULL),
(102, 'Arjun', 'Santhosh', 'M', NULL, 686105, TO_DATE('03-APR-04','DD-MON-RR'), NULL),
(103, 'Gowtham', 'Thulasi', 'M', 'Kerala', NULL, TO_DATE('03-FEB-04','DD-MON-RR'), NULL),
(104, 'Megha', 'Prasad', 'F', 'Karnataka', 560001, TO_DATE('23-JAN-02','DD-MON-RR'), NULL),
(105, 'Nikhil', 'Ravi', 'M', 'Kerala', 685601, TO_DATE('12-FEB-01','DD-MON-RR'), NULL),
(106, 'Rakesh', 'Singh', NULL, 'Manipur', 795001, TO_DATE('29-OCT-99','DD-MON-RR'), NULL),
(107, 'Rehan', 'Ali', 'M', 'Delhi', 110045, TO_DATE('19-SEP-04','DD-MON-RR'), NULL),
(108, 'Reshma', 'S', NULL, 'Kerala', 670001, TO_DATE('05-FEB-00','DD-MON-RR'), NULL),
(109, 'Devika', 'Suresh', 'F', 'Gujarat', NULL, TO_DATE('03-FEB-04','DD-MON-RR'), NULL);

-- 2.List all the contents of customer table

 select * from customer;

-- 3.Retrieve the full names of all customers,the output should be titled “CUSTOMER LIST”.

select fname||' ' ||lname as "customer list" from customer;

-- 4.Retrieve Firstname and lastname of customer from kerala

 select fname||' ' ||lname as "customer list" from customer where state='Kerala';

--  5.Retrieve the names of customers for whom pincode is missing

 select fname ||' '||lname as "customer name" from customer where pin is NULL;

--  6.Retrieve the names of state from which customers are there

select distinct state from customer;

-- 7.Retrieve the name and corresponding stste of north Indian customers

 select fname||' '||lname as "customer name",state from customer where state in ('Delhi','haryana','Punjab','Uttar Pradesh','Himachal Pradesh');

--  8.select Fname !!’ ‘!! Lname,stste as customer list from customer where state=’manipur’or
-- state=’gujarat’;

 select fname||' '||lname as "customer list",state from customer where UPPER(state) in ('MANIPUR','GUJARAT');

--  9.Retrieve customer information in decending order of state

 select * from customer order by state desc;

--  10.Retrieve customer information in alphabetical order of there names

select * from customer order by fname asc;

-- 11.Retrieve the names of customers from kerala whose pincode information is available

select * from customer where UPPER(state)='KERALA' and pin is  not NULL;

-- 12.select the names of all customers whose firstname contains the word ‘devi’

select fname||' '||lname as "Customer name" from customer where fname like '%devi%';

-- 13.select the names of all customers whose names begin with ‘s’or’r’

 select fname||' '||lname as "Customer name" from customer where fname like 'd%' or fname like 's%';

-- 14.Retrieve the names and age of all customers having cid greater than 103 and below 106

select fname||' '||lname as "customer name",age from customer where cid >103 and cid <106;

-- 15.set the pincode as ‘908876’ for ‘renu’

update customer set pin=908876 where fname='Renu';

-- 15.Retrieve the names of all customers who are born after 01-jan-1990

select fname||' '||lname as "customer name "from customer where dob>'01-jan-1990';
