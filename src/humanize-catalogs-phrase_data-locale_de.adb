separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_De (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "de", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
begin
   P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none", "keine passenden {other}");
   P ("filtered_count.all", "alle {total} {total, plural, one {{one}} other {{other}}} passen");
   P ("filtered_count.some",
      "{matching} von {total} {total, plural, one {{one}} other {{other}}} "
      & "passen");
   P ("more_count", "{visible} angezeigt, +{remaining} weitere");
   P ("others_count",
      "{first} und {remaining, plural, one {1 weiterer} other {{remaining} "
      & "weitere}}");
   P ("page_count", "Seite {page} von {total}");
   P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} pro Seite");
   P ("pagination_range",
      "{first}–{last} von {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("position_count", "{position} von {total}");
   P ("selection_count",
      "{selected} von {total} {total, plural, one {{one}} other {{other}}} "
      & "ausgewählt");
   P ("showing_count",
      "{showing} von {total} {total, plural, one {{one}} other {{other}}} "
      & "angezeigt");
   P ("validation_count",
      "{count, plural, =0 {keine {severity, select, error {Fehler} warning "
      & "{Warnungen} other {Hinweise}}} one {1 {severity, select, error "
      & "{Fehler} warning {Warnung} other {Hinweis}}} other {{count} {severity, "
      & "select, error {Fehler} warning {Warnungen} other {Hinweise}}}}");
   P ("collection.empty", "keine {other}");
   P ("collection.none_shown", "keine {other} angezeigt");
   P ("collection.showing_hidden",
      "{visible} von {total} {total, plural, one {{one}} other {{other}}} "
      & "angezeigt, {hidden} ausgeblendet");
   P ("collection.showing",
      "{visible} von {total} {total, plural, one {{one}} other {{other}}} "
      & "angezeigt");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} other {{other}}} angezeigt, "
      & "{hidden} ausgeblendet");
   P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} angezeigt");
   P ("collection.visible_out_of",
      "{visible} von {total} {total, plural, one {{one}} other {{other}}} "
      & "sichtbar");
   P ("complete_count", "{done} von {total} abgeschlossen");
   P ("percent_complete", "{percent} % abgeschlossen");
   P ("step_count", "Schritt {step} von {total}");
   P ("attempt_count", "Versuch {attempt} von {total}");
   P ("throughput_remaining",
      "noch {remaining} {remaining, plural, one {{one}} other {{other}}} bei "
      & "{rate} {unit}/s");
   P ("accessible_progress", "{done} von {total} abgeschlossen, {percent} Prozent");
   P ("business_days", "{days} {days, plural, one {Werktag} other {Werktage}}");
   P ("working_hours", "{hours} {hours, plural, one {Arbeitsstunde} other {Arbeitsstunden}}");
   P ("due.overdue", "seit {days} {days, plural, one {Tag} other {Tagen}} überfällig");
   P ("due.today", "heute fällig");
   P ("due.tomorrow", "morgen fällig");
   P ("due.in", "fällig in {days} Tagen");
   P ("calendar_difference.future", "in {difference}");
   P ("calendar_difference.past", "vor {difference}");
   P ("calendar_difference.same_day", "am selben Tag");
   P ("calendar_difference.zero", "0 Tage");
   P ("cpu_load", "CPU-Last {measure}");
   P ("battery", "Akku {measure}");
   P ("screen_size", "Bildschirm {measure}");
   P ("refresh_rate", "Bildwiederholrate {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} Prozent");
   P ("recurrence.second", "{every, plural, one {jede Sekunde} other {alle {every} Sekunden}}");
   P ("recurrence.minute", "{every, plural, one {jede Minute} other {alle {every} Minuten}}");
   P ("recurrence.hour", "{every, plural, one {jede Stunde} other {alle {every} Stunden}}");
   P ("recurrence.day", "{every, plural, one {jeden Tag} other {alle {every} Tage}}");
   P ("recurrence.week", "{every, plural, one {jede Woche} other {alle {every} Wochen}}");
   P ("recurrence.month", "{every, plural, one {jeden Monat} other {alle {every} Monate}}");
   P ("recurrence.quarter", "{every, plural, one {jedes Quartal} other {alle {every} Quartale}}");
   P ("recurrence.year", "{every, plural, one {jedes Jahr} other {alle {every} Jahre}}");
   P ("cache_summary.empty", "Cache: keine Anfragen");
   P ("cache_summary",
      "Cache: {hits} Treffer, {misses} {misses, plural, one {Fehlzugriff} "
      & "other {Fehlzugriffe}}, {rate} % Trefferquote");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
      & "geändert, {added} hinzugefügt, {removed} entfernt");
   P ("field_diff", "{field} von {before} in {after} geändert");
   P ("field_added", "{field} als {value} hinzugefügt");
   P ("field_removed", "{field} entfernt (war {value})");
   P ("field_unchanged", "{field} unverändert bei {value}");
   P ("number_comparison.equal", "{current} ist gleich {baseline}");
   P ("number_comparison.higher", "{current} ist {quantity} höher als {baseline}");
   P ("number_comparison.lower", "{current} ist {quantity} niedriger als {baseline}");
   P ("percent_comparison.equal", "{current} ist gleich {baseline}");
   P ("percent_comparison.higher", "{current} ist {quantity} höher als {baseline}");
   P ("percent_comparison.lower", "{current} ist {quantity} niedriger als {baseline}");
   P ("file_size_comparison.same", "{current} ist genauso groß wie {baseline}");
   P ("file_size_comparison.larger", "{current} ist {quantity} größer als {baseline}");
   P ("file_size_comparison.smaller", "{current} ist {quantity} kleiner als {baseline}");
   P ("date_comparison.same", "{current} ist dasselbe Datum wie {baseline}");
   P ("date_comparison.after", "{current} liegt {quantity} nach {baseline}");
   P ("date_comparison.before", "{current} liegt {quantity} vor {baseline}");
   P ("queue_summary", "Warteschlange: {details}");
   P ("queue_summary.empty", "Warteschlange leer");
   P ("domain_summary",
      "{domain, select, queue {Warteschlange} job {Job} run {Lauf} cache "
      & "{Cache} sync {Synchronisierung} import {Import} export {Export} other "
      & "{{domain}}} {state, select, queued {eingereiht} running {läuft} "
      & "waiting {wartet} paused {pausiert} complete {abgeschlossen} failed "
      & "{fehlgeschlagen} stale {veraltet} skipped {übersprungen} other "
      & "{{state}}}: {details}");
   P ("summary.none", "keine {other}");
   P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} abgeschlossen");
   P ("summary.completed_of",
      "{count} von {total} {total, plural, one {{one}} other {{other}}} "
      & "abgeschlossen");
   P ("summary.failed", "{count} fehlgeschlagen");
   P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} eingereiht");
   P ("summary.running", "{count, plural, one {{count} läuft} other {{count} laufen}}");
   P ("summary.complete", "{count} abgeschlossen");
   P ("backup.backup_running", "Sicherung läuft");
   P ("backup.backup_completed", "Sicherung abgeschlossen");
   P ("backup.backup_failed", "Sicherung fehlgeschlagen");
   P ("backup.backup_stale", "Sicherung veraltet");
   P ("incident.incident_investigating", "Vorfall wird untersucht");
   P ("incident.incident_identified", "Vorfall identifiziert");
   P ("incident.incident_mitigated", "Vorfall eingedämmt");
   P ("incident.incident_resolved", "Vorfall behoben");
   P ("release.release_drafting", "Release in Vorbereitung");
   P ("release.release_ready", "Release bereit");
   P ("release.release_published", "Release veröffentlicht");
   P ("release.release_rolled_back", "Release zurückgenommen");
   P ("audit.audit_created", "Audit-Eintrag erstellt");
   P ("audit.audit_updated", "Audit-Eintrag aktualisiert");
   P ("audit.audit_deleted", "Audit-Eintrag gelöscht");
   P ("audit.audit_restored", "Audit-Eintrag wiederhergestellt");
   P ("flag.flag_enabled", "Feature-Flag aktiviert");
   P ("flag.flag_disabled", "Feature-Flag deaktiviert");
   P ("flag.flag_rolling_out", "Feature-Flag wird ausgerollt");
   P ("flag.flag_rolled_back", "Feature-Flag zurückgenommen");
   P ("webhook.webhook_pending", "Webhook ausstehend");
   P ("webhook.webhook_delivered", "Webhook zugestellt");
   P ("webhook.webhook_failed", "Webhook fehlgeschlagen");
   P ("webhook.webhook_retrying", "Webhook wird erneut versucht");
   P ("api_key.api_key_active", "API-Schlüssel aktiv");
   P ("api_key.api_key_revoked", "API-Schlüssel widerrufen");
   P ("api_key.api_key_expired", "API-Schlüssel abgelaufen");
   P ("api_key.api_key_rotated", "API-Schlüssel rotiert");
   P ("quota.quota_available", "Kontingent verfügbar");
   P ("quota.quota_near_limit", "Kontingent fast ausgeschöpft");
   P ("quota.quota_exceeded", "Kontingent überschritten");
   P ("quota.quota_reset", "Kontingent zurückgesetzt");
   P ("invoice.invoice_draft", "Rechnungsentwurf");
   P ("invoice.invoice_sent", "Rechnung versendet");
   P ("invoice.invoice_paid", "Rechnung bezahlt");
   P ("invoice.invoice_refunded", "Rechnung erstattet");
   P ("invoice.invoice_overdue", "Rechnung überfällig");
   P ("invoice.refund_failed", "Erstattung fehlgeschlagen");
   P ("page_navigation.only", "einzige Seite");
   P ("page_navigation.first", "erste Seite, nächste verfügbar");
   P ("page_navigation.last", "letzte Seite, vorherige verfügbar");
   P ("page_navigation.middle", "vorherige und nächste verfügbar");
   P ("end_of_week", "Ende der Woche");
   P ("end_of_month", "Ende des Monats");
   P ("end_of_quarter", "Ende des Quartals");
   P ("time_of_day.night", "Nacht");
   P ("time_of_day.morning", "Morgen");
   P ("time_of_day.afternoon", "Nachmittag");
   P ("time_of_day.evening", "Abend");
   P ("access.allowed", "erlaubt");
   P ("access.denied", "verweigert");
   P ("access.owner", "Besitzer");
   P ("access.admin", "Administrator");
   P ("access.viewer", "Betrachter");
   P ("access.editor", "Bearbeiter");
   P ("auth.signed_in", "angemeldet");
   P ("auth.signed_out", "abgemeldet");
   P ("auth.session_expired", "Sitzung abgelaufen");
   P ("auth.locked", "gesperrt");
   P ("auth.two_factor_required", "Zwei-Faktor-Authentifizierung erforderlich");
   P ("billing.trialing", "Testphase");
   P ("billing.payment_due", "Zahlung fällig");
   P ("billing.payment_failed", "Zahlung fehlgeschlagen");
   P ("billing.paid", "bezahlt");
   P ("billing.past_due", "überfällig");
   P ("billing.canceled", "gekündigt");
   P ("ci.pipeline_pending", "Pipeline ausstehend");
   P ("ci.pipeline_running", "Pipeline läuft");
   P ("ci.pipeline_passed", "Pipeline erfolgreich");
   P ("ci.pipeline_failed", "Pipeline fehlgeschlagen");
   P ("ci.review_required", "Review erforderlich");
   P ("ci.deploy_blocked", "Deployment blockiert");
   P ("collaboration.active_now", "jetzt aktiv");
   P ("collaboration.away", "abwesend");
   P ("collaboration.do_not_disturb", "nicht stören");
   P ("collaboration.typing", "schreibt");
   P ("collaboration.viewing", "betrachtet");
   P ("collaboration.editing", "bearbeitet");
   P ("deployment.deploying", "wird bereitgestellt");
   P ("deployment.deployed", "bereitgestellt");
   P ("deployment.rolling_back", "wird zurückgesetzt");
   P ("deployment.rolled_back", "zurückgesetzt");
   P ("deployment.build_failed", "Build fehlgeschlagen");
   P ("deployment.checks_passed", "Prüfungen bestanden");
   P ("empty.no_items", "keine Elemente");
   P ("empty.no_results", "keine Ergebnisse");
   P ("empty.no_messages", "keine Nachrichten");
   P ("empty.no_selection", "keine Auswahl");
   P ("empty.nothing_to_show", "nichts anzuzeigen");
   P ("file.uploading", "wird hochgeladen");
   P ("file.downloading", "wird heruntergeladen");
   P ("file.copying", "wird kopiert");
   P ("file.moving", "wird verschoben");
   P ("file.deleting", "wird gelöscht");
   P ("file.deleted", "gelöscht");
   P ("file.restoring", "wird wiederhergestellt");
   P ("file.synced", "synchronisiert");
   P ("form.valid_input", "gültige Eingabe");
   P ("form.invalid_input", "ungültige Eingabe");
   P ("form.dirty", "geändert");
   P ("form.pristine", "unverändert");
   P ("form.submitted", "gesendet");
   P ("form.submission_failed", "Senden fehlgeschlagen");
   P ("health.healthy", "fehlerfrei");
   P ("health.degraded", "beeinträchtigt");
   P ("health.unhealthy", "gestört");
   P ("health.incident", "Störung");
   P ("health.maintenance", "Wartung");
   P ("health.recovering", "wird wiederhergestellt");
   P ("issue.open", "offen");
   P ("issue.closed", "geschlossen");
   P ("issue.reopened", "wieder geöffnet");
   P ("issue.assigned", "zugewiesen");
   P ("issue.unassigned", "nicht zugewiesen");
   P ("issue.merged", "zusammengeführt");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "wird verbunden");
   P ("network.syncing", "wird synchronisiert");
   P ("network.sync_failed", "Synchronisierung fehlgeschlagen");
   P ("network.permission_denied", "Zugriff verweigert");
   P ("network.read_only", "schreibgeschützt");
   P ("notification.unread", "ungelesen");
   P ("notification.read", "gelesen");
   P ("notification.muted", "stummgeschaltet");
   P ("notification.snoozed", "zurückgestellt");
   P ("notification.sent", "gesendet");
   P ("notification.delivered", "zugestellt");
   P ("payment.payment_authorized", "Zahlung autorisiert");
   P ("payment.payment_captured", "Zahlung eingezogen");
   P ("payment.payment_refunded", "Zahlung erstattet");
   P ("payment.payment_disputed", "Zahlung angefochten");
   P ("payment.payment_requires_action", "Zahlung erfordert eine Aktion");
   P ("payment.payment_expired", "Zahlung abgelaufen");
   P ("ui.empty", "leer");
   P ("ui.loading", "wird geladen");
   P ("ui.saving", "wird gespeichert");
   P ("ui.saved", "gespeichert");
   P ("ui.unsaved", "nicht gespeichert");
   P ("ui.retrying", "neuer Versuch");
   P ("ui.paused", "pausiert");
   P ("ui.complete", "abgeschlossen");
   P ("ui.failed", "fehlgeschlagen");
   P ("ui.due_soon", "bald fällig");
   P ("ui.overdue", "überfällig");
   P ("ui.last_seen", "zuletzt gesehen");
   P ("ui.updated_just_now", "gerade aktualisiert");
   P ("queue.queued", "eingereiht");
   P ("queue.running", "läuft");
   P ("queue.waiting", "wartet");
   P ("queue.blocked", "blockiert");
   P ("queue.canceled_job", "Job abgebrochen");
   P ("queue.completed_job", "Job abgeschlossen");
   P ("search.filtering", "wird gefiltert");
   P ("search.filtered", "gefiltert");
   P ("search.no_matches", "keine Treffer");
   P ("search.search_ready", "Suche bereit");
   P ("search.search_failed", "Suche fehlgeschlagen");
   P ("search.query_too_short", "Suchbegriff zu kurz");
   P ("security.secure", "sicher");
   P ("security.insecure", "unsicher");
   P ("security.vulnerable", "angreifbar");
   P ("security.encrypted", "verschlüsselt");
   P ("security.unencrypted", "unverschlüsselt");
   P ("security.token_expired", "Token abgelaufen");
   P ("sync.sync_idle", "Synchronisierung inaktiv");
   P ("sync.syncing_now", "wird synchronisiert");
   P ("sync.sync_queued", "Synchronisierung eingereiht");
   P ("sync.sync_conflict", "Synchronisierungskonflikt");
   P ("sync.sync_complete", "Synchronisierung abgeschlossen");
   P ("sync.sync_error", "Synchronisierungsfehler");
   P ("task.todo", "zu erledigen");
   P ("task.in_progress", "in Bearbeitung");
   P ("task.done", "erledigt");
   P ("task.skipped", "übersprungen");
   P ("task.blocked_task", "blockiert");
   P ("task.waiting_on", "wartet auf");
   P ("ticket.ticket_new", "Ticket neu");
   P ("ticket.ticket_open", "Ticket offen");
   P ("ticket.ticket_waiting", "Ticket wartet");
   P ("ticket.ticket_escalated", "Ticket eskaliert");
   P ("ticket.ticket_resolved", "Ticket gelöst");
   P ("ticket.ticket_closed", "Ticket geschlossen");
   P ("transfer.importing", "wird importiert");
   P ("transfer.imported", "importiert");
   P ("transfer.import_failed", "Import fehlgeschlagen");
   P ("transfer.exporting", "wird exportiert");
   P ("transfer.exported", "exportiert");
   P ("transfer.export_failed", "Export fehlgeschlagen");
   P ("validation.required", "erforderlich");
   P ("validation.optional", "optional");
   P ("validation.invalid", "ungültig");
   P ("validation.too_short", "zu kurz");
   P ("validation.too_long", "zu lang");
   P ("validation.out_of_range", "außerhalb des zulässigen Bereichs");
   P ("validation.already_exists", "existiert bereits");
   P ("workflow.draft", "Entwurf");
   P ("workflow.in_review", "in Prüfung");
   P ("workflow.approved", "genehmigt");
   P ("workflow.rejected", "abgelehnt");
   P ("workflow.published", "veröffentlicht");
   P ("workflow.archived", "archiviert");
   P ("database.database_online", "Datenbank online");
   P ("database.database_offline", "Datenbank offline");
   P ("database.database_degraded", "Datenbank beeinträchtigt");
   P ("database.database_migrating", "Datenbank wird migriert");
   P ("database.database_migration_failed", "Datenbankmigration fehlgeschlagen");
   P ("database.database_replicating", "Datenbank wird repliziert");
   P ("database.database_replication_lagging", "Datenbankreplikation verzögert");
   P ("database.database_backup_running", "Datenbanksicherung läuft");
   P ("database.database_backup_failed", "Datenbanksicherung fehlgeschlagen");
   P ("calendar_difference.case.future", "dative");
   P ("calendar_difference.case.past", "dative");
   P ("times_noun",
      "{count, plural, =0 {nie {other}} =1 {einmal {one}} =2 {zweimal "
      & "{other}} other {{count}-mal {other}}}");
   P ("availability.all",
      "{available} von {total} {total, plural, one {{one}} other {{other}}} "
      & "verfügbar");
   P ("availability.none", "keine {other} verfügbar");
   P ("availability.partial",
      "{available} von {total} {total, plural, one {{one}} other {{other}}} "
      & "verfügbar, {unavailable} nicht verfügbar");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "eingereiht");
   P ("operation.running", "läuft");
   P ("operation.blocked", "blockiert");
   P ("operation.retrying", "neuer Versuch");
   P ("operation.succeeded", "erfolgreich");
   P ("operation.partially_succeeded", "teilweise erfolgreich");
   P ("operation.failed", "fehlgeschlagen");
   P ("operation.canceled", "abgebrochen");
   P ("operation.skipped", "übersprungen");
   P ("operation.stale", "veraltet");
   P ("operation.unknown_state", "unbekannt");
   P ("operation.last_success", "{name} zuletzt erfolgreich: {time}");
   P ("operation.next_retry", "{name} nächster Versuch: {time}");
   P ("operation.stale_run", "{name} {time} lang veraltet");
   P ("summary.skipped", "{count} übersprungen");
   P ("summary.retried", "{count} wiederholt");
   P ("summary.canceled", "{count} abgebrochen");
   P ("system.service.operational", "betriebsbereit");
   P ("system.service.degraded", "eingeschränkte Leistung");
   P ("system.service.partial_outage", "teilweiser Ausfall");
   P ("system.service.major_outage", "schwerer Ausfall");
   P ("system.service.maintenance", "in Wartung");
   P ("system.service.unknown", "Dienststatus unbekannt");
   P ("system.health.healthy", "fehlerfrei");
   P ("system.health.warning", "Warnung");
   P ("system.health.critical", "kritisch");
   P ("system.health.unavailable", "nicht verfügbar");
   P ("system.health.unknown_health", "Zustand unbekannt");
   P ("system.readiness.ready", "bereit");
   P ("system.readiness.not_ready", "nicht bereit");
   P ("system.readiness.starting", "wird gestartet");
   P ("system.readiness.draining", "wird geleert");
   P ("system.readiness.stopped", "gestoppt");
   P ("system.readiness.unknown_readiness", "Bereitschaft unbekannt");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "wird gestartet");
   P ("system.component.stopping", "wird beendet");
   P ("system.component.restarting", "wird neu gestartet");
   P ("system.component.unknown", "Komponentenstatus unbekannt");
   P ("system.check.passing", "bestanden");
   P ("system.check.failing", "fehlgeschlagen");
   P ("system.check.warning", "Warnung");
   P ("system.check.skipped", "übersprungen");
   P ("system.check.timed_out", "Zeitüberschreitung");
   P ("system.check.unknown", "Prüfstatus unbekannt");
   P ("system.incident.investigating", "wird untersucht");
   P ("system.incident.identified", "identifiziert");
   P ("system.incident.monitoring", "wird beobachtet");
   P ("system.incident.resolved", "behoben");
   P ("system.incident.scheduled_maintenance", "geplante Wartung");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "Prüfung {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {keine Komponenten} one {{count} Komponente} other "
      & "{{count} Komponenten}}");
   P ("system.count.checks",
      "{count, plural, =0 {keine Prüfungen} one {{count} Prüfung} other "
      & "{{count} Prüfungen}}");
   P ("system.count.incidents",
      "{count, plural, =0 {keine Vorfälle} one {{count} Vorfall} other "
      & "{{count} Vorfälle}}");
   P ("system.uptime", "Verfügbarkeit {measure}");
   P ("system.latency", "Latenz {measure}");
   P ("system.maintenance_window", "Wartungsfenster {time}");
   P ("system.last_checked", "zuletzt geprüft {time}");
   P ("system.http.informational", "informativ");
   P ("system.http.successful", "erfolgreich");
   P ("system.http.redirection", "Umleitung");
   P ("system.http.client_error", "Client-Fehler");
   P ("system.http.server_error", "Server-Fehler");
   P ("system.exit.success", "Exit-Code {code}: Erfolg");
   P ("system.exit.failure", "Exit-Code {code}: Fehler");
   P ("system.exit.usage_error", "Exit-Code {code}: falscher Aufruf");
   P ("system.exit.not_executable", "Exit-Code {code}: Befehl nicht ausführbar");
   P ("system.exit.not_found", "Exit-Code {code}: Befehl nicht gefunden");
   P ("system.exit.invalid_argument", "Exit-Code {code}: ungültiges Exit-Argument");
   P ("system.exit.signal", "Exit-Code {code}: beendet durch {signal}");
   P ("validation.problem.required", "{field}: ist erforderlich");
   P ("validation.problem.minimum", "{field}: liegt unter dem Minimum");
   P ("validation.problem.maximum", "{field}: liegt über dem Maximum");
   P ("validation.problem.range", "{field}: liegt außerhalb des zulässigen Bereichs");
   P ("validation.problem.pattern", "{field}: entspricht nicht dem Muster");
   P ("validation.problem.choice", "{field}: muss einer der zulässigen Werte sein");
   P ("validation.problem.dependency", "{field}: hängt von einem anderen Feld ab");
   P ("validation.problem.custom", "{field}: ist ungültig");
   P ("validation.constraint.no_relation", "{field}: muss gültig sein ({value})");
   P ("validation.constraint.less_than", "{field}: muss kleiner als {value} sein");
   P ("validation.constraint.less_or_equal", "{field}: darf höchstens {value} sein");
   P ("validation.constraint.greater_than", "{field}: muss größer als {value} sein");
   P ("validation.constraint.greater_or_equal", "{field}: muss mindestens {value} sein");
   P ("validation.constraint.equal_to", "{field}: muss gleich {value} sein");
   P ("validation.constraint.not_equal_to", "{field}: darf nicht gleich {value} sein");
   P ("validation.constraint.before_field", "{field}: muss vor {value} liegen");
   P ("validation.constraint.after_field", "{field}: muss nach {value} liegen");
   P ("validation.choices", "{field}: zulässige Werte sind {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, Eingabe: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, neuer Versuch in {time}");
   P ("net_diagnostic.dns", "{endpoint}: DNS-Auflösung fehlgeschlagen");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-Verbindung fehlgeschlagen");
   P ("net_diagnostic.tls", "{endpoint}: TLS-Zertifikatsprüfung fehlgeschlagen");
   P ("net_diagnostic.http", "{endpoint}: HTTP-Anfrage fehlgeschlagen");
   P ("net_diagnostic.proxy", "{endpoint}: Proxy-Fehler");
   P ("net_diagnostic.timeout", "{endpoint}: Zeitüberschreitung");
   P ("net_diagnostic.reset", "{endpoint}: Verbindung zurückgesetzt");
   P ("net_diagnostic.unknown_network", "{endpoint}: unbekannter Netzwerkfehler");
   P ("progress.state.not_started", "nicht gestartet");
   P ("progress.state.running", "läuft");
   P ("progress.state.stalled", "stockt");
   P ("progress.state.retrying", "neuer Versuch");
   P ("progress.state.complete", "abgeschlossen");
   P ("progress.state.failed", "fehlgeschlagen");
   P ("progress.of", "{subject}: {done} von {total} abgeschlossen ({percent} %), {state}");
   P ("progress.done", "{subject}: {done} abgeschlossen, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {Element} other {Elemente}}, "
      & "{unique} {unique, plural, one {eindeutiger Wert} other {eindeutige "
      & "Werte}}, {duplicates} {duplicates, plural, one {Duplikat} other "
      & "{Duplikate}}, {outliers} {outliers, plural, one {Ausreißer} other "
      & "{Ausreißer}}");
   P ("top_frequency", "{name}: {value} ({count}-mal)");
   P ("calendar_date.fiscal_year", "GJ {year}");
   P ("calendar_date.fiscal_quarter", "GJ {year} Q{part}");
   P ("calendar_date.fiscal_half", "GJ {year} H{part}");
   P ("calendar_date.fiscal_year_end", "Ende GJ {year}");
   P ("calendar_date.semester", "{part}. Sem. {year}");
   P ("calendar_date.half_year", "{part}. Hj. {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {erstes Halbjahr {year}} other {zweites Halbjahr "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {Anfang {text}} mid {Mitte {text}} other {Ende "
      & "{text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {Anfang {text}} mid {Mitte {text}} other {Ende "
      & "{text}}}");
   P ("calendar_range.weekend.last", "letztes Wochenende");
   P ("calendar_range.weekend.this", "dieses Wochenende");
   P ("calendar_range.weekend.next", "nächstes Wochenende");
   P ("calendar_range.weekend_of", "Wochenende vom {date}");
   P ("calendar_range.week.last", "letzte Woche");
   P ("calendar_range.week.this", "diese Woche");
   P ("calendar_range.week.next", "nächste Woche");
   P ("calendar_range.week_of", "Woche vom {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "fortfahren");
   P ("http.reason.101", "Protokollwechsel");
   P ("http.reason.102", "wird verarbeitet");
   P ("http.reason.103", "frühe Hinweise");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "erstellt");
   P ("http.reason.202", "akzeptiert");
   P ("http.reason.203", "nicht maßgebliche Information");
   P ("http.reason.204", "kein Inhalt");
   P ("http.reason.205", "Inhalt zurücksetzen");
   P ("http.reason.206", "Teilinhalt");
   P ("http.reason.207", "Multi-Status");
   P ("http.reason.208", "bereits gemeldet");
   P ("http.reason.226", "IM angewendet");
   P ("http.reason.300", "mehrere Auswahlmöglichkeiten");
   P ("http.reason.301", "dauerhaft verschoben");
   P ("http.reason.302", "gefunden");
   P ("http.reason.303", "siehe andere Ressource");
   P ("http.reason.304", "nicht geändert");
   P ("http.reason.305", "Proxy verwenden");
   P ("http.reason.307", "temporäre Umleitung");
   P ("http.reason.308", "permanente Umleitung");
   P ("http.reason.400", "ungültige Anfrage");
   P ("http.reason.401", "nicht autorisiert");
   P ("http.reason.402", "Zahlung erforderlich");
   P ("http.reason.403", "verboten");
   P ("http.reason.404", "nicht gefunden");
   P ("http.reason.405", "Methode nicht erlaubt");
   P ("http.reason.406", "nicht annehmbar");
   P ("http.reason.407", "Proxy-Authentifizierung erforderlich");
   P ("http.reason.408", "Zeitüberschreitung der Anfrage");
   P ("http.reason.409", "Konflikt");
   P ("http.reason.410", "nicht mehr verfügbar");
   P ("http.reason.411", "Länge erforderlich");
   P ("http.reason.412", "Vorbedingung fehlgeschlagen");
   P ("http.reason.413", "Inhalt zu groß");
   P ("http.reason.414", "URI zu lang");
   P ("http.reason.415", "nicht unterstützter Medientyp");
   P ("http.reason.416", "Bereich nicht erfüllbar");
   P ("http.reason.417", "Erwartung fehlgeschlagen");
   P ("http.reason.418", "ich bin eine Teekanne");
   P ("http.reason.421", "fehlgeleitete Anfrage");
   P ("http.reason.422", "nicht verarbeitbarer Inhalt");
   P ("http.reason.423", "gesperrt");
   P ("http.reason.424", "fehlgeschlagene Abhängigkeit");
   P ("http.reason.425", "zu früh");
   P ("http.reason.426", "Upgrade erforderlich");
   P ("http.reason.428", "Vorbedingung erforderlich");
   P ("http.reason.429", "zu viele Anfragen");
   P ("http.reason.431", "Header-Felder der Anfrage zu groß");
   P ("http.reason.451", "aus rechtlichen Gründen nicht verfügbar");
   P ("http.reason.500", "interner Serverfehler");
   P ("http.reason.501", "nicht implementiert");
   P ("http.reason.502", "ungültiges Gateway");
   P ("http.reason.503", "Dienst nicht verfügbar");
   P ("http.reason.504", "Gateway-Zeitüberschreitung");
   P ("http.reason.505", "HTTP-Version nicht unterstützt");
   P ("http.reason.506", "Variante verhandelt ebenfalls");
   P ("http.reason.507", "unzureichender Speicherplatz");
   P ("http.reason.508", "Schleife erkannt");
   P ("http.reason.510", "nicht erweitert");
   P ("http.reason.511", "Netzwerkauthentifizierung erforderlich");
   P ("errno.reason.0", "Erfolg");
   P ("errno.reason.1", "Die Operation ist nicht erlaubt");
   P ("errno.reason.2", "Datei oder Verzeichnis nicht gefunden");
   P ("errno.reason.3", "kein passender Prozess gefunden");
   P ("errno.reason.4", "Unterbrechung während des Betriebssystemaufrufs");
   P ("errno.reason.5", "Eingabe-/Ausgabefehler");
   P ("errno.reason.6", "kein passendes Gerät bzw. keine passende Adresse gefunden");
   P ("errno.reason.9", "ungültiger Dateideskriptor");
   P ("errno.reason.11", "Die Ressource ist zur Zeit nicht verfügbar");
   P ("errno.reason.12", "nicht genügend Hauptspeicher verfügbar");
   P ("errno.reason.13", "Keine Berechtigung");
   P ("errno.reason.17", "Die Datei existiert bereits");
   P ("errno.reason.20", "ist kein Verzeichnis");
   P ("errno.reason.21", "ist ein Verzeichnis");
   P ("errno.reason.22", "das Argument ist ungültig");
   P ("errno.reason.24", "zu viele offene Dateien");
   P ("errno.reason.28", "auf dem Gerät ist kein Speicherplatz mehr verfügbar");
   P ("errno.reason.32", "Datenübergabe unterbrochen (broken pipe)");
   P ("errno.reason.98", "Die Adresse wird bereits verwendet");
   P ("errno.reason.110", "Die Wartezeit für die Verbindung ist abgelaufen");
   P ("errno.reason.111", "Verbindungsaufbau abgelehnt");
   P ("signal.reason.1", "aufgelegt");
   P ("signal.reason.2", "Unterbrechung");
   P ("signal.reason.3", "Verlassen");
   P ("signal.reason.4", "ungültiger Maschinenbefehl");
   P ("signal.reason.5", "Trace/Breakpoint ausgelöst");
   P ("signal.reason.6", "abgebrochen");
   P ("signal.reason.7", "Bus-Zugriffsfehler");
   P ("signal.reason.8", "Gleitkomma-Ausnahme");
   P ("signal.reason.9", "getötet");
   P ("signal.reason.10", "benutzerdefiniertes Signal 1");
   P ("signal.reason.11", "Speicherzugriffsfehler");
   P ("signal.reason.12", "benutzerdefiniertes Signal 2");
   P ("signal.reason.13", "Datenübergabe unterbrochen (broken pipe)");
   P ("signal.reason.14", "Das Signal SIGALRM empfangen (Der Wecker klingelt)");
   P ("signal.reason.15", "Beendet");
   P ("signal.reason.17", "Der Kind-Prozess ist beendet");
   P ("signal.reason.18", "fortgesetzt");
   P ("signal.reason.19", "angehalten (Signal)");
   P ("signal.reason.20", "angehalten");
   P ("signal.reason.28", "Die Fenstergröße wurde verändert");
   P ("sqlstate.reason.00", "erfolgreicher Abschluss");
   P ("sqlstate.reason.01", "Warnung");
   P ("sqlstate.reason.02", "keine Daten");
   P ("sqlstate.reason.08", "Verbindungsfehler");
   P ("sqlstate.reason.0a", "Funktion nicht unterstützt");
   P ("sqlstate.reason.22", "Datenfehler");
   P ("sqlstate.reason.23", "Verletzung einer Integritätsbedingung");
   P ("sqlstate.reason.24", "ungültiger Cursorstatus");
   P ("sqlstate.reason.25", "ungültiger Transaktionsstatus");
   P ("sqlstate.reason.28", "ungültige Autorisierungsangabe");
   P ("sqlstate.reason.2d", "ungültige Transaktionsbeendigung");
   P ("sqlstate.reason.3d", "ungültiger Katalogname");
   P ("sqlstate.reason.3f", "ungültiger Schemaname");
   P ("sqlstate.reason.40", "Transaktions-Rollback");
   P ("sqlstate.reason.42", "Syntaxfehler oder Verletzung einer Zugriffsregel");
   P ("sqlstate.reason.53", "unzureichende Ressourcen");
   P ("sqlstate.reason.54", "Programmgrenze überschritten");
   P ("sqlstate.reason.55", "Objekt nicht im erforderlichen Zustand");
   P ("sqlstate.reason.57", "Bedienereingriff");
   P ("sqlstate.reason.58", "Systemfehler");
   P ("sqlstate.reason.hv", "Fehler im Foreign Data Wrapper");
   P ("sqlstate.reason.p0", "PL/pgSQL-Fehler");
   P ("sqlstate.reason.xx", "interner Fehler");
   P ("system.signal_numbered", "Signal {number} {name} {reason}");
   P ("http.reason.unknown", "unbekannter Status");
   P ("errno.reason.unknown", "unbekannter Fehler");
   P ("signal.reason.unknown", "unbekanntes Signal");
   P ("sqlstate.reason.unknown", "unbekannte SQLSTATE-Klasse");
   P ("diff.changed", "Diff {path}: geändert von {before} zu {after}");
   P ("diff.added", "Diff {path}: {after} hinzugefügt");
   P ("diff.removed", "Diff {path}: {before} entfernt");
   P ("diff.unchanged", "Diff {path}: unverändert");
   P ("diff.redacted", "Diff {path}: geändert; Werte geschwärzt");
   P ("validation.result",
      "Validierungsergebnis: {fields} {fields, plural, one {Feld} other "
      & "{Felder}}, {errors} {errors, plural, one {Fehler} other {Fehler}}, "
      & "{warnings} {warnings, plural, one {Warnung} other {Warnungen}}, "
      & "{required} {required, plural, one {Pflichtfeld} other "
      & "{Pflichtfelder}}, {hidden} {hidden, plural, one {verborgenes Problem} "
      & "other {verborgene Probleme}}");
   P ("file.kind.plain", "Datei");
   P ("file.kind.directory", "Verzeichnis");
   P ("file.kind.archive", "Archiv");
   P ("file.kind.compressed", "komprimierte Datei");
   P ("file.kind.image", "Bild");
   P ("file.kind.script", "Skript");
   P ("file.kind.executable", "ausführbare Datei");
   P ("file.kind.unknown", "unbekannte Datei");
   P ("file.metadata", "Datei {name}: {kind}");
   P ("file.checksum", "{text}, Prüfsumme {checksum}");
   P ("file.signature_match", "Dateisignatur {name}: {kind}, passt zur Dateiendung");
   P ("file.signature_mismatch",
      "Dateisignatur {name}: laut Dateiendung {expected}, laut Inhalt "
      & "{actual}");
   P ("network_event.connecting", "wird verbunden");
   P ("network_event.connected", "verbunden");
   P ("network_event.redirected", "umgeleitet");
   P ("network_event.retrying", "neuer Versuch");
   P ("network_event.rate_limited", "Ratenlimit erreicht");
   P ("network_event.tls_failed", "TLS fehlgeschlagen");
   P ("network_event.stalled", "ins Stocken geraten");
   P ("network_event.complete", "abgeschlossen");
   P ("network_event.failed", "fehlgeschlagen");
   P ("network.session", "Netzwerk {endpoint}: {state}");
   P ("diff_node.field", "Feld");
   P ("diff_node.object", "Objekt");
   P ("diff_node.list", "Liste");
   P ("diff.node",
      "Diff-Knoten {path}: {kind}, {count} {count, plural, one {Änderung} "
      & "other {Änderungen}}");
   P ("checksum.not_checked", "Prüfsumme nicht geprüft");
   P ("checksum.valid", "Prüfsumme gültig");
   P ("checksum.mismatch", "Prüfsumme stimmt nicht überein");
   P ("checksum.missing", "Prüfsumme fehlt");
   P ("product_code", "Produktcode {kind}: {value}, {state}");
   P ("time_zone.utc", "Zeitzone: UTC");
   P ("time_zone.offset", "Zeitzone: {offset}");
   P ("time_zone.named", "Zeitzone: {name} ({offset})");
   P ("time_zone.local", "Zeitzone: Ortszeit");
   P ("time_zone.unknown", "Zeitzone: unbekannte Zone");
   P ("time_zone.dst", "{text}, mit Sommerzeit");
   P ("zoned_time.plain", "Zonenzeit: {time} {offset}");
   P ("zoned_time.named", "Zonenzeit: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, mehrdeutige Ortszeit");
   P ("number.under", "unter {value}");
   P ("number.up_to", "bis {value}");
   P ("number.between", "zwischen {low} und {high}");
   P ("number.range_words", "{low} bis {high}");
   P ("number.uncertainty_words", "{value} plus/minus {delta}");
   P ("number.range_inclusive", "{low} bis einschließlich {high}");
   P ("number.range_exclusive", "größer als {low} und kleiner als {high}");
   P ("number.range_low_inclusive", "mindestens {low} und kleiner als {high}");
   P ("number.range_high_inclusive", "größer als {low} und höchstens {high}");
   P ("number.at_least", "mindestens {value}");
   P ("number.more_than", "mehr als {value}");
   P ("number.at_most", "höchstens {value}");
   P ("number.less_than", "weniger als {value}");
   P ("number.exactly", "genau {value}");
   P ("number.within", "{value} liegt innerhalb von {bounds}");
   P ("number.below", "{value} liegt unterhalb von {bounds}");
   P ("number.above", "{value} liegt oberhalb von {bounds}");
   P ("number.per", "{numerator} pro {denominator}");
   P ("number.one_in", "1 von {whole}");
   P ("number.out_of", "{value} von {whole}");
   P ("number.unchanged", "unverändert");
   P ("number.change_up", "um {quantity} gestiegen");
   P ("number.change_down", "um {quantity} gesunken");
   P ("number.change_more", "{quantity} {tail} mehr");
   P ("number.change_fewer", "{quantity} {tail} weniger");
   P ("number.since", "{change} seit {since}");
   P ("duration.countdown", "noch {duration}");
   P ("duration.within", "innerhalb von {duration}");
   P ("duration.case.within", "dative");
   P ("duration.next",
      "{count, plural, one {{unit, select, second {in der nächsten Sekunde} "
      & "minute {in der nächsten Minute} hour {in der nächsten Stunde} day "
      & "{am nächsten Tag} week {in der nächsten Woche} month {im nächsten "
      & "Monat} year {im nächsten Jahr} other {in den nächsten {duration}}}} "
      & "other {in den nächsten {duration}}}");
   P ("duration.case.next", "dative");
   P ("duration.between", "zwischen {low} und {high}");
   P ("duration.case.between", "dative");
   P ("duration.age", "{duration} alt");
   P ("duration.case.age", "accusative");
   P ("duration.stale_for", "seit {duration} veraltet");
   P ("duration.case.stale_for", "dative");
   P ("duration.backup_age", "Sicherung ist {duration} alt");
   P ("duration.case.backup_age", "accusative");
   P ("duration.eta", "voraussichtlich noch {duration}");
   P ("duration.expires", "läuft {relative} ab");
   P ("duration.retrying", "neuer Versuch {relative}");
   P ("duration.modified", "geändert {relative}");
   P ("duration.synced", "synchronisiert {relative}");
   P ("duration.modified_now", "gerade eben geändert");
   P ("duration.synced_now", "gerade eben synchronisiert");
   P ("duration.natural.less_than_minute",
      "{case, select, dative {weniger als einer Minute} other {weniger als "
      & "eine Minute}}");
   P ("duration.natural.half_hour", "{case, select, dative {einer halben Stunde} other {eine halbe Stunde}}");
   P ("duration.natural.about_half_hour",
      "{case, select, dative {etwa einer halben Stunde} other {etwa eine "
      & "halbe Stunde}}");
   P ("duration.natural.about", "etwa {duration}");
   P ("duration.natural.almost", "fast {duration}");
   P ("duration.natural.over", "über {duration}");
   P ("duration.natural.just_over", "knapp über {duration}");
   P ("duration.natural.little_under", "knapp unter {duration}");
   P ("duration.natural.few",
      "{unit, select, second {ein paar Sekunden} minute {ein paar Minuten} "
      & "hour {ein paar Stunden} day {{case, select, dative {ein paar Tagen} "
      & "other {ein paar Tage}}} week {ein paar Wochen} month {{case, select, "
      & "dative {ein paar Monaten} other {ein paar Monate}}} year {{case, "
      & "select, dative {ein paar Jahren} other {ein paar Jahre}}} other {ein "
      & "paar}}");
   P ("duration.distance.past", "vor {duration}");
   P ("duration.case.distance.past", "dative");
   P ("duration.distance.future", "in {duration}");
   P ("duration.case.distance.future", "dative");
   P ("geo.direction.north", "{style, select, short {N} other {Nord}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNO} other {Nord-Nordost}}");
   P ("geo.direction.north_east", "{style, select, short {NO} other {Nordost}}");
   P ("geo.direction.east_north_east", "{style, select, short {ONO} other {Ost-Nordost}}");
   P ("geo.direction.east", "{style, select, short {O} other {Ost}}");
   P ("geo.direction.east_south_east", "{style, select, short {OSO} other {Ost-Südost}}");
   P ("geo.direction.south_east", "{style, select, short {SO} other {Südost}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSO} other {Süd-Südost}}");
   P ("geo.direction.south", "{style, select, short {S} other {Süd}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSW} other {Süd-Südwest}}");
   P ("geo.direction.south_west", "{style, select, short {SW} other {Südwest}}");
   P ("geo.direction.west_south_west", "{style, select, short {WSW} other {West-Südwest}}");
   P ("geo.direction.west", "{style, select, short {W} other {West}}");
   P ("geo.direction.west_north_west", "{style, select, short {WNW} other {West-Nordwest}}");
   P ("geo.direction.north_west", "{style, select, short {NW} other {Nordwest}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNW} other {Nord-Nordwest}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} Richtung {direction}");
   P ("geo.about_distance_direction", "etwa {distance} Richtung {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "Südwest {southwest}; Nordost {northeast}");
   P ("geo.inside_box", "innerhalb des Begrenzungsrahmens");
   P ("geo.outside_box", "außerhalb des Begrenzungsrahmens");
   P ("number.about", "etwa {value}");
   P ("number.almost", "fast {value}");
   P ("number.over", "über {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
end Locale_De;
