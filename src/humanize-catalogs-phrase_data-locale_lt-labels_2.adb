separate (Humanize.Catalogs.Phrase_Data.Locale_Lt)
procedure Labels_2 is
begin
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {skubus atnaujinimas} other "
      & "{įprastas atnaujinimas}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {tekstas} html_content {HTML} json_content "
      & "{JSON} xml_content {XML} image_content {vaizdas} audio_content "
      & "{garsas} video_content {vaizdo įrašas} font_content {šriftas} "
      & "archive_content {archyvas} binary_content {dvejetainiai duomenys} "
      & "form_content {formos duomenys} other {nežinomas turinys}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumento žyma} metadata_tag "
      & "{metaduomenų žyma} section_tag {skyriaus žyma} text_tag {teksto "
      & "žyma} link_tag {nuorodos žyma} media_tag {medijos žyma} form_tag "
      & "{formos žyma} table_tag {lentelės žyma} interactive_tag "
      & "{interaktyvi žyma} scripting_tag {scenarijaus žyma} other {nežinoma "
      & "žyma}}");
   P ("label.media.duration_label", "trukmė: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {vaizdas} video_media {vaizdo įrašas} "
      & "audio_media {garso įrašas} pdf_document {PDF dokumentas} "
      & "text_document {tekstinis dokumentas} archive_media {archyvas} other "
      & "{medija}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {paruošta} processing_media {apdorojama} "
      & "transcoding_media {perkoduojama} thumbnail_missing {miniatiūra "
      & "nepasiekiama} metadata_missing {trūksta metaduomenų} locked_document "
      & "{dokumentas užrakintas} other {nepasiekiama}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {vaizdas} video_media {vaizdo "
      & "įrašas} audio_media {garso įrašas} pdf_document {PDF dokumentas} "
      & "text_document {tekstinis dokumentas} archive_media {archyvas} other "
      & "{medija}}): {state, select, ready_media {paruošta} processing_media "
      & "{apdorojama} transcoding_media {perkoduojama} thumbnail_missing "
      & "{miniatiūra nepasiekiama} metadata_missing {trūksta metaduomenų} "
      & "locked_document {užrakinta} other {nepasiekiama}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {puslapių nėra} other {{pages, plural, one "
      & "{{pages, number} puslapis} few {{pages, number} puslapiai} many "
      & "{{pages, number} puslapio} other {{pages, number} puslapių}}}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: apeliacija, {state, select, open_report {skundas atviras} "
      & "triaged_report {skundas įvertintas} actioned_report {imtasi veiksmų} "
      & "dismissed_report {skundas atmestas} appealed_report {skundas "
      & "apskųstas} other {skundas uždarytas}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {moderavimo veiksmų nėra} flagged "
      & "{pažymėta} hidden {paslėpė moderatorius} restored {atkurta} "
      & "marked_spam {pažymėta kaip šlamštas} removed {pašalinta} other "
      & "{perduota aukštesniam lygiui}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {moderavimo veiksmų nėra} flagged "
      & "{pažymėta} hidden {paslėpė moderatorius} restored {atkurta} "
      & "marked_spam {pažymėta kaip šlamštas} removed {pašalinta} other "
      & "{perduota aukštesniam lygiui}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderavimo eilė "
      & "tuščia} other {laukia peržiūros: {pending, number}}}} other "
      & "{laukia peržiūros: {pending, number}, perduota aukštesniam lygiui: "
      & "{escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {skundas atviras} triaged_report "
      & "{skundas įvertintas} actioned_report {imtasi veiksmų} "
      & "dismissed_report {skundas atmestas} appealed_report {skundas "
      & "apskųstas} other {skundas uždarytas}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {skundas atviras} triaged_report {skundas "
      & "įvertintas} actioned_report {imtasi veiksmų} dismissed_report "
      & "{skundas atmestas} appealed_report {skundas apskųstas} other {skundas "
      & "uždarytas}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {laukia peržiūros} approved "
      & "{patvirtinta} rejected {atmesta} needs_changes {reikia pakeitimų} "
      & "other {peržiūra perduota aukštesniam lygiui}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {laukia peržiūros} approved "
      & "{patvirtinta} rejected {atmesta} needs_changes {reikia pakeitimų} "
      & "other {peržiūra perduota aukštesniam lygiui}}");
   P ("label.navigation.back_label", "atgal: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {naršymo kelias tuščias} other {naršymo kelias, "
      & "lygių: {depth, number}}}");
   P ("label.navigation.current_page_label", "dabartinis puslapis: {name}");
   P ("label.navigation.external_link_label", "{name}: išorinė nuoroda");
   P ("label.navigation.first_label", "į pradžią: {target}");
   P ("label.navigation.last_label", "į pabaigą: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {meniu punktų nėra} one {{count, number} meniu "
      & "punktas} few {{count, number} meniu punktai} many {{count, number} "
      & "meniu punkto} other {{count, number} meniu punktų}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {nuoroda} menu_item {meniu punktas} tab_item "
      & "{skirtukas} breadcrumb_item {naršymo kelio elementas} section_item "
      & "{skyrius} other {skyriklis}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {nuoroda} menu_item {meniu punktas} "
      & "tab_item {skirtukas} breadcrumb_item {naršymo kelio elementas} "
      & "section_item {skyrius} other {skyriklis}}, {kind, select, link_item "
      & "{{state, select, current_item {dabartinė} active_item {aktyvi} "
      & "inactive_item {neaktyvi} disabled_item {išjungta} expanded_item "
      & "{išskleista} collapsed_item {sutraukta} visited_item {aplankyta} "
      & "other {išorinė}}} other {{state, select, current_item {dabartinis} "
      & "active_item {aktyvus} inactive_item {neaktyvus} disabled_item "
      & "{išjungtas} expanded_item {išskleistas} collapsed_item {sutrauktas} "
      & "visited_item {aplankytas} other {išorinis}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {dabartinis} active_item {aktyvus} "
      & "inactive_item {neaktyvus} disabled_item {išjungtas} expanded_item "
      & "{išskleistas} collapsed_item {sutrauktas} visited_item {aplankytas} "
      & "other {išorinis}}");
   P ("label.navigation.next_label", "toliau: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {skyrius sutrauktas} other {skyrius "
      & "išskleistas}}{count, plural, =0 {} one {, {count, number} elementas} "
      & "few {, {count, number} elementai} many {, {count, number} elemento} "
      & "other {, {count, number} elementų}}");
   P ("label.navigation.skip_link_label", "pereiti: {target}");
   P ("label.navigation.submenu_label",
      "{name}: submeniu, {count, plural, one {{count, number} punktas} few "
      & "{{count, number} punktai} many {{count, number} punkto} other {{count, "
      & "number} punktų}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {visi įspėjimai} important_alerts "
      & "{svarbūs įspėjimai} critical_alerts_only {tik kritiniai "
      & "įspėjimai} other {be įspėjimų}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: pranešimai {state, select, preference_enabled {įjungti} "
      & "preference_disabled {išjungti} preference_inherited {paveldėti} "
      & "other {privalomi}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {be santraukos} instant_digest "
      & "{momentinė santrauka} daily_digest {kasdienė santrauka} other "
      & "{savaitinė santrauka}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {įjungta} preference_disabled "
      & "{išjungta} preference_inherited {paveldėta} other {privaloma}}");
   P ("label.notification_preferences.quiet_hours_label", "tylos valandos: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {gijos prenumerata} "
      & "project_subscription {projekto prenumerata} team_subscription "
      & "{komandos prenumerata} other {paskyros prenumerata}} {state, select, "
      & "preference_enabled {įjungta} preference_disabled {išjungta} "
      & "preference_inherited {paveldėta} other {privaloma}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {gijos prenumerata} "
      & "project_subscription {projekto prenumerata} team_subscription "
      & "{komandos prenumerata} other {paskyros prenumerata}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} jus paminėjo} reply_event "
      & "{{actor} atsakė} assignment_event {{actor} jums priskyrė} "
      & "approval_event {{actor} paprašė patvirtinimo} alert_event {{actor} "
      & "išsiuntė įspėjimą} digest_event {{actor} išsiuntė santrauką} "
      & "reminder_event {{actor} išsiuntė priminimą} other {{actor} "
      & "išsiuntė sistemos pranešimą}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {pranešimas programoje} "
      & "email_channel {el. pašto pranešimas} sms_channel {SMS pranešimas} "
      & "push_channel {tiesioginis pranešimas} webhook_channel {webhook "
      & "pranešimas} other {santraukos pranešimas}}: {state, select, "
      & "pending_delivery {laukia siuntimo} sent_delivery {išsiųstas} "
      & "delivered_delivery {pristatytas} failed_delivery {nepristatytas} "
      & "retrying_delivery {siunčiamas pakartotinai} other {atšauktas}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {pranešimas laukia siuntimo} "
      & "sent_delivery {pranešimas išsiųstas} delivered_delivery "
      & "{pranešimas pristatytas} failed_delivery {pranešimas nepristatytas} "
      & "retrying_delivery {pranešimas siunčiamas pakartotinai} other "
      & "{pranešimas atšauktas}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {laukia siuntimo: {time_text}} "
      & "sent_delivery {išsiųsta: {time_text}} delivered_delivery "
      & "{pristatyta: {time_text}} failed_delivery {nepristatyta: {time_text}} "
      & "retrying_delivery {siunčiama pakartotinai: {time_text}} other "
      & "{atšaukta: {time_text}}}");
   P ("label.notifications.digest_label",
      "santrauka {name}: {count, plural, =0 {pranešimų nėra} one {{count, "
      & "number} pranešimas} few {{count, number} pranešimai} many {{count, "
      & "number} pranešimo} other {{count, number} pranešimų}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {paminėjimų nėra} "
      & "one {{count, number} paminėjimas} few {{count, number} paminėjimai} "
      & "many {{count, number} paminėjimo} other {{count, number} "
      & "paminėjimų}}} reply_event {{count, plural, =0 {atsakymų nėra} one "
      & "{{count, number} atsakymas} few {{count, number} atsakymai} many "
      & "{{count, number} atsakymo} other {{count, number} atsakymų}}} "
      & "assignment_event {{count, plural, =0 {priskyrimų nėra} one {{count, "
      & "number} priskyrimas} few {{count, number} priskyrimai} many {{count, "
      & "number} priskyrimo} other {{count, number} priskyrimų}}} "
      & "approval_event {{count, plural, =0 {patvirtinimo užklausų nėra} one "
      & "{{count, number} patvirtinimo užklausa} few {{count, number} "
      & "patvirtinimo užklausos} many {{count, number} patvirtinimo "
      & "užklausos} other {{count, number} patvirtinimo užklausų}}} "
      & "alert_event {{count, plural, =0 {įspėjimų nėra} one {{count, "
      & "number} įspėjimas} few {{count, number} įspėjimai} many {{count, "
      & "number} įspėjimo} other {{count, number} įspėjimų}}} digest_event "
      & "{{count, plural, =0 {santraukų nėra} one {{count, number} santrauka} "
      & "few {{count, number} santraukos} many {{count, number} santraukos} "
      & "other {{count, number} santraukų}}} reminder_event {{count, plural, "
      & "=0 {priminimų nėra} one {{count, number} priminimas} few {{count, "
      & "number} priminimai} many {{count, number} priminimo} other {{count, "
      & "number} priminimų}}} other {{count, plural, =0 {sistemos pranešimų "
      & "nėra} one {{count, number} sistemos pranešimas} few {{count, number} "
      & "sistemos pranešimai} many {{count, number} sistemos pranešimo} other "
      & "{{count, number} sistemos pranešimų}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {pažymėti pranešimą kaip perskaitytą} one "
      & "{pažymėti {count, number} pranešimą kaip perskaitytą} few "
      & "{pažymėti {count, number} pranešimus kaip perskaitytus} many "
      & "{pažymėti {count, number} pranešimo kaip perskaitytus} other "
      & "{pažymėti {count, number} pranešimų kaip perskaitytus}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {pažymėti pranešimą kaip neperskaitytą} one "
      & "{pažymėti {count, number} pranešimą kaip neperskaitytą} few "
      & "{pažymėti {count, number} pranešimus kaip neperskaitytus} many "
      & "{pažymėti {count, number} pranešimo kaip neperskaitytus} other "
      & "{pažymėti {count, number} pranešimų kaip neperskaitytus}}");
   P ("label.notifications.muted_label", "{name}: pranešimai nutildyti");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {naujas paminėjimas} reply_event "
      & "{naujas atsakymas} assignment_event {naujas priskyrimas} "
      & "approval_event {nauja patvirtinimo užklausa} alert_event {naujas "
      & "įspėjimas} digest_event {nauja santrauka} reminder_event {naujas "
      & "priminimas} other {naujas sistemos pranešimas}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {pranešimai programoje} "
      & "email_channel {el. pašto pranešimai} sms_channel {SMS pranešimai} "
      & "push_channel {tiesioginiai pranešimai} webhook_channel {webhook "
      & "pranešimai} other {santraukos pranešimai}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {pranešimų nėra} one {{count, number} "
      & "pranešimas} few {{count, number} pranešimai} many {{count, number} "
      & "pranešimo} other {{count, number} pranešimų}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {paminėjimas} reply_event {atsakymas} "
      & "assignment_event {priskyrimas} approval_event {patvirtinimo užklausa} "
      & "alert_event {įspėjimas} digest_event {santrauka} reminder_event "
      & "{priminimas} other {sistemos pranešimas}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {pranešimų nėra} one {{count, number} "
      & "pranešimas} few {{count, number} pranešimai} many {{count, number} "
      & "pranešimo} other {{count, number} pranešimų}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {paminėjimas} reply_event "
      & "{atsakymas} assignment_event {priskyrimas} approval_event "
      & "{patvirtinimo užklausa} alert_event {įspėjimas} digest_event "
      & "{santrauka} reminder_event {priminimas} other {sistemos pranešimas}}, "
      & "{event, select, approval_event {{state, select, unread_state "
      & "{neperskaityta} read_state {perskaityta} archived_state {archyvuota} "
      & "muted_state {nutildyta} snoozed_state {atidėta} other {nuslopinta}}} "
      & "digest_event {{state, select, unread_state {neperskaityta} read_state "
      & "{perskaityta} archived_state {archyvuota} muted_state {nutildyta} "
      & "snoozed_state {atidėta} other {nuslopinta}}} other {{state, select, "
      & "unread_state {neperskaitytas} read_state {perskaitytas} archived_state "
      & "{archyvuotas} muted_state {nutildytas} snoozed_state {atidėtas} other "
      & "{nuslopintas}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {neperskaitytas pranešimas} read_state "
      & "{perskaitytas pranešimas} archived_state {archyvuotas pranešimas} "
      & "muted_state {nutildytas pranešimas} snoozed_state {atidėtas "
      & "pranešimas} other {nuslopintas pranešimas}}");
   P ("label.notifications.snoozed_label", "{name}: pranešimai atidėti");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {nuslopintų pranešimų nėra} other {nuslopinta "
      & "pranešimų: {count, number}}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {neperskaitytų pranešimų nėra} one {{count, "
      & "number} neperskaitytas pranešimas} few {{count, number} neperskaityti "
      & "pranešimai} many {{count, number} neperskaityto pranešimo} other "
      & "{{count, number} neperskaitytų pranešimų}}");
   P ("label.payments.amount_label", "suma: {amount_text}");
   P ("label.payments.balance_label", "likutis: {amount_text}");
   P ("label.payments.chargeback_label", "užginčytas mokėjimas: {amount_text}");
   P ("label.payments.discount_label", "nuolaida: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, mokėti iki {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {sąskaitų nėra} one {{count, number} sąskaita} "
      & "few {{count, number} sąskaitos} many {{count, number} sąskaitos} "
      & "other {{count, number} sąskaitų}}");
   P ("label.payments.invoice_label",
      "sąskaita {number}: {state, select, draft_invoice {juodraštis} "
      & "open_invoice {neapmokėta} paid_invoice {apmokėta} overdue_invoice "
      & "{pradelsta} other {anuliuota}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {sąskaitos juodraštis} open_invoice "
      & "{neapmokėta sąskaita} paid_invoice {apmokėta sąskaita} "
      & "overdue_invoice {pradelsta sąskaita} other {anuliuota sąskaita}}");
   P ("label.payments.method_label",
      "{method, select, card_method {apmokėta kortele: {detail}} "
      & "bank_transfer_method {apmokėta banko pervedimu: {detail}} cash_method "
      & "{apmokėta grynaisiais: {detail}} wallet_method {apmokėta elektronine "
      & "pinigine: {detail}} check_method {apmokėta čekiu: {detail}} other "
      & "{apmokėta kitu būdu: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}: apmokėta {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {mokėjimų nėra} one {{count, number} mokėjimas} "
      & "few {{count, number} mokėjimai} many {{count, number} mokėjimo} "
      & "other {{count, number} mokėjimų}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {mokėjimas "
      & "apdorojamas} authorized_payment {mokėjimas autorizuotas} paid_payment "
      & "{mokėjimas įvykdytas} failed_payment {mokėjimas nepavyko} "
      & "refunded_payment {mokėjimas grąžintas} other {mokėjimas "
      & "atšauktas}}");
   P ("label.payments.payment_link_label", "{name}: mokėjimo nuoroda");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kortelė} bank_transfer_method {banko "
      & "pervedimas} cash_method {grynieji} wallet_method {elektroninė "
      & "piniginė} check_method {čekis} other {kitas būdas}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {mokėjimas apdorojamas} "
      & "authorized_payment {mokėjimas autorizuotas} paid_payment {mokėjimas "
      & "įvykdytas} failed_payment {mokėjimas nepavyko} refunded_payment "
      & "{mokėjimas grąžintas} other {mokėjimas atšauktas}}");
   P ("label.payments.receipt_label", "kvitas {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {grąžinimas "
      & "apdorojamas} authorized_payment {grąžinimas autorizuotas} "
      & "paid_payment {grąžinimas išmokėtas} failed_payment {grąžinimas "
      & "nepavyko} refunded_payment {grąžinimas užbaigtas} other "
      & "{grąžinimas atšauktas}}");
   P ("label.payments.subtotal_label", "tarpinė suma: {amount_text}");
   P ("label.payments.tax_label", "mokestis: {amount_text}");
   P ("label.payments.total_label", "iš viso: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: prieiga baigiasi {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {suteikta savininko rolė} "
      & "admin_role {suteikta administratoriaus rolė} editor_role {suteikta "
      & "redaktoriaus rolė} viewer_role {suteikta žiūrėtojo rolė} other "
      & "{suteikta pasirinktinė rolė}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {leista} denied "
      & "{uždrausta} inherited {paveldėta} temporary {laikina prieiga} "
      & "expired {nebegalioja} other {reikia patvirtinimo}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {leista} denied {uždrausta} inherited "
      & "{paveldėta} temporary {laikina prieiga} expired {nebegalioja} other "
      & "{reikia patvirtinimo}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {leidžiama pagal politiką} "
      & "policy_denied {draudžiama pagal politiką} policy_warning {politikos "
      & "įspėjimas} other {politika netaikoma}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {atšaukta savininko rolė} "
      & "admin_role {atšaukta administratoriaus rolė} editor_role {atšaukta "
      & "redaktoriaus rolė} viewer_role {atšaukta žiūrėtojo rolė} other "
      & "{atšaukta pasirinktinė rolė}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {savininkas} admin_role {administratorius} "
      & "editor_role {redaktorius} viewer_role {žiūrėtojas} other "
      & "{pasirinktinė rolė}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {tuščia} low_utilization {maža "
      & "apkrova} normal_utilization {normali apkrova} high_utilization "
      & "{didelė apkrova} critical_utilization {kritinė apkrova} "
      & "full_utilization {pilna} other {viršyta riba}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {eilučių} integer_field "
      & "{sveikųjų skaičių} decimal_field {dešimtainių skaičių} "
      & "boolean_field {loginių reikšmių} date_field {datų} date_time_field "
      & "{datos ir laiko reikšmių} object_field {objektų} array_field "
      & "{masyvų} enum_field {išvardijimo reikšmių} binary_field "
      & "{dvejetainių reikšmių} null_field {null reikšmių} any_field {bet "
      & "kokio tipo reikšmių} other {nežinomo tipo reikšmių}} "
      & "masyvas{count_known, select, false {} other {, elementų: {count, "
      & "number}}}");
   P ("label.schema.constraint_label", "{name}: apribojimas {value}");
   P ("label.schema.default_value_label", "laukas {field_name}: numatytoji reikšmė {value}");
   P ("label.schema.deprecated_field_label", "laukas {name} pasenęs, naudokite {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {{count, number} išvardijimo parinktis} few "
      & "{{count, number} išvardijimo parinktys} many {{count, number} "
      & "išvardijimo parinkties} other {{count, number} išvardijimo "
      & "parinkčių}}");
   P ("label.schema.example_value_label", "laukas {field_name}: pavyzdys {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {įprastas laukas} deprecated_field "
      & "{pasenęs laukas} unknown_field {nežinomas laukas} read_only_field "
      & "{tik skaitomas laukas} write_only_field {tik rašomas laukas} other "
      & "{apskaičiuojamas laukas}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {eilutės laukas} integer_field {sveikojo "
      & "skaičiaus laukas} decimal_field {dešimtainio skaičiaus laukas} "
      & "boolean_field {loginis laukas} date_field {datos laukas} "
      & "date_time_field {datos ir laiko laukas} object_field {objekto laukas} "
      & "array_field {masyvo laukas} enum_field {išvardijimo laukas} "
      & "binary_field {dvejetainis laukas} null_field {null laukas} any_field "
      & "{bet kokio tipo laukas} other {nežinomo tipo laukas}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {visi privalomi laukai užpildyti} other "
      & "{neužpildyta privalomų laukų: {count, number}}}");
   P ("label.schema.object_shape_label",
      "objektas, laukų: {fields, number}{required, plural, =0 {} other {, "
      & "privalomų: {required, number}}}{optional, plural, =0 {} other {, "
      & "neprivalomų: {optional, number}}}");
   P ("label.schema.schema_source_label", "schema {name}, versija {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skaliarinė reikšmė} object_shape "
      & "{{count, plural, =0 {objektas} other {objektas, laukų: {count, "
      & "number}}}} array_shape {{count, plural, =0 {masyvas} other {masyvas, "
      & "elementų: {count, number}}}} map_shape {{count, plural, =0 {žodynas} "
      & "other {žodynas, įrašų: {count, number}}}} tuple_shape {{count, "
      & "plural, =0 {kortežas} other {kortežas, elementų: {count, number}}}} "
      & "union_shape {{count, plural, =0 {sąjunga} other {sąjunga, tipų: "
      & "{count, number}}}} empty_shape {tuščia struktūra} other {nežinoma "
      & "struktūra}}");
   P ("label.schema.unknown_field_label", "nežinomas laukas {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {aktyvių filtrų nėra} one {{count, number} "
      & "aktyvus filtras} few {{count, number} aktyvūs filtrai} many {{count, "
      & "number} aktyvaus filtro} other {{count, number} aktyvių filtrų}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {išvalyti filtrus} =1 {išvalyti aktyvų filtrą} "
      & "one {išvalyti {count, number} aktyvų filtrą} few {išvalyti {count, "
      & "number} aktyvius filtrus} many {išvalyti {count, number} aktyvaus "
      & "filtro} other {išvalyti {count, number} aktyvių filtrų}}");
   P ("label.search.facet_label",
      "aspektas {name}, {count, plural, one {{count, number} parinktis} few "
      & "{{count, number} parinktys} many {{count, number} parinkties} other "
      & "{{count, number} parinkčių}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {rezultatų nėra} one {{count, number} "
      & "rezultatas} few {{count, number} rezultatai} many {{count, number} "
      & "rezultato} other {{count, number} rezultatų}}{selected, select, false "
      & "{} other {, pasirinkta}}");
   P ("label.search.filter_label",
      "{state, select, active_filter {filtras {name}: {value}, aktyvus} "
      & "inactive_filter {filtras {name}: {value}, neaktyvus} other {filtras "
      & "{name}: išskirti {value}}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktyvus filtras} inactive_filter "
      & "{neaktyvus filtras} other {išskiriantis filtras}}");
   P ("label.search.no_results_label", "pagal užklausą „{query}“ nieko nerasta");
   P ("label.search.recent_search_label", "naujausia paieška: „{query}“");
   P ("label.search.saved_search_label",
      "išsaugota paieška: {name}{count, plural, =0 {} one {, {count, "
      & "number} rezultatas} few {, {count, number} rezultatai} many {, {count, "
      & "number} rezultato} other {, {count, number} rezultatų}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {naujausių paieškų nėra} one {{count, number} "
      & "naujausia paieška} few {{count, number} naujausios paieškos} many "
      & "{{count, number} naujausios paieškos} other {{count, number} "
      & "naujausių paieškų}}");
   P ("label.search.search_query_label", "paieška: „{query}“");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {rezultatų nėra} one {{count, number} rezultatas} "
      & "few {{count, number} rezultatai} many {{count, number} rezultato} "
      & "other {{count, number} rezultatų}}");
   P ("label.search.search_result_summary_label",
      "pagal užklausą „{query}“: {count, plural, =0 {nieko nerasta} one "
      & "{{count, number} rezultatas} few {{count, number} rezultatai} many "
      & "{{count, number} rezultato} other {{count, number} rezultatų}}");
   P ("label.search.search_scope_label",
      "sritis {name}: {count, plural, =0 {rezultatų nėra} one {{count, "
      & "number} rezultatas} few {{count, number} rezultatai} many {{count, "
      & "number} rezultato} other {{count, number} rezultatų}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {paieška neaktyvi} searching_search "
      & "{ieškoma} complete_search {paieška baigta} empty_search {nieko "
      & "nerasta} other {paieška nepavyko}}");
   P ("label.search.sort_label",
      "rikiavimas: {mode, select, relevance_sort {pagal aktualumą} "
      & "ascending_sort {didėjančia tvarka} descending_sort {mažėjančia "
      & "tvarka} newest_first_sort {naujausi pirmiau} other {seniausi pirmiau}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {pagal aktualumą} ascending_sort "
      & "{didėjančia tvarka} descending_sort {mažėjančia tvarka} "
      & "newest_first_sort {naujausi pirmiau} other {seniausi pirmiau}}");
   P ("label.search.suggestion_label", "gal turėjote omenyje „{query}“?");
   P ("label.secrets.credential_source_label", "prisijungimo duomenys, šaltinis {source}: {count, number}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {reikšmė paslėpta} masked_value "
      & "{reikšmė užmaskuota} suffix_only {tik priesaga} other {tik "
      & "kontrolinis kodas}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {viešas} support_profile {palaikymo} "
      & "audit_profile {audito} other {derinimo}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotacija nereikalinga{days_old, "
      & "plural, =0 {} one {, amžius: {days_old, number} diena} few {, "
      & "amžius: {days_old, number} dienos} many {, amžius: {days_old, "
      & "number} dienos} other {, amžius: {days_old, number} dienų}}} other "
      & "{reikalinga rotacija{days_old, plural, =0 {} one {, amžius: "
      & "{days_old, number} diena} few {, amžius: {days_old, number} dienos} "
      & "many {, amžius: {days_old, number} dienos} other {, amžius: "
      & "{days_old, number} dienų}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API raktas} live_api_key {gamybinis API "
      & "raktas} test_api_key {bandomasis API raktas} github_token {GitHub "
      & "žetonas} aws_access_key {AWS prieigos raktas} google_api_key {Google "
      & "API raktas} slack_token {Slack žetonas} npm_token {npm žetonas} "
      & "bearer_token {nešėjo žetonas} jwt_token {JWT žetonas} "
      & "basic_auth_credential {Basic Auth prisijungimo duomenys} "
      & "password_secret {slaptažodis} private_key {privatusis raktas} "
      & "ssh_private_key {SSH privatusis raktas} webhook_secret {žiniatinklio "
      & "kablio paslaptis} oauth_token {OAuth žetonas} database_url_secret "
      & "{duomenų bazės URL paslaptis} sha1_fingerprint {SHA-1 kontrolinis "
      & "kodas} sha256_fingerprint {SHA-256 kontrolinis kodas} other "
      & "{paslaptis}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {el. paštas} phone_value {telefonas} "
      & "url_value {URL} ip_address_value {IP adresas} token_value {žetonas} "
      & "file_path_value {failo kelias} account_id_value {paskyros ID} "
      & "payment_reference_value {mokėjimo kodas} log_field_value {žurnalo "
      & "laukas} other {jautri reikšmė}}");
   P ("label.tables.cell_label",
      "eilutė {row, number}, stulpelis {column, number}: {state, select, "
      & "empty_cell {tuščia} edited_cell {redaguota} invalid_cell {netinkama "
      & "reikšmė} highlighted_cell {paryškinta} other {tik skaityti}}");
   P ("label.tables.cell_position_label", "eilutė {row, number}, stulpelis {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {tuščias langelis} edited_cell "
      & "{redaguotas langelis} invalid_cell {netinkamas langelis} "
      & "highlighted_cell {paryškintas langelis} other {tik skaitomas "
      & "langelis}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {stulpelių nėra} one {{count, number} stulpelis} "
      & "few {{count, number} stulpeliai} many {{count, number} stulpelio} "
      & "other {{count, number} stulpelių}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {teksto stulpelis} number_column "
      & "{skaičių stulpelis} date_column {datos stulpelis} status_column "
      & "{būsenos stulpelis} action_column {veiksmų stulpelis} other "
      & "{paslėptas stulpelis}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {teksto stulpelis} number_column {skaičių "
      & "stulpelis} date_column {datos stulpelis} status_column {būsenos "
      & "stulpelis} action_column {veiksmų stulpelis} other {paslėptas "
      & "stulpelis}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {{count, number} eilutė} few {{count, "
      & "number} eilutės} many {{count, number} eilutės} other {{count, "
      & "number} eilučių}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {eilučių nėra} one {{count, number} eilutė} few "
      & "{{count, number} eilutės} many {{count, number} eilutės} other "
      & "{{count, number} eilučių}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {nerikiuota} ascending_sort {didėjančia "
      & "tvarka} other {mažėjančia tvarka}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {nerikiuota} ascending_sort {rikiavimas: "
      & "{column_name}, didėjančia tvarka} other {rikiavimas: {column_name}, "
      & "mažėjančia tvarka}}");
   P ("label.tables.subtotal_label", "{name}, tarpinė suma: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} eilutė} few {{rows, number} "
      & "eilutės} many {{rows, number} eilutės} other {{rows, number} "
      & "eilučių}} × {columns, plural, one {{columns, number} stulpelis} few "
      & "{{columns, number} stulpeliai} many {{columns, number} stulpelio} "
      & "other {{columns, number} stulpelių}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee}: priskyrimas panaikintas} "
      & "assigned {priskirta: {assignee}} reassigned {perskirta: {assignee}} "
      & "watching {{assignee}: stebi} other {{assignee}: užduoties "
      & "savininkas}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nepriskirta} assigned {priskirta} "
      & "reassigned {perskirta} watching {stebi} other {užduoties savininkas}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {darbų sąrašas tuščias} one {darbų sąrašas: "
      & "{count, number} užduotis} few {darbų sąrašas: {count, number} "
      & "užduotys} many {darbų sąrašas: {count, number} užduoties} other "
      & "{darbų sąrašas: {count, number} užduočių}}");
   P ("label.tasks.blocker_label", "užblokuota: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {užbaigti užduotį} one {užbaigti {count, "
      & "number} užduotį} few {užbaigti {count, number} užduotis} many "
      & "{užbaigti {count, number} užduoties} other {užbaigti {count, "
      & "number} užduočių}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {užbaigtų užduočių nėra} one {{count, number} "
      & "užbaigta užduotis} few {{count, number} užbaigtos užduotys} many "
      & "{{count, number} užbaigtos užduoties} other {{count, number} "
      & "užbaigtų užduočių}}");
   P ("label.tasks.due_label", "terminas: {due_text}");
   P ("label.tasks.estimate_label", "įvertis: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {atvirų užduočių nėra} one {{count, number} "
      & "atvira užduotis} few {{count, number} atviros užduotys} many "
      & "{{count, number} atviros užduoties} other {{count, number} atvirų "
      & "užduočių}}");
   P ("label.tasks.overdue_label", "vėluojama, terminas: {due_text}");
   P ("label.tasks.recurring_task_label", "kartojasi: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {iš naujo atidaryti užduotį} one {iš naujo "
      & "atidaryti {count, number} užduotį} few {iš naujo atidaryti {count, "
      & "number} užduotis} many {iš naujo atidaryti {count, number} "
      & "užduoties} other {iš naujo atidaryti {count, number} užduočių}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {{count, number} užduotis} few {{count, "
      & "number} užduotys} many {{count, number} užduoties} other {{count, "
      & "number} užduočių}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {{count, number} použduotis} few {{count, "
      & "number} použduotys} many {{count, number} použduoties} other "
      & "{{count, number} použduočių}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {užduočių nėra} one {{count, number} užduotis} "
      & "few {{count, number} užduotys} many {{count, number} užduoties} "
      & "other {{count, number} užduočių}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {atvira} in_progress_task {vykdoma} "
      & "blocked_task {užblokuota} done_task {atlikta} canceled_task "
      & "{atšaukta} deferred_task {atidėta} other {vėluoja}}{priority, "
      & "select, no_priority {} low_priority {, žemas prioritetas} "
      & "medium_priority {, vidutinis prioritetas} high_priority {, aukštas "
      & "prioritetas} other {, kritinis prioritetas}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {be prioriteto} low_priority {žemas "
      & "prioritetas} medium_priority {vidutinis prioritetas} high_priority "
      & "{aukštas prioritetas} other {kritinis prioritetas}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {atvira užduotis} in_progress_task {vykdoma "
      & "užduotis} blocked_task {užblokuota užduotis} done_task {atlikta "
      & "užduotis} canceled_task {atšaukta užduotis} deferred_task {atidėta "
      & "užduotis} other {vėluojanti užduotis}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {viršutinė riba} other {apatinė "
      & "riba}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {žemiau numatyto intervalo} within_range "
      & "{numatytame intervale} above_range {virš numatyto intervalo} "
      & "below_target {žemiau tikslo} at_target {ties tikslu} above_target "
      & "{virš tikslo} near_limit {arti ribos} warning_level {įspėjimo "
      & "slenkstis} critical_level {kritinis slenkstis} breached {slenkstis "
      & "viršytas} other {slenksčio būsena nežinoma}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {naujausia versija} other "
      & "{lenkia per {ahead, plural, one {{ahead, number} komitą} few {{ahead, "
      & "number} komitus} many {{ahead, number} komito} other {{ahead, number} "
      & "komitų}}}}} other {{ahead, plural, =0 {atsilieka per {behind, plural, "
      & "one {{behind, number} komitą} few {{behind, number} komitus} many "
      & "{{behind, number} komito} other {{behind, number} komitų}}} other "
      & "{lenkia per {ahead, plural, one {{ahead, number} komitą} few {{ahead, "
      & "number} komitus} many {{ahead, number} komito} other {{ahead, number} "
      & "komitų}}, atsilieka per {behind, plural, one {{behind, number} "
      & "komitą} few {{behind, number} komitus} many {{behind, number} komito} "
      & "other {{behind, number} komitų}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {patvirtino: {approver}} other {laukiama "
      & "patvirtinimo: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {bandymas 1 iš 1} other "
      & "{bandymas {attempt, number} iš 1, riba viršyta}}} other {bandymas "
      & "{attempt, number} iš {limit, number}}}");
   P ("label.workflows.blocker_label", "užblokuota: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {blokuojančių priklausomybių nėra} one {{count, "
      & "number} blokuojanti priklausomybė} few {{count, number} "
      & "blokuojančios priklausomybės} many {{count, number} blokuojančios "
      & "priklausomybės} other {{count, number} blokuojančių "
      & "priklausomybių}}");
   P ("label.workflows.handoff_label", "perdavimas: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {būsimas etapas} current_milestone "
      & "{dabartinis etapas} complete_milestone {užbaigtas etapas} "
      & "missed_milestone {praleistas etapas} other {užblokuotas etapas}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {būsimas} "
      & "current_milestone {dabartinis} complete_milestone {užbaigtas} "
      & "missed_milestone {praleistas} other {užblokuotas}}");
   P ("label.workflows.next_action_label", "toliau: {action}");
   P ("label.workflows.owner_label", "savininkas: {owner}");
   P ("label.workflows.resume_label", "tęsti {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {laukia paleidimo} active_step {vykdoma} "
      & "waiting_step {laukiama} blocked_step {užblokuota} done_step {atlikta} "
      & "failed_step {nepavyko} other {praleista}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {laukia paleidimo} active_step "
      & "{vykdoma} waiting_step {laukiama} blocked_step {užblokuota} done_step "
      & "{atlikta} failed_step {nepavyko} other {praleista}}");
   P ("label.workflows.waiting_label", "laukiama: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nepradėta} "
      & "in_progress_state {vykdoma} waiting_state {laukiama} "
      & "waiting_approval_state {laukiama patvirtinimo} blocked_state "
      & "{užblokuota} completed_state {užbaigta} failed_state {nepavyko} "
      & "cancelled_state {atšaukta} skipped_state {praleista} other "
      & "{pristabdyta}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nepradėta} in_progress_state "
      & "{vykdoma} waiting_state {laukiama} waiting_approval_state {laukiama "
      & "patvirtinimo} blocked_state {užblokuota} completed_state {užbaigta} "
      & "failed_state {nepavyko} cancelled_state {atšaukta} skipped_state "
      & "{praleista} other {pristabdyta}}");
end Labels_2;
