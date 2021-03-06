/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
SELECT TOP (1000) [TradePoint]
      ,[Magazine]
      ,[Price]
  FROM [Stao].[dbo].[Magazines]


  select Magazine, max(price) as PRICE from Magazines group by Magazine
  
  SELECT s.* 
FROM shop s 
RIGHT JOIN ( 
SELECT Magazine as mg, MAX(Price) as pr 
FROM shop 
GROUP BY Magazine 
) ss 
ON s.Magazine = ss.mg AND s.Price = ss.pr;