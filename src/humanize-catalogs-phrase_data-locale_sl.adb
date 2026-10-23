separate (Humanize.Catalogs.Phrase_Data)
function Locale_Sl return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("sl", Name, Template));
begin
   return
     P ("all_count",
          "skupaj {total} {total, plural, one {{one}} two {{other}} few {{other}} "
          & "other {{other}}}")
     & P ("filtered_count.none", "{other}: ni ujemanj")
     & P ("filtered_count.all",
          "ujemanje pri vseh: {total} {total, plural, one {{one}} two {{other}} "
          & "few {{other}} other {{other}}}")
     & P ("filtered_count.some",
          "ujema se: {matching} od {total} {total, plural, one {{one}} two "
          & "{{other}} few {{other}} other {{other}}}")
     & P ("more_count", "prikazano: {visible}, +{remaining} več")
     & P ("others_count", "{first} in še {remaining}")
     & P ("page_count", "stran {page} od {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} two {{other}} few {{other}} other "
          & "{{other}}} na stran")
     & P ("pagination_range",
          "{first}–{last} od {total} {total, plural, one {{one}} two {{other}} "
          & "few {{other}} other {{other}}}")
     & P ("position_count", "{position} od {total}")
     & P ("selection_count",
          "izbrano: {selected} od {total} {total, plural, one {{one}} two "
          & "{{other}} few {{other}} other {{other}}}")
     & P ("showing_count",
          "prikazano: {showing} od {total} {total, plural, one {{one}} two "
          & "{{other}} few {{other}} other {{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {brez napak} warning "
          & "{brez opozoril} other {brez obvestil}}} one {{count} {severity, "
          & "select, error {napaka} warning {opozorilo} other {obvestilo}}} two "
          & "{{count} {severity, select, error {napaki} warning {opozorili} other "
          & "{obvestili}}} few {{count} {severity, select, error {napake} warning "
          & "{opozorila} other {obvestila}}} other {{count} {severity, select, "
          & "error {napak} warning {opozoril} other {obvestil}}}}")
     & P ("collection.empty", "{other}: jih ni")
     & P ("collection.none_shown", "{other}: ni prikazanih")
     & P ("collection.showing_hidden",
          "prikazano: {visible} od {total} {total, plural, one {{one}} two "
          & "{{other}} few {{other}} other {{other}}}, skrito: {hidden}")
     & P ("collection.showing",
          "prikazano: {visible} od {total} {total, plural, one {{one}} two "
          & "{{other}} few {{other}} other {{other}}}")
     & P ("collection.shown_hidden",
          "prikazano: {visible} {visible, plural, one {{one}} two {{other}} few "
          & "{{other}} other {{other}}}, skrito: {hidden}")
     & P ("collection.shown",
          "prikazano: {visible} {visible, plural, one {{one}} two {{other}} few "
          & "{{other}} other {{other}}}")
     & P ("collection.visible_out_of",
          "vidno: {visible} od {total} {total, plural, one {{one}} two {{other}} "
          & "few {{other}} other {{other}}}")
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
     & P ("calendar_difference.future", "še {difference}")
     & P ("calendar_difference.past", "{difference} nazaj")
     & P ("cpu_load", "obremenitev CPE {measure}")
     & P ("battery", "baterija {measure}")
     & P ("screen_size", "zaslon {measure}")
     & P ("refresh_rate", "hitrost osveževanja {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value, plural, one {{value} odstotek} two {{value} odstotka} few "
          & "{{value} odstotki} other {{value} odstotkov}}")
     & P ("recurrence.second",
          "{every, plural, =1 {vsako sekundo} one {vsakih {every} sekund} two "
          & "{vsaki {every} sekundi} few {vsake {every} sekunde} other {vsakih "
          & "{every} sekund}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {vsako minuto} one {vsakih {every} minut} two "
          & "{vsaki {every} minuti} few {vsake {every} minute} other {vsakih "
          & "{every} minut}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {vsako uro} one {vsakih {every} ur} two {vsaki "
          & "{every} uri} few {vsake {every} ure} other {vsakih {every} ur}}")
     & P ("recurrence.day",
          "{every, plural, =1 {vsak dan} one {vsakih {every} dni} two {vsaka "
          & "{every} dneva} few {vsake {every} dni} other {vsakih {every} dni}}")
     & P ("recurrence.week",
          "{every, plural, =1 {vsak teden} one {vsakih {every} tednov} two {vsaka "
          & "{every} tedna} few {vsake {every} tedne} other {vsakih {every} "
          & "tednov}}")
     & P ("recurrence.month",
          "{every, plural, =1 {vsak mesec} one {vsakih {every} mesecev} two "
          & "{vsaka {every} meseca} few {vsake {every} mesece} other {vsakih "
          & "{every} mesecev}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {vsako četrtletje} one {vsakih {every} "
          & "četrtletij} two {vsaki {every} četrtletji} few {vsaka {every} "
          & "četrtletja} other {vsakih {every} četrtletij}}")
     & P ("recurrence.year",
          "{every, plural, =1 {vsako leto} one {vsakih {every} let} two {vsaki "
          & "{every} leti} few {vsaka {every} leta} other {vsakih {every} let}}")
     & P ("cache_summary.empty", "predpomnilnik: ni zahtev")
     & P ("cache_summary",
          "predpomnilnik: {hits, plural, one {{hits} zadetek} two {{hits} "
          & "zadetka} few {{hits} zadetki} other {{hits} zadetkov}}, {misses, "
          & "plural, one {{misses} zgrešitev} two {{misses} zgrešitvi} few "
          & "{{misses} zgrešitve} other {{misses} zgrešitev}}, delež zadetkov "
          & "{rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} two {{other}} few {{other}} other "
          & "{{other}}}: spremenjeno {changed}, dodano {added}, odstranjeno "
          & "{removed}")
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
     & P ("summary.none", "{other}: jih ni")
     & P ("summary.completed",
          "dokončano: {count} {count, plural, one {{one}} two {{other}} few "
          & "{{other}} other {{other}}}")
     & P ("summary.completed_of",
          "dokončano: {count} od {total} {total, plural, one {{one}} two "
          & "{{other}} few {{other}} other {{other}}}")
     & P ("summary.failed", "ni uspelo: {count}")
     & P ("summary.queued",
          "v čakalni vrsti: {count} {count, plural, one {{one}} two {{other}} "
          & "few {{other}} other {{other}}}")
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
     & P ("feature_flag.flag_enabled", "zastavica funkcije omogočena")
     & P ("feature_flag.flag_disabled", "zastavica funkcije onemogočena")
     & P ("feature_flag.flag_rolling_out", "zastavica funkcije se postopno uvaja")
     & P ("feature_flag.flag_rolled_back", "zastavica funkcije povrnjena")
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
     & P ("calendar_difference.zero", "0 dni");
end Locale_Sl;
