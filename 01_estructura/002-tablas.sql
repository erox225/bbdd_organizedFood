USE organizedFood;

-- Crear la tabla Usuarios si no existe
CREATE TABLE IF NOT EXISTS user (
    id INT AUTO_INCREMENT PRIMARY KEY,
    password VARCHAR(100) NOT NULL,
    username VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
    Fecha_modificacion DATE,
    UNIQUE(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Estado_producto si no existe
-- Hay 2 Opciones: Disponible, Agotado
CREATE TABLE IF NOT EXISTS product_status (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    color VARCHAR(20) NOT NULL,
    Fecha_creacion DATE NOT NULL,
	UNIQUE(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Hogar si no existe
CREATE TABLE IF NOT EXISTS home (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    fecha_creacion DATE NOT NULL,
	UNIQUE(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Producto si no existe
CREATE TABLE IF NOT EXISTS product (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
	UNIQUE(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Receta si no existe
CREATE TABLE IF NOT EXISTS recipe (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
	UNIQUE(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

---------------------- Relaciones

-- Crear la tabla Receta_producto si no existe
-- En esta tabla guardamos los productos que tiene una receta
CREATE TABLE IF NOT EXISTS recipe_product(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_receta INT NOT NULL,
    id_producto INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (id_receta) REFERENCES Recipe(id),
    FOREIGN KEY (id_producto) REFERENCES Product(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Despensa si no existe
-- En esta tabla guardamos las recetas y los productos que tiene un hogar, con esta tabla podemos saber si el producto esta disponible o agotado
CREATE TABLE IF NOT EXISTS storage(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_receta INT NOT NULL,
    id_hogar INT NOT NULL,
	id_producto INT NOT NULL,
	id_estado_producto INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (id_receta) REFERENCES Recipe(id),
    FOREIGN KEY (id_hogar) REFERENCES Home(id),
	FOREIGN KEY (id_producto) REFERENCES Product(id),
	FOREIGN KEY (id_estado_producto) REFERENCES product_status(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla purchase si no existe 
-- -- En esta tabla guardamos las compras que hacen los usuarios en cada Hogar
CREATE TABLE IF NOT EXISTS purchase(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_hogar INT NOT NULL,
    fecha_modificacion DATE NOT NULL,
	valor DECIMAL(6,2) NULL,	
	fecha_creacion DATE NOT NULL,
	estado INT NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES User(id),
    FOREIGN KEY (id_hogar) REFERENCES Home(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Receta_usuario si no existe
-- En esta tabla guardamos las recetas que tiene un usuario
CREATE TABLE IF NOT EXISTS recipe_user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_receta INT NOT NULL,
    id_usuario INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (id_receta) REFERENCES Recipe(id),
    FOREIGN KEY (id_usuario) REFERENCES User(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Receta_hogar si no existe
-- En esta tabla guardamos las recetas que tiene un usuario
CREATE TABLE IF NOT EXISTS recipe_home(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_receta INT NOT NULL,
    id_hogar INT NOT NULL,
	preparation_date DATE NOT NULL, -- Fecha de preparacion 
	preparation_order INT NOT NULL, -- Orden de preparacion (Desayuno, almuerzo,Cena)
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (id_receta) REFERENCES Recipe(id),
    FOREIGN KEY (id_hogar) REFERENCES Home(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Hogar_usuario si no existe 
-- -- En esta tabla guardamos los usuarios que tiene un hogar
CREATE TABLE IF NOT EXISTS home_user(
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_usuario INT NOT NULL,
    id_hogar INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (id_usuario) REFERENCES User(id),
    FOREIGN KEY (id_hogar) REFERENCES Home(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
---------------------- Relaciones