-- 1.Find the names of sailors who have reserved a boat

 select sname from sailors where sid in (select sid from reserves);

--  2.Display names of sailors who have reserved a red boat

 select sname from sailors where sid in (select sid from reserves where bid in (select bid from boats where color='Red'));

--  3.Display sid and names of sailors who have not reserved a green boat.

select sid,sname from sailors where sid in ( select sid from reserves where bid in(select bid from boats where color!='Green'));

