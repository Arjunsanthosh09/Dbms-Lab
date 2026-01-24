-- 21. Create the following tables:

-- Table Name: MOVIE

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Mvno            Number(2)       Primary key
-- Title           Varchar(25)     Not null, unique
-- Type            Varchar(10)     Only comedy,action,horror
-- Star            Varchar(25) 
-- Price           Number(10,2)

create table movie(
    Mvno Number(2) Primary key,
    Title Varchar(25) Not null unique,
    Type Varchar(10) check(Type in ('comedy','action','horror')),
    Star Varchar(25),
    Price Number(10,2)
);


-- Table name: INVOICE

-- COLUMN NAME     DATATYPE    CONDITION
-- Invno           Number(2)   Primary key
-- Mvno            Number(2)   Foreign key
-- Issue _date     Date 

create table invoice(
    Invno Number(2) Primary key,
    Mvno Number(2),
    Issue_date Date,
    foreign key(Mvno) references movie(Mvno)
);


-- Write SQL queries for the following.

-- 1. a. Insert 5 records in each table

INSERT INTO movie VALUES (11, 'JOKER', 'action', 'Joaquin Phoenix', 450.00);
INSERT INTO movie VALUES (12, 'THE MASK', 'comedy', 'Jim Carrey', 300.00);
INSERT INTO movie VALUES (13, 'CONJURING', 'horror', 'Vera Farmiga', 400.00);
INSERT INTO movie VALUES (14, 'AVENGERS', 'action', 'Robert Downey Jr', 600.00);
INSERT INTO movie VALUES (15, 'HOME ALONE', 'comedy', 'Macaulay Culkin', 350.00);

INSERT INTO invoice VALUES (1, 11, '01-jan-2025');
INSERT INTO invoice VALUES (2, 12, '03-jan-2025');
INSERT INTO invoice VALUES (3, 14, '05-jan-2025');
INSERT INTO invoice VALUES (4, 11, '07-jan-2025');
INSERT INTO invoice VALUES (5, 15, '10-jan-2025');

-- b.Change the star details of the movie with movie_no =12

update movie set Star='Stephen devasya' where Mvno=12;

-- 2. a. Calculate the average price of each movie type

select Type,avg(Price) as "Average Price" from movie group by Type;

-- b. Display the Movie name and type of movies that are not issued

select Title,Type from movie where Mvno not in (select Mvno from invoice);

-- 2. Create a view on the MOVIE table

create view movieview as select * from movie;