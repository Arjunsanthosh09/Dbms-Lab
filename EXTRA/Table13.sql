-- 13.Create the following tables

-- TABLE: PERSONS

-- COLUMN NAME     DATA TYPE       CONSTRAINT
-- PID             Numeric(5)      Primary key
-- Fname           Varchar(15)     Not Null
-- Lname           Varchar(15)
-- Address         Varchar(20)
-- City            Varchar(10)

 create table persons(
    PID Numeric(5) Primary key,
    Fname Varchar(15) Not Null,
    Lname Varchar(15),
    Address Varchar(20),
    City Varchar(10)
);


-- TABLE :ORDER

-- Column name     Data type       Constraints
-- OID             Numeric(5)      Primary Key
-- ORDERQTY        Numeric(5)      Not Null
-- ORDERDATE       Date
-- PID             Numeric(5)      Foreign key

create table orders(
    OID Numeric(5) Primary Key,
    ORDERQTY Numeric(5) Not Null,
    ORDERDATE Date,
    PID Numeric(5),
    foreign key(PID) references persons(PID)
);

-- Write SQL queries for the following:

-- 1. a.Insert 5 records in each table

insert into persons values (101,'arjun','kumar','anna nagar','chennai');
insert into persons values (102,'meera','johnson','kk nagar','madurai');
insert into persons values (103,'rahul','sharma','rs puram','coimbatore');
insert into persons values (104,'kiran','das','new bus stand','salem');
insert into persons values (105,'anita','roy','central','trichy');

insert into orders values (575,10,'01-jan-2013',101);
insert into orders values (576,5,'05-june-2013',102);
insert into orders values (577,8,'08-june-2013',103);
insert into orders values (578,12,'10-june-2013',102);
insert into orders values (579,6,'01-jan-2025',105);


-- b.Change the order quantity of the order No=578

update orders set ORDERQTY=10 where OID=578;

-- 2. a. Display the order details placed before 09-june-2013

 select * from orders where ORDERDATE <'09-jun-2013';

-- b. List the order details of the customer ‘Johnson’

select * from orders o, persons p where o.pid = p.pid and (p.fname = 'johnson' or p.lname = 'johnson');

-- 3. create a view on ORDER table

create view ordersviews as select * from orders;
