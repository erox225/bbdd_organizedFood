USE organizedFood;

DELIMITER //
CREATE PROCEDURE create_producto(
	IN in_nombre_producto VARCHAR(100)
)
BEGIN
    -- Declaración e inicialización de variables locales
    SET @serial_producto = '';
    SET @count = 0;

    WHILE @serial_producto = '' OR @count > 0 DO
        -- Generar un nuevo valor aleatorio
        SET @serial_producto = UPPER(SUBSTRING(MD5(RAND()), 1, 8));

        -- Comprobar si el valor aleatorio ya existe en la tabla producto
        SET @count = (SELECT COUNT(*) FROM producto WHERE serial_producto = @serial_producto COLLATE utf8mb4_unicode_ci);
    END WHILE;

    -- Insertar en la tabla producto
    INSERT IGNORE INTO producto (serial_producto, Nombre, Fecha_creacion)
    VALUES (@serial_producto , in_nombre_producto, CURDATE());

END //
DELIMITER ;