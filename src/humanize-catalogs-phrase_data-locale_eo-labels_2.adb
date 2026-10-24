separate (Humanize.Catalogs.Phrase_Data.Locale_Eo)
procedure Labels_2 is
begin
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {atendas kontrolon} approved {aprobita} "
      & "rejected {malaprobita} needs_changes {bezonas ŝanĝojn} other "
      & "{kontrolo eskaladita}}");
   P ("label.navigation.back_label", "reen al {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {navigada vojo malplena} one {navigada vojo, "
      & "{depth, number} nivelo} other {navigada vojo, {depth, number} "
      & "niveloj}}");
   P ("label.navigation.current_page_label", "nuna paĝo: {name}");
   P ("label.navigation.external_link_label", "{name}: ekstera ligilo");
   P ("label.navigation.first_label", "al la komenco: {target}");
   P ("label.navigation.last_label", "al la fino: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {neniuj menueroj} one {{count, number} menuero} "
      & "other {{count, number} menueroj}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {ligilo} menu_item {menuero} tab_item "
      & "{langeto} breadcrumb_item {navigada vojero} section_item {sekcio} "
      & "other {apartigilo}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {ligilo} menu_item {menuero} tab_item "
      & "{langeto} breadcrumb_item {navigada vojero} section_item {sekcio} "
      & "other {apartigilo}}, {state, select, current_item {nuna} active_item "
      & "{aktiva} inactive_item {neaktiva} disabled_item {malŝaltita} "
      & "expanded_item {malfaldita} collapsed_item {faldita} visited_item "
      & "{vizitita} other {ekstera}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {nuna} active_item {aktiva} inactive_item "
      & "{neaktiva} disabled_item {malŝaltita} expanded_item {malfaldita} "
      & "collapsed_item {faldita} visited_item {vizitita} other {ekstera}}");
   P ("label.navigation.next_label", "sekva: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {sekcio faldita} other {sekcio "
      & "malfaldita}}{count, plural, =0 {} one {, {count, number} ero} other {, "
      & "{count, number} eroj}}");
   P ("label.navigation.skip_link_label", "salti al {target}");
   P ("label.navigation.submenu_label",
      "{name}: submenuo, {count, plural, one {{count, number} ero} other "
      & "{{count, number} eroj}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {ĉiuj alarmoj} important_alerts {gravaj "
      & "alarmoj} critical_alerts_only {nur kritikaj alarmoj} other {neniuj "
      & "alarmoj}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: sciigoj {state, select, preference_enabled {ŝaltitaj} "
      & "preference_disabled {malŝaltitaj} preference_inherited {hereditaj} "
      & "other {devigaj}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {neniu resumo} instant_digest {tuja "
      & "resumo} daily_digest {ĉiutaga resumo} other {ĉiusemajna resumo}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {ŝaltita} preference_disabled "
      & "{malŝaltita} preference_inherited {heredita} other {deviga}}");
   P ("label.notification_preferences.quiet_hours_label", "silentaj horoj: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {abono de fadeno} "
      & "project_subscription {abono de projekto} team_subscription {abono de "
      & "teamo} other {abono de konto}} {state, select, preference_enabled "
      & "{ŝaltita} preference_disabled {malŝaltita} preference_inherited "
      & "{heredita} other {deviga}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {abono de fadeno} "
      & "project_subscription {abono de projekto} team_subscription {abono de "
      & "teamo} other {abono de konto}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} menciis vin} reply_event "
      & "{{actor} respondis} assignment_event {{actor} asignis vin} "
      & "approval_event {{actor} petis aprobon} alert_event {{actor} sendis "
      & "alarmon} digest_event {{actor} sendis resumon} reminder_event {{actor} "
      & "sendis memorigon} other {{actor} sendis sisteman sciigon}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {en-aplikaĵa sciigo} email_channel "
      & "{retpoŝta sciigo} sms_channel {SMS-sciigo} push_channel {puŝ-sciigo} "
      & "webhook_channel {retkroĉila sciigo} other {resuma sciigo}}: {state, "
      & "select, pending_delivery {atendas sendon} sent_delivery {sendita} "
      & "delivered_delivery {liverita} failed_delivery {ne liverita} "
      & "retrying_delivery {resendata} other {nuligita}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {sciigo atendas sendon} sent_delivery "
      & "{sciigo sendita} delivered_delivery {sciigo liverita} failed_delivery "
      & "{sciigo ne liverita} retrying_delivery {sciigo resendata} other "
      & "{sciigo nuligita}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {atendas sendon: {time_text}} "
      & "sent_delivery {sendita: {time_text}} delivered_delivery {liverita: "
      & "{time_text}} failed_delivery {ne liverita: {time_text}} "
      & "retrying_delivery {resendata: {time_text}} other {nuligita: "
      & "{time_text}}}");
   P ("label.notifications.digest_label",
      "resumo {name}: {count, plural, =0 {neniuj sciigoj} one {{count, "
      & "number} sciigo} other {{count, number} sciigoj}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {neniuj mencioj} one "
      & "{{count, number} mencio} other {{count, number} mencioj}}} reply_event "
      & "{{count, plural, =0 {neniuj respondoj} one {{count, number} respondo} "
      & "other {{count, number} respondoj}}} assignment_event {{count, plural, "
      & "=0 {neniuj asignoj} one {{count, number} asigno} other {{count, "
      & "number} asignoj}}} approval_event {{count, plural, =0 {neniuj "
      & "aprobpetoj} one {{count, number} aprobpeto} other {{count, number} "
      & "aprobpetoj}}} alert_event {{count, plural, =0 {neniuj alarmoj} one "
      & "{{count, number} alarmo} other {{count, number} alarmoj}}} "
      & "digest_event {{count, plural, =0 {neniuj resumoj} one {{count, number} "
      & "resumo} other {{count, number} resumoj}}} reminder_event {{count, "
      & "plural, =0 {neniuj memorigoj} one {{count, number} memorigo} other "
      & "{{count, number} memorigoj}}} other {{count, plural, =0 {neniuj "
      & "sistemaj sciigoj} one {{count, number} sistema sciigo} other {{count, "
      & "number} sistemaj sciigoj}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {marki sciigon kiel legitan} other {marki {count, "
      & "number} sciigojn kiel legitajn}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {marki sciigon kiel nelegitan} other {marki "
      & "{count, number} sciigojn kiel nelegitajn}}");
   P ("label.notifications.muted_label", "{name}: sciigoj silentigitaj");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nova mencio} reply_event {nova "
      & "respondo} assignment_event {nova asigno} approval_event {nova "
      & "aprobpeto} alert_event {nova alarmo} digest_event {nova resumo} "
      & "reminder_event {nova memorigo} other {nova sistema sciigo}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {en-aplikaĵaj sciigoj} email_channel "
      & "{retpoŝtaj sciigoj} sms_channel {SMS-sciigoj} push_channel "
      & "{puŝ-sciigoj} webhook_channel {retkroĉilaj sciigoj} other {resumaj "
      & "sciigoj}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {neniuj sciigoj} one {{count, number} sciigo} other "
      & "{{count, number} sciigoj}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {mencio} reply_event {respondo} "
      & "assignment_event {asigno} approval_event {aprobpeto} alert_event "
      & "{alarmo} digest_event {resumo} reminder_event {memorigo} other "
      & "{sistema sciigo}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {neniuj sciigoj} one {{count, number} "
      & "sciigo} other {{count, number} sciigoj}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {mencio} reply_event "
      & "{respondo} assignment_event {asigno} approval_event {aprobpeto} "
      & "alert_event {alarmo} digest_event {resumo} reminder_event {memorigo} "
      & "other {sistema sciigo}}, {state, select, unread_state {nelegita} "
      & "read_state {legita} archived_state {arkivita} muted_state "
      & "{silentigita} snoozed_state {prokrastita} other {subpremita}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {nelegita sciigo} read_state {legita "
      & "sciigo} archived_state {arkivita sciigo} muted_state {silentigita "
      & "sciigo} snoozed_state {prokrastita sciigo} other {subpremita sciigo}}");
   P ("label.notifications.snoozed_label", "{name}: sciigoj prokrastitaj");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {neniuj sciigoj subpremitaj} one {{count, number} "
      & "sciigo subpremita} other {{count, number} sciigoj subpremitaj}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {neniuj nelegitaj sciigoj} one {{count, number} "
      & "nelegita sciigo} other {{count, number} nelegitaj sciigoj}}");
   P ("label.payments.amount_label", "sumo: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "disputita pago: {amount_text}");
   P ("label.payments.discount_label", "rabato: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, pagenda je {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {neniuj fakturoj} one {{count, number} fakturo} "
      & "other {{count, number} fakturoj}}");
   P ("label.payments.invoice_label",
      "fakturo {number}: {state, select, draft_invoice {malneto} open_invoice "
      & "{nepagita} paid_invoice {pagita} overdue_invoice {posttempa} other "
      & "{nuligita}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {fakturmalneto} open_invoice {nepagita "
      & "fakturo} paid_invoice {pagita fakturo} overdue_invoice {posttempa "
      & "fakturo} other {nuligita fakturo}}");
   P ("label.payments.method_label",
      "{method, select, card_method {pagita per karto: {detail}} "
      & "bank_transfer_method {pagita per banka ĝiro: {detail}} cash_method "
      & "{pagita kontante: {detail}} wallet_method {pagita per elektronika "
      & "monujo: {detail}} check_method {pagita per ĉeko: {detail}} other "
      & "{pagita alimaniere: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}: pagita {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {neniuj pagoj} one {{count, number} pago} other "
      & "{{count, number} pagoj}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {pago traktata} "
      & "authorized_payment {pago rajtigita} paid_payment {pago plenumita} "
      & "failed_payment {pago malsukcesis} refunded_payment {pago repagita} "
      & "other {pago nuligita}}");
   P ("label.payments.payment_link_label", "{name}: pagligilo");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {karto} bank_transfer_method {banka "
      & "ĝiro} cash_method {kontanta mono} wallet_method {elektronika monujo} "
      & "check_method {ĉeko} other {alia maniero}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pago traktata} authorized_payment "
      & "{pago rajtigita} paid_payment {pago plenumita} failed_payment {pago "
      & "malsukcesis} refunded_payment {pago repagita} other {pago nuligita}}");
   P ("label.payments.receipt_label", "kvitanco {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {repago traktata} "
      & "authorized_payment {repago rajtigita} paid_payment {repago elpagita} "
      & "failed_payment {repago malsukcesis} refunded_payment {repago finita} "
      & "other {repago nuligita}}");
   P ("label.payments.subtotal_label", "subtotalo: {amount_text}");
   P ("label.payments.tax_label", "imposto: {amount_text}");
   P ("label.payments.total_label", "entute: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: aliro eksvalidiĝas {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {koncedita rolo de posedanto} "
      & "admin_role {koncedita rolo de administranto} editor_role {koncedita "
      & "rolo de redaktanto} viewer_role {koncedita rolo de rigardanto} other "
      & "{koncedita propra rolo}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {permesita} denied "
      & "{rifuzita} inherited {heredita} temporary {provizora aliro} expired "
      & "{eksvalidiĝis} other {bezonas aprobon}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {permesita} denied {rifuzita} inherited "
      & "{heredita} temporary {provizora aliro} expired {eksvalidiĝis} other "
      & "{bezonas aprobon}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {permesita de politiko} policy_denied "
      & "{rifuzita de politiko} policy_warning {politika averto} other "
      & "{politiko ne aplikebla}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {revokita rolo de posedanto} "
      & "admin_role {revokita rolo de administranto} editor_role {revokita rolo "
      & "de redaktanto} viewer_role {revokita rolo de rigardanto} other "
      & "{revokita propra rolo}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {posedanto} admin_role {administranto} "
      & "editor_role {redaktanto} viewer_role {rigardanto} other {propra rolo}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {malplena} low_utilization {malalta "
      & "ŝarĝo} normal_utilization {normala ŝarĝo} high_utilization {alta "
      & "ŝarĝo} critical_utilization {kritika ŝarĝo} full_utilization "
      & "{plena} other {super limo}}");
   P ("label.schema.array_shape_label",
      "tabelo de {element_type, select, string_field {ĉenoj} integer_field "
      & "{entjeroj} decimal_field {dekumaj nombroj} boolean_field {buleaj "
      & "valoroj} date_field {datoj} date_time_field {dato-horoj} object_field "
      & "{objektoj} array_field {tabeloj} enum_field {listigaj valoroj} "
      & "binary_field {duumaj valoroj} null_field {nulaj valoroj} any_field "
      & "{ajnaj valoroj} other {nekonataj valoroj}}{count_known, select, false "
      & "{} other {, elementoj: {count, number}}}");
   P ("label.schema.constraint_label", "{name}: limigo {value}");
   P ("label.schema.default_value_label", "kampo {field_name}: defaŭlte {value}");
   P ("label.schema.deprecated_field_label", "kampo {name} malrekomendita, uzu {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {{count, number} listiga opcio} other {{count, "
      & "number} listigaj opcioj}}");
   P ("label.schema.example_value_label", "kampo {field_name}: ekzemplo {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normala kampo} deprecated_field "
      & "{malrekomendita kampo} unknown_field {nekonata kampo} read_only_field "
      & "{nurlega kampo} write_only_field {nurskriba kampo} other {kalkulita "
      & "kampo}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {ĉena kampo} integer_field {entjera "
      & "kampo} decimal_field {dekuma kampo} boolean_field {bulea kampo} "
      & "date_field {data kampo} date_time_field {dato-hora kampo} object_field "
      & "{objekta kampo} array_field {tabela kampo} enum_field {listiga kampo} "
      & "binary_field {duuma kampo} null_field {nula kampo} any_field {ajna "
      & "kampo} other {kampo de nekonata tipo}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {neniuj mankantaj devigaj kampoj} one {{count, "
      & "number} mankanta deviga kampo} other {{count, number} mankantaj "
      & "devigaj kampoj}}");
   P ("label.schema.object_shape_label",
      "{fields, plural, one {objekto kun {fields, number} kampo} other "
      & "{objekto kun {fields, number} kampoj}}{required, plural, =0 {} one {, "
      & "{required, number} deviga} other {, {required, number} "
      & "devigaj}}{optional, plural, =0 {} one {, {optional, number} nedeviga} "
      & "other {, {optional, number} nedevigaj}}");
   P ("label.schema.schema_source_label", "skemo {name}, versio {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalara valoro} object_shape {{count, "
      & "plural, =0 {objekto} one {objekto kun {count, number} kampo} other "
      & "{objekto kun {count, number} kampoj}}} array_shape {{count, plural, =0 "
      & "{tabelo} one {tabelo kun {count, number} ero} other {tabelo kun "
      & "{count, number} eroj}}} map_shape {{count, plural, =0 {mapo} one {mapo "
      & "kun {count, number} enigo} other {mapo kun {count, number} enigoj}}} "
      & "tuple_shape {{count, plural, =0 {opo} one {opo kun {count, number} "
      & "ero} other {opo kun {count, number} eroj}}} union_shape {{count, "
      & "plural, =0 {unio} one {unio de {count, number} tipo} other {unio de "
      & "{count, number} tipoj}}} empty_shape {malplena formo} other {nekonata "
      & "formo}}");
   P ("label.schema.unknown_field_label", "nekonata kampo {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {neniuj aktivaj filtriloj} one {{count, number} "
      & "aktiva filtrilo} other {{count, number} aktivaj filtriloj}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {forigi filtrilojn} =1 {forigi la aktivan "
      & "filtrilon} one {forigi {count, number} aktivan filtrilon} other "
      & "{forigi {count, number} aktivajn filtrilojn}}");
   P ("label.search.facet_label",
      "faceto {name}, {count, plural, one {{count, number} elekteblo} other "
      & "{{count, number} elektebloj}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {neniuj rezultoj} one {{count, number} "
      & "rezulto} other {{count, number} rezultoj}}{selected, select, false {} "
      & "other {, elektita}}");
   P ("label.search.filter_label",
      "{state, select, active_filter {filtrilo {name}: {value}, aktiva} "
      & "inactive_filter {filtrilo {name}: {value}, neaktiva} other {filtrilo "
      & "{name}: ekskludi {value}}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktiva filtrilo} inactive_filter "
      & "{neaktiva filtrilo} other {ekskluda filtrilo}}");
   P ("label.search.no_results_label", "neniuj rezultoj por “{query}”");
   P ("label.search.recent_search_label", "lastatempa serĉo: “{query}”");
   P ("label.search.saved_search_label",
      "konservita serĉo: {name}{count, plural, =0 {} one {, {count, number} "
      & "rezulto} other {, {count, number} rezultoj}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {neniuj lastatempaj serĉoj} one {{count, number} "
      & "lastatempa serĉo} other {{count, number} lastatempaj serĉoj}}");
   P ("label.search.search_query_label", "serĉi “{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {neniuj rezultoj} one {{count, number} rezulto} "
      & "other {{count, number} rezultoj}}");
   P ("label.search.search_result_summary_label",
      "rezultoj por “{query}”: {count, plural, =0 {neniuj} one {{count, "
      & "number} rezulto} other {{count, number} rezultoj}}");
   P ("label.search.search_scope_label",
      "amplekso {name}: {count, plural, =0 {neniuj rezultoj} one {{count, "
      & "number} rezulto} other {{count, number} rezultoj}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {serĉo neaktiva} searching_search "
      & "{serĉante} complete_search {serĉo finita} empty_search {neniuj "
      & "serĉrezultoj} other {serĉo malsukcesis}}");
   P ("label.search.sort_label",
      "ordigo: {mode, select, relevance_sort {laŭ trafeco} ascending_sort "
      & "{kreskante} descending_sort {malkreskante} newest_first_sort {plej "
      & "novaj unue} other {plej malnovaj unue}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {laŭ trafeco} ascending_sort "
      & "{kreskante} descending_sort {malkreskante} newest_first_sort {plej "
      & "novaj unue} other {plej malnovaj unue}}");
   P ("label.search.suggestion_label", "ĉu vi celis “{query}”?");
   P ("label.secrets.credential_source_label", "aliraj datumoj el {source}: {count, number}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valoro kaŝita} masked_value {valoro "
      & "maskita} suffix_only {nur sufikso} other {nur fingrospuro}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {publika} support_profile {subtena} "
      & "audit_profile {kontrola} other {sencimiga}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotacio ne necesas{days_old, plural, "
      & "=0 {} one {, aĝo: {days_old, number} tago} other {, aĝo: {days_old, "
      & "number} tagoj}}} other {rotacio necesas{days_old, plural, =0 {} one {, "
      & "aĝo: {days_old, number} tago} other {, aĝo: {days_old, number} "
      & "tagoj}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-ŝlosilo} live_api_key {produktada "
      & "API-ŝlosilo} test_api_key {testa API-ŝlosilo} github_token "
      & "{GitHub-ĵetono} aws_access_key {AWS-alirŝlosilo} google_api_key "
      & "{Google-API-ŝlosilo} slack_token {Slack-ĵetono} npm_token "
      & "{npm-ĵetono} bearer_token {portanta ĵetono} jwt_token {JWT-ĵetono} "
      & "basic_auth_credential {Basic-Auth-aliraj datumoj} password_secret "
      & "{pasvorto} private_key {privata ŝlosilo} ssh_private_key {privata "
      & "SSH-ŝlosilo} webhook_secret {retkroĉila sekreto} oauth_token "
      & "{OAuth-ĵetono} database_url_secret {sekreto en datumbaza URL} "
      & "sha1_fingerprint {SHA-1-fingrospuro} sha256_fingerprint "
      & "{SHA-256-fingrospuro} other {sekreto}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {retpoŝto} phone_value {telefono} "
      & "url_value {URL} ip_address_value {IP-adreso} token_value {ĵetono} "
      & "file_path_value {dosiervojo} account_id_value {konta identigilo} "
      & "payment_reference_value {paga referenco} log_field_value {protokola "
      & "kampo} other {sentema valoro}}");
   P ("label.tables.cell_label",
      "vico {row, number}, kolumno {column, number}: {state, select, "
      & "empty_cell {malplena} edited_cell {redaktita} invalid_cell {nevalida} "
      & "highlighted_cell {emfazita} other {nur legebla}}");
   P ("label.tables.cell_position_label", "vico {row, number}, kolumno {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {malplena ĉelo} edited_cell {redaktita "
      & "ĉelo} invalid_cell {nevalida ĉelo} highlighted_cell {emfazita ĉelo} "
      & "other {nur legebla ĉelo}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {neniuj kolumnoj} one {{count, number} kolumno} "
      & "other {{count, number} kolumnoj}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {teksta kolumno} number_column "
      & "{nombra kolumno} date_column {data kolumno} status_column {stata "
      & "kolumno} action_column {aga kolumno} other {kaŝita kolumno}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {teksta kolumno} number_column {nombra "
      & "kolumno} date_column {data kolumno} status_column {stata kolumno} "
      & "action_column {aga kolumno} other {kaŝita kolumno}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {{count, number} vico} other {{count, "
      & "number} vicoj}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {neniuj vicoj} one {{count, number} vico} other "
      & "{{count, number} vicoj}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {neordigita} ascending_sort {kreskante} "
      & "other {malkreskante}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {neordigita} ascending_sort {ordigita "
      & "laŭ {column_name} kreskante} other {ordigita laŭ {column_name} "
      & "malkreskante}}");
   P ("label.tables.subtotal_label", "subsumo de {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} vico} other {{rows, number} vicoj}} "
      & "× {columns, plural, one {{columns, number} kolumno} other {{columns, "
      & "number} kolumnoj}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee}: malasignita} assigned "
      & "{asignita al {assignee}} reassigned {reasignita al {assignee}} "
      & "watching {{assignee} observas} other {{assignee} posedas la taskon}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {neasignita} assigned {asignita} reassigned "
      & "{reasignita} watching {observas} other {posedas la taskon}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {restolisto malplena} one {restolisto: {count, "
      & "number} tasko} other {restolisto: {count, number} taskoj}}");
   P ("label.tasks.blocker_label", "blokita de {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {fini la taskon} one {fini {count, number} taskon} "
      & "other {fini {count, number} taskojn}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {neniuj finitaj taskoj} one {{count, number} finita "
      & "tasko} other {{count, number} finitaj taskoj}}");
   P ("label.tasks.due_label", "limdato: {due_text}");
   P ("label.tasks.estimate_label", "taksita: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {neniuj malfermitaj taskoj} one {{count, number} "
      & "malfermita tasko} other {{count, number} malfermitaj taskoj}}");
   P ("label.tasks.overdue_label", "posttempa ekde {due_text}");
   P ("label.tasks.recurring_task_label", "ripetiĝas: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {remalfermi la taskon} one {remalfermi {count, "
      & "number} taskon} other {remalfermi {count, number} taskojn}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {{count, number} tasko} other {{count, "
      & "number} taskoj}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {{count, number} subtasko} other {{count, "
      & "number} subtaskoj}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {neniuj taskoj} one {{count, number} tasko} other "
      & "{{count, number} taskoj}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {malfermita} in_progress_task "
      & "{farata} blocked_task {blokita} done_task {farita} canceled_task "
      & "{nuligita} deferred_task {prokrastita} other {posttempa}}{priority, "
      & "select, no_priority {} low_priority {, malalta prioritato} "
      & "medium_priority {, meza prioritato} high_priority {, alta prioritato} "
      & "other {, kritika prioritato}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {sen prioritato} low_priority {malalta "
      & "prioritato} medium_priority {meza prioritato} high_priority {alta "
      & "prioritato} other {kritika prioritato}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {malfermita tasko} in_progress_task {farata "
      & "tasko} blocked_task {blokita tasko} done_task {farita tasko} "
      & "canceled_task {nuligita tasko} deferred_task {prokrastita tasko} other "
      & "{posttempa tasko}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {supra limo} other {malsupra limo}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {sub la atendata intervalo} within_range "
      & "{en la atendata intervalo} above_range {super la atendata intervalo} "
      & "below_target {sub la celo} at_target {ĉe la celo} above_target {super "
      & "la celo} near_limit {proksime al la limo} warning_level {avertosojlo} "
      & "critical_level {kritika sojlo} breached {sojlo transpasita} other "
      & "{nekonata sojla stato}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {ĝisdata} other {{ahead, "
      & "plural, one {{ahead, number} enmetaĵo antaŭe} other {{ahead, number} "
      & "enmetaĵoj antaŭe}}}}} other {{ahead, plural, =0 {{behind, plural, "
      & "one {{behind, number} enmetaĵo malantaŭe} other {{behind, number} "
      & "enmetaĵoj malantaŭe}}} other {{ahead, plural, one {{ahead, number} "
      & "enmetaĵo antaŭe} other {{ahead, number} enmetaĵoj antaŭe}}, "
      & "{behind, plural, one {{behind, number} enmetaĵo malantaŭe} other "
      & "{{behind, number} enmetaĵoj malantaŭe}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {aprobita de {approver}} other {atendas "
      & "aprobon de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {provo 1 el 1} other {provo "
      & "{attempt, number} el 1, limo transpasita}}} other {provo {attempt, "
      & "number} el {limit, number}}}");
   P ("label.workflows.blocker_label", "blokita: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {neniuj blokantaj dependaĵoj} one {{count, number} "
      & "blokanta dependaĵo} other {{count, number} blokantaj dependaĵoj}}");
   P ("label.workflows.handoff_label", "transdono de {from} al {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {venonta mejloŝtono} "
      & "current_milestone {nuna mejloŝtono} complete_milestone {atingita "
      & "mejloŝtono} missed_milestone {maltrafita mejloŝtono} other {blokita "
      & "mejloŝtono}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {venonta} current_milestone "
      & "{nuna} complete_milestone {atingita} missed_milestone {maltrafita} "
      & "other {blokita}}");
   P ("label.workflows.next_action_label", "poste: {action}");
   P ("label.workflows.owner_label", "posedanto: {owner}");
   P ("label.workflows.resume_label", "daŭrigi {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {pritraktota} active_step {aktiva} "
      & "waiting_step {atendanta} blocked_step {blokita} done_step {farita} "
      & "failed_step {malsukcesis} other {preterlasita}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {pritraktota} active_step "
      & "{aktiva} waiting_step {atendanta} blocked_step {blokita} done_step "
      & "{farita} failed_step {malsukcesis} other {preterlasita}}");
   P ("label.workflows.waiting_label", "atendas {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {ne komencita} "
      & "in_progress_state {farata} waiting_state {atendanta} "
      & "waiting_approval_state {atendas aprobon} blocked_state {blokita} "
      & "completed_state {finita} failed_state {malsukcesis} cancelled_state "
      & "{nuligita} skipped_state {preterlasita} other {paŭzigita}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {ne komencita} in_progress_state "
      & "{farata} waiting_state {atendanta} waiting_approval_state {atendas "
      & "aprobon} blocked_state {blokita} completed_state {finita} failed_state "
      & "{malsukcesis} cancelled_state {nuligita} skipped_state {preterlasita} "
      & "other {paŭzigita}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {travidebla} mostly_transparent "
      & "{plejparte travidebla} translucent {diafana} mostly_opaque {plejparte "
      & "opaka} other {opaka}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {neniuj observoj} one {1 observo, min. {minimum} "
      & "{unit}, mediano {median} {unit}, maks. {maximum} {unit}} other "
      & "{{count, number} observoj, min. {minimum} {unit}, mediano {median} "
      & "{unit}, maks. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {neniuj observoj} one {0 "
      & "eksterordinaraj valoroj el 1 observo} other {0 eksterordinaraj valoroj "
      & "el {total, number} observoj}}} one {{total, plural, one {1 "
      & "eksterordinara valoro el 1 observo} other {1 eksterordinara valoro el "
      & "{total, number} observoj}}} other {{outliers, number} eksterordinaraj "
      & "valoroj el {total, number} observoj}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {neniuj observoj} "
      & "sample_too_small_shape {specimeno tro malgranda por priskribi la "
      & "formon, {count, plural, one {1 observo} other {{count, number} "
      & "observoj}}} flat_shape {plata distribuo ĉe {median}} "
      & "outlier_heavy_shape {distribuo kun multaj eksterordinaraj valoroj "
      & "ĉirkaŭ {median}} volatile_shape {volatila distribuo ĉirkaŭ "
      & "{median}} clustered_shape {grupiĝinta distribuo ĉirkaŭ {median}} "
      & "wide_spread_shape {vaste disa distribuo} wide_spread_range {vaste disa "
      & "distribuo de {minimum} ĝis {maximum}} right_skewed_shape {dekstre "
      & "malsimetria distribuo, mediano {median}} left_skewed_shape {maldekstre "
      & "malsimetria distribuo, mediano {median}} other {plejparte ekvilibra "
      & "distribuo ĉirkaŭ {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {malplena retpoŝtadreso} address "
      & "{retpoŝtadreso} other {retpoŝto ĉe {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonnumero} redacted {telefonnumero kaŝita} "
      & "other {telefonnumero finiĝanta per {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {uzantnomo} other {uzantnomo {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodsimbolo} other {kodsimbolo {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adresaj metadatumoj: {present, plural, one {1 kampo ĉeestas} other "
      & "{{present, number} kampoj ĉeestas}}, {missing, plural, one {1 kampo "
      & "mankas} other {{missing, number} kampoj mankas}}");
   P ("label.endpoints.host_label", "{state, select, none {nekonata gastiganto} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {nekonata finpunkto} other {finpunkto "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {malplena URL} none {URL sen rekonitaj eroj} "
      & "other {URL kun {count, plural, one {1 ero} other {{count, number} "
      & "eroj}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {neniuj demandparametroj} one {1 demandparametro} "
      & "other {{count, number} demandparametroj}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {publika IPv4-adreso} ipv6_host "
      & "{publika IPv6-adreso} private_network_host {privatreta adreso} "
      & "localhost_host {loka gastiganto} other {ne IP-adreso}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: nevalida CIDR} other {{cidr}: {kind}, "
      & "retprefikso {prefix}}}");
   P ("label.resources.utilization_label", "{used, number} el {total, number} {unit} uzataj ({percent}, {band})");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} super la kapacito} other "
      & "{restas {count, number} el {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvoto superita je {count, number} {unit} "
      & "({percent} uzita)} near {kvoto preskaŭ atingita: restas {count, "
      & "number} {unit} ({percent} uzita)} other {kvoto disponebla: restas "
      & "{count, number} {unit} ({percent} uzita)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {kaŝmemora trafoproporcio ne disponebla: neniuj "
      & "petoj} other {kaŝmemora trafoproporcio {percent}: {hits, plural, one "
      & "{1 trafo} other {{hits, number} trafoj}}, {misses, plural, one {1 "
      & "maltrafo} other {{misses, number} maltrafoj}}}}");
   P ("label.resources.saturation_label", "{named, select, no {rimedo} other {{name}}} {percent} {band}");
   P ("label.versions.version_label",
      "{state, select, both {versio {version}, antaŭeldono {prerelease}, "
      & "kompilo {build}} prerelease {versio {version}, antaŭeldono "
      & "{prerelease}} build {versio {version}, kompilo {build}} other {versio "
      & "{version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {sama versio} major_upgrade {ĉefa "
      & "ĝisdatigo} minor_upgrade {malĉefa ĝisdatigo} patch_upgrade {flika "
      & "ĝisdatigo} prerelease_change {ŝanĝo de antaŭeldono} "
      & "build_metadata_change {ŝanĝo de kompilaj metadatumoj} downgrade "
      & "{malaltigo de versio} other {nekonata versiŝanĝo}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {ekzakte versio {version}} minimum_range "
      & "{versio {version} aŭ pli nova} maximum_range {versio {version} aŭ "
      & "pli malnova} major_compatible_range {kongrua kun ĉefa versio "
      & "{version}} minor_compatible_range {kongrua kun malĉefa versio "
      & "{version}} other {versiintervalo {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {komenca evolua eldono {version}} prerelease "
      & "{antaŭeldono {version}} major {ĉefa eldono {version}} minor "
      & "{malĉefa eldono {version}} other {flika eldono {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {ligila etikedo} image {bilda etikedo} paragraph "
      & "{paragrafa etikedo} ordered_list {etikedo de numerita listo} "
      & "unordered_list {etikedo de nenumerita listo} list_item {etikedo de "
      & "listero} table_header_cell {etikedo de tabela kapĉelo} table_cell "
      & "{etikedo de tabelĉelo} table_row {etikedo de tabelvico} line_break "
      & "{etikedo de linisalto} thematic_break {etikedo de tema paŭzo} "
      & "heading_level_n {etikedo de titolnivelo {level, number}} other "
      & "{etikedo {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atributo {name}} event {eventotraktila atributo "
      & "{name}} other {atributo {name} agordita al “{value}”}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 atributo} other {{count, number} atributoj}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data-atributo} other {{count, number} "
      & "data-atributoj}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA-atributo} other {{count, number} "
      & "ARIA-atributoj}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 eventotraktilo} other {{count, number} "
      & "eventotraktiloj}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {teksta enhavo} html_content "
      & "{HTML-dokumento} json_content {JSON-dokumento} xml_content "
      & "{XML-dokumento} image_content {bilda enhavo} audio_content {sona "
      & "enhavo} video_content {videa enhavo} font_content {tipara enhavo} "
      & "archive_content {arkiva enhavo} binary_content {duuma enhavo} "
      & "form_content {formulara sendo} other {nekonata enhavo}} ({base})");
   P ("label.markup.heading_label", "titola nivelo {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 etikedo} other {{count, number} etikedoj}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 ligilo} other {{count, number} ligiloj}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 aŭdvida elemento} other {{count, number} "
      & "aŭdvidaj elementoj}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 formulara regilo} other {{count, number} "
      & "formularaj regiloj}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {1 titolo} other {{count, number} titoloj}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 orientilo} other {{count, number} orientiloj}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {1 formularo} other {{count, number} formularoj}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 aŭdvida elemento} other {{count, number} "
      & "aŭdvidaj elementoj}}");
   P ("label.markup.table_navigation_label",
      "{caption} vico {row, number} el {rows, number}, kolumno {column, "
      & "number} el {columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} ne agordita} hidden_value {{kind} "
      & "kaŝita} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "fingrospuro finiĝanta per {shown}} other {{kind} finiĝanta per "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} ne agordita} other {{name} {kind} "
      & "finiĝanta per {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {aŭtentiga kaplinio {name} ne agordita} other "
      & "{{name} {kind} finiĝanta per {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-fingrospuro finiĝanta per {shown}");
   P ("label.secrets.secret_count_label.total", "{count, plural, one {1 sekreto} other {{count, number} sekretoj}}");
   P ("label.secrets.secret_count_label.masked", "{count, plural, one {1 maskita} other {{count, number} maskitaj}}");
   P ("label.secrets.secret_count_label.unset",
      "{count, plural, one {1 neagordita} other {{count, number} "
      & "neagorditaj}}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {1 fingrospuro} other {{count, number} "
      & "fingrospuroj}}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} ne agordita} redacted {{label} "
      & "kaŝita} url_redacted {URL kaŝita} ip_redacted {IP-adreso kaŝita} "
      & "path_ending {dosiervojo finiĝanta per {shown}} at {{label} ĉe "
      & "{shown}} audit {{label}, longo {length, number}, finiĝanta per "
      & "{shown}} debug {{label} {shown}} other {{label} finiĝanta per "
      & "{shown}}}");
end Labels_2;
