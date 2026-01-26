-- Tables Name: customer_mast

-- Attribute DataType Size Constraint
-- cust_id VARCHAR 5 Primary Key
-- name VARCHAR 20 NOT NULL
-- email VARCHAR 30 UNIQUE
-- city VARCHAR 15
-- state VARCHAR 15
-- join_date DATE
-- total_spent NUMBER 8,2 Cannot be 0

 create table customer_mast(
    cust_id varchar(5) primary key check(cust_id like 'C%'),
    name varchar(20) NOT NULL,
    email varchar(30) UNIQUE,
    city varchar(15),
    state varchar(15),
    join_date date,
    total_spent number(8,2) check(total_spent <>0)
  );

-- Table name: order_mast

-- Attribute DataType Size Constraint
-- order_id VARCHAR 6 Primary Key
-- cust_id VARCHAR 5 Foreign Key from customer_mast(cust_id)
-- order_date DATE
-- book_title VARCHAR 30 NOT NULL
-- quantity NUMBER 5 Cannot be 0
-- price NUMBER 7,2 Shoud not be negative values
-- status VARCHAR 10

create table order_mast(
     order_id varchar(6) primary key,
     cust_id varchar(5),order_date date,
     book_title varchar(30) NOT NULL,
     quantity number(5) check (quantity <>0),
     price number(7,2) check(price >0),
     status varchar(10)
);

-- Table Alter & Constraints

-- 1. Increase the size of the book_title column from 30 to 50 in order_mast.

 alter table order_mast modify book_title varchar(50);

-- 2. Add a new column discount (NUMBER 5,2) in the order_mast table.

 alter table order_mast add  discount number(5,2);

-- 3. Add a CHECK constraint on status in order_mast to allow only 'Pending', 'Shipped', 'Cancelled'.

 alter table order_mast add constraint option_status check(status in ('Pending','Shipped','Cancelled'));

-- 4. Add a NOT NULL constraint on city column in customer_mast.

 alter table customer_mast modify  city varchar(15) not null;

-- 5. Add a FOREIGN KEY constraint on cust_id in order_mast referencing
-- customer_mast(cust_id) (if not already added).

 alter table order_mast add constraint cust_fk foreign key(cust_id) references customer_mast(cust_id);

-- Basic Inserts & Selects

-- 6. Insert a minimum of 5 records in each table.

INSERT INTO customer_mast VALUES('C001','John','john@gmail.com','Miami','Florida','01-JAN-2024',300);
INSERT INTO customer_mast VALUES('C002','Jason','jason@gmail.com','Dallas','Texas','15-FEB-2024',450);
INSERT INTO customer_mast VALUES('C003','Arjun','arjun@gmail.com','Chennai','Tamil Nadu','10-MAR-2024',1200);
INSERT INTO customer_mast VALUES('C004','Jenson','jenson@gmail.com','New York','New York','20-APR-2024',800);
INSERT INTO customer_mast VALUES('C005','Meena','meena@gmail.com','Bangalore','Karnataka','05-MAY-2024',600);

INSERT INTO order_mast VALUES ('O1001','C001','05-JAN-2024','DBMS',1,450,'Pending',20);
INSERT INTO order_mast VALUES ('O1002','C002','18-FEB-2024','Java',2,550,'Shipped',30);
INSERT INTO order_mast VALUES ('O1003','C003','22-MAR-2024','Python',3,700,'Cancelled',0);
INSERT INTO order_mast VALUES ('O1004','C004','25-APR-2024','Web Tech',1,800,'Shipped',40);
INSERT INTO order_mast VALUES ('O1005','C003','12-MAY-2024','AI Basics',2,900,'Pending',50);


-- 7. List all book titles available in the order_mast table in descending alphabetical
-- order.

select book_title from order_mast order by book_title desc;

-- 8. Retrieve name, city, and state of customers in alphabetical order of state and then by name.

 select name,city,state from customer_mast order by state,name;

-- 9. List all customers not from Florida. (If Florida data is missing, first update a  record with state = 'Florida')

select name,city,state,email from customer_mast where state <>'Florida';

-- Conditional Queries

-- 10. Display details of customers C002 and C004.

select * from customer_mast where cust_id in('C002','C004');

-- 11. List all customers whose name starts with 'J' and ends with 'N'.

 select name from customer_mast where name like 'J%n';

-- 12. Change the total_spent of all customers less than 500 to 1000.

 update customer_mast set total_spent=1000 where total_spent<500;

-- Delete & Update

-- 13. Delete all orders where status is 'Cancelled'.

delete from order_mast where status='Cancelled';

-- 14. Update join_date of customers from New York to 01-JAN-2025.
 
 update customer_mast set join_date='01-JAN-2025' where city='New York';

-- Nested Queries

-- 15. List customers who have placed orders of price more than the average price of all orders.

 select * from customer_mast where cust_id in (select cust_id from order_mast where price > (select avg(price) from order_mast));

-- 16. Retrieve names of customers who have not placed any order.

select * from customer_mast where cust_id not in (select cust_id from order_mast);

-- Aggregate & Grouping

-- 17. Display total amount spent by each customer.

select c.name,o.cust_id, sum(o.price*o.quantity) as "Total spent" from order_mast o,customer_mast c where c.cust_id=o.cust_id group by o.cust_id,c.name;


-- 18. Display total orders and average price of books for each city (use GROUP BY city).

 select c.city,count(o.order_id) as "Total order",avg(o.price) as "Average price" from  order_mast o,customer_mast c where c.cust_id=o.cust_id group by c.city;

-- 19. List cities where average order price > 500 (use HAVING).

 select c.city from customer_mast c ,order_mast o where c.cust_id=o.cust_id group by c.city having avg(o.price) >500 ;