-- 24Create the following tables:

-- TABLE : PRODUCT

-- COLUMN NAME     DATA TYPE           CONSTRAINTS
-- Product_no      Varchar(6)          Primary Key
-- Product_name    Varchar(15)         Not null
-- Qty_in_hand     Number(8)
-- Unit_price      Number(8,2)         Not null,cannot be zero

-- TABLE : SALES

-- COLUMNNAME      DATATYPE        CONSTRAINTS
-- Order_no        Varchar(6)      Primary Key
-- Qty_ordered     Number(8)
-- Product_no      Varchar(6)      Foreign Key

-- Write SQL queries for the following:

-- 1. a.Insert 5 records in each table
-- b.Increase the quantity ordered for Order_No = ‘O510’ to 100
-- 2. a.Display the name of products without duplication
-- b.List the Product_no,name and Qty_ordered for the order ‘o345’
-- 3. Create a view on PRODUCT table