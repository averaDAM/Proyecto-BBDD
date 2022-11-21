-- Nombre alumnos/as: Randy Achana, Adrian Vera
-- Tema específico del proyecto: El Señor de los anillos
-- Nº de etapa: UT2

/*
DISEÑO FÍSICO (RA2)
A continuación, implementa en lenguaje SQL todas las sentencias necesarias para generar la BD. Las sentencias SQL, además de las tablas, deben incluir la creación de la BD.
*/
DROP DATABASE IF EXISTS bdSeniorAnillos;
CREATE DATABASE bdSeniorAnillos;
USE bdSeniorAnillos;

CREATE TABLE Personajes(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) NOT NULL,
    apellidos VARCHAR(50) NOT NULL,
    sobrenombre VARCHAR(50) UNIQUE NOT NULL,
    genero ENUM("Femenino", "Masculino", "No establecido") NOT NULL,
    fecha_nacimiento DATE NOT NULL,
    fecha_muerte DATE,
    raza VARCHAR(50) NOT NULL,
    especialista VARCHAR(50),
    titulo VARCHAR(50),
    color_pelo VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Razas(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    altura_media DECIMAL(3,2) UNSIGNED,
    peso_medio DECIMAL(5,2) UNSIGNED,
    caracteristicas_propias VARCHAR(500) NOT NULL
);

CREATE TABLE IF NOT EXISTS Armas(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion VARCHAR(500),
    alcance DECIMAL(5, 2) UNSIGNED NOT NULL,
    tipo ENUM("Espada", "Arco", "Hacha", "Lanza", "Escudo", "Cuchillo", "Maza") NOT NULL,
    fabricante VARCHAR(50) NOT NULL
);

CREATE TABLE IF NOT EXISTS Titulos(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
	nombre VARCHAR(50) UNIQUE NOT NULL,
    descripcion VARCHAR(500)
);

CREATE TABLE IF NOT EXISTS Anillos(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    numero INTEGER UNSIGNED UNIQUE NOT NULL,
    tipo ENUM("Elfos", "Humanos", "Enanos", "Orcos") NOT NULL,
    nombre VARCHAR(50) UNIQUE NOT NULL,
    poder VARCHAR(200) NOT NULL,
    personas_portadoras VARCHAR(50)
);

CREATE TABLE IF NOT EXISTS Capitulos(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
     numero INTEGER UNSIGNED UNIQUE NOT NULL,
     nombre VARCHAR (50) UNIQUE NOT NULL
);

CREATE TABLE IF NOT EXISTS Temporadas(
	id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    nombre VARCHAR(50) NOT NULL,
	capitulo VARCHAR(50) NOT NULL
);

/*
LENGUAJE DE MANIPULACIÓN DE DATOS (RA3 y RA4)
Este fichero debe tener todas las órdenes necesarias para realizar las operaciones de manipulación exigidas por la etapa de proyecto.*/

/*INSERCIONES: Realiza todas las inserciones necesarias para que el resultado de las consultas arroje varios resultados, pero no todos los registros de una tabla.*/
/* PERSONAJES */
INSERT INTO personajes VALUES (1, 'Galadriel', 'Vera', 'Dama de Lórien', 'Femenino', '1445-12-12', '1544-5-8', 'Enanos', 'Maza', 'Asesino de Reyes', 'Rojo' );
INSERT INTO personajes (nombre, apellidos, sobrenombre, genero, fecha_nacimiento, raza, especialista, titulo, color_pelo ) VALUES('Elrond', 'Achana', 'Medio elfo', 'Masculino', '1334-12-31', 'Elfos', 'arco', 'Azote de los orcos', 'Rosa');
INSERT INTO personajes (nombre, apellidos, sobrenombre, genero, fecha_nacimiento, raza, especialista, titulo, color_pelo ) VALUES('Gil-galad', 'Justo', 'Alto Rey', 'No establecido', '1334-1-31', 'Humanos', 'espada', 'Azote de los orcos', 'Verde');
INSERT INTO personajes (nombre, apellidos, sobrenombre, genero, fecha_nacimiento, raza, especialista, titulo, color_pelo ) VALUES('Adar', 'Sancho', 'Sauron', 'No establecido', '1434-1-31', 'Orcos', 'maza', 'Lord de la Tierra Media', 'Blanco');
INSERT INTO personajes (nombre, apellidos, sobrenombre, genero, fecha_nacimiento, raza, especialista, titulo, color_pelo ) VALUES('Arondir', 'Miguel', 'Valinor', 'Masculino', '1324-1-03', 'Elfos', 'arco', 'Asesino de Reyes', 'Violeta');

/* RAZAS */
INSERT INTO razas VALUES(1, "Orcos", 1.76, 82.67, "Huelen que apestan y son más feos que pegarle a un padre");
INSERT INTO razas(nombre, altura_media, peso_medio, caracteristicas_propias) VALUES("Elfos", 1.8, 60.2, "Seres altos, delgados y muy estirados");
INSERT INTO razas(nombre, altura_media, peso_medio, caracteristicas_propias) VALUES("Humanos", 1.60, 54.67, "Son humanos, no puedes decir mucho más");
INSERT INTO razas(nombre, altura_media, peso_medio, caracteristicas_propias) VALUES("Enanos", 1.30, 68.9, "Peuqeñajos, gruñones y siempre avariciosos");

/* ARMAS */
INSERT INTO armas VALUES(1, "Desgarradora gélida", "La Desgarradora es una espada forjada en la montaña más fría de la Tierra Media, la cual congela a sus oponentes", 1.6, "Espada", "Enanos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("Arco de Auriel", "El Arco de Auriel es un arma muy poderosa, capaz de oscurecer el cielo gracias a sus flechas mágicas", 20, "Arco", "Elfos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("Hacha de la Desesperación", "El Hacha de la Desesperación es un arma forjada con la sangre de inocentes a manos de un terrible dictador humano", 1.4, "Hacha", "Humanos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("Lanza de la Verdad", "La Lanza de la Verdad es un arma muy potente, forjada por los orcos, gracias al sacrificio de 200 humanos, durante la matanza de Ravdosk", 5, "Lanza", "Orcos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("Escudo de la Iluminación", "El Escudo de la Iluminación fue forjado por los Elfos, en su intento de proteger la ciudad élfica Nilfrael", 0, "Escudo", "Elfos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("Cuchillo de Akatosh", "El Cuchillo de Akatosh es el arma predilecta de los asesinos. No existe ninguna armadura que no pueda perforar", 0.5, "Cuchillo", "Humanos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("La Maza", "La Maza es el arma predilecta de los enanos: su fuerte resistencia y su gran daño, permite derrotar a cualquier enemigo", 3, "Maza", "Enanos");
INSERT INTO armas(nombre, descripcion, alcance, tipo, fabricante) VALUES("La Mazass", "La Maza es el arma predilecta de los enanos: su fuerte resistencia y su gran daño, permite derrotar a cualquier enemigo", 3, "Maza", "Enanos");

/* TITULOS */
INSERT INTO titulos VALUES(1, "Liberador de la Tierra Media", "Título otorgado a aquellos que formaron parte de la insurrección para liberar a la Tierra Media de Sauron");
INSERT INTO titulos(nombre, descripcion) VALUES("Asesino de Reyes", "Título otorgado a aquellos que asesinan a reyes");
INSERT INTO titulos(nombre, descripcion) VALUES("Azote de los orcos", "Título otorgado a aquellos que se adentraron en Mordor en busca de los orcos");
INSERT INTO titulos(nombre, descripcion) VALUES("Lord de la Tierra Media", "Título otorgado a aquel que posea todos los anillos de poder");
INSERT INTO titulos(nombre, descripcion) VALUES("Sin título", "Sin título");

/* ANILLOS */
INSERT INTO Anillos VALUES(1, 20, 'Elfos', 'Narya', 'Invisibilidad', 'Dama de Lórien');
INSERT INTO Anillos(numero, tipo, nombre, poder, personas_portadoras ) VALUES (3, 'Humanos', 'Nenya', 'Mas velocidad al correr', 'Medio elfo');
INSERT INTO Anillos(numero, tipo, nombre, poder, personas_portadoras ) VALUES (4, 'Humanos', 'Vilya', 'Mas fuerza en batallas', 'Alto Rey');
INSERT INTO Anillos(numero, tipo, nombre, poder, personas_portadoras ) VALUES (5, 'Enanos', 'Montaña', 'Mas velocidad al correr', 'Sauron');
INSERT INTO Anillos(numero, tipo, nombre, poder, personas_portadoras ) VALUES (13, 'Orcos', 'Moria', 'Suerte', 'Valinor');

/* CAPITULOS */
INSERT INTO Capitulos VALUES(1, 1, 'A shadow of the Past');
INSERT INTO Capitulos (numero, nombre) VALUES(2, 'Adar');
INSERT INTO Capitulos (numero, nombre) VALUES(3, 'UDÛN');

/* TEMPORADAS */
INSERT INTO Temporadas VALUES (1, 'Primera Temporada', "A shadow of the Past");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "Adrift");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "Adar");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "The Great Wave");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "Partings");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "UDÛN");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "The Eye");
INSERT INTO Temporadas(nombre, capitulo) VALUES ('Primera Temporada', "Alloyed");
/*CONSULTAS: Nota: Se incluirá como comentario el enunciado de cada consulta.*/

/*1.	Muestra cuántas armas de cada tipo hay. Se debe mostrar la cantidad al lado de cada uno de los tipos*/
SELECT tipo, COUNT(*) AS "Cantidad" FROM armas GROUP BY tipo;

/*2.	Muestra el id, nombre, fecha de nacimiento y edad de cada uno de los personajes.*/
SELECT id, nombre, fecha_nacimiento, YEAR(NOW()) - YEAR(fecha_nacimiento) AS "Edad" FROM personajes;

/*3.	Muestra cuántos personajes existen por cada color de pelo.*/
SELECT color_pelo, COUNT(*) FROM personajes GROUP BY color_pelo;

/*4.	Muestra cuántas armas existen que empiecen por cada letra del abecedario.*/
SELECT tipo, COUNT(*) AS "Cantidad" FROM armas GROUP BY LEFT(tipo, 1);

/*5.	Muestra las tres razas que mayor altura tienen.*/
SELECT nombre, altura_media FROM razas ORDER BY altura_media DESC LIMIT 3;

/*PROCEDIMIENTOS ALMACENADOS (RA5)
Órdenes necesarias para implementar y ejecutar los procedimientos almacenados descritos en los enunciados.
Notas: 
- Se incluirá como comentario el enunciado cada script.
- Todos los procedimientos, funciones, triggers, etc. deberán contar con sentencias (CALL, etc.) que permitan comprobar su funcionamiento.*/

/*1.	Escribe un procedimiento almacenado que reciba como parámetro dos variables, LimitInf y LimitSup,
como los límites de altura por arriba y por abajo, y calcule cuantas razas existen cuya altura media se
encuentre en ese rango. Debe mostrar un mensaje de la siguiente manera: Existen X razas por encima de LimitInf y por debajo de LimitSup.
*/

DELIMITER $$
CREATE PROCEDURE getAltura(LimitInf DECIMAL(3,2), LimitSup DECIMAL(3,2))
BEGIN
    DECLARE texto1 varchar(100) DEFAULT "Existen ";
    DECLARE texto2 varchar(100) DEFAULT " razas por encima de LimitInf y por debajo de LimitSup.";
    
	SELECT CONCAT(texto1, COUNT(*), texto2) AS "Resultado" FROM razas WHERE altura_media >= LimitInf AND altura_media <= LimitSup;
END $$
DELIMITER ;

CALL getAltura(1.20, 1.72);

/*2.	Escribe un procedimiento almacenado que reciba un parámetro FechaActual y calcule el total
 de personajes muertos en una fecha dada y muestre un mensaje de la siguiente manera:
 "Para la fecha X hay un total de X personajes muertos".*/
 
DELIMITER $$
CREATE PROCEDURE totalMuertos(FechaActual DATE)
BEGIN
    DECLARE texto1 varchar(100) DEFAULT "Para la fecha ";
    DECLARE texto2 varchar(100) DEFAULT " hay un total de ";
    DECLARE texto3 varchar(100) ;
    
    SET texto3 = ' personajes muertos';
    
	SELECT CONCAT( texto1, FechaActual, texto2, COUNT(*), texto3 ) AS "Resultado" FROM personajes WHERE fecha_muerte = FechaActual;
END $$
DELIMITER ;

CALL totalMuertos('1544-6-12');

/*3.	Escribe un procedimiento almacenado que reciba un carácter consistente en una letra
 y muestre el siguiente mensaje: "Existen X personajes que poseen un nombre que empiezan
 por la letra X".*/

DELIMITER $$
CREATE PROCEDURE letraEnNombre(caracter varchar(1))
BEGIN
	DECLARE texto1 varchar(100) DEFAULT "Existen ";
    DECLARE texto2 varchar(100) DEFAULT " personajes que poseen un nombre que empiezan por la letra ";
    
	SELECT CONCAT(texto1, COUNT(*), texto2, caracter) AS "Resultado" FROM personajes WHERE nombre LIKE CONCAT("%", caracter, "%");
END $$
DELIMITER ;

CALL letraEnNombre('a');