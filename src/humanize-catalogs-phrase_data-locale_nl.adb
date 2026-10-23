separate (Humanize.Catalogs.Phrase_Data)
function Locale_Nl return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("nl", Name, Template));
begin
   return
     P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "geen overeenkomende {other}")
     & P ("filtered_count.all",
          "alle {total} {total, plural, one {{one}} other {{other}}} komen "
          & "overeen")
     & P ("filtered_count.some",
          "{matching} van {total} {total, plural, one {{one}} other {{other}}} "
          & "komen overeen")
     & P ("more_count", "{visible} weergegeven, +{remaining} meer")
     & P ("others_count",
          "{first} en {remaining, plural, one {1 andere} other {{remaining} "
          & "andere}}")
     & P ("page_count", "pagina {page} van {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per pagina")
     & P ("pagination_range",
          "{first}–{last} van {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} van {total}")
     & P ("selection_count",
          "{selected} van {total} {total, plural, one {{one}} other {{other}}} "
          & "geselecteerd")
     & P ("showing_count",
          "{showing} van {total} {total, plural, one {{one}} other {{other}}} "
          & "weergegeven")
     & P ("validation_count",
          "{count, plural, =0 {geen {severity, select, error {fouten} warning "
          & "{waarschuwingen} other {meldingen}}} one {1 {severity, select, error "
          & "{fout} warning {waarschuwing} other {melding}}} other {{count} "
          & "{severity, select, error {fouten} warning {waarschuwingen} other "
          & "{meldingen}}}}")
     & P ("collection.empty", "geen {other}")
     & P ("collection.none_shown", "geen {other} weergegeven")
     & P ("collection.showing_hidden",
          "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
          & "weergegeven, {hidden} verborgen")
     & P ("collection.showing",
          "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
          & "weergegeven")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} weergegeven, "
          & "{hidden} verborgen")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} weergegeven")
     & P ("collection.visible_out_of",
          "{visible} van {total} {total, plural, one {{one}} other {{other}}} "
          & "zichtbaar")
     & P ("complete_count", "{done} van {total} voltooid")
     & P ("percent_complete", "{percent}% voltooid")
     & P ("step_count", "stap {step} van {total}")
     & P ("attempt_count", "poging {attempt} van {total}")
     & P ("throughput_remaining", "nog {remaining} {unit} bij {rate} {unit}/s")
     & P ("accessible_progress", "{done} van {total} voltooid, {percent} procent")
     & P ("business_days", "{days} {days, plural, one {werkdag} other {werkdagen}}")
     & P ("working_hours", "{hours} {hours, plural, one {werkuur} other {werkuren}}")
     & P ("due.overdue", "{days} {days, plural, one {dag} other {dagen}} te laat")
     & P ("due.today", "vervalt vandaag")
     & P ("due.tomorrow", "vervalt morgen")
     & P ("due.in", "vervalt over {days} dagen")
     & P ("calendar_difference.future", "over {difference}")
     & P ("calendar_difference.past", "{difference} geleden")
     & P ("calendar_difference.same_day", "dezelfde dag")
     & P ("calendar_difference.zero", "0 dagen")
     & P ("cpu_load", "CPU-belasting {measure}")
     & P ("battery", "batterij {measure}")
     & P ("screen_size", "scherm {measure}")
     & P ("refresh_rate", "verversingssnelheid {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "{value} procent")
     & P ("recurrence.second", "{every, plural, one {elke seconde} other {elke {every} seconden}}")
     & P ("recurrence.minute", "{every, plural, one {elke minuut} other {elke {every} minuten}}")
     & P ("recurrence.hour", "{every, plural, one {elk uur} other {elke {every} uur}}")
     & P ("recurrence.day", "{every, plural, one {elke dag} other {elke {every} dagen}}")
     & P ("recurrence.week", "{every, plural, one {elke week} other {elke {every} weken}}")
     & P ("recurrence.month", "{every, plural, one {elke maand} other {elke {every} maanden}}")
     & P ("recurrence.quarter", "{every, plural, one {elk kwartaal} other {elke {every} kwartalen}}")
     & P ("recurrence.year", "{every, plural, one {elk jaar} other {elke {every} jaar}}")
     & P ("cache_summary.empty", "cache: geen verzoeken")
     & P ("cache_summary",
          "cache: {hits} {hits, plural, one {treffer} other {treffers}}, {misses} "
          & "{misses, plural, one {misser} other {missers}}, {rate}% "
          & "trefferpercentage")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
          & "gewijzigd, {added} toegevoegd, {removed} verwijderd")
     & P ("field_diff", "{field} gewijzigd van {before} in {after}")
     & P ("field_added", "{field} toegevoegd als {value}")
     & P ("field_removed", "{field} verwijderd (was {value})")
     & P ("field_unchanged", "{field} ongewijzigd op {value}")
     & P ("number_comparison.equal", "{current} is gelijk aan {baseline}")
     & P ("number_comparison.higher", "{current} is {quantity} hoger dan {baseline}")
     & P ("number_comparison.lower", "{current} is {quantity} lager dan {baseline}")
     & P ("percent_comparison.equal", "{current} is gelijk aan {baseline}")
     & P ("percent_comparison.higher", "{current} is {quantity} hoger dan {baseline}")
     & P ("percent_comparison.lower", "{current} is {quantity} lager dan {baseline}")
     & P ("file_size_comparison.same", "{current} is even groot als {baseline}")
     & P ("file_size_comparison.larger", "{current} is {quantity} groter dan {baseline}")
     & P ("file_size_comparison.smaller", "{current} is {quantity} kleiner dan {baseline}")
     & P ("date_comparison.same", "{current} is dezelfde datum als {baseline}")
     & P ("date_comparison.after", "{current} valt {quantity} na {baseline}")
     & P ("date_comparison.before", "{current} valt {quantity} vóór {baseline}")
     & P ("queue_summary", "wachtrij: {details}")
     & P ("queue_summary.empty", "wachtrij leeg")
     & P ("domain_summary",
          "{domain, select, queue {wachtrij} job {taak} run {uitvoering} cache "
          & "{cache} sync {synchronisatie} import {import} export {export} other "
          & "{{domain}}} {state, select, queued {in wachtrij} running {bezig} "
          & "waiting {wachtend} paused {gepauzeerd} complete {voltooid} failed "
          & "{mislukt} stale {verouderd} skipped {overgeslagen} other {{state}}}: "
          & "{details}")
     & P ("summary.none", "geen {other}")
     & P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} voltooid")
     & P ("summary.completed_of",
          "{count} van {total} {total, plural, one {{one}} other {{other}}} "
          & "voltooid")
     & P ("summary.failed", "{count} mislukt")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} in wachtrij")
     & P ("summary.running", "{count} bezig")
     & P ("summary.complete", "{count} voltooid")
     & P ("backup.backup_running", "back-up bezig")
     & P ("backup.backup_completed", "back-up voltooid")
     & P ("backup.backup_failed", "back-up mislukt")
     & P ("backup.backup_stale", "back-up verouderd")
     & P ("incident.incident_investigating", "incident wordt onderzocht")
     & P ("incident.incident_identified", "incident geïdentificeerd")
     & P ("incident.incident_mitigated", "incident beperkt")
     & P ("incident.incident_resolved", "incident opgelost")
     & P ("release.release_drafting", "release in voorbereiding")
     & P ("release.release_ready", "release gereed")
     & P ("release.release_published", "release gepubliceerd")
     & P ("release.release_rolled_back", "release teruggedraaid")
     & P ("audit.audit_created", "auditrecord aangemaakt")
     & P ("audit.audit_updated", "auditrecord bijgewerkt")
     & P ("audit.audit_deleted", "auditrecord verwijderd")
     & P ("audit.audit_restored", "auditrecord hersteld")
     & P ("feature_flag.flag_enabled", "featureflag ingeschakeld")
     & P ("feature_flag.flag_disabled", "featureflag uitgeschakeld")
     & P ("feature_flag.flag_rolling_out", "featureflag wordt uitgerold")
     & P ("feature_flag.flag_rolled_back", "featureflag teruggedraaid")
     & P ("webhook.webhook_pending", "webhook in behandeling")
     & P ("webhook.webhook_delivered", "webhook afgeleverd")
     & P ("webhook.webhook_failed", "webhook mislukt")
     & P ("webhook.webhook_retrying", "webhook wordt opnieuw geprobeerd")
     & P ("api_key.api_key_active", "API-sleutel actief")
     & P ("api_key.api_key_revoked", "API-sleutel ingetrokken")
     & P ("api_key.api_key_expired", "API-sleutel verlopen")
     & P ("api_key.api_key_rotated", "API-sleutel vervangen")
     & P ("quota.quota_available", "quotum beschikbaar")
     & P ("quota.quota_near_limit", "quotum bijna bereikt")
     & P ("quota.quota_exceeded", "quotum overschreden")
     & P ("quota.quota_reset", "quotum opnieuw ingesteld")
     & P ("invoice.invoice_draft", "conceptfactuur")
     & P ("invoice.invoice_sent", "factuur verzonden")
     & P ("invoice.invoice_paid", "factuur betaald")
     & P ("invoice.invoice_refunded", "factuur terugbetaald")
     & P ("invoice.invoice_overdue", "factuur achterstallig")
     & P ("invoice.refund_failed", "terugbetaling mislukt")
     & P ("page_navigation.only", "enige pagina")
     & P ("page_navigation.first", "eerste pagina, volgende beschikbaar")
     & P ("page_navigation.last", "laatste pagina, vorige beschikbaar")
     & P ("page_navigation.middle", "vorige en volgende beschikbaar")
     & P ("end_of_week", "einde van de week")
     & P ("end_of_month", "einde van de maand")
     & P ("end_of_quarter", "einde van het kwartaal")
     & P ("time_of_day.night", "nacht")
     & P ("time_of_day.morning", "ochtend")
     & P ("time_of_day.afternoon", "middag")
     & P ("time_of_day.evening", "avond");
end Locale_Nl;
