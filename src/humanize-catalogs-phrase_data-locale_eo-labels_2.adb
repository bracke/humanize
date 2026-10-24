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
      & "read_state {legita} archived_state {arĥivita} muted_state "
      & "{silentigita} snoozed_state {prokrastita} other {subpremita}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {nelegita sciigo} read_state {legita "
      & "sciigo} archived_state {arĥivita sciigo} muted_state {silentigita "
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
end Labels_2;
