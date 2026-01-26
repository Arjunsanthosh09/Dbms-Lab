8 Create the following tables:
TABLE: CUSTOMER
Column name Data type Size Constraints
Cust_id Varchar 10 Primary Key
Fname Varchar 25 Not Null
Lname Varchar 25
Area Varchar 10 Kottayam ,Kollam, Kochi
Phone_number Numeric 15

TABLE : INVOICE
Column Name Data type Size Constraints
Inv_no Varchar 20 Primary Key
Cust_id Varchar 10 Foreign Key
Issue_date Date

Write SQL queries for the following:

1. a. Insert 5 records in each table
b. Change the issue date to 24/7/08 of cust_id ‘101’
2. a. Find the issue date for the customer ‘JOHNS’.
b. List the customer name and invoice number of all customers
 4. Construct an English Sentence like “The customer with Customer id cust_id invoice
no is Inv_no ”
3. Create a view on CUSTOMER table

