USE organizedFood;

DELIMITER //
CREATE PROCEDURE create_lista_compra(
	IN in_serial_usuario VARCHAR(10),
    IN in_nombre VARCHAR(100)
)
BEGIN
    -- Declaración e inicialización de variables locales
    SET @serial_lista_compra = '';
    SET @count = 0;

    WHILE @serial_lista_compra = '' OR @count > 0 DO
        -- Generar un nuevo valor aleatorio
        SET @serial_lista_compra = UPPER(SUBSTRING(MD5(RAND()), 1, 8));

        -- Comprobar si el valor aleatorio ya existe en la tabla lista_compra
        SET @count = (SELECT COUNT(*) FROM lista_compra WHERE serial_lista_compra = @serial_lista_compra COLLATE utf8mb4_unicode_ci);
    END WHILE;

    INSERT IGNORE INTO lista_compra (serial_lista_compra, Nombre, Fecha_creacion, serial_usuario_creador)
	VALUES (@serial_lista_compra, in_nombre, CURDATE(), in_serial_usuario);


END //
DELIMITER ;
