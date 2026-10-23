separate (Humanize.Catalogs.Phrase_Data)
function Locale_Cs return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("cs", Name, Template));
begin
   return
     P ("all_count",
          "celkem {total} {total, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("filtered_count.none", "{other}: žádné shody")
     & P ("filtered_count.all",
          "shoda u všech: {total} {total, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("filtered_count.some",
          "vyhovuje: {matching} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("more_count", "zobrazeno {visible}, +{remaining} dalších")
     & P ("others_count",
          "{first} a {remaining, plural, one {{remaining} další} few "
          & "{{remaining} další} many {{remaining} dalšího} other {{remaining} "
          & "dalších}}")
     & P ("page_count", "strana {page} z {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}} na stránku")
     & P ("pagination_range",
          "{first}–{last} z {total} {total, plural, one {{one}} few {{other}} "
          & "many {{other}} other {{other}}}")
     & P ("position_count", "{position} z {total}")
     & P ("selection_count",
          "vybráno: {selected} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("showing_count",
          "zobrazeno {showing} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {žádné chyby} warning "
          & "{žádná varování} other {žádná upozornění}}} one {1 "
          & "{severity, select, error {chyba} warning {varování} other "
          & "{upozornění}}} few {{count} {severity, select, error {chyby} warning "
          & "{varování} other {upozornění}}} many {{count} {severity, select, "
          & "error {chyby} warning {varování} other {upozornění}}} other "
          & "{{count} {severity, select, error {chyb} warning {varování} other "
          & "{upozornění}}}}")
     & P ("collection.empty", "{other}: žádné")
     & P ("collection.none_shown", "{other}: nic nezobrazeno")
     & P ("collection.showing_hidden",
          "zobrazeno {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}, skryto {hidden}")
     & P ("collection.showing",
          "zobrazeno {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("collection.shown_hidden",
          "zobrazeno {visible} {visible, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}, skryto {hidden}")
     & P ("collection.shown",
          "zobrazeno {visible} {visible, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("collection.visible_out_of",
          "viditelné: {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
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
     & P ("calendar_difference.past", "{difference} zpět")
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
          "{total} {total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: změněno {changed}, přidáno {added}, odebráno "
          & "{removed}")
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
     & P ("summary.none", "{other}: žádné")
     & P ("summary.completed",
          "dokončeno: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("summary.completed_of",
          "dokončeno: {count} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("summary.failed", "selhalo: {count}")
     & P ("summary.queued",
          "ve frontě: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
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
     & P ("feature_flag.flag_enabled", "příznak funkce zapnut")
     & P ("feature_flag.flag_disabled", "příznak funkce vypnut")
     & P ("feature_flag.flag_rolling_out", "příznak funkce se postupně zavádí")
     & P ("feature_flag.flag_rolled_back", "příznak funkce vrácen zpět")
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
     & P ("calendar_difference.zero", "0 dní");
end Locale_Cs;
