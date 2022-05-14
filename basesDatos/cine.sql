drop database if exists Cine;
create database Cine;
use Cine;
create table pais
(
idPais int primary key not null,
Nombre varchar(50)
);
CREATE TABLE director
(
 idDirector int auto_increment primary KEY,
 nombre VARCHAR(50) ,
 codPais int,
 fechaNacimiento DATE,
 constraint fk_director_pais
 foreign key (codPais) references pais(idPais)
);

CREATE TABLE pelicula
(
 titulo VARCHAR(50) PRIMARY KEY,
 anyo INT NOT NULL,
 codPais int,
 idioma VARCHAR(50),
 color boolean,
 observ VARCHAR(50),
 director int NOT NULL,
 constraint fk_pelicula_pais
 foreign key (codPais) references pais(idPais),
 CONSTRAINT fk_pelicula_director
 FOREIGN KEY (director)
 REFERENCES director(idDirector)
);

CREATE TABLE actor
(
idActor int auto_increment primary key,
 nombre VARCHAR(50),
 CodPais int,
 constraint fk_actor_pais
 foreign key (codPais) references pais(idPais)
);
 
CREATE TABLE reparto
(
 idActor int,
 titulo VARCHAR(50),
 personaje VARCHAR(50) NOT NULL,
 CONSTRAINT pk_reparto
 PRIMARY KEY(idactor, titulo),
 CONSTRAINT fk_reparto_actor
 FOREIGN KEY(idActor)
 REFERENCES actor(idActor),
 CONSTRAINT fk_reparto_pelicula
 FOREIGN KEY(titulo)
 REFERENCES pelicula(titulo)
);


use Cine;

insert into pais values(1,'EEUU');
insert into pais values(2,'Reino Unido');
insert into pais values(3,'España');


INSERT INTO director VALUES (1,'Woody Allen',1,'1935-12-01');
INSERT INTO director VALUES (2,'Stanley Kubrick',2,'1928-07-26');
INSERT INTO director VALUES (3,'Alfred Hitchcock',2,'1899-08-13');
INSERT INTO director VALUES (4,'Luis García Berlanga',3,'1921-06-12');

INSERT INTO actor VALUES (1,'Kirk Douglas', 1);
INSERT INTO actor VALUES (2,'Mia Farrow', 1);
INSERT INTO actor VALUES (3,'Doris Day', 1);
INSERT INTO actor VALUES (4,'James Stewart', 1);
INSERT INTO actor VALUES (5,'Cary Grant', 1);
INSERT INTO actor VALUES (6,'Woody Allen', 1);
INSERT INTO actor VALUES (7,'James Dean', 1);
INSERT INTO actor VALUES (8,'Pepe Isbert', 3);

INSERT INTO pelicula VALUES ('El hombre que sabía demasiado', 1956, 1, 'Inglés', 1,  NULL,3);
INSERT INTO pelicula VALUES ('Hannah y sus hermanas', 1986, 1, 'Inglés', 1,  NULL,1);
INSERT INTO pelicula VALUES ('Senderos de gloria', 1957, 1, 'Inglés', 0,  NULL,2);
INSERT INTO pelicula VALUES ('Con la muerte en los talones', 1957, 1, 'Inglés', 1,NULL, 3);
INSERT INTO pelicula VALUES ('Bienvenido, Mister Marshall', 1953, 3, 'Castellano', 0,NULL, 4);

INSERT INTO reparto VALUES (6, 'Hannah y sus hermanas', 'Mickey');
INSERT INTO reparto VALUES (2, 'Hannah y sus hermanas', 'Hannah');
INSERT INTO reparto VALUES (5, 'Con la muerte en los talones', 'Roger O. Thornbill');
INSERT INTO reparto VALUES (3, 'El hombre que sabía demasiado', 'Linda Mckenna');
INSERT INTO reparto VALUES (4, 'El hombre que sabía demasiado', 'Benjamin Mckenna');
INSERT INTO reparto VALUES (1, 'Senderos de gloria', 'Coronel Dax');
INSERT INTO reparto VALUES (8, 'Bienvenido, Mister Marshall', 'Don Pablo');