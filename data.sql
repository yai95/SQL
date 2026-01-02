/*
  Carga de datos en el esquema
  
	Para insertar los datos en nuestra base de datos y realizar, posteriormente, un EDA, los datos son extraidos
	artificalmente a través de ChatGPT 
*/

--Tabla de dimensiones Fecha
INSERT INTO dim_fecha (fecha, anio, mes, nombre_mes) 
VALUES ("1995-12-31", 1995, 12, "Diciembre");
-- Iniciamos con insertar un sólo registro y comprobar que funciona perfectamente

SELECT * FROM dim_fecha; 
--Visaulización del registro insertado

ALTER TABLE dim_fecha ADD dia INTEGER;
--Añande el campo día en la tabla ya creada

UPDATE dim_fecha SET dia=31 WHERE fecha_id=1;
-- Al hacer la modificación, el valor del campo dia está a NULL. Se actualiza al valor 31

DELETE dim_fecha WHERE fecha_id=1;
--Elimina el registro del ejemplo utilizado para comprobar el funcionamiento correcto


INSERT INTO dim_fecha (fecha, anio, mes, nombre_mes, dia) VALUES
-- 2020
('2020-01-13', 2027, 1, 'Enero', 13),
('2020-02-17', 2027, 2, 'Febrero', 17),
('2020-03-10', 2027, 3, 'Marzo', 10),
('2020-04-14', 2027, 4, 'Abril', 14),
('2020-05-19', 2027, 5, 'Mayo', 19),
('2020-06-16', 2027, 6, 'Junio', 16),
('2020-07-21', 2027, 7, 'Julio', 21),
('2020-08-18', 2027, 8, 'Agosto', 18),
('2020-09-15', 2027, 9, 'Septiembre', 15),
('2020-10-20', 2027, 10, 'Octubre', 20),
('2020-11-17', 2027, 11, 'Noviembre', 17),
('2020-12-15', 2027, 12, 'Diciembre', 15),
-- 2021
('2021-01-14', 2026, 1, 'Enero', 14),
('2021-02-18', 2026, 2, 'Febrero', 18),
('2021-03-12', 2026, 3, 'Marzo', 12),
('2021-04-16', 2026, 4, 'Abril', 16),
('2021-05-20', 2026, 5, 'Mayo', 20),
('2021-06-17', 2026, 6, 'Junio', 17),
('2021-07-22', 2026, 7, 'Julio', 22),
('2021-08-19', 2026, 8, 'Agosto', 19),
('2021-09-23', 2026, 9, 'Septiembre', 23),
('2021-10-21', 2026, 10, 'Octubre', 21),
('2021-11-18', 2026, 11, 'Noviembre', 18),
('2021-12-16', 2026, 12, 'Diciembre', 16),
 -- 2022
('2022-01-05', 2022, 1, 'Enero', 5),
('2022-01-20', 2022, 1, 'Enero',20),
('2022-02-03', 2022, 2,  'Febrero',3),
('2022-02-18', 2022, 2,  'Febrero',18),
('2022-03-10', 2022, 3,  'Marzo',10),
('2022-03-25', 2022, 3,  'Marzo',25),
('2022-04-07', 2022, 4,  'Abril',7),
('2022-04-21', 2022, 4,  'Abril',21),
('2022-05-02', 2022, 5,  'Mayo',2),
('2022-05-19', 2022, 5,  'Mayo',19),
('2022-06-08', 2022, 6,  'Junio',8),
('2022-06-23', 2022, 6,  'Junio',23),
('2022-07-05', 2022, 7,  'Julio',5),
('2022-07-18', 2022, 7,  'Julio',18),
('2022-08-03', 2022, 8,  'Agosto',3),
('2022-08-22', 2022, 8,  'Agosto',22),
('2022-09-06', 2022, 9,  'Septiembre',6),
('2022-09-20', 2022, 9,  'Septiembre',20),
('2022-10-04', 2022, 10, 'Octubre',4),
('2022-10-19', 2022, 10, 'Octubre',19),
('2022-11-07', 2022, 11, 'Noviembre',7),
('2022-11-21', 2022, 11, 'Noviembre',21),
('2022-12-05', 2022, 12, 'Diciembre',5),
('2022-12-19', 2022, 12, 'Diciembre',19),
--2023
('2023-01-04', 2023, 1,  'Enero',4), 
('2023-01-17', 2023, 1,  'Enero',17),
('2023-02-06', 2023, 2,  'Febrero',6),
('2023-02-21', 2023, 2,  'Febrero',21),
('2023-03-09', 2023, 3,  'Marzo',9),
('2023-03-22', 2023, 3,  'Marzo',22),
('2023-04-05', 2023, 4,  'Abril',5),
('2023-04-20', 2023, 4,  'Abril',20),
('2023-05-03', 2023, 5,  'Mayo',3),
('2023-05-18', 2023, 5,  'Mayo',18),
('2023-06-07', 2023, 6,  'Junio',7),
('2023-06-21', 2023, 6,  'Junio',21),
('2023-07-06', 2023, 7,  'Julio',6),
('2023-07-19', 2023, 7,  'Julio',19),
('2023-08-02', 2023, 8,  'Agosto',2),
('2023-08-23', 2023, 8,  'Agosto',23),
('2023-09-05', 2023, 9,  'Septiembre',5),
('2023-09-19', 2023, 9,  'Septiembre',19),
('2023-10-03', 2023, 10, 'Octubre',3),
('2023-10-18', 2023, 10, 'Octubre',18),
('2023-11-08', 2023, 11, 'Noviembre',8),
('2023-11-22', 2023, 11, 'Noviembre',22),
('2023-12-04', 2023, 12, 'Diciembre',4),
('2023-12-20', 2023, 12, 'Diciembre',20),
 ---2024
('2024-01-09', 2024, 1,  'Enero',9),
('2024-02-14', 2024, 2,  'Febrero',14),
('2024-03-11', 2024, 3,  'Marzo',11),
('2024-04-16', 2024, 4,  'Abril',16),
('2024-05-21', 2024, 5,  'Mayo',21),
('2024-06-12', 2024, 6,  'Junio',12),
('2024-07-18', 2024, 7,  'Julio',18),
('2024-08-26', 2024, 8,  'Agosto',26),
('2024-09-17', 2024, 9,  'Septiembre',17),
('2024-10-22', 2024, 10, 'Octubre',22),
('2024-11-13', 2024, 11, 'Noviembre',13),
('2024-12-19', 2024, 12, 'Diciembre',19),
-- 2025
('2025-01-08', 2025, 1, 'Enero', 8),
('2025-01-23', 2025, 1, 'Enero', 23),
('2025-02-11', 2025, 2, 'Febrero', 11),
('2025-02-27', 2025, 2, 'Febrero', 27),
('2025-03-06', 2025, 3, 'Marzo', 6),
('2025-03-21', 2025, 3, 'Marzo', 21),
('2025-04-09', 2025, 4, 'Abril', 9),
('2025-04-24', 2025, 4, 'Abril', 24),
('2025-05-07', 2025, 5, 'Mayo', 7),
('2025-05-22', 2025, 5, 'Mayo', 22),
('2025-06-10', 2025, 6, 'Junio', 10),
('2025-06-26', 2025, 6, 'Junio', 26),
('2025-07-08', 2025, 7, 'Julio', 8),
('2025-07-23', 2025, 7, 'Julio', 23),
('2025-08-12', 2025, 8, 'Agosto', 12),
('2025-08-27', 2025, 8, 'Agosto', 27),
('2025-09-09', 2025, 9, 'Septiembre', 9),
('2025-09-24', 2025, 9, 'Septiembre', 24),
('2025-10-07', 2025, 10, 'Octubre', 7),
('2025-10-22', 2025, 10, 'Octubre', 22),
('2025-11-11', 2025, 11, 'Noviembre', 11),
('2025-11-25', 2025, 11, 'Noviembre', 25),
('2025-12-09', 2025, 12, 'Diciembre', 9),
('2025-12-23', 2025, 12, 'Diciembre', 23);
-- Insertado en la tabla de dimensiones Fecha, las fechas entre el año 2020 al 2025  

SELECT * FROM dim_fecha; 
-- Consulta para ver todos los registros insertados en la tabla Fecha

/*Posibles errores
INSERT INTO dim_fecha (fecha, anio, mes, nombre_mes, dia) VALUES
('2025-12-23',2028, 11,'NoviembreE',12);
 --Error constraint unique. 
 --No se puede repetir el valor del campo fecha

INSERT INTO dim_fecha (fecha, anio, mes, nombre_mes, dia) VALUES 
(NULL,2028, 11,'NOVIEMBRE',12);
--Error constraint NULL
*/



--Tabla de dimensiones Producto
INSERT INTO dim_producto (nombre_producto, categoria, precio) VALUES
('Zapatillas Running Pro', 'Calzado', 89.99),
('Camiseta Deportiva', 'Ropa', 19.95),
('Pantalón Deportivo', 'Ropa', 29.90),
('Sudadera Técnica', 'Ropa', 49.90),
('Balón de Fútbol', 'Accesorios', 24.50),
('Raqueta de Tenis', 'Accesorios', 79.00),
('Calcetines Técnicos', 'Ropa', 9.99),
('Botella Térmica', 'Complementos', 14.90),
('Gorra Deportiva', 'Complementos', 12.50),
('Chaqueta Impermeable', 'Ropa', 69.90),
('Zapatillas Trail', 'Calzado', 99.95),
('Pantalón Corto Running', 'Ropa', 24.90),
('Cinta de Correr', 'Fitness', 599.00),
('Pesas Ajustables', 'Fitness', 129.90),
('Esterilla Yoga', 'Fitness', 19.90),
('Guantes Gimnasio', 'Accesorios', 14.95),
('Casco Ciclismo', 'Accesorios', 59.90),
('Rodilleras Deportivas', 'Accesorios', 18.50),
('Reloj Deportivo GPS', 'Tecnología', 199.99),
('Bicicleta Estática', 'Fitness', 349.00),
('Bolsa de Deporte', 'Complementos', 34.90),
('Protector Solar Sport', 'Salud', 11.90),
('Barra de Dominadas', 'Fitness', 89.00),
('Comba Profesional', 'Fitness', 12.90),
('Camiseta Técnica Hombre', 'Ropa', 19.95),
('Camiseta Técnica Mujer', 'Ropa', 21.95),
('Sudadera Deportiva', 'Ropa', 39.90),
('Zapatillas Running Básicas', 'Calzado', 59.90),
('Zapatillas Training', 'Calzado', 74.90),
('Mallas Deportivas', 'Ropa', 29.90),
('Calcetines Running', 'Accesorios', 8.95),
('Mochila Deportiva', 'Complementos', 44.90),
('Polo Deportivo', 'Ropa', 27.90),
('Chaqueta Chándal', 'Ropa', 49.90),
('Balón Entrenamiento', 'Deporte', 24.90),
('Raqueta Pádel Básica', 'Deporte', 69.90),
('Guantes Invierno', 'Accesorios', 16.90),
('Cortavientos Deportivo', 'Ropa', 54.90),
('Chándal Completo', 'Ropa', 79.90),
('Pantalón Largo Running', 'Ropa', 34.90),
('Zapatillas Trail Montaña', 'Calzado', 89.90),
('Zapatillas Indoor', 'Calzado', 64.90),
('Sudadera con Capucha', 'Ropa', 44.90),
('Calcetines Térmicos', 'Accesorios', 12.90),
('Cinta Sudor', 'Accesorios', 6.50),
('Bolsa Gym Grande', 'Complementos', 59.90),
('Botellín Hidratación', 'Accesorios', 9.90),
('Polo Entrenamiento', 'Ropa', 29.90),
('Chaqueta Acolchada', 'Ropa', 89.90),
('Balón Fútbol Sala', 'Deporte', 27.90),
('Raqueta Tenis Media', 'Deporte', 119.90),
('Guantes Portero', 'Deporte', 34.90),
('Mochila Trail Running', 'Complementos', 49.90),
('Balón Baloncesto Oficial', 'Deporte', 29.90),
('Raqueta Squash Básica', 'Deporte', 39.90),
('Camiseta Manga Corta', 'Ropa', 19.95),
('Sudadera Ligera', 'Ropa', 34.90),
('Pantalón Yoga Mujer', 'Ropa', 29.90),
('Zapatillas Fitness', 'Calzado', 59.90),
('Gorra Running', 'Accesorios', 12.90),
('Botella Hidratación 500ml', 'Accesorios', 9.90),
('Esterilla Pilates', 'Fitness', 24.90);
-- Insertado la lista de productos en la tabla de dimensiones Productos, 

SELECT * FROM dim_producto; 
-- Consulta para ver todos los registros insertados en la tabla de dimensiones Producto

INSERT INTO dim_producto (nombre_producto, precio) VALUES 
('Bicicleta',200.00);
-- Al insertar un registro en la tabla y no indicar la categoria a la que pertenece, 
-- Automáticamente se establece a 'Sin especificar'													 



--Tabla de dimensiones Cliente
INSERT INTO dim_cliente (nombre_completo, edad, genero, ciudad) VALUES
('Carlos Martínez', 34, 'Masculino', 'Madrid'),
('Lucía Fernández', 28, 'Femenino', 'Barcelona'),
('Javier Gómez', 41, 'Masculino', 'Valencia'),
('Ana López', 25, 'Femenino', 'Sevilla'),
('Miguel Torres', 38, 'Masculino', 'Bilbao'),
('María Sánchez', 31, 'Femenino', 'Zaragoza'),
('David Romero', 45, 'Masculino', 'Murcia'),
('Laura Jiménez', 29, 'Femenino', 'Alicante'),
('Sergio Navarro', 36, 'Masculino', 'Granada'),
('Paula Ortega', 27, 'Femenino', 'Salamanca'),
('Iván Morales', 33, 'Masculino', 'Madrid'),
('Carmen Ruiz', 46, 'Femenino', 'Málaga'),
('Pablo Castillo', 22, 'Masculino', 'Córdoba'),
('Elena Ramos', 39, 'Femenino', 'Valladolid'),
('Alberto Núñez', 51, 'Masculino', 'Santander'),
('Natalia Vega', 27, 'Femenino', 'León'),
('Raúl Pineda', 35, 'Masculino', 'Toledo'),
('Silvia Herrera', 42, 'Femenino', 'Almería'),
('Daniel Cruz', 24, 'Masculino', 'Huelva'),
('Marta Campos', 31, 'Femenino', 'Segovia'),
('Hugo Fuentes', 28, 'Masculino', 'Burgos'),
('Isabel Prieto', 47, 'Femenino', 'Ourense'),
('Óscar Molina', 38, 'Masculino', 'Cuenca'),
('Patricia León', 26, 'Femenino', 'Ávila'),
('Fernando Vidal', 44, 'Masculino', 'Jaén'),
('Antonio Martín', 36, 'Masculino', 'Madrid'),
('Laura Sánchez', 29, 'Femenino', 'Valencia'),
('José Ramírez', 48, 'Masculino', 'Murcia'),
('Ana Torres', 33, 'Femenino', 'Barcelona'),
('Miguel López', 41, 'Masculino', 'Sevilla'),
('Rocío Pérez', 26, 'Femenino', 'Granada'),
('Francisco Molina', 54, 'Masculino', 'Cádiz'),
('Cristina Navarro', 38, 'Femenino', 'Alicante'),
('Juan Carlos Díaz', 45, 'Masculino', 'Albacete'),
('Marina Ortiz', 31, 'Femenino', 'Zaragoza'),
('Pedro Iglesias', 27, 'Masculino', 'Salamanca'),
('Beatriz Romero', 50, 'Femenino', 'Toledo'),
('Álvaro Serrano', 34, 'Masculino', 'Cuenca'),
('Nerea Blanco', 23, 'Femenino', 'Pamplona'),
('Sergio Vidal', 39, 'Masculino', 'Castellón'),
('Luis Herrera', 43, 'Masculino', 'Logroño'),
('Eva Moreno', 35, 'Femenino', 'Huesca'),
('Tomás Gil', 52, 'Masculino', 'Teruel'),
('Clara Domínguez', 28, 'Femenino', 'Soria'),
('Rubén Ortega', 31, 'Masculino', 'Lugo'),
('Mónica Rivas', 47, 'Femenino', 'Pontevedra'),
('Andrés Calvo', 39, 'Masculino', 'Palencia'),
('Verónica Peña', 24, 'Femenino', 'Zamora'),
('Joaquín Santos', 56, 'Masculino', 'Ávila'),
('Lorena Cabrera', 33, 'Femenino', 'Ceuta'),
('Ignacio Torres', 41, 'Masculino', 'Melilla'),
('Noelia Suárez', 29, 'Femenino', 'Ferrol'),
('Víctor Pardo', 37, 'Masculino', 'Reus'),
('Carolina Campos', 45, 'Femenino', 'Manresa'),
('Diego Alonso', 26, 'Masculino', 'Ponferrada'),
('Santiago Vega', 32, 'Masculino', 'Vigo'),
('Claudia Márquez', 28, 'Femenino', 'Cádiz'),
('Ricardo Campos', 45, 'Masculino', 'Badajoz'),
('Elisa Medina', 37, 'Femenino', 'Huelva'),
('Andrés Ruiz', 41, 'Masculino', 'Girona'),
('Verónica Salazar', 30, 'Femenino', 'Tarragona'),
('Javier Santos', 39, 'Masculino', 'Castellón'),
('Lorena Molina', 26, 'Femenino', 'Albacete'),
('Pablo Estrada', 35, 'Masculino', 'Córdoba'),
('Marina Ortega', 33, 'Femenino', 'Granada');
-- Insertado en la tabla de dimensiones Cliente, los clientes que hicieron al menos una compra

SELECT * FROM dim_cliente;
 --Visaliza los datos insertados en la tabla de dimensiones Cliente

/* 
  Posibles errores
INSERT INTO dim_cliente (nombre_completo,edad,genero, ciudad) 
VALUES ('Marina Ortega', 31, 'Femenino','Malaga');
--Constraint unique, no permite insertar los mismos clientes

INSERT INTO dim_cliente (nombre_completo,edad,genero, ciudad)
VALUES ('eduardo molina', 16, 'Masculino','Madrid');
 --Constraint check edad.
*/


--Tabla de dimensiones Tienda
INSERT INTO dim_tienda (nombre_tienda, ciudad, pais) VALUES
('Sprinter Madrid Centro', 'Madrid', 'España'),
('Sprinter Barcelona Norte', 'Barcelona', 'España'),
('Sprinter Valencia Este', 'Valencia', 'España'),
('Sprinter Sevilla Sur', 'Sevilla', 'España'),
('Sprinter Bilbao Centro', 'Bilbao', 'España'),
('Sprinter Málaga Centro', 'Málaga', 'España'),
('Sprinter Alicante Playa', 'Alicante', 'España'),
('Sprinter Murcia Oeste', 'Murcia', 'España'),
('Sprinter Zaragoza Norte', 'Zaragoza', 'España'),
('Sprinter Granada Centro', 'Granada', 'España'),
('Sprinter Valladolid Este', 'Valladolid', 'España'),
('Sprinter Santander Norte', 'Santander', 'España'),
('Sprinter León Centro', 'León', 'España'),
('Sprinter Salamanca Sur', 'Salamanca', 'España'),
('Sprinter Gijón Centro', 'Gijón', 'España'),
('Sprinter Albacete Centro', 'Albacete', 'España'),
('Sprinter Cádiz Bahía', 'Cádiz', 'España'),
('Sprinter Toledo Oeste', 'Toledo', 'España'),
('Sprinter Pamplona Norte', 'Pamplona', 'España'),
('Sprinter Castellón Centro', 'Castellón', 'España'),
('Sprinter Salamanca Centro', 'Salamanca', 'España'),
('Sprinter Cuenca Este', 'Cuenca', 'España'),
('Sprinter Jaén Centro', 'Jaén', 'España'),
('Sprinter Logroño Centro', 'Logroño', 'España'),
('Sprinter Huesca Norte', 'Huesca', 'España'),
('Sprinter Teruel Centro', 'Teruel', 'España'),
('Sprinter Soria Sur', 'Soria', 'España'),
('Sprinter Lugo Centro', 'Lugo', 'España'),
('Sprinter Pontevedra Norte', 'Pontevedra', 'España'),
('Sprinter Palencia Este', 'Palencia', 'España'),
('Sprinter Zamora Centro', 'Zamora', 'España');
-- Insertado las tiendas Sprinter en Esapaña en la tabla de dimensiones Tienda

SELECT * FROM dim_tienda;
 --Visaliza los datos insertados en la tabla de dimensiones Tienda

INSERT INTO dim_tienda (nombre_tienda, ciudad) VALUES 
('Sprinter Paris', 'Paris');
-- Si no se especifica el pais al insertar un registro, por defecto, se establece al string "ESPAÑA"
DELETE dim_tienda WHERE ciudad= 'Paris';
--Elimina el registro insertado en la instrucción anterior



--Tabla de hechos Ventas
INSERT INTO hechos_ventas 
(fecha_id, producto_id, cliente_id, tienda_id, cantidad, total_venta) VALUES
(1, 1, 1, 1, 1, 89.99),
(3, 2, 2, 2, 2, 39.90),
(5, 3, 3, 3, 1, 29.90),
(7, 4, 4, 4, 1, 49.90),
(9, 5, 5, 5, 2, 49.00),
(12, 6, 6, 1, 1, 79.00),
(15, 7, 7, 2, 1, 39.95),
(18, 8, 8, 3, 3, 29.97),
(20, 9, 9, 4, 2, 29.80),
(22, 10, 10, 5, 1, 12.50),
(25, 1, 2, 1, 2, 179.98),
(30, 2, 3, 2, 3, 59.85),
(35, 3, 4, 3, 1, 29.90),
(40, 4, 5, 4, 2, 99.80),
(45, 5, 6, 5, 1, 24.50),
(50, 6, 7, 1, 1, 79.00),
(55, 7, 8, 2, 2, 79.90),
(60, 8, 9, 3, 4, 39.96),
(65, 9, 10, 4, 1, 14.90),
(70, 10, 1, 5, 2, 25.00),
(5, 8, 10, 3, 2, 39.90),
(12, 9, 11, 4, 1, 59.90),
(18, 10, 12, 5, 1, 29.90),
(22, 11, 13, 6, 3, 26.85),
(30, 12, 14, 7, 1, 44.90),
(35, 13, 15, 8, 2, 55.80),
(40, 14, 16, 3, 1, 69.90),
(45, 15, 17, 4, 1, 16.90),
(50, 9, 18, 5, 2, 119.80),
(55, 10, 19, 6, 1, 29.90),
(60, 11, 20, 7, 1, 24.90),
(65, 12, 21, 8, 2, 99.80),
(68, 31, 26, 11, 1, 54.90),
(70, 32, 27, 12, 1, 79.90),
(72, 33, 28, 13, 2, 69.80),
(74, 34, 29, 14, 1, 89.90),
(76, 35, 30, 15, 1, 64.90),
(78, 36, 31, 16, 2, 89.80),
(80, 37, 32, 17, 3, 38.70),
(82, 38, 33, 18, 2, 13.00),
(84, 39, 34, 19, 1, 59.90),
(86, 40, 35, 20, 4, 39.60),
(88, 41, 36, 11, 1, 29.90),
(90, 42, 37, 12, 1, 89.90),
(92, 43, 38, 13, 2, 55.80),
(94, 44, 39, 14, 1, 119.90),
(96, 45, 40, 15, 1, 34.90),
(2, 3, 5, 2, 1, 29.90),
(4, 7, 6, 3, 2, 79.90),
(6, 1, 7, 1, 1, 89.99),
(8, 5, 8, 4, 3, 73.50),
(10, 2, 9, 5, 2, 39.90),
(12, 6, 10, 1, 1, 79.00),
(14, 8, 11, 2, 1, 9.99),
(16, 9, 12, 3, 2, 29.80),
(18, 4, 13, 4, 1, 49.90),
(20, 3, 14, 5, 2, 59.80),
(22, 7, 15, 1, 1, 39.95),
(24, 1, 16, 2, 3, 269.97),
(26, 5, 17, 3, 1, 24.50),
(28, 2, 18, 4, 2, 39.90),
(30, 6, 19, 5, 1, 79.00),
(32, 8, 20, 1, 1, 9.99),
(34, 9, 1, 2, 2, 29.80),
(36, 4, 2, 3, 1, 49.90),
(38, 3, 3, 4, 3, 89.70),
(40, 7, 4, 5, 2, 79.90),
(42, 1, 5, 1, 1, 89.99),
(44, 5, 6, 2, 1, 24.50),
(46, 2, 7, 3, 2, 39.90),
(48, 6, 8, 4, 1, 79.00),
(50, 8, 9, 5, 3, 29.97),
(52, 9, 10, 1, 1, 14.90),
(54, 4, 11, 2, 2, 99.80),
(56, 3, 12, 3, 1, 29.90),
(58, 7, 13, 4, 2, 79.90),
(60, 1, 14, 5, 1, 89.99),
(3, 46, 41, 12, 1, 49.90),
(5, 47, 42, 13, 2, 59.80),
(7, 48, 43, 14, 1, 39.90),
(10, 49, 44, 15, 1, 19.95),
(12, 50, 45, 11, 1, 34.90),
(14, 51, 46, 12, 2, 59.80),
(16, 52, 47, 13, 1, 29.90),
(18, 53, 48, 14, 1, 59.90),
(20, 54, 49, 15, 3, 38.70),
(22, 55, 50, 11, 2, 25.80);

SELECT * FROM hechos_ventas; --Visaliza todas las ventas realizadas
