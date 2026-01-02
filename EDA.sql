SELECT *  FROM hechos_ventas;
-- Visualiza la tabla de ventas
SELECT 
	 fecha ,REPLACE(fecha,'-','/') AS NEW_FORMAT
FROM dim_fecha;
--Modifica el formato de fechas actual YYYY-MM-DD a YYYY/MM/DD
SELECT * from dim_fecha df ;

SELECT cliente_id ,producto_id , cantidad ,total_venta  FROM hechos_ventas ORDER BY total_venta DESC LIMIT 3;
--Las 3 mejores ventas y añde la información que resulta útil

SELECT cliente_id ,COUNT(DISTINCT id_venta ) AS 'COMPRAS' FROM hechos_ventas GROUP BY cliente_id ORDER BY COMPRAS DESC;
-- Cuales son los clientes con más compras realizadas?
/*
SELECT cliente_id ,COUNT(*) AS 'COMPRAS' FROM hechos_ventas GROUP BY cliente_id RDER BY COMPRAS DESC;
 --Esta intrucción muestra el mismo resultado
*/

SELECT producto_id  ,COUNT(*) AS PRODUCTO_MAS_VENDIDO FROM hechos_ventas GROUP BY producto_id ORDER BY PRODUCTO_MAS_VENDIDO DESC;
-- Cuales son los productos mñas vendidos?

/* 
 Si queremos obtener más información acerca del producto o del cliente,
  debemos acceder mediante un "join" a la tabla de dimensiones correspondiente
 */

SELECT C.nombre_completo  ,COUNT(DISTINCT H.id_venta ) AS 'COMPRAS' FROM hechos_ventas H
JOIN dim_cliente C ON H.cliente_id = C.cliente_id
GROUP BY H.cliente_id ORDER BY COMPRAS DESC;

SELECT P.nombre_producto   ,COUNT(*) AS PRODUCTO_MAS_VENDIDO FROM hechos_ventas H
JOIN dim_producto P ON H.producto_id  = P.producto_id 
GROUP BY H.producto_id  ORDER BY PRODUCTO_MAS_VENDIDO DESC;

----------------------------------------------------------------------------------
SELECT *  FROM hechos_ventas H
JOIN dim_fecha F ON H.fecha_id = F.fecha_id; --JOIN con dim_fecha

SELECT F.fecha, strftime('%m', F.fecha ),H.*  FROM hechos_ventas H
JOIN dim_fecha F ON H.fecha_id = F.fecha_id ORDER BY F.fecha DESC;
 ---Las ventas más recientes

--LEFT JOIN con dim_producto
SELECT P.*, H.*  FROM hechos_ventas H
RIGHT JOIN dim_producto P ON H.producto_id  = P.producto_id WHERE H.id_venta IS NULL ; 
--Cuales son los productos que NO se han vendido?
/*
SELECT P.*, H.*  FROM dim_producto P
LEFT JOIN hechos_ventas H ON P.producto_id= H.producto_id WHERE H.id_venta IS NULL ;
--Con uso del LEFT, cambiando el orden
*/



SELECT F.anio,SUM(H.total_venta ) AS VENTAS_DEL_AÑO  FROM hechos_ventas H 
JOIN dim_fecha F ON H.fecha_id = F.fecha_id GROUP BY anio ;
-- Total de Ventas por año

SELECT F.nombre_mes ,SUM(H.total_venta ) AS VENTAS_POR_MES   FROM hechos_ventas H 
JOIN dim_fecha F ON H.fecha_id = F.fecha_id GROUP BY F.mes ORDER BY VENTAS_POR_MES DESC LIMIT 3;
-- Cuales son los 3 meses con mayor facturación?


SELECT T.nombre_tienda , SUM(cantidad) AS PRODUCTOS_VENDIDOS  FROM hechos_ventas H
JOIN dim_tienda T ON H.tienda_id  = T.tienda_id GROUP BY T.nombre_tienda ORDER BY PRODUCTOS_VENDIDOS DESC LIMIT 1;
--¿Qué tienda ha vendido más productos?


SELECT C.nombre_completo, P.nombre_producto, H.cantidad FROM hechos_ventas H
JOIN dim_cliente C ON H.cliente_id  = C.cliente_id
JOIN dim_producto P ON H.producto_id = P.producto_id GROUP BY  C.nombre_completo; 
--Compras hechas por cada cliente

--SUBCONSULTAS
SELECT cliente_id ,nombre_completo FROM dim_cliente WHERE cliente_id = (SELECT cliente_id FROM 
(SELECT SUM(total_venta) AS VENTA, cliente_id FROM hechos_ventas GROUP BY cliente_id ORDER BY VENTA LIMIT 1));

--¿Cuál es el cliente que más confianza tiene a la marca?
-- El cliente que más ha gastado

---USO DEL CASE
SELECT C.nombre_completo , C.edad,
		CASE
			WHEN C.edad >= 18 AND C.edad < 23 THEN 'JOVEN'
			WHEN C.edad BETWEEN 23 AND 30 THEN 'ADULTO'
			ELSE 'SENIOR'			
		END AS CATEGORIA_EDAD,
		C.ciudad ,P.nombre_producto ,P.precio , T.nombre_tienda , F.fecha  FROM hechos_ventas H
JOIN dim_cliente C ON H.cliente_id  = C.cliente_id
JOIN dim_producto P ON H.producto_id = P.producto_id
JOIN dim_tienda T ON H.tienda_id   = T.tienda_id 
JOIN dim_fecha F ON H.fecha_id  = F.fecha_id;
---Clasifica a los clientes segun su edad



---CREACIÓN DE UNA VIEW
CREATE VIEW IF NOT EXISTS vista_ventas_basica AS
SELECT C.nombre_completo , C.edad,
		CASE
			WHEN C.edad >= 18 AND C.edad < 23 THEN 'JOVEN'
			WHEN C.edad BETWEEN 23 AND 30 THEN 'ADULTO'
			ELSE 'SENIOR'			
		END AS CATEGORIA_EDAD,
		C.ciudad ,P.nombre_producto ,H.cantidad ,P.precio, H.total_venta , T.nombre_tienda , F.fecha  FROM hechos_ventas H
JOIN dim_cliente C ON H.cliente_id  = C.cliente_id
JOIN dim_producto P ON H.producto_id = P.producto_id
JOIN dim_tienda T ON H.tienda_id   = T.tienda_id 
JOIN dim_fecha F ON H.fecha_id  = F.fecha_id;
SELECT * FROM vista_ventas_basica;
DROP VIEW vista_ventas_basica ;
--Visualiza la tabla "virtual" creada.
--Resumen de cada venta

SELECT    
    RANK() OVER(
    ORDER BY substr(nombre_completo, instr(nombre_completo, ' ') + 1) ASC) AS Orden_Alfabetico,
    *
FROM vista_ventas_basica;
---Ordena las ventas alfabéticamente según el apellido del cliente.

SELECT DISTINCT nombre_producto ,precio  FROM vista_ventas_basica
WHERE LOWER(nombre_completo) ='carlos martínez' AND CAST(precio AS INTEGER)> 70;
---¿Qué productos ha comprao "Carlos Martínez" con un valor superior a 70 €?

--UNION
SELECT * FROM vista_ventas_basica WHERE ciudad= 'Madrid' UNION 
SELECT * FROM vista_ventas_basica WHERE ciudad= 'Barcelona';
--Ventas realizadas en Madrid y Barcelona
/*
 * SELECT * FROM vista_ventas_basica WHERE ciudad IN ('Madrid','Barcelona');
  */



---CTE ANIDADAS
WITH clientes_cte AS (
    SELECT
        cliente_id,
        substr(nombre_completo, 1, instr(nombre_completo, ' ') - 1) AS nombre,
        substr(nombre_completo, instr(nombre_completo, ' ') + 1) AS apellido,
        edad,
        genero,
        ciudad
    FROM dim_cliente
),
maxima_edad_cte AS (
    SELECT
        MAX(edad)
    FROM dim_cliente
)

/*
 * CTE anidadas utilizadas en la consulta:
 *
 * 1) clientes_cte:
 *    - Divide el campo `nombre_completo` en dos columnas independientes:
 *      `nombre` y `apellido`, facilitando su uso en consultas y ordenaciones.
 *
 * 2) maxima_edad_cte:
 *    - Calcula la edad máxima existente entre todos los registros
 *      de la tabla de clientes.
 */
SELECT *
FROM clientes_cte 
WHERE edad= (SELECT * FROM maxima_edad_cte );


---DEFINICION FUNCION
CREATE ON REPLACE mi_funcion(nombre_cliente TEXT ,fecha_compra TEXT)
RETURN TABLE(
	fecha DATE,
	nombre_producto TEXT,
	cantidad INTEGER,
	precio REAL,
	total_venta REAL
)
AS
$$
BEGIN
	RETURN QUERY
	SELECT  fecha, nombre_producto ,cantidad ,precio, total_venta , nombre_tienda  
	FROM vista_ventas_basica 
	WHERE fecha= CAST(fecha_compra AS DATE) AND nombre_completo= LOWER(nombre_cliente);
END;
$$
LANGUAGE sqlite;
/*
 En SQLite no permite crear funciones, aún asi, este es un ejemplo de 
una función que nos da detalle de los productos que que ha comprado un cliente específico
en una fecha determinada 
*/
SELECT * FROM mi_fucion("CARLOS MARTINEZ",'2025-05-07');
-- llamada a la función


