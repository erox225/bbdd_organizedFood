USE organizedFood;

DELIMITER //
CREATE PROCEDURE create_usuario(
    IN in_password VARCHAR(255),
    IN in_nombre VARCHAR(100)
)
BEGIN
    -- Declaración e inicialización de variables locales
    SET @serial_usuario = '';
    SET @count = 0;

    WHILE @serial_usuario = '' OR @count > 0 DO
        -- Generar un nuevo valor aleatorio
        SET @serial_usuario = UPPER(SUBSTRING(MD5(RAND()), 1, 8));

        -- Comprobar si el valor aleatorio ya existe en la tabla Usuarios
        SET @count = (SELECT COUNT(*) FROM Usuarios WHERE serial_usuario = @serial_usuario COLLATE utf8mb4_unicode_ci);
    END WHILE;

    -- Insertar en la tabla Usuarios
    INSERT IGNORE INTO Usuarios (serial_usuario, password, nombre, Fecha_creacion,Fecha_modificacion)
    VALUES (@serial_usuario, in_password, in_nombre, CURDATE(),CURDATE());

END //
DELIMITER ;


