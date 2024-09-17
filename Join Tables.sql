/* LECCIÓN JOIN TABLES

INNER JOIN: Permite combinar solo las filas que tienen coincidencias en ambas tablas.

LEFT JOIN: Permite combinar todas las filas de la tabla izquierda con las coincidencias correspondientes de la tabla derecha.

RIGHT JOIN: Similar al left join pero invierte el orden de las tablas.


SELF JOIN: Permite combinar una tabla consigo misma.

CROSS JOIN: Combinar cada fila de una tabla con todas las filas de otra tabla.

NATURAL JOIN: Utiliza columnas con nombres idénticos en ambas tablas para combinar datos automáticamente.

FULL JOIN: Combina todos los datos de ambas tablas, incluyendo filas que no tienen coincidencias en la otra tabla.

*/

-- INNER JOIN

SELECT tabla1.columna1, 
tabla1.columna2,
tabla2.columna1   
FROM tabla1
INNER JOIN tabla2
ON tabla1.columna1 = tabla2.columna1; 

SELECT tabla1.*
FROM tabla1
INNER JOIN tabla2
ON tabla1.columna1 = tabla2.columna1; 

Tabla "usuarios":
| id | nombre  | edad |
|----|---------|------|
| 1  | Juan    | 30   |
| 2  | María   | 25   |
| 3  | Carlos  | 35   |


Tabla "pedidos":
| id_pedido | id_usuario | producto |
|-----------|------------|----------|
| 1         | 1          | Zapatos  |
| 2         | 2          | Camisa   |
| 3         | 1          | Pantalón |
| 4         | 3          | Bufanda  |

SELECT pedidos.*, 
usuarios.nombre
FROM pedidos
INNER JOIN usuarios ON pedidos.id_usuario = usuarios.id;

| id_pedido | id_usuario | producto | nombre  |
|-----------|------------|----------|---------|
| 1         | 1          | Zapatos  | Juan    |
| 2         | 2          | Camisa   | María   |
| 3         | 1          | Pantalón | Juan    |
| 4         | 3          | Bufanda  | Carlos  |



-- LEFT JOIN

SELECT tabla1.columna1, 
tabla1.columna2, 
tabla2.columna1
FROM tabla1 
LEFT JOIN tabla2  
ON tabla1.columna1 = tabla2.columna1;  


Tabla "clientes":
| id_cliente | nombre   |
|------------|----------|
| 1          | Juan     |
| 2          | María    |
| 3          | Carlos   |


Tabla "pedidos":
| id_pedido | id_cliente | producto |
|-----------|------------|----------|
| 1         | 1          | Zapatos  |
| 2         | 2          | Camisa   |

SELECT clientes.*,
pedidos.producto
FROM clientes
LEFT JOIN pedidos ON clientes.id_cliente = pedidos.id_cliente;

| id_cliente | nombre | producto |
|------------|--------|----------|
| 1          | Juan   | Zapatos  |
| 2          | María  | Camisa   |
| 3          | Carlos | NULL     |


-- RIGHT JOIN

SELECT tabla1.columna1, 
tabla1.columna2, 
tabla2.columna1
FROM tabla1 
RIGHT JOIN tabla2  
ON tabla1.columna1 = tabla2.columna1;  


Tabla "empleados":
| id_empleado | nombre   | id_departamento |
|-------------|----------|-----------------|
| 1           | Juan     | 1               |
| 2           | María    | 2               |
| 3           | Carlos   | 1               |
| 4           | Laura    | NULL            |


Tabla "departamentos":
| id_departamento | nombre      |
|-----------------|-------------|
| 1               | Ventas      |
| 2               | Marketing   |
| 3               | Finanzas    |

SELECT empleados.*, 
departamentos.nombre AS nombre_departamento
FROM empleados
RIGHT JOIN departamentos ON empleados.id_departamento = departamentos.id_departamento;

| id_empleado | nombre   | id_departamento | nombre_departamento |
|-------------|----------|-----------------|--------------------|
| 1           | Juan     | 1               | Ventas             |
| 2           | María    | 2               | Marketing          |
| 3           | Carlos   | 1               | Ventas             |
| NULL        | NULL     | 3               | Finanzas           |


-- SELF JOIN

SELECT A.nombre AS Nombre1, 
A.apellido AS Apellido1, 
A.salario AS Salario1, 
B.nombre AS Nombre2, 
B.apellido AS Apellido2, 
B.salario AS Salario2, 
A.pais  
FROM empleadas AS A, 
empleadas AS B  
WHERE A.id_empleada <> B.id_empleada  
AND A.pais = B.pais;  


Tabla "empleados":
| id_empleado | nombre   | id_departamento |
|-------------|----------|-----------------|
| 1           | Juan     | 1               |
| 2           | María    | 2               |
| 3           | Carlos   | 1               |
| 4           | Laura    | 2               |
| 5           | Ana      | 1               |

SELECT e1.nombre AS empleado1, 
e2.nombre AS empleado2, 
e1.id_departamento
FROM empleados e1
JOIN empleados e2 
ON e1.id_departamento = e2.id_departamento
WHERE e1.id_empleado < e2.id_empleado;

| empleado1 | empleado2 | id_departamento |
|-----------|-----------|-----------------|
| Juan      | Carlos    | 1               |
| María     | Laura     | 2               |
| Juan      | Ana       | 1               |


-- CROSS JOIN

SELECT tabla1.columna1, 
tabla1.columna2, 
tabla2.columna1
FROM tabla1
CROSS JOIN tabla2
WHERE tabla1.columna1 = tabla2.columna1;

Tabla "empleados":
| id_empleado | nombre   |
|-------------|----------|
| 1           | Juan     |
| 2           | María    |


Tabla "departamentos":
| id_departamento | nombre      |
|-----------------|-------------|
| 1               | Ventas      |
| 2               | Marketing   |

SELECT empleados.nombre AS nombre_empleado, 
departamentos.nombre AS nombre_departamento
FROM empleados
CROSS JOIN departamentos;

| nombre_empleado | nombre_departamento |
|-----------------|---------------------|
| Juan            | Ventas              |
| Juan            | Marketing           |
| María           | Ventas              |
| María           | Marketing           |


-- NATURAL JOIN

SELECT columna1, 
columna2, 
columna3   
FROM tabla1 NATURAL JOIN tabla2; 

Tabla "clientes":
| id_cliente | nombre   |
|------------|----------|
| 1          | Juan     |
| 2          | María    |
| 3          | Carlos   |


Tabla "pedidos":
| id_pedido | id_cliente | producto |
|-----------|------------|----------|
| 1         | 1          | Zapatos  |
| 2         | 2          | Camisa   |
| 3         | 1          | Pantalón |


SELECT *
FROM clientes
NATURAL JOIN pedidos;

| id_cliente | nombre | id_pedido | producto |
|------------|--------|-----------|----------|
| 1          | Juan   | 1         | Zapatos  |
| 1          | Juan   | 3         | Pantalón |
| 2          | María  | 2         | Camisa   |


-- FULL JOIN

SELECT tabla1.columna1, 
tabla1.columna2, 
tabla2.columna1  
FROM tabla1  
LEFT JOIN tabla2  
ON tabla1.columna1 = tabla2.columna1  
UNION  
SELECT tabla1.columna1, 
tabla1.columna2, 
tabla2.columna1  
FROM tabla1  
RIGHT JOIN tabla2  
ON tabla1.columna1 = tabla2.columna1;

Tabla "empleados":
| id_empleado | nombre   | id_departamento |
|-------------|----------|-----------------|
| 1           | Juan     | 1               |
| 2           | María    | 2               |
| 3           | Carlos   | 1               |
| 3           | Lola     | 4               |


Tabla "departamentos":
| id_departamento | nombre      |
|-----------------|-------------|
| 1               | Ventas      |
| 2               | Marketing   |
| 3               | Finanzas    |

-- LEFT JOIN ON id_departamento: 1, 2, 4
-- RIGHT JOIN ON id_departamento: 1, 2, 3
-- FULL JOIN ON id_departamento: 1, 2, 3, 4

| empleado | departamento |
|----------|--------------|
| Juan     | Ventas       |
| María    | Marketing    |
| Carlos   | Ventas       |
| NULL     | Finanzas     |
| Lola     | NULL




SELECT 
employees.employee_number,
employees.first_name,
employees.last_name,
customers_destroy.customer_number
FROM employees
INNER JOIN customers
ON employees.employee_number = customers_destroy.sales_rep_employee_number



SELECT
columnas
COUNT(DISTINCT customers.country)
FROM 

INNER JOIN
ON 

GROUP BY (    )
HAVING COUNT(DISTINCT customers.country) > 1;










