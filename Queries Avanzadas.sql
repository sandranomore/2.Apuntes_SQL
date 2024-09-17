CREATE TABLES
SELECT *
SELECT columna1, columna2
WHERE



/* LECCIÓN QUERIES AVANZADAS

-- MIN/MAX

SELECT MIN(columna)
FROM tabla;

SELECT MIN(id_alumna) AS IDMenor     
FROM alumnas;    

-- SUM 

SELECT SUM(salario) AS TotalSalarios     
FROM empleadas;     

-- AVG

SELECT AVG(salario) AS SalarioMedio     
FROM empleadas;  

-- COUNT

SELECT COUNT(columna)
FROM tabla;


-- GROUP BY

SELECT 
columna_agrupada, 
función_agregación(columna_calculo)
FROM tabla
GROUP BY columna_agrupada;

-- HAVING

SELECT columna1, 
función_agregada(columna2)
FROM tabla
GROUP BY columna1
HAVING condición;


-- CASE 

SELECT salario,  
CASE 
    WHEN salario < 2000 THEN "Bajo"   
    WHEN salario > 3000 THEN "Alto"  
    ELSE "Medio"   
    END AS RangoSalario 
FROM empleadas;  


SELECT   
CASE 
    WHEN salario < 2000 THEN "Bajo"   
    ELSE   
        CASE WHEN salario > 3000 THEN "Alto"  
        ELSE "Medio"  
        END  
    END RangoSalario  
FROM empleadas;  

*/

SELECT *
FROM tienda.customers
LIMIT 15;

SELECT MIN(customer_number) 
FROM tienda.customers ;

SELECT AVG(credit_limit)
FROM tienda.customers
WHERE country = 'Spain';

SELECT COUNT(customer_number)
FROM tienda.customers
WHERE country = 'France';

SELECT COUNT(country)
FROM tienda.customers;

SELECT COUNT(DISTINCT country)
FROM tienda.customers;

SELECT COUNT(customer_number)
FROM tienda.customers
WHERE sales_rep_employee_number = 1323;

SELECT MAX(credit_limit) as max_credit
FROM tienda.customers
WHERE sales_rep_employee_number = 1323;

SELECT
sales_rep_employee_number,
COUNT(customer_number),
MIN(credit_limit) as min_credit,
MAX(credit_limit) as max_credit,
AVG(credit_limit) as avg_credit
FROM tienda.customers
WHERE sales_rep_employee_number = 1323;


SELECT 
country,
sales_rep_employee_number,
COUNT(DISTINCT customer_number) AS num_clientes
FROM tienda.customers
WHERE country = 'Spain'
GROUP BY
country,
sales_rep_employee_number
HAVING num_clientes > 5;

SELECT 
sales_rep_employee_number,
COUNT(DISTINCT customer_number)
FROM tienda.customers
GROUP BY 
sales_rep_employee_number
HAVING COUNT(DISTINCT customer_number) > 7;


SELECT
sales_rep_employee_number,
COUNT(DISTINCT customer_number),
CASE
	WHEN COUNT(DISTINCT customer_number) > 7 THEN 'AltoRendimiento'
    ELSE 'BajoRendimiento'
    END AS Rendimiento
FROM tienda.customers
GROUP BY 
sales_rep_employee_number;

SELECT
country,
COUNT(DISTINCT customer_number)
FROM tienda.customers
GROUP BY
country;

SELECT
country,
COUNT(DISTINCT city) AS num_ciudad
FROM tienda.customers
GROUP BY
country
HAVING num_ciudad > 3;








