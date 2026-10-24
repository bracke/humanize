separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Pl (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "pl", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
begin
   P ("all_count",
      "łącznie {total} {total, plural, one {{one}} few {{few}} many "
      & "{{genitive_other}} other {{genitive_one}}}");
   P ("filtered_count.none", "brak pasujących {genitive_other}");
   P ("filtered_count.all",
      "{gender, select, masculine_animate {pasują wszyscy: {total} {total, "
      & "plural, one {{one}} few {{few}} many {{genitive_other}} other "
      & "{{genitive_one}}}} other {pasują wszystkie: {total} {total, plural, "
      & "one {{one}} few {{few}} many {{genitive_other}} other "
      & "{{genitive_one}}}}}");
   P ("filtered_count.some",
      "{matching, plural, one {pasuje} few {pasują} many {pasuje} other "
      & "{pasuje}} {matching} z {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("more_count", "wyświetlono {visible}, +{remaining} więcej");
   P ("others_count", "{first} i jeszcze {remaining}");
   P ("page_count", "strona {page} z {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} few {{few}} many {{genitive_other}} "
      & "other {{genitive_one}}} na stronę");
   P ("pagination_range",
      "{first}–{last} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("position_count", "{position} z {total}");
   P ("selection_count",
      "wybrano {selected} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("showing_count",
      "wyświetlono {showing} z {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("validation_count",
      "{count, plural, =0 {brak {severity, select, error {błędów} warning "
      & "{ostrzeżeń} other {uwag}}} one {1 {severity, select, error {błąd} "
      & "warning {ostrzeżenie} other {uwaga}}} few {{count} {severity, select, "
      & "error {błędy} warning {ostrzeżenia} other {uwagi}}} many {{count} "
      & "{severity, select, error {błędów} warning {ostrzeżeń} other "
      & "{uwag}}} other {{count} {severity, select, error {błędu} warning "
      & "{ostrzeżenia} other {uwagi}}}}");
   P ("collection.empty", "brak {genitive_other}");
   P ("collection.none_shown", "nie wyświetlono żadnych {genitive_other}");
   P ("collection.showing_hidden",
      "wyświetlono {visible} z {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}, ukryto {hidden}");
   P ("collection.showing",
      "wyświetlono {visible} z {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("collection.shown_hidden",
      "wyświetlono {visible} {visible, plural, one {{accusative_one}} few "
      & "{{accusative_other}} many {{genitive_other}} other {{genitive_one}}}, "
      & "ukryto {hidden}");
   P ("collection.shown",
      "wyświetlono {visible} {visible, plural, one {{accusative_one}} few "
      & "{{accusative_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("collection.visible_out_of",
      "{gender, select, masculine_animate {widoczni: {visible} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_other}} other {{genitive_one}}}} other {widoczne: {visible} "
      & "z {total} {total, plural, one {{genitive_one}} few {{genitive_other}} "
      & "many {{genitive_other}} other {{genitive_one}}}}}");
   P ("complete_count", "ukończono {done} z {total}");
   P ("percent_complete", "ukończono {percent}%");
   P ("step_count", "krok {step} z {total}");
   P ("attempt_count", "próba {attempt} z {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {pozostaje} few {pozostają} many {pozostaje} "
      & "other {pozostaje}} {remaining} {remaining, plural, one {{one}} few "
      & "{{few}} many {{genitive_other}} other {{genitive_one}}}, {rate} "
      & "{unit}/s");
   P ("accessible_progress", "ukończono {done} z {total}, {percent} procent");
   P ("business_days",
      "{days, plural, one {{days} dzień roboczy} few {{days} dni robocze} "
      & "many {{days} dni roboczych} other {{days} dnia roboczego}}");
   P ("working_hours",
      "{hours, plural, one {{hours} godzina robocza} few {{hours} godziny "
      & "robocze} many {{hours} godzin roboczych} other {{hours} godziny "
      & "roboczej}}");
   P ("due.overdue",
      "{days, plural, one {{days} dzień} few {{days} dni} many {{days} dni} "
      & "other {{days} dnia}} po terminie");
   P ("due.today", "termin dzisiaj");
   P ("due.tomorrow", "termin jutro");
   P ("due.in",
      "termin za {days, plural, one {{days} dzień} few {{days} dni} many "
      & "{{days} dni} other {{days} dnia}}");
   P ("calendar_difference.future", "za {difference}");
   P ("calendar_difference.past", "{difference} temu");
   P ("calendar_difference.case.future", "accusative");
   P ("calendar_difference.case.past", "accusative");
   P ("cpu_load", "obciążenie CPU {measure}");
   P ("battery", "bateria {measure}");
   P ("screen_size", "ekran {measure}");
   P ("refresh_rate", "częstotliwość odświeżania {measure}");
   P ("editorial_percent.symbol", "{value}%");
   P ("editorial_percent.word", "{value} procent");
   P ("recurrence.second",
      "{every, plural, =1 {co sekundę} one {co {every} sekundę} few {co "
      & "{every} sekundy} many {co {every} sekund} other {co {every} sekundy}}");
   P ("recurrence.minute",
      "{every, plural, =1 {co minutę} one {co {every} minutę} few {co "
      & "{every} minuty} many {co {every} minut} other {co {every} minuty}}");
   P ("recurrence.hour",
      "{every, plural, =1 {co godzinę} one {co {every} godzinę} few {co "
      & "{every} godziny} many {co {every} godzin} other {co {every} godziny}}");
   P ("recurrence.day",
      "{every, plural, =1 {codziennie} one {co {every} dzień} few {co "
      & "{every} dni} many {co {every} dni} other {co {every} dnia}}");
   P ("recurrence.week",
      "{every, plural, =1 {co tydzień} one {co {every} tydzień} few {co "
      & "{every} tygodnie} many {co {every} tygodni} other {co {every} "
      & "tygodnia}}");
   P ("recurrence.month",
      "{every, plural, =1 {co miesiąc} one {co {every} miesiąc} few {co "
      & "{every} miesiące} many {co {every} miesięcy} other {co {every} "
      & "miesiąca}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {co kwartał} one {co {every} kwartał} few {co "
      & "{every} kwartały} many {co {every} kwartałów} other {co {every} "
      & "kwartału}}");
   P ("recurrence.year",
      "{every, plural, =1 {co roku} one {co {every} rok} few {co {every} "
      & "lata} many {co {every} lat} other {co {every} roku}}");
   P ("cache_summary.empty", "pamięć podręczna: brak żądań");
   P ("cache_summary",
      "pamięć podręczna: {hits, plural, one {{hits} trafienie} few {{hits} "
      & "trafienia} many {{hits} trafień} other {{hits} trafienia}}, {misses, "
      & "plural, one {{misses} chybienie} few {{misses} chybienia} many "
      & "{{misses} chybień} other {{misses} chybienia}}, skuteczność {rate}%");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} few {{few}} many "
      & "{{genitive_other}} other {{genitive_one}}}: zmieniono {changed}, "
      & "dodano {added}, usunięto {removed}");
   P ("field_diff", "{field}: zmieniono z {before} na {after}");
   P ("field_added", "{field}: dodano z wartością {value}");
   P ("field_removed", "{field}: usunięto (poprzednio {value})");
   P ("field_unchanged", "{field}: bez zmian ({value})");
   P ("number_comparison.equal", "{current} równa się {baseline}");
   P ("number_comparison.higher", "{current} to o {quantity} więcej niż {baseline}");
   P ("number_comparison.lower", "{current} to o {quantity} mniej niż {baseline}");
   P ("percent_comparison.equal", "{current} równa się {baseline}");
   P ("percent_comparison.higher", "{current} to o {quantity} więcej niż {baseline}");
   P ("percent_comparison.lower", "{current} to o {quantity} mniej niż {baseline}");
   P ("file_size_comparison.same", "{current} ma taki sam rozmiar jak {baseline}");
   P ("file_size_comparison.larger", "{current} ma rozmiar o {quantity} większy niż {baseline}");
   P ("file_size_comparison.smaller", "{current} ma rozmiar o {quantity} mniejszy niż {baseline}");
   P ("date_comparison.same", "{current} to ta sama data co {baseline}");
   P ("date_comparison.after", "{current} to o {quantity} później niż {baseline}");
   P ("date_comparison.before", "{current} to o {quantity} wcześniej niż {baseline}");
   P ("queue_summary", "kolejka: {details}");
   P ("queue_summary.empty", "kolejka pusta");
   P ("domain_summary",
      "{domain, select, queue {kolejka} job {zadanie} run {przebieg} cache "
      & "{pamięć podręczna} sync {synchronizacja} import {import} export "
      & "{eksport} other {{domain}}} – {state, select, queued {w kolejce} "
      & "running {w toku} waiting {oczekiwanie} paused {wstrzymano} complete "
      & "{ukończono} failed {niepowodzenie} stale {nieaktualne} skipped "
      & "{pominięto} other {{state}}}: {details}");
   P ("summary.none", "brak {genitive_other}");
   P ("summary.completed",
      "ukończono {count} {count, plural, one {{accusative_one}} few "
      & "{{accusative_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("summary.completed_of",
      "ukończono {count} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("summary.failed", "nieudane: {count}");
   P ("summary.queued",
      "w kolejce: {count} {count, plural, one {{one}} few {{few}} many "
      & "{{genitive_other}} other {{genitive_one}}}");
   P ("summary.running", "w toku: {count}");
   P ("summary.complete", "ukończone: {count}");
   P ("backup.backup_running", "kopia zapasowa w toku");
   P ("backup.backup_completed", "kopia zapasowa ukończona");
   P ("backup.backup_failed", "kopia zapasowa nieudana");
   P ("backup.backup_stale", "kopia zapasowa nieaktualna");
   P ("incident.incident_investigating", "badanie incydentu");
   P ("incident.incident_identified", "incydent zidentyfikowany");
   P ("incident.incident_mitigated", "incydent złagodzony");
   P ("incident.incident_resolved", "incydent rozwiązany");
   P ("release.release_drafting", "wydanie w przygotowaniu");
   P ("release.release_ready", "wydanie gotowe");
   P ("release.release_published", "wydanie opublikowane");
   P ("release.release_rolled_back", "wydanie wycofane");
   P ("audit.audit_created", "wpis audytu utworzony");
   P ("audit.audit_updated", "wpis audytu zaktualizowany");
   P ("audit.audit_deleted", "wpis audytu usunięty");
   P ("audit.audit_restored", "wpis audytu przywrócony");
   P ("flag.flag_enabled", "flaga funkcji włączona");
   P ("flag.flag_disabled", "flaga funkcji wyłączona");
   P ("flag.flag_rolling_out", "flaga funkcji wdrażana stopniowo");
   P ("flag.flag_rolled_back", "flaga funkcji wycofana");
   P ("webhook.webhook_pending", "webhook oczekuje");
   P ("webhook.webhook_delivered", "webhook dostarczony");
   P ("webhook.webhook_failed", "webhook nieudany");
   P ("webhook.webhook_retrying", "webhook: ponowna próba");
   P ("api_key.api_key_active", "klucz API aktywny");
   P ("api_key.api_key_revoked", "klucz API unieważniony");
   P ("api_key.api_key_expired", "klucz API wygasł");
   P ("api_key.api_key_rotated", "klucz API wymieniony");
   P ("quota.quota_available", "limit dostępny");
   P ("quota.quota_near_limit", "limit prawie wyczerpany");
   P ("quota.quota_exceeded", "limit przekroczony");
   P ("quota.quota_reset", "limit zresetowany");
   P ("invoice.invoice_draft", "szkic faktury");
   P ("invoice.invoice_sent", "faktura wysłana");
   P ("invoice.invoice_paid", "faktura opłacona");
   P ("invoice.invoice_refunded", "faktura: zwrot środków");
   P ("invoice.invoice_overdue", "faktura przeterminowana");
   P ("invoice.refund_failed", "zwrot środków nieudany");
   P ("page_navigation.only", "jedyna strona");
   P ("page_navigation.first", "pierwsza strona, dostępna następna");
   P ("page_navigation.last", "ostatnia strona, dostępna poprzednia");
   P ("page_navigation.middle", "dostępne poprzednia i następna");
   P ("end_of_week", "koniec tygodnia");
   P ("end_of_month", "koniec miesiąca");
   P ("end_of_quarter", "koniec kwartału");
   P ("time_of_day.night", "noc");
   P ("time_of_day.morning", "rano");
   P ("time_of_day.afternoon", "popołudnie");
   P ("time_of_day.evening", "wieczór");
   P ("calendar_difference.same_day", "tego samego dnia");
   P ("calendar_difference.zero", "0 dni");
   P ("access.allowed", "dozwolone");
   P ("access.denied", "odmówiono");
   P ("access.owner", "właściciel");
   P ("access.admin", "administrator");
   P ("access.viewer", "przeglądający");
   P ("access.editor", "edytujący");
   P ("auth.signed_in", "zalogowano");
   P ("auth.signed_out", "wylogowano");
   P ("auth.session_expired", "sesja wygasła");
   P ("auth.locked", "zablokowano");
   P ("auth.two_factor_required", "wymagane uwierzytelnianie dwuskładnikowe");
   P ("billing.trialing", "okres próbny");
   P ("billing.payment_due", "do zapłaty");
   P ("billing.payment_failed", "płatność nieudana");
   P ("billing.paid", "opłacono");
   P ("billing.past_due", "po terminie");
   P ("billing.canceled", "anulowano");
   P ("ci.pipeline_pending", "potok oczekuje");
   P ("ci.pipeline_running", "potok w toku");
   P ("ci.pipeline_passed", "potok zakończony powodzeniem");
   P ("ci.pipeline_failed", "potok nieudany");
   P ("ci.review_required", "wymagany przegląd");
   P ("ci.deploy_blocked", "wdrożenie zablokowane");
   P ("collaboration.active_now", "aktywny teraz");
   P ("collaboration.away", "nieobecny");
   P ("collaboration.do_not_disturb", "nie przeszkadzać");
   P ("collaboration.typing", "pisze");
   P ("collaboration.viewing", "przegląda");
   P ("collaboration.editing", "edytuje");
   P ("deployment.deploying", "wdrażanie");
   P ("deployment.deployed", "wdrożono");
   P ("deployment.rolling_back", "wycofywanie");
   P ("deployment.rolled_back", "wycofano");
   P ("deployment.build_failed", "kompilacja nieudana");
   P ("deployment.checks_passed", "testy zaliczone");
   P ("empty.no_items", "brak elementów");
   P ("empty.no_results", "brak wyników");
   P ("empty.no_messages", "brak wiadomości");
   P ("empty.no_selection", "brak zaznaczenia");
   P ("empty.nothing_to_show", "nic do wyświetlenia");
   P ("file.uploading", "przesyłanie");
   P ("file.downloading", "pobieranie");
   P ("file.copying", "kopiowanie");
   P ("file.moving", "przenoszenie");
   P ("file.deleting", "usuwanie");
   P ("file.deleted", "usunięto");
   P ("file.restoring", "przywracanie");
   P ("file.synced", "zsynchronizowano");
   P ("form.valid_input", "prawidłowe dane");
   P ("form.invalid_input", "nieprawidłowe dane");
   P ("form.dirty", "zmieniono");
   P ("form.pristine", "bez zmian");
   P ("form.submitted", "wysłano");
   P ("form.submission_failed", "wysyłanie nieudane");
   P ("health.healthy", "sprawny");
   P ("health.degraded", "obniżona wydajność");
   P ("health.unhealthy", "niesprawny");
   P ("health.incident", "incydent");
   P ("health.maintenance", "konserwacja");
   P ("health.recovering", "przywracanie działania");
   P ("issue.open", "otwarte");
   P ("issue.closed", "zamknięte");
   P ("issue.reopened", "ponownie otwarte");
   P ("issue.assigned", "przypisane");
   P ("issue.unassigned", "nieprzypisane");
   P ("issue.merged", "scalone");
   P ("network.offline", "offline");
   P ("network.online", "online");
   P ("network.connecting", "łączenie");
   P ("network.syncing", "synchronizacja");
   P ("network.sync_failed", "synchronizacja nieudana");
   P ("network.permission_denied", "brak uprawnień");
   P ("network.read_only", "tylko do odczytu");
   P ("notification.unread", "nieprzeczytane");
   P ("notification.read", "przeczytane");
   P ("notification.muted", "wyciszone");
   P ("notification.snoozed", "odłożone");
   P ("notification.sent", "wysłane");
   P ("notification.delivered", "dostarczone");
   P ("payment.payment_authorized", "płatność autoryzowana");
   P ("payment.payment_captured", "płatność pobrana");
   P ("payment.payment_refunded", "płatność zwrócona");
   P ("payment.payment_disputed", "płatność zakwestionowana");
   P ("payment.payment_requires_action", "płatność wymaga działania");
   P ("payment.payment_expired", "płatność wygasła");
   P ("ui.empty", "pusto");
   P ("ui.loading", "wczytywanie");
   P ("ui.saving", "zapisywanie");
   P ("ui.saved", "zapisano");
   P ("ui.unsaved", "niezapisane");
   P ("ui.retrying", "ponawianie");
   P ("ui.paused", "wstrzymano");
   P ("ui.complete", "ukończono");
   P ("ui.failed", "niepowodzenie");
   P ("ui.due_soon", "wkrótce termin");
   P ("ui.overdue", "po terminie");
   P ("ui.last_seen", "ostatnio widziany");
   P ("ui.updated_just_now", "zaktualizowano przed chwilą");
   P ("queue.queued", "w kolejce");
   P ("queue.running", "w toku");
   P ("queue.waiting", "oczekiwanie");
   P ("queue.blocked", "zablokowane");
   P ("queue.canceled_job", "zadanie anulowane");
   P ("queue.completed_job", "zadanie ukończone");
   P ("search.filtering", "filtrowanie");
   P ("search.filtered", "przefiltrowano");
   P ("search.no_matches", "brak dopasowań");
   P ("search.search_ready", "wyszukiwanie gotowe");
   P ("search.search_failed", "wyszukiwanie nieudane");
   P ("search.query_too_short", "zapytanie za krótkie");
   P ("security.secure", "bezpieczne");
   P ("security.insecure", "niezabezpieczone");
   P ("security.vulnerable", "podatne na ataki");
   P ("security.encrypted", "zaszyfrowane");
   P ("security.unencrypted", "niezaszyfrowane");
   P ("security.token_expired", "token wygasł");
   P ("sync.sync_idle", "synchronizacja bezczynna");
   P ("sync.syncing_now", "trwa synchronizacja");
   P ("sync.sync_queued", "synchronizacja w kolejce");
   P ("sync.sync_conflict", "konflikt synchronizacji");
   P ("sync.sync_complete", "synchronizacja ukończona");
   P ("sync.sync_error", "błąd synchronizacji");
   P ("task.todo", "do zrobienia");
   P ("task.in_progress", "w toku");
   P ("task.done", "gotowe");
   P ("task.skipped", "pominięto");
   P ("task.blocked_task", "zablokowane");
   P ("task.waiting_on", "oczekuje na");
   P ("ticket.ticket_new", "nowe zgłoszenie");
   P ("ticket.ticket_open", "zgłoszenie otwarte");
   P ("ticket.ticket_waiting", "zgłoszenie oczekuje");
   P ("ticket.ticket_escalated", "zgłoszenie eskalowane");
   P ("ticket.ticket_resolved", "zgłoszenie rozwiązane");
   P ("ticket.ticket_closed", "zgłoszenie zamknięte");
   P ("transfer.importing", "importowanie");
   P ("transfer.imported", "zaimportowano");
   P ("transfer.import_failed", "import nieudany");
   P ("transfer.exporting", "eksportowanie");
   P ("transfer.exported", "wyeksportowano");
   P ("transfer.export_failed", "eksport nieudany");
   P ("validation.required", "wymagane");
   P ("validation.optional", "opcjonalne");
   P ("validation.invalid", "nieprawidłowe");
   P ("validation.too_short", "za krótkie");
   P ("validation.too_long", "za długie");
   P ("validation.out_of_range", "poza zakresem");
   P ("validation.already_exists", "już istnieje");
   P ("workflow.draft", "wersja robocza");
   P ("workflow.in_review", "w przeglądzie");
   P ("workflow.approved", "zatwierdzono");
   P ("workflow.rejected", "odrzucono");
   P ("workflow.published", "opublikowano");
   P ("workflow.archived", "zarchiwizowano");
   P ("database.database_online", "baza danych online");
   P ("database.database_offline", "baza danych offline");
   P ("database.database_degraded", "baza danych działa z ograniczeniami");
   P ("database.database_migrating", "migracja bazy danych");
   P ("database.database_migration_failed", "migracja bazy danych nieudana");
   P ("database.database_replicating", "replikacja bazy danych");
   P ("database.database_replication_lagging", "opóźnienie replikacji bazy danych");
   P ("database.database_backup_running", "kopia zapasowa bazy danych w toku");
   P ("database.database_backup_failed", "kopia zapasowa bazy danych nieudana");
   P ("date_comparison.case.after", "accusative");
   P ("date_comparison.case.before", "accusative");
   P ("count",
      "{count, plural, one {# {one}} few {# {few}} many {# {genitive_other}} "
      & "other {# {genitive_one}}}");
   P ("noun",
      "{count, plural, one {{one}} few {{few}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("noun.accusative",
      "{count, plural, one {{accusative_one}} few {{accusative_other}} many "
      & "{{genitive_other}} other {{genitive_one}}}");
   P ("number_comparison.case", "accusative");
   P ("times_noun",
      "{count, plural, =0 {nigdy {other}} =1 {raz {one}} =2 {dwa razy "
      & "{other}} other {{count} razy {other}}}");
   P ("availability.all",
      "{gender, select, masculine_animate {dostępni: {available} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_other}} other {{genitive_one}}}} other {dostępne: "
      & "{available} z {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}}}");
   P ("availability.none", "brak dostępnych {genitive_other}");
   P ("availability.partial",
      "{gender, select, masculine_animate {dostępni: {available} z {total} "
      & "{total, plural, one {{genitive_one}} few {{genitive_other}} many "
      & "{{genitive_other}} other {{genitive_one}}}, niedostępni: "
      & "{unavailable}} other {dostępne: {available} z {total} {total, plural, "
      & "one {{genitive_one}} few {{genitive_other}} many {{genitive_other}} "
      & "other {{genitive_one}}}, niedostępne: {unavailable}}}");
   P ("operation_progress", "{name} – {state}: {details}");
   P ("operation.queued", "w kolejce");
   P ("operation.running", "w toku");
   P ("operation.blocked", "zablokowane");
   P ("operation.retrying", "ponawianie");
   P ("operation.succeeded", "zakończono pomyślnie");
   P ("operation.partially_succeeded", "częściowo pomyślnie");
   P ("operation.failed", "niepowodzenie");
   P ("operation.canceled", "anulowano");
   P ("operation.skipped", "pominięto");
   P ("operation.stale", "nieaktualne");
   P ("operation.unknown_state", "nieznane");
   P ("operation.last_success", "{name}: ostatni sukces {time}");
   P ("operation.next_retry", "{name}: następna próba {time}");
   P ("operation.stale_run", "{name} – nieaktualne: {time}");
   P ("summary.skipped", "pominięte: {count}");
   P ("summary.retried", "ponowione: {count}");
   P ("summary.canceled", "anulowane: {count}");
   P ("system.service.operational", "działa");
   P ("system.service.degraded", "obniżona wydajność");
   P ("system.service.partial_outage", "częściowa awaria");
   P ("system.service.major_outage", "poważna awaria");
   P ("system.service.maintenance", "w trakcie konserwacji");
   P ("system.service.unknown", "nieznany stan usługi");
   P ("system.health.healthy", "w normie");
   P ("system.health.warning", "ostrzeżenie");
   P ("system.health.critical", "stan krytyczny");
   P ("system.health.unavailable", "niedostępny");
   P ("system.health.unknown_health", "nieznana kondycja");
   P ("system.readiness.ready", "gotowy");
   P ("system.readiness.not_ready", "niegotowy");
   P ("system.readiness.starting", "uruchamianie");
   P ("system.readiness.draining", "opróżnianie");
   P ("system.readiness.stopped", "zatrzymany");
   P ("system.readiness.unknown_readiness", "nieznana gotowość");
   P ("system.component.online", "online");
   P ("system.component.offline", "offline");
   P ("system.component.starting", "uruchamianie");
   P ("system.component.stopping", "zatrzymywanie");
   P ("system.component.restarting", "ponowne uruchamianie");
   P ("system.component.unknown", "nieznany stan komponentu");
   P ("system.check.passing", "zaliczona");
   P ("system.check.failing", "niezaliczona");
   P ("system.check.warning", "ostrzeżenie");
   P ("system.check.skipped", "pominięta");
   P ("system.check.timed_out", "przekroczono limit czasu");
   P ("system.check.unknown", "nieznany stan kontroli");
   P ("system.incident.investigating", "badanie");
   P ("system.incident.identified", "zidentyfikowano");
   P ("system.incident.monitoring", "monitorowanie");
   P ("system.incident.resolved", "rozwiązano");
   P ("system.incident.scheduled_maintenance", "zaplanowana konserwacja");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "kontrola {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {brak komponentów} one {{count} komponent} few "
      & "{{count} komponenty} many {{count} komponentów} other {{count} "
      & "komponentu}}");
   P ("system.count.checks",
      "{count, plural, =0 {brak kontroli} one {{count} kontrola} few {{count} "
      & "kontrole} many {{count} kontroli} other {{count} kontroli}}");
   P ("system.count.incidents",
      "{count, plural, =0 {brak incydentów} one {{count} incydent} few "
      & "{{count} incydenty} many {{count} incydentów} other {{count} "
      & "incydentu}}");
   P ("system.uptime", "dostępność {measure}");
   P ("system.latency", "opóźnienie {measure}");
   P ("system.maintenance_window", "okno serwisowe {time}");
   P ("system.last_checked", "ostatnie sprawdzenie {time}");
   P ("system.http.informational", "informacja");
   P ("system.http.successful", "sukces");
   P ("system.http.redirection", "przekierowanie");
   P ("system.http.client_error", "błąd klienta");
   P ("system.http.server_error", "błąd serwera");
   P ("system.exit.success", "kod wyjścia {code}: sukces");
   P ("system.exit.failure", "kod wyjścia {code}: błąd");
   P ("system.exit.usage_error", "kod wyjścia {code}: niepoprawne użycie");
   P ("system.exit.not_executable", "kod wyjścia {code}: nie można wykonać polecenia");
   P ("system.exit.not_found", "kod wyjścia {code}: nie znaleziono polecenia");
   P ("system.exit.invalid_argument", "kod wyjścia {code}: nieprawidłowy argument polecenia exit");
   P ("system.exit.signal", "kod wyjścia {code}: zakończono sygnałem {signal}");
   P ("validation.problem.required", "{field}: to pole jest wymagane");
   P ("validation.problem.minimum", "{field}: wartość poniżej minimum");
   P ("validation.problem.maximum", "{field}: wartość powyżej maksimum");
   P ("validation.problem.range", "{field}: wartość poza zakresem");
   P ("validation.problem.pattern", "{field}: wartość nie pasuje do wzorca");
   P ("validation.problem.choice", "{field}: wartość musi być jedną z dozwolonych opcji");
   P ("validation.problem.dependency", "{field}: zależy od innego pola");
   P ("validation.problem.custom", "{field}: nieprawidłowa wartość");
   P ("validation.constraint.no_relation", "{field}: nieprawidłowa wartość, oczekiwano: {value}");
   P ("validation.constraint.less_than", "{field}: wartość musi być mniejsza niż {value}");
   P ("validation.constraint.less_or_equal", "{field}: wartość może wynosić najwyżej {value}");
   P ("validation.constraint.greater_than", "{field}: wartość musi być większa niż {value}");
   P ("validation.constraint.greater_or_equal", "{field}: wartość musi wynosić co najmniej {value}");
   P ("validation.constraint.equal_to", "{field}: wartość musi być równa {value}");
   P ("validation.constraint.not_equal_to", "{field}: wartość nie może być równa {value}");
   P ("validation.constraint.before_field", "{field}: wartość musi być wcześniejsza niż {value}");
   P ("validation.constraint.after_field", "{field}: wartość musi być późniejsza niż {value}");
   P ("validation.choices", "{field}: dozwolone wartości: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, podano {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, ponowna próba za {time}");
   P ("net_diagnostic.dns", "{endpoint}: błąd wyszukiwania DNS");
   P ("net_diagnostic.tcp", "{endpoint}: nie udało się nawiązać połączenia TCP");
   P ("net_diagnostic.tls", "{endpoint}: błąd certyfikatu TLS");
   P ("net_diagnostic.http", "{endpoint}: żądanie HTTP nie powiodło się");
   P ("net_diagnostic.proxy", "{endpoint}: błąd serwera proxy");
   P ("net_diagnostic.timeout", "{endpoint}: przekroczono limit czasu");
   P ("net_diagnostic.reset", "{endpoint}: połączenie zostało zresetowane");
   P ("net_diagnostic.unknown_network", "{endpoint}: błąd sieci");
   P ("progress.state.not_started", "nie rozpoczęto");
   P ("progress.state.running", "w toku");
   P ("progress.state.stalled", "zablokowane");
   P ("progress.state.retrying", "ponawianie");
   P ("progress.state.complete", "ukończone");
   P ("progress.state.failed", "nieudane");
   P ("progress.of", "{subject}: ukończono {done} z {total} ({percent}%), {state}");
   P ("progress.done", "{subject}: ukończono {done}, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {element} few {elementy} many "
      & "{elementów} other {elementu}}, {unique} {unique, plural, one "
      & "{unikalna wartość} few {unikalne wartości} many {unikalnych "
      & "wartości} other {unikalnej wartości}}, {duplicates} {duplicates, "
      & "plural, one {duplikat} few {duplikaty} many {duplikatów} other "
      & "{duplikatu}}, {outliers} {outliers, plural, one {wartość odstająca} "
      & "few {wartości odstające} many {wartości odstających} other "
      & "{wartości odstającej}}");
   P ("top_frequency",
      "{name}: {value} ({count} {count, plural, one {raz} few {razy} many "
      & "{razy} other {raza}})");
   P ("calendar_date.fiscal_year", "RO {year}");
   P ("calendar_date.fiscal_quarter", "RO {year} {part}. kw.");
   P ("calendar_date.fiscal_half", "RO {year} {part}. półr.");
   P ("calendar_date.fiscal_year_end", "koniec RO {year}");
   P ("calendar_date.semester", "{part}. sem. {year}");
   P ("calendar_date.half_year", "{part}. półr. {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {pierwsza połowa {year} roku} other {druga połowa "
      & "{year} roku}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} (początek)} mid {{text} (połowa)} "
      & "other {{text} (koniec)}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {początek {text}} mid {połowa {text}} other "
      & "{koniec {text}}}");
   P ("calendar_range.weekend.last", "zeszły weekend");
   P ("calendar_range.weekend.this", "ten weekend");
   P ("calendar_range.weekend.next", "następny weekend");
   P ("calendar_range.weekend_of", "weekend {date}");
   P ("calendar_range.week.last", "zeszły tydzień");
   P ("calendar_range.week.this", "ten tydzień");
   P ("calendar_range.week.next", "następny tydzień");
   P ("calendar_range.week_of", "tydzień od {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "kontynuuj");
   P ("http.reason.101", "zmiana protokołów");
   P ("http.reason.102", "przetwarzanie");
   P ("http.reason.103", "wczesne wskazówki");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "utworzono");
   P ("http.reason.202", "zaakceptowano");
   P ("http.reason.203", "informacja nieautorytatywna");
   P ("http.reason.204", "brak treści");
   P ("http.reason.205", "zresetuj treść");
   P ("http.reason.206", "częściowa treść");
   P ("http.reason.207", "wiele stanów");
   P ("http.reason.208", "już zgłoszono");
   P ("http.reason.226", "zastosowano IM");
   P ("http.reason.300", "wiele możliwości");
   P ("http.reason.301", "trwale przeniesiono");
   P ("http.reason.302", "znaleziono");
   P ("http.reason.303", "zobacz inne");
   P ("http.reason.304", "nie zmodyfikowano");
   P ("http.reason.305", "użyj serwera proxy");
   P ("http.reason.307", "tymczasowe przekierowanie");
   P ("http.reason.308", "trwałe przekierowanie");
   P ("http.reason.400", "nieprawidłowe żądanie");
   P ("http.reason.401", "brak autoryzacji");
   P ("http.reason.402", "wymagana płatność");
   P ("http.reason.403", "zabronione");
   P ("http.reason.404", "nie znaleziono");
   P ("http.reason.405", "niedozwolona metoda");
   P ("http.reason.406", "nieakceptowalne");
   P ("http.reason.407", "wymagane uwierzytelnienie serwera proxy");
   P ("http.reason.408", "przekroczono czas żądania");
   P ("http.reason.409", "konflikt");
   P ("http.reason.410", "zasób usunięty");
   P ("http.reason.411", "wymagana długość");
   P ("http.reason.412", "niespełniony warunek wstępny");
   P ("http.reason.413", "zbyt duża treść");
   P ("http.reason.414", "zbyt długi URI");
   P ("http.reason.415", "nieobsługiwany typ nośnika");
   P ("http.reason.416", "nieprawidłowy zakres");
   P ("http.reason.417", "niespełnione oczekiwanie");
   P ("http.reason.418", "jestem czajnikiem");
   P ("http.reason.421", "błędnie skierowane żądanie");
   P ("http.reason.422", "nieprzetwarzalna treść");
   P ("http.reason.423", "zablokowane");
   P ("http.reason.424", "niespełniona zależność");
   P ("http.reason.425", "za wcześnie");
   P ("http.reason.426", "wymagana aktualizacja");
   P ("http.reason.428", "wymagany warunek wstępny");
   P ("http.reason.429", "zbyt wiele żądań");
   P ("http.reason.431", "zbyt duże pola nagłówka żądania");
   P ("http.reason.451", "niedostępne z przyczyn prawnych");
   P ("http.reason.500", "wewnętrzny błąd serwera");
   P ("http.reason.501", "nie zaimplementowano");
   P ("http.reason.502", "błędna brama");
   P ("http.reason.503", "usługa niedostępna");
   P ("http.reason.504", "przekroczono czas bramy");
   P ("http.reason.505", "nieobsługiwana wersja HTTP");
   P ("http.reason.506", "wariant również negocjuje");
   P ("http.reason.507", "za mało miejsca na dane");
   P ("http.reason.508", "wykryto pętlę");
   P ("http.reason.510", "brak rozszerzenia");
   P ("http.reason.511", "wymagane uwierzytelnienie sieciowe");
   P ("errno.reason.0", "sukces");
   P ("errno.reason.1", "operacja niedozwolona");
   P ("errno.reason.2", "nie ma takiego pliku ani katalogu");
   P ("errno.reason.3", "nie ma takiego procesu");
   P ("errno.reason.4", "przerwane wywołanie systemowe");
   P ("errno.reason.5", "błąd wejścia/wyjścia");
   P ("errno.reason.6", "nie ma takiego urządzenia ani adresu");
   P ("errno.reason.9", "błędny deskryptor pliku");
   P ("errno.reason.11", "zasoby chwilowo niedostępne");
   P ("errno.reason.12", "nie można przydzielić pamięci");
   P ("errno.reason.13", "brak dostępu");
   P ("errno.reason.17", "plik istnieje");
   P ("errno.reason.20", "nie jest katalogiem");
   P ("errno.reason.21", "jest katalogiem");
   P ("errno.reason.22", "zły argument");
   P ("errno.reason.24", "za dużo otwartych plików");
   P ("errno.reason.28", "brak miejsca na urządzeniu");
   P ("errno.reason.32", "przerwany potok");
   P ("errno.reason.98", "adres jest już w użyciu");
   P ("errno.reason.110", "przekroczony czas oczekiwania na połączenie");
   P ("errno.reason.111", "połączenie odrzucone");
   P ("signal.reason.1", "rozłączenie");
   P ("signal.reason.2", "przerwanie");
   P ("signal.reason.3", "wyjście");
   P ("signal.reason.4", "błędna instrukcja");
   P ("signal.reason.5", "pułapka debuggera/breakpoint");
   P ("signal.reason.6", "przerwane");
   P ("signal.reason.7", "błąd szyny");
   P ("signal.reason.8", "błąd w obliczeniach zmiennoprzecinkowych");
   P ("signal.reason.9", "unicestwiony");
   P ("signal.reason.10", "sygnał użytkownika 1");
   P ("signal.reason.11", "naruszenie ochrony pamięci");
   P ("signal.reason.12", "sygnał użytkownika 2");
   P ("signal.reason.13", "przerwany potok");
   P ("signal.reason.14", "budzik");
   P ("signal.reason.15", "zakończony");
   P ("signal.reason.17", "potomek zakończył pracę");
   P ("signal.reason.18", "kontynuacja");
   P ("signal.reason.19", "zatrzymany (sygnał)");
   P ("signal.reason.20", "zatrzymany");
   P ("signal.reason.28", "okno zmienione");
   P ("sqlstate.reason.00", "pomyślne zakończenie");
   P ("sqlstate.reason.01", "ostrzeżenie");
   P ("sqlstate.reason.02", "brak danych");
   P ("sqlstate.reason.08", "wyjątek połączenia");
   P ("sqlstate.reason.0a", "nieobsługiwana funkcja");
   P ("sqlstate.reason.22", "wyjątek danych");
   P ("sqlstate.reason.23", "naruszenie ograniczenia integralności");
   P ("sqlstate.reason.24", "nieprawidłowy stan kursora");
   P ("sqlstate.reason.25", "nieprawidłowy stan transakcji");
   P ("sqlstate.reason.28", "nieprawidłowa specyfikacja autoryzacji");
   P ("sqlstate.reason.2d", "nieprawidłowe zakończenie transakcji");
   P ("sqlstate.reason.3d", "nieprawidłowa nazwa katalogu");
   P ("sqlstate.reason.3f", "nieprawidłowa nazwa schematu");
   P ("sqlstate.reason.40", "wycofanie transakcji");
   P ("sqlstate.reason.42", "błąd składni lub naruszenie reguły dostępu");
   P ("sqlstate.reason.53", "niewystarczające zasoby");
   P ("sqlstate.reason.54", "przekroczono limit programu");
   P ("sqlstate.reason.55", "obiekt nie jest w wymaganym stanie");
   P ("sqlstate.reason.57", "interwencja operatora");
   P ("sqlstate.reason.58", "błąd systemowy");
   P ("sqlstate.reason.hv", "błąd opakowania danych obcych");
   P ("sqlstate.reason.p0", "błąd PL/pgSQL");
   P ("sqlstate.reason.xx", "błąd wewnętrzny");
   P ("system.signal_numbered", "sygnał {number} {name} {reason}");
   P ("http.reason.unknown", "nieznany status");
   P ("errno.reason.unknown", "nieznany błąd");
   P ("signal.reason.unknown", "nieznany sygnał");
   P ("sqlstate.reason.unknown", "nieznana klasa SQLSTATE");
   P ("diff.changed", "różnica {path}: zmieniono z {before} na {after}");
   P ("diff.added", "różnica {path}: dodano {after}");
   P ("diff.removed", "różnica {path}: usunięto {before}");
   P ("diff.unchanged", "różnica {path}: bez zmian");
   P ("diff.redacted", "różnica {path}: zmieniono; wartości ukryte");
   P ("validation.result",
      "wynik walidacji: {fields} {fields, plural, one {pole} few {pola} many "
      & "{pól} other {pola}}, {errors} {errors, plural, one {błąd} few "
      & "{błędy} many {błędów} other {błędu}}, {warnings} {warnings, "
      & "plural, one {ostrzeżenie} few {ostrzeżenia} many {ostrzeżeń} other "
      & "{ostrzeżenia}}, {required} {required, plural, one {pole wymagane} few "
      & "{pola wymagane} many {pól wymaganych} other {pola wymaganego}}, "
      & "{hidden} {hidden, plural, one {ukryty problem} few {ukryte problemy} "
      & "many {ukrytych problemów} other {ukrytego problemu}}");
   P ("file.kind.plain", "plik");
   P ("file.kind.directory", "katalog");
   P ("file.kind.archive", "archiwum");
   P ("file.kind.compressed", "plik skompresowany");
   P ("file.kind.image", "obraz");
   P ("file.kind.script", "skrypt");
   P ("file.kind.executable", "plik wykonywalny");
   P ("file.kind.unknown", "nieznany plik");
   P ("file.metadata", "plik {name}: {kind}");
   P ("file.checksum", "{text}, suma kontrolna {checksum}");
   P ("file.signature_match", "sygnatura pliku {name}: {kind}, zgodnie z rozszerzeniem");
   P ("file.signature_mismatch",
      "sygnatura pliku {name}: według rozszerzenia {expected}, według "
      & "zawartości {actual}");
   P ("network_event.connecting", "łączenie");
   P ("network_event.connected", "połączono");
   P ("network_event.redirected", "przekierowano");
   P ("network_event.retrying", "ponawianie");
   P ("network_event.rate_limited", "limit żądań");
   P ("network_event.tls_failed", "błąd TLS");
   P ("network_event.stalled", "brak postępu");
   P ("network_event.complete", "zakończono");
   P ("network_event.failed", "niepowodzenie");
   P ("network.session", "sieć {endpoint}: {state}");
   P ("diff_node.field", "pole");
   P ("diff_node.object", "obiekt");
   P ("diff_node.list", "lista");
   P ("diff.node",
      "węzeł różnicy {path}: {kind}, {count} {count, plural, one {zmiana} "
      & "few {zmiany} many {zmian} other {zmiany}}");
   P ("checksum.not_checked", "suma kontrolna niesprawdzona");
   P ("checksum.valid", "suma kontrolna poprawna");
   P ("checksum.mismatch", "niezgodna suma kontrolna");
   P ("checksum.missing", "brak sumy kontrolnej");
   P ("product_code", "kod produktu {kind}: {value}, {state}");
   P ("time_zone.utc", "strefa czasowa: UTC");
   P ("time_zone.offset", "strefa czasowa: {offset}");
   P ("time_zone.named", "strefa czasowa: {name} ({offset})");
   P ("time_zone.local", "strefa czasowa: czas lokalny");
   P ("time_zone.unknown", "strefa czasowa: nieznana strefa");
   P ("time_zone.dst", "{text}, stosuje czas letni");
   P ("zoned_time.plain", "czas strefowy: {time} {offset}");
   P ("zoned_time.named", "czas strefowy: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, niejednoznaczny czas lokalny");
   P ("number.under", "poniżej {value}");
   P ("number.up_to", "do {value}");
   P ("number.between", "między {low} a {high}");
   P ("number.range_words", "{low} – {high}");
   P ("number.uncertainty_words", "{value} plus minus {delta}");
   P ("number.range_inclusive", "od {low} do {high} włącznie");
   P ("number.range_exclusive", "więcej niż {low} i mniej niż {high}");
   P ("number.range_low_inclusive", "{low} lub więcej i mniej niż {high}");
   P ("number.range_high_inclusive", "więcej niż {low} i co najwyżej {high}");
   P ("number.at_least", "co najmniej {value}");
   P ("number.more_than", "więcej niż {value}");
   P ("number.at_most", "co najwyżej {value}");
   P ("number.less_than", "mniej niż {value}");
   P ("number.exactly", "dokładnie {value}");
   P ("number.within", "{value} mieści się w zakresie {bounds}");
   P ("number.below", "{value} jest poniżej zakresu {bounds}");
   P ("number.above", "{value} jest powyżej zakresu {bounds}");
   P ("number.per", "{numerator} na {denominator}");
   P ("number.one_in", "1 na {whole}");
   P ("number.out_of", "{value} z {whole}");
   P ("number.unchanged", "bez zmian");
   P ("number.change_up", "wzrost o {quantity}");
   P ("number.change_down", "spadek o {quantity}");
   P ("number.change_more", "o {quantity} {tail} więcej");
   P ("number.change_fewer", "o {quantity} {tail} mniej");
   P ("number.since", "{change} (od: {since})");
   P ("duration.countdown", "{duration} do końca");
   P ("duration.within", "w ciągu {duration}");
   P ("duration.next", "na {duration} naprzód");
   P ("duration.between", "od {low} do {high}");
   P ("duration.age", "wiek: {duration}");
   P ("duration.stale_for", "nieaktualne od {duration}");
   P ("duration.backup_age", "kopia zapasowa sprzed {duration}");
   P ("duration.eta", "szacowany czas: {duration}");
   P ("duration.expires", "wygasa {relative}");
   P ("duration.retrying", "ponowna próba {relative}");
   P ("duration.modified", "zmodyfikowano {relative}");
   P ("duration.synced", "zsynchronizowano {relative}");
   P ("duration.modified_now", "zmodyfikowano przed chwilą");
   P ("duration.synced_now", "zsynchronizowano przed chwilą");
   P ("duration.natural.less_than_minute",
      "{case, select, accusative {mniej niż minutę} genitive {mniej niż "
      & "minuty} other {mniej niż minuta}}");
   P ("duration.natural.half_hour", "pół godziny");
   P ("duration.natural.about_half_hour", "około pół godziny");
   P ("duration.natural.about", "około {duration}");
   P ("duration.natural.almost", "prawie {duration}");
   P ("duration.natural.over", "ponad {duration}");
   P ("duration.natural.just_over", "nieco ponad {duration}");
   P ("duration.natural.little_under", "nieco mniej niż {duration}");
   P ("duration.natural.few",
      "{case, select, genitive {{unit, select, second {kilku sekund} minute "
      & "{kilku minut} hour {kilku godzin} day {kilku dni} week {kilku tygodni} "
      & "month {kilku miesięcy} year {kilku lat} other {kilku}}} other {{unit, "
      & "select, second {kilka sekund} minute {kilka minut} hour {kilka godzin} "
      & "day {kilka dni} week {kilka tygodni} month {kilka miesięcy} year "
      & "{kilka lat} other {kilka}}}}");
   P ("duration.distance.past", "{duration} temu");
   P ("duration.distance.future", "za {duration}");
   P ("duration.case.within", "genitive");
   P ("duration.case.next", "accusative");
   P ("duration.case.between", "genitive");
   P ("duration.case.stale_for", "genitive");
   P ("duration.case.backup_age", "genitive");
   P ("duration.case.natural.about", "genitive");
   P ("duration.case.natural.over", "accusative");
   P ("duration.case.natural.just_over", "accusative");
   P ("duration.case.distance.past", "accusative");
   P ("duration.case.distance.future", "accusative");
   P ("geo.direction.north", "{style, select, short {N} other {północ}}");
   P ("geo.direction.north_north_east", "{style, select, short {NNE} other {północ-północny wschód}}");
   P ("geo.direction.north_east", "{style, select, short {NE} other {północny wschód}}");
   P ("geo.direction.east_north_east", "{style, select, short {ENE} other {wschód-północny wschód}}");
   P ("geo.direction.east", "{style, select, short {E} other {wschód}}");
   P ("geo.direction.east_south_east", "{style, select, short {ESE} other {wschód-południowy wschód}}");
   P ("geo.direction.south_east", "{style, select, short {SE} other {południowy wschód}}");
   P ("geo.direction.south_south_east", "{style, select, short {SSE} other {południe-południowy wschód}}");
   P ("geo.direction.south", "{style, select, short {S} other {południe}}");
   P ("geo.direction.south_south_west", "{style, select, short {SSW} other {południe-południowy zachód}}");
   P ("geo.direction.south_west", "{style, select, short {SW} other {południowy zachód}}");
   P ("geo.direction.west_south_west", "{style, select, short {WSW} other {zachód-południowy zachód}}");
   P ("geo.direction.west", "{style, select, short {W} other {zachód}}");
   P ("geo.direction.west_north_west", "{style, select, short {WNW} other {zachód-północny zachód}}");
   P ("geo.direction.north_west", "{style, select, short {NW} other {północny zachód}}");
   P ("geo.direction.north_north_west", "{style, select, short {NNW} other {północ-północny zachód}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} na {direction}");
   P ("geo.about_distance_direction", "około {distance} na {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "południowy zachód: {southwest}; północny wschód: {northeast}");
   P ("geo.inside_box", "w obszarze granicznym");
   P ("geo.outside_box", "poza obszarem granicznym");
   P ("number.about", "około {value}");
   P ("number.almost", "prawie {value}");
   P ("number.over", "ponad {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
end Locale_Pl;
