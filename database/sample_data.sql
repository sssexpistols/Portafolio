INSERT INTO areas (area_id, nombre) VALUES
(1, 'Administración'), (2, 'Clínica'), (3, 'Recepción'), (4, 'TI');

INSERT INTO usuarios (usuario_id, nombre, correo, area_id, activo) VALUES
(1, 'Usuario Demo 01', 'usuario01@example.local', 1, TRUE),
(2, 'Usuario Demo 02', 'usuario02@example.local', 2, TRUE),
(3, 'Usuario Demo 03', 'usuario03@example.local', 3, TRUE),
(4, 'Soporte Demo', 'soporte@example.local', 4, TRUE);

INSERT INTO activos (activo_id, tipo, marca_modelo, serie, usuario_id, direccion_ip, vlan, estado, fecha_alta, fin_garantia) VALUES
('AST-0001', 'Laptop', 'Dell Latitude Demo', 'SN-DEMO-10001', 1, '10.10.1.20', 10, 'Operativo', '2025-01-10', '2028-01-10'),
('AST-0002', 'Desktop', 'HP ProDesk Demo', 'SN-DEMO-10002', 2, '10.20.1.21', 20, 'Operativo', '2025-02-12', '2028-02-12'),
('AST-0003', 'Switch', 'Switch administrable Demo', 'SN-DEMO-10003', NULL, '10.40.1.10', 40, 'Operativo', '2024-03-01', '2027-03-01'),
('AST-0004', 'Cámara CCTV', 'Cámara IP Demo', 'SN-DEMO-10004', NULL, '10.30.1.30', 30, 'Mantenimiento', '2024-04-15', '2027-04-15');

INSERT INTO tickets (ticket_id, usuario_id, activo_id, categoria, prioridad, estado, descripcion, fecha_apertura, fecha_cierre, horas_solucion, sla_objetivo_horas) VALUES
('INC-0001', 1, 'AST-0001', 'Software', 'Media', 'Cerrado', 'Actualización de aplicación de prueba', '2026-08-01 09:00:00', '2026-08-01 12:00:00', 3, 8),
('INC-0002', 2, 'AST-0002', 'Red', 'Alta', 'Resuelto', 'Pérdida intermitente de conectividad', '2026-08-02 10:00:00', '2026-08-02 13:30:00', 3.5, 4),
('INC-0003', 3, NULL, 'Cuenta de usuario', 'Solicitud', 'En progreso', 'Alta de acceso a sistema interno', '2026-08-03 11:00:00', NULL, NULL, 48),
('INC-0004', 4, 'AST-0004', 'CCTV', 'Crítica', 'Cerrado', 'Cámara sin comunicación', '2026-08-04 08:30:00', '2026-08-04 11:00:00', 2.5, 2);

INSERT INTO mantenimientos (mantenimiento_id, activo_id, actividad, fecha_programada, fecha_ejecucion, responsable, evidencia) VALUES
('MNT-0001', 'AST-0001', 'Parches y respaldo', '2026-08-10', '2026-08-10', 'Soporte Demo', 'Checklist-001'),
('MNT-0002', 'AST-0002', 'Limpieza preventiva', '2026-08-15', NULL, 'Soporte Demo', NULL),
('MNT-0003', 'AST-0003', 'Revisión de puertos y configuración', '2026-08-20', '2026-08-20', 'Soporte Demo', 'Checklist-003'),
('MNT-0004', 'AST-0004', 'Validación de enlace CCTV', '2026-08-05', NULL, 'Soporte Demo', NULL);

