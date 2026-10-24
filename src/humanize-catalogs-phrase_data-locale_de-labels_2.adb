separate (Humanize.Catalogs.Phrase_Data.Locale_De)
procedure Labels_2 is
begin
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {keine Menüeinträge} one {1 Menüeintrag} other "
      & "{{count, number} Menüeinträge}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {Link} menu_item {Menüeintrag} tab_item "
      & "{Tab} breadcrumb_item {Brotkrümel} section_item {Abschnitt} other "
      & "{Trennlinie}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {Link} menu_item {Menüeintrag} "
      & "tab_item {Tab} breadcrumb_item {Brotkrümel} section_item {Abschnitt} "
      & "other {Trennlinie}}, {state, select, current_item {aktuell} "
      & "active_item {aktiv} inactive_item {inaktiv} disabled_item "
      & "{deaktiviert} expanded_item {ausgeklappt} collapsed_item {eingeklappt} "
      & "visited_item {besucht} other {extern}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {aktuell} active_item {aktiv} "
      & "inactive_item {inaktiv} disabled_item {deaktiviert} expanded_item "
      & "{ausgeklappt} collapsed_item {eingeklappt} visited_item {besucht} "
      & "other {extern}}");
   P ("label.navigation.next_label", "nächste: {target}");
   P ("label.navigation.section_state_label",
      "Abschnitt {name} {expanded, select, false {eingeklappt} other "
      & "{ausgeklappt}}{count, plural, =0 {} one {, 1 Element} other {, {count, "
      & "number} Elemente}}");
   P ("label.navigation.skip_link_label", "zu {target} springen");
   P ("label.navigation.submenu_label",
      "{count, plural, one {Untermenü {name}, 1 Eintrag} other {Untermenü "
      & "{name}, {count, number} Einträge}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {alle Warnmeldungen} important_alerts "
      & "{wichtige Warnmeldungen} critical_alerts_only {nur kritische "
      & "Warnmeldungen} other {keine Warnmeldungen}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: Benachrichtigungen {state, select, preference_enabled "
      & "{aktiviert} preference_disabled {deaktiviert} preference_inherited "
      & "{geerbt} other {erforderlich}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {keine Zusammenfassung} instant_digest "
      & "{sofortige Zusammenfassung} daily_digest {tägliche Zusammenfassung} "
      & "other {wöchentliche Zusammenfassung}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {aktiviert} preference_disabled "
      & "{deaktiviert} preference_inherited {geerbt} other {erforderlich}}");
   P ("label.notification_preferences.quiet_hours_label", "Ruhezeiten {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {Thread-Abonnement} "
      & "project_subscription {Projektabonnement} team_subscription "
      & "{Teamabonnement} other {Kontoabonnement}} {state, select, "
      & "preference_enabled {aktiviert} preference_disabled {deaktiviert} "
      & "preference_inherited {geerbt} other {erforderlich}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {Thread-Abonnement} "
      & "project_subscription {Projektabonnement} team_subscription "
      & "{Teamabonnement} other {Kontoabonnement}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} hat dich erwähnt} reply_event "
      & "{{actor} hat geantwortet} assignment_event {{actor} hat dir etwas "
      & "zugewiesen} approval_event {{actor} hat eine Genehmigung angefordert} "
      & "alert_event {{actor} hat eine Warnmeldung gesendet} digest_event "
      & "{{actor} hat eine Zusammenfassung gesendet} reminder_event {{actor} "
      & "hat eine Erinnerung gesendet} other {{actor} hat eine "
      & "Systembenachrichtigung gesendet}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {In-App-Benachrichtigung} "
      & "email_channel {E-Mail-Benachrichtigung} sms_channel "
      & "{SMS-Benachrichtigung} push_channel {Push-Benachrichtigung} "
      & "webhook_channel {Webhook-Benachrichtigung} other "
      & "{Zusammenfassungsbenachrichtigung}} {state, select, pending_delivery "
      & "{ausstehend} sent_delivery {gesendet} delivered_delivery {zugestellt} "
      & "failed_delivery {fehlgeschlagen} retrying_delivery {wird erneut "
      & "versucht} other {abgebrochen}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {ausstehende Benachrichtigung} "
      & "sent_delivery {gesendete Benachrichtigung} delivered_delivery "
      & "{zugestellte Benachrichtigung} failed_delivery {fehlgeschlagene "
      & "Benachrichtigung} retrying_delivery {Benachrichtigung wird erneut "
      & "versucht} other {abgebrochene Benachrichtigung}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {ausstehend} sent_delivery {gesendet} "
      & "delivered_delivery {zugestellt} failed_delivery {fehlgeschlagen} "
      & "retrying_delivery {erneuter Versuch} other {abgebrochen}} {time_text}");
   P ("label.notifications.digest_label",
      "Zusammenfassung {name}: {count, plural, =0 {keine Benachrichtigungen} "
      & "one {1 Benachrichtigung} other {{count, number} Benachrichtigungen}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {keine Erwähnungen} "
      & "one {1 Erwähnung} other {{count, number} Erwähnungen}}} reply_event "
      & "{{count, plural, =0 {keine Antworten} one {1 Antwort} other {{count, "
      & "number} Antworten}}} assignment_event {{count, plural, =0 {keine "
      & "Zuweisungen} one {1 Zuweisung} other {{count, number} Zuweisungen}}} "
      & "approval_event {{count, plural, =0 {keine Genehmigungsanfragen} one {1 "
      & "Genehmigungsanfrage} other {{count, number} Genehmigungsanfragen}}} "
      & "alert_event {{count, plural, =0 {keine Warnmeldungen} one {1 "
      & "Warnmeldung} other {{count, number} Warnmeldungen}}} digest_event "
      & "{{count, plural, =0 {keine Zusammenfassungen} one {1 Zusammenfassung} "
      & "other {{count, number} Zusammenfassungen}}} reminder_event {{count, "
      & "plural, =0 {keine Erinnerungen} one {1 Erinnerung} other {{count, "
      & "number} Erinnerungen}}} other {{count, plural, =0 {keine "
      & "Systembenachrichtigungen} one {1 Systembenachrichtigung} other "
      & "{{count, number} Systembenachrichtigungen}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {Benachrichtigung als gelesen markieren} other "
      & "{{count, number} Benachrichtigungen als gelesen markieren}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {Benachrichtigung als ungelesen markieren} other "
      & "{{count, number} Benachrichtigungen als ungelesen markieren}}");
   P ("label.notifications.muted_label", "{name}: Benachrichtigungen stummgeschaltet");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {neue Erwähnung} reply_event {neue "
      & "Antwort} assignment_event {neue Zuweisung} approval_event {neue "
      & "Genehmigungsanfrage} alert_event {neue Warnmeldung} digest_event {neue "
      & "Zusammenfassung} reminder_event {neue Erinnerung} other {neue "
      & "Systembenachrichtigung}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {In-App-Benachrichtigungen} "
      & "email_channel {E-Mail-Benachrichtigungen} sms_channel "
      & "{SMS-Benachrichtigungen} push_channel {Push-Benachrichtigungen} "
      & "webhook_channel {Webhook-Benachrichtigungen} other "
      & "{Zusammenfassungsbenachrichtigungen}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {keine Benachrichtigungen} one {1 Benachrichtigung} "
      & "other {{count, number} Benachrichtigungen}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {Erwähnung} reply_event {Antwort} "
      & "assignment_event {Zuweisung} approval_event {Genehmigungsanfrage} "
      & "alert_event {Warnmeldung} digest_event {Zusammenfassung} "
      & "reminder_event {Erinnerung} other {Systembenachrichtigung}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {keine Benachrichtigungen} one {1 "
      & "Benachrichtigung} other {{count, number} Benachrichtigungen}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {Erwähnung} reply_event "
      & "{Antwort} assignment_event {Zuweisung} approval_event "
      & "{Genehmigungsanfrage} alert_event {Warnmeldung} digest_event "
      & "{Zusammenfassung} reminder_event {Erinnerung} other "
      & "{Systembenachrichtigung}}, {state, select, unread_state {ungelesen} "
      & "read_state {gelesen} archived_state {archiviert} muted_state "
      & "{stummgeschaltet} snoozed_state {zurückgestellt} other "
      & "{unterdrückt}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {ungelesene Benachrichtigung} read_state "
      & "{gelesene Benachrichtigung} archived_state {archivierte "
      & "Benachrichtigung} muted_state {stummgeschaltete Benachrichtigung} "
      & "snoozed_state {zurückgestellte Benachrichtigung} other {unterdrückte "
      & "Benachrichtigung}}");
   P ("label.notifications.snoozed_label", "{name}: Benachrichtigungen zurückgestellt");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {keine Benachrichtigungen unterdrückt} one {1 "
      & "Benachrichtigung unterdrückt} other {{count, number} "
      & "Benachrichtigungen unterdrückt}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {keine ungelesenen Benachrichtigungen} one {1 "
      & "ungelesene Benachrichtigung} other {{count, number} ungelesene "
      & "Benachrichtigungen}}");
   P ("label.payments.amount_label", "Betrag {amount_text}");
   P ("label.payments.balance_label", "Saldo {amount_text}");
   P ("label.payments.chargeback_label", "Rückbuchung {amount_text}");
   P ("label.payments.discount_label", "Rabatt {amount_text}");
   P ("label.payments.due_label", "{amount_text} fällig {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {keine Rechnungen} one {1 Rechnung} other {{count, "
      & "number} Rechnungen}}");
   P ("label.payments.invoice_label",
      "Rechnung {number}: {state, select, draft_invoice {Entwurf} "
      & "open_invoice {offen} paid_invoice {bezahlt} overdue_invoice "
      & "{überfällig} other {storniert}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {Rechnungsentwurf} open_invoice {offene "
      & "Rechnung} paid_invoice {bezahlte Rechnung} overdue_invoice "
      & "{überfällige Rechnung} other {stornierte Rechnung}}");
   P ("label.payments.method_label",
      "bezahlt {method, select, card_method {per Karte} bank_transfer_method "
      & "{per Überweisung} cash_method {in bar} wallet_method {per Wallet} "
      & "check_method {per Scheck} other {auf anderem Weg}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} bezahlt {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {keine Zahlungen} one {1 Zahlung} other {{count, "
      & "number} Zahlungen}}");
   P ("label.payments.payment_label",
      "{amount_text}: Zahlung {state, select, pending_payment {ausstehend} "
      & "authorized_payment {autorisiert} paid_payment {bezahlt} failed_payment "
      & "{fehlgeschlagen} refunded_payment {erstattet} other {storniert}}");
   P ("label.payments.payment_link_label", "Zahlungslink {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {Karte} bank_transfer_method "
      & "{Banküberweisung} cash_method {Bargeld} wallet_method {Wallet} "
      & "check_method {Scheck} other {Sonstige}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {ausstehende Zahlung} "
      & "authorized_payment {autorisierte Zahlung} paid_payment {bezahlte "
      & "Zahlung} failed_payment {fehlgeschlagene Zahlung} refunded_payment "
      & "{erstattete Zahlung} other {stornierte Zahlung}}");
   P ("label.payments.receipt_label", "Beleg {number}");
   P ("label.payments.refund_label",
      "{amount_text}: Erstattung {state, select, pending_payment {ausstehend} "
      & "authorized_payment {autorisiert} paid_payment {ausgezahlt} "
      & "failed_payment {fehlgeschlagen} refunded_payment {abgeschlossen} other "
      & "{storniert}}");
   P ("label.payments.subtotal_label", "Zwischensumme {amount_text}");
   P ("label.payments.tax_label", "Steuer {amount_text}");
   P ("label.payments.total_label", "Gesamt {amount_text}");
   P ("label.permissions.access_expiry_label", "Zugriff für {subject} läuft {time_text} ab");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {Rolle Besitzer} admin_role "
      & "{Rolle Administrator} editor_role {Rolle Bearbeiter} viewer_role "
      & "{Rolle Betrachter} other {benutzerdefinierte Rolle}} erteilt");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {erteilt} denied "
      & "{verweigert} inherited {geerbt} temporary {temporärer Zugriff} "
      & "expired {abgelaufen} other {Genehmigung erforderlich}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {erteilt} denied {verweigert} inherited "
      & "{geerbt} temporary {temporärer Zugriff} expired {abgelaufen} other "
      & "{Genehmigung erforderlich}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {Richtlinie erlaubt} policy_denied "
      & "{Richtlinie verweigert} policy_warning {Richtlinienwarnung} other "
      & "{Richtlinie nicht anwendbar}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {Rolle Besitzer} admin_role "
      & "{Rolle Administrator} editor_role {Rolle Bearbeiter} viewer_role "
      & "{Rolle Betrachter} other {benutzerdefinierte Rolle}} entzogen");
   P ("label.permissions.role_label",
      "{role, select, owner_role {Besitzer} admin_role {Administrator} "
      & "editor_role {Bearbeiter} viewer_role {Betrachter} other "
      & "{benutzerdefinierte Rolle}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {leer} low_utilization {geringe "
      & "Auslastung} normal_utilization {normale Auslastung} high_utilization "
      & "{hohe Auslastung} critical_utilization {kritische Auslastung} "
      & "full_utilization {voll} other {Limit überschritten}}");
   P ("label.schema.array_shape_label",
      "Array aus {count_known, select, false {{element_type, select, "
      & "string_field {Strings} integer_field {Ganzzahlen} decimal_field "
      & "{Dezimalzahlen} boolean_field {booleschen Werten} date_field "
      & "{Datumswerten} date_time_field {Datum-Zeit-Werten} object_field "
      & "{Objekten} array_field {Arrays} enum_field {Enum-Werten} binary_field "
      & "{Binärwerten} null_field {Nullwerten} any_field {beliebigen Werten} "
      & "other {unbekannten Werten}}} other {{count, plural, one {1 "
      & "{element_type, select, string_field {String} integer_field {Ganzzahl} "
      & "decimal_field {Dezimalzahl} boolean_field {booleschen Wert} date_field "
      & "{Datumswert} date_time_field {Datum-Zeit-Wert} object_field {Objekt} "
      & "array_field {Array} enum_field {Enum-Wert} binary_field {Binärwert} "
      & "null_field {Nullwert} any_field {beliebigen Wert} other {unbekannten "
      & "Wert}}} other {{count, number} {element_type, select, string_field "
      & "{Strings} integer_field {Ganzzahlen} decimal_field {Dezimalzahlen} "
      & "boolean_field {booleschen Werten} date_field {Datumswerten} "
      & "date_time_field {Datum-Zeit-Werten} object_field {Objekten} "
      & "array_field {Arrays} enum_field {Enum-Werten} binary_field "
      & "{Binärwerten} null_field {Nullwerten} any_field {beliebigen Werten} "
      & "other {unbekannten Werten}}}}}}");
   P ("label.schema.constraint_label", "Einschränkung {name}: {value}");
   P ("label.schema.default_value_label", "Feld {field_name}: Standardwert {value}");
   P ("label.schema.deprecated_field_label", "veraltetes Feld {name}, stattdessen {replacement} verwenden");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 Enum-Option} other {{count, number} "
      & "Enum-Optionen}}");
   P ("label.schema.example_value_label", "Feld {field_name}: Beispiel {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normales Feld} deprecated_field "
      & "{veraltetes Feld} unknown_field {unbekanntes Feld} read_only_field "
      & "{schreibgeschütztes Feld} write_only_field {nur beschreibbares Feld} "
      & "other {berechnetes Feld}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {String-Feld} integer_field {Ganzzahlfeld} "
      & "decimal_field {Dezimalfeld} boolean_field {boolesches Feld} date_field "
      & "{Datumsfeld} date_time_field {Datum-Zeit-Feld} object_field "
      & "{Objektfeld} array_field {Array-Feld} enum_field {Enum-Feld} "
      & "binary_field {Binärfeld} null_field {Null-Feld} any_field {Feld "
      & "beliebigen Typs} other {Feld unbekannten Typs}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {keine fehlenden Pflichtfelder} one {1 fehlendes "
      & "Pflichtfeld} other {{count, number} fehlende Pflichtfelder}}");
   P ("label.schema.object_shape_label",
      "Objekt mit {fields, plural, one {1 Feld} other {{fields, number} "
      & "Feldern}}{required, plural, =0 {} other {, {required, number} "
      & "erforderlich}}{optional, plural, =0 {} other {, {optional, number} "
      & "optional}}");
   P ("label.schema.schema_source_label", "Schema {name}, Version {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {Skalarwert} object_shape {{count, plural, "
      & "=0 {Objekt} one {Objekt mit 1 Feld} other {Objekt mit {count, number} "
      & "Feldern}}} array_shape {{count, plural, =0 {Array} one {Array mit 1 "
      & "Element} other {Array mit {count, number} Elementen}}} map_shape "
      & "{{count, plural, =0 {Map} one {Map mit 1 Eintrag} other {Map mit "
      & "{count, number} Einträgen}}} tuple_shape {{count, plural, =0 {Tupel} "
      & "one {Tupel mit 1 Element} other {Tupel mit {count, number} "
      & "Elementen}}} union_shape {{count, plural, =0 {Union} one {Union aus 1 "
      & "Typ} other {Union aus {count, number} Typen}}} empty_shape {leere "
      & "Struktur} other {unbekannte Struktur}}");
   P ("label.schema.unknown_field_label", "unbekanntes Feld {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {keine aktiven Filter} one {1 aktiver Filter} other "
      & "{{count, number} aktive Filter}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {Filter entfernen} one {aktiven Filter entfernen} "
      & "other {{count, number} aktive Filter entfernen}}");
   P ("label.search.facet_label",
      "Facette {name}, {count, plural, one {1 Option} other {{count, number} "
      & "Optionen}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {keine Ergebnisse} one {1 Ergebnis} other "
      & "{{count, number} Ergebnisse}}{selected, select, true {, ausgewählt} "
      & "other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {aktiver Filter} "
      & "inactive_filter {inaktiver Filter} other {Ausschlussfilter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktiver Filter} inactive_filter "
      & "{inaktiver Filter} other {Ausschlussfilter}}");
   P ("label.search.no_results_label", "keine Ergebnisse für „{query}“");
   P ("label.search.recent_search_label", "letzte Suche: „{query}“");
   P ("label.search.saved_search_label",
      "gespeicherte Suche: {name}{count, plural, =0 {} one {, 1 Ergebnis} "
      & "other {, {count, number} Ergebnisse}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {keine letzten Suchen} one {1 letzte Suche} other "
      & "{{count, number} letzte Suchen}}");
   P ("label.search.search_query_label", "Suche nach „{query}“");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {keine Ergebnisse} one {1 Ergebnis} other {{count, "
      & "number} Ergebnisse}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {keine Ergebnisse für „{query}“} one {1 "
      & "Ergebnis für „{query}“} other {{count, number} Ergebnisse für "
      & "„{query}“}}");
   P ("label.search.search_scope_label",
      "Suchbereich {name}, {count, plural, =0 {keine Ergebnisse} one {1 "
      & "Ergebnis} other {{count, number} Ergebnisse}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {Suche inaktiv} searching_search {Suche "
      & "läuft} complete_search {Suche abgeschlossen} empty_search {keine "
      & "Suchergebnisse} other {Suche fehlgeschlagen}}");
   P ("label.search.sort_label",
      "Sortierung: {mode, select, relevance_sort {Relevanz} ascending_sort "
      & "{aufsteigend} descending_sort {absteigend} newest_first_sort {neueste "
      & "zuerst} other {älteste zuerst}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {Relevanz} ascending_sort {aufsteigend} "
      & "descending_sort {absteigend} newest_first_sort {neueste zuerst} other "
      & "{älteste zuerst}}");
   P ("label.search.suggestion_label", "Meinten Sie „{query}“?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 Anmeldeinformation aus {source}} other {{count, "
      & "number} Anmeldeinformationen aus {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {Wert verborgen} masked_value {Wert "
      & "maskiert} suffix_only {nur Suffix} other {nur Fingerabdruck}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {öffentlich} support_profile "
      & "{Support} audit_profile {Audit} other {Debug}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {Rotation erforderlich} other {Rotation "
      & "nicht erforderlich}}{days_old, plural, =0 {} one {, 1 Tag alt} other "
      & "{, {days_old, number} Tage alt}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-Schlüssel} live_api_key "
      & "{Live-API-Schlüssel} test_api_key {Test-API-Schlüssel} github_token "
      & "{GitHub-Token} aws_access_key {AWS-Zugriffsschlüssel} google_api_key "
      & "{Google-API-Schlüssel} slack_token {Slack-Token} npm_token "
      & "{npm-Token} bearer_token {Bearer-Token} jwt_token {JWT-Token} "
      & "basic_auth_credential {Basic-Auth-Anmeldedaten} password_secret "
      & "{Passwort} private_key {privater Schlüssel} ssh_private_key {privater "
      & "SSH-Schlüssel} webhook_secret {Webhook-Secret} oauth_token "
      & "{OAuth-Token} database_url_secret {Datenbank-URL mit Zugangsdaten} "
      & "sha1_fingerprint {SHA-1-Fingerabdruck} sha256_fingerprint "
      & "{SHA-256-Fingerabdruck} other {Secret}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {E-Mail} phone_value {Telefon} url_value "
      & "{URL} ip_address_value {IP-Adresse} token_value {Token} "
      & "file_path_value {Dateipfad} account_id_value {Konto-ID} "
      & "payment_reference_value {Zahlungsreferenz} log_field_value "
      & "{Protokollfeld} other {sensibler Wert}}");
   P ("label.tables.cell_label",
      "Zeile {row, number}, Spalte {column, number}, {state, select, "
      & "empty_cell {leer} edited_cell {bearbeitet} invalid_cell {ungültig} "
      & "highlighted_cell {hervorgehoben} other {schreibgeschützt}}");
   P ("label.tables.cell_position_label", "Zeile {row, number}, Spalte {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {leere Zelle} edited_cell {bearbeitete "
      & "Zelle} invalid_cell {ungültige Zelle} highlighted_cell "
      & "{hervorgehobene Zelle} other {schreibgeschützte Zelle}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {keine Spalten} one {1 Spalte} other {{count, "
      & "number} Spalten}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {Textspalte} number_column "
      & "{Zahlenspalte} date_column {Datumsspalte} status_column {Statusspalte} "
      & "action_column {Aktionsspalte} other {ausgeblendete Spalte}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {Textspalte} number_column {Zahlenspalte} "
      & "date_column {Datumsspalte} status_column {Statusspalte} action_column "
      & "{Aktionsspalte} other {ausgeblendete Spalte}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 Zeile} other {{count, number} Zeilen}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {keine Zeilen} one {1 Zeile} other {{count, number} "
      & "Zeilen}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {nicht sortiert} ascending_sort "
      & "{aufsteigend} other {absteigend}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {nicht sortiert} ascending_sort {nach "
      & "{column_name} aufsteigend sortiert} other {nach {column_name} "
      & "absteigend sortiert}}");
   P ("label.tables.subtotal_label", "Zwischensumme {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 Zeile} other {{rows, number} Zeilen}} × "
      & "{columns, plural, one {1 Spalte} other {{columns, number} Spalten}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} nicht mehr zugewiesen} assigned "
      & "{zugewiesen an {assignee}} reassigned {neu zugewiesen an {assignee}} "
      & "watching {{assignee} beobachtet} other {{assignee} ist "
      & "verantwortlich}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nicht zugewiesen} assigned {zugewiesen} "
      & "reassigned {neu zugewiesen} watching {beobachtet} other "
      & "{verantwortlich}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {leerer Backlog} one {Backlog: 1 Aufgabe} other "
      & "{Backlog: {count, number} Aufgaben}}");
   P ("label.tasks.blocker_label", "blockiert durch {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {Aufgabe abschließen} other {{count, number} "
      & "Aufgaben abschließen}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {keine abgeschlossenen Aufgaben} one {1 "
      & "abgeschlossene Aufgabe} other {{count, number} abgeschlossene "
      & "Aufgaben}}");
   P ("label.tasks.due_label", "fällig {due_text}");
   P ("label.tasks.estimate_label", "Schätzung: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {keine offenen Aufgaben} one {1 offene Aufgabe} "
      & "other {{count, number} offene Aufgaben}}");
   P ("label.tasks.overdue_label", "überfällig seit {due_text}");
   P ("label.tasks.recurring_task_label", "Wiederholung: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {Aufgabe wieder öffnen} other {{count, number} "
      & "Aufgaben wieder öffnen}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 Aufgabe} other {{count, number} "
      & "Aufgaben}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 Unteraufgabe} other {{count, number} "
      & "Unteraufgaben}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {keine Aufgaben} one {1 Aufgabe} other {{count, "
      & "number} Aufgaben}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {offene Aufgabe} in_progress_task "
      & "{Aufgabe in Bearbeitung} blocked_task {blockierte Aufgabe} done_task "
      & "{erledigte Aufgabe} canceled_task {abgebrochene Aufgabe} deferred_task "
      & "{zurückgestellte Aufgabe} other {überfällige Aufgabe}}{priority, "
      & "select, no_priority {} low_priority {, niedrige Priorität} "
      & "medium_priority {, mittlere Priorität} high_priority {, hohe "
      & "Priorität} other {, kritische Priorität}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {keine Priorität} low_priority "
      & "{niedrige Priorität} medium_priority {mittlere Priorität} "
      & "high_priority {hohe Priorität} other {kritische Priorität}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {offene Aufgabe} in_progress_task {Aufgabe "
      & "in Bearbeitung} blocked_task {blockierte Aufgabe} done_task {erledigte "
      & "Aufgabe} canceled_task {abgebrochene Aufgabe} deferred_task "
      & "{zurückgestellte Aufgabe} other {überfällige Aufgabe}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {Obergrenze} other {Untergrenze}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {unterhalb des erwarteten Bereichs} "
      & "within_range {innerhalb des erwarteten Bereichs} above_range {oberhalb "
      & "des erwarteten Bereichs} below_target {unter dem Zielwert} at_target "
      & "{Zielwert erreicht} above_target {über dem Zielwert} near_limit {nahe "
      & "am Grenzwert} warning_level {Warnschwelle erreicht} critical_level "
      & "{kritische Schwelle erreicht} breached {Grenzwert überschritten} "
      & "other {Schwellenstatus unbekannt}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {auf dem neuesten Stand} one "
      & "{1 Commit voraus} other {{ahead, number} Commits voraus}}} one "
      & "{{ahead, plural, =0 {1 Commit zurück} one {1 Commit voraus, 1 Commit "
      & "zurück} other {{ahead, number} Commits voraus, 1 Commit zurück}}} "
      & "other {{ahead, plural, =0 {{behind, number} Commits zurück} one {1 "
      & "Commit voraus, {behind, number} Commits zurück} other {{ahead, "
      & "number} Commits voraus, {behind, number} Commits zurück}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {wartet auf Genehmigung durch {approver}} other "
      & "{genehmigt von {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {Versuch 1 von 1} other "
      & "{Versuch {attempt, number} von 1 (Limit überschritten)}}} other "
      & "{Versuch {attempt, number} von {limit, number}}}");
   P ("label.workflows.blocker_label", "blockiert: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {keine blockierenden Abhängigkeiten} one {1 "
      & "blockierende Abhängigkeit} other {{count, number} blockierende "
      & "Abhängigkeiten}}");
   P ("label.workflows.handoff_label", "Übergabe von {from} an {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {bevorstehender Meilenstein} "
      & "current_milestone {aktueller Meilenstein} complete_milestone "
      & "{erreichter Meilenstein} missed_milestone {verpasster Meilenstein} "
      & "other {blockierter Meilenstein}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {bevorstehend} "
      & "current_milestone {aktuell} complete_milestone {erreicht} "
      & "missed_milestone {verpasst} other {blockiert}}");
   P ("label.workflows.next_action_label", "nächster Schritt: {action}");
   P ("label.workflows.owner_label", "Verantwortlich: {owner}");
   P ("label.workflows.resume_label", "{name} fortsetzen");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {ausstehend} active_step {aktiv} "
      & "waiting_step {wartet} blocked_step {blockiert} done_step {erledigt} "
      & "failed_step {fehlgeschlagen} other {übersprungen}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {ausstehend} active_step {aktiv} "
      & "waiting_step {wartet} blocked_step {blockiert} done_step {erledigt} "
      & "failed_step {fehlgeschlagen} other {übersprungen}}");
   P ("label.workflows.waiting_label", "wartet auf {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nicht gestartet} "
      & "in_progress_state {läuft} waiting_state {wartet} "
      & "waiting_approval_state {wartet auf Genehmigung} blocked_state "
      & "{blockiert} completed_state {abgeschlossen} failed_state "
      & "{fehlgeschlagen} cancelled_state {abgebrochen} skipped_state "
      & "{übersprungen} other {pausiert}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nicht gestartet} in_progress_state "
      & "{läuft} waiting_state {wartet} waiting_approval_state {wartet auf "
      & "Genehmigung} blocked_state {blockiert} completed_state {abgeschlossen} "
      & "failed_state {fehlgeschlagen} cancelled_state {abgebrochen} "
      & "skipped_state {übersprungen} other {pausiert}}");
end Labels_2;
