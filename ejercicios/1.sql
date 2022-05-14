use Viveros;



explain select *
from producto
where nombre = 'Santolina Chamaecyparys';

use Viveros;
explain select *
from cliente
where nombreContacto='Javier' ;#pellidoContacto='Villar';

use Viveros;
explain select *
from pago
where year(fechapago)=2020;

use Viveros;
explain select *
from pago
where fechapago>='2020-01-01' and fechapago<= '2020-12-31';

use Viveros;
explain select *
from pago
where fechapago between '2020-01-01' and '2020-12-31';