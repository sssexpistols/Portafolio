-- 1. Tickets abiertos o en progreso, priorizados para atención.
SELECT t.ticket_id, u.nombre AS usuario, t.categoria, t.prioridad,
       t.estado, t.fecha_apertura, t.sla_objetivo_horas
FROM tickets t
JOIN usuarios u ON u.usuario_id = t.usuario_id
WHERE t.estado IN ('Abierto', 'En progreso')
ORDER BY CASE t.prioridad
           WHEN 'Crítica' THEN 1 WHEN 'Alta' THEN 2 WHEN 'Media' THEN 3
           WHEN 'Baja' THEN 4 ELSE 5
         END, t.fecha_apertura;

-- 2. Cumplimiento de SLA de tickets finalizados.
SELECT ticket_id, prioridad, horas_solucion, sla_objetivo_horas,
       CASE WHEN horas_solucion <= sla_objetivo_horas
            THEN 'Cumple' ELSE 'Incumple' END AS resultado_sla
FROM tickets
WHERE horas_solucion IS NOT NULL;

-- 3. Indicador general de SLA.
SELECT COUNT(*) AS tickets_finalizados,
       SUM(CASE WHEN horas_solucion <= sla_objetivo_horas THEN 1 ELSE 0 END) AS dentro_sla,
       ROUND(100.0 * SUM(CASE WHEN horas_solucion <= sla_objetivo_horas THEN 1 ELSE 0 END)
             / NULLIF(COUNT(*), 0), 1) AS porcentaje_sla
FROM tickets
WHERE horas_solucion IS NOT NULL;

-- 4. Activos con usuario, área, IP y VLAN para trazabilidad.
SELECT a.activo_id, a.tipo, a.marca_modelo, a.estado,
       u.nombre AS usuario, ar.nombre AS area, a.direccion_ip, a.vlan
FROM activos a
LEFT JOIN usuarios u ON u.usuario_id = a.usuario_id
LEFT JOIN areas ar ON ar.area_id = u.area_id
ORDER BY a.activo_id;

-- 5. Mantenimientos pendientes.
SELECT m.mantenimiento_id, m.activo_id, a.tipo, m.actividad,
       m.fecha_programada, m.responsable
FROM mantenimientos m
JOIN activos a ON a.activo_id = m.activo_id
WHERE m.fecha_ejecucion IS NULL
ORDER BY m.fecha_programada;

-- 6. Equipos con más incidencias, útil para renovación o causa raíz.
SELECT a.activo_id, a.tipo, a.marca_modelo, COUNT(t.ticket_id) AS incidencias
FROM activos a
LEFT JOIN tickets t ON t.activo_id = a.activo_id
GROUP BY a.activo_id, a.tipo, a.marca_modelo
ORDER BY incidencias DESC, a.activo_id;

