/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
--select count(*) from dbo.ITEM;

--select * from dbo.ITEM where is_active=1;


select count(tab.name), tab.name from dbo.ITEM tab where is_active=1
	group by tab.name 
	order by count(tab.name) desc;
	