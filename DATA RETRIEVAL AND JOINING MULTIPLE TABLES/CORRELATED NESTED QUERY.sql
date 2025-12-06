-- 1.Find the names of all sailors who have reserved atleast one boat

select sname from sailors s where exists(select 1 from reserves r where s.sid=r.sid);

-- 2.Find the names of all sailors who have reserved boat number 201

 select sname from sailors s where exists(select 1 from reserves r where s.sid=r.sid and bid=201);