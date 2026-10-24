separate (Humanize.Catalogs.Phrase_Data.Locale_Cs)
procedure Labels_2 is
begin
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atribut id} class_attribute {atribut "
      & "class} data_attribute {atribut data} aria_attribute {atribut ARIA} "
      & "role_attribute {atribut role} link_attribute {atribut odkazu} "
      & "media_attribute {atribut médií} form_attribute {atribut formuláře} "
      & "boolean_attribute {logický atribut} event_attribute {atribut obsluhy "
      & "události} other {neznámý atribut}}");
   P ("label.markup.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {{form_name}: žádné "
      & "problémy} other {{form_name}: {errors, plural, one {{errors, number} "
      & "chyba} few {{errors, number} chyby} many {{errors, number} chyby} "
      & "other {{errors, number} chyb}}}}} other {{errors, plural, =0 "
      & "{{form_name}: {warnings, plural, one {{warnings, number} varování} "
      & "few {{warnings, number} varování} many {{warnings, number} "
      & "varování} other {{warnings, number} varování}}} other "
      & "{{form_name}: {errors, plural, one {{errors, number} chyba} few "
      & "{{errors, number} chyby} many {{errors, number} chyby} other {{errors, "
      & "number} chyb}}, {warnings, plural, one {{warnings, number} varování} "
      & "few {{warnings, number} varování} many {{warnings, number} "
      & "varování} other {{warnings, number} varování}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {orientační bod: banner} navigation_role "
      & "{orientační bod: navigace} main_role {orientační bod: hlavní "
      & "obsah} complementary_role {orientační bod: doplňkový obsah} "
      & "contentinfo_role {orientační bod: informace o obsahu} search_role "
      & "{orientační bod: vyhledávání} form_role {orientační bod: "
      & "formulář} region_role {orientační bod: oblast} dialog_role "
      & "{dialog} alert_role {živá oblast: výstraha} status_role {živá "
      & "oblast: stav} other {neznámý orientační bod}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, naléhavá aktualizace: {update}} "
      & "other {{region}, běžná aktualizace: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {textový obsah} html_content {obsah HTML} "
      & "json_content {obsah JSON} xml_content {obsah XML} image_content "
      & "{obrázek} audio_content {zvuk} video_content {video} font_content "
      & "{písmo} archive_content {archiv} binary_content {binární data} "
      & "form_content {data formuláře} other {neznámý obsah}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {značka dokumentu} metadata_tag {značka "
      & "metadat} section_tag {značka oddílu} text_tag {textová značka} "
      & "link_tag {značka odkazu} media_tag {značka médií} form_tag "
      & "{značka formuláře} table_tag {značka tabulky} interactive_tag "
      & "{interaktivní značka} scripting_tag {skriptovací značka} other "
      & "{neznámá značka}}");
   P ("label.media.duration_label", "doba trvání: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {obrázek} video_media {video} audio_media "
      & "{zvuk} pdf_document {dokument PDF} text_document {textový dokument} "
      & "archive_media {archiv} other {médium}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {připraveno} processing_media "
      & "{zpracování} transcoding_media {překódování} thumbnail_missing "
      & "{náhled není k dispozici} metadata_missing {chybí metadata} "
      & "locked_document {dokument uzamčen} other {nedostupné}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {obrázek} video_media {video} "
      & "audio_media {zvuk} pdf_document {dokument PDF} text_document {textový "
      & "dokument} archive_media {archiv} other {médium}}): {state, select, "
      & "ready_media {připraveno} processing_media {zpracování} "
      & "transcoding_media {překódování} thumbnail_missing {náhled není k "
      & "dispozici} metadata_missing {chybí metadata} locked_document "
      & "{uzamčeno} other {nedostupné}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {žádné stránky} one {{pages, number} stránka} "
      & "few {{pages, number} stránky} many {{pages, number} stránky} other "
      & "{{pages, number} stránek}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: {state, select, open_report {odvolání otevřeno} "
      & "triaged_report {odvolání posouzeno} actioned_report {odvolání – "
      & "přijato opatření} dismissed_report {odvolání zamítnuto} "
      & "appealed_report {odvolání podáno} other {odvolání uzavřeno}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {žádný zásah moderátora} flagged "
      & "{označeno} hidden {skryto moderátorem} restored {obnoveno} "
      & "marked_spam {označeno jako spam} removed {odstraněno} other "
      & "{eskalováno}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {žádný zásah moderátora} "
      & "flagged {označeno} hidden {skryto moderátorem} restored {obnoveno} "
      & "marked_spam {označeno jako spam} removed {odstraněno} other "
      & "{eskalováno}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {fronta moderace je "
      & "prázdná} other {ke kontrole: {pending, number}}}} other {ke "
      & "kontrole: {pending, number}, eskalováno: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {otevřené hlášení} "
      & "triaged_report {posouzené hlášení} actioned_report {hlášení – "
      & "přijato opatření} dismissed_report {zamítnuté hlášení} "
      & "appealed_report {hlášení s odvoláním} other {uzavřené "
      & "hlášení}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {otevřené hlášení} triaged_report "
      & "{posouzené hlášení} actioned_report {hlášení – přijato "
      & "opatření} dismissed_report {zamítnuté hlášení} appealed_report "
      & "{hlášení s odvoláním} other {uzavřené hlášení}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {čeká na kontrolu} approved "
      & "{schváleno} rejected {zamítnuto} needs_changes {vyžaduje změny} "
      & "other {kontrola eskalována}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {čeká na kontrolu} approved "
      & "{schváleno} rejected {zamítnuto} needs_changes {vyžaduje změny} "
      & "other {kontrola eskalována}}");
   P ("label.navigation.back_label", "zpět: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {žádná drobečková navigace} one {drobečková "
      & "navigace: 1 úroveň} few {drobečková navigace: {depth, number} "
      & "úrovně} many {drobečková navigace: {depth, number} úrovně} other "
      & "{drobečková navigace: {depth, number} úrovní}}");
   P ("label.navigation.current_page_label", "aktuální stránka: {name}");
   P ("label.navigation.external_link_label", "{name} (externí odkaz)");
   P ("label.navigation.first_label", "první: {target}");
   P ("label.navigation.last_label", "poslední: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {žádné položky nabídky} one {1 položka "
      & "nabídky} few {{count, number} položky nabídky} many {{count, "
      & "number} položky nabídky} other {{count, number} položek nabídky}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {odkaz} menu_item {položka nabídky} "
      & "tab_item {karta} breadcrumb_item {položka drobečkové navigace} "
      & "section_item {sekce} other {oddělovač}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {odkaz {state, select, current_item "
      & "{aktuální} active_item {aktivní} inactive_item {neaktivní} "
      & "disabled_item {zakázaný} expanded_item {rozbalený} collapsed_item "
      & "{sbalený} visited_item {navštívený} other {externí}}} menu_item "
      & "{položka nabídky {state, select, current_item {aktuální} "
      & "active_item {aktivní} inactive_item {neaktivní} disabled_item "
      & "{zakázaná} expanded_item {rozbalená} collapsed_item {sbalená} "
      & "visited_item {navštívená} other {externí}}} tab_item {karta "
      & "{state, select, current_item {aktuální} active_item {aktivní} "
      & "inactive_item {neaktivní} disabled_item {zakázaná} expanded_item "
      & "{rozbalená} collapsed_item {sbalená} visited_item {navštívená} "
      & "other {externí}}} breadcrumb_item {položka drobečkové navigace "
      & "{state, select, current_item {aktuální} active_item {aktivní} "
      & "inactive_item {neaktivní} disabled_item {zakázaná} expanded_item "
      & "{rozbalená} collapsed_item {sbalená} visited_item {navštívená} "
      & "other {externí}}} section_item {sekce {state, select, current_item "
      & "{aktuální} active_item {aktivní} inactive_item {neaktivní} "
      & "disabled_item {zakázaná} expanded_item {rozbalená} collapsed_item "
      & "{sbalená} visited_item {navštívená} other {externí}}} other "
      & "{oddělovač {state, select, current_item {aktuální} active_item "
      & "{aktivní} inactive_item {neaktivní} disabled_item {zakázaný} "
      & "expanded_item {rozbalený} collapsed_item {sbalený} visited_item "
      & "{navštívený} other {externí}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {aktuální} active_item {aktivní} "
      & "inactive_item {neaktivní} disabled_item {zakázaný} expanded_item "
      & "{rozbalený} collapsed_item {sbalený} visited_item {navštívený} "
      & "other {externí}}");
   P ("label.navigation.next_label", "další: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {sekce sbalená} other {sekce "
      & "rozbalená}}{count, plural, =0 {} one {, 1 položka} few {, {count, "
      & "number} položky} many {, {count, number} položky} other {, {count, "
      & "number} položek}}");
   P ("label.navigation.skip_link_label", "přejít na: {target}");
   P ("label.navigation.submenu_label",
      "{name}: podnabídka, {count, plural, one {1 položka} few {{count, "
      & "number} položky} many {{count, number} položky} other {{count, "
      & "number} položek}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {všechny výstrahy} important_alerts "
      & "{důležité výstrahy} critical_alerts_only {pouze kritické "
      & "výstrahy} other {žádné výstrahy}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: {state, select, preference_enabled {oznámení zapnuta} "
      & "preference_disabled {oznámení vypnuta} preference_inherited "
      & "{oznámení zděděna} other {oznámení povinná}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {bez souhrnu} instant_digest {okamžitý "
      & "souhrn} daily_digest {denní souhrn} other {týdenní souhrn}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {zapnuto} preference_disabled "
      & "{vypnuto} preference_inherited {zděděno} other {povinné}}");
   P ("label.notification_preferences.quiet_hours_label", "tiché hodiny: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: odběr {scope, select, thread_subscription {vlákna} "
      & "project_subscription {projektu} team_subscription {týmu} other "
      & "{účtu}} {state, select, preference_enabled {zapnut} "
      & "preference_disabled {vypnut} preference_inherited {zděděn} other "
      & "{povinný}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {odběr vlákna} "
      & "project_subscription {odběr projektu} team_subscription {odběr "
      & "týmu} other {odběr účtu}}");
   P ("label.notifications.actor_event_label",
      "{actor}: {event, select, mention_event {zmínka o vás} reply_event "
      & "{odpověď} assignment_event {přiřazení vám} approval_event "
      & "{žádost o schválení} alert_event {výstraha} digest_event {souhrn} "
      & "reminder_event {připomenutí} other {systémové oznámení}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {oznámení v aplikaci} email_channel "
      & "{e-mailové oznámení} sms_channel {oznámení SMS} push_channel "
      & "{oznámení push} webhook_channel {oznámení webhooku} other "
      & "{souhrnné oznámení}}: {state, select, pending_delivery {čeká} "
      & "sent_delivery {odesláno} delivered_delivery {doručeno} "
      & "failed_delivery {selhalo} retrying_delivery {opakování} other "
      & "{zrušeno}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {čekající oznámení} "
      & "sent_delivery {odeslané oznámení} delivered_delivery {doručené "
      & "oznámení} failed_delivery {neúspěšné oznámení} "
      & "retrying_delivery {opakované odeslání oznámení} other {zrušené "
      & "oznámení}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {čeká {time_text}} sent_delivery "
      & "{odesláno {time_text}} delivered_delivery {doručeno {time_text}} "
      & "failed_delivery {selhalo {time_text}} retrying_delivery {opakování "
      & "{time_text}} other {zrušeno {time_text}}}");
   P ("label.notifications.digest_label",
      "{name} – souhrn: {count, plural, =0 {žádná oznámení} one {1 "
      & "oznámení} few {{count, number} oznámení} many {{count, number} "
      & "oznámení} other {{count, number} oznámení}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {žádné zmínky} "
      & "one {1 zmínka} few {{count, number} zmínky} many {{count, number} "
      & "zmínky} other {{count, number} zmínek}}} reply_event {{count, "
      & "plural, =0 {žádné odpovědi} one {1 odpověď} few {{count, number} "
      & "odpovědi} many {{count, number} odpovědi} other {{count, number} "
      & "odpovědí}}} assignment_event {{count, plural, =0 {žádná "
      & "přiřazení} one {1 přiřazení} few {{count, number} přiřazení} "
      & "many {{count, number} přiřazení} other {{count, number} "
      & "přiřazení}}} approval_event {{count, plural, =0 {žádné žádosti "
      & "o schválení} one {1 žádost o schválení} few {{count, number} "
      & "žádosti o schválení} many {{count, number} žádosti o "
      & "schválení} other {{count, number} žádostí o schválení}}} "
      & "alert_event {{count, plural, =0 {žádné výstrahy} one {1 výstraha} "
      & "few {{count, number} výstrahy} many {{count, number} výstrahy} other "
      & "{{count, number} výstrah}}} digest_event {{count, plural, =0 "
      & "{žádné souhrny} one {1 souhrn} few {{count, number} souhrny} many "
      & "{{count, number} souhrnu} other {{count, number} souhrnů}}} "
      & "reminder_event {{count, plural, =0 {žádná připomenutí} one {1 "
      & "připomenutí} few {{count, number} připomenutí} many {{count, "
      & "number} připomenutí} other {{count, number} připomenutí}}} other "
      & "{{count, plural, =0 {žádná systémová oznámení} one {1 "
      & "systémové oznámení} few {{count, number} systémová oznámení} "
      & "many {{count, number} systémového oznámení} other {{count, number} "
      & "systémových oznámení}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {označit oznámení jako přečtené} few "
      & "{označit {count, number} oznámení jako přečtená} many {označit "
      & "{count, number} oznámení jako přečtená} other {označit {count, "
      & "number} oznámení jako přečtená}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {označit oznámení jako nepřečtené} few "
      & "{označit {count, number} oznámení jako nepřečtená} many "
      & "{označit {count, number} oznámení jako nepřečtená} other "
      & "{označit {count, number} oznámení jako nepřečtená}}");
   P ("label.notifications.muted_label", "{name}: oznámení ztlumena");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nová zmínka} reply_event {nová "
      & "odpověď} assignment_event {nové přiřazení} approval_event {nová "
      & "žádost o schválení} alert_event {nová výstraha} digest_event "
      & "{nový souhrn} reminder_event {nové připomenutí} other {nové "
      & "systémové oznámení}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {oznámení v aplikaci} email_channel "
      & "{e-mailová oznámení} sms_channel {oznámení SMS} push_channel "
      & "{oznámení push} webhook_channel {oznámení webhooku} other "
      & "{souhrnná oznámení}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {žádná oznámení} one {1 oznámení} few "
      & "{{count, number} oznámení} many {{count, number} oznámení} other "
      & "{{count, number} oznámení}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {zmínka} reply_event {odpověď} "
      & "assignment_event {přiřazení} approval_event {žádost o "
      & "schválení} alert_event {výstraha} digest_event {souhrn} "
      & "reminder_event {připomenutí} other {systémové oznámení}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {žádná oznámení} one {1 oznámení} "
      & "few {{count, number} oznámení} many {{count, number} oznámení} "
      & "other {{count, number} oznámení}}");
   P ("label.notifications.notification_label",
      "{subject} ({event, select, mention_event {zmínka} reply_event "
      & "{odpověď} assignment_event {přiřazení} approval_event {žádost o "
      & "schválení} alert_event {výstraha} digest_event {souhrn} "
      & "reminder_event {připomenutí} other {systémové oznámení}}): "
      & "oznámení {state, select, unread_state {nepřečtené} read_state "
      & "{přečtené} archived_state {archivované} muted_state {ztlumené} "
      & "snoozed_state {odložené} other {potlačené}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {nepřečtené oznámení} read_state "
      & "{přečtené oznámení} archived_state {archivované oznámení} "
      & "muted_state {ztlumené oznámení} snoozed_state {odložené "
      & "oznámení} other {potlačené oznámení}}");
   P ("label.notifications.snoozed_label", "{name}: oznámení odložena");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {žádná potlačená oznámení} one {1 "
      & "potlačené oznámení} few {{count, number} potlačená oznámení} "
      & "many {{count, number} potlačeného oznámení} other {{count, number} "
      & "potlačených oznámení}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {žádná nepřečtená oznámení} one {1 "
      & "nepřečtené oznámení} few {{count, number} nepřečtená "
      & "oznámení} many {{count, number} nepřečteného oznámení} other "
      & "{{count, number} nepřečtených oznámení}}");
   P ("label.payments.amount_label", "částka: {amount_text}");
   P ("label.payments.balance_label", "zůstatek: {amount_text}");
   P ("label.payments.chargeback_label", "zpětné zúčtování: {amount_text}");
   P ("label.payments.discount_label", "sleva: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, splatnost {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {žádné faktury} one {1 faktura} few {{count, "
      & "number} faktury} many {{count, number} faktury} other {{count, number} "
      & "faktur}}");
   P ("label.payments.invoice_label",
      "faktura {number}: {state, select, draft_invoice {koncept} open_invoice "
      & "{otevřená} paid_invoice {zaplacená} overdue_invoice {po splatnosti} "
      & "other {stornovaná}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {koncept faktury} open_invoice "
      & "{otevřená faktura} paid_invoice {zaplacená faktura} overdue_invoice "
      & "{faktura po splatnosti} other {stornovaná faktura}}");
   P ("label.payments.method_label",
      "{method, select, card_method {zaplaceno kartou: {detail}} "
      & "bank_transfer_method {zaplaceno bankovním převodem: {detail}} "
      & "cash_method {zaplaceno hotově: {detail}} wallet_method {zaplaceno "
      & "digitální peněženkou: {detail}} check_method {zaplaceno šekem: "
      & "{detail}} other {zaplaceno jinak: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}, zaplaceno {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {žádné platby} one {1 platba} few {{count, "
      & "number} platby} many {{count, number} platby} other {{count, number} "
      & "plateb}}");
   P ("label.payments.payment_label",
      "{amount_text}: platba {state, select, pending_payment {čeká} "
      & "authorized_payment {autorizována} paid_payment {provedena} "
      & "failed_payment {selhala} refunded_payment {vrácena} other {zrušena}}");
   P ("label.payments.payment_link_label", "{name}: platební odkaz");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {karta} bank_transfer_method {bankovní "
      & "převod} cash_method {hotovost} wallet_method {digitální "
      & "peněženka} check_method {šek} other {jiný způsob}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {čekající platba} "
      & "authorized_payment {autorizovaná platba} paid_payment {provedená "
      & "platba} failed_payment {neúspěšná platba} refunded_payment "
      & "{vrácená platba} other {zrušená platba}}");
   P ("label.payments.receipt_label", "účtenka {number}");
   P ("label.payments.refund_label",
      "{amount_text}: refundace {state, select, pending_payment {čeká} "
      & "authorized_payment {autorizována} paid_payment {vyplacena} "
      & "failed_payment {selhala} refunded_payment {dokončena} other "
      & "{zrušena}}");
   P ("label.payments.subtotal_label", "mezisoučet: {amount_text}");
   P ("label.payments.tax_label", "daň: {amount_text}");
   P ("label.payments.total_label", "celkem: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: přístup vyprší {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {udělena role vlastníka} "
      & "admin_role {udělena role správce} editor_role {udělena role "
      & "editora} viewer_role {udělena role čtenáře} other {udělena "
      & "vlastní role}}");
   P ("label.permissions.permission_label",
      "{subject}: {action} – {state, select, granted {uděleno} denied "
      & "{zamítnuto} inherited {zděděno} temporary {dočasný přístup} "
      & "expired {vypršelo} other {vyžaduje schválení}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {uděleno} denied {zamítnuto} inherited "
      & "{zděděno} temporary {dočasný přístup} expired {vypršelo} other "
      & "{vyžaduje schválení}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {zásada povoluje} policy_denied "
      & "{zásada zakazuje} policy_warning {upozornění zásady} other "
      & "{zásada se nepoužije}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {odebrána role vlastníka} "
      & "admin_role {odebrána role správce} editor_role {odebrána role "
      & "editora} viewer_role {odebrána role čtenáře} other {odebrána "
      & "vlastní role}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {vlastník} admin_role {správce} "
      & "editor_role {editor} viewer_role {čtenář} other {vlastní role}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {bez využití} low_utilization "
      & "{nízké využití} normal_utilization {normální využití} "
      & "high_utilization {vysoké využití} critical_utilization {kritické "
      & "využití} full_utilization {plné využití} other {překročen "
      & "limit}}");
   P ("label.schema.array_shape_label",
      "pole {element_type, select, string_field {řetězců} integer_field "
      & "{celých čísel} decimal_field {desetinných čísel} boolean_field "
      & "{logických hodnot} date_field {dat} date_time_field {hodnot data a "
      & "času} object_field {objektů} array_field {polí} enum_field "
      & "{výčtových hodnot} binary_field {binárních dat} null_field "
      & "{hodnot null} any_field {libovolných hodnot} other {hodnot "
      & "neznámého typu}}{count_known, select, false {} other { ({count, "
      & "plural, one {1 prvek} few {{count, number} prvky} many {{count, "
      & "number} prvku} other {{count, number} prvků}})}}");
   P ("label.schema.constraint_label", "{name}: omezení {value}");
   P ("label.schema.default_value_label", "pole {field_name}: výchozí hodnota {value}");
   P ("label.schema.deprecated_field_label", "pole {name} je zastaralé, použijte {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 možnost výčtu} few {{count, number} "
      & "možnosti výčtu} many {{count, number} možnosti výčtu} other "
      & "{{count, number} možností výčtu}}");
   P ("label.schema.example_value_label", "pole {field_name}: příklad {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {běžné pole} deprecated_field "
      & "{zastaralé pole} unknown_field {neznámé pole} read_only_field {pole "
      & "jen pro čtení} write_only_field {pole jen pro zápis} other "
      & "{vypočítané pole}}");
   P ("label.schema.field_type_label",
      "pole typu {kind, select, string_field {řetězec} integer_field {celé "
      & "číslo} decimal_field {desetinné číslo} boolean_field {logická "
      & "hodnota} date_field {datum} date_time_field {datum a čas} "
      & "object_field {objekt} array_field {pole} enum_field {výčet} "
      & "binary_field {binární data} null_field {null} any_field {libovolný} "
      & "other {neznámý}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {nechybí žádná povinná pole} other "
      & "{chybějící povinná pole: {count, number}}}");
   P ("label.schema.object_shape_label",
      "objekt, pole: {fields, number}{required, plural, =0 {} other {, "
      & "povinná: {required, number}}}{optional, plural, =0 {} other {, "
      & "volitelná: {optional, number}}}");
   P ("label.schema.schema_source_label", "schéma {name}, verze {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalární hodnota} object_shape {{count, "
      & "plural, =0 {objekt} other {objekt, pole: {count, number}}}} "
      & "array_shape {{count, plural, =0 {pole} other {pole, prvky: {count, "
      & "number}}}} map_shape {{count, plural, =0 {mapa} other {mapa, položky: "
      & "{count, number}}}} tuple_shape {{count, plural, =0 {n-tice} other "
      & "{n-tice, prvky: {count, number}}}} union_shape {{count, plural, =0 "
      & "{sjednocení} other {sjednocení, typy: {count, number}}}} empty_shape "
      & "{prázdný tvar} other {neznámý tvar}}");
   P ("label.schema.unknown_field_label", "neznámé pole {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {žádné aktivní filtry} one {1 aktivní filtr} "
      & "few {{count, number} aktivní filtry} many {{count, number} aktivního "
      & "filtru} other {{count, number} aktivních filtrů}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {vymazat filtry} one {vymazat aktivní filtr} few "
      & "{vymazat {count, number} aktivní filtry} many {vymazat {count, "
      & "number} aktivního filtru} other {vymazat {count, number} aktivních "
      & "filtrů}}");
   P ("label.search.facet_label",
      "{count, plural, one {fazeta {name}, 1 možnost} few {fazeta {name}, "
      & "{count, number} možnosti} many {fazeta {name}, {count, number} "
      & "možnosti} other {fazeta {name}, {count, number} možností}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {žádné výsledky} one {1 výsledek} few "
      & "{{count, number} výsledky} many {{count, number} výsledku} other "
      & "{{count, number} výsledků}}{selected, select, false {} other {, "
      & "vybráno}}");
   P ("label.search.filter_label",
      "{name}: {value} – {state, select, active_filter {aktivní filtr} "
      & "inactive_filter {neaktivní filtr} other {vylučující filtr}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktivní filtr} inactive_filter "
      & "{neaktivní filtr} other {vylučující filtr}}");
   P ("label.search.no_results_label", "žádné výsledky pro „{query}“");
   P ("label.search.recent_search_label", "nedávné hledání: „{query}“");
   P ("label.search.saved_search_label",
      "uložené hledání: {name}{count, plural, =0 {} one {, 1 výsledek} "
      & "few {, {count, number} výsledky} many {, {count, number} výsledku} "
      & "other {, {count, number} výsledků}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {žádná nedávná hledání} one {1 nedávné "
      & "hledání} few {{count, number} nedávná hledání} many {{count, "
      & "number} nedávného hledání} other {{count, number} nedávných "
      & "hledání}}");
   P ("label.search.search_query_label", "hledat „{query}“");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {žádné výsledky} one {1 výsledek} few {{count, "
      & "number} výsledky} many {{count, number} výsledku} other {{count, "
      & "number} výsledků}}");
   P ("label.search.search_result_summary_label",
      "výsledky pro „{query}“: {count, plural, =0 {žádné výsledky} "
      & "one {1 výsledek} few {{count, number} výsledky} many {{count, "
      & "number} výsledku} other {{count, number} výsledků}}");
   P ("label.search.search_scope_label",
      "rozsah {name}, {count, plural, =0 {žádné výsledky} one {1 "
      & "výsledek} few {{count, number} výsledky} many {{count, number} "
      & "výsledku} other {{count, number} výsledků}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {hledání nečinné} searching_search "
      & "{probíhá hledání} complete_search {hledání dokončeno} "
      & "empty_search {žádné výsledky hledání} other {hledání selhalo}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {řadit podle relevance} ascending_sort "
      & "{řadit vzestupně} descending_sort {řadit sestupně} "
      & "newest_first_sort {řadit od nejnovějších} other {řadit od "
      & "nejstarších}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevance} ascending_sort {vzestupně} "
      & "descending_sort {sestupně} newest_first_sort {od nejnovějších} "
      & "other {od nejstarších}}");
   P ("label.search.suggestion_label", "měli jste na mysli „{query}“?");
   P ("label.secrets.credential_source_label",
      "{source}: {count, plural, one {1 přihlašovací údaj} few {{count, "
      & "number} přihlašovací údaje} many {{count, number} "
      & "přihlašovacího údaje} other {{count, number} přihlašovacích "
      & "údajů}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {hodnota skryta} masked_value {hodnota "
      & "maskována} suffix_only {pouze přípona} other {pouze otisk}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {veřejný} support_profile {podpora} "
      & "audit_profile {audit} other {ladění}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotace není nutná} other {nutná "
      & "rotace}}{days_old, plural, =0 {} one {, stáří: 1 den} few {, "
      & "stáří: {days_old, number} dny} many {, stáří: {days_old, number} "
      & "dne} other {, stáří: {days_old, number} dní}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {klíč API} live_api_key {produkční klíč "
      & "API} test_api_key {testovací klíč API} github_token {token GitHub} "
      & "aws_access_key {přístupový klíč AWS} google_api_key {klíč "
      & "Google API} slack_token {token Slack} npm_token {token npm} "
      & "bearer_token {token bearer} jwt_token {token JWT} "
      & "basic_auth_credential {přihlašovací údaje Basic Auth} "
      & "password_secret {heslo} private_key {soukromý klíč} ssh_private_key "
      & "{soukromý klíč SSH} webhook_secret {tajný klíč webhooku} "
      & "oauth_token {token OAuth} database_url_secret {tajný údaj v URL "
      & "databáze} sha1_fingerprint {otisk SHA-1} sha256_fingerprint {otisk "
      & "SHA-256} other {tajný údaj}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefon} url_value "
      & "{URL} ip_address_value {adresa IP} token_value {token} file_path_value "
      & "{cesta k souboru} account_id_value {ID účtu} payment_reference_value "
      & "{platební reference} log_field_value {pole protokolu} other {citlivá "
      & "hodnota}}");
   P ("label.tables.cell_label",
      "řádek {row, number}, sloupec {column, number}: {state, select, "
      & "empty_cell {prázdná} edited_cell {upravená} invalid_cell "
      & "{neplatná} highlighted_cell {zvýrazněná} other {jen pro čtení}}");
   P ("label.tables.cell_position_label", "řádek {row, number}, sloupec {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {prázdná buňka} edited_cell {upravená "
      & "buňka} invalid_cell {neplatná buňka} highlighted_cell "
      & "{zvýrazněná buňka} other {buňka jen pro čtení}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {žádné sloupce} one {1 sloupec} few {{count, "
      & "number} sloupce} many {{count, number} sloupce} other {{count, number} "
      & "sloupců}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {textový sloupec} number_column "
      & "{číselný sloupec} date_column {sloupec data} status_column {sloupec "
      & "stavu} action_column {sloupec akcí} other {skrytý sloupec}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {textový sloupec} number_column "
      & "{číselný sloupec} date_column {sloupec data} status_column {sloupec "
      & "stavu} action_column {sloupec akcí} other {skrytý sloupec}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {1 řádek} few {{count, number} řádky} "
      & "many {{count, number} řádku} other {{count, number} řádků}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {žádné řádky} one {1 řádek} few {{count, "
      & "number} řádky} many {{count, number} řádku} other {{count, number} "
      & "řádků}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {neseřazeno} ascending_sort {vzestupně} "
      & "other {sestupně}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {neseřazeno} ascending_sort {seřazeno "
      & "podle {column_name} vzestupně} other {seřazeno podle {column_name} "
      & "sestupně}}");
   P ("label.tables.subtotal_label", "mezisoučet {name}: {value}");
   P ("label.tables.table_size_label", "řádky: {rows, number}, sloupce: {columns, number}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {nepřiřazeno} assigned "
      & "{přiřazeno} reassigned {znovu přiřazeno} watching {sleduje} other "
      & "{vlastník úkolu}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nepřiřazeno} assigned {přiřazeno} "
      & "reassigned {znovu přiřazeno} watching {sledováno} other {vlastník "
      & "úkolu}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {prázdný backlog} one {backlog: 1 úkol} few "
      & "{backlog: {count, number} úkoly} many {backlog: {count, number} "
      & "úkolu} other {backlog: {count, number} úkolů}}");
   P ("label.tasks.blocker_label", "blokováno: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {dokončit úkol} few {dokončit {count, number} "
      & "úkoly} many {dokončit {count, number} úkolu} other {dokončit "
      & "{count, number} úkolů}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {žádné dokončené úkoly} one {1 dokončený "
      & "úkol} few {{count, number} dokončené úkoly} many {{count, number} "
      & "dokončeného úkolu} other {{count, number} dokončených úkolů}}");
   P ("label.tasks.due_label", "termín: {due_text}");
   P ("label.tasks.estimate_label", "odhad: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {žádné otevřené úkoly} one {1 otevřený "
      & "úkol} few {{count, number} otevřené úkoly} many {{count, number} "
      & "otevřeného úkolu} other {{count, number} otevřených úkolů}}");
   P ("label.tasks.overdue_label", "po termínu od {due_text}");
   P ("label.tasks.recurring_task_label", "opakování: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {znovu otevřít úkol} few {znovu otevřít "
      & "{count, number} úkoly} many {znovu otevřít {count, number} úkolu} "
      & "other {znovu otevřít {count, number} úkolů}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 úkol} few {{count, number} úkoly} "
      & "many {{count, number} úkolu} other {{count, number} úkolů}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 dílčí úkol} few {{count, number} "
      & "dílčí úkoly} many {{count, number} dílčího úkolu} other "
      & "{{count, number} dílčích úkolů}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {žádné úkoly} one {1 úkol} few {{count, "
      & "number} úkoly} many {{count, number} úkolu} other {{count, number} "
      & "úkolů}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {otevřený úkol} in_progress_task "
      & "{rozpracovaný úkol} blocked_task {blokovaný úkol} done_task "
      & "{dokončený úkol} canceled_task {zrušený úkol} deferred_task "
      & "{odložený úkol} other {úkol po termínu}}{priority, select, "
      & "no_priority {} low_priority {, nízká priorita} medium_priority {, "
      & "střední priorita} high_priority {, vysoká priorita} other {, "
      & "kritická priorita}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {bez priority} low_priority {nízká "
      & "priorita} medium_priority {střední priorita} high_priority {vysoká "
      & "priorita} other {kritická priorita}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {otevřený úkol} in_progress_task "
      & "{rozpracovaný úkol} blocked_task {blokovaný úkol} done_task "
      & "{dokončený úkol} canceled_task {zrušený úkol} deferred_task "
      & "{odložený úkol} other {úkol po termínu}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {horní limit} other {dolní limit}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {pod očekávaným rozsahem} within_range "
      & "{v očekávaném rozsahu} above_range {nad očekávaným rozsahem} "
      & "below_target {pod cílem} at_target {cíl splněn} above_target {nad "
      & "cílem} near_limit {blízko limitu} warning_level {práh varování} "
      & "critical_level {kritický práh} breached {překročeno} other "
      & "{neznámý stav prahu}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {aktuální} other {commity "
      & "napřed: {ahead, number}}}} other {{ahead, plural, =0 {commity pozadu: "
      & "{behind, number}} other {commity napřed: {ahead, number}, pozadu: "
      & "{behind, number}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {schváleno: {approver}} other {čeká na "
      & "schválení: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {pokus 1 z 1} other {pokus "
      & "{attempt, number} z 1 – limit překročen}}} other {pokus {attempt, "
      & "number} z {limit, number}}}");
   P ("label.workflows.blocker_label", "blokováno: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {žádné blokující závislosti} one {1 "
      & "blokující závislost} few {{count, number} blokující závislosti} "
      & "many {{count, number} blokující závislosti} other {{count, number} "
      & "blokujících závislostí}}");
   P ("label.workflows.handoff_label", "předání: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {nadcházející milník} "
      & "current_milestone {aktuální milník} complete_milestone {dokončený "
      & "milník} missed_milestone {zmeškaný milník} other {blokovaný "
      & "milník}}");
   P ("label.workflows.milestone_status_label",
      "milník {name}: {state, select, upcoming_milestone {nadcházející} "
      & "current_milestone {aktuální} complete_milestone {dokončený} "
      & "missed_milestone {zmeškaný} other {blokovaný}}");
   P ("label.workflows.next_action_label", "další krok: {action}");
   P ("label.workflows.owner_label", "vlastník: {owner}");
   P ("label.workflows.resume_label", "obnovit {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {nevyřízený} active_step {aktivní} "
      & "waiting_step {čekající} blocked_step {blokovaný} done_step "
      & "{hotový} failed_step {neúspěšný} other {přeskočený}}");
   P ("label.workflows.step_status_label",
      "krok {name}: {state, select, pending_step {nevyřízený} active_step "
      & "{aktivní} waiting_step {čekající} blocked_step {blokovaný} "
      & "done_step {hotový} failed_step {neúspěšný} other {přeskočený}}");
   P ("label.workflows.waiting_label", "čeká na: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nezahájeno} "
      & "in_progress_state {probíhá} waiting_state {čeká} "
      & "waiting_approval_state {čeká na schválení} blocked_state "
      & "{blokováno} completed_state {dokončeno} failed_state {selhalo} "
      & "cancelled_state {zrušeno} skipped_state {přeskočeno} other "
      & "{pozastaveno}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nezahájeno} in_progress_state "
      & "{probíhá} waiting_state {čeká} waiting_approval_state {čeká na "
      & "schválení} blocked_state {blokováno} completed_state {dokončeno} "
      & "failed_state {selhalo} cancelled_state {zrušeno} skipped_state "
      & "{přeskočeno} other {pozastaveno}}");
   P ("label.contrast.opacity_label",
      "{percent}, {state, select, transparent {průhledná} "
      & "mostly_transparent {převážně průhledná} translucent "
      & "{průsvitná} mostly_opaque {převážně neprůhledná} other "
      & "{neprůhledná}}");
end Labels_2;
