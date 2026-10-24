separate (Humanize.Catalogs.Phrase_Data.Locale_Pl)
procedure Labels_2 is
begin
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atrybut id} class_attribute {atrybut "
      & "class} data_attribute {atrybut data} aria_attribute {atrybut ARIA} "
      & "role_attribute {atrybut role} link_attribute {atrybut linku} "
      & "media_attribute {atrybut multimediów} form_attribute {atrybut "
      & "formularza} boolean_attribute {atrybut logiczny} event_attribute "
      & "{atrybut obsługi zdarzenia} other {nieznany atrybut}}");
   P ("label.markup.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {{form_name}: brak "
      & "problemów} other {{form_name}: {errors, plural, one {{errors, number} "
      & "błąd} few {{errors, number} błędy} many {{errors, number} "
      & "błędów} other {{errors, number} błędu}}}}} other {{errors, "
      & "plural, =0 {{form_name}: {warnings, plural, one {{warnings, number} "
      & "ostrzeżenie} few {{warnings, number} ostrzeżenia} many {{warnings, "
      & "number} ostrzeżeń} other {{warnings, number} ostrzeżenia}}} other "
      & "{{form_name}: {errors, plural, one {{errors, number} błąd} few "
      & "{{errors, number} błędy} many {{errors, number} błędów} other "
      & "{{errors, number} błędu}}, {warnings, plural, one {{warnings, "
      & "number} ostrzeżenie} few {{warnings, number} ostrzeżenia} many "
      & "{{warnings, number} ostrzeżeń} other {{warnings, number} "
      & "ostrzeżenia}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {punkt orientacyjny: baner} navigation_role "
      & "{punkt orientacyjny: nawigacja} main_role {punkt orientacyjny: treść "
      & "główna} complementary_role {punkt orientacyjny: treść "
      & "uzupełniająca} contentinfo_role {punkt orientacyjny: informacje o "
      & "treści} search_role {punkt orientacyjny: wyszukiwanie} form_role "
      & "{punkt orientacyjny: formularz} region_role {punkt orientacyjny: "
      & "region} dialog_role {okno dialogowe} alert_role {region na żywo: "
      & "alert} status_role {region na żywo: stan} other {nieznany punkt "
      & "orientacyjny}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, pilna aktualizacja: {update}} other "
      & "{{region}, zwykła aktualizacja: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {treść tekstowa} html_content {treść "
      & "HTML} json_content {treść JSON} xml_content {treść XML} "
      & "image_content {obraz} audio_content {dźwięk} video_content {wideo} "
      & "font_content {czcionka} archive_content {archiwum} binary_content "
      & "{dane binarne} form_content {dane formularza} other {nieznana "
      & "treść}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {znacznik dokumentu} metadata_tag "
      & "{znacznik metadanych} section_tag {znacznik sekcji} text_tag {znacznik "
      & "tekstu} link_tag {znacznik linku} media_tag {znacznik multimediów} "
      & "form_tag {znacznik formularza} table_tag {znacznik tabeli} "
      & "interactive_tag {znacznik interaktywny} scripting_tag {znacznik "
      & "skryptu} other {nieznany znacznik}}");
   P ("label.media.duration_label", "czas trwania: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {obraz} video_media {wideo} audio_media "
      & "{dźwięk} pdf_document {dokument PDF} text_document {dokument "
      & "tekstowy} archive_media {archiwum} other {multimedia}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {gotowe} processing_media {przetwarzanie} "
      & "transcoding_media {transkodowanie} thumbnail_missing {miniatura "
      & "niedostępna} metadata_missing {brak metadanych} locked_document "
      & "{dokument zablokowany} other {niedostępne}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {obraz} video_media {wideo} "
      & "audio_media {dźwięk} pdf_document {dokument PDF} text_document "
      & "{dokument tekstowy} archive_media {archiwum} other {multimedia}}): "
      & "{state, select, ready_media {gotowe} processing_media {przetwarzanie} "
      & "transcoding_media {transkodowanie} thumbnail_missing {miniatura "
      & "niedostępna} metadata_missing {brak metadanych} locked_document "
      & "{zablokowane} other {niedostępne}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {brak stron} one {{pages, number} strona} few "
      & "{{pages, number} strony} many {{pages, number} stron} other {{pages, "
      & "number} strony}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: {state, select, open_report {odwołanie otwarte} "
      & "triaged_report {odwołanie wstępnie ocenione} actioned_report "
      & "{odwołanie – podjęto działania} dismissed_report {odwołanie "
      & "odrzucone} appealed_report {odwołanie złożone} other {odwołanie "
      & "zamknięte}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {brak działań moderacyjnych} flagged "
      & "{oznaczono} hidden {ukryto przez moderatora} restored {przywrócono} "
      & "marked_spam {oznaczono jako spam} removed {usunięto} other "
      & "{przekazano wyżej}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {brak działań moderacyjnych} "
      & "flagged {oznaczono} hidden {ukryto przez moderatora} restored "
      & "{przywrócono} marked_spam {oznaczono jako spam} removed {usunięto} "
      & "other {przekazano wyżej}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {kolejka moderacji pusta} "
      & "other {do sprawdzenia: {pending, number}}}} other {do sprawdzenia: "
      & "{pending, number}, przekazano wyżej: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {zgłoszenie otwarte} "
      & "triaged_report {zgłoszenie wstępnie ocenione} actioned_report "
      & "{zgłoszenie – podjęto działania} dismissed_report {zgłoszenie "
      & "odrzucone} appealed_report {zgłoszenie z odwołaniem} other "
      & "{zgłoszenie zamknięte}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {zgłoszenie otwarte} triaged_report "
      & "{zgłoszenie wstępnie ocenione} actioned_report {zgłoszenie – "
      & "podjęto działania} dismissed_report {zgłoszenie odrzucone} "
      & "appealed_report {zgłoszenie z odwołaniem} other {zgłoszenie "
      & "zamknięte}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {oczekuje na przegląd} "
      & "approved {zatwierdzono} rejected {odrzucono} needs_changes {wymaga "
      & "zmian} other {przegląd przekazany wyżej}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {oczekuje na przegląd} approved "
      & "{zatwierdzono} rejected {odrzucono} needs_changes {wymaga zmian} other "
      & "{przegląd przekazany wyżej}}");
   P ("label.navigation.back_label", "wstecz: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {brak ścieżki nawigacji} one {ścieżka "
      & "nawigacji: 1 poziom} few {ścieżka nawigacji: {depth, number} "
      & "poziomy} many {ścieżka nawigacji: {depth, number} poziomów} other "
      & "{ścieżka nawigacji: {depth, number} poziomu}}");
   P ("label.navigation.current_page_label", "bieżąca strona: {name}");
   P ("label.navigation.external_link_label", "{name} (link zewnętrzny)");
   P ("label.navigation.first_label", "pierwszy: {target}");
   P ("label.navigation.last_label", "ostatni: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {brak pozycji menu} one {1 pozycja menu} few "
      & "{{count, number} pozycje menu} many {{count, number} pozycji menu} "
      & "other {{count, number} pozycji menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {pozycja menu} tab_item "
      & "{karta} breadcrumb_item {element ścieżki} section_item {sekcja} "
      & "other {separator}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {link {state, select, current_item "
      & "{bieżący} active_item {aktywny} inactive_item {nieaktywny} "
      & "disabled_item {wyłączony} expanded_item {rozwinięty} collapsed_item "
      & "{zwinięty} visited_item {odwiedzony} other {zewnętrzny}}} menu_item "
      & "{pozycja menu {state, select, current_item {bieżąca} active_item "
      & "{aktywna} inactive_item {nieaktywna} disabled_item {wyłączona} "
      & "expanded_item {rozwinięta} collapsed_item {zwinięta} visited_item "
      & "{odwiedzona} other {zewnętrzna}}} tab_item {karta {state, select, "
      & "current_item {bieżąca} active_item {aktywna} inactive_item "
      & "{nieaktywna} disabled_item {wyłączona} expanded_item {rozwinięta} "
      & "collapsed_item {zwinięta} visited_item {odwiedzona} other "
      & "{zewnętrzna}}} breadcrumb_item {element ścieżki {state, select, "
      & "current_item {bieżący} active_item {aktywny} inactive_item "
      & "{nieaktywny} disabled_item {wyłączony} expanded_item {rozwinięty} "
      & "collapsed_item {zwinięty} visited_item {odwiedzony} other "
      & "{zewnętrzny}}} section_item {sekcja {state, select, current_item "
      & "{bieżąca} active_item {aktywna} inactive_item {nieaktywna} "
      & "disabled_item {wyłączona} expanded_item {rozwinięta} collapsed_item "
      & "{zwinięta} visited_item {odwiedzona} other {zewnętrzna}}} other "
      & "{separator {state, select, current_item {bieżący} active_item "
      & "{aktywny} inactive_item {nieaktywny} disabled_item {wyłączony} "
      & "expanded_item {rozwinięty} collapsed_item {zwinięty} visited_item "
      & "{odwiedzony} other {zewnętrzny}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {bieżący} active_item {aktywny} "
      & "inactive_item {nieaktywny} disabled_item {wyłączony} expanded_item "
      & "{rozwinięty} collapsed_item {zwinięty} visited_item {odwiedzony} "
      & "other {zewnętrzny}}");
   P ("label.navigation.next_label", "następny: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {sekcja zwinięta} other {sekcja "
      & "rozwinięta}}{count, plural, =0 {} one {, 1 element} few {, {count, "
      & "number} elementy} many {, {count, number} elementów} other {, {count, "
      & "number} elementu}}");
   P ("label.navigation.skip_link_label", "przejdź do: {target}");
   P ("label.navigation.submenu_label",
      "{name}: podmenu, {count, plural, one {1 element} few {{count, number} "
      & "elementy} many {{count, number} elementów} other {{count, number} "
      & "elementu}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {wszystkie alerty} important_alerts {ważne "
      & "alerty} critical_alerts_only {tylko alerty krytyczne} other {bez "
      & "alertów}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: {state, select, preference_enabled {powiadomienia "
      & "włączone} preference_disabled {powiadomienia wyłączone} "
      & "preference_inherited {powiadomienia dziedziczone} other {powiadomienia "
      & "wymagane}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {bez podsumowań} instant_digest "
      & "{podsumowanie natychmiastowe} daily_digest {podsumowanie dzienne} "
      & "other {podsumowanie tygodniowe}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {włączone} preference_disabled "
      & "{wyłączone} preference_inherited {dziedziczone} other {wymagane}}");
   P ("label.notification_preferences.quiet_hours_label", "godziny ciszy: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: subskrypcja {scope, select, thread_subscription {wątku} "
      & "project_subscription {projektu} team_subscription {zespołu} other "
      & "{konta}} {state, select, preference_enabled {włączona} "
      & "preference_disabled {wyłączona} preference_inherited {dziedziczona} "
      & "other {wymagana}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {subskrypcja wątku} "
      & "project_subscription {subskrypcja projektu} team_subscription "
      & "{subskrypcja zespołu} other {subskrypcja konta}}");
   P ("label.notifications.actor_event_label",
      "{actor}: {event, select, mention_event {wzmianka o tobie} reply_event "
      & "{odpowiedź} assignment_event {przypisanie do ciebie} approval_event "
      & "{prośba o zatwierdzenie} alert_event {alert} digest_event "
      & "{podsumowanie} reminder_event {przypomnienie} other {powiadomienie "
      & "systemowe}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {powiadomienie w aplikacji} "
      & "email_channel {powiadomienie e-mail} sms_channel {powiadomienie SMS} "
      & "push_channel {powiadomienie push} webhook_channel {powiadomienie "
      & "webhook} other {powiadomienie zbiorcze}}: {state, select, "
      & "pending_delivery {oczekuje} sent_delivery {wysłane} "
      & "delivered_delivery {dostarczone} failed_delivery {nieudane} "
      & "retrying_delivery {ponawianie} other {anulowane}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {powiadomienie oczekujące} "
      & "sent_delivery {powiadomienie wysłane} delivered_delivery "
      & "{powiadomienie dostarczone} failed_delivery {powiadomienie nieudane} "
      & "retrying_delivery {ponawianie powiadomienia} other {powiadomienie "
      & "anulowane}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {oczekuje {time_text}} sent_delivery "
      & "{wysłano {time_text}} delivered_delivery {dostarczono {time_text}} "
      & "failed_delivery {niepowodzenie {time_text}} retrying_delivery "
      & "{ponawianie {time_text}} other {anulowano {time_text}}}");
   P ("label.notifications.digest_label",
      "{name} – podsumowanie: {count, plural, =0 {brak powiadomień} one {1 "
      & "powiadomienie} few {{count, number} powiadomienia} many {{count, "
      & "number} powiadomień} other {{count, number} powiadomienia}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {brak wzmianek} one "
      & "{1 wzmianka} few {{count, number} wzmianki} many {{count, number} "
      & "wzmianek} other {{count, number} wzmianki}}} reply_event {{count, "
      & "plural, =0 {brak odpowiedzi} one {1 odpowiedź} few {{count, number} "
      & "odpowiedzi} many {{count, number} odpowiedzi} other {{count, number} "
      & "odpowiedzi}}} assignment_event {{count, plural, =0 {brak przypisań} "
      & "one {1 przypisanie} few {{count, number} przypisania} many {{count, "
      & "number} przypisań} other {{count, number} przypisania}}} "
      & "approval_event {{count, plural, =0 {brak próśb o zatwierdzenie} one "
      & "{1 prośba o zatwierdzenie} few {{count, number} prośby o "
      & "zatwierdzenie} many {{count, number} próśb o zatwierdzenie} other "
      & "{{count, number} prośby o zatwierdzenie}}} alert_event {{count, "
      & "plural, =0 {brak alertów} one {1 alert} few {{count, number} alerty} "
      & "many {{count, number} alertów} other {{count, number} alertu}}} "
      & "digest_event {{count, plural, =0 {brak podsumowań} one {1 "
      & "podsumowanie} few {{count, number} podsumowania} many {{count, number} "
      & "podsumowań} other {{count, number} podsumowania}}} reminder_event "
      & "{{count, plural, =0 {brak przypomnień} one {1 przypomnienie} few "
      & "{{count, number} przypomnienia} many {{count, number} przypomnień} "
      & "other {{count, number} przypomnienia}}} other {{count, plural, =0 "
      & "{brak powiadomień systemowych} one {1 powiadomienie systemowe} few "
      & "{{count, number} powiadomienia systemowe} many {{count, number} "
      & "powiadomień systemowych} other {{count, number} powiadomienia "
      & "systemowego}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {oznacz powiadomienie jako przeczytane} few "
      & "{oznacz {count, number} powiadomienia jako przeczytane} many {oznacz "
      & "{count, number} powiadomień jako przeczytane} other {oznacz {count, "
      & "number} powiadomienia jako przeczytane}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {oznacz powiadomienie jako nieprzeczytane} few "
      & "{oznacz {count, number} powiadomienia jako nieprzeczytane} many "
      & "{oznacz {count, number} powiadomień jako nieprzeczytane} other "
      & "{oznacz {count, number} powiadomienia jako nieprzeczytane}}");
   P ("label.notifications.muted_label", "{name}: powiadomienia wyciszone");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nowa wzmianka} reply_event {nowa "
      & "odpowiedź} assignment_event {nowe przypisanie} approval_event {nowa "
      & "prośba o zatwierdzenie} alert_event {nowy alert} digest_event {nowe "
      & "podsumowanie} reminder_event {nowe przypomnienie} other {nowe "
      & "powiadomienie systemowe}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {powiadomienia w aplikacji} "
      & "email_channel {powiadomienia e-mail} sms_channel {powiadomienia SMS} "
      & "push_channel {powiadomienia push} webhook_channel {powiadomienia "
      & "webhook} other {powiadomienia zbiorcze}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {brak powiadomień} one {1 powiadomienie} few "
      & "{{count, number} powiadomienia} many {{count, number} powiadomień} "
      & "other {{count, number} powiadomienia}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {wzmianka} reply_event {odpowiedź} "
      & "assignment_event {przypisanie} approval_event {prośba o "
      & "zatwierdzenie} alert_event {alert} digest_event {podsumowanie} "
      & "reminder_event {przypomnienie} other {powiadomienie systemowe}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {brak powiadomień} one {1 powiadomienie} "
      & "few {{count, number} powiadomienia} many {{count, number} "
      & "powiadomień} other {{count, number} powiadomienia}}");
   P ("label.notifications.notification_label",
      "{subject} ({event, select, mention_event {wzmianka} reply_event "
      & "{odpowiedź} assignment_event {przypisanie} approval_event {prośba o "
      & "zatwierdzenie} alert_event {alert} digest_event {podsumowanie} "
      & "reminder_event {przypomnienie} other {powiadomienie systemowe}}): "
      & "powiadomienie {state, select, unread_state {nieprzeczytane} read_state "
      & "{przeczytane} archived_state {zarchiwizowane} muted_state {wyciszone} "
      & "snoozed_state {odłożone} other {wstrzymane}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {nieprzeczytane powiadomienie} read_state "
      & "{przeczytane powiadomienie} archived_state {zarchiwizowane "
      & "powiadomienie} muted_state {wyciszone powiadomienie} snoozed_state "
      & "{odłożone powiadomienie} other {wstrzymane powiadomienie}}");
   P ("label.notifications.snoozed_label", "{name}: powiadomienia odłożone");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {brak wstrzymanych powiadomień} one {wstrzymano 1 "
      & "powiadomienie} few {wstrzymano {count, number} powiadomienia} many "
      & "{wstrzymano {count, number} powiadomień} other {wstrzymano {count, "
      & "number} powiadomienia}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {brak nieprzeczytanych powiadomień} one {1 "
      & "nieprzeczytane powiadomienie} few {{count, number} nieprzeczytane "
      & "powiadomienia} many {{count, number} nieprzeczytanych powiadomień} "
      & "other {{count, number} nieprzeczytanego powiadomienia}}");
   P ("label.payments.amount_label", "kwota: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "obciążenie zwrotne: {amount_text}");
   P ("label.payments.discount_label", "rabat: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, termin płatności: {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {brak faktur} one {1 faktura} few {{count, number} "
      & "faktury} many {{count, number} faktur} other {{count, number} "
      & "faktury}}");
   P ("label.payments.invoice_label",
      "faktura {number}: {state, select, draft_invoice {robocza} open_invoice "
      & "{otwarta} paid_invoice {zapłacona} overdue_invoice {przeterminowana} "
      & "other {unieważniona}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {faktura robocza} open_invoice {faktura "
      & "otwarta} paid_invoice {faktura zapłacona} overdue_invoice {faktura "
      & "przeterminowana} other {faktura unieważniona}}");
   P ("label.payments.method_label",
      "{method, select, card_method {zapłacono kartą: {detail}} "
      & "bank_transfer_method {zapłacono przelewem bankowym: {detail}} "
      & "cash_method {zapłacono gotówką: {detail}} wallet_method {zapłacono "
      & "portfelem cyfrowym: {detail}} check_method {zapłacono czekiem: "
      & "{detail}} other {zapłacono inną metodą: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}, zapłacono {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {brak płatności} one {1 płatność} few {{count, "
      & "number} płatności} many {{count, number} płatności} other {{count, "
      & "number} płatności}}");
   P ("label.payments.payment_label",
      "{amount_text}: płatność {state, select, pending_payment "
      & "{oczekująca} authorized_payment {autoryzowana} paid_payment "
      & "{zrealizowana} failed_payment {nieudana} refunded_payment {zwrócona} "
      & "other {anulowana}}");
   P ("label.payments.payment_link_label", "{name}: link do płatności");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {karta} bank_transfer_method {przelew "
      & "bankowy} cash_method {gotówka} wallet_method {portfel cyfrowy} "
      & "check_method {czek} other {inna metoda}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {płatność oczekująca} "
      & "authorized_payment {płatność autoryzowana} paid_payment "
      & "{płatność zrealizowana} failed_payment {płatność nieudana} "
      & "refunded_payment {płatność zwrócona} other {płatność "
      & "anulowana}}");
   P ("label.payments.receipt_label", "paragon {number}");
   P ("label.payments.refund_label",
      "{amount_text}: zwrot {state, select, pending_payment {oczekujący} "
      & "authorized_payment {autoryzowany} paid_payment {wypłacony} "
      & "failed_payment {nieudany} refunded_payment {zrealizowany} other "
      & "{anulowany}}");
   P ("label.payments.subtotal_label", "suma częściowa: {amount_text}");
   P ("label.payments.tax_label", "podatek: {amount_text}");
   P ("label.payments.total_label", "razem: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: dostęp wygasa {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {przyznano rolę właściciela} "
      & "admin_role {przyznano rolę administratora} editor_role {przyznano "
      & "rolę edytora} viewer_role {przyznano rolę przeglądającego} other "
      & "{przyznano rolę niestandardową}}");
   P ("label.permissions.permission_label",
      "{subject}: {action} – {state, select, granted {przyznano} denied "
      & "{odmówiono} inherited {odziedziczono} temporary {dostęp tymczasowy} "
      & "expired {wygasło} other {wymaga zatwierdzenia}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {przyznano} denied {odmówiono} inherited "
      & "{odziedziczono} temporary {dostęp tymczasowy} expired {wygasło} "
      & "other {wymaga zatwierdzenia}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {polityka zezwala} policy_denied "
      & "{polityka odmawia} policy_warning {ostrzeżenie polityki} other "
      & "{polityka nie ma zastosowania}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {odebrano rolę właściciela} "
      & "admin_role {odebrano rolę administratora} editor_role {odebrano rolę "
      & "edytora} viewer_role {odebrano rolę przeglądającego} other "
      & "{odebrano rolę niestandardową}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {właściciel} admin_role {administrator} "
      & "editor_role {edytor} viewer_role {przeglądający} other {rola "
      & "niestandardowa}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {brak wykorzystania} low_utilization "
      & "{niskie wykorzystanie} normal_utilization {normalne wykorzystanie} "
      & "high_utilization {wysokie wykorzystanie} critical_utilization "
      & "{krytyczne wykorzystanie} full_utilization {pełne wykorzystanie} "
      & "other {przekroczono limit}}");
   P ("label.schema.array_shape_label",
      "tablica {element_type, select, string_field {ciągów znaków} "
      & "integer_field {liczb całkowitych} decimal_field {liczb dziesiętnych} "
      & "boolean_field {wartości logicznych} date_field {dat} date_time_field "
      & "{dat z godziną} object_field {obiektów} array_field {tablic} "
      & "enum_field {wartości wyliczeniowych} binary_field {danych binarnych} "
      & "null_field {wartości null} any_field {wartości dowolnego typu} other "
      & "{wartości nieznanego typu}}{count_known, select, false {} other { "
      & "({count, plural, one {1 element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}})}}");
   P ("label.schema.constraint_label", "{name}: ograniczenie {value}");
   P ("label.schema.default_value_label", "pole {field_name}: wartość domyślna {value}");
   P ("label.schema.deprecated_field_label", "pole {name} jest przestarzałe, użyj {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 opcja wyliczenia} few {{count, number} opcje "
      & "wyliczenia} many {{count, number} opcji wyliczenia} other {{count, "
      & "number} opcji wyliczenia}}");
   P ("label.schema.example_value_label", "pole {field_name}: przykład {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {pole zwykłe} deprecated_field {pole "
      & "przestarzałe} unknown_field {pole nieznane} read_only_field {pole "
      & "tylko do odczytu} write_only_field {pole tylko do zapisu} other {pole "
      & "obliczane}}");
   P ("label.schema.field_type_label",
      "pole typu {kind, select, string_field {tekst} integer_field {liczba "
      & "całkowita} decimal_field {liczba dziesiętna} boolean_field "
      & "{wartość logiczna} date_field {data} date_time_field {data i "
      & "godzina} object_field {obiekt} array_field {tablica} enum_field "
      & "{wyliczenie} binary_field {dane binarne} null_field {null} any_field "
      & "{dowolny} other {nieznany}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {nie brakuje wymaganych pól} other {brakujące "
      & "wymagane pola: {count, number}}}");
   P ("label.schema.object_shape_label",
      "obiekt, pola: {fields, number}{required, plural, =0 {} other {, "
      & "wymagane: {required, number}}}{optional, plural, =0 {} other {, "
      & "opcjonalne: {optional, number}}}");
   P ("label.schema.schema_source_label", "schemat {name}, wersja {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {wartość skalarna} object_shape {{count, "
      & "plural, =0 {obiekt} other {obiekt, pola: {count, number}}}} "
      & "array_shape {{count, plural, =0 {tablica} other {tablica, elementy: "
      & "{count, number}}}} map_shape {{count, plural, =0 {mapa} other {mapa, "
      & "wpisy: {count, number}}}} tuple_shape {{count, plural, =0 {krotka} "
      & "other {krotka, elementy: {count, number}}}} union_shape {{count, "
      & "plural, =0 {unia} other {unia, typy: {count, number}}}} empty_shape "
      & "{pusty kształt} other {nieznany kształt}}");
   P ("label.schema.unknown_field_label", "nieznane pole {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {brak aktywnych filtrów} one {1 aktywny filtr} few "
      & "{{count, number} aktywne filtry} many {{count, number} aktywnych "
      & "filtrów} other {{count, number} aktywnego filtra}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {wyczyść filtry} one {wyczyść aktywny filtr} "
      & "few {wyczyść {count, number} aktywne filtry} many {wyczyść {count, "
      & "number} aktywnych filtrów} other {wyczyść {count, number} aktywnego "
      & "filtra}}");
   P ("label.search.facet_label",
      "{count, plural, one {aspekt {name}, 1 opcja} few {aspekt {name}, "
      & "{count, number} opcje} many {aspekt {name}, {count, number} opcji} "
      & "other {aspekt {name}, {count, number} opcji}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {brak wyników} one {1 wynik} few {{count, "
      & "number} wyniki} many {{count, number} wyników} other {{count, number} "
      & "wyniku}}{selected, select, false {} other {, zaznaczono}}");
   P ("label.search.filter_label",
      "{name}: {value} – {state, select, active_filter {filtr aktywny} "
      & "inactive_filter {filtr nieaktywny} other {filtr wykluczający}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filtr aktywny} inactive_filter {filtr "
      & "nieaktywny} other {filtr wykluczający}}");
   P ("label.search.no_results_label", "brak wyników dla „{query}”");
   P ("label.search.recent_search_label", "ostatnie wyszukiwanie: „{query}”");
   P ("label.search.saved_search_label",
      "zapisane wyszukiwanie: {name}{count, plural, =0 {} one {, 1 wynik} few "
      & "{, {count, number} wyniki} many {, {count, number} wyników} other {, "
      & "{count, number} wyniku}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {brak ostatnich wyszukiwań} one {1 ostatnie "
      & "wyszukiwanie} few {{count, number} ostatnie wyszukiwania} many "
      & "{{count, number} ostatnich wyszukiwań} other {{count, number} "
      & "ostatniego wyszukiwania}}");
   P ("label.search.search_query_label", "wyszukaj „{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {brak wyników} one {1 wynik} few {{count, number} "
      & "wyniki} many {{count, number} wyników} other {{count, number} "
      & "wyniku}}");
   P ("label.search.search_result_summary_label",
      "wyniki dla „{query}”: {count, plural, =0 {brak wyników} one {1 "
      & "wynik} few {{count, number} wyniki} many {{count, number} wyników} "
      & "other {{count, number} wyniku}}");
   P ("label.search.search_scope_label",
      "zakres {name}, {count, plural, =0 {brak wyników} one {1 wynik} few "
      & "{{count, number} wyniki} many {{count, number} wyników} other "
      & "{{count, number} wyniku}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {wyszukiwanie bezczynne} searching_search "
      & "{wyszukiwanie w toku} complete_search {wyszukiwanie zakończone} "
      & "empty_search {brak wyników wyszukiwania} other {wyszukiwanie "
      & "nieudane}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {sortuj według trafności} "
      & "ascending_sort {sortuj rosnąco} descending_sort {sortuj malejąco} "
      & "newest_first_sort {sortuj od najnowszych} other {sortuj od "
      & "najstarszych}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {trafność} ascending_sort {rosnąco} "
      & "descending_sort {malejąco} newest_first_sort {od najnowszych} other "
      & "{od najstarszych}}");
   P ("label.search.suggestion_label", "czy chodziło o „{query}”?");
   P ("label.secrets.credential_source_label",
      "{source}: {count, plural, one {1 poświadczenie} few {{count, number} "
      & "poświadczenia} many {{count, number} poświadczeń} other {{count, "
      & "number} poświadczenia}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {wartość ukryta} masked_value "
      & "{wartość zamaskowana} suffix_only {tylko sufiks} other {tylko "
      & "odcisk}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {publiczny} support_profile "
      & "{wsparcie} audit_profile {audyt} other {debugowanie}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotacja niewymagana} other {wymagana "
      & "rotacja}}{days_old, plural, =0 {} one {, wiek: 1 dzień} few {, wiek: "
      & "{days_old, number} dni} many {, wiek: {days_old, number} dni} other {, "
      & "wiek: {days_old, number} dnia}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {klucz API} live_api_key {produkcyjny klucz "
      & "API} test_api_key {testowy klucz API} github_token {token GitHub} "
      & "aws_access_key {klucz dostępu AWS} google_api_key {klucz API Google} "
      & "slack_token {token Slack} npm_token {token npm} bearer_token {token "
      & "bearer} jwt_token {token JWT} basic_auth_credential {poświadczenie "
      & "Basic Auth} password_secret {hasło} private_key {klucz prywatny} "
      & "ssh_private_key {klucz prywatny SSH} webhook_secret {sekret webhooka} "
      & "oauth_token {token OAuth} database_url_secret {sekret w adresie URL "
      & "bazy danych} sha1_fingerprint {odcisk SHA-1} sha256_fingerprint "
      & "{odcisk SHA-256} other {sekret}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefon} url_value "
      & "{URL} ip_address_value {adres IP} token_value {token} file_path_value "
      & "{ścieżka pliku} account_id_value {identyfikator konta} "
      & "payment_reference_value {numer referencyjny płatności} "
      & "log_field_value {pole dziennika} other {wartość poufna}}");
   P ("label.tables.cell_label",
      "wiersz {row, number}, kolumna {column, number}: {state, select, "
      & "empty_cell {pusta} edited_cell {edytowana} invalid_cell "
      & "{nieprawidłowa} highlighted_cell {wyróżniona} other {tylko do "
      & "odczytu}}");
   P ("label.tables.cell_position_label", "wiersz {row, number}, kolumna {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {pusta komórka} edited_cell {edytowana "
      & "komórka} invalid_cell {nieprawidłowa komórka} highlighted_cell "
      & "{wyróżniona komórka} other {komórka tylko do odczytu}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {brak kolumn} one {1 kolumna} few {{count, number} "
      & "kolumny} many {{count, number} kolumn} other {{count, number} "
      & "kolumny}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {kolumna tekstowa} number_column "
      & "{kolumna liczbowa} date_column {kolumna daty} status_column {kolumna "
      & "stanu} action_column {kolumna akcji} other {kolumna ukryta}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {kolumna tekstowa} number_column {kolumna "
      & "liczbowa} date_column {kolumna daty} status_column {kolumna stanu} "
      & "action_column {kolumna akcji} other {kolumna ukryta}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {1 wiersz} few {{count, number} wiersze} "
      & "many {{count, number} wierszy} other {{count, number} wiersza}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {brak wierszy} one {1 wiersz} few {{count, number} "
      & "wiersze} many {{count, number} wierszy} other {{count, number} "
      & "wiersza}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {bez sortowania} ascending_sort "
      & "{rosnąco} other {malejąco}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {bez sortowania} ascending_sort "
      & "{sortowanie według {column_name} rosnąco} other {sortowanie według "
      & "{column_name} malejąco}}");
   P ("label.tables.subtotal_label", "suma częściowa {name}: {value}");
   P ("label.tables.table_size_label", "wiersze: {rows, number}, kolumny: {columns, number}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {nieprzypisane} assigned "
      & "{przypisano} reassigned {przypisano ponownie} watching {obserwuje} "
      & "other {właściciel zadania}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nieprzypisane} assigned {przypisane} "
      & "reassigned {przypisane ponownie} watching {obserwowane} other "
      & "{właściciel zadania}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {pusty backlog} one {backlog: 1 zadanie} few "
      & "{backlog: {count, number} zadania} many {backlog: {count, number} "
      & "zadań} other {backlog: {count, number} zadania}}");
   P ("label.tasks.blocker_label", "zablokowane przez {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {ukończ zadanie} few {ukończ {count, number} "
      & "zadania} many {ukończ {count, number} zadań} other {ukończ {count, "
      & "number} zadania}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {brak ukończonych zadań} one {1 ukończone "
      & "zadanie} few {{count, number} ukończone zadania} many {{count, "
      & "number} ukończonych zadań} other {{count, number} ukończonego "
      & "zadania}}");
   P ("label.tasks.due_label", "termin: {due_text}");
   P ("label.tasks.estimate_label", "szacowany czas: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {brak otwartych zadań} one {1 otwarte zadanie} few "
      & "{{count, number} otwarte zadania} many {{count, number} otwartych "
      & "zadań} other {{count, number} otwartego zadania}}");
   P ("label.tasks.overdue_label", "po terminie od {due_text}");
   P ("label.tasks.recurring_task_label", "powtarzanie: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {otwórz ponownie zadanie} few {otwórz ponownie "
      & "{count, number} zadania} many {otwórz ponownie {count, number} "
      & "zadań} other {otwórz ponownie {count, number} zadania}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 zadanie} few {{count, number} zadania} "
      & "many {{count, number} zadań} other {{count, number} zadania}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 podzadanie} few {{count, number} "
      & "podzadania} many {{count, number} podzadań} other {{count, number} "
      & "podzadania}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {brak zadań} one {1 zadanie} few {{count, number} "
      & "zadania} many {{count, number} zadań} other {{count, number} "
      & "zadania}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {otwarte zadanie} in_progress_task "
      & "{zadanie w toku} blocked_task {zablokowane zadanie} done_task "
      & "{ukończone zadanie} canceled_task {anulowane zadanie} deferred_task "
      & "{odłożone zadanie} other {zaległe zadanie}}{priority, select, "
      & "no_priority {} low_priority {, niski priorytet} medium_priority {, "
      & "średni priorytet} high_priority {, wysoki priorytet} other {, "
      & "krytyczny priorytet}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {brak priorytetu} low_priority {niski "
      & "priorytet} medium_priority {średni priorytet} high_priority {wysoki "
      & "priorytet} other {krytyczny priorytet}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {otwarte zadanie} in_progress_task {zadanie "
      & "w toku} blocked_task {zablokowane zadanie} done_task {ukończone "
      & "zadanie} canceled_task {anulowane zadanie} deferred_task {odłożone "
      & "zadanie} other {zaległe zadanie}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {górny limit} other {dolny limit}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {poniżej oczekiwanego zakresu} "
      & "within_range {w oczekiwanym zakresie} above_range {powyżej "
      & "oczekiwanego zakresu} below_target {poniżej celu} at_target {cel "
      & "osiągnięty} above_target {powyżej celu} near_limit {blisko limitu} "
      & "warning_level {próg ostrzegawczy} critical_level {próg krytyczny} "
      & "breached {przekroczono} other {nieznany stan progu}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {aktualne} other {commity do "
      & "przodu: {ahead, number}}}} other {{ahead, plural, =0 {commity do "
      & "tyłu: {behind, number}} other {commity do przodu: {ahead, number}, do "
      & "tyłu: {behind, number}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {zatwierdzone przez: {approver}} other "
      & "{oczekuje na zatwierdzenie przez: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {próba 1 z 1} other "
      & "{próba {attempt, number} z 1 – przekroczono limit}}} other {próba "
      & "{attempt, number} z {limit, number}}}");
   P ("label.workflows.blocker_label", "zablokowane: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {brak blokujących zależności} one {1 blokująca "
      & "zależność} few {{count, number} blokujące zależności} many "
      & "{{count, number} blokujących zależności} other {{count, number} "
      & "blokującej zależności}}");
   P ("label.workflows.handoff_label", "przekazanie: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {nadchodzący kamień milowy} "
      & "current_milestone {bieżący kamień milowy} complete_milestone "
      & "{ukończony kamień milowy} missed_milestone {nieosiągnięty kamień "
      & "milowy} other {zablokowany kamień milowy}}");
   P ("label.workflows.milestone_status_label",
      "kamień milowy {name}: {state, select, upcoming_milestone "
      & "{nadchodzący} current_milestone {bieżący} complete_milestone "
      & "{ukończony} missed_milestone {nieosiągnięty} other {zablokowany}}");
   P ("label.workflows.next_action_label", "następny krok: {action}");
   P ("label.workflows.owner_label", "właściciel: {owner}");
   P ("label.workflows.resume_label", "wznów {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {w kolejce} active_step {aktywny} "
      & "waiting_step {czekający} blocked_step {zablokowany} done_step "
      & "{ukończony} failed_step {nieudany} other {pominięty}}");
   P ("label.workflows.step_status_label",
      "krok {name}: {state, select, pending_step {w kolejce} active_step "
      & "{aktywny} waiting_step {czekający} blocked_step {zablokowany} "
      & "done_step {ukończony} failed_step {nieudany} other {pominięty}}");
   P ("label.workflows.waiting_label", "oczekiwanie: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nie rozpoczęto} "
      & "in_progress_state {w toku} waiting_state {oczekuje} "
      & "waiting_approval_state {oczekuje na zatwierdzenie} blocked_state "
      & "{zablokowano} completed_state {ukończono} failed_state "
      & "{niepowodzenie} cancelled_state {anulowano} skipped_state {pominięto} "
      & "other {wstrzymano}}");
end Labels_2;
