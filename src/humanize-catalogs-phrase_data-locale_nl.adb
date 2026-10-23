separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Nl (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "nl", Name, Template);
   end P;
begin
   P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none", "geen overeenkomende {other}");
   P ("filtered_count.all",
      "alle {total} {total, plural, one {{one}} other {{other}}} komen "
      & "overeen");
   P ("filtered_count.some",
      "{matching} van {total} {total, plural, one {{one}} other {{other}}} "
      & "komen overeen");
   P ("more_count", "{visible} weergegeven, +{remaining} meer");
   P ("others_count",
      "{first} en {remaining, plural, one {1 andere} other {{remaining} "
      & "andere}}");
   P ("page_count", "pagina {page} van {total}");
   P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per pagina");
   P ("pagination_range",
      "{first}–{last} van {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("position_count", "{position} van {total}");
   P ("selection_count",
      "{selected} van {total} {total, plural, one {{one}} other {{other}}} "
      & "geselecteerd");
   P ("showing_count",
      "{showing} van {total} {total, plural, one {{one}} other {{other}}} "
      & "weergegeven");
   P ("validation_count",
      "{count, plural, =0 {geen {severity, select, error {fouten} warning "
      & "{waarschuwingen} other {meldingen}}} one {1 {severity, select, error "
      & "{fout} warning {waarschuwing} other {melding}}} other {{count} "
      & "{severity, select, error {fouten} warning {waarschuwingen} other "
      & "{meldingen}}}}");
   P ("collection.empty", "geen {other}");
   P ("collection.none_shown", "geen {other} weergegeven");
   P ("collection.showing_hidden",
      "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
      & "weergegeven, {hidden} verborgen");
   P ("collection.showing",
      "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
      & "weergegeven");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} other {{other}}} weergegeven, "
      & "{hidden} verborgen");
   P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} weergegeven");
   P ("collection.visible_out_of",
      "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
      & "zichtbaar");
   P ("complete_count", "{done} van {total} voltooid");
   P ("percent_complete", "{percent}% voltooid");
   P ("step_count", "stap {step} van {total}");
   P ("attempt_count", "poging {attempt} van {total}");
   P ("throughput_remaining",
      "nog {remaining} {remaining, plural, one {{one}} other {{other}}} bij "
      & "{rate} {unit}/s");
   P ("accessible_progress", "{done} van {total} voltooid, {percent} procent");
   P ("business_days", "{days} {days, plural, one {werkdag} other {werkdagen}}");
   P ("working_hours", "{hours} {hours, plural, one {werkuur} other {werkuren}}");
   P ("due.overdue", "{days} {days, plural, one {dag} other {dagen}} te laat");
   P ("due.today", "vervalt vandaag");
   P ("due.tomorrow", "vervalt morgen");
   P ("due.in", "vervalt over {days} dagen");
   P ("calendar_difference.future", "over {difference}");
   P ("calendar_difference.past", "{difference} geleden");
   P ("calendar_difference.same_day", "dezelfde dag");
   P ("calendar_difference.zero", "0 dagen");
   P ("cpu_load", "CPU-belasting {measure}");
   P ("battery", "batterij {measure}");
   P ("screen_size", "scherm {measure}");
   P ("refresh_rate", "verversingssnelheid {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "{value} procent");
   P ("recurrence.second", "{every, plural, one {elke seconde} other {elke {every} seconden}}");
   P ("recurrence.minute", "{every, plural, one {elke minuut} other {elke {every} minuten}}");
   P ("recurrence.hour", "{every, plural, one {elk uur} other {elke {every} uur}}");
   P ("recurrence.day", "{every, plural, one {elke dag} other {elke {every} dagen}}");
   P ("recurrence.week", "{every, plural, one {elke week} other {elke {every} weken}}");
   P ("recurrence.month", "{every, plural, one {elke maand} other {elke {every} maanden}}");
   P ("recurrence.quarter", "{every, plural, one {elk kwartaal} other {elke {every} kwartalen}}");
   P ("recurrence.year", "{every, plural, one {elk jaar} other {elke {every} jaar}}");
   P ("cache_summary.empty", "cache: geen verzoeken");
   P ("cache_summary",
      "cache: {hits} {hits, plural, one {treffer} other {treffers}}, {misses} "
      & "{misses, plural, one {misser} other {missers}}, {rate}% "
      & "trefferpercentage");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
      & "gewijzigd, {added} toegevoegd, {removed} verwijderd");
   P ("field_diff", "{field} gewijzigd van {before} in {after}");
   P ("field_added", "{field} toegevoegd als {value}");
   P ("field_removed", "{field} verwijderd (was {value})");
   P ("field_unchanged", "{field} ongewijzigd op {value}");
   P ("number_comparison.equal", "{current} is gelijk aan {baseline}");
   P ("number_comparison.higher", "{current} is {quantity} hoger dan {baseline}");
   P ("number_comparison.lower", "{current} is {quantity} lager dan {baseline}");
   P ("percent_comparison.equal", "{current} is gelijk aan {baseline}");
   P ("percent_comparison.higher", "{current} is {quantity} hoger dan {baseline}");
   P ("percent_comparison.lower", "{current} is {quantity} lager dan {baseline}");
   P ("file_size_comparison.same", "{current} is even groot als {baseline}");
   P ("file_size_comparison.larger", "{current} is {quantity} groter dan {baseline}");
   P ("file_size_comparison.smaller", "{current} is {quantity} kleiner dan {baseline}");
   P ("date_comparison.same", "{current} is dezelfde datum als {baseline}");
   P ("date_comparison.after", "{current} valt {quantity} na {baseline}");
   P ("date_comparison.before", "{current} valt {quantity} vóór {baseline}");
   P ("queue_summary", "wachtrij: {details}");
   P ("queue_summary.empty", "wachtrij leeg");
   P ("domain_summary",
      "{domain, select, queue {wachtrij} job {taak} run {uitvoering} cache "
      & "{cache} sync {synchronisatie} import {import} export {export} other "
      & "{{domain}}} {state, select, queued {in wachtrij} running {bezig} "
      & "waiting {wachtend} paused {gepauzeerd} complete {voltooid} failed "
      & "{mislukt} stale {verouderd} skipped {overgeslagen} other {{state}}}: "
      & "{details}");
   P ("summary.none", "geen {other}");
   P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} voltooid");
   P ("summary.completed_of",
      "{count} van {total} {total, plural, one {{one}} other {{other}}} "
      & "voltooid");
   P ("summary.failed", "{count} mislukt");
   P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} in wachtrij");
   P ("summary.running", "{count} bezig");
   P ("summary.complete", "{count} voltooid");
   P ("backup.backup_running", "back-up bezig");
   P ("backup.backup_completed", "back-up voltooid");
   P ("backup.backup_failed", "back-up mislukt");
   P ("backup.backup_stale", "back-up verouderd");
   P ("incident.incident_investigating", "incident wordt onderzocht");
   P ("incident.incident_identified", "incident geïdentificeerd");
   P ("incident.incident_mitigated", "incident beperkt");
   P ("incident.incident_resolved", "incident opgelost");
   P ("release.release_drafting", "release in voorbereiding");
   P ("release.release_ready", "release gereed");
   P ("release.release_published", "release gepubliceerd");
   P ("release.release_rolled_back", "release teruggedraaid");
   P ("audit.audit_created", "auditrecord aangemaakt");
   P ("audit.audit_updated", "auditrecord bijgewerkt");
   P ("audit.audit_deleted", "auditrecord verwijderd");
   P ("audit.audit_restored", "auditrecord hersteld");
   P ("flag.flag_enabled", "featureflag ingeschakeld");
   P ("flag.flag_disabled", "featureflag uitgeschakeld");
   P ("flag.flag_rolling_out", "featureflag wordt uitgerold");
   P ("flag.flag_rolled_back", "featureflag teruggedraaid");
   P ("webhook.webhook_pending", "webhook in behandeling");
   P ("webhook.webhook_delivered", "webhook afgeleverd");
   P ("webhook.webhook_failed", "webhook mislukt");
   P ("webhook.webhook_retrying", "webhook wordt opnieuw geprobeerd");
   P ("api_key.api_key_active", "API-sleutel actief");
   P ("api_key.api_key_revoked", "API-sleutel ingetrokken");
   P ("api_key.api_key_expired", "API-sleutel verlopen");
   P ("api_key.api_key_rotated", "API-sleutel vervangen");
   P ("quota.quota_available", "quotum beschikbaar");
   P ("quota.quota_near_limit", "quotum bijna bereikt");
   P ("quota.quota_exceeded", "quotum overschreden");
   P ("quota.quota_reset", "quotum opnieuw ingesteld");
   P ("invoice.invoice_draft", "conceptfactuur");
   P ("invoice.invoice_sent", "factuur verzonden");
   P ("invoice.invoice_paid", "factuur betaald");
   P ("invoice.invoice_refunded", "factuur terugbetaald");
   P ("invoice.invoice_overdue", "factuur achterstallig");
   P ("invoice.refund_failed", "terugbetaling mislukt");
   P ("page_navigation.only", "enige pagina");
   P ("page_navigation.first", "eerste pagina, volgende beschikbaar");
   P ("page_navigation.last", "laatste pagina, vorige beschikbaar");
   P ("page_navigation.middle", "vorige en volgende beschikbaar");
   P ("end_of_week", "einde van de week");
   P ("end_of_month", "einde van de maand");
   P ("end_of_quarter", "einde van het kwartaal");
   P ("time_of_day.night", "nacht");
   P ("time_of_day.morning", "ochtend");
   P ("time_of_day.afternoon", "middag");
   P ("time_of_day.evening", "avond");
   P ("access.allowed", "toegestaan");
   P ("access.denied", "geweigerd");
   P ("access.owner", "eigenaar");
   P ("access.admin", "beheerder");
   P ("access.viewer", "lezer");
   P ("access.editor", "bewerker");
   P ("auth.signed_in", "aangemeld");
   P ("auth.signed_out", "afgemeld");
   P ("auth.session_expired", "sessie verlopen");
   P ("auth.locked", "vergrendeld");
   P ("auth.two_factor_required", "tweestapsverificatie vereist");
   P ("billing.trialing", "proefperiode");
   P ("billing.payment_due", "betaling verschuldigd");
   P ("billing.payment_failed", "betaling mislukt");
   P ("billing.paid", "betaald");
   P ("billing.past_due", "achterstallig");
   P ("billing.canceled", "opgezegd");
   P ("ci.pipeline_pending", "pipeline in afwachting");
   P ("ci.pipeline_running", "pipeline wordt uitgevoerd");
   P ("ci.pipeline_passed", "pipeline geslaagd");
   P ("ci.pipeline_failed", "pipeline mislukt");
   P ("ci.review_required", "review vereist");
   P ("ci.deploy_blocked", "deployment geblokkeerd");
   P ("collaboration.active_now", "nu actief");
   P ("collaboration.away", "afwezig");
   P ("collaboration.do_not_disturb", "niet storen");
   P ("collaboration.typing", "typt");
   P ("collaboration.viewing", "bekijkt");
   P ("collaboration.editing", "bewerkt");
   P ("deployment.deploying", "wordt geïmplementeerd");
   P ("deployment.deployed", "geïmplementeerd");
   P ("deployment.rolling_back", "wordt teruggedraaid");
   P ("deployment.rolled_back", "teruggedraaid");
   P ("deployment.build_failed", "build mislukt");
   P ("deployment.checks_passed", "controles geslaagd");
   P ("empty.no_items", "geen items");
   P ("empty.no_results", "geen resultaten");
   P ("empty.no_messages", "geen berichten");
   P ("empty.no_selection", "geen selectie");
   P ("empty.nothing_to_show", "niets om te tonen");
   P ("file.uploading", "wordt geüpload");
   P ("file.downloading", "wordt gedownload");
   P ("file.copying", "wordt gekopieerd");
   P ("file.moving", "wordt verplaatst");
   P ("file.deleting", "wordt verwijderd");
   P ("file.deleted", "verwijderd");
   P ("file.restoring", "wordt hersteld");
   P ("file.synced", "gesynchroniseerd");
   P ("form.valid_input", "geldige invoer");
   P ("form.invalid_input", "ongeldige invoer");
   P ("form.dirty", "gewijzigd");
   P ("form.pristine", "ongewijzigd");
   P ("form.submitted", "verzonden");
   P ("form.submission_failed", "verzenden mislukt");
   P ("health.healthy", "in orde");
   P ("health.degraded", "beperkt");
   P ("health.unhealthy", "niet in orde");
   P ("health.incident", "incident");
   P ("health.maintenance", "onderhoud");
   P ("health.recovering", "wordt hersteld");
   P ("issue.open", "open");
   P ("issue.closed", "gesloten");
   P ("issue.reopened", "heropend");
   P ("issue.assigned", "toegewezen");
   P ("issue.unassigned", "niet toegewezen");
   P ("issue.merged", "samengevoegd");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "verbinding maken");
   P ("network.syncing", "wordt gesynchroniseerd");
   P ("network.sync_failed", "synchronisatie mislukt");
   P ("network.permission_denied", "toegang geweigerd");
   P ("network.read_only", "alleen-lezen");
   P ("notification.unread", "ongelezen");
   P ("notification.read", "gelezen");
   P ("notification.muted", "gedempt");
   P ("notification.snoozed", "gesluimerd");
   P ("notification.sent", "verzonden");
   P ("notification.delivered", "bezorgd");
   P ("payment.payment_authorized", "betaling geautoriseerd");
   P ("payment.payment_captured", "betaling geïnd");
   P ("payment.payment_refunded", "betaling terugbetaald");
   P ("payment.payment_disputed", "betaling betwist");
   P ("payment.payment_requires_action", "betaling vereist actie");
   P ("payment.payment_expired", "betaling verlopen");
   P ("ui.empty", "leeg");
   P ("ui.loading", "wordt geladen");
   P ("ui.saving", "wordt opgeslagen");
   P ("ui.saved", "opgeslagen");
   P ("ui.unsaved", "niet opgeslagen");
   P ("ui.retrying", "nieuwe poging");
   P ("ui.paused", "gepauzeerd");
   P ("ui.complete", "voltooid");
   P ("ui.failed", "mislukt");
   P ("ui.due_soon", "vervalt binnenkort");
   P ("ui.overdue", "te laat");
   P ("ui.last_seen", "laatst gezien");
   P ("ui.updated_just_now", "zojuist bijgewerkt");
   P ("queue.queued", "in wachtrij");
   P ("queue.running", "wordt uitgevoerd");
   P ("queue.waiting", "wachtend");
   P ("queue.blocked", "geblokkeerd");
   P ("queue.canceled_job", "taak geannuleerd");
   P ("queue.completed_job", "taak voltooid");
   P ("search.filtering", "wordt gefilterd");
   P ("search.filtered", "gefilterd");
   P ("search.no_matches", "geen overeenkomsten");
   P ("search.search_ready", "zoeken gereed");
   P ("search.search_failed", "zoeken mislukt");
   P ("search.query_too_short", "zoekopdracht te kort");
   P ("security.secure", "beveiligd");
   P ("security.insecure", "onbeveiligd");
   P ("security.vulnerable", "kwetsbaar");
   P ("security.encrypted", "versleuteld");
   P ("security.unencrypted", "onversleuteld");
   P ("security.token_expired", "token verlopen");
   P ("sync.sync_idle", "synchronisatie inactief");
   P ("sync.syncing_now", "wordt nu gesynchroniseerd");
   P ("sync.sync_queued", "synchronisatie in wachtrij");
   P ("sync.sync_conflict", "synchronisatieconflict");
   P ("sync.sync_complete", "synchronisatie voltooid");
   P ("sync.sync_error", "synchronisatiefout");
   P ("task.todo", "te doen");
   P ("task.in_progress", "bezig");
   P ("task.done", "klaar");
   P ("task.skipped", "overgeslagen");
   P ("task.blocked_task", "geblokkeerd");
   P ("task.waiting_on", "wacht op");
   P ("ticket.ticket_new", "ticket nieuw");
   P ("ticket.ticket_open", "ticket open");
   P ("ticket.ticket_waiting", "ticket wachtend");
   P ("ticket.ticket_escalated", "ticket geëscaleerd");
   P ("ticket.ticket_resolved", "ticket opgelost");
   P ("ticket.ticket_closed", "ticket gesloten");
   P ("transfer.importing", "wordt geïmporteerd");
   P ("transfer.imported", "geïmporteerd");
   P ("transfer.import_failed", "importeren mislukt");
   P ("transfer.exporting", "wordt geëxporteerd");
   P ("transfer.exported", "geëxporteerd");
   P ("transfer.export_failed", "exporteren mislukt");
   P ("validation.required", "vereist");
   P ("validation.optional", "optioneel");
   P ("validation.invalid", "ongeldig");
   P ("validation.too_short", "te kort");
   P ("validation.too_long", "te lang");
   P ("validation.out_of_range", "buiten bereik");
   P ("validation.already_exists", "bestaat al");
   P ("workflow.draft", "concept");
   P ("workflow.in_review", "ter beoordeling");
   P ("workflow.approved", "goedgekeurd");
   P ("workflow.rejected", "afgewezen");
   P ("workflow.published", "gepubliceerd");
   P ("workflow.archived", "gearchiveerd");
   P ("database.database_online", "database online");
   P ("database.database_offline", "database offline");
   P ("database.database_degraded", "database beperkt");
   P ("database.database_migrating", "database wordt gemigreerd");
   P ("database.database_migration_failed", "databasemigratie mislukt");
   P ("database.database_replicating", "database wordt gerepliceerd");
   P ("database.database_replication_lagging", "databasereplicatie loopt achter");
   P ("database.database_backup_running", "databaseback-up wordt uitgevoerd");
   P ("database.database_backup_failed", "databaseback-up mislukt");
   P ("times_noun",
      "{count, plural, =0 {nooit {other}} =1 {eenmaal {one}} =2 {tweemaal "
      & "{other}} other {{count} keer {other}}}");
   P ("availability.all",
      "{available} van {total} {total, plural, one {{one}} other {{other}}} "
      & "beschikbaar");
   P ("availability.none", "geen {other} beschikbaar");
   P ("availability.partial",
      "{available} van {total} {total, plural, one {{one}} other {{other}}} "
      & "beschikbaar, {unavailable} niet beschikbaar");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "in wachtrij");
   P ("operation.running", "bezig");
   P ("operation.blocked", "geblokkeerd");
   P ("operation.retrying", "nieuwe poging");
   P ("operation.succeeded", "geslaagd");
   P ("operation.partially_succeeded", "gedeeltelijk geslaagd");
   P ("operation.failed", "mislukt");
   P ("operation.canceled", "geannuleerd");
   P ("operation.skipped", "overgeslagen");
   P ("operation.stale", "verouderd");
   P ("operation.unknown_state", "onbekend");
   P ("operation.last_success", "{name} laatst geslaagd: {time}");
   P ("operation.next_retry", "{name} volgende poging: {time}");
   P ("operation.stale_run", "{name} al {time} verouderd");
   P ("summary.skipped", "{count} overgeslagen");
   P ("summary.retried", "{count} opnieuw geprobeerd");
   P ("summary.canceled", "{count} geannuleerd");
   P ("system.service.operational", "operationeel");
   P ("system.service.degraded", "verminderde prestaties");
   P ("system.service.partial_outage", "gedeeltelijke storing");
   P ("system.service.major_outage", "grote storing");
   P ("system.service.maintenance", "in onderhoud");
   P ("system.service.unknown", "onbekende servicestatus");
   P ("system.health.healthy", "in orde");
   P ("system.health.warning", "waarschuwing");
   P ("system.health.critical", "kritiek");
   P ("system.health.unavailable", "niet beschikbaar");
   P ("system.health.unknown_health", "onbekende gezondheidsstatus");
   P ("system.readiness.ready", "gereed");
   P ("system.readiness.not_ready", "niet gereed");
   P ("system.readiness.starting", "wordt gestart");
   P ("system.readiness.draining", "wordt leeggemaakt");
   P ("system.readiness.stopped", "gestopt");
   P ("system.readiness.unknown_readiness", "onbekende gereedheid");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "wordt gestart");
   P ("system.component.stopping", "wordt gestopt");
   P ("system.component.restarting", "wordt herstart");
   P ("system.component.unknown", "onbekende componentstatus");
   P ("system.check.passing", "geslaagd");
   P ("system.check.failing", "mislukt");
   P ("system.check.warning", "waarschuwing");
   P ("system.check.skipped", "overgeslagen");
   P ("system.check.timed_out", "time-out");
   P ("system.check.unknown", "onbekende controlestatus");
   P ("system.incident.investigating", "wordt onderzocht");
   P ("system.incident.identified", "geïdentificeerd");
   P ("system.incident.monitoring", "wordt gemonitord");
   P ("system.incident.resolved", "opgelost");
   P ("system.incident.scheduled_maintenance", "gepland onderhoud");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "controle {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {geen componenten} one {{count} component} other "
      & "{{count} componenten}}");
   P ("system.count.checks",
      "{count, plural, =0 {geen controles} one {{count} controle} other "
      & "{{count} controles}}");
   P ("system.count.incidents",
      "{count, plural, =0 {geen incidenten} one {{count} incident} other "
      & "{{count} incidenten}}");
   P ("system.uptime", "beschikbaarheid {measure}");
   P ("system.latency", "latentie {measure}");
   P ("system.maintenance_window", "onderhoudsvenster {time}");
   P ("system.last_checked", "laatst gecontroleerd {time}");
   P ("system.http.informational", "informatief");
   P ("system.http.successful", "succesvol");
   P ("system.http.redirection", "omleiding");
   P ("system.http.client_error", "clientfout");
   P ("system.http.server_error", "serverfout");
   P ("system.exit.success", "exitcode {code}: succes");
   P ("system.exit.failure", "exitcode {code}: fout");
   P ("system.exit.usage_error", "exitcode {code}: onjuist gebruik");
   P ("system.exit.not_executable", "exitcode {code}: opdracht niet uitvoerbaar");
   P ("system.exit.not_found", "exitcode {code}: opdracht niet gevonden");
   P ("system.exit.invalid_argument", "exitcode {code}: ongeldig exitargument");
   P ("system.exit.signal", "exitcode {code}: beëindigd door {signal}");
   P ("validation.problem.required", "{field}: is verplicht");
   P ("validation.problem.minimum", "{field}: ligt onder het minimum");
   P ("validation.problem.maximum", "{field}: ligt boven het maximum");
   P ("validation.problem.range", "{field}: valt buiten het toegestane bereik");
   P ("validation.problem.pattern", "{field}: komt niet overeen met het patroon");
   P ("validation.problem.choice", "{field}: moet een van de toegestane waarden zijn");
   P ("validation.problem.dependency", "{field}: is afhankelijk van een ander veld");
   P ("validation.problem.custom", "{field}: is ongeldig");
   P ("validation.constraint.no_relation", "{field}: moet geldig zijn ({value})");
   P ("validation.constraint.less_than", "{field}: moet kleiner zijn dan {value}");
   P ("validation.constraint.less_or_equal", "{field}: mag hoogstens {value} zijn");
   P ("validation.constraint.greater_than", "{field}: moet groter zijn dan {value}");
   P ("validation.constraint.greater_or_equal", "{field}: moet minstens {value} zijn");
   P ("validation.constraint.equal_to", "{field}: moet gelijk zijn aan {value}");
   P ("validation.constraint.not_equal_to", "{field}: mag niet gelijk zijn aan {value}");
   P ("validation.constraint.before_field", "{field}: moet vóór {value} liggen");
   P ("validation.constraint.after_field", "{field}: moet na {value} liggen");
   P ("validation.choices", "{field}: toegestane waarden zijn {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, invoer: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nieuwe poging over {time}");
   P ("net_diagnostic.dns", "{endpoint}: DNS-opzoeking mislukt");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-verbinding mislukt");
   P ("net_diagnostic.tls", "{endpoint}: TLS-certificaatcontrole mislukt");
   P ("net_diagnostic.http", "{endpoint}: HTTP-verzoek mislukt");
   P ("net_diagnostic.proxy", "{endpoint}: proxyfout");
   P ("net_diagnostic.timeout", "{endpoint}: time-out");
   P ("net_diagnostic.reset", "{endpoint}: verbinding verbroken");
   P ("net_diagnostic.unknown_network", "{endpoint}: onbekende netwerkfout");
   P ("progress.state.not_started", "niet gestart");
   P ("progress.state.running", "bezig");
   P ("progress.state.stalled", "vastgelopen");
   P ("progress.state.retrying", "nieuwe poging");
   P ("progress.state.complete", "voltooid");
   P ("progress.state.failed", "mislukt");
   P ("progress.of", "{subject}: {done} van {total} voltooid ({percent}%), {state}");
   P ("progress.done", "{subject}: {done} voltooid, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {item} other {items}}, {unique} "
      & "{unique, plural, one {unieke waarde} other {unieke waarden}}, "
      & "{duplicates} {duplicates, plural, one {duplicaat} other {duplicaten}}, "
      & "{outliers} {outliers, plural, one {uitschieter} other {uitschieters}}");
   P ("top_frequency", "{name}: {value} ({count} keer)");
   P ("calendar_date.fiscal_year", "boekjaar {year}");
   P ("calendar_date.fiscal_quarter", "boekjaar {year} K{part}");
   P ("calendar_date.fiscal_half", "boekjaar {year} H{part}");
   P ("calendar_date.fiscal_year_end", "einde boekjaar {year}");
   P ("calendar_date.semester", "{part}e semester {year}");
   P ("calendar_date.half_year", "H{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {eerste helft van {year}} other {tweede helft van "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {begin {text}} mid {medio {text}} other {eind "
      & "{text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {begin {text}} mid {medio {text}} other {eind "
      & "{text}}}");
   P ("calendar_range.weekend.last", "vorig weekend");
   P ("calendar_range.weekend.this", "dit weekend");
   P ("calendar_range.weekend.next", "volgend weekend");
   P ("calendar_range.weekend_of", "weekend van {date}");
   P ("calendar_range.week.last", "vorige week");
   P ("calendar_range.week.this", "deze week");
   P ("calendar_range.week.next", "volgende week");
   P ("calendar_range.week_of", "week van {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "doorgaan");
   P ("http.reason.101", "protocolwissel");
   P ("http.reason.102", "wordt verwerkt");
   P ("http.reason.103", "vroege hints");
   P ("http.reason.200", "ok");
   P ("http.reason.201", "aangemaakt");
   P ("http.reason.202", "geaccepteerd");
   P ("http.reason.203", "niet-gezaghebbende informatie");
   P ("http.reason.204", "geen inhoud");
   P ("http.reason.205", "inhoud opnieuw instellen");
   P ("http.reason.206", "gedeeltelijke inhoud");
   P ("http.reason.207", "multi-status");
   P ("http.reason.208", "al gerapporteerd");
   P ("http.reason.226", "IM gebruikt");
   P ("http.reason.300", "meerdere keuzes");
   P ("http.reason.301", "permanent verplaatst");
   P ("http.reason.302", "gevonden");
   P ("http.reason.303", "zie andere");
   P ("http.reason.304", "niet gewijzigd");
   P ("http.reason.305", "gebruik proxy");
   P ("http.reason.307", "tijdelijke omleiding");
   P ("http.reason.308", "permanente omleiding");
   P ("http.reason.400", "ongeldig verzoek");
   P ("http.reason.401", "niet geautoriseerd");
   P ("http.reason.402", "betaling vereist");
   P ("http.reason.403", "verboden");
   P ("http.reason.404", "niet gevonden");
   P ("http.reason.405", "methode niet toegestaan");
   P ("http.reason.406", "niet aanvaardbaar");
   P ("http.reason.407", "proxy-authenticatie vereist");
   P ("http.reason.408", "time-out van verzoek");
   P ("http.reason.409", "conflict");
   P ("http.reason.410", "verdwenen");
   P ("http.reason.411", "lengte vereist");
   P ("http.reason.412", "voorwaarde niet voldaan");
   P ("http.reason.413", "inhoud te groot");
   P ("http.reason.414", "URI te lang");
   P ("http.reason.415", "niet-ondersteund mediatype");
   P ("http.reason.416", "bereik niet haalbaar");
   P ("http.reason.417", "verwachting niet voldaan");
   P ("http.reason.418", "ik ben een theepot");
   P ("http.reason.421", "verkeerd gericht verzoek");
   P ("http.reason.422", "onverwerkbare inhoud");
   P ("http.reason.423", "vergrendeld");
   P ("http.reason.424", "mislukte afhankelijkheid");
   P ("http.reason.425", "te vroeg");
   P ("http.reason.426", "upgrade vereist");
   P ("http.reason.428", "voorwaarde vereist");
   P ("http.reason.429", "te veel verzoeken");
   P ("http.reason.431", "headervelden van verzoek te groot");
   P ("http.reason.451", "niet beschikbaar om juridische redenen");
   P ("http.reason.500", "interne serverfout");
   P ("http.reason.501", "niet geïmplementeerd");
   P ("http.reason.502", "ongeldige gateway");
   P ("http.reason.503", "dienst niet beschikbaar");
   P ("http.reason.504", "gateway-time-out");
   P ("http.reason.505", "HTTP-versie niet ondersteund");
   P ("http.reason.506", "variant onderhandelt ook");
   P ("http.reason.507", "onvoldoende opslagruimte");
   P ("http.reason.508", "lus gedetecteerd");
   P ("http.reason.510", "niet uitgebreid");
   P ("http.reason.511", "netwerkauthenticatie vereist");
   P ("errno.reason.0", "gelukt");
   P ("errno.reason.1", "actie is niet toegestaan");
   P ("errno.reason.2", "bestand of map bestaat niet");
   P ("errno.reason.3", "proces bestaat niet");
   P ("errno.reason.4", "onderbroken systeemaanroep");
   P ("errno.reason.5", "invoer-/uitvoerfout");
   P ("errno.reason.6", "apparaat of adres bestaat niet");
   P ("errno.reason.9", "ongeldige bestandsdescriptor");
   P ("errno.reason.11", "hulpbron is tijdelijk onbeschikbaar");
   P ("errno.reason.12", "onvoldoende geheugen beschikbaar");
   P ("errno.reason.13", "toegang geweigerd");
   P ("errno.reason.17", "bestand bestaat al");
   P ("errno.reason.20", "is geen map");
   P ("errno.reason.21", "is een map");
   P ("errno.reason.22", "ongeldig argument");
   P ("errno.reason.24", "te veel open bestanden");
   P ("errno.reason.28", "geen ruimte meer over op apparaat");
   P ("errno.reason.32", "gebroken pijp");
   P ("errno.reason.98", "adres is al in gebruik");
   P ("errno.reason.110", "verbinding is verlopen");
   P ("errno.reason.111", "verbinding is geweigerd");
   P ("signal.reason.1", "opgehangen");
   P ("signal.reason.2", "onderbroken");
   P ("signal.reason.3", "afgesloten");
   P ("signal.reason.4", "ongeldige instructie");
   P ("signal.reason.5", "traceer/breekpunt-instructie");
   P ("signal.reason.6", "afgebroken");
   P ("signal.reason.7", "busfout");
   P ("signal.reason.8", "drijvendekomma-berekeningsfout");
   P ("signal.reason.9", "geëlimineerd");
   P ("signal.reason.10", "gebruikergedefinieerd signaal 1");
   P ("signal.reason.11", "segmentatiefout");
   P ("signal.reason.12", "gebruikergedefinieerd signaal 2");
   P ("signal.reason.13", "gebroken pijp");
   P ("signal.reason.14", "timersignaal");
   P ("signal.reason.15", "beëindigd");
   P ("signal.reason.17", "dochter is afgesloten");
   P ("signal.reason.18", "doorgegaan");
   P ("signal.reason.19", "gepauzeerd (signaal)");
   P ("signal.reason.20", "gepauzeerd");
   P ("signal.reason.28", "venster is veranderd");
   P ("sqlstate.reason.00", "succesvol voltooid");
   P ("sqlstate.reason.01", "waarschuwing");
   P ("sqlstate.reason.02", "geen gegevens");
   P ("sqlstate.reason.08", "verbindingsuitzondering");
   P ("sqlstate.reason.0a", "functie niet ondersteund");
   P ("sqlstate.reason.22", "gegevensuitzondering");
   P ("sqlstate.reason.23", "schending van integriteitsbeperking");
   P ("sqlstate.reason.24", "ongeldige cursorstatus");
   P ("sqlstate.reason.25", "ongeldige transactiestatus");
   P ("sqlstate.reason.28", "ongeldige autorisatiespecificatie");
   P ("sqlstate.reason.2d", "ongeldige transactiebeëindiging");
   P ("sqlstate.reason.3d", "ongeldige catalogusnaam");
   P ("sqlstate.reason.3f", "ongeldige schemanaam");
   P ("sqlstate.reason.40", "transactie teruggedraaid");
   P ("sqlstate.reason.42", "syntaxisfout of schending van toegangsregel");
   P ("sqlstate.reason.53", "onvoldoende middelen");
   P ("sqlstate.reason.54", "programmalimiet overschreden");
   P ("sqlstate.reason.55", "object niet in vereiste toestand");
   P ("sqlstate.reason.57", "ingreep door operator");
   P ("sqlstate.reason.58", "systeemfout");
   P ("sqlstate.reason.hv", "fout in foreign data wrapper");
   P ("sqlstate.reason.p0", "PL/pgSQL-fout");
   P ("sqlstate.reason.xx", "interne fout");
   P ("system.signal_numbered", "signaal {number} {name} {reason}");
   P ("http.reason.unknown", "onbekende status");
   P ("errno.reason.unknown", "onbekende fout");
   P ("signal.reason.unknown", "onbekend signaal");
   P ("sqlstate.reason.unknown", "onbekende SQLSTATE-klasse");
   P ("diff.changed", "diff {path}: gewijzigd van {before} naar {after}");
   P ("diff.added", "diff {path}: {after} toegevoegd");
   P ("diff.removed", "diff {path}: {before} verwijderd");
   P ("diff.unchanged", "diff {path}: ongewijzigd");
   P ("diff.redacted", "diff {path}: gewijzigd; waarden afgeschermd");
   P ("validation.result",
      "validatieresultaat: {fields} {fields, plural, one {veld} other "
      & "{velden}}, {errors} {errors, plural, one {fout} other {fouten}}, "
      & "{warnings} {warnings, plural, one {waarschuwing} other "
      & "{waarschuwingen}}, {required} {required, plural, one {verplicht veld} "
      & "other {verplichte velden}}, {hidden} {hidden, plural, one {verborgen "
      & "probleem} other {verborgen problemen}}");
   P ("file.kind.plain", "bestand");
   P ("file.kind.directory", "map");
   P ("file.kind.archive", "archief");
   P ("file.kind.compressed", "gecomprimeerd bestand");
   P ("file.kind.image", "afbeelding");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "uitvoerbaar bestand");
   P ("file.kind.unknown", "onbekend bestand");
   P ("file.metadata", "bestand {name}: {kind}");
   P ("file.checksum", "{text}, controlesom {checksum}");
   P ("file.signature_match", "bestandshandtekening {name}: {kind}, komt overeen met de extensie");
   P ("file.signature_mismatch",
      "bestandshandtekening {name}: volgens de extensie {expected}, volgens "
      & "de inhoud {actual}");
   P ("network_event.connecting", "verbinding maken");
   P ("network_event.connected", "verbonden");
   P ("network_event.redirected", "omgeleid");
   P ("network_event.retrying", "opnieuw proberen");
   P ("network_event.rate_limited", "snelheidslimiet bereikt");
   P ("network_event.tls_failed", "TLS mislukt");
   P ("network_event.stalled", "vastgelopen");
   P ("network_event.complete", "voltooid");
   P ("network_event.failed", "mislukt");
   P ("network.session", "netwerk {endpoint}: {state}");
   P ("diff_node.field", "veld");
   P ("diff_node.object", "object");
   P ("diff_node.list", "lijst");
   P ("diff.node",
      "diff-knooppunt {path}: {kind}, {count} {count, plural, one {wijziging} "
      & "other {wijzigingen}}");
   P ("checksum.not_checked", "controlesom niet gecontroleerd");
   P ("checksum.valid", "controlesom geldig");
   P ("checksum.mismatch", "controlesom komt niet overeen");
   P ("checksum.missing", "controlesom ontbreekt");
   P ("product_code", "productcode {kind}: {value}, {state}");
   P ("time_zone.utc", "tijdzone: UTC");
   P ("time_zone.offset", "tijdzone: {offset}");
   P ("time_zone.named", "tijdzone: {name} ({offset})");
   P ("time_zone.local", "tijdzone: lokale tijd");
   P ("time_zone.unknown", "tijdzone: onbekende zone");
   P ("time_zone.dst", "{text}, met zomertijd");
   P ("zoned_time.plain", "zonetijd: {time} {offset}");
   P ("zoned_time.named", "zonetijd: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, dubbelzinnige lokale tijd");
   P ("number.under", "onder {value}");
   P ("number.up_to", "tot {value}");
   P ("number.between", "tussen {low} en {high}");
   P ("number.range_words", "{low} tot {high}");
   P ("number.uncertainty_words", "{value} plus of min {delta}");
   P ("number.range_inclusive", "{low} tot en met {high}");
   P ("number.range_exclusive", "groter dan {low} en kleiner dan {high}");
   P ("number.range_low_inclusive", "minstens {low} en kleiner dan {high}");
   P ("number.range_high_inclusive", "groter dan {low} en hoogstens {high}");
   P ("number.at_least", "minstens {value}");
   P ("number.more_than", "meer dan {value}");
   P ("number.at_most", "hoogstens {value}");
   P ("number.less_than", "minder dan {value}");
   P ("number.exactly", "precies {value}");
   P ("number.within", "{value} ligt binnen {bounds}");
   P ("number.below", "{value} ligt onder {bounds}");
   P ("number.above", "{value} ligt boven {bounds}");
   P ("number.per", "{numerator} per {denominator}");
   P ("number.one_in", "1 op {whole}");
   P ("number.out_of", "{value} van {whole}");
   P ("number.unchanged", "ongewijzigd");
   P ("number.change_up", "gestegen met {quantity}");
   P ("number.change_down", "gedaald met {quantity}");
   P ("number.change_more", "{quantity} {tail} meer");
   P ("number.change_fewer", "{quantity} {tail} minder");
   P ("number.since", "{change} sinds {since}");
end Locale_Nl;
