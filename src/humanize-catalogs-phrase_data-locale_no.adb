separate (Humanize.Catalogs.Phrase_Data)
function Locale_No return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("no", Name, Template));
begin
   return
     P ("all_count", "alle {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "ingen {other} samsvarer")
     & P ("filtered_count.all", "alle {total} {total, plural, one {{one}} other {{other}}} samsvarer")
     & P ("filtered_count.some",
          "{matching} av {total} {total, plural, one {{one}} other {{other}}} "
          & "samsvarer")
     & P ("more_count", "{visible} vist, +{remaining} til")
     & P ("others_count",
          "{first} og {remaining, plural, one {1 annen} other {{remaining} "
          & "andre}}")
     & P ("page_count", "side {page} av {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} per side")
     & P ("pagination_range",
          "{first}–{last} av {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} av {total}")
     & P ("selection_count",
          "{selected} av {total} {total, plural, one {{one}} other {{other}}} "
          & "valgt")
     & P ("showing_count",
          "viser {showing} av {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {ingen {severity, select, error {feil} warning "
          & "{advarsler} other {merknader}}} one {1 {severity, select, error {feil} "
          & "warning {advarsel} other {merknad}}} other {{count} {severity, select, "
          & "error {feil} warning {advarsler} other {merknader}}}}")
     & P ("collection.empty", "ingen {other}")
     & P ("collection.none_shown", "ingen {other} vises")
     & P ("collection.showing_hidden",
          "viser {visible} av {total} {total, plural, one {{one}} other "
          & "{{other}}}, {hidden} skjult")
     & P ("collection.showing",
          "viser {visible} av {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} vises, "
          & "{hidden} skjules")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} vises")
     & P ("collection.visible_out_of",
          "{visible} av {total} {total, plural, one {{one}} other {{other}}} "
          & "synlige")
     & P ("complete_count", "{done} av {total} fullført")
     & P ("percent_complete", "{percent} % fullført")
     & P ("step_count", "trinn {step} av {total}")
     & P ("attempt_count", "forsøk {attempt} av {total}")
     & P ("throughput_remaining", "{remaining} igjen med {rate} {unit}/s")
     & P ("accessible_progress", "{done} av {total} fullført, {percent} prosent")
     & P ("business_days", "{days} {days, plural, one {virkedag} other {virkedager}}")
     & P ("working_hours", "{hours} {hours, plural, one {arbeidstime} other {arbeidstimer}}")
     & P ("due.overdue", "forfalt for {days} {days, plural, one {dag} other {dager}} siden")
     & P ("due.today", "forfaller i dag")
     & P ("due.tomorrow", "forfaller i morgen")
     & P ("due.in", "forfaller om {days} dager")
     & P ("calendar_difference.future", "om {difference}")
     & P ("calendar_difference.past", "for {difference} siden")
     & P ("cpu_load", "CPU-belastning {measure}")
     & P ("battery", "batteri {measure}")
     & P ("screen_size", "skjerm {measure}")
     & P ("refresh_rate", "oppdateringsfrekvens {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} prosent")
     & P ("recurrence.second", "{every, plural, one {hvert sekund} other {hvert {every}. sekund}}")
     & P ("recurrence.minute", "{every, plural, one {hvert minutt} other {hvert {every}. minutt}}")
     & P ("recurrence.hour", "{every, plural, one {hver time} other {hver {every}. time}}")
     & P ("recurrence.day", "{every, plural, one {hver dag} other {hver {every}. dag}}")
     & P ("recurrence.week", "{every, plural, one {hver uke} other {hver {every}. uke}}")
     & P ("recurrence.month", "{every, plural, one {hver måned} other {hver {every}. måned}}")
     & P ("recurrence.quarter", "{every, plural, one {hvert kvartal} other {hvert {every}. kvartal}}")
     & P ("recurrence.year", "{every, plural, one {hvert år} other {hvert {every}. år}}")
     & P ("cache_summary.empty", "hurtigbuffer: ingen forespørsler")
     & P ("cache_summary", "hurtigbuffer: {hits} treff, {misses} bom, {rate} % treffrate")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: {changed} "
          & "endret, {added} lagt til, {removed} fjernet")
     & P ("field_diff", "{field} endret fra {before} til {after}")
     & P ("field_added", "{field} lagt til som {value}")
     & P ("field_removed", "{field} fjernet (var {value})")
     & P ("field_unchanged", "{field} uendret ({value})")
     & P ("number_comparison.equal", "{current} er lik {baseline}")
     & P ("number_comparison.higher", "{current} er {quantity} høyere enn {baseline}")
     & P ("number_comparison.lower", "{current} er {quantity} lavere enn {baseline}")
     & P ("percent_comparison.equal", "{current} er lik {baseline}")
     & P ("percent_comparison.higher", "{current} er {quantity} høyere enn {baseline}")
     & P ("percent_comparison.lower", "{current} er {quantity} lavere enn {baseline}")
     & P ("file_size_comparison.same", "{current} har samme størrelse som {baseline}")
     & P ("file_size_comparison.larger", "{current} er {quantity} større enn {baseline}")
     & P ("file_size_comparison.smaller", "{current} er {quantity} mindre enn {baseline}")
     & P ("date_comparison.same", "{current} er samme dato som {baseline}")
     & P ("date_comparison.after", "{current} er {quantity} etter {baseline}")
     & P ("date_comparison.before", "{current} er {quantity} før {baseline}")
     & P ("queue_summary", "kø: {details}")
     & P ("domain_summary",
          "{domain, select, queue {kø} job {jobb} run {kjøring} cache "
          & "{hurtigbuffer} sync {synkronisering} import {import} export {eksport} "
          & "other {{domain}}} {state, select, queued {i kø} running {kjører} "
          & "waiting {venter} paused {satt på pause} complete {fullført} failed "
          & "{mislyktes} stale {utdatert} skipped {hoppet over} other {{state}}}: "
          & "{details}")
     & P ("summary.none", "ingen {other}")
     & P ("summary.completed", "{count} {count, plural, one {{one}} other {{other}}} fullført")
     & P ("summary.completed_of",
          "{count} av {total} {total, plural, one {{one}} other {{other}}} "
          & "fullført")
     & P ("summary.failed", "{count} mislyktes")
     & P ("summary.queued", "{count} {count, plural, one {{one}} other {{other}}} i kø")
     & P ("summary.running", "{count} kjører")
     & P ("summary.complete", "{count} fullført")
     & P ("backup.backup_running", "sikkerhetskopiering pågår")
     & P ("backup.backup_completed", "sikkerhetskopiering fullført")
     & P ("backup.backup_failed", "sikkerhetskopiering mislyktes")
     & P ("backup.backup_stale", "sikkerhetskopi utdatert")
     & P ("incident.incident_investigating", "hendelse undersøkes")
     & P ("incident.incident_identified", "hendelse identifisert")
     & P ("incident.incident_mitigated", "hendelse begrenset")
     & P ("incident.incident_resolved", "hendelse løst")
     & P ("release.release_drafting", "utgivelse under forberedelse")
     & P ("release.release_ready", "utgivelse klar")
     & P ("release.release_published", "utgivelse publisert")
     & P ("release.release_rolled_back", "utgivelse rullet tilbake")
     & P ("audit.audit_created", "revisjonsoppføring opprettet")
     & P ("audit.audit_updated", "revisjonsoppføring oppdatert")
     & P ("audit.audit_deleted", "revisjonsoppføring slettet")
     & P ("audit.audit_restored", "revisjonsoppføring gjenopprettet")
     & P ("feature_flag.flag_enabled", "funksjonsflagg aktivert")
     & P ("feature_flag.flag_disabled", "funksjonsflagg deaktivert")
     & P ("feature_flag.flag_rolling_out", "funksjonsflagg rulles ut")
     & P ("feature_flag.flag_rolled_back", "funksjonsflagg rullet tilbake")
     & P ("webhook.webhook_pending", "webhook venter")
     & P ("webhook.webhook_delivered", "webhook levert")
     & P ("webhook.webhook_failed", "webhook mislyktes")
     & P ("webhook.webhook_retrying", "webhook prøves på nytt")
     & P ("api_key.api_key_active", "API-nøkkel aktiv")
     & P ("api_key.api_key_revoked", "API-nøkkel tilbakekalt")
     & P ("api_key.api_key_expired", "API-nøkkel utløpt")
     & P ("api_key.api_key_rotated", "API-nøkkel rotert")
     & P ("quota.quota_available", "kvote tilgjengelig")
     & P ("quota.quota_near_limit", "kvote nesten brukt opp")
     & P ("quota.quota_exceeded", "kvote overskredet")
     & P ("quota.quota_reset", "kvote tilbakestilt")
     & P ("invoice.invoice_draft", "fakturautkast")
     & P ("invoice.invoice_sent", "faktura sendt")
     & P ("invoice.invoice_paid", "faktura betalt")
     & P ("invoice.invoice_refunded", "faktura refundert")
     & P ("invoice.invoice_overdue", "faktura forfalt")
     & P ("invoice.refund_failed", "refusjon mislyktes")
     & P ("page_navigation.only", "eneste side")
     & P ("page_navigation.first", "første side, neste tilgjengelig")
     & P ("page_navigation.last", "siste side, forrige tilgjengelig")
     & P ("page_navigation.middle", "forrige og neste tilgjengelig")
     & P ("end_of_week", "slutten av uken")
     & P ("end_of_month", "slutten av måneden")
     & P ("end_of_quarter", "slutten av kvartalet")
     & P ("time_of_day.night", "natt")
     & P ("time_of_day.morning", "morgen")
     & P ("time_of_day.afternoon", "ettermiddag")
     & P ("time_of_day.evening", "kveld")
     & P ("calendar_difference.same_day", "samme dag")
     & P ("calendar_difference.zero", "0 dager")
     & P ("queue_summary.empty", "køen er tom");
end Locale_No;
