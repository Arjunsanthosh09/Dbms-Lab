-- 17.Create the following tables:

-- TABLE :BOOK

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- BookID          Varchar(6)      Primary Key
-- BookName        Varchar(15)     Not null
-- Author_Name     Varchar(15)
-- Publisher       Varchar(20)
-- Unit_price      Number(8,2)     Not null,cannot be zero
-- Quantity        Number(3)

 create table book(
    BookID Varchar(6) Primary Key,
    BookName Varchar(15) Not null,
    Author_Name Varchar(15),
    Publisher Varchar(20),
    Unit_price Number(8,2) Not null check(Unit_price <>0),
    Quantity Number(3)
);


-- TABLE: ISSUE

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Issue_ID        Varchar(6)      Primary Key
-- BookId          Varchar(6)      Foreign Key
-- Qty_Issued      Number(3)

create table issue(
    Issue_ID Varchar(6) Primary Key,
    BookId Varchar(6),
    Qty_Issued Number(3),
    foreign key(BookId) references book(BookId)
);


-- Write SQL queries for the following:

-- 1. a.Insert 5 records in each table

INSERT INTO book VALUES ('B001', 'Data Structures', 'Sahni', 'Pearson', 450.00, 20);
INSERT INTO book VALUES ('B002', 'DBMS', 'Korth', 'McGrawHill', 550.00, 15);
INSERT INTO book VALUES ('B003', 'Operating Sys', 'Silberschatz', 'Wiley', 600.00, 10);
INSERT INTO book VALUES ('B004', 'Computer Net', 'Tanenbaum', 'Pearson', 500.00, 8);
INSERT INTO book VALUES ('B005', 'Java Prog', 'Herbert', 'OraclePress', 400.00, 12);

INSERT INTO issue VALUES ('I001', 'B001', 2);
INSERT INTO issue VALUES ('I002', 'B002', 1);
INSERT INTO issue VALUES ('I003', 'B003', 3);
INSERT INTO issue VALUES ('I004', 'B001', 1);
INSERT INTO issue VALUES ('I005', 'B002', 2);


-- b.Increase the quantity of the book with name “Data Structures” by 10

 update book set Quantity=Quantity+10 where BookName='Data Structures';


-- 2. a.Find the number of unique publishers

 select distinct(Publisher) from book;

 
-- b.Display the BookId,Book Name and Quantity issued for all books which are not issued

 select BookID,BookName,Quantity from book where BookID NOT IN (select BookID from issue);

-- 3. Create a View on the BOOK Table

 create view bookview as select * from book;

