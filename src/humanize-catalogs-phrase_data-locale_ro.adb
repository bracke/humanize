separate (Humanize.Catalogs.Phrase_Data)
function Locale_Ro return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("ro", Name, Template));
begin
   return
     P ("all_count",
          "{total} {total, plural, one {{one}} few {{other}} other {de {other}}} "
          & "în total")
     & P ("filtered_count.none", "{other}: nicio potrivire")
     & P ("filtered_count.all",
          "{total} din {total} {total, plural, one {{one}} few {{other}} other "
          & "{de {other}}} {total, plural, one {corespunde} other {corespund}}")
     & P ("filtered_count.some",
          "{matching} din {total} {total, plural, one {{one}} few {{other}} other "
          & "{de {other}}} {matching, plural, one {corespunde} other {corespund}}")
     & P ("more_count", "se afișează {visible}, încă {remaining}")
     & P ("others_count", "{first} și încă {remaining}")
     & P ("page_count", "pagina {page} din {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{other}} other {de {other}}} pe "
          & "pagină")
     & P ("pagination_range",
          "{first}–{last} din {total} {total, plural, one {{one}} few {{other}} "
          & "other {de {other}}}")
     & P ("position_count", "{position} din {total}")
     & P ("selection_count",
          "{selected, plural, one {s-a selectat} other {s-au selectat}} "
          & "{selected} din {total} {total, plural, one {{one}} few {{other}} other "
          & "{de {other}}}")
     & P ("showing_count",
          "se afișează {showing} din {total} {total, plural, one {{one}} few "
          & "{{other}} other {de {other}}}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {nicio eroare} warning "
          & "{niciun avertisment} other {nicio notificare}}} one {1 {severity, "
          & "select, error {eroare} warning {avertisment} other {notificare}}} few "
          & "{{count} {severity, select, error {erori} warning {avertismente} other "
          & "{notificări}}} other {{count} de {severity, select, error {erori} "
          & "warning {avertismente} other {notificări}}}}")
     & P ("collection.empty", "nu există {other}")
     & P ("collection.none_shown", "nu se afișează {other}")
     & P ("collection.showing_hidden",
          "se afișează {visible} din {total} {total, plural, one {{one}} few "
          & "{{other}} other {de {other}}}, ascunse: {hidden}")
     & P ("collection.showing",
          "se afișează {visible} din {total} {total, plural, one {{one}} few "
          & "{{other}} other {de {other}}}")
     & P ("collection.shown_hidden",
          "se afișează {visible} {visible, plural, one {{one}} few {{other}} "
          & "other {de {other}}}, ascunse: {hidden}")
     & P ("collection.shown",
          "se afișează {visible} {visible, plural, one {{one}} few {{other}} "
          & "other {de {other}}}")
     & P ("collection.visible_out_of",
          "{visible, plural, one {se vede} other {se văd}} {visible} {visible, "
          & "plural, one {{one}} few {{other}} other {de {other}}} din {total} "
          & "{total, plural, one {{one}} few {{other}} other {de {other}}}")
     & P ("complete_count", "finalizate: {done} din {total}")
     & P ("percent_complete", "{percent} % finalizat")
     & P ("step_count", "pasul {step} din {total}")
     & P ("attempt_count", "încercarea {attempt} din {total}")
     & P ("throughput_remaining", "rămas: {remaining} {unit}, la {rate} {unit}/s")
     & P ("accessible_progress", "progres: {done} din {total}, {percent} la sută")
     & P ("business_days",
          "{days} {days, plural, one {zi lucrătoare} few {zile lucrătoare} "
          & "other {de zile lucrătoare}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {oră de lucru} few {ore de lucru} other "
          & "{de ore de lucru}}")
     & P ("due.overdue",
          "termen depășit cu {days} {days, plural, one {zi} few {zile} other "
          & "{de zile}}")
     & P ("due.today", "scadent astăzi")
     & P ("due.tomorrow", "scadent mâine")
     & P ("due.in",
          "scadent peste {days} {days, plural, one {zi} few {zile} other {de "
          & "zile}}")
     & P ("calendar_difference.future", "peste {difference}")
     & P ("calendar_difference.past", "acum {difference}")
     & P ("calendar_difference.same_day", "aceeași zi")
     & P ("calendar_difference.zero", "0 zile")
     & P ("cpu_load", "încărcare CPU {measure}")
     & P ("battery", "baterie {measure}")
     & P ("screen_size", "ecran {measure}")
     & P ("refresh_rate", "rată de reîmprospătare {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word", "{value} la sută")
     & P ("recurrence.second",
          "{every, plural, one {în fiecare secundă} few {la fiecare {every} "
          & "secunde} other {la fiecare {every} de secunde}}")
     & P ("recurrence.minute",
          "{every, plural, one {în fiecare minut} few {la fiecare {every} "
          & "minute} other {la fiecare {every} de minute}}")
     & P ("recurrence.hour",
          "{every, plural, one {în fiecare oră} few {la fiecare {every} ore} "
          & "other {la fiecare {every} de ore}}")
     & P ("recurrence.day",
          "{every, plural, one {în fiecare zi} few {la fiecare {every} zile} "
          & "other {la fiecare {every} de zile}}")
     & P ("recurrence.week",
          "{every, plural, one {în fiecare săptămână} few {la fiecare "
          & "{every} săptămâni} other {la fiecare {every} de săptămâni}}")
     & P ("recurrence.month",
          "{every, plural, one {în fiecare lună} few {la fiecare {every} luni} "
          & "other {la fiecare {every} de luni}}")
     & P ("recurrence.quarter",
          "{every, plural, one {în fiecare trimestru} few {la fiecare {every} "
          & "trimestre} other {la fiecare {every} de trimestre}}")
     & P ("recurrence.year",
          "{every, plural, one {în fiecare an} few {la fiecare {every} ani} "
          & "other {la fiecare {every} de ani}}")
     & P ("cache_summary.empty", "cache: nicio cerere")
     & P ("cache_summary",
          "cache: {hits} {hits, plural, one {accesare reușită} few {accesări "
          & "reușite} other {de accesări reușite}}, {misses} {misses, plural, "
          & "one {ratare} few {ratări} other {de ratări}}, rată de reușită "
          & "{rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} few {{other}} other {de {other}}}: "
          & "modificate {changed}, adăugate {added}, eliminate {removed}")
     & P ("field_diff", "{field} s-a schimbat din {before} în {after}")
     & P ("field_added", "s-a adăugat {field} cu valoarea {value}")
     & P ("field_removed", "s-a eliminat {field} (era {value})")
     & P ("field_unchanged", "{field} nu s-a schimbat, rămâne {value}")
     & P ("number_comparison.equal", "{current} este egal cu {baseline}")
     & P ("number_comparison.higher", "{current} este cu {quantity} mai mare decât {baseline}")
     & P ("number_comparison.lower", "{current} este cu {quantity} mai mic decât {baseline}")
     & P ("percent_comparison.equal", "{current} este egal cu {baseline}")
     & P ("percent_comparison.higher", "{current} este cu {quantity} mai mare decât {baseline}")
     & P ("percent_comparison.lower", "{current} este cu {quantity} mai mic decât {baseline}")
     & P ("file_size_comparison.same", "{current} are aceeași dimensiune ca {baseline}")
     & P ("file_size_comparison.larger", "{current} este cu {quantity} mai mare decât {baseline}")
     & P ("file_size_comparison.smaller", "{current} este cu {quantity} mai mic decât {baseline}")
     & P ("date_comparison.same", "{current} este aceeași dată ca {baseline}")
     & P ("date_comparison.after", "{current} este la {quantity} după {baseline}")
     & P ("date_comparison.before", "{current} este cu {quantity} înainte de {baseline}")
     & P ("queue_summary", "coadă: {details}")
     & P ("queue_summary.empty", "coadă goală")
     & P ("domain_summary",
          "{domain, select, queue {coadă} job {sarcină} run {rulare} cache "
          & "{cache} sync {sincronizare} import {import} export {export} other "
          & "{{domain}}} {state, select, queued {în coadă} running {în curs} "
          & "waiting {în așteptare} paused {în pauză} complete {{domain, "
          & "select, queue {finalizată} job {finalizată} run {finalizată} sync "
          & "{finalizată} other {finalizat}}} failed {{domain, select, queue "
          & "{eșuată} job {eșuată} run {eșuată} sync {eșuată} other "
          & "{eșuat}}} stale {{domain, select, queue {învechită} job "
          & "{învechită} run {învechită} sync {învechită} other {învechit}}} "
          & "skipped {{domain, select, queue {omisă} job {omisă} run {omisă} "
          & "sync {omisă} other {omis}}} other {{state}}}: {details}")
     & P ("summary.none", "nu există {other}")
     & P ("summary.completed",
          "{count, plural, one {s-a finalizat} other {s-au finalizat}} {count} "
          & "{count, plural, one {{one}} few {{other}} other {de {other}}}")
     & P ("summary.completed_of",
          "{count, plural, one {s-a finalizat} other {s-au finalizat}} {count} "
          & "din {total} {total, plural, one {{one}} few {{other}} other {de "
          & "{other}}}")
     & P ("summary.failed", "eșuate: {count}")
     & P ("summary.queued",
          "{count} {count, plural, one {{one}} few {{other}} other {de {other}}} "
          & "în coadă")
     & P ("summary.running", "în curs: {count}")
     & P ("summary.complete", "finalizate: {count}")
     & P ("backup.backup_running", "backup în curs")
     & P ("backup.backup_completed", "backup finalizat")
     & P ("backup.backup_failed", "backup eșuat")
     & P ("backup.backup_stale", "backup învechit")
     & P ("incident.incident_investigating", "incident în curs de investigare")
     & P ("incident.incident_identified", "incident identificat")
     & P ("incident.incident_mitigated", "incident atenuat")
     & P ("incident.incident_resolved", "incident rezolvat")
     & P ("release.release_drafting", "versiune în pregătire")
     & P ("release.release_ready", "versiune pregătită")
     & P ("release.release_published", "versiune publicată")
     & P ("release.release_rolled_back", "versiune retrasă")
     & P ("audit.audit_created", "înregistrare de audit creată")
     & P ("audit.audit_updated", "înregistrare de audit actualizată")
     & P ("audit.audit_deleted", "înregistrare de audit ștearsă")
     & P ("audit.audit_restored", "înregistrare de audit restaurată")
     & P ("feature_flag.flag_enabled", "flag de funcționalitate activat")
     & P ("feature_flag.flag_disabled", "flag de funcționalitate dezactivat")
     & P ("feature_flag.flag_rolling_out", "flag de funcționalitate în curs de lansare")
     & P ("feature_flag.flag_rolled_back", "flag de funcționalitate retras")
     & P ("webhook.webhook_pending", "webhook în așteptare")
     & P ("webhook.webhook_delivered", "webhook livrat")
     & P ("webhook.webhook_failed", "webhook eșuat")
     & P ("webhook.webhook_retrying", "webhook în curs de reîncercare")
     & P ("api_key.api_key_active", "cheie API activă")
     & P ("api_key.api_key_revoked", "cheie API revocată")
     & P ("api_key.api_key_expired", "cheie API expirată")
     & P ("api_key.api_key_rotated", "cheie API înlocuită")
     & P ("quota.quota_available", "cotă disponibilă")
     & P ("quota.quota_near_limit", "cotă aproape de limită")
     & P ("quota.quota_exceeded", "cotă depășită")
     & P ("quota.quota_reset", "cotă resetată")
     & P ("invoice.invoice_draft", "ciornă de factură")
     & P ("invoice.invoice_sent", "factură trimisă")
     & P ("invoice.invoice_paid", "factură plătită")
     & P ("invoice.invoice_refunded", "factură rambursată")
     & P ("invoice.invoice_overdue", "factură restantă")
     & P ("invoice.refund_failed", "rambursare eșuată")
     & P ("page_navigation.only", "pagină unică")
     & P ("page_navigation.first", "prima pagină, următoarea disponibilă")
     & P ("page_navigation.last", "ultima pagină, precedenta disponibilă")
     & P ("page_navigation.middle", "precedenta și următoarea disponibile")
     & P ("end_of_week", "sfârșitul săptămânii")
     & P ("end_of_month", "sfârșitul lunii")
     & P ("end_of_quarter", "sfârșitul trimestrului")
     & P ("time_of_day.night", "noapte")
     & P ("time_of_day.morning", "dimineață")
     & P ("time_of_day.afternoon", "după-amiază")
     & P ("time_of_day.evening", "seară");
end Locale_Ro;
