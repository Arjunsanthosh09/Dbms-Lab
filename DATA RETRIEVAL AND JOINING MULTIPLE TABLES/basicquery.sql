-- 1.Find the names and ages of all sailors.

select sname,age from sailors;

-- 2.Retrieve the names and incremented ratings of all sailors(incremented rating=rating+5).

select sname,rating+5 as "New Rating" from sailors;

-- 3.Find the names of sailors who have reserved boat 202
select sname from sailors s, reserves r where s.sid=r.sid and r.bid=202;

-- 4.Find the names of sailors who reserved a red boat

select sname from sailors s,boats b,reserves r where s.sid=r.sid and b.bid=r.bid and b.color='Red';

--  5.Find the colors of boats reserved by tom
 
select color from boats b,sailors s,reserves r where s.sid=r.sid and b.bid=r.bid and s.sname='Tom';

-- 6.Find the names of sailors who have reserved atleast one boat

 select distinct sname from sailors s,reserves r where s.sid=r.sid;

    --  7.compute the names and incremented ratings of all sailors who have sailed two different boats on the same day(incremented rating=rating+1),The incremented rating should appear in the output as ‘newrating’.
    select distinct sname,rating+1 as "newrating" from sailors s,reserves r1,reserves r2 where s.sid=r1.sid and s.sid=r2.sid and r1.bid!=r2.bid and r1.day=r2.day;

-- 8.Find the names of sailors who have reserved a red or a gvreen boat

 select distinct sname from sailors s ,boats b,reserves r where s.sid=r.sid and b.bid=r.bid and b.color in ('Red','Green');