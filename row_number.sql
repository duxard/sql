/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP (1000) [id]
      ,[name]
      ,[cid]
      ,[active]
  FROM [Stao].[dbo].[items]

  
  select *, row_number() over (order by cid desc) as num from items

  select * from (select *, row_number() over (order by cid desc) as RowNum from items) t2 where t2.RowNum=5

