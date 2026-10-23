separate (Humanize.Catalogs.Phrase_Data)
function Locale_Af return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("af", Name, Template));
begin
   return
     P ("all_count", "al {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "geen ooreenstemmende {other}")
     & P ("filtered_count.all", "al {total} {total, plural, one {{one}} other {{other}}} stem ooreen")
     & P ("filtered_count.some",
          "{matching} van {total} {total, plural, one {{one}} other {{other}}} "
          & "stem ooreen")
     & P ("more_count", "{visible} gewys, +{remaining} meer")
     & P ("others_count",
          "{first} en {remaining, plural, one {1 ander} other {{remaining} "
          & "ander}}")
     & P ("page_count", "bladsy {page} van {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per bladsy")
     & P ("pagination_range",
          "{first}–{last} van {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} van {total}")
     & P ("selection_count",
          "{selected} van {total} {total, plural, one {{one}} other {{other}}} "
          & "gekies")
     & P ("showing_count",
          "{showing} van {total} {total, plural, one {{one}} other {{other}}} "
          & "gewys")
     & P ("validation_count",
          "{count, plural, =0 {geen {severity, select, error {foute} warning "
          & "{waarskuwings} other {kennisgewings}}} one {1 {severity, select, error "
          & "{fout} warning {waarskuwing} other {kennisgewing}}} other {{count} "
          & "{severity, select, error {foute} warning {waarskuwings} other "
          & "{kennisgewings}}}}")
     & P ("collection.empty", "geen {other}")
     & P ("collection.none_shown", "geen {other} gewys")
     & P ("collection.showing_hidden",
          "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
          & "gewys, {hidden} versteek")
     & P ("collection.showing",
          "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
          & "gewys")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} gewys, "
          & "{hidden} versteek")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} gewys")
     & P ("collection.visible_out_of",
          "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
          & "sigbaar")
     & P ("complete_count", "{done} van {total} voltooi")
     & P ("percent_complete", "{percent}% voltooi")
     & P ("step_count", "stap {step} van {total}")
     & P ("attempt_count", "poging {attempt} van {total}")
     & P ("throughput_remaining", "nog {remaining} {unit} teen {rate} {unit}/s")
     & P ("accessible_progress", "{done} van {total} voltooi, {percent} persent")
     & P ("business_days", "{days} {days, plural, one {werkdag} other {werkdae}}")
     & P ("working_hours", "{hours} {hours, plural, one {werkuur} other {werkure}}")
     & P ("due.overdue", "{days} {days, plural, one {dag} other {dae}} agterstallig")
     & P ("due.today", "verval vandag")
     & P ("due.tomorrow", "verval môre")
     & P ("due.in", "verval oor {days} dae")
     & P ("calendar_difference.future", "oor {difference}")
     & P ("calendar_difference.past", "{difference} gelede")
     & P ("calendar_difference.same_day", "dieselfde dag")
     & P ("calendar_difference.zero", "0 dae")
     & P ("cpu_load", "SVE-las {measure}")
     & P ("battery", "battery {measure}")
     & P ("screen_size", "skerm {measure}")
     & P ("refresh_rate", "herlaaitempo {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "{value} persent")
     & P ("recurrence.second", "{every, plural, one {elke sekonde} other {elke {every} sekondes}}")
     & P ("recurrence.minute", "{every, plural, one {elke minuut} other {elke {every} minute}}")
     & P ("recurrence.hour", "{every, plural, one {elke uur} other {elke {every} uur}}")
     & P ("recurrence.day", "{every, plural, one {elke dag} other {elke {every} dae}}")
     & P ("recurrence.week", "{every, plural, one {elke week} other {elke {every} weke}}")
     & P ("recurrence.month", "{every, plural, one {elke maand} other {elke {every} maande}}")
     & P ("recurrence.quarter", "{every, plural, one {elke kwartaal} other {elke {every} kwartale}}")
     & P ("recurrence.year", "{every, plural, one {elke jaar} other {elke {every} jaar}}")
     & P ("cache_summary.empty", "kas: geen versoeke")
     & P ("cache_summary",
          "kas: {hits} {hits, plural, one {treffer} other {treffers}}, {misses} "
          & "{misses, plural, one {mis} other {misse}}, {rate}% trefferkoers")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
          & "verander, {added} bygevoeg, {removed} verwyder")
     & P ("field_diff", "{field} verander van {before} na {after}")
     & P ("field_added", "{field} bygevoeg as {value}")
     & P ("field_removed", "{field} verwyder (was {value})")
     & P ("field_unchanged", "{field} onveranderd op {value}")
     & P ("number_comparison.equal", "{current} is gelyk aan {baseline}")
     & P ("number_comparison.higher", "{current} is {quantity} hoër as {baseline}")
     & P ("number_comparison.lower", "{current} is {quantity} laer as {baseline}")
     & P ("percent_comparison.equal", "{current} is gelyk aan {baseline}")
     & P ("percent_comparison.higher", "{current} is {quantity} hoër as {baseline}")
     & P ("percent_comparison.lower", "{current} is {quantity} laer as {baseline}")
     & P ("file_size_comparison.same", "{current} is ewe groot as {baseline}")
     & P ("file_size_comparison.larger", "{current} is {quantity} groter as {baseline}")
     & P ("file_size_comparison.smaller", "{current} is {quantity} kleiner as {baseline}")
     & P ("date_comparison.same", "{current} is dieselfde datum as {baseline}")
     & P ("date_comparison.after", "{current} is {quantity} ná {baseline}")
     & P ("date_comparison.before", "{current} is {quantity} voor {baseline}")
     & P ("queue_summary", "tou: {details}")
     & P ("queue_summary.empty", "tou leeg")
     & P ("domain_summary",
          "{domain, select, queue {tou} job {taak} run {lopie} cache {kas} sync "
          & "{sinkronisasie} import {invoer} export {uitvoer} other {{domain}}} "
          & "{state, select, queued {in tou} running {loop} waiting {wag} paused "
          & "{gepouseer} complete {voltooi} failed {misluk} stale {verouderd} "
          & "skipped {oorgeslaan} other {{state}}}: {details}")
     & P ("summary.none", "geen {other}")
     & P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} voltooi")
     & P ("summary.completed_of",
          "{count} van {total} {total, plural, one {{one}} other {{other}}} "
          & "voltooi")
     & P ("summary.failed", "{count} misluk")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} in tou")
     & P ("summary.running", "{count} aan die gang")
     & P ("summary.complete", "{count} voltooi")
     & P ("backup.backup_running", "rugsteun aan die gang")
     & P ("backup.backup_completed", "rugsteun voltooi")
     & P ("backup.backup_failed", "rugsteun misluk")
     & P ("backup.backup_stale", "rugsteun verouderd")
     & P ("incident.incident_investigating", "voorval word ondersoek")
     & P ("incident.incident_identified", "voorval geïdentifiseer")
     & P ("incident.incident_mitigated", "voorval beperk")
     & P ("incident.incident_resolved", "voorval opgelos")
     & P ("release.release_drafting", "vrystelling word voorberei")
     & P ("release.release_ready", "vrystelling gereed")
     & P ("release.release_published", "vrystelling gepubliseer")
     & P ("release.release_rolled_back", "vrystelling teruggerol")
     & P ("audit.audit_created", "ouditinskrywing geskep")
     & P ("audit.audit_updated", "ouditinskrywing bygewerk")
     & P ("audit.audit_deleted", "ouditinskrywing geskrap")
     & P ("audit.audit_restored", "ouditinskrywing herstel")
     & P ("feature_flag.flag_enabled", "funksievlag geaktiveer")
     & P ("feature_flag.flag_disabled", "funksievlag gedeaktiveer")
     & P ("feature_flag.flag_rolling_out", "funksievlag word uitgerol")
     & P ("feature_flag.flag_rolled_back", "funksievlag teruggerol")
     & P ("webhook.webhook_pending", "webhook hangend")
     & P ("webhook.webhook_delivered", "webhook afgelewer")
     & P ("webhook.webhook_failed", "webhook misluk")
     & P ("webhook.webhook_retrying", "webhook word weer probeer")
     & P ("api_key.api_key_active", "API-sleutel aktief")
     & P ("api_key.api_key_revoked", "API-sleutel herroep")
     & P ("api_key.api_key_expired", "API-sleutel verval")
     & P ("api_key.api_key_rotated", "API-sleutel vervang")
     & P ("quota.quota_available", "kwota beskikbaar")
     & P ("quota.quota_near_limit", "kwota amper bereik")
     & P ("quota.quota_exceeded", "kwota oorskry")
     & P ("quota.quota_reset", "kwota teruggestel")
     & P ("invoice.invoice_draft", "faktuurkonsep")
     & P ("invoice.invoice_sent", "faktuur gestuur")
     & P ("invoice.invoice_paid", "faktuur betaal")
     & P ("invoice.invoice_refunded", "faktuur terugbetaal")
     & P ("invoice.invoice_overdue", "faktuur agterstallig")
     & P ("invoice.refund_failed", "terugbetaling misluk")
     & P ("page_navigation.only", "enigste bladsy")
     & P ("page_navigation.first", "eerste bladsy, volgende beskikbaar")
     & P ("page_navigation.last", "laaste bladsy, vorige beskikbaar")
     & P ("page_navigation.middle", "vorige en volgende beskikbaar")
     & P ("end_of_week", "einde van die week")
     & P ("end_of_month", "einde van die maand")
     & P ("end_of_quarter", "einde van die kwartaal")
     & P ("time_of_day.night", "nag")
     & P ("time_of_day.morning", "oggend")
     & P ("time_of_day.afternoon", "middag")
     & P ("time_of_day.evening", "aand");
end Locale_Af;
