separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Sv (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "sv", Name, Template);
   end P;
begin
   P ("all_count", "alla {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none", "inga {other} matchar");
   P ("filtered_count.all", "alla {total} {total, plural, one {{one}} other {{other}}} matchar");
   P ("filtered_count.some",
      "{matching} av {total} {total, plural, one {{one}} other {{other}}} "
      & "matchar");
   P ("more_count", "{visible} visas, +{remaining} till");
   P ("others_count",
      "{first} och {remaining, plural, one {1 annan} other {{remaining} "
      & "andra}}");
   P ("page_count", "sida {page} av {total}");
   P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per sida");
   P ("pagination_range",
      "{first}–{last} av {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("position_count", "{position} av {total}");
   P ("selection_count",
      "{selected} av {total} {total, plural, one {{one}} other {{other}}} "
      & "{selected, plural, one {{gender, select, common {markerad} neuter "
      & "{markerat} other {markerad}}} other {markerade}}");
   P ("showing_count",
      "visar {showing} av {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("validation_count",
      "{count, plural, =0 {inga {severity, select, error {fel} warning "
      & "{varningar} other {meddelanden}}} one {1 {severity, select, error "
      & "{fel} warning {varning} other {meddelande}}} other {{count} {severity, "
      & "select, error {fel} warning {varningar} other {meddelanden}}}}");
   P ("collection.empty", "inga {other}");
   P ("collection.none_shown", "inga {other} visas");
   P ("collection.showing_hidden",
      "visar {visible} av {total} {total, plural, one {{one}} other "
      & "{{other}}}, {hidden} döljs");
   P ("collection.showing",
      "visar {visible} av {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} other {{other}}} visas, "
      & "{hidden} döljs");
   P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} visas");
   P ("collection.visible_out_of",
      "{visible} av {total} {total, plural, one {{one}} other {{other}}} "
      & "visas");
   P ("complete_count", "{done} av {total} klara");
   P ("percent_complete", "{percent} % klart");
   P ("step_count", "steg {step} av {total}");
   P ("attempt_count", "försök {attempt} av {total}");
   P ("throughput_remaining",
      "{remaining} {remaining, plural, one {{one}} other {{other}}} kvar med "
      & "{rate} {unit}/s");
   P ("accessible_progress", "{done} av {total} klara, {percent} procent");
   P ("business_days", "{days} {days, plural, one {arbetsdag} other {arbetsdagar}}");
   P ("working_hours", "{hours} {hours, plural, one {arbetstimme} other {arbetstimmar}}");
   P ("due.overdue", "förföll för {days} {days, plural, one {dag} other {dagar}} sedan");
   P ("due.today", "förfaller i dag");
   P ("due.tomorrow", "förfaller i morgon");
   P ("due.in", "förfaller om {days} dagar");
   P ("calendar_difference.future", "om {difference}");
   P ("calendar_difference.past", "för {difference} sedan");
   P ("cpu_load", "CPU-belastning {measure}");
   P ("battery", "batteri {measure}");
   P ("screen_size", "skärm {measure}");
   P ("refresh_rate", "uppdateringsfrekvens {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} procent");
   P ("recurrence.second",
      "{every, plural, one {varje sekund} other {med {every} sekunders "
      & "intervall}}");
   P ("recurrence.minute",
      "{every, plural, one {varje minut} other {med {every} minuters "
      & "intervall}}");
   P ("recurrence.hour",
      "{every, plural, one {varje timme} other {med {every} timmars "
      & "intervall}}");
   P ("recurrence.day", "{every, plural, one {varje dag} other {med {every} dagars intervall}}");
   P ("recurrence.week",
      "{every, plural, one {varje vecka} other {med {every} veckors "
      & "intervall}}");
   P ("recurrence.month",
      "{every, plural, one {varje månad} other {med {every} månaders "
      & "intervall}}");
   P ("recurrence.quarter",
      "{every, plural, one {varje kvartal} other {med {every} kvartals "
      & "intervall}}");
   P ("recurrence.year", "{every, plural, one {varje år} other {med {every} års intervall}}");
   P ("cache_summary.empty", "cache: inga förfrågningar");
   P ("cache_summary",
      "cache: {hits} {hits, plural, one {träff} other {träffar}}, {misses} "
      & "{misses, plural, one {miss} other {missar}}, {rate} % träffkvot");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} other {{other}}}: ändrade "
      & "{changed}, tillagda {added}, borttagna {removed}");
   P ("field_diff", "{field} ändrades från {before} till {after}");
   P ("field_added", "{field} lades till som {value}");
   P ("field_removed", "{field} togs bort (var {value})");
   P ("field_unchanged", "{field} förblir {value}");
   P ("number_comparison.equal", "{current} är lika med {baseline}");
   P ("number_comparison.higher", "{current} är {quantity} högre än {baseline}");
   P ("number_comparison.lower", "{current} är {quantity} lägre än {baseline}");
   P ("percent_comparison.equal", "{current} är lika med {baseline}");
   P ("percent_comparison.higher", "{current} är {quantity} högre än {baseline}");
   P ("percent_comparison.lower", "{current} är {quantity} lägre än {baseline}");
   P ("file_size_comparison.same", "{current} har samma storlek som {baseline}");
   P ("file_size_comparison.larger", "{current} är {quantity} större än {baseline}");
   P ("file_size_comparison.smaller", "{current} är {quantity} mindre än {baseline}");
   P ("date_comparison.same", "{current} är samma datum som {baseline}");
   P ("date_comparison.after", "{current} infaller {quantity} efter {baseline}");
   P ("date_comparison.before", "{current} infaller {quantity} före {baseline}");
   P ("queue_summary", "kö: {details}");
   P ("domain_summary",
      "{domain, select, queue {kö} job {jobb} run {körning} cache {cache} "
      & "sync {synkronisering} import {import} export {export} other "
      & "{{domain}}} {state, select, queued {i kö} running {körs} waiting "
      & "{väntar} paused {pausad} complete {klar} failed {misslyckades} stale "
      & "{inaktuell} skipped {hoppades över} other {{state}}}: {details}");
   P ("summary.none", "inga {other}");
   P ("summary.completed",
      "{count} {count, plural, one {{one} {gender, select, common {klar} "
      & "neuter {klart} other {klar}}} other {{other} klara}}");
   P ("summary.completed_of", "{count} av {total} {total, plural, one {{one}} other {{other}}} klara");
   P ("summary.failed", "{count} misslyckades");
   P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} i kö");
   P ("summary.running", "{count} körs");
   P ("summary.complete", "{count} {count, plural, one {klar} other {klara}}");
   P ("backup.backup_running", "säkerhetskopiering pågår");
   P ("backup.backup_completed", "säkerhetskopiering klar");
   P ("backup.backup_failed", "säkerhetskopiering misslyckades");
   P ("backup.backup_stale", "säkerhetskopia inaktuell");
   P ("incident.incident_investigating", "incident undersöks");
   P ("incident.incident_identified", "incident identifierad");
   P ("incident.incident_mitigated", "incident begränsad");
   P ("incident.incident_resolved", "incident löst");
   P ("release.release_drafting", "version förbereds");
   P ("release.release_ready", "version klar");
   P ("release.release_published", "version publicerad");
   P ("release.release_rolled_back", "version återställd");
   P ("audit.audit_created", "granskningspost skapad");
   P ("audit.audit_updated", "granskningspost uppdaterad");
   P ("audit.audit_deleted", "granskningspost borttagen");
   P ("audit.audit_restored", "granskningspost återställd");
   P ("flag.flag_enabled", "funktionsflagga aktiverad");
   P ("flag.flag_disabled", "funktionsflagga inaktiverad");
   P ("flag.flag_rolling_out", "funktionsflagga rullas ut");
   P ("flag.flag_rolled_back", "funktionsflagga återställd");
   P ("webhook.webhook_pending", "webhook väntar");
   P ("webhook.webhook_delivered", "webhook levererad");
   P ("webhook.webhook_failed", "webhook misslyckades");
   P ("webhook.webhook_retrying", "webhook försöker igen");
   P ("api_key.api_key_active", "API-nyckel aktiv");
   P ("api_key.api_key_revoked", "API-nyckel återkallad");
   P ("api_key.api_key_expired", "API-nyckel utgången");
   P ("api_key.api_key_rotated", "API-nyckel roterad");
   P ("quota.quota_available", "kvot tillgänglig");
   P ("quota.quota_near_limit", "kvot nästan förbrukad");
   P ("quota.quota_exceeded", "kvot överskriden");
   P ("quota.quota_reset", "kvot återställd");
   P ("invoice.invoice_draft", "fakturautkast");
   P ("invoice.invoice_sent", "faktura skickad");
   P ("invoice.invoice_paid", "faktura betald");
   P ("invoice.invoice_refunded", "faktura återbetald");
   P ("invoice.invoice_overdue", "faktura förfallen");
   P ("invoice.refund_failed", "återbetalning misslyckades");
   P ("page_navigation.only", "enda sidan");
   P ("page_navigation.first", "första sidan, nästa tillgänglig");
   P ("page_navigation.last", "sista sidan, föregående tillgänglig");
   P ("page_navigation.middle", "föregående och nästa tillgängliga");
   P ("end_of_week", "slutet av veckan");
   P ("end_of_month", "slutet av månaden");
   P ("end_of_quarter", "slutet av kvartalet");
   P ("time_of_day.night", "natt");
   P ("time_of_day.morning", "morgon");
   P ("time_of_day.afternoon", "eftermiddag");
   P ("time_of_day.evening", "kväll");
   P ("calendar_difference.same_day", "samma dag");
   P ("calendar_difference.zero", "0 dagar");
   P ("queue_summary.empty", "kön är tom");
   P ("access.allowed", "tillåten");
   P ("access.denied", "nekad");
   P ("access.owner", "ägare");
   P ("access.admin", "administratör");
   P ("access.viewer", "läsare");
   P ("access.editor", "redigerare");
   P ("auth.signed_in", "inloggad");
   P ("auth.signed_out", "utloggad");
   P ("auth.session_expired", "sessionen har gått ut");
   P ("auth.locked", "låst");
   P ("auth.two_factor_required", "tvåstegsverifiering krävs");
   P ("billing.trialing", "provperiod");
   P ("billing.payment_due", "betalning förfaller");
   P ("billing.payment_failed", "betalningen misslyckades");
   P ("billing.paid", "betald");
   P ("billing.past_due", "förfallen");
   P ("billing.canceled", "uppsagd");
   P ("ci.pipeline_pending", "pipeline väntar");
   P ("ci.pipeline_running", "pipeline körs");
   P ("ci.pipeline_passed", "pipeline godkänd");
   P ("ci.pipeline_failed", "pipeline misslyckades");
   P ("ci.review_required", "granskning krävs");
   P ("ci.deploy_blocked", "driftsättning blockerad");
   P ("collaboration.active_now", "aktiv nu");
   P ("collaboration.away", "borta");
   P ("collaboration.do_not_disturb", "stör ej");
   P ("collaboration.typing", "skriver");
   P ("collaboration.viewing", "tittar");
   P ("collaboration.editing", "redigerar");
   P ("deployment.deploying", "driftsätts");
   P ("deployment.deployed", "driftsatt");
   P ("deployment.rolling_back", "återställs");
   P ("deployment.rolled_back", "återställd");
   P ("deployment.build_failed", "bygget misslyckades");
   P ("deployment.checks_passed", "kontroller godkända");
   P ("empty.no_items", "inga objekt");
   P ("empty.no_results", "inga resultat");
   P ("empty.no_messages", "inga meddelanden");
   P ("empty.no_selection", "inget markerat");
   P ("empty.nothing_to_show", "inget att visa");
   P ("file.uploading", "laddar upp");
   P ("file.downloading", "laddar ned");
   P ("file.copying", "kopierar");
   P ("file.moving", "flyttar");
   P ("file.deleting", "tar bort");
   P ("file.deleted", "borttagen");
   P ("file.restoring", "återställer");
   P ("file.synced", "synkroniserad");
   P ("form.valid_input", "giltig inmatning");
   P ("form.invalid_input", "ogiltig inmatning");
   P ("form.dirty", "ändrad");
   P ("form.pristine", "oändrad");
   P ("form.submitted", "skickad");
   P ("form.submission_failed", "det gick inte att skicka");
   P ("health.healthy", "felfri");
   P ("health.degraded", "försämrad");
   P ("health.unhealthy", "inte felfri");
   P ("health.incident", "incident");
   P ("health.maintenance", "underhåll");
   P ("health.recovering", "återhämtar sig");
   P ("issue.open", "öppen");
   P ("issue.closed", "stängd");
   P ("issue.reopened", "återöppnad");
   P ("issue.assigned", "tilldelad");
   P ("issue.unassigned", "ej tilldelad");
   P ("issue.merged", "sammanfogad");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "ansluter");
   P ("network.syncing", "synkroniserar");
   P ("network.sync_failed", "synkroniseringen misslyckades");
   P ("network.permission_denied", "åtkomst nekad");
   P ("network.read_only", "skrivskyddad");
   P ("notification.unread", "oläst");
   P ("notification.read", "läst");
   P ("notification.muted", "ljudlös");
   P ("notification.snoozed", "snoozad");
   P ("notification.sent", "skickad");
   P ("notification.delivered", "levererad");
   P ("payment.payment_authorized", "betalning auktoriserad");
   P ("payment.payment_captured", "betalning dragen");
   P ("payment.payment_refunded", "betalning återbetald");
   P ("payment.payment_disputed", "betalning bestriden");
   P ("payment.payment_requires_action", "betalning kräver åtgärd");
   P ("payment.payment_expired", "betalning har gått ut");
   P ("ui.empty", "tom");
   P ("ui.loading", "läser in");
   P ("ui.saving", "sparar");
   P ("ui.saved", "sparad");
   P ("ui.unsaved", "inte sparad");
   P ("ui.retrying", "försöker igen");
   P ("ui.paused", "pausad");
   P ("ui.complete", "klar");
   P ("ui.failed", "misslyckades");
   P ("ui.due_soon", "förfaller snart");
   P ("ui.overdue", "försenad");
   P ("ui.last_seen", "senast sedd");
   P ("ui.updated_just_now", "uppdaterad nyss");
   P ("queue.queued", "i kö");
   P ("queue.running", "körs");
   P ("queue.waiting", "väntar");
   P ("queue.blocked", "blockerad");
   P ("queue.canceled_job", "jobb avbrutet");
   P ("queue.completed_job", "jobb slutfört");
   P ("search.filtering", "filtrerar");
   P ("search.filtered", "filtrerad");
   P ("search.no_matches", "inga träffar");
   P ("search.search_ready", "sökning klar");
   P ("search.search_failed", "sökningen misslyckades");
   P ("search.query_too_short", "söktexten är för kort");
   P ("security.secure", "säker");
   P ("security.insecure", "osäker");
   P ("security.vulnerable", "sårbar");
   P ("security.encrypted", "krypterad");
   P ("security.unencrypted", "okrypterad");
   P ("security.token_expired", "token har gått ut");
   P ("sync.sync_idle", "synkronisering inaktiv");
   P ("sync.syncing_now", "synkroniserar nu");
   P ("sync.sync_queued", "synkronisering i kö");
   P ("sync.sync_conflict", "synkroniseringskonflikt");
   P ("sync.sync_complete", "synkronisering klar");
   P ("sync.sync_error", "synkroniseringsfel");
   P ("task.todo", "att göra");
   P ("task.in_progress", "pågår");
   P ("task.done", "klar");
   P ("task.skipped", "överhoppad");
   P ("task.blocked_task", "blockerad");
   P ("task.waiting_on", "väntar på");
   P ("ticket.ticket_new", "nytt ärende");
   P ("ticket.ticket_open", "ärende öppet");
   P ("ticket.ticket_waiting", "ärende väntar");
   P ("ticket.ticket_escalated", "ärende eskalerat");
   P ("ticket.ticket_resolved", "ärende löst");
   P ("ticket.ticket_closed", "ärende stängt");
   P ("transfer.importing", "importerar");
   P ("transfer.imported", "importerad");
   P ("transfer.import_failed", "importen misslyckades");
   P ("transfer.exporting", "exporterar");
   P ("transfer.exported", "exporterad");
   P ("transfer.export_failed", "exporten misslyckades");
   P ("validation.required", "obligatorisk");
   P ("validation.optional", "valfri");
   P ("validation.invalid", "ogiltig");
   P ("validation.too_short", "för kort");
   P ("validation.too_long", "för lång");
   P ("validation.out_of_range", "utanför tillåtet intervall");
   P ("validation.already_exists", "finns redan");
   P ("workflow.draft", "utkast");
   P ("workflow.in_review", "under granskning");
   P ("workflow.approved", "godkänd");
   P ("workflow.rejected", "avvisad");
   P ("workflow.published", "publicerad");
   P ("workflow.archived", "arkiverad");
   P ("database.database_online", "databas online");
   P ("database.database_offline", "databas offline");
   P ("database.database_degraded", "databas försämrad");
   P ("database.database_migrating", "databas migreras");
   P ("database.database_migration_failed", "databasmigreringen misslyckades");
   P ("database.database_replicating", "databas replikeras");
   P ("database.database_replication_lagging", "databasreplikeringen ligger efter");
   P ("database.database_backup_running", "databassäkerhetskopiering pågår");
   P ("database.database_backup_failed", "databassäkerhetskopieringen misslyckades");
   P ("times_noun",
      "{count, plural, =0 {aldrig {other}} =1 {en gång {one}} =2 {två "
      & "gånger {other}} other {{count} gånger {other}}}");
   P ("availability.all",
      "{available} av {total} {total, plural, one {{one}} other {{other}}} "
      & "{available, plural, one {{gender, select, common {tillgänglig} neuter "
      & "{tillgängligt} other {tillgänglig}}} other {tillgängliga}}");
   P ("availability.none", "inga {other} tillgängliga");
   P ("availability.partial",
      "{available} av {total} {total, plural, one {{one}} other {{other}}} "
      & "{available, plural, one {{gender, select, common {tillgänglig} neuter "
      & "{tillgängligt} other {tillgänglig}}} other {tillgängliga}}, "
      & "{unavailable} {unavailable, plural, one {{gender, select, common "
      & "{otillgänglig} neuter {otillgängligt} other {otillgänglig}}} other "
      & "{otillgängliga}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "i kö");
   P ("operation.running", "körs");
   P ("operation.blocked", "blockerad");
   P ("operation.retrying", "försöker igen");
   P ("operation.succeeded", "lyckades");
   P ("operation.partially_succeeded", "lyckades delvis");
   P ("operation.failed", "misslyckades");
   P ("operation.canceled", "avbruten");
   P ("operation.skipped", "hoppades över");
   P ("operation.stale", "inaktuell");
   P ("operation.unknown_state", "okänd");
   P ("operation.last_success", "{name} lyckades senast {time}");
   P ("operation.next_retry", "{name} nästa försök: {time}");
   P ("operation.stale_run", "{name} inaktuell i {time}");
   P ("summary.skipped", "{count} hoppades över");
   P ("summary.retried", "{count} försöktes igen");
   P ("summary.canceled", "{count} avbröts");
   P ("system.service.operational", "i drift");
   P ("system.service.degraded", "försämrad prestanda");
   P ("system.service.partial_outage", "delvist avbrott");
   P ("system.service.major_outage", "större avbrott");
   P ("system.service.maintenance", "under underhåll");
   P ("system.service.unknown", "okänd tjänststatus");
   P ("system.health.healthy", "felfri");
   P ("system.health.warning", "varning");
   P ("system.health.critical", "kritisk");
   P ("system.health.unavailable", "otillgänglig");
   P ("system.health.unknown_health", "okänt hälsotillstånd");
   P ("system.readiness.ready", "redo");
   P ("system.readiness.not_ready", "inte redo");
   P ("system.readiness.starting", "startar");
   P ("system.readiness.draining", "töms");
   P ("system.readiness.stopped", "stoppad");
   P ("system.readiness.unknown_readiness", "okänd beredskap");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "startar");
   P ("system.component.stopping", "stoppar");
   P ("system.component.restarting", "startar om");
   P ("system.component.unknown", "okänd komponentstatus");
   P ("system.check.passing", "godkänd");
   P ("system.check.failing", "misslyckas");
   P ("system.check.warning", "varning");
   P ("system.check.skipped", "överhoppad");
   P ("system.check.timed_out", "tidsgräns överskriden");
   P ("system.check.unknown", "okänd kontrollstatus");
   P ("system.incident.investigating", "undersöks");
   P ("system.incident.identified", "identifierad");
   P ("system.incident.monitoring", "övervakas");
   P ("system.incident.resolved", "löst");
   P ("system.incident.scheduled_maintenance", "planerat underhåll");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "kontroll {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {inga komponenter} one {{count} komponent} other "
      & "{{count} komponenter}}");
   P ("system.count.checks",
      "{count, plural, =0 {inga kontroller} one {{count} kontroll} other "
      & "{{count} kontroller}}");
   P ("system.count.incidents",
      "{count, plural, =0 {inga incidenter} one {{count} incident} other "
      & "{{count} incidenter}}");
   P ("system.uptime", "drifttid {measure}");
   P ("system.latency", "latens {measure}");
   P ("system.maintenance_window", "underhållsfönster {time}");
   P ("system.last_checked", "senast kontrollerad {time}");
   P ("system.http.informational", "information");
   P ("system.http.successful", "lyckad");
   P ("system.http.redirection", "omdirigering");
   P ("system.http.client_error", "klientfel");
   P ("system.http.server_error", "serverfel");
   P ("system.exit.success", "slutkod {code}: lyckades");
   P ("system.exit.failure", "slutkod {code}: misslyckades");
   P ("system.exit.usage_error", "slutkod {code}: felaktig användning");
   P ("system.exit.not_executable", "slutkod {code}: kommandot kan inte köras");
   P ("system.exit.not_found", "slutkod {code}: kommandot hittades inte");
   P ("system.exit.invalid_argument", "slutkod {code}: ogiltigt argument till exit");
   P ("system.exit.signal", "slutkod {code}: avslutad av {signal}");
   P ("validation.problem.required", "{field}: krävs");
   P ("validation.problem.minimum", "{field}: understiger minimum");
   P ("validation.problem.maximum", "{field}: överstiger maximum");
   P ("validation.problem.range", "{field}: ligger utanför tillåtet intervall");
   P ("validation.problem.pattern", "{field}: matchar inte mönstret");
   P ("validation.problem.choice", "{field}: måste vara ett av de tillåtna värdena");
   P ("validation.problem.dependency", "{field}: beror på ett annat fält");
   P ("validation.problem.custom", "{field}: ogiltigt värde");
   P ("validation.constraint.no_relation", "{field}: måste vara ett giltigt värde ({value})");
   P ("validation.constraint.less_than", "{field}: måste vara mindre än {value}");
   P ("validation.constraint.less_or_equal", "{field}: får vara högst {value}");
   P ("validation.constraint.greater_than", "{field}: måste vara större än {value}");
   P ("validation.constraint.greater_or_equal", "{field}: måste vara minst {value}");
   P ("validation.constraint.equal_to", "{field}: måste vara lika med {value}");
   P ("validation.constraint.not_equal_to", "{field}: får inte vara lika med {value}");
   P ("validation.constraint.before_field", "{field}: måste vara före {value}");
   P ("validation.constraint.after_field", "{field}: måste vara efter {value}");
   P ("validation.choices", "{field}: tillåtna värden är {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, angivet: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nytt försök om {time}");
   P ("net_diagnostic.dns", "{endpoint}: DNS-uppslagning misslyckades");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-anslutning misslyckades");
   P ("net_diagnostic.tls", "{endpoint}: TLS-certifikatkontroll misslyckades");
   P ("net_diagnostic.http", "{endpoint}: HTTP-begäran misslyckades");
   P ("net_diagnostic.proxy", "{endpoint}: proxyfel");
   P ("net_diagnostic.timeout", "{endpoint}: tidsgränsen överskreds");
   P ("net_diagnostic.reset", "{endpoint}: anslutningen återställdes");
   P ("net_diagnostic.unknown_network", "{endpoint}: okänt nätverksfel");
   P ("progress.state.not_started", "inte startad");
   P ("progress.state.running", "pågår");
   P ("progress.state.stalled", "har fastnat");
   P ("progress.state.retrying", "försöker igen");
   P ("progress.state.complete", "klar");
   P ("progress.state.failed", "misslyckades");
   P ("progress.of", "{subject}: {done} av {total} klara ({percent} %), {state}");
   P ("progress.done", "{subject}: {done} klara, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {objekt} other {objekt}}, {unique} "
      & "{unique, plural, one {unikt värde} other {unika värden}}, "
      & "{duplicates} {duplicates, plural, one {dubblett} other {dubbletter}}, "
      & "{outliers} {outliers, plural, one {extremvärde} other "
      & "{extremvärden}}");
   P ("top_frequency", "{name}: {value} ({count} {count, plural, one {gång} other {gånger}})");
   P ("calendar_date.fiscal_year", "räkenskapsår {year}");
   P ("calendar_date.fiscal_quarter", "räkenskapsår {year} K{part}");
   P ("calendar_date.fiscal_half", "räkenskapsår {year} H{part}");
   P ("calendar_date.fiscal_year_end", "slutet av räkenskapsår {year}");
   P ("calendar_date.semester", "termin {part} {year}");
   P ("calendar_date.half_year", "halvår {part} {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {första halvåret {year}} other {andra halvåret "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {början av {text}} mid {mitten av {text}} other "
      & "{slutet av {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {början av {text}} mid {mitten av {text}} other "
      & "{slutet av {text}}}");
   P ("calendar_range.weekend.last", "förra helgen");
   P ("calendar_range.weekend.this", "i helgen");
   P ("calendar_range.weekend.next", "nästa helg");
   P ("calendar_range.weekend_of", "helgen {date}");
   P ("calendar_range.week.last", "förra veckan");
   P ("calendar_range.week.this", "den här veckan");
   P ("calendar_range.week.next", "nästa vecka");
   P ("calendar_range.week_of", "veckan från {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "fortsätt");
   P ("http.reason.101", "byter protokoll");
   P ("http.reason.102", "bearbetar");
   P ("http.reason.103", "tidiga tips");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "skapad");
   P ("http.reason.202", "accepterad");
   P ("http.reason.203", "icke-auktoritativ information");
   P ("http.reason.204", "inget innehåll");
   P ("http.reason.205", "återställ innehåll");
   P ("http.reason.206", "partiellt innehåll");
   P ("http.reason.207", "multistatus");
   P ("http.reason.208", "redan rapporterad");
   P ("http.reason.226", "IM använd");
   P ("http.reason.300", "flera val");
   P ("http.reason.301", "permanent flyttad");
   P ("http.reason.302", "hittad");
   P ("http.reason.303", "se annan");
   P ("http.reason.304", "inte ändrad");
   P ("http.reason.305", "använd proxy");
   P ("http.reason.307", "tillfällig omdirigering");
   P ("http.reason.308", "permanent omdirigering");
   P ("http.reason.400", "felaktig begäran");
   P ("http.reason.401", "obehörig");
   P ("http.reason.402", "betalning krävs");
   P ("http.reason.403", "förbjuden");
   P ("http.reason.404", "hittades inte");
   P ("http.reason.405", "metoden tillåts inte");
   P ("http.reason.406", "inte acceptabel");
   P ("http.reason.407", "proxyautentisering krävs");
   P ("http.reason.408", "tidsgränsen för begäran överskreds");
   P ("http.reason.409", "konflikt");
   P ("http.reason.410", "borta");
   P ("http.reason.411", "längd krävs");
   P ("http.reason.412", "förhandsvillkor uppfylldes inte");
   P ("http.reason.413", "innehållet är för stort");
   P ("http.reason.414", "URI för lång");
   P ("http.reason.415", "medietypen stöds inte");
   P ("http.reason.416", "intervallet kan inte uppfyllas");
   P ("http.reason.417", "förväntan uppfylldes inte");
   P ("http.reason.418", "jag är en tekanna");
   P ("http.reason.421", "felriktad begäran");
   P ("http.reason.422", "innehållet kan inte bearbetas");
   P ("http.reason.423", "låst");
   P ("http.reason.424", "misslyckat beroende");
   P ("http.reason.425", "för tidigt");
   P ("http.reason.426", "uppgradering krävs");
   P ("http.reason.428", "förhandsvillkor krävs");
   P ("http.reason.429", "för många begäranden");
   P ("http.reason.431", "begärans huvudfält är för stora");
   P ("http.reason.451", "otillgänglig av juridiska skäl");
   P ("http.reason.500", "internt serverfel");
   P ("http.reason.501", "inte implementerad");
   P ("http.reason.502", "felaktig gateway");
   P ("http.reason.503", "tjänsten är inte tillgänglig");
   P ("http.reason.504", "tidsgränsen för gateway överskreds");
   P ("http.reason.505", "HTTP-versionen stöds inte");
   P ("http.reason.506", "varianten förhandlar också");
   P ("http.reason.507", "otillräckligt lagringsutrymme");
   P ("http.reason.508", "slinga upptäckt");
   P ("http.reason.510", "inte utökad");
   P ("http.reason.511", "nätverksautentisering krävs");
   P ("errno.reason.0", "lyckades");
   P ("errno.reason.1", "åtgärden är inte tillåten");
   P ("errno.reason.2", "filen eller katalogen finns inte");
   P ("errno.reason.3", "processen finns inte");
   P ("errno.reason.4", "avbrutet systemanrop");
   P ("errno.reason.5", "in-/utmatningsfel");
   P ("errno.reason.6", "enheten eller adressen finns inte");
   P ("errno.reason.9", "felaktig filidentifierare");
   P ("errno.reason.11", "resursen är tillfälligt otillgänglig");
   P ("errno.reason.12", "inte tillräckligt med minne");
   P ("errno.reason.13", "åtkomst nekas");
   P ("errno.reason.17", "filen finns redan");
   P ("errno.reason.20", "är inte en katalog");
   P ("errno.reason.21", "är en katalog");
   P ("errno.reason.22", "ogiltigt argument");
   P ("errno.reason.24", "för många öppna filer");
   P ("errno.reason.28", "inget utrymme kvar på enheten");
   P ("errno.reason.32", "brutet rör");
   P ("errno.reason.98", "adressen används redan");
   P ("errno.reason.110", "tidsgränsen för förbindelsen överskreds");
   P ("errno.reason.111", "förbindelsen vägrades");
   P ("signal.reason.1", "avringd");
   P ("signal.reason.2", "avbrott");
   P ("signal.reason.3", "avsluta");
   P ("signal.reason.4", "otillåten instruktion");
   P ("signal.reason.5", "spårningsfälla");
   P ("signal.reason.6", "avbruten");
   P ("signal.reason.7", "bussfel");
   P ("signal.reason.8", "flyttalsundantag");
   P ("signal.reason.9", "dödad");
   P ("signal.reason.10", "användarsignal 1");
   P ("signal.reason.11", "segmenteringsfel");
   P ("signal.reason.12", "användarsignal 2");
   P ("signal.reason.13", "brutet rör");
   P ("signal.reason.14", "alarm");
   P ("signal.reason.15", "begäran om avslutning");
   P ("signal.reason.17", "barnprocessens status ändrad");
   P ("signal.reason.18", "fortsätt");
   P ("signal.reason.19", "stoppad");
   P ("signal.reason.20", "terminalstopp");
   P ("signal.reason.28", "fönsterstorleken ändrad");
   P ("sqlstate.reason.00", "slutfört utan fel");
   P ("sqlstate.reason.01", "varning");
   P ("sqlstate.reason.02", "inga data");
   P ("sqlstate.reason.08", "anslutningsundantag");
   P ("sqlstate.reason.0a", "funktionen stöds inte");
   P ("sqlstate.reason.22", "dataundantag");
   P ("sqlstate.reason.23", "brott mot integritetsvillkor");
   P ("sqlstate.reason.24", "ogiltigt markörtillstånd");
   P ("sqlstate.reason.25", "ogiltigt transaktionstillstånd");
   P ("sqlstate.reason.28", "ogiltig behörighetsspecifikation");
   P ("sqlstate.reason.2d", "ogiltigt transaktionsavslut");
   P ("sqlstate.reason.3d", "ogiltigt katalognamn");
   P ("sqlstate.reason.3f", "ogiltigt schemanamn");
   P ("sqlstate.reason.40", "transaktionsåterställning");
   P ("sqlstate.reason.42", "syntaxfel eller brott mot åtkomstregel");
   P ("sqlstate.reason.53", "otillräckliga resurser");
   P ("sqlstate.reason.54", "programgräns överskriden");
   P ("sqlstate.reason.55", "objektet är inte i nödvändigt tillstånd");
   P ("sqlstate.reason.57", "operatörsingrepp");
   P ("sqlstate.reason.58", "systemfel");
   P ("sqlstate.reason.hv", "fel i foreign data wrapper");
   P ("sqlstate.reason.p0", "PL/pgSQL-fel");
   P ("sqlstate.reason.xx", "internt fel");
   P ("system.signal_numbered", "signal {number} {name} {reason}");
   P ("http.reason.unknown", "okänd status");
   P ("errno.reason.unknown", "okänt fel");
   P ("signal.reason.unknown", "okänd signal");
   P ("sqlstate.reason.unknown", "okänd SQLSTATE-klass");
end Locale_Sv;
