separate (Humanize.Catalogs.Phrase_Data)
function Locale_Pl return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("pl", Name, Template));
begin
   return
     P ("all_count",
          "łącznie {total} {total, plural, one {{one}} few {{few}} many "
          & "{{genitive_other}} other {{genitive_one}}}")
     & P ("filtered_count.none", "brak pasujących {genitive_other}")
     & P ("filtered_count.all",
          "{gender, select, masculine_animate {pasują wszyscy: {total} {total, "
          & "plural, one {{one}} few {{few}} many {{genitive_other}} other "
          & "{{genitive_one}}}} other {pasują wszystkie: {total} {total, plural, "
          & "one {{one}} few {{few}} many {{genitive_other}} other "
          & "{{genitive_one}}}}}")
     & P ("filtered_count.some",
          "{matching, plural, one {pasuje} few {pasują} many {pasuje} other "
          & "{pasuje}} {matching} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("more_count", "wyświetlono {visible}, +{remaining} więcej")
     & P ("others_count", "{first} i jeszcze {remaining}")
     & P ("page_count", "strona {page} z {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{few}} many {{genitive_other}} "
          & "other {{genitive_one}}} na stronę")
     & P ("pagination_range",
          "{first}–{last} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("position_count", "{position} z {total}")
     & P ("selection_count",
          "wybrano {selected} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("showing_count",
          "wyświetlono {showing} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("validation_count",
          "{count, plural, =0 {brak {severity, select, error {błędów} warning "
          & "{ostrzeżeń} other {uwag}}} one {1 {severity, select, error {błąd} "
          & "warning {ostrzeżenie} other {uwaga}}} few {{count} {severity, select, "
          & "error {błędy} warning {ostrzeżenia} other {uwagi}}} many {{count} "
          & "{severity, select, error {błędów} warning {ostrzeżeń} other "
          & "{uwag}}} other {{count} {severity, select, error {błędu} warning "
          & "{ostrzeżenia} other {uwagi}}}}")
     & P ("collection.empty", "brak {genitive_other}")
     & P ("collection.none_shown", "nie wyświetlono żadnych {genitive_other}")
     & P ("collection.showing_hidden",
          "wyświetlono {visible} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}, ukryto {hidden}")
     & P ("collection.showing",
          "wyświetlono {visible} z {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("collection.shown_hidden",
          "wyświetlono {visible} {visible, plural, one {{accusative_one}} few "
          & "{{accusative_other}} many {{genitive_other}} other {{genitive_one}}}, "
          & "ukryto {hidden}")
     & P ("collection.shown",
          "wyświetlono {visible} {visible, plural, one {{accusative_one}} few "
          & "{{accusative_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("collection.visible_out_of",
          "{gender, select, masculine_animate {widoczni: {visible} z {total} "
          & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
          & "{{genitive_other}} other {{genitive_one}}}} other {widoczne: {visible} "
          & "z {total} {total, plural, one {{genitive_one}} few {{genitive_other}} "
          & "many {{genitive_other}} other {{genitive_one}}}}}")
     & P ("complete_count", "ukończono {done} z {total}")
     & P ("percent_complete", "ukończono {percent}%")
     & P ("step_count", "krok {step} z {total}")
     & P ("attempt_count", "próba {attempt} z {total}")
     & P ("throughput_remaining",
          "{remaining, plural, one {pozostaje} few {pozostają} many {pozostaje} "
          & "other {pozostaje}} {remaining} {remaining, plural, one {{one}} few "
          & "{{few}} many {{genitive_other}} other {{genitive_one}}}, {rate} "
          & "{unit}/s")
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
     & P ("calendar_difference.case.future", "accusative")
     & P ("calendar_difference.case.past", "accusative")
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
          "{total} {total, plural, one {{one}} few {{few}} many "
          & "{{genitive_other}} other {{genitive_one}}}: zmieniono {changed}, "
          & "dodano {added}, usunięto {removed}")
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
     & P ("summary.none", "brak {genitive_other}")
     & P ("summary.completed",
          "ukończono {count} {count, plural, one {{accusative_one}} few "
          & "{{accusative_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("summary.completed_of",
          "ukończono {count} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("summary.failed", "nieudane: {count}")
     & P ("summary.queued",
          "w kolejce: {count} {count, plural, one {{one}} few {{few}} many "
          & "{{genitive_other}} other {{genitive_one}}}")
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
     & P ("flag.flag_enabled", "flaga funkcji włączona")
     & P ("flag.flag_disabled", "flaga funkcji wyłączona")
     & P ("flag.flag_rolling_out", "flaga funkcji wdrażana stopniowo")
     & P ("flag.flag_rolled_back", "flaga funkcji wycofana")
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
     & P ("calendar_difference.zero", "0 dni")
     & P ("access.allowed", "dozwolone")
     & P ("access.denied", "odmówiono")
     & P ("access.owner", "właściciel")
     & P ("access.admin", "administrator")
     & P ("access.viewer", "przeglądający")
     & P ("access.editor", "edytujący")
     & P ("auth.signed_in", "zalogowano")
     & P ("auth.signed_out", "wylogowano")
     & P ("auth.session_expired", "sesja wygasła")
     & P ("auth.locked", "zablokowano")
     & P ("auth.two_factor_required", "wymagane uwierzytelnianie dwuskładnikowe")
     & P ("billing.trialing", "okres próbny")
     & P ("billing.payment_due", "do zapłaty")
     & P ("billing.payment_failed", "płatność nieudana")
     & P ("billing.paid", "opłacono")
     & P ("billing.past_due", "po terminie")
     & P ("billing.canceled", "anulowano")
     & P ("ci.pipeline_pending", "potok oczekuje")
     & P ("ci.pipeline_running", "potok w toku")
     & P ("ci.pipeline_passed", "potok zakończony powodzeniem")
     & P ("ci.pipeline_failed", "potok nieudany")
     & P ("ci.review_required", "wymagany przegląd")
     & P ("ci.deploy_blocked", "wdrożenie zablokowane")
     & P ("collaboration.active_now", "aktywny teraz")
     & P ("collaboration.away", "nieobecny")
     & P ("collaboration.do_not_disturb", "nie przeszkadzać")
     & P ("collaboration.typing", "pisze")
     & P ("collaboration.viewing", "przegląda")
     & P ("collaboration.editing", "edytuje")
     & P ("deployment.deploying", "wdrażanie")
     & P ("deployment.deployed", "wdrożono")
     & P ("deployment.rolling_back", "wycofywanie")
     & P ("deployment.rolled_back", "wycofano")
     & P ("deployment.build_failed", "kompilacja nieudana")
     & P ("deployment.checks_passed", "testy zaliczone")
     & P ("empty.no_items", "brak elementów")
     & P ("empty.no_results", "brak wyników")
     & P ("empty.no_messages", "brak wiadomości")
     & P ("empty.no_selection", "brak zaznaczenia")
     & P ("empty.nothing_to_show", "nic do wyświetlenia")
     & P ("file.uploading", "przesyłanie")
     & P ("file.downloading", "pobieranie")
     & P ("file.copying", "kopiowanie")
     & P ("file.moving", "przenoszenie")
     & P ("file.deleting", "usuwanie")
     & P ("file.deleted", "usunięto")
     & P ("file.restoring", "przywracanie")
     & P ("file.synced", "zsynchronizowano")
     & P ("form.valid_input", "prawidłowe dane")
     & P ("form.invalid_input", "nieprawidłowe dane")
     & P ("form.dirty", "zmieniono")
     & P ("form.pristine", "bez zmian")
     & P ("form.submitted", "wysłano")
     & P ("form.submission_failed", "wysyłanie nieudane")
     & P ("health.healthy", "sprawny")
     & P ("health.degraded", "obniżona wydajność")
     & P ("health.unhealthy", "niesprawny")
     & P ("health.incident", "incydent")
     & P ("health.maintenance", "konserwacja")
     & P ("health.recovering", "przywracanie działania")
     & P ("issue.open", "otwarte")
     & P ("issue.closed", "zamknięte")
     & P ("issue.reopened", "ponownie otwarte")
     & P ("issue.assigned", "przypisane")
     & P ("issue.unassigned", "nieprzypisane")
     & P ("issue.merged", "scalone")
     & P ("network.offline", "offline")
     & P ("network.online", "online")
     & P ("network.connecting", "łączenie")
     & P ("network.syncing", "synchronizacja")
     & P ("network.sync_failed", "synchronizacja nieudana")
     & P ("network.permission_denied", "brak uprawnień")
     & P ("network.read_only", "tylko do odczytu")
     & P ("notification.unread", "nieprzeczytane")
     & P ("notification.read", "przeczytane")
     & P ("notification.muted", "wyciszone")
     & P ("notification.snoozed", "odłożone")
     & P ("notification.sent", "wysłane")
     & P ("notification.delivered", "dostarczone")
     & P ("payment.payment_authorized", "płatność autoryzowana")
     & P ("payment.payment_captured", "płatność pobrana")
     & P ("payment.payment_refunded", "płatność zwrócona")
     & P ("payment.payment_disputed", "płatność zakwestionowana")
     & P ("payment.payment_requires_action", "płatność wymaga działania")
     & P ("payment.payment_expired", "płatność wygasła")
     & P ("ui.empty", "pusto")
     & P ("ui.loading", "wczytywanie")
     & P ("ui.saving", "zapisywanie")
     & P ("ui.saved", "zapisano")
     & P ("ui.unsaved", "niezapisane")
     & P ("ui.retrying", "ponawianie")
     & P ("ui.paused", "wstrzymano")
     & P ("ui.complete", "ukończono")
     & P ("ui.failed", "niepowodzenie")
     & P ("ui.due_soon", "wkrótce termin")
     & P ("ui.overdue", "po terminie")
     & P ("ui.last_seen", "ostatnio widziany")
     & P ("ui.updated_just_now", "zaktualizowano przed chwilą")
     & P ("queue.queued", "w kolejce")
     & P ("queue.running", "w toku")
     & P ("queue.waiting", "oczekiwanie")
     & P ("queue.blocked", "zablokowane")
     & P ("queue.canceled_job", "zadanie anulowane")
     & P ("queue.completed_job", "zadanie ukończone")
     & P ("search.filtering", "filtrowanie")
     & P ("search.filtered", "przefiltrowano")
     & P ("search.no_matches", "brak dopasowań")
     & P ("search.search_ready", "wyszukiwanie gotowe")
     & P ("search.search_failed", "wyszukiwanie nieudane")
     & P ("search.query_too_short", "zapytanie za krótkie")
     & P ("security.secure", "bezpieczne")
     & P ("security.insecure", "niezabezpieczone")
     & P ("security.vulnerable", "podatne na ataki")
     & P ("security.encrypted", "zaszyfrowane")
     & P ("security.unencrypted", "niezaszyfrowane")
     & P ("security.token_expired", "token wygasł")
     & P ("sync.sync_idle", "synchronizacja bezczynna")
     & P ("sync.syncing_now", "trwa synchronizacja")
     & P ("sync.sync_queued", "synchronizacja w kolejce")
     & P ("sync.sync_conflict", "konflikt synchronizacji")
     & P ("sync.sync_complete", "synchronizacja ukończona")
     & P ("sync.sync_error", "błąd synchronizacji")
     & P ("task.todo", "do zrobienia")
     & P ("task.in_progress", "w toku")
     & P ("task.done", "gotowe")
     & P ("task.skipped", "pominięto")
     & P ("task.blocked_task", "zablokowane")
     & P ("task.waiting_on", "oczekuje na")
     & P ("ticket.ticket_new", "nowe zgłoszenie")
     & P ("ticket.ticket_open", "zgłoszenie otwarte")
     & P ("ticket.ticket_waiting", "zgłoszenie oczekuje")
     & P ("ticket.ticket_escalated", "zgłoszenie eskalowane")
     & P ("ticket.ticket_resolved", "zgłoszenie rozwiązane")
     & P ("ticket.ticket_closed", "zgłoszenie zamknięte")
     & P ("transfer.importing", "importowanie")
     & P ("transfer.imported", "zaimportowano")
     & P ("transfer.import_failed", "import nieudany")
     & P ("transfer.exporting", "eksportowanie")
     & P ("transfer.exported", "wyeksportowano")
     & P ("transfer.export_failed", "eksport nieudany")
     & P ("validation.required", "wymagane")
     & P ("validation.optional", "opcjonalne")
     & P ("validation.invalid", "nieprawidłowe")
     & P ("validation.too_short", "za krótkie")
     & P ("validation.too_long", "za długie")
     & P ("validation.out_of_range", "poza zakresem")
     & P ("validation.already_exists", "już istnieje")
     & P ("workflow.draft", "wersja robocza")
     & P ("workflow.in_review", "w przeglądzie")
     & P ("workflow.approved", "zatwierdzono")
     & P ("workflow.rejected", "odrzucono")
     & P ("workflow.published", "opublikowano")
     & P ("workflow.archived", "zarchiwizowano")
     & P ("database.database_online", "baza danych online")
     & P ("database.database_offline", "baza danych offline")
     & P ("database.database_degraded", "baza danych działa z ograniczeniami")
     & P ("database.database_migrating", "migracja bazy danych")
     & P ("database.database_migration_failed", "migracja bazy danych nieudana")
     & P ("database.database_replicating", "replikacja bazy danych")
     & P ("database.database_replication_lagging", "opóźnienie replikacji bazy danych")
     & P ("database.database_backup_running", "kopia zapasowa bazy danych w toku")
     & P ("database.database_backup_failed", "kopia zapasowa bazy danych nieudana")
     & P ("date_comparison.case.after", "accusative")
     & P ("date_comparison.case.before", "accusative")
     & P ("count",
          "{count, plural, one {# {one}} few {# {few}} many {# {genitive_other}} "
          & "other {# {genitive_one}}}")
     & P ("noun",
          "{count, plural, one {{one}} few {{few}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("noun.accusative",
          "{count, plural, one {{accusative_one}} few {{accusative_other}} many "
          & "{{genitive_other}} other {{genitive_one}}}")
     & P ("number_comparison.case", "accusative")
     & P ("times_noun",
          "{count, plural, =0 {nigdy {other}} =1 {raz {one}} =2 {dwa razy "
          & "{other}} other {{count} razy {other}}}")
     & P ("availability.all",
          "{gender, select, masculine_animate {dostępni: {available} z {total} "
          & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
          & "{{genitive_other}} other {{genitive_one}}}} other {dostępne: "
          & "{available} z {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}}}")
     & P ("availability.none", "brak dostępnych {genitive_other}")
     & P ("availability.partial",
          "{gender, select, masculine_animate {dostępni: {available} z {total} "
          & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
          & "{{genitive_other}} other {{genitive_one}}}, niedostępni: "
          & "{unavailable}} other {dostępne: {available} z {total} {total, plural, "
          & "one {{genitive_one}} few {{genitive_other}} many {{genitive_other}} "
          & "other {{genitive_one}}}, niedostępne: {unavailable}}}")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "w kolejce")
     & P ("operation.running", "w toku")
     & P ("operation.blocked", "zablokowane")
     & P ("operation.retrying", "ponawianie")
     & P ("operation.succeeded", "zakończono pomyślnie")
     & P ("operation.partially_succeeded", "częściowo pomyślnie")
     & P ("operation.failed", "niepowodzenie")
     & P ("operation.canceled", "anulowano")
     & P ("operation.skipped", "pominięto")
     & P ("operation.stale", "nieaktualne")
     & P ("operation.unknown_state", "nieznane")
     & P ("operation.last_success", "{name}: ostatni sukces {time}")
     & P ("operation.next_retry", "{name}: następna próba {time}")
     & P ("operation.stale_run", "{name} – nieaktualne: {time}")
     & P ("summary.skipped", "pominięte: {count}")
     & P ("summary.retried", "ponowione: {count}")
     & P ("summary.canceled", "anulowane: {count}")
     & P ("system.service.operational", "działa")
     & P ("system.service.degraded", "obniżona wydajność")
     & P ("system.service.partial_outage", "częściowa awaria")
     & P ("system.service.major_outage", "poważna awaria")
     & P ("system.service.maintenance", "w trakcie konserwacji")
     & P ("system.service.unknown", "nieznany stan usługi")
     & P ("system.health.healthy", "w normie")
     & P ("system.health.warning", "ostrzeżenie")
     & P ("system.health.critical", "stan krytyczny")
     & P ("system.health.unavailable", "niedostępny")
     & P ("system.health.unknown_health", "nieznana kondycja")
     & P ("system.readiness.ready", "gotowy")
     & P ("system.readiness.not_ready", "niegotowy")
     & P ("system.readiness.starting", "uruchamianie")
     & P ("system.readiness.draining", "opróżnianie")
     & P ("system.readiness.stopped", "zatrzymany")
     & P ("system.readiness.unknown_readiness", "nieznana gotowość")
     & P ("system.component.online", "online")
     & P ("system.component.offline", "offline")
     & P ("system.component.starting", "uruchamianie")
     & P ("system.component.stopping", "zatrzymywanie")
     & P ("system.component.restarting", "ponowne uruchamianie")
     & P ("system.component.unknown", "nieznany stan komponentu")
     & P ("system.check.passing", "zaliczona")
     & P ("system.check.failing", "niezaliczona")
     & P ("system.check.warning", "ostrzeżenie")
     & P ("system.check.skipped", "pominięta")
     & P ("system.check.timed_out", "przekroczono limit czasu")
     & P ("system.check.unknown", "nieznany stan kontroli")
     & P ("system.incident.investigating", "badanie")
     & P ("system.incident.identified", "zidentyfikowano")
     & P ("system.incident.monitoring", "monitorowanie")
     & P ("system.incident.resolved", "rozwiązano")
     & P ("system.incident.scheduled_maintenance", "zaplanowana konserwacja")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "kontrola {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {brak komponentów} one {{count} komponent} few "
          & "{{count} komponenty} many {{count} komponentów} other {{count} "
          & "komponentu}}")
     & P ("system.count.checks",
          "{count, plural, =0 {brak kontroli} one {{count} kontrola} few {{count} "
          & "kontrole} many {{count} kontroli} other {{count} kontroli}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {brak incydentów} one {{count} incydent} few "
          & "{{count} incydenty} many {{count} incydentów} other {{count} "
          & "incydentu}}")
     & P ("system.uptime", "dostępność {measure}")
     & P ("system.latency", "opóźnienie {measure}")
     & P ("system.maintenance_window", "okno serwisowe {time}")
     & P ("system.last_checked", "ostatnie sprawdzenie {time}")
     & P ("system.http.informational", "informacja")
     & P ("system.http.successful", "sukces")
     & P ("system.http.redirection", "przekierowanie")
     & P ("system.http.client_error", "błąd klienta")
     & P ("system.http.server_error", "błąd serwera")
     & P ("system.exit.success", "kod wyjścia {code}: sukces")
     & P ("system.exit.failure", "kod wyjścia {code}: błąd")
     & P ("system.exit.usage_error", "kod wyjścia {code}: niepoprawne użycie")
     & P ("system.exit.not_executable", "kod wyjścia {code}: nie można wykonać polecenia")
     & P ("system.exit.not_found", "kod wyjścia {code}: nie znaleziono polecenia")
     & P ("system.exit.invalid_argument", "kod wyjścia {code}: nieprawidłowy argument polecenia exit")
     & P ("system.exit.signal", "kod wyjścia {code}: zakończono sygnałem {signal}")
     & P ("validation.problem.required", "{field}: to pole jest wymagane")
     & P ("validation.problem.minimum", "{field}: wartość poniżej minimum")
     & P ("validation.problem.maximum", "{field}: wartość powyżej maksimum")
     & P ("validation.problem.range", "{field}: wartość poza zakresem")
     & P ("validation.problem.pattern", "{field}: wartość nie pasuje do wzorca")
     & P ("validation.problem.choice", "{field}: wartość musi być jedną z dozwolonych opcji")
     & P ("validation.problem.dependency", "{field}: zależy od innego pola")
     & P ("validation.problem.custom", "{field}: nieprawidłowa wartość")
     & P ("validation.constraint.no_relation", "{field}: nieprawidłowa wartość, oczekiwano: {value}")
     & P ("validation.constraint.less_than", "{field}: wartość musi być mniejsza niż {value}")
     & P ("validation.constraint.less_or_equal", "{field}: wartość może wynosić najwyżej {value}")
     & P ("validation.constraint.greater_than", "{field}: wartość musi być większa niż {value}")
     & P ("validation.constraint.greater_or_equal", "{field}: wartość musi wynosić co najmniej {value}")
     & P ("validation.constraint.equal_to", "{field}: wartość musi być równa {value}")
     & P ("validation.constraint.not_equal_to", "{field}: wartość nie może być równa {value}")
     & P ("validation.constraint.before_field", "{field}: wartość musi być wcześniejsza niż {value}")
     & P ("validation.constraint.after_field", "{field}: wartość musi być późniejsza niż {value}")
     & P ("validation.choices", "{field}: dozwolone wartości: {choices}")
     & P ("frame.detail", "{text} ({detail})")
     & P ("frame.got", "{text}, podano {actual}")
     & P ("frame.also", "{text}, {detail}")
     & P ("frame.retry", "{text}, ponowna próba za {time}")
     & P ("net_diagnostic.dns", "{endpoint}: błąd wyszukiwania DNS")
     & P ("net_diagnostic.tcp", "{endpoint}: nie udało się nawiązać połączenia TCP")
     & P ("net_diagnostic.tls", "{endpoint}: błąd certyfikatu TLS")
     & P ("net_diagnostic.http", "{endpoint}: żądanie HTTP nie powiodło się")
     & P ("net_diagnostic.proxy", "{endpoint}: błąd serwera proxy")
     & P ("net_diagnostic.timeout", "{endpoint}: przekroczono limit czasu")
     & P ("net_diagnostic.reset", "{endpoint}: połączenie zostało zresetowane")
     & P ("net_diagnostic.unknown_network", "{endpoint}: błąd sieci")
     & P ("progress.state.not_started", "nie rozpoczęto")
     & P ("progress.state.running", "w toku")
     & P ("progress.state.stalled", "zablokowane")
     & P ("progress.state.retrying", "ponawianie")
     & P ("progress.state.complete", "ukończone")
     & P ("progress.state.failed", "nieudane")
     & P ("progress.of", "{subject}: ukończono {done} z {total} ({percent}%), {state}")
     & P ("progress.done", "{subject}: ukończono {done}, {state}")
     & P ("collection.summary",
          "{name}: {total} {total, plural, one {element} few {elementy} many "
          & "{elementów} other {elementu}}, {unique} {unique, plural, one "
          & "{unikalna wartość} few {unikalne wartości} many {unikalnych "
          & "wartości} other {unikalnej wartości}}, {duplicates} {duplicates, "
          & "plural, one {duplikat} few {duplikaty} many {duplikatów} other "
          & "{duplikatu}}, {outliers} {outliers, plural, one {wartość odstająca} "
          & "few {wartości odstające} many {wartości odstających} other "
          & "{wartości odstającej}}")
     & P ("top_frequency",
          "{name}: {value} ({count} {count, plural, one {raz} few {razy} many "
          & "{razy} other {raza}})");
end Locale_Pl;
