-- a)Abs

select sname ,abs(age-30) as "Absolute age" from sailors;

-- b)ceil

 select sname,ceil(age/5) as "age ceil" from sailors;

-- c)Floor

 select sname,floor(age/5) as "age ceil" from sailors;

-- d)Trunc

select sname,trunc(age/5,0) as "age_trun" from sailors;

-- e)mod

 select sname,mod(age,10) as "age_mod" from sailors;

-- f)power

select sname,power(age,2) as "age_power" from sailors;

-- g)Sqrt

select sname,sqrt(age) as "age_sqrt" from sailors;

-- h)round

select sname,round(age/3,2) as "age_round" from sailors;

-- i)log

 select sname,log(age,3) as "age_log" from sailors;

-- j)sign

  select sname,sign(age-30) as "age_sign" from sailors;

-- k)least

 select sname,least(age, rating*5, 30) as "age_least" from sailors;

-- l)Greatest

 select sname,greatest(age, rating*5, 30) as "age_least" from sailors;