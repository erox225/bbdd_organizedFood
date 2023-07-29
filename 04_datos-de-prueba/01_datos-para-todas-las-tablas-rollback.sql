USE organizedFood;

SET SQL_SAFE_UPDATES = 0;

-- Eliminar registros de prueba de la tabla Lista_compra_producto
DELETE FROM Lista_compra_producto
WHERE serial_producto IN (
    SELECT serial_producto FROM Producto WHERE Nombre = 'Producto 1' AND Fecha_creacion = '2023-07-28'
);

-- Eliminar registros de prueba de la tabla historial_de_compras
DELETE FROM historial_de_compras
WHERE serial_producto IN (
    SELECT serial_producto FROM Producto WHERE Nombre = 'Producto 1' AND Fecha_creacion = '2023-07-28'
);

-- Eliminar registros de prueba de la tabla Hogar_lista_compra
DELETE FROM Hogar_lista_compra
WHERE serial_lista_compra IN (
    SELECT serial_lista_compra FROM lista_compra WHERE Nombre = 'Lista de Compra 1' AND Fecha_creacion = '2023-07-28'
);

-- Eliminar registros de prueba de la tabla Historial_producto_acabado
DELETE FROM Historial_producto_acabado
WHERE serial_producto IN (
    SELECT serial_producto FROM Producto WHERE Nombre = 'Producto 1' AND Fecha_creacion = '2023-07-28'
);

-- Eliminar registros de prueba de la tabla Configuraciones_lista
DELETE FROM Configuraciones_lista
WHERE serial_lista_compra IN (
    SELECT serial_lista_compra FROM lista_compra WHERE Nombre = 'Lista de Compra 1' AND Fecha_creacion = '2023-07-28'
);

-- Eliminar registros de prueba de la tabla Hogar_usuario
DELETE FROM Hogar_usuario
WHERE serial_usuario IN (
    SELECT serial_usuario FROM Usuarios WHERE nombre = 'Usuario 1' AND Fecha_creacion = '2023-07-28'
);

SET SQL_SAFE_UPDATES = 1;