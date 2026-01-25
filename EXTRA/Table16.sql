-- 16.Create tables with appropriate structure to store information about a number of items
-- to be kept in stock in a provision store and the details about the sales on a given day.

create table item (
    item_id     varchar(6) primary key,
    item_name   varchar(20) not null,
    category    varchar(15),
    unit_price  number(8,2) check (unit_price > 0),
    stock_qty   number(5) check (stock_qty >= 0)
);


create table sales1 (
    sale_id      varchar(6) primary key,
    item_id      varchar(6),
    sale_date    date,
    qty_sold     number(5) check (qty_sold > 0),
    total_amount number(10,2),
    foreign key (item_id) references item(item_id)
);


-- Then write the needed queries to

-- 1. Inserting meaningful data into tables

insert into item values ('i001', 'rice', 'grocery', 50.00, 100);
insert into item values ('i002', 'wheat', 'grocery', 40.00, 80);
insert into item values ('i003', 'sugar', 'grocery', 45.00, 60);
insert into item values ('i004', 'oil', 'grocery', 150.00, 40);
insert into item values ('i005', 'dal', 'grocery', 90.00, 70);

insert into sales1 values ('s001', 'i001', date '2025-01-01', 5, 250.00);
insert into sales1 values ('s002', 'i002', date '2025-01-01', 3, 120.00);
insert into sales1 values ('s003', 'i003', date '2025-01-01', 2, 90.00);
insert into sales1 values ('s004', 'i004', date '2025-01-01', 1, 150.00);
insert into sales1 values ('s005', 'i005', date '2025-01-01', 4, 360.00);

-- 2. Displaying the items in stock category wise

 select item_name,category,stock_qty from item order by category;


-- 3. Details of sales made on a given day item wise

select i.item_id,i.item_name,s.qty_sold,s. total_amount from item i ,sales1 s where s.item_id=i.item_id and s.sale_date='01-JAN-2025';


-- 4. Display the sales bill with maximum amount on that day

 select * from sales1 where total_amount=(select max(total_amount) from sales1 where sale_date='01-JAN-2025');