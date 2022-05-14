#1
use Supermercado;
insert into
Proveedor
values (69, "juanjo el dinosaurio");
#2
use Supermercado;
insert into
Proveedor(Nombre)
values ("juanjo el dinosaurio");
#3
use Supermercado;
insert into
Producto
values (134, "yoshi", 23, 69);
#4
use Supermercado;
insert into
Producto(Nombre, Precio, CodProveedor)
values ("ysssshi", 23, 69);
#5
DROP TABLE IF EXISTs proveedores_productos;
create table proveedores_productos(
nombre_proveedor varchar(50),
nombre_producto varchar(50),
precio int
);
insert into
proveedores_productos(nombre_producto,nombre_proveedor,precio)
select prod.nombre, prov.nombre, prod.precio
from Producto as prod
inner join Proveedor as prov on prod.codProveedor=prov.codProveedor;

#gobierno
#4
use Gobierno;
insert into
miembro
value(128,123,"juan el guapo", "de los largos montes","bill el botas",2);
#5
############################

SET GLOBAL log_bin_trust_function_creators = 1;

#1
delimiter $$
create function f_calcular_precio_total_pedido(codigo_pedido int)
returns float 
begin
declare total float;

set total=(select sum(cantidad*preciounidad)
from detalle_pedido
where codPedido=codigo_pedido);

return total;
end

$$

delimiter ;

select codPedido, f_calcular_precio_total_pedido(codPedido)
from pedido;

#2
delimiter $$
create function f_calcular_suma_pedidos_cliente (cliente int)

returns float

begin 

declare total float; 

set total=(select sum(f_calcular_precio_total_pedido(codPedido))
from pedido
where codCliente = cliente
);

return ifnull(total,0);

end

$$

delimiter ;

select nombreCliente,f_calcular_suma_pedidos_cliente(codcliente)
from cliente;


#3
delimiter $$
create function f_calcular_pagos_cliente (cliente int)

returns float

begin 

declare total float; 

set total=(select sum(ImporteTotal)
from pago
where codCliente=cliente);

return ifnull(total,0);

end

$$

delimiter ;

select codCliente,f_calcular_pagos_cliente (1) as 'Total Pagos'
from pago
limit 1;





#4
delimiter $$
create procedure pa_nombreCliente_ImportePagosPendientes ()
begin

select nombreCliente, f_calcular_suma_pedidos_cliente(codCliente) - f_calcular_pagos_cliente(codCliente) 
from cliente;

end $$
delimiter ;
call pa_nombreCliente_ImportePagosPendientes ();


#5

delimiter $$
create function f_Pedido_cliente_fecha (pedido int)

returns varchar (70)

begin 

declare cadena varchar (70); 

set cadena=(select concat_ws(' ',nombreCliente,'compro el',date_format(fechaPedido, '%d/%m/%Y'))
from cliente c inner join pedido p on c.codCliente=p.codCliente
where p.codPedido=pedido);

return cadena;

end

$$

delimiter ;

select f_Pedido_cliente_fecha (1);

#6

use Viveros;
drop function if exists f_Producto_codProducto;
delimiter $$
create function f_Producto_codProducto(codProductoElegido varchar(15))

returns varchar (70)

begin 

declare nombre varchar (70); 

set nombre=(select p.nombre from producto as p
			where p.codProducto = codProductoElegido);

return nombre;

end 
$$


select f_Producto_codProducto('OR-108');

#7
drop procedure if exists nombre_prodPedido;
delimiter $$
create procedure nombre_prodPedido (codPedidoEleccion int)
begin

select codProducto, f_Producto_codProducto(codProducto) 
from detalle_pedido
where codPedido = codPedidoEleccion;

end $$

drop procedure if exists nombre_prodPedido;
delimiter $$
create procedure nombre_prodPedido (codPedidoEleccion int)
begin

select codProducto, f_Producto_codProducto(codProducto) 
from detalle_pedido
where codPedido = codPedidoEleccion;

end $$


delimiter ;
call nombre_prodPedido(1);

#8

drop function if exists f_gmail_tienda;
delimiter $$
create function f_gmail_tienda(codTiendaElegida varchar(10))

returns varchar (70)

begin 

declare correo varchar (70); 

set correo=(select concat(codTienda,Ciudad,'@viderosdelmundo.org')
			from tienda
			where codTienda = codTiendaElegida);

return correo;

end 
$$

select f_gmail_tienda('BCN-ES') as 'correo';

#9
drop table if exists tienda_email
create table tienda_email(

codTienda varchar(10)
email varchar(50)

)