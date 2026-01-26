-- 10 Create the following tables:

-- TABLE NAME: EMPLOYEE
-- COLUMN NAME	    DATA TYPE	    CONSTRAINT
-- eno	            varchar(5)	    primary key
-- name	        varchar(30)	    not null
-- designation    	varchar(30)	    trainee, team member, team head, manager
-- salary	        number(7,2)	

 create table employee3(
    eno Varchar(5) Primary key,
    name Varchar(30) Not null,
    designation Varchar(30) check (designation in ('Trainee','Team Member','Team Head','Manager')),
    salary Number(7,2)
);

-- TABLE NAME: PROJECT

-- COLUMN NAME	    DATA TYPE	    CONSTRAINT
-- pid	            varchar(5)	    primary key
-- projname	    varchar(25)	
-- eno	            varchar(5)	    foreign key (references employee.eno)

 create table project3(
    PID Varchar(5) Primary key,
    ProjName Varchar(25) ,
    eno Varchar(5),
    foreign key(eno) references employee3(eno)
  );

-- Write SQL queries for the following

-- 1. a. Insert 5 record in each tables

insert into employee3 values ('E101','Albert','Trainee',25000);
insert into employee3 values ('E102','Brian','Team Member',32000);
insert into employee3 values ('E103','Charles','Team Head',45000);
insert into employee3 values ('E104','David','Team Member',30000);
insert into employee3 values ('E105','Eva','Manager',60000);

insert into project3 values ('P01','Library System','E101');
insert into project3 values ('P02','Payroll System','E102');
insert into project3 values ('P03','Inventory App','E103');
insert into project3 values ('P04','Attendance System','E104');
insert into project3 values ('P05','ERP Module','E105');

-- a. Update the designation of the employee named “Albert”

 update employee3 set DESIGNATION='Team Member' where NAME='Albert';

-- 2. a. Display the details of employees in alphabetical order of name

 select * from employee3 order by NAME asc;

-- b. List the employee name along with the name of project assigned to him\her

 select e.NAME ,p.ProjName from employee3 e,project3 p where e.eno=p.eno ;

-- 3. Create a view on the EMPLOYEE table

create view employeeview3 as select * from employee;

-- 4.Find designation-wise total salary.

select designation,sum(salary) as "Total salary" from employee3 group by designation;

-- 5.Find designation-wise employee count.

select designation,count(ENO) as "Total count" from employee3 group by designation;

-- 6 Display employees who are not assigned to any project.

select name as "Employee not assigned project" from employee3 where eno NOT IN(select eno from project3);

-- 7. Display projects handled by Team Heads.

select p.ProjName from employee3 e,project3 p where p.eno=e.eno and e.designation='Team Head';

--8 Display employees earning more than the average salary.

select name,salary from employee3 where salary >(select avg(salary) from employee3);
