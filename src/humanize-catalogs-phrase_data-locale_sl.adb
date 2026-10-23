separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Sl (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "sl", Name, Template);
   end P;
begin
   P ("all_count",
      "skupaj {total} {total, plural, one {{one}} two {{two}} few {{few}} "
      & "other {{genitive_other}}}");
   P ("filtered_count.none", "ni ujemajočih se {genitive_other}");
   P ("filtered_count.all",
      "{total, plural, =1 {ujemanje pri {total} {locative_one}} one {ujemanje "
      & "pri vseh {total} {locative_one}} other {ujemanje pri vseh {total} "
      & "{locative_other}}}");
   P ("filtered_count.some",
      "{matching, plural, one {ujema se} two {ujemata se} few {ujemajo se} "
      & "other {ujema se}} {matching} od {total} {total, plural, one "
      & "{{genitive_one}} two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}");
   P ("more_count", "prikazano: {visible}, +{remaining} več");
   P ("others_count", "{first} in še {remaining}");
   P ("page_count", "stran {page} od {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} two {{two}} few {{few}} other "
      & "{{genitive_other}}} na stran");
   P ("pagination_range",
      "{first}–{last} od {total} {total, plural, one {{genitive_one}} two "
      & "{{genitive_other}} few {{genitive_other}} other {{genitive_other}}}");
   P ("position_count", "{position} od {total}");
   P ("selection_count",
      "izbrano: {selected} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}");
   P ("showing_count",
      "prikazano: {showing} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {brez napak} warning "
      & "{brez opozoril} other {brez obvestil}}} one {{count} {severity, "
      & "select, error {napaka} warning {opozorilo} other {obvestilo}}} two "
      & "{{count} {severity, select, error {napaki} warning {opozorili} other "
      & "{obvestili}}} few {{count} {severity, select, error {napake} warning "
      & "{opozorila} other {obvestila}}} other {{count} {severity, select, "
      & "error {napak} warning {opozoril} other {obvestil}}}}");
   P ("collection.empty", "ni {genitive_other}");
   P ("collection.none_shown", "ni prikazanih {genitive_other}");
   P ("collection.showing_hidden",
      "prikazano: {visible} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}, skrito: {hidden}");
   P ("collection.showing",
      "prikazano: {visible} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}");
   P ("collection.shown_hidden",
      "prikazano: {visible} {visible, plural, one {{one}} two {{two}} few "
      & "{{few}} other {{genitive_other}}}, skrito: {hidden}");
   P ("collection.shown",
      "prikazano: {visible} {visible, plural, one {{one}} two {{two}} few "
      & "{{few}} other {{genitive_other}}}");
   P ("collection.visible_out_of",
      "vidno: {visible} od {total} {total, plural, one {{genitive_one}} two "
      & "{{genitive_other}} few {{genitive_other}} other {{genitive_other}}}");
   P ("complete_count", "dokončano: {done} od {total}");
   P ("percent_complete", "dokončano: {percent} %");
   P ("step_count", "korak {step} od {total}");
   P ("attempt_count", "poskus {attempt} od {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {ostaja} two {ostajata} few {ostajajo} other "
      & "{ostaja}} {remaining} {remaining, plural, one {{one}} two {{two}} few "
      & "{{few}} other {{genitive_other}}}, {rate} {unit}/s");
   P ("accessible_progress",
      "dokončano: {done} od {total}, {percent, plural, one {{percent} "
      & "odstotek} two {{percent} odstotka} few {{percent} odstotki} other "
      & "{{percent} odstotkov}}");
   P ("business_days",
      "{days, plural, one {{days} delovni dan} two {{days} delovna dneva} few "
      & "{{days} delovni dnevi} other {{days} delovnih dni}}");
   P ("working_hours",
      "{hours, plural, one {{hours} delovna ura} two {{hours} delovni uri} "
      & "few {{hours} delovne ure} other {{hours} delovnih ur}}");
   P ("due.overdue",
      "zamuda: {days, plural, one {{days} dan} two {{days} dneva} few {{days} "
      & "dnevi} other {{days} dni}}");
   P ("due.today", "rok danes");
   P ("due.tomorrow", "rok jutri");
   P ("due.in",
      "rok čez {days, plural, one {{days} dan} two {{days} dneva} few "
      & "{{days} dni} other {{days} dni}}");
   P ("calendar_difference.future", "čez {difference}");
   P ("calendar_difference.past", "pred {difference}");
   P ("calendar_difference.case.future", "accusative");
   P ("calendar_difference.case.past", "instrumental");
   P ("cpu_load", "obremenitev CPE {measure}");
   P ("battery", "baterija {measure}");
   P ("screen_size", "zaslon {measure}");
   P ("refresh_rate", "hitrost osveževanja {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word",
      "{value, plural, one {{value} odstotek} two {{value} odstotka} few "
      & "{{value} odstotki} other {{value} odstotkov}}");
   P ("recurrence.second",
      "{every, plural, =1 {vsako sekundo} one {vsako {every} sekundo} two "
      & "{vsaki {every} sekundi} few {vsake {every} sekunde} other {vsakih "
      & "{every} sekund}}");
   P ("recurrence.minute",
      "{every, plural, =1 {vsako minuto} one {vsako {every} minuto} two "
      & "{vsaki {every} minuti} few {vsake {every} minute} other {vsakih "
      & "{every} minut}}");
   P ("recurrence.hour",
      "{every, plural, =1 {vsako uro} one {vsako {every} uro} two {vsaki "
      & "{every} uri} few {vsake {every} ure} other {vsakih {every} ur}}");
   P ("recurrence.day",
      "{every, plural, =1 {vsak dan} one {vsak {every} dan} two {vsaka "
      & "{every} dneva} few {vsake {every} dni} other {vsakih {every} dni}}");
   P ("recurrence.week",
      "{every, plural, =1 {vsak teden} one {vsak {every} teden} two {vsaka "
      & "{every} tedna} few {vsake {every} tedne} other {vsakih {every} "
      & "tednov}}");
   P ("recurrence.month",
      "{every, plural, =1 {vsak mesec} one {vsak {every} mesec} two {vsaka "
      & "{every} meseca} few {vsake {every} mesece} other {vsakih {every} "
      & "mesecev}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {vsako četrtletje} one {vsako {every} četrtletje} "
      & "two {vsaki {every} četrtletji} few {vsaka {every} četrtletja} other "
      & "{vsakih {every} četrtletij}}");
   P ("recurrence.year",
      "{every, plural, =1 {vsako leto} one {vsako {every} leto} two {vsaki "
      & "{every} leti} few {vsaka {every} leta} other {vsakih {every} let}}");
   P ("cache_summary.empty", "predpomnilnik: ni zahtev");
   P ("cache_summary",
      "predpomnilnik: {hits, plural, one {{hits} zadetek} two {{hits} "
      & "zadetka} few {{hits} zadetki} other {{hits} zadetkov}}, {misses, "
      & "plural, one {{misses} zgrešitev} two {{misses} zgrešitvi} few "
      & "{{misses} zgrešitve} other {{misses} zgrešitev}}, delež zadetkov "
      & "{rate} %");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} two {{two}} few {{few}} other "
      & "{{genitive_other}}}: spremenjeno {changed}, dodano {added}, "
      & "odstranjeno {removed}");
   P ("field_diff", "{field}: spremenjeno iz {before} v {after}");
   P ("field_added", "{field}: dodano z vrednostjo {value}");
   P ("field_removed", "{field}: odstranjeno (prej {value})");
   P ("field_unchanged", "{field}: brez spremembe ({value})");
   P ("number_comparison.equal", "{current} je enako kot {baseline}");
   P ("number_comparison.higher", "{current} je za {quantity} več kot {baseline}");
   P ("number_comparison.lower", "{current} je za {quantity} manj kot {baseline}");
   P ("percent_comparison.equal", "{current} je enako kot {baseline}");
   P ("percent_comparison.higher", "{current} je za {quantity} več kot {baseline}");
   P ("percent_comparison.lower", "{current} je za {quantity} manj kot {baseline}");
   P ("file_size_comparison.same", "{current} ima enako velikost kot {baseline}");
   P ("file_size_comparison.larger", "{current} ima za {quantity} večjo velikost kot {baseline}");
   P ("file_size_comparison.smaller", "{current} ima za {quantity} manjšo velikost kot {baseline}");
   P ("date_comparison.same", "{current} je isti datum kot {baseline}");
   P ("date_comparison.after", "{current} je {quantity} pozneje kot {baseline}");
   P ("date_comparison.before", "{current} je {quantity} prej kot {baseline}");
   P ("queue_summary", "čakalna vrsta: {details}");
   P ("queue_summary.empty", "čakalna vrsta prazna");
   P ("domain_summary",
      "{domain, select, queue {čakalna vrsta} job {opravilo} run {zagon} "
      & "cache {predpomnilnik} sync {sinhronizacija} import {uvoz} export "
      & "{izvoz} other {{domain}}} – {state, select, queued {v čakalni "
      & "vrsti} running {se izvaja} waiting {čaka} paused {začasno "
      & "ustavljeno} complete {dokončano} failed {ni uspelo} stale {zastarelo} "
      & "skipped {preskočeno} other {{state}}}: {details}");
   P ("summary.none", "ni {genitive_other}");
   P ("summary.completed",
      "dokončano: {count} {count, plural, one {{one}} two {{two}} few "
      & "{{few}} other {{genitive_other}}}");
   P ("summary.completed_of",
      "dokončano: {count} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}");
   P ("summary.failed", "ni uspelo: {count}");
   P ("summary.queued",
      "v čakalni vrsti: {count} {count, plural, one {{one}} two {{two}} few "
      & "{{few}} other {{genitive_other}}}");
   P ("summary.running", "se izvaja: {count}");
   P ("summary.complete", "dokončano: {count}");
   P ("backup.backup_running", "varnostno kopiranje poteka");
   P ("backup.backup_completed", "varnostno kopiranje dokončano");
   P ("backup.backup_failed", "varnostno kopiranje ni uspelo");
   P ("backup.backup_stale", "varnostna kopija je zastarela");
   P ("incident.incident_investigating", "preiskovanje incidenta");
   P ("incident.incident_identified", "incident ugotovljen");
   P ("incident.incident_mitigated", "incident omiljen");
   P ("incident.incident_resolved", "incident razrešen");
   P ("release.release_drafting", "izdaja v pripravi");
   P ("release.release_ready", "izdaja pripravljena");
   P ("release.release_published", "izdaja objavljena");
   P ("release.release_rolled_back", "izdaja povrnjena");
   P ("audit.audit_created", "revizijski vnos ustvarjen");
   P ("audit.audit_updated", "revizijski vnos posodobljen");
   P ("audit.audit_deleted", "revizijski vnos izbrisan");
   P ("audit.audit_restored", "revizijski vnos obnovljen");
   P ("flag.flag_enabled", "zastavica funkcije omogočena");
   P ("flag.flag_disabled", "zastavica funkcije onemogočena");
   P ("flag.flag_rolling_out", "zastavica funkcije se postopno uvaja");
   P ("flag.flag_rolled_back", "zastavica funkcije povrnjena");
   P ("webhook.webhook_pending", "webhook čaka");
   P ("webhook.webhook_delivered", "webhook dostavljen");
   P ("webhook.webhook_failed", "webhook ni uspel");
   P ("webhook.webhook_retrying", "webhook: ponovni poskus");
   P ("api_key.api_key_active", "ključ API aktiven");
   P ("api_key.api_key_revoked", "ključ API preklican");
   P ("api_key.api_key_expired", "ključ API potekel");
   P ("api_key.api_key_rotated", "ključ API zamenjan");
   P ("quota.quota_available", "kvota na voljo");
   P ("quota.quota_near_limit", "kvota skoraj porabljena");
   P ("quota.quota_exceeded", "kvota presežena");
   P ("quota.quota_reset", "kvota ponastavljena");
   P ("invoice.invoice_draft", "osnutek računa");
   P ("invoice.invoice_sent", "račun poslan");
   P ("invoice.invoice_paid", "račun plačan");
   P ("invoice.invoice_refunded", "znesek računa povrnjen");
   P ("invoice.invoice_overdue", "račun zapadel");
   P ("invoice.refund_failed", "vračilo ni uspelo");
   P ("page_navigation.only", "edina stran");
   P ("page_navigation.first", "prva stran, naslednja na voljo");
   P ("page_navigation.last", "zadnja stran, prejšnja na voljo");
   P ("page_navigation.middle", "prejšnja in naslednja na voljo");
   P ("end_of_week", "konec tedna");
   P ("end_of_month", "konec meseca");
   P ("end_of_quarter", "konec četrtletja");
   P ("time_of_day.night", "noč");
   P ("time_of_day.morning", "jutro");
   P ("time_of_day.afternoon", "popoldne");
   P ("time_of_day.evening", "večer");
   P ("calendar_difference.same_day", "isti dan");
   P ("calendar_difference.zero", "0 dni");
   P ("access.allowed", "dovoljeno");
   P ("access.denied", "zavrnjeno");
   P ("access.owner", "lastnik");
   P ("access.admin", "skrbnik");
   P ("access.viewer", "bralec");
   P ("access.editor", "urednik");
   P ("auth.signed_in", "prijavljeno");
   P ("auth.signed_out", "odjavljeno");
   P ("auth.session_expired", "seja je potekla");
   P ("auth.locked", "zaklenjeno");
   P ("auth.two_factor_required", "zahtevano dvofaktorsko preverjanje");
   P ("billing.trialing", "preizkusno obdobje");
   P ("billing.payment_due", "plačilo zapade");
   P ("billing.payment_failed", "plačilo ni uspelo");
   P ("billing.paid", "plačano");
   P ("billing.past_due", "zapadlo");
   P ("billing.canceled", "preklicano");
   P ("ci.pipeline_pending", "cevovod čaka");
   P ("ci.pipeline_running", "cevovod se izvaja");
   P ("ci.pipeline_passed", "cevovod uspešen");
   P ("ci.pipeline_failed", "cevovod ni uspel");
   P ("ci.review_required", "zahtevan pregled");
   P ("ci.deploy_blocked", "uvajanje blokirano");
   P ("collaboration.active_now", "trenutno aktiven");
   P ("collaboration.away", "odsoten");
   P ("collaboration.do_not_disturb", "ne moti");
   P ("collaboration.typing", "tipka");
   P ("collaboration.viewing", "si ogleduje");
   P ("collaboration.editing", "ureja");
   P ("deployment.deploying", "uvajanje");
   P ("deployment.deployed", "uvedeno");
   P ("deployment.rolling_back", "povrnitev");
   P ("deployment.rolled_back", "povrnjeno");
   P ("deployment.build_failed", "gradnja ni uspela");
   P ("deployment.checks_passed", "preverjanja uspešna");
   P ("empty.no_items", "ni elementov");
   P ("empty.no_results", "ni rezultatov");
   P ("empty.no_messages", "ni sporočil");
   P ("empty.no_selection", "ni izbire");
   P ("empty.nothing_to_show", "ni česa prikazati");
   P ("file.uploading", "nalaganje");
   P ("file.downloading", "prenašanje");
   P ("file.copying", "kopiranje");
   P ("file.moving", "premikanje");
   P ("file.deleting", "brisanje");
   P ("file.deleted", "izbrisano");
   P ("file.restoring", "obnavljanje");
   P ("file.synced", "sinhronizirano");
   P ("form.valid_input", "veljaven vnos");
   P ("form.invalid_input", "neveljaven vnos");
   P ("form.dirty", "spremenjeno");
   P ("form.pristine", "nespremenjeno");
   P ("form.submitted", "poslano");
   P ("form.submission_failed", "pošiljanje ni uspelo");
   P ("health.healthy", "brezhibno");
   P ("health.degraded", "okrnjeno delovanje");
   P ("health.unhealthy", "nedelujoče");
   P ("health.incident", "incident");
   P ("health.maintenance", "vzdrževanje");
   P ("health.recovering", "obnavljanje delovanja");
   P ("issue.open", "odprto");
   P ("issue.closed", "zaprto");
   P ("issue.reopened", "znova odprto");
   P ("issue.assigned", "dodeljeno");
   P ("issue.unassigned", "nedodeljeno");
   P ("issue.merged", "združeno");
   P ("network.offline", "brez povezave");
   P ("network.online", "povezano");
   P ("network.connecting", "povezovanje");
   P ("network.syncing", "sinhronizacija");
   P ("network.sync_failed", "sinhronizacija ni uspela");
   P ("network.permission_denied", "dostop zavrnjen");
   P ("network.read_only", "samo za branje");
   P ("notification.unread", "neprebrano");
   P ("notification.read", "prebrano");
   P ("notification.muted", "utišano");
   P ("notification.snoozed", "preloženo");
   P ("notification.sent", "poslano");
   P ("notification.delivered", "dostavljeno");
   P ("payment.payment_authorized", "plačilo odobreno");
   P ("payment.payment_captured", "plačilo prejeto");
   P ("payment.payment_refunded", "plačilo vrnjeno");
   P ("payment.payment_disputed", "plačilo izpodbijano");
   P ("payment.payment_requires_action", "plačilo zahteva ukrepanje");
   P ("payment.payment_expired", "plačilo je poteklo");
   P ("ui.empty", "prazno");
   P ("ui.loading", "nalaganje");
   P ("ui.saving", "shranjevanje");
   P ("ui.saved", "shranjeno");
   P ("ui.unsaved", "neshranjeno");
   P ("ui.retrying", "ponovni poskus");
   P ("ui.paused", "začasno ustavljeno");
   P ("ui.complete", "dokončano");
   P ("ui.failed", "ni uspelo");
   P ("ui.due_soon", "kmalu zapade");
   P ("ui.overdue", "zapadlo");
   P ("ui.last_seen", "nazadnje viden");
   P ("ui.updated_just_now", "pravkar posodobljeno");
   P ("queue.queued", "v čakalni vrsti");
   P ("queue.running", "se izvaja");
   P ("queue.waiting", "čaka");
   P ("queue.blocked", "blokirano");
   P ("queue.canceled_job", "opravilo preklicano");
   P ("queue.completed_job", "opravilo dokončano");
   P ("search.filtering", "filtriranje");
   P ("search.filtered", "filtrirano");
   P ("search.no_matches", "ni ujemanj");
   P ("search.search_ready", "iskanje pripravljeno");
   P ("search.search_failed", "iskanje ni uspelo");
   P ("search.query_too_short", "poizvedba je prekratka");
   P ("security.secure", "varno");
   P ("security.insecure", "ni varno");
   P ("security.vulnerable", "ranljivo");
   P ("security.encrypted", "šifrirano");
   P ("security.unencrypted", "nešifrirano");
   P ("security.token_expired", "žeton je potekel");
   P ("sync.sync_idle", "sinhronizacija miruje");
   P ("sync.syncing_now", "sinhronizacija poteka");
   P ("sync.sync_queued", "sinhronizacija v čakalni vrsti");
   P ("sync.sync_conflict", "spor pri sinhronizaciji");
   P ("sync.sync_complete", "sinhronizacija dokončana");
   P ("sync.sync_error", "napaka sinhronizacije");
   P ("task.todo", "za izvedbo");
   P ("task.in_progress", "v teku");
   P ("task.done", "opravljeno");
   P ("task.skipped", "preskočeno");
   P ("task.blocked_task", "blokirano");
   P ("task.waiting_on", "čaka na");
   P ("ticket.ticket_new", "nov zahtevek");
   P ("ticket.ticket_open", "zahtevek odprt");
   P ("ticket.ticket_waiting", "zahtevek čaka");
   P ("ticket.ticket_escalated", "zahtevek posredovan višje");
   P ("ticket.ticket_resolved", "zahtevek razrešen");
   P ("ticket.ticket_closed", "zahtevek zaprt");
   P ("transfer.importing", "uvažanje");
   P ("transfer.imported", "uvoženo");
   P ("transfer.import_failed", "uvoz ni uspel");
   P ("transfer.exporting", "izvažanje");
   P ("transfer.exported", "izvoženo");
   P ("transfer.export_failed", "izvoz ni uspel");
   P ("validation.required", "obvezno");
   P ("validation.optional", "izbirno");
   P ("validation.invalid", "neveljavno");
   P ("validation.too_short", "prekratko");
   P ("validation.too_long", "predolgo");
   P ("validation.out_of_range", "zunaj obsega");
   P ("validation.already_exists", "že obstaja");
   P ("workflow.draft", "osnutek");
   P ("workflow.in_review", "v pregledu");
   P ("workflow.approved", "odobreno");
   P ("workflow.rejected", "zavrnjeno");
   P ("workflow.published", "objavljeno");
   P ("workflow.archived", "arhivirano");
   P ("database.database_online", "zbirka podatkov povezana");
   P ("database.database_offline", "zbirka podatkov brez povezave");
   P ("database.database_degraded", "zbirka podatkov okrnjena");
   P ("database.database_migrating", "selitev zbirke podatkov");
   P ("database.database_migration_failed", "selitev zbirke podatkov ni uspela");
   P ("database.database_replicating", "replikacija zbirke podatkov");
   P ("database.database_replication_lagging", "replikacija zbirke podatkov zaostaja");
   P ("database.database_backup_running", "varnostno kopiranje zbirke podatkov poteka");
   P ("database.database_backup_failed", "varnostno kopiranje zbirke podatkov ni uspelo");
   P ("count",
      "{count, plural, one {# {one}} two {# {two}} few {# {few}} other {# "
      & "{genitive_other}}}");
   P ("noun",
      "{count, plural, one {{one}} two {{two}} few {{few}} other "
      & "{{genitive_other}}}");
   P ("noun.accusative",
      "{count, plural, one {{accusative_one}} two {{two}} few {{few}} other "
      & "{{genitive_other}}}");
   P ("number_comparison.case", "accusative");
   P ("times_noun",
      "{count, plural, =0 {nikoli {other}} =1 {enkrat {one}} =2 {dvakrat "
      & "{other}} other {{count}-krat {other}}}");
   P ("availability.all",
      "na voljo: {available} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}");
   P ("availability.none", "ni razpoložljivih {genitive_other}");
   P ("availability.partial",
      "na voljo: {available} od {total} {total, plural, one {{genitive_one}} "
      & "two {{genitive_other}} few {{genitive_other}} other "
      & "{{genitive_other}}}, ni na voljo: {unavailable}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "v čakalni vrsti");
   P ("operation.running", "se izvaja");
   P ("operation.blocked", "blokirano");
   P ("operation.retrying", "ponovni poskus");
   P ("operation.succeeded", "uspešno");
   P ("operation.partially_succeeded", "delno uspešno");
   P ("operation.failed", "ni uspelo");
   P ("operation.canceled", "preklicano");
   P ("operation.skipped", "preskočeno");
   P ("operation.stale", "zastarelo");
   P ("operation.unknown_state", "neznano");
   P ("operation.last_success", "{name}: zadnji uspeh {time}");
   P ("operation.next_retry", "{name}: naslednji poskus {time}");
   P ("operation.stale_run", "{name} – zastarelo: {time}");
   P ("summary.skipped", "preskočeno: {count}");
   P ("summary.retried", "ponovljeno: {count}");
   P ("summary.canceled", "preklicano: {count}");
   P ("system.service.operational", "deluje");
   P ("system.service.degraded", "zmanjšana zmogljivost");
   P ("system.service.partial_outage", "delni izpad");
   P ("system.service.major_outage", "večji izpad");
   P ("system.service.maintenance", "v vzdrževanju");
   P ("system.service.unknown", "neznano stanje storitve");
   P ("system.health.healthy", "v redu");
   P ("system.health.warning", "opozorilo");
   P ("system.health.critical", "kritično");
   P ("system.health.unavailable", "nedosegljivo");
   P ("system.health.unknown_health", "neznano zdravstveno stanje");
   P ("system.readiness.ready", "pripravljeno");
   P ("system.readiness.not_ready", "ni pripravljeno");
   P ("system.readiness.starting", "zaganjanje");
   P ("system.readiness.draining", "praznjenje");
   P ("system.readiness.stopped", "ustavljeno");
   P ("system.readiness.unknown_readiness", "neznana pripravljenost");
   P ("system.component.online", "povezano");
   P ("system.component.offline", "brez povezave");
   P ("system.component.starting", "zaganjanje");
   P ("system.component.stopping", "ustavljanje");
   P ("system.component.restarting", "vnovični zagon");
   P ("system.component.unknown", "neznano stanje komponente");
   P ("system.check.passing", "uspešno");
   P ("system.check.failing", "neuspešno");
   P ("system.check.warning", "opozorilo");
   P ("system.check.skipped", "preskočeno");
   P ("system.check.timed_out", "časovna omejitev je potekla");
   P ("system.check.unknown", "neznano stanje preverjanja");
   P ("system.incident.investigating", "preiskovanje");
   P ("system.incident.identified", "ugotovljeno");
   P ("system.incident.monitoring", "spremljanje");
   P ("system.incident.resolved", "razrešeno");
   P ("system.incident.scheduled_maintenance", "načrtovano vzdrževanje");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "preverjanje {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {ni komponent} one {{count} komponenta} two "
      & "{{count} komponenti} few {{count} komponente} other {{count} "
      & "komponent}}");
   P ("system.count.checks",
      "{count, plural, =0 {ni preverjanj} one {{count} preverjanje} two "
      & "{{count} preverjanji} few {{count} preverjanja} other {{count} "
      & "preverjanj}}");
   P ("system.count.incidents",
      "{count, plural, =0 {ni incidentov} one {{count} incident} two {{count} "
      & "incidenta} few {{count} incidenti} other {{count} incidentov}}");
   P ("system.uptime", "razpoložljivost {measure}");
   P ("system.latency", "zakasnitev {measure}");
   P ("system.maintenance_window", "okno vzdrževanja {time}");
   P ("system.last_checked", "nazadnje preverjeno {time}");
   P ("system.http.informational", "informativno");
   P ("system.http.successful", "uspeh");
   P ("system.http.redirection", "preusmeritev");
   P ("system.http.client_error", "napaka odjemalca");
   P ("system.http.server_error", "napaka strežnika");
   P ("system.exit.success", "izhodna koda {code}: uspeh");
   P ("system.exit.failure", "izhodna koda {code}: neuspeh");
   P ("system.exit.usage_error", "izhodna koda {code}: napačna uporaba");
   P ("system.exit.not_executable", "izhodna koda {code}: ukaza ni mogoče izvesti");
   P ("system.exit.not_found", "izhodna koda {code}: ukaza ni mogoče najti");
   P ("system.exit.invalid_argument", "izhodna koda {code}: neveljaven argument ukaza exit");
   P ("system.exit.signal", "izhodna koda {code}: prekinjeno s signalom {signal}");
   P ("validation.problem.required", "{field}: obvezno polje");
   P ("validation.problem.minimum", "{field}: vrednost je pod minimumom");
   P ("validation.problem.maximum", "{field}: vrednost je nad maksimumom");
   P ("validation.problem.range", "{field}: vrednost je zunaj obsega");
   P ("validation.problem.pattern", "{field}: vrednost se ne ujema z vzorcem");
   P ("validation.problem.choice", "{field}: vrednost mora biti ena od dovoljenih možnosti");
   P ("validation.problem.dependency", "{field}: je odvisno od drugega polja");
   P ("validation.problem.custom", "{field}: neveljavna vrednost");
   P ("validation.constraint.no_relation", "{field}: neveljavna vrednost, pričakovano: {value}");
   P ("validation.constraint.less_than", "{field}: vrednost mora biti manjša od {value}");
   P ("validation.constraint.less_or_equal", "{field}: vrednost je lahko največ {value}");
   P ("validation.constraint.greater_than", "{field}: vrednost mora biti večja od {value}");
   P ("validation.constraint.greater_or_equal", "{field}: vrednost mora biti vsaj {value}");
   P ("validation.constraint.equal_to", "{field}: vrednost mora biti enaka {value}");
   P ("validation.constraint.not_equal_to", "{field}: vrednost ne sme biti enaka {value}");
   P ("validation.constraint.before_field", "{field}: vrednost mora biti pred {value}");
   P ("validation.constraint.after_field", "{field}: vrednost mora biti po {value}");
   P ("validation.choices", "{field}: dovoljene vrednosti: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, vneseno {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, ponoven poskus čez {time}");
   P ("net_diagnostic.dns", "{endpoint}: iskanje DNS ni uspelo");
   P ("net_diagnostic.tcp", "{endpoint}: povezava TCP ni uspela");
   P ("net_diagnostic.tls", "{endpoint}: napaka potrdila TLS");
   P ("net_diagnostic.http", "{endpoint}: zahteva HTTP ni uspela");
   P ("net_diagnostic.proxy", "{endpoint}: napaka posredniškega strežnika");
   P ("net_diagnostic.timeout", "{endpoint}: časovna omejitev je potekla");
   P ("net_diagnostic.reset", "{endpoint}: povezava je bila prekinjena");
   P ("net_diagnostic.unknown_network", "{endpoint}: napaka omrežja");
   P ("progress.state.not_started", "ni začeto");
   P ("progress.state.running", "poteka");
   P ("progress.state.stalled", "zastalo");
   P ("progress.state.retrying", "ponovni poskus");
   P ("progress.state.complete", "končano");
   P ("progress.state.failed", "ni uspelo");
   P ("progress.of", "{subject}: končano {done} od {total} ({percent} %), {state}");
   P ("progress.done", "{subject}: končano {done}, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {element} two {elementa} few "
      & "{elementi} other {elementov}}, {unique} {unique, plural, one "
      & "{edinstvena vrednost} two {edinstveni vrednosti} few {edinstvene "
      & "vrednosti} other {edinstvenih vrednosti}}, {duplicates} {duplicates, "
      & "plural, one {dvojnik} two {dvojnika} few {dvojniki} other "
      & "{dvojnikov}}, {outliers} {outliers, plural, one {osamelec} two "
      & "{osamelca} few {osamelci} other {osamelcev}}");
   P ("top_frequency",
      "{name}: {value} ({count} {count, plural, one {pojavitev} two "
      & "{pojavitvi} few {pojavitve} other {pojavitev}})");
   P ("calendar_date.fiscal_year", "PL {year}");
   P ("calendar_date.fiscal_quarter", "PL {year} Q{part}");
   P ("calendar_date.fiscal_half", "PL {year} {part}. poll.");
   P ("calendar_date.fiscal_year_end", "konec PL {year}");
   P ("calendar_date.semester", "{part}. sem. {year}");
   P ("calendar_date.half_year", "{part}. poll. {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {prvo polletje {year}} other {drugo polletje "
      & "{year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} (začetek)} mid {{text} (sredina)} other "
      & "{{text} (konec)}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text} (začetek)} mid {{text} (sredina)} other "
      & "{{text} (konec)}}");
   P ("calendar_range.weekend.last", "prejšnji vikend");
   P ("calendar_range.weekend.this", "ta vikend");
   P ("calendar_range.weekend.next", "naslednji vikend");
   P ("calendar_range.weekend_of", "vikend {date}");
   P ("calendar_range.week.last", "prejšnji teden");
   P ("calendar_range.week.this", "ta teden");
   P ("calendar_range.week.next", "naslednji teden");
   P ("calendar_range.week_of", "teden od {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "nadaljuj");
   P ("http.reason.101", "preklapljanje protokolov");
   P ("http.reason.102", "obdelava");
   P ("http.reason.103", "zgodnji namigi");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "ustvarjeno");
   P ("http.reason.202", "sprejeto");
   P ("http.reason.203", "neavtoritativne informacije");
   P ("http.reason.204", "brez vsebine");
   P ("http.reason.205", "ponastavi vsebino");
   P ("http.reason.206", "delna vsebina");
   P ("http.reason.207", "več stanj");
   P ("http.reason.208", "že sporočeno");
   P ("http.reason.226", "uporabljen IM");
   P ("http.reason.300", "več izbir");
   P ("http.reason.301", "trajno premaknjeno");
   P ("http.reason.302", "najdeno");
   P ("http.reason.303", "glej drugo");
   P ("http.reason.304", "ni spremenjeno");
   P ("http.reason.305", "uporabi posredniški strežnik");
   P ("http.reason.307", "začasna preusmeritev");
   P ("http.reason.308", "trajna preusmeritev");
   P ("http.reason.400", "neveljavna zahteva");
   P ("http.reason.401", "nepooblaščeno");
   P ("http.reason.402", "zahtevano plačilo");
   P ("http.reason.403", "prepovedano");
   P ("http.reason.404", "ni najdeno");
   P ("http.reason.405", "metoda ni dovoljena");
   P ("http.reason.406", "ni sprejemljivo");
   P ("http.reason.407", "zahtevano preverjanje pristnosti posredniškega strežnika");
   P ("http.reason.408", "časovna omejitev zahteve");
   P ("http.reason.409", "spor");
   P ("http.reason.410", "ne obstaja več");
   P ("http.reason.411", "zahtevana dolžina");
   P ("http.reason.412", "predpogoj ni izpolnjen");
   P ("http.reason.413", "vsebina je prevelika");
   P ("http.reason.414", "URI je predolg");
   P ("http.reason.415", "nepodprta vrsta medija");
   P ("http.reason.416", "obsega ni mogoče izpolniti");
   P ("http.reason.417", "pričakovanje ni izpolnjeno");
   P ("http.reason.418", "sem čajnik");
   P ("http.reason.421", "napačno usmerjena zahteva");
   P ("http.reason.422", "vsebine ni mogoče obdelati");
   P ("http.reason.423", "zaklenjeno");
   P ("http.reason.424", "neuspela odvisnost");
   P ("http.reason.425", "prezgodaj");
   P ("http.reason.426", "zahtevana nadgradnja");
   P ("http.reason.428", "zahtevan predpogoj");
   P ("http.reason.429", "preveč zahtev");
   P ("http.reason.431", "polja glave zahteve so prevelika");
   P ("http.reason.451", "ni na voljo iz pravnih razlogov");
   P ("http.reason.500", "notranja napaka strežnika");
   P ("http.reason.501", "ni implementirano");
   P ("http.reason.502", "neveljaven prehod");
   P ("http.reason.503", "storitev ni na voljo");
   P ("http.reason.504", "časovna omejitev prehoda");
   P ("http.reason.505", "različica HTTP ni podprta");
   P ("http.reason.506", "različica se tudi pogaja");
   P ("http.reason.507", "premalo prostora za shranjevanje");
   P ("http.reason.508", "zaznana zanka");
   P ("http.reason.510", "ni razširjeno");
   P ("http.reason.511", "zahtevano preverjanje pristnosti v omrežju");
   P ("errno.reason.0", "uspešno");
   P ("errno.reason.1", "operacija ni dovoljena");
   P ("errno.reason.2", "datoteka ali imenik s tem imenom ne obstaja");
   P ("errno.reason.3", "tak proces ne obstaja");
   P ("errno.reason.4", "prekinjen sistemski klic");
   P ("errno.reason.5", "vhodno/izhodna napaka");
   P ("errno.reason.6", "taka naprava ali naslov ne obstaja");
   P ("errno.reason.9", "nepravilni datotečni deskriptor");
   P ("errno.reason.11", "vir začasno ni na razpolago");
   P ("errno.reason.12", "pomnilnika ni mogoče dodeliti");
   P ("errno.reason.13", "dostop zavrnjen");
   P ("errno.reason.17", "datoteka že obstaja");
   P ("errno.reason.20", "ni imenik");
   P ("errno.reason.21", "je imenik");
   P ("errno.reason.22", "neveljavni argument");
   P ("errno.reason.24", "preveč odpretih datotek");
   P ("errno.reason.28", "na napravi ni več prostora");
   P ("errno.reason.32", "prekinjen cevovod");
   P ("errno.reason.98", "naslov je že v rabi");
   P ("errno.reason.110", "čas za povezavo je potekel");
   P ("errno.reason.111", "povezava zavrnjena");
   P ("signal.reason.1", "odklop");
   P ("signal.reason.2", "prekinitev");
   P ("signal.reason.3", "končanje");
   P ("signal.reason.4", "nedovoljen ukaz");
   P ("signal.reason.5", "past");
   P ("signal.reason.6", "prekinjen");
   P ("signal.reason.7", "napaka vodila");
   P ("signal.reason.8", "prekoračitev plavajoče vejice");
   P ("signal.reason.9", "pobit");
   P ("signal.reason.10", "uporabniški signal 1");
   P ("signal.reason.11", "napaka segmentacije");
   P ("signal.reason.12", "uporabniški signal 2");
   P ("signal.reason.13", "prekinjen cevovod");
   P ("signal.reason.14", "budilka");
   P ("signal.reason.15", "zaključen");
   P ("signal.reason.17", "izhod nasledniškega procesa");
   P ("signal.reason.18", "nadaljevan");
   P ("signal.reason.19", "ustavljen (signal)");
   P ("signal.reason.20", "ustavljen");
   P ("signal.reason.28", "zamenjano okno");
   P ("sqlstate.reason.00", "uspešno dokončanje");
   P ("sqlstate.reason.01", "opozorilo");
   P ("sqlstate.reason.02", "ni podatkov");
   P ("sqlstate.reason.08", "izjema povezave");
   P ("sqlstate.reason.0a", "funkcija ni podprta");
   P ("sqlstate.reason.22", "izjema podatkov");
   P ("sqlstate.reason.23", "kršitev omejitve celovitosti");
   P ("sqlstate.reason.24", "neveljavno stanje kazalca");
   P ("sqlstate.reason.25", "neveljavno stanje transakcije");
   P ("sqlstate.reason.28", "neveljavna specifikacija pooblastila");
   P ("sqlstate.reason.2d", "neveljaven zaključek transakcije");
   P ("sqlstate.reason.3d", "neveljavno ime kataloga");
   P ("sqlstate.reason.3f", "neveljavno ime sheme");
   P ("sqlstate.reason.40", "povrnitev transakcije");
   P ("sqlstate.reason.42", "skladenjska napaka ali kršitev pravila dostopa");
   P ("sqlstate.reason.53", "nezadostni viri");
   P ("sqlstate.reason.54", "presežena omejitev programa");
   P ("sqlstate.reason.55", "objekt ni v zahtevanem stanju");
   P ("sqlstate.reason.57", "poseg operaterja");
   P ("sqlstate.reason.58", "sistemska napaka");
   P ("sqlstate.reason.hv", "napaka ovojnice tujih podatkov");
   P ("sqlstate.reason.p0", "napaka PL/pgSQL");
   P ("sqlstate.reason.xx", "notranja napaka");
   P ("system.signal_numbered", "signal {number} {name} {reason}");
   P ("http.reason.unknown", "neznano stanje");
   P ("errno.reason.unknown", "neznana napaka");
   P ("signal.reason.unknown", "neznan signal");
   P ("sqlstate.reason.unknown", "neznan razred SQLSTATE");
end Locale_Sl;
