separate (Humanize.Catalogs.Phrase_Data.Locale_No)
procedure Labels_2 is
begin
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, menu_item {menyelement, {state, select, "
      & "current_item {gjeldende} active_item {aktivt} inactive_item {inaktivt} "
      & "disabled_item {deaktivert} expanded_item {utvidet} collapsed_item "
      & "{skjult} visited_item {besøkt} other {eksternt}}} other {{kind, "
      & "select, link_item {lenke} tab_item {fane} breadcrumb_item {brødsmule} "
      & "section_item {seksjon} other {skilletegn}}, {state, select, "
      & "current_item {gjeldende} active_item {aktiv} inactive_item {inaktiv} "
      & "disabled_item {deaktivert} expanded_item {utvidet} collapsed_item "
      & "{skjult} visited_item {besøkt} other {ekstern}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {gjeldende} active_item {aktiv} "
      & "inactive_item {inaktiv} disabled_item {deaktivert} expanded_item "
      & "{utvidet} collapsed_item {skjult} visited_item {besøkt} other "
      & "{ekstern}}");
   P ("label.navigation.next_label", "neste: {target}");
   P ("label.navigation.section_state_label",
      "{name}: seksjon {expanded, select, false {skjult} other "
      & "{utvidet}}{count, plural, =0 {} one {, 1 element} other {, {count, "
      & "number} elementer}}");
   P ("label.navigation.skip_link_label", "gå til {target}");
   P ("label.navigation.submenu_label",
      "{name}: undermeny, {count, plural, one {1 element} other {{count, "
      & "number} elementer}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {alle alarmer} important_alerts {viktige "
      & "alarmer} critical_alerts_only {bare kritiske alarmer} other {ingen "
      & "alarmer}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: varsler {state, select, preference_enabled {aktivert} "
      & "preference_disabled {deaktivert} preference_inherited {arvet} other "
      & "{påkrevd}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {ingen sammendrag} instant_digest "
      & "{umiddelbart sammendrag} daily_digest {daglig sammendrag} other "
      & "{ukentlig sammendrag}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {aktivert} preference_disabled "
      & "{deaktivert} preference_inherited {arvet} other {påkrevd}}");
   P ("label.notification_preferences.quiet_hours_label", "stilletid: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {trådabonnement} "
      & "project_subscription {prosjektabonnement} team_subscription "
      & "{teamabonnement} other {kontoabonnement}} {state, select, "
      & "preference_enabled {aktivert} preference_disabled {deaktivert} "
      & "preference_inherited {arvet} other {påkrevd}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {trådabonnement} "
      & "project_subscription {prosjektabonnement} team_subscription "
      & "{teamabonnement} other {kontoabonnement}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} nevnte deg} reply_event "
      & "{{actor} svarte} assignment_event {{actor} tildelte deg} "
      & "approval_event {{actor} ba om godkjenning} alert_event {{actor} sendte "
      & "en alarm} digest_event {{actor} sendte et sammendrag} reminder_event "
      & "{{actor} sendte en påminnelse} other {{actor} sendte et "
      & "systemvarsel}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {varsel i appen} email_channel "
      & "{e-postvarsel} sms_channel {SMS-varsel} push_channel {push-varsel} "
      & "webhook_channel {webhook-varsel} other {sammendragsvarsel}}: {state, "
      & "select, pending_delivery {venter} sent_delivery {sendt} "
      & "delivered_delivery {levert} failed_delivery {mislyktes} "
      & "retrying_delivery {prøver på nytt} other {avbrutt}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {ventende varsel} sent_delivery "
      & "{sendt varsel} delivered_delivery {levert varsel} failed_delivery "
      & "{mislykket varsel} retrying_delivery {varsel sendes på nytt} other "
      & "{avbrutt varsel}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {venter {time_text}} sent_delivery "
      & "{sendt {time_text}} delivered_delivery {levert {time_text}} "
      & "failed_delivery {mislyktes {time_text}} retrying_delivery {nytt "
      & "forsøk {time_text}} other {avbrutt {time_text}}}");
   P ("label.notifications.digest_label",
      "sammendrag {name}: {count, plural, =0 {ingen varsler} one {1 varsel} "
      & "other {{count, number} varsler}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {ingen omtaler} one "
      & "{1 omtale} other {{count, number} omtaler}}} reply_event {{count, "
      & "plural, =0 {ingen svar} one {1 svar} other {{count, number} svar}}} "
      & "assignment_event {{count, plural, =0 {ingen tildelinger} one {1 "
      & "tildeling} other {{count, number} tildelinger}}} approval_event "
      & "{{count, plural, =0 {ingen godkjenningsforespørsler} one {1 "
      & "godkjenningsforespørsel} other {{count, number} "
      & "godkjenningsforespørsler}}} alert_event {{count, plural, =0 {ingen "
      & "alarmer} one {1 alarm} other {{count, number} alarmer}}} digest_event "
      & "{{count, plural, =0 {ingen sammendrag} one {1 sammendrag} other "
      & "{{count, number} sammendrag}}} reminder_event {{count, plural, =0 "
      & "{ingen påminnelser} one {1 påminnelse} other {{count, number} "
      & "påminnelser}}} other {{count, plural, =0 {ingen systemvarsler} one {1 "
      & "systemvarsel} other {{count, number} systemvarsler}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {merk varselet som lest} other {merk {count, "
      & "number} varsler som lest}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {merk varselet som ulest} other {merk {count, "
      & "number} varsler som ulest}}");
   P ("label.notifications.muted_label", "{name}: varsler dempet");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {ny omtale} reply_event {nytt svar} "
      & "assignment_event {ny tildeling} approval_event {ny godkjenning} "
      & "alert_event {ny alarm} digest_event {nytt sammendrag} reminder_event "
      & "{ny påminnelse} other {nytt systemvarsel}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {varsler i appen} email_channel "
      & "{e-postvarsler} sms_channel {SMS-varsler} push_channel {push-varsler} "
      & "webhook_channel {webhook-varsler} other {sammendragsvarsler}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {ingen varsler} one {1 varsel} other {{count, "
      & "number} varsler}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {omtale} reply_event {svar} "
      & "assignment_event {tildeling} approval_event {godkjenning} alert_event "
      & "{alarm} digest_event {sammendrag} reminder_event {påminnelse} other "
      & "{systemvarsel}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {ingen varsler} one {1 varsel} other "
      & "{{count, number} varsler}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {omtale} reply_event {svar} "
      & "assignment_event {tildeling} approval_event {godkjenning} alert_event "
      & "{alarm} digest_event {sammendrag} reminder_event {påminnelse} other "
      & "{systemvarsel}}, {state, select, unread_state {ulest} read_state "
      & "{lest} archived_state {arkivert} muted_state {dempet} snoozed_state "
      & "{utsatt} other {undertrykt}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {ulest varsel} read_state {lest varsel} "
      & "archived_state {arkivert varsel} muted_state {dempet varsel} "
      & "snoozed_state {utsatt varsel} other {undertrykt varsel}}");
   P ("label.notifications.snoozed_label", "{name}: varsler utsatt");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {ingen varsler undertrykt} one {1 varsel "
      & "undertrykt} other {{count, number} varsler undertrykt}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {ingen uleste varsler} one {1 ulest varsel} other "
      & "{{count, number} uleste varsler}}");
   P ("label.payments.amount_label", "beløp: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "tilbakeføring: {amount_text}");
   P ("label.payments.discount_label", "rabatt: {amount_text}");
   P ("label.payments.due_label", "{amount_text} forfaller {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {ingen fakturaer} one {1 faktura} other {{count, "
      & "number} fakturaer}}");
   P ("label.payments.invoice_label",
      "faktura {number}: {state, select, draft_invoice {utkast} open_invoice "
      & "{åpen} paid_invoice {betalt} overdue_invoice {forfalt} other "
      & "{annullert}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {fakturautkast} open_invoice {åpen "
      & "faktura} paid_invoice {betalt faktura} overdue_invoice {forfalt "
      & "faktura} other {annullert faktura}}");
   P ("label.payments.method_label",
      "{method, select, card_method {betalt med kort: {detail}} "
      & "bank_transfer_method {betalt med bankoverføring: {detail}} "
      & "cash_method {betalt kontant: {detail}} wallet_method {betalt med "
      & "digital lommebok: {detail}} check_method {betalt med sjekk: {detail}} "
      & "other {betalt på annen måte: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} betalt {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {ingen betalinger} one {1 betaling} other {{count, "
      & "number} betalinger}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {betaling venter} "
      & "authorized_payment {betaling autorisert} paid_payment {betalt} "
      & "failed_payment {betalingen mislyktes} refunded_payment {refundert} "
      & "other {betaling avbrutt}}");
   P ("label.payments.payment_link_label", "betalingslenke: {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kort} bank_transfer_method "
      & "{bankoverføring} cash_method {kontant} wallet_method {digital "
      & "lommebok} check_method {sjekk} other {annet}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {ventende betaling} authorized_payment "
      & "{autorisert betaling} paid_payment {fullført betaling} failed_payment "
      & "{mislykket betaling} refunded_payment {refundert betaling} other "
      & "{avbrutt betaling}}");
   P ("label.payments.receipt_label", "kvittering {number}");
   P ("label.payments.refund_label",
      "{amount_text}: refusjon {state, select, pending_payment {venter} "
      & "authorized_payment {autorisert} paid_payment {utbetalt} failed_payment "
      & "{mislyktes} refunded_payment {fullført} other {avbrutt}}");
   P ("label.payments.subtotal_label", "delsum: {amount_text}");
   P ("label.payments.tax_label", "skatt: {amount_text}");
   P ("label.payments.total_label", "totalt: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: tilgangen utløper {time_text}");
   P ("label.permissions.grant_label",
      "{role, select, owner_role {{subject} fikk rollen eier} admin_role "
      & "{{subject} fikk rollen administrator} editor_role {{subject} fikk "
      & "rollen redaktør} viewer_role {{subject} fikk rollen leser} other "
      & "{{subject} fikk en egendefinert rolle}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {innvilget} denied "
      & "{avslått} inherited {arvet} temporary {midlertidig tilgang} expired "
      & "{utløpt} other {krever godkjenning}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {innvilget} denied {avslått} inherited "
      & "{arvet} temporary {midlertidig tilgang} expired {utløpt} other "
      & "{krever godkjenning}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {tillatt av policy} policy_denied "
      & "{avslått av policy} policy_warning {policyadvarsel} other {policyen "
      & "gjelder ikke}}");
   P ("label.permissions.revoke_label",
      "{role, select, owner_role {{subject} mistet rollen eier} admin_role "
      & "{{subject} mistet rollen administrator} editor_role {{subject} mistet "
      & "rollen redaktør} viewer_role {{subject} mistet rollen leser} other "
      & "{{subject} mistet en egendefinert rolle}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {eier} admin_role {administrator} "
      & "editor_role {redaktør} viewer_role {leser} other {egendefinert "
      & "rolle}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {tom} low_utilization {lav "
      & "utnyttelse} normal_utilization {normal utnyttelse} high_utilization "
      & "{høy utnyttelse} critical_utilization {kritisk utnyttelse} "
      & "full_utilization {full} other {over grensen}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {array med {element_type, select, "
      & "string_field {strenger} integer_field {heltall} decimal_field "
      & "{desimaltall} boolean_field {boolske verdier} date_field {datoer} "
      & "date_time_field {tidspunkter} object_field {objekter} array_field "
      & "{arrayer} enum_field {enum-verdier} binary_field {binærverdier} "
      & "null_field {null-verdier} any_field {verdier av vilkårlig type} other "
      & "{ukjente verdier}}} other {{count, plural, one {array med 1 "
      & "{element_type, select, string_field {streng} integer_field {heltall} "
      & "decimal_field {desimaltall} boolean_field {boolsk verdi} date_field "
      & "{dato} date_time_field {tidspunkt} object_field {objekt} array_field "
      & "{array} enum_field {enum-verdi} binary_field {binærverdi} null_field "
      & "{null-verdi} any_field {verdi av vilkårlig type} other {ukjent "
      & "verdi}}} other {array med {count, number} {element_type, select, "
      & "string_field {strenger} integer_field {heltall} decimal_field "
      & "{desimaltall} boolean_field {boolske verdier} date_field {datoer} "
      & "date_time_field {tidspunkter} object_field {objekter} array_field "
      & "{arrayer} enum_field {enum-verdier} binary_field {binærverdier} "
      & "null_field {null-verdier} any_field {verdier av vilkårlig type} other "
      & "{ukjente verdier}}}}}}");
   P ("label.schema.constraint_label", "begrensning {name}: {value}");
   P ("label.schema.default_value_label", "feltet {field_name} har standardverdien {value}");
   P ("label.schema.deprecated_field_label", "feltet {name} er foreldet, bruk {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 enum-alternativ} other {{count, number} "
      & "enum-alternativer}}");
   P ("label.schema.example_value_label", "feltet {field_name}, eksempel: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {vanlig felt} deprecated_field {foreldet "
      & "felt} unknown_field {ukjent felt} read_only_field {skrivebeskyttet "
      & "felt} write_only_field {felt som bare kan skrives} other {beregnet "
      & "felt}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {strengfelt} integer_field {heltallsfelt} "
      & "decimal_field {desimalfelt} boolean_field {boolsk felt} date_field "
      & "{datofelt} date_time_field {tidspunktfelt} object_field {objektfelt} "
      & "array_field {arrayfelt} enum_field {enum-felt} binary_field "
      & "{binærfelt} null_field {null-felt} any_field {felt av vilkårlig "
      & "type} other {felt av ukjent type}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {ingen obligatoriske felt mangler} one {1 "
      & "obligatorisk felt mangler} other {{count, number} obligatoriske felt "
      & "mangler}}");
   P ("label.schema.object_shape_label",
      "objekt med {fields, plural, one {1 felt} other {{fields, number} "
      & "felt}}{required, plural, =0 {} one {, 1 obligatorisk} other {, "
      & "{required, number} obligatoriske}}{optional, plural, =0 {} one {, 1 "
      & "valgfritt} other {, {optional, number} valgfrie}}");
   P ("label.schema.schema_source_label", "skjema {name}, versjon {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalarverdi} object_shape {{count, "
      & "plural, =0 {objekt} one {objekt med 1 felt} other {objekt med {count, "
      & "number} felt}}} array_shape {{count, plural, =0 {array} one {array med "
      & "1 element} other {array med {count, number} elementer}}} map_shape "
      & "{{count, plural, =0 {tilordning} one {tilordning med 1 oppføring} "
      & "other {tilordning med {count, number} oppføringer}}} tuple_shape "
      & "{{count, plural, =0 {tuppel} one {tuppel med 1 element} other {tuppel "
      & "med {count, number} elementer}}} union_shape {{count, plural, =0 "
      & "{union} one {union av 1 type} other {union av {count, number} typer}}} "
      & "empty_shape {tom struktur} other {ukjent struktur}}");
   P ("label.schema.unknown_field_label", "ukjent felt {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {ingen aktive filtre} one {1 aktivt filter} other "
      & "{{count, number} aktive filtre}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {fjern filtre} one {fjern aktivt filter} other "
      & "{fjern {count, number} aktive filtre}}");
   P ("label.search.facet_label",
      "{name}-fasett, {count, plural, one {1 alternativ} other {{count, "
      & "number} alternativer}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {ingen resultater} one {1 resultat} other "
      & "{{count, number} resultater}}{selected, select, false {} other {, "
      & "valgt}}");
   P ("label.search.filter_label",
      "{name}: {value} ({state, select, active_filter {aktivt filter} "
      & "inactive_filter {inaktivt filter} other {ekskluderende filter}})");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktivt filter} inactive_filter "
      & "{inaktivt filter} other {ekskluderende filter}}");
   P ("label.search.no_results_label", "ingen resultater for «{query}»");
   P ("label.search.recent_search_label", "nylig søk: «{query}»");
   P ("label.search.saved_search_label",
      "lagret søk: {name}{count, plural, =0 {} one {, 1 resultat} other {, "
      & "{count, number} resultater}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {ingen nylige søk} one {1 nylig søk} other "
      & "{{count, number} nylige søk}}");
   P ("label.search.search_query_label", "søk etter «{query}»");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {ingen resultater} one {1 resultat} other {{count, "
      & "number} resultater}}");
   P ("label.search.search_result_summary_label",
      "resultater for «{query}»: {count, plural, =0 {ingen resultater} one "
      & "{1 resultat} other {{count, number} resultater}}");
   P ("label.search.search_scope_label",
      "søkeområde {name}, {count, plural, =0 {ingen resultater} one {1 "
      & "resultat} other {{count, number} resultater}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {søk inaktivt} searching_search {søker} "
      & "complete_search {søket er fullført} empty_search {ingen "
      & "søkeresultater} other {søket mislyktes}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {sorter etter relevans} ascending_sort "
      & "{sorter stigende} descending_sort {sorter synkende} newest_first_sort "
      & "{sorter med nyeste først} other {sorter med eldste først}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevans} ascending_sort {stigende} "
      & "descending_sort {synkende} newest_first_sort {nyeste først} other "
      & "{eldste først}}");
   P ("label.search.suggestion_label", "mente du «{query}»?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 legitimasjon} other {{count, number} "
      & "legitimasjoner}} fra {source}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {verdien er skjult} masked_value "
      & "{verdien er maskert} suffix_only {bare suffiks} other {bare "
      & "fingeravtrykk}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {offentlig} support_profile "
      & "{kundestøtte} audit_profile {revisjon} other {feilsøking}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotasjon er ikke nødvendig} other "
      & "{rotasjon er nødvendig}}{days_old, plural, =0 {} one {, 1 dag gammel} "
      & "other {, {days_old, number} dager gammel}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-nøkkel} live_api_key {API-nøkkel for "
      & "produksjon} test_api_key {API-nøkkel for test} github_token "
      & "{GitHub-token} aws_access_key {AWS-tilgangsnøkkel} google_api_key "
      & "{Google API-nøkkel} slack_token {Slack-token} npm_token {npm-token} "
      & "bearer_token {bearer-token} jwt_token {JWT-token} "
      & "basic_auth_credential {Basic Auth-legitimasjon} password_secret "
      & "{passord} private_key {privat nøkkel} ssh_private_key {privat "
      & "SSH-nøkkel} webhook_secret {webhook-hemmelighet} oauth_token "
      & "{OAuth-token} database_url_secret {database-URL-hemmelighet} "
      & "sha1_fingerprint {SHA-1-fingeravtrykk} sha256_fingerprint "
      & "{SHA-256-fingeravtrykk} other {hemmelighet}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-post} phone_value {telefon} url_value "
      & "{URL} ip_address_value {IP-adresse} token_value {token} "
      & "file_path_value {filbane} account_id_value {konto-ID} "
      & "payment_reference_value {betalingsreferanse} log_field_value "
      & "{loggfelt} other {sensitiv verdi}}");
   P ("label.tables.cell_label",
      "rad {row, number}, kolonne {column, number} {state, select, empty_cell "
      & "{tom} edited_cell {redigert} invalid_cell {ugyldig} highlighted_cell "
      & "{uthevet} other {skrivebeskyttet}}");
   P ("label.tables.cell_position_label", "rad {row, number}, kolonne {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {tom celle} edited_cell {redigert celle} "
      & "invalid_cell {ugyldig celle} highlighted_cell {uthevet celle} other "
      & "{skrivebeskyttet celle}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {ingen kolonner} one {1 kolonne} other {{count, "
      & "number} kolonner}}");
   P ("label.tables.column_label",
      "{name} ({role, select, text_column {tekstkolonne} number_column "
      & "{tallkolonne} date_column {datokolonne} status_column {statuskolonne} "
      & "action_column {handlingskolonne} other {skjult kolonne}})");
   P ("label.tables.column_role_label",
      "{role, select, text_column {tekstkolonne} number_column {tallkolonne} "
      & "date_column {datokolonne} status_column {statuskolonne} action_column "
      & "{handlingskolonne} other {skjult kolonne}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 rad} other {{count, number} rader}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {ingen rader} one {1 rad} other {{count, number} "
      & "rader}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {usortert} ascending_sort {stigende} "
      & "other {synkende}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {usortert} ascending_sort {sortert etter "
      & "{column_name}, stigende} other {sortert etter {column_name}, "
      & "synkende}}");
   P ("label.tables.subtotal_label", "delsum {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 rad} other {{rows, number} rader}} × {columns, "
      & "plural, one {1 kolonne} other {{columns, number} kolonner}}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {ikke tildelt} assigned "
      & "{tildelt} reassigned {tildelt på nytt} watching {følger} other {eier "
      & "oppgaven}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {ikke tildelt} assigned {tildelt} "
      & "reassigned {tildelt på nytt} watching {følger} other {eier "
      & "oppgaven}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {tom backlogg} one {backlogg: 1 oppgave} other "
      & "{backlogg: {count, number} oppgaver}}");
   P ("label.tasks.blocker_label", "blokkert av {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {fullfør oppgaven} other {fullfør {count, "
      & "number} oppgaver}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {ingen fullførte oppgaver} one {1 fullført "
      & "oppgave} other {{count, number} fullførte oppgaver}}");
   P ("label.tasks.due_label", "forfaller {due_text}");
   P ("label.tasks.estimate_label", "anslått {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {ingen åpne oppgaver} one {1 åpen oppgave} other "
      & "{{count, number} åpne oppgaver}}");
   P ("label.tasks.overdue_label", "forfalt siden {due_text}");
   P ("label.tasks.recurring_task_label", "gjentas {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {åpne oppgaven på nytt} other {åpne {count, "
      & "number} oppgaver på nytt}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 oppgave} other {{count, number} "
      & "oppgaver}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 deloppgave} other {{count, number} "
      & "deloppgaver}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {ingen oppgaver} one {1 oppgave} other {{count, "
      & "number} oppgaver}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {åpen oppgave} in_progress_task "
      & "{pågående oppgave} blocked_task {blokkert oppgave} done_task "
      & "{fullført oppgave} canceled_task {avbrutt oppgave} deferred_task "
      & "{utsatt oppgave} other {forfalt oppgave}}{priority, select, "
      & "no_priority {} low_priority {, lav prioritet} medium_priority {, "
      & "middels prioritet} high_priority {, høy prioritet} other {, kritisk "
      & "prioritet}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {ingen prioritet} low_priority {lav "
      & "prioritet} medium_priority {middels prioritet} high_priority {høy "
      & "prioritet} other {kritisk prioritet}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {åpen oppgave} in_progress_task {pågående "
      & "oppgave} blocked_task {blokkert oppgave} done_task {fullført oppgave} "
      & "canceled_task {avbrutt oppgave} deferred_task {utsatt oppgave} other "
      & "{forfalt oppgave}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {øvre grense} other {nedre grense}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {under forventet område} within_range "
      & "{innenfor forventet område} above_range {over forventet område} "
      & "below_target {under målet} at_target {på målet} above_target {over "
      & "målet} near_limit {nær grensen} warning_level {varselterskel} "
      & "critical_level {kritisk terskel} breached {overskredet} other {ukjent "
      & "terskelstatus}}");
   P ("label.versions.commit_distance_label",
      "{ahead, plural, =0 {{behind, plural, =0 {oppdatert} one {1 commit bak} "
      & "other {{behind, number} commits bak}}} one {1 commit foran{behind, "
      & "plural, =0 {} one {, 1 commit bak} other {, {behind, number} commits "
      & "bak}}} other {{ahead, number} commits foran{behind, plural, =0 {} one "
      & "{, 1 commit bak} other {, {behind, number} commits bak}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {godkjent av {approver}} other {venter på "
      & "godkjenning fra {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {forsøk 1 av 1} other "
      & "{forsøk {attempt, number} av 1 – grensen overskredet}}} other "
      & "{forsøk {attempt, number} av {limit, number}}}");
   P ("label.workflows.blocker_label", "blokkert: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {ingen blokkerende avhengigheter} one {1 "
      & "blokkerende avhengighet} other {{count, number} blokkerende "
      & "avhengigheter}}");
   P ("label.workflows.handoff_label", "overlevering fra {from} til {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {kommende milepæl} "
      & "current_milestone {nåværende milepæl} complete_milestone {nådd "
      & "milepæl} missed_milestone {tapt milepæl} other {blokkert milepæl}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {kommende} "
      & "current_milestone {nåværende} complete_milestone {nådd} "
      & "missed_milestone {tapt} other {blokkert}}");
   P ("label.workflows.next_action_label", "neste: {action}");
   P ("label.workflows.owner_label", "eies av {owner}");
   P ("label.workflows.resume_label", "gjenoppta {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {venter} active_step {aktiv} waiting_step "
      & "{avventer} blocked_step {blokkert} done_step {fullført} failed_step "
      & "{mislyktes} other {hoppet over}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {venter} active_step {aktiv} "
      & "waiting_step {avventer} blocked_step {blokkert} done_step {fullført} "
      & "failed_step {mislyktes} other {hoppet over}}");
   P ("label.workflows.waiting_label", "venter på {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {ikke startet} "
      & "in_progress_state {pågår} waiting_state {venter} "
      & "waiting_approval_state {venter på godkjenning} blocked_state "
      & "{blokkert} completed_state {fullført} failed_state {mislyktes} "
      & "cancelled_state {avbrutt} skipped_state {hoppet over} other {satt på "
      & "pause}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {ikke startet} in_progress_state "
      & "{pågår} waiting_state {venter} waiting_approval_state {venter på "
      & "godkjenning} blocked_state {blokkert} completed_state {fullført} "
      & "failed_state {mislyktes} cancelled_state {avbrutt} skipped_state "
      & "{hoppet over} other {satt på pause}}");
end Labels_2;
