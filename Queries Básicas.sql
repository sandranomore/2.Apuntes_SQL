/* LECCIÓN QUERIES BÁSICAS

---- 1. SELECT
---- 2. WHERE
---- 3. ORDER BY
---- 4. LIMIT Y OFFSET


--- SELECT

SELECT columna  
FROM tabla;  

SELECT 
columna1, 
columna2
FROM tabla; 

SELECT *  
FROM tabla; 


--- WHERE

SELECT columna
FROM tabla
WHERE columna = condición; 


SELECT columna
FROM tabla
WHERE columna1 = condición1
AND columna2 = condición2; 


SELECT columna
FROM tabla
WHERE columna1 = condición1
OR columna2 = condición2; 


SELECT * FROM tabla     
WHERE NOT columna = condicion;

=
<>
<
>
<=
>=


SELECT columna1, columna2   
FROM tabla 
WHERE columna3 IS NULL;


SELECT columna1, columna2   
FROM tabla 
WHERE columna3 IS NOT NULL;

--- ORDER BY
SELECT *  
FROM tabla  
ORDER BY columna ASC;  


SELECT *  
FROM tabla  
ORDER BY columna DESC; 

--- DISTINCT

SELECT DISTINCT columna
FROM nombre_tabla;

--- LIMIT Y OFFSET

SELECT columnas
FROM nombre_tabla
WHERE condición
LIMIT cantidad_filas;


SELECT columnas
FROM nombre_tabla
LIMIT cantidad OFFSET inicio;

--- BETWEEN

SELECT columnas
FROM nombre_tabla
WHERE columna BETWEEN valor_inicio AND valor_fin;

--- IN
SELECT columnas
FROM nombre_tabla
WHERE columna IN (valor1, valor2, valor3);

--- AS
SELECT columna AS alias
FROM nombre_tabla;


SELECT *
FROM tienda.customers
LIMIT 5;

SELECT 
customer_name,
phone,
address_line1,
address_line2
FROM tienda.customers;

SELECT DISTINCT
country
FROM tienda.customers
ORDER BY country ASC;

SELECT
phone,
address_line1,
address_line2
FROM tienda.customers
WHERE country = 'USA';

SELECT
contact_first_name,
contact_last_name
FROM tienda.customers
WHERE address_line2 IS NULL;

SELECT *
FROM tienda.customers
WHERE state IS NOT NULL;

SELECT *
FROM tienda.customers
WHERE country = 'USA'
AND state IS NULL;

SELECT DISTINCT country
FROM tienda.customers
WHERE credit_limit > 10000;
*/

-- 1. Nombre y apellidos de clientes de Australia con credito entre 10000 y 20000*/
SELECT
country
FROM tienda.customers
WHERE credit_limit BETWEEN 10000 AND 45000;

-- 2. Credit_limit de los países Francia, Bélgica y España

SELECT
credit_limit
FROM tienda.customers
WHERE country IN ('France', 'Belgium', 'Spain');


SELECT *
FROM tienda.customers
ORDER BY credit_limit DESC





-- 3. Todos los registros de Francia con credit_limit mayor a 10000 y sin valor de state

SELECT *
FROM tienda.customers
WHERE country = 'France'
AND credit_limit > 10000
AND state IS NULL;


SELECT
customer_name
FROM tienda.customers
ORDER BY credit_limit ASC
LIMIT 20;


DELETE FROM tienda.customers
ORDER BY credit_limit ASC
LIMIT 5;
