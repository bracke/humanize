separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_No (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "no", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
begin
   P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}");
   P ("filtered_count.none", "ingen {other} samsvarer");
   P ("filtered_count.all", "alle {total} {total, plural, one {{one}} other {{other}}} samsvarer");
   P ("filtered_count.some",
      "{matching} av {total} {total, plural, one {{one}} other {{other}}} "
      & "samsvarer");
   P ("more_count", "{visible} vist, +{remaining} til");
   P ("others_count",
      "{first} og {remaining, plural, one {1 annen} other {{remaining} "
      & "andre}}");
   P ("page_count", "side {page} av {total}");
   P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per side");
   P ("pagination_range",
      "{first}–{last} av {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("position_count", "{position} av {total}");
   P ("selection_count",
      "{selected} av {total} {total, plural, one {{one}} other {{other}}} "
      & "valgt");
   P ("showing_count",
      "viser {showing} av {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("validation_count",
      "{count, plural, =0 {ingen {severity, select, error {feil} warning "
      & "{advarsler} other {merknader}}} one {1 {severity, select, error {feil} "
      & "warning {advarsel} other {merknad}}} other {{count} {severity, select, "
      & "error {feil} warning {advarsler} other {merknader}}}}");
   P ("collection.empty", "ingen {other}");
   P ("collection.none_shown", "ingen {other} vises");
   P ("collection.showing_hidden",
      "viser {visible} av {total} {total, plural, one {{one}} other "
      & "{{other}}}, {hidden} skjult");
   P ("collection.showing",
      "viser {visible} av {total} {total, plural, one {{one}} other "
      & "{{other}}}");
   P ("collection.shown_hidden",
      "{visible} {visible, plural, one {{one}} other {{other}}} vises, "
      & "{hidden} skjult");
   P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} vises");
   P ("collection.visible_out_of",
      "{visible} av {total} {total, plural, one {{one}} other {{other}}} "
      & "synlige");
   P ("complete_count", "{done} av {total} fullført");
   P ("percent_complete", "{percent} % fullført");
   P ("step_count", "trinn {step} av {total}");
   P ("attempt_count", "forsøk {attempt} av {total}");
   P ("throughput_remaining",
      "{remaining} {remaining, plural, one {{one}} other {{other}}} igjen med "
      & "{rate} {unit}/s");
   P ("accessible_progress", "{done} av {total} fullført, {percent} prosent");
   P ("business_days", "{days} {days, plural, one {virkedag} other {virkedager}}");
   P ("working_hours", "{hours} {hours, plural, one {arbeidstime} other {arbeidstimer}}");
   P ("due.overdue", "forfalt for {days} {days, plural, one {dag} other {dager}} siden");
   P ("due.today", "forfaller i dag");
   P ("due.tomorrow", "forfaller i morgen");
   P ("due.in", "forfaller om {days} dager");
   P ("calendar_difference.future", "om {difference}");
   P ("calendar_difference.past", "for {difference} siden");
   P ("cpu_load", "CPU-belastning {measure}");
   P ("battery", "batteri {measure}");
   P ("screen_size", "skjerm {measure}");
   P ("refresh_rate", "oppdateringsfrekvens {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word", "{value} prosent");
   P ("recurrence.second", "{every, plural, one {hvert sekund} other {hvert {every}. sekund}}");
   P ("recurrence.minute", "{every, plural, one {hvert minutt} other {hvert {every}. minutt}}");
   P ("recurrence.hour", "{every, plural, one {hver time} other {hver {every}. time}}");
   P ("recurrence.day", "{every, plural, one {hver dag} other {hver {every}. dag}}");
   P ("recurrence.week", "{every, plural, one {hver uke} other {hver {every}. uke}}");
   P ("recurrence.month", "{every, plural, one {hver måned} other {hver {every}. måned}}");
   P ("recurrence.quarter", "{every, plural, one {hvert kvartal} other {hvert {every}. kvartal}}");
   P ("recurrence.year", "{every, plural, one {hvert år} other {hvert {every}. år}}");
   P ("cache_summary.empty", "hurtigbuffer: ingen forespørsler");
   P ("cache_summary", "hurtigbuffer: {hits} treff, {misses} bom, {rate} % treffrate");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
      & "endret, {added} lagt til, {removed} fjernet");
   P ("field_diff", "{field} endret fra {before} til {after}");
   P ("field_added", "{field} lagt til som {value}");
   P ("field_removed", "{field} fjernet (var {value})");
   P ("field_unchanged", "{field} uendret ({value})");
   P ("number_comparison.equal", "{current} er lik {baseline}");
   P ("number_comparison.higher", "{current} er {quantity} høyere enn {baseline}");
   P ("number_comparison.lower", "{current} er {quantity} lavere enn {baseline}");
   P ("percent_comparison.equal", "{current} er lik {baseline}");
   P ("percent_comparison.higher", "{current} er {quantity} høyere enn {baseline}");
   P ("percent_comparison.lower", "{current} er {quantity} lavere enn {baseline}");
   P ("file_size_comparison.same", "{current} har samme størrelse som {baseline}");
   P ("file_size_comparison.larger", "{current} er {quantity} større enn {baseline}");
   P ("file_size_comparison.smaller", "{current} er {quantity} mindre enn {baseline}");
   P ("date_comparison.same", "{current} er samme dato som {baseline}");
   P ("date_comparison.after", "{current} er {quantity} etter {baseline}");
   P ("date_comparison.before", "{current} er {quantity} før {baseline}");
   P ("queue_summary", "kø: {details}");
   P ("domain_summary",
      "{domain, select, queue {kø} job {jobb} run {kjøring} cache "
      & "{hurtigbuffer} sync {synkronisering} import {import} export {eksport} "
      & "other {{domain}}} {state, select, queued {i kø} running {kjører} "
      & "waiting {venter} paused {satt på pause} complete {fullført} failed "
      & "{mislyktes} stale {utdatert} skipped {hoppet over} other {{state}}}: "
      & "{details}");
   P ("summary.none", "ingen {other}");
   P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} fullført");
   P ("summary.completed_of",
      "{count} av {total} {total, plural, one {{one}} other {{other}}} "
      & "fullført");
   P ("summary.failed", "{count} mislyktes");
   P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} i kø");
   P ("summary.running", "{count} kjører");
   P ("summary.complete", "{count} fullført");
   P ("backup.backup_running", "sikkerhetskopiering pågår");
   P ("backup.backup_completed", "sikkerhetskopiering fullført");
   P ("backup.backup_failed", "sikkerhetskopiering mislyktes");
   P ("backup.backup_stale", "sikkerhetskopi utdatert");
   P ("incident.incident_investigating", "hendelse undersøkes");
   P ("incident.incident_identified", "hendelse identifisert");
   P ("incident.incident_mitigated", "hendelse begrenset");
   P ("incident.incident_resolved", "hendelse løst");
   P ("release.release_drafting", "utgivelse under forberedelse");
   P ("release.release_ready", "utgivelse klar");
   P ("release.release_published", "utgivelse publisert");
   P ("release.release_rolled_back", "utgivelse rullet tilbake");
   P ("audit.audit_created", "revisjonsoppføring opprettet");
   P ("audit.audit_updated", "revisjonsoppføring oppdatert");
   P ("audit.audit_deleted", "revisjonsoppføring slettet");
   P ("audit.audit_restored", "revisjonsoppføring gjenopprettet");
   P ("flag.flag_enabled", "funksjonsflagg aktivert");
   P ("flag.flag_disabled", "funksjonsflagg deaktivert");
   P ("flag.flag_rolling_out", "funksjonsflagg rulles ut");
   P ("flag.flag_rolled_back", "funksjonsflagg rullet tilbake");
   P ("webhook.webhook_pending", "webhook venter");
   P ("webhook.webhook_delivered", "webhook levert");
   P ("webhook.webhook_failed", "webhook mislyktes");
   P ("webhook.webhook_retrying", "webhook prøves på nytt");
   P ("api_key.api_key_active", "API-nøkkel aktiv");
   P ("api_key.api_key_revoked", "API-nøkkel tilbakekalt");
   P ("api_key.api_key_expired", "API-nøkkel utløpt");
   P ("api_key.api_key_rotated", "API-nøkkel rotert");
   P ("quota.quota_available", "kvote tilgjengelig");
   P ("quota.quota_near_limit", "kvote nesten brukt opp");
   P ("quota.quota_exceeded", "kvote overskredet");
   P ("quota.quota_reset", "kvote tilbakestilt");
   P ("invoice.invoice_draft", "fakturautkast");
   P ("invoice.invoice_sent", "faktura sendt");
   P ("invoice.invoice_paid", "faktura betalt");
   P ("invoice.invoice_refunded", "faktura refundert");
   P ("invoice.invoice_overdue", "faktura forfalt");
   P ("invoice.refund_failed", "refusjon mislyktes");
   P ("page_navigation.only", "eneste side");
   P ("page_navigation.first", "første side, neste tilgjengelig");
   P ("page_navigation.last", "siste side, forrige tilgjengelig");
   P ("page_navigation.middle", "forrige og neste tilgjengelig");
   P ("end_of_week", "slutten av uken");
   P ("end_of_month", "slutten av måneden");
   P ("end_of_quarter", "slutten av kvartalet");
   P ("time_of_day.night", "natt");
   P ("time_of_day.morning", "morgen");
   P ("time_of_day.afternoon", "ettermiddag");
   P ("time_of_day.evening", "kveld");
   P ("calendar_difference.same_day", "samme dag");
   P ("calendar_difference.zero", "0 dager");
   P ("queue_summary.empty", "køen er tom");
   P ("access.allowed", "tillatt");
   P ("access.denied", "nektet");
   P ("access.owner", "eier");
   P ("access.admin", "administrator");
   P ("access.viewer", "leser");
   P ("access.editor", "redaktør");
   P ("auth.signed_in", "logget på");
   P ("auth.signed_out", "logget av");
   P ("auth.session_expired", "økten er utløpt");
   P ("auth.locked", "låst");
   P ("auth.two_factor_required", "totrinnsbekreftelse kreves");
   P ("billing.trialing", "prøveperiode");
   P ("billing.payment_due", "betaling forfaller");
   P ("billing.payment_failed", "betalingen mislyktes");
   P ("billing.paid", "betalt");
   P ("billing.past_due", "forfalt");
   P ("billing.canceled", "avbrutt");
   P ("ci.pipeline_pending", "pipeline venter");
   P ("ci.pipeline_running", "pipeline kjører");
   P ("ci.pipeline_passed", "pipeline bestått");
   P ("ci.pipeline_failed", "pipeline mislyktes");
   P ("ci.review_required", "gjennomgang kreves");
   P ("ci.deploy_blocked", "utrulling blokkert");
   P ("collaboration.active_now", "aktiv nå");
   P ("collaboration.away", "borte");
   P ("collaboration.do_not_disturb", "ikke forstyrr");
   P ("collaboration.typing", "skriver");
   P ("collaboration.viewing", "ser på");
   P ("collaboration.editing", "redigerer");
   P ("deployment.deploying", "rulles ut");
   P ("deployment.deployed", "rullet ut");
   P ("deployment.rolling_back", "rulles tilbake");
   P ("deployment.rolled_back", "rullet tilbake");
   P ("deployment.build_failed", "bygget mislyktes");
   P ("deployment.checks_passed", "kontroller bestått");
   P ("empty.no_items", "ingen elementer");
   P ("empty.no_results", "ingen resultater");
   P ("empty.no_messages", "ingen meldinger");
   P ("empty.no_selection", "ingenting valgt");
   P ("empty.nothing_to_show", "ingenting å vise");
   P ("file.uploading", "laster opp");
   P ("file.downloading", "laster ned");
   P ("file.copying", "kopierer");
   P ("file.moving", "flytter");
   P ("file.deleting", "sletter");
   P ("file.deleted", "slettet");
   P ("file.restoring", "gjenoppretter");
   P ("file.synced", "synkronisert");
   P ("form.valid_input", "gyldig inndata");
   P ("form.invalid_input", "ugyldig inndata");
   P ("form.dirty", "endret");
   P ("form.pristine", "uendret");
   P ("form.submitted", "sendt inn");
   P ("form.submission_failed", "innsending mislyktes");
   P ("health.healthy", "sunn");
   P ("health.degraded", "redusert ytelse");
   P ("health.unhealthy", "usunn");
   P ("health.incident", "hendelse");
   P ("health.maintenance", "vedlikehold");
   P ("health.recovering", "gjenoppretter");
   P ("issue.open", "åpen");
   P ("issue.closed", "lukket");
   P ("issue.reopened", "gjenåpnet");
   P ("issue.assigned", "tildelt");
   P ("issue.unassigned", "ikke tildelt");
   P ("issue.merged", "flettet");
   P ("network.offline", "frakoblet");
   P ("network.online", "tilkoblet");
   P ("network.connecting", "kobler til");
   P ("network.syncing", "synkroniserer");
   P ("network.sync_failed", "synkronisering mislyktes");
   P ("network.permission_denied", "tilgang nektet");
   P ("network.read_only", "skrivebeskyttet");
   P ("notification.unread", "ulest");
   P ("notification.read", "lest");
   P ("notification.muted", "dempet");
   P ("notification.snoozed", "utsatt");
   P ("notification.sent", "sendt");
   P ("notification.delivered", "levert");
   P ("payment.payment_authorized", "betaling autorisert");
   P ("payment.payment_captured", "betaling trukket");
   P ("payment.payment_refunded", "betaling refundert");
   P ("payment.payment_disputed", "betaling bestridt");
   P ("payment.payment_requires_action", "betaling krever handling");
   P ("payment.payment_expired", "betaling utløpt");
   P ("ui.empty", "tom");
   P ("ui.loading", "laster inn");
   P ("ui.saving", "lagrer");
   P ("ui.saved", "lagret");
   P ("ui.unsaved", "ikke lagret");
   P ("ui.retrying", "prøver på nytt");
   P ("ui.paused", "satt på pause");
   P ("ui.complete", "fullført");
   P ("ui.failed", "mislyktes");
   P ("ui.due_soon", "forfaller snart");
   P ("ui.overdue", "forfalt");
   P ("ui.last_seen", "sist sett");
   P ("ui.updated_just_now", "oppdatert akkurat nå");
   P ("queue.queued", "i kø");
   P ("queue.running", "kjører");
   P ("queue.waiting", "venter");
   P ("queue.blocked", "blokkert");
   P ("queue.canceled_job", "jobb avbrutt");
   P ("queue.completed_job", "jobb fullført");
   P ("search.filtering", "filtrerer");
   P ("search.filtered", "filtrert");
   P ("search.no_matches", "ingen treff");
   P ("search.search_ready", "søk klart");
   P ("search.search_failed", "søket mislyktes");
   P ("search.query_too_short", "søket er for kort");
   P ("security.secure", "sikker");
   P ("security.insecure", "usikker");
   P ("security.vulnerable", "sårbar");
   P ("security.encrypted", "kryptert");
   P ("security.unencrypted", "ukryptert");
   P ("security.token_expired", "token utløpt");
   P ("sync.sync_idle", "synkronisering inaktiv");
   P ("sync.syncing_now", "synkroniserer nå");
   P ("sync.sync_queued", "synkronisering i kø");
   P ("sync.sync_conflict", "synkroniseringskonflikt");
   P ("sync.sync_complete", "synkronisering fullført");
   P ("sync.sync_error", "synkroniseringsfeil");
   P ("task.todo", "å gjøre");
   P ("task.in_progress", "pågår");
   P ("task.done", "ferdig");
   P ("task.skipped", "hoppet over");
   P ("task.blocked_task", "blokkert");
   P ("task.waiting_on", "venter på");
   P ("ticket.ticket_new", "ny sak");
   P ("ticket.ticket_open", "sak åpen");
   P ("ticket.ticket_waiting", "sak venter");
   P ("ticket.ticket_escalated", "sak eskalert");
   P ("ticket.ticket_resolved", "sak løst");
   P ("ticket.ticket_closed", "sak lukket");
   P ("transfer.importing", "importerer");
   P ("transfer.imported", "importert");
   P ("transfer.import_failed", "import mislyktes");
   P ("transfer.exporting", "eksporterer");
   P ("transfer.exported", "eksportert");
   P ("transfer.export_failed", "eksport mislyktes");
   P ("validation.required", "påkrevd");
   P ("validation.optional", "valgfri");
   P ("validation.invalid", "ugyldig");
   P ("validation.too_short", "for kort");
   P ("validation.too_long", "for lang");
   P ("validation.out_of_range", "utenfor gyldig område");
   P ("validation.already_exists", "finnes allerede");
   P ("workflow.draft", "utkast");
   P ("workflow.in_review", "til gjennomgang");
   P ("workflow.approved", "godkjent");
   P ("workflow.rejected", "avvist");
   P ("workflow.published", "publisert");
   P ("workflow.archived", "arkivert");
   P ("database.database_online", "database tilkoblet");
   P ("database.database_offline", "database frakoblet");
   P ("database.database_degraded", "database med redusert ytelse");
   P ("database.database_migrating", "database migreres");
   P ("database.database_migration_failed", "databasemigrering mislyktes");
   P ("database.database_replicating", "database replikeres");
   P ("database.database_replication_lagging", "databasereplikering henger etter");
   P ("database.database_backup_running", "databasesikkerhetskopiering pågår");
   P ("database.database_backup_failed", "databasesikkerhetskopiering mislyktes");
   P ("times_noun",
      "{count, plural, =0 {aldri {other}} =1 {én gang {one}} =2 {to ganger "
      & "{other}} other {{count} ganger {other}}}");
   P ("availability.all",
      "{available} av {total} {total, plural, one {{one}} other {{other}}} "
      & "{available, plural, one {tilgjengelig} other {tilgjengelige}}");
   P ("availability.none", "ingen {other} tilgjengelige");
   P ("availability.partial",
      "{available} av {total} {total, plural, one {{one}} other {{other}}} "
      & "{available, plural, one {tilgjengelig} other {tilgjengelige}}, "
      & "{unavailable} {unavailable, plural, one {utilgjengelig} other "
      & "{utilgjengelige}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "i kø");
   P ("operation.running", "kjører");
   P ("operation.blocked", "blokkert");
   P ("operation.retrying", "prøver på nytt");
   P ("operation.succeeded", "vellykket");
   P ("operation.partially_succeeded", "delvis vellykket");
   P ("operation.failed", "mislyktes");
   P ("operation.canceled", "avbrutt");
   P ("operation.skipped", "hoppet over");
   P ("operation.stale", "utdatert");
   P ("operation.unknown_state", "ukjent");
   P ("operation.last_success", "{name} lyktes sist {time}");
   P ("operation.next_retry", "{name} neste forsøk: {time}");
   P ("operation.stale_run", "{name} utdatert i {time}");
   P ("summary.skipped", "{count} hoppet over");
   P ("summary.retried", "{count} forsøkt på nytt");
   P ("summary.canceled", "{count} avbrutt");
   P ("system.service.operational", "i drift");
   P ("system.service.degraded", "redusert ytelse");
   P ("system.service.partial_outage", "delvis driftsavbrudd");
   P ("system.service.major_outage", "større driftsavbrudd");
   P ("system.service.maintenance", "under vedlikehold");
   P ("system.service.unknown", "ukjent tjenestestatus");
   P ("system.health.healthy", "sunn");
   P ("system.health.warning", "advarsel");
   P ("system.health.critical", "kritisk");
   P ("system.health.unavailable", "utilgjengelig");
   P ("system.health.unknown_health", "ukjent helsetilstand");
   P ("system.readiness.ready", "klar");
   P ("system.readiness.not_ready", "ikke klar");
   P ("system.readiness.starting", "starter");
   P ("system.readiness.draining", "tømmes");
   P ("system.readiness.stopped", "stoppet");
   P ("system.readiness.unknown_readiness", "ukjent beredskap");
   P ("system.component.online", "tilkoblet");
   P ("system.component.offline", "frakoblet");
   P ("system.component.starting", "starter");
   P ("system.component.stopping", "stopper");
   P ("system.component.restarting", "starter på nytt");
   P ("system.component.unknown", "ukjent komponentstatus");
   P ("system.check.passing", "bestått");
   P ("system.check.failing", "feiler");
   P ("system.check.warning", "advarsel");
   P ("system.check.skipped", "hoppet over");
   P ("system.check.timed_out", "tidsavbrudd");
   P ("system.check.unknown", "ukjent kontrollstatus");
   P ("system.incident.investigating", "undersøkes");
   P ("system.incident.identified", "identifisert");
   P ("system.incident.monitoring", "overvåkes");
   P ("system.incident.resolved", "løst");
   P ("system.incident.scheduled_maintenance", "planlagt vedlikehold");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "kontroll {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {ingen komponenter} one {{count} komponent} other "
      & "{{count} komponenter}}");
   P ("system.count.checks",
      "{count, plural, =0 {ingen kontroller} one {{count} kontroll} other "
      & "{{count} kontroller}}");
   P ("system.count.incidents",
      "{count, plural, =0 {ingen hendelser} one {{count} hendelse} other "
      & "{{count} hendelser}}");
   P ("system.uptime", "oppetid {measure}");
   P ("system.latency", "forsinkelse {measure}");
   P ("system.maintenance_window", "vedlikeholdsvindu {time}");
   P ("system.last_checked", "sist kontrollert {time}");
   P ("system.http.informational", "informasjon");
   P ("system.http.successful", "vellykket");
   P ("system.http.redirection", "omdirigering");
   P ("system.http.client_error", "klientfeil");
   P ("system.http.server_error", "serverfeil");
   P ("system.exit.success", "avslutningskode {code}: vellykket");
   P ("system.exit.failure", "avslutningskode {code}: mislykket");
   P ("system.exit.usage_error", "avslutningskode {code}: feil bruk");
   P ("system.exit.not_executable", "avslutningskode {code}: kommandoen kan ikke kjøres");
   P ("system.exit.not_found", "avslutningskode {code}: fant ikke kommandoen");
   P ("system.exit.invalid_argument", "avslutningskode {code}: ugyldig argument til exit");
   P ("system.exit.signal", "avslutningskode {code}: avsluttet av {signal}");
   P ("validation.problem.required", "{field}: er påkrevd");
   P ("validation.problem.minimum", "{field}: er under minimum");
   P ("validation.problem.maximum", "{field}: er over maksimum");
   P ("validation.problem.range", "{field}: er utenfor gyldig område");
   P ("validation.problem.pattern", "{field}: samsvarer ikke med mønsteret");
   P ("validation.problem.choice", "{field}: må være ett av de tillatte valgene");
   P ("validation.problem.dependency", "{field}: avhenger av et annet felt");
   P ("validation.problem.custom", "{field}: er ugyldig");
   P ("validation.constraint.no_relation", "{field}: må være gyldig {value}");
   P ("validation.constraint.less_than", "{field}: må være mindre enn {value}");
   P ("validation.constraint.less_or_equal", "{field}: må være høyst {value}");
   P ("validation.constraint.greater_than", "{field}: må være større enn {value}");
   P ("validation.constraint.greater_or_equal", "{field}: må være minst {value}");
   P ("validation.constraint.equal_to", "{field}: må være lik {value}");
   P ("validation.constraint.not_equal_to", "{field}: må ikke være lik {value}");
   P ("validation.constraint.before_field", "{field}: må være før {value}");
   P ("validation.constraint.after_field", "{field}: må være etter {value}");
   P ("validation.choices", "{field}: tillatte verdier: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, angitt: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nytt forsøk om {time}");
   P ("net_diagnostic.dns", "{endpoint}: DNS-oppslag mislyktes");
   P ("net_diagnostic.tcp", "{endpoint}: TCP-tilkobling mislyktes");
   P ("net_diagnostic.tls", "{endpoint}: TLS-sertifikatfeil");
   P ("net_diagnostic.http", "{endpoint}: HTTP-forespørsel mislyktes");
   P ("net_diagnostic.proxy", "{endpoint}: proxyfeil");
   P ("net_diagnostic.timeout", "{endpoint}: tidsavbrudd");
   P ("net_diagnostic.reset", "{endpoint}: tilkoblingen ble tilbakestilt");
   P ("net_diagnostic.unknown_network", "{endpoint}: nettverksfeil");
   P ("progress.state.not_started", "ikke startet");
   P ("progress.state.running", "kjører");
   P ("progress.state.stalled", "stoppet opp");
   P ("progress.state.retrying", "prøver på nytt");
   P ("progress.state.complete", "fullført");
   P ("progress.state.failed", "mislyktes");
   P ("progress.of", "{subject}: {done} av {total} fullført ({percent} %), {state}");
   P ("progress.done", "{subject}: {done} fullført, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {element} other {elementer}}, "
      & "{unique} {unique, plural, one {unik verdi} other {unike verdier}}, "
      & "{duplicates} {duplicates, plural, one {duplikat} other {duplikater}}, "
      & "{outliers} {outliers, plural, one {avvikende verdi} other {avvikende "
      & "verdier}}");
   P ("top_frequency", "{name}: {value} ({count} {count, plural, one {gang} other {ganger}})");
   P ("calendar_date.fiscal_year", "regnskapsår {year}");
   P ("calendar_date.fiscal_quarter", "regnskapsår {year}, {part}. kvartal");
   P ("calendar_date.fiscal_half", "regnskapsår {year}, {part}. halvår");
   P ("calendar_date.fiscal_year_end", "slutten av regnskapsåret {year}");
   P ("calendar_date.semester", "{part}. semester {year}");
   P ("calendar_date.half_year", "{part}. halvår {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {første halvår {year}} other {andre halvår "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {begynnelsen av {text}} mid {midten av {text}} "
      & "other {slutten av {text}}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {begynnelsen av {text}} mid {midten av {text}} "
      & "other {slutten av {text}}}");
   P ("calendar_range.weekend.last", "forrige helg");
   P ("calendar_range.weekend.this", "denne helgen");
   P ("calendar_range.weekend.next", "neste helg");
   P ("calendar_range.weekend_of", "helgen {date}");
   P ("calendar_range.week.last", "forrige uke");
   P ("calendar_range.week.this", "denne uken");
   P ("calendar_range.week.next", "neste uke");
   P ("calendar_range.week_of", "uken med {date}");
   P ("calendar_range.between", "{first}–{last}");
   P ("http.reason.100", "fortsett");
   P ("http.reason.101", "bytter protokoller");
   P ("http.reason.102", "behandler");
   P ("http.reason.103", "tidlige hint");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "opprettet");
   P ("http.reason.202", "akseptert");
   P ("http.reason.203", "ikke-autoritativ informasjon");
   P ("http.reason.204", "intet innhold");
   P ("http.reason.205", "tilbakestill innhold");
   P ("http.reason.206", "delvis innhold");
   P ("http.reason.207", "flerstatus");
   P ("http.reason.208", "allerede rapportert");
   P ("http.reason.226", "IM brukt");
   P ("http.reason.300", "flere valg");
   P ("http.reason.301", "flyttet permanent");
   P ("http.reason.302", "funnet");
   P ("http.reason.303", "se annen");
   P ("http.reason.304", "ikke endret");
   P ("http.reason.305", "bruk proxy");
   P ("http.reason.307", "midlertidig omdirigering");
   P ("http.reason.308", "permanent omdirigering");
   P ("http.reason.400", "ugyldig forespørsel");
   P ("http.reason.401", "ikke autorisert");
   P ("http.reason.402", "betaling kreves");
   P ("http.reason.403", "forbudt");
   P ("http.reason.404", "ikke funnet");
   P ("http.reason.405", "metoden er ikke tillatt");
   P ("http.reason.406", "ikke akseptabel");
   P ("http.reason.407", "proxyautentisering kreves");
   P ("http.reason.408", "tidsavbrudd for forespørsel");
   P ("http.reason.409", "konflikt");
   P ("http.reason.410", "borte");
   P ("http.reason.411", "lengde kreves");
   P ("http.reason.412", "forutsetning mislyktes");
   P ("http.reason.413", "innholdet er for stort");
   P ("http.reason.414", "URI er for lang");
   P ("http.reason.415", "medietypen støttes ikke");
   P ("http.reason.416", "området kan ikke oppfylles");
   P ("http.reason.417", "forventning mislyktes");
   P ("http.reason.418", "jeg er en tekanne");
   P ("http.reason.421", "feildirigert forespørsel");
   P ("http.reason.422", "innholdet kan ikke behandles");
   P ("http.reason.423", "låst");
   P ("http.reason.424", "mislykket avhengighet");
   P ("http.reason.425", "for tidlig");
   P ("http.reason.426", "oppgradering kreves");
   P ("http.reason.428", "forutsetning kreves");
   P ("http.reason.429", "for mange forespørsler");
   P ("http.reason.431", "forespørselens hodefelt er for store");
   P ("http.reason.451", "utilgjengelig av juridiske årsaker");
   P ("http.reason.500", "intern serverfeil");
   P ("http.reason.501", "ikke implementert");
   P ("http.reason.502", "ugyldig gateway");
   P ("http.reason.503", "tjenesten er utilgjengelig");
   P ("http.reason.504", "tidsavbrudd for gateway");
   P ("http.reason.505", "HTTP-versjonen støttes ikke");
   P ("http.reason.506", "varianten forhandler også");
   P ("http.reason.507", "utilstrekkelig lagringsplass");
   P ("http.reason.508", "løkke oppdaget");
   P ("http.reason.510", "ikke utvidet");
   P ("http.reason.511", "nettverksautentisering kreves");
   P ("errno.reason.0", "vellykket");
   P ("errno.reason.1", "operasjonen er ikke tillatt");
   P ("errno.reason.2", "ingen slik fil eller katalog");
   P ("errno.reason.3", "ingen slik prosess");
   P ("errno.reason.4", "avbrutt systemkall");
   P ("errno.reason.5", "inn/ut-feil");
   P ("errno.reason.6", "ingen slik enhet eller adresse");
   P ("errno.reason.9", "ugyldig fildeskriptor");
   P ("errno.reason.11", "ressursen er midlertidig utilgjengelig");
   P ("errno.reason.12", "ikke nok minne");
   P ("errno.reason.13", "tilgang nektet");
   P ("errno.reason.17", "filen finnes");
   P ("errno.reason.20", "ikke en katalog");
   P ("errno.reason.21", "er en katalog");
   P ("errno.reason.22", "ugyldig argument");
   P ("errno.reason.24", "for mange åpne filer");
   P ("errno.reason.28", "ikke mer plass på enheten");
   P ("errno.reason.32", "brutt rør");
   P ("errno.reason.98", "adressen er allerede i bruk");
   P ("errno.reason.110", "tidsavbrudd for tilkobling");
   P ("errno.reason.111", "tilkobling nektet");
   P ("signal.reason.1", "lagt på");
   P ("signal.reason.2", "avbrudd");
   P ("signal.reason.3", "avslutt");
   P ("signal.reason.4", "ulovlig instruksjon");
   P ("signal.reason.5", "sporingsfelle");
   P ("signal.reason.6", "avbryt");
   P ("signal.reason.7", "bussfeil");
   P ("signal.reason.8", "flyttallsunntak");
   P ("signal.reason.9", "drept");
   P ("signal.reason.10", "brukersignal 1");
   P ("signal.reason.11", "segmenteringsfeil");
   P ("signal.reason.12", "brukersignal 2");
   P ("signal.reason.13", "brutt rør");
   P ("signal.reason.14", "alarm");
   P ("signal.reason.15", "termineringsforespørsel");
   P ("signal.reason.17", "barneprosessens status endret");
   P ("signal.reason.18", "fortsett");
   P ("signal.reason.19", "stoppet");
   P ("signal.reason.20", "terminalstopp");
   P ("signal.reason.28", "vindusstørrelsen endret");
   P ("sqlstate.reason.00", "vellykket fullføring");
   P ("sqlstate.reason.01", "advarsel");
   P ("sqlstate.reason.02", "ingen data");
   P ("sqlstate.reason.08", "tilkoblingsunntak");
   P ("sqlstate.reason.0a", "funksjonen støttes ikke");
   P ("sqlstate.reason.22", "dataunntak");
   P ("sqlstate.reason.23", "brudd på integritetsbetingelse");
   P ("sqlstate.reason.24", "ugyldig markørtilstand");
   P ("sqlstate.reason.25", "ugyldig transaksjonstilstand");
   P ("sqlstate.reason.28", "ugyldig autorisasjonsspesifikasjon");
   P ("sqlstate.reason.2d", "ugyldig transaksjonsavslutning");
   P ("sqlstate.reason.3d", "ugyldig katalognavn");
   P ("sqlstate.reason.3f", "ugyldig skjemanavn");
   P ("sqlstate.reason.40", "tilbakerulling av transaksjon");
   P ("sqlstate.reason.42", "syntaksfeil eller brudd på tilgangsregel");
   P ("sqlstate.reason.53", "utilstrekkelige ressurser");
   P ("sqlstate.reason.54", "programgrense overskredet");
   P ("sqlstate.reason.55", "objektet er ikke i forutsatt tilstand");
   P ("sqlstate.reason.57", "operatørinngrep");
   P ("sqlstate.reason.58", "systemfeil");
   P ("sqlstate.reason.hv", "feil i fremmeddataomslag");
   P ("sqlstate.reason.p0", "PL/pgSQL-feil");
   P ("sqlstate.reason.xx", "intern feil");
   P ("system.signal_numbered", "signal {number} {name} {reason}");
   P ("http.reason.unknown", "ukjent status");
   P ("errno.reason.unknown", "ukjent feil");
   P ("signal.reason.unknown", "ukjent signal");
   P ("sqlstate.reason.unknown", "ukjent SQLSTATE-klasse");
   P ("diff.changed", "diff {path}: endret fra {before} til {after}");
   P ("diff.added", "diff {path}: lagt til {after}");
   P ("diff.removed", "diff {path}: fjernet {before}");
   P ("diff.unchanged", "diff {path}: uendret");
   P ("diff.redacted", "diff {path}: endret; verdier skjult");
   P ("validation.result",
      "valideringsresultat: {fields} {fields, plural, one {felt} other "
      & "{felt}}, {errors} {errors, plural, one {feil} other {feil}}, "
      & "{warnings} {warnings, plural, one {advarsel} other {advarsler}}, "
      & "{required} {required, plural, one {obligatorisk felt} other "
      & "{obligatoriske felt}}, {hidden} {hidden, plural, one {skjult problem} "
      & "other {skjulte problemer}}");
   P ("file.kind.plain", "fil");
   P ("file.kind.directory", "mappe");
   P ("file.kind.archive", "arkiv");
   P ("file.kind.compressed", "komprimert fil");
   P ("file.kind.image", "bilde");
   P ("file.kind.script", "skript");
   P ("file.kind.executable", "kjørbar fil");
   P ("file.kind.unknown", "ukjent fil");
   P ("file.metadata", "fil {name}: {kind}");
   P ("file.checksum", "{text}, sjekksum {checksum}");
   P ("file.signature_match", "filsignatur {name}: {kind} samsvarer med filtypen");
   P ("file.signature_mismatch",
      "filsignatur {name}: filtypen sier {expected}, innholdet ser ut som "
      & "{actual}");
   P ("network_event.connecting", "kobler til");
   P ("network_event.connected", "tilkoblet");
   P ("network_event.redirected", "omdirigert");
   P ("network_event.retrying", "prøver på nytt");
   P ("network_event.rate_limited", "hastighetsbegrenset");
   P ("network_event.tls_failed", "TLS mislyktes");
   P ("network_event.stalled", "stoppet opp");
   P ("network_event.complete", "fullført");
   P ("network_event.failed", "mislyktes");
   P ("network.session", "nettverk {endpoint}: {state}");
   P ("diff_node.field", "felt");
   P ("diff_node.object", "objekt");
   P ("diff_node.list", "liste");
   P ("diff.node",
      "diff-node {path}: {kind}, {count} {count, plural, one {endring} other "
      & "{endringer}}");
   P ("checksum.not_checked", "sjekksum ikke kontrollert");
   P ("checksum.valid", "sjekksum gyldig");
   P ("checksum.mismatch", "sjekksum stemmer ikke");
   P ("checksum.missing", "sjekksum mangler");
   P ("product_code", "produktkode {kind}: {value}, {state}");
   P ("time_zone.utc", "tidssone: UTC");
   P ("time_zone.offset", "tidssone: {offset}");
   P ("time_zone.named", "tidssone: {name} ({offset})");
   P ("time_zone.local", "tidssone: lokal tid");
   P ("time_zone.unknown", "tidssone: ukjent sone");
   P ("time_zone.dst", "{text}, bruker sommertid");
   P ("zoned_time.plain", "sonetid: {time} {offset}");
   P ("zoned_time.named", "sonetid: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, tvetydig lokal tid");
   P ("number.under", "under {value}");
   P ("number.up_to", "opptil {value}");
   P ("number.between", "mellom {low} og {high}");
   P ("number.range_words", "{low} til {high}");
   P ("number.uncertainty_words", "{value} pluss minus {delta}");
   P ("number.range_inclusive", "{low} til {high}, begge inkludert");
   P ("number.range_exclusive", "over {low} og under {high}");
   P ("number.range_low_inclusive", "{low} eller mer og under {high}");
   P ("number.range_high_inclusive", "over {low} og opptil {high}");
   P ("number.at_least", "minst {value}");
   P ("number.more_than", "mer enn {value}");
   P ("number.at_most", "høyst {value}");
   P ("number.less_than", "mindre enn {value}");
   P ("number.exactly", "nøyaktig {value}");
   P ("number.within", "{value} er innenfor {bounds}");
   P ("number.below", "{value} er under {bounds}");
   P ("number.above", "{value} er over {bounds}");
   P ("number.per", "{numerator} per {denominator}");
   P ("number.one_in", "1 av {whole}");
   P ("number.out_of", "{value} av {whole}");
   P ("number.unchanged", "uendret");
   P ("number.change_up", "opp {quantity}");
   P ("number.change_down", "ned {quantity}");
   P ("number.change_more", "{quantity} flere {tail}");
   P ("number.change_fewer", "{quantity} færre {tail}");
   P ("number.since", "{change} siden {since}");
   P ("duration.countdown", "{duration} igjen");
   P ("duration.within", "innen {duration}");
   P ("duration.next", "neste {duration}");
   P ("duration.between", "mellom {low} og {high}");
   P ("duration.age", "{duration} gammel");
   P ("duration.stale_for", "utdatert i {duration}");
   P ("duration.backup_age", "sikkerhetskopien er {duration} gammel");
   P ("duration.eta", "beregnet tid igjen: {duration}");
   P ("duration.expires", "utløper {relative}");
   P ("duration.retrying", "prøver igjen {relative}");
   P ("duration.modified", "endret {relative}");
   P ("duration.synced", "synkronisert {relative}");
   P ("duration.modified_now", "endret akkurat nå");
   P ("duration.synced_now", "synkronisert akkurat nå");
   P ("duration.natural.less_than_minute", "mindre enn ett minutt");
   P ("duration.natural.half_hour", "en halvtime");
   P ("duration.natural.about_half_hour", "omtrent en halvtime");
   P ("duration.natural.about", "omtrent {duration}");
   P ("duration.natural.almost", "nesten {duration}");
   P ("duration.natural.over", "over {duration}");
   P ("duration.natural.just_over", "litt over {duration}");
   P ("duration.natural.little_under", "litt under {duration}");
   P ("duration.natural.few",
      "{unit, select, second {noen sekunder} minute {noen minutter} hour "
      & "{noen timer} day {noen dager} week {noen uker} month {noen måneder} "
      & "year {noen år} other {noen}}");
   P ("duration.distance.past", "for {duration} siden");
   P ("duration.distance.future", "om {duration}");
   P ("geo.direction.north", "{style, select, short {N} other {nord}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNØ} other {nord-nordøst}}");
   P ("geo.direction.north_east", "{style, select, short {NØ} other {nordøst}}");
   P ("geo.direction.east_north_east", "{style, select, short {ØNØ} other {øst-nordøst}}");
   P ("geo.direction.east", "{style, select, short {Ø} other {øst}}");
   P ("geo.direction.east_south_east", "{style, select, short {ØSØ} other {øst-sørøst}}");
   P ("geo.direction.south_east", "{style, select, short {SØ} other {sørøst}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSØ} other {sør-sørøst}}");
   P ("geo.direction.south", "{style, select, short {S} other {sør}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSV} other {sør-sørvest}}");
   P ("geo.direction.south_west", "{style, select, short {SV} other {sørvest}}");
   P ("geo.direction.west_south_west", "{style, select, short {VSV} other {vest-sørvest}}");
   P ("geo.direction.west", "{style, select, short {V} other {vest}}");
   P ("geo.direction.west_north_west", "{style, select, short {VNV} other {vest-nordvest}}");
   P ("geo.direction.north_west", "{style, select, short {NV} other {nordvest}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNV} other {nord-nordvest}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "omtrent {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "sørvest {southwest}; nordøst {northeast}");
   P ("geo.inside_box", "innenfor avgrensningsboksen");
   P ("geo.outside_box", "utenfor avgrensningsboksen");
   P ("number.about", "omtrent {value}");
   P ("number.almost", "nesten {value}");
   P ("number.over", "over {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
end Locale_No;
