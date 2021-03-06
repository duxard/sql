select a.id_class,
	   c.parameter as parameter_class, 
	   id_subclass, 
	   query2.subclassparam as parameter_subclass 
	   from A as a join C as c on a.id_class = c.id
	   inner join 
	   (select c.id, c.parameter as subclassparam from A as a join C as c on a.id_subclass = c.id) as query2 
	   on query2.id=a.id_subclass;
