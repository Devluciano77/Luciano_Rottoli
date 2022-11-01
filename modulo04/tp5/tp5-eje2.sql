--1. Devuelve un listado con todos los pedidos que se han realizado. Los pedidos deben estar ordenados por la fecha de realización, mostrando en primer lugar los pedidos más recientes.
SELECT MAX(fecha) AS fecha,cantidad,id_cliente,id_vendedor FROM pedidos GROUP BY fecha ORDER BY fecha DESC;

--2. Devuelve todos los datos de los dos pedidos de mayor valor.
SELECT MAX(cantidad) AS cantidad,fecha,id_cliente,id_vendedor FROM pedidos 
GROUP BY cantidad ORDER BY cantidad DESC;

--3. Devuelve un listado con los identificadores de los clientes que han realizado algún pedido. Tenga en cuenta que no debe mostrar identificadores que estén repetidos.
SELECT DISTINCT id_cliente FROM ventas.pedidos
INNER JOIN clientes a ON id_cliente = a.id;

--4. Devuelve un listado de todos los pedidos que se realizaron durante el año 2022, cuya cantidad total sea superior a $500.
SELECT * FROM ventas.pedidos WHERE fecha LIKE '2022%' AND cantidad > 500;

--5. Devuelve un listado con el nombre y apellido de los vendedores que tienen una comisión entre 0.05 y 0.11.
SELECT nombre,apellido FROM ventas.vendedores WHERE comisión BETWEEN 0.05 AND 0.11;

--6. Devuelve el valor de la comisión de mayor valor que existe en la tabla vendedores.
SELECT MAX(comisión) AS comisión FROM vendedores ORDER BY comisión DESC;

--7. Devuelve el identificador, nombre y primer apellido de aquellos clientes cuyo cuitcuil no es NULL. El listado deberá estar ordenado alfabéticamente por apellido y nombre.
SELECT id,nombre,apellido FROM ventas.clientes
WHERE cuitcuil IS NOT NULL ORDER BY apellido ASC;

--8. Devuelve un listado de los nombres de los clientes que empiezan por “A” y terminan por “n” y también los nombres que empiezan por “P”. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM ventas.clientesWHERE nombre LIKE'A%n' OR nombre LIKE 'P%' ORDER BY nombre ASC;

--9. Devuelve un listado de los nombres de los clientes que no empiezan por “A”. El listado deberá estar ordenado alfabéticamente.
SELECT nombre FROM ventas.clientes WHERE nombre NOT LIKE'A%' ORDER BY nombre ASC;

--10.Devuelve un listado con los nombres de los vendedores que terminan por “el” o “o”. Tenga en cuenta que se deberán eliminar los nombres repetidos.
SELECT DISTINCT nombre FROM ventas.vendedores WHERE nombre LIKE'%el' OR nombre LIKE'%o'  ORDER BY nombre ASC;

--11.Devuelve un listado con el identificador, nombre y apellido de todos los clientes que han realizado algún pedido. El listado debe estar ordenado alfabéticamente y se deben eliminar los elementos repetidos.
SELECT DISTINCT clientes.id,clientes.apellido,clientes.nombre FROM ventas.pedidos
RIGHT JOIN clientes ON id_cliente = clientes.id
WHERE cantidad IS NOT NULL ORDER BY apellido ASC;

--12.Devuelve un listado que muestre todos los pedidos que ha realizado cada cliente. El resultado debe mostrar todos los datos de los pedidos y del cliente. El listado debe mostrar los datos de los clientes ordenados alfabéticamente.
SELECT  * FROM ventas.pedidos
RIGHT JOIN clientes on id_cliente = clientes.id
WHERE cantidad IS NOT NULL ORDER BY apellido ASC;

--13.Devuelve un listado que muestre todos los pedidos en los que ha participado un vendedor. El resultado debe mostrar todos los datos de los pedidos y de los vendedores. El listado debe mostrar los datos de los vendedores ordenados alfabéticamente.
SELECT  * FROM ventas.pedidos
RIGHT JOIN vendedores on id_vendedor = vendedores.id
WHERE cantidad IS NOT NULL ORDER BY apellido ASC;

--14.Devuelve un listado que muestre todos los clientes, con todos los pedidos que han realizado y con los datos de los vendedores asociados a cada pedido.
SELECT cantidad,clientes.nombre AS cliente,vendedores.nombre AS vendedor FROM ventas.pedidos
INNER JOIN vendedores ON id_vendedor = vendedores.id
INNER JOIN clientes ON id_cliente = clientes.id; 

--15.Devuelve un listado de todos los clientes que realizaron un pedido durante el año 2022, cuyo monto esté entre $300 y $1000.
SELECT fecha,cantidad,clientes.nombre AS cliente FROM ventas.pedidos
INNER JOIN vendedores ON id_vendedor = vendedores.id
INNER JOIN clientes ON id_cliente = clientes.id
WHERE fecha LIKE '2022%' AND cantidad BETWEEN 300 AND 1000; 

--16.Devuelve el nombre y apellido de todos los vendedores que han participado en algún pedido realizado por María Santana.
SELECT DISTINCT vendedores.nombre,vendedores.apellido FROM ventas.pedidos
INNER JOIN vendedores ON id_vendedor = vendedores.id
INNER JOIN clientes ON id_cliente = clientes.id
WHERE clientes.nombre LIKE 'María'; 

--17.Devuelve el nombre de todos los clientes que han realizado algún pedido con el vendedor Daniel Sáez.
SELECT DISTINCT clientes.nombre,clientes.apellido FROM ventas.pedidos
INNER JOIN vendedores ON id_vendedor = vendedores.id
INNER JOIN clientes ON id_cliente = clientes.id
WHERE vendedores.nombre LIKE 'Daniel' AND vendedores.apellido LIKE 'Sáez'; 

--18.Devuelve un listado con todos los clientes junto con los datos de los pedidos que han realizado. Este listado también debe incluir los clientes que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los clientes.
SELECT cantidad,fecha,clientes.apellido,clientes.nombre FROM ventas.pedidos
RIGHT JOIN clientes ON id_cliente = clientes.id
ORDER BY clientes.apellido ASC;

--19.Devuelve un listado con todos los vendedores junto con los datos de los pedidos que han realizado. Este listado también debe incluir los vendedores que no han realizado ningún pedido. El listado debe estar ordenado alfabéticamente por el apellido y nombre de los vendedores.
SELECT cantidad,fecha,vendedores.apellido,vendedores.nombre FROM ventas.pedidos
RIGHT JOIN vendedores ON id_vendedor = vendedores.id
ORDER BY vendedores.apellido ASC;

--20.Devuelve un listado que solamente muestre los clientes que no han realizado ningún pedido.
SELECT cantidad,clientes.apellido,clientes.nombre FROM ventas.pedidos
RIGHT JOIN clientes ON id_cliente = clientes.id
WHERE cantidad is NULL
ORDER BY clientes.apellido ASC;

--21.Devuelve un listado que solamente muestre los vendedores que no han realizado ningún pedido.
SELECT cantidad,fecha,vendedores.apellido,vendedores.nombre FROM ventas.pedidos
RIGHT JOIN vendedores ON id_vendedor = vendedores.id
WHERE cantidad is NULL
ORDER BY vendedores.apellido ASC;

--22.Devuelve un listado con los clientes que no han realizado ningún pedido y de los vendedores que no han participado en ningún pedido. Ordene el listado alfabéticamente por el apellido y el nombre. En el listado deberá diferenciar de algún modo los clientes y los vendedores.


--23.Calcula la cantidad total que suman todos los pedidos que aparecen en la tabla pedido.
--24.Calcula la cantidad media de todos los pedidos que aparecen en la tabla pedido.
--25.Calcula el número total de vendedores distintos que aparecen en la tabla pedido.
--26.Calcula el número total de clientes que aparecen en la tabla cliente.
--27.Calcula cuál es la mayor cantidad que aparece en la tabla pedido.
--28.Calcula cuál es la menor cantidad que aparece en la tabla pedido.
--29.Calcula cuál es el valor máximo de categoría para cada una de las ciudades que aparece en la tabla cliente.
--30.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes. Es decir, el mismo cliente puede haber realizado varios pedidos de diferentes cantidades el mismo día. Se pide que se calcule cuál es el pedido de máximo valor para cada uno de los días en los que un cliente ha realizado un pedido. Muestra el identificador del cliente, nombre, apellido, la fecha y el valor de la cantidad.
--31.Calcula cuál es el máximo valor de los pedidos realizados durante el mismo día para cada uno de los clientes, teniendo en cuenta que sólo queremos mostrar aquellos pedidos que superen la cantidad de $2000 .
--32.Calcula el máximo valor de los pedidos realizados para cada uno de los vendedores durante la fecha 2021-08-17. Muestra el identificador del vendedor, nombre, apellido y total.
--33.Devuelve un listado con el identificador de cliente, nombre y apellido y el número total de pedidos que ha realizado cada uno de los clientes. Tenga en cuenta que pueden existir clientes que no han realizado ningún pedido. Estos clientes también deben aparecer en el listado indicando que el número de pedidos realizados es 0.
--34.Devuelve un listado con el identificador de cliente, nombre, apellido y el número total de pedidos que ha realizado cada uno de clientes durante el año 2020.
--35.Devuelve cuál ha sido el pedido de máximo valor que se ha realizado cada año.
--36.Devuelve el número total de pedidos que se han realizado cada año.
--37.Devuelve un listado con todos los pedidos que ha realizado Adela Salas. (Sin utilizar INNER JOIN).
--38.Devuelve el número de pedidos en los que ha participado el vendedor Daniel Sáe. (Sin utilizar INNER JOIN)
--39.Devuelve los datos del cliente que realizó el pedido más caro en el año 2020. (Sin utilizar INNER JOIN)
--40.Devuelve la fecha y la cantidad del pedido de menor valor realizado por el cliente Pepe Ruiz Santana.
--41.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando IN o NOT IN).
--42.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando IN o NOT IN).
--43.Devuelve un listado de los clientes que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).
--44.Devuelve un listado de los vendedores que no han realizado ningún pedido. (Utilizando EXISTS o NOT EXISTS).