

/* 
El esquema de nuestra base de datos SQLite se compone por 4 tablas de dimensiones
y 1 tabla de hechos. Para conectarse al servidor de la base de datos SQLite se emplea
 el IDE DBeaver.
En cada tabla se asignará una PK que nos servirá para tener un control de cuántos registros
se han insertado, así como permitir el acceso y la comunicación entre las diferentes tablas.
*/

--- Tabla de dimensiones Fecha

CREATE TABLE IF NOT EXISTS  dim_fecha (
    fecha_id INTEGER PRIMARY KEY AUTOINCREMENT,
    -- Clave primaria de la tabla.
    -- Identifica de forma única cada fecha.
    -- El valor se genera automáticamente y aumenta de forma incremental
    fecha DATE NOT NULL UNIQUE,
    -- Fecha de tipo DATE.
    -- No admite valores NULL.
    -- Debe ser único, por lo que no se permite insertar fechas idénticas
    anio INTEGER,  
    -- Año de la fecha.
    -- Se almacena como numero entero    
    mes INTEGER,
    -- Mes de la fecha.
    -- Se almacena como numero entero 
    nombre_mes TEXT
    -- Año de la fecha.
    -- Se almacena como string 
);

--- Tabla de dimensiones Producto
CREATE TABLE IF NOT EXISTS dim_producto (
    producto_id INTEGER PRIMARY KEY AUTOINCREMENT,
    -- Clave primaria de la tabla.
    -- Identifica de forma única cada producto.
    -- El valor se genera automáticamente y aumenta de forma incremental
    nombre_producto TEXT NOT NULL UNIQUE,
    -- Nombre del producto.
    -- No admite valores NULL.
    -- Debe ser único, por lo que no se permiten productos duplicados
    categoria TEXT DEFAULT "Sin categoría",
    -- Categoría a la que pertenece el producto.
    -- Si no se especifica ningún valor al insertar el registro, se asigna automáticamente el valor 'Sin categoría'
    precio REAL
    -- Precio del producto.
    -- Se almacena como número real para permitir valores decimales.
);

--- Tabla de dimensiones Cliente
CREATE TABLE IF NOT EXISTS dim_cliente (
    cliente_id INTEGER PRIMARY KEY AUTOINCREMENT,
    -- Clave primaria de la tabla.
    -- Identifica de forma única cada cliente.
    -- El valor se genera automáticamente y aumenta de forma incremental
    nombre_completo TEXT NOT NULL UNIQUE ,
    -- Nombre y apeliidos del cliente.
    -- No admite valores NULL.
    -- Debe ser único, por lo que no se permite insertar los mismos clientes
    edad INTEGER CHECK (edad> 18),
    -- Edad del cliente.
    -- No admite clientes cin una edad inferior a 18 años.
    -- Se almacena como número entero
    genero TEXT DEFAULT "Sin especificar",
    -- Género del cliente.
    -- Si no se especifica el género al insertar el registro, se asigna automáticamente el string 'Sin categoría
    ciudad TEXT
    -- Ciudad donde reside el cliente.
);

--- Tabla de dimensiones Tienda
CREATE TABLE IF NOT EXISTS dim_tienda (
    tienda_id INTEGER PRIMARY KEY AUTOINCREMENT,  
    -- Clave primaria de la tabla.
    -- Identifica de forma única cada tienda.
    -- El valor se genera automáticamente y aumenta de forma incremental
    nombre_tienda TEXT NOT NULL UNIQUE,
    -- Nombre de la tienda.
    -- No admite valores NULL.
    -- Debe ser único, por lo que no se permiten insertar tiendas con el mismo nombre
    ciudad TEXT,
    -- Ciudad donde esta ubicada la tienda.
    pais TEXT DEFAULT "España"
    -- País de origen del cliente.
    -- Si no se especifica el país al insertar el registro, se asigna automáticamente el string 'España"
);

--- Tabla de hechos Ventas
CREATE TABLE IF NOT EXISTS hechos_ventas (
    id_venta INTEGER PRIMARY KEY AUTOINCREMENT,
    -- Clave primaria de la tabla.
    -- Identifica de forma única cada venta.
    -- El valor se genera automáticamente y aumenta de forma incremental
    fecha_id INTEGER NOT NULL,
    -- Identifica de la fecha de la venta.
    --No puede ser NULL 
    producto_id INTEGER NOT NULL,
    -- Identifica el producto vendido.
    --No puede ser NULL 
    cliente_id INTEGER NOT NULL,
    -- Identifica el cliente que ha hecho la compra.
    --No puede ser NULL 
    tienda_id INTEGER NOT NULL,
    -- Identifica la tienda donde se realizó la venta.
    --No puede ser NULL 
    cantidad INTEGER,
    -- Almacena como número entero las unidades vendidas en cada venta.
    total_venta REAL,
    -- El precio total que paga el cliente por los productos
    
 /*La tabla de hechos tiene relación 1 a 1 con las 4 tablas de dimesnsiones creadas anteriormente. 
	Tienen un campo en común. Claves foráneas:
*/
    FOREIGN KEY (fecha_id) REFERENCES dim_fecha(fecha_id),-- Relación Ventas-Fecha por el campo fecha_id
    FOREIGN KEY (producto_id) REFERENCES dim_producto(producto_id), -- Relación Ventas-Producto por el campo producto_id
    FOREIGN KEY (cliente_id) REFERENCES dim_cliente(cliente_id), -- Relación Ventas-Cliente por el campo cliente_id
    FOREIGN KEY (tienda_id) REFERENCES dim_tienda(tienda_id) -- Relación Ventas-Tienda por el campo tienda_id
);

