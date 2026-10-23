separate (Humanize.Catalogs.Phrase_Data)
function Locale_Sk return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("sk", Name, Template));
begin
   return
     P ("all_count",
          "spolu {total} {total, plural, one {{one}} few {{other}} many {{other}} "
          & "other {{other}}}")
     & P ("filtered_count.none", "{other}: žiadne zhody")
     & P ("filtered_count.all",
          "zhoda pri všetkých: {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("filtered_count.some",
          "vyhovuje: {matching} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("more_count", "zobrazené: {visible}, +{remaining} ďalších")
     & P ("others_count", "{first} a ešte {remaining}")
     & P ("page_count", "strana {page} z {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}} na stranu")
     & P ("pagination_range",
          "{first}–{last} z {total} {total, plural, one {{one}} few {{other}} "
          & "many {{other}} other {{other}}}")
     & P ("position_count", "{position} z {total}")
     & P ("selection_count",
          "vybrané: {selected} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("showing_count",
          "zobrazené: {showing} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
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
          "zobrazené: {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}, skryté: {hidden}")
     & P ("collection.showing",
          "zobrazené: {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("collection.shown_hidden",
          "zobrazené: {visible} {visible, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}, skryté: {hidden}")
     & P ("collection.shown",
          "zobrazené: {visible} {visible, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("collection.visible_out_of",
          "viditeľné: {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
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
     & P ("calendar_difference.past", "{difference} dozadu")
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
          "{total} {total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: zmenené: {changed}, pridané: {added}, odstránené: "
          & "{removed}")
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
          "dokončené: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("summary.completed_of",
          "dokončené: {count} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("summary.failed", "zlyhalo: {count}")
     & P ("summary.queued",
          "vo fronte: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
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
     & P ("feature_flag.flag_enabled", "príznak funkcie zapnutý")
     & P ("feature_flag.flag_disabled", "príznak funkcie vypnutý")
     & P ("feature_flag.flag_rolling_out", "príznak funkcie sa postupne zavádza")
     & P ("feature_flag.flag_rolled_back", "príznak funkcie vrátený späť")
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
     & P ("calendar_difference.zero", "0 dní");
end Locale_Sk;
