separate (Humanize.Catalogs.Phrase_Data)
function Locale_Es return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("es", Name, Template));
begin
   return
     P ("all_count",
          "{total} {total, plural, one {{one}} many {{many}} other {{other}}} en "
          & "total")
     & P ("filtered_count.none", "no hay {other} que coincidan")
     & P ("filtered_count.all",
          "{total, plural, one {{total} de {total} {one} coincide} many {{total} "
          & "de {total} {many} coinciden} other {{total} de {total} {other} "
          & "coinciden}}")
     & P ("filtered_count.some",
          "{matching} de {total} {total, plural, one {{one}} many {{many}} other "
          & "{{other}}} {matching, plural, one {coincide} other {coinciden}}")
     & P ("more_count",
          "{visible, plural, one {{visible} visible} other {{visible} visibles}}, "
          & "+{remaining} más")
     & P ("others_count", "{first} y {remaining} más")
     & P ("page_count", "página {page} de {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} many {{many}} other {{other}}} por "
          & "página")
     & P ("pagination_range",
          "{first}–{last} de {total} {total, plural, one {{one}} many {{many}} "
          & "other {{other}}}")
     & P ("position_count", "{position} de {total}")
     & P ("selection_count",
          "{gender, select, masculine {{selected} de {total} {total, plural, one "
          & "{{one}} many {{many}} other {{other}}} {selected, plural, one "
          & "{seleccionado} other {seleccionados}}} feminine {{selected} de {total} "
          & "{total, plural, one {{one}} many {{many}} other {{other}}} {selected, "
          & "plural, one {seleccionada} other {seleccionadas}}} other {selección: "
          & "{selected} de {total} {total, plural, one {{one}} many {{many}} other "
          & "{{other}}}}}")
     & P ("showing_count",
          "mostrando {showing} de {total} {total, plural, one {{one}} many "
          & "{{many}} other {{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {sin errores} warning "
          & "{sin advertencias} other {sin avisos}}} one {{count} {severity, "
          & "select, error {error} warning {advertencia} other {aviso}}} other "
          & "{{count} {severity, select, error {errores} warning {advertencias} "
          & "other {avisos}}}}")
     & P ("collection.empty", "no hay {other}")
     & P ("collection.none_shown", "no se muestran {other}")
     & P ("collection.showing_hidden",
          "mostrando {visible} de {total} {total, plural, one {{one}} many "
          & "{{many}} other {{other}}}, {hidden} sin mostrar")
     & P ("collection.showing",
          "mostrando {visible} de {total} {total, plural, one {{one}} many "
          & "{{many}} other {{other}}}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {se muestra {visible} {one}} many {se muestran "
          & "{visible} {many}} other {se muestran {visible} {other}}}, {hidden} sin "
          & "mostrar")
     & P ("collection.shown",
          "{visible, plural, one {se muestra {visible} {one}} many {se muestran "
          & "{visible} {many}} other {se muestran {visible} {other}}}")
     & P ("collection.visible_out_of",
          "{visible} de {total} {total, plural, one {{one}} many {{many}} other "
          & "{{other}}} {visible, plural, one {visible} other {visibles}}")
     & P ("complete_count", "{done} de {total} {done, plural, one {completado} other {completados}}")
     & P ("percent_complete", "{percent} % completado")
     & P ("step_count", "paso {step} de {total}")
     & P ("attempt_count", "intento {attempt} de {total}")
     & P ("throughput_remaining",
          "{remaining, plural, one {queda} other {quedan}} {remaining} "
          & "{remaining, plural, one {{one}} many {{many}} other {{other}}} a "
          & "{rate} {unit}/s")
     & P ("accessible_progress",
          "{done} de {total} {done, plural, one {completado} other "
          & "{completados}}, {percent} por ciento")
     & P ("business_days", "{days} {days, plural, one {día hábil} other {días hábiles}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {hora de trabajo} other {horas de "
          & "trabajo}}")
     & P ("due.overdue", "con {days} {days, plural, one {día} other {días}} de retraso")
     & P ("due.today", "vence hoy")
     & P ("due.tomorrow", "vence mañana")
     & P ("due.in", "vence en {days} días")
     & P ("calendar_difference.future", "dentro de {difference}")
     & P ("calendar_difference.past", "hace {difference}")
     & P ("cpu_load", "carga de CPU {measure}")
     & P ("battery", "batería {measure}")
     & P ("screen_size", "pantalla {measure}")
     & P ("refresh_rate", "frecuencia de actualización {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} por ciento")
     & P ("recurrence.second", "{every, plural, =1 {cada segundo} other {cada {every} segundos}}")
     & P ("recurrence.minute", "{every, plural, =1 {cada minuto} other {cada {every} minutos}}")
     & P ("recurrence.hour", "{every, plural, =1 {cada hora} other {cada {every} horas}}")
     & P ("recurrence.day", "{every, plural, =1 {cada día} other {cada {every} días}}")
     & P ("recurrence.week", "{every, plural, =1 {cada semana} other {cada {every} semanas}}")
     & P ("recurrence.month", "{every, plural, =1 {cada mes} other {cada {every} meses}}")
     & P ("recurrence.quarter", "{every, plural, =1 {cada trimestre} other {cada {every} trimestres}}")
     & P ("recurrence.year", "{every, plural, =1 {cada año} other {cada {every} años}}")
     & P ("cache_summary.empty", "caché: sin solicitudes")
     & P ("cache_summary",
          "caché: {hits} {hits, plural, one {acierto} other {aciertos}}, "
          & "{misses} {misses, plural, one {fallo} other {fallos}}, {rate} % de "
          & "aciertos")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} many {{many}} other {{other}}}: "
          & "{changed, plural, one {{changed} cambio} other {{changed} cambios}}, "
          & "{added, plural, one {{added} adición} other {{added} adiciones}}, "
          & "{removed, plural, one {{removed} eliminación} other {{removed} "
          & "eliminaciones}}")
     & P ("field_diff", "{field}: valor cambiado de {before} a {after}")
     & P ("field_added", "{field}: valor {value} añadido")
     & P ("field_removed", "{field}: valor {value} eliminado")
     & P ("field_unchanged", "{field}: sigue siendo {value}")
     & P ("number_comparison.equal", "{current} es igual a {baseline}")
     & P ("number_comparison.higher", "{current} es {quantity} mayor que {baseline}")
     & P ("number_comparison.lower", "{current} es {quantity} menor que {baseline}")
     & P ("percent_comparison.equal", "{current} es igual a {baseline}")
     & P ("percent_comparison.higher", "{current} es {quantity} mayor que {baseline}")
     & P ("percent_comparison.lower", "{current} es {quantity} menor que {baseline}")
     & P ("file_size_comparison.same", "{current} tiene el mismo tamaño que {baseline}")
     & P ("file_size_comparison.larger", "{current} ocupa {quantity} más que {baseline}")
     & P ("file_size_comparison.smaller", "{current} ocupa {quantity} menos que {baseline}")
     & P ("date_comparison.same", "{current} es la misma fecha que {baseline}")
     & P ("date_comparison.after", "{current} es {quantity} después de {baseline}")
     & P ("date_comparison.before", "{current} es {quantity} antes de {baseline}")
     & P ("queue_summary", "cola: {details}")
     & P ("domain_summary",
          "{domain, select, queue {cola} job {tarea} run {ejecución} cache "
          & "{caché} sync {sincronización} import {importación} export "
          & "{exportación} other {{domain}}} {state, select, queued {en cola} "
          & "running {en curso} waiting {en espera} paused {en pausa} complete "
          & "{{domain, select, queue {completada} job {completada} run {completada} "
          & "cache {completada} sync {completada} import {completada} export "
          & "{completada} other {completado}}} failed {con error} stale {{domain, "
          & "select, queue {obsoleta} job {obsoleta} run {obsoleta} cache "
          & "{obsoleta} sync {obsoleta} import {obsoleta} export {obsoleta} other "
          & "{obsoleto}}} skipped {{domain, select, queue {omitida} job {omitida} "
          & "run {omitida} cache {omitida} sync {omitida} import {omitida} export "
          & "{omitida} other {omitido}}} other {{state}}}: {details}")
     & P ("summary.none", "sin {other}")
     & P ("summary.completed",
          "{gender, select, masculine {{count} {count, plural, one {{one}} many "
          & "{{many}} other {{other}}} {count, plural, one {completado} other "
          & "{completados}}} feminine {{count} {count, plural, one {{one}} many "
          & "{{many}} other {{other}}} {count, plural, one {completada} other "
          & "{completadas}}} other {completado: {count} {count, plural, one {{one}} "
          & "many {{many}} other {{other}}}}}")
     & P ("summary.completed_of",
          "{gender, select, masculine {{count} de {total} {total, plural, one "
          & "{{one}} many {{many}} other {{other}}} {count, plural, one "
          & "{completado} other {completados}}} feminine {{count} de {total} "
          & "{total, plural, one {{one}} many {{many}} other {{other}}} {count, "
          & "plural, one {completada} other {completadas}}} other {completado: "
          & "{count} de {total} {total, plural, one {{one}} many {{many}} other "
          & "{{other}}}}}")
     & P ("summary.failed", "{count} con error")
     & P ("summary.queued",
          "{count} {count, plural, one {{one}} many {{many}} other {{other}}} en "
          & "cola")
     & P ("summary.running", "{count} en curso")
     & P ("summary.complete", "{count} {count, plural, one {completado} other {completados}}")
     & P ("backup.backup_running", "copia de seguridad en curso")
     & P ("backup.backup_completed", "copia de seguridad completada")
     & P ("backup.backup_failed", "copia de seguridad fallida")
     & P ("backup.backup_stale", "copia de seguridad obsoleta")
     & P ("incident.incident_investigating", "investigando incidente")
     & P ("incident.incident_identified", "incidente identificado")
     & P ("incident.incident_mitigated", "incidente mitigado")
     & P ("incident.incident_resolved", "incidente resuelto")
     & P ("release.release_drafting", "versión en preparación")
     & P ("release.release_ready", "versión lista")
     & P ("release.release_published", "versión publicada")
     & P ("release.release_rolled_back", "versión revertida")
     & P ("audit.audit_created", "entrada de auditoría creada")
     & P ("audit.audit_updated", "entrada de auditoría actualizada")
     & P ("audit.audit_deleted", "entrada de auditoría eliminada")
     & P ("audit.audit_restored", "entrada de auditoría restaurada")
     & P ("flag.flag_enabled", "feature flag activado")
     & P ("flag.flag_disabled", "feature flag desactivado")
     & P ("flag.flag_rolling_out", "feature flag en despliegue")
     & P ("flag.flag_rolled_back", "feature flag revertido")
     & P ("webhook.webhook_pending", "webhook pendiente")
     & P ("webhook.webhook_delivered", "webhook entregado")
     & P ("webhook.webhook_failed", "webhook fallido")
     & P ("webhook.webhook_retrying", "reintentando webhook")
     & P ("api_key.api_key_active", "clave de API activa")
     & P ("api_key.api_key_revoked", "clave de API revocada")
     & P ("api_key.api_key_expired", "clave de API caducada")
     & P ("api_key.api_key_rotated", "clave de API rotada")
     & P ("quota.quota_available", "cuota disponible")
     & P ("quota.quota_near_limit", "cuota casi agotada")
     & P ("quota.quota_exceeded", "cuota superada")
     & P ("quota.quota_reset", "cuota restablecida")
     & P ("invoice.invoice_draft", "borrador de factura")
     & P ("invoice.invoice_sent", "factura enviada")
     & P ("invoice.invoice_paid", "factura pagada")
     & P ("invoice.invoice_refunded", "factura reembolsada")
     & P ("invoice.invoice_overdue", "factura vencida")
     & P ("invoice.refund_failed", "reembolso fallido")
     & P ("page_navigation.only", "página única")
     & P ("page_navigation.first", "primera página, siguiente disponible")
     & P ("page_navigation.last", "última página, anterior disponible")
     & P ("page_navigation.middle", "anterior y siguiente disponibles")
     & P ("end_of_week", "final de la semana")
     & P ("end_of_month", "final del mes")
     & P ("end_of_quarter", "final del trimestre")
     & P ("time_of_day.night", "madrugada")
     & P ("time_of_day.morning", "mañana")
     & P ("time_of_day.afternoon", "tarde")
     & P ("time_of_day.evening", "noche")
     & P ("calendar_difference.same_day", "el mismo día")
     & P ("calendar_difference.zero", "0 días")
     & P ("queue_summary.empty", "cola vacía")
     & P ("access.allowed", "permitido")
     & P ("access.denied", "denegado")
     & P ("access.owner", "propietario")
     & P ("access.admin", "administrador")
     & P ("access.viewer", "lector")
     & P ("access.editor", "editor")
     & P ("auth.signed_in", "sesión iniciada")
     & P ("auth.signed_out", "sesión cerrada")
     & P ("auth.session_expired", "sesión caducada")
     & P ("auth.locked", "bloqueado")
     & P ("auth.two_factor_required", "verificación en dos pasos obligatoria")
     & P ("billing.trialing", "periodo de prueba")
     & P ("billing.payment_due", "pago pendiente")
     & P ("billing.payment_failed", "error en el pago")
     & P ("billing.paid", "pagado")
     & P ("billing.past_due", "vencido")
     & P ("billing.canceled", "cancelado")
     & P ("ci.pipeline_pending", "pipeline pendiente")
     & P ("ci.pipeline_running", "pipeline en ejecución")
     & P ("ci.pipeline_passed", "pipeline superado")
     & P ("ci.pipeline_failed", "pipeline fallido")
     & P ("ci.review_required", "revisión obligatoria")
     & P ("ci.deploy_blocked", "implementación bloqueada")
     & P ("collaboration.active_now", "activo ahora")
     & P ("collaboration.away", "ausente")
     & P ("collaboration.do_not_disturb", "no molestar")
     & P ("collaboration.typing", "escribiendo")
     & P ("collaboration.viewing", "viendo")
     & P ("collaboration.editing", "editando")
     & P ("deployment.deploying", "implementando")
     & P ("deployment.deployed", "implementado")
     & P ("deployment.rolling_back", "revirtiendo")
     & P ("deployment.rolled_back", "revertido")
     & P ("deployment.build_failed", "error de compilación")
     & P ("deployment.checks_passed", "comprobaciones superadas")
     & P ("empty.no_items", "ningún elemento")
     & P ("empty.no_results", "sin resultados")
     & P ("empty.no_messages", "sin mensajes")
     & P ("empty.no_selection", "sin selección")
     & P ("empty.nothing_to_show", "nada que mostrar")
     & P ("file.uploading", "subiendo")
     & P ("file.downloading", "descargando")
     & P ("file.copying", "copiando")
     & P ("file.moving", "moviendo")
     & P ("file.deleting", "eliminando")
     & P ("file.deleted", "eliminado")
     & P ("file.restoring", "restaurando")
     & P ("file.synced", "sincronizado")
     & P ("form.valid_input", "entrada válida")
     & P ("form.invalid_input", "entrada no válida")
     & P ("form.dirty", "modificado")
     & P ("form.pristine", "sin cambios")
     & P ("form.submitted", "enviado")
     & P ("form.submission_failed", "error en el envío")
     & P ("health.healthy", "operativo")
     & P ("health.degraded", "degradado")
     & P ("health.unhealthy", "con problemas")
     & P ("health.incident", "incidente")
     & P ("health.maintenance", "mantenimiento")
     & P ("health.recovering", "recuperándose")
     & P ("issue.open", "abierto")
     & P ("issue.closed", "cerrado")
     & P ("issue.reopened", "reabierto")
     & P ("issue.assigned", "asignado")
     & P ("issue.unassigned", "sin asignar")
     & P ("issue.merged", "fusionado")
     & P ("network.offline", "sin conexión")
     & P ("network.online", "en línea")
     & P ("network.connecting", "conectando")
     & P ("network.syncing", "sincronizando")
     & P ("network.sync_failed", "error de sincronización")
     & P ("network.permission_denied", "permiso denegado")
     & P ("network.read_only", "solo lectura")
     & P ("notification.unread", "no leído")
     & P ("notification.read", "leído")
     & P ("notification.muted", "silenciado")
     & P ("notification.snoozed", "pospuesto")
     & P ("notification.sent", "enviado")
     & P ("notification.delivered", "entregado")
     & P ("payment.payment_authorized", "pago autorizado")
     & P ("payment.payment_captured", "pago cobrado")
     & P ("payment.payment_refunded", "pago reembolsado")
     & P ("payment.payment_disputed", "pago impugnado")
     & P ("payment.payment_requires_action", "el pago requiere una acción")
     & P ("payment.payment_expired", "pago caducado")
     & P ("ui.empty", "vacío")
     & P ("ui.loading", "cargando")
     & P ("ui.saving", "guardando")
     & P ("ui.saved", "guardado")
     & P ("ui.unsaved", "sin guardar")
     & P ("ui.retrying", "reintentando")
     & P ("ui.paused", "en pausa")
     & P ("ui.complete", "completado")
     & P ("ui.failed", "error")
     & P ("ui.due_soon", "vence pronto")
     & P ("ui.overdue", "vencido")
     & P ("ui.last_seen", "visto por última vez")
     & P ("ui.updated_just_now", "actualizado hace un momento")
     & P ("queue.queued", "en cola")
     & P ("queue.running", "en ejecución")
     & P ("queue.waiting", "en espera")
     & P ("queue.blocked", "bloqueado")
     & P ("queue.canceled_job", "trabajo cancelado")
     & P ("queue.completed_job", "trabajo completado")
     & P ("search.filtering", "filtrando")
     & P ("search.filtered", "filtrado")
     & P ("search.no_matches", "sin coincidencias")
     & P ("search.search_ready", "búsqueda lista")
     & P ("search.search_failed", "error en la búsqueda")
     & P ("search.query_too_short", "consulta demasiado corta")
     & P ("security.secure", "seguro")
     & P ("security.insecure", "no seguro")
     & P ("security.vulnerable", "vulnerable")
     & P ("security.encrypted", "cifrado")
     & P ("security.unencrypted", "sin cifrar")
     & P ("security.token_expired", "token caducado")
     & P ("sync.sync_idle", "sincronización inactiva")
     & P ("sync.syncing_now", "sincronizando ahora")
     & P ("sync.sync_queued", "sincronización en cola")
     & P ("sync.sync_conflict", "conflicto de sincronización")
     & P ("sync.sync_complete", "sincronización completada")
     & P ("sync.sync_error", "error de sincronización")
     & P ("task.todo", "pendiente")
     & P ("task.in_progress", "en curso")
     & P ("task.done", "hecho")
     & P ("task.skipped", "omitido")
     & P ("task.blocked_task", "bloqueado")
     & P ("task.waiting_on", "a la espera de")
     & P ("ticket.ticket_new", "ticket nuevo")
     & P ("ticket.ticket_open", "ticket abierto")
     & P ("ticket.ticket_waiting", "ticket en espera")
     & P ("ticket.ticket_escalated", "ticket escalado")
     & P ("ticket.ticket_resolved", "ticket resuelto")
     & P ("ticket.ticket_closed", "ticket cerrado")
     & P ("transfer.importing", "importando")
     & P ("transfer.imported", "importado")
     & P ("transfer.import_failed", "error de importación")
     & P ("transfer.exporting", "exportando")
     & P ("transfer.exported", "exportado")
     & P ("transfer.export_failed", "error de exportación")
     & P ("validation.required", "obligatorio")
     & P ("validation.optional", "opcional")
     & P ("validation.invalid", "no válido")
     & P ("validation.too_short", "demasiado corto")
     & P ("validation.too_long", "demasiado largo")
     & P ("validation.out_of_range", "fuera de rango")
     & P ("validation.already_exists", "ya existe")
     & P ("workflow.draft", "borrador")
     & P ("workflow.in_review", "en revisión")
     & P ("workflow.approved", "aprobado")
     & P ("workflow.rejected", "rechazado")
     & P ("workflow.published", "publicado")
     & P ("workflow.archived", "archivado")
     & P ("database.database_online", "base de datos en línea")
     & P ("database.database_offline", "base de datos sin conexión")
     & P ("database.database_degraded", "base de datos degradada")
     & P ("database.database_migrating", "migración de la base de datos en curso")
     & P ("database.database_migration_failed", "error en la migración de la base de datos")
     & P ("database.database_replicating", "replicación de la base de datos en curso")
     & P ("database.database_replication_lagging", "replicación de la base de datos con retraso")
     & P ("database.database_backup_running", "copia de seguridad de la base de datos en curso")
     & P ("database.database_backup_failed", "error en la copia de seguridad de la base de datos")
     & P ("times_noun",
          "{count, plural, =0 {{other}: nunca} =1 {{one}: una vez} =2 {{other}: "
          & "dos veces} many {{many}: {count} veces} other {{other}: {count} "
          & "veces}}")
     & P ("availability.all",
          "{available} de {total} {total, plural, one {{one}} many {{many}} other "
          & "{{other}}} {available, plural, one {disponible} other {disponibles}}")
     & P ("availability.none", "sin {other} disponibles")
     & P ("availability.partial",
          "{available} de {total} {total, plural, one {{one}} many {{many}} other "
          & "{{other}}} {available, plural, one {disponible} other {disponibles}}, "
          & "{unavailable} no {unavailable, plural, one {disponible} other "
          & "{disponibles}}")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "en cola")
     & P ("operation.running", "en curso")
     & P ("operation.blocked", "bloqueado")
     & P ("operation.retrying", "reintentando")
     & P ("operation.succeeded", "correcto")
     & P ("operation.partially_succeeded", "parcialmente correcto")
     & P ("operation.failed", "con error")
     & P ("operation.canceled", "cancelado")
     & P ("operation.skipped", "omitido")
     & P ("operation.stale", "desactualizado")
     & P ("operation.unknown_state", "desconocido")
     & P ("operation.last_success", "{name}: último éxito {time}")
     & P ("operation.next_retry", "{name}: próximo reintento {time}")
     & P ("operation.stale_run", "{name}: sin actualizar desde hace {time}")
     & P ("summary.skipped", "{count} {count, plural, one {omitido} other {omitidos}}")
     & P ("summary.retried", "{count} {count, plural, one {reintentado} other {reintentados}}")
     & P ("summary.canceled", "{count} {count, plural, one {cancelado} other {cancelados}}")
     & P ("system.service.operational", "operativo")
     & P ("system.service.degraded", "rendimiento degradado")
     & P ("system.service.partial_outage", "interrupción parcial")
     & P ("system.service.major_outage", "interrupción grave")
     & P ("system.service.maintenance", "en mantenimiento")
     & P ("system.service.unknown", "estado del servicio desconocido")
     & P ("system.health.healthy", "en buen estado")
     & P ("system.health.warning", "advertencia")
     & P ("system.health.critical", "crítico")
     & P ("system.health.unavailable", "no disponible")
     & P ("system.health.unknown_health", "estado de salud desconocido")
     & P ("system.readiness.ready", "listo")
     & P ("system.readiness.not_ready", "no listo")
     & P ("system.readiness.starting", "iniciándose")
     & P ("system.readiness.draining", "drenando")
     & P ("system.readiness.stopped", "detenido")
     & P ("system.readiness.unknown_readiness", "preparación desconocida")
     & P ("system.component.online", "en línea")
     & P ("system.component.offline", "fuera de línea")
     & P ("system.component.starting", "iniciándose")
     & P ("system.component.stopping", "deteniéndose")
     & P ("system.component.restarting", "reiniciándose")
     & P ("system.component.unknown", "estado del componente desconocido")
     & P ("system.check.passing", "superada")
     & P ("system.check.failing", "con fallos")
     & P ("system.check.warning", "advertencia")
     & P ("system.check.skipped", "omitida")
     & P ("system.check.timed_out", "tiempo agotado")
     & P ("system.check.unknown", "estado de la comprobación desconocido")
     & P ("system.incident.investigating", "investigando")
     & P ("system.incident.identified", "identificado")
     & P ("system.incident.monitoring", "supervisando")
     & P ("system.incident.resolved", "resuelto")
     & P ("system.incident.scheduled_maintenance", "mantenimiento programado")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "comprobación de {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {ningún componente} one {{count} componente} many "
          & "{{count} de componentes} other {{count} componentes}}")
     & P ("system.count.checks",
          "{count, plural, =0 {ninguna comprobación} one {{count} comprobación} "
          & "many {{count} de comprobaciones} other {{count} comprobaciones}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {ningún incidente} one {{count} incidente} many "
          & "{{count} de incidentes} other {{count} incidentes}}")
     & P ("system.uptime", "tiempo de actividad {measure}")
     & P ("system.latency", "latencia {measure}")
     & P ("system.maintenance_window", "ventana de mantenimiento {time}")
     & P ("system.last_checked", "última comprobación {time}")
     & P ("system.http.informational", "informativa")
     & P ("system.http.successful", "éxito")
     & P ("system.http.redirection", "redirección")
     & P ("system.http.client_error", "error del cliente")
     & P ("system.http.server_error", "error del servidor")
     & P ("system.exit.success", "código de salida {code}: éxito")
     & P ("system.exit.failure", "código de salida {code}: error")
     & P ("system.exit.usage_error", "código de salida {code}: error de uso")
     & P ("system.exit.not_executable", "código de salida {code}: comando no ejecutable")
     & P ("system.exit.not_found", "código de salida {code}: comando no encontrado")
     & P ("system.exit.invalid_argument", "código de salida {code}: argumento de salida no válido")
     & P ("system.exit.signal", "código de salida {code}: terminado por {signal}");
end Locale_Es;
