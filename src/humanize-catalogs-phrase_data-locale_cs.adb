separate (Humanize.Catalogs.Phrase_Data)
function Locale_Cs return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("cs", Name, Template));
begin
   return
     P ("all_count",
          "celkem {total} {total, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("filtered_count.none", "{other}: žádné shody")
     & P ("filtered_count.all",
          "{total, plural, one {shoda u {total} {genitive_one}} few {shoda u "
          & "všech {total} {genitive_other}} many {shoda u všech {total} "
          & "{genitive_one}} other {shoda u všech {total} {genitive_other}}}")
     & P ("filtered_count.some",
          "{matching, plural, one {vyhovuje} few {vyhovují} many {vyhovuje} "
          & "other {vyhovuje}} {matching} z {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
          & "{{genitive_other}}}")
     & P ("more_count", "zobrazeno {visible}, +{remaining} dalších")
     & P ("others_count",
          "{first} a {remaining, plural, one {{remaining} další} few "
          & "{{remaining} další} many {{remaining} dalšího} other {{remaining} "
          & "dalších}}")
     & P ("page_count", "strana {page} z {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{few}} many {{genitive_one}} "
          & "other {{genitive_other}}} na stránku")
     & P ("pagination_range",
          "{first}–{last} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("position_count", "{position} z {total}")
     & P ("selection_count",
          "vybráno {selected} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("showing_count",
          "zobrazeno {showing} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {žádné chyby} warning "
          & "{žádná varování} other {žádná upozornění}}} one {1 "
          & "{severity, select, error {chyba} warning {varování} other "
          & "{upozornění}}} few {{count} {severity, select, error {chyby} warning "
          & "{varování} other {upozornění}}} many {{count} {severity, select, "
          & "error {chyby} warning {varování} other {upozornění}}} other "
          & "{{count} {severity, select, error {chyb} warning {varování} other "
          & "{upozornění}}}}")
     & P ("collection.none_shown", "{other}: nic nezobrazeno")
     & P ("collection.showing_hidden",
          "zobrazeno {visible} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}, "
          & "skryto {hidden}")
     & P ("collection.showing",
          "zobrazeno {visible} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("collection.shown_hidden",
          "zobrazeno: {visible} {visible, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}, skryto: {hidden}")
     & P ("collection.shown",
          "zobrazeno: {visible} {visible, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("collection.visible_out_of",
          "viditelné: {visible} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("complete_count", "dokončeno {done} z {total}")
     & P ("percent_complete", "dokončeno {percent} %")
     & P ("step_count", "krok {step} z {total}")
     & P ("attempt_count", "pokus {attempt} z {total}")
     & P ("throughput_remaining", "zbývá: {remaining} ({unit}), {rate} {unit}/s")
     & P ("accessible_progress",
          "dokončeno {done} z {total}, {percent, plural, one {{percent} "
          & "procento} few {{percent} procenta} many {{percent} procenta} other "
          & "{{percent} procent}}")
     & P ("business_days",
          "{days, plural, one {{days} pracovní den} few {{days} pracovní dny} "
          & "many {{days} pracovního dne} other {{days} pracovních dnů}}")
     & P ("working_hours",
          "{hours, plural, one {{hours} pracovní hodina} few {{hours} pracovní "
          & "hodiny} many {{hours} pracovní hodiny} other {{hours} pracovních "
          & "hodin}}")
     & P ("due.overdue",
          "po termínu o {days, plural, one {{days} den} few {{days} dny} many "
          & "{{days} dne} other {{days} dní}}")
     & P ("due.today", "termín dnes")
     & P ("due.tomorrow", "termín zítra")
     & P ("due.in",
          "termín za {days, plural, one {{days} den} few {{days} dny} many "
          & "{{days} dne} other {{days} dní}}")
     & P ("calendar_difference.future", "za {difference}")
     & P ("calendar_difference.past", "před {difference}")
     & P ("calendar_difference.case.future", "accusative")
     & P ("calendar_difference.case.past", "instrumental")
     & P ("cpu_load", "zatížení CPU {measure}")
     & P ("battery", "baterie {measure}")
     & P ("screen_size", "obrazovka {measure}")
     & P ("refresh_rate", "obnovovací frekvence {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value, plural, one {{value} procento} few {{value} procenta} many "
          & "{{value} procenta} other {{value} procent}}")
     & P ("recurrence.second",
          "{every, plural, =1 {každou sekundu} one {každou {every} sekundu} few "
          & "{každé {every} sekundy} many {každých {every} sekundy} other "
          & "{každých {every} sekund}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {každou minutu} one {každou {every} minutu} few "
          & "{každé {every} minuty} many {každých {every} minuty} other "
          & "{každých {every} minut}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {každou hodinu} one {každou {every} hodinu} few "
          & "{každé {every} hodiny} many {každých {every} hodiny} other "
          & "{každých {every} hodin}}")
     & P ("recurrence.day",
          "{every, plural, =1 {každý den} one {každý {every} den} few "
          & "{každé {every} dny} many {každých {every} dne} other {každých "
          & "{every} dní}}")
     & P ("recurrence.week",
          "{every, plural, =1 {každý týden} one {každý {every} týden} few "
          & "{každé {every} týdny} many {každých {every} týdne} other "
          & "{každých {every} týdnů}}")
     & P ("recurrence.month",
          "{every, plural, =1 {každý měsíc} one {každý {every} měsíc} few "
          & "{každé {every} měsíce} many {každých {every} měsíce} other "
          & "{každých {every} měsíců}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {každé čtvrtletí} one {každé {every} "
          & "čtvrtletí} few {každá {every} čtvrtletí} many {každých {every} "
          & "čtvrtletí} other {každých {every} čtvrtletí}}")
     & P ("recurrence.year",
          "{every, plural, =1 {každý rok} one {každý {every} rok} few "
          & "{každé {every} roky} many {každých {every} roku} other {každých "
          & "{every} let}}")
     & P ("cache_summary.empty", "mezipaměť: žádné požadavky")
     & P ("cache_summary",
          "mezipaměť: {hits, plural, one {{hits} zásah} few {{hits} zásahy} "
          & "many {{hits} zásahu} other {{hits} zásahů}}, {misses, plural, one "
          & "{{misses} výpadek} few {{misses} výpadky} many {{misses} výpadku} "
          & "other {{misses} výpadků}}, úspěšnost {rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} few {{few}} many {{genitive_one}} "
          & "other {{genitive_other}}}: změněno {changed}, přidáno {added}, "
          & "odebráno {removed}")
     & P ("field_diff", "{field}: změněno z {before} na {after}")
     & P ("field_added", "{field}: přidáno s hodnotou {value}")
     & P ("field_removed", "{field}: odebráno (dříve {value})")
     & P ("field_unchanged", "{field}: beze změny ({value})")
     & P ("number_comparison.equal", "{current} se rovná {baseline}")
     & P ("number_comparison.higher", "{current} je o {quantity} více než {baseline}")
     & P ("number_comparison.lower", "{current} je o {quantity} méně než {baseline}")
     & P ("percent_comparison.equal", "{current} se rovná {baseline}")
     & P ("percent_comparison.higher", "{current} je o {quantity} více než {baseline}")
     & P ("percent_comparison.lower", "{current} je o {quantity} méně než {baseline}")
     & P ("file_size_comparison.same", "{current} má stejnou velikost jako {baseline}")
     & P ("file_size_comparison.larger", "{current} je o {quantity} větší než {baseline}")
     & P ("file_size_comparison.smaller", "{current} je o {quantity} menší než {baseline}")
     & P ("date_comparison.same", "{current} je stejné datum jako {baseline}")
     & P ("date_comparison.after", "{current} je o {quantity} později než {baseline}")
     & P ("date_comparison.before", "{current} je o {quantity} dříve než {baseline}")
     & P ("queue_summary", "fronta: {details}")
     & P ("queue_summary.empty", "fronta prázdná")
     & P ("domain_summary",
          "{domain, select, queue {fronta} job {úloha} run {běh} cache "
          & "{mezipaměť} sync {synchronizace} import {import} export {export} "
          & "other {{domain}}} – {state, select, queued {ve frontě} running "
          & "{běží} waiting {čeká} paused {pozastaveno} complete {dokončeno} "
          & "failed {selhalo} stale {zastaralé} skipped {přeskočeno} other "
          & "{{state}}}: {details}")
     & P ("summary.completed",
          "dokončeno: {count} {count, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("summary.completed_of",
          "dokončeno {count} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("summary.failed", "selhalo: {count}")
     & P ("summary.queued",
          "ve frontě: {count} {count, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("summary.running", "běží: {count}")
     & P ("summary.complete", "dokončeno: {count}")
     & P ("backup.backup_running", "záloha probíhá")
     & P ("backup.backup_completed", "záloha dokončena")
     & P ("backup.backup_failed", "záloha selhala")
     & P ("backup.backup_stale", "záloha zastaralá")
     & P ("incident.incident_investigating", "incident se prošetřuje")
     & P ("incident.incident_identified", "incident identifikován")
     & P ("incident.incident_mitigated", "incident zmírněn")
     & P ("incident.incident_resolved", "incident vyřešen")
     & P ("release.release_drafting", "vydání se připravuje")
     & P ("release.release_ready", "vydání připraveno")
     & P ("release.release_published", "vydání zveřejněno")
     & P ("release.release_rolled_back", "vydání vráceno zpět")
     & P ("audit.audit_created", "záznam auditu vytvořen")
     & P ("audit.audit_updated", "záznam auditu aktualizován")
     & P ("audit.audit_deleted", "záznam auditu odstraněn")
     & P ("audit.audit_restored", "záznam auditu obnoven")
     & P ("flag.flag_enabled", "příznak funkce zapnut")
     & P ("flag.flag_disabled", "příznak funkce vypnut")
     & P ("flag.flag_rolling_out", "příznak funkce se postupně zavádí")
     & P ("flag.flag_rolled_back", "příznak funkce vrácen zpět")
     & P ("webhook.webhook_pending", "webhook čeká")
     & P ("webhook.webhook_delivered", "webhook doručen")
     & P ("webhook.webhook_failed", "webhook selhal")
     & P ("webhook.webhook_retrying", "webhook: opakovaný pokus")
     & P ("api_key.api_key_active", "klíč API aktivní")
     & P ("api_key.api_key_revoked", "klíč API zrušen")
     & P ("api_key.api_key_expired", "platnost klíče API vypršela")
     & P ("api_key.api_key_rotated", "klíč API obměněn")
     & P ("quota.quota_available", "kvóta k dispozici")
     & P ("quota.quota_near_limit", "kvóta téměř vyčerpána")
     & P ("quota.quota_exceeded", "kvóta překročena")
     & P ("quota.quota_reset", "kvóta obnovena")
     & P ("invoice.invoice_draft", "koncept faktury")
     & P ("invoice.invoice_sent", "faktura odeslána")
     & P ("invoice.invoice_paid", "faktura zaplacena")
     & P ("invoice.invoice_refunded", "faktura refundována")
     & P ("invoice.invoice_overdue", "faktura po splatnosti")
     & P ("invoice.refund_failed", "refundace selhala")
     & P ("page_navigation.only", "jediná stránka")
     & P ("page_navigation.first", "první stránka, další k dispozici")
     & P ("page_navigation.last", "poslední stránka, předchozí k dispozici")
     & P ("page_navigation.middle", "předchozí i další k dispozici")
     & P ("end_of_week", "konec týdne")
     & P ("end_of_month", "konec měsíce")
     & P ("end_of_quarter", "konec čtvrtletí")
     & P ("time_of_day.night", "noc")
     & P ("time_of_day.morning", "ráno")
     & P ("time_of_day.afternoon", "odpoledne")
     & P ("time_of_day.evening", "večer")
     & P ("calendar_difference.same_day", "tentýž den")
     & P ("calendar_difference.zero", "0 dní")
     & P ("access.allowed", "povoleno")
     & P ("access.denied", "zamítnuto")
     & P ("access.owner", "vlastník")
     & P ("access.admin", "správce")
     & P ("access.viewer", "čtenář")
     & P ("access.editor", "editor")
     & P ("auth.signed_in", "přihlášeno")
     & P ("auth.signed_out", "odhlášeno")
     & P ("auth.session_expired", "relace vypršela")
     & P ("auth.locked", "uzamčeno")
     & P ("auth.two_factor_required", "vyžadováno dvoufázové ověření")
     & P ("billing.trialing", "zkušební období")
     & P ("billing.payment_due", "platba splatná")
     & P ("billing.payment_failed", "platba selhala")
     & P ("billing.paid", "zaplaceno")
     & P ("billing.past_due", "po splatnosti")
     & P ("billing.canceled", "zrušeno")
     & P ("ci.pipeline_pending", "pipeline čeká")
     & P ("ci.pipeline_running", "pipeline běží")
     & P ("ci.pipeline_passed", "pipeline úspěšná")
     & P ("ci.pipeline_failed", "pipeline selhala")
     & P ("ci.review_required", "vyžadována kontrola")
     & P ("ci.deploy_blocked", "nasazení zablokováno")
     & P ("collaboration.active_now", "aktivní teď")
     & P ("collaboration.away", "nepřítomen")
     & P ("collaboration.do_not_disturb", "nerušit")
     & P ("collaboration.typing", "píše")
     & P ("collaboration.viewing", "prohlíží")
     & P ("collaboration.editing", "upravuje")
     & P ("deployment.deploying", "nasazování")
     & P ("deployment.deployed", "nasazeno")
     & P ("deployment.rolling_back", "vracení zpět")
     & P ("deployment.rolled_back", "vráceno zpět")
     & P ("deployment.build_failed", "sestavení selhalo")
     & P ("deployment.checks_passed", "kontroly úspěšné")
     & P ("empty.no_items", "žádné položky")
     & P ("empty.no_results", "žádné výsledky")
     & P ("empty.no_messages", "žádné zprávy")
     & P ("empty.no_selection", "nic nevybráno")
     & P ("empty.nothing_to_show", "nic k zobrazení")
     & P ("file.uploading", "nahrávání")
     & P ("file.downloading", "stahování")
     & P ("file.copying", "kopírování")
     & P ("file.moving", "přesouvání")
     & P ("file.deleting", "mazání")
     & P ("file.deleted", "smazáno")
     & P ("file.restoring", "obnovování")
     & P ("file.synced", "synchronizováno")
     & P ("form.valid_input", "platný vstup")
     & P ("form.invalid_input", "neplatný vstup")
     & P ("form.dirty", "změněno")
     & P ("form.pristine", "beze změn")
     & P ("form.submitted", "odesláno")
     & P ("form.submission_failed", "odeslání selhalo")
     & P ("health.healthy", "v pořádku")
     & P ("health.degraded", "omezený provoz")
     & P ("health.unhealthy", "nefunkční")
     & P ("health.incident", "incident")
     & P ("health.maintenance", "údržba")
     & P ("health.recovering", "obnovování provozu")
     & P ("issue.open", "otevřeno")
     & P ("issue.closed", "uzavřeno")
     & P ("issue.reopened", "znovu otevřeno")
     & P ("issue.assigned", "přiřazeno")
     & P ("issue.unassigned", "nepřiřazeno")
     & P ("issue.merged", "sloučeno")
     & P ("network.offline", "offline")
     & P ("network.online", "online")
     & P ("network.connecting", "připojování")
     & P ("network.syncing", "synchronizace")
     & P ("network.sync_failed", "synchronizace selhala")
     & P ("network.permission_denied", "přístup odepřen")
     & P ("network.read_only", "jen pro čtení")
     & P ("notification.unread", "nepřečteno")
     & P ("notification.read", "přečteno")
     & P ("notification.muted", "ztlumeno")
     & P ("notification.snoozed", "odloženo")
     & P ("notification.sent", "odesláno")
     & P ("notification.delivered", "doručeno")
     & P ("payment.payment_authorized", "platba autorizována")
     & P ("payment.payment_captured", "platba stržena")
     & P ("payment.payment_refunded", "platba vrácena")
     & P ("payment.payment_disputed", "platba rozporována")
     & P ("payment.payment_requires_action", "platba vyžaduje akci")
     & P ("payment.payment_expired", "platnost platby vypršela")
     & P ("ui.empty", "prázdné")
     & P ("ui.loading", "načítání")
     & P ("ui.saving", "ukládání")
     & P ("ui.saved", "uloženo")
     & P ("ui.unsaved", "neuloženo")
     & P ("ui.retrying", "opakování")
     & P ("ui.paused", "pozastaveno")
     & P ("ui.complete", "dokončeno")
     & P ("ui.failed", "selhalo")
     & P ("ui.due_soon", "brzy splatné")
     & P ("ui.overdue", "po termínu")
     & P ("ui.last_seen", "naposledy viděn")
     & P ("ui.updated_just_now", "právě aktualizováno")
     & P ("queue.queued", "ve frontě")
     & P ("queue.running", "běží")
     & P ("queue.waiting", "čeká")
     & P ("queue.blocked", "blokováno")
     & P ("queue.canceled_job", "úloha zrušena")
     & P ("queue.completed_job", "úloha dokončena")
     & P ("search.filtering", "filtrování")
     & P ("search.filtered", "filtrováno")
     & P ("search.no_matches", "žádné shody")
     & P ("search.search_ready", "vyhledávání připraveno")
     & P ("search.search_failed", "vyhledávání selhalo")
     & P ("search.query_too_short", "dotaz je příliš krátký")
     & P ("security.secure", "zabezpečeno")
     & P ("security.insecure", "nezabezpečeno")
     & P ("security.vulnerable", "zranitelné")
     & P ("security.encrypted", "šifrováno")
     & P ("security.unencrypted", "nešifrováno")
     & P ("security.token_expired", "platnost tokenu vypršela")
     & P ("sync.sync_idle", "synchronizace nečinná")
     & P ("sync.syncing_now", "probíhá synchronizace")
     & P ("sync.sync_queued", "synchronizace ve frontě")
     & P ("sync.sync_conflict", "konflikt synchronizace")
     & P ("sync.sync_complete", "synchronizace dokončena")
     & P ("sync.sync_error", "chyba synchronizace")
     & P ("task.todo", "k provedení")
     & P ("task.in_progress", "probíhá")
     & P ("task.done", "hotovo")
     & P ("task.skipped", "přeskočeno")
     & P ("task.blocked_task", "blokováno")
     & P ("task.waiting_on", "čeká na")
     & P ("ticket.ticket_new", "nový požadavek")
     & P ("ticket.ticket_open", "požadavek otevřen")
     & P ("ticket.ticket_waiting", "požadavek čeká")
     & P ("ticket.ticket_escalated", "požadavek eskalován")
     & P ("ticket.ticket_resolved", "požadavek vyřešen")
     & P ("ticket.ticket_closed", "požadavek uzavřen")
     & P ("transfer.importing", "importování")
     & P ("transfer.imported", "importováno")
     & P ("transfer.import_failed", "import selhal")
     & P ("transfer.exporting", "exportování")
     & P ("transfer.exported", "exportováno")
     & P ("transfer.export_failed", "export selhal")
     & P ("validation.required", "povinné")
     & P ("validation.optional", "volitelné")
     & P ("validation.invalid", "neplatné")
     & P ("validation.too_short", "příliš krátké")
     & P ("validation.too_long", "příliš dlouhé")
     & P ("validation.out_of_range", "mimo rozsah")
     & P ("validation.already_exists", "již existuje")
     & P ("workflow.draft", "koncept")
     & P ("workflow.in_review", "v kontrole")
     & P ("workflow.approved", "schváleno")
     & P ("workflow.rejected", "zamítnuto")
     & P ("workflow.published", "zveřejněno")
     & P ("workflow.archived", "archivováno")
     & P ("database.database_online", "databáze online")
     & P ("database.database_offline", "databáze offline")
     & P ("database.database_degraded", "databáze v omezeném provozu")
     & P ("database.database_migrating", "migrace databáze")
     & P ("database.database_migration_failed", "migrace databáze selhala")
     & P ("database.database_replicating", "replikace databáze")
     & P ("database.database_replication_lagging", "replikace databáze se zpožďuje")
     & P ("database.database_backup_running", "probíhá záloha databáze")
     & P ("database.database_backup_failed", "záloha databáze selhala")
     & P ("date_comparison.case.after", "accusative")
     & P ("date_comparison.case.before", "accusative")
     & P ("count",
          "{count, plural, one {# {one}} few {# {few}} many {# {genitive_one}} "
          & "other {# {genitive_other}}}")
     & P ("noun",
          "{count, plural, one {{one}} few {{few}} many {{genitive_one}} other "
          & "{{genitive_other}}}")
     & P ("collection.empty", "{other}: 0")
     & P ("summary.none", "{other}: 0")
     & P ("noun.accusative",
          "{count, plural, one {{accusative_one}} few {{accusative_other}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("number_comparison.case", "accusative")
     & P ("times_noun",
          "{count, plural, =0 {nikdy {other}} =1 {jednou {one}} =2 {dvakrát "
          & "{other}} other {{count}krát {other}}}")
     & P ("availability.all",
          "dostupné: {available} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("availability.none", "žádné dostupné {other}")
     & P ("availability.partial",
          "dostupné: {available} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other "
          & "{{genitive_other}}}, nedostupné: {unavailable}")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "ve frontě")
     & P ("operation.running", "běží")
     & P ("operation.blocked", "blokováno")
     & P ("operation.retrying", "opakování")
     & P ("operation.succeeded", "úspěšně dokončeno")
     & P ("operation.partially_succeeded", "částečně úspěšné")
     & P ("operation.failed", "selhalo")
     & P ("operation.canceled", "zrušeno")
     & P ("operation.skipped", "přeskočeno")
     & P ("operation.stale", "zastaralé")
     & P ("operation.unknown_state", "neznámé")
     & P ("operation.last_success", "{name}: naposledy úspěšně {time}")
     & P ("operation.next_retry", "{name}: další pokus {time}")
     & P ("operation.stale_run", "{name} – zastaralé: {time}")
     & P ("summary.skipped", "přeskočeno: {count}")
     & P ("summary.retried", "opakováno: {count}")
     & P ("summary.canceled", "zrušeno: {count}")
     & P ("system.service.operational", "v provozu")
     & P ("system.service.degraded", "snížený výkon")
     & P ("system.service.partial_outage", "částečný výpadek")
     & P ("system.service.major_outage", "závažný výpadek")
     & P ("system.service.maintenance", "probíhá údržba")
     & P ("system.service.unknown", "neznámý stav služby")
     & P ("system.health.healthy", "v pořádku")
     & P ("system.health.warning", "varování")
     & P ("system.health.critical", "kritický stav")
     & P ("system.health.unavailable", "nedostupné")
     & P ("system.health.unknown_health", "neznámý zdravotní stav")
     & P ("system.readiness.ready", "připraveno")
     & P ("system.readiness.not_ready", "nepřipraveno")
     & P ("system.readiness.starting", "spouštění")
     & P ("system.readiness.draining", "vyprazdňování")
     & P ("system.readiness.stopped", "zastaveno")
     & P ("system.readiness.unknown_readiness", "neznámá připravenost")
     & P ("system.component.online", "online")
     & P ("system.component.offline", "offline")
     & P ("system.component.starting", "spouštění")
     & P ("system.component.stopping", "zastavování")
     & P ("system.component.restarting", "restartování")
     & P ("system.component.unknown", "neznámý stav komponenty")
     & P ("system.check.passing", "úspěšná")
     & P ("system.check.failing", "neúspěšná")
     & P ("system.check.warning", "varování")
     & P ("system.check.skipped", "přeskočená")
     & P ("system.check.timed_out", "vypršel časový limit")
     & P ("system.check.unknown", "neznámý stav kontroly")
     & P ("system.incident.investigating", "šetření")
     & P ("system.incident.identified", "identifikováno")
     & P ("system.incident.monitoring", "monitorování")
     & P ("system.incident.resolved", "vyřešeno")
     & P ("system.incident.scheduled_maintenance", "plánovaná údržba")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "kontrola {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {žádné komponenty} one {{count} komponenta} few "
          & "{{count} komponenty} many {{count} komponenty} other {{count} "
          & "komponent}}")
     & P ("system.count.checks",
          "{count, plural, =0 {žádné kontroly} one {{count} kontrola} few "
          & "{{count} kontroly} many {{count} kontroly} other {{count} kontrol}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {žádné incidenty} one {{count} incident} few "
          & "{{count} incidenty} many {{count} incidentu} other {{count} "
          & "incidentů}}")
     & P ("system.uptime", "dostupnost {measure}")
     & P ("system.latency", "latence {measure}")
     & P ("system.maintenance_window", "okno údržby {time}")
     & P ("system.last_checked", "poslední kontrola {time}")
     & P ("system.http.informational", "informační")
     & P ("system.http.successful", "úspěch")
     & P ("system.http.redirection", "přesměrování")
     & P ("system.http.client_error", "chyba klienta")
     & P ("system.http.server_error", "chyba serveru")
     & P ("system.exit.success", "návratový kód {code}: úspěch")
     & P ("system.exit.failure", "návratový kód {code}: selhání")
     & P ("system.exit.usage_error", "návratový kód {code}: chybné použití")
     & P ("system.exit.not_executable", "návratový kód {code}: příkaz nelze spustit")
     & P ("system.exit.not_found", "návratový kód {code}: příkaz nenalezen")
     & P ("system.exit.invalid_argument", "návratový kód {code}: neplatný argument příkazu exit")
     & P ("system.exit.signal", "návratový kód {code}: ukončeno signálem {signal}");
end Locale_Cs;
