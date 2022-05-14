use viveros;

#1
select nombreCliente as 'Nombre de cliente'
from cliente
where limiteCredito = (select max(c.limiteCredito) from cliente as c where c.nombreCliente like nombreCliente);
#2
select Nombre as 'Nombre de producto'
from producto
where PrecioVenta = (select max(p.PrecioVenta) from producto as p where p.Nombre like Nombre);
#3
