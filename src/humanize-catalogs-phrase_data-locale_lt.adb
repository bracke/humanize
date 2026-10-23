separate (Humanize.Catalogs.Phrase_Data)
function Locale_Lt return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("lt", Name, Template));
begin
   return
     P ("all_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: iš viso {total}")
     & P ("filtered_count.none", "{other}: atitikmenų nėra")
     & P ("filtered_count.all",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: atitinka {total} iš {total}")
     & P ("filtered_count.some",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: atitinka {matching} iš {total}")
     & P ("more_count", "rodoma {visible}, dar +{remaining}")
     & P ("others_count", "{first} ir dar {remaining}")
     & P ("page_count", "puslapis {page} iš {total}")
     & P ("page_size",
          "{size, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {size} puslapyje")
     & P ("pagination_range",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {first}–{last} iš {total}")
     & P ("position_count", "{position} iš {total}")
     & P ("selection_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: pasirinkta {selected} iš {total}")
     & P ("showing_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: rodoma {showing} iš {total}")
     & P ("validation_count",
          "{count, plural, =0 {{severity, select, error {klaidų} warning "
          & "{įspėjimų} other {pastabų}} nėra} one {{count} {severity, select, "
          & "error {klaida} warning {įspėjimas} other {pastaba}}} few {{count} "
          & "{severity, select, error {klaidos} warning {įspėjimai} other "
          & "{pastabos}}} many {{count} {severity, select, error {klaidos} warning "
          & "{įspėjimo} other {pastabos}}} other {{count} {severity, select, "
          & "error {klaidų} warning {įspėjimų} other {pastabų}}}}")
     & P ("collection.empty", "{other}: nėra")
     & P ("collection.none_shown", "{other}: nerodoma")
     & P ("collection.showing_hidden",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: rodoma {visible} iš {total}, paslėpta {hidden}")
     & P ("collection.showing",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: rodoma {visible} iš {total}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: rodoma {visible}, paslėpta {hidden}")
     & P ("collection.shown",
          "{visible, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: rodoma {visible}")
     & P ("collection.visible_out_of",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: matoma {visible} iš {total}")
     & P ("complete_count", "atlikta {done} iš {total}")
     & P ("percent_complete", "atlikta {percent} %")
     & P ("step_count", "žingsnis {step} iš {total}")
     & P ("attempt_count", "bandymas {attempt} iš {total}")
     & P ("throughput_remaining", "{unit}: liko {remaining}, sparta {rate} {unit}/s")
     & P ("accessible_progress",
          "atlikta {done} iš {total}, {percent} {percent, plural, one "
          & "{procentas} few {procentai} many {procento} other {procentų}}")
     & P ("business_days",
          "{days} {days, plural, one {darbo diena} few {darbo dienos} many {darbo "
          & "dienos} other {darbo dienų}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {darbo valanda} few {darbo valandos} many "
          & "{darbo valandos} other {darbo valandų}}")
     & P ("due.overdue",
          "pradelsta {days} {days, plural, one {dieną} few {dienas} many "
          & "{dienos} other {dienų}}")
     & P ("due.today", "terminas – šiandien")
     & P ("due.tomorrow", "terminas – rytoj")
     & P ("due.in",
          "terminas po {days} {days, plural, one {dienos} few {dienų} many "
          & "{dienos} other {dienų}}")
     & P ("calendar_difference.future", "liko {difference}")
     & P ("calendar_difference.past", "praėjo {difference}")
     & P ("cpu_load", "CPU apkrova {measure}")
     & P ("battery", "baterija {measure}")
     & P ("screen_size", "ekranas {measure}")
     & P ("refresh_rate", "atnaujinimo dažnis {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value} {value, plural, one {procentas} few {procentai} many "
          & "{procento} other {procentų}}")
     & P ("recurrence.second",
          "{every, plural, =1 {kas sekundę} one {kas {every} sekundę} few {kas "
          & "{every} sekundes} many {kas {every} sekundės} other {kas {every} "
          & "sekundžių}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {kas minutę} one {kas {every} minutę} few {kas "
          & "{every} minutes} many {kas {every} minutės} other {kas {every} "
          & "minučių}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {kas valandą} one {kas {every} valandą} few {kas "
          & "{every} valandas} many {kas {every} valandos} other {kas {every} "
          & "valandų}}")
     & P ("recurrence.day",
          "{every, plural, =1 {kasdien} one {kas {every} dieną} few {kas {every} "
          & "dienas} many {kas {every} dienos} other {kas {every} dienų}}")
     & P ("recurrence.week",
          "{every, plural, =1 {kas savaitę} one {kas {every} savaitę} few {kas "
          & "{every} savaites} many {kas {every} savaitės} other {kas {every} "
          & "savaičių}}")
     & P ("recurrence.month",
          "{every, plural, =1 {kas mėnesį} one {kas {every} mėnesį} few {kas "
          & "{every} mėnesius} many {kas {every} mėnesio} other {kas {every} "
          & "mėnesių}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {kas ketvirtį} one {kas {every} ketvirtį} few "
          & "{kas {every} ketvirčius} many {kas {every} ketvirčio} other {kas "
          & "{every} ketvirčių}}")
     & P ("recurrence.year",
          "{every, plural, =1 {kasmet} one {kas {every} metus} few {kas {every} "
          & "metus} many {kas {every} metų} other {kas {every} metų}}")
     & P ("cache_summary.empty", "talpykla: užklausų nėra")
     & P ("cache_summary",
          "talpykla: pataikymų {hits}, praleidimų {misses}, pataikymo dažnis "
          & "{rate} %")
     & P ("field_change_summary",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}} ({total}): pakeista {changed}, pridėta {added}, pašalinta "
          & "{removed}")
     & P ("field_diff", "{field}: buvo {before}, dabar {after}")
     & P ("field_added", "{field}: pridėta reikšmė {value}")
     & P ("field_removed", "{field}: pašalinta (buvo {value})")
     & P ("field_unchanged", "{field}: nepakeista ({value})")
     & P ("number_comparison.equal", "{current} lygu {baseline}")
     & P ("number_comparison.higher", "{current} – {quantity} daugiau nei {baseline}")
     & P ("number_comparison.lower", "{current} – {quantity} mažiau nei {baseline}")
     & P ("percent_comparison.equal", "{current} lygu {baseline}")
     & P ("percent_comparison.higher", "{current} – {quantity} daugiau nei {baseline}")
     & P ("percent_comparison.lower", "{current} – {quantity} mažiau nei {baseline}")
     & P ("file_size_comparison.same", "{current} – tokio pat dydžio kaip {baseline}")
     & P ("file_size_comparison.larger", "{current} – {quantity} daugiau nei {baseline}")
     & P ("file_size_comparison.smaller", "{current} – {quantity} mažiau nei {baseline}")
     & P ("date_comparison.same", "{current} – ta pati data kaip {baseline}")
     & P ("date_comparison.after", "{current} vėliau nei {baseline} (skirtumas: {quantity})")
     & P ("date_comparison.before", "{current} anksčiau nei {baseline} (skirtumas: {quantity})")
     & P ("queue_summary", "eilė: {details}")
     & P ("domain_summary",
          "{domain, select, queue {eilė} job {užduotis} run {vykdymas} cache "
          & "{talpykla} sync {sinchronizavimas} import {importas} export "
          & "{eksportas} other {{domain}}} – {state, select, queued {eilėje} "
          & "running {vykdoma} waiting {laukiama} paused {pristabdyta} complete "
          & "{baigta} failed {nepavyko} stale {pasenę} skipped {praleista} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "{other}: nėra")
     & P ("summary.completed",
          "{count, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: baigta {count}")
     & P ("summary.completed_of",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: baigta {count} iš {total}")
     & P ("summary.failed", "nepavyko: {count}")
     & P ("summary.queued",
          "{count, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: eilėje {count}")
     & P ("summary.running", "vykdoma: {count}")
     & P ("summary.complete", "baigta: {count}")
     & P ("backup.backup_running", "vyksta atsarginis kopijavimas")
     & P ("backup.backup_completed", "atsarginis kopijavimas baigtas")
     & P ("backup.backup_failed", "atsarginis kopijavimas nepavyko")
     & P ("backup.backup_stale", "atsarginė kopija pasenusi")
     & P ("incident.incident_investigating", "tiriamas incidentas")
     & P ("incident.incident_identified", "incidentas nustatytas")
     & P ("incident.incident_mitigated", "incidentas suvaldytas")
     & P ("incident.incident_resolved", "incidentas išspręstas")
     & P ("release.release_drafting", "rengiama versija")
     & P ("release.release_ready", "versija paruošta")
     & P ("release.release_published", "versija išleista")
     & P ("release.release_rolled_back", "versija atšaukta")
     & P ("audit.audit_created", "audito įrašas sukurtas")
     & P ("audit.audit_updated", "audito įrašas atnaujintas")
     & P ("audit.audit_deleted", "audito įrašas ištrintas")
     & P ("audit.audit_restored", "audito įrašas atkurtas")
     & P ("feature_flag.flag_enabled", "funkcijos vėliavėlė įjungta")
     & P ("feature_flag.flag_disabled", "funkcijos vėliavėlė išjungta")
     & P ("feature_flag.flag_rolling_out", "funkcijos vėliavėlė diegiama")
     & P ("feature_flag.flag_rolled_back", "funkcijos vėliavėlė atšaukta")
     & P ("webhook.webhook_pending", "webhook: laukiama")
     & P ("webhook.webhook_delivered", "webhook: pristatyta")
     & P ("webhook.webhook_failed", "webhook: nepavyko")
     & P ("webhook.webhook_retrying", "webhook: bandoma dar kartą")
     & P ("api_key.api_key_active", "API raktas aktyvus")
     & P ("api_key.api_key_revoked", "API raktas atšauktas")
     & P ("api_key.api_key_expired", "API rakto galiojimas baigėsi")
     & P ("api_key.api_key_rotated", "API raktas pakeistas")
     & P ("quota.quota_available", "kvota prieinama")
     & P ("quota.quota_near_limit", "kvota beveik išnaudota")
     & P ("quota.quota_exceeded", "kvota viršyta")
     & P ("quota.quota_reset", "kvota atkurta")
     & P ("invoice.invoice_draft", "sąskaitos juodraštis")
     & P ("invoice.invoice_sent", "sąskaita išsiųsta")
     & P ("invoice.invoice_paid", "sąskaita apmokėta")
     & P ("invoice.invoice_refunded", "lėšos už sąskaitą grąžintos")
     & P ("invoice.invoice_overdue", "sąskaita pradelsta")
     & P ("invoice.refund_failed", "grąžinimas nepavyko")
     & P ("page_navigation.only", "vienintelis puslapis")
     & P ("page_navigation.first", "pirmas puslapis, yra kitas")
     & P ("page_navigation.last", "paskutinis puslapis, yra ankstesnis")
     & P ("page_navigation.middle", "yra ankstesnis ir kitas")
     & P ("end_of_week", "savaitės pabaiga")
     & P ("end_of_month", "mėnesio pabaiga")
     & P ("end_of_quarter", "ketvirčio pabaiga")
     & P ("time_of_day.night", "naktis")
     & P ("time_of_day.morning", "rytas")
     & P ("time_of_day.afternoon", "popietė")
     & P ("time_of_day.evening", "vakaras")
     & P ("calendar_difference.same_day", "tą pačią dieną")
     & P ("calendar_difference.zero", "0 dienų")
     & P ("queue_summary.empty", "eilė tuščia");
end Locale_Lt;
