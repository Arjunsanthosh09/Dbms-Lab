-- 24Create the following tables:

-- TABLE : PRODUCT

-- COLUMN NAME     DATA TYPE           CONSTRAINTS
-- Product_no      Varchar(6)          Primary Key
-- Product_name    Varchar(15)         Not null
-- Qty_in_hand     Number(8)
-- Unit_price      Number(8,2)         Not null,cannot be zero

create table product (
    product_no varchar(6) primary key,
    Product_name varchar(15) not null,
    Qty_in_hand number(8),
    Unit_price number(8,2) check (Unit_price >0)
    );


-- TABLE : SALES

-- COLUMNNAME      DATATYPE        CONSTRAINTS
-- Order_no        Varchar(6)      Primary Key
-- Qty_ordered     Number(8)
-- Product_no      Varchar(6)      Foreign Key


 create table sales (
       Order_no varchar(6) primary key,
       Qty_ordered number(8),
       product_no varchar(6) ,
       foreign key(product_no) references product(product_no)
);

-- Write SQL queries for the following:

-- 1. a.Insert 5 records in each table

    insert into product values ('o510','Pen',50,10.0);
    insert into product values ('o511','pencil',50,5.0);
    insert into product values ('o512','Book',45,45.0);
    insert into product values ('o513','Sketch',45,20.0);
     insert into product values ('o514','Water bottle',35,100.0);

    insert into sales values ('o345',2,'o510');
    insert into sales values ('o346',13,'o510');
    insert into sales values ('o347',12,'o511');
    insert into sales values ('o348',32,'o512');
    insert into sales values ('o349',2,'o513');
    insert into sales values ('o350',4,'o514');

-- b.Increase the quantity ordered for Order_No = ‘O510’ to 100

     update sales set Qty_ordered=100 where Order_no='0510';

-- 2. a.Display the name of products without duplication

        select distinct(Product_name) from product;

-- b.List the Product_no,name and Qty_ordered for the order ‘o345’

     select p.Product_no,p.Product_name,s.Qty_ordered from product p , sales s where p.product_no=s.product_no and s.Order_no='o345';

-- 3. Create a view on PRODUCT table

    create view productview as select * from product;
    select * from productview;

    