-- 20. Create the following tables

-- TABLE NAME : EMPLOYEE

-- Column Name	    Data Type	    Constraint
-- eno	            VARCHAR(5)	    Primary Key
-- name	        VARCHAR(30)	    NOT NULL
-- designation	    VARCHAR(30)	    Trainee, Team Member, Team Head, Manager
-- salary	        NUMBER(7,2)

create table employee1(
    eno varchar(5) primary key,
    name varchar(30) not null,
    designation varchar(20) check (designation in('Trainee','Team Member','Team Head','Manager')),
    salary number(7,2)
);

-- TABLE NAME : PROJECT

-- Column Name	    Data Type	    Constraint
-- pid	            VARCHAR(5)	    Primary Key
-- proj_name	    VARCHAR(25)
-- eno	            VARCHAR(5)	    Foreign Key (references EMPLOYEE.eno)

create table project(
    PID varchar(5) primary key,
    Proj_Name varchar(25),
    eno varchar(5),
    foreign key(eno) references employee1(eno)
);


-- Write SQL queries for the following

-- 1. a. Insert 5 record in each tables

INSERT INTO employee1 VALUES ('E101', 'Rajan', 'Manager', 45000);
INSERT INTO employee1 VALUES ('E102', 'Kamal', 'Team Head', 38000);
INSERT INTO employee1 VALUES ('E103', 'Anita', 'Team Member', 28000);
INSERT INTO employee1 VALUES ('E104', 'Sajan', 'Trainee', 20000);
INSERT INTO employee1 VALUES ('E105', 'Ramesh', 'Team Member', 30000);

INSERT INTO project VALUES ('P201', 'Payroll', 'E101');
INSERT INTO project VALUES ('P202', 'Inventory', 'E102');
INSERT INTO project VALUES ('P203', 'Website', 'E103');
INSERT INTO project VALUES ('P204', 'MobileApp', 'E101');
INSERT INTO project VALUES ('P205', 'Testing', 'E102');

-- b. Increase the salary of all employees by 1500

 update employee1 set salary=salary+1500 ;


-- 2. a. Display the details of employee whose second letter of name is “a”

select * from employee1 where name like '_a%';

-- b. List the employee names and designation who is not assigned a project

 select name ,designation from employee1 where eno not in (select eno from project);

-- 3. Create a view on the EMPLOYEE table.

 create view employeeview2 as select * from employee1;