-- 14.Create the following tables

-- TABLE : CUSTOMER

-- COLUMN NAME     DATA TYPE      CONSTRAINTS
-- Cust_id         Varchar(10)    Primary Key
-- Cust_name       Varchar(25)    Not Null
-- Acc_No          Number(10)     Foreign Key
-- Address         Varchar(25)
-- Phone_No        Number(10)

create table customer1(
    Cust_id Varchar(10) Primary Key,
    Cust_name Varchar(25) Not Null,
    Acc_No Number(10),
    Address Varchar(25),
    Phone_No Number(10),
    foreign key(Acc_No) references account1(Acc_No)
);


-- TABLE : ACCOUNT

-- COLUMN NAME     DATA TYPE   CONSTRAINTS
-- Acc_No          Number(10)  Foreign Key
-- Amount          Number(10,2)

create table account1(
    Acc_No Number(10) primary key,
    Amount Number(10,2)
);

-- Write SQL queries for the following:

-- 1. a.Insert 5 records in each Table

insert into account1 values (1001, 25000);
insert into account1 values (1002, 18000);
insert into account1 values (1003, 32000);
insert into account1 values (1004, 15000);
insert into account1 values (1005, 40000);

insert into customer1 values ('C341','arjun',1001,'chennai',9876543210);
insert into customer1 values ('C342','meera',1002,'madurai',9123456780);
insert into customer1 values ('C343','rahul',1003,'coimbatore',9988776655);
insert into customer1 values ('C344','kiran',1004,'salem',9090909090);
insert into customer1 values ('C345','anita',1005,'trichy',9567891234);

-- b. Change the address of Customer with Cust_id “C345”

 update customer1 set Address='Kerala' where Cust_id='C345';


-- 2. a.Find the customer details who have the highest balance in account

select * from customer1 where Acc_No =(select Acc_No from account1 where Amount =(select max(Amount) from account1));

-- b. Sort the CUSTOMER table on ascending order of Acc_No

 select * from customer1 order by Acc_no asc;

-- 3. Create a view on CUSTOMER Table

create view customer1view as select * from customer;