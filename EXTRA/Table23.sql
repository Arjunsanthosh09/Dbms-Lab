-- 23. Create the following tables

-- TABLE : CUSTOMER

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Cust_id         Varchar(10)     Primary Key
-- Cust_name       Varchar(25)     Not Null
-- Acc_No          Number(10)      Foreign Key
-- Address         Varchar(25)
-- Phone_No        Number(10)

    create table customer12(
       Cust_id Varchar(10) Primary Key,
       Cust_name Varchar(25) Not Null,
       Acc_No Number(10),
       Address Varchar(25),
       Phone_No Number(10),
       foreign key(Acc_No) references account(Acc_no)
    );

-- TABLE : ACCOUNT

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Acc_No          Number(10)      Foreign Key
-- Amount          Number(10,2)

    create table account (
       Acc_No Number(10) primary key,
       Amount Number(10,2)
    );


-- Write SQL queries for the following:

-- 1. a.Insert 5 records in each 

    INSERT INTO account VALUES (1001, 5000.50);
    INSERT INTO account VALUES (1002, 12000.75);
    INSERT INTO account VALUES (1003, 8000.00);
    INSERT INTO account VALUES (1004, 15000.25);
    INSERT INTO account VALUES (1005, 3000.00);

    INSERT INTO customer12 VALUES ('C001', 'Arjun', 1001, 'Kochi', 9876543210);
    INSERT INTO customer12 VALUES ('C002', 'Rahul', 1002, 'Trivandrum', 9123456780);
    INSERT INTO customer12 VALUES ('C003', 'Anu',   1003, 'Calicut',  9012345678);
    INSERT INTO customer12 VALUES ('C004', 'Meera', 1004, 'Thrissur', 9988776655);
    INSERT INTO customer12 VALUES ('C005', 'Akhil', 1005, 'Palakkad', 8899776655);


-- b. Change the phone number of Customer with name=”Anjali”

    update customer12 set Phone_No=8590939674 where Cust_name='Anjali';

-- 2. a.Display the acc_no, name, address of customers whose name starts with ‘L’

     select c.Cust_name,c.Cust_name ,a.Acc_No from  customer12 c ,account a where a.Acc_No=c.Acc_No and c.Cust_name like 'L%';

-- b.Find the customer details who have the lowest balance in account

     select c.Cust_name,c.Acc_No,c.Address,c.Phone_No,a.Amount from customer12 c,account a where a.Acc_No=c.Acc_No and a.Amount=(select min(Amount) from account);

-- 3. Create a view on CUSTOMER Table

        create view customerview as select * from customer12;
        select * from customerview;
        
