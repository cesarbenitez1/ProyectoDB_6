CREATE TABLE sucursal (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	dirección TEXT
);

CREATE TABLE categoria (
	id SERIAL PRIMARY KEY,
	nombre TEXT
);

CREATE TABLE producto (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	marca TEXT,
	categoria_id INTEGER,
	precio_unitario INTEGER,
	FOREIGN KEY (categoria_id) REFERENCES categoria(id)
);

CREATE TABLE stock (
	id SERIAL PRIMARY KEY,
	sucursal_id INTEGER,
	producto_id INTEGER,
	cantidad INTEGER, 
	UNIQUE (sucursal_id, producto_id),
	FOREIGN KEY (sucursal_id) REFERENCES sucursal(id),
	FOREIGN KEY (producto_id) REFERENCES producto(id)
);

CREATE TABLE cliente (
	id SERIAL PRIMARY KEY,
	nombre TEXT,
	telefono VARCHAR(50)
);

CREATE TABLE orden (
	id SERIAL PRIMARY KEY,
	cliente_id INTEGER,
	sucursal_id INTEGER,
	fecha DATE,
	total INTEGER,
	FOREIGN KEY (cliente_id) REFERENCES cliente(id),
	FOREIGN KEY (sucursal_id) REFERENCES sucursal(id)	
);

CREATE TABLE item (
	id SERIAL PRIMARY KEY,
	orden_id INTEGER,
	producto_id INTEGER,
	cantidad INTEGER,
	monto_venta INTEGER,
	FOREIGN KEY (orden_id) REFERENCES orden(id),
	FOREIGN KEY (producto_id) REFERENCES producto(id)	
);

INSERT INTO categoria (id, nombre)
VALUES (1, 'Electrónicos'),
  (2, 'Ropa'),
  (3, 'Hogar'),
  (4, 'Deportes'),
  (5, 'Juguetes');
 
INSERT INTO producto (id, nombre, marca, categoria_id, precio_unitario)
VALUES
  (1, 'Televisor', 'Sony', 1, 1000),
  (2, 'Laptop', 'HP', 1, 800),
  (3, 'Camisa', 'Zara', 2, 50),
  (4, 'Pantalón', 'Levi''s', 2, 70),
  (5, 'Sartén', 'T-fal', 3, 30),
  (6, 'Toalla', 'Cannon', 3, 20),
  (7, 'Pelota', 'Nike', 4, 15),
  (8, 'Raqueta', 'Wilson', 4, 50),
  (9, 'Muñeca', 'Barbie', 5, 25),
  (10, 'Carro', 'Hot Wheels', 5, 10);
 
INSERT INTO sucursal (id, nombre, dirección)
VALUES
  (1, 'Sucursal A', 'Calle 1'),
  (2, 'Sucursal B', 'Calle 2'),
  (3, 'Sucursal C', 'Calle 3');

INSERT INTO cliente (id, nombre, telefono)
VALUES
  (1, 'Juan', '1234567890'),
  (2, 'María', '0987654321'),
  (3, 'Pedro', '5555555555');
 
 ALTER TABLE cliente 
 ALTER COLUMN telefono TYPE VARCHAR(15);

INSERT INTO orden (id, cliente_id, sucursal_id, fecha, total)
VALUES
  (1, 1, 3, '2023-06-12', 575),
  (2, 2, 1, '2023-06-12', 705),
  (3, 3, 3, '2023-06-12', 9000),
  (4, 2, 3, '2023-06-12', 10400),
  (5, 3, 3, '2023-06-12', 85),
  (6, 1, 1, '2023-06-12', 830),
  (7, 1, 1, '2023-06-12', 490),
  (8, 3, 3, '2023-06-12', 16100),
  (9, 3, 2, '2023-06-12', 680),
  (10, 2, 1, '2023-06-12', 7525),
  (11, 2, 3, '2023-06-12', 725),
  (12, 3, 1, '2023-06-12', 11430),
  (13, 3, 3, '2023-06-12', 4900),
  (14, 3, 3, '2023-06-12', 5490),
  (15, 1, 1, '2023-06-12', 420);
 

INSERT INTO stock (id, sucursal_id, producto_id, cantidad)
VALUES
  (1, 1, 1, 65),
  (2, 1, 2, 71),
  (3, 1, 3, 8),
  (4, 1, 4, 42),
  (5, 1, 5, 61),
  (6, 1, 6, 14),
  (7, 1, 7, 70),
  (8, 1, 8, 66),
  (9, 1, 9, 13),
  (10, 1, 10, 68),
  (11, 2, 1, 14),
  (12, 2, 2, 67),
  (13, 2, 3, 74),
  (14, 2, 4, 32),
  (15, 2, 5, 75),
  (16, 2, 6, 37),
  (17, 2, 7, 14),
  (18, 2, 8, 42),
  (19, 2, 9, 51),
  (20, 2, 10, 41),
  (21, 3, 1, 59),
  (22, 3, 2, 98),
  (23, 3, 3, 52),
  (24, 3, 4, 85),
  (25, 3, 5, 31),
  (26, 3, 6, 17),
  (27, 3, 7, 13),
  (28, 3, 8, 18),
  (29, 3, 9, 76),
  (30, 3, 10, 1);
 
INSERT INTO item (id, orden_id, producto_id, cantidad, monto_venta)
VALUES
  (1, 1, 9, 7, 175),
  (2, 1, 8, 8, 400),
  (6, 2, 9, 3, 75),
  (7, 2, 5, 9, 270),
  (8, 2, 5, 10, 300),
  (9, 2, 6, 3, 60),
  (11, 3, 1, 9, 9000),
  (16, 4, 1, 4, 4000),
  (17, 4, 2, 8, 6400),
  (21, 5, 6, 2, 40),
  (22, 5, 7, 3, 45),
  (26, 6, 4, 9, 630),
  (27, 6, 9, 4, 100),
  (28, 6, 3, 2, 100),
  (31, 7, 5, 8, 240),
  (32, 7, 9, 6, 150),
  (33, 7, 8, 2, 100),
  (36, 8, 1, 6, 6000),
  (37, 8, 1, 10, 10000),
  (38, 8, 3, 2, 100),
  (41, 9, 8, 9, 450),
  (42, 9, 3, 3, 150),
  (43, 9, 7, 2, 30),
  (44, 9, 10, 5, 50),
  (46, 10, 9, 9, 225),
  (47, 10, 1, 7, 7000),
  (48, 10, 3, 6, 300),
  (51, 11, 7, 5, 75),
  (52, 11, 9, 8, 200),
  (53, 11, 3, 9, 450),
  (56, 12, 2, 7, 5600),
  (57, 12, 1, 5, 5000),
  (58, 12, 6, 9, 180),
  (59, 12, 8, 9, 450),
  (60, 12, 8, 4, 200),
  (61, 13, 9, 4, 100),
  (62, 13, 2, 6, 4800),
  (66, 14, 1, 5, 5000),
  (67, 14, 4, 7, 490),
  (71, 15, 9, 6, 150),
  (72, 15, 5, 9, 270);
 
ALTER TABLE producto ADD CONSTRAINT fk_producto_categoria FOREIGN KEY (categoria_id) REFERENCES categoria(id);

ALTER TABLE stock ADD CONSTRAINT fk_stock_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursal(id);
ALTER TABLE stock ADD CONSTRAINT fk_stock_producto FOREIGN KEY (producto_id) REFERENCES producto(id);

ALTER TABLE orden ADD CONSTRAINT fk_orden_cliente FOREIGN KEY (cliente_id) REFERENCES cliente(id);
ALTER TABLE orden ADD CONSTRAINT fk_orden_sucursal FOREIGN KEY (sucursal_id) REFERENCES sucursal(id);

ALTER TABLE item ADD CONSTRAINT fk_item_orden FOREIGN KEY (orden_id) REFERENCES orden(id);
ALTER TABLE item ADD CONSTRAINT fk_item_producto FOREIGN KEY (producto_id) REFERENCES producto(id);

--- precio promedio de los productos en cada categoría
SELECT c.nombre AS categoria,
	AVG(p.precio_unitario) AS precio_promedio
FROM categoria c 
JOIN producto p ON c.id = p.categoria_id
GROUP BY c.nombre;

---cantidad total de productos en stock por categoría
SELECT c.nombre AS categoria,
	SUM(s.cantidad) AS Cantidad_total
FROM categoria c
JOIN producto p ON c.id = p.categoria_id 
JOIN stock s  ON p.id = s.producto_id
GROUP BY c.nombre; 

---total de ventas por sucursal
SELECT s.nombre AS sucursal,
	sum(o.total) AS total_ventas
FROM sucursal s 
JOIN orden o ON s.id = o.sucursal_id
GROUP BY s.nombre;

---cliente que ha realizado el mayor monto de compras

SELECT c.nombre AS cliente,
       SUM(o.total) AS monto_total_compras
FROM cliente c
JOIN orden o ON c.id = o.cliente_id
GROUP BY c.nombre
ORDER BY monto_total_compras DESC
LIMIT 1;


