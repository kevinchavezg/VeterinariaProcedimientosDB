-- Procedimiento 1 

DELIMITER $$
CREATE PROCEDURE InsertarCliente(
    IN p_nombre VARCHAR(100),
    IN p_direccion VARCHAR(100),
    IN p_correoElectronico VARCHAR(100)
)
BEGIN
    INSERT INTO clientes (nombre, direccion, correoElectronico, activo)
    VALUES (p_nombre, p_direccion, p_correoElectronico, 1);
END $$
DELIMITER ;

-- Procedimiento 2

DELIMITER $$
CREATE PROCEDURE ActualizarEstadoCliente(
    IN p_idCliente INT,
    IN p_nuevoEstado TINYINT(1)
)
BEGIN
    UPDATE clientes
    SET activo = p_nuevoEstado
    WHERE idCliente = p_idCliente;
END $$
DELIMITER ;

-- Procedimiento 3

DELIMITER $$
CREATE PROCEDURE ContarMascotasPorCliente(
    IN p_idCliente INT,
    OUT p_totalMascotas INT
)
BEGIN
    SELECT COUNT(*) INTO p_totalMascotas
    FROM mascotas
    WHERE id_cliente = p_idCliente;
END $$
DELIMITER ;

-- Procedimiento 4

DELIMITER $$
CREATE PROCEDURE ListarServiciosMascota(
    IN p_idMascota INT
)
BEGIN
    SELECT s.idServicio, s.nombre, s.precio, ms.fecha
    FROM servicios s
    INNER JOIN mascota_servicio ms ON s.idServicio = ms.id_servicio
    WHERE ms.id_mascota = p_idMascota;
END $$
DELIMITER ;

-- Procedimiento 5

DELIMITER $$
CREATE PROCEDURE RegistrarServicioMascota(
    IN p_idMascota INT,
    IN p_idServicio INT,
    IN p_fecha DATE
)
BEGIN
    INSERT INTO mascota_servicio (id_mascota, id_servicio, fecha)
    VALUES (p_idMascota, p_idServicio, p_fecha);
END $$
DELIMITER ;


-- Procedimiento 6

DELIMITER $$
CREATE PROCEDURE EliminarMascota(
    IN p_idMascota INT
)
BEGIN
    DELETE FROM mascota_servicio WHERE id_mascota = p_idMascota;
    DELETE FROM mascotas WHERE idMascota = p_idMascota;
END $$
DELIMITER ;


-- Procedimiento 7

DELIMITER $$
CREATE PROCEDURE ActualizarPrecioServicio(
    IN p_idServicio INT,
    IN p_nuevoPrecio DECIMAL(10,2)
)
BEGIN
    UPDATE servicios
    SET precio = p_nuevoPrecio
    WHERE idServicio = p_idServicio;
END $$
DELIMITER ;

-- Procedimiento 8

DELIMITER $$
CREATE PROCEDURE ContarServiciosPorMascota(
    IN p_idMascota INT,
    OUT p_totalServicios INT
)
BEGIN
    SELECT COUNT(*) INTO p_totalServicios
    FROM mascota_servicio
    WHERE id_mascota = p_idMascota;
END $$
DELIMITER ;

-- Procedimiento 9

DELIMITER $$
CREATE PROCEDURE IncrementarPrecioServicios(
    IN p_porcentaje DECIMAL(5,2)
)
BEGIN
    UPDATE servicios
    SET precio = precio + (precio * (p_porcentaje / 100));
END $$
DELIMITER ;

-- Procedimiento 10

DELIMITER $$
CREATE PROCEDURE RepetirRegistroServicio(
    IN p_idMascota INT,
    IN p_idServicio INT,
    IN p_cantidad INT
)
BEGIN
    DECLARE v_contador INT DEFAULT 0;

    REPEAT
        INSERT INTO mascota_servicio (id_mascota, id_servicio, fecha)
        VALUES (p_idMascota, p_idServicio, CURDATE());
        SET v_contador = v_contador + 1;
    UNTIL v_contador >= p_cantidad
    END REPEAT;
END $$
DELIMITER ;


-- Procedimiento 14

DELIMITER $$
CREATE PROCEDURE ContarClientesActivos(
    OUT p_totalActivos INT
)
BEGIN
    SELECT COUNT(*) INTO p_totalActivos
    FROM clientes
    WHERE activo = 1;
END $$
DELIMITER ;


-- Ejecucion de prueba

-- Procedimiento 1
Call InsertarCliente('Kevin Chavez', 'Cidudad de Guatemala', 'kevin.chavez@email.com');

SELECT * FROM clientes;

-- Procedimiento 2
CALL ActualizarEstadoCliente(1, 0);

SELECT * FROM clientes;

-- Procedimiento 3
CALL ContarMascotasPorCliente(1, @total_mascotas);

SELECT @total_mascotas AS TotalMascotas;

-- Procedimiento 4
CALL ListarServiciosMascota(1);


-- Procedimiento 5
CALL RegistrarServicioMascota(1, 2, CURDATE());


-- Procedimiento 6
CALL EliminarMascota(3);

SELECT * FROM mascotas;

-- Procedimiento 7

CALL ActualizarPrecioServicio(1, 25.50);

SELECT * FROM servicios;

-- Procedimiento 8

CALL ContarServiciosPorMascota(1, @total_servicios);

SELECT @total_servicios AS TotalServicios;

-- Procedimiento 9

CALL IncrementarPrecioServicios(10.00);

SELECT * FROM servicios;


-- Procedimiento 10

CALL RepetirRegistroServicio(2, 1, 2);

SELECT * FROM mascota_servicio;

-- Procedimiento 14

CALL ContarClientesActivos(@activos);

SELECT @activos AS TotalClientesActivos;
