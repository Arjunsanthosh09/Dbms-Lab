-- 19. Create the following tables:

-- TABLE : STUDENT

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Roll_no         Number(5)       Primary Key
-- Name            Varchar(20)     Not null
-- Dept_id         Number(4)       Foreign Key
-- Gender          Varchar(2)
-- Contact_no      Number(10)

 create table student1(
    Roll_no Number(5) Primary Key,
    Name Varchar(20) Not null,
    Dept_id Number(4),
    Gender Varchar(2),
    Contact_no Number(10),
    foreign key(Dept_id) references department(Dept_id)
    );

-- TABLE : DEPARTMENT

-- COLUMN NAME     DATA TYPE   CONSTRAINTS
-- Dept_id         Number(4)   Primary Key
-- Dept_name       Varchar(10) Not null

create table department(
  Dept_id Number(4) Primary Key,
  Dept_name Varchar(10) Not null
);


-- Write SQL queries for the following

-- 1. a. Insert 5 records in each table

INSERT INTO department VALUES (101, 'COMPUTER');
INSERT INTO department VALUES (102, 'MECHANICAL');
INSERT INTO department VALUES (103, 'ELECTRICAL');
INSERT INTO department VALUES (104, 'CIVIL');
INSERT INTO department VALUES (105, 'IT');

INSERT INTO student1 VALUES (1, 'Anil', 101, 'M', 9876543210);
INSERT INTO student1 VALUES (2, 'Anita', 101, 'F', 9876543211);
INSERT INTO student1 VALUES (3, 'Rahul', 102, 'M', 9876543212);
INSERT INTO student1 VALUES (4, 'Meera', 103, 'F', 9876543213);
INSERT INTO student1 VALUES (5, 'Suresh', 104, 'M', 9876543214);

-- b. Update the department name of deptid=103 to “ELECTRONICS”

update department set Dept_name='ELECTRONIC' where Dept_id=103;

-- 2. a. Display the departments names in its alphabetical order. 

 select Dept_name from department order by Dept_name asc;

-- b.Display the details of students in COMPUTER APPLICATION Department

 select * from student1 s ,department d where s.Dept_id=d.Dept_id and d.Dept_name='COMPUTER';


-- 3. Create a view from STUDENT table

create view studentviewss as select * from student1;
