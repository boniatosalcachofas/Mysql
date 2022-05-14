#repaso
use universidad;
#16
create or replace view vista_alumno_matricula_asignatura as
(
select concat_ws(' ', a.nombre, a.apellido1, a.apellido2) as 'nombre completo', 
				ifnull(a.telefono,'-'), concat_ws("-", ce.anyo_inicio, ce.anyo_fin),
                am.id_asignatura, asign.nombre
from alumno as a
inner join alumno_se_matricula_asignatura as am on a.id=am.id_alumno
inner join curso_escolar as ce on ce.id=am.id_curso_escolar
inner join asignatura as asign on asign.id=am.id_asignatura
);
select * from vista_alumno_matricula_asignatura;
#17
create or replace view vista_profesor_departamento_asignatura as (

select concat_ws(' ', p.nombre,p.apellido1,p.apellido2) as 'nombre completo', d.nombre as 'nombre departamento', ifnull(p.telefono,'-'), asign.id, asign.nombre as 'nombre asignatura'
from profesor as p
inner join asignatura as asign on asign.id_profesor=p.id
inner join departamento as d on p.id_departamento=d.id

);
select * from vista_profesor_departamento_asignatura;
#18

create or replace view vista_alumno_curso_asignatura_profesor
(
select *
        from vista_alumno_matricula_asignatura
        inner join vista_profesor_departamento_asignatura 
);
