USE organizedFood;

-- Crear la tabla Usuarios si no existe
CREATE TABLE IF NOT EXISTS Usuarios (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_usuario VARCHAR(10) NOT NULL,
    password VARCHAR(100) NOT NULL,
    nombre VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
    Fecha_modificacion DATE,
    UNIQUE(serial_usuario)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Hogar si no existe
CREATE TABLE IF NOT EXISTS Hogar (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_hogar VARCHAR(10) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    fecha_creacion DATE NOT NULL,
	UNIQUE(serial_hogar)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla lista_compra si no existe
CREATE TABLE IF NOT EXISTS lista_compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
	serial_lista_compra VARCHAR(10) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
    Fecha_modificacion DATE,
    serial_usuario_creador VARCHAR(10) NOT NULL,
	UNIQUE(serial_lista_compra),
    FOREIGN KEY (serial_usuario_creador) REFERENCES Usuarios(serial_usuario)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Estado_producto si no existe
CREATE TABLE IF NOT EXISTS Estado_producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Nombre VARCHAR(10) NOT NULL,
    color VARCHAR(20) NOT NULL,
    Fecha_creacion DATE NOT NULL
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Producto si no existe
CREATE TABLE IF NOT EXISTS Producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_producto VARCHAR(10) NOT NULL,
    Nombre VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
	UNIQUE(serial_producto)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Lista_compra_producto si no existe
CREATE TABLE IF NOT EXISTS Lista_compra_producto (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_producto VARCHAR(10) NOT NULL,
    serial_lista_compra VARCHAR(10) NOT NULL,
    id_estado_producto INT NOT NULL,
    fecha_creacion DATE NOT NULL,
    Condicion_producto VARCHAR(20) NOT NULL,
    FOREIGN KEY (serial_producto) REFERENCES Producto(serial_producto),
    FOREIGN KEY (serial_lista_compra) REFERENCES lista_compra(serial_lista_compra),
    FOREIGN KEY (id_estado_producto) REFERENCES Estado_producto(id)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla historial_de_compras si no existe
CREATE TABLE IF NOT EXISTS historial_de_compras (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_producto VARCHAR(10) NOT NULL,
    serial_lista_compra VARCHAR(10) NOT NULL,
    serial_usuario VARCHAR(10) NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (serial_producto) REFERENCES Producto(serial_producto),
    FOREIGN KEY (serial_lista_compra) REFERENCES lista_compra(serial_lista_compra),
    FOREIGN KEY (serial_usuario) REFERENCES Usuarios(serial_usuario)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Hogar_lista_compra si no existe
CREATE TABLE IF NOT EXISTS Hogar_lista_compra (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_lista_compra VARCHAR(10) NOT NULL,
    serial_hogar VARCHAR(10) NOT NULL,
    Fecha_creacion DATE NOT NULL,
    FOREIGN KEY (serial_lista_compra) REFERENCES lista_compra(serial_lista_compra),
    FOREIGN KEY (serial_hogar) REFERENCES Hogar(serial_hogar)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Historial_producto_acabado si no existe
CREATE TABLE IF NOT EXISTS Historial_producto_acabado (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_producto VARCHAR(10) NOT NULL,
    serial_lista_compra VARCHAR(10) NOT NULL,
    serial_hogar VARCHAR(10) NOT NULL,
    respuesto BOOLEAN NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (serial_producto) REFERENCES Producto(serial_producto),
    FOREIGN KEY (serial_lista_compra) REFERENCES lista_compra(serial_lista_compra),
    FOREIGN KEY (serial_hogar) REFERENCES Hogar(serial_hogar)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Configuraciones_lista si no existe
CREATE TABLE IF NOT EXISTS Configuraciones_lista (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_lista_compra VARCHAR(10) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    valor VARCHAR(100) NOT NULL,
    Fecha_creacion DATE NOT NULL,
    estado VARCHAR(20) NOT NULL,
    fecha_modificacion DATE,
    FOREIGN KEY (serial_lista_compra) REFERENCES lista_compra(serial_lista_compra)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;

-- Crear la tabla Hogar_usuario si no existe
CREATE TABLE IF NOT EXISTS Hogar_usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    serial_usuario VARCHAR(10) NOT NULL,
    serial_hogar VARCHAR(10) NOT NULL,
    fecha_creacion DATE NOT NULL,
    FOREIGN KEY (serial_usuario) REFERENCES Usuarios(serial_usuario),
    FOREIGN KEY (serial_hogar) REFERENCES Hogar(serial_hogar)
)CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
