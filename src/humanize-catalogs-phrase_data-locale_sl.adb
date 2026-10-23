separate (Humanize.Catalogs.Phrase_Data)
function Locale_Sl return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("sl", Name, Template));
begin
   return
     P ("all_count",
          "skupaj {total} {total, plural, one {{one}} two {{two}} few {{few}} "
          & "other {{genitive_other}}}")
     & P ("filtered_count.none", "ni ujemajočih se {genitive_other}")
     & P ("filtered_count.all",
          "{total, plural, =1 {ujemanje pri {total} {locative_one}} one {ujemanje "
          & "pri vseh {total} {locative_one}} other {ujemanje pri vseh {total} "
          & "{locative_other}}}")
     & P ("filtered_count.some",
          "{matching, plural, one {ujema se} two {ujemata se} few {ujemajo se} "
          & "other {ujema se}} {matching} od {total} {total, plural, one "
          & "{{genitive_one}} two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}")
     & P ("more_count", "prikazano: {visible}, +{remaining} več")
     & P ("others_count", "{first} in še {remaining}")
     & P ("page_count", "stran {page} od {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} two {{two}} few {{few}} other "
          & "{{genitive_other}}} na stran")
     & P ("pagination_range",
          "{first}–{last} od {total} {total, plural, one {{genitive_one}} two "
          & "{{genitive_other}} few {{genitive_other}} other {{genitive_other}}}")
     & P ("position_count", "{position} od {total}")
     & P ("selection_count",
          "izbrano: {selected} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}")
     & P ("showing_count",
          "prikazano: {showing} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {brez napak} warning "
          & "{brez opozoril} other {brez obvestil}}} one {{count} {severity, "
          & "select, error {napaka} warning {opozorilo} other {obvestilo}}} two "
          & "{{count} {severity, select, error {napaki} warning {opozorili} other "
          & "{obvestili}}} few {{count} {severity, select, error {napake} warning "
          & "{opozorila} other {obvestila}}} other {{count} {severity, select, "
          & "error {napak} warning {opozoril} other {obvestil}}}}")
     & P ("collection.empty", "ni {genitive_other}")
     & P ("collection.none_shown", "ni prikazanih {genitive_other}")
     & P ("collection.showing_hidden",
          "prikazano: {visible} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}, skrito: {hidden}")
     & P ("collection.showing",
          "prikazano: {visible} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}")
     & P ("collection.shown_hidden",
          "prikazano: {visible} {visible, plural, one {{one}} two {{two}} few "
          & "{{few}} other {{genitive_other}}}, skrito: {hidden}")
     & P ("collection.shown",
          "prikazano: {visible} {visible, plural, one {{one}} two {{two}} few "
          & "{{few}} other {{genitive_other}}}")
     & P ("collection.visible_out_of",
          "vidno: {visible} od {total} {total, plural, one {{genitive_one}} two "
          & "{{genitive_other}} few {{genitive_other}} other {{genitive_other}}}")
     & P ("complete_count", "dokončano: {done} od {total}")
     & P ("percent_complete", "dokončano: {percent} %")
     & P ("step_count", "korak {step} od {total}")
     & P ("attempt_count", "poskus {attempt} od {total}")
     & P ("throughput_remaining", "preostalo: {remaining} ({unit}), {rate} {unit}/s")
     & P ("accessible_progress",
          "dokončano: {done} od {total}, {percent, plural, one {{percent} "
          & "odstotek} two {{percent} odstotka} few {{percent} odstotki} other "
          & "{{percent} odstotkov}}")
     & P ("business_days",
          "{days, plural, one {{days} delovni dan} two {{days} delovna dneva} few "
          & "{{days} delovni dnevi} other {{days} delovnih dni}}")
     & P ("working_hours",
          "{hours, plural, one {{hours} delovna ura} two {{hours} delovni uri} "
          & "few {{hours} delovne ure} other {{hours} delovnih ur}}")
     & P ("due.overdue",
          "zamuda: {days, plural, one {{days} dan} two {{days} dneva} few {{days} "
          & "dni} other {{days} dni}}")
     & P ("due.today", "rok danes")
     & P ("due.tomorrow", "rok jutri")
     & P ("due.in",
          "rok čez {days, plural, one {{days} dan} two {{days} dneva} few "
          & "{{days} dni} other {{days} dni}}")
     & P ("calendar_difference.future", "čez {difference}")
     & P ("calendar_difference.past", "pred {difference}")
     & P ("calendar_difference.case.future", "accusative")
     & P ("calendar_difference.case.past", "instrumental")
     & P ("cpu_load", "obremenitev CPE {measure}")
     & P ("battery", "baterija {measure}")
     & P ("screen_size", "zaslon {measure}")
     & P ("refresh_rate", "hitrost osveževanja {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value, plural, one {{value} odstotek} two {{value} odstotka} few "
          & "{{value} odstotki} other {{value} odstotkov}}")
     & P ("recurrence.second",
          "{every, plural, =1 {vsako sekundo} one {vsako {every} sekundo} two "
          & "{vsaki {every} sekundi} few {vsake {every} sekunde} other {vsakih "
          & "{every} sekund}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {vsako minuto} one {vsako {every} minuto} two "
          & "{vsaki {every} minuti} few {vsake {every} minute} other {vsakih "
          & "{every} minut}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {vsako uro} one {vsako {every} uro} two {vsaki "
          & "{every} uri} few {vsake {every} ure} other {vsakih {every} ur}}")
     & P ("recurrence.day",
          "{every, plural, =1 {vsak dan} one {vsak {every} dan} two {vsaka "
          & "{every} dneva} few {vsake {every} dni} other {vsakih {every} dni}}")
     & P ("recurrence.week",
          "{every, plural, =1 {vsak teden} one {vsak {every} teden} two {vsaka "
          & "{every} tedna} few {vsake {every} tedne} other {vsakih {every} "
          & "tednov}}")
     & P ("recurrence.month",
          "{every, plural, =1 {vsak mesec} one {vsak {every} mesec} two {vsaka "
          & "{every} meseca} few {vsake {every} mesece} other {vsakih {every} "
          & "mesecev}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {vsako četrtletje} one {vsako {every} četrtletje} "
          & "two {vsaki {every} četrtletji} few {vsaka {every} četrtletja} other "
          & "{vsakih {every} četrtletij}}")
     & P ("recurrence.year",
          "{every, plural, =1 {vsako leto} one {vsako {every} leto} two {vsaki "
          & "{every} leti} few {vsaka {every} leta} other {vsakih {every} let}}")
     & P ("cache_summary.empty", "predpomnilnik: ni zahtev")
     & P ("cache_summary",
          "predpomnilnik: {hits, plural, one {{hits} zadetek} two {{hits} "
          & "zadetka} few {{hits} zadetki} other {{hits} zadetkov}}, {misses, "
          & "plural, one {{misses} zgrešitev} two {{misses} zgrešitvi} few "
          & "{{misses} zgrešitve} other {{misses} zgrešitev}}, delež zadetkov "
          & "{rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} two {{two}} few {{few}} other "
          & "{{genitive_other}}}: spremenjeno {changed}, dodano {added}, "
          & "odstranjeno {removed}")
     & P ("field_diff", "{field}: spremenjeno iz {before} v {after}")
     & P ("field_added", "{field}: dodano z vrednostjo {value}")
     & P ("field_removed", "{field}: odstranjeno (prej {value})")
     & P ("field_unchanged", "{field}: brez spremembe ({value})")
     & P ("number_comparison.equal", "{current} je enako kot {baseline}")
     & P ("number_comparison.higher", "{current} je za {quantity} več kot {baseline}")
     & P ("number_comparison.lower", "{current} je za {quantity} manj kot {baseline}")
     & P ("percent_comparison.equal", "{current} je enako kot {baseline}")
     & P ("percent_comparison.higher", "{current} je za {quantity} več kot {baseline}")
     & P ("percent_comparison.lower", "{current} je za {quantity} manj kot {baseline}")
     & P ("file_size_comparison.same", "{current} ima enako velikost kot {baseline}")
     & P ("file_size_comparison.larger", "{current} ima za {quantity} večjo velikost kot {baseline}")
     & P ("file_size_comparison.smaller", "{current} ima za {quantity} manjšo velikost kot {baseline}")
     & P ("date_comparison.same", "{current} je isti datum kot {baseline}")
     & P ("date_comparison.after", "{current} je {quantity} pozneje kot {baseline}")
     & P ("date_comparison.before", "{current} je {quantity} prej kot {baseline}")
     & P ("queue_summary", "čakalna vrsta: {details}")
     & P ("queue_summary.empty", "čakalna vrsta prazna")
     & P ("domain_summary",
          "{domain, select, queue {čakalna vrsta} job {opravilo} run {zagon} "
          & "cache {predpomnilnik} sync {sinhronizacija} import {uvoz} export "
          & "{izvoz} other {{domain}}} – {state, select, queued {v čakalni "
          & "vrsti} running {se izvaja} waiting {čaka} paused {začasno "
          & "ustavljeno} complete {dokončano} failed {ni uspelo} stale {zastarelo} "
          & "skipped {preskočeno} other {{state}}}: {details}")
     & P ("summary.none", "ni {genitive_other}")
     & P ("summary.completed",
          "dokončano: {count} {count, plural, one {{one}} two {{two}} few "
          & "{{few}} other {{genitive_other}}}")
     & P ("summary.completed_of",
          "dokončano: {count} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}")
     & P ("summary.failed", "ni uspelo: {count}")
     & P ("summary.queued",
          "v čakalni vrsti: {count} {count, plural, one {{one}} two {{two}} few "
          & "{{few}} other {{genitive_other}}}")
     & P ("summary.running", "se izvaja: {count}")
     & P ("summary.complete", "dokončano: {count}")
     & P ("backup.backup_running", "varnostno kopiranje poteka")
     & P ("backup.backup_completed", "varnostno kopiranje dokončano")
     & P ("backup.backup_failed", "varnostno kopiranje ni uspelo")
     & P ("backup.backup_stale", "varnostna kopija je zastarela")
     & P ("incident.incident_investigating", "preiskovanje incidenta")
     & P ("incident.incident_identified", "incident ugotovljen")
     & P ("incident.incident_mitigated", "incident omiljen")
     & P ("incident.incident_resolved", "incident razrešen")
     & P ("release.release_drafting", "izdaja v pripravi")
     & P ("release.release_ready", "izdaja pripravljena")
     & P ("release.release_published", "izdaja objavljena")
     & P ("release.release_rolled_back", "izdaja povrnjena")
     & P ("audit.audit_created", "revizijski vnos ustvarjen")
     & P ("audit.audit_updated", "revizijski vnos posodobljen")
     & P ("audit.audit_deleted", "revizijski vnos izbrisan")
     & P ("audit.audit_restored", "revizijski vnos obnovljen")
     & P ("flag.flag_enabled", "zastavica funkcije omogočena")
     & P ("flag.flag_disabled", "zastavica funkcije onemogočena")
     & P ("flag.flag_rolling_out", "zastavica funkcije se postopno uvaja")
     & P ("flag.flag_rolled_back", "zastavica funkcije povrnjena")
     & P ("webhook.webhook_pending", "webhook čaka")
     & P ("webhook.webhook_delivered", "webhook dostavljen")
     & P ("webhook.webhook_failed", "webhook ni uspel")
     & P ("webhook.webhook_retrying", "webhook: ponovni poskus")
     & P ("api_key.api_key_active", "ključ API aktiven")
     & P ("api_key.api_key_revoked", "ključ API preklican")
     & P ("api_key.api_key_expired", "ključ API potekel")
     & P ("api_key.api_key_rotated", "ključ API zamenjan")
     & P ("quota.quota_available", "kvota na voljo")
     & P ("quota.quota_near_limit", "kvota skoraj porabljena")
     & P ("quota.quota_exceeded", "kvota presežena")
     & P ("quota.quota_reset", "kvota ponastavljena")
     & P ("invoice.invoice_draft", "osnutek računa")
     & P ("invoice.invoice_sent", "račun poslan")
     & P ("invoice.invoice_paid", "račun plačan")
     & P ("invoice.invoice_refunded", "znesek računa povrnjen")
     & P ("invoice.invoice_overdue", "račun zapadel")
     & P ("invoice.refund_failed", "vračilo ni uspelo")
     & P ("page_navigation.only", "edina stran")
     & P ("page_navigation.first", "prva stran, naslednja na voljo")
     & P ("page_navigation.last", "zadnja stran, prejšnja na voljo")
     & P ("page_navigation.middle", "prejšnja in naslednja na voljo")
     & P ("end_of_week", "konec tedna")
     & P ("end_of_month", "konec meseca")
     & P ("end_of_quarter", "konec četrtletja")
     & P ("time_of_day.night", "noč")
     & P ("time_of_day.morning", "jutro")
     & P ("time_of_day.afternoon", "popoldne")
     & P ("time_of_day.evening", "večer")
     & P ("calendar_difference.same_day", "isti dan")
     & P ("calendar_difference.zero", "0 dni")
     & P ("access.allowed", "dovoljeno")
     & P ("access.denied", "zavrnjeno")
     & P ("access.owner", "lastnik")
     & P ("access.admin", "skrbnik")
     & P ("access.viewer", "bralec")
     & P ("access.editor", "urednik")
     & P ("auth.signed_in", "prijavljeno")
     & P ("auth.signed_out", "odjavljeno")
     & P ("auth.session_expired", "seja je potekla")
     & P ("auth.locked", "zaklenjeno")
     & P ("auth.two_factor_required", "zahtevano dvofaktorsko preverjanje")
     & P ("billing.trialing", "preizkusno obdobje")
     & P ("billing.payment_due", "plačilo zapade")
     & P ("billing.payment_failed", "plačilo ni uspelo")
     & P ("billing.paid", "plačano")
     & P ("billing.past_due", "zapadlo")
     & P ("billing.canceled", "preklicano")
     & P ("ci.pipeline_pending", "cevovod čaka")
     & P ("ci.pipeline_running", "cevovod se izvaja")
     & P ("ci.pipeline_passed", "cevovod uspešen")
     & P ("ci.pipeline_failed", "cevovod ni uspel")
     & P ("ci.review_required", "zahtevan pregled")
     & P ("ci.deploy_blocked", "uvajanje blokirano")
     & P ("collaboration.active_now", "trenutno aktiven")
     & P ("collaboration.away", "odsoten")
     & P ("collaboration.do_not_disturb", "ne moti")
     & P ("collaboration.typing", "tipka")
     & P ("collaboration.viewing", "si ogleduje")
     & P ("collaboration.editing", "ureja")
     & P ("deployment.deploying", "uvajanje")
     & P ("deployment.deployed", "uvedeno")
     & P ("deployment.rolling_back", "povrnitev")
     & P ("deployment.rolled_back", "povrnjeno")
     & P ("deployment.build_failed", "gradnja ni uspela")
     & P ("deployment.checks_passed", "preverjanja uspešna")
     & P ("empty.no_items", "ni elementov")
     & P ("empty.no_results", "ni rezultatov")
     & P ("empty.no_messages", "ni sporočil")
     & P ("empty.no_selection", "ni izbire")
     & P ("empty.nothing_to_show", "ni česa prikazati")
     & P ("file.uploading", "nalaganje")
     & P ("file.downloading", "prenašanje")
     & P ("file.copying", "kopiranje")
     & P ("file.moving", "premikanje")
     & P ("file.deleting", "brisanje")
     & P ("file.deleted", "izbrisano")
     & P ("file.restoring", "obnavljanje")
     & P ("file.synced", "sinhronizirano")
     & P ("form.valid_input", "veljaven vnos")
     & P ("form.invalid_input", "neveljaven vnos")
     & P ("form.dirty", "spremenjeno")
     & P ("form.pristine", "nespremenjeno")
     & P ("form.submitted", "poslano")
     & P ("form.submission_failed", "pošiljanje ni uspelo")
     & P ("health.healthy", "brezhibno")
     & P ("health.degraded", "okrnjeno delovanje")
     & P ("health.unhealthy", "nedelujoče")
     & P ("health.incident", "incident")
     & P ("health.maintenance", "vzdrževanje")
     & P ("health.recovering", "obnavljanje delovanja")
     & P ("issue.open", "odprto")
     & P ("issue.closed", "zaprto")
     & P ("issue.reopened", "znova odprto")
     & P ("issue.assigned", "dodeljeno")
     & P ("issue.unassigned", "nedodeljeno")
     & P ("issue.merged", "združeno")
     & P ("network.offline", "brez povezave")
     & P ("network.online", "povezano")
     & P ("network.connecting", "povezovanje")
     & P ("network.syncing", "sinhronizacija")
     & P ("network.sync_failed", "sinhronizacija ni uspela")
     & P ("network.permission_denied", "dostop zavrnjen")
     & P ("network.read_only", "samo za branje")
     & P ("notification.unread", "neprebrano")
     & P ("notification.read", "prebrano")
     & P ("notification.muted", "utišano")
     & P ("notification.snoozed", "preloženo")
     & P ("notification.sent", "poslano")
     & P ("notification.delivered", "dostavljeno")
     & P ("payment.payment_authorized", "plačilo odobreno")
     & P ("payment.payment_captured", "plačilo prejeto")
     & P ("payment.payment_refunded", "plačilo vrnjeno")
     & P ("payment.payment_disputed", "plačilo izpodbijano")
     & P ("payment.payment_requires_action", "plačilo zahteva ukrepanje")
     & P ("payment.payment_expired", "plačilo je poteklo")
     & P ("ui.empty", "prazno")
     & P ("ui.loading", "nalaganje")
     & P ("ui.saving", "shranjevanje")
     & P ("ui.saved", "shranjeno")
     & P ("ui.unsaved", "neshranjeno")
     & P ("ui.retrying", "ponovni poskus")
     & P ("ui.paused", "začasno ustavljeno")
     & P ("ui.complete", "dokončano")
     & P ("ui.failed", "ni uspelo")
     & P ("ui.due_soon", "kmalu zapade")
     & P ("ui.overdue", "zapadlo")
     & P ("ui.last_seen", "nazadnje viden")
     & P ("ui.updated_just_now", "pravkar posodobljeno")
     & P ("queue.queued", "v čakalni vrsti")
     & P ("queue.running", "se izvaja")
     & P ("queue.waiting", "čaka")
     & P ("queue.blocked", "blokirano")
     & P ("queue.canceled_job", "opravilo preklicano")
     & P ("queue.completed_job", "opravilo dokončano")
     & P ("search.filtering", "filtriranje")
     & P ("search.filtered", "filtrirano")
     & P ("search.no_matches", "ni ujemanj")
     & P ("search.search_ready", "iskanje pripravljeno")
     & P ("search.search_failed", "iskanje ni uspelo")
     & P ("search.query_too_short", "poizvedba je prekratka")
     & P ("security.secure", "varno")
     & P ("security.insecure", "nevarno")
     & P ("security.vulnerable", "ranljivo")
     & P ("security.encrypted", "šifrirano")
     & P ("security.unencrypted", "nešifrirano")
     & P ("security.token_expired", "žeton je potekel")
     & P ("sync.sync_idle", "sinhronizacija miruje")
     & P ("sync.syncing_now", "sinhronizacija poteka")
     & P ("sync.sync_queued", "sinhronizacija v čakalni vrsti")
     & P ("sync.sync_conflict", "spor pri sinhronizaciji")
     & P ("sync.sync_complete", "sinhronizacija dokončana")
     & P ("sync.sync_error", "napaka sinhronizacije")
     & P ("task.todo", "za izvedbo")
     & P ("task.in_progress", "v teku")
     & P ("task.done", "opravljeno")
     & P ("task.skipped", "preskočeno")
     & P ("task.blocked_task", "blokirano")
     & P ("task.waiting_on", "čaka na")
     & P ("ticket.ticket_new", "nov zahtevek")
     & P ("ticket.ticket_open", "zahtevek odprt")
     & P ("ticket.ticket_waiting", "zahtevek čaka")
     & P ("ticket.ticket_escalated", "zahtevek posredovan višje")
     & P ("ticket.ticket_resolved", "zahtevek razrešen")
     & P ("ticket.ticket_closed", "zahtevek zaprt")
     & P ("transfer.importing", "uvažanje")
     & P ("transfer.imported", "uvoženo")
     & P ("transfer.import_failed", "uvoz ni uspel")
     & P ("transfer.exporting", "izvažanje")
     & P ("transfer.exported", "izvoženo")
     & P ("transfer.export_failed", "izvoz ni uspel")
     & P ("validation.required", "obvezno")
     & P ("validation.optional", "izbirno")
     & P ("validation.invalid", "neveljavno")
     & P ("validation.too_short", "prekratko")
     & P ("validation.too_long", "predolgo")
     & P ("validation.out_of_range", "zunaj obsega")
     & P ("validation.already_exists", "že obstaja")
     & P ("workflow.draft", "osnutek")
     & P ("workflow.in_review", "v pregledu")
     & P ("workflow.approved", "odobreno")
     & P ("workflow.rejected", "zavrnjeno")
     & P ("workflow.published", "objavljeno")
     & P ("workflow.archived", "arhivirano")
     & P ("database.database_online", "zbirka podatkov povezana")
     & P ("database.database_offline", "zbirka podatkov brez povezave")
     & P ("database.database_degraded", "zbirka podatkov okrnjena")
     & P ("database.database_migrating", "selitev zbirke podatkov")
     & P ("database.database_migration_failed", "selitev zbirke podatkov ni uspela")
     & P ("database.database_replicating", "replikacija zbirke podatkov")
     & P ("database.database_replication_lagging", "replikacija zbirke podatkov zaostaja")
     & P ("database.database_backup_running", "varnostno kopiranje zbirke podatkov poteka")
     & P ("database.database_backup_failed", "varnostno kopiranje zbirke podatkov ni uspelo")
     & P ("count",
          "{count, plural, one {# {one}} two {# {two}} few {# {few}} other {# "
          & "{genitive_other}}}")
     & P ("noun",
          "{count, plural, one {{one}} two {{two}} few {{few}} other "
          & "{{genitive_other}}}")
     & P ("noun.accusative",
          "{count, plural, one {{accusative_one}} two {{two}} few {{few}} other "
          & "{{genitive_other}}}")
     & P ("number_comparison.case", "accusative")
     & P ("times_noun",
          "{count, plural, =0 {nikoli {other}} =1 {enkrat {one}} =2 {dvakrat "
          & "{other}} other {{count}-krat {other}}}")
     & P ("availability.all",
          "na voljo: {available} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}")
     & P ("availability.none", "ni razpoložljivih {genitive_other}")
     & P ("availability.partial",
          "na voljo: {available} od {total} {total, plural, one {{genitive_one}} "
          & "two {{genitive_other}} few {{genitive_other}} other "
          & "{{genitive_other}}}, ni na voljo: {unavailable}")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "v čakalni vrsti")
     & P ("operation.running", "se izvaja")
     & P ("operation.blocked", "blokirano")
     & P ("operation.retrying", "ponovni poskus")
     & P ("operation.succeeded", "uspešno")
     & P ("operation.partially_succeeded", "delno uspešno")
     & P ("operation.failed", "ni uspelo")
     & P ("operation.canceled", "preklicano")
     & P ("operation.skipped", "preskočeno")
     & P ("operation.stale", "zastarelo")
     & P ("operation.unknown_state", "neznano")
     & P ("operation.last_success", "{name}: zadnji uspeh {time}")
     & P ("operation.next_retry", "{name}: naslednji poskus {time}")
     & P ("operation.stale_run", "{name} – zastarelo: {time}")
     & P ("summary.skipped", "preskočeno: {count}")
     & P ("summary.retried", "ponovljeno: {count}")
     & P ("summary.canceled", "preklicano: {count}")
     & P ("system.service.operational", "deluje")
     & P ("system.service.degraded", "zmanjšana zmogljivost")
     & P ("system.service.partial_outage", "delni izpad")
     & P ("system.service.major_outage", "večji izpad")
     & P ("system.service.maintenance", "v vzdrževanju")
     & P ("system.service.unknown", "neznano stanje storitve")
     & P ("system.health.healthy", "v redu")
     & P ("system.health.warning", "opozorilo")
     & P ("system.health.critical", "kritično")
     & P ("system.health.unavailable", "nedosegljivo")
     & P ("system.health.unknown_health", "neznano zdravstveno stanje")
     & P ("system.readiness.ready", "pripravljeno")
     & P ("system.readiness.not_ready", "ni pripravljeno")
     & P ("system.readiness.starting", "zaganjanje")
     & P ("system.readiness.draining", "praznjenje")
     & P ("system.readiness.stopped", "ustavljeno")
     & P ("system.readiness.unknown_readiness", "neznana pripravljenost")
     & P ("system.component.online", "povezano")
     & P ("system.component.offline", "brez povezave")
     & P ("system.component.starting", "zaganjanje")
     & P ("system.component.stopping", "ustavljanje")
     & P ("system.component.restarting", "vnovični zagon")
     & P ("system.component.unknown", "neznano stanje komponente")
     & P ("system.check.passing", "uspešno")
     & P ("system.check.failing", "neuspešno")
     & P ("system.check.warning", "opozorilo")
     & P ("system.check.skipped", "preskočeno")
     & P ("system.check.timed_out", "časovna omejitev je potekla")
     & P ("system.check.unknown", "neznano stanje preverjanja")
     & P ("system.incident.investigating", "preiskovanje")
     & P ("system.incident.identified", "ugotovljeno")
     & P ("system.incident.monitoring", "spremljanje")
     & P ("system.incident.resolved", "razrešeno")
     & P ("system.incident.scheduled_maintenance", "načrtovano vzdrževanje")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "preverjanje {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {ni komponent} one {{count} komponenta} two "
          & "{{count} komponenti} few {{count} komponente} other {{count} "
          & "komponent}}")
     & P ("system.count.checks",
          "{count, plural, =0 {ni preverjanj} one {{count} preverjanje} two "
          & "{{count} preverjanji} few {{count} preverjanja} other {{count} "
          & "preverjanj}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {ni incidentov} one {{count} incident} two {{count} "
          & "incidenta} few {{count} incidenti} other {{count} incidentov}}")
     & P ("system.uptime", "razpoložljivost {measure}")
     & P ("system.latency", "zakasnitev {measure}")
     & P ("system.maintenance_window", "okno vzdrževanja {time}")
     & P ("system.last_checked", "nazadnje preverjeno {time}")
     & P ("system.http.informational", "informativno")
     & P ("system.http.successful", "uspeh")
     & P ("system.http.redirection", "preusmeritev")
     & P ("system.http.client_error", "napaka odjemalca")
     & P ("system.http.server_error", "napaka strežnika")
     & P ("system.exit.success", "izhodna koda {code}: uspeh")
     & P ("system.exit.failure", "izhodna koda {code}: neuspeh")
     & P ("system.exit.usage_error", "izhodna koda {code}: napačna uporaba")
     & P ("system.exit.not_executable", "izhodna koda {code}: ukaza ni mogoče izvesti")
     & P ("system.exit.not_found", "izhodna koda {code}: ukaza ni mogoče najti")
     & P ("system.exit.invalid_argument", "izhodna koda {code}: neveljaven argument ukaza exit")
     & P ("system.exit.signal", "izhodna koda {code}: prekinjeno s signalom {signal}");
end Locale_Sl;
