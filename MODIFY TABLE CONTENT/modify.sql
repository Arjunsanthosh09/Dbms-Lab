-- 1.Rename the table sailor to sailors

rename sailor to sailors;

-- 2.Rename the field pincode in customer table to pin

alter table customer rename column pincode to pin;

-- 3.Add a new column DOB to customer table

alter table customer add dob date;

-- 4.Change the size of fname column to varchar(20)

alter table customer modify fname varchar(20);

-- 5.Add a constraint to the DOB field of customer table which allows only dates greater than ’01-jan-1980’

alter table customer add constraint dob check (dob >'01-jan-1980');

-- 6.Add a named primary key constraint ‘PK1’ to customer

alter table customer add constraint pk1 primary key(cid);

-- 7.disable the constraint temporarily

alter table customer disable constraint pk1;

-- 8.Enable the constraint 

alter table customer enable constraint pk1;

-- 9.drop the constraint permanently

alter table customer drop constraint pk1;

-- 10.Remove the column age from customer table

alter table customer drop column age;

-- 11.Recreate the named primary key constraint ‘PK1’to customer

alter table customer add constraint pk1 primary key(cid);
