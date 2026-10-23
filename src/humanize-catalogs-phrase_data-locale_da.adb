separate (Humanize.Catalogs.Phrase_Data)
function Locale_Da return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("da", Name, Template));
begin
   return
     P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "ingen {other} matcher")
     & P ("filtered_count.all", "alle {total} {total, plural, one {{one}} other {{other}}} matcher")
     & P ("filtered_count.some",
          "{matching} af {total} {total, plural, one {{one}} other {{other}}} "
          & "matcher")
     & P ("more_count", "{visible} vist, +{remaining} mere")
     & P ("others_count",
          "{first} og {remaining, plural, one {1 anden} other {{remaining} "
          & "andre}}")
     & P ("page_count", "side {page} af {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} pr. side")
     & P ("pagination_range",
          "{first}–{last} af {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} af {total}")
     & P ("selection_count",
          "{selected} af {total} {total, plural, one {{one}} other {{other}}} "
          & "markeret")
     & P ("showing_count",
          "viser {showing} af {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {ingen {severity, select, error {fejl} warning "
          & "{advarsler} other {meddelelser}}} one {1 {severity, select, error "
          & "{fejl} warning {advarsel} other {meddelelse}}} other {{count} "
          & "{severity, select, error {fejl} warning {advarsler} other "
          & "{meddelelser}}}}")
     & P ("collection.empty", "ingen {other}")
     & P ("collection.none_shown", "ingen {other} vises")
     & P ("collection.showing_hidden",
          "viser {visible} af {total} {total, plural, one {{one}} other "
          & "{{other}}}, {hidden} skjult")
     & P ("collection.showing",
          "viser {visible} af {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} vises, "
          & "{hidden} skjules")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} vises")
     & P ("collection.visible_out_of",
          "{visible} af {total} {total, plural, one {{one}} other {{other}}} "
          & "synlige")
     & P ("complete_count", "{done} af {total} fuldført")
     & P ("percent_complete", "{percent} % fuldført")
     & P ("step_count", "trin {step} af {total}")
     & P ("attempt_count", "forsøg {attempt} af {total}")
     & P ("throughput_remaining", "{remaining} tilbage ved {rate} {unit}/s")
     & P ("accessible_progress", "{done} af {total} fuldført, {percent} procent")
     & P ("business_days", "{days} {days, plural, one {arbejdsdag} other {arbejdsdage}}")
     & P ("working_hours", "{hours} {hours, plural, one {arbejdstime} other {arbejdstimer}}")
     & P ("due.overdue", "forfaldt for {days} {days, plural, one {dag} other {dage}} siden")
     & P ("due.today", "forfalder i dag")
     & P ("due.tomorrow", "forfalder i morgen")
     & P ("due.in", "forfalder om {days} dage")
     & P ("calendar_difference.future", "om {difference}")
     & P ("calendar_difference.past", "for {difference} siden")
     & P ("cpu_load", "CPU-belastning {measure}")
     & P ("battery", "batteri {measure}")
     & P ("screen_size", "skærm {measure}")
     & P ("refresh_rate", "opdateringshastighed {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} procent")
     & P ("recurrence.second", "{every, plural, one {hvert sekund} other {hvert {every}. sekund}}")
     & P ("recurrence.minute", "{every, plural, one {hvert minut} other {hvert {every}. minut}}")
     & P ("recurrence.hour", "{every, plural, one {hver time} other {hver {every}. time}}")
     & P ("recurrence.day", "{every, plural, one {hver dag} other {hver {every}. dag}}")
     & P ("recurrence.week", "{every, plural, one {hver uge} other {hver {every}. uge}}")
     & P ("recurrence.month", "{every, plural, one {hver måned} other {hver {every}. måned}}")
     & P ("recurrence.quarter", "{every, plural, one {hvert kvartal} other {hvert {every}. kvartal}}")
     & P ("recurrence.year", "{every, plural, one {hvert år} other {hvert {every}. år}}")
     & P ("cache_summary.empty", "cache: ingen forespørgsler")
     & P ("cache_summary", "cache: {hits} træf, {misses} bom, {rate} % træfrate")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
          & "ændret, {added} tilføjet, {removed} fjernet")
     & P ("field_diff", "{field} ændret fra {before} til {after}")
     & P ("field_added", "{field} tilføjet som {value}")
     & P ("field_removed", "{field} fjernet (var {value})")
     & P ("field_unchanged", "{field} uændret ({value})")
     & P ("number_comparison.equal", "{current} er lig med {baseline}")
     & P ("number_comparison.higher", "{current} er {quantity} højere end {baseline}")
     & P ("number_comparison.lower", "{current} er {quantity} lavere end {baseline}")
     & P ("percent_comparison.equal", "{current} er lig med {baseline}")
     & P ("percent_comparison.higher", "{current} er {quantity} højere end {baseline}")
     & P ("percent_comparison.lower", "{current} er {quantity} lavere end {baseline}")
     & P ("file_size_comparison.same", "{current} har samme størrelse som {baseline}")
     & P ("file_size_comparison.larger", "{current} er {quantity} større end {baseline}")
     & P ("file_size_comparison.smaller", "{current} er {quantity} mindre end {baseline}")
     & P ("date_comparison.same", "{current} er samme dato som {baseline}")
     & P ("date_comparison.after", "{current} ligger {quantity} efter {baseline}")
     & P ("date_comparison.before", "{current} ligger {quantity} før {baseline}")
     & P ("queue_summary", "kø: {details}")
     & P ("domain_summary",
          "{domain, select, queue {kø} job {job} run {kørsel} cache {cache} "
          & "sync {synkronisering} import {import} export {eksport} other "
          & "{{domain}}} {state, select, queued {i kø} running {kører} waiting "
          & "{venter} paused {sat på pause} complete {fuldført} failed "
          & "{mislykkedes} stale {forældet} skipped {sprunget over} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "ingen {other}")
     & P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} fuldført")
     & P ("summary.completed_of",
          "{count} af {total} {total, plural, one {{one}} other {{other}}} "
          & "fuldført")
     & P ("summary.failed", "{count} mislykkedes")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} i kø")
     & P ("summary.running", "{count} kører")
     & P ("summary.complete", "{count} fuldført")
     & P ("backup.backup_running", "sikkerhedskopiering kører")
     & P ("backup.backup_completed", "sikkerhedskopiering fuldført")
     & P ("backup.backup_failed", "sikkerhedskopiering mislykkedes")
     & P ("backup.backup_stale", "sikkerhedskopi forældet")
     & P ("incident.incident_investigating", "hændelse undersøges")
     & P ("incident.incident_identified", "hændelse identificeret")
     & P ("incident.incident_mitigated", "hændelse afbødet")
     & P ("incident.incident_resolved", "hændelse løst")
     & P ("release.release_drafting", "udgivelse under forberedelse")
     & P ("release.release_ready", "udgivelse klar")
     & P ("release.release_published", "udgivelse offentliggjort")
     & P ("release.release_rolled_back", "udgivelse rullet tilbage")
     & P ("audit.audit_created", "revisionspost oprettet")
     & P ("audit.audit_updated", "revisionspost opdateret")
     & P ("audit.audit_deleted", "revisionspost slettet")
     & P ("audit.audit_restored", "revisionspost gendannet")
     & P ("feature_flag.flag_enabled", "funktionsflag aktiveret")
     & P ("feature_flag.flag_disabled", "funktionsflag deaktiveret")
     & P ("feature_flag.flag_rolling_out", "funktionsflag udrulles")
     & P ("feature_flag.flag_rolled_back", "funktionsflag rullet tilbage")
     & P ("webhook.webhook_pending", "webhook afventer")
     & P ("webhook.webhook_delivered", "webhook leveret")
     & P ("webhook.webhook_failed", "webhook mislykkedes")
     & P ("webhook.webhook_retrying", "webhook forsøges igen")
     & P ("api_key.api_key_active", "API-nøgle aktiv")
     & P ("api_key.api_key_revoked", "API-nøgle tilbagekaldt")
     & P ("api_key.api_key_expired", "API-nøgle udløbet")
     & P ("api_key.api_key_rotated", "API-nøgle roteret")
     & P ("quota.quota_available", "kvote tilgængelig")
     & P ("quota.quota_near_limit", "kvote næsten opbrugt")
     & P ("quota.quota_exceeded", "kvote overskredet")
     & P ("quota.quota_reset", "kvote nulstillet")
     & P ("invoice.invoice_draft", "fakturakladde")
     & P ("invoice.invoice_sent", "faktura sendt")
     & P ("invoice.invoice_paid", "faktura betalt")
     & P ("invoice.invoice_refunded", "faktura refunderet")
     & P ("invoice.invoice_overdue", "faktura forfalden")
     & P ("invoice.refund_failed", "refusion mislykkedes")
     & P ("page_navigation.only", "eneste side")
     & P ("page_navigation.first", "første side, næste tilgængelig")
     & P ("page_navigation.last", "sidste side, forrige tilgængelig")
     & P ("page_navigation.middle", "forrige og næste tilgængelig")
     & P ("end_of_week", "slutningen af ugen")
     & P ("end_of_month", "slutningen af måneden")
     & P ("end_of_quarter", "slutningen af kvartalet")
     & P ("time_of_day.night", "nat")
     & P ("time_of_day.morning", "morgen")
     & P ("time_of_day.afternoon", "eftermiddag")
     & P ("time_of_day.evening", "aften")
     & P ("calendar_difference.same_day", "samme dag")
     & P ("calendar_difference.zero", "0 dage")
     & P ("queue_summary.empty", "køen er tom");
end Locale_Da;
