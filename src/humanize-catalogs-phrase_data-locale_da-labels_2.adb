separate (Humanize.Catalogs.Phrase_Data.Locale_Da)
procedure Labels_2 is
begin
   P ("label.navigation.section_state_label",
      "sektion {name} {expanded, select, false {sammenklappet} other "
      & "{udvidet}}{count, plural, =0 {} one {, 1 element} other {, {count, "
      & "number} elementer}}");
   P ("label.navigation.skip_link_label", "spring til {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {undermenu {name}, 1 element} other {undermenu "
      & "{name}, {count, number} elementer}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {alle advarsler} important_alerts {vigtige "
      & "advarsler} critical_alerts_only {kun kritiske advarsler} other {ingen "
      & "advarsler}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: meddelelser {state, select, preference_enabled {aktiveret} "
      & "preference_disabled {deaktiveret} preference_inherited {nedarvet} "
      & "other {påkrævet}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {intet sammendrag} instant_digest "
      & "{øjeblikkeligt sammendrag} daily_digest {dagligt sammendrag} other "
      & "{ugentligt sammendrag}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {aktiveret} preference_disabled "
      & "{deaktiveret} preference_inherited {nedarvet} other {påkrævet}}");
   P ("label.notification_preferences.quiet_hours_label", "stille timer {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {trådabonnement} "
      & "project_subscription {projektabonnement} team_subscription "
      & "{teamabonnement} other {kontoabonnement}} {state, select, "
      & "preference_enabled {aktiveret} preference_disabled {deaktiveret} "
      & "preference_inherited {nedarvet} other {påkrævet}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {trådabonnement} "
      & "project_subscription {projektabonnement} team_subscription "
      & "{teamabonnement} other {kontoabonnement}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} nævnte dig} reply_event "
      & "{{actor} svarede} assignment_event {{actor} tildelte dig noget} "
      & "approval_event {{actor} anmodede om godkendelse} alert_event {{actor} "
      & "sendte en advarsel} digest_event {{actor} sendte et sammendrag} "
      & "reminder_event {{actor} sendte en påmindelse} other {{actor} sendte "
      & "en systemmeddelelse}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {meddelelse i appen} email_channel "
      & "{e-mailmeddelelse} sms_channel {sms-meddelelse} push_channel "
      & "{pushmeddelelse} webhook_channel {webhookmeddelelse} other "
      & "{sammendragsmeddelelse}} {state, select, pending_delivery {afventer} "
      & "sent_delivery {sendt} delivered_delivery {leveret} failed_delivery "
      & "{mislykkedes} retrying_delivery {forsøges igen} other {annulleret}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {meddelelse afventer} sent_delivery "
      & "{meddelelse sendt} delivered_delivery {meddelelse leveret} "
      & "failed_delivery {meddelelse mislykkedes} retrying_delivery {meddelelse "
      & "forsøges igen} other {meddelelse annulleret}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {afventer} sent_delivery {sendt} "
      & "delivered_delivery {leveret} failed_delivery {mislykkedes} "
      & "retrying_delivery {nyt forsøg} other {annulleret}} {time_text}");
   P ("label.notifications.digest_label",
      "sammendrag {name}: {count, plural, =0 {ingen meddelelser} one {1 "
      & "meddelelse} other {{count, number} meddelelser}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {ingen omtaler} one "
      & "{1 omtale} other {{count, number} omtaler}}} reply_event {{count, "
      & "plural, =0 {ingen svar} one {1 svar} other {{count, number} svar}}} "
      & "assignment_event {{count, plural, =0 {ingen tildelinger} one {1 "
      & "tildeling} other {{count, number} tildelinger}}} approval_event "
      & "{{count, plural, =0 {ingen godkendelsesanmodninger} one {1 "
      & "godkendelsesanmodning} other {{count, number} "
      & "godkendelsesanmodninger}}} alert_event {{count, plural, =0 {ingen "
      & "advarsler} one {1 advarsel} other {{count, number} advarsler}}} "
      & "digest_event {{count, plural, =0 {ingen sammendrag} one {1 sammendrag} "
      & "other {{count, number} sammendrag}}} reminder_event {{count, plural, "
      & "=0 {ingen påmindelser} one {1 påmindelse} other {{count, number} "
      & "påmindelser}}} other {{count, plural, =0 {ingen systemmeddelelser} "
      & "one {1 systemmeddelelse} other {{count, number} systemmeddelelser}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {markér meddelelse som læst} other {markér "
      & "{count, number} meddelelser som læst}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {markér meddelelse som ulæst} other {markér "
      & "{count, number} meddelelser som ulæst}}");
   P ("label.notifications.muted_label", "{name}: meddelelser slået fra");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {ny omtale} reply_event {nyt svar} "
      & "assignment_event {ny tildeling} approval_event {ny "
      & "godkendelsesanmodning} alert_event {ny advarsel} digest_event {nyt "
      & "sammendrag} reminder_event {ny påmindelse} other {ny "
      & "systemmeddelelse}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {meddelelser i appen} email_channel "
      & "{e-mailmeddelelser} sms_channel {sms-meddelelser} push_channel "
      & "{pushmeddelelser} webhook_channel {webhookmeddelelser} other "
      & "{sammendragsmeddelelser}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {ingen meddelelser} one {1 meddelelse} other "
      & "{{count, number} meddelelser}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {omtale} reply_event {svar} "
      & "assignment_event {tildeling} approval_event {godkendelsesanmodning} "
      & "alert_event {advarsel} digest_event {sammendrag} reminder_event "
      & "{påmindelse} other {systemmeddelelse}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {ingen meddelelser} one {1 meddelelse} "
      & "other {{count, number} meddelelser}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {omtale} reply_event {svar} "
      & "assignment_event {tildeling} approval_event {godkendelsesanmodning} "
      & "alert_event {advarsel} digest_event {sammendrag} reminder_event "
      & "{påmindelse} other {systemmeddelelse}}, {state, select, unread_state "
      & "{ulæst} read_state {læst} archived_state {arkiveret} muted_state "
      & "{lydløs} snoozed_state {udsat} other {undertrykt}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {ulæst meddelelse} read_state {læst "
      & "meddelelse} archived_state {arkiveret meddelelse} muted_state {lydløs "
      & "meddelelse} snoozed_state {udsat meddelelse} other {undertrykt "
      & "meddelelse}}");
   P ("label.notifications.snoozed_label", "{name}: meddelelser udsat");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {ingen meddelelser undertrykt} one {1 meddelelse "
      & "undertrykt} other {{count, number} meddelelser undertrykt}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {ingen ulæste meddelelser} one {1 ulæst "
      & "meddelelse} other {{count, number} ulæste meddelelser}}");
   P ("label.payments.amount_label", "beløb {amount_text}");
   P ("label.payments.balance_label", "saldo {amount_text}");
   P ("label.payments.chargeback_label", "tilbageførsel {amount_text}");
   P ("label.payments.discount_label", "rabat {amount_text}");
   P ("label.payments.due_label", "{amount_text} forfalder {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {ingen fakturaer} one {1 faktura} other {{count, "
      & "number} fakturaer}}");
   P ("label.payments.invoice_label",
      "faktura {number}: {state, select, draft_invoice {kladde} open_invoice "
      & "{åben} paid_invoice {betalt} overdue_invoice {forfalden} other "
      & "{annulleret}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {fakturakladde} open_invoice {åben "
      & "faktura} paid_invoice {betalt faktura} overdue_invoice {forfalden "
      & "faktura} other {annulleret faktura}}");
   P ("label.payments.method_label",
      "betalt {method, select, card_method {med kort} bank_transfer_method "
      & "{med bankoverførsel} cash_method {kontant} wallet_method {med wallet} "
      & "check_method {med check} other {på anden måde}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} betalt {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {ingen betalinger} one {1 betaling} other {{count, "
      & "number} betalinger}}");
   P ("label.payments.payment_label",
      "{amount_text}: betaling {state, select, pending_payment {afventer} "
      & "authorized_payment {godkendt} paid_payment {gennemført} "
      & "failed_payment {mislykkedes} refunded_payment {refunderet} other "
      & "{annulleret}}");
   P ("label.payments.payment_link_label", "betalingslink {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kort} bank_transfer_method "
      & "{bankoverførsel} cash_method {kontant} wallet_method {wallet} "
      & "check_method {check} other {andet}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {afventende betaling} "
      & "authorized_payment {godkendt betaling} paid_payment {gennemført "
      & "betaling} failed_payment {mislykket betaling} refunded_payment "
      & "{refunderet betaling} other {annulleret betaling}}");
   P ("label.payments.receipt_label", "kvittering {number}");
   P ("label.payments.refund_label",
      "{amount_text}: refusion {state, select, pending_payment {afventer} "
      & "authorized_payment {godkendt} paid_payment {udbetalt} failed_payment "
      & "{mislykkedes} refunded_payment {gennemført} other {annulleret}}");
   P ("label.payments.subtotal_label", "subtotal {amount_text}");
   P ("label.payments.tax_label", "moms {amount_text}");
   P ("label.payments.total_label", "i alt {amount_text}");
   P ("label.permissions.access_expiry_label", "adgang for {subject} udløber {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {rollen ejer} admin_role {rollen "
      & "administrator} editor_role {rollen redaktør} viewer_role {rollen "
      & "læser} other {brugerdefineret rolle}} tildelt");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {tildelt} denied "
      & "{nægtet} inherited {nedarvet} temporary {midlertidig adgang} expired "
      & "{udløbet} other {kræver godkendelse}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {tildelt} denied {nægtet} inherited "
      & "{nedarvet} temporary {midlertidig adgang} expired {udløbet} other "
      & "{kræver godkendelse}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {tilladt af politik} policy_denied "
      & "{afvist af politik} policy_warning {politikadvarsel} other {politik "
      & "ikke relevant}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {rollen ejer} admin_role {rollen "
      & "administrator} editor_role {rollen redaktør} viewer_role {rollen "
      & "læser} other {brugerdefineret rolle}} tilbagekaldt");
   P ("label.permissions.role_label",
      "{role, select, owner_role {ejer} admin_role {administrator} "
      & "editor_role {redaktør} viewer_role {læser} other {brugerdefineret "
      & "rolle}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {tom} low_utilization {lav "
      & "udnyttelse} normal_utilization {normal udnyttelse} high_utilization "
      & "{høj udnyttelse} critical_utilization {kritisk udnyttelse} "
      & "full_utilization {fuld} other {over grænsen}}");
   P ("label.schema.array_shape_label",
      "array af {count_known, select, false {{element_type, select, "
      & "string_field {strenge} integer_field {heltal} decimal_field "
      & "{decimaltal} boolean_field {booleske værdier} date_field {datoer} "
      & "date_time_field {dato-tidsværdier} object_field {objekter} "
      & "array_field {arrays} enum_field {enum-værdier} binary_field {binære "
      & "værdier} null_field {null-værdier} any_field {vilkårlige værdier} "
      & "other {ukendte værdier}}} other {{count, plural, one {1 "
      & "{element_type, select, string_field {streng} integer_field {heltal} "
      & "decimal_field {decimaltal} boolean_field {boolesk værdi} date_field "
      & "{dato} date_time_field {dato-tidsværdi} object_field {objekt} "
      & "array_field {array} enum_field {enum-værdi} binary_field {binær "
      & "værdi} null_field {null-værdi} any_field {vilkårlig værdi} other "
      & "{ukendt værdi}}} other {{count, number} {element_type, select, "
      & "string_field {strenge} integer_field {heltal} decimal_field "
      & "{decimaltal} boolean_field {booleske værdier} date_field {datoer} "
      & "date_time_field {dato-tidsværdier} object_field {objekter} "
      & "array_field {arrays} enum_field {enum-værdier} binary_field {binære "
      & "værdier} null_field {null-værdier} any_field {vilkårlige værdier} "
      & "other {ukendte værdier}}}}}}");
   P ("label.schema.constraint_label", "begrænsning {name}: {value}");
   P ("label.schema.default_value_label", "felt {field_name}: standardværdi {value}");
   P ("label.schema.deprecated_field_label", "forældet felt {name}, brug {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 enum-mulighed} other {{count, number} "
      & "enum-muligheder}}");
   P ("label.schema.example_value_label", "felt {field_name}: eksempel {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normalt felt} deprecated_field "
      & "{forældet felt} unknown_field {ukendt felt} read_only_field "
      & "{skrivebeskyttet felt} write_only_field {felt kun til skrivning} other "
      & "{beregnet felt}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {strengfelt} integer_field {heltalsfelt} "
      & "decimal_field {decimalfelt} boolean_field {boolesk felt} date_field "
      & "{datofelt} date_time_field {dato-tidsfelt} object_field {objektfelt} "
      & "array_field {arrayfelt} enum_field {enum-felt} binary_field {binært "
      & "felt} null_field {null-felt} any_field {felt af vilkårlig type} other "
      & "{felt af ukendt type}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {ingen manglende obligatoriske felter} one {1 "
      & "manglende obligatorisk felt} other {{count, number} manglende "
      & "obligatoriske felter}}");
   P ("label.schema.object_shape_label",
      "objekt med {fields, plural, one {1 felt} other {{fields, number} "
      & "felter}}{required, plural, =0 {} one {, 1 obligatorisk} other {, "
      & "{required, number} obligatoriske}}{optional, plural, =0 {} one {, 1 "
      & "valgfrit} other {, {optional, number} valgfrie}}");
   P ("label.schema.schema_source_label", "skema {name}, version {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalarværdi} object_shape {{count, "
      & "plural, =0 {objekt} one {objekt med 1 felt} other {objekt med {count, "
      & "number} felter}}} array_shape {{count, plural, =0 {array} one {array "
      & "med 1 element} other {array med {count, number} elementer}}} map_shape "
      & "{{count, plural, =0 {map} one {map med 1 post} other {map med {count, "
      & "number} poster}}} tuple_shape {{count, plural, =0 {tupel} one {tupel "
      & "med 1 element} other {tupel med {count, number} elementer}}} "
      & "union_shape {{count, plural, =0 {union} one {union af 1 type} other "
      & "{union af {count, number} typer}}} empty_shape {tom struktur} other "
      & "{ukendt struktur}}");
   P ("label.schema.unknown_field_label", "ukendt felt {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {ingen aktive filtre} one {1 aktivt filter} other "
      & "{{count, number} aktive filtre}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {ryd filtre} one {ryd aktivt filter} other {ryd "
      & "{count, number} aktive filtre}}");
   P ("label.search.facet_label",
      "facet {name}, {count, plural, one {1 mulighed} other {{count, number} "
      & "muligheder}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {ingen resultater} one {1 resultat} other "
      & "{{count, number} resultater}}{selected, select, true {, valgt} other "
      & "{}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {aktivt filter} "
      & "inactive_filter {inaktivt filter} other {udelukkelsesfilter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktivt filter} inactive_filter "
      & "{inaktivt filter} other {udelukkelsesfilter}}");
   P ("label.search.no_results_label", "ingen resultater for »{query}«");
   P ("label.search.recent_search_label", "seneste søgning: »{query}«");
   P ("label.search.saved_search_label",
      "gemt søgning: {name}{count, plural, =0 {} one {, 1 resultat} other {, "
      & "{count, number} resultater}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {ingen seneste søgninger} one {1 seneste søgning} "
      & "other {{count, number} seneste søgninger}}");
   P ("label.search.search_query_label", "søg efter »{query}«");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {ingen resultater} one {1 resultat} other {{count, "
      & "number} resultater}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {ingen resultater for »{query}«} one {1 resultat "
      & "for »{query}«} other {{count, number} resultater for »{query}«}}");
   P ("label.search.search_scope_label",
      "søgeområde {name}, {count, plural, =0 {ingen resultater} one {1 "
      & "resultat} other {{count, number} resultater}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {søgning inaktiv} searching_search "
      & "{søger} complete_search {søgning fuldført} empty_search {ingen "
      & "søgeresultater} other {søgning mislykkedes}}");
   P ("label.search.sort_label",
      "sortering: {mode, select, relevance_sort {relevans} ascending_sort "
      & "{stigende} descending_sort {faldende} newest_first_sort {nyeste "
      & "først} other {ældste først}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevans} ascending_sort {stigende} "
      & "descending_sort {faldende} newest_first_sort {nyeste først} other "
      & "{ældste først}}");
   P ("label.search.suggestion_label", "mente du »{query}«?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 legitimationsoplysning fra {source}} other "
      & "{{count, number} legitimationsoplysninger fra {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {værdi skjult} masked_value {værdi "
      & "maskeret} suffix_only {kun suffiks} other {kun fingeraftryk}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {offentlig} support_profile {support} "
      & "audit_profile {revision} other {fejlfinding}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {rotation nødvendig} other {rotation "
      & "ikke nødvendig}}{days_old, plural, =0 {} one {, 1 dag gammel} other "
      & "{, {days_old, number} dage gammel}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-nøgle} live_api_key {live-API-nøgle} "
      & "test_api_key {test-API-nøgle} github_token {GitHub-token} "
      & "aws_access_key {AWS-adgangsnøgle} google_api_key {Google-API-nøgle} "
      & "slack_token {Slack-token} npm_token {npm-token} bearer_token "
      & "{bearer-token} jwt_token {JWT-token} basic_auth_credential {Basic "
      & "Auth-legitimationsoplysninger} password_secret {adgangskode} "
      & "private_key {privat nøgle} ssh_private_key {privat SSH-nøgle} "
      & "webhook_secret {webhook-hemmelighed} oauth_token {OAuth-token} "
      & "database_url_secret {database-URL med legitimationsoplysninger} "
      & "sha1_fingerprint {SHA-1-fingeraftryk} sha256_fingerprint "
      & "{SHA-256-fingeraftryk} other {hemmelighed}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefon} url_value "
      & "{URL} ip_address_value {IP-adresse} token_value {token} "
      & "file_path_value {filsti} account_id_value {konto-id} "
      & "payment_reference_value {betalingsreference} log_field_value {logfelt} "
      & "other {følsom værdi}}");
   P ("label.tables.cell_label",
      "række {row, number}, kolonne {column, number}, {state, select, "
      & "empty_cell {tom} edited_cell {redigeret} invalid_cell {ugyldig} "
      & "highlighted_cell {fremhævet} other {skrivebeskyttet}}");
   P ("label.tables.cell_position_label", "række {row, number}, kolonne {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {tom celle} edited_cell {redigeret celle} "
      & "invalid_cell {ugyldig celle} highlighted_cell {fremhævet celle} other "
      & "{skrivebeskyttet celle}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {ingen kolonner} one {1 kolonne} other {{count, "
      & "number} kolonner}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {tekstkolonne} number_column "
      & "{talkolonne} date_column {datokolonne} status_column {statuskolonne} "
      & "action_column {handlingskolonne} other {skjult kolonne}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {tekstkolonne} number_column {talkolonne} "
      & "date_column {datokolonne} status_column {statuskolonne} action_column "
      & "{handlingskolonne} other {skjult kolonne}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {1 række} other {{count, number} "
      & "rækker}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {ingen rækker} one {1 række} other {{count, "
      & "number} rækker}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {ikke sorteret} ascending_sort {stigende} "
      & "other {faldende}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {ikke sorteret} ascending_sort {sorteret "
      & "stigende efter {column_name}} other {sorteret faldende efter "
      & "{column_name}}}");
   P ("label.tables.subtotal_label", "subtotal {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 række} other {{rows, number} rækker}} × "
      & "{columns, plural, one {1 kolonne} other {{columns, number} kolonner}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} ikke længere tildelt} assigned "
      & "{tildelt {assignee}} reassigned {omfordelt til {assignee}} watching "
      & "{{assignee} følger} other {{assignee} ejer opgaven}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {ikke tildelt} assigned {tildelt} "
      & "reassigned {omfordelt} watching {følger} other {ejer opgaven}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {tom backlog} one {backlog: 1 opgave} other "
      & "{backlog: {count, number} opgaver}}");
   P ("label.tasks.blocker_label", "blokeret af {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {fuldfør opgave} other {fuldfør {count, number} "
      & "opgaver}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {ingen fuldførte opgaver} one {1 fuldført opgave} "
      & "other {{count, number} fuldførte opgaver}}");
   P ("label.tasks.due_label", "forfalder {due_text}");
   P ("label.tasks.estimate_label", "estimat: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {ingen åbne opgaver} one {1 åben opgave} other "
      & "{{count, number} åbne opgaver}}");
   P ("label.tasks.overdue_label", "forfalden siden {due_text}");
   P ("label.tasks.recurring_task_label", "gentagelse: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {genåbn opgave} other {genåbn {count, number} "
      & "opgaver}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 opgave} other {{count, number} "
      & "opgaver}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 delopgave} other {{count, number} "
      & "delopgaver}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {ingen opgaver} one {1 opgave} other {{count, "
      & "number} opgaver}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {åben opgave} in_progress_task "
      & "{opgave i gang} blocked_task {blokeret opgave} done_task {fuldført "
      & "opgave} canceled_task {annulleret opgave} deferred_task {udskudt "
      & "opgave} other {forfalden opgave}}{priority, select, no_priority {} "
      & "low_priority {, lav prioritet} medium_priority {, middel prioritet} "
      & "high_priority {, høj prioritet} other {, kritisk prioritet}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {ingen prioritet} low_priority {lav "
      & "prioritet} medium_priority {middel prioritet} high_priority {høj "
      & "prioritet} other {kritisk prioritet}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {åben opgave} in_progress_task {opgave i "
      & "gang} blocked_task {blokeret opgave} done_task {fuldført opgave} "
      & "canceled_task {annulleret opgave} deferred_task {udskudt opgave} other "
      & "{forfalden opgave}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {øvre grænse} other {nedre grænse}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {under forventet interval} within_range "
      & "{inden for forventet interval} above_range {over forventet interval} "
      & "below_target {under målet} at_target {mål nået} above_target {over "
      & "målet} near_limit {tæt på grænsen} warning_level "
      & "{advarselstærskel nået} critical_level {kritisk tærskel nået} "
      & "breached {grænse overskredet} other {ukendt tærskelstatus}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {ajour} one {1 commit foran} "
      & "other {{ahead, number} commits foran}}} one {{ahead, plural, =0 {1 "
      & "commit bagud} one {1 commit foran, 1 commit bagud} other {{ahead, "
      & "number} commits foran, 1 commit bagud}}} other {{ahead, plural, =0 "
      & "{{behind, number} commits bagud} one {1 commit foran, {behind, number} "
      & "commits bagud} other {{ahead, number} commits foran, {behind, number} "
      & "commits bagud}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {venter på godkendelse fra {approver}} other "
      & "{godkendt af {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {forsøg 1 af 1} other "
      & "{forsøg {attempt, number} af 1 (grænse overskredet)}}} other "
      & "{forsøg {attempt, number} af {limit, number}}}");
   P ("label.workflows.blocker_label", "blokeret: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {ingen blokerende afhængigheder} one {1 blokerende "
      & "afhængighed} other {{count, number} blokerende afhængigheder}}");
   P ("label.workflows.handoff_label", "overdragelse fra {from} til {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {kommende milepæl} "
      & "current_milestone {aktuel milepæl} complete_milestone {nået "
      & "milepæl} missed_milestone {misset milepæl} other {blokeret "
      & "milepæl}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {kommende} "
      & "current_milestone {aktuel} complete_milestone {nået} missed_milestone "
      & "{misset} other {blokeret}}");
   P ("label.workflows.next_action_label", "næste trin: {action}");
   P ("label.workflows.owner_label", "ejer: {owner}");
   P ("label.workflows.resume_label", "genoptag {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {afventer} active_step {aktiv} "
      & "waiting_step {venter} blocked_step {blokeret} done_step {fuldført} "
      & "failed_step {mislykkedes} other {sprunget over}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {afventer} active_step {aktiv} "
      & "waiting_step {venter} blocked_step {blokeret} done_step {fuldført} "
      & "failed_step {mislykkedes} other {sprunget over}}");
   P ("label.workflows.waiting_label", "venter på {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {ikke startet} "
      & "in_progress_state {i gang} waiting_state {venter} "
      & "waiting_approval_state {venter på godkendelse} blocked_state "
      & "{blokeret} completed_state {fuldført} failed_state {mislykkedes} "
      & "cancelled_state {annulleret} skipped_state {sprunget over} other {sat "
      & "på pause}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {ikke startet} in_progress_state {i "
      & "gang} waiting_state {venter} waiting_approval_state {venter på "
      & "godkendelse} blocked_state {blokeret} completed_state {fuldført} "
      & "failed_state {mislykkedes} cancelled_state {annulleret} skipped_state "
      & "{sprunget over} other {sat på pause}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {gennemsigtig} "
      & "mostly_transparent {overvejende gennemsigtig} translucent "
      & "{halvgennemsigtig} mostly_opaque {overvejende uigennemsigtig} other "
      & "{uigennemsigtig}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {ingen observationer} one {1 observation, min. "
      & "{minimum} {unit}, median {median} {unit}, maks. {maximum} {unit}} "
      & "other {{count, number} observationer, min. {minimum} {unit}, median "
      & "{median} {unit}, maks. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {ingen observationer} one {0 "
      & "afvigere ud af 1 observation} other {0 afvigere ud af {total, number} "
      & "observationer}}} one {{total, plural, one {1 afviger ud af 1 "
      & "observation} other {1 afviger ud af {total, number} observationer}}} "
      & "other {{outliers, number} afvigere ud af {total, number} "
      & "observationer}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {ingen observationer} "
      & "sample_too_small_shape {stikprøven er for lille til at beskrive "
      & "formen, {count, plural, one {1 observation} other {{count, number} "
      & "observationer}}} flat_shape {flad fordeling ved {median}} "
      & "outlier_heavy_shape {fordeling med mange afvigere omkring {median}} "
      & "volatile_shape {svingende fordeling omkring {median}} clustered_shape "
      & "{klyngedelt fordeling omkring {median}} wide_spread_shape {bredt "
      & "spredt fordeling} wide_spread_range {bredt spredt fordeling fra "
      & "{minimum} til {maximum}} right_skewed_shape {højreskæv fordeling, "
      & "median {median}} left_skewed_shape {venstreskæv fordeling, median "
      & "{median}} other {overvejende balanceret fordeling omkring {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tom e-mail} address {e-mailadresse} other "
      & "{e-mail hos {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonnummer} redacted {telefonnummer sløret} "
      & "other {telefonnummer der ender på {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {brugernavn} other {brugernavn {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodesymbol} other {kodesymbol {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adressemetadata: {present, plural, one {1 felt til stede} other "
      & "{{present, number} felter til stede}}, {missing, plural, one {1 felt "
      & "mangler} other {{missing, number} felter mangler}}");
   P ("label.endpoints.host_label", "{state, select, none {ukendt vært} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {ukendt endepunkt} other {endepunkt "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tom URL} none {URL uden genkendte komponenter} "
      & "other {URL med {count, plural, one {1 komponent} other {{count, "
      & "number} komponenter}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {ingen forespørgselsparametre} one {1 "
      & "forespørgselsparameter} other {{count, number} "
      & "forespørgselsparametre}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {offentlig IPv4-adresse} ipv6_host "
      & "{offentlig IPv6-adresse} private_network_host {adresse på privat "
      & "netværk} localhost_host {lokal vært} other {ikke en IP-adresse}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} (ugyldig CIDR)} other {{cidr} ({kind}, "
      & "netværkspræfiks {prefix})}}");
   P ("label.resources.utilization_label", "{used, number} af {total, number} {unit} brugt ({percent}, {band})");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} over kapaciteten} other "
      & "{{count, number} af {total, number} {unit} tilbage}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvote overskredet med {count, number} {unit} "
      & "({percent} brugt)} near {kvote næsten opbrugt: {count, number} {unit} "
      & "tilbage ({percent} brugt)} other {kvote tilgængelig: {count, number} "
      & "{unit} tilbage ({percent} brugt)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {cachehitrate utilgængelig: ingen "
      & "forespørgsler} other {cachehitrate {percent}: {hits, plural, one {1 "
      & "hit} other {{hits, number} hits}}, {misses, plural, one {1 miss} other "
      & "{{misses, number} misses}}}}");
   P ("label.resources.saturation_label", "{named, select, no {ressource} other {{name}}} {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {version {version}, forhåndsversion "
      & "{prerelease}, build {build}} prerelease {version {version}, "
      & "forhåndsversion {prerelease}} build {version {version}, build "
      & "{build}} other {version {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {samme version} major_upgrade "
      & "{opgradering af hovedversion} minor_upgrade {opgradering af "
      & "underversion} patch_upgrade {patchopgradering} prerelease_change "
      & "{ændret forhåndsversion} build_metadata_change {ændrede "
      & "buildmetadata} downgrade {nedgradering} other {ukendt "
      & "versionsændring}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {præcis version {version}} minimum_range "
      & "{version {version} eller nyere} maximum_range {version {version} eller "
      & "ældre} major_compatible_range {kompatibel med hovedversion {version}} "
      & "minor_compatible_range {kompatibel med underversion {version}} other "
      & "{versionsinterval {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {første udviklingsudgivelse {version}} "
      & "prerelease {forhåndsudgivelse {version}} major {hovedudgivelse "
      & "{version}} minor {underudgivelse {version}} other {patchudgivelse "
      & "{version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {linktag} image {billedtag} paragraph {afsnitstag} "
      & "ordered_list {tag for nummereret liste} unordered_list {tag for "
      & "punktliste} list_item {listeelementtag} table_header_cell {tag for "
      & "tabeloverskriftscelle} table_cell {tabelcelletag} table_row "
      & "{tabelrækketag} line_break {linjeskifttag} thematic_break {tag for "
      & "tematisk skift} heading_level_n {tag for overskrift på niveau {level, "
      & "number}} other {{name}-tag}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name}-attribut} event "
      & "{hændelseshåndteringsattribut {name}} other {attribut {name} sat til "
      & "»{value}«}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 attribut} other {{count, number} attributter}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data-attribut} other {{count, number} "
      & "data-attributter}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA-attribut} other {{count, number} "
      & "ARIA-attributter}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 hændelseshåndtering} other {{count, number} "
      & "hændelseshåndteringer}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {tekstindhold} html_content "
      & "{HTML-dokument} json_content {JSON-dokument} xml_content "
      & "{XML-dokument} image_content {billedindhold} audio_content "
      & "{lydindhold} video_content {videoindhold} font_content "
      & "{skrifttypeindhold} archive_content {arkivindhold} binary_content "
      & "{binært indhold} form_content {formularindsendelse} other {ukendt "
      & "indhold}} ({base})");
   P ("label.markup.heading_label", "overskrift på niveau {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 tag} other {{count, number} tags}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 link} other {{count, number} links}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 medieelement} other {{count, number} "
      & "medieelementer}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 formularelement} other {{count, number} "
      & "formularelementer}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {1 overskrift} other {{count, number} "
      & "overskrifter}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 landmark} other {{count, number} landmarks}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {1 formular} other {{count, number} formularer}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 medieelement} other {{count, number} "
      & "medieelementer}}");
   P ("label.markup.table_navigation_label",
      "{caption} række {row, number} af {rows, number}, kolonne {column, "
      & "number} af {columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} ikke angivet} hidden_value {{kind} "
      & "skjult} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "fingeraftryk der ender på {shown}} other {{kind} der ender på "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name}: {kind} ikke angivet} other {{name}: "
      & "{kind} der ender på {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {legitimationsheader {name} ikke angivet} other "
      & "{{name}: {kind} der ender på {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-fingeraftryk der ender på {shown}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {1 hemmelighed} other {{count, number} "
      & "hemmeligheder}}");
   P ("label.secrets.secret_count_label.masked",
      "{count, plural, one {1 maskeret} other {{count, number} maskerede}}");
   P ("label.secrets.secret_count_label.unset",
      "{count, plural, one {1 ikke angivet} other {{count, number} ikke "
      & "angivne}}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 fingeraftryk} other {{count, number} "
      & "fingeraftryk}}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} ikke angivet} redacted {{label} "
      & "sløret} url_redacted {URL sløret} ip_redacted {IP-adresse sløret} "
      & "path_ending {filsti der ender på {shown}} at {{label} hos {shown}} "
      & "audit {{label}, længde {length, number}, ender på {shown}} debug "
      & "{{label} {shown}} other {{label} der ender på {shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {forældet } unknown_field {ukendt } "
      & "read_only_field {skrivebeskyttet } write_only_field {kun skrivbart } "
      & "computed_field {beregnet } other {}}{kind, select, string_field "
      & "{strengfelt} integer_field {heltalsfelt} decimal_field {decimalfelt} "
      & "boolean_field {boolesk felt} date_field {datofelt} date_time_field "
      & "{dato-tidsfelt} object_field {objektfelt} array_field {arrayfelt} "
      & "enum_field {enum-felt} binary_field {binært felt} null_field "
      & "{null-felt} any_field {felt af vilkårlig type} other {felt af ukendt "
      & "type}} {name} ({presence, select, required_field {obligatorisk} "
      & "optional_field {valgfrit} conditional_field {betinget} other {ukendt "
      & "tilstedeværelse}}{nullable, select, non_nullable {, ikke null} "
      & "nullable {, kan være null} other {}})");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {1 felt} other {{count, number} felter}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {1 obligatorisk} other {{count, number} "
      & "obligatoriske}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {1 valgfrit} other {{count, number} valgfrie}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {1 forældet} other {{count, number} forældede}}");
end Labels_2;
