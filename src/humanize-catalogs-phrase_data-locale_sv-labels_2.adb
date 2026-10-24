separate (Humanize.Catalogs.Phrase_Data.Locale_Sv)
procedure Labels_2 is
begin
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {länk} menu_item {menyalternativ} tab_item "
      & "{flik} breadcrumb_item {brödsmula} section_item {avsnitt} other "
      & "{avgränsare}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, menu_item {menyalternativ, {state, select, "
      & "current_item {aktuellt} active_item {aktivt} inactive_item {inaktivt} "
      & "disabled_item {inaktiverat} expanded_item {expanderat} collapsed_item "
      & "{komprimerat} visited_item {besökt} other {externt}}} section_item "
      & "{avsnitt, {state, select, current_item {aktuellt} active_item {aktivt} "
      & "inactive_item {inaktivt} disabled_item {inaktiverat} expanded_item "
      & "{expanderat} collapsed_item {komprimerat} visited_item {besökt} other "
      & "{externt}}} other {{kind, select, link_item {länk} tab_item {flik} "
      & "breadcrumb_item {brödsmula} other {avgränsare}}, {state, select, "
      & "current_item {aktuell} active_item {aktiv} inactive_item {inaktiv} "
      & "disabled_item {inaktiverad} expanded_item {expanderad} collapsed_item "
      & "{komprimerad} visited_item {besökt} other {extern}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {aktuell} active_item {aktiv} "
      & "inactive_item {inaktiv} disabled_item {inaktiverad} expanded_item "
      & "{expanderad} collapsed_item {komprimerad} visited_item {besökt} other "
      & "{extern}}");
   P ("label.navigation.next_label", "nästa: {target}");
   P ("label.navigation.section_state_label",
      "{name}: avsnitt {expanded, select, false {komprimerat} other "
      & "{expanderat}}{count, plural, =0 {} one {, 1 objekt} other {, {count, "
      & "number} objekt}}");
   P ("label.navigation.skip_link_label", "hoppa till {target}");
   P ("label.navigation.submenu_label",
      "{name}: undermeny, {count, plural, one {1 objekt} other {{count, "
      & "number} objekt}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {alla larm} important_alerts {viktiga larm} "
      & "critical_alerts_only {endast kritiska larm} other {inga larm}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: aviseringar {state, select, preference_enabled {aktiverade} "
      & "preference_disabled {inaktiverade} preference_inherited {ärvda} other "
      & "{obligatoriska}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {ingen sammanfattning} instant_digest "
      & "{omedelbar sammanfattning} daily_digest {daglig sammanfattning} other "
      & "{veckosammanfattning}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {aktiverad} preference_disabled "
      & "{inaktiverad} preference_inherited {ärvd} other {obligatorisk}}");
   P ("label.notification_preferences.quiet_hours_label", "tysta timmar: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {trådprenumeration} "
      & "project_subscription {projektprenumeration} team_subscription "
      & "{teamprenumeration} other {kontoprenumeration}} {state, select, "
      & "preference_enabled {aktiverad} preference_disabled {inaktiverad} "
      & "preference_inherited {ärvd} other {obligatorisk}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {trådprenumeration} "
      & "project_subscription {projektprenumeration} team_subscription "
      & "{teamprenumeration} other {kontoprenumeration}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} nämnde dig} reply_event "
      & "{{actor} svarade} assignment_event {{actor} tilldelade dig något} "
      & "approval_event {{actor} begärde godkännande} alert_event {{actor} "
      & "skickade ett larm} digest_event {{actor} skickade en sammanfattning} "
      & "reminder_event {{actor} skickade en påminnelse} other {{actor} "
      & "skickade en systemavisering}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {avisering i appen} email_channel "
      & "{e-postavisering} sms_channel {sms-avisering} push_channel "
      & "{push-avisering} webhook_channel {webhook-avisering} other "
      & "{sammanfattningsavisering}}: {state, select, pending_delivery "
      & "{väntar} sent_delivery {skickad} delivered_delivery {levererad} "
      & "failed_delivery {misslyckades} retrying_delivery {nytt försök "
      & "pågår} other {avbruten}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {väntande avisering} sent_delivery "
      & "{skickad avisering} delivered_delivery {levererad avisering} "
      & "failed_delivery {misslyckad avisering} retrying_delivery {avisering "
      & "skickas igen} other {avbruten avisering}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {väntar {time_text}} sent_delivery "
      & "{skickad {time_text}} delivered_delivery {levererad {time_text}} "
      & "failed_delivery {misslyckades {time_text}} retrying_delivery {nytt "
      & "försök {time_text}} other {avbruten {time_text}}}");
   P ("label.notifications.digest_label",
      "sammanfattning {name}: {count, plural, =0 {inga aviseringar} one {1 "
      & "avisering} other {{count, number} aviseringar}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {inga omnämnanden} "
      & "one {1 omnämnande} other {{count, number} omnämnanden}}} reply_event "
      & "{{count, plural, =0 {inga svar} one {1 svar} other {{count, number} "
      & "svar}}} assignment_event {{count, plural, =0 {inga tilldelningar} one "
      & "{1 tilldelning} other {{count, number} tilldelningar}}} approval_event "
      & "{{count, plural, =0 {inga godkännandebegäranden} one {1 "
      & "godkännandebegäran} other {{count, number} "
      & "godkännandebegäranden}}} alert_event {{count, plural, =0 {inga larm} "
      & "one {1 larm} other {{count, number} larm}}} digest_event {{count, "
      & "plural, =0 {inga sammanfattningar} one {1 sammanfattning} other "
      & "{{count, number} sammanfattningar}}} reminder_event {{count, plural, "
      & "=0 {inga påminnelser} one {1 påminnelse} other {{count, number} "
      & "påminnelser}}} other {{count, plural, =0 {inga systemaviseringar} one "
      & "{1 systemavisering} other {{count, number} systemaviseringar}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {markera aviseringen som läst} other {markera "
      & "{count, number} aviseringar som lästa}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {markera aviseringen som oläst} other {markera "
      & "{count, number} aviseringar som olästa}}");
   P ("label.notifications.muted_label", "{name}: aviseringar ljudlösa");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nytt omnämnande} reply_event {nytt "
      & "svar} assignment_event {ny tilldelning} approval_event {nytt "
      & "godkännande} alert_event {nytt larm} digest_event {ny sammanfattning} "
      & "reminder_event {ny påminnelse} other {ny systemavisering}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {aviseringar i appen} email_channel "
      & "{e-postaviseringar} sms_channel {sms-aviseringar} push_channel "
      & "{push-aviseringar} webhook_channel {webhook-aviseringar} other "
      & "{sammanfattningsaviseringar}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {inga aviseringar} one {1 avisering} other {{count, "
      & "number} aviseringar}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {omnämnande} reply_event {svar} "
      & "assignment_event {tilldelning} approval_event {godkännande} "
      & "alert_event {larm} digest_event {sammanfattning} reminder_event "
      & "{påminnelse} other {systemavisering}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {inga aviseringar} one {1 avisering} other "
      & "{{count, number} aviseringar}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {omnämnande, {state, select, "
      & "unread_state {oläst} read_state {läst} archived_state {arkiverat} "
      & "muted_state {ljudlöst} snoozed_state {snoozat} other {undertryckt}}} "
      & "reply_event {svar, {state, select, unread_state {oläst} read_state "
      & "{läst} archived_state {arkiverat} muted_state {ljudlöst} "
      & "snoozed_state {snoozat} other {undertryckt}}} approval_event "
      & "{godkännande, {state, select, unread_state {oläst} read_state "
      & "{läst} archived_state {arkiverat} muted_state {ljudlöst} "
      & "snoozed_state {snoozat} other {undertryckt}}} alert_event {larm, "
      & "{state, select, unread_state {oläst} read_state {läst} "
      & "archived_state {arkiverat} muted_state {ljudlöst} snoozed_state "
      & "{snoozat} other {undertryckt}}} other {{event, select, "
      & "assignment_event {tilldelning} digest_event {sammanfattning} "
      & "reminder_event {påminnelse} other {systemavisering}}, {state, select, "
      & "unread_state {oläst} read_state {läst} archived_state {arkiverad} "
      & "muted_state {ljudlös} snoozed_state {snoozad} other {undertryckt}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {oläst avisering} read_state {läst "
      & "avisering} archived_state {arkiverad avisering} muted_state {ljudlös "
      & "avisering} snoozed_state {snoozad avisering} other {undertryckt "
      & "avisering}}");
   P ("label.notifications.snoozed_label", "{name}: aviseringar snoozade");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {inga aviseringar undertryckta} one {1 avisering "
      & "undertryckt} other {{count, number} aviseringar undertryckta}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {inga olästa aviseringar} one {1 oläst avisering} "
      & "other {{count, number} olästa aviseringar}}");
   P ("label.payments.amount_label", "belopp: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "återkrav: {amount_text}");
   P ("label.payments.discount_label", "rabatt: {amount_text}");
   P ("label.payments.due_label", "{amount_text} förfaller {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {inga fakturor} one {1 faktura} other {{count, "
      & "number} fakturor}}");
   P ("label.payments.invoice_label",
      "faktura {number}: {state, select, draft_invoice {utkast} open_invoice "
      & "{öppen} paid_invoice {betald} overdue_invoice {förfallen} other "
      & "{makulerad}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {fakturautkast} open_invoice {öppen "
      & "faktura} paid_invoice {betald faktura} overdue_invoice {förfallen "
      & "faktura} other {makulerad faktura}}");
   P ("label.payments.method_label",
      "{method, select, card_method {betalt med kort: {detail}} "
      & "bank_transfer_method {betalt med banköverföring: {detail}} "
      & "cash_method {betalt kontant: {detail}} wallet_method {betalt med "
      & "digital plånbok: {detail}} check_method {betalt med check: {detail}} "
      & "other {betalt på annat sätt: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} betalt {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {inga betalningar} one {1 betalning} other {{count, "
      & "number} betalningar}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {betalning väntar} "
      & "authorized_payment {betalning auktoriserad} paid_payment {betald} "
      & "failed_payment {betalningen misslyckades} refunded_payment "
      & "{återbetald} other {betalning avbruten}}");
   P ("label.payments.payment_link_label", "betalningslänk: {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kort} bank_transfer_method "
      & "{banköverföring} cash_method {kontant} wallet_method {digital "
      & "plånbok} check_method {check} other {annat}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {väntande betalning} "
      & "authorized_payment {auktoriserad betalning} paid_payment {genomförd "
      & "betalning} failed_payment {misslyckad betalning} refunded_payment "
      & "{återbetald betalning} other {avbruten betalning}}");
   P ("label.payments.receipt_label", "kvitto {number}");
   P ("label.payments.refund_label",
      "{amount_text}: återbetalning {state, select, pending_payment "
      & "{väntar} authorized_payment {auktoriserad} paid_payment {utbetald} "
      & "failed_payment {misslyckades} refunded_payment {genomförd} other "
      & "{avbruten}}");
   P ("label.payments.subtotal_label", "delsumma: {amount_text}");
   P ("label.payments.tax_label", "skatt: {amount_text}");
   P ("label.payments.total_label", "totalt: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: åtkomsten upphör {time_text}");
   P ("label.permissions.grant_label",
      "{role, select, owner_role {{subject} tilldelades rollen ägare} "
      & "admin_role {{subject} tilldelades rollen administratör} editor_role "
      & "{{subject} tilldelades rollen redigerare} viewer_role {{subject} "
      & "tilldelades rollen läsare} other {{subject} tilldelades en anpassad "
      & "roll}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {beviljad} denied {nekad} "
      & "inherited {ärvd} temporary {tillfällig åtkomst} expired {utgången} "
      & "other {kräver godkännande}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {beviljad} denied {nekad} inherited {ärvd} "
      & "temporary {tillfällig åtkomst} expired {utgången} other {kräver "
      & "godkännande}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {tillåten enligt policy} "
      & "policy_denied {nekad enligt policy} policy_warning {policyvarning} "
      & "other {policyn gäller inte}}");
   P ("label.permissions.revoke_label",
      "{role, select, owner_role {{subject} fråntogs rollen ägare} "
      & "admin_role {{subject} fråntogs rollen administratör} editor_role "
      & "{{subject} fråntogs rollen redigerare} viewer_role {{subject} "
      & "fråntogs rollen läsare} other {{subject} fråntogs en anpassad "
      & "roll}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {ägare} admin_role {administratör} "
      & "editor_role {redigerare} viewer_role {läsare} other {anpassad roll}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {tom} low_utilization {låg "
      & "användning} normal_utilization {normal användning} high_utilization "
      & "{hög användning} critical_utilization {kritisk användning} "
      & "full_utilization {full} other {över gränsen}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {array med {element_type, select, "
      & "string_field {strängar} integer_field {heltal} decimal_field "
      & "{decimaltal} boolean_field {booleska värden} date_field {datum} "
      & "date_time_field {tidpunkter} object_field {objekt} array_field "
      & "{arrayer} enum_field {uppräkningsvärden} binary_field {binära "
      & "värden} null_field {null-värden} any_field {värden av valfri typ} "
      & "other {okända värden}}} other {{count, plural, one {array med 1 "
      & "{element_type, select, string_field {sträng} integer_field {heltal} "
      & "decimal_field {decimaltal} boolean_field {booleskt värde} date_field "
      & "{datum} date_time_field {tidpunkt} object_field {objekt} array_field "
      & "{array} enum_field {uppräkningsvärde} binary_field {binärt värde} "
      & "null_field {null-värde} any_field {värde av valfri typ} other "
      & "{okänt värde}}} other {array med {count, number} {element_type, "
      & "select, string_field {strängar} integer_field {heltal} decimal_field "
      & "{decimaltal} boolean_field {booleska värden} date_field {datum} "
      & "date_time_field {tidpunkter} object_field {objekt} array_field "
      & "{arrayer} enum_field {uppräkningsvärden} binary_field {binära "
      & "värden} null_field {null-värden} any_field {värden av valfri typ} "
      & "other {okända värden}}}}}}");
   P ("label.schema.constraint_label", "begränsning {name}: {value}");
   P ("label.schema.default_value_label", "fältet {field_name} har standardvärdet {value}");
   P ("label.schema.deprecated_field_label", "fältet {name} är föråldrat, använd {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 uppräkningsalternativ} other {{count, number} "
      & "uppräkningsalternativ}}");
   P ("label.schema.example_value_label", "fältet {field_name}, exempel: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normalt fält} deprecated_field "
      & "{föråldrat fält} unknown_field {okänt fält} read_only_field "
      & "{skrivskyddat fält} write_only_field {endast skrivbart fält} other "
      & "{beräknat fält}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {strängfält} integer_field "
      & "{heltalsfält} decimal_field {decimalfält} boolean_field {booleskt "
      & "fält} date_field {datumfält} date_time_field {tidpunktsfält} "
      & "object_field {objektfält} array_field {arrayfält} enum_field "
      & "{uppräkningsfält} binary_field {binärt fält} null_field "
      & "{null-fält} any_field {fält av valfri typ} other {fält av okänd "
      & "typ}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {inga obligatoriska fält saknas} one {1 "
      & "obligatoriskt fält saknas} other {{count, number} obligatoriska fält "
      & "saknas}}");
   P ("label.schema.object_shape_label",
      "objekt med {fields, plural, one {1 fält} other {{fields, number} "
      & "fält}}{required, plural, =0 {} one {, 1 obligatoriskt} other {, "
      & "{required, number} obligatoriska}}{optional, plural, =0 {} one {, 1 "
      & "valfritt} other {, {optional, number} valfria}}");
   P ("label.schema.schema_source_label", "schema {name}, version {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalärt värde} object_shape {{count, "
      & "plural, =0 {objekt} one {objekt med 1 fält} other {objekt med {count, "
      & "number} fält}}} array_shape {{count, plural, =0 {array} one {array "
      & "med 1 element} other {array med {count, number} element}}} map_shape "
      & "{{count, plural, =0 {mappning} one {mappning med 1 post} other "
      & "{mappning med {count, number} poster}}} tuple_shape {{count, plural, "
      & "=0 {tupel} one {tupel med 1 element} other {tupel med {count, number} "
      & "element}}} union_shape {{count, plural, =0 {union} one {union av 1 "
      & "typ} other {union av {count, number} typer}}} empty_shape {tom "
      & "struktur} other {okänd struktur}}");
   P ("label.schema.unknown_field_label", "okänt fält {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {inga aktiva filter} one {1 aktivt filter} other "
      & "{{count, number} aktiva filter}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {rensa filter} one {rensa aktivt filter} other "
      & "{rensa {count, number} aktiva filter}}");
   P ("label.search.facet_label",
      "{name}-facett, {count, plural, one {1 alternativ} other {{count, "
      & "number} alternativ}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {inga resultat} one {1 resultat} other "
      & "{{count, number} resultat}}{selected, select, false {} other {, vald}}");
   P ("label.search.filter_label",
      "{name}: {value} ({state, select, active_filter {aktivt filter} "
      & "inactive_filter {inaktivt filter} other {exkluderande filter}})");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktivt filter} inactive_filter "
      & "{inaktivt filter} other {exkluderande filter}}");
   P ("label.search.no_results_label", "inga resultat för ”{query}”");
   P ("label.search.recent_search_label", "senaste sökning: ”{query}”");
   P ("label.search.saved_search_label",
      "sparad sökning: {name}{count, plural, =0 {} one {, 1 resultat} other "
      & "{, {count, number} resultat}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {inga senaste sökningar} one {1 senaste sökning} "
      & "other {{count, number} senaste sökningar}}");
   P ("label.search.search_query_label", "sök efter ”{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {inga resultat} one {1 resultat} other {{count, "
      & "number} resultat}}");
   P ("label.search.search_result_summary_label",
      "resultat för ”{query}”: {count, plural, =0 {inga resultat} one {1 "
      & "resultat} other {{count, number} resultat}}");
   P ("label.search.search_scope_label",
      "sökomfång {name}, {count, plural, =0 {inga resultat} one {1 "
      & "resultat} other {{count, number} resultat}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {sökning inaktiv} searching_search "
      & "{söker} complete_search {sökningen klar} empty_search {inga "
      & "sökresultat} other {sökningen misslyckades}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {sortera efter relevans} ascending_sort "
      & "{sortera stigande} descending_sort {sortera fallande} "
      & "newest_first_sort {sortera med nyaste först} other {sortera med "
      & "äldsta först}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevans} ascending_sort {stigande} "
      & "descending_sort {fallande} newest_first_sort {nyaste först} other "
      & "{äldsta först}}");
   P ("label.search.suggestion_label", "menade du ”{query}”?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 autentiseringsuppgift} other {{count, number} "
      & "autentiseringsuppgifter}} från {source}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {värdet dolt} masked_value {värdet "
      & "maskerat} suffix_only {endast suffix} other {endast fingeravtryck}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {offentlig} support_profile {support} "
      & "audit_profile {granskning} other {felsökning}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotation krävs inte} other {rotation "
      & "krävs}}{days_old, plural, =0 {} one {, 1 dag gammal} other {, "
      & "{days_old, number} dagar gammal}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-nyckel} live_api_key {API-nyckel för "
      & "produktion} test_api_key {API-nyckel för test} github_token "
      & "{GitHub-token} aws_access_key {AWS-åtkomstnyckel} google_api_key "
      & "{Google API-nyckel} slack_token {Slack-token} npm_token {npm-token} "
      & "bearer_token {bearer-token} jwt_token {JWT-token} "
      & "basic_auth_credential {Basic Auth-uppgift} password_secret {lösenord} "
      & "private_key {privat nyckel} ssh_private_key {privat SSH-nyckel} "
      & "webhook_secret {webhook-hemlighet} oauth_token {OAuth-token} "
      & "database_url_secret {databas-URL-hemlighet} sha1_fingerprint "
      & "{SHA-1-fingeravtryck} sha256_fingerprint {SHA-256-fingeravtryck} other "
      & "{hemlighet}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-post} phone_value {telefon} url_value "
      & "{URL} ip_address_value {IP-adress} token_value {token} file_path_value "
      & "{filsökväg} account_id_value {konto-ID} payment_reference_value "
      & "{betalningsreferens} log_field_value {loggfält} other {känsligt "
      & "värde}}");
   P ("label.tables.cell_label",
      "rad {row, number}, kolumn {column, number}, {state, select, empty_cell "
      & "{tom} edited_cell {redigerad} invalid_cell {ogiltig} highlighted_cell "
      & "{markerad} other {skrivskyddad}}");
   P ("label.tables.cell_position_label", "rad {row, number}, kolumn {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {tom cell} edited_cell {redigerad cell} "
      & "invalid_cell {ogiltig cell} highlighted_cell {markerad cell} other "
      & "{skrivskyddad cell}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {inga kolumner} one {1 kolumn} other {{count, "
      & "number} kolumner}}");
   P ("label.tables.column_label",
      "{name} ({role, select, text_column {textkolumn} number_column "
      & "{sifferkolumn} date_column {datumkolumn} status_column {statuskolumn} "
      & "action_column {åtgärdskolumn} other {dold kolumn}})");
   P ("label.tables.column_role_label",
      "{role, select, text_column {textkolumn} number_column {sifferkolumn} "
      & "date_column {datumkolumn} status_column {statuskolumn} action_column "
      & "{åtgärdskolumn} other {dold kolumn}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 rad} other {{count, number} rader}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {inga rader} one {1 rad} other {{count, number} "
      & "rader}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {osorterad} ascending_sort {stigande} "
      & "other {fallande}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {osorterad} ascending_sort {sorterad "
      & "efter {column_name}, stigande} other {sorterad efter {column_name}, "
      & "fallande}}");
   P ("label.tables.subtotal_label", "delsumma {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 rad} other {{rows, number} rader}} × {columns, "
      & "plural, one {1 kolumn} other {{columns, number} kolumner}}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {inte tilldelad} assigned "
      & "{tilldelad} reassigned {omtilldelad} watching {bevakar} other {äger "
      & "uppgiften}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {inte tilldelad} assigned {tilldelad} "
      & "reassigned {omtilldelad} watching {bevakar} other {äger uppgiften}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {tom backlogg} one {backlogg: 1 uppgift} other "
      & "{backlogg: {count, number} uppgifter}}");
   P ("label.tasks.blocker_label", "blockerad av {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {slutför uppgiften} other {slutför {count, "
      & "number} uppgifter}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {inga slutförda uppgifter} one {1 slutförd "
      & "uppgift} other {{count, number} slutförda uppgifter}}");
   P ("label.tasks.due_label", "förfaller {due_text}");
   P ("label.tasks.estimate_label", "uppskattat {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {inga öppna uppgifter} one {1 öppen uppgift} "
      & "other {{count, number} öppna uppgifter}}");
   P ("label.tasks.overdue_label", "försenad sedan {due_text}");
   P ("label.tasks.recurring_task_label", "upprepas {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {öppna uppgiften igen} other {öppna {count, "
      & "number} uppgifter igen}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 uppgift} other {{count, number} "
      & "uppgifter}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 deluppgift} other {{count, number} "
      & "deluppgifter}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {inga uppgifter} one {1 uppgift} other {{count, "
      & "number} uppgifter}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {öppen uppgift} in_progress_task "
      & "{pågående uppgift} blocked_task {blockerad uppgift} done_task {klar "
      & "uppgift} canceled_task {avbruten uppgift} deferred_task {uppskjuten "
      & "uppgift} other {försenad uppgift}}{priority, select, no_priority {} "
      & "low_priority {, låg prioritet} medium_priority {, medelhög "
      & "prioritet} high_priority {, hög prioritet} other {, kritisk "
      & "prioritet}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {ingen prioritet} low_priority {låg "
      & "prioritet} medium_priority {medelhög prioritet} high_priority {hög "
      & "prioritet} other {kritisk prioritet}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {öppen uppgift} in_progress_task "
      & "{pågående uppgift} blocked_task {blockerad uppgift} done_task {klar "
      & "uppgift} canceled_task {avbruten uppgift} deferred_task {uppskjuten "
      & "uppgift} other {försenad uppgift}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {övre gräns} other {nedre gräns}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {under förväntat intervall} within_range "
      & "{inom förväntat intervall} above_range {över förväntat intervall} "
      & "below_target {under målet} at_target {vid målet} above_target {över "
      & "målet} near_limit {nära gränsen} warning_level {varningströskel} "
      & "critical_level {kritisk tröskel} breached {överskriden} other "
      & "{okänd tröskelstatus}}");
   P ("label.versions.commit_distance_label",
      "{ahead, plural, =0 {{behind, plural, =0 {aktuell} one {1 commit efter} "
      & "other {{behind, number} commits efter}}} one {1 commit före{behind, "
      & "plural, =0 {} one {, 1 commit efter} other {, {behind, number} commits "
      & "efter}}} other {{ahead, number} commits före{behind, plural, =0 {} "
      & "one {, 1 commit efter} other {, {behind, number} commits efter}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {godkänd av {approver}} other {väntar på "
      & "godkännande från {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {försök 1 av 1} other "
      & "{försök {attempt, number} av 1 – gränsen överskriden}}} other "
      & "{försök {attempt, number} av {limit, number}}}");
   P ("label.workflows.blocker_label", "blockerad: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {inga blockerande beroenden} one {1 blockerande "
      & "beroende} other {{count, number} blockerande beroenden}}");
   P ("label.workflows.handoff_label", "överlämning från {from} till {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {kommande milstolpe} "
      & "current_milestone {aktuell milstolpe} complete_milestone {uppnådd "
      & "milstolpe} missed_milestone {missad milstolpe} other {blockerad "
      & "milstolpe}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {kommande} "
      & "current_milestone {aktuell} complete_milestone {uppnådd} "
      & "missed_milestone {missad} other {blockerad}}");
   P ("label.workflows.next_action_label", "nästa: {action}");
   P ("label.workflows.owner_label", "ägs av {owner}");
   P ("label.workflows.resume_label", "återuppta {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {väntar} active_step {aktiv} "
      & "waiting_step {avvaktar} blocked_step {blockerad} done_step {klar} "
      & "failed_step {misslyckades} other {överhoppad}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {väntar} active_step {aktiv} "
      & "waiting_step {avvaktar} blocked_step {blockerad} done_step {klar} "
      & "failed_step {misslyckades} other {överhoppad}}");
   P ("label.workflows.waiting_label", "väntar på {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {inte startad} "
      & "in_progress_state {pågår} waiting_state {väntar} "
      & "waiting_approval_state {väntar på godkännande} blocked_state "
      & "{blockerad} completed_state {slutförd} failed_state {misslyckades} "
      & "cancelled_state {avbruten} skipped_state {överhoppad} other {pausad}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {inte startad} in_progress_state "
      & "{pågår} waiting_state {väntar} waiting_approval_state {väntar på "
      & "godkännande} blocked_state {blockerad} completed_state {slutförd} "
      & "failed_state {misslyckades} cancelled_state {avbruten} skipped_state "
      & "{överhoppad} other {pausad}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {genomskinlig} "
      & "mostly_transparent {mestadels genomskinlig} translucent "
      & "{halvgenomskinlig} mostly_opaque {mestadels ogenomskinlig} other "
      & "{ogenomskinlig}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {inga observationer} one {1 observation, min "
      & "{minimum} {unit}, median {median} {unit}, max {maximum} {unit}} other "
      & "{{count, number} observationer, min {minimum} {unit}, median {median} "
      & "{unit}, max {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {inga observationer} one {0 "
      & "avvikare av 1 observation} other {0 avvikare av {total, number} "
      & "observationer}}} one {{total, plural, one {1 avvikare av 1 "
      & "observation} other {1 avvikare av {total, number} observationer}}} "
      & "other {{outliers, number} avvikare av {total, number} observationer}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {inga observationer} "
      & "sample_too_small_shape {urvalet är för litet för att beskriva "
      & "formen, {count, plural, one {1 observation} other {{count, number} "
      & "observationer}}} flat_shape {platt fördelning vid {median}} "
      & "outlier_heavy_shape {fördelning med många extremvärden kring "
      & "{median}} volatile_shape {volatil fördelning kring {median}} "
      & "clustered_shape {klustrad fördelning kring {median}} "
      & "wide_spread_shape {brett spridd fördelning} wide_spread_range {brett "
      & "spridd fördelning från {minimum} till {maximum}} right_skewed_shape "
      & "{högerskev fördelning, median {median}} left_skewed_shape "
      & "{vänsterskev fördelning, median {median}} other {mestadels "
      & "balanserad fördelning kring {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tom e-post} address {e-postadress} other "
      & "{e-post hos {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonnummer} redacted {telefonnummer "
      & "censurerat} other {telefonnummer som slutar på {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {användarnamn} other {användarnamn {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodsymbol} other {kodsymbol {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adressmetadata: {present, plural, one {1 fält finns} other {{present, "
      & "number} fält finns}}, {missing, plural, one {1 fält saknas} other "
      & "{{missing, number} fält saknas}}");
   P ("label.endpoints.host_label", "{state, select, none {okänd värd} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {okänd slutpunkt} other {slutpunkt "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tom URL} none {URL utan identifierade "
      & "komponenter} other {URL med {count, plural, one {1 komponent} other "
      & "{{count, number} komponenter}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {inga frågeparametrar} one {1 frågeparameter} "
      & "other {{count, number} frågeparametrar}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {offentlig IPv4-adress} ipv6_host "
      & "{offentlig IPv6-adress} private_network_host {adress i privat "
      & "nätverk} localhost_host {lokal värd} other {inte en IP-adress}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} (ogiltig CIDR)} other {{cidr} ({kind}, "
      & "nätverksprefix {prefix})}}");
   P ("label.resources.utilization_label", "{used, number} av {total, number} {unit} används ({percent}, {band})");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} över kapaciteten} other "
      & "{{count, number} av {total, number} {unit} kvar}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvoten överskriden med {count, number} "
      & "{unit} ({percent} använt)} near {kvoten nästan nådd: {count, "
      & "number} {unit} kvar ({percent} använt)} other {kvot tillgänglig: "
      & "{count, number} {unit} kvar ({percent} använt)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {cacheträffrekvens ej tillgänglig: inga "
      & "förfrågningar} other {cacheträffrekvens {percent}: {hits, plural, "
      & "one {1 träff} other {{hits, number} träffar}}, {misses, plural, one "
      & "{1 miss} other {{misses, number} missar}}}}");
   P ("label.resources.saturation_label", "{named, select, no {resurs} other {{name}}} {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {version {version}, förhandsversion "
      & "{prerelease}, bygge {build}} prerelease {version {version}, "
      & "förhandsversion {prerelease}} build {version {version}, bygge "
      & "{build}} other {version {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {samma version} major_upgrade "
      & "{uppgradering av huvudversion} minor_upgrade {uppgradering av "
      & "delversion} patch_upgrade {patchuppgradering} prerelease_change "
      & "{ändrad förhandsversion} build_metadata_change {ändrade "
      & "byggmetadata} downgrade {nedgradering} other {okänd "
      & "versionsändring}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {exakt version {version}} minimum_range "
      & "{version {version} eller nyare} maximum_range {version {version} eller "
      & "äldre} major_compatible_range {kompatibel med huvudversion {version}} "
      & "minor_compatible_range {kompatibel med delversion {version}} other "
      & "{versionsintervall {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {första utvecklingsversion {version}} "
      & "prerelease {förhandsversion {version}} major {huvudversion {version}} "
      & "minor {delversion {version}} other {patchversion {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {länktagg} image {bildtagg} paragraph {stycketagg} "
      & "ordered_list {tagg för numrerad lista} unordered_list {tagg för "
      & "punktlista} list_item {listobjekttagg} table_header_cell {tagg för "
      & "tabellrubrikcell} table_cell {tabellcelltagg} table_row "
      & "{tabellradstagg} line_break {radbrytningstagg} thematic_break {tagg "
      & "för tematisk brytning} heading_level_n {tagg för rubrik på nivå "
      & "{level, number}} other {{name}-tagg}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name}-attribut} event "
      & "{händelsehanterarattribut {name}} other {attribut {name} satt till "
      & "”{value}”}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 attribut} other {{count, number} attribut}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data-attribut} other {{count, number} "
      & "data-attribut}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA-attribut} other {{count, number} "
      & "ARIA-attribut}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 händelsehanterare} other {{count, number} "
      & "händelsehanterare}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {textinnehåll} html_content "
      & "{HTML-dokument} json_content {JSON-dokument} xml_content "
      & "{XML-dokument} image_content {bildinnehåll} audio_content "
      & "{ljudinnehåll} video_content {videoinnehåll} font_content "
      & "{teckensnittsinnehåll} archive_content {arkivinnehåll} "
      & "binary_content {binärt innehåll} form_content {formulärinskick} "
      & "other {okänt innehåll}} ({base})");
   P ("label.markup.heading_label", "rubrik på nivå {level, number}");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 tagg} other {{count, number} taggar}}");
   P ("label.markup.tag_count_label.links", "{count, plural, one {1 länk} other {{count, number} länkar}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {1 mediaelement} other {{count, number} "
      & "mediaelement}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {1 formulärkontroll} other {{count, number} "
      & "formulärkontroller}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {1 rubrik} other {{count, number} rubriker}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {1 landmärke} other {{count, number} "
      & "landmärken}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {1 formulär} other {{count, number} formulär}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {1 mediaelement} other {{count, number} "
      & "mediaelement}}");
   P ("label.markup.table_navigation_label",
      "{caption} rad {row, number} av {rows, number}, kolumn {column, number} "
      & "av {columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} saknas} hidden_value {{kind}, värdet "
      & "dolt} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "fingeravtryck som slutar på {shown}} other {{kind} som slutar på "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name}: {kind} saknas} other {{name}: {kind} "
      & "som slutar på {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {autentiseringshuvud {name} saknas} other "
      & "{{name}: {kind} som slutar på {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-fingeravtryck som slutar på {shown}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {1 hemlighet} other {{count, number} hemligheter}}");
   P ("label.secrets.secret_count_label.masked",
      "{count, plural, one {1 maskerad} other {{count, number} maskerade}}");
end Labels_2;
