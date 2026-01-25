-- 11.Create the following tables:

-- Table name: EMPLOYEE

-- COLUMN NAME     DATA TYPE       CONSTRAINTS
-- Ecode           Varchar(5)      Primary key
-- Ename           Varchar(30)     Not null
-- Bcode           Varchar(10)     Foreign key to Branch table
-- Grade           Number(2)       Only value from 1 to 10
-- Dt_jn           Date
-- salary          Number(7,2)

create table employee2(
    Ecode Varchar(5) Primary key,
    Ename Varchar(30) Not null,
    Bcode Varchar(10),
    Grade Number(2) check(grade between 1 and 10),
    Dt_jn Date,
    salary Number(7,2),
    foreign key(Bcode) references branch1(Bcode)
  );
-- Table name: BRANCH

-- COLUMN NAME     DATA TYPE       CONDITION
-- Bcode           Varchar(10)     Primary key
-- Bname           Varchar(10)     Not null

 create table branch1(
    Bcode Varchar(10) Primary key,
    Bname Varchar(10) Not null
);

-- Create SQL Queries for the following:

-- 1. a. Insert 5 records in each table

insert into branch1 values ('B101','chennai');
insert into branch1 values ('B102','madurai');
insert into branch1 values ('B103','coimbt');
insert into branch1 values ('B104','trichy');
insert into branch1 values ('B105','salem');

insert into employee2 values ('E201','arjun','B101',4,date '2023-01-10',35000);
insert into employee2 values ('E202','kiran','B102',6,date '2022-05-15',42000);
insert into employee2 values ('E203','meena','B103',3,date '2021-07-20',30000);
insert into employee2 values ('E204','rahul','B104',8,date '2020-11-25',55000);
insert into employee2 values ('E205','anita','B105',5,date '2024-03-05',38000);


-- b. Update the grade of the employee with ecode=”E201” to 5

 update employee2 set GRADE=5 where ECODE='E201';


-- 2. a.Display all employees whose salary is greater than average salary.

 select * from employee2 where SALARY >(select avg(SALARY) from employee2);

-- b. Display the ename,bname,grade of all employess

 select e.ENAME,e.GRADE,b.BNAME from employee2 e,branch1 b where e.Bcode=b.Bcode;

-- 3. Create a view on the EMP table

 create view employee2view as select * from employee2;

-- 4.Display employees who earn more than the maximum salary in branch B102.

select * from employee2 where SALARY >(SELECT MAX(SALARY) FROM employee2 WHERE Bcode='B102');

-- 5.Display employee details whose grade is equal to the highest grade in the company.

select * from employee2 where GRADE =(SELECT MAX(GRADE) FROM employee2);

-- 6.Display employees whose salary is less than at least one employee in branch B101.

 select * from employee2 where SALARY < ANY (select salary from employee2 where Bcode='B101');

-- 7.Find the employee(s) with second highest salary.

 select * from employee2 where salary = (select max(salary) from employee2 where salary <(select max(salary) from employee2));

--8 Display branch code and average salary of each branch.

select BCODE ,AVG(SALARY) as "Average salary" from employee2 group by BCODE;

-- 9 Display branches having more than 1 employee.

 select Bcode,count(Ecode) from employee group by Bcode having count(*) >1;

--10 Find the total salary paid branch-wise.

 select BCODE ,sum(salary) from employee2  group by Bcode;
  select b.BCODE ,SUM(e.SALARY) FROM employee2 e,branch1 b where e.BCODE=B.BCODE GROUP BY b.BCODE,b.BNAME;

-- 11 Display branches where average salary > 40000.

 select b.Bname,e.salary from branch1 b,employee2 e where b.Bcode=e.Bcode and e.salary > 40000 group by e.salary,b.Bname;
  select Bcode ,salary from employee2 group by Bcode,salary having salary >40000;

-- 12 Display grade-wise count of employees.

 select Grade, count(Ecode) as "Employee Count" from employee2 group by Grade ;

-- 13.Display employee name, branch name and salary for employees whose grade > 5.

 select e.Ename,b.Bname,e.salary from employee2 e,branch1 b where b.Bcode=e.Bcode and e.Grade>5;

-- 14.Display employees working in chennai branch.

 select * from employee2 e ,branch1 b where b.Bcode=e.Bcode and b.Bname='chennai';

-- 15.Display branch names which do not have any employees.

select bname from branch1 where Bcode not in (select Bcode from employee2);

-- 16.Display employee details who do not belong to branch B103.

 select * from employee where Bcode NOT IN( select Bcode from branch1 where Bcode='B103');