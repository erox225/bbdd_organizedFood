USE organizedFood;

-- Crear producto
call organizedfood.create_producto('producto1');
set @serial_producto = (select serial_producto from producto where nombre = 'producto1' COLLATE utf8mb4_unicode_ci LIMIT 1);

-- Crear usuario
call organizedfood.create_usuario('password1','usuario1');
set @serial_usuario = (select serial_usuario from usuarios where nombre = 'usuario1' COLLATE utf8mb4_unicode_ci LIMIT 1);

-- Crear hogar
call organizedfood.create_hogar('hogar1');
set @serial_hogar = (select serial_hogar from hogar where nombre = 'hogar1' COLLATE utf8mb4_unicode_ci LIMIT 1);

-- Crear lista_compra
call organizedfood.create_lista_compra(@serial_usuario,'lista1');
set @serial_lista_compra = (select serial_lista_compra from lista_compra where nombre = 'lista1' COLLATE utf8mb4_unicode_ci LIMIT 1);

-- Agregar registros de prueba en la tabla Estado_producto
INSERT IGNORE INTO Estado_producto (Nombre, color, Fecha_creacion)
VALUES
  ('Nuevo', 'Verde', '2023-07-28'),
  ('Usado', 'Rojo', '2023-07-28');

-- Agregar registros de prueba en la tabla Lista_compra_producto
INSERT IGNORE INTO Lista_compra_producto (serial_producto, serial_lista_compra, id_estado_producto, fecha_creacion, Condicion_producto)
VALUES
  (@serial_producto, @serial_lista_compra, '1', '2023-07-28', 'Bueno'),
  (@serial_producto, @serial_lista_compra, '1', '2023-07-28', 'Regular'),
  (@serial_producto, @serial_lista_compra, '2', '2023-07-28', 'Excelente');

-- Agregar registros de prueba en la tabla historial_de_compras
INSERT IGNORE INTO historial_de_compras (serial_producto, serial_lista_compra, serial_usuario, fecha_creacion)
VALUES
  (@serial_producto, @serial_lista_compra, @serial_usuario, '2023-07-28'),
  (@serial_producto, @serial_lista_compra, @serial_usuario, '2023-07-28'),
  (@serial_producto, @serial_lista_compra, @serial_usuario, '2023-07-28');
  
  -- Agregar registros de prueba en la tabla Hogar_lista_compra
INSERT IGNORE INTO Hogar_lista_compra (serial_lista_compra, serial_hogar, Fecha_creacion)
VALUES
  (@serial_lista_compra, @serial_hogar, '2023-07-28'),
  (@serial_lista_compra, @serial_hogar, '2023-07-28');

-- Agregar registros de prueba en la tabla Historial_producto_acabado
INSERT IGNORE INTO Historial_producto_acabado (serial_producto, serial_lista_compra, serial_hogar, respuesto, fecha_creacion)
VALUES
  (@serial_producto, @serial_lista_compra, @serial_hogar, true, '2023-07-28'),
  (@serial_producto, @serial_lista_compra, @serial_hogar, false, '2023-07-28'),
  (@serial_producto, @serial_lista_compra, @serial_hogar, true, '2023-07-28');

-- Agregar registros de prueba en la tabla Configuraciones_lista
INSERT IGNORE INTO Configuraciones_lista (serial_lista_compra, nombre, valor, Fecha_creacion, estado)
VALUES
  (@serial_lista_compra, 'Opción 1', 'Valor 1', '2023-07-28', 'Activo'),
  (@serial_lista_compra, 'Opción 2', 'Valor 2', '2023-07-28', 'Inactivo'),
  (@serial_lista_compra, 'Opción 1', 'Valor 1', '2023-07-28', 'Activo');

-- Agregar registros de prueba en la tabla Hogar_usuario
INSERT IGNORE INTO Hogar_usuario (serial_usuario, serial_hogar, fecha_creacion)
VALUES
  (@serial_usuario, @serial_hogar, '2023-07-28'),
  (@serial_usuario, @serial_hogar, '2023-07-28');

