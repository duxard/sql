/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/

--select count(*) as total from items;
--select * from items inner join chain on items.cid = chain.id order by chain.name;
--select count(name), name from items where active=1  group by name;

select * from chain where id in (select top 3 cid from items group by cid order by count(cid) desc);

select distinct top(3) cid from items order by cid desc;

--select top 3 count(cid), cid from items group by cid order by count(cid) desc;

-- top 3 chains with highest account of Active items
select * from chain where id in(
	select top(3) cid from items where active=1 group by cid order by cid desc
);

или

select top(3) cid from items
where active=1
group by cid order by count(active) desc;

--count of items per each chain where chain segment is "Casual" or "Fast"
select cid, count(name) 
from items 
where cid in(
	select id from chain
	where sid in (select id from segment where name like 'Casual%' or name like 'Fast%')
)
group by cid;

--list of chains + segment names from "segment" table
select chain.*, segment.name from chain inner join segment on chain.sid = segment.id;
--таблица items + столбик с названиями чейнов
select items.*, chain.name as ChainName from items left outer join chain on items.cid=chain.id;
select items.*, chain.name as ChainName from items, chain where items.cid=chain.id;

--вывести все записи из items и проставить каждой строке соответствующее ей имя сегмента из таблицы segment 
-- (c NULL)
select items.*, segment.name as SegName from items left outer join chain
	on items.cid = chain.id left outer join segment
		on chain.sid = segment.id;
--без NULL
select items.*, segment.name as SegName from items inner join chain
	on items.cid = chain.id inner join segment
		on chain.sid = segment.id;
		
--вывести айдишники упорядоченные по количеству active=1
select count(active) as qauntity, cid from items 
	group by cid 
	order by count(active) desc; 
