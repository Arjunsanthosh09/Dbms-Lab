-- 1.Retrieve the number of reservations for each boat

select b.bname ,count(r.bid) as "Total reservation" from boats b join reserves r on b.bid=r.bid group by b.bname;

-- 2.Find the age of the youngest sailor for each rating level

 select rating ,min(age) as "Youngest age" from sailors group by rating;

--  3.Find the age of the youngest sailor for each rating level with atleast 2 sailors with that rating

select rating ,min(age) as "youngest age " from sailors group by rating having count(*)>=2;

-- 4.Find the age of the youngest sailors who is eligible to vote(atleat 18 years old)for each rating level with atleat two such sailors.

select rating ,min(age) as "youngest age " from sailors where age>=18 group by rating having count(*)>=2;
