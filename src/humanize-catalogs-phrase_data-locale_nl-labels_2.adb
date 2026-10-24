separate (Humanize.Catalogs.Phrase_Data.Locale_Nl)
procedure Labels_2 is
begin
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {menu-item} tab_item "
      & "{tabblad} breadcrumb_item {kruimelpadniveau} section_item {sectie} "
      & "other {scheidingslijn}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {link} menu_item {menu-item} tab_item "
      & "{tabblad} breadcrumb_item {kruimelpadniveau} section_item {sectie} "
      & "other {scheidingslijn}}, {state, select, current_item {huidig} "
      & "active_item {actief} inactive_item {inactief} disabled_item "
      & "{uitgeschakeld} expanded_item {uitgevouwen} collapsed_item "
      & "{samengevouwen} visited_item {bezocht} other {extern}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {huidig} active_item {actief} "
      & "inactive_item {inactief} disabled_item {uitgeschakeld} expanded_item "
      & "{uitgevouwen} collapsed_item {samengevouwen} visited_item {bezocht} "
      & "other {extern}}");
   P ("label.navigation.next_label", "volgende: {target}");
   P ("label.navigation.section_state_label",
      "sectie {name} {expanded, select, false {samengevouwen} other "
      & "{uitgevouwen}}{count, plural, =0 {} one {, 1 item} other {, {count, "
      & "number} items}}");
   P ("label.navigation.skip_link_label", "naar {target} springen");
   P ("label.navigation.submenu_label",
      "{count, plural, one {submenu {name}, 1 item} other {submenu {name}, "
      & "{count, number} items}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {alle meldingen} important_alerts "
      & "{belangrijke meldingen} critical_alerts_only {alleen kritieke "
      & "meldingen} other {geen meldingen}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: meldingen {state, select, preference_enabled {ingeschakeld} "
      & "preference_disabled {uitgeschakeld} preference_inherited {overgenomen} "
      & "other {verplicht}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {geen overzicht} instant_digest {direct "
      & "overzicht} daily_digest {dagelijks overzicht} other {wekelijks "
      & "overzicht}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {ingeschakeld} preference_disabled "
      & "{uitgeschakeld} preference_inherited {overgenomen} other {verplicht}}");
   P ("label.notification_preferences.quiet_hours_label", "stille uren {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {threadabonnement} "
      & "project_subscription {projectabonnement} team_subscription "
      & "{teamabonnement} other {accountabonnement}} {state, select, "
      & "preference_enabled {ingeschakeld} preference_disabled {uitgeschakeld} "
      & "preference_inherited {overgenomen} other {verplicht}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {threadabonnement} "
      & "project_subscription {projectabonnement} team_subscription "
      & "{teamabonnement} other {accountabonnement}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} heeft je genoemd} reply_event "
      & "{{actor} heeft gereageerd} assignment_event {{actor} heeft je iets "
      & "toegewezen} approval_event {{actor} heeft om goedkeuring gevraagd} "
      & "alert_event {{actor} heeft een waarschuwing gestuurd} digest_event "
      & "{{actor} heeft een overzicht gestuurd} reminder_event {{actor} heeft "
      & "een herinnering gestuurd} other {{actor} heeft een systeemmelding "
      & "gestuurd}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {in-app-melding} email_channel "
      & "{e-mailmelding} sms_channel {sms-melding} push_channel {pushmelding} "
      & "webhook_channel {webhookmelding} other {overzichtsmelding}} {state, "
      & "select, pending_delivery {in afwachting} sent_delivery {verzonden} "
      & "delivered_delivery {bezorgd} failed_delivery {mislukt} "
      & "retrying_delivery {wordt opnieuw geprobeerd} other {geannuleerd}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {melding in afwachting} sent_delivery "
      & "{melding verzonden} delivered_delivery {melding bezorgd} "
      & "failed_delivery {melding mislukt} retrying_delivery {melding wordt "
      & "opnieuw geprobeerd} other {melding geannuleerd}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {in afwachting} sent_delivery "
      & "{verzonden} delivered_delivery {bezorgd} failed_delivery {mislukt} "
      & "retrying_delivery {nieuwe poging} other {geannuleerd}} {time_text}");
   P ("label.notifications.digest_label",
      "overzicht {name}: {count, plural, =0 {geen meldingen} one {1 melding} "
      & "other {{count, number} meldingen}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {geen vermeldingen} "
      & "one {1 vermelding} other {{count, number} vermeldingen}}} reply_event "
      & "{{count, plural, =0 {geen reacties} one {1 reactie} other {{count, "
      & "number} reacties}}} assignment_event {{count, plural, =0 {geen "
      & "toewijzingen} one {1 toewijzing} other {{count, number} "
      & "toewijzingen}}} approval_event {{count, plural, =0 {geen "
      & "goedkeuringsverzoeken} one {1 goedkeuringsverzoek} other {{count, "
      & "number} goedkeuringsverzoeken}}} alert_event {{count, plural, =0 {geen "
      & "waarschuwingen} one {1 waarschuwing} other {{count, number} "
      & "waarschuwingen}}} digest_event {{count, plural, =0 {geen overzichten} "
      & "one {1 overzicht} other {{count, number} overzichten}}} reminder_event "
      & "{{count, plural, =0 {geen herinneringen} one {1 herinnering} other "
      & "{{count, number} herinneringen}}} other {{count, plural, =0 {geen "
      & "systeemmeldingen} one {1 systeemmelding} other {{count, number} "
      & "systeemmeldingen}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {melding als gelezen markeren} other {{count, "
      & "number} meldingen als gelezen markeren}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {melding als ongelezen markeren} other {{count, "
      & "number} meldingen als ongelezen markeren}}");
   P ("label.notifications.muted_label", "{name}: meldingen gedempt");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nieuwe vermelding} reply_event {nieuwe "
      & "reactie} assignment_event {nieuwe toewijzing} approval_event {nieuw "
      & "goedkeuringsverzoek} alert_event {nieuwe waarschuwing} digest_event "
      & "{nieuw overzicht} reminder_event {nieuwe herinnering} other {nieuwe "
      & "systeemmelding}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {in-app-meldingen} email_channel "
      & "{e-mailmeldingen} sms_channel {sms-meldingen} push_channel "
      & "{pushmeldingen} webhook_channel {webhookmeldingen} other "
      & "{overzichtsmeldingen}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {geen meldingen} one {1 melding} other {{count, "
      & "number} meldingen}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {vermelding} reply_event {reactie} "
      & "assignment_event {toewijzing} approval_event {goedkeuringsverzoek} "
      & "alert_event {waarschuwing} digest_event {overzicht} reminder_event "
      & "{herinnering} other {systeemmelding}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {geen meldingen} one {1 melding} other "
      & "{{count, number} meldingen}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {vermelding} reply_event "
      & "{reactie} assignment_event {toewijzing} approval_event "
      & "{goedkeuringsverzoek} alert_event {waarschuwing} digest_event "
      & "{overzicht} reminder_event {herinnering} other {systeemmelding}}, "
      & "{state, select, unread_state {ongelezen} read_state {gelezen} "
      & "archived_state {gearchiveerd} muted_state {gedempt} snoozed_state "
      & "{gesluimerd} other {onderdrukt}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {ongelezen melding} read_state {gelezen "
      & "melding} archived_state {gearchiveerde melding} muted_state {gedempte "
      & "melding} snoozed_state {gesluimerde melding} other {onderdrukte "
      & "melding}}");
   P ("label.notifications.snoozed_label", "{name}: meldingen gesluimerd");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {geen meldingen onderdrukt} one {1 melding "
      & "onderdrukt} other {{count, number} meldingen onderdrukt}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {geen ongelezen meldingen} one {1 ongelezen "
      & "melding} other {{count, number} ongelezen meldingen}}");
   P ("label.payments.amount_label", "bedrag {amount_text}");
   P ("label.payments.balance_label", "saldo {amount_text}");
   P ("label.payments.chargeback_label", "terugboeking {amount_text}");
   P ("label.payments.discount_label", "korting {amount_text}");
   P ("label.payments.due_label", "{amount_text} verschuldigd {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {geen facturen} one {1 factuur} other {{count, "
      & "number} facturen}}");
   P ("label.payments.invoice_label",
      "factuur {number}: {state, select, draft_invoice {concept} open_invoice "
      & "{open} paid_invoice {betaald} overdue_invoice {achterstallig} other "
      & "{ongeldig}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {conceptfactuur} open_invoice "
      & "{openstaande factuur} paid_invoice {betaalde factuur} overdue_invoice "
      & "{achterstallige factuur} other {ongeldige factuur}}");
   P ("label.payments.method_label",
      "betaald {method, select, card_method {met kaart} bank_transfer_method "
      & "{per bankoverschrijving} cash_method {contant} wallet_method {met "
      & "wallet} check_method {per cheque} other {op andere wijze}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} betaald {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {geen betalingen} one {1 betaling} other {{count, "
      & "number} betalingen}}");
   P ("label.payments.payment_label",
      "{amount_text}: betaling {state, select, pending_payment {in "
      & "afwachting} authorized_payment {geautoriseerd} paid_payment {betaald} "
      & "failed_payment {mislukt} refunded_payment {terugbetaald} other "
      & "{geannuleerd}}");
   P ("label.payments.payment_link_label", "betaallink {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kaart} bank_transfer_method "
      & "{bankoverschrijving} cash_method {contant} wallet_method {wallet} "
      & "check_method {cheque} other {overig}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {betaling in afwachting} "
      & "authorized_payment {betaling geautoriseerd} paid_payment {betaling "
      & "voldaan} failed_payment {betaling mislukt} refunded_payment {betaling "
      & "terugbetaald} other {betaling geannuleerd}}");
   P ("label.payments.receipt_label", "bon {number}");
   P ("label.payments.refund_label",
      "{amount_text}: terugbetaling {state, select, pending_payment {in "
      & "afwachting} authorized_payment {geautoriseerd} paid_payment "
      & "{uitbetaald} failed_payment {mislukt} refunded_payment {voltooid} "
      & "other {geannuleerd}}");
   P ("label.payments.subtotal_label", "subtotaal {amount_text}");
   P ("label.payments.tax_label", "btw {amount_text}");
   P ("label.payments.total_label", "totaal {amount_text}");
   P ("label.permissions.access_expiry_label", "toegang van {subject} verloopt {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {rol eigenaar} admin_role {rol "
      & "beheerder} editor_role {rol bewerker} viewer_role {rol lezer} other "
      & "{aangepaste rol}} toegekend");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {toegekend} denied "
      & "{geweigerd} inherited {overgenomen} temporary {tijdelijke toegang} "
      & "expired {verlopen} other {goedkeuring vereist}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {toegekend} denied {geweigerd} inherited "
      & "{overgenomen} temporary {tijdelijke toegang} expired {verlopen} other "
      & "{goedkeuring vereist}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {toegestaan door beleid} policy_denied "
      & "{geweigerd door beleid} policy_warning {beleidswaarschuwing} other "
      & "{beleid niet van toepassing}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {rol eigenaar} admin_role {rol "
      & "beheerder} editor_role {rol bewerker} viewer_role {rol lezer} other "
      & "{aangepaste rol}} ingetrokken");
   P ("label.permissions.role_label",
      "{role, select, owner_role {eigenaar} admin_role {beheerder} "
      & "editor_role {bewerker} viewer_role {lezer} other {aangepaste rol}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {leeg} low_utilization {laag gebruik} "
      & "normal_utilization {normaal gebruik} high_utilization {hoog gebruik} "
      & "critical_utilization {kritiek gebruik} full_utilization {vol} other "
      & "{limiet overschreden}}");
   P ("label.schema.array_shape_label",
      "array van {count_known, select, false {{element_type, select, "
      & "string_field {strings} integer_field {gehele getallen} decimal_field "
      & "{decimale getallen} boolean_field {booleans} date_field {datums} "
      & "date_time_field {datum-tijdwaarden} object_field {objecten} "
      & "array_field {arrays} enum_field {enumwaarden} binary_field {binaire "
      & "waarden} null_field {null-waarden} any_field {willekeurige waarden} "
      & "other {onbekende waarden}}} other {{count, plural, one {1 "
      & "{element_type, select, string_field {string} integer_field {geheel "
      & "getal} decimal_field {decimaal getal} boolean_field {boolean} "
      & "date_field {datum} date_time_field {datum-tijdwaarde} object_field "
      & "{object} array_field {array} enum_field {enumwaarde} binary_field "
      & "{binaire waarde} null_field {null-waarde} any_field {willekeurige "
      & "waarde} other {onbekende waarde}}} other {{count, number} "
      & "{element_type, select, string_field {strings} integer_field {gehele "
      & "getallen} decimal_field {decimale getallen} boolean_field {booleans} "
      & "date_field {datums} date_time_field {datum-tijdwaarden} object_field "
      & "{objecten} array_field {arrays} enum_field {enumwaarden} binary_field "
      & "{binaire waarden} null_field {null-waarden} any_field {willekeurige "
      & "waarden} other {onbekende waarden}}}}}}");
   P ("label.schema.constraint_label", "beperking {name}: {value}");
   P ("label.schema.default_value_label", "veld {field_name}: standaardwaarde {value}");
   P ("label.schema.deprecated_field_label", "verouderd veld {name}, gebruik {replacement}");
   P ("label.schema.enum_options_label", "{count, plural, one {1 enumoptie} other {{count, number} enumopties}}");
   P ("label.schema.example_value_label", "veld {field_name}: voorbeeld {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normaal veld} deprecated_field "
      & "{verouderd veld} unknown_field {onbekend veld} read_only_field "
      & "{alleen-lezenveld} write_only_field {alleen-schrijvenveld} other "
      & "{berekend veld}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {stringveld} integer_field "
      & "{geheel-getalveld} decimal_field {decimaal veld} boolean_field "
      & "{booleaans veld} date_field {datumveld} date_time_field "
      & "{datum-tijdveld} object_field {objectveld} array_field {arrayveld} "
      & "enum_field {enumveld} binary_field {binair veld} null_field "
      & "{null-veld} any_field {veld van willekeurig type} other {veld van "
      & "onbekend type}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {geen ontbrekende verplichte velden} one {1 "
      & "ontbrekend verplicht veld} other {{count, number} ontbrekende "
      & "verplichte velden}}");
   P ("label.schema.object_shape_label",
      "object met {fields, plural, one {1 veld} other {{fields, number} "
      & "velden}}{required, plural, =0 {} other {, {required, number} "
      & "verplicht}}{optional, plural, =0 {} other {, {optional, number} "
      & "optioneel}}");
   P ("label.schema.schema_source_label", "schema {name}, versie {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {scalaire waarde} object_shape {{count, "
      & "plural, =0 {object} one {object met 1 veld} other {object met {count, "
      & "number} velden}}} array_shape {{count, plural, =0 {array} one {array "
      & "met 1 item} other {array met {count, number} items}}} map_shape "
      & "{{count, plural, =0 {map} one {map met 1 item} other {map met {count, "
      & "number} items}}} tuple_shape {{count, plural, =0 {tupel} one {tupel "
      & "met 1 item} other {tupel met {count, number} items}}} union_shape "
      & "{{count, plural, =0 {unie} one {unie van 1 type} other {unie van "
      & "{count, number} typen}}} empty_shape {lege structuur} other {onbekende "
      & "structuur}}");
   P ("label.schema.unknown_field_label", "onbekend veld {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {geen actieve filters} one {1 actief filter} other "
      & "{{count, number} actieve filters}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {filters wissen} one {actief filter wissen} other "
      & "{{count, number} actieve filters wissen}}");
   P ("label.search.facet_label",
      "facet {name}, {count, plural, one {1 optie} other {{count, number} "
      & "opties}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {geen resultaten} one {1 resultaat} other "
      & "{{count, number} resultaten}}{selected, select, true {, geselecteerd} "
      & "other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {actief filter} "
      & "inactive_filter {inactief filter} other {uitsluitingsfilter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {actief filter} inactive_filter "
      & "{inactief filter} other {uitsluitingsfilter}}");
   P ("label.search.no_results_label", "geen resultaten voor ‘{query}’");
   P ("label.search.recent_search_label", "recente zoekopdracht: ‘{query}’");
   P ("label.search.saved_search_label",
      "opgeslagen zoekopdracht: {name}{count, plural, =0 {} one {, 1 "
      & "resultaat} other {, {count, number} resultaten}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {geen recente zoekopdrachten} one {1 recente "
      & "zoekopdracht} other {{count, number} recente zoekopdrachten}}");
   P ("label.search.search_query_label", "zoeken naar ‘{query}’");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {geen resultaten} one {1 resultaat} other {{count, "
      & "number} resultaten}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {geen resultaten voor ‘{query}’} one {1 "
      & "resultaat voor ‘{query}’} other {{count, number} resultaten voor "
      & "‘{query}’}}");
   P ("label.search.search_scope_label",
      "zoekbereik {name}, {count, plural, =0 {geen resultaten} one {1 "
      & "resultaat} other {{count, number} resultaten}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {zoeken inactief} searching_search {bezig "
      & "met zoeken} complete_search {zoeken voltooid} empty_search {geen "
      & "zoekresultaten} other {zoeken mislukt}}");
   P ("label.search.sort_label",
      "sortering: {mode, select, relevance_sort {relevantie} ascending_sort "
      & "{oplopend} descending_sort {aflopend} newest_first_sort {nieuwste "
      & "eerst} other {oudste eerst}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevantie} ascending_sort {oplopend} "
      & "descending_sort {aflopend} newest_first_sort {nieuwste eerst} other "
      & "{oudste eerst}}");
   P ("label.search.suggestion_label", "bedoelde je ‘{query}’?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 referentie uit {source}} other {{count, number} "
      & "referenties uit {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {waarde verborgen} masked_value "
      & "{waarde gemaskeerd} suffix_only {alleen achtervoegsel} other {alleen "
      & "vingerafdruk}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {openbaar} support_profile {support} "
      & "audit_profile {audit} other {debug}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {rotatie nodig} other {rotatie niet "
      & "nodig}}{days_old, plural, =0 {} one {, 1 dag oud} other {, {days_old, "
      & "number} dagen oud}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-sleutel} live_api_key {live-API-sleutel} "
      & "test_api_key {test-API-sleutel} github_token {GitHub-token} "
      & "aws_access_key {AWS-toegangssleutel} google_api_key "
      & "{Google-API-sleutel} slack_token {Slack-token} npm_token {npm-token} "
      & "bearer_token {bearertoken} jwt_token {JWT-token} basic_auth_credential "
      & "{basic-auth-referentie} password_secret {wachtwoord} private_key "
      & "{privésleutel} ssh_private_key {SSH-privésleutel} webhook_secret "
      & "{webhookgeheim} oauth_token {OAuth-token} database_url_secret "
      & "{database-URL met inloggegevens} sha1_fingerprint {SHA-1-vingerafdruk} "
      & "sha256_fingerprint {SHA-256-vingerafdruk} other {geheim}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefoon} url_value "
      & "{URL} ip_address_value {IP-adres} token_value {token} file_path_value "
      & "{bestandspad} account_id_value {account-ID} payment_reference_value "
      & "{betalingskenmerk} log_field_value {logveld} other {gevoelige waarde}}");
   P ("label.tables.cell_label",
      "rij {row, number}, kolom {column, number}, {state, select, empty_cell "
      & "{leeg} edited_cell {bewerkt} invalid_cell {ongeldig} highlighted_cell "
      & "{gemarkeerd} other {alleen-lezen}}");
   P ("label.tables.cell_position_label", "rij {row, number}, kolom {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {lege cel} edited_cell {bewerkte cel} "
      & "invalid_cell {ongeldige cel} highlighted_cell {gemarkeerde cel} other "
      & "{alleen-lezencel}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {geen kolommen} one {1 kolom} other {{count, "
      & "number} kolommen}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {tekstkolom} number_column "
      & "{getalkolom} date_column {datumkolom} status_column {statuskolom} "
      & "action_column {actiekolom} other {verborgen kolom}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {tekstkolom} number_column {getalkolom} "
      & "date_column {datumkolom} status_column {statuskolom} action_column "
      & "{actiekolom} other {verborgen kolom}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 rij} other {{count, number} rijen}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {geen rijen} one {1 rij} other {{count, number} "
      & "rijen}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {niet gesorteerd} ascending_sort "
      & "{oplopend} other {aflopend}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {niet gesorteerd} ascending_sort "
      & "{oplopend gesorteerd op {column_name}} other {aflopend gesorteerd op "
      & "{column_name}}}");
   P ("label.tables.subtotal_label", "subtotaal {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 rij} other {{rows, number} rijen}} × {columns, "
      & "plural, one {1 kolom} other {{columns, number} kolommen}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} niet meer toegewezen} assigned "
      & "{toegewezen aan {assignee}} reassigned {opnieuw toegewezen aan "
      & "{assignee}} watching {{assignee} volgt} other {{assignee} is "
      & "eigenaar}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {niet toegewezen} assigned {toegewezen} "
      & "reassigned {opnieuw toegewezen} watching {volgt} other {eigenaar}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {lege backlog} one {backlog: 1 taak} other "
      & "{backlog: {count, number} taken}}");
   P ("label.tasks.blocker_label", "geblokkeerd door {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {taak voltooien} other {{count, number} taken "
      & "voltooien}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {geen voltooide taken} one {1 voltooide taak} other "
      & "{{count, number} voltooide taken}}");
   P ("label.tasks.due_label", "vervalt {due_text}");
   P ("label.tasks.estimate_label", "schatting: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {geen open taken} one {1 open taak} other {{count, "
      & "number} open taken}}");
   P ("label.tasks.overdue_label", "verlopen sinds {due_text}");
   P ("label.tasks.recurring_task_label", "herhaling: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {taak heropenen} other {{count, number} taken "
      & "heropenen}}");
   P ("label.tasks.sprint_label", "{name}: {count, plural, one {1 taak} other {{count, number} taken}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 subtaak} other {{count, number} "
      & "subtaken}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {geen taken} one {1 taak} other {{count, number} "
      & "taken}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {open taak} in_progress_task {taak "
      & "in uitvoering} blocked_task {geblokkeerde taak} done_task {voltooide "
      & "taak} canceled_task {geannuleerde taak} deferred_task {uitgestelde "
      & "taak} other {verlopen taak}}{priority, select, no_priority {} "
      & "low_priority {, lage prioriteit} medium_priority {, gemiddelde "
      & "prioriteit} high_priority {, hoge prioriteit} other {, kritieke "
      & "prioriteit}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {geen prioriteit} low_priority {lage "
      & "prioriteit} medium_priority {gemiddelde prioriteit} high_priority "
      & "{hoge prioriteit} other {kritieke prioriteit}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {open taak} in_progress_task {taak in "
      & "uitvoering} blocked_task {geblokkeerde taak} done_task {voltooide "
      & "taak} canceled_task {geannuleerde taak} deferred_task {uitgestelde "
      & "taak} other {verlopen taak}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {bovengrens} other {ondergrens}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {onder verwacht bereik} within_range "
      & "{binnen verwacht bereik} above_range {boven verwacht bereik} "
      & "below_target {onder doelwaarde} at_target {doelwaarde bereikt} "
      & "above_target {boven doelwaarde} near_limit {dicht bij limiet} "
      & "warning_level {waarschuwingsdrempel bereikt} critical_level {kritieke "
      & "drempel bereikt} breached {limiet overschreden} other {drempelstatus "
      & "onbekend}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {bijgewerkt} one {1 commit "
      & "voor} other {{ahead, number} commits voor}}} one {{ahead, plural, =0 "
      & "{1 commit achter} one {1 commit voor, 1 commit achter} other {{ahead, "
      & "number} commits voor, 1 commit achter}}} other {{ahead, plural, =0 "
      & "{{behind, number} commits achter} one {1 commit voor, {behind, number} "
      & "commits achter} other {{ahead, number} commits voor, {behind, number} "
      & "commits achter}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {wacht op goedkeuring van {approver}} other "
      & "{goedgekeurd door {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {poging 1 van 1} other "
      & "{poging {attempt, number} van 1 (limiet overschreden)}}} other {poging "
      & "{attempt, number} van {limit, number}}}");
   P ("label.workflows.blocker_label", "geblokkeerd: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {geen blokkerende afhankelijkheden} one {1 "
      & "blokkerende afhankelijkheid} other {{count, number} blokkerende "
      & "afhankelijkheden}}");
   P ("label.workflows.handoff_label", "overdracht van {from} aan {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {komende mijlpaal} "
      & "current_milestone {huidige mijlpaal} complete_milestone {behaalde "
      & "mijlpaal} missed_milestone {gemiste mijlpaal} other {geblokkeerde "
      & "mijlpaal}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {komend} current_milestone "
      & "{huidig} complete_milestone {behaald} missed_milestone {gemist} other "
      & "{geblokkeerd}}");
   P ("label.workflows.next_action_label", "volgende stap: {action}");
   P ("label.workflows.owner_label", "eigenaar: {owner}");
   P ("label.workflows.resume_label", "{name} hervatten");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {in afwachting} active_step {actief} "
      & "waiting_step {wachtend} blocked_step {geblokkeerd} done_step "
      & "{voltooid} failed_step {mislukt} other {overgeslagen}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {in afwachting} active_step "
      & "{actief} waiting_step {wachtend} blocked_step {geblokkeerd} done_step "
      & "{voltooid} failed_step {mislukt} other {overgeslagen}}");
   P ("label.workflows.waiting_label", "wacht op {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {niet gestart} "
      & "in_progress_state {bezig} waiting_state {wachtend} "
      & "waiting_approval_state {wacht op goedkeuring} blocked_state "
      & "{geblokkeerd} completed_state {voltooid} failed_state {mislukt} "
      & "cancelled_state {geannuleerd} skipped_state {overgeslagen} other "
      & "{gepauzeerd}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {niet gestart} in_progress_state "
      & "{bezig} waiting_state {wachtend} waiting_approval_state {wacht op "
      & "goedkeuring} blocked_state {geblokkeerd} completed_state {voltooid} "
      & "failed_state {mislukt} cancelled_state {geannuleerd} skipped_state "
      & "{overgeslagen} other {gepauzeerd}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {transparant} mostly_transparent "
      & "{grotendeels transparant} translucent {doorschijnend} mostly_opaque "
      & "{grotendeels dekkend} other {dekkend}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {geen waarnemingen} one {1 waarneming, min. "
      & "{minimum} {unit}, mediaan {median} {unit}, max. {maximum} {unit}} "
      & "other {{count, number} waarnemingen, min. {minimum} {unit}, mediaan "
      & "{median} {unit}, max. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {geen waarnemingen} one {0 "
      & "uitschieters van 1 waarneming} other {0 uitschieters van {total, "
      & "number} waarnemingen}}} one {{total, plural, one {1 uitschieter van 1 "
      & "waarneming} other {1 uitschieter van {total, number} waarnemingen}}} "
      & "other {{outliers, number} uitschieters van {total, number} "
      & "waarnemingen}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} boven capaciteit} other "
      & "{{count, number} van {total, number} {unit} resterend}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {quotum overschreden met {count, number} "
      & "{unit} ({percent} gebruikt)} near {quotum bijna bereikt: {count, "
      & "number} {unit} resterend ({percent} gebruikt)} other {quotum "
      & "beschikbaar: {count, number} {unit} resterend ({percent} gebruikt)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {cachetrefferpercentage niet beschikbaar: geen "
      & "verzoeken} other {cachetrefferpercentage {percent}: {hits, plural, one "
      & "{1 treffer} other {{hits, number} treffers}}, {misses, plural, one {1 "
      & "misser} other {{misses, number} missers}}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 attribuut} other {{count, number} attributen}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data-attribuut} other {{count, number} "
      & "data-attributen}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA-attribuut} other {{count, number} "
      & "ARIA-attributen}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 eventhandler} other {{count, number} "
      & "eventhandlers}}");
   P ("label.markup.heading_label", "kopniveau {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 tag} other {{count, number} tags}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 link} other {{count, number} links}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 media-element} other {{count, number} "
      & "media-elementen}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 formulierelement} other {{count, number} "
      & "formulierelementen}}");
   P ("label.markup.document_outline_label.headings", "{count, plural, one {1 kop} other {{count, number} koppen}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 landmark} other {{count, number} landmarks}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {1 formulier} other {{count, number} formulieren}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 media-element} other {{count, number} "
      & "media-elementen}}");
   P ("label.markup.table_navigation_label",
      "{caption} rij {row, number} van {rows, number}, kolom {column, number} "
      & "van {columns, number}");
   P ("label.secrets.secret_count_label.total", "{count, plural, one {1 geheim} other {{count, number} geheimen}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} gemaskeerd");
   P ("label.secrets.secret_count_label.unset", "{count, number} niet ingesteld");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 vingerafdruk} other {{count, number} "
      & "vingerafdrukken}}");
   P ("label.schema.type_mismatch_label",
      "veld {field_name}: {expected, select, string_field {string} "
      & "integer_field {geheel getal} decimal_field {decimaal getal} "
      & "boolean_field {boolean} date_field {datum} date_time_field "
      & "{datum-tijd} object_field {object} array_field {array} enum_field "
      & "{enum} binary_field {binair} null_field {null} any_field {willekeurig} "
      & "other {onbekend}} verwacht, {actual, select, string_field {string} "
      & "integer_field {geheel getal} decimal_field {decimaal getal} "
      & "boolean_field {boolean} date_field {datum} date_time_field "
      & "{datum-tijd} object_field {object} array_field {array} enum_field "
      & "{enum} binary_field {binair} null_field {null} any_field {willekeurig} "
      & "other {onbekend}} ontvangen");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 blokkerend "
      & "probleem} other {{blocking, number} blokkerende problemen}}} blocking "
      & "{{base}, {blocking, plural, one {1 blokkerend probleem} other "
      & "{{blocking, number} blokkerende problemen}}} only {alleen {base}} "
      & "other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {doelbereik {low} tot en met "
      & "{high}} other {doelvenster {low} tot {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} binnen verwacht bereik} below {{value} "
      & "onder verwacht bereik} other {{value} boven verwacht bereik}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} op kritieke drempel} warning "
      & "{{value} op waarschuwingsdrempel} other {{value} binnen normaal "
      & "bereik}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {niet overschreden} other {overschreden met "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {op doelwaarde} below {{difference} onder "
      & "doelwaarde} other {{difference} boven doelwaarde}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limiet overschreden} near {dicht bij limiet, "
      & "{distance} resterend} other {{distance} van limiet}}");
   P ("label.thresholds.threshold_summary_label.none", "geen metrieken");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normaal");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 waarschuwing} other {{count, number} "
      & "waarschuwingen}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} kritiek");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 overschrijding} other {{count, number} "
      & "overschrijdingen}}");
   P ("label.thresholds.target_window_label", "doel {target} plus/min {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerantie {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} van limiet");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limiet overschreden met {amount}} other "
      & "{{amount} resterend}}");
   P ("label.thresholds.budget_used_label", "{used} van {budget} gebruikt");
   P ("label.workflows.step_label", "stap {current, number} van {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} van {total, number} mijlpalen behaald: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {geen workflowitems} half {workflow halverwege} "
      & "other {{completed, number} van {total, number} voltooid}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {positie {position, number} in wachtrij} other "
      & "{positie {position, number} van {total, number} in wachtrij}}");
   P ("label.changes.change_set_label.none", "geen wijzigingen");
   P ("label.changes.change_set_label.added", "{count, number} toegevoegd");
   P ("label.changes.change_set_label.removed", "{count, number} verwijderd");
   P ("label.changes.change_set_label.modified", "{count, number} gewijzigd");
   P ("label.changes.change_set_label.unchanged", "{count, number} ongewijzigd");
   P ("label.changes.sync_change_label.none", "geen synchronisatiewijzigingen");
   P ("label.changes.sync_change_label.uploaded", "{count, number} geüpload");
   P ("label.changes.sync_change_label.downloaded", "{count, number} gedownload");
   P ("label.changes.sync_change_label.deleted", "{count, number} verwijderd");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 conflict} other {{count, number} conflicten}}");
   P ("label.changes.net_change_label",
      "{state, select, none {geen nettowijziging} up {netto +{count, plural, "
      & "one {1 item} other {{count, number} items}}} other {netto -{count, "
      & "plural, one {1 item} other {{count, number} items}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {geen wijzigingen om te beoordelen} all {alle "
      & "wijzigingen beoordeeld} other {{reviewed, number} van {total, number} "
      & "wijzigingen beoordeeld}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} ongewijzigd op {new_value}} up "
      & "{{field_name} gestegen van {old_value} naar {new_value}} other "
      & "{{field_name} gedaald van {old_value} naar {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {geen rijen selecteerbaar} none {geen rijen "
      & "geselecteerd} all {{total, plural, one {1 rij geselecteerd} other "
      & "{alle {total, number} rijen geselecteerd}}} other {{selected, number} "
      & "van {total, plural, one {1 rij} other {{total, number} rijen}} "
      & "geselecteerd}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {geen pagina’s} other {{pages, plural, =0 {geen "
      & "pagina’s} other {{rows, plural, =0 {pagina {page, number} van "
      & "{pages, number}} one {pagina {page, number} van {pages, number}, 1 "
      & "rij} other {pagina {page, number} van {pages, number}, {rows, number} "
      & "rijen}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {geen rijen} none {geen overeenkomende rijen} "
      & "all {{total, plural, one {1 rij zichtbaar} other {alle {total, number} "
      & "rijen zichtbaar}}} other {{visible, number} van {total, plural, one {1 "
      & "rij} other {{total, number} rijen}} zichtbaar}}");
   P ("label.tables.row_range_label",
      "{state, select, none {geen rijen} single {rij {first_row, number} van "
      & "{total, number}} other {rijen {first_row, number}-{last_row, number} "
      & "van {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {geen tekenlimiet} none_left {geen tekens "
      & "over} left {{count, plural, one {1 teken} other {{count, number} "
      & "tekens}} over} other {{count, plural, one {1 teken} other {{count, "
      & "number} tekens}} boven limiet}}");
end Labels_2;
