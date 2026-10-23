separate (Humanize.Catalogs.Phrase_Data)
function Locale_Sv return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("sv", Name, Template));
begin
   return
     P ("all_count", "alla {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "inga {other} matchar")
     & P ("filtered_count.all", "alla {total} {total, plural, one {{one}} other {{other}}} matchar")
     & P ("filtered_count.some",
          "{matching} av {total} {total, plural, one {{one}} other {{other}}} "
          & "matchar")
     & P ("more_count", "{visible} visas, +{remaining} till")
     & P ("others_count",
          "{first} och {remaining, plural, one {1 annan} other {{remaining} "
          & "andra}}")
     & P ("page_count", "sida {page} av {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per sida")
     & P ("pagination_range",
          "{first}–{last} av {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} av {total}")
     & P ("selection_count",
          "{selected} av {total} {total, plural, one {{one}} other {{other}}} "
          & "{selected, plural, one {markerad} other {markerade}}")
     & P ("showing_count",
          "visar {showing} av {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {inga {severity, select, error {fel} warning "
          & "{varningar} other {meddelanden}}} one {1 {severity, select, error "
          & "{fel} warning {varning} other {meddelande}}} other {{count} {severity, "
          & "select, error {fel} warning {varningar} other {meddelanden}}}}")
     & P ("collection.empty", "inga {other}")
     & P ("collection.none_shown", "inga {other} visas")
     & P ("collection.showing_hidden",
          "visar {visible} av {total} {total, plural, one {{one}} other "
          & "{{other}}}, {hidden} döljs")
     & P ("collection.showing",
          "visar {visible} av {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} visas, "
          & "{hidden} döljs")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} visas")
     & P ("collection.visible_out_of",
          "{visible} av {total} {total, plural, one {{one}} other {{other}}} "
          & "visas")
     & P ("complete_count", "{done} av {total} klara")
     & P ("percent_complete", "{percent} % klart")
     & P ("step_count", "steg {step} av {total}")
     & P ("attempt_count", "försök {attempt} av {total}")
     & P ("throughput_remaining", "{remaining} kvar med {rate} {unit}/s")
     & P ("accessible_progress", "{done} av {total} klara, {percent} procent")
     & P ("business_days", "{days} {days, plural, one {arbetsdag} other {arbetsdagar}}")
     & P ("working_hours", "{hours} {hours, plural, one {arbetstimme} other {arbetstimmar}}")
     & P ("due.overdue", "förföll för {days} {days, plural, one {dag} other {dagar}} sedan")
     & P ("due.today", "förfaller i dag")
     & P ("due.tomorrow", "förfaller i morgon")
     & P ("due.in", "förfaller om {days} dagar")
     & P ("calendar_difference.future", "om {difference}")
     & P ("calendar_difference.past", "för {difference} sedan")
     & P ("cpu_load", "CPU-belastning {measure}")
     & P ("battery", "batteri {measure}")
     & P ("screen_size", "skärm {measure}")
     & P ("refresh_rate", "uppdateringsfrekvens {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} procent")
     & P ("recurrence.second",
          "{every, plural, one {varje sekund} other {med {every} sekunders "
          & "intervall}}")
     & P ("recurrence.minute",
          "{every, plural, one {varje minut} other {med {every} minuters "
          & "intervall}}")
     & P ("recurrence.hour",
          "{every, plural, one {varje timme} other {med {every} timmars "
          & "intervall}}")
     & P ("recurrence.day", "{every, plural, one {varje dag} other {med {every} dagars intervall}}")
     & P ("recurrence.week",
          "{every, plural, one {varje vecka} other {med {every} veckors "
          & "intervall}}")
     & P ("recurrence.month",
          "{every, plural, one {varje månad} other {med {every} månaders "
          & "intervall}}")
     & P ("recurrence.quarter",
          "{every, plural, one {varje kvartal} other {med {every} kvartals "
          & "intervall}}")
     & P ("recurrence.year", "{every, plural, one {varje år} other {med {every} års intervall}}")
     & P ("cache_summary.empty", "cache: inga förfrågningar")
     & P ("cache_summary",
          "cache: {hits} {hits, plural, one {träff} other {träffar}}, {misses} "
          & "{misses, plural, one {miss} other {missar}}, {rate} % träffkvot")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: ändrade "
          & "{changed}, tillagda {added}, borttagna {removed}")
     & P ("field_diff", "{field} ändrades från {before} till {after}")
     & P ("field_added", "{field} lades till som {value}")
     & P ("field_removed", "{field} togs bort (var {value})")
     & P ("field_unchanged", "{field} förblir {value}")
     & P ("number_comparison.equal", "{current} är lika med {baseline}")
     & P ("number_comparison.higher", "{current} är {quantity} högre än {baseline}")
     & P ("number_comparison.lower", "{current} är {quantity} lägre än {baseline}")
     & P ("percent_comparison.equal", "{current} är lika med {baseline}")
     & P ("percent_comparison.higher", "{current} är {quantity} högre än {baseline}")
     & P ("percent_comparison.lower", "{current} är {quantity} lägre än {baseline}")
     & P ("file_size_comparison.same", "{current} har samma storlek som {baseline}")
     & P ("file_size_comparison.larger", "{current} är {quantity} större än {baseline}")
     & P ("file_size_comparison.smaller", "{current} är {quantity} mindre än {baseline}")
     & P ("date_comparison.same", "{current} är samma datum som {baseline}")
     & P ("date_comparison.after", "{current} infaller {quantity} efter {baseline}")
     & P ("date_comparison.before", "{current} infaller {quantity} före {baseline}")
     & P ("queue_summary", "kö: {details}")
     & P ("domain_summary",
          "{domain, select, queue {kö} job {jobb} run {körning} cache {cache} "
          & "sync {synkronisering} import {import} export {export} other "
          & "{{domain}}} {state, select, queued {i kö} running {körs} waiting "
          & "{väntar} paused {pausad} complete {klar} failed {misslyckades} stale "
          & "{inaktuell} skipped {hoppades över} other {{state}}}: {details}")
     & P ("summary.none", "inga {other}")
     & P ("summary.completed", "{count} {count, plural, one {{one} klar} other {{other} klara}}")
     & P ("summary.completed_of", "{count} av {total} {total, plural, one {{one}} other {{other}}} klara")
     & P ("summary.failed", "{count} misslyckades")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} i kö")
     & P ("summary.running", "{count} körs")
     & P ("summary.complete", "{count} {count, plural, one {klar} other {klara}}")
     & P ("backup.backup_running", "säkerhetskopiering pågår")
     & P ("backup.backup_completed", "säkerhetskopiering klar")
     & P ("backup.backup_failed", "säkerhetskopiering misslyckades")
     & P ("backup.backup_stale", "säkerhetskopia inaktuell")
     & P ("incident.incident_investigating", "incident undersöks")
     & P ("incident.incident_identified", "incident identifierad")
     & P ("incident.incident_mitigated", "incident begränsad")
     & P ("incident.incident_resolved", "incident löst")
     & P ("release.release_drafting", "version förbereds")
     & P ("release.release_ready", "version klar")
     & P ("release.release_published", "version publicerad")
     & P ("release.release_rolled_back", "version återställd")
     & P ("audit.audit_created", "granskningspost skapad")
     & P ("audit.audit_updated", "granskningspost uppdaterad")
     & P ("audit.audit_deleted", "granskningspost borttagen")
     & P ("audit.audit_restored", "granskningspost återställd")
     & P ("feature_flag.flag_enabled", "funktionsflagga aktiverad")
     & P ("feature_flag.flag_disabled", "funktionsflagga inaktiverad")
     & P ("feature_flag.flag_rolling_out", "funktionsflagga rullas ut")
     & P ("feature_flag.flag_rolled_back", "funktionsflagga återställd")
     & P ("webhook.webhook_pending", "webhook väntar")
     & P ("webhook.webhook_delivered", "webhook levererad")
     & P ("webhook.webhook_failed", "webhook misslyckades")
     & P ("webhook.webhook_retrying", "webhook försöker igen")
     & P ("api_key.api_key_active", "API-nyckel aktiv")
     & P ("api_key.api_key_revoked", "API-nyckel återkallad")
     & P ("api_key.api_key_expired", "API-nyckel utgången")
     & P ("api_key.api_key_rotated", "API-nyckel roterad")
     & P ("quota.quota_available", "kvot tillgänglig")
     & P ("quota.quota_near_limit", "kvot nästan förbrukad")
     & P ("quota.quota_exceeded", "kvot överskriden")
     & P ("quota.quota_reset", "kvot återställd")
     & P ("invoice.invoice_draft", "fakturautkast")
     & P ("invoice.invoice_sent", "faktura skickad")
     & P ("invoice.invoice_paid", "faktura betald")
     & P ("invoice.invoice_refunded", "faktura återbetald")
     & P ("invoice.invoice_overdue", "faktura förfallen")
     & P ("invoice.refund_failed", "återbetalning misslyckades")
     & P ("page_navigation.only", "enda sidan")
     & P ("page_navigation.first", "första sidan, nästa tillgänglig")
     & P ("page_navigation.last", "sista sidan, föregående tillgänglig")
     & P ("page_navigation.middle", "föregående och nästa tillgängliga")
     & P ("end_of_week", "slutet av veckan")
     & P ("end_of_month", "slutet av månaden")
     & P ("end_of_quarter", "slutet av kvartalet")
     & P ("time_of_day.night", "natt")
     & P ("time_of_day.morning", "morgon")
     & P ("time_of_day.afternoon", "eftermiddag")
     & P ("time_of_day.evening", "kväll")
     & P ("calendar_difference.same_day", "samma dag")
     & P ("calendar_difference.zero", "0 dagar")
     & P ("queue_summary.empty", "kön är tom");
end Locale_Sv;
