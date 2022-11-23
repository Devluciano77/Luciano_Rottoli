--Resolver las siguientes consultas utilizando la sintaxis SQL

--1. Agregar las entidades paises (id, nombre), provincias (id, nombre, idpais) y localidades (id,nombre, cp,id_provincia). Tener en cuenta que:
--● En un país hay muchas provincias.
--● En una provincia hay muchas localidades.
CREATE TABLE paises (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL
);

CREATE TABLE provincias (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
id_pais INT UNSIGNED NOT NULL,
FOREIGN KEY (id_pais) REFERENCES paises(id)
);

CREATE TABLE localidades (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
cp VARCHAR(10) NOT NULL,
id_provincia INT UNSIGNED NOT NULL,
FOREIGN KEY (id_provincia) REFERENCES provincias(id)
);

--2. Modificar la tabla empleados usando ALTER TABLE y agregar los campos:
--● direccion (varchar)
--● id_localidad (pk localidad) –Esta es un relación con la tabla localidades
--● email
--● telefono
--● fecha_ingreso
--● tms (timestamp)
ALTER TABLE elsistema.empleados
ADD COLUMN direccion VARCHAR(50) NOT NULL AFTER apellido,
ADD COLUMN id_localidad INT UNSIGNED NOT NULL,
ADD COLUMN email VARCHAR(50) NOT NULL AFTER direccion,
ADD COLUMN telefono VARCHAR(45) NOT NULL AFTER email,
ADD COLUMN fecha_ingreso DATE NULL AFTER telefono,
ADD COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER fecha_ingreso,
ADD FOREIGN KEY (id_localidad) REFERENCES localidades(id);

--3. Modificar la tabla de departamentos usando ALTER TABLE y agregar los campos:
--● gasto (double)
--● tms (timestamp)
ALTER TABLE elsistema.departamentos
ADD COLUMN gasto DOUBLE NOT NULL AFTER presupuesto,
ADD COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP AFTER gasto;

--4. Insertar 5 registros en cada tabla de: paises, provincias, localidades, departamentos,empleados.
INSERT INTO paises VALUES
(1, 'Argentina'),
(2, 'Brasil'),
(3, 'Uruguay'),
(4, 'Chile'),
(5, 'Peru');

INSERT INTO provincias VALUES 
(1, 'Misiones', 1),
(2, 'Santa Fe', 1),
(3, 'Corrientes',1),
(4, 'Buenos Aires', 1),
(5, 'Entre Rios', 1);

INSERT INTO localidades VALUES 
(1, 'Posadas', '3300', 1),
(2, 'Montecarlo', '4400', 1),
(3, 'Eldorado', '5500',1),
(4, 'Capiovi', '6600',1),
(5, 'Obera', '7700',1);

INSERT INTO departamentos(iddepartamento,nombre,presupuesto,estado,gasto) VALUES
(1,'Sistema','10000','1','5000'),
(2,'Contabilidad','20000','1','10000'),
(3,'Legales','30000','1','15000'),
(4,'Publicidad','40000','1','20000'),
(5,'Finanza','50000','1','25000');

INSERT INTO empleados(idemplaedo,cuil_cuit,nombre,apellido,direccion,email,telefono,fecha_ingreso,id_departamento,estado,id_localidad) VALUES
(1,'20429662371','Lionel','Messi','San Miguel','messi@gmail.com', '421600','2022-02-02',1,1,1),
(2,'20354870526','Neymar','Junior','San Miguel', 'ney@gmail.com', '456800','2022-02-02',2,1,1),
(3,'20123456789','Zlatan','Ibrahimovic','San Miguel','ibra@gmail.com', '256705','2022-02-02',3,1,1),
(4,'20987654321','James','Hetfield','San Miguel','james@gmail.com','457821','2022-02-02',1,1,1),
(5,'20111222334','Dave','Mustaine','San Miguel','dave@gmail.com','562389','2022-02-02',2,1,1);

--5. Modificar el nombre de la tabla “pedidos” por “movimientos”. RENAME TABLE
ALTER TABLE pedidos
RENAME TO movimientos;

--6. Agregar las entidades:
--● Productos (id, nombre, descripcion, id_marca fk, stock, precio, estado, tms)
--● Marcas (id, nombre, descripción, imagen, id_proveedor, estado, tms)
--● Proveedores (id, razon_social, nombre, apellido, naturaleza (fisica o juridica),cuit,id_localidad fk, estado,tms)
--● Cajas (id,horainicio(datatime),horacierre(datatime), estado, tms)Notas: Muchos productos tienen una sola marca, o una marca tiene uno o muchos productos.Un proveedor está en una localidad.
CREATE TABLE Productos (
id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30),
descripcion VARCHAR(45),
id_marca INT UNSIGNED NOT NULL,
stock INT,
precio FLOAT,
estado tinyint(1) DEFAULT NULL,
tms timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP);


CREATE TABLE marcas (
id_marcas INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
nombre VARCHAR(30),
descripcion VARCHAR(45),
imagen VARCHAR(45),
id_provedor INT,
estado tinyint(1) DEFAULT NULL,
tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE proveedores (
id_provedores INT UNSIGNED NOT NULL,
razon_social VARCHAR(45),
nombre VARCHAR(30),
apellido VARCHAR(30),
naturaleza VARCHAR(30),
cuit INT,
id_localidad INT UNSIGNED NOT NULL,
estado tinyint(1) DEFAULT NULL,
tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

CREATE TABLE cajas (
id_cajas INT NOT NULL,
horainicio DATETIME,
horacierre DATETIME,
estado tinyint(1) DEFAULT NULL,
tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP);

--7. Insertar 5 registros en cada tabla del punto 6. Tener en cuenta que el script debe ejecutarse secuencialmente y no fallar.

INSERT INTO productos(id,nombre,descripcion,id_marca,stock,precio,estado)VALUES
(1,'auto','rojo',1,5,20000,1),
(2,'moto','rojo',1,5,30000,1),
(3,'auto','negro',1,5,20000,1),
(4,'auto','verde',1,5,20000,1),
(5,'auto','azul',1,5,20000,1);

INSERT INTO marcas(id_marcas,nombre,descripcion,imagen,id_provedor,estado) VALUES
(1,'BMW','buena','',1,1),
(2,'Samsom','muy buena','',2,1),
(3,'HP','buena','',3,1),
(4,'Manaos','mala','',4,1),
(5,'Jackson','muy buena','',5,1);

INSERT INTO proveedores (id_provedores,razon_social,nombre,apellido,naturaleza,cuit,id_localidad,estado) VALUES
(1,'Pepsico Iberia S.L.','Lucho','Suarez','acreedor',452452,1,1),
(2,'Telefónica Móviles S.A.U.','Gerard','Pique','acreedor',452452,2,1),
(3,'Telefónica Móviles S.A.U.','Carles','Puyol','acreedor',452452,3,1),
(4,'Telefónica Móviles S.A.U.','Sergio','Busquets','acreedor',452542,2,1),
(5,'Telefónica Móviles S.A.U.','Sergio','Ramos','acreedor',452452,4,1);

INSERT INTO cajas(id_cajas,horainicio,horacierre,estado) VALUES
(1,'2038-01-19 08:14:07','2038-01-19 18:14:07',1),
(2,'2038-01-19 08:14:07','2038-01-19 18:14:07',1),
(3,'2038-01-19 08:14:07','2038-01-19 18:14:07',1),
(4,'2038-01-19 08:14:07','2038-01-19 18:14:07',1),
(5,'2038-01-19 08:14:07','2038-01-19 18:14:07',1);



--8. Listar el nombre, presupuesto, gastos y diferencia(presupuesto-gasto) de todos los departamentos con estado activo o 1.
SELECT nombre,presupuesto,gasto,presupuesto-gasto AS diferencia FROM elsistema.departamentos
WHERE estado = 1;

--9. Listar todas todas las localidades agrupadas por pais. En la vista se deberia ver el nombre del pais y el nombre de la localidad.
SELECT localidades.nombre AS Localidad,paises.nombre AS Pais FROM elsistema.localidades
INNER JOIN provincias ON localidades.id_provincia= provincias.id
INNER JOIN paises ON provincias.id_pais= paises.id
ORDER BY paises.nombre ASC;

--10. Modificar (UPADTE):
--● el telefono de un empleado cuando el id es igual a uno que hayan declarado.
--● el fecha_ingreso y la localidad de otro empleado.
UPDATE empleados SET telefono='421601'
WHERE idemplaedo = 1;

UPDATE empleados SET fecha_ingreso='2022-03-03',id_localidad=2
WHERE idemplaedo = 1;


--11. Insertar 5 vendedores.
INSERT INTO vendedores VALUES 
(1,'Naruto','Uzumaki','20652256',1),
(2,'Sasuke','Uchiha','21652256',1),
(3,'Kakashi','Hatake','22652256',2),
(4,'Rock','Lee','25652256',2),
(5,'Itachi','Uchiha','28652256',2);  

--12. Modificar la tabla movimientos y agregar los campos: id_producto fk, estado,tms(timestamp), tipo_movimiento (ingreso, egreso, pedido).
ALTER TABLE movimientos
ADD COLUMN id_producto INT UNSIGNED NOT NULL,
ADD COLUMN estado tinyint(1) DEFAULT NULL,
ADD COLUMN tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
ADD COLUMN tipo_movimiento VARCHAR(10) NOT NULL;

--13. Insertar 5 movimientos distintos.
INSERT INTO movimientos(id,cantidad,fecha,id_cliente,id_vendedor,id_producto,estado,tipo_movimiento) VALUES 
(1,23,'2022-02-20',1,1,1,1,'ingreso'),
(2,45,'2022-03-05',2,2,2,1,'egreso'),
(3,65,'2022-02-06',5,3,3,1,'pedido'),
(4,77,'2022-04-07',4,3,4,1,'egreso'),
(5,78,'2022-05-08',3,4,5,1,'ingreso');
 
--14. Borrar lógicamente (UPDATE de la columna estado):
--● 2 movimientos que fueron cargados mal
--● un pais que tenga al menos 3 localidades.
UPDATE movimientos
SET estado = 0
WHERE id =1;

--15. Modificar el campo stock de la tabla productos teniendo en cuenta la cantidad de la tabla de movimientos. Sumar el stock si es un ingreso, restar si es un egreso. Esto hacerlo de manera manual en base los 5 movimientos insertados en el punto 13. Es decir deben haber 5 updates de la tabla producto.
UPDATE productos
SET stock = 123
WHERE id =1;

UPDATE productos
SET stock = 55
WHERE id =2;

UPDATE productos
SET stock = 100
WHERE id =3;

UPDATE productos
SET stock = 23
WHERE id =4;

UPDATE productos
SET stock = 123
WHERE id =5;

--16. Cear la tabla parametros (id, tms,cosas(json), id_usuario)
CREATE TABLE parametros (
    id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    cosas JSON  NOT NULL,
    id_usuario INT UNSIGNED NOT NULL,
    tms TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

--17. Insertar en la tabla parametros teniendo en cuenta la columna cosas:
--● {"idDeLaCosa": 101, "permisos": "PUT, GET"}
--● {"vistasPermitidas":"menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente",“grupo": "ventas"}
--● {"zonaHoraria": "America/Argentina/BuenosAires"}
--● {"fechaInicioActividades": 01/01/2019, "mesAperturaCaja": "Enero", "mesCierreCaja":"Diciembre"}
--● {"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93","egreso":"3732538,75"},"2020":{"ingreso": "27442665,12","egreso": "8522331,82"},"2021": {"ingreso":"31634912,57","egreso": "9757142,66"}}}
--Nota: Rellenar a criterio los campos id, tms,id_usuario
INSERT INTO parametros (id,cosas,id_usuario) VALUES 
(1,'{"idDeLaCosa": 101, "permisos": "PUT, GET"}',1),
(2,'{"vistasPermitidas": "menuPrincipal,menuSecundario,ventas,estadisticaVentas,listaCliente", "grupo": "ventas"}',2),
(3,'{"zonaHoraria": "America/Argentina/BuenosAires"}',3),
(4,'{"fechaInicioActividades": "01/01/2019", "mesAperturaCaja": "Enero", "mesCierreCaja": "Diciembre"}',4),
(5,'{"balancesAniosAnteriores": {"2019": {"ingreso": "7374901.93", "egreso": "3732538.75"}, "2020":{"ingreso": "27442665.12", "egreso": "8522331.82"},"2021": {"ingreso":"31634912.57", "egreso": "9757142.66"}}}',5);

--Ejercicio 2:
--Subir al repositorio público apellido_nombre las respuestas tp6-eje1.sql.
--Subir al repositorio publicó una captura de pantalla en jpg o png del esquema completo. El archivo debe llamarse diagrama_bd-tp6-eje1.jpg|.png



