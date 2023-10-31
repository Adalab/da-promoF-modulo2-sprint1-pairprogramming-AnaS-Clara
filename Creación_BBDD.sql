CREATE SCHEMA `tienda_zapatillas`;
USE `tienda_zapatillas`;

CREATE TABLE zapatillas (
id_zapatilla INT AUTO_INCREMENT NOT NULL,
moldelo VARCHAR(45) NOT NULL,
color VARCHAR(45) NOT NULL,
PRIMARY KEY (id_zapatilla));

CREATE TABLE clientes (
id_cliente INT AUTO_INCREMENT NOT NULL,
nombre  VARCHAR(45) NOT NULL,
numero_telefono INT NOT NULL,
email VARCHAR(45) NOT NULL,
direccion VARCHAR(45) NOT NULL,
ciudad VARCHAR(45) NOT NULL,
provincia VARCHAR(45) NOT NULL,
pais VARCHAR(45) NOT NULL,
codigo_postal VARCHAR(45) NOT NULL,  -- puede ser numero pero también puede ser carácter
PRIMARY KEY (id_cliente));

CREATE TABLE empleados (
id_empleado INT AUTO_INCREMENT NOT NULL,
nombre VARCHAR(45) NOT NULL,
tienda VARCHAR(45) NOT NULL,
salario INT,
fecha_incorporacion DATE NOT NULL,
PRIMARY KEY (id_empleado));
    

CREATE TABLE facturas (
id_factura INT AUTO_INCREMENT NOT NULL,
numero_factura VARCHAR(45) NOT NULL,
fecha DATE NOT NULL,
id_empleado INT, -- creamos la columna. 
id_cliente INT,
id_zapatilla INT,
PRIMARY KEY (id_factura),
CONSTRAINT fk_facturas_empleados -- es necesario crear CONSTRAINT para llamar a la Foreign Key. Una para cada una, se le pueden dar órdenes diferentes.
	FOREIGN KEY (id_empleado)
    REFERENCES empleados (id_empleado) -- Definimos como se conectan las columnas (id_empleado / id_cleinte/ id_zapatilla) - De donde chupa el dato
	ON DELETE CASCADE  -- Lo incluimos para controlar que si eliminamos un registro en la table madre, se elimina en la hija. 
    ON UPDATE CASCADE, -- Es lo mismo, pero se cambia eliminar por actualizar en UPDATE. Y se ponen para cada referencia. 
CONSTRAINT fk_facturas_cientes
    FOREIGN KEY (id_cliente)
    REFERENCES clientes (id_cliente)
	ON DELETE CASCADE 
    ON UPDATE CASCADE,
CONSTRAINT fk_facturas_zapatillas
    FOREIGN KEY (id_zapatilla)
    REFERENCES zapatillas (id_zapatilla)
    ON DELETE CASCADE 
    ON UPDATE CASCADE);
    


    
    
    
    