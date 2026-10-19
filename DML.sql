INSERT INTO servicios (nombre, precio) VALUES
('Consulta General', 30.00),
('Vacunación Antirrábica', 15.00),
('Desparasitación', 12.50),
('Corte de Pelo y Baño', 25.00),
('Limpieza Dental', 45.00),
('Examen de Sangre', 35.00),
('Esterilización', 80.00),
('Radiografía', 50.00),
('Corte de Uñas', 8.00),
('Consulta de Urgencia', 60.00);


INSERT INTO clientes (nombre, direccion, correoElectronico, activo) VALUES
('Carlos Mendoza', 'Av. Las Flores 123', 'carlos.mendoza@email.com', 1),
('Ana Gómez', 'Calle Los Olivos 456', 'ana.gomez@email.com', 1),
('Luis Torres', 'Jr. Unión 789', 'luis.torres@email.com', 1),
('María Fernández', 'Av. Central 101', 'maria.fernandez@email.com', 1),
('Jorge Ramírez', 'Calle Primavera 202', 'jorge.ramirez@email.com', 0),
('Sofía Martínez', 'Av. El Sol 303', 'sofia.martinez@email.com', 1),
('Diego Castro', 'Calle Luna 404', 'diego.castro@email.com', 1),
('Elena Morales', 'Av. Brasil 505', 'elena.morales@email.com', 0),
('Roberto Silva', 'Jr. Arequipa 606', 'roberto.silva@email.com', 1),
('Patricia Vargas', 'Calle Comercio 707', 'patricia.vargas@email.com', 1);


INSERT INTO mascotas (nombre, nPatas, estatura, id_cliente) VALUES
('Max', 4, 0.55, 1),
('Bella', 4, 0.30, 1),
('Rocky', 4, 0.60, 2),
('Luna', 4, 0.25, 3),
('Coco', 2, 0.15, 4), 
('Thor', 4, 0.70, 5),
('Mía', 4, 0.20, 6),
('Toby', 4, 0.40, 7),
('Simba', 4, 0.35, 8),
('Nala', 4, 0.28, 9);


INSERT INTO mascota_servicio (id_mascota, id_servicio, fecha) VALUES
(1, 1, '2026-01-10'),
(1, 2, '2026-01-15'),
(2, 4, '2026-01-18'),
(3, 1, '2026-02-01'),
(3, 3, '2026-02-02'),
(4, 5, '2026-02-10'),
(5, 1, '2026-02-12'),
(6, 7, '2026-02-20'),
(7, 2, '2026-03-01'),
(8, 4, '2026-03-05');