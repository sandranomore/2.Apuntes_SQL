/* LECCIÓN OPERADORES DE FILTRO

UNION: Combinar los resultados de dos consultas en un único conjunto de resultados, eliminando duplicados.

UNION ALL: Combinar resultados sin eliminar duplicados.


IN(INTERSECT): Encontrar elementos comunes entre dos conjuntos de resultados utilizando la operación de intersección.

NOT IN(EXCEPT): Identificar elementos únicos en un conjunto de resultados en comparación con otro utilizando
				la operación "except".
                

LIKE y NOT LIKE: Comparaciones de patrones de texto.

REGEX: Expresiones regulares para buscar patrones más complejos en los datos.

*/

-- UNION

SELECT columnas
FROM tabla1
UNION
SELECT columnas
FROM tabla2;

Tabla "ventas_2023":
| id_venta | fecha       | monto |
|----------|-------------|-------|
| 1        | 2023-01-15  | 100   |
| 2        | 2023-03-20  | 150   |
| 3        | 2023-06-10  | 200   |

Tabla "ventas_2024":
| id_venta | fecha       | monto |
|----------|-------------|-------|
| 1        | 2024-02-05  | 120   |
| 2        | 2024-04-10  | 180   |
| 3        | 2024-07-15  | 220   |

SELECT id_venta, 
fecha, 
monto FROM ventas_2023
UNION
SELECT id_venta, 
fecha, 
monto
FROM ventas_2024;

| id_venta | fecha       | monto |
|----------|-------------|-------|
| 1        | 2023-01-15  | 100   |
| 2        | 2023-03-20  | 150   |
| 3        | 2023-06-10  | 200   |
| 1        | 2024-02-05  | 120   |
| 2        | 2024-04-10  | 180   |
| 3        | 2024-07-15  | 220   |


-- UNION ALL

SELECT columnas
FROM tabla1
UNION ALL
SELECT columnas
FROM tabla2;

-- IN (INTERSECT)

SELECT columnas
FROM tabla
WHERE columna IN (valor1, valor2, valor3, ...);

Tabla "productos":
| id_producto | nombre      |
|-------------|-------------|
| 1           | Zapatos     |
| 2           | Camisa      |
| 3           | Pantalón    |
| 4           | Bufanda     |

SELECT *
FROM productos
WHERE nombre IN (Zapatos, Pantalón);

| id_producto | nombre      |
|-------------|-------------|
| 1           | Zapatos     |
| 3           | Pantalón    |


-- NOT IN (EXCEPT)

SELECT columnas
FROM tabla
WHERE columna NOT IN (valor1, valor2, valor3, ...);

Tabla "productos":
| id_producto | nombre      |
|-------------|-------------|
| 1           | Zapatos     |
| 2           | Camisa      |
| 3           | Pantalón    |
| 4           | Bufanda     |

SELECT *
FROM productos
WHERE nombre NOT IN (Zapatos, Pantalón);

| id_producto | nombre      |
|-------------|-------------|
| 2           | Camisa      |
| 4           | Bufanda     |


-- LIKE

SELECT columnas
FROM tabla
WHERE columna LIKE 'patron';

/* 
%: Representa cero o más caracteres. 

_: Representa un solo carácter. 
*/

Tabla "productos":
| id_producto | nombre      |
|-------------|-------------|
| 1           | Zapatos     |
| 2           | Camisa      |
| 3           | Pantalón    |
| 4           | Bufanda     |

/* Registros donde nombre que empiece por B */

SELECT *  
FROM productos  
WHERE nombre LIKE 'B%';  

| id_producto | nombre      |
|-------------|-------------|
| 4           | Bufanda     |

/* Registros donde nombre que empiece por Z y tiene al menos 4 caracteres */

SELECT *  
FROM productos  
WHERE nombre LIKE 'Z_ _ _%'; 

| id_producto | nombre      |
|-------------|-------------|
| 1           | Zapatos     |

/* Registros con la letra n en cualquier posición*/

SELECT *  
FROM productos  
WHERE nombre LIKE '%n%'; 

| id_producto | nombre      |
|-------------|-------------|
| 3           | Pantalón    |
| 4           | Bufanda     |

-- NOT LIKE

SELECT columna1, columna2, ...
FROM tabla
WHERE columna NOT LIKE patron;


-- REGEX 

SELECT columna1, columna2, ...
FROM tabla
WHERE columna REGEXP 'patron';

Tabla "productos":
| id_producto | nombre      |
|-------------|-------------|
| 1           | Zapatos     |
| 2           | Camisa      |
| 3           | Pantalón    |
| 4           | Bufanda     |

/* Registros con la letra n en cualquier posición*/

SELECT *
FROM productos
WHERE nombre REGEXP 'n';

| id_producto | nombre      |
|-------------|-------------|
| 3           | Pantalón    |
| 4           | Bufanda     |


-- Ejercicios 

SELECT * 
FROM tienda.customers
LIMIT 10;

SELECT *
FROM tienda.employees
LIMIT 10;

SELECT *
FROM tienda.offices
LIMIT 10;

-- Ejercicio 1

SELECT contact_last_name AS Apellido
FROM tienda.customers
UNION
SELECT last_name AS Appellido
FROM tienda.employees;

SELECT
contact_first_name AS 'Nombre',
contact_last_name AS 'Apellido'
FROM tienda.customers
UNION
SELECT 
first_name AS 'Nombre',
last_name AS 'Apellido'
FROM tienda.employees;


SELECT
contact_first_name AS 'Nombre',
contact_last_name AS 'Apellido'
FROM tienda.customers
UNION ALL
SELECT 
first_name AS 'Nombre',
last_name AS 'Apellido'
FROM tienda.employees;

--- * Mirar longitud: posibles duplicados 

SELECT
employee_number AS 'Numero empleado',
first_name AS 'Nombre Eempleado'
FROM tienda.employees
WHERE employee_number IN (1002, 1076, 1088, 1612);


SELECT 
city AS 'ciudad',
customer_name AS 'nombre empresa'
FROM tienda.customers
WHERE country NOT IN ('Ireland', 'France', 'Germany');

SELECT city AS 'ciudad',
customer_name AS 'nombre cliente'
FROM customers
WHERE city LIKE '%on';


SELECT city AS 'ciudad',
customer_name AS 'nombre cliente'
FROM customers
WHERE city LIKE '____on';



WHERE direccion   LIKE '%3%' AND city NOT LIKE 'T%'

SELECT
FROM customers
WHERE columna REGEXP '[0-9]';


-- * [0-9]+ dif con [0-9]
















