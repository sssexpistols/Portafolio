-- Portafolio técnico de Ángel Gabriel Valderrama Ramírez
-- Modelo demostrativo de activos, usuarios, tickets y mantenimientos.
-- Datos y entidades ficticios. Sintaxis SQL estándar compatible con PostgreSQL/MySQL
-- con ajustes menores en columnas autoincrementales si se amplía el proyecto.

CREATE TABLE areas (
    area_id INTEGER PRIMARY KEY,
    nombre VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE usuarios (
    usuario_id INTEGER PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    correo VARCHAR(120) NOT NULL UNIQUE,
    area_id INTEGER NOT NULL,
    activo BOOLEAN NOT NULL DEFAULT TRUE,
    FOREIGN KEY (area_id) REFERENCES areas(area_id)
);

CREATE TABLE activos (
    activo_id VARCHAR(12) PRIMARY KEY,
    tipo VARCHAR(40) NOT NULL,
    marca_modelo VARCHAR(100) NOT NULL,
    serie VARCHAR(60) NOT NULL UNIQUE,
    usuario_id INTEGER,
    direccion_ip VARCHAR(45),
    vlan INTEGER,
    estado VARCHAR(30) NOT NULL,
    fecha_alta DATE NOT NULL,
    fin_garantia DATE,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    CHECK (vlan IS NULL OR vlan BETWEEN 1 AND 4094),
    CHECK (estado IN ('Operativo','Mantenimiento','Reserva','Baja'))
);

CREATE TABLE tickets (
    ticket_id VARCHAR(12) PRIMARY KEY,
    usuario_id INTEGER NOT NULL,
    activo_id VARCHAR(12),
    categoria VARCHAR(40) NOT NULL,
    prioridad VARCHAR(20) NOT NULL,
    estado VARCHAR(25) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    fecha_apertura TIMESTAMP NOT NULL,
    fecha_cierre TIMESTAMP,
    horas_solucion DECIMAL(8,2),
    sla_objetivo_horas INTEGER NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios(usuario_id),
    FOREIGN KEY (activo_id) REFERENCES activos(activo_id),
    CHECK (prioridad IN ('Crítica','Alta','Media','Baja','Solicitud')),
    CHECK (estado IN ('Abierto','En progreso','Resuelto','Cerrado')),
    CHECK (horas_solucion IS NULL OR horas_solucion >= 0)
);

CREATE TABLE mantenimientos (
    mantenimiento_id VARCHAR(12) PRIMARY KEY,
    activo_id VARCHAR(12) NOT NULL,
    actividad VARCHAR(120) NOT NULL,
    fecha_programada DATE NOT NULL,
    fecha_ejecucion DATE,
    responsable VARCHAR(100) NOT NULL,
    evidencia VARCHAR(200),
    FOREIGN KEY (activo_id) REFERENCES activos(activo_id)
);

CREATE INDEX idx_tickets_estado_prioridad ON tickets (estado, prioridad);
CREATE INDEX idx_tickets_activo ON tickets (activo_id);
CREATE INDEX idx_activos_usuario ON activos (usuario_id);
CREATE INDEX idx_mantenimiento_fecha ON mantenimientos (fecha_programada);

