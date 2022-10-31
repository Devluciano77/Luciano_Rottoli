--1. Lista el apellido de todos los empleados.
SELECT apellido FROM empleados;

--2. Lista el apellido de los empleados eliminando los apellidos que estén repetidos.
SELECT DISTINCT apellido FROM empleados;

--3. Lista todas las columnas de la tabla empleados
SELECT * FROM empleados;

--4. Lista el nombre y apellido de todos los empleados.
SELECT nombre,apellido FROM empleados;

--5. Lista el cuit/cuil de los departamentos de los empleados que aparecen en la tabla empleados.
SELECT cuil_cuit FROM empleados;

--6. Lista el nombre y apellido de los empleados en una única columna.
SELECT CONCAT(nombre,' ',apellido) AS nombre_completo FROM empleados;

--7. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en mayúscula.
SELECT CONCAT(UPPER(nombre),' ',UPPER(apellido)) AS nombre_completo FROM empleados;

--8. Lista el nombre y apellido de los empleados en una única columna, convirtiendo todos los caracteres en minúscula.
SELECT CONCAT(LOWER(nombre),' ',LOWER(apellido)) AS nombre_completo FROM empleados;

--9. Lista el nombre de los departamentos y el valor del presupuesto actual ordenado de forma ascendente.
SELECT nombre,presupuesto FROM sistema.departamentos ORDER BY presupuesto ASC;

--10. Lista el nombre de todos los departamentos ordenados de forma ascendente.
SELECT nombre FROM sistema.departamentos ORDER BY nombre ASC;

--11. Lista el nombre de todos los departamentos ordenados de forma descendente.
SELECT nombre FROM sistema.departamentos ORDER BY nombre DESC;

--12. Lista el apellido y el nombre de todos los empleados, ordenados de forma alfabética tendiendo en cuenta en primer lugar su apellido y luego su nombre.
SELECT CONCAT(apellido,' ',nombre) AS nombre_completo FROM empleados ORDER BY apellido ASC;

--13. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen mayor presupuesto.
SELECT nombre , presupuesto FROM departamentos ORDER BY presupuesto DESC LIMIT 3;

--14. Devuelve una lista con el nombre y el presupuesto, de los 3 departamentos que tienen menor presupuesto.
SELECT nombre , presupuesto FROM departamentos ORDER BY presupuesto ASC LIMIT 3;

--15. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto mayor o igual a $150000.
SELECT nombre,presupuesto FROM departamentos WHERE presupuesto>150000;

--16. Devuelve una lista con el nombre de los departamentos y el presupuesto, de aquellos que tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre,presupuesto FROM departamentos WHERE presupuesto>100000 AND presupuesto<200000 ;

--17. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Sin utilizar el operador BETWEEN.
SELECT nombre FROM departamentos WHERE presupuesto<100000 OR presupuesto>200000;

--18. Devuelve una lista con el nombre de los departamentos que tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre FROM departamentos WHERE presupuesto BETWEEN 100000 AND 200000;

--19. Devuelve una lista con el nombre de los departamentos que no tienen un presupuesto entre $100000 y $200000. Utilizando el operador BETWEEN.
SELECT nombre FROM departamentos WHERE presupuesto NOT BETWEEN 100000 AND 200000;

--20. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno.
SELECT * FROM sistema.empleados
INNER JOIN departamentos ON id_departamento = iddepartamento;

--21. Devuelve un listado con los empleados y los datos de los departamentos donde trabaja cada uno. Ordena el resultado, en primer lugar por el nombre del departamento (en orden alfabético) y en segundo lugar por apellido y el nombre de los empleados.
SELECT * FROM sistema.empleados
INNER JOIN departamentos ON id_departamento = iddepartamento ORDER BY departamentos.nombre,empleados.nombre;

--22. Devuelve un listado con el código y el nombre del departamento, solamente de aquellos departamentos que tienen empleados.
SELECT DISTINCT departamentos.nombre as departamento FROM sistema.empleados
INNER JOIN departamentos ON id_departamento = iddepartamento;

--23. Devuelve el nombre del departamento donde trabaja el empleado que tiene el cuit 27-38382980-3.
SELECT departamentos.nombre as departamento FROM sistema.empleados 
LEFT JOIN departamentos ON id_departamento = iddepartamento
WHERE empleados.cuil_cuit='27-38382980-3';

--24. Devuelve el nombre del departamento donde trabaja el empleado Pepe Ruiz.
SELECT departamentos.nombre as departamento FROM sistema.empleados 
inner JOIN departamentos ON id_departamento = iddepartamento
WHERE empleados.nombre='Pepe' AND empleados.apellido='Ruiz';

--25. Devuelve un listado con los datos de los empleados que trabajan en el departamento de I+D. Ordena el resultado alfabéticamente.
SELECT * FROM sistema.empleados 
RIGHT JOIN departamentos ON id_departamento = iddepartamento
WHERE departamentos.nombre='I+D' ORDER BY empleados.nombre ASC;

--26. Devuelve un listado con los datos de los empleados que trabajan en el departamento de Sistemas, Contabilidad o I+D. Ordena el resultado alfabéticamente.
SELECT * FROM sistema.empleados 
RIGHT JOIN departamentos ON id_departamento = iddepartamento
WHERE departamentos.nombre='I+D' OR departamentos.nombre='Sistemas' OR departamentos.nombre='Contabilidad' ORDER BY empleados.nombre ASC;

--27. Devuelve una lista con el nombre de los empleados que tienen los departamentos que no tienen un presupuesto entre $100000 y $200000.
SELECT empleados.nombre FROM sistema.empleados 
RIGHT JOIN departamentos ON id_departamento = iddepartamento
WHERE departamentos.presupuesto NOT BETWEEN 100000 AND 200000;
