use Viveros;

#1
select count(codEmpleado) as 'Numero de empleados'
from empleado;
#2
select Pais, count(codCliente) as 'Cantidad cliente'
from cliente
group by Pais;
#3
select round(avg(importeTotal),2) as 'media', year(fechaPago) as 'fecha' from pago
where year(fechaPago)=2019;
#4
select estado, count(codPedido) as 'Numero de pedidos' 
from pedido
group by estado;
#5
select max(precioVenta) as 'Precio maximo', min(precioVenta) as 'Precio minimo'
from producto;
#6
select Ciudad, count(codCliente) as 'Cantidad clientes'
from cliente
group by Ciudad
HAVING Ciudad like 'Madrid';
#7
select Ciudad, count(codCliente) as 'Cantidad clientes'
from cliente
group by Ciudad
HAVING Ciudad like 'M%';
#8
select e.nombre, count(codCLiente) as 'Cantidad clientes'
from empleado as e
inner join cliente as c
on e.codEmpleado = c.codEmpleadoVentas
group by e.codEmpleado;
#9
select count(codCLiente) as 'Numero de clientes'
from cliente
where codEmpleadoVentas is null;
#10
select concat_ws(' ', c.nombreContacto, ifnull(c.apellidoCOntacto,'-')) as 'Nombre contacto', max(p.fechaPago) as 'Mas reciente', min(p.fechaPago)as 'Menos reciente'
from cliente as c
inner join pago p on p.codCliente = c.codCliente
group by c.nombreContacto,c.apellidoContacto;
#11
select codPedido, count(codProducto) as 'Cantidad productos'
from detalle_pedido
group by codPedido;
#12




