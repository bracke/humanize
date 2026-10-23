separate (Humanize.Catalogs.Phrase_Data)
function Locale_Eo return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("eo", Name, Template));
begin
   return
     P ("all_count", "ĉiuj {total} {total, plural, one {{one}} other {{other}}}")
     & P ("filtered_count.none", "neniuj kongruaj {other}")
     & P ("filtered_count.all", "ĉiuj {total} {total, plural, one {{one}} other {{other}}} kongruas")
     & P ("filtered_count.some",
          "{matching} el {total} {total, plural, one {{one}} other {{other}}} "
          & "kongruas")
     & P ("more_count", "montriĝas {visible}, +{remaining} pliaj")
     & P ("others_count",
          "{first} kaj {remaining, plural, one {1 alia} other {{remaining} "
          & "aliaj}}")
     & P ("page_count", "paĝo {page} el {total}")
     & P ("page_size", "{size} {size, plural, one {{one}} other {{other}}} po paĝo")
     & P ("pagination_range",
          "{first}–{last} el {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("position_count", "{position} el {total}")
     & P ("selection_count",
          "{selected} el {total} {total, plural, one {{one}} other {{other}}} "
          & "{selected, plural, one {elektita} other {elektitaj}}")
     & P ("showing_count",
          "montriĝas {showing} el {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {neniuj {severity, select, error {eraroj} warning "
          & "{avertoj} other {sciigoj}}} one {1 {severity, select, error {eraro} "
          & "warning {averto} other {sciigo}}} other {{count} {severity, select, "
          & "error {eraroj} warning {avertoj} other {sciigoj}}}}")
     & P ("collection.empty", "neniuj {other}")
     & P ("collection.none_shown", "neniuj {other} montriĝas")
     & P ("collection.showing_hidden",
          "montriĝas {visible} el {total} {total, plural, one {{one}} other "
          & "{{other}}}, {hidden} {hidden, plural, one {kaŝita} other {kaŝitaj}}")
     & P ("collection.showing",
          "montriĝas {visible} el {total} {total, plural, one {{one}} other "
          & "{{other}}}")
     & P ("collection.shown_hidden",
          "{visible} {visible, plural, one {{one}} other {{other}}} montriĝas, "
          & "{hidden} {hidden, plural, one {kaŝita} other {kaŝitaj}}")
     & P ("collection.shown", "{visible} {visible, plural, one {{one}} other {{other}}} montriĝas")
     & P ("collection.visible_out_of",
          "{visible} el {total} {total, plural, one {{one}} other {{other}}} "
          & "videblas")
     & P ("complete_count", "{done} el {total} pretas")
     & P ("percent_complete", "{percent} % finita")
     & P ("step_count", "paŝo {step} el {total}")
     & P ("attempt_count", "provo {attempt} el {total}")
     & P ("throughput_remaining", "restas {remaining} {unit} je {rate} {unit}/s")
     & P ("accessible_progress", "{done} el {total} pretas, {percent} procentoj")
     & P ("business_days", "{days} {days, plural, one {labortago} other {labortagoj}}")
     & P ("working_hours", "{hours} {hours, plural, one {laborhoro} other {laborhoroj}}")
     & P ("due.overdue", "malfruas je {days} {days, plural, one {tago} other {tagoj}}")
     & P ("due.today", "limdato hodiaŭ")
     & P ("due.tomorrow", "limdato morgaŭ")
     & P ("due.in", "limdato post {days} tagoj")
     & P ("calendar_difference.future", "post {difference}")
     & P ("calendar_difference.past", "antaŭ {difference}")
     & P ("calendar_difference.same_day", "la sama tago")
     & P ("calendar_difference.zero", "0 tagoj")
     & P ("cpu_load", "CPU-ŝarĝo {measure}")
     & P ("battery", "baterio {measure}")
     & P ("screen_size", "ekrano {measure}")
     & P ("refresh_rate", "refreŝiga frekvenco {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} procentoj")
     & P ("recurrence.second", "{every, plural, one {ĉiun sekundon} other {ĉiujn {every} sekundojn}}")
     & P ("recurrence.minute", "{every, plural, one {ĉiun minuton} other {ĉiujn {every} minutojn}}")
     & P ("recurrence.hour", "{every, plural, one {ĉiun horon} other {ĉiujn {every} horojn}}")
     & P ("recurrence.day", "{every, plural, one {ĉiun tagon} other {ĉiujn {every} tagojn}}")
     & P ("recurrence.week", "{every, plural, one {ĉiun semajnon} other {ĉiujn {every} semajnojn}}")
     & P ("recurrence.month", "{every, plural, one {ĉiun monaton} other {ĉiujn {every} monatojn}}")
     & P ("recurrence.quarter",
          "{every, plural, one {ĉiun jarkvaronon} other {ĉiujn {every} "
          & "jarkvaronojn}}")
     & P ("recurrence.year", "{every, plural, one {ĉiun jaron} other {ĉiujn {every} jarojn}}")
     & P ("cache_summary.empty", "kaŝmemoro: neniuj petoj")
     & P ("cache_summary",
          "kaŝmemoro: {hits} {hits, plural, one {trafo} other {trafoj}}, "
          & "{misses} {misses, plural, one {maltrafo} other {maltrafoj}}, "
          & "trafoproporcio {rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} other {{other}}}: ŝanĝitaj "
          & "{changed}, aldonitaj {added}, forigitaj {removed}")
     & P ("field_diff", "{field} ŝanĝiĝis de {before} al {after}")
     & P ("field_added", "{field} aldoniĝis kun valoro {value}")
     & P ("field_removed", "{field} foriĝis (estis {value})")
     & P ("field_unchanged", "{field} restas senŝanĝe {value}")
     & P ("number_comparison.equal", "{current} egalas al {baseline}")
     & P ("number_comparison.higher", "{current} estas je {quantity} pli granda ol {baseline}")
     & P ("number_comparison.lower", "{current} estas je {quantity} pli malgranda ol {baseline}")
     & P ("percent_comparison.equal", "{current} egalas al {baseline}")
     & P ("percent_comparison.higher", "{current} estas je {quantity} pli alta ol {baseline}")
     & P ("percent_comparison.lower", "{current} estas je {quantity} pli malalta ol {baseline}")
     & P ("file_size_comparison.same", "{current} estas same granda kiel {baseline}")
     & P ("file_size_comparison.larger", "{current} estas je {quantity} pli granda ol {baseline}")
     & P ("file_size_comparison.smaller", "{current} estas je {quantity} pli malgranda ol {baseline}")
     & P ("date_comparison.same", "{current} estas la sama dato kiel {baseline}")
     & P ("date_comparison.after", "{current} estas {quantity} post {baseline}")
     & P ("date_comparison.before", "{current} estas {quantity} antaŭ {baseline}")
     & P ("queue_summary", "vico: {details}")
     & P ("queue_summary.empty", "vico malplena")
     & P ("domain_summary",
          "{domain, select, queue {vico} job {tasko} run {rulo} cache "
          & "{kaŝmemoro} sync {sinkronigo} import {importo} export {eksporto} "
          & "other {{domain}}} {state, select, queued {envicigita} running {rulas} "
          & "waiting {atendas} paused {paŭzigita} complete {finita} failed "
          & "{malsukcesis} stale {malaktuala} skipped {preterlasita} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "neniuj {other}")
     & P ("summary.completed",
          "{count} {count, plural, one {{one}} other {{other}}} {count, plural, "
          & "one {finita} other {finitaj}}")
     & P ("summary.completed_of",
          "{count} el {total} {total, plural, one {{one}} other {{other}}} "
          & "{count, plural, one {finita} other {finitaj}}")
     & P ("summary.failed", "{count} malsukcesis")
     & P ("summary.queued",
          "{count} {count, plural, one {{one}} other {{other}}} {count, plural, "
          & "one {envicigita} other {envicigitaj}}")
     & P ("summary.running", "{count} rulas")
     & P ("summary.complete", "{count} pretas")
     & P ("backup.backup_running", "savkopiado rulas")
     & P ("backup.backup_completed", "savkopio finita")
     & P ("backup.backup_failed", "savkopio malsukcesis")
     & P ("backup.backup_stale", "savkopio malaktuala")
     & P ("incident.incident_investigating", "incidento esplorata")
     & P ("incident.incident_identified", "incidento identigita")
     & P ("incident.incident_mitigated", "incidento mildigita")
     & P ("incident.incident_resolved", "incidento solvita")
     & P ("release.release_drafting", "eldono preparata")
     & P ("release.release_ready", "eldono preta")
     & P ("release.release_published", "eldono publikigita")
     & P ("release.release_rolled_back", "eldono malfarita")
     & P ("audit.audit_created", "revizia registraĵo kreita")
     & P ("audit.audit_updated", "revizia registraĵo ĝisdatigita")
     & P ("audit.audit_deleted", "revizia registraĵo forigita")
     & P ("audit.audit_restored", "revizia registraĵo restarigita")
     & P ("feature_flag.flag_enabled", "funkcia flago ŝaltita")
     & P ("feature_flag.flag_disabled", "funkcia flago malŝaltita")
     & P ("feature_flag.flag_rolling_out", "funkcia flago disvastiĝas")
     & P ("feature_flag.flag_rolled_back", "funkcia flago malfarita")
     & P ("webhook.webhook_pending", "retkroĉilo atendas")
     & P ("webhook.webhook_delivered", "retkroĉilo liverita")
     & P ("webhook.webhook_failed", "retkroĉilo malsukcesis")
     & P ("webhook.webhook_retrying", "retkroĉilo reprovata")
     & P ("api_key.api_key_active", "API-ŝlosilo aktiva")
     & P ("api_key.api_key_revoked", "API-ŝlosilo revokita")
     & P ("api_key.api_key_expired", "API-ŝlosilo eksvalidiĝis")
     & P ("api_key.api_key_rotated", "API-ŝlosilo anstataŭigita")
     & P ("quota.quota_available", "kvoto disponebla")
     & P ("quota.quota_near_limit", "kvoto preskaŭ atingita")
     & P ("quota.quota_exceeded", "kvoto superita")
     & P ("quota.quota_reset", "kvoto restarigita")
     & P ("invoice.invoice_draft", "fakturmalneto")
     & P ("invoice.invoice_sent", "fakturo sendita")
     & P ("invoice.invoice_paid", "fakturo pagita")
     & P ("invoice.invoice_refunded", "fakturo repagita")
     & P ("invoice.invoice_overdue", "fakturo malfruas")
     & P ("invoice.refund_failed", "repago malsukcesis")
     & P ("page_navigation.only", "sola paĝo")
     & P ("page_navigation.first", "unua paĝo, sekva disponebla")
     & P ("page_navigation.last", "lasta paĝo, antaŭa disponebla")
     & P ("page_navigation.middle", "antaŭa kaj sekva disponeblaj")
     & P ("end_of_week", "fino de la semajno")
     & P ("end_of_month", "fino de la monato")
     & P ("end_of_quarter", "fino de la jarkvarono")
     & P ("time_of_day.night", "nokto")
     & P ("time_of_day.morning", "mateno")
     & P ("time_of_day.afternoon", "posttagmezo")
     & P ("time_of_day.evening", "vespero");
end Locale_Eo;
