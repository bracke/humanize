separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Sk (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "sk", Name, Template);
   end P;
begin
   P ("all_count",
      "spolu {total} {total, plural, one {{one}} few {{few}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("filtered_count.none",
      "{gender, select, masculine {žiadne {other} nevyhovujú} feminine "
      & "{žiadne {other} nevyhovujú} neuter {žiadne {other} nevyhovujú} "
      & "masculine_animate {žiadni {other} nevyhovujú} other {{other}: "
      & "žiadne zhody}}");
   P ("filtered_count.some",
      "{matching, plural, one {vyhovuje} few {vyhovujú} many {vyhovuje} "
      & "other {vyhovuje}} {matching} z {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_one}} other "
      & "{{genitive_other}}}");
   P ("more_count", "zobrazené: {visible}, +{remaining} ďalších");
   P ("others_count", "{first} a ešte {remaining}");
   P ("page_count", "strana {page} z {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} few {{few}} many {{genitive_one}} "
      & "other {{genitive_other}}} na stranu");
   P ("pagination_range",
      "{first}–{last} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}");
   P ("position_count", "{position} z {total}");
   P ("selection_count",
      "{gender, select, masculine_animate {vybraní: {selected} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}} other {vybrané: "
      & "{selected} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("showing_count",
      "{gender, select, masculine_animate {zobrazení: {showing} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}} other {zobrazené: "
      & "{showing} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("validation_count",
      "{count, plural, =0 {{severity, select, error {žiadne chyby} warning "
      & "{žiadne varovania} other {žiadne oznámenia}}} one {1 {severity, "
      & "select, error {chyba} warning {varovanie} other {oznámenie}}} few "
      & "{{count} {severity, select, error {chyby} warning {varovania} other "
      & "{oznámenia}}} many {{count} {severity, select, error {chyby} warning "
      & "{varovania} other {oznámenia}}} other {{count} {severity, select, "
      & "error {chýb} warning {varovaní} other {oznámení}}}}");
   P ("collection.none_shown",
      "{gender, select, masculine {nezobrazujú sa žiadne {other}} feminine "
      & "{nezobrazujú sa žiadne {other}} neuter {nezobrazujú sa žiadne "
      & "{other}} masculine_animate {nezobrazujú sa žiadni {other}} other "
      & "{{other}: nič sa nezobrazuje}}");
   P ("collection.showing_hidden",
      "{gender, select, masculine_animate {zobrazení: {visible} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}, skrytí: {hidden}} other "
      & "{zobrazené: {visible} z {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_one}} other "
      & "{{genitive_other}}}, skryté: {hidden}}}");
   P ("collection.showing",
      "{gender, select, masculine_animate {zobrazení: {visible} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}} other {zobrazené: "
      & "{visible} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("collection.shown_hidden",
      "{gender, select, masculine_animate {zobrazení: {visible} {visible, "
      & "plural, one {{one}} few {{few}} many {{genitive_one}} other "
      & "{{genitive_other}}}, skrytí: {hidden}} other {zobrazené: {visible} "
      & "{visible, plural, one {{one}} few {{few}} many {{genitive_one}} other "
      & "{{genitive_other}}}, skryté: {hidden}}}");
   P ("collection.shown",
      "{gender, select, masculine_animate {zobrazení: {visible} {visible, "
      & "plural, one {{one}} few {{few}} many {{genitive_one}} other "
      & "{{genitive_other}}}} other {zobrazené: {visible} {visible, plural, "
      & "one {{one}} few {{few}} many {{genitive_one}} other "
      & "{{genitive_other}}}}}");
   P ("collection.visible_out_of",
      "{gender, select, masculine_animate {viditeľní: {visible} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}} other {viditeľné: "
      & "{visible} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("complete_count", "dokončené: {done} z {total}");
   P ("percent_complete", "dokončené: {percent} %");
   P ("step_count", "krok {step} z {total}");
   P ("attempt_count", "pokus {attempt} z {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {zostáva} few {zostávajú} many {zostáva} "
      & "other {zostáva}} {remaining} {remaining, plural, one {{one}} few "
      & "{{few}} many {{genitive_one}} other {{genitive_other}}}, {rate} "
      & "{unit}/s");
   P ("accessible_progress",
      "dokončené: {done} z {total}, {percent, plural, one {{percent} "
      & "percento} few {{percent} percentá} many {{percent} percenta} other "
      & "{{percent} percent}}");
   P ("business_days",
      "{days, plural, one {{days} pracovný deň} few {{days} pracovné dni} "
      & "many {{days} pracovného dňa} other {{days} pracovných dní}}");
   P ("working_hours",
      "{hours, plural, one {{hours} pracovná hodina} few {{hours} pracovné "
      & "hodiny} many {{hours} pracovnej hodiny} other {{hours} pracovných "
      & "hodín}}");
   P ("due.overdue",
      "po termíne o {days, plural, one {{days} deň} few {{days} dni} many "
      & "{{days} dňa} other {{days} dní}}");
   P ("due.today", "termín dnes");
   P ("due.tomorrow", "termín zajtra");
   P ("due.in",
      "termín o {days, plural, one {{days} deň} few {{days} dni} many "
      & "{{days} dňa} other {{days} dní}}");
   P ("calendar_difference.future", "o {difference}");
   P ("calendar_difference.past", "pred {difference}");
   P ("calendar_difference.case.future", "accusative");
   P ("calendar_difference.case.past", "instrumental");
   P ("cpu_load", "zaťaženie CPU {measure}");
   P ("battery", "batéria {measure}");
   P ("screen_size", "obrazovka {measure}");
   P ("refresh_rate", "obnovovacia frekvencia {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word",
      "{value, plural, one {{value} percento} few {{value} percentá} many "
      & "{{value} percenta} other {{value} percent}}");
   P ("recurrence.second",
      "{every, plural, =1 {každú sekundu} one {každú {every} sekundu} few "
      & "{každé {every} sekundy} many {každých {every} sekundy} other "
      & "{každých {every} sekúnd}}");
   P ("recurrence.minute",
      "{every, plural, =1 {každú minútu} one {každú {every} minútu} few "
      & "{každé {every} minúty} many {každých {every} minúty} other "
      & "{každých {every} minút}}");
   P ("recurrence.hour",
      "{every, plural, =1 {každú hodinu} one {každú {every} hodinu} few "
      & "{každé {every} hodiny} many {každých {every} hodiny} other "
      & "{každých {every} hodín}}");
   P ("recurrence.day",
      "{every, plural, =1 {každý deň} one {každý {every} deň} few "
      & "{každé {every} dni} many {každých {every} dňa} other {každých "
      & "{every} dní}}");
   P ("recurrence.week",
      "{every, plural, =1 {každý týždeň} one {každý {every} týždeň} "
      & "few {každé {every} týždne} many {každých {every} týždňa} "
      & "other {každých {every} týždňov}}");
   P ("recurrence.month",
      "{every, plural, =1 {každý mesiac} one {každý {every} mesiac} few "
      & "{každé {every} mesiace} many {každých {every} mesiaca} other "
      & "{každých {every} mesiacov}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {každý štvrťrok} one {každý {every} "
      & "štvrťrok} few {každé {every} štvrťroky} many {každých {every} "
      & "štvrťroka} other {každých {every} štvrťrokov}}");
   P ("recurrence.year",
      "{every, plural, =1 {každý rok} one {každý {every} rok} few "
      & "{každé {every} roky} many {každých {every} roka} other {každých "
      & "{every} rokov}}");
   P ("cache_summary.empty", "vyrovnávacia pamäť: žiadne požiadavky");
   P ("cache_summary",
      "vyrovnávacia pamäť: {hits, plural, one {{hits} zásah} few {{hits} "
      & "zásahy} many {{hits} zásahu} other {{hits} zásahov}}, {misses, "
      & "plural, one {{misses} výpadok} few {{misses} výpadky} many {{misses} "
      & "výpadku} other {{misses} výpadkov}}, úspešnosť {rate} %");
   P ("field_change_summary",
      "{gender, select, masculine_animate {{total} {total, plural, one "
      & "{{one}} few {{few}} many {{genitive_one}} other {{genitive_other}}}: "
      & "zmenení: {changed}, pridaní: {added}, odstránení: {removed}} other "
      & "{{total} {total, plural, one {{one}} few {{few}} many {{genitive_one}} "
      & "other {{genitive_other}}}: zmenené: {changed}, pridané: {added}, "
      & "odstránené: {removed}}}");
   P ("field_diff", "{field}: zmenené z {before} na {after}");
   P ("field_added", "{field}: pridané s hodnotou {value}");
   P ("field_removed", "{field}: odstránené (predtým {value})");
   P ("field_unchanged", "{field}: bez zmeny ({value})");
   P ("number_comparison.equal", "{current} sa rovná {baseline}");
   P ("number_comparison.higher", "{current} je o {quantity} viac ako {baseline}");
   P ("number_comparison.lower", "{current} je o {quantity} menej ako {baseline}");
   P ("percent_comparison.equal", "{current} sa rovná {baseline}");
   P ("percent_comparison.higher", "{current} je o {quantity} viac ako {baseline}");
   P ("percent_comparison.lower", "{current} je o {quantity} menej ako {baseline}");
   P ("file_size_comparison.same", "{current} má rovnakú veľkosť ako {baseline}");
   P ("file_size_comparison.larger", "{current} má o {quantity} väčšiu veľkosť ako {baseline}");
   P ("file_size_comparison.smaller", "{current} má o {quantity} menšiu veľkosť ako {baseline}");
   P ("date_comparison.same", "{current} je rovnaký dátum ako {baseline}");
   P ("date_comparison.after", "{current} je o {quantity} neskôr ako {baseline}");
   P ("date_comparison.before", "{current} je o {quantity} skôr ako {baseline}");
   P ("queue_summary", "front: {details}");
   P ("queue_summary.empty", "front prázdny");
   P ("domain_summary",
      "{domain, select, queue {front} job {úloha} run {beh} cache "
      & "{vyrovnávacia pamäť} sync {synchronizácia} import {import} export "
      & "{export} other {{domain}}} – {state, select, queued {vo fronte} "
      & "running {beží} waiting {čaká} paused {pozastavené} complete "
      & "{dokončené} failed {zlyhalo} stale {zastarané} skipped "
      & "{preskočené} other {{state}}}: {details}");
   P ("summary.completed",
      "{gender, select, masculine_animate {dokončení: {count} {count, "
      & "plural, one {{one}} few {{few}} many {{genitive_one}} other "
      & "{{genitive_other}}}} other {dokončené: {count} {count, plural, one "
      & "{{one}} few {{few}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("summary.completed_of",
      "{gender, select, masculine_animate {dokončení: {count} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}} other {dokončené: "
      & "{count} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("summary.failed", "zlyhalo: {count}");
   P ("summary.queued",
      "vo fronte: {count} {count, plural, one {{one}} few {{few}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("summary.running", "beží: {count}");
   P ("summary.complete", "dokončené: {count}");
   P ("backup.backup_running", "záloha prebieha");
   P ("backup.backup_completed", "záloha dokončená");
   P ("backup.backup_failed", "záloha zlyhala");
   P ("backup.backup_stale", "záloha zastaraná");
   P ("incident.incident_investigating", "incident sa prešetruje");
   P ("incident.incident_identified", "incident identifikovaný");
   P ("incident.incident_mitigated", "incident zmiernený");
   P ("incident.incident_resolved", "incident vyriešený");
   P ("release.release_drafting", "vydanie sa pripravuje");
   P ("release.release_ready", "vydanie pripravené");
   P ("release.release_published", "vydanie zverejnené");
   P ("release.release_rolled_back", "vydanie vrátené späť");
   P ("audit.audit_created", "záznam auditu vytvorený");
   P ("audit.audit_updated", "záznam auditu aktualizovaný");
   P ("audit.audit_deleted", "záznam auditu odstránený");
   P ("audit.audit_restored", "záznam auditu obnovený");
   P ("flag.flag_enabled", "príznak funkcie zapnutý");
   P ("flag.flag_disabled", "príznak funkcie vypnutý");
   P ("flag.flag_rolling_out", "príznak funkcie sa postupne zavádza");
   P ("flag.flag_rolled_back", "príznak funkcie vrátený späť");
   P ("webhook.webhook_pending", "webhook čaká");
   P ("webhook.webhook_delivered", "webhook doručený");
   P ("webhook.webhook_failed", "webhook zlyhal");
   P ("webhook.webhook_retrying", "webhook: opakovaný pokus");
   P ("api_key.api_key_active", "kľúč API aktívny");
   P ("api_key.api_key_revoked", "kľúč API zrušený");
   P ("api_key.api_key_expired", "platnosť kľúča API vypršala");
   P ("api_key.api_key_rotated", "kľúč API obmenený");
   P ("quota.quota_available", "kvóta k dispozícii");
   P ("quota.quota_near_limit", "kvóta takmer vyčerpaná");
   P ("quota.quota_exceeded", "kvóta prekročená");
   P ("quota.quota_reset", "kvóta obnovená");
   P ("invoice.invoice_draft", "koncept faktúry");
   P ("invoice.invoice_sent", "faktúra odoslaná");
   P ("invoice.invoice_paid", "faktúra zaplatená");
   P ("invoice.invoice_refunded", "faktúra refundovaná");
   P ("invoice.invoice_overdue", "faktúra po splatnosti");
   P ("invoice.refund_failed", "refundácia zlyhala");
   P ("page_navigation.only", "jediná strana");
   P ("page_navigation.first", "prvá strana, ďalšia k dispozícii");
   P ("page_navigation.last", "posledná strana, predchádzajúca k dispozícii");
   P ("page_navigation.middle", "predchádzajúca aj ďalšia k dispozícii");
   P ("end_of_week", "koniec týždňa");
   P ("end_of_month", "koniec mesiaca");
   P ("end_of_quarter", "koniec štvrťroka");
   P ("time_of_day.night", "noc");
   P ("time_of_day.morning", "ráno");
   P ("time_of_day.afternoon", "popoludnie");
   P ("time_of_day.evening", "večer");
   P ("calendar_difference.same_day", "v ten istý deň");
   P ("calendar_difference.zero", "0 dní");
   P ("access.allowed", "povolené");
   P ("access.denied", "zamietnuté");
   P ("access.owner", "vlastník");
   P ("access.admin", "správca");
   P ("access.viewer", "čitateľ");
   P ("access.editor", "editor");
   P ("auth.signed_in", "prihlásené");
   P ("auth.signed_out", "odhlásené");
   P ("auth.session_expired", "relácia vypršala");
   P ("auth.locked", "uzamknuté");
   P ("auth.two_factor_required", "vyžaduje sa dvojstupňové overenie");
   P ("billing.trialing", "skúšobné obdobie");
   P ("billing.payment_due", "platba splatná");
   P ("billing.payment_failed", "platba zlyhala");
   P ("billing.paid", "zaplatené");
   P ("billing.past_due", "po splatnosti");
   P ("billing.canceled", "zrušené");
   P ("ci.pipeline_pending", "pipeline čaká");
   P ("ci.pipeline_running", "pipeline beží");
   P ("ci.pipeline_passed", "pipeline úspešná");
   P ("ci.pipeline_failed", "pipeline zlyhala");
   P ("ci.review_required", "vyžaduje sa kontrola");
   P ("ci.deploy_blocked", "nasadenie zablokované");
   P ("collaboration.active_now", "aktívny teraz");
   P ("collaboration.away", "neprítomný");
   P ("collaboration.do_not_disturb", "nerušiť");
   P ("collaboration.typing", "píše");
   P ("collaboration.viewing", "prezerá");
   P ("collaboration.editing", "upravuje");
   P ("deployment.deploying", "nasadzovanie");
   P ("deployment.deployed", "nasadené");
   P ("deployment.rolling_back", "vracanie späť");
   P ("deployment.rolled_back", "vrátené späť");
   P ("deployment.build_failed", "zostavenie zlyhalo");
   P ("deployment.checks_passed", "kontroly úspešné");
   P ("empty.no_items", "žiadne položky");
   P ("empty.no_results", "žiadne výsledky");
   P ("empty.no_messages", "žiadne správy");
   P ("empty.no_selection", "nič nie je vybrané");
   P ("empty.nothing_to_show", "nič na zobrazenie");
   P ("file.uploading", "nahrávanie");
   P ("file.downloading", "sťahovanie");
   P ("file.copying", "kopírovanie");
   P ("file.moving", "presúvanie");
   P ("file.deleting", "odstraňovanie");
   P ("file.deleted", "odstránené");
   P ("file.restoring", "obnovovanie");
   P ("file.synced", "synchronizované");
   P ("form.valid_input", "platný vstup");
   P ("form.invalid_input", "neplatný vstup");
   P ("form.dirty", "zmenené");
   P ("form.pristine", "bez zmien");
   P ("form.submitted", "odoslané");
   P ("form.submission_failed", "odoslanie zlyhalo");
   P ("health.healthy", "v poriadku");
   P ("health.degraded", "obmedzená prevádzka");
   P ("health.unhealthy", "nefunkčné");
   P ("health.incident", "incident");
   P ("health.maintenance", "údržba");
   P ("health.recovering", "obnovovanie prevádzky");
   P ("issue.open", "otvorené");
   P ("issue.closed", "zatvorené");
   P ("issue.reopened", "znova otvorené");
   P ("issue.assigned", "priradené");
   P ("issue.unassigned", "nepriradené");
   P ("issue.merged", "zlúčené");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "pripájanie");
   P ("network.syncing", "synchronizácia");
   P ("network.sync_failed", "synchronizácia zlyhala");
   P ("network.permission_denied", "prístup zamietnutý");
   P ("network.read_only", "iba na čítanie");
   P ("notification.unread", "neprečítané");
   P ("notification.read", "prečítané");
   P ("notification.muted", "stlmené");
   P ("notification.snoozed", "odložené");
   P ("notification.sent", "odoslané");
   P ("notification.delivered", "doručené");
   P ("payment.payment_authorized", "platba autorizovaná");
   P ("payment.payment_captured", "platba stiahnutá");
   P ("payment.payment_refunded", "platba vrátená");
   P ("payment.payment_disputed", "platba reklamovaná");
   P ("payment.payment_requires_action", "platba vyžaduje akciu");
   P ("payment.payment_expired", "platnosť platby vypršala");
   P ("ui.empty", "prázdne");
   P ("ui.loading", "načítava sa");
   P ("ui.saving", "ukladá sa");
   P ("ui.saved", "uložené");
   P ("ui.unsaved", "neuložené");
   P ("ui.retrying", "opakuje sa");
   P ("ui.paused", "pozastavené");
   P ("ui.complete", "dokončené");
   P ("ui.failed", "zlyhalo");
   P ("ui.due_soon", "čoskoro splatné");
   P ("ui.overdue", "po termíne");
   P ("ui.last_seen", "naposledy videný");
   P ("ui.updated_just_now", "práve aktualizované");
   P ("queue.queued", "vo fronte");
   P ("queue.running", "beží");
   P ("queue.waiting", "čaká");
   P ("queue.blocked", "blokované");
   P ("queue.canceled_job", "úloha zrušená");
   P ("queue.completed_job", "úloha dokončená");
   P ("search.filtering", "filtrovanie");
   P ("search.filtered", "filtrované");
   P ("search.no_matches", "žiadne zhody");
   P ("search.search_ready", "vyhľadávanie pripravené");
   P ("search.search_failed", "vyhľadávanie zlyhalo");
   P ("search.query_too_short", "dopyt je príliš krátky");
   P ("security.secure", "zabezpečené");
   P ("security.insecure", "nezabezpečené");
   P ("security.vulnerable", "zraniteľné");
   P ("security.encrypted", "šifrované");
   P ("security.unencrypted", "nešifrované");
   P ("security.token_expired", "platnosť tokenu vypršala");
   P ("sync.sync_idle", "synchronizácia nečinná");
   P ("sync.syncing_now", "prebieha synchronizácia");
   P ("sync.sync_queued", "synchronizácia vo fronte");
   P ("sync.sync_conflict", "konflikt synchronizácie");
   P ("sync.sync_complete", "synchronizácia dokončená");
   P ("sync.sync_error", "chyba synchronizácie");
   P ("task.todo", "na vykonanie");
   P ("task.in_progress", "prebieha");
   P ("task.done", "hotovo");
   P ("task.skipped", "preskočené");
   P ("task.blocked_task", "blokované");
   P ("task.waiting_on", "čaká na");
   P ("ticket.ticket_new", "nová požiadavka");
   P ("ticket.ticket_open", "požiadavka otvorená");
   P ("ticket.ticket_waiting", "požiadavka čaká");
   P ("ticket.ticket_escalated", "požiadavka eskalovaná");
   P ("ticket.ticket_resolved", "požiadavka vyriešená");
   P ("ticket.ticket_closed", "požiadavka uzavretá");
   P ("transfer.importing", "importovanie");
   P ("transfer.imported", "importované");
   P ("transfer.import_failed", "import zlyhal");
   P ("transfer.exporting", "exportovanie");
   P ("transfer.exported", "exportované");
   P ("transfer.export_failed", "export zlyhal");
   P ("validation.required", "povinné");
   P ("validation.optional", "voliteľné");
   P ("validation.invalid", "neplatné");
   P ("validation.too_short", "príliš krátke");
   P ("validation.too_long", "príliš dlhé");
   P ("validation.out_of_range", "mimo rozsahu");
   P ("validation.already_exists", "už existuje");
   P ("workflow.draft", "koncept");
   P ("workflow.in_review", "v kontrole");
   P ("workflow.approved", "schválené");
   P ("workflow.rejected", "zamietnuté");
   P ("workflow.published", "zverejnené");
   P ("workflow.archived", "archivované");
   P ("database.database_online", "databáza online");
   P ("database.database_offline", "databáza offline");
   P ("database.database_degraded", "databáza v obmedzenej prevádzke");
   P ("database.database_migrating", "migrácia databázy");
   P ("database.database_migration_failed", "migrácia databázy zlyhala");
   P ("database.database_replicating", "replikácia databázy");
   P ("database.database_replication_lagging", "replikácia databázy mešká");
   P ("database.database_backup_running", "prebieha záloha databázy");
   P ("database.database_backup_failed", "záloha databázy zlyhala");
   P ("date_comparison.case.after", "accusative");
   P ("date_comparison.case.before", "accusative");
   P ("count",
      "{count, plural, one {# {one}} few {# {few}} many {# {genitive_one}} "
      & "other {# {genitive_other}}}");
   P ("noun",
      "{count, plural, one {{one}} few {{few}} many {{genitive_one}} other "
      & "{{genitive_other}}}");
   P ("collection.empty",
      "{gender, select, masculine {žiadne {other}} feminine {žiadne "
      & "{other}} neuter {žiadne {other}} masculine_animate {žiadni {other}} "
      & "other {{other}: 0}}");
   P ("summary.none",
      "{gender, select, masculine {žiadne {other}} feminine {žiadne "
      & "{other}} neuter {žiadne {other}} masculine_animate {žiadni {other}} "
      & "other {{other}: 0}}");
   P ("filtered_count.all",
      "{total, plural, one {zhoda pri {total} {locative_one}} few {zhoda pri "
      & "všetkých {total} {locative_other}} many {zhoda pri všetkých "
      & "{total} {genitive_one}} other {zhoda pri všetkých {total} "
      & "{locative_other}}}");
   P ("noun.accusative",
      "{count, plural, one {{accusative_one}} few {{accusative_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}");
   P ("number_comparison.case", "accusative");
   P ("times_noun",
      "{count, plural, =0 {nikdy {other}} =1 {raz {one}} =2 {dvakrát "
      & "{other}} other {{count}-krát {other}}}");
   P ("availability.all",
      "{gender, select, masculine_animate {dostupní: {available} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}} other {dostupné: "
      & "{available} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_one}} other {{genitive_other}}}}}");
   P ("availability.none",
      "{gender, select, masculine_animate {žiadni dostupní {other}} other "
      & "{žiadne dostupné {other}}}");
   P ("availability.partial",
      "{gender, select, masculine_animate {dostupní: {available} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_one}} other {{genitive_other}}}, nedostupní: "
      & "{unavailable}} other {dostupné: {available} z {total} {total, plural, "
      & "one {{genitive_one}} few {{genitive_other}} many {{genitive_one}} "
      & "other {{genitive_other}}}, nedostupné: {unavailable}}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "vo fronte");
   P ("operation.running", "beží");
   P ("operation.blocked", "blokované");
   P ("operation.retrying", "opakuje sa");
   P ("operation.succeeded", "úspešne dokončené");
   P ("operation.partially_succeeded", "čiastočne úspešné");
   P ("operation.failed", "zlyhalo");
   P ("operation.canceled", "zrušené");
   P ("operation.skipped", "preskočené");
   P ("operation.stale", "zastarané");
   P ("operation.unknown_state", "neznáme");
   P ("operation.last_success", "{name}: naposledy úspešne {time}");
   P ("operation.next_retry", "{name}: ďalší pokus {time}");
   P ("operation.stale_run", "{name} – zastarané: {time}");
   P ("summary.skipped", "preskočené: {count}");
   P ("summary.retried", "opakované: {count}");
   P ("summary.canceled", "zrušené: {count}");
   P ("system.service.operational", "v prevádzke");
   P ("system.service.degraded", "znížený výkon");
   P ("system.service.partial_outage", "čiastočný výpadok");
   P ("system.service.major_outage", "závažný výpadok");
   P ("system.service.maintenance", "prebieha údržba");
   P ("system.service.unknown", "neznámy stav služby");
   P ("system.health.healthy", "v poriadku");
   P ("system.health.warning", "varovanie");
   P ("system.health.critical", "kritický stav");
   P ("system.health.unavailable", "nedostupné");
   P ("system.health.unknown_health", "neznámy zdravotný stav");
   P ("system.readiness.ready", "pripravené");
   P ("system.readiness.not_ready", "nepripravené");
   P ("system.readiness.starting", "spúšťanie");
   P ("system.readiness.draining", "vyprázdňovanie");
   P ("system.readiness.stopped", "zastavené");
   P ("system.readiness.unknown_readiness", "neznáma pripravenosť");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "spúšťanie");
   P ("system.component.stopping", "zastavovanie");
   P ("system.component.restarting", "reštartovanie");
   P ("system.component.unknown", "neznámy stav komponentu");
   P ("system.check.passing", "úspešná");
   P ("system.check.failing", "neúspešná");
   P ("system.check.warning", "varovanie");
   P ("system.check.skipped", "preskočená");
   P ("system.check.timed_out", "vypršal časový limit");
   P ("system.check.unknown", "neznámy stav kontroly");
   P ("system.incident.investigating", "prešetrovanie");
   P ("system.incident.identified", "identifikované");
   P ("system.incident.monitoring", "monitorovanie");
   P ("system.incident.resolved", "vyriešené");
   P ("system.incident.scheduled_maintenance", "plánovaná údržba");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "kontrola {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {žiadne komponenty} one {{count} komponent} few "
      & "{{count} komponenty} many {{count} komponentu} other {{count} "
      & "komponentov}}");
   P ("system.count.checks",
      "{count, plural, =0 {žiadne kontroly} one {{count} kontrola} few "
      & "{{count} kontroly} many {{count} kontroly} other {{count} kontrol}}");
   P ("system.count.incidents",
      "{count, plural, =0 {žiadne incidenty} one {{count} incident} few "
      & "{{count} incidenty} many {{count} incidentu} other {{count} "
      & "incidentov}}");
   P ("system.uptime", "dostupnosť {measure}");
   P ("system.latency", "latencia {measure}");
   P ("system.maintenance_window", "okno údržby {time}");
   P ("system.last_checked", "posledná kontrola {time}");
   P ("system.http.informational", "informačné");
   P ("system.http.successful", "úspech");
   P ("system.http.redirection", "presmerovanie");
   P ("system.http.client_error", "chyba klienta");
   P ("system.http.server_error", "chyba servera");
   P ("system.exit.success", "návratový kód {code}: úspech");
   P ("system.exit.failure", "návratový kód {code}: zlyhanie");
   P ("system.exit.usage_error", "návratový kód {code}: nesprávne použitie");
   P ("system.exit.not_executable", "návratový kód {code}: príkaz nemožno spustiť");
   P ("system.exit.not_found", "návratový kód {code}: príkaz sa nenašiel");
   P ("system.exit.invalid_argument", "návratový kód {code}: neplatný argument príkazu exit");
   P ("system.exit.signal", "návratový kód {code}: ukončené signálom {signal}");
   P ("validation.problem.required", "{field}: povinný údaj");
   P ("validation.problem.minimum", "{field}: hodnota je pod minimom");
   P ("validation.problem.maximum", "{field}: hodnota je nad maximom");
   P ("validation.problem.range", "{field}: hodnota je mimo rozsahu");
   P ("validation.problem.pattern", "{field}: hodnota nezodpovedá vzoru");
   P ("validation.problem.choice", "{field}: hodnota musí byť jednou z povolených možností");
   P ("validation.problem.dependency", "{field}: závisí od iného poľa");
   P ("validation.problem.custom", "{field}: neplatná hodnota");
   P ("validation.constraint.no_relation", "{field}: neplatná hodnota, očakáva sa: {value}");
   P ("validation.constraint.less_than", "{field}: hodnota musí byť menšia ako {value}");
   P ("validation.constraint.less_or_equal", "{field}: hodnota môže byť najviac {value}");
   P ("validation.constraint.greater_than", "{field}: hodnota musí byť väčšia ako {value}");
   P ("validation.constraint.greater_or_equal", "{field}: hodnota musí byť aspoň {value}");
   P ("validation.constraint.equal_to", "{field}: hodnota sa musí rovnať {value}");
   P ("validation.constraint.not_equal_to", "{field}: hodnota sa nesmie rovnať {value}");
   P ("validation.constraint.before_field", "{field}: hodnota musí byť skoršia ako {value}");
   P ("validation.constraint.after_field", "{field}: hodnota musí byť neskoršia ako {value}");
   P ("validation.choices", "{field}: povolené hodnoty: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, zadané {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, nový pokus o {time}");
   P ("net_diagnostic.dns", "{endpoint}: vyhľadávanie DNS zlyhalo");
   P ("net_diagnostic.tcp", "{endpoint}: pripojenie TCP zlyhalo");
   P ("net_diagnostic.tls", "{endpoint}: chyba certifikátu TLS");
   P ("net_diagnostic.http", "{endpoint}: požiadavka HTTP zlyhala");
   P ("net_diagnostic.proxy", "{endpoint}: chyba proxy");
   P ("net_diagnostic.timeout", "{endpoint}: vypršal časový limit");
   P ("net_diagnostic.reset", "{endpoint}: spojenie bolo resetované");
   P ("net_diagnostic.unknown_network", "{endpoint}: chyba siete");
   P ("progress.state.not_started", "nezačaté");
   P ("progress.state.running", "prebieha");
   P ("progress.state.stalled", "zaseknuté");
   P ("progress.state.retrying", "opakuje sa");
   P ("progress.state.complete", "dokončené");
   P ("progress.state.failed", "zlyhalo");
   P ("progress.of", "{subject}: dokončené {done} z {total} ({percent} %), {state}");
   P ("progress.done", "{subject}: dokončené {done}, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {položka} few {položky} many "
      & "{položky} other {položiek}}, {unique} {unique, plural, one "
      & "{jedinečná hodnota} few {jedinečné hodnoty} many {jedinečnej "
      & "hodnoty} other {jedinečných hodnôt}}, {duplicates} {duplicates, "
      & "plural, one {duplikát} few {duplikáty} many {duplikátu} other "
      & "{duplikátov}}, {outliers} {outliers, plural, one {odľahlá hodnota} "
      & "few {odľahlé hodnoty} many {odľahlej hodnoty} other {odľahlých "
      & "hodnôt}}");
   P ("top_frequency",
      "{name}: {value} ({count} {count, plural, one {výskyt} few {výskyty} "
      & "many {výskytu} other {výskytov}})");
   P ("calendar_date.fiscal_year", "FR {year}");
   P ("calendar_date.fiscal_quarter", "FR {year} Q{part}");
   P ("calendar_date.fiscal_half", "FR {year} {part}. polr.");
   P ("calendar_date.fiscal_year_end", "koniec FR {year}");
   P ("calendar_date.semester", "{part}. sem. {year}");
   P ("calendar_date.half_year", "{part}. polr. {year}");
   P ("calendar_date.half_year_phrase", "{part, plural, =1 {prvý polrok {year}} other {druhý polrok {year}}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} (začiatok)} mid {{text} (polovica)} "
      & "other {{text} (koniec)}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text} (začiatok)} mid {{text} (polovica)} "
      & "other {{text} (koniec)}}");
   P ("calendar_range.weekend.last", "minulý víkend");
   P ("calendar_range.weekend.this", "tento víkend");
   P ("calendar_range.weekend.next", "budúci víkend");
   P ("calendar_range.weekend_of", "víkend {date}");
   P ("calendar_range.week.last", "minulý týždeň");
   P ("calendar_range.week.this", "tento týždeň");
   P ("calendar_range.week.next", "budúci týždeň");
   P ("calendar_range.week_of", "týždeň od {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "pokračovať");
   P ("http.reason.101", "prepínanie protokolov");
   P ("http.reason.102", "spracováva sa");
   P ("http.reason.103", "predbežné pokyny");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "vytvorené");
   P ("http.reason.202", "prijaté");
   P ("http.reason.203", "neautoritatívne informácie");
   P ("http.reason.204", "žiadny obsah");
   P ("http.reason.205", "obnoviť obsah");
   P ("http.reason.206", "čiastočný obsah");
   P ("http.reason.207", "viacero stavov");
   P ("http.reason.208", "už nahlásené");
   P ("http.reason.226", "použité IM");
   P ("http.reason.300", "viacero možností");
   P ("http.reason.301", "natrvalo presunuté");
   P ("http.reason.302", "nájdené");
   P ("http.reason.303", "pozrite iné");
   P ("http.reason.304", "nezmenené");
   P ("http.reason.305", "použiť proxy");
   P ("http.reason.307", "dočasné presmerovanie");
   P ("http.reason.308", "trvalé presmerovanie");
   P ("http.reason.400", "chybná požiadavka");
   P ("http.reason.401", "neautorizované");
   P ("http.reason.402", "vyžaduje sa platba");
   P ("http.reason.403", "zakázané");
   P ("http.reason.404", "nenájdené");
   P ("http.reason.405", "nepovolená metóda");
   P ("http.reason.406", "neprijateľné");
   P ("http.reason.407", "vyžaduje sa overenie na proxy");
   P ("http.reason.408", "vypršal časový limit požiadavky");
   P ("http.reason.409", "konflikt");
   P ("http.reason.410", "už neexistuje");
   P ("http.reason.411", "vyžaduje sa dĺžka");
   P ("http.reason.412", "nesplnená podmienka");
   P ("http.reason.413", "obsah je príliš veľký");
   P ("http.reason.414", "URI je príliš dlhé");
   P ("http.reason.415", "nepodporovaný typ média");
   P ("http.reason.416", "rozsah nemožno uspokojiť");
   P ("http.reason.417", "očakávanie zlyhalo");
   P ("http.reason.418", "som čajník");
   P ("http.reason.421", "nesprávne nasmerovaná požiadavka");
   P ("http.reason.422", "nespracovateľný obsah");
   P ("http.reason.423", "uzamknuté");
   P ("http.reason.424", "zlyhaná závislosť");
   P ("http.reason.425", "príliš skoro");
   P ("http.reason.426", "vyžaduje sa upgrade");
   P ("http.reason.428", "vyžaduje sa podmienka");
   P ("http.reason.429", "príliš veľa požiadaviek");
   P ("http.reason.431", "polia hlavičky požiadavky sú príliš veľké");
   P ("http.reason.451", "nedostupné z právnych dôvodov");
   P ("http.reason.500", "interná chyba servera");
   P ("http.reason.501", "neimplementované");
   P ("http.reason.502", "chybná brána");
   P ("http.reason.503", "služba nedostupná");
   P ("http.reason.504", "vypršal časový limit brány");
   P ("http.reason.505", "verzia HTTP nie je podporovaná");
   P ("http.reason.506", "varianta tiež vyjednáva");
   P ("http.reason.507", "nedostatok úložiska");
   P ("http.reason.508", "zistená slučka");
   P ("http.reason.510", "nerozšírené");
   P ("http.reason.511", "vyžaduje sa sieťové overenie");
   P ("errno.reason.0", "úspech");
   P ("errno.reason.1", "operácia nie je povolená");
   P ("errno.reason.2", "adresár alebo súbor neexistuje");
   P ("errno.reason.3", "tento proces neexistuje");
   P ("errno.reason.4", "prerušené volanie systému");
   P ("errno.reason.5", "chyba vstupu/výstupu");
   P ("errno.reason.6", "také zariadenie alebo adresa neexistuje");
   P ("errno.reason.9", "chybný deskriptor súboru");
   P ("errno.reason.11", "zdroj je dočasne neprístupný");
   P ("errno.reason.12", "nie je možné prideliť pamäť");
   P ("errno.reason.13", "prístup odmietnutý");
   P ("errno.reason.17", "súbor existuje");
   P ("errno.reason.20", "nie je adresár");
   P ("errno.reason.21", "je adresár");
   P ("errno.reason.22", "neprípustný argument");
   P ("errno.reason.24", "priveľa otvorených súborov");
   P ("errno.reason.28", "na zariadení už nie je žiadne miesto");
   P ("errno.reason.32", "prerušená rúra");
   P ("errno.reason.98", "adresa je používaná");
   P ("errno.reason.110", "časový limit pre spojenie vypršal");
   P ("errno.reason.111", "spojenie odmietnuté");
   P ("signal.reason.1", "zavesenie");
   P ("signal.reason.2", "prerušenie");
   P ("signal.reason.3", "koniec");
   P ("signal.reason.4", "neprípustná inštrukcia");
   P ("signal.reason.5", "trasovacie/ladiace prerušenie");
   P ("signal.reason.6", "zrušené");
   P ("signal.reason.7", "chyba na zbernici");
   P ("signal.reason.8", "výnimka pohyblivej rádovej čiarky");
   P ("signal.reason.9", "zabitý");
   P ("signal.reason.10", "používateľom definovaný signál 1");
   P ("signal.reason.11", "chyba segmentácie");
   P ("signal.reason.12", "používateľom definovaný signál 2");
   P ("signal.reason.13", "prerušená rúra");
   P ("signal.reason.14", "budík");
   P ("signal.reason.15", "ukončené");
   P ("signal.reason.17", "detský proces skončil");
   P ("signal.reason.18", "pokračovanie");
   P ("signal.reason.19", "zastavené (signál)");
   P ("signal.reason.20", "zastavené");
   P ("signal.reason.28", "okno sa zmenilo");
   P ("sqlstate.reason.00", "úspešné dokončenie");
   P ("sqlstate.reason.01", "upozornenie");
   P ("sqlstate.reason.02", "žiadne údaje");
   P ("sqlstate.reason.08", "výnimka pripojenia");
   P ("sqlstate.reason.0a", "funkcia nie je podporovaná");
   P ("sqlstate.reason.22", "výnimka údajov");
   P ("sqlstate.reason.23", "porušenie obmedzenia integrity");
   P ("sqlstate.reason.24", "neplatný stav kurzora");
   P ("sqlstate.reason.25", "neplatný stav transakcie");
   P ("sqlstate.reason.28", "neplatná špecifikácia autorizácie");
   P ("sqlstate.reason.2d", "neplatné ukončenie transakcie");
   P ("sqlstate.reason.3d", "neplatný názov katalógu");
   P ("sqlstate.reason.3f", "neplatný názov schémy");
   P ("sqlstate.reason.40", "vrátenie transakcie");
   P ("sqlstate.reason.42", "syntaktická chyba alebo porušenie pravidla prístupu");
   P ("sqlstate.reason.53", "nedostatok prostriedkov");
   P ("sqlstate.reason.54", "prekročený limit programu");
   P ("sqlstate.reason.55", "objekt nie je v požadovanom stave");
   P ("sqlstate.reason.57", "zásah operátora");
   P ("sqlstate.reason.58", "systémová chyba");
   P ("sqlstate.reason.hv", "chyba obálky cudzích údajov");
   P ("sqlstate.reason.p0", "chyba PL/pgSQL");
   P ("sqlstate.reason.xx", "interná chyba");
   P ("system.signal_numbered", "signál {number} {name} {reason}");
   P ("http.reason.unknown", "neznámy stav");
   P ("errno.reason.unknown", "neznáma chyba");
   P ("signal.reason.unknown", "neznámy signál");
   P ("sqlstate.reason.unknown", "neznáma trieda SQLSTATE");
   P ("diff.changed", "rozdiel {path}: zmenené z {before} na {after}");
   P ("diff.added", "rozdiel {path}: pridané {after}");
   P ("diff.removed", "rozdiel {path}: odstránené {before}");
   P ("diff.unchanged", "rozdiel {path}: bez zmeny");
   P ("diff.redacted", "rozdiel {path}: zmenené; hodnoty skryté");
   P ("validation.result",
      "výsledok overenia: {fields} {fields, plural, one {pole} few {polia} "
      & "many {poľa} other {polí}}, {errors} {errors, plural, one {chyba} few "
      & "{chyby} many {chyby} other {chýb}}, {warnings} {warnings, plural, one "
      & "{upozornenie} few {upozornenia} many {upozornenia} other "
      & "{upozornení}}, {required} {required, plural, one {povinné pole} few "
      & "{povinné polia} many {povinného poľa} other {povinných polí}}, "
      & "{hidden} {hidden, plural, one {skrytý problém} few {skryté "
      & "problémy} many {skrytého problému} other {skrytých problémov}}");
   P ("file.kind.plain", "súbor");
   P ("file.kind.directory", "adresár");
   P ("file.kind.archive", "archív");
   P ("file.kind.compressed", "komprimovaný súbor");
   P ("file.kind.image", "obrázok");
   P ("file.kind.script", "skript");
   P ("file.kind.executable", "spustiteľný súbor");
   P ("file.kind.unknown", "neznámy súbor");
   P ("file.metadata", "súbor {name}: {kind}");
   P ("file.checksum", "{text}, kontrolný súčet {checksum}");
   P ("file.signature_match", "podpis súboru {name}: {kind}, zodpovedá prípone");
   P ("file.signature_mismatch",
      "podpis súboru {name}: podľa prípony {expected}, podľa obsahu "
      & "{actual}");
   P ("network_event.connecting", "pripájanie");
   P ("network_event.connected", "pripojené");
   P ("network_event.redirected", "presmerované");
   P ("network_event.retrying", "opakovanie");
   P ("network_event.rate_limited", "obmedzenie frekvencie");
   P ("network_event.tls_failed", "zlyhanie TLS");
   P ("network_event.stalled", "bez postupu");
   P ("network_event.complete", "dokončené");
   P ("network_event.failed", "zlyhanie");
   P ("network.session", "sieť {endpoint}: {state}");
   P ("diff_node.field", "pole");
   P ("diff_node.object", "objekt");
   P ("diff_node.list", "zoznam");
   P ("diff.node",
      "uzol rozdielu {path}: {kind}, {count} {count, plural, one {zmena} few "
      & "{zmeny} many {zmeny} other {zmien}}");
   P ("checksum.not_checked", "kontrolný súčet neoverený");
   P ("checksum.valid", "kontrolný súčet platný");
   P ("checksum.mismatch", "kontrolný súčet nesúhlasí");
   P ("checksum.missing", "kontrolný súčet chýba");
   P ("product_code", "kód produktu {kind}: {value}, {state}");
   P ("time_zone.utc", "časové pásmo: UTC");
   P ("time_zone.offset", "časové pásmo: {offset}");
   P ("time_zone.named", "časové pásmo: {name} ({offset})");
   P ("time_zone.local", "časové pásmo: miestny čas");
   P ("time_zone.unknown", "časové pásmo: neznáme pásmo");
   P ("time_zone.dst", "{text}, používa letný čas");
   P ("zoned_time.plain", "čas v pásme: {time} {offset}");
   P ("zoned_time.named", "čas v pásme: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, nejednoznačný miestny čas");
end Locale_Sk;
