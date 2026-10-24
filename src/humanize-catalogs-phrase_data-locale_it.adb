separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_It (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "it", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
begin
   P ("all_count",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}} in "
      & "totale");
   P ("filtered_count.none", "non ci sono {other} corrispondenti");
   P ("filtered_count.all",
      "{total, plural, one {{total} su {total} {one} corrisponde} many "
      & "{{total} su {total} {many} corrispondono} other {{total} su {total} "
      & "{other} corrispondono}}");
   P ("filtered_count.some",
      "{matching} su {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {matching, plural, one {corrisponde} other {corrispondono}}");
   P ("more_count",
      "{visible} {visible, plural, one {visibile} other {visibili}}, "
      & "+{remaining} in più");
   P ("others_count",
      "{first} e {remaining, plural, one {un altro} other {altri "
      & "{remaining}}}");
   P ("page_count", "pagina {page} di {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} many {{many}} other {{other}}} per "
      & "pagina");
   P ("pagination_range",
      "{first}–{last} di {total} {total, plural, one {{one}} many {{many}} "
      & "other {{other}}}");
   P ("position_count", "{position} di {total}");
   P ("selection_count",
      "{gender, select, masculine {{selected} {selected, plural, one {{one}} "
      & "many {{many}} other {{other}}} su {total} {selected, plural, one "
      & "{selezionato} other {selezionati}}} feminine {{selected} {selected, "
      & "plural, one {{one}} many {{many}} other {{other}}} su {total} "
      & "{selected, plural, one {selezionata} other {selezionate}}} other "
      & "{selezione: {selected} di {total} {total, plural, one {{one}} many "
      & "{{many}} other {{other}}}}}");
   P ("showing_count",
      "visualizzazione di {showing} su {total} {total, plural, one {{one}} "
      & "many {{many}} other {{other}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {nessun errore} warning "
      & "{nessun avviso} other {nessuna nota}}} one {{count} {severity, select, "
      & "error {errore} warning {avviso} other {nota}}} other {{count} "
      & "{severity, select, error {errori} warning {avvisi} other {note}}}}");
   P ("collection.empty", "non ci sono {other}");
   P ("collection.none_shown", "non ci sono {other} da mostrare");
   P ("collection.showing_hidden",
      "visualizzazione di {visible} su {total} {total, plural, one {{one}} "
      & "many {{many}} other {{other}}}, {hidden} non {hidden, plural, one "
      & "{visibile} other {visibili}}");
   P ("collection.showing",
      "visualizzazione di {visible} su {total} {total, plural, one {{one}} "
      & "many {{many}} other {{other}}}");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} many {{many}} other {{other}}} "
      & "{visible, plural, one {visibile} other {visibili}}, {hidden} non "
      & "{hidden, plural, one {visibile} other {visibili}}");
   P ("collection.shown",
      "{visible} {visible, plural, one {{one}} many {{many}} other {{other}}} "
      & "{visible, plural, one {visibile} other {visibili}}");
   P ("collection.visible_out_of",
      "{visible} {visible, plural, one {{one}} many {{many}} other {{other}}} "
      & "{visible, plural, one {visibile} other {visibili}} su {total}");
   P ("complete_count", "{done} di {total} {done, plural, one {completato} other {completati}}");
   P ("percent_complete", "{percent}% completato");
   P ("step_count", "passaggio {step} di {total}");
   P ("attempt_count", "tentativo {attempt} di {total}");
   P ("throughput_remaining",
      "{remaining} {remaining, plural, one {{one}} many {{many}} other "
      & "{{other}}} {remaining, plural, one {rimanente} other {rimanenti}} a "
      & "{rate} {unit}/s");
   P ("accessible_progress",
      "{done} di {total} {done, plural, one {completato} other {completati}}, "
      & "{percent} per cento");
   P ("business_days",
      "{days} {days, plural, one {giorno lavorativo} other {giorni "
      & "lavorativi}}");
   P ("working_hours", "{hours} {hours, plural, one {ora lavorativa} other {ore lavorative}}");
   P ("due.overdue", "in ritardo di {days} {days, plural, one {giorno} other {giorni}}");
   P ("due.today", "scade oggi");
   P ("due.tomorrow", "scade domani");
   P ("due.in", "scade tra {days} giorni");
   P ("calendar_difference.future", "tra {difference}");
   P ("calendar_difference.past", "{difference} fa");
   P ("cpu_load", "carico CPU {measure}");
   P ("battery", "batteria {measure}");
   P ("screen_size", "schermo {measure}");
   P ("refresh_rate", "frequenza di aggiornamento {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "{value} per cento");
   P ("recurrence.second", "{every, plural, =1 {ogni secondo} other {ogni {every} secondi}}");
   P ("recurrence.minute", "{every, plural, =1 {ogni minuto} other {ogni {every} minuti}}");
   P ("recurrence.hour", "{every, plural, =1 {ogni ora} other {ogni {every} ore}}");
   P ("recurrence.day", "{every, plural, =1 {ogni giorno} other {ogni {every} giorni}}");
   P ("recurrence.week", "{every, plural, =1 {ogni settimana} other {ogni {every} settimane}}");
   P ("recurrence.month", "{every, plural, =1 {ogni mese} other {ogni {every} mesi}}");
   P ("recurrence.quarter", "{every, plural, =1 {ogni trimestre} other {ogni {every} trimestri}}");
   P ("recurrence.year", "{every, plural, =1 {ogni anno} other {ogni {every} anni}}");
   P ("cache_summary.empty", "cache: nessuna richiesta");
   P ("cache_summary", "cache: {hits} hit, {misses} miss, percentuale di hit {rate}%");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} many {{many}} other {{other}}}: "
      & "{changed, plural, one {{changed} modifica} other {{changed} "
      & "modifiche}}, {added, plural, one {{added} aggiunta} other {{added} "
      & "aggiunte}}, {removed, plural, one {{removed} rimozione} other "
      & "{{removed} rimozioni}}");
   P ("field_diff", "{field}: valore modificato da {before} a {after}");
   P ("field_added", "{field}: valore {value} aggiunto");
   P ("field_removed", "{field}: valore {value} rimosso");
   P ("field_unchanged", "{field}: valore invariato ({value})");
   P ("number_comparison.equal", "{current} è uguale a {baseline}");
   P ("number_comparison.higher", "{current} è superiore di {quantity} a {baseline}");
   P ("number_comparison.lower", "{current} è inferiore di {quantity} a {baseline}");
   P ("percent_comparison.equal", "{current} è uguale a {baseline}");
   P ("percent_comparison.higher", "{current} è superiore di {quantity} a {baseline}");
   P ("percent_comparison.lower", "{current} è inferiore di {quantity} a {baseline}");
   P ("file_size_comparison.same", "{current} ha la stessa dimensione di {baseline}");
   P ("file_size_comparison.larger", "{current} occupa {quantity} in più di {baseline}");
   P ("file_size_comparison.smaller", "{current} occupa {quantity} in meno di {baseline}");
   P ("date_comparison.same", "{current} cade nello stesso giorno di {baseline}");
   P ("date_comparison.after", "{current} cade {quantity} dopo {baseline}");
   P ("date_comparison.before", "{current} cade {quantity} prima di {baseline}");
   P ("queue_summary", "coda: {details}");
   P ("domain_summary",
      "{domain, select, queue {coda} job {attività} run {esecuzione} cache "
      & "{cache} sync {sincronizzazione} import {importazione} export "
      & "{esportazione} other {{domain}}} {state, select, queued {in coda} "
      & "running {in corso} waiting {in attesa} paused {in pausa} complete "
      & "{{domain, select, queue {completata} job {completata} run {completata} "
      & "cache {completata} sync {completata} import {completata} export "
      & "{completata} other {completato}}} failed {{domain, select, queue {non "
      & "riuscita} job {non riuscita} run {non riuscita} cache {non riuscita} "
      & "sync {non riuscita} import {non riuscita} export {non riuscita} other "
      & "{non riuscito}}} stale {{domain, select, queue {obsoleta} job "
      & "{obsoleta} run {obsoleta} cache {obsoleta} sync {obsoleta} import "
      & "{obsoleta} export {obsoleta} other {obsoleto}}} skipped {{domain, "
      & "select, queue {saltata} job {saltata} run {saltata} cache {saltata} "
      & "sync {saltata} import {saltata} export {saltata} other {saltato}}} "
      & "other {{state}}}: {details}");
   P ("summary.none", "non ci sono {other}");
   P ("summary.completed",
      "{gender, select, masculine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {completato} other "
      & "{completati}}} feminine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} {count, plural, one {completata} other "
      & "{completate}}} other {completato: {count} {count, plural, one {{one}} "
      & "many {{many}} other {{other}}}}}");
   P ("summary.completed_of",
      "{gender, select, masculine {{count} {count, plural, one {{one}} many "
      & "{{many}} other {{other}}} su {total} {count, plural, one {completato} "
      & "other {completati}}} feminine {{count} {count, plural, one {{one}} "
      & "many {{many}} other {{other}}} su {total} {count, plural, one "
      & "{completata} other {completate}}} other {completato: {count} di "
      & "{total} {total, plural, one {{one}} many {{many}} other {{other}}}}}");
   P ("summary.failed", "{count} non {count, plural, one {riuscito} other {riusciti}}");
   P ("summary.queued",
      "{count} {count, plural, one {{one}} many {{many}} other {{other}}} in "
      & "coda");
   P ("summary.running", "{count} in corso");
   P ("summary.complete", "{count} {count, plural, one {completato} other {completati}}");
   P ("backup.backup_running", "backup in corso");
   P ("backup.backup_completed", "backup completato");
   P ("backup.backup_failed", "backup non riuscito");
   P ("backup.backup_stale", "backup obsoleto");
   P ("incident.incident_investigating", "incidente in analisi");
   P ("incident.incident_identified", "incidente identificato");
   P ("incident.incident_mitigated", "incidente mitigato");
   P ("incident.incident_resolved", "incidente risolto");
   P ("release.release_drafting", "release in preparazione");
   P ("release.release_ready", "release pronta");
   P ("release.release_published", "release pubblicata");
   P ("release.release_rolled_back", "release annullata");
   P ("audit.audit_created", "voce di audit creata");
   P ("audit.audit_updated", "voce di audit aggiornata");
   P ("audit.audit_deleted", "voce di audit eliminata");
   P ("audit.audit_restored", "voce di audit ripristinata");
   P ("flag.flag_enabled", "feature flag attivato");
   P ("flag.flag_disabled", "feature flag disattivato");
   P ("flag.flag_rolling_out", "feature flag in fase di rilascio");
   P ("flag.flag_rolled_back", "feature flag annullato");
   P ("webhook.webhook_pending", "webhook in sospeso");
   P ("webhook.webhook_delivered", "webhook consegnato");
   P ("webhook.webhook_failed", "webhook non riuscito");
   P ("webhook.webhook_retrying", "webhook: nuovo tentativo in corso");
   P ("api_key.api_key_active", "chiave API attiva");
   P ("api_key.api_key_revoked", "chiave API revocata");
   P ("api_key.api_key_expired", "chiave API scaduta");
   P ("api_key.api_key_rotated", "chiave API ruotata");
   P ("quota.quota_available", "quota disponibile");
   P ("quota.quota_near_limit", "quota quasi esaurita");
   P ("quota.quota_exceeded", "quota superata");
   P ("quota.quota_reset", "quota reimpostata");
   P ("invoice.invoice_draft", "bozza di fattura");
   P ("invoice.invoice_sent", "fattura inviata");
   P ("invoice.invoice_paid", "fattura pagata");
   P ("invoice.invoice_refunded", "fattura rimborsata");
   P ("invoice.invoice_overdue", "fattura scaduta");
   P ("invoice.refund_failed", "rimborso non riuscito");
   P ("page_navigation.only", "unica pagina");
   P ("page_navigation.first", "prima pagina, successiva disponibile");
   P ("page_navigation.last", "ultima pagina, precedente disponibile");
   P ("page_navigation.middle", "precedente e successiva disponibili");
   P ("end_of_week", "fine della settimana");
   P ("end_of_month", "fine del mese");
   P ("end_of_quarter", "fine del trimestre");
   P ("time_of_day.night", "notte");
   P ("time_of_day.morning", "mattina");
   P ("time_of_day.afternoon", "pomeriggio");
   P ("time_of_day.evening", "sera");
   P ("calendar_difference.same_day", "stesso giorno");
   P ("calendar_difference.zero", "0 giorni");
   P ("queue_summary.empty", "coda vuota");
   P ("access.allowed", "consentito");
   P ("access.denied", "negato");
   P ("access.owner", "proprietario");
   P ("access.admin", "amministratore");
   P ("access.viewer", "visualizzatore");
   P ("access.editor", "editor");
   P ("auth.signed_in", "accesso effettuato");
   P ("auth.signed_out", "disconnesso");
   P ("auth.session_expired", "sessione scaduta");
   P ("auth.locked", "bloccato");
   P ("auth.two_factor_required", "autenticazione a due fattori richiesta");
   P ("billing.trialing", "periodo di prova");
   P ("billing.payment_due", "pagamento dovuto");
   P ("billing.payment_failed", "pagamento non riuscito");
   P ("billing.paid", "pagato");
   P ("billing.past_due", "scaduto");
   P ("billing.canceled", "annullato");
   P ("ci.pipeline_pending", "pipeline in attesa");
   P ("ci.pipeline_running", "pipeline in esecuzione");
   P ("ci.pipeline_passed", "pipeline superata");
   P ("ci.pipeline_failed", "pipeline non riuscita");
   P ("ci.review_required", "revisione richiesta");
   P ("ci.deploy_blocked", "deployment bloccato");
   P ("collaboration.active_now", "attivo ora");
   P ("collaboration.away", "assente");
   P ("collaboration.do_not_disturb", "non disturbare");
   P ("collaboration.typing", "sta scrivendo");
   P ("collaboration.viewing", "sta visualizzando");
   P ("collaboration.editing", "sta modificando");
   P ("deployment.deploying", "deployment in corso");
   P ("deployment.deployed", "deployment completato");
   P ("deployment.rolling_back", "rollback in corso");
   P ("deployment.rolled_back", "rollback completato");
   P ("deployment.build_failed", "build non riuscita");
   P ("deployment.checks_passed", "controlli superati");
   P ("empty.no_items", "nessun elemento");
   P ("empty.no_results", "nessun risultato");
   P ("empty.no_messages", "nessun messaggio");
   P ("empty.no_selection", "nessuna selezione");
   P ("empty.nothing_to_show", "niente da mostrare");
   P ("file.uploading", "caricamento in corso");
   P ("file.downloading", "download in corso");
   P ("file.copying", "copia in corso");
   P ("file.moving", "spostamento in corso");
   P ("file.deleting", "eliminazione in corso");
   P ("file.deleted", "eliminato");
   P ("file.restoring", "ripristino in corso");
   P ("file.synced", "sincronizzato");
   P ("form.valid_input", "input valido");
   P ("form.invalid_input", "input non valido");
   P ("form.dirty", "modificato");
   P ("form.pristine", "non modificato");
   P ("form.submitted", "inviato");
   P ("form.submission_failed", "invio non riuscito");
   P ("health.healthy", "integro");
   P ("health.degraded", "degradato");
   P ("health.unhealthy", "non integro");
   P ("health.incident", "incidente");
   P ("health.maintenance", "manutenzione");
   P ("health.recovering", "ripristino in corso");
   P ("issue.open", "aperto");
   P ("issue.closed", "chiuso");
   P ("issue.reopened", "riaperto");
   P ("issue.assigned", "assegnato");
   P ("issue.unassigned", "non assegnato");
   P ("issue.merged", "unito");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "connessione in corso");
   P ("network.syncing", "sincronizzazione in corso");
   P ("network.sync_failed", "sincronizzazione non riuscita");
   P ("network.permission_denied", "autorizzazione negata");
   P ("network.read_only", "sola lettura");
   P ("notification.unread", "non letto");
   P ("notification.read", "letto");
   P ("notification.muted", "silenziato");
   P ("notification.snoozed", "posticipato");
   P ("notification.sent", "inviato");
   P ("notification.delivered", "consegnato");
   P ("payment.payment_authorized", "pagamento autorizzato");
   P ("payment.payment_captured", "pagamento incassato");
   P ("payment.payment_refunded", "pagamento rimborsato");
   P ("payment.payment_disputed", "pagamento contestato");
   P ("payment.payment_requires_action", "il pagamento richiede un’azione");
   P ("payment.payment_expired", "pagamento scaduto");
   P ("ui.empty", "vuoto");
   P ("ui.loading", "caricamento");
   P ("ui.saving", "salvataggio");
   P ("ui.saved", "salvato");
   P ("ui.unsaved", "non salvato");
   P ("ui.retrying", "nuovo tentativo");
   P ("ui.paused", "in pausa");
   P ("ui.complete", "completato");
   P ("ui.failed", "non riuscito");
   P ("ui.due_soon", "in scadenza");
   P ("ui.overdue", "scaduto");
   P ("ui.last_seen", "ultimo accesso");
   P ("ui.updated_just_now", "aggiornato ora");
   P ("queue.queued", "in coda");
   P ("queue.running", "in esecuzione");
   P ("queue.waiting", "in attesa");
   P ("queue.blocked", "bloccato");
   P ("queue.canceled_job", "attività annullata");
   P ("queue.completed_job", "attività completata");
   P ("search.filtering", "filtraggio in corso");
   P ("search.filtered", "filtrato");
   P ("search.no_matches", "nessuna corrispondenza");
   P ("search.search_ready", "ricerca pronta");
   P ("search.search_failed", "ricerca non riuscita");
   P ("search.query_too_short", "query troppo breve");
   P ("security.secure", "sicuro");
   P ("security.insecure", "non sicuro");
   P ("security.vulnerable", "vulnerabile");
   P ("security.encrypted", "crittografato");
   P ("security.unencrypted", "non crittografato");
   P ("security.token_expired", "token scaduto");
   P ("sync.sync_idle", "sincronizzazione inattiva");
   P ("sync.syncing_now", "sincronizzazione in corso");
   P ("sync.sync_queued", "sincronizzazione in coda");
   P ("sync.sync_conflict", "conflitto di sincronizzazione");
   P ("sync.sync_complete", "sincronizzazione completata");
   P ("sync.sync_error", "errore di sincronizzazione");
   P ("task.todo", "da fare");
   P ("task.in_progress", "in corso");
   P ("task.done", "fatto");
   P ("task.skipped", "saltato");
   P ("task.blocked_task", "bloccato");
   P ("task.waiting_on", "in attesa di");
   P ("ticket.ticket_new", "nuovo ticket");
   P ("ticket.ticket_open", "ticket aperto");
   P ("ticket.ticket_waiting", "ticket in attesa");
   P ("ticket.ticket_escalated", "ticket inoltrato");
   P ("ticket.ticket_resolved", "ticket risolto");
   P ("ticket.ticket_closed", "ticket chiuso");
   P ("transfer.importing", "importazione in corso");
   P ("transfer.imported", "importato");
   P ("transfer.import_failed", "importazione non riuscita");
   P ("transfer.exporting", "esportazione in corso");
   P ("transfer.exported", "esportato");
   P ("transfer.export_failed", "esportazione non riuscita");
   P ("validation.required", "obbligatorio");
   P ("validation.optional", "facoltativo");
   P ("validation.invalid", "non valido");
   P ("validation.too_short", "troppo corto");
   P ("validation.too_long", "troppo lungo");
   P ("validation.out_of_range", "fuori intervallo");
   P ("validation.already_exists", "esiste già");
   P ("workflow.draft", "bozza");
   P ("workflow.in_review", "in revisione");
   P ("workflow.approved", "approvato");
   P ("workflow.rejected", "rifiutato");
   P ("workflow.published", "pubblicato");
   P ("workflow.archived", "archiviato");
   P ("database.database_online", "database online");
   P ("database.database_offline", "database offline");
   P ("database.database_degraded", "database degradato");
   P ("database.database_migrating", "migrazione del database in corso");
   P ("database.database_migration_failed", "migrazione del database non riuscita");
   P ("database.database_replicating", "replica del database in corso");
   P ("database.database_replication_lagging", "replica del database in ritardo");
   P ("database.database_backup_running", "backup del database in corso");
   P ("database.database_backup_failed", "backup del database non riuscito");
   P ("times_noun",
      "{count, plural, =0 {{other}: mai} =1 {{one}: una volta} =2 {{other}: "
      & "due volte} many {{many}: {count} volte} other {{other}: {count} "
      & "volte}}");
   P ("availability.all",
      "{available} di {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {available, plural, one {disponibile} other {disponibili}}");
   P ("availability.none", "non ci sono {other} disponibili");
   P ("availability.partial",
      "{available} di {total} {total, plural, one {{one}} many {{many}} other "
      & "{{other}}} {available, plural, one {disponibile} other {disponibili}}, "
      & "{unavailable} non {unavailable, plural, one {disponibile} other "
      & "{disponibili}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "in coda");
   P ("operation.running", "in corso");
   P ("operation.blocked", "bloccato");
   P ("operation.retrying", "nuovo tentativo");
   P ("operation.succeeded", "riuscito");
   P ("operation.partially_succeeded", "parzialmente riuscito");
   P ("operation.failed", "non riuscito");
   P ("operation.canceled", "annullato");
   P ("operation.skipped", "saltato");
   P ("operation.stale", "obsoleto");
   P ("operation.unknown_state", "sconosciuto");
   P ("operation.last_success", "{name}: ultimo esito positivo {time}");
   P ("operation.next_retry", "{name}: prossimo tentativo {time}");
   P ("operation.stale_run", "{name}: senza aggiornamenti da {time}");
   P ("summary.skipped", "{count} {count, plural, one {saltato} other {saltati}}");
   P ("summary.retried", "{count} {count, plural, one {ritentato} other {ritentati}}");
   P ("summary.canceled", "{count} {count, plural, one {annullato} other {annullati}}");
   P ("system.service.operational", "operativo");
   P ("system.service.degraded", "prestazioni ridotte");
   P ("system.service.partial_outage", "interruzione parziale");
   P ("system.service.major_outage", "interruzione grave");
   P ("system.service.maintenance", "in manutenzione");
   P ("system.service.unknown", "stato del servizio sconosciuto");
   P ("system.health.healthy", "integro");
   P ("system.health.warning", "avviso");
   P ("system.health.critical", "critico");
   P ("system.health.unavailable", "non disponibile");
   P ("system.health.unknown_health", "stato di integrità sconosciuto");
   P ("system.readiness.ready", "pronto");
   P ("system.readiness.not_ready", "non pronto");
   P ("system.readiness.starting", "avvio in corso");
   P ("system.readiness.draining", "svuotamento in corso");
   P ("system.readiness.stopped", "arrestato");
   P ("system.readiness.unknown_readiness", "stato di disponibilità sconosciuto");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "avvio in corso");
   P ("system.component.stopping", "arresto in corso");
   P ("system.component.restarting", "riavvio in corso");
   P ("system.component.unknown", "stato del componente sconosciuto");
   P ("system.check.passing", "superato");
   P ("system.check.failing", "non superato");
   P ("system.check.warning", "avviso");
   P ("system.check.skipped", "saltato");
   P ("system.check.timed_out", "tempo scaduto");
   P ("system.check.unknown", "stato del controllo sconosciuto");
   P ("system.incident.investigating", "indagine in corso");
   P ("system.incident.identified", "identificato");
   P ("system.incident.monitoring", "monitoraggio in corso");
   P ("system.incident.resolved", "risolto");
   P ("system.incident.scheduled_maintenance", "manutenzione programmata");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "controllo {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {nessun componente} one {{count} componente} many "
      & "{{count} di componenti} other {{count} componenti}}");
   P ("system.count.checks",
      "{count, plural, =0 {nessun controllo} one {{count} controllo} many "
      & "{{count} di controlli} other {{count} controlli}}");
   P ("system.count.incidents",
      "{count, plural, =0 {nessun incidente} one {{count} incidente} many "
      & "{{count} di incidenti} other {{count} incidenti}}");
   P ("system.uptime", "uptime: {measure}");
   P ("system.latency", "latenza: {measure}");
   P ("system.maintenance_window", "finestra di manutenzione: {time}");
   P ("system.last_checked", "ultimo controllo {time}");
   P ("system.http.informational", "informativo");
   P ("system.http.successful", "successo");
   P ("system.http.redirection", "reindirizzamento");
   P ("system.http.client_error", "errore del client");
   P ("system.http.server_error", "errore del server");
   P ("system.exit.success", "codice di uscita {code}: successo");
   P ("system.exit.failure", "codice di uscita {code}: errore");
   P ("system.exit.usage_error", "codice di uscita {code}: errore di utilizzo");
   P ("system.exit.not_executable", "codice di uscita {code}: comando non eseguibile");
   P ("system.exit.not_found", "codice di uscita {code}: comando non trovato");
   P ("system.exit.invalid_argument", "codice di uscita {code}: argomento di uscita non valido");
   P ("system.exit.signal", "codice di uscita {code}: terminato da {signal}");
   P ("validation.problem.required", "{field}: campo obbligatorio");
   P ("validation.problem.minimum", "{field}: valore inferiore al minimo");
   P ("validation.problem.maximum", "{field}: valore superiore al massimo");
   P ("validation.problem.range", "{field}: valore fuori dall’intervallo consentito");
   P ("validation.problem.pattern", "{field}: non corrisponde al formato richiesto");
   P ("validation.problem.choice", "{field}: deve essere una delle scelte consentite");
   P ("validation.problem.dependency", "{field}: dipende da un altro campo");
   P ("validation.problem.custom", "{field}: valore non valido");
   P ("validation.constraint.no_relation", "{field}: deve essere un valore {value} valido");
   P ("validation.constraint.less_than", "{field}: il valore deve essere minore di {value}");
   P ("validation.constraint.less_or_equal", "{field}: il valore deve essere al massimo {value}");
   P ("validation.constraint.greater_than", "{field}: il valore deve essere maggiore di {value}");
   P ("validation.constraint.greater_or_equal", "{field}: il valore deve essere almeno {value}");
   P ("validation.constraint.equal_to", "{field}: il valore deve essere uguale a {value}");
   P ("validation.constraint.not_equal_to", "{field}: il valore deve essere diverso da {value}");
   P ("validation.constraint.before_field", "{field}: il valore deve essere precedente a {value}");
   P ("validation.constraint.after_field", "{field}: il valore deve essere successivo a {value}");
   P ("validation.choices", "{field}: valori consentiti: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, valore ricevuto: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nuovo tentativo tra {time}");
   P ("net_diagnostic.dns", "{endpoint}: risoluzione DNS non riuscita");
   P ("net_diagnostic.tcp", "{endpoint}: connessione TCP non riuscita");
   P ("net_diagnostic.tls", "{endpoint}: verifica del certificato TLS non riuscita");
   P ("net_diagnostic.http", "{endpoint}: richiesta HTTP non riuscita");
   P ("net_diagnostic.proxy", "{endpoint}: errore del proxy");
   P ("net_diagnostic.timeout", "{endpoint}: tempo di attesa scaduto");
   P ("net_diagnostic.reset", "{endpoint}: connessione reimpostata");
   P ("net_diagnostic.unknown_network", "{endpoint}: errore di rete");
   P ("progress.state.not_started", "non avviato");
   P ("progress.state.running", "in corso");
   P ("progress.state.stalled", "bloccato");
   P ("progress.state.retrying", "nuovo tentativo");
   P ("progress.state.complete", "completato");
   P ("progress.state.failed", "non riuscito");
   P ("progress.of",
      "{subject}: {done} di {total} {done, plural, one {completato} other "
      & "{completati}} ({percent}%), {state}");
   P ("progress.done",
      "{subject}: {done} {done, plural, one {completato} other {completati}}, "
      & "{state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {elemento} many {di elementi} "
      & "other {elementi}}, {unique} {unique, plural, one {valore univoco} many "
      & "{di valori univoci} other {valori univoci}}, {duplicates} {duplicates, "
      & "plural, one {duplicato} many {di duplicati} other {duplicati}}, "
      & "{outliers} {outliers, plural, one {valore anomalo} many {di valori "
      & "anomali} other {valori anomali}}");
   P ("top_frequency",
      "{name}, valore più frequente: {value} ({count} {count, plural, one "
      & "{volta} many {di volte} other {volte}})");
   P ("calendar_date.fiscal_year", "AF {year}");
   P ("calendar_date.fiscal_quarter", "AF {year} T{part}");
   P ("calendar_date.fiscal_half", "AF {year} S{part}");
   P ("calendar_date.fiscal_year_end", "fine AF {year}");
   P ("calendar_date.semester", "S{part} {year}");
   P ("calendar_date.half_year", "S{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {primo semestre {year}} other {secondo semestre "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {inizio {text}} mid {metà {text}} other {fine "
      & "{text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {inizio {text}} mid {metà {text}} other {fine "
      & "{text}}}");
   P ("calendar_range.weekend.last", "lo scorso fine settimana");
   P ("calendar_range.weekend.this", "questo fine settimana");
   P ("calendar_range.weekend.next", "il prossimo fine settimana");
   P ("calendar_range.weekend_of", "fine settimana del {date}");
   P ("calendar_range.week.last", "la settimana scorsa");
   P ("calendar_range.week.this", "questa settimana");
   P ("calendar_range.week.next", "la settimana prossima");
   P ("calendar_range.week_of", "settimana del {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "continua");
   P ("http.reason.101", "cambio di protocollo");
   P ("http.reason.102", "elaborazione in corso");
   P ("http.reason.103", "suggerimenti anticipati");
   P ("http.reason.200", "ok");
   P ("http.reason.201", "creato");
   P ("http.reason.202", "accettato");
   P ("http.reason.203", "informazioni non autorevoli");
   P ("http.reason.204", "nessun contenuto");
   P ("http.reason.205", "reimposta contenuto");
   P ("http.reason.206", "contenuto parziale");
   P ("http.reason.207", "stato multiplo");
   P ("http.reason.208", "già segnalato");
   P ("http.reason.226", "IM usato");
   P ("http.reason.300", "scelte multiple");
   P ("http.reason.301", "spostato in modo permanente");
   P ("http.reason.302", "trovato");
   P ("http.reason.303", "vedi altro");
   P ("http.reason.304", "non modificato");
   P ("http.reason.305", "usa proxy");
   P ("http.reason.307", "reindirizzamento temporaneo");
   P ("http.reason.308", "reindirizzamento permanente");
   P ("http.reason.400", "richiesta non valida");
   P ("http.reason.401", "non autorizzato");
   P ("http.reason.402", "pagamento richiesto");
   P ("http.reason.403", "vietato");
   P ("http.reason.404", "non trovato");
   P ("http.reason.405", "metodo non consentito");
   P ("http.reason.406", "non accettabile");
   P ("http.reason.407", "autenticazione proxy richiesta");
   P ("http.reason.408", "timeout della richiesta");
   P ("http.reason.409", "conflitto");
   P ("http.reason.410", "non più disponibile");
   P ("http.reason.411", "lunghezza richiesta");
   P ("http.reason.412", "precondizione non soddisfatta");
   P ("http.reason.413", "contenuto troppo grande");
   P ("http.reason.414", "URI troppo lungo");
   P ("http.reason.415", "tipo di media non supportato");
   P ("http.reason.416", "intervallo non soddisfacibile");
   P ("http.reason.417", "aspettativa non soddisfatta");
   P ("http.reason.418", "sono una teiera");
   P ("http.reason.421", "richiesta indirizzata male");
   P ("http.reason.422", "contenuto non elaborabile");
   P ("http.reason.423", "bloccato");
   P ("http.reason.424", "dipendenza non soddisfatta");
   P ("http.reason.425", "troppo presto");
   P ("http.reason.426", "aggiornamento richiesto");
   P ("http.reason.428", "precondizione richiesta");
   P ("http.reason.429", "troppe richieste");
   P ("http.reason.431", "campi di intestazione della richiesta troppo grandi");
   P ("http.reason.451", "non disponibile per motivi legali");
   P ("http.reason.500", "errore interno del server");
   P ("http.reason.501", "non implementato");
   P ("http.reason.502", "gateway non valido");
   P ("http.reason.503", "servizio non disponibile");
   P ("http.reason.504", "timeout del gateway");
   P ("http.reason.505", "versione HTTP non supportata");
   P ("http.reason.506", "anche la variante negozia");
   P ("http.reason.507", "spazio di archiviazione insufficiente");
   P ("http.reason.508", "ciclo rilevato");
   P ("http.reason.510", "non esteso");
   P ("http.reason.511", "autenticazione di rete richiesta");
   P ("errno.reason.0", "successo");
   P ("errno.reason.1", "operazione non permessa");
   P ("errno.reason.2", "file o directory non esistente");
   P ("errno.reason.3", "nessun processo corrisponde");
   P ("errno.reason.4", "chiamata di sistema interrotta");
   P ("errno.reason.5", "errore di input/output");
   P ("errno.reason.6", "device o indirizzo non esistente");
   P ("errno.reason.9", "descrittore di file errato");
   P ("errno.reason.11", "risorsa temporaneamente non disponibile");
   P ("errno.reason.12", "impossibile allocare memoria");
   P ("errno.reason.13", "permesso negato");
   P ("errno.reason.17", "file già esistente");
   P ("errno.reason.20", "non è una directory");
   P ("errno.reason.21", "è una directory");
   P ("errno.reason.22", "argomento non valido");
   P ("errno.reason.24", "troppi file aperti");
   P ("errno.reason.28", "spazio esaurito sul device");
   P ("errno.reason.32", "pipe interrotta");
   P ("errno.reason.98", "indirizzo già in uso");
   P ("errno.reason.110", "connessione scaduta");
   P ("errno.reason.111", "connessione rifiutata");
   P ("signal.reason.1", "chiusura");
   P ("signal.reason.2", "interruzione");
   P ("signal.reason.3", "uscita");
   P ("signal.reason.4", "istruzione non consentita");
   P ("signal.reason.5", "rilevato trace/breakpoint");
   P ("signal.reason.6", "annullato");
   P ("signal.reason.7", "errore di bus");
   P ("signal.reason.8", "eccezione in virgola mobile");
   P ("signal.reason.9", "ucciso");
   P ("signal.reason.10", "segnale 1 definito dall’utente");
   P ("signal.reason.11", "errore di segmentazione");
   P ("signal.reason.12", "segnale 2 definito dall’utente");
   P ("signal.reason.13", "pipe interrotta");
   P ("signal.reason.14", "sveglia");
   P ("signal.reason.15", "terminato");
   P ("signal.reason.17", "uscita del processo figlio");
   P ("signal.reason.18", "continuato");
   P ("signal.reason.19", "fermato (segnale)");
   P ("signal.reason.20", "fermato");
   P ("signal.reason.28", "finestra modificata");
   P ("sqlstate.reason.00", "completamento riuscito");
   P ("sqlstate.reason.01", "avviso");
   P ("sqlstate.reason.02", "nessun dato");
   P ("sqlstate.reason.08", "eccezione di connessione");
   P ("sqlstate.reason.0a", "funzionalità non supportata");
   P ("sqlstate.reason.22", "eccezione nei dati");
   P ("sqlstate.reason.23", "violazione di vincolo di integrità");
   P ("sqlstate.reason.24", "stato del cursore non valido");
   P ("sqlstate.reason.25", "stato della transazione non valido");
   P ("sqlstate.reason.28", "specifica di autorizzazione non valida");
   P ("sqlstate.reason.2d", "terminazione della transazione non valida");
   P ("sqlstate.reason.3d", "nome del catalogo non valido");
   P ("sqlstate.reason.3f", "nome dello schema non valido");
   P ("sqlstate.reason.40", "rollback della transazione");
   P ("sqlstate.reason.42", "errore di sintassi o violazione di regola di accesso");
   P ("sqlstate.reason.53", "risorse insufficienti");
   P ("sqlstate.reason.54", "limite del programma superato");
   P ("sqlstate.reason.55", "oggetto non nello stato prerequisito");
   P ("sqlstate.reason.57", "intervento dell’operatore");
   P ("sqlstate.reason.58", "errore di sistema");
   P ("sqlstate.reason.hv", "errore del wrapper di dati esterni");
   P ("sqlstate.reason.p0", "errore PL/pgSQL");
   P ("sqlstate.reason.xx", "errore interno");
   P ("system.signal_numbered", "segnale {number} {name} {reason}");
   P ("http.reason.unknown", "stato sconosciuto");
   P ("errno.reason.unknown", "errore sconosciuto");
   P ("signal.reason.unknown", "segnale sconosciuto");
   P ("sqlstate.reason.unknown", "classe SQLSTATE sconosciuta");
   P ("diff.changed", "diff {path}: modificato da {before} a {after}");
   P ("diff.added", "diff {path}: aggiunto {after}");
   P ("diff.removed", "diff {path}: rimosso {before}");
   P ("diff.unchanged", "diff {path}: invariato");
   P ("diff.redacted", "diff {path}: modificato; valori oscurati");
   P ("validation.result",
      "risultato della convalida: {fields} {fields, plural, one {campo} many "
      & "{di campi} other {campi}}, {errors} {errors, plural, one {errore} many "
      & "{di errori} other {errori}}, {warnings} {warnings, plural, one "
      & "{avviso} many {di avvisi} other {avvisi}}, {required} {required, "
      & "plural, one {campo obbligatorio} many {di campi obbligatori} other "
      & "{campi obbligatori}}, {hidden} {hidden, plural, one {problema "
      & "nascosto} many {di problemi nascosti} other {problemi nascosti}}");
   P ("file.kind.plain", "file");
   P ("file.kind.directory", "cartella");
   P ("file.kind.archive", "archivio");
   P ("file.kind.compressed", "file compresso");
   P ("file.kind.image", "immagine");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "eseguibile");
   P ("file.kind.unknown", "file sconosciuto");
   P ("file.metadata", "file {name}: {kind}");
   P ("file.checksum", "{text}, checksum {checksum}");
   P ("file.signature_match", "firma del file {name}: {kind}, corrisponde all’estensione");
   P ("file.signature_mismatch",
      "firma del file {name}: estensione di tipo {expected}, contenuto di "
      & "tipo {actual}");
   P ("network_event.connecting", "connessione in corso");
   P ("network_event.connected", "connesso");
   P ("network_event.redirected", "reindirizzato");
   P ("network_event.retrying", "nuovo tentativo");
   P ("network_event.rate_limited", "limite di frequenza raggiunto");
   P ("network_event.tls_failed", "TLS non riuscito");
   P ("network_event.stalled", "bloccato");
   P ("network_event.complete", "completato");
   P ("network_event.failed", "non riuscito");
   P ("network.session", "rete {endpoint}: {state}");
   P ("diff_node.field", "campo");
   P ("diff_node.object", "oggetto");
   P ("diff_node.list", "elenco");
   P ("diff.node",
      "nodo diff {path}: {kind}, {count} {count, plural, one {modifica} many "
      & "{di modifiche} other {modifiche}}");
   P ("checksum.not_checked", "checksum non verificato");
   P ("checksum.valid", "checksum valido");
   P ("checksum.mismatch", "checksum non corrispondente");
   P ("checksum.missing", "checksum mancante");
   P ("product_code", "codice prodotto {kind}: {value}, {state}");
   P ("time_zone.utc", "fuso orario: UTC");
   P ("time_zone.offset", "fuso orario: {offset}");
   P ("time_zone.named", "fuso orario: {name} ({offset})");
   P ("time_zone.local", "fuso orario: ora locale");
   P ("time_zone.unknown", "fuso orario: fuso sconosciuto");
   P ("time_zone.dst", "{text}, osserva l’ora legale");
   P ("zoned_time.plain", "ora con fuso: {time} {offset}");
   P ("zoned_time.named", "ora con fuso: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, ora locale ambigua");
   P ("number.under", "sotto {value}");
   P ("number.up_to", "fino a {value}");
   P ("number.between", "tra {low} e {high}");
   P ("number.range_words", "da {low} a {high}");
   P ("number.uncertainty_words", "{value} più o meno {delta}");
   P ("number.range_inclusive", "da {low} a {high}, estremi inclusi");
   P ("number.range_exclusive", "più di {low} e meno di {high}");
   P ("number.range_low_inclusive", "{low} o più e meno di {high}");
   P ("number.range_high_inclusive", "più di {low} e fino a {high}");
   P ("number.at_least", "almeno {value}");
   P ("number.more_than", "più di {value}");
   P ("number.at_most", "al massimo {value}");
   P ("number.less_than", "meno di {value}");
   P ("number.exactly", "esattamente {value}");
   P ("number.within", "{value} è nell’intervallo {bounds}");
   P ("number.below", "{value} è al di sotto dell’intervallo {bounds}");
   P ("number.above", "{value} è al di sopra dell’intervallo {bounds}");
   P ("number.per", "{numerator} per {denominator}");
   P ("number.one_in", "1 su {whole}");
   P ("number.out_of", "{value} su {whole}");
   P ("number.unchanged", "senza variazioni");
   P ("number.change_up", "in aumento di {quantity}");
   P ("number.change_down", "in calo di {quantity}");
   P ("number.change_more", "{quantity} {tail} in più");
   P ("number.change_fewer", "{quantity} {tail} in meno");
   P ("number.since", "{change} in confronto con {since}");
   P ("duration.countdown", "tempo rimanente: {duration}");
   P ("duration.within", "entro {duration}");
   P ("duration.next", "{duration} a partire da ora");
   P ("duration.between", "tra {low} e {high}");
   P ("duration.age", "età: {duration}");
   P ("duration.stale_for", "non aggiornato da {duration}");
   P ("duration.backup_age", "backup di {duration} fa");
   P ("duration.eta", "tempo stimato: {duration}");
   P ("duration.expires", "scade {relative}");
   P ("duration.retrying", "nuovo tentativo {relative}");
   P ("duration.modified", "modificato {relative}");
   P ("duration.synced", "sincronizzato {relative}");
   P ("duration.modified_now", "modificato proprio ora");
   P ("duration.synced_now", "sincronizzato proprio ora");
   P ("duration.natural.less_than_minute", "meno di un minuto");
   P ("duration.natural.half_hour", "mezz’ora");
   P ("duration.natural.about_half_hour", "circa mezz’ora");
   P ("duration.natural.about", "circa {duration}");
   P ("duration.natural.almost", "quasi {duration}");
   P ("duration.natural.over", "oltre {duration}");
   P ("duration.natural.just_over", "poco più di {duration}");
   P ("duration.natural.little_under", "poco meno di {duration}");
   P ("duration.natural.few",
      "{unit, select, second {alcuni secondi} minute {alcuni minuti} hour "
      & "{alcune ore} day {alcuni giorni} week {alcune settimane} month {alcuni "
      & "mesi} year {alcuni anni} other {alcuni istanti}}");
   P ("duration.distance.past", "{duration} fa");
   P ("duration.distance.future", "tra {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {nord}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNE} other {nord-nord-est}}");
   P ("geo.direction.north_east", "{style, select, short {NE} other {nord-est}}");
   P ("geo.direction.east_north_east", "{style, select, short {ENE} other {est-nord-est}}");
   P ("geo.direction.east", "{style, select, short {E} other {est}}");
   P ("geo.direction.east_south_east", "{style, select, short {ESE} other {est-sud-est}}");
   P ("geo.direction.south_east", "{style, select, short {SE} other {sud-est}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSE} other {sud-sud-est}}");
   P ("geo.direction.south", "{style, select, short {S} other {sud}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSO} other {sud-sud-ovest}}");
   P ("geo.direction.south_west", "{style, select, short {SO} other {sud-ovest}}");
   P ("geo.direction.west_south_west", "{style, select, short {OSO} other {ovest-sud-ovest}}");
   P ("geo.direction.west", "{style, select, short {O} other {ovest}}");
   P ("geo.direction.west_north_west", "{style, select, short {ONO} other {ovest-nord-ovest}}");
   P ("geo.direction.north_west", "{style, select, short {NO} other {nord-ovest}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNO} other {nord-nord-ovest}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "circa {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "sud-ovest {southwest}; nord-est {northeast}");
   P ("geo.inside_box", "all’interno del riquadro di delimitazione");
   P ("geo.outside_box", "fuori dal riquadro di delimitazione");
   P ("number.about", "circa {value}");
   P ("number.almost", "quasi {value}");
   P ("number.over", "oltre {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
end Locale_It;
