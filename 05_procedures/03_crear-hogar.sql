USE organizedFood;

DELIMITER //
CREATE PROCEDURE create_hogar(
    IN in_nombre VARCHAR(100)
)
BEGIN
    -- Declaración e inicialización de variables locales
    SET @serial_hogar = '';
    SET @count = 0;

    WHILE @serial_hogar = '' OR @count > 0 DO
        -- Generar un nuevo valor aleatorio
        SET @serial_hogar = UPPER(SUBSTRING(MD5(RAND()), 1, 8));

        -- Comprobar si el valor aleatorio ya existe en la tabla Hogar
        SET @count = (SELECT COUNT(*) FROM Hogar WHERE serial_hogar = @serial_hogar COLLATE utf8mb4_unicode_ci);
    END WHILE;

    -- Agregar registros de prueba en la tabla Hogar
	INSERT IGNORE INTO Hogar (serial_hogar, Nombre, fecha_creacion)
	VALUES (@serial_hogar, in_nombre, CURDATE());

END //
DELIMITER ;