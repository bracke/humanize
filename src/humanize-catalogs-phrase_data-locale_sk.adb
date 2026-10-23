separate (Humanize.Catalogs.Phrase_Data)
function Locale_Sk return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("sk", Name, Template));
begin
   return
     P ("all_count",
          "spolu {total} {total, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("filtered_count.none", "{other}: žiadne zhody")
     & P ("filtered_count.all",
          "zhoda pri všetkých: {total} {total, plural, one {{one}} few {{few}} "
          & "many {{genitive_one}} other {{genitive_other}}}")
     & P ("filtered_count.some",
          "{matching, plural, one {vyhovuje} few {vyhovujú} many {vyhovuje} "
          & "other {vyhovuje}} {matching} z {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
          & "{{genitive_other}}}")
     & P ("more_count", "zobrazené: {visible}, +{remaining} ďalších")
     & P ("others_count", "{first} a ešte {remaining}")
     & P ("page_count", "strana {page} z {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{few}} many {{genitive_one}} "
          & "other {{genitive_other}}} na stranu")
     & P ("pagination_range",
          "{first}–{last} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("position_count", "{position} z {total}")
     & P ("selection_count",
          "vybrané: {selected} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("showing_count",
          "zobrazené: {showing} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {žiadne chyby} warning "
          & "{žiadne varovania} other {žiadne oznámenia}}} one {1 {severity, "
          & "select, error {chyba} warning {varovanie} other {oznámenie}}} few "
          & "{{count} {severity, select, error {chyby} warning {varovania} other "
          & "{oznámenia}}} many {{count} {severity, select, error {chyby} warning "
          & "{varovania} other {oznámenia}}} other {{count} {severity, select, "
          & "error {chýb} warning {varovaní} other {oznámení}}}}")
     & P ("collection.empty", "{other}: žiadne")
     & P ("collection.none_shown", "{other}: nič sa nezobrazuje")
     & P ("collection.showing_hidden",
          "zobrazené: {visible} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other "
          & "{{genitive_other}}}, skryté: {hidden}")
     & P ("collection.showing",
          "zobrazené: {visible} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("collection.shown_hidden",
          "zobrazené: {visible} {visible, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}, skryté: {hidden}")
     & P ("collection.shown",
          "zobrazené: {visible} {visible, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("collection.visible_out_of",
          "viditeľné: {visible} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("complete_count", "dokončené: {done} z {total}")
     & P ("percent_complete", "dokončené: {percent} %")
     & P ("step_count", "krok {step} z {total}")
     & P ("attempt_count", "pokus {attempt} z {total}")
     & P ("throughput_remaining", "zostáva: {remaining} ({unit}), {rate} {unit}/s")
     & P ("accessible_progress",
          "dokončené: {done} z {total}, {percent, plural, one {{percent} "
          & "percento} few {{percent} percentá} many {{percent} percenta} other "
          & "{{percent} percent}}")
     & P ("business_days",
          "{days, plural, one {{days} pracovný deň} few {{days} pracovné dni} "
          & "many {{days} pracovného dňa} other {{days} pracovných dní}}")
     & P ("working_hours",
          "{hours, plural, one {{hours} pracovná hodina} few {{hours} pracovné "
          & "hodiny} many {{hours} pracovnej hodiny} other {{hours} pracovných "
          & "hodín}}")
     & P ("due.overdue",
          "po termíne o {days, plural, one {{days} deň} few {{days} dni} many "
          & "{{days} dňa} other {{days} dní}}")
     & P ("due.today", "termín dnes")
     & P ("due.tomorrow", "termín zajtra")
     & P ("due.in",
          "termín o {days, plural, one {{days} deň} few {{days} dni} many "
          & "{{days} dňa} other {{days} dní}}")
     & P ("calendar_difference.future", "o {difference}")
     & P ("calendar_difference.past", "pred {difference}")
     & P ("calendar_difference.case.future", "accusative")
     & P ("calendar_difference.case.past", "instrumental")
     & P ("cpu_load", "zaťaženie CPU {measure}")
     & P ("battery", "batéria {measure}")
     & P ("screen_size", "obrazovka {measure}")
     & P ("refresh_rate", "obnovovacia frekvencia {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value, plural, one {{value} percento} few {{value} percentá} many "
          & "{{value} percenta} other {{value} percent}}")
     & P ("recurrence.second",
          "{every, plural, =1 {každú sekundu} one {každú {every} sekundu} few "
          & "{každé {every} sekundy} many {každých {every} sekundy} other "
          & "{každých {every} sekúnd}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {každú minútu} one {každú {every} minútu} few "
          & "{každé {every} minúty} many {každých {every} minúty} other "
          & "{každých {every} minút}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {každú hodinu} one {každú {every} hodinu} few "
          & "{každé {every} hodiny} many {každých {every} hodiny} other "
          & "{každých {every} hodín}}")
     & P ("recurrence.day",
          "{every, plural, =1 {každý deň} one {každý {every} deň} few "
          & "{každé {every} dni} many {každých {every} dňa} other {každých "
          & "{every} dní}}")
     & P ("recurrence.week",
          "{every, plural, =1 {každý týždeň} one {každý {every} týždeň} "
          & "few {každé {every} týždne} many {každých {every} týždňa} "
          & "other {každých {every} týždňov}}")
     & P ("recurrence.month",
          "{every, plural, =1 {každý mesiac} one {každý {every} mesiac} few "
          & "{každé {every} mesiace} many {každých {every} mesiaca} other "
          & "{každých {every} mesiacov}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {každý štvrťrok} one {každý {every} "
          & "štvrťrok} few {každé {every} štvrťroky} many {každých {every} "
          & "štvrťroka} other {každých {every} štvrťrokov}}")
     & P ("recurrence.year",
          "{every, plural, =1 {každý rok} one {každý {every} rok} few "
          & "{každé {every} roky} many {každých {every} roka} other {každých "
          & "{every} rokov}}")
     & P ("cache_summary.empty", "vyrovnávacia pamäť: žiadne požiadavky")
     & P ("cache_summary",
          "vyrovnávacia pamäť: {hits, plural, one {{hits} zásah} few {{hits} "
          & "zásahy} many {{hits} zásahu} other {{hits} zásahov}}, {misses, "
          & "plural, one {{misses} výpadok} few {{misses} výpadky} many {{misses} "
          & "výpadku} other {{misses} výpadkov}}, úspešnosť {rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} few {{few}} many {{genitive_one}} "
          & "other {{genitive_other}}}: zmenené: {changed}, pridané: {added}, "
          & "odstránené: {removed}")
     & P ("field_diff", "{field}: zmenené z {before} na {after}")
     & P ("field_added", "{field}: pridané s hodnotou {value}")
     & P ("field_removed", "{field}: odstránené (predtým {value})")
     & P ("field_unchanged", "{field}: bez zmeny ({value})")
     & P ("number_comparison.equal", "{current} sa rovná {baseline}")
     & P ("number_comparison.higher", "{current} je o {quantity} viac ako {baseline}")
     & P ("number_comparison.lower", "{current} je o {quantity} menej ako {baseline}")
     & P ("percent_comparison.equal", "{current} sa rovná {baseline}")
     & P ("percent_comparison.higher", "{current} je o {quantity} viac ako {baseline}")
     & P ("percent_comparison.lower", "{current} je o {quantity} menej ako {baseline}")
     & P ("file_size_comparison.same", "{current} má rovnakú veľkosť ako {baseline}")
     & P ("file_size_comparison.larger", "{current} má o {quantity} väčšiu veľkosť ako {baseline}")
     & P ("file_size_comparison.smaller", "{current} má o {quantity} menšiu veľkosť ako {baseline}")
     & P ("date_comparison.same", "{current} je rovnaký dátum ako {baseline}")
     & P ("date_comparison.after", "{current} je o {quantity} neskôr ako {baseline}")
     & P ("date_comparison.before", "{current} je o {quantity} skôr ako {baseline}")
     & P ("queue_summary", "front: {details}")
     & P ("queue_summary.empty", "front prázdny")
     & P ("domain_summary",
          "{domain, select, queue {front} job {úloha} run {beh} cache "
          & "{vyrovnávacia pamäť} sync {synchronizácia} import {import} export "
          & "{export} other {{domain}}} – {state, select, queued {vo fronte} "
          & "running {beží} waiting {čaká} paused {pozastavené} complete "
          & "{dokončené} failed {zlyhalo} stale {zastarané} skipped "
          & "{preskočené} other {{state}}}: {details}")
     & P ("summary.none", "{other}: žiadne")
     & P ("summary.completed",
          "dokončené: {count} {count, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("summary.completed_of",
          "dokončené: {count} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_one}} other {{genitive_other}}}")
     & P ("summary.failed", "zlyhalo: {count}")
     & P ("summary.queued",
          "vo fronte: {count} {count, plural, one {{one}} few {{few}} many "
          & "{{genitive_one}} other {{genitive_other}}}")
     & P ("summary.running", "beží: {count}")
     & P ("summary.complete", "dokončené: {count}")
     & P ("backup.backup_running", "záloha prebieha")
     & P ("backup.backup_completed", "záloha dokončená")
     & P ("backup.backup_failed", "záloha zlyhala")
     & P ("backup.backup_stale", "záloha zastaraná")
     & P ("incident.incident_investigating", "incident sa prešetruje")
     & P ("incident.incident_identified", "incident identifikovaný")
     & P ("incident.incident_mitigated", "incident zmiernený")
     & P ("incident.incident_resolved", "incident vyriešený")
     & P ("release.release_drafting", "vydanie sa pripravuje")
     & P ("release.release_ready", "vydanie pripravené")
     & P ("release.release_published", "vydanie zverejnené")
     & P ("release.release_rolled_back", "vydanie vrátené späť")
     & P ("audit.audit_created", "záznam auditu vytvorený")
     & P ("audit.audit_updated", "záznam auditu aktualizovaný")
     & P ("audit.audit_deleted", "záznam auditu odstránený")
     & P ("audit.audit_restored", "záznam auditu obnovený")
     & P ("flag.flag_enabled", "príznak funkcie zapnutý")
     & P ("flag.flag_disabled", "príznak funkcie vypnutý")
     & P ("flag.flag_rolling_out", "príznak funkcie sa postupne zavádza")
     & P ("flag.flag_rolled_back", "príznak funkcie vrátený späť")
     & P ("webhook.webhook_pending", "webhook čaká")
     & P ("webhook.webhook_delivered", "webhook doručený")
     & P ("webhook.webhook_failed", "webhook zlyhal")
     & P ("webhook.webhook_retrying", "webhook: opakovaný pokus")
     & P ("api_key.api_key_active", "kľúč API aktívny")
     & P ("api_key.api_key_revoked", "kľúč API zrušený")
     & P ("api_key.api_key_expired", "platnosť kľúča API vypršala")
     & P ("api_key.api_key_rotated", "kľúč API obmenený")
     & P ("quota.quota_available", "kvóta k dispozícii")
     & P ("quota.quota_near_limit", "kvóta takmer vyčerpaná")
     & P ("quota.quota_exceeded", "kvóta prekročená")
     & P ("quota.quota_reset", "kvóta obnovená")
     & P ("invoice.invoice_draft", "koncept faktúry")
     & P ("invoice.invoice_sent", "faktúra odoslaná")
     & P ("invoice.invoice_paid", "faktúra zaplatená")
     & P ("invoice.invoice_refunded", "faktúra refundovaná")
     & P ("invoice.invoice_overdue", "faktúra po splatnosti")
     & P ("invoice.refund_failed", "refundácia zlyhala")
     & P ("page_navigation.only", "jediná strana")
     & P ("page_navigation.first", "prvá strana, ďalšia k dispozícii")
     & P ("page_navigation.last", "posledná strana, predchádzajúca k dispozícii")
     & P ("page_navigation.middle", "predchádzajúca aj ďalšia k dispozícii")
     & P ("end_of_week", "koniec týždňa")
     & P ("end_of_month", "koniec mesiaca")
     & P ("end_of_quarter", "koniec štvrťroka")
     & P ("time_of_day.night", "noc")
     & P ("time_of_day.morning", "ráno")
     & P ("time_of_day.afternoon", "popoludnie")
     & P ("time_of_day.evening", "večer")
     & P ("calendar_difference.same_day", "v ten istý deň")
     & P ("calendar_difference.zero", "0 dní")
     & P ("access.allowed", "povolené")
     & P ("access.denied", "zamietnuté")
     & P ("access.owner", "vlastník")
     & P ("access.admin", "správca")
     & P ("access.viewer", "čitateľ")
     & P ("access.editor", "editor")
     & P ("auth.signed_in", "prihlásené")
     & P ("auth.signed_out", "odhlásené")
     & P ("auth.session_expired", "relácia vypršala")
     & P ("auth.locked", "uzamknuté")
     & P ("auth.two_factor_required", "vyžaduje sa dvojstupňové overenie")
     & P ("billing.trialing", "skúšobné obdobie")
     & P ("billing.payment_due", "platba splatná")
     & P ("billing.payment_failed", "platba zlyhala")
     & P ("billing.paid", "zaplatené")
     & P ("billing.past_due", "po splatnosti")
     & P ("billing.canceled", "zrušené")
     & P ("ci.pipeline_pending", "pipeline čaká")
     & P ("ci.pipeline_running", "pipeline beží")
     & P ("ci.pipeline_passed", "pipeline úspešná")
     & P ("ci.pipeline_failed", "pipeline zlyhala")
     & P ("ci.review_required", "vyžaduje sa kontrola")
     & P ("ci.deploy_blocked", "nasadenie zablokované")
     & P ("collaboration.active_now", "aktívny teraz")
     & P ("collaboration.away", "neprítomný")
     & P ("collaboration.do_not_disturb", "nerušiť")
     & P ("collaboration.typing", "píše")
     & P ("collaboration.viewing", "prezerá")
     & P ("collaboration.editing", "upravuje")
     & P ("deployment.deploying", "nasadzovanie")
     & P ("deployment.deployed", "nasadené")
     & P ("deployment.rolling_back", "vracanie späť")
     & P ("deployment.rolled_back", "vrátené späť")
     & P ("deployment.build_failed", "zostavenie zlyhalo")
     & P ("deployment.checks_passed", "kontroly úspešné")
     & P ("empty.no_items", "žiadne položky")
     & P ("empty.no_results", "žiadne výsledky")
     & P ("empty.no_messages", "žiadne správy")
     & P ("empty.no_selection", "nič nie je vybrané")
     & P ("empty.nothing_to_show", "nič na zobrazenie")
     & P ("file.uploading", "nahrávanie")
     & P ("file.downloading", "sťahovanie")
     & P ("file.copying", "kopírovanie")
     & P ("file.moving", "presúvanie")
     & P ("file.deleting", "odstraňovanie")
     & P ("file.deleted", "odstránené")
     & P ("file.restoring", "obnovovanie")
     & P ("file.synced", "synchronizované")
     & P ("form.valid_input", "platný vstup")
     & P ("form.invalid_input", "neplatný vstup")
     & P ("form.dirty", "zmenené")
     & P ("form.pristine", "bez zmien")
     & P ("form.submitted", "odoslané")
     & P ("form.submission_failed", "odoslanie zlyhalo")
     & P ("health.healthy", "v poriadku")
     & P ("health.degraded", "obmedzená prevádzka")
     & P ("health.unhealthy", "nefunkčné")
     & P ("health.incident", "incident")
     & P ("health.maintenance", "údržba")
     & P ("health.recovering", "obnovovanie prevádzky")
     & P ("issue.open", "otvorené")
     & P ("issue.closed", "zatvorené")
     & P ("issue.reopened", "znova otvorené")
     & P ("issue.assigned", "priradené")
     & P ("issue.unassigned", "nepriradené")
     & P ("issue.merged", "zlúčené")
     & P ("network.offline", "offline")
     & P ("network.online", "online")
     & P ("network.connecting", "pripájanie")
     & P ("network.syncing", "synchronizácia")
     & P ("network.sync_failed", "synchronizácia zlyhala")
     & P ("network.permission_denied", "prístup zamietnutý")
     & P ("network.read_only", "iba na čítanie")
     & P ("notification.unread", "neprečítané")
     & P ("notification.read", "prečítané")
     & P ("notification.muted", "stlmené")
     & P ("notification.snoozed", "odložené")
     & P ("notification.sent", "odoslané")
     & P ("notification.delivered", "doručené")
     & P ("payment.payment_authorized", "platba autorizovaná")
     & P ("payment.payment_captured", "platba stiahnutá")
     & P ("payment.payment_refunded", "platba vrátená")
     & P ("payment.payment_disputed", "platba reklamovaná")
     & P ("payment.payment_requires_action", "platba vyžaduje akciu")
     & P ("payment.payment_expired", "platnosť platby vypršala")
     & P ("ui.empty", "prázdne")
     & P ("ui.loading", "načítava sa")
     & P ("ui.saving", "ukladá sa")
     & P ("ui.saved", "uložené")
     & P ("ui.unsaved", "neuložené")
     & P ("ui.retrying", "opakuje sa")
     & P ("ui.paused", "pozastavené")
     & P ("ui.complete", "dokončené")
     & P ("ui.failed", "zlyhalo")
     & P ("ui.due_soon", "čoskoro splatné")
     & P ("ui.overdue", "po termíne")
     & P ("ui.last_seen", "naposledy videný")
     & P ("ui.updated_just_now", "práve aktualizované")
     & P ("queue.queued", "vo fronte")
     & P ("queue.running", "beží")
     & P ("queue.waiting", "čaká")
     & P ("queue.blocked", "blokované")
     & P ("queue.canceled_job", "úloha zrušená")
     & P ("queue.completed_job", "úloha dokončená")
     & P ("search.filtering", "filtrovanie")
     & P ("search.filtered", "filtrované")
     & P ("search.no_matches", "žiadne zhody")
     & P ("search.search_ready", "vyhľadávanie pripravené")
     & P ("search.search_failed", "vyhľadávanie zlyhalo")
     & P ("search.query_too_short", "dopyt je príliš krátky")
     & P ("security.secure", "zabezpečené")
     & P ("security.insecure", "nezabezpečené")
     & P ("security.vulnerable", "zraniteľné")
     & P ("security.encrypted", "šifrované")
     & P ("security.unencrypted", "nešifrované")
     & P ("security.token_expired", "platnosť tokenu vypršala")
     & P ("sync.sync_idle", "synchronizácia nečinná")
     & P ("sync.syncing_now", "prebieha synchronizácia")
     & P ("sync.sync_queued", "synchronizácia vo fronte")
     & P ("sync.sync_conflict", "konflikt synchronizácie")
     & P ("sync.sync_complete", "synchronizácia dokončená")
     & P ("sync.sync_error", "chyba synchronizácie")
     & P ("task.todo", "na vykonanie")
     & P ("task.in_progress", "prebieha")
     & P ("task.done", "hotovo")
     & P ("task.skipped", "preskočené")
     & P ("task.blocked_task", "blokované")
     & P ("task.waiting_on", "čaká na")
     & P ("ticket.ticket_new", "nová požiadavka")
     & P ("ticket.ticket_open", "požiadavka otvorená")
     & P ("ticket.ticket_waiting", "požiadavka čaká")
     & P ("ticket.ticket_escalated", "požiadavka eskalovaná")
     & P ("ticket.ticket_resolved", "požiadavka vyriešená")
     & P ("ticket.ticket_closed", "požiadavka uzavretá")
     & P ("transfer.importing", "importovanie")
     & P ("transfer.imported", "importované")
     & P ("transfer.import_failed", "import zlyhal")
     & P ("transfer.exporting", "exportovanie")
     & P ("transfer.exported", "exportované")
     & P ("transfer.export_failed", "export zlyhal")
     & P ("validation.required", "povinné")
     & P ("validation.optional", "voliteľné")
     & P ("validation.invalid", "neplatné")
     & P ("validation.too_short", "príliš krátke")
     & P ("validation.too_long", "príliš dlhé")
     & P ("validation.out_of_range", "mimo rozsahu")
     & P ("validation.already_exists", "už existuje")
     & P ("workflow.draft", "koncept")
     & P ("workflow.in_review", "v kontrole")
     & P ("workflow.approved", "schválené")
     & P ("workflow.rejected", "zamietnuté")
     & P ("workflow.published", "zverejnené")
     & P ("workflow.archived", "archivované")
     & P ("database.database_online", "databáza online")
     & P ("database.database_offline", "databáza offline")
     & P ("database.database_degraded", "databáza v obmedzenej prevádzke")
     & P ("database.database_migrating", "migrácia databázy")
     & P ("database.database_migration_failed", "migrácia databázy zlyhala")
     & P ("database.database_replicating", "replikácia databázy")
     & P ("database.database_replication_lagging", "replikácia databázy mešká")
     & P ("database.database_backup_running", "prebieha záloha databázy")
     & P ("database.database_backup_failed", "záloha databázy zlyhala")
     & P ("date_comparison.case.after", "accusative")
     & P ("date_comparison.case.before", "accusative")
     & P ("count",
          "{count, plural, one {# {one}} few {# {few}} many {# {genitive_one}} "
          & "other {# {genitive_other}}}")
     & P ("noun",
          "{count, plural, one {{one}} few {{few}} many {{genitive_one}} other "
          & "{{genitive_other}}}");
end Locale_Sk;
