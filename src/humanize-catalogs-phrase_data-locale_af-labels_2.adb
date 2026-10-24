separate (Humanize.Catalogs.Phrase_Data.Locale_Af)
procedure Labels_2 is
begin
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {skakel} menu_item {kieslysitem} "
      & "tab_item {oortjie} breadcrumb_item {broodkrummel} section_item "
      & "{afdeling} other {skeier}}, {state, select, current_item {huidig} "
      & "active_item {aktief} inactive_item {onaktief} disabled_item "
      & "{gedeaktiveer} expanded_item {uitgevou} collapsed_item {ingevou} "
      & "visited_item {besoek} other {ekstern}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {huidig} active_item {aktief} "
      & "inactive_item {onaktief} disabled_item {gedeaktiveer} expanded_item "
      & "{uitgevou} collapsed_item {ingevou} visited_item {besoek} other "
      & "{ekstern}}");
   P ("label.navigation.next_label", "volgende: {target}");
   P ("label.navigation.section_state_label",
      "afdeling {name} {expanded, select, false {ingevou} other "
      & "{uitgevou}}{count, plural, =0 {} one {, 1 item} other {, {count, "
      & "number} items}}");
   P ("label.navigation.skip_link_label", "spring na {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {subkieslys {name}, 1 item} other {subkieslys "
      & "{name}, {count, number} items}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {alle waarskuwings} important_alerts "
      & "{belangrike waarskuwings} critical_alerts_only {slegs kritieke "
      & "waarskuwings} other {geen waarskuwings nie}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: kennisgewings {state, select, preference_enabled "
      & "{geaktiveer} preference_disabled {gedeaktiveer} preference_inherited "
      & "{geërf} other {vereis}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {geen opsomming nie} instant_digest "
      & "{onmiddellike opsomming} daily_digest {daaglikse opsomming} other "
      & "{weeklikse opsomming}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {geaktiveer} preference_disabled "
      & "{gedeaktiveer} preference_inherited {geërf} other {vereis}}");
   P ("label.notification_preferences.quiet_hours_label", "stil ure {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {draadintekening} "
      & "project_subscription {projekintekening} team_subscription "
      & "{spanintekening} other {rekeningintekening}} {state, select, "
      & "preference_enabled {geaktiveer} preference_disabled {gedeaktiveer} "
      & "preference_inherited {geërf} other {vereis}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {draadintekening} "
      & "project_subscription {projekintekening} team_subscription "
      & "{spanintekening} other {rekeningintekening}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} het jou genoem} reply_event "
      & "{{actor} het geantwoord} assignment_event {{actor} het iets aan jou "
      & "toegewys} approval_event {{actor} het goedkeuring versoek} alert_event "
      & "{{actor} het ’n waarskuwing gestuur} digest_event {{actor} het ’n "
      & "opsomming gestuur} reminder_event {{actor} het ’n herinnering "
      & "gestuur} other {{actor} het ’n stelselkennisgewing gestuur}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {kennisgewing in die toep} "
      & "email_channel {e-poskennisgewing} sms_channel {SMS-kennisgewing} "
      & "push_channel {stootkennisgewing} webhook_channel "
      & "{webhook-kennisgewing} other {opsommingskennisgewing}} {state, select, "
      & "pending_delivery {hangend} sent_delivery {gestuur} delivered_delivery "
      & "{afgelewer} failed_delivery {misluk} retrying_delivery {word weer "
      & "probeer} other {gekanselleer}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {kennisgewing hangend} sent_delivery "
      & "{kennisgewing gestuur} delivered_delivery {kennisgewing afgelewer} "
      & "failed_delivery {kennisgewing misluk} retrying_delivery {kennisgewing "
      & "word weer probeer} other {kennisgewing gekanselleer}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {hangend} sent_delivery {gestuur} "
      & "delivered_delivery {afgelewer} failed_delivery {misluk} "
      & "retrying_delivery {nuwe poging} other {gekanselleer}} {time_text}");
   P ("label.notifications.digest_label",
      "opsomming {name}: {count, plural, =0 {geen kennisgewings nie} one {1 "
      & "kennisgewing} other {{count, number} kennisgewings}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {geen vermeldings "
      & "nie} one {1 vermelding} other {{count, number} vermeldings}}} "
      & "reply_event {{count, plural, =0 {geen antwoorde nie} one {1 antwoord} "
      & "other {{count, number} antwoorde}}} assignment_event {{count, plural, "
      & "=0 {geen toewysings nie} one {1 toewysing} other {{count, number} "
      & "toewysings}}} approval_event {{count, plural, =0 {geen "
      & "goedkeuringsversoeke nie} one {1 goedkeuringsversoek} other {{count, "
      & "number} goedkeuringsversoeke}}} alert_event {{count, plural, =0 {geen "
      & "waarskuwings nie} one {1 waarskuwing} other {{count, number} "
      & "waarskuwings}}} digest_event {{count, plural, =0 {geen opsommings nie} "
      & "one {1 opsomming} other {{count, number} opsommings}}} reminder_event "
      & "{{count, plural, =0 {geen herinneringe nie} one {1 herinnering} other "
      & "{{count, number} herinneringe}}} other {{count, plural, =0 {geen "
      & "stelselkennisgewings nie} one {1 stelselkennisgewing} other {{count, "
      & "number} stelselkennisgewings}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {merk kennisgewing as gelees} other {merk {count, "
      & "number} kennisgewings as gelees}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {merk kennisgewing as ongelees} other {merk "
      & "{count, number} kennisgewings as ongelees}}");
   P ("label.notifications.muted_label", "{name}: kennisgewings gedemp");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nuwe vermelding} reply_event {nuwe "
      & "antwoord} assignment_event {nuwe toewysing} approval_event {nuwe "
      & "goedkeuringsversoek} alert_event {nuwe waarskuwing} digest_event {nuwe "
      & "opsomming} reminder_event {nuwe herinnering} other {nuwe "
      & "stelselkennisgewing}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {kennisgewings in die toep} "
      & "email_channel {e-poskennisgewings} sms_channel {SMS-kennisgewings} "
      & "push_channel {stootkennisgewings} webhook_channel "
      & "{webhook-kennisgewings} other {opsommingskennisgewings}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {geen kennisgewings nie} one {1 kennisgewing} other "
      & "{{count, number} kennisgewings}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {vermelding} reply_event {antwoord} "
      & "assignment_event {toewysing} approval_event {goedkeuringsversoek} "
      & "alert_event {waarskuwing} digest_event {opsomming} reminder_event "
      & "{herinnering} other {stelselkennisgewing}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {geen kennisgewings nie} one {1 "
      & "kennisgewing} other {{count, number} kennisgewings}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {vermelding} reply_event "
      & "{antwoord} assignment_event {toewysing} approval_event "
      & "{goedkeuringsversoek} alert_event {waarskuwing} digest_event "
      & "{opsomming} reminder_event {herinnering} other {stelselkennisgewing}}, "
      & "{state, select, unread_state {ongelees} read_state {gelees} "
      & "archived_state {geargiveer} muted_state {gedemp} snoozed_state "
      & "{uitgestel} other {onderdruk}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {ongeleesde kennisgewing} read_state "
      & "{geleesde kennisgewing} archived_state {geargiveerde kennisgewing} "
      & "muted_state {gedempte kennisgewing} snoozed_state {uitgestelde "
      & "kennisgewing} other {onderdrukte kennisgewing}}");
   P ("label.notifications.snoozed_label", "{name}: kennisgewings uitgestel");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {geen kennisgewings onderdruk nie} one {1 "
      & "kennisgewing onderdruk} other {{count, number} kennisgewings "
      & "onderdruk}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {geen ongeleesde kennisgewings nie} one {1 "
      & "ongeleesde kennisgewing} other {{count, number} ongeleesde "
      & "kennisgewings}}");
   P ("label.payments.amount_label", "bedrag {amount_text}");
   P ("label.payments.balance_label", "saldo {amount_text}");
   P ("label.payments.chargeback_label", "terugvordering {amount_text}");
   P ("label.payments.discount_label", "afslag {amount_text}");
   P ("label.payments.due_label", "{amount_text} betaalbaar {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {geen fakture nie} one {1 faktuur} other {{count, "
      & "number} fakture}}");
   P ("label.payments.invoice_label",
      "faktuur {number}: {state, select, draft_invoice {konsep} open_invoice "
      & "{oop} paid_invoice {betaal} overdue_invoice {agterstallig} other "
      & "{nietig}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {faktuurkonsep} open_invoice {oop "
      & "faktuur} paid_invoice {betaalde faktuur} overdue_invoice "
      & "{agterstallige faktuur} other {nietige faktuur}}");
   P ("label.payments.method_label",
      "betaal {method, select, card_method {per kaart} bank_transfer_method "
      & "{per bankoorplasing} cash_method {kontant} wallet_method {per beursie} "
      & "check_method {per tjek} other {op ’n ander manier}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} betaal {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {geen betalings nie} one {1 betaling} other "
      & "{{count, number} betalings}}");
   P ("label.payments.payment_label",
      "{amount_text}: betaling {state, select, pending_payment {hangend} "
      & "authorized_payment {gemagtig} paid_payment {betaal} failed_payment "
      & "{misluk} refunded_payment {terugbetaal} other {gekanselleer}}");
   P ("label.payments.payment_link_label", "betaalskakel {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kaart} bank_transfer_method "
      & "{bankoorplasing} cash_method {kontant} wallet_method {beursie} "
      & "check_method {tjek} other {ander}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {hangende betaling} authorized_payment "
      & "{gemagtigde betaling} paid_payment {voltooide betaling} failed_payment "
      & "{mislukte betaling} refunded_payment {terugbetaalde betaling} other "
      & "{gekanselleerde betaling}}");
   P ("label.payments.receipt_label", "kwitansie {number}");
   P ("label.payments.refund_label",
      "{amount_text}: terugbetaling {state, select, pending_payment {hangend} "
      & "authorized_payment {gemagtig} paid_payment {uitbetaal} failed_payment "
      & "{misluk} refunded_payment {voltooi} other {gekanselleer}}");
   P ("label.payments.subtotal_label", "subtotaal {amount_text}");
   P ("label.payments.tax_label", "belasting {amount_text}");
   P ("label.payments.total_label", "totaal {amount_text}");
   P ("label.permissions.access_expiry_label", "toegang vir {subject} verval {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {rol eienaar} admin_role {rol "
      & "administrateur} editor_role {rol redigeerder} viewer_role {rol kyker} "
      & "other {pasgemaakte rol}} toegeken");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {toegeken} denied "
      & "{geweier} inherited {geërf} temporary {tydelike toegang} expired "
      & "{verval} other {vereis goedkeuring}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {toegeken} denied {geweier} inherited {geërf} "
      & "temporary {tydelike toegang} expired {verval} other {vereis "
      & "goedkeuring}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {deur beleid toegelaat} policy_denied "
      & "{deur beleid geweier} policy_warning {beleidswaarskuwing} other "
      & "{beleid nie van toepassing nie}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {rol eienaar} admin_role {rol "
      & "administrateur} editor_role {rol redigeerder} viewer_role {rol kyker} "
      & "other {pasgemaakte rol}} herroep");
   P ("label.permissions.role_label",
      "{role, select, owner_role {eienaar} admin_role {administrateur} "
      & "editor_role {redigeerder} viewer_role {kyker} other {pasgemaakte rol}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {leeg} low_utilization {lae "
      & "benutting} normal_utilization {normale benutting} high_utilization "
      & "{hoë benutting} critical_utilization {kritieke benutting} "
      & "full_utilization {vol} other {oor die limiet}}");
   P ("label.schema.array_shape_label",
      "skikking van {count_known, select, false {{element_type, select, "
      & "string_field {stringe} integer_field {heelgetalle} decimal_field "
      & "{desimale getalle} boolean_field {Boolese waardes} date_field {datums} "
      & "date_time_field {datum-tydwaardes} object_field {objekte} array_field "
      & "{skikkings} enum_field {enum-waardes} binary_field {binêre waardes} "
      & "null_field {nulwaardes} any_field {enige waardes} other {onbekende "
      & "waardes}}} other {{count, plural, one {1 {element_type, select, "
      & "string_field {string} integer_field {heelgetal} decimal_field "
      & "{desimale getal} boolean_field {Boolese waarde} date_field {datum} "
      & "date_time_field {datum-tydwaarde} object_field {objek} array_field "
      & "{skikking} enum_field {enum-waarde} binary_field {binêre waarde} "
      & "null_field {nulwaarde} any_field {enige waarde} other {onbekende "
      & "waarde}}} other {{count, number} {element_type, select, string_field "
      & "{stringe} integer_field {heelgetalle} decimal_field {desimale getalle} "
      & "boolean_field {Boolese waardes} date_field {datums} date_time_field "
      & "{datum-tydwaardes} object_field {objekte} array_field {skikkings} "
      & "enum_field {enum-waardes} binary_field {binêre waardes} null_field "
      & "{nulwaardes} any_field {enige waardes} other {onbekende waardes}}}}}}");
   P ("label.schema.constraint_label", "beperking {name}: {value}");
   P ("label.schema.default_value_label", "veld {field_name}: verstekwaarde {value}");
   P ("label.schema.deprecated_field_label", "verouderde veld {name}, gebruik {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 enum-opsie} other {{count, number} "
      & "enum-opsies}}");
   P ("label.schema.example_value_label", "veld {field_name}: voorbeeld {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normale veld} deprecated_field "
      & "{verouderde veld} unknown_field {onbekende veld} read_only_field "
      & "{leesalleen-veld} write_only_field {skryfalleen-veld} other {berekende "
      & "veld}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {stringveld} integer_field {heelgetalveld} "
      & "decimal_field {desimale veld} boolean_field {Boolese veld} date_field "
      & "{datumveld} date_time_field {datum-tydveld} object_field {objekveld} "
      & "array_field {skikkingveld} enum_field {enum-veld} binary_field "
      & "{binêre veld} null_field {nulveld} any_field {veld van enige tipe} "
      & "other {veld van onbekende tipe}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {geen ontbrekende verpligte velde nie} one {1 "
      & "ontbrekende verpligte veld} other {{count, number} ontbrekende "
      & "verpligte velde}}");
   P ("label.schema.object_shape_label",
      "objek met {fields, plural, one {1 veld} other {{fields, number} "
      & "velde}}{required, plural, =0 {} other {, {required, number} "
      & "verpligtend}}{optional, plural, =0 {} other {, {optional, number} "
      & "opsioneel}}");
   P ("label.schema.schema_source_label", "skema {name}, weergawe {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalaarwaarde} object_shape {{count, "
      & "plural, =0 {objek} one {objek met 1 veld} other {objek met {count, "
      & "number} velde}}} array_shape {{count, plural, =0 {skikking} one "
      & "{skikking met 1 item} other {skikking met {count, number} items}}} "
      & "map_shape {{count, plural, =0 {kaart} one {kaart met 1 inskrywing} "
      & "other {kaart met {count, number} inskrywings}}} tuple_shape {{count, "
      & "plural, =0 {tupel} one {tupel met 1 item} other {tupel met {count, "
      & "number} items}}} union_shape {{count, plural, =0 {unie} one {unie van "
      & "1 tipe} other {unie van {count, number} tipes}}} empty_shape {leë "
      & "struktuur} other {onbekende struktuur}}");
   P ("label.schema.unknown_field_label", "onbekende veld {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {geen aktiewe filters nie} one {1 aktiewe filter} "
      & "other {{count, number} aktiewe filters}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {vee filters uit} one {vee aktiewe filter uit} "
      & "other {vee {count, number} aktiewe filters uit}}");
   P ("label.search.facet_label",
      "faset {name}, {count, plural, one {1 opsie} other {{count, number} "
      & "opsies}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {geen resultate nie} one {1 resultaat} "
      & "other {{count, number} resultate}}{selected, select, true {, gekies} "
      & "other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {aktiewe filter} "
      & "inactive_filter {onaktiewe filter} other {uitsluitingsfilter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktiewe filter} inactive_filter "
      & "{onaktiewe filter} other {uitsluitingsfilter}}");
   P ("label.search.no_results_label", "geen resultate vir ‘{query}’ nie");
   P ("label.search.recent_search_label", "onlangse soektog: ‘{query}’");
   P ("label.search.saved_search_label",
      "gestoorde soektog: {name}{count, plural, =0 {} one {, 1 resultaat} "
      & "other {, {count, number} resultate}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {geen onlangse soektogte nie} one {1 onlangse "
      & "soektog} other {{count, number} onlangse soektogte}}");
   P ("label.search.search_query_label", "soek na ‘{query}’");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {geen resultate nie} one {1 resultaat} other "
      & "{{count, number} resultate}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {geen resultate vir ‘{query}’ nie} one {1 "
      & "resultaat vir ‘{query}’} other {{count, number} resultate vir "
      & "‘{query}’}}");
   P ("label.search.search_scope_label",
      "soekomvang {name}, {count, plural, =0 {geen resultate nie} one {1 "
      & "resultaat} other {{count, number} resultate}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {soektog onaktief} searching_search {soek "
      & "tans} complete_search {soektog voltooi} empty_search {geen "
      & "soekresultate nie} other {soektog misluk}}");
   P ("label.search.sort_label",
      "sortering: {mode, select, relevance_sort {relevansie} ascending_sort "
      & "{stygend} descending_sort {dalend} newest_first_sort {nuutste eerste} "
      & "other {oudste eerste}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevansie} ascending_sort {stygend} "
      & "descending_sort {dalend} newest_first_sort {nuutste eerste} other "
      & "{oudste eerste}}");
   P ("label.search.suggestion_label", "het jy ‘{query}’ bedoel?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 aanmeldbewys van {source}} other {{count, "
      & "number} aanmeldbewyse van {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {waarde versteek} masked_value {waarde "
      & "gemasker} suffix_only {slegs agtervoegsel} other {slegs vingerafdruk}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {publiek} support_profile "
      & "{ondersteuning} audit_profile {oudit} other {ontfouting}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {rotasie nodig} other {rotasie nie nodig "
      & "nie}}{days_old, plural, =0 {} one {, 1 dag oud} other {, {days_old, "
      & "number} dae oud}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-sleutel} live_api_key {lewendige "
      & "API-sleutel} test_api_key {toets-API-sleutel} github_token "
      & "{GitHub-token} aws_access_key {AWS-toegangsleutel} google_api_key "
      & "{Google-API-sleutel} slack_token {Slack-token} npm_token {npm-token} "
      & "bearer_token {draertoken} jwt_token {JWT-token} basic_auth_credential "
      & "{basiese-verifikasie-aanmeldbewys} password_secret {wagwoord} "
      & "private_key {privaat sleutel} ssh_private_key {privaat SSH-sleutel} "
      & "webhook_secret {webhook-geheim} oauth_token {OAuth-token} "
      & "database_url_secret {databasis-URL met aanmeldbewyse} sha1_fingerprint "
      & "{SHA-1-vingerafdruk} sha256_fingerprint {SHA-256-vingerafdruk} other "
      & "{geheim}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-pos} phone_value {telefoon} url_value "
      & "{URL} ip_address_value {IP-adres} token_value {token} file_path_value "
      & "{lêerpad} account_id_value {rekening-ID} payment_reference_value "
      & "{betalingsverwysing} log_field_value {logveld} other {sensitiewe "
      & "waarde}}");
   P ("label.tables.cell_label",
      "ry {row, number}, kolom {column, number}, {state, select, empty_cell "
      & "{leeg} edited_cell {geredigeer} invalid_cell {ongeldig} "
      & "highlighted_cell {uitgelig} other {leesalleen}}");
   P ("label.tables.cell_position_label", "ry {row, number}, kolom {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {leë sel} edited_cell {geredigeerde sel} "
      & "invalid_cell {ongeldige sel} highlighted_cell {uitgeligte sel} other "
      & "{leesalleen-sel}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {geen kolomme nie} one {1 kolom} other {{count, "
      & "number} kolomme}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {tekskolom} number_column "
      & "{getalkolom} date_column {datumkolom} status_column {statuskolom} "
      & "action_column {aksiekolom} other {versteekte kolom}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {tekskolom} number_column {getalkolom} "
      & "date_column {datumkolom} status_column {statuskolom} action_column "
      & "{aksiekolom} other {versteekte kolom}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 ry} other {{count, number} rye}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {geen rye nie} one {1 ry} other {{count, number} "
      & "rye}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {nie gesorteer nie} ascending_sort "
      & "{stygend} other {dalend}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {nie gesorteer nie} ascending_sort "
      & "{stygend gesorteer volgens {column_name}} other {dalend gesorteer "
      & "volgens {column_name}}}");
   P ("label.tables.subtotal_label", "subtotaal {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 ry} other {{rows, number} rye}} × {columns, "
      & "plural, one {1 kolom} other {{columns, number} kolomme}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} nie meer toegewys nie} assigned "
      & "{toegewys aan {assignee}} reassigned {hertoegewys aan {assignee}} "
      & "watching {{assignee} volg} other {{assignee} is eienaar}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nie toegewys nie} assigned {toegewys} "
      & "reassigned {hertoegewys} watching {volg} other {eienaar}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {leë agterstand} one {agterstand: 1 taak} other "
      & "{agterstand: {count, number} take}}");
   P ("label.tasks.blocker_label", "geblokkeer deur {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {voltooi taak} other {voltooi {count, number} "
      & "take}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {geen voltooide take nie} one {1 voltooide taak} "
      & "other {{count, number} voltooide take}}");
   P ("label.tasks.due_label", "verval {due_text}");
   P ("label.tasks.estimate_label", "skatting: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {geen oop take nie} one {1 oop taak} other {{count, "
      & "number} oop take}}");
   P ("label.tasks.overdue_label", "agterstallig sedert {due_text}");
   P ("label.tasks.recurring_task_label", "herhaling: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {heropen taak} other {heropen {count, number} "
      & "take}}");
   P ("label.tasks.sprint_label", "{name}: {count, plural, one {1 taak} other {{count, number} take}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 subtaak} other {{count, number} "
      & "subtake}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {geen take nie} one {1 taak} other {{count, number} "
      & "take}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {oop taak} in_progress_task {taak "
      & "aan die gang} blocked_task {geblokkeerde taak} done_task {voltooide "
      & "taak} canceled_task {gekanselleerde taak} deferred_task {uitgestelde "
      & "taak} other {agterstallige taak}}{priority, select, no_priority {} "
      & "low_priority {, lae prioriteit} medium_priority {, medium prioriteit} "
      & "high_priority {, hoë prioriteit} other {, kritieke prioriteit}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {geen prioriteit nie} low_priority {lae "
      & "prioriteit} medium_priority {medium prioriteit} high_priority {hoë "
      & "prioriteit} other {kritieke prioriteit}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {oop taak} in_progress_task {taak aan die "
      & "gang} blocked_task {geblokkeerde taak} done_task {voltooide taak} "
      & "canceled_task {gekanselleerde taak} deferred_task {uitgestelde taak} "
      & "other {agterstallige taak}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {boonste limiet} other {onderste "
      & "limiet}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {onder verwagte omvang} within_range "
      & "{binne verwagte omvang} above_range {bo verwagte omvang} below_target "
      & "{onder teiken} at_target {op teiken} above_target {bo teiken} "
      & "near_limit {naby limiet} warning_level {waarskuwingsdrempel bereik} "
      & "critical_level {kritieke drempel bereik} breached {limiet oorskry} "
      & "other {drempelstatus onbekend}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {op datum} one {1 commit voor} "
      & "other {{ahead, number} commits voor}}} one {{ahead, plural, =0 {1 "
      & "commit agter} one {1 commit voor, 1 commit agter} other {{ahead, "
      & "number} commits voor, 1 commit agter}}} other {{ahead, plural, =0 "
      & "{{behind, number} commits agter} one {1 commit voor, {behind, number} "
      & "commits agter} other {{ahead, number} commits voor, {behind, number} "
      & "commits agter}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {wag vir goedkeuring van {approver}} other "
      & "{goedgekeur deur {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {poging 1 van 1} other "
      & "{poging {attempt, number} van 1 (limiet oorskry)}}} other {poging "
      & "{attempt, number} van {limit, number}}}");
   P ("label.workflows.blocker_label", "geblokkeer: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {geen blokkerende afhanklikhede nie} one {1 "
      & "blokkerende afhanklikheid} other {{count, number} blokkerende "
      & "afhanklikhede}}");
   P ("label.workflows.handoff_label", "oorhandiging van {from} aan {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {komende mylpaal} current_milestone "
      & "{huidige mylpaal} complete_milestone {bereikte mylpaal} "
      & "missed_milestone {gemiste mylpaal} other {geblokkeerde mylpaal}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {komend} current_milestone "
      & "{huidig} complete_milestone {bereik} missed_milestone {gemis} other "
      & "{geblokkeer}}");
   P ("label.workflows.next_action_label", "volgende stap: {action}");
   P ("label.workflows.owner_label", "eienaar: {owner}");
   P ("label.workflows.resume_label", "hervat {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {hangend} active_step {aktief} "
      & "waiting_step {wag} blocked_step {geblokkeer} done_step {voltooi} "
      & "failed_step {misluk} other {oorgeslaan}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {hangend} active_step {aktief} "
      & "waiting_step {wag} blocked_step {geblokkeer} done_step {voltooi} "
      & "failed_step {misluk} other {oorgeslaan}}");
   P ("label.workflows.waiting_label", "wag vir {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nie begin nie} "
      & "in_progress_state {aan die gang} waiting_state {wag} "
      & "waiting_approval_state {wag vir goedkeuring} blocked_state "
      & "{geblokkeer} completed_state {voltooi} failed_state {misluk} "
      & "cancelled_state {gekanselleer} skipped_state {oorgeslaan} other "
      & "{onderbreek}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nie begin nie} in_progress_state "
      & "{aan die gang} waiting_state {wag} waiting_approval_state {wag vir "
      & "goedkeuring} blocked_state {geblokkeer} completed_state {voltooi} "
      & "failed_state {misluk} cancelled_state {gekanselleer} skipped_state "
      & "{oorgeslaan} other {onderbreek}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {deursigtig} mostly_transparent "
      & "{grotendeels deursigtig} translucent {deurskynend} mostly_opaque "
      & "{grotendeels dekkend} other {dekkend}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {geen waarnemings nie} one {1 waarneming, min. "
      & "{minimum} {unit}, mediaan {median} {unit}, maks. {maximum} {unit}} "
      & "other {{count, number} waarnemings, min. {minimum} {unit}, mediaan "
      & "{median} {unit}, maks. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {geen waarnemings nie} one "
      & "{0 uitskieters uit 1 waarneming} other {0 uitskieters uit {total, "
      & "number} waarnemings}}} one {{total, plural, one {1 uitskieter uit 1 "
      & "waarneming} other {1 uitskieter uit {total, number} waarnemings}}} "
      & "other {{outliers, number} uitskieters uit {total, number} "
      & "waarnemings}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} oor kapasiteit} other "
      & "{{count, number} van {total, number} {unit} oor}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kwota oorskry met {count, number} {unit} "
      & "({percent} gebruik)} near {kwota naby limiet: {count, number} {unit} "
      & "oor ({percent} gebruik)} other {kwota beskikbaar: {count, number} "
      & "{unit} oor ({percent} gebruik)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {kastrefferkoers nie beskikbaar nie: geen "
      & "versoeke nie} other {kastrefferkoers {percent}: {hits, plural, one {1 "
      & "treffer} other {{hits, number} treffers}}, {misses, plural, one {1 "
      & "mis} other {{misses, number} misse}}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 kenmerk} other {{count, number} kenmerke}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data-kenmerk} other {{count, number} "
      & "data-kenmerke}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA-kenmerk} other {{count, number} "
      & "ARIA-kenmerke}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 gebeurtenishanteerder} other {{count, number} "
      & "gebeurtenishanteerders}}");
   P ("label.markup.heading_label", "opskrifvlak {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 etiket} other {{count, number} etikette}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 skakel} other {{count, number} skakels}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 media-element} other {{count, number} "
      & "media-elemente}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 vormkontrole} other {{count, number} "
      & "vormkontroles}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {1 opskrif} other {{count, number} opskrifte}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 landmerk} other {{count, number} landmerke}}");
   P ("label.markup.document_outline_label.forms", "{count, plural, one {1 vorm} other {{count, number} vorms}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 media-element} other {{count, number} "
      & "media-elemente}}");
   P ("label.markup.table_navigation_label",
      "{caption} ry {row, number} van {rows, number}, kolom {column, number} "
      & "van {columns, number}");
   P ("label.secrets.secret_count_label.total", "{count, plural, one {1 geheim} other {{count, number} geheime}}");
   P ("label.secrets.secret_count_label.masked", "{count, number} gemasker");
   P ("label.secrets.secret_count_label.unset", "{count, number} nie gestel nie");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 vingerafdruk} other {{count, number} "
      & "vingerafdrukke}}");
   P ("label.schema.type_mismatch_label",
      "veld {field_name}: {expected, select, string_field {string} "
      & "integer_field {heelgetal} decimal_field {desimaal} boolean_field "
      & "{Boolese waarde} date_field {datum} date_time_field {datum-tyd} "
      & "object_field {objek} array_field {skikking} enum_field {enum} "
      & "binary_field {binêr} null_field {nul} any_field {enige} other "
      & "{onbekend}} verwag, {actual, select, string_field {string} "
      & "integer_field {heelgetal} decimal_field {desimaal} boolean_field "
      & "{Boolese waarde} date_field {datum} date_time_field {datum-tyd} "
      & "object_field {objek} array_field {skikking} enum_field {enum} "
      & "binary_field {binêr} null_field {nul} any_field {enige} other "
      & "{onbekend}} ontvang");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 blokkerende "
      & "probleem} other {{blocking, number} blokkerende probleme}}} blocking "
      & "{{base}, {blocking, plural, one {1 blokkerende probleem} other "
      & "{{blocking, number} blokkerende probleme}}} only {slegs {base}} other "
      & "{{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {teikenomvang {low} tot en met "
      & "{high}} other {teikenvenster {low} tot {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} binne verwagte omvang} below {{value} "
      & "onder verwagte omvang} other {{value} bo verwagte omvang}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} op kritieke drempel} warning "
      & "{{value} op waarskuwingsdrempel} other {{value} binne normale omvang}}");
   P ("label.thresholds.breach_label", "{state, select, ok {nie oorskry nie} other {oorskry met {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {op teiken} below {{difference} onder teiken} other "
      & "{{difference} bo teiken}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limiet oorskry} near {naby limiet, "
      & "{distance} oor} other {{distance} van limiet}}");
   P ("label.thresholds.threshold_summary_label.none", "geen maatstawwe nie");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normaal");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 waarskuwing} other {{count, number} "
      & "waarskuwings}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} kritiek");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 oorskryding} other {{count, number} "
      & "oorskrydings}}");
   P ("label.thresholds.target_window_label", "teiken {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "toleransie {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} van limiet");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limiet oorskry met {amount}} other {{amount} "
      & "oor}}");
   P ("label.thresholds.budget_used_label", "{used} van {budget} gebruik");
   P ("label.workflows.step_label", "stap {current, number} van {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} van {total, number} mylpale bereik: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {geen werkvloei-items nie} half {halfpad deur "
      & "werkvloei} other {{completed, number} van {total, number} voltooi}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {posisie {position, number} in tou} other {posisie "
      & "{position, number} van {total, number} in tou}}");
   P ("label.changes.change_set_label.none", "geen veranderinge nie");
   P ("label.changes.change_set_label.added", "{count, number} bygevoeg");
   P ("label.changes.change_set_label.removed", "{count, number} verwyder");
   P ("label.changes.change_set_label.modified", "{count, number} gewysig");
   P ("label.changes.change_set_label.unchanged", "{count, number} onveranderd");
   P ("label.changes.sync_change_label.none", "geen sinchronisasieveranderinge nie");
   P ("label.changes.sync_change_label.uploaded", "{count, number} opgelaai");
   P ("label.changes.sync_change_label.downloaded", "{count, number} afgelaai");
   P ("label.changes.sync_change_label.deleted", "{count, number} geskrap");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 konflik} other {{count, number} konflikte}}");
   P ("label.changes.net_change_label",
      "{state, select, none {geen netto verandering nie} up {netto +{count, "
      & "plural, one {1 item} other {{count, number} items}}} other {netto "
      & "-{count, plural, one {1 item} other {{count, number} items}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {geen veranderinge om te hersien nie} all {alle "
      & "veranderinge hersien} other {{reviewed, number} van {total, number} "
      & "veranderinge hersien}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} onveranderd op {new_value}} up "
      & "{{field_name} gestyg van {old_value} na {new_value}} other "
      & "{{field_name} gedaal van {old_value} na {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {geen rye kiesbaar nie} none {geen rye gekies "
      & "nie} all {{total, plural, one {1 ry gekies} other {al {total, number} "
      & "rye gekies}}} other {{selected, number} van {total, plural, one {1 ry} "
      & "other {{total, number} rye}} gekies}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {geen bladsye nie} other {{pages, plural, =0 {geen "
      & "bladsye nie} other {{rows, plural, =0 {bladsy {page, number} van "
      & "{pages, number}} one {bladsy {page, number} van {pages, number}, 1 ry} "
      & "other {bladsy {page, number} van {pages, number}, {rows, number} "
      & "rye}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {geen rye nie} none {geen rye pas nie} all "
      & "{{total, plural, one {1 ry sigbaar} other {al {total, number} rye "
      & "sigbaar}}} other {{visible, number} van {total, plural, one {1 ry} "
      & "other {{total, number} rye}} sigbaar}}");
   P ("label.tables.row_range_label",
      "{state, select, none {geen rye nie} single {ry {first_row, number} van "
      & "{total, number}} other {rye {first_row, number}-{last_row, number} van "
      & "{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {geen karakterlimiet nie} none_left {geen "
      & "karakters oor nie} left {{count, plural, one {1 karakter} other "
      & "{{count, number} karakters}} oor} other {{count, plural, one {1 "
      & "karakter} other {{count, number} karakters}} oor die limiet}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {geen verpligte velde nie} one {{missing, plural, "
      & "=0 {alle verpligte velde voltooi} other {1 van 1 verpligte veld "
      & "ontbreek}}} other {{missing, plural, =0 {alle verpligte velde voltooi} "
      & "other {{missing, number} van {total, number} verpligte velde "
      & "ontbreek}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {geen velde nie} all {alle velde voltooi} other "
      & "{{completed, number} van {total, plural, one {1 veld} other {{total, "
      & "number} velde}} voltooi}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: geen velde nie} all {{name}: alle velde "
      & "voltooi} other {{name}: {completed, number} van {total, plural, one {1 "
      & "veld} other {{total, number} velde}} voltooi}}");
end Labels_2;
