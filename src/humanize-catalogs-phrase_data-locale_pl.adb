separate (Humanize.Catalogs.Phrase_Data)
function Locale_Pl return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("pl", Name, Template));
begin
   return
     P ("all_count",
          "łącznie {total} {total, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("filtered_count.none", "{other}: brak dopasowań")
     & P ("filtered_count.all",
          "pasują wszystkie: {total} {total, plural, one {{one}} few {{other}} "
          & "many {{other}} other {{other}}}")
     & P ("filtered_count.some",
          "pasujące: {matching} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("more_count", "wyświetlono {visible}, +{remaining} więcej")
     & P ("others_count", "{first} i jeszcze {remaining}")
     & P ("page_count", "strona {page} z {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}} na stronę")
     & P ("pagination_range",
          "{first}–{last} z {total} {total, plural, one {{one}} few {{other}} "
          & "many {{other}} other {{other}}}")
     & P ("position_count", "{position} z {total}")
     & P ("selection_count",
          "wybrano: {selected} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("showing_count",
          "wyświetlono {showing} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("validation_count",
          "{count, plural, =0 {brak {severity, select, error {błędów} warning "
          & "{ostrzeżeń} other {uwag}}} one {1 {severity, select, error {błąd} "
          & "warning {ostrzeżenie} other {uwaga}}} few {{count} {severity, select, "
          & "error {błędy} warning {ostrzeżenia} other {uwagi}}} many {{count} "
          & "{severity, select, error {błędów} warning {ostrzeżeń} other "
          & "{uwag}}} other {{count} {severity, select, error {błędu} warning "
          & "{ostrzeżenia} other {uwagi}}}}")
     & P ("collection.empty", "{other}: brak")
     & P ("collection.none_shown", "{other}: nic nie wyświetlono")
     & P ("collection.showing_hidden",
          "wyświetlono {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}, ukryto {hidden}")
     & P ("collection.showing",
          "wyświetlono {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("collection.shown_hidden",
          "wyświetlono {visible} {visible, plural, one {{one}} few {{other}} "
          & "many {{other}} other {{other}}}, ukryto {hidden}")
     & P ("collection.shown",
          "wyświetlono {visible} {visible, plural, one {{one}} few {{other}} "
          & "many {{other}} other {{other}}}")
     & P ("collection.visible_out_of",
          "widoczne: {visible} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("complete_count", "ukończono {done} z {total}")
     & P ("percent_complete", "ukończono {percent}%")
     & P ("step_count", "krok {step} z {total}")
     & P ("attempt_count", "próba {attempt} z {total}")
     & P ("throughput_remaining", "pozostało: {remaining} ({unit}), {rate} {unit}/s")
     & P ("accessible_progress", "ukończono {done} z {total}, {percent} procent")
     & P ("business_days",
          "{days, plural, one {{days} dzień roboczy} few {{days} dni robocze} "
          & "many {{days} dni roboczych} other {{days} dnia roboczego}}")
     & P ("working_hours",
          "{hours, plural, one {{hours} godzina robocza} few {{hours} godziny "
          & "robocze} many {{hours} godzin roboczych} other {{hours} godziny "
          & "roboczej}}")
     & P ("due.overdue",
          "{days, plural, one {{days} dzień} few {{days} dni} many {{days} dni} "
          & "other {{days} dnia}} po terminie")
     & P ("due.today", "termin dzisiaj")
     & P ("due.tomorrow", "termin jutro")
     & P ("due.in",
          "termin za {days, plural, one {{days} dzień} few {{days} dni} many "
          & "{{days} dni} other {{days} dnia}}")
     & P ("calendar_difference.future", "za {difference}")
     & P ("calendar_difference.past", "{difference} temu")
     & P ("cpu_load", "obciążenie CPU {measure}")
     & P ("battery", "bateria {measure}")
     & P ("screen_size", "ekran {measure}")
     & P ("refresh_rate", "częstotliwość odświeżania {measure}")
     & P ("editorial_percent.symbol", "{value}%")
     & P ("editorial_percent.word", "{value} procent")
     & P ("recurrence.second",
          "{every, plural, =1 {co sekundę} one {co {every} sekundę} few {co "
          & "{every} sekundy} many {co {every} sekund} other {co {every} sekundy}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {co minutę} one {co {every} minutę} few {co "
          & "{every} minuty} many {co {every} minut} other {co {every} minuty}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {co godzinę} one {co {every} godzinę} few {co "
          & "{every} godziny} many {co {every} godzin} other {co {every} godziny}}")
     & P ("recurrence.day",
          "{every, plural, =1 {codziennie} one {co {every} dzień} few {co "
          & "{every} dni} many {co {every} dni} other {co {every} dnia}}")
     & P ("recurrence.week",
          "{every, plural, =1 {co tydzień} one {co {every} tydzień} few {co "
          & "{every} tygodnie} many {co {every} tygodni} other {co {every} "
          & "tygodnia}}")
     & P ("recurrence.month",
          "{every, plural, =1 {co miesiąc} one {co {every} miesiąc} few {co "
          & "{every} miesiące} many {co {every} miesięcy} other {co {every} "
          & "miesiąca}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {co kwartał} one {co {every} kwartał} few {co "
          & "{every} kwartały} many {co {every} kwartałów} other {co {every} "
          & "kwartału}}")
     & P ("recurrence.year",
          "{every, plural, =1 {co roku} one {co {every} rok} few {co {every} "
          & "lata} many {co {every} lat} other {co {every} roku}}")
     & P ("cache_summary.empty", "pamięć podręczna: brak żądań")
     & P ("cache_summary",
          "pamięć podręczna: {hits, plural, one {{hits} trafienie} few {{hits} "
          & "trafienia} many {{hits} trafień} other {{hits} trafienia}}, {misses, "
          & "plural, one {{misses} chybienie} few {{misses} chybienia} many "
          & "{{misses} chybień} other {{misses} chybienia}}, skuteczność {rate}%")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: zmieniono {changed}, dodano {added}, usunięto {removed}")
     & P ("field_diff", "{field}: zmieniono z {before} na {after}")
     & P ("field_added", "{field}: dodano z wartością {value}")
     & P ("field_removed", "{field}: usunięto (poprzednio {value})")
     & P ("field_unchanged", "{field}: bez zmian ({value})")
     & P ("number_comparison.equal", "{current} równa się {baseline}")
     & P ("number_comparison.higher", "{current} to o {quantity} więcej niż {baseline}")
     & P ("number_comparison.lower", "{current} to o {quantity} mniej niż {baseline}")
     & P ("percent_comparison.equal", "{current} równa się {baseline}")
     & P ("percent_comparison.higher", "{current} to o {quantity} więcej niż {baseline}")
     & P ("percent_comparison.lower", "{current} to o {quantity} mniej niż {baseline}")
     & P ("file_size_comparison.same", "{current} ma taki sam rozmiar jak {baseline}")
     & P ("file_size_comparison.larger", "{current} ma rozmiar o {quantity} większy niż {baseline}")
     & P ("file_size_comparison.smaller", "{current} ma rozmiar o {quantity} mniejszy niż {baseline}")
     & P ("date_comparison.same", "{current} to ta sama data co {baseline}")
     & P ("date_comparison.after", "{current} to o {quantity} później niż {baseline}")
     & P ("date_comparison.before", "{current} to o {quantity} wcześniej niż {baseline}")
     & P ("queue_summary", "kolejka: {details}")
     & P ("queue_summary.empty", "kolejka pusta")
     & P ("domain_summary",
          "{domain, select, queue {kolejka} job {zadanie} run {przebieg} cache "
          & "{pamięć podręczna} sync {synchronizacja} import {import} export "
          & "{eksport} other {{domain}}} – {state, select, queued {w kolejce} "
          & "running {w toku} waiting {oczekiwanie} paused {wstrzymano} complete "
          & "{ukończono} failed {niepowodzenie} stale {nieaktualne} skipped "
          & "{pominięto} other {{state}}}: {details}")
     & P ("summary.none", "{other}: brak")
     & P ("summary.completed",
          "ukończono: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("summary.completed_of",
          "ukończono: {count} z {total} {total, plural, one {{one}} few "
          & "{{other}} many {{other}} other {{other}}}")
     & P ("summary.failed", "nieudane: {count}")
     & P ("summary.queued",
          "w kolejce: {count} {count, plural, one {{one}} few {{other}} many "
          & "{{other}} other {{other}}}")
     & P ("summary.running", "w toku: {count}")
     & P ("summary.complete", "ukończone: {count}")
     & P ("backup.backup_running", "kopia zapasowa w toku")
     & P ("backup.backup_completed", "kopia zapasowa ukończona")
     & P ("backup.backup_failed", "kopia zapasowa nieudana")
     & P ("backup.backup_stale", "kopia zapasowa nieaktualna")
     & P ("incident.incident_investigating", "badanie incydentu")
     & P ("incident.incident_identified", "incydent zidentyfikowany")
     & P ("incident.incident_mitigated", "incydent złagodzony")
     & P ("incident.incident_resolved", "incydent rozwiązany")
     & P ("release.release_drafting", "wydanie w przygotowaniu")
     & P ("release.release_ready", "wydanie gotowe")
     & P ("release.release_published", "wydanie opublikowane")
     & P ("release.release_rolled_back", "wydanie wycofane")
     & P ("audit.audit_created", "wpis audytu utworzony")
     & P ("audit.audit_updated", "wpis audytu zaktualizowany")
     & P ("audit.audit_deleted", "wpis audytu usunięty")
     & P ("audit.audit_restored", "wpis audytu przywrócony")
     & P ("feature_flag.flag_enabled", "flaga funkcji włączona")
     & P ("feature_flag.flag_disabled", "flaga funkcji wyłączona")
     & P ("feature_flag.flag_rolling_out", "flaga funkcji wdrażana stopniowo")
     & P ("feature_flag.flag_rolled_back", "flaga funkcji wycofana")
     & P ("webhook.webhook_pending", "webhook oczekuje")
     & P ("webhook.webhook_delivered", "webhook dostarczony")
     & P ("webhook.webhook_failed", "webhook nieudany")
     & P ("webhook.webhook_retrying", "webhook: ponowna próba")
     & P ("api_key.api_key_active", "klucz API aktywny")
     & P ("api_key.api_key_revoked", "klucz API unieważniony")
     & P ("api_key.api_key_expired", "klucz API wygasł")
     & P ("api_key.api_key_rotated", "klucz API wymieniony")
     & P ("quota.quota_available", "limit dostępny")
     & P ("quota.quota_near_limit", "limit prawie wyczerpany")
     & P ("quota.quota_exceeded", "limit przekroczony")
     & P ("quota.quota_reset", "limit zresetowany")
     & P ("invoice.invoice_draft", "szkic faktury")
     & P ("invoice.invoice_sent", "faktura wysłana")
     & P ("invoice.invoice_paid", "faktura opłacona")
     & P ("invoice.invoice_refunded", "faktura: zwrot środków")
     & P ("invoice.invoice_overdue", "faktura przeterminowana")
     & P ("invoice.refund_failed", "zwrot środków nieudany")
     & P ("page_navigation.only", "jedyna strona")
     & P ("page_navigation.first", "pierwsza strona, dostępna następna")
     & P ("page_navigation.last", "ostatnia strona, dostępna poprzednia")
     & P ("page_navigation.middle", "dostępne poprzednia i następna")
     & P ("end_of_week", "koniec tygodnia")
     & P ("end_of_month", "koniec miesiąca")
     & P ("end_of_quarter", "koniec kwartału")
     & P ("time_of_day.night", "noc")
     & P ("time_of_day.morning", "rano")
     & P ("time_of_day.afternoon", "popołudnie")
     & P ("time_of_day.evening", "wieczór")
     & P ("calendar_difference.same_day", "tego samego dnia")
     & P ("calendar_difference.zero", "0 dni");
end Locale_Pl;
