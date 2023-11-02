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
salario INT, -- especificar que podemos meter el valor NULL
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
    

ALTER TABLE `zapatillas`
	ADD COLUMN `marca` VARCHAR(45) NOT NULL,
	ADD COLUMN `talla` INT NOT NULL;

ALTER TABLE `empleados`
	MODIFY COLUMN `salario`FLOAT NOT NULL;

ALTER TABLE `clientes`
	DROP COLUMN `pais`;

ALTER TABLE `facturas`
	ADD COLUMN `total_factura`FLOAT NOT NULL;
    
INSERT INTO `zapatillas`(`moldelo`, `color`, `marca`, `talla`)
		VALUES ('XQYUN', 'Negro', 'Nike', 42),
				('UOPMN', 'Rosas', 'Nike', 39),
                ('OPNYT', 'Verdes', 'Adidas', 35);

INSERT INTO `empleados`(`nombre`, `tienda`, `salario`, `fecha_incorporacion`)
	VALUES ('Laura', 'Alcobendas', 25987, 20100903),
			('María', 'Sevilla', 0, 20010411), -- Modificar valor 0
            ('Esther', 'Oviedo', 30165.98, 20001129);
 
 INSERT INTO `clientes`(`nombre`, `numero_telefono`, `email`, `direccion`, `ciudad`, `provincia`, `codigo_postal`)
	VALUES ('Mónica', '123456789', 'monica@email.com', 'Calle felicidad', 'Móstoles', 'Madrid', '28176'),
			('Lorena', '289345678', 'lorena@email.com', 'Calle alegría', 'Barcelona', 'Barcelona', '12346'),
            ('Carmen', '298463759', 'carmen@email.com', 'Calle del color', 'Vigo', 'Pontevedra', '23456');
            
INSERT INTO `facturas`(`numero_factura`, `fecha`, `id_zapatilla`, `id_empleado`, `id_cliente`, `total_factura`) -- NOS DA ERROR, REVISAR. No podemos añadir un id de empleado en la tabla facturas tendría que ser modificado en empleados?
	VALUES (123, 20011211, 1, 2, 1, 54.98),
			(1234, 20050523, 1, 1, 3, 89.91),
            (12345, 20150918, 2, 3, 3, 76.23);
            
UPDATE `zapatillas`
SET `color`= 'Amarillas'
WHERE `color`= 'Rosas'; 

UPDATE `empleados`
SET `tienda` = 'A coruña'
WHERE  `id_empleado` = 1;

UPDATE `clientes`
SET `numero_telefono`= '123456728'  
WHERE `id_cliente` = 1;  

UPDATE `facturas`
SET `total_factura`= 89.91
WHERE `id_factura`= 2; 
            
            