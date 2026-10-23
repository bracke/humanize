separate (Humanize.Catalogs.Phrase_Data)
function Locale_De return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("de", Name, Template));
begin
   return
     P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "keine passenden {other}")
     & P ("filtered_count.all", "alle {total} {total, plural, one {{one}} other {{other}}} passen")
     & P ("filtered_count.some",
          "{matching} von {total} {total, plural, one {{one}} other {{other}}} "
          & "passen")
     & P ("more_count", "{visible} angezeigt, +{remaining} weitere")
     & P ("others_count",
          "{first} und {remaining, plural, one {1 weiterer} other {{remaining} "
          & "weitere}}")
     & P ("page_count", "Seite {page} von {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} pro Seite")
     & P ("pagination_range",
          "{first}–{last} von {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} von {total}")
     & P ("selection_count",
          "{selected} von {total} {total, plural, one {{one}} other {{other}}} "
          & "ausgewählt")
     & P ("showing_count",
          "{showing} von {total} {total, plural, one {{one}} other {{other}}} "
          & "angezeigt")
     & P ("validation_count",
          "{count, plural, =0 {keine {severity, select, error {Fehler} warning "
          & "{Warnungen} other {Hinweise}}} one {1 {severity, select, error "
          & "{Fehler} warning {Warnung} other {Hinweis}}} other {{count} {severity, "
          & "select, error {Fehler} warning {Warnungen} other {Hinweise}}}}")
     & P ("collection.empty", "keine {other}")
     & P ("collection.none_shown", "keine {other} angezeigt")
     & P ("collection.showing_hidden",
          "{visible} von {total} {total, plural, one {{one}} other {{other}}} "
          & "angezeigt, {hidden} ausgeblendet")
     & P ("collection.showing",
          "{visible} von {total} {total, plural, one {{one}} other {{other}}} "
          & "angezeigt")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} angezeigt, "
          & "{hidden} ausgeblendet")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} angezeigt")
     & P ("collection.visible_out_of",
          "{visible} von {total} {total, plural, one {{one}} other {{other}}} "
          & "sichtbar")
     & P ("complete_count", "{done} von {total} abgeschlossen")
     & P ("percent_complete", "{percent} % abgeschlossen")
     & P ("step_count", "Schritt {step} von {total}")
     & P ("attempt_count", "Versuch {attempt} von {total}")
     & P ("throughput_remaining", "noch {remaining} {unit} bei {rate} {unit}/s")
     & P ("accessible_progress", "{done} von {total} abgeschlossen, {percent} Prozent")
     & P ("business_days", "{days} {days, plural, one {Werktag} other {Werktage}}")
     & P ("working_hours", "{hours} {hours, plural, one {Arbeitsstunde} other {Arbeitsstunden}}")
     & P ("due.overdue", "seit {days} {days, plural, one {Tag} other {Tagen}} überfällig")
     & P ("due.today", "heute fällig")
     & P ("due.tomorrow", "morgen fällig")
     & P ("due.in", "fällig in {days} Tagen")
     & P ("calendar_difference.future", "noch {difference}")
     & P ("calendar_difference.past", "{difference} her")
     & P ("calendar_difference.same_day", "am selben Tag")
     & P ("calendar_difference.zero", "0 Tage")
     & P ("cpu_load", "CPU-Last {measure}")
     & P ("battery", "Akku {measure}")
     & P ("screen_size", "Bildschirm {measure}")
     & P ("refresh_rate", "Bildwiederholrate {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} Prozent")
     & P ("recurrence.second", "{every, plural, one {jede Sekunde} other {alle {every} Sekunden}}")
     & P ("recurrence.minute", "{every, plural, one {jede Minute} other {alle {every} Minuten}}")
     & P ("recurrence.hour", "{every, plural, one {jede Stunde} other {alle {every} Stunden}}")
     & P ("recurrence.day", "{every, plural, one {jeden Tag} other {alle {every} Tage}}")
     & P ("recurrence.week", "{every, plural, one {jede Woche} other {alle {every} Wochen}}")
     & P ("recurrence.month", "{every, plural, one {jeden Monat} other {alle {every} Monate}}")
     & P ("recurrence.quarter", "{every, plural, one {jedes Quartal} other {alle {every} Quartale}}")
     & P ("recurrence.year", "{every, plural, one {jedes Jahr} other {alle {every} Jahre}}")
     & P ("cache_summary.empty", "Cache: keine Anfragen")
     & P ("cache_summary",
          "Cache: {hits} Treffer, {misses} {misses, plural, one {Fehlzugriff} "
          & "other {Fehlzugriffe}}, {rate} % Trefferquote")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
          & "geändert, {added} hinzugefügt, {removed} entfernt")
     & P ("field_diff", "{field} von {before} in {after} geändert")
     & P ("field_added", "{field} als {value} hinzugefügt")
     & P ("field_removed", "{field} entfernt (war {value})")
     & P ("field_unchanged", "{field} unverändert bei {value}")
     & P ("number_comparison.equal", "{current} ist gleich {baseline}")
     & P ("number_comparison.higher", "{current} ist {quantity} höher als {baseline}")
     & P ("number_comparison.lower", "{current} ist {quantity} niedriger als {baseline}")
     & P ("percent_comparison.equal", "{current} ist gleich {baseline}")
     & P ("percent_comparison.higher", "{current} ist {quantity} höher als {baseline}")
     & P ("percent_comparison.lower", "{current} ist {quantity} niedriger als {baseline}")
     & P ("file_size_comparison.same", "{current} ist genauso groß wie {baseline}")
     & P ("file_size_comparison.larger", "{current} ist {quantity} größer als {baseline}")
     & P ("file_size_comparison.smaller", "{current} ist {quantity} kleiner als {baseline}")
     & P ("date_comparison.same", "{current} ist dasselbe Datum wie {baseline}")
     & P ("date_comparison.after", "{current} liegt {quantity} nach {baseline}")
     & P ("date_comparison.before", "{current} liegt {quantity} vor {baseline}")
     & P ("queue_summary", "Warteschlange: {details}")
     & P ("queue_summary.empty", "Warteschlange leer")
     & P ("domain_summary",
          "{domain, select, queue {Warteschlange} job {Job} run {Lauf} cache "
          & "{Cache} sync {Synchronisierung} import {Import} export {Export} other "
          & "{{domain}}} {state, select, queued {eingereiht} running {läuft} "
          & "waiting {wartet} paused {pausiert} complete {abgeschlossen} failed "
          & "{fehlgeschlagen} stale {veraltet} skipped {übersprungen} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "keine {other}")
     & P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} abgeschlossen")
     & P ("summary.completed_of",
          "{count} von {total} {total, plural, one {{one}} other {{other}}} "
          & "abgeschlossen")
     & P ("summary.failed", "{count} fehlgeschlagen")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} eingereiht")
     & P ("summary.running", "{count, plural, one {{count} läuft} other {{count} laufen}}")
     & P ("summary.complete", "{count} abgeschlossen")
     & P ("backup.backup_running", "Sicherung läuft")
     & P ("backup.backup_completed", "Sicherung abgeschlossen")
     & P ("backup.backup_failed", "Sicherung fehlgeschlagen")
     & P ("backup.backup_stale", "Sicherung veraltet")
     & P ("incident.incident_investigating", "Vorfall wird untersucht")
     & P ("incident.incident_identified", "Vorfall identifiziert")
     & P ("incident.incident_mitigated", "Vorfall eingedämmt")
     & P ("incident.incident_resolved", "Vorfall behoben")
     & P ("release.release_drafting", "Release in Vorbereitung")
     & P ("release.release_ready", "Release bereit")
     & P ("release.release_published", "Release veröffentlicht")
     & P ("release.release_rolled_back", "Release zurückgenommen")
     & P ("audit.audit_created", "Audit-Eintrag erstellt")
     & P ("audit.audit_updated", "Audit-Eintrag aktualisiert")
     & P ("audit.audit_deleted", "Audit-Eintrag gelöscht")
     & P ("audit.audit_restored", "Audit-Eintrag wiederhergestellt")
     & P ("feature_flag.flag_enabled", "Feature-Flag aktiviert")
     & P ("feature_flag.flag_disabled", "Feature-Flag deaktiviert")
     & P ("feature_flag.flag_rolling_out", "Feature-Flag wird ausgerollt")
     & P ("feature_flag.flag_rolled_back", "Feature-Flag zurückgenommen")
     & P ("webhook.webhook_pending", "Webhook ausstehend")
     & P ("webhook.webhook_delivered", "Webhook zugestellt")
     & P ("webhook.webhook_failed", "Webhook fehlgeschlagen")
     & P ("webhook.webhook_retrying", "Webhook wird erneut versucht")
     & P ("api_key.api_key_active", "API-Schlüssel aktiv")
     & P ("api_key.api_key_revoked", "API-Schlüssel widerrufen")
     & P ("api_key.api_key_expired", "API-Schlüssel abgelaufen")
     & P ("api_key.api_key_rotated", "API-Schlüssel rotiert")
     & P ("quota.quota_available", "Kontingent verfügbar")
     & P ("quota.quota_near_limit", "Kontingent fast ausgeschöpft")
     & P ("quota.quota_exceeded", "Kontingent überschritten")
     & P ("quota.quota_reset", "Kontingent zurückgesetzt")
     & P ("invoice.invoice_draft", "Rechnungsentwurf")
     & P ("invoice.invoice_sent", "Rechnung versendet")
     & P ("invoice.invoice_paid", "Rechnung bezahlt")
     & P ("invoice.invoice_refunded", "Rechnung erstattet")
     & P ("invoice.invoice_overdue", "Rechnung überfällig")
     & P ("invoice.refund_failed", "Erstattung fehlgeschlagen")
     & P ("page_navigation.only", "einzige Seite")
     & P ("page_navigation.first", "erste Seite, nächste verfügbar")
     & P ("page_navigation.last", "letzte Seite, vorherige verfügbar")
     & P ("page_navigation.middle", "vorherige und nächste verfügbar")
     & P ("end_of_week", "Ende der Woche")
     & P ("end_of_month", "Ende des Monats")
     & P ("end_of_quarter", "Ende des Quartals")
     & P ("time_of_day.night", "Nacht")
     & P ("time_of_day.morning", "Morgen")
     & P ("time_of_day.afternoon", "Nachmittag")
     & P ("time_of_day.evening", "Abend");
end Locale_De;
