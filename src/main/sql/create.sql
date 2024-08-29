-- CREATE DATABASE ventas;
USE ventas;

CREATE TABLE ventas.cliente (
	clienteid int NOT NULL AUTO_INCREMENT,
    dni int NOT NULL,
    nombre varchar(255) NOT NULL,
    apellido varchar(255),
    PRIMARY KEY (clienteid)
);

CREATE TABLE ventas.producto (
	productoid int NOT NULL AUTO_INCREMENT,
    codigo int NOT NULL,
    descripcion varchar(255) NOT NULL,
    cantidad int,
    precio FLOAT(5, 2),
    PRIMARY KEY (productoid)
);

CREATE TABLE ventas.comprobante (
    comprobanteid int NOT NULL AUTO_INCREMENT,
    fecha datetime,
    cantidad int,
    total FLOAT(5, 2),
    clienteid int,
    PRIMARY KEY (comprobanteid),
    CONSTRAINT FK_cliente FOREIGN KEY (clienteid)
    REFERENCES cliente(clienteid)
);

CREATE TABLE ventas.linea (
    lineaid int NOT NULL AUTO_INCREMENT,
    descripcion varchar(255) NOT NULL,
    cantidad int,
    precio FLOAT(5, 2),
    comprobanteid int NOT NULL,
    productoid int NOT NULL,
    PRIMARY KEY (lineaid),
    CONSTRAINT FK_comprobante FOREIGN KEY (comprobanteid)
    REFERENCES comprobante(comprobanteid),
    CONSTRAINT FK_producto FOREIGN KEY (productoid)
    REFERENCES producto(productoid)
);


-- Insert sample data into cliente table
INSERT INTO
  cliente (dni, nombre, apellido)
VALUES
  (12345678, 'Juan', 'Perez'),
  (87654321, 'Maria', 'Gomez'),
  (11223344, 'Carlos', 'Lopez'),
  (44332211, 'Ana', 'Martinez'),
  (55667788, 'Luis', 'Garcia'),
  (99887766, 'Laura', 'Fernandez'),
  (66778899, 'Jose', 'Rodriguez'),
  (33445566, 'Sofia', 'Sanchez'),
  (77889900, 'Miguel', 'Torres'),
  (99001122, 'Lucia', 'Ramirez');

-- Insert sample data into producto table
INSERT INTO
  producto (codigo, descripcion, cantidad, precio)
VALUES
  (1001, 'Laptop', 50, 1200.00),
  (1002, 'Smartphone', 100, 800.00),
  (1003, 'Tablet', 70, 500.00),
  (1004, 'Monitor', 30, 300.00),
  (1005, 'Keyboard', 150, 50.00),
  (1006, 'Mouse', 200, 25.00),
  (1007, 'Printer', 40, 150.00),
  (1008, 'Headphones', 120, 75.00),
  (1009, 'Webcam', 60, 100.00),
  (1010, 'Speaker', 80, 60.00);

-- Insert sample data into comprobante table
INSERT INTO
  comprobante (fecha, cantidad, total, clienteid)
VALUES
  ('2023-10-01', 2, 2400.00, 1),
  ('2023-10-02', 1, 800.00, 2),
  ('2023-10-03', 3, 1500.00, 3),
  ('2023-10-04', 1, 300.00, 4),
  ('2023-10-05', 5, 250.00, 5),
  ('2023-10-06', 2, 300.00, 6),
  ('2023-10-07', 4, 600.00, 7),
  ('2023-10-08', 1, 150.00, 8),
  ('2023-10-09', 3, 225.00, 9),
  ('2023-10-10', 2, 120.00, 10);

-- Insert sample data into linea table
INSERT INTO
  linea (
    descripcion,
    cantidad,
    precio,
    comprobanteid,
    productoid
  )
VALUES
  ('Laptop', 1, 1200.00, 1, 1),
  ('Laptop', 1, 1200.00, 1, 1),
  ('Smartphone', 1, 800.00, 2, 2),
  ('Tablet', 3, 500.00, 3, 3),
  ('Monitor', 1, 300.00, 4, 4),
  ('Keyboard', 5, 50.00, 5, 5),
  ('Mouse', 2, 25.00, 6, 6),
  ('Printer', 4, 150.00, 7, 7),
  ('Headphones', 1, 75.00, 8, 8),
  ('Webcam', 3, 100.00, 9, 9),
  ('Speaker', 2, 60.00, 10, 10);