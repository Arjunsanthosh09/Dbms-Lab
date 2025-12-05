-- 1.create tables customer with the following fileds
--      colum name            type            remarks
--      cid                 integer
--      fname               varchar(10)
--      lname               varchar(50)
--      age                 integer
--      gender              varchar(5)        should allow only F or M
--      state               varchar(30)
--      pincode             integer

create table customer (
    cid integer,
    fname varchar(10),
    lname varchar(50),
    age integer,
    gender varchar(5) check(gender in ('F','M')),
    state varchar(30),
    pincode integer
);

-- 2 Create table sailors with following fields

--          fieldname            type            remarks
--          sid                  integer         primary key
--          sname                varchar(20)
--          rating               integer
--          age                  integer

create table sailor(
    sid integer primary key,
     sname varchar(20),
      rating integer,
       age integer
);

-- 3.create table boats with following fields

--          fieldname                type            remarks
--          bid                      integer         primary key
--          bname                    varchar(20)
--          color                    varchar(20)

create table boats (
    bid integer primary key,
    bname varchar (20),
    color varchar(20)
);

-- 4.create table reserves with the following fields

--         field name               type                remarks
--          sid                     integer             pk,fk
--          bid                     integer             pk,fk
--          day                     date

create table reserves(
    sid integer,
    bid integer,
    day date,
    primary key(sid, bid),
    foreign key(sid) references sailor(sid),
    foreign key(bid) references boats(bid)
);


-- 5.Display the description of customer table

dec customer;