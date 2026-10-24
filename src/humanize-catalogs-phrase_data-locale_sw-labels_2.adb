separate (Humanize.Catalogs.Phrase_Data.Locale_Sw)
procedure Labels_2 is
begin
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {foleni ya udhibiti iko "
      & "tupu} other {vinasubiri ukaguzi: {pending, number}}}} other "
      & "{vinasubiri ukaguzi: {pending, number}, vimepandishwa ngazi: "
      & "{escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {ripoti iliyo wazi} triaged_report "
      & "{ripoti iliyopangwa} actioned_report {hatua imechukuliwa} "
      & "dismissed_report {ripoti iliyotupiliwa mbali} appealed_report {ripoti "
      & "iliyokatiwa rufaa} other {ripoti iliyofungwa}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {ripoti iliyo wazi} triaged_report {ripoti "
      & "iliyopangwa} actioned_report {hatua imechukuliwa} dismissed_report "
      & "{ripoti iliyotupiliwa mbali} appealed_report {ripoti iliyokatiwa "
      & "rufaa} other {ripoti iliyofungwa}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {inasubiri ukaguzi} approved "
      & "{imeidhinishwa} rejected {imekataliwa} needs_changes {inahitaji "
      & "mabadiliko} other {ukaguzi umepandishwa ngazi}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {inasubiri ukaguzi} approved "
      & "{imeidhinishwa} rejected {imekataliwa} needs_changes {inahitaji "
      & "mabadiliko} other {ukaguzi umepandishwa ngazi}}");
   P ("label.navigation.back_label", "rudi kwenye {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {hakuna njia ya urambazaji} one {njia ya "
      & "urambazaji, kiwango 1} other {njia ya urambazaji, viwango {depth, "
      & "number}}}");
   P ("label.navigation.current_page_label", "ukurasa wa sasa: {name}");
   P ("label.navigation.external_link_label", "{name} (kiungo cha nje)");
   P ("label.navigation.first_label", "kwanza: {target}");
   P ("label.navigation.last_label", "mwisho: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {hakuna vipengee vya menyu} one {kipengee 1 cha "
      & "menyu} other {vipengee {count, number} vya menyu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {kiungo} menu_item {kipengee cha menyu} "
      & "tab_item {kichupo} breadcrumb_item {kipengee cha njia ya urambazaji} "
      & "section_item {sehemu} other {kitenganishi}}");
   P ("label.navigation.navigation_item_label",
      "{kind, select, link_item {kiungo} menu_item {kipengee cha menyu} "
      & "tab_item {kichupo} breadcrumb_item {kipengee cha njia ya urambazaji} "
      & "section_item {sehemu} other {kitenganishi}} {name}: {state, select, "
      & "current_item {sasa} active_item {amilifu} inactive_item {si amilifu} "
      & "disabled_item {imezimwa} expanded_item {imepanuliwa} collapsed_item "
      & "{imekunjwa} visited_item {imetembelewa} other {ya nje}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {sasa} active_item {amilifu} "
      & "inactive_item {si amilifu} disabled_item {imezimwa} expanded_item "
      & "{imepanuliwa} collapsed_item {imekunjwa} visited_item {imetembelewa} "
      & "other {ya nje}}");
   P ("label.navigation.next_label", "ifuatayo: {target}");
   P ("label.navigation.section_state_label",
      "sehemu {name} {expanded, select, false {imekunjwa} other "
      & "{imepanuliwa}}{count, plural, =0 {} one {, kipengee 1} other {, "
      & "vipengee {count, number}}}");
   P ("label.navigation.skip_link_label", "ruka hadi {target}");
   P ("label.navigation.submenu_label",
      "menyu ndogo {name}, {count, plural, one {kipengee 1} other {vipengee "
      & "{count, number}}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {tahadhari zote} important_alerts "
      & "{tahadhari muhimu} critical_alerts_only {tahadhari za dharura pekee} "
      & "other {hakuna tahadhari}}");
   P ("label.notification_preferences.channel_preference_label",
      "arifa za {channel}: {state, select, preference_enabled {zimewashwa} "
      & "preference_disabled {zimezimwa} preference_inherited {zimerithiwa} "
      & "other {zinahitajika}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {hakuna muhtasari} instant_digest "
      & "{muhtasari wa papo hapo} daily_digest {muhtasari wa kila siku} other "
      & "{muhtasari wa kila wiki}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {imewashwa} preference_disabled "
      & "{imezimwa} preference_inherited {imerithiwa} other {inahitajika}}");
   P ("label.notification_preferences.quiet_hours_label", "saa za kimya: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "usajili wa {scope, select, thread_subscription {mazungumzo} "
      & "project_subscription {mradi} team_subscription {timu} other {akaunti}} "
      & "{name}: {state, select, preference_enabled {umewashwa} "
      & "preference_disabled {umezimwa} preference_inherited {umerithiwa} other "
      & "{unahitajika}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {usajili wa mazungumzo} "
      & "project_subscription {usajili wa mradi} team_subscription {usajili wa "
      & "timu} other {usajili wa akaunti}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} amekutaja} reply_event {{actor} "
      & "amejibu} assignment_event {{actor} amekukabidhi kazi} approval_event "
      & "{{actor} ameomba idhini} alert_event {{actor} ametuma tahadhari} "
      & "digest_event {{actor} ametuma muhtasari} reminder_event {{actor} "
      & "ametuma kikumbusho} other {{actor} ametuma arifa ya mfumo}}");
   P ("label.notifications.delivery_label",
      "arifa {channel, select, in_app_channel {ndani ya programu} "
      & "email_channel {ya barua pepe} sms_channel {ya SMS} push_channel {ya "
      & "kusukuma} webhook_channel {ya webhook} other {ya muhtasari}}: {state, "
      & "select, pending_delivery {inasubiri} sent_delivery {imetumwa} "
      & "delivered_delivery {imewasilishwa} failed_delivery {imeshindwa} "
      & "retrying_delivery {inajaribiwa tena} other {imeghairiwa}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {arifa inayosubiri} sent_delivery "
      & "{arifa iliyotumwa} delivered_delivery {arifa iliyowasilishwa} "
      & "failed_delivery {arifa iliyoshindwa} retrying_delivery {arifa "
      & "inayojaribiwa tena} other {arifa iliyoghairiwa}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {inasubiri {time_text}} sent_delivery "
      & "{imetumwa {time_text}} delivered_delivery {imewasilishwa {time_text}} "
      & "failed_delivery {imeshindwa {time_text}} retrying_delivery "
      & "{inajaribiwa tena {time_text}} other {imeghairiwa {time_text}}}");
   P ("label.notifications.digest_label",
      "muhtasari wa {name}: {count, plural, =0 {hakuna arifa} one {arifa 1} "
      & "other {arifa {count, number}}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {hakuna kutajwa} one "
      & "{kutajwa mara 1} other {kutajwa mara {count, number}}}} reply_event "
      & "{{count, plural, =0 {hakuna majibu} one {jibu 1} other {majibu {count, "
      & "number}}}} assignment_event {{count, plural, =0 {hakuna kazi "
      & "zilizokabidhiwa} one {kazi 1 iliyokabidhiwa} other {kazi {count, "
      & "number} zilizokabidhiwa}}} approval_event {{count, plural, =0 {hakuna "
      & "maombi ya idhini} one {ombi 1 la idhini} other {maombi {count, number} "
      & "ya idhini}}} alert_event {{count, plural, =0 {hakuna tahadhari} one "
      & "{tahadhari 1} other {tahadhari {count, number}}}} digest_event "
      & "{{count, plural, =0 {hakuna mihtasari} one {muhtasari 1} other "
      & "{mihtasari {count, number}}}} reminder_event {{count, plural, =0 "
      & "{hakuna vikumbusho} one {kikumbusho 1} other {vikumbusho {count, "
      & "number}}}} other {{count, plural, =0 {hakuna arifa za mfumo} one "
      & "{arifa 1 ya mfumo} other {arifa {count, number} za mfumo}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {weka arifa kama imesomwa} other {weka arifa "
      & "{count, number} kama zimesomwa}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {weka arifa kama haijasomwa} other {weka arifa "
      & "{count, number} kama hazijasomwa}}");
   P ("label.notifications.muted_label", "arifa za {name} zimenyamazishwa");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {umetajwa} reply_event {jibu jipya} "
      & "assignment_event {kazi mpya uliyokabidhiwa} approval_event {ombi jipya "
      & "la idhini} alert_event {tahadhari mpya} digest_event {muhtasari mpya} "
      & "reminder_event {kikumbusho kipya} other {arifa mpya ya mfumo}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {arifa za ndani ya programu} "
      & "email_channel {arifa za barua pepe} sms_channel {arifa za SMS} "
      & "push_channel {arifa za kusukuma} webhook_channel {arifa za webhook} "
      & "other {arifa za muhtasari}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {hakuna arifa} one {arifa 1} other {arifa {count, "
      & "number}}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {kutajwa} reply_event {jibu} "
      & "assignment_event {kazi uliyokabidhiwa} approval_event {ombi la idhini} "
      & "alert_event {tahadhari} digest_event {muhtasari} reminder_event "
      & "{kikumbusho} other {arifa ya mfumo}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {hakuna arifa} one {arifa 1} other {arifa "
      & "{count, number}}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {kutajwa} reply_event {jibu} "
      & "assignment_event {kazi uliyokabidhiwa} approval_event {ombi la idhini} "
      & "alert_event {tahadhari} digest_event {muhtasari} reminder_event "
      & "{kikumbusho} other {arifa ya mfumo}}, {state, select, unread_state "
      & "{haijasomwa} read_state {imesomwa} archived_state {imehifadhiwa} "
      & "muted_state {imenyamazishwa} snoozed_state {imeahirishwa} other "
      & "{imezuiwa}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {arifa isiyosomwa} read_state {arifa "
      & "iliyosomwa} archived_state {arifa iliyohifadhiwa} muted_state {arifa "
      & "iliyonyamazishwa} snoozed_state {arifa iliyoahirishwa} other {arifa "
      & "iliyozuiwa}}");
   P ("label.notifications.snoozed_label", "arifa za {name} zimeahirishwa");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {hakuna arifa zilizozuiwa} one {arifa 1 imezuiwa} "
      & "other {arifa {count, number} zimezuiwa}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {hakuna arifa ambazo hazijasomwa} one {arifa 1 "
      & "haijasomwa} other {arifa {count, number} hazijasomwa}}");
   P ("label.payments.amount_label", "kiasi: {amount_text}");
   P ("label.payments.balance_label", "salio: {amount_text}");
   P ("label.payments.chargeback_label", "malipo yaliyorudishwa: {amount_text}");
   P ("label.payments.discount_label", "punguzo: {amount_text}");
   P ("label.payments.due_label", "{amount_text} inadaiwa {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {hakuna ankara} one {ankara 1} other {ankara "
      & "{count, number}}}");
   P ("label.payments.invoice_label",
      "ankara {number}: {state, select, draft_invoice {rasimu} open_invoice "
      & "{iko wazi} paid_invoice {imelipwa} overdue_invoice {imechelewa} other "
      & "{imebatilishwa}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {rasimu ya ankara} open_invoice {ankara "
      & "iliyo wazi} paid_invoice {ankara iliyolipwa} overdue_invoice {ankara "
      & "iliyochelewa} other {ankara iliyobatilishwa}}");
   P ("label.payments.method_label",
      "{method, select, card_method {imelipwa kwa kadi} bank_transfer_method "
      & "{imelipwa kwa uhamisho wa benki} cash_method {imelipwa kwa pesa "
      & "taslimu} wallet_method {imelipwa kwa pochi} check_method {imelipwa kwa "
      & "hundi} other {imelipwa kwa njia nyingine}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} imelipwa {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {hakuna malipo} one {malipo 1} other {malipo "
      & "{count, number}}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {malipo yanayosubiri} "
      & "authorized_payment {malipo yaliyoidhinishwa} paid_payment {malipo "
      & "yaliyokamilika} failed_payment {malipo yaliyoshindwa} refunded_payment "
      & "{malipo yaliyorejeshwa} other {malipo yaliyoghairiwa}}");
   P ("label.payments.payment_link_label", "kiungo cha malipo cha {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kadi} bank_transfer_method {uhamisho wa "
      & "benki} cash_method {pesa taslimu} wallet_method {pochi} check_method "
      & "{hundi} other {nyingine}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {malipo yanayosubiri} "
      & "authorized_payment {malipo yaliyoidhinishwa} paid_payment {malipo "
      & "yaliyokamilika} failed_payment {malipo yaliyoshindwa} refunded_payment "
      & "{malipo yaliyorejeshwa} other {malipo yaliyoghairiwa}}");
   P ("label.payments.receipt_label", "risiti {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {marejesho "
      & "yanayosubiri} authorized_payment {marejesho yaliyoidhinishwa} "
      & "paid_payment {marejesho yaliyolipwa} failed_payment {marejesho "
      & "yaliyoshindwa} refunded_payment {marejesho yamekamilika} other "
      & "{marejesho yaliyoghairiwa}}");
   P ("label.payments.subtotal_label", "jumla ndogo: {amount_text}");
   P ("label.payments.tax_label", "kodi: {amount_text}");
   P ("label.payments.total_label", "jumla: {amount_text}");
   P ("label.permissions.access_expiry_label", "ufikiaji wa {subject} unaisha {time_text}");
   P ("label.permissions.grant_label",
      "{role, select, owner_role {{subject} amepewa jukumu la mmiliki} "
      & "admin_role {{subject} amepewa jukumu la msimamizi} editor_role "
      & "{{subject} amepewa jukumu la mhariri} viewer_role {{subject} amepewa "
      & "jukumu la mtazamaji} other {{subject} amepewa jukumu maalum}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {imetolewa} denied "
      & "{imekataliwa} inherited {imerithiwa} temporary {ufikiaji wa muda} "
      & "expired {muda umeisha} other {inahitaji idhini}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {imetolewa} denied {imekataliwa} inherited "
      & "{imerithiwa} temporary {ufikiaji wa muda} expired {muda umeisha} other "
      & "{inahitaji idhini}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {sera inaruhusu} policy_denied {sera "
      & "inakataa} policy_warning {onyo la sera} other {sera haitumiki}}");
   P ("label.permissions.revoke_label",
      "{role, select, owner_role {{subject} ameondolewa jukumu la mmiliki} "
      & "admin_role {{subject} ameondolewa jukumu la msimamizi} editor_role "
      & "{{subject} ameondolewa jukumu la mhariri} viewer_role {{subject} "
      & "ameondolewa jukumu la mtazamaji} other {{subject} ameondolewa jukumu "
      & "maalum}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {mmiliki} admin_role {msimamizi} editor_role "
      & "{mhariri} viewer_role {mtazamaji} other {jukumu maalum}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {tupu} low_utilization {matumizi ya "
      & "chini} normal_utilization {matumizi ya kawaida} high_utilization "
      & "{matumizi ya juu} critical_utilization {matumizi ya hatari} "
      & "full_utilization {imejaa} other {imezidi kikomo}}");
   P ("label.schema.array_shape_label",
      "safu ya {element_type, select, string_field {mifuatano} integer_field "
      & "{nambari kamili} decimal_field {desimali} boolean_field {thamani za "
      & "boolean} date_field {tarehe} date_time_field {tarehe na saa} "
      & "object_field {vitu} array_field {safu} enum_field {thamani za enum} "
      & "binary_field {data ya binary} null_field {thamani za null} any_field "
      & "{thamani za aina yoyote} other {thamani za aina "
      & "isiyojulikana}}{count_known, select, false {} other { ({count, plural, "
      & "one {kipengee 1} other {vipengee {count, number}}})}}");
   P ("label.schema.constraint_label", "kizuizi {name}: {value}");
   P ("label.schema.default_value_label", "thamani chaguomsingi ya sehemu {field_name}: {value}");
   P ("label.schema.deprecated_field_label", "sehemu {name} imeacha kutumika, tumia {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {chaguo 1 la enum} other {chaguo {count, number} "
      & "za enum}}");
   P ("label.schema.example_value_label", "mfano wa sehemu {field_name}: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {sehemu ya kawaida} deprecated_field "
      & "{sehemu iliyoacha kutumika} unknown_field {sehemu isiyojulikana} "
      & "read_only_field {sehemu ya kusoma tu} write_only_field {sehemu ya "
      & "kuandika tu} other {sehemu iliyokokotolewa}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {sehemu ya mfuatano} integer_field {sehemu "
      & "ya nambari kamili} decimal_field {sehemu ya desimali} boolean_field "
      & "{sehemu ya boolean} date_field {sehemu ya tarehe} date_time_field "
      & "{sehemu ya tarehe na saa} object_field {sehemu ya kitu} array_field "
      & "{sehemu ya safu} enum_field {sehemu ya enum} binary_field {sehemu ya "
      & "binary} null_field {sehemu ya null} any_field {sehemu ya aina yoyote} "
      & "other {sehemu ya aina isiyojulikana}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {hakuna sehemu zinazohitajika zinazokosekana} one "
      & "{sehemu 1 inayohitajika inakosekana} other {sehemu {count, number} "
      & "zinazohitajika zinakosekana}}");
   P ("label.schema.object_shape_label",
      "kitu chenye {fields, plural, one {sehemu 1} other {sehemu {fields, "
      & "number}}}{required, plural, =0 {} other {, zinazohitajika: {required, "
      & "number}}}{optional, plural, =0 {} other {, za hiari: {optional, "
      & "number}}}");
   P ("label.schema.schema_source_label", "skima {name}, toleo {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {thamani moja} object_shape {{count, "
      & "plural, =0 {kitu} one {kitu chenye sehemu 1} other {kitu chenye sehemu "
      & "{count, number}}}} array_shape {{count, plural, =0 {safu} one {safu "
      & "yenye kipengee 1} other {safu yenye vipengee {count, number}}}} "
      & "map_shape {{count, plural, =0 {ramani} one {ramani yenye ingizo 1} "
      & "other {ramani yenye maingizo {count, number}}}} tuple_shape {{count, "
      & "plural, =0 {tuple} one {tuple yenye kipengee 1} other {tuple yenye "
      & "vipengee {count, number}}}} union_shape {{count, plural, =0 {muungano} "
      & "one {muungano wa aina 1} other {muungano wa aina {count, number}}}} "
      & "empty_shape {umbo tupu} other {umbo lisilojulikana}}");
   P ("label.schema.unknown_field_label", "sehemu isiyojulikana {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {hakuna vichujio amilifu} one {kichujio 1 amilifu} "
      & "other {vichujio {count, number} amilifu}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {futa vichujio} one {futa kichujio amilifu} other "
      & "{futa vichujio {count, number} amilifu}}");
   P ("label.search.facet_label",
      "kipengele cha {name}, {count, plural, one {chaguo 1} other {machaguo "
      & "{count, number}}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {hakuna matokeo} one {tokeo 1} other "
      & "{matokeo {count, number}}}{selected, select, true {, imechaguliwa} "
      & "other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {kichujio amilifu} "
      & "inactive_filter {kichujio kisicho amilifu} other {kichujio cha "
      & "kutenga}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {kichujio amilifu} inactive_filter "
      & "{kichujio kisicho amilifu} other {kichujio cha kutenga}}");
   P ("label.search.no_results_label", "hakuna matokeo ya “{query}”");
   P ("label.search.recent_search_label", "utafutaji wa hivi karibuni: “{query}”");
   P ("label.search.saved_search_label",
      "utafutaji uliohifadhiwa: {name}{count, plural, =0 {} one {, tokeo 1} "
      & "other {, matokeo {count, number}}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {hakuna utafutaji wa hivi karibuni} other "
      & "{utafutaji wa hivi karibuni: {count, number}}}");
   P ("label.search.search_query_label", "tafuta “{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {hakuna matokeo} one {tokeo 1} other {matokeo "
      & "{count, number}}}");
   P ("label.search.search_result_summary_label",
      "matokeo ya “{query}”: {count, plural, =0 {hakuna matokeo} one "
      & "{tokeo 1} other {matokeo {count, number}}}");
   P ("label.search.search_scope_label",
      "upeo wa {name}, {count, plural, =0 {hakuna matokeo} one {tokeo 1} "
      & "other {matokeo {count, number}}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {utafutaji umetulia} searching_search "
      & "{inatafuta} complete_search {utafutaji umekamilika} empty_search "
      & "{hakuna matokeo ya utafutaji} other {utafutaji umeshindwa}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {panga kwa umuhimu} ascending_sort "
      & "{panga kwa mpangilio wa kupanda} descending_sort {panga kwa mpangilio "
      & "wa kushuka} newest_first_sort {panga mpya kwanza} other {panga za "
      & "zamani kwanza}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {umuhimu} ascending_sort {kupanda} "
      & "descending_sort {kushuka} newest_first_sort {mpya kwanza} other {za "
      & "zamani kwanza}}");
   P ("label.search.suggestion_label", "ulimaanisha “{query}”?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {kitambulisho 1 kutoka {source}} other "
      & "{vitambulisho {count, number} kutoka {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {thamani imefichwa} masked_value "
      & "{thamani imefunikwa} suffix_only {kiambishi cha mwisho tu} other "
      & "{alama ya kidole tu}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {umma} support_profile {usaidizi} "
      & "audit_profile {ukaguzi} other {utatuzi}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {inahitaji kubadilishwa} other "
      & "{haihitaji kubadilishwa}}{days_old, plural, =0 {} one {, umri: siku 1} "
      & "other {, umri: siku {days_old, number}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {ufunguo wa API} live_api_key {ufunguo wa API "
      & "wa uzalishaji} test_api_key {ufunguo wa API wa majaribio} github_token "
      & "{tokeni ya GitHub} aws_access_key {ufunguo wa ufikiaji wa AWS} "
      & "google_api_key {ufunguo wa Google API} slack_token {tokeni ya Slack} "
      & "npm_token {tokeni ya npm} bearer_token {tokeni ya bearer} jwt_token "
      & "{tokeni ya JWT} basic_auth_credential {kitambulisho cha basic auth} "
      & "password_secret {nenosiri} private_key {ufunguo binafsi} "
      & "ssh_private_key {ufunguo binafsi wa SSH} webhook_secret {siri ya "
      & "webhook} oauth_token {tokeni ya OAuth} database_url_secret {URL ya "
      & "hifadhidata} sha1_fingerprint {alama ya kidole ya SHA-1} "
      & "sha256_fingerprint {alama ya kidole ya SHA-256} other {siri}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {barua pepe} phone_value {simu} url_value "
      & "{URL} ip_address_value {anwani ya IP} token_value {tokeni} "
      & "file_path_value {njia ya faili} account_id_value {kitambulisho cha "
      & "akaunti} payment_reference_value {kumbukumbu ya malipo} "
      & "log_field_value {sehemu ya kumbukumbu} other {thamani nyeti}}");
   P ("label.tables.cell_label",
      "safu {row, number}, safu wima {column, number}, {state, select, "
      & "empty_cell {tupu} edited_cell {imehaririwa} invalid_cell {batili} "
      & "highlighted_cell {imeangaziwa} other {ya kusoma tu}}");
   P ("label.tables.cell_position_label", "safu {row, number}, safu wima {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {kisanduku tupu} edited_cell {kisanduku "
      & "kilichohaririwa} invalid_cell {kisanduku batili} highlighted_cell "
      & "{kisanduku kilichoangaziwa} other {kisanduku cha kusoma tu}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {hakuna safu wima} one {safu wima 1} other {safu "
      & "wima {count, number}}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {safu wima ya maandishi} "
      & "number_column {safu wima ya nambari} date_column {safu wima ya tarehe} "
      & "status_column {safu wima ya hali} action_column {safu wima ya vitendo} "
      & "other {safu wima iliyofichwa}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {safu wima ya maandishi} number_column "
      & "{safu wima ya nambari} date_column {safu wima ya tarehe} status_column "
      & "{safu wima ya hali} action_column {safu wima ya vitendo} other {safu "
      & "wima iliyofichwa}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {safu 1} other {safu {count, number}}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {hakuna safu} one {safu 1} other {safu {count, "
      & "number}}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {haijapangwa} ascending_sort {kupanda} "
      & "other {kushuka}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {haijapangwa} ascending_sort {imepangwa "
      & "kwa {column_name}, kupanda} other {imepangwa kwa {column_name}, "
      & "kushuka}}");
   P ("label.tables.subtotal_label", "jumla ndogo ya {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {safu 1} other {safu {rows, number}}} × {columns, "
      & "plural, one {safu wima 1} other {safu wima {columns, number}}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee} ameondolewa kwenye kazi} "
      & "assigned {imekabidhiwa kwa {assignee}} reassigned {imekabidhiwa upya "
      & "kwa {assignee}} watching {{assignee} anafuatilia} other {{assignee} ni "
      & "mmiliki wa kazi}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {haijakabidhiwa} assigned {imekabidhiwa} "
      & "reassigned {imekabidhiwa upya} watching {inafuatiliwa} other {mmiliki "
      & "wa kazi}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {hakuna kazi zilizosalia} one {kazi zilizosalia: "
      & "kazi 1} other {kazi zilizosalia: kazi {count, number}}}");
   P ("label.tasks.blocker_label", "imezuiwa na {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {kamilisha kazi} other {kamilisha kazi {count, "
      & "number}}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {hakuna kazi zilizokamilika} one {kazi 1 "
      & "iliyokamilika} other {kazi {count, number} zilizokamilika}}");
   P ("label.tasks.due_label", "mwisho {due_text}");
   P ("label.tasks.estimate_label", "makadirio: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {hakuna kazi zilizo wazi} one {kazi 1 iliyo wazi} "
      & "other {kazi {count, number} zilizo wazi}}");
   P ("label.tasks.overdue_label", "imechelewa tangu {due_text}");
   P ("label.tasks.recurring_task_label", "inajirudia {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {fungua upya kazi} other {fungua upya kazi {count, "
      & "number}}}");
   P ("label.tasks.sprint_label", "{name}: {count, plural, one {kazi 1} other {kazi {count, number}}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {kazi ndogo 1} other {kazi ndogo {count, "
      & "number}}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {hakuna kazi} one {kazi 1} other {kazi {count, "
      & "number}}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {kazi iliyo wazi} in_progress_task "
      & "{kazi inayoendelea} blocked_task {kazi iliyozuiwa} done_task {kazi "
      & "iliyokamilika} canceled_task {kazi iliyoghairiwa} deferred_task {kazi "
      & "iliyoahirishwa} other {kazi iliyochelewa}}{priority, select, "
      & "no_priority {} low_priority {, kipaumbele cha chini} medium_priority "
      & "{, kipaumbele cha kati} high_priority {, kipaumbele cha juu} other {, "
      & "kipaumbele cha dharura}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {hakuna kipaumbele} low_priority "
      & "{kipaumbele cha chini} medium_priority {kipaumbele cha kati} "
      & "high_priority {kipaumbele cha juu} other {kipaumbele cha dharura}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {kazi iliyo wazi} in_progress_task {kazi "
      & "inayoendelea} blocked_task {kazi iliyozuiwa} done_task {kazi "
      & "iliyokamilika} canceled_task {kazi iliyoghairiwa} deferred_task {kazi "
      & "iliyoahirishwa} other {kazi iliyochelewa}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {kikomo cha juu} other {kikomo cha "
      & "chini}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {chini ya kiwango kinachotarajiwa} "
      & "within_range {ndani ya kiwango kinachotarajiwa} above_range {juu ya "
      & "kiwango kinachotarajiwa} below_target {chini ya lengo} at_target "
      & "{kwenye lengo} above_target {juu ya lengo} near_limit {karibu na "
      & "kikomo} warning_level {kizingiti cha onyo} critical_level {kizingiti "
      & "muhimu} breached {kikomo kimevukwa} other {hali ya kizingiti "
      & "haijulikani}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {imesasishwa} other {commit "
      & "{ahead, number} mbele}}} other {{ahead, plural, =0 {} other {commit "
      & "{ahead, number} mbele, }}commit {behind, number} nyuma}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {inasubiri idhini ya {approver}} other "
      & "{imeidhinishwa na {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {jaribio 1 kati ya 1} other "
      & "{jaribio {attempt, number} kati ya 1, kikomo kimepitwa}}} other "
      & "{jaribio {attempt, number} kati ya {limit, number}}}");
   P ("label.workflows.blocker_label", "imezuiwa: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {hakuna utegemezi unaozuia} one {utegemezi 1 "
      & "unaozuia} other {tegemezi {count, number} zinazozuia}}");
   P ("label.workflows.handoff_label", "makabidhiano kutoka {from} kwenda {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {hatua muhimu ijayo} "
      & "current_milestone {hatua muhimu ya sasa} complete_milestone {hatua "
      & "muhimu iliyokamilika} missed_milestone {hatua muhimu iliyokoswa} other "
      & "{hatua muhimu iliyozuiwa}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {ijayo} current_milestone "
      & "{ya sasa} complete_milestone {imekamilika} missed_milestone {imekoswa} "
      & "other {imezuiwa}}");
   P ("label.workflows.next_action_label", "inayofuata: {action}");
   P ("label.workflows.owner_label", "mmiliki: {owner}");
   P ("label.workflows.resume_label", "endelea na {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {inasubiri} active_step {inaendelea} "
      & "waiting_step {inangoja} blocked_step {imezuiwa} done_step "
      & "{imekamilika} failed_step {imeshindwa} other {imerukwa}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {inasubiri} active_step "
      & "{inaendelea} waiting_step {inangoja} blocked_step {imezuiwa} done_step "
      & "{imekamilika} failed_step {imeshindwa} other {imerukwa}}");
   P ("label.workflows.waiting_label", "inasubiri {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {haijaanza} "
      & "in_progress_state {inaendelea} waiting_state {inasubiri} "
      & "waiting_approval_state {inasubiri idhini} blocked_state {imezuiwa} "
      & "completed_state {imekamilika} failed_state {imeshindwa} "
      & "cancelled_state {imeghairiwa} skipped_state {imerukwa} other "
      & "{imesitishwa}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {haijaanza} in_progress_state "
      & "{inaendelea} waiting_state {inasubiri} waiting_approval_state "
      & "{inasubiri idhini} blocked_state {imezuiwa} completed_state "
      & "{imekamilika} failed_state {imeshindwa} cancelled_state {imeghairiwa} "
      & "skipped_state {imerukwa} other {imesitishwa}}");
end Labels_2;
