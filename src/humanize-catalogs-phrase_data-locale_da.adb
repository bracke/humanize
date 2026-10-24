separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Da (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "da", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
begin
   P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none", "ingen {other} matcher");
   P ("filtered_count.all", "alle {total} {total, plural, one {{one}} other {{other}}} matcher");
   P ("filtered_count.some",
      "{matching} af {total} {total, plural, one {{one}} other {{other}}} "
      & "matcher");
   P ("more_count", "{visible} vist, +{remaining} mere");
   P ("others_count",
      "{first} og {remaining, plural, one {1 anden} other {{remaining} "
      & "andre}}");
   P ("page_count", "side {page} af {total}");
   P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} pr. side");
   P ("pagination_range",
      "{first}–{last} af {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("position_count", "{position} af {total}");
   P ("selection_count",
      "{selected} af {total} {total, plural, one {{one}} other {{other}}} "
      & "markeret");
   P ("showing_count",
      "viser {showing} af {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("validation_count",
      "{count, plural, =0 {ingen {severity, select, error {fejl} warning "
      & "{advarsler} other {meddelelser}}} one {1 {severity, select, error "
      & "{fejl} warning {advarsel} other {meddelelse}}} other {{count} "
      & "{severity, select, error {fejl} warning {advarsler} other "
      & "{meddelelser}}}}");
   P ("collection.empty", "ingen {other}");
   P ("collection.none_shown", "ingen {other} vises");
   P ("collection.showing_hidden",
      "viser {visible} af {total} {total, plural, one {{one}} other "
      & "{{other}}}, {hidden} skjult");
   P ("collection.showing",
      "viser {visible} af {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} other {{other}}} vises, "
      & "{hidden} skjult");
   P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} vises");
   P ("collection.visible_out_of",
      "{visible} af {total} {total, plural, one {{one}} other {{other}}} "
      & "{visible, plural, one {{gender, select, common {synlig} neuter "
      & "{synligt} other {synlig}}} other {synlige}}");
   P ("complete_count", "{done} af {total} fuldført");
   P ("percent_complete", "{percent} % fuldført");
   P ("step_count", "trin {step} af {total}");
   P ("attempt_count", "forsøg {attempt} af {total}");
   P ("throughput_remaining",
      "{remaining} {remaining, plural, one {{one}} other {{other}}} tilbage "
      & "ved {rate} {unit}/s");
   P ("accessible_progress", "{done} af {total} fuldført, {percent} procent");
   P ("business_days", "{days} {days, plural, one {arbejdsdag} other {arbejdsdage}}");
   P ("working_hours", "{hours} {hours, plural, one {arbejdstime} other {arbejdstimer}}");
   P ("due.overdue", "forfaldt for {days} {days, plural, one {dag} other {dage}} siden");
   P ("due.today", "forfalder i dag");
   P ("due.tomorrow", "forfalder i morgen");
   P ("due.in", "forfalder om {days} dage");
   P ("calendar_difference.future", "om {difference}");
   P ("calendar_difference.past", "for {difference} siden");
   P ("cpu_load", "CPU-belastning {measure}");
   P ("battery", "batteri {measure}");
   P ("screen_size", "skærm {measure}");
   P ("refresh_rate", "opdateringshastighed {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} procent");
   P ("recurrence.second", "{every, plural, one {hvert sekund} other {hvert {every}. sekund}}");
   P ("recurrence.minute", "{every, plural, one {hvert minut} other {hvert {every}. minut}}");
   P ("recurrence.hour", "{every, plural, one {hver time} other {hver {every}. time}}");
   P ("recurrence.day", "{every, plural, one {hver dag} other {hver {every}. dag}}");
   P ("recurrence.week", "{every, plural, one {hver uge} other {hver {every}. uge}}");
   P ("recurrence.month", "{every, plural, one {hver måned} other {hver {every}. måned}}");
   P ("recurrence.quarter", "{every, plural, one {hvert kvartal} other {hvert {every}. kvartal}}");
   P ("recurrence.year", "{every, plural, one {hvert år} other {hvert {every}. år}}");
   P ("cache_summary.empty", "cache: ingen forespørgsler");
   P ("cache_summary", "cache: {hits} træf, {misses} bom, {rate} % træfrate");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
      & "ændret, {added} tilføjet, {removed} fjernet");
   P ("field_diff", "{field} ændret fra {before} til {after}");
   P ("field_added", "{field} tilføjet som {value}");
   P ("field_removed", "{field} fjernet (var {value})");
   P ("field_unchanged", "{field} uændret ({value})");
   P ("number_comparison.equal", "{current} er lig med {baseline}");
   P ("number_comparison.higher", "{current} er {quantity} højere end {baseline}");
   P ("number_comparison.lower", "{current} er {quantity} lavere end {baseline}");
   P ("percent_comparison.equal", "{current} er lig med {baseline}");
   P ("percent_comparison.higher", "{current} er {quantity} højere end {baseline}");
   P ("percent_comparison.lower", "{current} er {quantity} lavere end {baseline}");
   P ("file_size_comparison.same", "{current} har samme størrelse som {baseline}");
   P ("file_size_comparison.larger", "{current} er {quantity} større end {baseline}");
   P ("file_size_comparison.smaller", "{current} er {quantity} mindre end {baseline}");
   P ("date_comparison.same", "{current} er samme dato som {baseline}");
   P ("date_comparison.after", "{current} ligger {quantity} efter {baseline}");
   P ("date_comparison.before", "{current} ligger {quantity} før {baseline}");
   P ("queue_summary", "kø: {details}");
   P ("domain_summary",
      "{domain, select, queue {kø} job {job} run {kørsel} cache {cache} "
      & "sync {synkronisering} import {import} export {eksport} other "
      & "{{domain}}} {state, select, queued {i kø} running {kører} waiting "
      & "{venter} paused {sat på pause} complete {fuldført} failed "
      & "{mislykkedes} stale {forældet} skipped {sprunget over} other "
      & "{{state}}}: {details}");
   P ("summary.none", "ingen {other}");
   P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} fuldført");
   P ("summary.completed_of",
      "{count} af {total} {total, plural, one {{one}} other {{other}}} "
      & "fuldført");
   P ("summary.failed", "{count} mislykkedes");
   P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} i kø");
   P ("summary.running", "{count} kører");
   P ("summary.complete", "{count} fuldført");
   P ("backup.backup_running", "sikkerhedskopiering kører");
   P ("backup.backup_completed", "sikkerhedskopiering fuldført");
   P ("backup.backup_failed", "sikkerhedskopiering mislykkedes");
   P ("backup.backup_stale", "sikkerhedskopi forældet");
   P ("incident.incident_investigating", "hændelse undersøges");
   P ("incident.incident_identified", "hændelse identificeret");
   P ("incident.incident_mitigated", "hændelse afbødet");
   P ("incident.incident_resolved", "hændelse løst");
   P ("release.release_drafting", "udgivelse under forberedelse");
   P ("release.release_ready", "udgivelse klar");
   P ("release.release_published", "udgivelse offentliggjort");
   P ("release.release_rolled_back", "udgivelse rullet tilbage");
   P ("audit.audit_created", "revisionspost oprettet");
   P ("audit.audit_updated", "revisionspost opdateret");
   P ("audit.audit_deleted", "revisionspost slettet");
   P ("audit.audit_restored", "revisionspost gendannet");
   P ("flag.flag_enabled", "funktionsflag aktiveret");
   P ("flag.flag_disabled", "funktionsflag deaktiveret");
   P ("flag.flag_rolling_out", "funktionsflag udrulles");
   P ("flag.flag_rolled_back", "funktionsflag rullet tilbage");
   P ("webhook.webhook_pending", "webhook afventer");
   P ("webhook.webhook_delivered", "webhook leveret");
   P ("webhook.webhook_failed", "webhook mislykkedes");
   P ("webhook.webhook_retrying", "webhook forsøges igen");
   P ("api_key.api_key_active", "API-nøgle aktiv");
   P ("api_key.api_key_revoked", "API-nøgle tilbagekaldt");
   P ("api_key.api_key_expired", "API-nøgle udløbet");
   P ("api_key.api_key_rotated", "API-nøgle roteret");
   P ("quota.quota_available", "kvote tilgængelig");
   P ("quota.quota_near_limit", "kvote næsten opbrugt");
   P ("quota.quota_exceeded", "kvote overskredet");
   P ("quota.quota_reset", "kvote nulstillet");
   P ("invoice.invoice_draft", "fakturakladde");
   P ("invoice.invoice_sent", "faktura sendt");
   P ("invoice.invoice_paid", "faktura betalt");
   P ("invoice.invoice_refunded", "faktura refunderet");
   P ("invoice.invoice_overdue", "faktura forfalden");
   P ("invoice.refund_failed", "refusion mislykkedes");
   P ("page_navigation.only", "eneste side");
   P ("page_navigation.first", "første side, næste tilgængelig");
   P ("page_navigation.last", "sidste side, forrige tilgængelig");
   P ("page_navigation.middle", "forrige og næste tilgængelig");
   P ("end_of_week", "slutningen af ugen");
   P ("end_of_month", "slutningen af måneden");
   P ("end_of_quarter", "slutningen af kvartalet");
   P ("time_of_day.night", "nat");
   P ("time_of_day.morning", "morgen");
   P ("time_of_day.afternoon", "eftermiddag");
   P ("time_of_day.evening", "aften");
   P ("calendar_difference.same_day", "samme dag");
   P ("calendar_difference.zero", "0 dage");
   P ("queue_summary.empty", "køen er tom");
   P ("access.allowed", "tilladt");
   P ("access.denied", "nægtet");
   P ("access.owner", "ejer");
   P ("access.admin", "administrator");
   P ("access.viewer", "læser");
   P ("access.editor", "redaktør");
   P ("auth.signed_in", "logget ind");
   P ("auth.signed_out", "logget ud");
   P ("auth.session_expired", "sessionen er udløbet");
   P ("auth.locked", "låst");
   P ("auth.two_factor_required", "totrinsbekræftelse påkrævet");
   P ("billing.trialing", "prøveperiode");
   P ("billing.payment_due", "betaling forfalder");
   P ("billing.payment_failed", "betaling mislykkedes");
   P ("billing.paid", "betalt");
   P ("billing.past_due", "overskredet betalingsfrist");
   P ("billing.canceled", "annulleret");
   P ("ci.pipeline_pending", "pipeline afventer");
   P ("ci.pipeline_running", "pipeline kører");
   P ("ci.pipeline_passed", "pipeline bestået");
   P ("ci.pipeline_failed", "pipeline mislykkedes");
   P ("ci.review_required", "gennemgang påkrævet");
   P ("ci.deploy_blocked", "udrulning blokeret");
   P ("collaboration.active_now", "aktiv nu");
   P ("collaboration.away", "ikke til stede");
   P ("collaboration.do_not_disturb", "forstyr ikke");
   P ("collaboration.typing", "skriver");
   P ("collaboration.viewing", "ser");
   P ("collaboration.editing", "redigerer");
   P ("deployment.deploying", "udrulles");
   P ("deployment.deployed", "udrullet");
   P ("deployment.rolling_back", "rulles tilbage");
   P ("deployment.rolled_back", "rullet tilbage");
   P ("deployment.build_failed", "build mislykkedes");
   P ("deployment.checks_passed", "kontroller bestået");
   P ("empty.no_items", "ingen elementer");
   P ("empty.no_results", "ingen resultater");
   P ("empty.no_messages", "ingen beskeder");
   P ("empty.no_selection", "intet valgt");
   P ("empty.nothing_to_show", "intet at vise");
   P ("file.uploading", "uploader");
   P ("file.downloading", "downloader");
   P ("file.copying", "kopierer");
   P ("file.moving", "flytter");
   P ("file.deleting", "sletter");
   P ("file.deleted", "slettet");
   P ("file.restoring", "gendanner");
   P ("file.synced", "synkroniseret");
   P ("form.valid_input", "gyldigt input");
   P ("form.invalid_input", "ugyldigt input");
   P ("form.dirty", "ændret");
   P ("form.pristine", "uændret");
   P ("form.submitted", "indsendt");
   P ("form.submission_failed", "indsendelse mislykkedes");
   P ("health.healthy", "sund");
   P ("health.degraded", "nedsat ydeevne");
   P ("health.unhealthy", "usund");
   P ("health.incident", "hændelse");
   P ("health.maintenance", "vedligeholdelse");
   P ("health.recovering", "genopretter");
   P ("issue.open", "åben");
   P ("issue.closed", "lukket");
   P ("issue.reopened", "genåbnet");
   P ("issue.assigned", "tildelt");
   P ("issue.unassigned", "ikke tildelt");
   P ("issue.merged", "flettet");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "opretter forbindelse");
   P ("network.syncing", "synkroniserer");
   P ("network.sync_failed", "synkronisering mislykkedes");
   P ("network.permission_denied", "adgang nægtet");
   P ("network.read_only", "skrivebeskyttet");
   P ("notification.unread", "ulæst");
   P ("notification.read", "læst");
   P ("notification.muted", "lydløs");
   P ("notification.snoozed", "udsat");
   P ("notification.sent", "sendt");
   P ("notification.delivered", "leveret");
   P ("payment.payment_authorized", "betaling godkendt");
   P ("payment.payment_captured", "betaling hævet");
   P ("payment.payment_refunded", "betaling refunderet");
   P ("payment.payment_disputed", "betaling bestridt");
   P ("payment.payment_requires_action", "betaling kræver handling");
   P ("payment.payment_expired", "betaling udløbet");
   P ("ui.empty", "tom");
   P ("ui.loading", "indlæser");
   P ("ui.saving", "gemmer");
   P ("ui.saved", "gemt");
   P ("ui.unsaved", "ikke gemt");
   P ("ui.retrying", "prøver igen");
   P ("ui.paused", "sat på pause");
   P ("ui.complete", "fuldført");
   P ("ui.failed", "mislykkedes");
   P ("ui.due_soon", "forfalder snart");
   P ("ui.overdue", "forfalden");
   P ("ui.last_seen", "sidst set");
   P ("ui.updated_just_now", "opdateret lige nu");
   P ("queue.queued", "i kø");
   P ("queue.running", "kører");
   P ("queue.waiting", "venter");
   P ("queue.blocked", "blokeret");
   P ("queue.canceled_job", "job annulleret");
   P ("queue.completed_job", "job fuldført");
   P ("search.filtering", "filtrerer");
   P ("search.filtered", "filtreret");
   P ("search.no_matches", "ingen match");
   P ("search.search_ready", "søgning klar");
   P ("search.search_failed", "søgning mislykkedes");
   P ("search.query_too_short", "søgeteksten er for kort");
   P ("security.secure", "sikker");
   P ("security.insecure", "usikker");
   P ("security.vulnerable", "sårbar");
   P ("security.encrypted", "krypteret");
   P ("security.unencrypted", "ukrypteret");
   P ("security.token_expired", "token udløbet");
   P ("sync.sync_idle", "synkronisering inaktiv");
   P ("sync.syncing_now", "synkroniserer nu");
   P ("sync.sync_queued", "synkronisering i kø");
   P ("sync.sync_conflict", "synkroniseringskonflikt");
   P ("sync.sync_complete", "synkronisering fuldført");
   P ("sync.sync_error", "synkroniseringsfejl");
   P ("task.todo", "at gøre");
   P ("task.in_progress", "i gang");
   P ("task.done", "færdig");
   P ("task.skipped", "sprunget over");
   P ("task.blocked_task", "blokeret");
   P ("task.waiting_on", "afventer");
   P ("ticket.ticket_new", "ny sag");
   P ("ticket.ticket_open", "sag åben");
   P ("ticket.ticket_waiting", "sag afventer");
   P ("ticket.ticket_escalated", "sag eskaleret");
   P ("ticket.ticket_resolved", "sag løst");
   P ("ticket.ticket_closed", "sag lukket");
   P ("transfer.importing", "importerer");
   P ("transfer.imported", "importeret");
   P ("transfer.import_failed", "import mislykkedes");
   P ("transfer.exporting", "eksporterer");
   P ("transfer.exported", "eksporteret");
   P ("transfer.export_failed", "eksport mislykkedes");
   P ("validation.required", "påkrævet");
   P ("validation.optional", "valgfri");
   P ("validation.invalid", "ugyldig");
   P ("validation.too_short", "for kort");
   P ("validation.too_long", "for lang");
   P ("validation.out_of_range", "uden for gyldigt interval");
   P ("validation.already_exists", "findes allerede");
   P ("workflow.draft", "kladde");
   P ("workflow.in_review", "under gennemgang");
   P ("workflow.approved", "godkendt");
   P ("workflow.rejected", "afvist");
   P ("workflow.published", "udgivet");
   P ("workflow.archived", "arkiveret");
   P ("database.database_online", "database online");
   P ("database.database_offline", "database offline");
   P ("database.database_degraded", "database med nedsat ydeevne");
   P ("database.database_migrating", "database migreres");
   P ("database.database_migration_failed", "databasemigrering mislykkedes");
   P ("database.database_replicating", "database replikeres");
   P ("database.database_replication_lagging", "databasereplikering halter bagefter");
   P ("database.database_backup_running", "databasebackup kører");
   P ("database.database_backup_failed", "databasebackup mislykkedes");
   P ("times_noun",
      "{count, plural, =0 {aldrig {other}} =1 {én gang {one}} =2 {to gange "
      & "{other}} other {{count} gange {other}}}");
   P ("availability.all",
      "{available} af {total} {total, plural, one {{one}} other {{other}}} "
      & "{available, plural, one {{gender, select, common {tilgængelig} neuter "
      & "{tilgængeligt} other {tilgængelig}}} other {tilgængelige}}");
   P ("availability.none", "ingen {other} tilgængelige");
   P ("availability.partial",
      "{available} af {total} {total, plural, one {{one}} other {{other}}} "
      & "{available, plural, one {{gender, select, common {tilgængelig} neuter "
      & "{tilgængeligt} other {tilgængelig}}} other {tilgængelige}}, "
      & "{unavailable} {unavailable, plural, one {{gender, select, common "
      & "{utilgængelig} neuter {utilgængeligt} other {utilgængelig}}} other "
      & "{utilgængelige}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "i kø");
   P ("operation.running", "kører");
   P ("operation.blocked", "blokeret");
   P ("operation.retrying", "prøver igen");
   P ("operation.succeeded", "lykkedes");
   P ("operation.partially_succeeded", "delvist lykkedes");
   P ("operation.failed", "mislykkedes");
   P ("operation.canceled", "annulleret");
   P ("operation.skipped", "sprunget over");
   P ("operation.stale", "forældet");
   P ("operation.unknown_state", "ukendt");
   P ("operation.last_success", "{name} lykkedes senest {time}");
   P ("operation.next_retry", "{name} næste forsøg: {time}");
   P ("operation.stale_run", "{name} forældet i {time}");
   P ("summary.skipped", "{count} sprunget over");
   P ("summary.retried", "{count} forsøgt igen");
   P ("summary.canceled", "{count} annulleret");
   P ("system.service.operational", "i drift");
   P ("system.service.degraded", "nedsat ydeevne");
   P ("system.service.partial_outage", "delvist nedbrud");
   P ("system.service.major_outage", "større nedbrud");
   P ("system.service.maintenance", "under vedligeholdelse");
   P ("system.service.unknown", "ukendt tjenestestatus");
   P ("system.health.healthy", "sund");
   P ("system.health.warning", "advarsel");
   P ("system.health.critical", "kritisk");
   P ("system.health.unavailable", "utilgængelig");
   P ("system.health.unknown_health", "ukendt tilstand");
   P ("system.readiness.ready", "klar");
   P ("system.readiness.not_ready", "ikke klar");
   P ("system.readiness.starting", "starter");
   P ("system.readiness.draining", "tømmes");
   P ("system.readiness.stopped", "stoppet");
   P ("system.readiness.unknown_readiness", "ukendt parathed");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "starter");
   P ("system.component.stopping", "stopper");
   P ("system.component.restarting", "genstarter");
   P ("system.component.unknown", "ukendt komponentstatus");
   P ("system.check.passing", "bestået");
   P ("system.check.failing", "fejler");
   P ("system.check.warning", "advarsel");
   P ("system.check.skipped", "sprunget over");
   P ("system.check.timed_out", "timeout");
   P ("system.check.unknown", "ukendt kontrolstatus");
   P ("system.incident.investigating", "undersøges");
   P ("system.incident.identified", "identificeret");
   P ("system.incident.monitoring", "overvåges");
   P ("system.incident.resolved", "løst");
   P ("system.incident.scheduled_maintenance", "planlagt vedligeholdelse");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "kontrol {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {ingen komponenter} one {{count} komponent} other "
      & "{{count} komponenter}}");
   P ("system.count.checks",
      "{count, plural, =0 {ingen kontroller} one {{count} kontrol} other "
      & "{{count} kontroller}}");
   P ("system.count.incidents",
      "{count, plural, =0 {ingen hændelser} one {{count} hændelse} other "
      & "{{count} hændelser}}");
   P ("system.uptime", "oppetid {measure}");
   P ("system.latency", "latens {measure}");
   P ("system.maintenance_window", "vedligeholdelsesvindue {time}");
   P ("system.last_checked", "sidst kontrolleret {time}");
   P ("system.http.informational", "information");
   P ("system.http.successful", "succes");
   P ("system.http.redirection", "omdirigering");
   P ("system.http.client_error", "klientfejl");
   P ("system.http.server_error", "serverfejl");
   P ("system.exit.success", "afslutningskode {code}: succes");
   P ("system.exit.failure", "afslutningskode {code}: fejl");
   P ("system.exit.usage_error", "afslutningskode {code}: forkert brug");
   P ("system.exit.not_executable", "afslutningskode {code}: kommandoen kan ikke udføres");
   P ("system.exit.not_found", "afslutningskode {code}: kommandoen blev ikke fundet");
   P ("system.exit.invalid_argument", "afslutningskode {code}: ugyldigt afslutningsargument");
   P ("system.exit.signal", "afslutningskode {code}: afsluttet af {signal}");
   P ("validation.problem.required", "{field}: er påkrævet");
   P ("validation.problem.minimum", "{field}: er under minimum");
   P ("validation.problem.maximum", "{field}: er over maksimum");
   P ("validation.problem.range", "{field}: er uden for det gyldige interval");
   P ("validation.problem.pattern", "{field}: matcher ikke mønsteret");
   P ("validation.problem.choice", "{field}: skal være en af de tilladte værdier");
   P ("validation.problem.dependency", "{field}: afhænger af et andet felt");
   P ("validation.problem.custom", "{field}: ugyldig værdi");
   P ("validation.constraint.no_relation", "{field}: skal være en gyldig værdi ({value})");
   P ("validation.constraint.less_than", "{field}: skal være mindre end {value}");
   P ("validation.constraint.less_or_equal", "{field}: må højst være {value}");
   P ("validation.constraint.greater_than", "{field}: skal være større end {value}");
   P ("validation.constraint.greater_or_equal", "{field}: skal være mindst {value}");
   P ("validation.constraint.equal_to", "{field}: skal være lig med {value}");
   P ("validation.constraint.not_equal_to", "{field}: må ikke være lig med {value}");
   P ("validation.constraint.before_field", "{field}: skal være før {value}");
   P ("validation.constraint.after_field", "{field}: skal være efter {value}");
   P ("validation.choices", "{field}: tilladte værdier er {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, indtastet: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, prøver igen om {time}");
   P ("net_diagnostic.dns", "{endpoint}: DNS-opslag mislykkedes");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-forbindelse mislykkedes");
   P ("net_diagnostic.tls", "{endpoint}: TLS-certifikatkontrol mislykkedes");
   P ("net_diagnostic.http", "{endpoint}: HTTP-anmodning mislykkedes");
   P ("net_diagnostic.proxy", "{endpoint}: proxyfejl");
   P ("net_diagnostic.timeout", "{endpoint}: tidsgrænse overskredet");
   P ("net_diagnostic.reset", "{endpoint}: forbindelsen blev nulstillet");
   P ("net_diagnostic.unknown_network", "{endpoint}: ukendt netværksfejl");
   P ("progress.state.not_started", "ikke startet");
   P ("progress.state.running", "kører");
   P ("progress.state.stalled", "gået i stå");
   P ("progress.state.retrying", "prøver igen");
   P ("progress.state.complete", "fuldført");
   P ("progress.state.failed", "mislykkedes");
   P ("progress.of", "{subject}: {done} af {total} fuldført ({percent} %), {state}");
   P ("progress.done", "{subject}: {done} fuldført, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {element} other {elementer}}, "
      & "{unique} {unique, plural, one {unik værdi} other {unikke værdier}}, "
      & "{duplicates} {duplicates, plural, one {dublet} other {dubletter}}, "
      & "{outliers} {outliers, plural, one {ekstremværdi} other "
      & "{ekstremværdier}}");
   P ("top_frequency", "{name}: {value} ({count} {count, plural, one {gang} other {gange}})");
   P ("calendar_date.fiscal_year", "regnskabsår {year}");
   P ("calendar_date.fiscal_quarter", "{part}. kvt. regnskabsår {year}");
   P ("calendar_date.fiscal_half", "{part}. halvår regnskabsår {year}");
   P ("calendar_date.fiscal_year_end", "udgangen af regnskabsår {year}");
   P ("calendar_date.semester", "{part}. semester {year}");
   P ("calendar_date.half_year", "{part}. halvår {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {første halvdel af {year}} other {anden halvdel af "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {begyndelsen af {text}} mid {midten af {text}} "
      & "other {slutningen af {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {begyndelsen af {text}} mid {midten af {text}} "
      & "other {slutningen af {text}}}");
   P ("calendar_range.weekend.last", "sidste weekend");
   P ("calendar_range.weekend.this", "denne weekend");
   P ("calendar_range.weekend.next", "næste weekend");
   P ("calendar_range.weekend_of", "weekenden den {date}");
   P ("calendar_range.week.last", "sidste uge");
   P ("calendar_range.week.this", "denne uge");
   P ("calendar_range.week.next", "næste uge");
   P ("calendar_range.week_of", "ugen fra {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "fortsæt");
   P ("http.reason.101", "skifter protokol");
   P ("http.reason.102", "behandles");
   P ("http.reason.103", "tidlige hints");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "oprettet");
   P ("http.reason.202", "accepteret");
   P ("http.reason.203", "ikke-autoritativ information");
   P ("http.reason.204", "intet indhold");
   P ("http.reason.205", "nulstil indhold");
   P ("http.reason.206", "delvist indhold");
   P ("http.reason.207", "multistatus");
   P ("http.reason.208", "allerede rapporteret");
   P ("http.reason.226", "IM brugt");
   P ("http.reason.300", "flere valgmuligheder");
   P ("http.reason.301", "flyttet permanent");
   P ("http.reason.302", "fundet");
   P ("http.reason.303", "se andet");
   P ("http.reason.304", "ikke ændret");
   P ("http.reason.305", "brug proxy");
   P ("http.reason.307", "midlertidig omdirigering");
   P ("http.reason.308", "permanent omdirigering");
   P ("http.reason.400", "ugyldig forespørgsel");
   P ("http.reason.401", "ikke autoriseret");
   P ("http.reason.402", "betaling påkrævet");
   P ("http.reason.403", "forbudt");
   P ("http.reason.404", "ikke fundet");
   P ("http.reason.405", "metoden er ikke tilladt");
   P ("http.reason.406", "ikke acceptabel");
   P ("http.reason.407", "proxygodkendelse påkrævet");
   P ("http.reason.408", "forespørgslens tidsfrist udløb");
   P ("http.reason.409", "konflikt");
   P ("http.reason.410", "forsvundet");
   P ("http.reason.411", "længde påkrævet");
   P ("http.reason.412", "forudsætning ikke opfyldt");
   P ("http.reason.413", "indhold for stort");
   P ("http.reason.414", "URI for lang");
   P ("http.reason.415", "medietype understøttes ikke");
   P ("http.reason.416", "område kan ikke opfyldes");
   P ("http.reason.417", "forventning ikke opfyldt");
   P ("http.reason.418", "jeg er en tepotte");
   P ("http.reason.421", "fejldirigeret forespørgsel");
   P ("http.reason.422", "indhold kan ikke behandles");
   P ("http.reason.423", "låst");
   P ("http.reason.424", "mislykket afhængighed");
   P ("http.reason.425", "for tidligt");
   P ("http.reason.426", "opgradering påkrævet");
   P ("http.reason.428", "forudsætning påkrævet");
   P ("http.reason.429", "for mange forespørgsler");
   P ("http.reason.431", "forespørgslens headerfelter er for store");
   P ("http.reason.451", "utilgængelig af juridiske årsager");
   P ("http.reason.500", "intern serverfejl");
   P ("http.reason.501", "ikke implementeret");
   P ("http.reason.502", "ugyldig gateway");
   P ("http.reason.503", "tjenesten er utilgængelig");
   P ("http.reason.504", "gatewayens tidsfrist udløb");
   P ("http.reason.505", "HTTP-versionen understøttes ikke");
   P ("http.reason.506", "varianten forhandler også");
   P ("http.reason.507", "utilstrækkelig lagerplads");
   P ("http.reason.508", "løkke registreret");
   P ("http.reason.510", "ikke udvidet");
   P ("http.reason.511", "netværksgodkendelse påkrævet");
   P ("errno.reason.0", "succes");
   P ("errno.reason.1", "operationen er ikke tilladt");
   P ("errno.reason.2", "ingen sådan fil eller filkatalog");
   P ("errno.reason.3", "ingen sådan proces");
   P ("errno.reason.4", "afbrudt systemkald");
   P ("errno.reason.5", "inddata/uddata-fejl");
   P ("errno.reason.6", "ingen sådan enhed eller adresse");
   P ("errno.reason.9", "ugyldig fildeskriptor");
   P ("errno.reason.11", "resursen midlertidig utilgængelig");
   P ("errno.reason.12", "kan ikke tildele hukommelse");
   P ("errno.reason.13", "adgang nægtet");
   P ("errno.reason.17", "filen eksisterer");
   P ("errno.reason.20", "ikke et katalog");
   P ("errno.reason.21", "er et filkatalog");
   P ("errno.reason.22", "ugyldigt argument");
   P ("errno.reason.24", "for mange åbne filer");
   P ("errno.reason.28", "ikke mere plads på enheden");
   P ("errno.reason.32", "kanalen blev brudt");
   P ("errno.reason.98", "adressen er allerede i brug");
   P ("errno.reason.110", "opkoblingen overskred tidsgrænsen");
   P ("errno.reason.111", "opkobling nægtet");
   P ("signal.reason.1", "læg på (SIGHUP)");
   P ("signal.reason.2", "afbrudt");
   P ("signal.reason.3", "afslut");
   P ("signal.reason.4", "ulovlig instruktion (SIGILL)");
   P ("signal.reason.5", "sporings-/stoppunkts-fælde");
   P ("signal.reason.6", "afbrudt (SIGABRT)");
   P ("signal.reason.7", "busfejl");
   P ("signal.reason.8", "undtagelsestilfælde ved flydende taloperation");
   P ("signal.reason.9", "dræbt");
   P ("signal.reason.10", "brugerdefineret signal 1");
   P ("signal.reason.11", "segmentfejl");
   P ("signal.reason.12", "brugerdefineret signal 2");
   P ("signal.reason.13", "kanalen blev brudt");
   P ("signal.reason.14", "alarmklokke");
   P ("signal.reason.15", "termineret");
   P ("signal.reason.17", "barnet afsluttet");
   P ("signal.reason.18", "fortsættes");
   P ("signal.reason.19", "stoppet (signal)");
   P ("signal.reason.20", "stoppet");
   P ("signal.reason.28", "vinduet blev ændret");
   P ("sqlstate.reason.00", "gennemført");
   P ("sqlstate.reason.01", "advarsel");
   P ("sqlstate.reason.02", "ingen data");
   P ("sqlstate.reason.08", "forbindelsesundtagelse");
   P ("sqlstate.reason.0a", "funktion understøttes ikke");
   P ("sqlstate.reason.22", "dataundtagelse");
   P ("sqlstate.reason.23", "overtrædelse af integritetsbegrænsning");
   P ("sqlstate.reason.24", "ugyldig markørtilstand");
   P ("sqlstate.reason.25", "ugyldig transaktionstilstand");
   P ("sqlstate.reason.28", "ugyldig autorisationsspecifikation");
   P ("sqlstate.reason.2d", "ugyldig transaktionsafslutning");
   P ("sqlstate.reason.3d", "ugyldigt katalognavn");
   P ("sqlstate.reason.3f", "ugyldigt skemanavn");
   P ("sqlstate.reason.40", "transaktionstilbagerulning");
   P ("sqlstate.reason.42", "syntaksfejl eller overtrædelse af adgangsregel");
   P ("sqlstate.reason.53", "utilstrækkelige ressourcer");
   P ("sqlstate.reason.54", "programgrænse overskredet");
   P ("sqlstate.reason.55", "objekt ikke i påkrævet tilstand");
   P ("sqlstate.reason.57", "operatørindgreb");
   P ("sqlstate.reason.58", "systemfejl");
   P ("sqlstate.reason.hv", "fejl i foreign data wrapper");
   P ("sqlstate.reason.p0", "PL/pgSQL-fejl");
   P ("sqlstate.reason.xx", "intern fejl");
   P ("system.signal_numbered", "signal {number} {name} {reason}");
   P ("http.reason.unknown", "ukendt status");
   P ("errno.reason.unknown", "ukendt fejl");
   P ("signal.reason.unknown", "ukendt signal");
   P ("sqlstate.reason.unknown", "ukendt SQLSTATE-klasse");
   P ("diff.changed", "diff {path}: ændret fra {before} til {after}");
   P ("diff.added", "diff {path}: {after} tilføjet");
   P ("diff.removed", "diff {path}: {before} fjernet");
   P ("diff.unchanged", "diff {path}: uændret");
   P ("diff.redacted", "diff {path}: ændret; værdier skjult");
   P ("validation.result",
      "valideringsresultat: {fields} {fields, plural, one {felt} other "
      & "{felter}}, {errors} {errors, plural, one {fejl} other {fejl}}, "
      & "{warnings} {warnings, plural, one {advarsel} other {advarsler}}, "
      & "{required} {required, plural, one {obligatorisk felt} other "
      & "{obligatoriske felter}}, {hidden} {hidden, plural, one {skjult "
      & "problem} other {skjulte problemer}}");
   P ("file.kind.plain", "fil");
   P ("file.kind.directory", "mappe");
   P ("file.kind.archive", "arkiv");
   P ("file.kind.compressed", "komprimeret fil");
   P ("file.kind.image", "billede");
   P ("file.kind.script", "script");
   P ("file.kind.executable", "eksekverbar fil");
   P ("file.kind.unknown", "ukendt fil");
   P ("file.metadata", "fil {name}: {kind}");
   P ("file.checksum", "{text}, kontrolsum {checksum}");
   P ("file.signature_match", "filsignatur {name}: {kind}, svarer til filtypenavnet");
   P ("file.signature_mismatch",
      "filsignatur {name}: ifølge filtypenavnet {expected}, ifølge "
      & "indholdet {actual}");
   P ("network_event.connecting", "forbinder");
   P ("network_event.connected", "forbundet");
   P ("network_event.redirected", "omdirigeret");
   P ("network_event.retrying", "prøver igen");
   P ("network_event.rate_limited", "hastighedsbegrænset");
   P ("network_event.tls_failed", "TLS mislykkedes");
   P ("network_event.stalled", "gået i stå");
   P ("network_event.complete", "fuldført");
   P ("network_event.failed", "mislykkedes");
   P ("network.session", "netværk {endpoint}: {state}");
   P ("diff_node.field", "felt");
   P ("diff_node.object", "objekt");
   P ("diff_node.list", "liste");
   P ("diff.node",
      "diff-node {path}: {kind}, {count} {count, plural, one {ændring} other "
      & "{ændringer}}");
   P ("checksum.not_checked", "kontrolsum ikke kontrolleret");
   P ("checksum.valid", "kontrolsum gyldig");
   P ("checksum.mismatch", "kontrolsum stemmer ikke");
   P ("checksum.missing", "kontrolsum mangler");
   P ("product_code", "produktkode {kind}: {value}, {state}");
   P ("time_zone.utc", "tidszone: UTC");
   P ("time_zone.offset", "tidszone: {offset}");
   P ("time_zone.named", "tidszone: {name} ({offset})");
   P ("time_zone.local", "tidszone: lokal tid");
   P ("time_zone.unknown", "tidszone: ukendt zone");
   P ("time_zone.dst", "{text}, har sommertid");
   P ("zoned_time.plain", "zonetid: {time} {offset}");
   P ("zoned_time.named", "zonetid: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, tvetydig lokal tid");
   P ("number.under", "under {value}");
   P ("number.up_to", "op til {value}");
   P ("number.between", "mellem {low} og {high}");
   P ("number.range_words", "{low} til {high}");
   P ("number.uncertainty_words", "{value} plus/minus {delta}");
   P ("number.range_inclusive", "{low} til og med {high}");
   P ("number.range_exclusive", "større end {low} og mindre end {high}");
   P ("number.range_low_inclusive", "mindst {low} og mindre end {high}");
   P ("number.range_high_inclusive", "større end {low} og højst {high}");
   P ("number.at_least", "mindst {value}");
   P ("number.more_than", "mere end {value}");
   P ("number.at_most", "højst {value}");
   P ("number.less_than", "mindre end {value}");
   P ("number.exactly", "præcis {value}");
   P ("number.within", "{value} ligger inden for {bounds}");
   P ("number.below", "{value} ligger under {bounds}");
   P ("number.above", "{value} ligger over {bounds}");
   P ("number.per", "{numerator} pr. {denominator}");
   P ("number.one_in", "1 ud af {whole}");
   P ("number.out_of", "{value} ud af {whole}");
   P ("number.unchanged", "uændret");
   P ("number.change_up", "steget med {quantity}");
   P ("number.change_down", "faldet med {quantity}");
   P ("number.change_more", "{quantity} flere {tail}");
   P ("number.change_fewer", "{quantity} færre {tail}");
   P ("number.since", "{change} siden {since}");
   P ("duration.countdown", "{duration} tilbage");
   P ("duration.within", "inden for {duration}");
   P ("duration.next", "de næste {duration}");
   P ("duration.between", "mellem {low} og {high}");
   P ("duration.age", "{duration} gammel");
   P ("duration.stale_for", "forældet i {duration}");
   P ("duration.backup_age", "sikkerhedskopien er {duration} gammel");
   P ("duration.eta", "forventet om {duration}");
   P ("duration.expires", "udløber {relative}");
   P ("duration.retrying", "prøver igen {relative}");
   P ("duration.modified", "ændret {relative}");
   P ("duration.synced", "synkroniseret {relative}");
   P ("duration.modified_now", "ændret lige nu");
   P ("duration.synced_now", "synkroniseret lige nu");
   P ("duration.natural.less_than_minute", "under et minut");
   P ("duration.natural.half_hour", "en halv time");
   P ("duration.natural.about_half_hour", "cirka en halv time");
   P ("duration.natural.about", "cirka {duration}");
   P ("duration.natural.almost", "næsten {duration}");
   P ("duration.natural.over", "over {duration}");
   P ("duration.natural.just_over", "lidt over {duration}");
   P ("duration.natural.little_under", "lidt under {duration}");
   P ("duration.natural.few",
      "{unit, select, second {et par sekunder} minute {et par minutter} hour "
      & "{et par timer} day {et par dage} week {et par uger} month {et par "
      & "måneder} year {et par år} other {et par}}");
   P ("duration.distance.past", "for {duration} siden");
   P ("duration.distance.future", "om {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {nord}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNØ} other {nord-nordøst}}");
   P ("geo.direction.north_east", "{style, select, short {NØ} other {nordøst}}");
   P ("geo.direction.east_north_east", "{style, select, short {ØNØ} other {øst-nordøst}}");
   P ("geo.direction.east", "{style, select, short {Ø} other {øst}}");
   P ("geo.direction.east_south_east", "{style, select, short {ØSØ} other {øst-sydøst}}");
   P ("geo.direction.south_east", "{style, select, short {SØ} other {sydøst}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSØ} other {syd-sydøst}}");
   P ("geo.direction.south", "{style, select, short {S} other {syd}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSV} other {syd-sydvest}}");
   P ("geo.direction.south_west", "{style, select, short {SV} other {sydvest}}");
   P ("geo.direction.west_south_west", "{style, select, short {VSV} other {vest-sydvest}}");
   P ("geo.direction.west", "{style, select, short {V} other {vest}}");
   P ("geo.direction.west_north_west", "{style, select, short {VNV} other {vest-nordvest}}");
   P ("geo.direction.north_west", "{style, select, short {NV} other {nordvest}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNV} other {nord-nordvest}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} mod {direction}");
   P ("geo.about_distance_direction", "cirka {distance} mod {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "sydvest {southwest}; nordøst {northeast}");
   P ("geo.inside_box", "inden for afgrænsningsfeltet");
   P ("geo.outside_box", "uden for afgrænsningsfeltet");
   P ("number.about", "cirka {value}");
   P ("number.almost", "næsten {value}");
   P ("number.over", "over {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
end Locale_Da;
