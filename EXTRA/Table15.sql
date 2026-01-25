-- 15.Create tables with appropriate structure to maintain information about a set of books
-- in a library and a possible set of customers.. then write needed queries for

create table books (
    book_id varchar(5) primary key,
    title varchar(30),
    author varchar(30),
    book_type varchar(15),
    language varchar(15),
    price number(6,2)
);

create table customers (
    cust_id varchar(5) primary key,
    cust_name varchar(30),
    address varchar(30),
    dues number(6,2)
);



-- 1. Inserting new records into the tables

insert into books values ('b101','time journey','adams smith','novels','english',450);
insert into books values ('b102','silent night','john ray','novels','french',380);
insert into books values ('b103','future world','adams john','science','english',520);
insert into books values ('b104','dark moon','adams lee','novels','spanish',400);
insert into books values ('b105','history path','robert brown','history','english',300);

insert into customers values ('c01','arjun','chennai',1200);
insert into customers values ('c02','meera','madurai',800);
insert into customers values ('c03','rahul','coimbatore',1500);
insert into customers values ('c04','kiran','salem',600);
insert into customers values ('c05','anita','trichy',1000);


-- 2. Display books of type “novels” in different languages

 select * from books where book_type='novels';


-- 3. Display all the details of books whose author name starts with “Adams”

select * from books where author like 'adams%';

-- 4. List of customers in the decreasing order of dues to be paid

select * from customers order by dues desc;