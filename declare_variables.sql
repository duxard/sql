/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
select c.*, s.name from chain as c inner join segment as s on c.sid=s.id

select count(c.name), s.id, s.name from chain as c inner join segment as s on c.sid=s.id
group by s.name, s.id
order by count(c.name) desc

/****************************************/

declare @var1 int;
set @var1 = (select count(id) from items)
print(@var1)
