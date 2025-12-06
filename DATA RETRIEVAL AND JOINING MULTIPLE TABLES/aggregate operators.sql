-- 1.find the average rating of all sailors

select AVG(rating) as "Average Rating" from sailors;

-- 2.Retrieve the total number of sailors.

 select count(*) as "Total count" from sailors;

--  3.Find the average of all sailors with a rating of 20

select AVG(rating) as "Average Rating" from sailors where rating=20;

-- 4.Find the names and age of oldest sailors

 select sname,age from sailors where age in(select max(age) from sailors);

--  5.Find the names of sailors who are older than the oldest sailor with rating of 24

 select sname from sailors where age in(select max(age) from sailors where rating =24);