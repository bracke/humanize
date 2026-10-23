separate (Humanize.Catalogs.Phrase_Data)
function Locale_It return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("it", Name, Template));
begin
   return
     P ("all_count", "{total} {total, plural, one {{one}} other {{other}}} in totale")
     & P ("filtered_count.none", "non ci sono {other} corrispondenti")
     & P ("filtered_count.all",
          "{total, plural, one {{total} su {total} {one} corrisponde} other "
          & "{{total} su {total} {other} corrispondono}}")
     & P ("filtered_count.some",
          "{matching} su {total} {total, plural, one {{one}} other {{other}}} "
          & "{matching, plural, one {corrisponde} other {corrispondono}}")
     & P ("more_count",
          "{visible} {visible, plural, one {visibile} other {visibili}}, "
          & "+{remaining} in più")
     & P ("others_count",
          "{first} e {remaining, plural, one {un altro} other {altri "
          & "{remaining}}}")
     & P ("page_count", "pagina {page} di {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per pagina")
     & P ("pagination_range",
          "{first}–{last} di {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} di {total}")
     & P ("selection_count",
          "selezione: {selected} di {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("showing_count",
          "visualizzazione di {showing} su {total} {total, plural, one {{one}} "
          & "other {{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {nessun errore} warning "
          & "{nessun avviso} other {nessuna nota}}} one {{count} {severity, select, "
          & "error {errore} warning {avviso} other {nota}}} other {{count} "
          & "{severity, select, error {errori} warning {avvisi} other {note}}}}")
     & P ("collection.empty", "non ci sono {other}")
     & P ("collection.none_shown", "non ci sono {other} da mostrare")
     & P ("collection.showing_hidden",
          "visualizzazione di {visible} su {total} {total, plural, one {{one}} "
          & "other {{other}}}, {hidden} non {hidden, plural, one {visibile} other "
          & "{visibili}}")
     & P ("collection.showing",
          "visualizzazione di {visible} su {total} {total, plural, one {{one}} "
          & "other {{other}}}")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
          & "plural, one {visibile} other {visibili}}, {hidden} non {hidden, "
          & "plural, one {visibile} other {visibili}}")
     & P ("collection.shown",
          "{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
          & "plural, one {visibile} other {visibili}}")
     & P ("collection.visible_out_of",
          "{visible} {visible, plural, one {{one}} other {{other}}} {visible, "
          & "plural, one {visibile} other {visibili}} su {total}")
     & P ("complete_count", "{done} di {total} {done, plural, one {completato} other {completati}}")
     & P ("percent_complete", "{percent}% completato")
     & P ("step_count", "passaggio {step} di {total}")
     & P ("attempt_count", "tentativo {attempt} di {total}")
     & P ("throughput_remaining",
          "{remaining} {unit} {remaining, plural, one {rimanente} other "
          & "{rimanenti}} a {rate} {unit}/s")
     & P ("accessible_progress",
          "{done} di {total} {done, plural, one {completato} other {completati}}, "
          & "{percent} per cento")
     & P ("business_days",
          "{days} {days, plural, one {giorno lavorativo} other {giorni "
          & "lavorativi}}")
     & P ("working_hours", "{hours} {hours, plural, one {ora lavorativa} other {ore lavorative}}")
     & P ("due.overdue", "in ritardo di {days} {days, plural, one {giorno} other {giorni}}")
     & P ("due.today", "scade oggi")
     & P ("due.tomorrow", "scade domani")
     & P ("due.in", "scade tra {days} giorni")
     & P ("calendar_difference.future", "tra {difference}")
     & P ("calendar_difference.past", "{difference} fa")
     & P ("cpu_load", "carico CPU {measure}")
     & P ("battery", "batteria {measure}")
     & P ("screen_size", "schermo {measure}")
     & P ("refresh_rate", "frequenza di aggiornamento {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "{value} per cento")
     & P ("recurrence.second", "{every, plural, =1 {ogni secondo} other {ogni {every} secondi}}")
     & P ("recurrence.minute", "{every, plural, =1 {ogni minuto} other {ogni {every} minuti}}")
     & P ("recurrence.hour", "{every, plural, =1 {ogni ora} other {ogni {every} ore}}")
     & P ("recurrence.day", "{every, plural, =1 {ogni giorno} other {ogni {every} giorni}}")
     & P ("recurrence.week", "{every, plural, =1 {ogni settimana} other {ogni {every} settimane}}")
     & P ("recurrence.month", "{every, plural, =1 {ogni mese} other {ogni {every} mesi}}")
     & P ("recurrence.quarter", "{every, plural, =1 {ogni trimestre} other {ogni {every} trimestri}}")
     & P ("recurrence.year", "{every, plural, =1 {ogni anno} other {ogni {every} anni}}")
     & P ("cache_summary.empty", "cache: nessuna richiesta")
     & P ("cache_summary", "cache: {hits} hit, {misses} miss, percentuale di hit {rate}%")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed, "
          & "plural, one {{changed} modifica} other {{changed} modifiche}}, {added, "
          & "plural, one {{added} aggiunta} other {{added} aggiunte}}, {removed, "
          & "plural, one {{removed} rimozione} other {{removed} rimozioni}}")
     & P ("field_diff", "{field}: valore modificato da {before} a {after}")
     & P ("field_added", "{field}: valore {value} aggiunto")
     & P ("field_removed", "{field}: valore {value} rimosso")
     & P ("field_unchanged", "{field}: valore invariato ({value})")
     & P ("number_comparison.equal", "{current} è uguale a {baseline}")
     & P ("number_comparison.higher", "{current} è superiore di {quantity} a {baseline}")
     & P ("number_comparison.lower", "{current} è inferiore di {quantity} a {baseline}")
     & P ("percent_comparison.equal", "{current} è uguale a {baseline}")
     & P ("percent_comparison.higher", "{current} è superiore di {quantity} a {baseline}")
     & P ("percent_comparison.lower", "{current} è inferiore di {quantity} a {baseline}")
     & P ("file_size_comparison.same", "{current} ha la stessa dimensione di {baseline}")
     & P ("file_size_comparison.larger", "{current} occupa {quantity} in più di {baseline}")
     & P ("file_size_comparison.smaller", "{current} occupa {quantity} in meno di {baseline}")
     & P ("date_comparison.same", "{current} cade nello stesso giorno di {baseline}")
     & P ("date_comparison.after", "{current} cade {quantity} dopo {baseline}")
     & P ("date_comparison.before", "{current} cade {quantity} prima di {baseline}")
     & P ("queue_summary", "coda: {details}")
     & P ("domain_summary",
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
          & "other {{state}}}: {details}")
     & P ("summary.none", "non ci sono {other}")
     & P ("summary.completed", "completato: {count} {count, plural, one {{one}} other {{other}}}")
     & P ("summary.completed_of",
          "completato: {count} di {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("summary.failed", "{count} con errore")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} in coda")
     & P ("summary.running", "{count} in corso")
     & P ("summary.complete", "{count} {count, plural, one {completato} other {completati}}")
     & P ("backup.backup_running", "backup in corso")
     & P ("backup.backup_completed", "backup completato")
     & P ("backup.backup_failed", "backup non riuscito")
     & P ("backup.backup_stale", "backup obsoleto")
     & P ("incident.incident_investigating", "incidente in analisi")
     & P ("incident.incident_identified", "incidente identificato")
     & P ("incident.incident_mitigated", "incidente mitigato")
     & P ("incident.incident_resolved", "incidente risolto")
     & P ("release.release_drafting", "release in preparazione")
     & P ("release.release_ready", "release pronta")
     & P ("release.release_published", "release pubblicata")
     & P ("release.release_rolled_back", "release annullata")
     & P ("audit.audit_created", "voce di audit creata")
     & P ("audit.audit_updated", "voce di audit aggiornata")
     & P ("audit.audit_deleted", "voce di audit eliminata")
     & P ("audit.audit_restored", "voce di audit ripristinata")
     & P ("feature_flag.flag_enabled", "feature flag attivato")
     & P ("feature_flag.flag_disabled", "feature flag disattivato")
     & P ("feature_flag.flag_rolling_out", "feature flag in fase di rilascio")
     & P ("feature_flag.flag_rolled_back", "feature flag annullato")
     & P ("webhook.webhook_pending", "webhook in sospeso")
     & P ("webhook.webhook_delivered", "webhook consegnato")
     & P ("webhook.webhook_failed", "webhook non riuscito")
     & P ("webhook.webhook_retrying", "webhook: nuovo tentativo in corso")
     & P ("api_key.api_key_active", "chiave API attiva")
     & P ("api_key.api_key_revoked", "chiave API revocata")
     & P ("api_key.api_key_expired", "chiave API scaduta")
     & P ("api_key.api_key_rotated", "chiave API ruotata")
     & P ("quota.quota_available", "quota disponibile")
     & P ("quota.quota_near_limit", "quota quasi esaurita")
     & P ("quota.quota_exceeded", "quota superata")
     & P ("quota.quota_reset", "quota reimpostata")
     & P ("invoice.invoice_draft", "bozza di fattura")
     & P ("invoice.invoice_sent", "fattura inviata")
     & P ("invoice.invoice_paid", "fattura pagata")
     & P ("invoice.invoice_refunded", "fattura rimborsata")
     & P ("invoice.invoice_overdue", "fattura scaduta")
     & P ("invoice.refund_failed", "rimborso non riuscito")
     & P ("page_navigation.only", "unica pagina")
     & P ("page_navigation.first", "prima pagina, successiva disponibile")
     & P ("page_navigation.last", "ultima pagina, precedente disponibile")
     & P ("page_navigation.middle", "precedente e successiva disponibili")
     & P ("end_of_week", "fine della settimana")
     & P ("end_of_month", "fine del mese")
     & P ("end_of_quarter", "fine del trimestre")
     & P ("time_of_day.night", "notte")
     & P ("time_of_day.morning", "mattina")
     & P ("time_of_day.afternoon", "pomeriggio")
     & P ("time_of_day.evening", "sera")
     & P ("calendar_difference.same_day", "stesso giorno")
     & P ("calendar_difference.zero", "0 giorni")
     & P ("queue_summary.empty", "coda vuota");
end Locale_It;
