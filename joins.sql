﻿--set comm
select * from items as i
join chain as c on i.cid=c.id join segment as s on c.sid=s.id where s.name like 'Fast%'

--second task
select top(3) count(i.active) as total, i.cid, c.name from items as i join chain as c
on i.cid=c.id
group by i.cid, c.name
order by count(i.active) desc

--third task
select top(10) count(i.name) as ItemsAmount, s.name from items as i 
join chain as c on i.cid=c.id 
join segment as s on c.sid=s.id 
where (s.name like 'Fast%' or s.name like 'Casual%')
group by s.name
order by count(i.name) desc



