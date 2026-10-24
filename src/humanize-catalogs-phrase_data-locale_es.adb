separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Es (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "es", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
   procedure Labels_4 is separate;
begin
   P ("all_count",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}} en "
      & "total");
   P ("filtered_count.none", "no hay {other} que coincidan");
   P ("filtered_count.all",
      "{total, plural, one {{total} de {total} {one} coincide} many {{total} "
      & "de {total} {many} coinciden} other {{total} de {total} {other} "
      & "coinciden}}");
   P ("filtered_count.some",
      "{matching} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {matching, plural, one {coincide} other {coinciden}}");
   P ("more_count",
      "{visible, plural, one {{visible} visible} other {{visible} visibles}}, "
      & "+{remaining} más");
   P ("others_count", "{first} y {remaining} más");
   P ("page_count", "página {page} de {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} many {{many}} other {{other}}} por "
      & "página");
   P ("pagination_range",
      "{first}–{last} de {total} {total, plural, one {{one}} many {{many}} "
      & "other {{other}}}");
   P ("position_count", "{position} de {total}");
   P ("selection_count",
      "{gender, select, masculine {{selected} de {total} {total, plural, one "
      & "{{one}} many {{many}} other {{other}}} {selected, plural, one "
      & "{seleccionado} other {seleccionados}}} feminine {{selected} de {total} "
      & "{total, plural, one {{one}} many {{many}} other {{other}}} {selected, "
      & "plural, one {seleccionada} other {seleccionadas}}} other {selección: "
      & "{selected} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}}}}");
   P ("showing_count",
      "mostrando {showing} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {sin errores} warning "
      & "{sin advertencias} other {sin avisos}}} one {{count} {severity, "
      & "select, error {error} warning {advertencia} other {aviso}}} other "
      & "{{count} {severity, select, error {errores} warning {advertencias} "
      & "other {avisos}}}}");
   P ("collection.empty", "no hay {other}");
   P ("collection.none_shown", "no se muestran {other}");
   P ("collection.showing_hidden",
      "mostrando {visible} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}, {hidden} sin mostrar");
   P ("collection.showing",
      "mostrando {visible} de {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}");
   P ("collection.shown_hidden",
      "{visible, plural, one {se muestra {visible} {one}} many {se muestran "
      & "{visible} {many}} other {se muestran {visible} {other}}}, {hidden} sin "
      & "mostrar");
   P ("collection.shown",
      "{visible, plural, one {se muestra {visible} {one}} many {se muestran "
      & "{visible} {many}} other {se muestran {visible} {other}}}");
   P ("collection.visible_out_of",
      "{visible} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {visible, plural, one {visible} other {visibles}}");
   P ("complete_count", "{done} de {total} {done, plural, one {completado} other {completados}}");
   P ("percent_complete", "{percent} % completado");
   P ("step_count", "paso {step} de {total}");
   P ("attempt_count", "intento {attempt} de {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {queda} other {quedan}} {remaining} "
      & "{remaining, plural, one {{one}} many {{many}} other {{other}}} a "
      & "{rate} {unit}/s");
   P ("accessible_progress",
      "{done} de {total} {done, plural, one {completado} other "
      & "{completados}}, {percent} por ciento");
   P ("business_days", "{days} {days, plural, one {día hábil} other {días hábiles}}");
   P ("working_hours",
      "{hours} {hours, plural, one {hora de trabajo} other {horas de "
      & "trabajo}}");
   P ("due.overdue", "con {days} {days, plural, one {día} other {días}} de retraso");
   P ("due.today", "vence hoy");
   P ("due.tomorrow", "vence mañana");
   P ("due.in", "vence en {days} días");
   P ("calendar_difference.future", "dentro de {difference}");
   P ("calendar_difference.past", "hace {difference}");
   P ("cpu_load", "carga de CPU {measure}");
   P ("battery", "batería {measure}");
   P ("screen_size", "pantalla {measure}");
   P ("refresh_rate", "frecuencia de actualización {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} por ciento");
   P ("recurrence.second", "{every, plural, =1 {cada segundo} other {cada {every} segundos}}");
   P ("recurrence.minute", "{every, plural, =1 {cada minuto} other {cada {every} minutos}}");
   P ("recurrence.hour", "{every, plural, =1 {cada hora} other {cada {every} horas}}");
   P ("recurrence.day", "{every, plural, =1 {cada día} other {cada {every} días}}");
   P ("recurrence.week", "{every, plural, =1 {cada semana} other {cada {every} semanas}}");
   P ("recurrence.month", "{every, plural, =1 {cada mes} other {cada {every} meses}}");
   P ("recurrence.quarter", "{every, plural, =1 {cada trimestre} other {cada {every} trimestres}}");
   P ("recurrence.year", "{every, plural, =1 {cada año} other {cada {every} años}}");
   P ("cache_summary.empty", "caché: sin solicitudes");
   P ("cache_summary",
      "caché: {hits} {hits, plural, one {acierto} other {aciertos}}, "
      & "{misses} {misses, plural, one {fallo} other {fallos}}, {rate} % de "
      & "aciertos");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}}: "
      & "{changed, plural, one {{changed} cambio} other {{changed} cambios}}, "
      & "{added, plural, one {{added} adición} other {{added} adiciones}}, "
      & "{removed, plural, one {{removed} eliminación} other {{removed} "
      & "eliminaciones}}");
   P ("field_diff", "{field}: valor cambiado de {before} a {after}");
   P ("field_added", "{field}: valor {value} añadido");
   P ("field_removed", "{field}: valor {value} eliminado");
   P ("field_unchanged", "{field}: sigue siendo {value}");
   P ("number_comparison.equal", "{current} es igual a {baseline}");
   P ("number_comparison.higher", "{current} es {quantity} mayor que {baseline}");
   P ("number_comparison.lower", "{current} es {quantity} menor que {baseline}");
   P ("percent_comparison.equal", "{current} es igual a {baseline}");
   P ("percent_comparison.higher", "{current} es {quantity} mayor que {baseline}");
   P ("percent_comparison.lower", "{current} es {quantity} menor que {baseline}");
   P ("file_size_comparison.same", "{current} tiene el mismo tamaño que {baseline}");
   P ("file_size_comparison.larger", "{current} ocupa {quantity} más que {baseline}");
   P ("file_size_comparison.smaller", "{current} ocupa {quantity} menos que {baseline}");
   P ("date_comparison.same", "{current} es la misma fecha que {baseline}");
   P ("date_comparison.after", "{current} es {quantity} después de {baseline}");
   P ("date_comparison.before", "{current} es {quantity} antes de {baseline}");
   P ("queue_summary", "cola: {details}");
   P ("domain_summary",
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
      & "{omitida} other {omitido}}} other {{state}}}: {details}");
   P ("summary.none", "sin {other}");
   P ("summary.completed",
      "{gender, select, masculine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {completado} other "
      & "{completados}}} feminine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {completada} other "
      & "{completadas}}} other {completado: {count} {count, plural, one {{one}} "
      & "many {{many}} other {{other}}}}}");
   P ("summary.completed_of",
      "{gender, select, masculine {{count} de {total} {total, plural, one "
      & "{{one}} many {{many}} other {{other}}} {count, plural, one "
      & "{completado} other {completados}}} feminine {{count} de {total} "
      & "{total, plural, one {{one}} many {{many}} other {{other}}} {count, "
      & "plural, one {completada} other {completadas}}} other {completado: "
      & "{count} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}}}}");
   P ("summary.failed", "{count} con error");
   P ("summary.queued",
      "{count} {count, plural, one {{one}} many {{many}} other {{other}}} en "
      & "cola");
   P ("summary.running", "{count} en curso");
   P ("summary.complete", "{count} {count, plural, one {completado} other {completados}}");
   P ("backup.backup_running", "copia de seguridad en curso");
   P ("backup.backup_completed", "copia de seguridad completada");
   P ("backup.backup_failed", "copia de seguridad fallida");
   P ("backup.backup_stale", "copia de seguridad obsoleta");
   P ("incident.incident_investigating", "investigando incidente");
   P ("incident.incident_identified", "incidente identificado");
   P ("incident.incident_mitigated", "incidente mitigado");
   P ("incident.incident_resolved", "incidente resuelto");
   P ("release.release_drafting", "versión en preparación");
   P ("release.release_ready", "versión lista");
   P ("release.release_published", "versión publicada");
   P ("release.release_rolled_back", "versión revertida");
   P ("audit.audit_created", "entrada de auditoría creada");
   P ("audit.audit_updated", "entrada de auditoría actualizada");
   P ("audit.audit_deleted", "entrada de auditoría eliminada");
   P ("audit.audit_restored", "entrada de auditoría restaurada");
   P ("flag.flag_enabled", "feature flag activado");
   P ("flag.flag_disabled", "feature flag desactivado");
   P ("flag.flag_rolling_out", "feature flag en despliegue");
   P ("flag.flag_rolled_back", "feature flag revertido");
   P ("webhook.webhook_pending", "webhook pendiente");
   P ("webhook.webhook_delivered", "webhook entregado");
   P ("webhook.webhook_failed", "webhook fallido");
   P ("webhook.webhook_retrying", "reintentando webhook");
   P ("api_key.api_key_active", "clave de API activa");
   P ("api_key.api_key_revoked", "clave de API revocada");
   P ("api_key.api_key_expired", "clave de API caducada");
   P ("api_key.api_key_rotated", "clave de API rotada");
   P ("quota.quota_available", "cuota disponible");
   P ("quota.quota_near_limit", "cuota casi agotada");
   P ("quota.quota_exceeded", "cuota superada");
   P ("quota.quota_reset", "cuota restablecida");
   P ("invoice.invoice_draft", "borrador de factura");
   P ("invoice.invoice_sent", "factura enviada");
   P ("invoice.invoice_paid", "factura pagada");
   P ("invoice.invoice_refunded", "factura reembolsada");
   P ("invoice.invoice_overdue", "factura vencida");
   P ("invoice.refund_failed", "reembolso fallido");
   P ("page_navigation.only", "página única");
   P ("page_navigation.first", "primera página, siguiente disponible");
   P ("page_navigation.last", "última página, anterior disponible");
   P ("page_navigation.middle", "anterior y siguiente disponibles");
   P ("end_of_week", "final de la semana");
   P ("end_of_month", "final del mes");
   P ("end_of_quarter", "final del trimestre");
   P ("time_of_day.night", "madrugada");
   P ("time_of_day.morning", "mañana");
   P ("time_of_day.afternoon", "tarde");
   P ("time_of_day.evening", "noche");
   P ("calendar_difference.same_day", "el mismo día");
   P ("calendar_difference.zero", "0 días");
   P ("queue_summary.empty", "cola vacía");
   P ("access.allowed", "permitido");
   P ("access.denied", "denegado");
   P ("access.owner", "propietario");
   P ("access.admin", "administrador");
   P ("access.viewer", "lector");
   P ("access.editor", "editor");
   P ("auth.signed_in", "sesión iniciada");
   P ("auth.signed_out", "sesión cerrada");
   P ("auth.session_expired", "sesión caducada");
   P ("auth.locked", "bloqueado");
   P ("auth.two_factor_required", "verificación en dos pasos obligatoria");
   P ("billing.trialing", "periodo de prueba");
   P ("billing.payment_due", "pago pendiente");
   P ("billing.payment_failed", "error en el pago");
   P ("billing.paid", "pagado");
   P ("billing.past_due", "vencido");
   P ("billing.canceled", "cancelado");
   P ("ci.pipeline_pending", "pipeline pendiente");
   P ("ci.pipeline_running", "pipeline en ejecución");
   P ("ci.pipeline_passed", "pipeline superado");
   P ("ci.pipeline_failed", "pipeline fallido");
   P ("ci.review_required", "revisión obligatoria");
   P ("ci.deploy_blocked", "implementación bloqueada");
   P ("collaboration.active_now", "activo ahora");
   P ("collaboration.away", "ausente");
   P ("collaboration.do_not_disturb", "no molestar");
   P ("collaboration.typing", "escribiendo");
   P ("collaboration.viewing", "viendo");
   P ("collaboration.editing", "editando");
   P ("deployment.deploying", "implementando");
   P ("deployment.deployed", "implementado");
   P ("deployment.rolling_back", "revirtiendo");
   P ("deployment.rolled_back", "revertido");
   P ("deployment.build_failed", "error de compilación");
   P ("deployment.checks_passed", "comprobaciones superadas");
   P ("empty.no_items", "ningún elemento");
   P ("empty.no_results", "sin resultados");
   P ("empty.no_messages", "sin mensajes");
   P ("empty.no_selection", "sin selección");
   P ("empty.nothing_to_show", "nada que mostrar");
   P ("file.uploading", "subiendo");
   P ("file.downloading", "descargando");
   P ("file.copying", "copiando");
   P ("file.moving", "moviendo");
   P ("file.deleting", "eliminando");
   P ("file.deleted", "eliminado");
   P ("file.restoring", "restaurando");
   P ("file.synced", "sincronizado");
   P ("form.valid_input", "entrada válida");
   P ("form.invalid_input", "entrada no válida");
   P ("form.dirty", "modificado");
   P ("form.pristine", "sin cambios");
   P ("form.submitted", "enviado");
   P ("form.submission_failed", "error en el envío");
   P ("health.healthy", "operativo");
   P ("health.degraded", "degradado");
   P ("health.unhealthy", "con problemas");
   P ("health.incident", "incidente");
   P ("health.maintenance", "mantenimiento");
   P ("health.recovering", "recuperándose");
   P ("issue.open", "abierto");
   P ("issue.closed", "cerrado");
   P ("issue.reopened", "reabierto");
   P ("issue.assigned", "asignado");
   P ("issue.unassigned", "sin asignar");
   P ("issue.merged", "fusionado");
   P ("network.offline", "sin conexión");
   P ("network.online", "en línea");
   P ("network.connecting", "conectando");
   P ("network.syncing", "sincronizando");
   P ("network.sync_failed", "error de sincronización");
   P ("network.permission_denied", "permiso denegado");
   P ("network.read_only", "solo lectura");
   P ("notification.unread", "no leído");
   P ("notification.read", "leído");
   P ("notification.muted", "silenciado");
   P ("notification.snoozed", "pospuesto");
   P ("notification.sent", "enviado");
   P ("notification.delivered", "entregado");
   P ("payment.payment_authorized", "pago autorizado");
   P ("payment.payment_captured", "pago cobrado");
   P ("payment.payment_refunded", "pago reembolsado");
   P ("payment.payment_disputed", "pago impugnado");
   P ("payment.payment_requires_action", "el pago requiere una acción");
   P ("payment.payment_expired", "pago caducado");
   P ("ui.empty", "vacío");
   P ("ui.loading", "cargando");
   P ("ui.saving", "guardando");
   P ("ui.saved", "guardado");
   P ("ui.unsaved", "sin guardar");
   P ("ui.retrying", "reintentando");
   P ("ui.paused", "en pausa");
   P ("ui.complete", "completado");
   P ("ui.failed", "error");
   P ("ui.due_soon", "vence pronto");
   P ("ui.overdue", "vencido");
   P ("ui.last_seen", "visto por última vez");
   P ("ui.updated_just_now", "actualizado hace un momento");
   P ("queue.queued", "en cola");
   P ("queue.running", "en ejecución");
   P ("queue.waiting", "en espera");
   P ("queue.blocked", "bloqueado");
   P ("queue.canceled_job", "trabajo cancelado");
   P ("queue.completed_job", "trabajo completado");
   P ("search.filtering", "filtrando");
   P ("search.filtered", "filtrado");
   P ("search.no_matches", "sin coincidencias");
   P ("search.search_ready", "búsqueda lista");
   P ("search.search_failed", "error en la búsqueda");
   P ("search.query_too_short", "consulta demasiado corta");
   P ("security.secure", "seguro");
   P ("security.insecure", "no seguro");
   P ("security.vulnerable", "vulnerable");
   P ("security.encrypted", "cifrado");
   P ("security.unencrypted", "sin cifrar");
   P ("security.token_expired", "token caducado");
   P ("sync.sync_idle", "sincronización inactiva");
   P ("sync.syncing_now", "sincronizando ahora");
   P ("sync.sync_queued", "sincronización en cola");
   P ("sync.sync_conflict", "conflicto de sincronización");
   P ("sync.sync_complete", "sincronización completada");
   P ("sync.sync_error", "error de sincronización");
   P ("task.todo", "pendiente");
   P ("task.in_progress", "en curso");
   P ("task.done", "hecho");
   P ("task.skipped", "omitido");
   P ("task.blocked_task", "bloqueado");
   P ("task.waiting_on", "a la espera de");
   P ("ticket.ticket_new", "ticket nuevo");
   P ("ticket.ticket_open", "ticket abierto");
   P ("ticket.ticket_waiting", "ticket en espera");
   P ("ticket.ticket_escalated", "ticket escalado");
   P ("ticket.ticket_resolved", "ticket resuelto");
   P ("ticket.ticket_closed", "ticket cerrado");
   P ("transfer.importing", "importando");
   P ("transfer.imported", "importado");
   P ("transfer.import_failed", "error de importación");
   P ("transfer.exporting", "exportando");
   P ("transfer.exported", "exportado");
   P ("transfer.export_failed", "error de exportación");
   P ("validation.required", "obligatorio");
   P ("validation.optional", "opcional");
   P ("validation.invalid", "no válido");
   P ("validation.too_short", "demasiado corto");
   P ("validation.too_long", "demasiado largo");
   P ("validation.out_of_range", "fuera de rango");
   P ("validation.already_exists", "ya existe");
   P ("workflow.draft", "borrador");
   P ("workflow.in_review", "en revisión");
   P ("workflow.approved", "aprobado");
   P ("workflow.rejected", "rechazado");
   P ("workflow.published", "publicado");
   P ("workflow.archived", "archivado");
   P ("database.database_online", "base de datos en línea");
   P ("database.database_offline", "base de datos sin conexión");
   P ("database.database_degraded", "base de datos degradada");
   P ("database.database_migrating", "migración de la base de datos en curso");
   P ("database.database_migration_failed", "error en la migración de la base de datos");
   P ("database.database_replicating", "replicación de la base de datos en curso");
   P ("database.database_replication_lagging", "replicación de la base de datos con retraso");
   P ("database.database_backup_running", "copia de seguridad de la base de datos en curso");
   P ("database.database_backup_failed", "error en la copia de seguridad de la base de datos");
   P ("times_noun",
      "{count, plural, =0 {{other}: nunca} =1 {{one}: una vez} =2 {{other}: "
      & "dos veces} many {{many}: {count} veces} other {{other}: {count} "
      & "veces}}");
   P ("availability.all",
      "{available} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {available, plural, one {disponible} other {disponibles}}");
   P ("availability.none", "sin {other} disponibles");
   P ("availability.partial",
      "{available} de {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {available, plural, one {disponible} other {disponibles}}, "
      & "{unavailable} no {unavailable, plural, one {disponible} other "
      & "{disponibles}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "en cola");
   P ("operation.running", "en curso");
   P ("operation.blocked", "bloqueado");
   P ("operation.retrying", "reintentando");
   P ("operation.succeeded", "correcto");
   P ("operation.partially_succeeded", "parcialmente correcto");
   P ("operation.failed", "con error");
   P ("operation.canceled", "cancelado");
   P ("operation.skipped", "omitido");
   P ("operation.stale", "desactualizado");
   P ("operation.unknown_state", "desconocido");
   P ("operation.last_success", "{name}: último éxito {time}");
   P ("operation.next_retry", "{name}: próximo reintento {time}");
   P ("operation.stale_run", "{name}: sin actualizar desde hace {time}");
   P ("summary.skipped", "{count} {count, plural, one {omitido} other {omitidos}}");
   P ("summary.retried", "{count} {count, plural, one {reintentado} other {reintentados}}");
   P ("summary.canceled", "{count} {count, plural, one {cancelado} other {cancelados}}");
   P ("system.service.operational", "operativo");
   P ("system.service.degraded", "rendimiento degradado");
   P ("system.service.partial_outage", "interrupción parcial");
   P ("system.service.major_outage", "interrupción grave");
   P ("system.service.maintenance", "en mantenimiento");
   P ("system.service.unknown", "estado del servicio desconocido");
   P ("system.health.healthy", "en buen estado");
   P ("system.health.warning", "advertencia");
   P ("system.health.critical", "crítico");
   P ("system.health.unavailable", "no disponible");
   P ("system.health.unknown_health", "estado de salud desconocido");
   P ("system.readiness.ready", "listo");
   P ("system.readiness.not_ready", "no listo");
   P ("system.readiness.starting", "iniciándose");
   P ("system.readiness.draining", "drenando");
   P ("system.readiness.stopped", "detenido");
   P ("system.readiness.unknown_readiness", "preparación desconocida");
   P ("system.component.online", "en línea");
   P ("system.component.offline", "fuera de línea");
   P ("system.component.starting", "iniciándose");
   P ("system.component.stopping", "deteniéndose");
   P ("system.component.restarting", "reiniciándose");
   P ("system.component.unknown", "estado del componente desconocido");
   P ("system.check.passing", "superada");
   P ("system.check.failing", "con fallos");
   P ("system.check.warning", "advertencia");
   P ("system.check.skipped", "omitida");
   P ("system.check.timed_out", "tiempo agotado");
   P ("system.check.unknown", "estado de la comprobación desconocido");
   P ("system.incident.investigating", "investigando");
   P ("system.incident.identified", "identificado");
   P ("system.incident.monitoring", "supervisando");
   P ("system.incident.resolved", "resuelto");
   P ("system.incident.scheduled_maintenance", "mantenimiento programado");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "comprobación de {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {ningún componente} one {{count} componente} many "
      & "{{count} de componentes} other {{count} componentes}}");
   P ("system.count.checks",
      "{count, plural, =0 {ninguna comprobación} one {{count} comprobación} "
      & "many {{count} de comprobaciones} other {{count} comprobaciones}}");
   P ("system.count.incidents",
      "{count, plural, =0 {ningún incidente} one {{count} incidente} many "
      & "{{count} de incidentes} other {{count} incidentes}}");
   P ("system.uptime", "tiempo de actividad {measure}");
   P ("system.latency", "latencia {measure}");
   P ("system.maintenance_window", "ventana de mantenimiento {time}");
   P ("system.last_checked", "última comprobación {time}");
   P ("system.http.informational", "informativa");
   P ("system.http.successful", "éxito");
   P ("system.http.redirection", "redirección");
   P ("system.http.client_error", "error del cliente");
   P ("system.http.server_error", "error del servidor");
   P ("system.exit.success", "código de salida {code}: éxito");
   P ("system.exit.failure", "código de salida {code}: error");
   P ("system.exit.usage_error", "código de salida {code}: error de uso");
   P ("system.exit.not_executable", "código de salida {code}: comando no ejecutable");
   P ("system.exit.not_found", "código de salida {code}: comando no encontrado");
   P ("system.exit.invalid_argument", "código de salida {code}: argumento de salida no válido");
   P ("system.exit.signal", "código de salida {code}: terminado por {signal}");
   P ("validation.problem.required", "{field}: es obligatorio");
   P ("validation.problem.minimum", "{field}: está por debajo del mínimo");
   P ("validation.problem.maximum", "{field}: supera el máximo");
   P ("validation.problem.range", "{field}: está fuera del rango");
   P ("validation.problem.pattern", "{field}: no coincide con el patrón");
   P ("validation.problem.choice", "{field}: debe ser una de las opciones permitidas");
   P ("validation.problem.dependency", "{field}: depende de otro campo");
   P ("validation.problem.custom", "{field}: no es válido");
   P ("validation.constraint.no_relation", "{field}: debe ser válido ({value})");
   P ("validation.constraint.less_than", "{field}: debe ser menor que {value}");
   P ("validation.constraint.less_or_equal", "{field}: debe ser como máximo {value}");
   P ("validation.constraint.greater_than", "{field}: debe ser mayor que {value}");
   P ("validation.constraint.greater_or_equal", "{field}: debe ser como mínimo {value}");
   P ("validation.constraint.equal_to", "{field}: debe ser igual a {value}");
   P ("validation.constraint.not_equal_to", "{field}: no debe ser igual a {value}");
   P ("validation.constraint.before_field", "{field}: debe ser anterior a {value}");
   P ("validation.constraint.after_field", "{field}: debe ser posterior a {value}");
   P ("validation.choices", "{field}: valores permitidos: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, valor recibido: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, reintentar en {time}");
   P ("net_diagnostic.dns", "{endpoint}: error en la búsqueda DNS");
   P ("net_diagnostic.tcp", "{endpoint}: error en la conexión TCP");
   P ("net_diagnostic.tls", "{endpoint}: error en el certificado TLS");
   P ("net_diagnostic.http", "{endpoint}: error en la solicitud HTTP");
   P ("net_diagnostic.proxy", "{endpoint}: error en el proxy");
   P ("net_diagnostic.timeout", "{endpoint}: tiempo de espera agotado");
   P ("net_diagnostic.reset", "{endpoint}: conexión restablecida");
   P ("net_diagnostic.unknown_network", "{endpoint}: error de red");
   P ("progress.state.not_started", "sin iniciar");
   P ("progress.state.running", "en curso");
   P ("progress.state.stalled", "estancado");
   P ("progress.state.retrying", "reintentando");
   P ("progress.state.complete", "completado");
   P ("progress.state.failed", "fallido");
   P ("progress.of", "{subject}: {done} de {total} completados ({percent} %), {state}");
   P ("progress.done",
      "{subject}: {done} {done, plural, one {completado} other "
      & "{completados}}, {state}");
   P ("collection.summary",
      "{name}: {total, plural, one {{total} elemento} many {{total} de "
      & "elementos} other {{total} elementos}}, {unique, plural, one {{unique} "
      & "valor único} many {{unique} de valores únicos} other {{unique} "
      & "valores únicos}}, {duplicates, plural, one {{duplicates} duplicado} "
      & "many {{duplicates} de duplicados} other {{duplicates} duplicados}}, "
      & "{outliers, plural, one {{outliers} valor atípico} many {{outliers} de "
      & "valores atípicos} other {{outliers} valores atípicos}}");
   P ("top_frequency",
      "más frecuente en {name}: {value} ({count, plural, one {{count} vez} "
      & "many {{count} de veces} other {{count} veces}})");
   P ("calendar_date.fiscal_year", "AF {year}");
   P ("calendar_date.fiscal_quarter", "AF {year} T{part}");
   P ("calendar_date.fiscal_half", "AF {year} S{part}");
   P ("calendar_date.fiscal_year_end", "fin del AF {year}");
   P ("calendar_date.semester", "S{part} {year}");
   P ("calendar_date.half_year", "S{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {primer semestre de {year}} other {segundo semestre "
      & "de {year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {principios de {text}} mid {mediados de {text}} "
      & "other {finales de {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {principios del {text}} mid {mediados del "
      & "{text}} other {finales del {text}}}");
   P ("calendar_range.weekend.last", "el fin de semana pasado");
   P ("calendar_range.weekend.this", "este fin de semana");
   P ("calendar_range.weekend.next", "el próximo fin de semana");
   P ("calendar_range.weekend_of", "fin de semana del {date}");
   P ("calendar_range.week.last", "la semana pasada");
   P ("calendar_range.week.this", "esta semana");
   P ("calendar_range.week.next", "la próxima semana");
   P ("calendar_range.week_of", "semana del {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "continuar");
   P ("http.reason.101", "cambiando de protocolo");
   P ("http.reason.102", "procesando");
   P ("http.reason.103", "indicaciones tempranas");
   P ("http.reason.200", "ok");
   P ("http.reason.201", "creado");
   P ("http.reason.202", "aceptado");
   P ("http.reason.203", "información no autoritativa");
   P ("http.reason.204", "sin contenido");
   P ("http.reason.205", "restablecer contenido");
   P ("http.reason.206", "contenido parcial");
   P ("http.reason.207", "estado múltiple");
   P ("http.reason.208", "ya informado");
   P ("http.reason.226", "IM usado");
   P ("http.reason.300", "opciones múltiples");
   P ("http.reason.301", "movido permanentemente");
   P ("http.reason.302", "encontrado");
   P ("http.reason.303", "ver otro");
   P ("http.reason.304", "no modificado");
   P ("http.reason.305", "usar proxy");
   P ("http.reason.307", "redirección temporal");
   P ("http.reason.308", "redirección permanente");
   P ("http.reason.400", "solicitud incorrecta");
   P ("http.reason.401", "no autorizado");
   P ("http.reason.402", "pago requerido");
   P ("http.reason.403", "prohibido");
   P ("http.reason.404", "no encontrado");
   P ("http.reason.405", "método no permitido");
   P ("http.reason.406", "no aceptable");
   P ("http.reason.407", "se requiere autenticación de proxy");
   P ("http.reason.408", "tiempo de espera de la solicitud agotado");
   P ("http.reason.409", "conflicto");
   P ("http.reason.410", "ya no disponible");
   P ("http.reason.411", "longitud requerida");
   P ("http.reason.412", "error de condición previa");
   P ("http.reason.413", "contenido demasiado grande");
   P ("http.reason.414", "URI demasiado largo");
   P ("http.reason.415", "tipo de medio no admitido");
   P ("http.reason.416", "rango no satisfactorio");
   P ("http.reason.417", "expectativa fallida");
   P ("http.reason.418", "soy una tetera");
   P ("http.reason.421", "solicitud mal dirigida");
   P ("http.reason.422", "contenido no procesable");
   P ("http.reason.423", "bloqueado");
   P ("http.reason.424", "dependencia fallida");
   P ("http.reason.425", "demasiado pronto");
   P ("http.reason.426", "se requiere actualización");
   P ("http.reason.428", "se requiere condición previa");
   P ("http.reason.429", "demasiadas solicitudes");
   P ("http.reason.431", "campos de encabezado de solicitud demasiado grandes");
   P ("http.reason.451", "no disponible por motivos legales");
   P ("http.reason.500", "error interno del servidor");
   P ("http.reason.501", "no implementado");
   P ("http.reason.502", "puerta de enlace incorrecta");
   P ("http.reason.503", "servicio no disponible");
   P ("http.reason.504", "tiempo de espera de la puerta de enlace agotado");
   P ("http.reason.505", "versión de HTTP no admitida");
   P ("http.reason.506", "la variante también negocia");
   P ("http.reason.507", "almacenamiento insuficiente");
   P ("http.reason.508", "bucle detectado");
   P ("http.reason.510", "no extendido");
   P ("http.reason.511", "se requiere autenticación de red");
   P ("errno.reason.0", "conseguido");
   P ("errno.reason.1", "operación no permitida");
   P ("errno.reason.2", "no existe el fichero o el directorio");
   P ("errno.reason.3", "no existe el proceso");
   P ("errno.reason.4", "llamada al sistema interrumpida");
   P ("errno.reason.5", "error de entrada/salida");
   P ("errno.reason.6", "no existe el dispositivo o la dirección");
   P ("errno.reason.9", "descriptor de fichero erróneo");
   P ("errno.reason.11", "recurso no disponible temporalmente");
   P ("errno.reason.12", "no se pudo asignar memoria");
   P ("errno.reason.13", "permiso denegado");
   P ("errno.reason.17", "el fichero ya existe");
   P ("errno.reason.20", "no es un directorio");
   P ("errno.reason.21", "es un directorio");
   P ("errno.reason.22", "argumento inválido");
   P ("errno.reason.24", "demasiados ficheros abiertos");
   P ("errno.reason.28", "no queda espacio en el dispositivo");
   P ("errno.reason.32", "tubería rota");
   P ("errno.reason.98", "la dirección ya se está usando");
   P ("errno.reason.110", "expiró el tiempo de conexión");
   P ("errno.reason.111", "conexión rehusada");
   P ("signal.reason.1", "colgar (hangup)");
   P ("signal.reason.2", "interrupción");
   P ("signal.reason.3", "abandona");
   P ("signal.reason.4", "instrucción ilegal");
   P ("signal.reason.5", "`trap’ para punto de parada/seguimiento");
   P ("signal.reason.6", "abortado");
   P ("signal.reason.7", "error del bus");
   P ("signal.reason.8", "excepción de coma flotante");
   P ("signal.reason.9", "terminado (killed)");
   P ("signal.reason.10", "señal definida por el usuario 1");
   P ("signal.reason.11", "violación de segmento");
   P ("signal.reason.12", "señal definida por el usuario 2");
   P ("signal.reason.13", "tubería rota");
   P ("signal.reason.14", "temporizador");
   P ("signal.reason.15", "terminado");
   P ("signal.reason.17", "el proceso hijo terminó");
   P ("signal.reason.18", "continúa");
   P ("signal.reason.19", "parado (por una señal)");
   P ("signal.reason.20", "parado");
   P ("signal.reason.28", "la ventana ha cambiado");
   P ("sqlstate.reason.00", "finalización correcta");
   P ("sqlstate.reason.01", "advertencia");
   P ("sqlstate.reason.02", "sin datos");
   P ("sqlstate.reason.08", "excepción de conexión");
   P ("sqlstate.reason.0a", "característica no admitida");
   P ("sqlstate.reason.22", "excepción de datos");
   P ("sqlstate.reason.23", "violación de restricción de integridad");
   P ("sqlstate.reason.24", "estado de cursor no válido");
   P ("sqlstate.reason.25", "estado de transacción no válido");
   P ("sqlstate.reason.28", "especificación de autorización no válida");
   P ("sqlstate.reason.2d", "terminación de transacción no válida");
   P ("sqlstate.reason.3d", "nombre de catálogo no válido");
   P ("sqlstate.reason.3f", "nombre de esquema no válido");
   P ("sqlstate.reason.40", "reversión de transacción");
   P ("sqlstate.reason.42", "error de sintaxis o violación de regla de acceso");
   P ("sqlstate.reason.53", "recursos insuficientes");
   P ("sqlstate.reason.54", "límite del programa excedido");
   P ("sqlstate.reason.55", "objeto no en el estado requerido");
   P ("sqlstate.reason.57", "intervención del operador");
   P ("sqlstate.reason.58", "error del sistema");
   P ("sqlstate.reason.hv", "error del contenedor de datos externos");
   P ("sqlstate.reason.p0", "error de PL/pgSQL");
   P ("sqlstate.reason.xx", "error interno");
   P ("system.signal_numbered", "señal {number} {name} {reason}");
   P ("http.reason.unknown", "estado desconocido");
   P ("errno.reason.unknown", "error desconocido");
   P ("signal.reason.unknown", "señal desconocida");
   P ("sqlstate.reason.unknown", "clase SQLSTATE desconocida");
   P ("diff.changed", "diff {path}: cambiado de {before} a {after}");
   P ("diff.added", "diff {path}: añadido {after}");
   P ("diff.removed", "diff {path}: eliminado {before}");
   P ("diff.unchanged", "diff {path}: sin cambios");
   P ("diff.redacted", "diff {path}: cambiado; valores ocultos");
   P ("validation.result",
      "resultado de la validación: {fields} {fields, plural, one {campo} "
      & "many {de campos} other {campos}}, {errors} {errors, plural, one "
      & "{error} many {de errores} other {errores}}, {warnings} {warnings, "
      & "plural, one {advertencia} many {de advertencias} other "
      & "{advertencias}}, {required} {required, plural, one {campo obligatorio} "
      & "many {de campos obligatorios} other {campos obligatorios}}, {hidden} "
      & "{hidden, plural, one {problema oculto} many {de problemas ocultos} "
      & "other {problemas ocultos}}");
   P ("file.kind.plain", "archivo");
   P ("file.kind.directory", "carpeta");
   P ("file.kind.archive", "paquete de archivos");
   P ("file.kind.compressed", "archivo comprimido");
   P ("file.kind.image", "imagen");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "ejecutable");
   P ("file.kind.unknown", "archivo desconocido");
   P ("file.metadata", "archivo {name}: {kind}");
   P ("file.checksum", "{text}, suma de comprobación {checksum}");
   P ("file.signature_match", "firma de archivo {name}: {kind}, coincide con la extensión");
   P ("file.signature_mismatch",
      "firma de archivo {name}: extensión de tipo {expected}, contenido de "
      & "tipo {actual}");
   P ("network_event.connecting", "conectando");
   P ("network_event.connected", "conectado");
   P ("network_event.redirected", "redirigido");
   P ("network_event.retrying", "reintentando");
   P ("network_event.rate_limited", "límite de frecuencia alcanzado");
   P ("network_event.tls_failed", "error de TLS");
   P ("network_event.stalled", "estancado");
   P ("network_event.complete", "completado");
   P ("network_event.failed", "fallido");
   P ("network.session", "red {endpoint}: {state}");
   P ("diff_node.field", "campo");
   P ("diff_node.object", "objeto");
   P ("diff_node.list", "lista");
   P ("diff.node",
      "nodo de diff {path}: {kind}, {count} {count, plural, one {cambio} many "
      & "{de cambios} other {cambios}}");
   P ("checksum.not_checked", "suma de comprobación sin verificar");
   P ("checksum.valid", "suma de comprobación válida");
   P ("checksum.mismatch", "suma de comprobación no coincidente");
   P ("checksum.missing", "suma de comprobación ausente");
   P ("product_code", "código de producto {kind}: {value}, {state}");
   P ("time_zone.utc", "zona horaria: UTC");
   P ("time_zone.offset", "zona horaria: {offset}");
   P ("time_zone.named", "zona horaria: {name} ({offset})");
   P ("time_zone.local", "zona horaria: hora local");
   P ("time_zone.unknown", "zona horaria: zona desconocida");
   P ("time_zone.dst", "{text}, aplica horario de verano");
   P ("zoned_time.plain", "hora con zona: {time} {offset}");
   P ("zoned_time.named", "hora con zona: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, hora local ambigua");
   P ("number.under", "por debajo de {value}");
   P ("number.up_to", "hasta {value}");
   P ("number.between", "entre {low} y {high}");
   P ("number.range_words", "de {low} a {high}");
   P ("number.uncertainty_words", "{value} más o menos {delta}");
   P ("number.range_inclusive", "de {low} a {high}, ambos incluidos");
   P ("number.range_exclusive", "más de {low} y menos de {high}");
   P ("number.range_low_inclusive", "{low} o más y menos de {high}");
   P ("number.range_high_inclusive", "más de {low} y hasta {high}");
   P ("number.at_least", "al menos {value}");
   P ("number.more_than", "más de {value}");
   P ("number.at_most", "como máximo {value}");
   P ("number.less_than", "menos de {value}");
   P ("number.exactly", "exactamente {value}");
   P ("number.within", "{value} está dentro del intervalo {bounds}");
   P ("number.below", "{value} está por debajo del intervalo {bounds}");
   P ("number.above", "{value} está por encima del intervalo {bounds}");
   P ("number.per", "{numerator} por {denominator}");
   P ("number.one_in", "1 de cada {whole}");
   P ("number.out_of", "{value} de {whole}");
   P ("number.unchanged", "sin cambios");
   P ("number.change_up", "sube {quantity}");
   P ("number.change_down", "baja {quantity}");
   P ("number.change_more", "{quantity} {tail} más");
   P ("number.change_fewer", "{quantity} {tail} menos");
   P ("number.since", "{change} desde {since}");
   P ("duration.countdown", "tiempo restante: {duration}");
   P ("duration.within", "en un plazo de {duration}");
   P ("duration.next", "{duration} a partir de ahora");
   P ("duration.between", "entre {low} y {high}");
   P ("duration.age", "antigüedad: {duration}");
   P ("duration.stale_for", "desactualizado desde hace {duration}");
   P ("duration.backup_age", "copia de seguridad de hace {duration}");
   P ("duration.eta", "tiempo estimado: {duration}");
   P ("duration.expires", "caduca {relative}");
   P ("duration.retrying", "nuevo intento {relative}");
   P ("duration.modified", "modificado {relative}");
   P ("duration.synced", "sincronizado {relative}");
   P ("duration.modified_now", "modificado hace un momento");
   P ("duration.synced_now", "sincronizado hace un momento");
   P ("duration.natural.less_than_minute", "menos de un minuto");
   P ("duration.natural.half_hour", "media hora");
   P ("duration.natural.about_half_hour", "aproximadamente media hora");
   P ("duration.natural.about", "aproximadamente {duration}");
   P ("duration.natural.almost", "casi {duration}");
   P ("duration.natural.over", "más de {duration}");
   P ("duration.natural.just_over", "poco más de {duration}");
   P ("duration.natural.little_under", "poco menos de {duration}");
   P ("duration.natural.few",
      "{unit, select, second {unos segundos} minute {unos minutos} hour {unas "
      & "horas} day {unos días} week {unas semanas} month {unos meses} year "
      & "{unos años} other {unos instantes}}");
   P ("duration.distance.past", "hace {duration}");
   P ("duration.distance.future", "dentro de {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {norte}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNE} other {norte-noreste}}");
   P ("geo.direction.north_east", "{style, select, short {NE} other {noreste}}");
   P ("geo.direction.east_north_east", "{style, select, short {ENE} other {este-noreste}}");
   P ("geo.direction.east", "{style, select, short {E} other {este}}");
   P ("geo.direction.east_south_east", "{style, select, short {ESE} other {este-sureste}}");
   P ("geo.direction.south_east", "{style, select, short {SE} other {sureste}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSE} other {sur-sureste}}");
   P ("geo.direction.south", "{style, select, short {S} other {sur}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSO} other {sur-suroeste}}");
   P ("geo.direction.south_west", "{style, select, short {SO} other {suroeste}}");
   P ("geo.direction.west_south_west", "{style, select, short {OSO} other {oeste-suroeste}}");
   P ("geo.direction.west", "{style, select, short {O} other {oeste}}");
   P ("geo.direction.west_north_west", "{style, select, short {ONO} other {oeste-noroeste}}");
   P ("geo.direction.north_west", "{style, select, short {NO} other {noroeste}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNO} other {norte-noroeste}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "aproximadamente {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "suroeste {southwest}; noreste {northeast}");
   P ("geo.inside_box", "dentro del cuadro delimitador");
   P ("geo.outside_box", "fuera del cuadro delimitador");
   P ("number.about", "aproximadamente {value}");
   P ("number.almost", "casi {value}");
   P ("number.over", "más de {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
   Labels_4;
end Locale_Es;
