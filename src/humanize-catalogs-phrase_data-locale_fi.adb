separate (Humanize.Catalogs.Phrase_Data)
function Locale_Fi return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("fi", Name, Template));
begin
   return
     P ("all_count", "kaikki {total, plural, one {{one}} other {{other}}} ({total})")
     & P ("filtered_count.none", "{other}: ei osumia")
     & P ("filtered_count.all",
          "{total, plural, one {{one}: 1/1 vastaa} other {{other}: kaikki {total} "
          & "vastaavat}}")
     & P ("filtered_count.some",
          "{total, plural, one {{one}} other {{other}}}: {matching}/{total} "
          & "vastaa")
     & P ("more_count", "{visible} näkyvissä, +{remaining} lisää")
     & P ("others_count", "{first} ja {remaining, plural, one {1 muu} other {{remaining} muuta}}")
     & P ("page_count", "sivu {page}/{total}")
     & P ("page_size", "{size, plural, one {{one}} other {{other}}}: {size} sivua kohden")
     & P ("pagination_range",
          "{first}–{last}/{total} ({total, plural, one {{one}} other "
          & "{{other}}})")
     & P ("position_count", "{position}/{total}")
     & P ("selection_count",
          "{total, plural, one {{one}} other {{other}}}: {selected}/{total} "
          & "valittu")
     & P ("showing_count",
          "näytetään {showing}/{total} ({total, plural, one {{one}} other "
          & "{{other}}})")
     & P ("validation_count",
          "{count, plural, =0 {ei {severity, select, error {virheitä} warning "
          & "{varoituksia} other {huomautuksia}}} one {{count} {severity, select, "
          & "error {virhe} warning {varoitus} other {huomautus}}} other {{count} "
          & "{severity, select, error {virhettä} warning {varoitusta} other "
          & "{huomautusta}}}}")
     & P ("collection.empty", "{other}: ei yhtään")
     & P ("collection.none_shown", "{other}: ei yhtään näkyvissä")
     & P ("collection.showing_hidden",
          "näytetään {visible}/{total} ({total, plural, one {{one}} other "
          & "{{other}}}), {hidden} piilotettu")
     & P ("collection.showing",
          "näytetään {visible}/{total} ({total, plural, one {{one}} other "
          & "{{other}}})")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{one}} other {{other}}}: {visible} näkyvissä, "
          & "{hidden} piilotettu")
     & P ("collection.shown", "{visible, plural, one {{one}} other {{other}}}: {visible} näkyvissä")
     & P ("collection.visible_out_of",
          "{total, plural, one {{one}} other {{other}}}: {visible}/{total} "
          & "näkyvissä")
     & P ("complete_count", "{done}/{total} valmiina")
     & P ("percent_complete", "{percent} % valmiina")
     & P ("step_count", "vaihe {step}/{total}")
     & P ("attempt_count", "yritys {attempt}/{total}")
     & P ("throughput_remaining", "jäljellä {remaining} ({unit}), {rate} {unit}/s")
     & P ("accessible_progress", "{done}/{total} valmiina, {percent} prosenttia")
     & P ("business_days", "{days, plural, one {{days} arkipäivä} other {{days} arkipäivää}}")
     & P ("working_hours", "{hours, plural, one {{hours} työtunti} other {{hours} työtuntia}}")
     & P ("due.overdue",
          "myöhässä {days, plural, one {{days} päivä} other {{days} "
          & "päivää}}")
     & P ("due.today", "erääntyy tänään")
     & P ("due.tomorrow", "erääntyy huomenna")
     & P ("due.in", "erääntyy {days} päivän kuluttua")
     & P ("calendar_difference.future", "{difference} kuluttua")
     & P ("calendar_difference.past", "{difference} sitten")
     & P ("calendar_difference.same_day", "samana päivänä")
     & P ("calendar_difference.zero", "0 päivää")
     & P ("cpu_load", "suoritinkuorma {measure}")
     & P ("battery", "akku {measure}")
     & P ("screen_size", "näyttö {measure}")
     & P ("refresh_rate", "virkistystaajuus {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} prosenttia")
     & P ("recurrence.second", "{every, plural, one {joka sekunti} other {{every} sekunnin välein}}")
     & P ("recurrence.minute", "{every, plural, one {joka minuutti} other {{every} minuutin välein}}")
     & P ("recurrence.hour", "{every, plural, one {joka tunti} other {{every} tunnin välein}}")
     & P ("recurrence.day", "{every, plural, one {joka päivä} other {{every} päivän välein}}")
     & P ("recurrence.week", "{every, plural, one {joka viikko} other {{every} viikon välein}}")
     & P ("recurrence.month", "{every, plural, one {joka kuukausi} other {{every} kuukauden välein}}")
     & P ("recurrence.quarter",
          "{every, plural, one {joka vuosineljännes} other {{every} "
          & "vuosineljänneksen välein}}")
     & P ("recurrence.year", "{every, plural, one {joka vuosi} other {{every} vuoden välein}}")
     & P ("cache_summary.empty", "välimuisti: ei pyyntöjä")
     & P ("cache_summary",
          "välimuisti: {hits} {hits, plural, one {osuma} other {osumaa}}, "
          & "{misses} {misses, plural, one {huti} other {hutia}}, osumaprosentti "
          & "{rate} %")
     & P ("field_change_summary",
          "{total, plural, one {{one}} other {{other}}} ({total}): {changed} "
          & "muutettu, {added} lisätty, {removed} poistettu")
     & P ("field_diff", "{field} muutettu: {before} → {after}")
     & P ("field_added", "{field} lisätty: {value}")
     & P ("field_removed", "{field} poistettu (oli {value})")
     & P ("field_unchanged", "{field} ennallaan: {value}")
     & P ("number_comparison.equal", "{current} on yhtä suuri kuin {baseline}")
     & P ("number_comparison.higher", "{current} on {quantity} suurempi kuin {baseline}")
     & P ("number_comparison.lower", "{current} on {quantity} pienempi kuin {baseline}")
     & P ("percent_comparison.equal", "{current} on yhtä suuri kuin {baseline}")
     & P ("percent_comparison.higher", "{current} on {quantity} suurempi kuin {baseline}")
     & P ("percent_comparison.lower", "{current} on {quantity} pienempi kuin {baseline}")
     & P ("file_size_comparison.same", "{current} on samankokoinen kuin {baseline}")
     & P ("file_size_comparison.larger", "{current} on {quantity} suurempi kuin {baseline}")
     & P ("file_size_comparison.smaller", "{current} on {quantity} pienempi kuin {baseline}")
     & P ("date_comparison.same", "{current} on sama päivämäärä kuin {baseline}")
     & P ("date_comparison.after", "{current} on {quantity} myöhemmin kuin {baseline}")
     & P ("date_comparison.before", "{current} on {quantity} aiemmin kuin {baseline}")
     & P ("queue_summary", "jono: {details}")
     & P ("queue_summary.empty", "jono tyhjä")
     & P ("domain_summary",
          "{domain, select, queue {jono} job {työ} run {ajo} cache {välimuisti} "
          & "sync {synkronointi} import {tuonti} export {vienti} other {{domain}}} "
          & "{state, select, queued {jonossa} running {käynnissä} waiting "
          & "{odottaa} paused {keskeytetty} complete {valmis} failed {epäonnistui} "
          & "stale {vanhentunut} skipped {ohitettu} other {{state}}}: {details}")
     & P ("summary.none", "{other}: ei yhtään")
     & P ("summary.completed", "{count, plural, one {{one}} other {{other}}}: {count} valmiina")
     & P ("summary.completed_of", "{total, plural, one {{one}} other {{other}}}: {count}/{total} valmiina")
     & P ("summary.failed", "{count} epäonnistui")
     & P ("summary.queued", "{count, plural, one {{one}} other {{other}}}: {count} jonossa")
     & P ("summary.running", "{count} käynnissä")
     & P ("summary.complete", "{count} valmiina")
     & P ("backup.backup_running", "varmuuskopiointi käynnissä")
     & P ("backup.backup_completed", "varmuuskopiointi valmis")
     & P ("backup.backup_failed", "varmuuskopiointi epäonnistui")
     & P ("backup.backup_stale", "varmuuskopio vanhentunut")
     & P ("incident.incident_investigating", "häiriötä tutkitaan")
     & P ("incident.incident_identified", "häiriö tunnistettu")
     & P ("incident.incident_mitigated", "häiriötä lievennetty")
     & P ("incident.incident_resolved", "häiriö ratkaistu")
     & P ("release.release_drafting", "versiota valmistellaan")
     & P ("release.release_ready", "versio valmis")
     & P ("release.release_published", "versio julkaistu")
     & P ("release.release_rolled_back", "versio peruttu")
     & P ("audit.audit_created", "tarkastusmerkintä luotu")
     & P ("audit.audit_updated", "tarkastusmerkintä päivitetty")
     & P ("audit.audit_deleted", "tarkastusmerkintä poistettu")
     & P ("audit.audit_restored", "tarkastusmerkintä palautettu")
     & P ("feature_flag.flag_enabled", "ominaisuuslippu otettu käyttöön")
     & P ("feature_flag.flag_disabled", "ominaisuuslippu poistettu käytöstä")
     & P ("feature_flag.flag_rolling_out", "ominaisuuslippua otetaan käyttöön vaiheittain")
     & P ("feature_flag.flag_rolled_back", "ominaisuuslippu peruttu")
     & P ("webhook.webhook_pending", "webhook odottaa")
     & P ("webhook.webhook_delivered", "webhook toimitettu")
     & P ("webhook.webhook_failed", "webhook epäonnistui")
     & P ("webhook.webhook_retrying", "webhookia yritetään uudelleen")
     & P ("api_key.api_key_active", "API-avain aktiivinen")
     & P ("api_key.api_key_revoked", "API-avain peruttu")
     & P ("api_key.api_key_expired", "API-avain vanhentunut")
     & P ("api_key.api_key_rotated", "API-avain vaihdettu")
     & P ("quota.quota_available", "kiintiötä jäljellä")
     & P ("quota.quota_near_limit", "kiintiö lähes täynnä")
     & P ("quota.quota_exceeded", "kiintiö ylitetty")
     & P ("quota.quota_reset", "kiintiö nollattu")
     & P ("invoice.invoice_draft", "laskuluonnos")
     & P ("invoice.invoice_sent", "lasku lähetetty")
     & P ("invoice.invoice_paid", "lasku maksettu")
     & P ("invoice.invoice_refunded", "lasku hyvitetty")
     & P ("invoice.invoice_overdue", "lasku erääntynyt")
     & P ("invoice.refund_failed", "hyvitys epäonnistui")
     & P ("page_navigation.only", "ainoa sivu")
     & P ("page_navigation.first", "ensimmäinen sivu, seuraava saatavilla")
     & P ("page_navigation.last", "viimeinen sivu, edellinen saatavilla")
     & P ("page_navigation.middle", "edellinen ja seuraava saatavilla")
     & P ("end_of_week", "viikon loppu")
     & P ("end_of_month", "kuukauden loppu")
     & P ("end_of_quarter", "vuosineljänneksen loppu")
     & P ("time_of_day.night", "yö")
     & P ("time_of_day.morning", "aamu")
     & P ("time_of_day.afternoon", "iltapäivä")
     & P ("time_of_day.evening", "ilta");
end Locale_Fi;
