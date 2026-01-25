-- 12Create the following tables:

-- Table Name: MOVIE

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Mvno            Number(2)       Primary key
-- Title           Varchar(25)     Not null, unique
-- Type            Varchar(10)     Only comedy,action,horror
-- Star            Varchar(25)
-- Price           Number(10,2)

 create table movie1(
    Mvno Number(2) Primary key,
    Title Varchar(25) Not null unique,
    Type Varchar(10) check(Type in ('comedy','action','horror')),
    Star Varchar(25),
    Price Number(10,2)
);


-- Table name: INVOICE

-- COLUMN NAME     DATATYPE        CONDITION
-- Invno           Number(2)       Primary key
-- Mvno            Number(2)       Foreign key
-- Issue _date     Date 

create table invoice1(
    Invno Number(2) Primary key,
    Mvno Number(2),
    Issue_date Date,
    foreign key(Mvno) references movie1(Mvno)
);


-- Write SQL queries for the following.

-- 1. a. Insert 5 records in each table

insert into movie1 values (11,'fun time','comedy','adam sandler',250);
insert into movie1 values (12,'dark force','action','tom hardy',300);
insert into movie1 values (13,'night scream','horror','emily rose',280);
insert into movie1 values (14,'laugh riot','comedy','jim carrey',260);
insert into movie1 values (15,'war zone','action','chris evans',320);

insert into invoice1 values (1,11,'01-jan-2025');
insert into invoice1 values (2,12,'05-jan-2025');
insert into invoice1 values (3,13,'10-jan-2025');
insert into invoice1 values (4,14,'15-jan-2025');
insert into invoice1 values (5,15,'20-jan-2025');

-- b.Increase the price of all movies by 10

update movie1 set price=price+10 ;

-- 2. a. List the movies in sorted order of their title

 select * from movie1 order by TITLE asc;


-- b. List the title and title for all the movie that are issued

 select TITLE,TYPE from movie1 where Mvno in(select Mvno from invoice1);


-- 3. Create a view on the MOVIE table

create view movie1view as select * from movie1;