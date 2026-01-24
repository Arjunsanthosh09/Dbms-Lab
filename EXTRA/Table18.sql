-- 18.Create the following tables:

-- TABLE NAME: CUSTOMER

-- Column Name     Data Type       Constraint
-- Cno             Varchar(6)      Primary Key
-- Cname           Varchar(20)     Not Null
-- Address         Varchar(20)
-- City            Varchar(20)

create table customer2(
    Cno Varchar(6) Primary Key,
    Cname Varchar(20) Not Null,
    Address Varchar(20),
    City Varchar(20)
);


-- TABLE NAME :SALES

-- Column name     Data type   Constraint
-- orderno         Varchar(6)  Primary key
-- Orderdate       Date
-- cno             Varchar(6)  Foreign key

create table sales2(
    orderno varchar(6) primary key,
    Orderdate date,
    Cno varchar(6),
    foreign key(Cno) references customer2(Cno)
);


-- Write SQL queries for the following

-- 1. a. Insert 5 records in each table

INSERT INTO customer2 VALUES ('C501', 'Arjun', 'MG Road', 'Kochi');
INSERT INTO customer2 VALUES ('C502', 'Meera', 'Main Street', 'Kottayam');
INSERT INTO customer2 VALUES ('C503', 'Rahul', 'Park Avenue', 'Kochi');
INSERT INTO customer2 VALUES ('C504', 'Anita', 'Station Road', 'Trivandrum');
INSERT INTO customer2 VALUES ('C505', 'Suresh', 'College Road', 'Kottayam');

INSERT INTO sales2 VALUES ('O231', '01-jan-2025', 'C501');
INSERT INTO sales2 VALUES ('O232', '03-jan-2025', 'C502');
INSERT INTO sales2 VALUES ('O233', '05-jan-2025', 'C503');
INSERT INTO sales2 VALUES ('O234', '07-jan-2025', 'C504');
INSERT INTO sales2 VALUES ('O235', '10-jan-2025', 'C505');

-- b. Update the address of customer with Cno=’C503’

 update customer2 set Address='Green street' where Cno='C503';

-- 2. a. Count the city wise number of customers

select City,count(Cno) from customer2 group by City;

-- c. Find the customer details with order no=’O234’

select * from customer2 c , sales2 s where c.Cno=s.Cno and s.orderno='O234';

-- 3. Create a view on CUSTOMER table

 create view customerviewsss as select * from customer2;
 

