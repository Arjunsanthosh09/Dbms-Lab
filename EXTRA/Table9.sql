-- 9 Create the following tables:

-- TABLE NAME: CUSTOMER

-- Column Name     Data Type       Constraint
-- Cno             Varchar(6)      Primary Key
-- Cname           Varchar(20)     Not Null
-- Address         Varchar(20)
-- City            Varchar(20)

create table customer4(
    Cno Varchar(6) Primary Key,
    Cname Varchar(20) Not Null,
    Address Varchar(20),
    City Varchar(20)
);

create table sales4(
    orderno Varchar(6) Primary key,
    Orderdate date,
    cno varchar(6),
    foreign key(cno) references customer4(Cno)
);


-- TABLE NAME :SALES

-- Column name     Data type   Constraint
-- orderno         Varchar(6)  Primary key
-- Orderdate       Date
-- cno             Varchar(6)  Foreign key

-- Write SQL queries for the following

-- 1. a. Insert 5 records in each table

insert into customer4 values ('C101','John','MG Road','Bangalore');
insert into customer4 values ('C102','Jay','Park Street','Kolkata');
insert into customer4 values ('C103','Anil','Anna Nagar','Chennai');
insert into customer4 values ('C104','Rita','Sector 15','Delhi');
insert into customer4 values ('C105','Meera','Marine Drive','Mumbai');


insert into sales4 values ('O201','01-JAN-2026','C101');
insert into sales4 values ('O202','05-JAN-2026','C102');
insert into sales4 values ('O203','10-JAN-2026','C103');
insert into sales4 values ('O204','15-JAN-2026','C104');
insert into sales4 values ('O205','20-JAN-2026','C102');

-- a. Update the address of Customer “John”

 update customer4 set ADDRESS='lOST ANGLES' where CNAME='John';
 
-- 2. a. Count the orders placed after 03-march-2012

 select count(orderno) as "Order count" from sales4 where Orderdate >'03-mar-2012';


-- b. Find the order number of customer ‘Jay’

select c.Cname,s.orderno from customer4 c,sales4 s where c.Cno=s.Cno and c.Cname='Jay';

-- 3. Create a view on CUSTOMER table

create view customer4view as select * from customer4;

-- 4. Count number of orders placed by each customer.

select c.Cname,count(s.orderno) as "Order count" from customer4 c , sales4 s where c.Cno=s.Cno group by C.cname;