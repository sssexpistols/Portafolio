# Runbook de soporte e infraestructura

Guía demostrativa para ejecutar soporte, mantenimiento, respaldos y gestión de activos de forma consistente.

## Flujo de atención de incidencias

1. Registrar usuario, activo, síntoma, impacto, urgencia y canal.
2. Clasificar la categoría y asignar prioridad/SLA.
3. Confirmar alcance y reproducibilidad antes de modificar el equipo.
4. Respaldar información cuando exista riesgo de pérdida.
5. Diagnosticar de menor a mayor impacto: usuario, aplicación, sistema, equipo y red.
6. Documentar comandos, cambios, evidencias y resultado.
7. Validar con el usuario y cerrar con causa y solución comprensibles.
8. Escalar cuando falten permisos, herramientas, repuestos o conocimiento especializado.

## Alta y preparación de equipos

- Confirmar orden, serie, responsable y garantía.
- Actualizar firmware y sistema operativo desde fuentes autorizadas.
- Instalar aplicaciones aprobadas y retirar software innecesario.
- Aplicar políticas de seguridad, cifrado y bloqueo de pantalla.
- Crear o asociar la cuenta del usuario con privilegio mínimo.
- Registrar IP, VLAN, ubicación y accesorios.
- Ejecutar prueba funcional y obtener aceptación del usuario.

## Respaldos y recuperación

- Aplicar estrategia 3-2-1 cuando el alcance lo permita: tres copias, dos medios y una fuera del sitio.
- Definir RPO y RTO por servicio antes de elegir frecuencia o tecnología.
- Cifrar copias, limitar accesos y registrar cada ejecución.
- Supervisar resultados y atender fallos de respaldo como incidencias.
- Ejecutar restauraciones de prueba; una copia no verificada no garantiza recuperación.

## Mantenimiento preventivo

- Revisar alertas, almacenamiento, temperatura y estado físico.
- Aplicar parches autorizados y confirmar compatibilidad.
- Limpiar equipos respetando procedimientos de seguridad eléctrica.
- Verificar conectividad, puertos, cableado y etiquetado.
- Probar CCTV, NVR, fecha/hora y retención según política.
- Actualizar inventario, evidencia y próxima fecha.

## Manejo de cambios

- Registrar objetivo, alcance, riesgo, ventana, responsable y plan de reversa.
- Obtener autorización antes de cambios productivos.
- Respaldar configuración y documentar el estado inicial.
- Ejecutar pruebas posteriores y confirmar servicios críticos.
- Revertir si los criterios de aceptación no se cumplen.

## Seguridad y privacidad

Este portafolio no contiene credenciales, datos personales, configuraciones reales ni información de una organización. En un entorno real se deben seguir las políticas internas y las instrucciones del responsable de seguridad.

