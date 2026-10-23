separate (Humanize.Catalogs.Phrase_Data)
function Locale_Sw return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("sw", Name, Template));
begin
   return
     P ("all_count", "jumla: {total, plural, one {{one}} other {{other}}} {total}")
     & P ("filtered_count.none", "hakuna {other} zinazolingana")
     & P ("filtered_count.all", "{total, plural, one {{one}} other {{other}}} zote {total} zinalingana")
     & P ("filtered_count.some",
          "{matching} kati ya {total, plural, one {{one}} other {{other}}} "
          & "{total} zinalingana")
     & P ("more_count", "{visible} zinaonyeshwa, +{remaining} zaidi")
     & P ("others_count",
          "{first} na {remaining, plural, one {1 zaidi} other {{remaining} "
          & "zaidi}}")
     & P ("page_count", "ukurasa {page} kati ya {total}")
     & P ("page_size", "{size, plural, one {{one}} other {{other}}} {size} kwa kila ukurasa")
     & P ("pagination_range",
          "{first}–{last} kati ya {total, plural, one {{one}} other {{other}}} "
          & "{total}")
     & P ("position_count", "{position} kati ya {total}")
     & P ("selection_count",
          "umechagua {selected} kati ya {total, plural, one {{one}} other "
          & "{{other}}} {total}")
     & P ("showing_count",
          "inaonyesha {showing} kati ya {total, plural, one {{one}} other "
          & "{{other}}} {total}")
     & P ("validation_count",
          "{count, plural, =0 {hakuna {severity, select, error {hitilafu} warning "
          & "{maonyo} other {taarifa}}} one {{severity, select, error {hitilafu 1} "
          & "warning {onyo 1} other {taarifa 1}}} other {{severity, select, error "
          & "{hitilafu} warning {maonyo} other {taarifa}} {count}}}")
     & P ("collection.empty", "hakuna {other}")
     & P ("collection.none_shown", "hakuna {other} zinazoonyeshwa")
     & P ("collection.showing_hidden",
          "inaonyesha {visible} kati ya {total, plural, one {{one}} other "
          & "{{other}}} {total}, {hidden} zimefichwa")
     & P ("collection.showing",
          "inaonyesha {visible} kati ya {total, plural, one {{one}} other "
          & "{{other}}} {total}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{one}} other {{other}}} {visible} zinaonyeshwa, "
          & "{hidden} zimefichwa")
     & P ("collection.shown", "{visible, plural, one {{one}} other {{other}}} {visible} zinaonyeshwa")
     & P ("collection.visible_out_of",
          "{visible} zinaonekana kati ya {total, plural, one {{one}} other "
          & "{{other}}} {total}")
     & P ("complete_count", "{done} kati ya {total} zimekamilika")
     & P ("percent_complete", "{percent}% imekamilika")
     & P ("step_count", "hatua {step} kati ya {total}")
     & P ("attempt_count", "jaribio {attempt} kati ya {total}")
     & P ("throughput_remaining", "zimebaki {unit} {remaining} kwa kasi ya {rate} {unit}/s")
     & P ("accessible_progress", "{done} kati ya {total} zimekamilika, asilimia {percent}")
     & P ("business_days", "siku {days} za kazi")
     & P ("working_hours", "saa {hours} za kazi")
     & P ("due.overdue", "imechelewa siku {days}")
     & P ("due.today", "mwisho ni leo")
     & P ("due.tomorrow", "mwisho ni kesho")
     & P ("due.in", "mwisho ni baada ya siku {days}")
     & P ("calendar_difference.future", "baada ya {difference}")
     & P ("calendar_difference.past", "{difference} nyuma")
     & P ("calendar_difference.same_day", "siku hiyo hiyo")
     & P ("calendar_difference.zero", "siku 0")
     & P ("cpu_load", "matumizi ya CPU: {measure}")
     & P ("battery", "betri: {measure}")
     & P ("screen_size", "skrini: {measure}")
     & P ("refresh_rate", "kasi ya kuonyesha upya: {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "asilimia {value}")
     & P ("recurrence.second", "{every, plural, one {kila sekunde} other {kila sekunde {every}}}")
     & P ("recurrence.minute", "{every, plural, one {kila dakika} other {kila dakika {every}}}")
     & P ("recurrence.hour", "{every, plural, one {kila saa} other {kila saa {every}}}")
     & P ("recurrence.day", "{every, plural, one {kila siku} other {kila siku {every}}}")
     & P ("recurrence.week", "{every, plural, one {kila wiki} other {kila wiki {every}}}")
     & P ("recurrence.month", "{every, plural, one {kila mwezi} other {kila miezi {every}}}")
     & P ("recurrence.quarter", "{every, plural, one {kila robo mwaka} other {kila robo mwaka {every}}}")
     & P ("recurrence.year", "{every, plural, one {kila mwaka} other {kila miaka {every}}}")
     & P ("cache_summary.empty", "akiba: hakuna maombi")
     & P ("cache_summary",
          "akiba: zilizopatikana {hits}, zilizokosekana {misses}, kiwango cha "
          & "upatikanaji {rate}%")
     & P ("field_change_summary",
          "{total, plural, one {{one}} other {{other}}} {total}: {changed} "
          & "zimebadilishwa, {added} zimeongezwa, {removed} zimeondolewa")
     & P ("field_diff", "{field} imebadilishwa kutoka {before} hadi {after}")
     & P ("field_added", "{field} imeongezwa kama {value}")
     & P ("field_removed", "{field} imeondolewa (ilikuwa {value})")
     & P ("field_unchanged", "{field} haijabadilika: {value}")
     & P ("number_comparison.equal", "{current} ni sawa na {baseline}")
     & P ("number_comparison.higher", "{current} ni juu kwa {quantity} kuliko {baseline}")
     & P ("number_comparison.lower", "{current} ni chini kwa {quantity} kuliko {baseline}")
     & P ("percent_comparison.equal", "{current} ni sawa na {baseline}")
     & P ("percent_comparison.higher", "{current} ni juu kwa {quantity} kuliko {baseline}")
     & P ("percent_comparison.lower", "{current} ni chini kwa {quantity} kuliko {baseline}")
     & P ("file_size_comparison.same", "{current} ina ukubwa sawa na {baseline}")
     & P ("file_size_comparison.larger", "{current} ni kubwa kwa {quantity} kuliko {baseline}")
     & P ("file_size_comparison.smaller", "{current} ni ndogo kwa {quantity} kuliko {baseline}")
     & P ("date_comparison.same", "{current} ni tarehe sawa na {baseline}")
     & P ("date_comparison.after", "{current} ni {quantity} baada ya {baseline}")
     & P ("date_comparison.before", "{current} ni {quantity} kabla ya {baseline}")
     & P ("queue_summary", "foleni: {details}")
     & P ("queue_summary.empty", "foleni ni tupu")
     & P ("domain_summary",
          "{domain, select, queue {foleni} job {kazi} run {utekelezaji} cache "
          & "{akiba} sync {usawazishaji} import {uingizaji} export {uhamishaji} "
          & "other {{domain}}} – {state, select, queued {kwenye foleni} running "
          & "{inaendelea} waiting {inasubiri} paused {imesitishwa} complete "
          & "{imekamilika} failed {imeshindwa} stale {imepitwa na wakati} skipped "
          & "{imerukwa} other {{state}}}: {details}")
     & P ("summary.none", "hakuna {other}")
     & P ("summary.completed", "{count, plural, one {{one}} other {{other}}} {count} zimekamilika")
     & P ("summary.completed_of",
          "{count} kati ya {total, plural, one {{one}} other {{other}}} {total} "
          & "zimekamilika")
     & P ("summary.failed", "{count} zimeshindwa")
     & P ("summary.queued", "{count, plural, one {{one}} other {{other}}} {count} kwenye foleni")
     & P ("summary.running", "{count} zinaendelea")
     & P ("summary.complete", "{count} zimekamilika")
     & P ("backup.backup_running", "hifadhi rudufu inaendelea")
     & P ("backup.backup_completed", "hifadhi rudufu imekamilika")
     & P ("backup.backup_failed", "hifadhi rudufu imeshindwa")
     & P ("backup.backup_stale", "hifadhi rudufu imepitwa na wakati")
     & P ("incident.incident_investigating", "tukio linachunguzwa")
     & P ("incident.incident_identified", "tukio limetambuliwa")
     & P ("incident.incident_mitigated", "tukio limedhibitiwa")
     & P ("incident.incident_resolved", "tukio limetatuliwa")
     & P ("release.release_drafting", "toleo linaandaliwa")
     & P ("release.release_ready", "toleo liko tayari")
     & P ("release.release_published", "toleo limechapishwa")
     & P ("release.release_rolled_back", "toleo limerejeshwa nyuma")
     & P ("audit.audit_created", "ingizo la ukaguzi limeundwa")
     & P ("audit.audit_updated", "ingizo la ukaguzi limesasishwa")
     & P ("audit.audit_deleted", "ingizo la ukaguzi limefutwa")
     & P ("audit.audit_restored", "ingizo la ukaguzi limerejeshwa")
     & P ("feature_flag.flag_enabled", "alama ya kipengele imewashwa")
     & P ("feature_flag.flag_disabled", "alama ya kipengele imezimwa")
     & P ("feature_flag.flag_rolling_out", "alama ya kipengele inasambazwa")
     & P ("feature_flag.flag_rolled_back", "alama ya kipengele imerejeshwa nyuma")
     & P ("webhook.webhook_pending", "webhook inasubiri")
     & P ("webhook.webhook_delivered", "webhook imewasilishwa")
     & P ("webhook.webhook_failed", "webhook imeshindwa")
     & P ("webhook.webhook_retrying", "webhook inajaribiwa tena")
     & P ("api_key.api_key_active", "ufunguo wa API unatumika")
     & P ("api_key.api_key_revoked", "ufunguo wa API umebatilishwa")
     & P ("api_key.api_key_expired", "muda wa ufunguo wa API umeisha")
     & P ("api_key.api_key_rotated", "ufunguo wa API umebadilishwa")
     & P ("quota.quota_available", "mgao unapatikana")
     & P ("quota.quota_near_limit", "mgao unakaribia kikomo")
     & P ("quota.quota_exceeded", "mgao umezidishwa")
     & P ("quota.quota_reset", "mgao umewekwa upya")
     & P ("invoice.invoice_draft", "rasimu ya ankara")
     & P ("invoice.invoice_sent", "ankara imetumwa")
     & P ("invoice.invoice_paid", "ankara imelipwa")
     & P ("invoice.invoice_refunded", "pesa za ankara zimerejeshwa")
     & P ("invoice.invoice_overdue", "ankara imechelewa")
     & P ("invoice.refund_failed", "urejeshaji wa pesa umeshindwa")
     & P ("page_navigation.only", "ukurasa pekee")
     & P ("page_navigation.first", "ukurasa wa kwanza, unaofuata unapatikana")
     & P ("page_navigation.last", "ukurasa wa mwisho, uliotangulia unapatikana")
     & P ("page_navigation.middle", "uliotangulia na unaofuata vinapatikana")
     & P ("end_of_week", "mwisho wa wiki")
     & P ("end_of_month", "mwisho wa mwezi")
     & P ("end_of_quarter", "mwisho wa robo mwaka")
     & P ("time_of_day.night", "usiku")
     & P ("time_of_day.morning", "asubuhi")
     & P ("time_of_day.afternoon", "mchana")
     & P ("time_of_day.evening", "jioni");
end Locale_Sw;
