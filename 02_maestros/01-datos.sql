USE organizedFood;

-- Insertar datos de hogares
INSERT INTO home (Nombre, fecha_creacion)
VALUES ('Hogar Sestao', NOW()),
       ('Hogar Bilbao', NOW());

-- Insertar datos de usuarios
INSERT INTO user (password, username, Fecha_creacion)
VALUES ('admin', 'admin', NOW()),
       ('123456', 'user1', NOW()),
       ('123456', 'user2', NOW()),
       ('123456', 'user3', NOW());

-- Insertar datos de recetas
INSERT INTO recipe (Nombre, Fecha_creacion)
VALUES ('Arroz con Pollo', NOW()),
       ('Lentejas con chorizo', NOW()),
       ('Sopa', NOW());

-- Insertar datos de productos
INSERT INTO product (Nombre, Fecha_creacion)
VALUES ('Chorizo', NOW()),
       ('Lentejas', NOW()),
	   ('Pollo', NOW()),
	   ('Sal', NOW()),
	   ('Papas', NOW()),
	   ('Pan', NOW()),
       ('Arroz', NOW());
	   
-- Insertar los dos estados en la tabla Estado_producto
INSERT INTO product_status (Nombre, color, Fecha_creacion)
VALUES ('Disponible', 'Verde', NOW()),
       ('Agotado', 'Rojo', NOW());


-- Insertar relaciones Hogar_usuario (asumiendo que cada hogar tiene 2 usuarios)
INSERT INTO home_user (id_usuario, id_hogar, fecha_creacion) values ('1','1',now());
INSERT INTO home_user (id_usuario, id_hogar, fecha_creacion) values ('2','1',now());
INSERT INTO home_user (id_usuario, id_hogar, fecha_creacion) values ('3','1',now());

-- Insertar relaciones Receta_hogar (asumiendo que cada hogar tiene 5 recetas)
-- Arroz con pollo
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','1','3','1',now());
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','1','7','1',now());
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','1','6','1',now());

-- Lentejas con Chorizo
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','2','2','1',now());
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','2','1','1',now());

-- Sopa
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','3','3','1',now());
INSERT INTO storage (id_hogar,id_receta,id_producto,id_estado_producto, fecha_creacion) values ('1','3','5','1',now());

-- Insertar relaciones Receta_usuario (asumiendo que cada usuario tiene 5 recetas)
INSERT INTO recipe_user (id_receta, id_usuario, fecha_creacion) values ('1','1',now());
INSERT INTO recipe_user (id_receta, id_usuario, fecha_creacion) values ('2','1',now());
INSERT INTO recipe_user (id_receta, id_usuario, fecha_creacion) values ('3','1',now());

-- Insertar relaciones Receta_producto (asumiendo que cada receta tiene 5 productos)
-- Arroz con pollo
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('1','3',now()); 
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('1','7',now()); 
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('1','6',now());

-- Lentejas con Chorizo
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('2','2',now()); 
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('2','1',now()); 

-- Sopa
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('3','3',now()); 
INSERT INTO recipe_product (id_receta, id_producto, fecha_creacion) values ('3','5',now());


-- Receta_hogar

INSERT INTO recipe_home (id_receta, id_hogar, preparation_date, preparation_order, fecha_creacion) values ('1','1',now(),1,now()); 
INSERT INTO recipe_home (id_receta, id_hogar, preparation_date, preparation_order, fecha_creacion) values ('1','2',now(),1,now()); 
