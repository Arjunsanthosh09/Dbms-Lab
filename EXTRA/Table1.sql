--  1)	a) Create the relation to show salesman information called as salesman_master with the following attributes:
-- Attributes	DataType	Size	Attribute Description
-- Salesmanno	Varchar	6	Primarykey, first letter must start with ‘S’
-- Salesmanname	Varchar	10	Should not be null
-- Address1	Varchar	10	Should not be null
-- City	Varchar	10	
-- Pincode	Number	8	
-- State	Varchar	10	
-- Salamt	Number	8	Not null,cannot be 0
-- Salesamt	Number	10	Not null
-- Remarks	Varchar	20	Not null

 
 
 create table salesman_master(
               salesmanno varchar(20) primary key,
               salesmanname varchar(20) NOT NULL,
               address1 varchar(10),
               city varchar(10),
               pincode number(8),
               state varchar(10),
               salaamt number(8) NOT NULL check(salaamt >0),
               salesamt number(10) NOT NULL,
               remarks varchar(20) NOT NULL,
              CONSTRAINT check_saleno check(salesmanno like 's%')
);

-- Insert a minimum of 4 records.

INSERT INTO Salesman_Master 
VALUES ('s001', 'Ramesh', 'Street12', 'Mumbai', 400001, 'MH', 15000, 250000, 'Good Performer');

INSERT INTO Salesman_Master 
VALUES ('s002', 'Anita', 'Lane45', 'Chennai', 600018, 'TN', 20000, 300000, 'Top Sales');

INSERT INTO Salesman_Master 
VALUES ('s003', 'Rahul', 'Road89', 'Delhi', 110020, 'DL', 18000, 270000, 'Experienced');

INSERT INTO Salesman_Master 
VALUES ('s004', 'Sneha', 'Block7', 'Kochi', 682001, 'KL', 22000, 320000, 'New Joiner');


-- 1.	Find the names of salesmen who have a salary of 2000 to 5000 both inclusive. Order the result in the descending order of the names.

select salesmanname from salesman_master where salaamt between 2000 and 5000 order by  salesmanname desc;

-- 2.	Change the city of the salesman “S003” to Mumbai.

update salesman_master set city='Mumbai' where salesmanno='s003';

-- 3.	Change the size of the Salesmanname  column size to varchar2(25 )

alter table salesman_master modify salesmanname varchar(25);  

-- 4.	What is Martin Jane’s address and sales amount?
-- ( If Martin Jane’s record is not present insert/update the record)

insert into salesman_master values('s005','Martin Janes','Lasvegs','Newyork',681001,'Us',15000,250000,'Experienced'); 
select address1,salaamt from salesman_master where salesmanname='Martin Janes';

-- 5.	List the names of all salesmen having ‘n’ as the third letter in their names.

 select salesmanname from salesman_master where salesmanname like '__n%';

--  6.	Change the size of the Salesmanname  column size to varchar2(25 )

