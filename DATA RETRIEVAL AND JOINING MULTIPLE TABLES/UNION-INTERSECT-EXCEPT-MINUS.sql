-- 1.Find the names of all sailors who have reserved ared or a green boat

select sname from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color='Red' union select bid from boats where color='Green'));

-- 2.Find the names of all sailors who haqve reserved both red and green boats.

select sname from sailors where sid in( select sid from reserves where bid in (select bid from boats where color='Red') intersect select sid from reserves where bid in (select bid from boats where color='Green'));

-- 3.Find the names of all sailors who have reserved a red boat but not a green boat.

 select sname from sailors where sid in ( select sid from reserves where bid in ( select bid from boats where color='Red') minus (select sid from reserves where bid in(select bid from boats where color ='Green')));