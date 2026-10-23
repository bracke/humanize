separate (Humanize.Catalogs.Phrase_Data)
function Locale_Es return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("es", Name, Template));
begin
   return
     P ("all_count", "{total} {total, plural, one {{one}} other {{other}}} en total")
     & P ("filtered_count.none", "no hay {other} que coincidan")
     & P ("filtered_count.all",
          "{total, plural, one {{total} de {total} {one} coincide} other {{total} "
          & "de {total} {other} coinciden}}")
     & P ("filtered_count.some",
          "{matching} de {total} {total, plural, one {{one}} other {{other}}} "
          & "{matching, plural, one {coincide} other {coinciden}}")
     & P ("more_count",
          "{visible, plural, one {{visible} visible} other {{visible} visibles}}, "
          & "+{remaining} más")
     & P ("others_count", "{first} y {remaining} más")
     & P ("page_count", "página {page} de {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} por página")
     & P ("pagination_range",
          "{first}–{last} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} de {total}")
     & P ("selection_count",
          "selección: {selected} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("showing_count",
          "mostrando {showing} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {sin errores} warning "
          & "{sin advertencias} other {sin avisos}}} one {{count} {severity, "
          & "select, error {error} warning {advertencia} other {aviso}}} other "
          & "{{count} {severity, select, error {errores} warning {advertencias} "
          & "other {avisos}}}}")
     & P ("collection.empty", "no hay {other}")
     & P ("collection.none_shown", "no se muestran {other}")
     & P ("collection.showing_hidden",
          "mostrando {visible} de {total} {total, plural, one {{one}} other "
          & "{{other}}}, {hidden} sin mostrar")
     & P ("collection.showing",
          "mostrando {visible} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {se muestra {visible} {one}} other {se muestran "
          & "{visible} {other}}}, {hidden} sin mostrar")
     & P ("collection.shown",
          "{visible, plural, one {se muestra {visible} {one}} other {se muestran "
          & "{visible} {other}}}")
     & P ("collection.visible_out_of",
          "{visible} de {total} {total, plural, one {{one}} other {{other}}} "
          & "{visible, plural, one {visible} other {visibles}}")
     & P ("complete_count", "{done} de {total} {done, plural, one {completado} other {completados}}")
     & P ("percent_complete", "{percent} % completado")
     & P ("step_count", "paso {step} de {total}")
     & P ("attempt_count", "intento {attempt} de {total}")
     & P ("throughput_remaining",
          "{remaining, plural, one {queda} other {quedan}} {remaining} {unit} a "
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
          "{total} {total, plural, one {{one}} other {{other}}}: {changed, "
          & "plural, one {{changed} cambio} other {{changed} cambios}}, {added, "
          & "plural, one {{added} adición} other {{added} adiciones}}, {removed, "
          & "plural, one {{removed} eliminación} other {{removed} eliminaciones}}")
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
     & P ("summary.completed", "completado: {count} {count, plural, one {{one}} other {{other}}}")
     & P ("summary.completed_of",
          "completado: {count} de {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("summary.failed", "{count} con error")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} en cola")
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
     & P ("feature_flag.flag_enabled", "feature flag activado")
     & P ("feature_flag.flag_disabled", "feature flag desactivado")
     & P ("feature_flag.flag_rolling_out", "feature flag en despliegue")
     & P ("feature_flag.flag_rolled_back", "feature flag revertido")
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
     & P ("queue_summary.empty", "cola vacía");
end Locale_Es;
