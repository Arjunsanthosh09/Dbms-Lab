-- 22 Create the following tables:

-- Table name: EMPLOYEE

-- COLUMN NAME        DATA TYPE        CONSTRAINTS
-- Ecode              Varchar(5)       Primary key
-- Ename              Varchar(30)      Not null
-- Bcode              Varchar(10)      Foreign key to Branch table
-- Grade              Number(2)        Only value from 1 to 10
-- Dt_jn              Date
-- salary             Number(7,2) 

create table employee(
    Ecode Varchar(5) Primary key,
    Ename Varchar(30) Not null,
    Bcode Varchar(10),
    Grade Number(2) check (Grade between 1 and 10),
    Dt_jn Date,
    salary Number(7,2),
    foreign key(Bcode) references branch(Bcode)
);

-- Table name: BRANCH

-- COLUMN NAME         DATA TYPE       CONDITION
-- Bcode               Varchar(10)     Primary key
-- Bname               Varchar(10)     Not null

create table branch(
       Bcode Varchar(10) Primary key,
       Bname Varchar(10) not null
);


-- Create SQL Queries for the following:

-- 1. a. Insert 5 records in each table

    INSERT INTO branch VALUES ('B101', 'KOTTAYAM');
    INSERT INTO branch VALUES ('B102', 'ERNAKULAM');
    INSERT INTO branch VALUES ('B103', 'TRIVANDRUM');
    INSERT INTO branch VALUES ('B104', 'CALICUT');
    INSERT INTO branch VALUES ('B105', 'THRISSUR');

    INSERT INTO employee VALUES ('e201', 'Arjun', 'B101', 3, '01-jan-2025', 35000);
    INSERT INTO employee VALUES ('e202', 'Meera', 'B102', 5, '05-jan-2025', 42000);
    INSERT INTO employee VALUES ('e203', 'Rahul', 'B101', 7, '10-jan-2025', 50000);
    INSERT INTO employee VALUES ('e204', 'Anita', 'B103', 4, '15-jan-2025', 38000);
    INSERT INTO employee VALUES ('e205', 'Vijay', 'B104', 6, '20-jan-2025', 46000);

-- b. Update the grade of the employee with ecode=”e201” to 5

    update employee set grade=5 where Ecode='e201';


-- 2. a.Display the maximum and minimum salary of each grade of employees

    select grade, max(salary) as "Max salary" ,min(salary) as "Minimum salary" from employee group by grade;

-- b. Display the details of employees in the KOTTAYAM branch

     select * from employee e ,branch b where e.Bcode=b.Bcode and b.Bname='KOTTAYAM';


-- 3. Create a view on the EMP table

     create view employeeviews as select * from employee;
    select * from employeeviews;