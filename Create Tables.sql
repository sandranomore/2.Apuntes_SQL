
/*
LECCIÓN CREAR TABLAS

1. Cómo Crear Tablas

CREATE TABLE nombre_tabla (
    nombre_columna1 tipo_de_dato1 restriccion1,
    nombre_columna2 tipo_de_dato2 restriccion2,
);


2. Tipos de Datos
2.1 Numéricos: SMALLINT, INT, FLOAT, DOUBLE, BOOL
2.2 Texto: CHAR(tamaño), VARCHAR(tamaño), TEXT,  ENUM(val1, val2, val3, ...)
2.3 Fecha: DATE, TIME, DATETIME, YEAR


CREATE TABLE productos (
    id_producto INT,
    nombre VARCHAR(100),
    color ENUM('rojo','amarillo','azul'),
    precio FLOAT,
    stock INT
);

3. Restricciones

3.1 Restricciones de Columnas: NOT NULL, PRIMARY KEY, UNIQUE, CHECK, DEFAULT, CONSTRAINT

CREATE TABLE personas (
    id INT NOT NULL,
    apellido VARCHAR(255) NOT NULL,
    nombre VARCHAR(255),
    edad INT,
    ciudad VARCHAR(255) DEFAULT 'Madrid'
);


3.2 Restricciones de Tablas: PRIMARY KEY (lista de columnas), UNIQUE (lista de columnas), CHECK (expresión condicional)

CREATE TABLE productos (
    id_producto INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) DEFAULT NULL,
    color ENUM('rojo','amarillo','azul') DEFAULT NULL,
    precio INT DEFAULT NULL,
    stock FLOAT DEFAULT NULL,
    PRIMARY KEY (id_producto),
    CONSTRAINT precio_positivo CHECK (precio > 0)
);

3.3 Foreign Key

FOREIGN KEY (
    nombre_columna, 
    ...
) REFERENCES tabla_madre (columna_madre, ...)
    [ON DELETE opcion_referencia]
    [ON UPDATE opcion_referencia]
    


4. Crear Tablas Foreign Key (Relación Tablas)


CREATE TABLE IF NOT EXISTS `alumnas` (
  id_alumna INT NOT NULL AUTO_INCREMENT,
  nombre` VARCHAR(45),
  `apellido` VARCHAR(45),
  PRIMARY KEY (`id_alumna`)
);

CREATE TABLE IF NOT EXISTS `notas_alumnas` (
  `id_notas` INT NOT NULL AUTO_INCREMENT,
  `id_alumna` INT NOT NULL,
  `nota` INT NOT NULL,
  PRIMARY KEY (`id_notas`),
  CONSTRAINT `fk_notas_alumnas_alumnas`
    FOREIGN KEY (`id_alumna`)
    REFERENCES `alumnas` (`id_alumna`) ON DELETE CASCADE ON UPDATE CASCADE
);

5. Crear Tablas a Partir de una Existente

CREATE TABLE nueva_tabla AS
SELECT nombre_columna1,
       nombre_columna2
FROM tabla_original;


*/
-- Ejercicio 1
CREATE SCHEMA leccion_crear_tablas;
USE leccion_crear_tablas;

CREATE TABLE Empleadas2 (
id_empleada INT NOT NULL,
Salario FLOAT,
Nombre VARCHAR(100),
Apellido VARCHAR (100),
Pais VARCHAR(20),
PRIMARY KEY (id_empleada)
);



-- Ejercicio 2

CREATE TABLE personas (
    Id INT NOT NULL,
    Apellido VARCHAR(255) NOT NULL,
    Nombre VARCHAR(255),
    Edad INT,
    Ciudad varchar(255) DEFAULT 'Madrid',
    CONSTRAINT check_edad CHECK (Edad > 16)
);


-- Ejercicio 3



-- Ejercicio 4

CREATE TABLE customers (
id_costumer INT NOT NULL
nombre VARcHAR 
fecha_inicio_cliente DATE

-- Ejercicio 5


-- Ejercicio 6

CREATE TABLE empleados2 (
id_empleado INT NOT NULL,
apellido VARCHAR(30)
email VARCHAR(30)
sueldo FLOAT
puesto VARCHAR(20)
PRIMARY KEY (id_empleado)
);


CREATE TABLE customers2 (
	id_customer INT NOT NULL,
	nombre VARCHAR (20),
	PRIMARY KEY (id_customer),
	CONSTRAINT llll
	FOREIGN KEY (id_empleado)
	REFERENCES empleados2 (id_empleado)  ON DELETE CASCADE
);


CREATE TABLE IF NOT EXISTS `notas_alumnas` (
  `id_notas` INT NOT NULL AUTO_INCREMENT,
  `id_alumna` INT NOT NULL,
  `nota` INT NOT NULL,
  PRIMARY KEY (`id_notas`),
  CONSTRAINT `fk_notas_alumnas_alumnas`
    FOREIGN KEY (`id_alumna`)
    REFERENCES `alumnas` (`id_alumna`) ON DELETE CASCADE ON UPDATE CASCADE
);





