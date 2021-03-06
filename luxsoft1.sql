/****** Скрипт для команды SelectTopNRows из среды SSMS  ******/
/*
EMPLOYEE  - таблица
поля:
ID NUMBER
DEPARTEMET_ID NUMBER
CHIEF_ID NUMBER
Name VARCHAR2(100)
Salary NUMBER
*/

--Вывести список ID отделов, количество сотрудников в которых не превышает 3 человек
select DEPARTEMET_ID, count(id) from employee group by department_id having count(id)<=3;


--Вывести список сотрудников, получающих максимальную заработную плату в своем отделе
SELECT e.* 
FROM EMPLOYEE e 
RIGHT JOIN ( 
SELECT DEPARTEMET_ID as dep, MAX(Salary) as sal 
FROM EMPLOYEE 
GROUP BY DEPARTEMET_ID 
) max_salaries 
ON e.DEPARTEMET_ID = max_salaries.dep AND e.Salary = max_salaries.sal;
