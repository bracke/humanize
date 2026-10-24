separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Af (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "af", Name, Template);
   end P;
begin
   P ("all_count", "al {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none", "geen ooreenstemmende {other} nie");
   P ("filtered_count.all", "al {total} {total, plural, one {{one}} other {{other}}} stem ooreen");
   P ("filtered_count.some",
      "{matching} van {total} {total, plural, one {{one}} other {{other}}} "
      & "stem ooreen");
   P ("more_count", "{visible} gewys, +{remaining} meer");
   P ("others_count",
      "{first} en {remaining, plural, one {1 ander} other {{remaining} "
      & "ander}}");
   P ("page_count", "bladsy {page} van {total}");
   P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per bladsy");
   P ("pagination_range",
      "{first}–{last} van {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("position_count", "{position} van {total}");
   P ("selection_count",
      "{selected} van {total} {total, plural, one {{one}} other {{other}}} "
      & "gekies");
   P ("showing_count",
      "{showing} van {total} {total, plural, one {{one}} other {{other}}} "
      & "gewys");
   P ("validation_count",
      "{count, plural, =0 {geen {severity, select, error {foute} warning "
      & "{waarskuwings} other {kennisgewings}} nie} one {1 {severity, select, "
      & "error {fout} warning {waarskuwing} other {kennisgewing}}} other "
      & "{{count} {severity, select, error {foute} warning {waarskuwings} other "
      & "{kennisgewings}}}}");
   P ("collection.empty", "geen {other} nie");
   P ("collection.none_shown", "geen {other} gewys nie");
   P ("collection.showing_hidden",
      "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
      & "gewys, {hidden} versteek");
   P ("collection.showing",
      "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
      & "gewys");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} other {{other}}} gewys, "
      & "{hidden} versteek");
   P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} gewys");
   P ("collection.visible_out_of",
      "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
      & "sigbaar");
   P ("complete_count", "{done} van {total} voltooi");
   P ("percent_complete", "{percent}% voltooi");
   P ("step_count", "stap {step} van {total}");
   P ("attempt_count", "poging {attempt} van {total}");
   P ("throughput_remaining",
      "nog {remaining} {remaining, plural, one {{one}} other {{other}}} teen "
      & "{rate} {unit}/s");
   P ("accessible_progress", "{done} van {total} voltooi, {percent} persent");
   P ("business_days", "{days} {days, plural, one {werkdag} other {werkdae}}");
   P ("working_hours", "{hours} {hours, plural, one {werkuur} other {werkure}}");
   P ("due.overdue", "{days} {days, plural, one {dag} other {dae}} agterstallig");
   P ("due.today", "verval vandag");
   P ("due.tomorrow", "verval môre");
   P ("due.in", "verval oor {days} dae");
   P ("calendar_difference.future", "oor {difference}");
   P ("calendar_difference.past", "{difference} gelede");
   P ("calendar_difference.same_day", "dieselfde dag");
   P ("calendar_difference.zero", "0 dae");
   P ("cpu_load", "SVE-las {measure}");
   P ("battery", "battery {measure}");
   P ("screen_size", "skerm {measure}");
   P ("refresh_rate", "herlaaitempo {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "{value} persent");
   P ("recurrence.second", "{every, plural, one {elke sekonde} other {elke {every} sekondes}}");
   P ("recurrence.minute", "{every, plural, one {elke minuut} other {elke {every} minute}}");
   P ("recurrence.hour", "{every, plural, one {elke uur} other {elke {every} uur}}");
   P ("recurrence.day", "{every, plural, one {elke dag} other {elke {every} dae}}");
   P ("recurrence.week", "{every, plural, one {elke week} other {elke {every} weke}}");
   P ("recurrence.month", "{every, plural, one {elke maand} other {elke {every} maande}}");
   P ("recurrence.quarter", "{every, plural, one {elke kwartaal} other {elke {every} kwartale}}");
   P ("recurrence.year", "{every, plural, one {elke jaar} other {elke {every} jaar}}");
   P ("cache_summary.empty", "kas: geen versoeke nie");
   P ("cache_summary",
      "kas: {hits} {hits, plural, one {treffer} other {treffers}}, {misses} "
      & "{misses, plural, one {mis} other {misse}}, {rate}% trefferkoers");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
      & "verander, {added} bygevoeg, {removed} verwyder");
   P ("field_diff", "{field} verander van {before} na {after}");
   P ("field_added", "{field} bygevoeg as {value}");
   P ("field_removed", "{field} verwyder (was {value})");
   P ("field_unchanged", "{field} onveranderd op {value}");
   P ("number_comparison.equal", "{current} is gelyk aan {baseline}");
   P ("number_comparison.higher", "{current} is {quantity} hoër as {baseline}");
   P ("number_comparison.lower", "{current} is {quantity} laer as {baseline}");
   P ("percent_comparison.equal", "{current} is gelyk aan {baseline}");
   P ("percent_comparison.higher", "{current} is {quantity} hoër as {baseline}");
   P ("percent_comparison.lower", "{current} is {quantity} laer as {baseline}");
   P ("file_size_comparison.same", "{current} is ewe groot as {baseline}");
   P ("file_size_comparison.larger", "{current} is {quantity} groter as {baseline}");
   P ("file_size_comparison.smaller", "{current} is {quantity} kleiner as {baseline}");
   P ("date_comparison.same", "{current} is dieselfde datum as {baseline}");
   P ("date_comparison.after", "{current} is {quantity} ná {baseline}");
   P ("date_comparison.before", "{current} is {quantity} voor {baseline}");
   P ("queue_summary", "tou: {details}");
   P ("queue_summary.empty", "tou leeg");
   P ("domain_summary",
      "{domain, select, queue {tou} job {taak} run {lopie} cache {kas} sync "
      & "{sinkronisasie} import {invoer} export {uitvoer} other {{domain}}} "
      & "{state, select, queued {in tou} running {loop} waiting {wag} paused "
      & "{onderbreek} complete {voltooi} failed {misluk} stale {verouderd} "
      & "skipped {oorgeslaan} other {{state}}}: {details}");
   P ("summary.none", "geen {other} nie");
   P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} voltooi");
   P ("summary.completed_of",
      "{count} van {total} {total, plural, one {{one}} other {{other}}} "
      & "voltooi");
   P ("summary.failed", "{count} misluk");
   P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} in tou");
   P ("summary.running", "{count} aan die gang");
   P ("summary.complete", "{count} voltooi");
   P ("backup.backup_running", "rugsteun aan die gang");
   P ("backup.backup_completed", "rugsteun voltooi");
   P ("backup.backup_failed", "rugsteun misluk");
   P ("backup.backup_stale", "rugsteun verouderd");
   P ("incident.incident_investigating", "voorval word ondersoek");
   P ("incident.incident_identified", "voorval geïdentifiseer");
   P ("incident.incident_mitigated", "voorval beperk");
   P ("incident.incident_resolved", "voorval opgelos");
   P ("release.release_drafting", "vrystelling word voorberei");
   P ("release.release_ready", "vrystelling gereed");
   P ("release.release_published", "vrystelling gepubliseer");
   P ("release.release_rolled_back", "vrystelling teruggerol");
   P ("audit.audit_created", "ouditinskrywing geskep");
   P ("audit.audit_updated", "ouditinskrywing bygewerk");
   P ("audit.audit_deleted", "ouditinskrywing geskrap");
   P ("audit.audit_restored", "ouditinskrywing herstel");
   P ("flag.flag_enabled", "funksievlag geaktiveer");
   P ("flag.flag_disabled", "funksievlag gedeaktiveer");
   P ("flag.flag_rolling_out", "funksievlag word uitgerol");
   P ("flag.flag_rolled_back", "funksievlag teruggerol");
   P ("webhook.webhook_pending", "webhook hangend");
   P ("webhook.webhook_delivered", "webhook afgelewer");
   P ("webhook.webhook_failed", "webhook misluk");
   P ("webhook.webhook_retrying", "webhook word weer probeer");
   P ("api_key.api_key_active", "API-sleutel aktief");
   P ("api_key.api_key_revoked", "API-sleutel herroep");
   P ("api_key.api_key_expired", "API-sleutel verval");
   P ("api_key.api_key_rotated", "API-sleutel vervang");
   P ("quota.quota_available", "kwota beskikbaar");
   P ("quota.quota_near_limit", "kwota amper bereik");
   P ("quota.quota_exceeded", "kwota oorskry");
   P ("quota.quota_reset", "kwota teruggestel");
   P ("invoice.invoice_draft", "faktuurkonsep");
   P ("invoice.invoice_sent", "faktuur gestuur");
   P ("invoice.invoice_paid", "faktuur betaal");
   P ("invoice.invoice_refunded", "faktuur terugbetaal");
   P ("invoice.invoice_overdue", "faktuur agterstallig");
   P ("invoice.refund_failed", "terugbetaling misluk");
   P ("page_navigation.only", "enigste bladsy");
   P ("page_navigation.first", "eerste bladsy, volgende beskikbaar");
   P ("page_navigation.last", "laaste bladsy, vorige beskikbaar");
   P ("page_navigation.middle", "vorige en volgende beskikbaar");
   P ("end_of_week", "einde van die week");
   P ("end_of_month", "einde van die maand");
   P ("end_of_quarter", "einde van die kwartaal");
   P ("time_of_day.night", "nag");
   P ("time_of_day.morning", "oggend");
   P ("time_of_day.afternoon", "middag");
   P ("time_of_day.evening", "aand");
   P ("access.allowed", "toegelaat");
   P ("access.denied", "geweier");
   P ("access.owner", "eienaar");
   P ("access.admin", "administrateur");
   P ("access.viewer", "kyker");
   P ("access.editor", "redigeerder");
   P ("auth.signed_in", "aangemeld");
   P ("auth.signed_out", "afgemeld");
   P ("auth.session_expired", "sessie verval");
   P ("auth.locked", "gesluit");
   P ("auth.two_factor_required", "tweefaktor-verifikasie vereis");
   P ("billing.trialing", "proeftydperk");
   P ("billing.payment_due", "betaling verskuldig");
   P ("billing.payment_failed", "betaling misluk");
   P ("billing.paid", "betaal");
   P ("billing.past_due", "agterstallig");
   P ("billing.canceled", "gekanselleer");
   P ("ci.pipeline_pending", "pyplyn hangend");
   P ("ci.pipeline_running", "pyplyn loop");
   P ("ci.pipeline_passed", "pyplyn geslaag");
   P ("ci.pipeline_failed", "pyplyn misluk");
   P ("ci.review_required", "hersiening vereis");
   P ("ci.deploy_blocked", "ontplooiing geblokkeer");
   P ("collaboration.active_now", "nou aktief");
   P ("collaboration.away", "weg");
   P ("collaboration.do_not_disturb", "moenie steur nie");
   P ("collaboration.typing", "tik");
   P ("collaboration.viewing", "kyk");
   P ("collaboration.editing", "redigeer");
   P ("deployment.deploying", "word ontplooi");
   P ("deployment.deployed", "ontplooi");
   P ("deployment.rolling_back", "word teruggerol");
   P ("deployment.rolled_back", "teruggerol");
   P ("deployment.build_failed", "bou misluk");
   P ("deployment.checks_passed", "kontroles geslaag");
   P ("empty.no_items", "geen items nie");
   P ("empty.no_results", "geen resultate nie");
   P ("empty.no_messages", "geen boodskappe nie");
   P ("empty.no_selection", "geen keuse nie");
   P ("empty.nothing_to_show", "niks om te wys nie");
   P ("file.uploading", "word opgelaai");
   P ("file.downloading", "word afgelaai");
   P ("file.copying", "word gekopieer");
   P ("file.moving", "word geskuif");
   P ("file.deleting", "word uitgevee");
   P ("file.deleted", "uitgevee");
   P ("file.restoring", "word herstel");
   P ("file.synced", "gesinkroniseer");
   P ("form.valid_input", "geldige invoer");
   P ("form.invalid_input", "ongeldige invoer");
   P ("form.dirty", "verander");
   P ("form.pristine", "onveranderd");
   P ("form.submitted", "ingedien");
   P ("form.submission_failed", "indiening misluk");
   P ("health.healthy", "gesond");
   P ("health.degraded", "verswak");
   P ("health.unhealthy", "ongesond");
   P ("health.incident", "voorval");
   P ("health.maintenance", "onderhoud");
   P ("health.recovering", "herstel tans");
   P ("issue.open", "oop");
   P ("issue.closed", "gesluit");
   P ("issue.reopened", "heropen");
   P ("issue.assigned", "toegewys");
   P ("issue.unassigned", "nie toegewys nie");
   P ("issue.merged", "saamgevoeg");
   P ("network.offline", "vanlyn");
   P ("network.online", "aanlyn");
   P ("network.connecting", "koppel tans");
   P ("network.syncing", "sinkroniseer tans");
   P ("network.sync_failed", "sinkronisering misluk");
   P ("network.permission_denied", "toestemming geweier");
   P ("network.read_only", "leesalleen");
   P ("notification.unread", "ongelees");
   P ("notification.read", "gelees");
   P ("notification.muted", "gedemp");
   P ("notification.snoozed", "uitgestel");
   P ("notification.sent", "gestuur");
   P ("notification.delivered", "afgelewer");
   P ("payment.payment_authorized", "betaling gemagtig");
   P ("payment.payment_captured", "betaling ingevorder");
   P ("payment.payment_refunded", "betaling terugbetaal");
   P ("payment.payment_disputed", "betaling betwis");
   P ("payment.payment_requires_action", "betaling vereis aksie");
   P ("payment.payment_expired", "betaling verval");
   P ("ui.empty", "leeg");
   P ("ui.loading", "laai tans");
   P ("ui.saving", "stoor tans");
   P ("ui.saved", "gestoor");
   P ("ui.unsaved", "nie gestoor nie");
   P ("ui.retrying", "nuwe poging");
   P ("ui.paused", "onderbreek");
   P ("ui.complete", "voltooi");
   P ("ui.failed", "misluk");
   P ("ui.due_soon", "verval binnekort");
   P ("ui.overdue", "agterstallig");
   P ("ui.last_seen", "laas gesien");
   P ("ui.updated_just_now", "sopas bygewerk");
   P ("queue.queued", "in tou");
   P ("queue.running", "loop");
   P ("queue.waiting", "wag");
   P ("queue.blocked", "geblokkeer");
   P ("queue.canceled_job", "taak gekanselleer");
   P ("queue.completed_job", "taak voltooi");
   P ("search.filtering", "filter tans");
   P ("search.filtered", "gefilter");
   P ("search.no_matches", "geen passings nie");
   P ("search.search_ready", "soek gereed");
   P ("search.search_failed", "soek misluk");
   P ("search.query_too_short", "soekterm te kort");
   P ("security.secure", "veilig");
   P ("security.insecure", "onveilig");
   P ("security.vulnerable", "kwesbaar");
   P ("security.encrypted", "geënkripteer");
   P ("security.unencrypted", "ongeënkripteer");
   P ("security.token_expired", "token verval");
   P ("sync.sync_idle", "sinkronisering ledig");
   P ("sync.syncing_now", "sinkroniseer nou");
   P ("sync.sync_queued", "sinkronisering in tou");
   P ("sync.sync_conflict", "sinkroniseringskonflik");
   P ("sync.sync_complete", "sinkronisering voltooi");
   P ("sync.sync_error", "sinkroniseringsfout");
   P ("task.todo", "om te doen");
   P ("task.in_progress", "aan die gang");
   P ("task.done", "klaar");
   P ("task.skipped", "oorgeslaan");
   P ("task.blocked_task", "geblokkeer");
   P ("task.waiting_on", "wag op");
   P ("ticket.ticket_new", "kaartjie nuut");
   P ("ticket.ticket_open", "kaartjie oop");
   P ("ticket.ticket_waiting", "kaartjie wag");
   P ("ticket.ticket_escalated", "kaartjie opgeskaal");
   P ("ticket.ticket_resolved", "kaartjie opgelos");
   P ("ticket.ticket_closed", "kaartjie gesluit");
   P ("transfer.importing", "voer tans in");
   P ("transfer.imported", "ingevoer");
   P ("transfer.import_failed", "invoer misluk");
   P ("transfer.exporting", "voer tans uit");
   P ("transfer.exported", "uitgevoer");
   P ("transfer.export_failed", "uitvoer misluk");
   P ("validation.required", "vereis");
   P ("validation.optional", "opsioneel");
   P ("validation.invalid", "ongeldig");
   P ("validation.too_short", "te kort");
   P ("validation.too_long", "te lank");
   P ("validation.out_of_range", "buite bereik");
   P ("validation.already_exists", "bestaan reeds");
   P ("workflow.draft", "konsep");
   P ("workflow.in_review", "word hersien");
   P ("workflow.approved", "goedgekeur");
   P ("workflow.rejected", "afgekeur");
   P ("workflow.published", "gepubliseer");
   P ("workflow.archived", "geargiveer");
   P ("database.database_online", "databasis aanlyn");
   P ("database.database_offline", "databasis vanlyn");
   P ("database.database_degraded", "databasis verswak");
   P ("database.database_migrating", "databasis word gemigreer");
   P ("database.database_migration_failed", "databasismigrasie misluk");
   P ("database.database_replicating", "databasis word gerepliseer");
   P ("database.database_replication_lagging", "databasisreplikasie sloer");
   P ("database.database_backup_running", "databasisrugsteun loop");
   P ("database.database_backup_failed", "databasisrugsteun misluk");
   P ("times_noun",
      "{count, plural, =0 {nooit {other}} =1 {een keer {one}} =2 {twee keer "
      & "{other}} other {{count} keer {other}}}");
   P ("availability.all",
      "{available} van {total} {total, plural, one {{one}} other {{other}}} "
      & "beskikbaar");
   P ("availability.none", "geen {other} beskikbaar nie");
   P ("availability.partial",
      "{available} van {total} {total, plural, one {{one}} other {{other}}} "
      & "beskikbaar, {unavailable} onbeskikbaar");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "in tou");
   P ("operation.running", "aan die gang");
   P ("operation.blocked", "geblokkeer");
   P ("operation.retrying", "nuwe poging");
   P ("operation.succeeded", "geslaag");
   P ("operation.partially_succeeded", "gedeeltelik geslaag");
   P ("operation.failed", "misluk");
   P ("operation.canceled", "gekanselleer");
   P ("operation.skipped", "oorgeslaan");
   P ("operation.stale", "verouderd");
   P ("operation.unknown_state", "onbekend");
   P ("operation.last_success", "{name} laas geslaag: {time}");
   P ("operation.next_retry", "{name} volgende poging: {time}");
   P ("operation.stale_run", "{name} al {time} verouderd");
   P ("summary.skipped", "{count} oorgeslaan");
   P ("summary.retried", "{count} weer probeer");
   P ("summary.canceled", "{count} gekanselleer");
   P ("system.service.operational", "operasioneel");
   P ("system.service.degraded", "verswakte werkverrigting");
   P ("system.service.partial_outage", "gedeeltelike onderbreking");
   P ("system.service.major_outage", "ernstige onderbreking");
   P ("system.service.maintenance", "onder onderhoud");
   P ("system.service.unknown", "onbekende diensstatus");
   P ("system.health.healthy", "gesond");
   P ("system.health.warning", "waarskuwing");
   P ("system.health.critical", "kritiek");
   P ("system.health.unavailable", "nie beskikbaar nie");
   P ("system.health.unknown_health", "onbekende gesondheidstatus");
   P ("system.readiness.ready", "gereed");
   P ("system.readiness.not_ready", "nie gereed nie");
   P ("system.readiness.starting", "word begin");
   P ("system.readiness.draining", "word leeggemaak");
   P ("system.readiness.stopped", "gestop");
   P ("system.readiness.unknown_readiness", "onbekende gereedheid");
   P ("system.component.online", "aanlyn");
   P ("system.component.offline", "vanlyn");
   P ("system.component.starting", "word begin");
   P ("system.component.stopping", "word gestop");
   P ("system.component.restarting", "word herbegin");
   P ("system.component.unknown", "onbekende komponentstatus");
   P ("system.check.passing", "geslaag");
   P ("system.check.failing", "misluk");
   P ("system.check.warning", "waarskuwing");
   P ("system.check.skipped", "oorgeslaan");
   P ("system.check.timed_out", "tyd verstryk");
   P ("system.check.unknown", "onbekende kontrolestatus");
   P ("system.incident.investigating", "word ondersoek");
   P ("system.incident.identified", "geïdentifiseer");
   P ("system.incident.monitoring", "word gemonitor");
   P ("system.incident.resolved", "opgelos");
   P ("system.incident.scheduled_maintenance", "geskeduleerde onderhoud");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "kontrole {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {geen komponente nie} one {{count} komponent} other "
      & "{{count} komponente}}");
   P ("system.count.checks",
      "{count, plural, =0 {geen kontroles nie} one {{count} kontrole} other "
      & "{{count} kontroles}}");
   P ("system.count.incidents",
      "{count, plural, =0 {geen voorvalle nie} one {{count} voorval} other "
      & "{{count} voorvalle}}");
   P ("system.uptime", "beskikbaarheid {measure}");
   P ("system.latency", "latensie {measure}");
   P ("system.maintenance_window", "onderhoudsvenster {time}");
   P ("system.last_checked", "laas gekontroleer {time}");
   P ("system.http.informational", "informatief");
   P ("system.http.successful", "suksesvol");
   P ("system.http.redirection", "herleiding");
   P ("system.http.client_error", "kliëntfout");
   P ("system.http.server_error", "bedienerfout");
   P ("system.exit.success", "uittreekode {code}: sukses");
   P ("system.exit.failure", "uittreekode {code}: mislukking");
   P ("system.exit.usage_error", "uittreekode {code}: verkeerde gebruik");
   P ("system.exit.not_executable", "uittreekode {code}: opdrag nie uitvoerbaar nie");
   P ("system.exit.not_found", "uittreekode {code}: opdrag nie gevind nie");
   P ("system.exit.invalid_argument", "uittreekode {code}: ongeldige uittree-argument");
   P ("system.exit.signal", "uittreekode {code}: beëindig deur {signal}");
   P ("validation.problem.required", "{field}: is verpligtend");
   P ("validation.problem.minimum", "{field}: is onder die minimum");
   P ("validation.problem.maximum", "{field}: is bo die maksimum");
   P ("validation.problem.range", "{field}: is buite die toegelate bereik");
   P ("validation.problem.pattern", "{field}: pas nie by die patroon nie");
   P ("validation.problem.choice", "{field}: moet een van die toegelate waardes wees");
   P ("validation.problem.dependency", "{field}: hang af van ’n ander veld");
   P ("validation.problem.custom", "{field}: is ongeldig");
   P ("validation.constraint.no_relation", "{field}: moet geldig wees ({value})");
   P ("validation.constraint.less_than", "{field}: moet kleiner as {value} wees");
   P ("validation.constraint.less_or_equal", "{field}: mag hoogstens {value} wees");
   P ("validation.constraint.greater_than", "{field}: moet groter as {value} wees");
   P ("validation.constraint.greater_or_equal", "{field}: moet minstens {value} wees");
   P ("validation.constraint.equal_to", "{field}: moet gelyk aan {value} wees");
   P ("validation.constraint.not_equal_to", "{field}: mag nie gelyk aan {value} wees nie");
   P ("validation.constraint.before_field", "{field}: moet voor {value} wees");
   P ("validation.constraint.after_field", "{field}: moet na {value} wees");
   P ("validation.choices", "{field}: toegelate waardes is {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, invoer: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nuwe poging oor {time}");
   P ("net_diagnostic.dns", "{endpoint}: DNS-opsoek het misluk");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-verbinding het misluk");
   P ("net_diagnostic.tls", "{endpoint}: TLS-sertifikaatkontrole het misluk");
   P ("net_diagnostic.http", "{endpoint}: HTTP-versoek het misluk");
   P ("net_diagnostic.proxy", "{endpoint}: instaanbedienerfout");
   P ("net_diagnostic.timeout", "{endpoint}: tyd het verstryk");
   P ("net_diagnostic.reset", "{endpoint}: verbinding is verbreek");
   P ("net_diagnostic.unknown_network", "{endpoint}: onbekende netwerkfout");
   P ("progress.state.not_started", "nie begin nie");
   P ("progress.state.running", "besig");
   P ("progress.state.stalled", "vasgeval");
   P ("progress.state.retrying", "nuwe poging");
   P ("progress.state.complete", "voltooi");
   P ("progress.state.failed", "misluk");
   P ("progress.of", "{subject}: {done} van {total} voltooi ({percent}%), {state}");
   P ("progress.done", "{subject}: {done} voltooi, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {item} other {items}}, {unique} "
      & "{unique, plural, one {unieke waarde} other {unieke waardes}}, "
      & "{duplicates} {duplicates, plural, one {duplikaat} other {duplikate}}, "
      & "{outliers} {outliers, plural, one {uitskieter} other {uitskieters}}");
   P ("top_frequency", "{name}: {value} ({count} keer)");
   P ("calendar_date.fiscal_year", "boekjaar {year}");
   P ("calendar_date.fiscal_quarter", "boekjaar {year} K{part}");
   P ("calendar_date.fiscal_half", "boekjaar {year} H{part}");
   P ("calendar_date.fiscal_year_end", "einde van boekjaar {year}");
   P ("calendar_date.semester", "{part}e semester {year}");
   P ("calendar_date.half_year", "H{part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {eerste helfte van {year}} other {tweede helfte van "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {begin {text}} mid {middel {text}} other {einde "
      & "{text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {begin {text}} mid {middel {text}} other {einde "
      & "{text}}}");
   P ("calendar_range.weekend.last", "verlede naweek");
   P ("calendar_range.weekend.this", "hierdie naweek");
   P ("calendar_range.weekend.next", "volgende naweek");
   P ("calendar_range.weekend_of", "naweek van {date}");
   P ("calendar_range.week.last", "verlede week");
   P ("calendar_range.week.this", "hierdie week");
   P ("calendar_range.week.next", "volgende week");
   P ("calendar_range.week_of", "week van {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "gaan voort");
   P ("http.reason.101", "wissel protokolle");
   P ("http.reason.102", "word verwerk");
   P ("http.reason.103", "vroeë wenke");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "geskep");
   P ("http.reason.202", "aanvaar");
   P ("http.reason.203", "nie-gesaghebbende inligting");
   P ("http.reason.204", "geen inhoud nie");
   P ("http.reason.205", "stel inhoud terug");
   P ("http.reason.206", "gedeeltelike inhoud");
   P ("http.reason.207", "multistatus");
   P ("http.reason.208", "reeds gerapporteer");
   P ("http.reason.226", "IM gebruik");
   P ("http.reason.300", "veelvuldige keuses");
   P ("http.reason.301", "permanent geskuif");
   P ("http.reason.302", "gevind");
   P ("http.reason.303", "sien ander");
   P ("http.reason.304", "nie gewysig nie");
   P ("http.reason.305", "gebruik instaanbediener");
   P ("http.reason.307", "tydelike herleiding");
   P ("http.reason.308", "permanente herleiding");
   P ("http.reason.400", "ongeldige versoek");
   P ("http.reason.401", "ongemagtig");
   P ("http.reason.402", "betaling vereis");
   P ("http.reason.403", "verbode");
   P ("http.reason.404", "nie gevind nie");
   P ("http.reason.405", "metode nie toegelaat nie");
   P ("http.reason.406", "nie aanvaarbaar nie");
   P ("http.reason.407", "instaanbedienerverifikasie vereis");
   P ("http.reason.408", "versoek het uitgetel");
   P ("http.reason.409", "konflik");
   P ("http.reason.410", "weg");
   P ("http.reason.411", "lengte vereis");
   P ("http.reason.412", "voorvereiste het misluk");
   P ("http.reason.413", "inhoud te groot");
   P ("http.reason.414", "URI te lank");
   P ("http.reason.415", "mediatipe nie ondersteun nie");
   P ("http.reason.416", "omvang nie bevredigbaar nie");
   P ("http.reason.417", "verwagting het misluk");
   P ("http.reason.418", "ek is ’n teepot");
   P ("http.reason.421", "verkeerd gerigte versoek");
   P ("http.reason.422", "onverwerkbare inhoud");
   P ("http.reason.423", "gesluit");
   P ("http.reason.424", "mislukte afhanklikheid");
   P ("http.reason.425", "te vroeg");
   P ("http.reason.426", "opgradering vereis");
   P ("http.reason.428", "voorvereiste vereis");
   P ("http.reason.429", "te veel versoeke");
   P ("http.reason.431", "versoekopskrifvelde te groot");
   P ("http.reason.451", "onbeskikbaar om regsredes");
   P ("http.reason.500", "interne bedienerfout");
   P ("http.reason.501", "nie geïmplementeer nie");
   P ("http.reason.502", "ongeldige poort");
   P ("http.reason.503", "diens onbeskikbaar");
   P ("http.reason.504", "poort het uitgetel");
   P ("http.reason.505", "HTTP-weergawe nie ondersteun nie");
   P ("http.reason.506", "variant onderhandel ook");
   P ("http.reason.507", "onvoldoende berging");
   P ("http.reason.508", "lus bespeur");
   P ("http.reason.510", "nie uitgebrei nie");
   P ("http.reason.511", "netwerkverifikasie vereis");
   P ("errno.reason.0", "sukses");
   P ("errno.reason.1", "bewerking nie toegelaat nie");
   P ("errno.reason.2", "geen sodanige lêer of gids nie");
   P ("errno.reason.3", "geen sodanige proses nie");
   P ("errno.reason.4", "onderbreekte stelseloproep");
   P ("errno.reason.5", "toevoer-/afvoerfout");
   P ("errno.reason.6", "geen sodanige toestel of adres nie");
   P ("errno.reason.9", "ongeldige lêerbeskrywer");
   P ("errno.reason.11", "hulpbron tydelik onbeskikbaar");
   P ("errno.reason.12", "nie genoeg geheue nie");
   P ("errno.reason.13", "toestemming geweier");
   P ("errno.reason.17", "lêer bestaan reeds");
   P ("errno.reason.20", "nie ’n gids nie");
   P ("errno.reason.21", "is ’n gids");
   P ("errno.reason.22", "ongeldige argument");
   P ("errno.reason.24", "te veel oop lêers");
   P ("errno.reason.28", "geen spasie oor op toestel nie");
   P ("errno.reason.32", "gebreekte pyp");
   P ("errno.reason.98", "adres reeds in gebruik");
   P ("errno.reason.110", "verbinding het uitgetel");
   P ("errno.reason.111", "verbinding geweier");
   P ("signal.reason.1", "opgehang");
   P ("signal.reason.2", "onderbreking");
   P ("signal.reason.3", "verlaat");
   P ("signal.reason.4", "onwettige instruksie");
   P ("signal.reason.5", "spoorstrik");
   P ("signal.reason.6", "gestaak");
   P ("signal.reason.7", "busfout");
   P ("signal.reason.8", "dryfpuntuitsondering");
   P ("signal.reason.9", "doodgemaak");
   P ("signal.reason.10", "gebruikersein 1");
   P ("signal.reason.11", "segmenteringsfout");
   P ("signal.reason.12", "gebruikersein 2");
   P ("signal.reason.13", "gebreekte pyp");
   P ("signal.reason.14", "alarm");
   P ("signal.reason.15", "beëindigingsversoek");
   P ("signal.reason.17", "kindstatus verander");
   P ("signal.reason.18", "gaan voort");
   P ("signal.reason.19", "gestop");
   P ("signal.reason.20", "terminaalstop");
   P ("signal.reason.28", "venstergrootte verander");
   P ("sqlstate.reason.00", "suksesvol voltooi");
   P ("sqlstate.reason.01", "waarskuwing");
   P ("sqlstate.reason.02", "geen data nie");
   P ("sqlstate.reason.08", "verbindingsuitsondering");
   P ("sqlstate.reason.0a", "funksie nie ondersteun nie");
   P ("sqlstate.reason.22", "data-uitsondering");
   P ("sqlstate.reason.23", "oortreding van integriteitsbeperking");
   P ("sqlstate.reason.24", "ongeldige wysertoestand");
   P ("sqlstate.reason.25", "ongeldige transaksietoestand");
   P ("sqlstate.reason.28", "ongeldige magtigingspesifikasie");
   P ("sqlstate.reason.2d", "ongeldige transaksiebeëindiging");
   P ("sqlstate.reason.3d", "ongeldige katalogusnaam");
   P ("sqlstate.reason.3f", "ongeldige skemanaam");
   P ("sqlstate.reason.40", "transaksieterugrol");
   P ("sqlstate.reason.42", "sintaksfout of oortreding van toegangsreël");
   P ("sqlstate.reason.53", "onvoldoende hulpbronne");
   P ("sqlstate.reason.54", "programlimiet oorskry");
   P ("sqlstate.reason.55", "objek nie in vereiste toestand nie");
   P ("sqlstate.reason.57", "operateuringryping");
   P ("sqlstate.reason.58", "stelselfout");
   P ("sqlstate.reason.hv", "fout in vreemdedata-omhulsel");
   P ("sqlstate.reason.p0", "PL/pgSQL-fout");
   P ("sqlstate.reason.xx", "interne fout");
   P ("system.signal_numbered", "sein {number} {name} {reason}");
   P ("http.reason.unknown", "onbekende status");
   P ("errno.reason.unknown", "onbekende fout");
   P ("signal.reason.unknown", "onbekende sein");
   P ("sqlstate.reason.unknown", "onbekende SQLSTATE-klas");
   P ("diff.changed", "diff {path}: verander van {before} na {after}");
   P ("diff.added", "diff {path}: {after} bygevoeg");
   P ("diff.removed", "diff {path}: {before} verwyder");
   P ("diff.unchanged", "diff {path}: onveranderd");
   P ("diff.redacted", "diff {path}: verander; waardes verberg");
   P ("validation.result",
      "valideringsresultaat: {fields} {fields, plural, one {veld} other "
      & "{velde}}, {errors} {errors, plural, one {fout} other {foute}}, "
      & "{warnings} {warnings, plural, one {waarskuwing} other {waarskuwings}}, "
      & "{required} {required, plural, one {verpligte veld} other {verpligte "
      & "velde}}, {hidden} {hidden, plural, one {verborge probleem} other "
      & "{verborge probleme}}");
   P ("file.kind.plain", "lêer");
   P ("file.kind.directory", "gids");
   P ("file.kind.archive", "argief");
   P ("file.kind.compressed", "saamgeperste lêer");
   P ("file.kind.image", "beeld");
   P ("file.kind.script", "skrip");
   P ("file.kind.executable", "uitvoerbare lêer");
   P ("file.kind.unknown", "onbekende lêer");
   P ("file.metadata", "lêer {name}: {kind}");
   P ("file.checksum", "{text}, kontrolesom {checksum}");
   P ("file.signature_match", "lêerhandtekening {name}: {kind}, stem ooreen met die uitbreiding");
   P ("file.signature_mismatch",
      "lêerhandtekening {name}: volgens die uitbreiding {expected}, volgens "
      & "die inhoud {actual}");
   P ("network_event.connecting", "koppel tans");
   P ("network_event.connected", "gekoppel");
   P ("network_event.redirected", "herlei");
   P ("network_event.retrying", "probeer weer");
   P ("network_event.rate_limited", "tempolimiet bereik");
   P ("network_event.tls_failed", "TLS het misluk");
   P ("network_event.stalled", "vasgeval");
   P ("network_event.complete", "voltooi");
   P ("network_event.failed", "misluk");
   P ("network.session", "netwerk {endpoint}: {state}");
   P ("diff_node.field", "veld");
   P ("diff_node.object", "objek");
   P ("diff_node.list", "lys");
   P ("diff.node",
      "diff-nodus {path}: {kind}, {count} {count, plural, one {verandering} "
      & "other {veranderinge}}");
   P ("checksum.not_checked", "kontrolesom nie nagegaan nie");
   P ("checksum.valid", "kontrolesom geldig");
   P ("checksum.mismatch", "kontrolesom stem nie ooreen nie");
   P ("checksum.missing", "kontrolesom ontbreek");
   P ("product_code", "produkkode {kind}: {value}, {state}");
   P ("time_zone.utc", "tydsone: UTC");
   P ("time_zone.offset", "tydsone: {offset}");
   P ("time_zone.named", "tydsone: {name} ({offset})");
   P ("time_zone.local", "tydsone: plaaslike tyd");
   P ("time_zone.unknown", "tydsone: onbekende sone");
   P ("time_zone.dst", "{text}, met somertyd");
   P ("zoned_time.plain", "sonetyd: {time} {offset}");
   P ("zoned_time.named", "sonetyd: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, dubbelsinnige plaaslike tyd");
   P ("number.under", "onder {value}");
   P ("number.up_to", "tot {value}");
   P ("number.between", "tussen {low} en {high}");
   P ("number.range_words", "{low} tot {high}");
   P ("number.uncertainty_words", "{value} plus of minus {delta}");
   P ("number.range_inclusive", "{low} tot en met {high}");
   P ("number.range_exclusive", "groter as {low} en kleiner as {high}");
   P ("number.range_low_inclusive", "minstens {low} en kleiner as {high}");
   P ("number.range_high_inclusive", "groter as {low} en hoogstens {high}");
   P ("number.at_least", "minstens {value}");
   P ("number.more_than", "meer as {value}");
   P ("number.at_most", "hoogstens {value}");
   P ("number.less_than", "minder as {value}");
   P ("number.exactly", "presies {value}");
   P ("number.within", "{value} is binne {bounds}");
   P ("number.below", "{value} is onder {bounds}");
   P ("number.above", "{value} is bo {bounds}");
   P ("number.per", "{numerator} per {denominator}");
   P ("number.one_in", "1 uit {whole}");
   P ("number.out_of", "{value} uit {whole}");
   P ("number.unchanged", "onveranderd");
   P ("number.change_up", "gestyg met {quantity}");
   P ("number.change_down", "gedaal met {quantity}");
   P ("number.change_more", "{quantity} {tail} meer");
   P ("number.change_fewer", "{quantity} {tail} minder");
   P ("number.since", "{change} sedert {since}");
   P ("duration.countdown", "{duration} oor");
   P ("duration.within", "binne {duration}");
   P ("duration.next", "volgende {duration}");
   P ("duration.between", "tussen {low} en {high}");
   P ("duration.age", "{duration} oud");
   P ("duration.stale_for", "al {duration} verouderd");
   P ("duration.backup_age", "rugsteun is {duration} oud");
   P ("duration.eta", "verwag oor {duration}");
   P ("duration.expires", "verval {relative}");
   P ("duration.retrying", "probeer weer {relative}");
   P ("duration.modified", "gewysig {relative}");
   P ("duration.synced", "gesinchroniseer {relative}");
   P ("duration.modified_now", "pas gewysig");
   P ("duration.synced_now", "pas gesinchroniseer");
   P ("duration.natural.less_than_minute", "minder as ’n minuut");
   P ("duration.natural.half_hour", "’n halfuur");
   P ("duration.natural.about_half_hour", "ongeveer ’n halfuur");
   P ("duration.natural.about", "ongeveer {duration}");
   P ("duration.natural.almost", "byna {duration}");
   P ("duration.natural.over", "meer as {duration}");
   P ("duration.natural.just_over", "net meer as {duration}");
   P ("duration.natural.little_under", "net minder as {duration}");
   P ("duration.natural.few",
      "{unit, select, second {’n paar sekondes} minute {’n paar minute} "
      & "hour {’n paar uur} day {’n paar dae} week {’n paar weke} month "
      & "{’n paar maande} year {’n paar jaar} other {’n paar}}");
   P ("duration.distance.past", "{duration} gelede");
   P ("duration.distance.future", "oor {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {noord}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNO} other {noord-noordoos}}");
   P ("geo.direction.north_east", "{style, select, short {NO} other {noordoos}}");
   P ("geo.direction.east_north_east", "{style, select, short {ONO} other {oos-noordoos}}");
   P ("geo.direction.east", "{style, select, short {O} other {oos}}");
   P ("geo.direction.east_south_east", "{style, select, short {OSO} other {oos-suidoos}}");
   P ("geo.direction.south_east", "{style, select, short {SO} other {suidoos}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSO} other {suid-suidoos}}");
   P ("geo.direction.south", "{style, select, short {S} other {suid}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSW} other {suid-suidwes}}");
   P ("geo.direction.south_west", "{style, select, short {SW} other {suidwes}}");
   P ("geo.direction.west_south_west", "{style, select, short {WSW} other {wes-suidwes}}");
   P ("geo.direction.west", "{style, select, short {W} other {wes}}");
   P ("geo.direction.west_north_west", "{style, select, short {WNW} other {wes-noordwes}}");
   P ("geo.direction.north_west", "{style, select, short {NW} other {noordwes}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNW} other {noord-noordwes}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "ongeveer {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "suidwes {southwest}; noordoos {northeast}");
   P ("geo.inside_box", "binne begrensingsraam");
   P ("geo.outside_box", "buite begrensingsraam");
   P ("number.about", "ongeveer {value}");
   P ("number.almost", "byna {value}");
   P ("number.over", "meer as {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
end Locale_Af;
