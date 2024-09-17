/* LECCIÓN MODIFICACIÓN E INSERCIÓN DE DATOS

ALTER TABLE: ajustar estructura tabla existente -> agregar, eliminar o modificar columnas; cambiar restricciones o claves primarias o foraneas
DROP TABLE: eliminar tabla 
INSERT INTO: agregar nuevos datos a una tabla -> agregar filas
UPDATE: modificación registros específicos
DELETE: eliminar registros de forma selectiva
--------------------------------------------------------------------------------

ALTER TABLE: ajustar estructura tabla existente -> agregar, eliminar o modificar columnas; cambiar restricciones o claves primarias o foraneas
	- Añadir columna:
    ALTER TABLE nombre_tabla
	ADD COLUMN nombre_columna tipo_de_datos restricciones;
    
    - Eliminar columnas:
    ALTER TABLE nombre_tabla
	DROP COLUMN nombre_columna;
    
    - Cambiar tipos de datos de una columna:
    ALTER TABLE nombre_tabla
	MODIFY COLUMN nombre_columna tipo_de_datos;
    
    - Renombrar una columna:
    ALTER TABLE nombre_tabla
	RENAME COLUMN nombre_columna_actual TO nuevo_nombre_columna; 
    -----------------------------------
    ALTER TABLE nombre_tabla
	CHANGE nombre_columna_actual nuevo_nombre_columna tipo_de_dato; 
    
------------------------------------------------------------------------------------
DROP TABLE: eliminar tabla 
- DROP TABLE IF EXISTS tabla1;
- DROP TABLE IF EXISTS tabla1, tabla2, tabla3;  
------------------------------------------------------------------------------------
INSERT INTO: agregar nuevos datos a una tabla -> agregar filas
- INSERT INTO nombre_tabla (columna1, columna2, columna3, columna4, ...) 
	VALUES (valor1, valor2, valor3, valor4, ....) (valor1, valor2, va) ;
------------------------------------------------------------------------------------
UPDATE: modificación registros específicos
- UPDATE nombre_tabla
	SET columna1 = nuevo_valor1, columna2 = nuevo_valor2, ...
	WHERE condición;
------------------------------------------------------------------------------------
DELETE: eliminar registros de forma selectiva
- DELETE FROM nombre_tabla
	WHERE condición = valor_condición;

*/

SELECT *
FROM tienda.customers
LIMIT 5;

/* EJERCICIOS */

CREATE TABLE t1 (
a INTEGER, 
b CHAR(10)
);

SELECT * 
FROM t2;

ALTER TABLE t1
RENAME t2;

ALTER TABLE t2
MODIFY COLUMN a TINYINT NOT NULL;

ALTER TABLE t2
MODIFY COLUMN b CHAR(20);

ALTER TABLE t2
RENAME COLUMN b TO c; 

ALTER TABLE t2
ADD COLUMN d TIMESTAMP;

ALTER TABLE t2
DROP COLUMN c;

CREATE TABLE t3
LIKE t2;

DROP TABLE IF EXISTS t2;

ALTER TABLE t3
RENAME t1;


CREATE TABLE IF NOT EXISTS tienda.customers_mod 
SELECT * 
FROM customers;

INSERT INTO customers_mod (
customer_number,
customer_name, 
contact_last_name, 
contact_first_name, 
phone,
address_line1,
address_line2, 
city, 
state, 
postal_code, 
country, 
sales_rep_employee_number, 
credit_limit)
VALUES (343,'Adalab','Rodriguez','Julia',672986373,'Calle Falsa 123','Puerta 42','Madrid','España',28000,'España',15,20000000);

INSERT INTO customers_mod (
customer_number,
customer_name, 
contact_last_name, 
contact_first_name, 
phone,
address_line1,
address_line2, 
city, 
state, 
postal_code,
country, 
sales_rep_employee_number, 
credit_limit)
VALUES (344,'La pegatina After','Santiago','Maricarmen',00000000,'Travesia del rave',NULL,'Palma de mallorca',NULL,07005,'España',10,45673453);


    
UPDATE tienda.customers_mod
SET address_line1 = 'Polígono Industrial de Son Castelló'
WHERE customer_name =  'La pegatina After';

SET SQL_SAFE_UPDATES = 0;

CREATE TABLE tienda.customers_destroy
SELECT * FROM
	customers;
    
UPDATE customers_destroy
SET address_line1 = 'Vamos', address_line2 = 'a';

SELECT *
FROM tienda.customers_destroy
LIMIT 10;


DELETE FROM customers_destroy
WHERE customer_number  = 103;
