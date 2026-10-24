separate (Humanize.Catalogs.Phrase_Data.Locale_Sk)
procedure Labels_2 is
begin
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {žiadne problémy prístupnosti} one "
      & "{{issues, number} problém prístupnosti} few {{issues, number} "
      & "problémy prístupnosti} many {{issues, number} problému "
      & "prístupnosti} other {{issues, number} problémov prístupnosti}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atribút id} class_attribute {atribút "
      & "class} data_attribute {atribút data} aria_attribute {atribút ARIA} "
      & "role_attribute {atribút role} link_attribute {atribút odkazu} "
      & "media_attribute {atribút médií} form_attribute {atribút "
      & "formulára} boolean_attribute {logický atribút} event_attribute "
      & "{atribút obsluhy udalosti} other {neznámy atribút}}");
   P ("label.markup.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {{form_name}: žiadne "
      & "problémy} other {{form_name}: {errors, plural, one {{errors, number} "
      & "chyba} few {{errors, number} chyby} many {{errors, number} chyby} "
      & "other {{errors, number} chýb}}}}} other {{errors, plural, =0 "
      & "{{form_name}: {warnings, plural, one {{warnings, number} upozornenie} "
      & "few {{warnings, number} upozornenia} many {{warnings, number} "
      & "upozornenia} other {{warnings, number} upozornení}}} other "
      & "{{form_name}: {errors, plural, one {{errors, number} chyba} few "
      & "{{errors, number} chyby} many {{errors, number} chyby} other {{errors, "
      & "number} chýb}}, {warnings, plural, one {{warnings, number} "
      & "upozornenie} few {{warnings, number} upozornenia} many {{warnings, "
      & "number} upozornenia} other {{warnings, number} upozornení}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {orientačný bod: banner} navigation_role "
      & "{orientačný bod: navigácia} main_role {orientačný bod: hlavný "
      & "obsah} complementary_role {orientačný bod: doplnkový obsah} "
      & "contentinfo_role {orientačný bod: informácie o obsahu} search_role "
      & "{orientačný bod: vyhľadávanie} form_role {orientačný bod: "
      & "formulár} region_role {orientačný bod: oblasť} dialog_role "
      & "{dialógové okno} alert_role {živá oblasť: výstraha} status_role "
      & "{živá oblasť: stav} other {neznámy orientačný bod}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, naliehavá aktualizácia: {update}} "
      & "other {{region}, bežná aktualizácia: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {textový obsah} html_content {obsah HTML} "
      & "json_content {obsah JSON} xml_content {obsah XML} image_content "
      & "{obrázok} audio_content {zvuk} video_content {video} font_content "
      & "{písmo} archive_content {archív} binary_content {binárne údaje} "
      & "form_content {údaje formulára} other {neznámy obsah}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {značka dokumentu} metadata_tag {značka "
      & "metadát} section_tag {značka sekcie} text_tag {textová značka} "
      & "link_tag {značka odkazu} media_tag {značka médií} form_tag "
      & "{značka formulára} table_tag {značka tabuľky} interactive_tag "
      & "{interaktívna značka} scripting_tag {skriptovacia značka} other "
      & "{neznáma značka}}");
   P ("label.media.duration_label", "trvanie: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {obrázok} video_media {video} audio_media "
      & "{zvuk} pdf_document {dokument PDF} text_document {textový dokument} "
      & "archive_media {archív} other {médium}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {pripravené} processing_media "
      & "{spracovanie} transcoding_media {prekódovanie} thumbnail_missing "
      & "{náhľad nie je k dispozícii} metadata_missing {chýbajú metadáta} "
      & "locked_document {dokument uzamknutý} other {nedostupné}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {obrázok} video_media {video} "
      & "audio_media {zvuk} pdf_document {dokument PDF} text_document {textový "
      & "dokument} archive_media {archív} other {médium}}): {state, select, "
      & "ready_media {pripravené} processing_media {spracovanie} "
      & "transcoding_media {prekódovanie} thumbnail_missing {náhľad nie je k "
      & "dispozícii} metadata_missing {chýbajú metadáta} locked_document "
      & "{uzamknuté} other {nedostupné}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {žiadne strany} one {{pages, number} strana} few "
      & "{{pages, number} strany} many {{pages, number} strany} other {{pages, "
      & "number} strán}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: {state, select, open_report {odvolanie otvorené} "
      & "triaged_report {odvolanie posúdené} actioned_report {odvolanie – "
      & "prijaté opatrenie} dismissed_report {odvolanie zamietnuté} "
      & "appealed_report {odvolanie podané} other {odvolanie uzavreté}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {žiadny zásah moderátora} flagged "
      & "{označené} hidden {skryté moderátorom} restored {obnovené} "
      & "marked_spam {označené ako spam} removed {odstránené} other "
      & "{eskalované}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {žiadny zásah moderátora} "
      & "flagged {označené} hidden {skryté moderátorom} restored "
      & "{obnovené} marked_spam {označené ako spam} removed {odstránené} "
      & "other {eskalované}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {rad moderovania je "
      & "prázdny} other {na kontrolu: {pending, number}}}} other {na kontrolu: "
      & "{pending, number}, eskalované: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {otvorené hlásenie} "
      & "triaged_report {posúdené hlásenie} actioned_report {hlásenie – "
      & "prijaté opatrenie} dismissed_report {zamietnuté hlásenie} "
      & "appealed_report {hlásenie s odvolaním} other {uzavreté hlásenie}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {otvorené hlásenie} triaged_report "
      & "{posúdené hlásenie} actioned_report {hlásenie – prijaté "
      & "opatrenie} dismissed_report {zamietnuté hlásenie} appealed_report "
      & "{hlásenie s odvolaním} other {uzavreté hlásenie}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {čaká na kontrolu} approved "
      & "{schválené} rejected {zamietnuté} needs_changes {vyžaduje zmeny} "
      & "other {kontrola eskalovaná}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {čaká na kontrolu} approved "
      & "{schválené} rejected {zamietnuté} needs_changes {vyžaduje zmeny} "
      & "other {kontrola eskalovaná}}");
   P ("label.navigation.back_label", "späť: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {žiadna navigačná cesta} one {navigačná cesta: "
      & "1 úroveň} few {navigačná cesta: {depth, number} úrovne} many "
      & "{navigačná cesta: {depth, number} úrovne} other {navigačná cesta: "
      & "{depth, number} úrovní}}");
   P ("label.navigation.current_page_label", "aktuálna stránka: {name}");
   P ("label.navigation.external_link_label", "{name} (externý odkaz)");
   P ("label.navigation.first_label", "prvý: {target}");
   P ("label.navigation.last_label", "posledný: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {žiadne položky ponuky} one {1 položka ponuky} "
      & "few {{count, number} položky ponuky} many {{count, number} položky "
      & "ponuky} other {{count, number} položiek ponuky}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {odkaz} menu_item {položka ponuky} tab_item "
      & "{karta} breadcrumb_item {položka navigačnej cesty} section_item "
      & "{sekcia} other {oddeľovač}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {odkaz {state, select, current_item "
      & "{aktuálny} active_item {aktívny} inactive_item {neaktívny} "
      & "disabled_item {zakázaný} expanded_item {rozbalený} collapsed_item "
      & "{zbalený} visited_item {navštívený} other {externý}}} menu_item "
      & "{položka ponuky {state, select, current_item {aktuálna} active_item "
      & "{aktívna} inactive_item {neaktívna} disabled_item {zakázaná} "
      & "expanded_item {rozbalená} collapsed_item {zbalená} visited_item "
      & "{navštívená} other {externá}}} tab_item {karta {state, select, "
      & "current_item {aktuálna} active_item {aktívna} inactive_item "
      & "{neaktívna} disabled_item {zakázaná} expanded_item {rozbalená} "
      & "collapsed_item {zbalená} visited_item {navštívená} other "
      & "{externá}}} breadcrumb_item {položka navigačnej cesty {state, "
      & "select, current_item {aktuálna} active_item {aktívna} inactive_item "
      & "{neaktívna} disabled_item {zakázaná} expanded_item {rozbalená} "
      & "collapsed_item {zbalená} visited_item {navštívená} other "
      & "{externá}}} section_item {sekcia {state, select, current_item "
      & "{aktuálna} active_item {aktívna} inactive_item {neaktívna} "
      & "disabled_item {zakázaná} expanded_item {rozbalená} collapsed_item "
      & "{zbalená} visited_item {navštívená} other {externá}}} other "
      & "{oddeľovač {state, select, current_item {aktuálny} active_item "
      & "{aktívny} inactive_item {neaktívny} disabled_item {zakázaný} "
      & "expanded_item {rozbalený} collapsed_item {zbalený} visited_item "
      & "{navštívený} other {externý}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {aktuálny} active_item {aktívny} "
      & "inactive_item {neaktívny} disabled_item {zakázaný} expanded_item "
      & "{rozbalený} collapsed_item {zbalený} visited_item {navštívený} "
      & "other {externý}}");
   P ("label.navigation.next_label", "ďalší: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {sekcia zbalená} other {sekcia "
      & "rozbalená}}{count, plural, =0 {} one {, 1 položka} few {, {count, "
      & "number} položky} many {, {count, number} položky} other {, {count, "
      & "number} položiek}}");
   P ("label.navigation.skip_link_label", "prejsť na: {target}");
   P ("label.navigation.submenu_label",
      "{name}: podponuka, {count, plural, one {1 položka} few {{count, "
      & "number} položky} many {{count, number} položky} other {{count, "
      & "number} položiek}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {všetky výstrahy} important_alerts "
      & "{dôležité výstrahy} critical_alerts_only {iba kritické výstrahy} "
      & "other {žiadne výstrahy}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: {state, select, preference_enabled {oznámenia zapnuté} "
      & "preference_disabled {oznámenia vypnuté} preference_inherited "
      & "{oznámenia zdedené} other {oznámenia povinné}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {bez súhrnu} instant_digest {okamžitý "
      & "súhrn} daily_digest {denný súhrn} other {týždenný súhrn}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {zapnuté} preference_disabled "
      & "{vypnuté} preference_inherited {zdedené} other {povinné}}");
   P ("label.notification_preferences.quiet_hours_label", "tiché hodiny: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: odber {scope, select, thread_subscription {vlákna} "
      & "project_subscription {projektu} team_subscription {tímu} other "
      & "{účtu}} {state, select, preference_enabled {zapnutý} "
      & "preference_disabled {vypnutý} preference_inherited {zdedený} other "
      & "{povinný}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {odber vlákna} "
      & "project_subscription {odber projektu} team_subscription {odber tímu} "
      & "other {odber účtu}}");
   P ("label.notifications.actor_event_label",
      "{actor}: {event, select, mention_event {zmienka o vás} reply_event "
      & "{odpoveď} assignment_event {priradenie vám} approval_event "
      & "{žiadosť o schválenie} alert_event {výstraha} digest_event "
      & "{súhrn} reminder_event {pripomienka} other {systémové oznámenie}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {oznámenie v aplikácii} "
      & "email_channel {e-mailové oznámenie} sms_channel {oznámenie SMS} "
      & "push_channel {oznámenie push} webhook_channel {oznámenie webhooku} "
      & "other {súhrnné oznámenie}}: {state, select, pending_delivery "
      & "{čaká} sent_delivery {odoslané} delivered_delivery {doručené} "
      & "failed_delivery {zlyhalo} retrying_delivery {opakovanie} other "
      & "{zrušené}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {čakajúce oznámenie} sent_delivery "
      & "{odoslané oznámenie} delivered_delivery {doručené oznámenie} "
      & "failed_delivery {neúspešné oznámenie} retrying_delivery "
      & "{opakované odoslanie oznámenia} other {zrušené oznámenie}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {čaká {time_text}} sent_delivery "
      & "{odoslané {time_text}} delivered_delivery {doručené {time_text}} "
      & "failed_delivery {zlyhalo {time_text}} retrying_delivery {opakovanie "
      & "{time_text}} other {zrušené {time_text}}}");
   P ("label.notifications.digest_label",
      "{name} – súhrn: {count, plural, =0 {žiadne oznámenia} one {1 "
      & "oznámenie} few {{count, number} oznámenia} many {{count, number} "
      & "oznámenia} other {{count, number} oznámení}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {žiadne zmienky} "
      & "one {1 zmienka} few {{count, number} zmienky} many {{count, number} "
      & "zmienky} other {{count, number} zmienok}}} reply_event {{count, "
      & "plural, =0 {žiadne odpovede} one {1 odpoveď} few {{count, number} "
      & "odpovede} many {{count, number} odpovede} other {{count, number} "
      & "odpovedí}}} assignment_event {{count, plural, =0 {žiadne priradenia} "
      & "one {1 priradenie} few {{count, number} priradenia} many {{count, "
      & "number} priradenia} other {{count, number} priradení}}} "
      & "approval_event {{count, plural, =0 {žiadne žiadosti o schválenie} "
      & "one {1 žiadosť o schválenie} few {{count, number} žiadosti o "
      & "schválenie} many {{count, number} žiadosti o schválenie} other "
      & "{{count, number} žiadostí o schválenie}}} alert_event {{count, "
      & "plural, =0 {žiadne výstrahy} one {1 výstraha} few {{count, number} "
      & "výstrahy} many {{count, number} výstrahy} other {{count, number} "
      & "výstrah}}} digest_event {{count, plural, =0 {žiadne súhrny} one {1 "
      & "súhrn} few {{count, number} súhrny} many {{count, number} súhrnu} "
      & "other {{count, number} súhrnov}}} reminder_event {{count, plural, =0 "
      & "{žiadne pripomienky} one {1 pripomienka} few {{count, number} "
      & "pripomienky} many {{count, number} pripomienky} other {{count, number} "
      & "pripomienok}}} other {{count, plural, =0 {žiadne systémové "
      & "oznámenia} one {1 systémové oznámenie} few {{count, number} "
      & "systémové oznámenia} many {{count, number} systémového "
      & "oznámenia} other {{count, number} systémových oznámení}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {označiť oznámenie ako prečítané} few "
      & "{označiť {count, number} oznámenia ako prečítané} many "
      & "{označiť {count, number} oznámenia ako prečítané} other "
      & "{označiť {count, number} oznámení ako prečítané}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {označiť oznámenie ako neprečítané} few "
      & "{označiť {count, number} oznámenia ako neprečítané} many "
      & "{označiť {count, number} oznámenia ako neprečítané} other "
      & "{označiť {count, number} oznámení ako neprečítané}}");
   P ("label.notifications.muted_label", "{name}: oznámenia stlmené");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nová zmienka} reply_event {nová "
      & "odpoveď} assignment_event {nové priradenie} approval_event {nová "
      & "žiadosť o schválenie} alert_event {nová výstraha} digest_event "
      & "{nový súhrn} reminder_event {nová pripomienka} other {nové "
      & "systémové oznámenie}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {oznámenia v aplikácii} "
      & "email_channel {e-mailové oznámenia} sms_channel {oznámenia SMS} "
      & "push_channel {oznámenia push} webhook_channel {oznámenia webhooku} "
      & "other {súhrnné oznámenia}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {žiadne oznámenia} one {1 oznámenie} few "
      & "{{count, number} oznámenia} many {{count, number} oznámenia} other "
      & "{{count, number} oznámení}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {zmienka} reply_event {odpoveď} "
      & "assignment_event {priradenie} approval_event {žiadosť o schválenie} "
      & "alert_event {výstraha} digest_event {súhrn} reminder_event "
      & "{pripomienka} other {systémové oznámenie}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {žiadne oznámenia} one {1 oznámenie} few "
      & "{{count, number} oznámenia} many {{count, number} oznámenia} other "
      & "{{count, number} oznámení}}");
   P ("label.notifications.notification_label",
      "{subject} ({event, select, mention_event {zmienka} reply_event "
      & "{odpoveď} assignment_event {priradenie} approval_event {žiadosť o "
      & "schválenie} alert_event {výstraha} digest_event {súhrn} "
      & "reminder_event {pripomienka} other {systémové oznámenie}}): "
      & "oznámenie {state, select, unread_state {neprečítané} read_state "
      & "{prečítané} archived_state {archivované} muted_state {stlmené} "
      & "snoozed_state {odložené} other {potlačené}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {neprečítané oznámenie} read_state "
      & "{prečítané oznámenie} archived_state {archivované oznámenie} "
      & "muted_state {stlmené oznámenie} snoozed_state {odložené "
      & "oznámenie} other {potlačené oznámenie}}");
   P ("label.notifications.snoozed_label", "{name}: oznámenia odložené");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {žiadne potlačené oznámenia} one {1 potlačené "
      & "oznámenie} few {{count, number} potlačené oznámenia} many {{count, "
      & "number} potlačeného oznámenia} other {{count, number} potlačených "
      & "oznámení}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {žiadne neprečítané oznámenia} one {1 "
      & "neprečítané oznámenie} few {{count, number} neprečítané "
      & "oznámenia} many {{count, number} neprečítaného oznámenia} other "
      & "{{count, number} neprečítaných oznámení}}");
   P ("label.payments.amount_label", "suma: {amount_text}");
   P ("label.payments.balance_label", "zostatok: {amount_text}");
   P ("label.payments.chargeback_label", "spätné zúčtovanie: {amount_text}");
   P ("label.payments.discount_label", "zľava: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, splatnosť {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {žiadne faktúry} one {1 faktúra} few {{count, "
      & "number} faktúry} many {{count, number} faktúry} other {{count, "
      & "number} faktúr}}");
   P ("label.payments.invoice_label",
      "faktúra {number}: {state, select, draft_invoice {koncept} "
      & "open_invoice {otvorená} paid_invoice {zaplatená} overdue_invoice {po "
      & "splatnosti} other {stornovaná}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {koncept faktúry} open_invoice "
      & "{otvorená faktúra} paid_invoice {zaplatená faktúra} "
      & "overdue_invoice {faktúra po splatnosti} other {stornovaná faktúra}}");
   P ("label.payments.method_label",
      "{method, select, card_method {zaplatené kartou: {detail}} "
      & "bank_transfer_method {zaplatené bankovým prevodom: {detail}} "
      & "cash_method {zaplatené v hotovosti: {detail}} wallet_method "
      & "{zaplatené digitálnou peňaženkou: {detail}} check_method "
      & "{zaplatené šekom: {detail}} other {zaplatené inak: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}, zaplatené {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {žiadne platby} one {1 platba} few {{count, "
      & "number} platby} many {{count, number} platby} other {{count, number} "
      & "platieb}}");
   P ("label.payments.payment_label",
      "{amount_text}: platba {state, select, pending_payment {čaká} "
      & "authorized_payment {autorizovaná} paid_payment {vykonaná} "
      & "failed_payment {zlyhala} refunded_payment {vrátená} other "
      & "{zrušená}}");
   P ("label.payments.payment_link_label", "{name}: platobný odkaz");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {karta} bank_transfer_method {bankový "
      & "prevod} cash_method {hotovosť} wallet_method {digitálna peňaženka} "
      & "check_method {šek} other {iný spôsob}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {čakajúca platba} authorized_payment "
      & "{autorizovaná platba} paid_payment {vykonaná platba} failed_payment "
      & "{neúspešná platba} refunded_payment {vrátená platba} other "
      & "{zrušená platba}}");
   P ("label.payments.receipt_label", "potvrdenka {number}");
   P ("label.payments.refund_label",
      "{amount_text}: refundácia {state, select, pending_payment {čaká} "
      & "authorized_payment {autorizovaná} paid_payment {vyplatená} "
      & "failed_payment {zlyhala} refunded_payment {dokončená} other "
      & "{zrušená}}");
   P ("label.payments.subtotal_label", "medzisúčet: {amount_text}");
   P ("label.payments.tax_label", "daň: {amount_text}");
   P ("label.payments.total_label", "spolu: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: prístup vyprší {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {udelená rola vlastníka} "
      & "admin_role {udelená rola správcu} editor_role {udelená rola "
      & "editora} viewer_role {udelená rola čitateľa} other {udelená "
      & "vlastná rola}}");
   P ("label.permissions.permission_label",
      "{subject}: {action} – {state, select, granted {udelené} denied "
      & "{zamietnuté} inherited {zdedené} temporary {dočasný prístup} "
      & "expired {vypršalo} other {vyžaduje schválenie}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {udelené} denied {zamietnuté} inherited "
      & "{zdedené} temporary {dočasný prístup} expired {vypršalo} other "
      & "{vyžaduje schválenie}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {pravidlo povoľuje} policy_denied "
      & "{pravidlo zakazuje} policy_warning {upozornenie pravidla} other "
      & "{pravidlo sa neuplatňuje}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {odobratá rola vlastníka} "
      & "admin_role {odobratá rola správcu} editor_role {odobratá rola "
      & "editora} viewer_role {odobratá rola čitateľa} other {odobratá "
      & "vlastná rola}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {vlastník} admin_role {správca} "
      & "editor_role {editor} viewer_role {čitateľ} other {vlastná rola}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {bez využitia} low_utilization "
      & "{nízke využitie} normal_utilization {normálne využitie} "
      & "high_utilization {vysoké využitie} critical_utilization {kritické "
      & "využitie} full_utilization {plné využitie} other {prekročený "
      & "limit}}");
   P ("label.schema.array_shape_label",
      "pole {element_type, select, string_field {reťazcov} integer_field "
      & "{celých čísel} decimal_field {desatinných čísel} boolean_field "
      & "{logických hodnôt} date_field {dátumov} date_time_field {hodnôt "
      & "dátumu a času} object_field {objektov} array_field {polí} "
      & "enum_field {hodnôt výčtu} binary_field {binárnych dát} null_field "
      & "{hodnôt null} any_field {ľubovoľných hodnôt} other {hodnôt "
      & "neznámeho typu}}{count_known, select, false {} other { ({count, "
      & "plural, one {1 prvok} few {{count, number} prvky} many {{count, "
      & "number} prvku} other {{count, number} prvkov}})}}");
   P ("label.schema.constraint_label", "{name}: obmedzenie {value}");
   P ("label.schema.default_value_label", "pole {field_name}: predvolená hodnota {value}");
   P ("label.schema.deprecated_field_label", "pole {name} je zastarané, použite {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 možnosť výčtu} few {{count, number} "
      & "možnosti výčtu} many {{count, number} možnosti výčtu} other "
      & "{{count, number} možností výčtu}}");
   P ("label.schema.example_value_label", "pole {field_name}: príklad {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {bežné pole} deprecated_field "
      & "{zastarané pole} unknown_field {neznáme pole} read_only_field {pole "
      & "iba na čítanie} write_only_field {pole iba na zápis} other "
      & "{vypočítané pole}}");
   P ("label.schema.field_type_label",
      "pole typu {kind, select, string_field {reťazec} integer_field {celé "
      & "číslo} decimal_field {desatinné číslo} boolean_field {logická "
      & "hodnota} date_field {dátum} date_time_field {dátum a čas} "
      & "object_field {objekt} array_field {pole} enum_field {výčet} "
      & "binary_field {binárne dáta} null_field {null} any_field "
      & "{ľubovoľný} other {neznámy}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {nechýbajú žiadne povinné polia} other "
      & "{chýbajúce povinné polia: {count, number}}}");
   P ("label.schema.object_shape_label",
      "objekt, polia: {fields, number}{required, plural, =0 {} other {, "
      & "povinné: {required, number}}}{optional, plural, =0 {} other {, "
      & "voliteľné: {optional, number}}}");
   P ("label.schema.schema_source_label", "schéma {name}, verzia {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalárna hodnota} object_shape {{count, "
      & "plural, =0 {objekt} other {objekt, polia: {count, number}}}} "
      & "array_shape {{count, plural, =0 {pole} other {pole, prvky: {count, "
      & "number}}}} map_shape {{count, plural, =0 {mapa} other {mapa, položky: "
      & "{count, number}}}} tuple_shape {{count, plural, =0 {n-tica} other "
      & "{n-tica, prvky: {count, number}}}} union_shape {{count, plural, =0 "
      & "{zjednotenie} other {zjednotenie, typy: {count, number}}}} empty_shape "
      & "{prázdny tvar} other {neznámy tvar}}");
   P ("label.schema.unknown_field_label", "neznáme pole {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {žiadne aktívne filtre} one {1 aktívny filter} "
      & "few {{count, number} aktívne filtre} many {{count, number} aktívneho "
      & "filtra} other {{count, number} aktívnych filtrov}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {vymazať filtre} one {vymazať aktívny filter} "
      & "few {vymazať {count, number} aktívne filtre} many {vymazať {count, "
      & "number} aktívneho filtra} other {vymazať {count, number} aktívnych "
      & "filtrov}}");
   P ("label.search.facet_label",
      "{count, plural, one {fazeta {name}, 1 možnosť} few {fazeta {name}, "
      & "{count, number} možnosti} many {fazeta {name}, {count, number} "
      & "možnosti} other {fazeta {name}, {count, number} možností}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {žiadne výsledky} one {1 výsledok} few "
      & "{{count, number} výsledky} many {{count, number} výsledku} other "
      & "{{count, number} výsledkov}}{selected, select, false {} other {, "
      & "vybrané}}");
   P ("label.search.filter_label",
      "{name}: {value} – {state, select, active_filter {aktívny filter} "
      & "inactive_filter {neaktívny filter} other {vylučujúci filter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktívny filter} inactive_filter "
      & "{neaktívny filter} other {vylučujúci filter}}");
   P ("label.search.no_results_label", "žiadne výsledky pre „{query}“");
   P ("label.search.recent_search_label", "nedávne vyhľadávanie: „{query}“");
   P ("label.search.saved_search_label",
      "uložené vyhľadávanie: {name}{count, plural, =0 {} one {, 1 "
      & "výsledok} few {, {count, number} výsledky} many {, {count, number} "
      & "výsledku} other {, {count, number} výsledkov}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {žiadne nedávne vyhľadávania} one {1 nedávne "
      & "vyhľadávanie} few {{count, number} nedávne vyhľadávania} many "
      & "{{count, number} nedávneho vyhľadávania} other {{count, number} "
      & "nedávnych vyhľadávaní}}");
   P ("label.search.search_query_label", "hľadať „{query}“");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {žiadne výsledky} one {1 výsledok} few {{count, "
      & "number} výsledky} many {{count, number} výsledku} other {{count, "
      & "number} výsledkov}}");
   P ("label.search.search_result_summary_label",
      "výsledky pre „{query}“: {count, plural, =0 {žiadne výsledky} "
      & "one {1 výsledok} few {{count, number} výsledky} many {{count, "
      & "number} výsledku} other {{count, number} výsledkov}}");
   P ("label.search.search_scope_label",
      "rozsah {name}, {count, plural, =0 {žiadne výsledky} one {1 "
      & "výsledok} few {{count, number} výsledky} many {{count, number} "
      & "výsledku} other {{count, number} výsledkov}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {vyhľadávanie nečinné} "
      & "searching_search {prebieha vyhľadávanie} complete_search "
      & "{vyhľadávanie dokončené} empty_search {žiadne výsledky "
      & "vyhľadávania} other {vyhľadávanie zlyhalo}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {zoradiť podľa relevantnosti} "
      & "ascending_sort {zoradiť vzostupne} descending_sort {zoradiť "
      & "zostupne} newest_first_sort {zoradiť od najnovších} other {zoradiť "
      & "od najstarších}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevantnosť} ascending_sort "
      & "{vzostupne} descending_sort {zostupne} newest_first_sort {od "
      & "najnovších} other {od najstarších}}");
   P ("label.search.suggestion_label", "mali ste na mysli „{query}“?");
   P ("label.secrets.credential_source_label",
      "{source}: {count, plural, one {1 prihlasovací údaj} few {{count, "
      & "number} prihlasovacie údaje} many {{count, number} prihlasovacieho "
      & "údaja} other {{count, number} prihlasovacích údajov}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {hodnota skrytá} masked_value "
      & "{hodnota maskovaná} suffix_only {iba prípona} other {iba odtlačok}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {verejný} support_profile {podpora} "
      & "audit_profile {audit} other {ladenie}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotácia nie je potrebná} other "
      & "{potrebná rotácia}}{days_old, plural, =0 {} one {, vek: 1 deň} few "
      & "{, vek: {days_old, number} dni} many {, vek: {days_old, number} dňa} "
      & "other {, vek: {days_old, number} dní}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {kľúč API} live_api_key {produkčný kľúč "
      & "API} test_api_key {testovací kľúč API} github_token {token GitHub} "
      & "aws_access_key {prístupový kľúč AWS} google_api_key {kľúč "
      & "Google API} slack_token {token Slack} npm_token {token npm} "
      & "bearer_token {token bearer} jwt_token {token JWT} "
      & "basic_auth_credential {prihlasovacie údaje Basic Auth} "
      & "password_secret {heslo} private_key {súkromný kľúč} "
      & "ssh_private_key {súkromný kľúč SSH} webhook_secret {tajný "
      & "kľúč webhooku} oauth_token {token OAuth} database_url_secret "
      & "{tajný údaj v URL databázy} sha1_fingerprint {odtlačok SHA-1} "
      & "sha256_fingerprint {odtlačok SHA-256} other {tajný údaj}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefón} url_value "
      & "{URL} ip_address_value {adresa IP} token_value {token} file_path_value "
      & "{cesta k súboru} account_id_value {ID účtu} payment_reference_value "
      & "{platobná referencia} log_field_value {pole denníka} other {citlivá "
      & "hodnota}}");
   P ("label.tables.cell_label",
      "riadok {row, number}, stĺpec {column, number}: {state, select, "
      & "empty_cell {prázdna} edited_cell {upravená} invalid_cell {neplatná} "
      & "highlighted_cell {zvýraznená} other {iba na čítanie}}");
   P ("label.tables.cell_position_label", "riadok {row, number}, stĺpec {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {prázdna bunka} edited_cell {upravená "
      & "bunka} invalid_cell {neplatná bunka} highlighted_cell {zvýraznená "
      & "bunka} other {bunka iba na čítanie}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {žiadne stĺpce} one {1 stĺpec} few {{count, "
      & "number} stĺpce} many {{count, number} stĺpca} other {{count, number} "
      & "stĺpcov}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {textový stĺpec} number_column "
      & "{číselný stĺpec} date_column {stĺpec dátumu} status_column "
      & "{stĺpec stavu} action_column {stĺpec akcií} other {skrytý "
      & "stĺpec}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {textový stĺpec} number_column "
      & "{číselný stĺpec} date_column {stĺpec dátumu} status_column "
      & "{stĺpec stavu} action_column {stĺpec akcií} other {skrytý "
      & "stĺpec}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {1 riadok} few {{count, number} riadky} "
      & "many {{count, number} riadka} other {{count, number} riadkov}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {žiadne riadky} one {1 riadok} few {{count, "
      & "number} riadky} many {{count, number} riadka} other {{count, number} "
      & "riadkov}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {nezoradené} ascending_sort {vzostupne} "
      & "other {zostupne}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {nezoradené} ascending_sort {zoradené "
      & "podľa {column_name} vzostupne} other {zoradené podľa {column_name} "
      & "zostupne}}");
   P ("label.tables.subtotal_label", "medzisúčet {name}: {value}");
   P ("label.tables.table_size_label", "riadky: {rows, number}, stĺpce: {columns, number}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {nepriradené} assigned "
      & "{priradené} reassigned {znovu priradené} watching {sleduje} other "
      & "{vlastník úlohy}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nepriradené} assigned {priradené} "
      & "reassigned {znovu priradené} watching {sledované} other {vlastník "
      & "úlohy}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {prázdny backlog} one {backlog: 1 úloha} few "
      & "{backlog: {count, number} úlohy} many {backlog: {count, number} "
      & "úlohy} other {backlog: {count, number} úloh}}");
   P ("label.tasks.blocker_label", "blokované: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {dokončiť úlohu} few {dokončiť {count, "
      & "number} úlohy} many {dokončiť {count, number} úlohy} other "
      & "{dokončiť {count, number} úloh}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {žiadne dokončené úlohy} one {1 dokončená "
      & "úloha} few {{count, number} dokončené úlohy} many {{count, number} "
      & "dokončenej úlohy} other {{count, number} dokončených úloh}}");
   P ("label.tasks.due_label", "termín: {due_text}");
   P ("label.tasks.estimate_label", "odhad: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {žiadne otvorené úlohy} one {1 otvorená úloha} "
      & "few {{count, number} otvorené úlohy} many {{count, number} otvorenej "
      & "úlohy} other {{count, number} otvorených úloh}}");
   P ("label.tasks.overdue_label", "po termíne od {due_text}");
   P ("label.tasks.recurring_task_label", "opakovanie: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {znovu otvoriť úlohu} few {znovu otvoriť "
      & "{count, number} úlohy} many {znovu otvoriť {count, number} úlohy} "
      & "other {znovu otvoriť {count, number} úloh}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 úloha} few {{count, number} úlohy} "
      & "many {{count, number} úlohy} other {{count, number} úloh}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 podúloha} few {{count, number} "
      & "podúlohy} many {{count, number} podúlohy} other {{count, number} "
      & "podúloh}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {žiadne úlohy} one {1 úloha} few {{count, "
      & "number} úlohy} many {{count, number} úlohy} other {{count, number} "
      & "úloh}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {otvorená úloha} in_progress_task "
      & "{rozpracovaná úloha} blocked_task {zablokovaná úloha} done_task "
      & "{dokončená úloha} canceled_task {zrušená úloha} deferred_task "
      & "{odložená úloha} other {úloha po termíne}}{priority, select, "
      & "no_priority {} low_priority {, nízka priorita} medium_priority {, "
      & "stredná priorita} high_priority {, vysoká priorita} other {, "
      & "kritická priorita}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {bez priority} low_priority {nízka "
      & "priorita} medium_priority {stredná priorita} high_priority {vysoká "
      & "priorita} other {kritická priorita}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {otvorená úloha} in_progress_task "
      & "{rozpracovaná úloha} blocked_task {zablokovaná úloha} done_task "
      & "{dokončená úloha} canceled_task {zrušená úloha} deferred_task "
      & "{odložená úloha} other {úloha po termíne}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {horný limit} other {dolný limit}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {pod očakávaným rozsahom} within_range "
      & "{v očakávanom rozsahu} above_range {nad očakávaným rozsahom} "
      & "below_target {pod cieľom} at_target {cieľ splnený} above_target "
      & "{nad cieľom} near_limit {blízko limitu} warning_level {prah "
      & "varovania} critical_level {kritický prah} breached {prekročené} "
      & "other {neznámy stav prahu}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {aktuálne} other {commity "
      & "vpredu: {ahead, number}}}} other {{ahead, plural, =0 {commity pozadu: "
      & "{behind, number}} other {commity vpredu: {ahead, number}, pozadu: "
      & "{behind, number}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {schválené: {approver}} other {čaká na "
      & "schválenie: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {pokus 1 z 1} other {pokus "
      & "{attempt, number} z 1 – limit prekročený}}} other {pokus {attempt, "
      & "number} z {limit, number}}}");
   P ("label.workflows.blocker_label", "blokované: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {žiadne blokujúce závislosti} one {1 blokujúca "
      & "závislosť} few {{count, number} blokujúce závislosti} many "
      & "{{count, number} blokujúcej závislosti} other {{count, number} "
      & "blokujúcich závislostí}}");
   P ("label.workflows.handoff_label", "odovzdanie: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {nadchádzajúci míľnik} "
      & "current_milestone {aktuálny míľnik} complete_milestone {dokončený "
      & "míľnik} missed_milestone {zmeškaný míľnik} other {zablokovaný "
      & "míľnik}}");
   P ("label.workflows.milestone_status_label",
      "míľnik {name}: {state, select, upcoming_milestone {nadchádzajúci} "
      & "current_milestone {aktuálny} complete_milestone {dokončený} "
      & "missed_milestone {zmeškaný} other {zablokovaný}}");
   P ("label.workflows.next_action_label", "ďalší krok: {action}");
   P ("label.workflows.owner_label", "vlastník: {owner}");
   P ("label.workflows.resume_label", "obnoviť {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {nevybavený} active_step {aktívny} "
      & "waiting_step {čakajúci} blocked_step {zablokovaný} done_step "
      & "{hotový} failed_step {neúspešný} other {preskočený}}");
   P ("label.workflows.step_status_label",
      "krok {name}: {state, select, pending_step {nevybavený} active_step "
      & "{aktívny} waiting_step {čakajúci} blocked_step {zablokovaný} "
      & "done_step {hotový} failed_step {neúspešný} other {preskočený}}");
   P ("label.workflows.waiting_label", "čaká na: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nezačaté} "
      & "in_progress_state {prebieha} waiting_state {čaká} "
      & "waiting_approval_state {čaká na schválenie} blocked_state "
      & "{zablokované} completed_state {dokončené} failed_state {zlyhalo} "
      & "cancelled_state {zrušené} skipped_state {preskočené} other "
      & "{pozastavené}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nezačaté} in_progress_state "
      & "{prebieha} waiting_state {čaká} waiting_approval_state {čaká na "
      & "schválenie} blocked_state {zablokované} completed_state "
      & "{dokončené} failed_state {zlyhalo} cancelled_state {zrušené} "
      & "skipped_state {preskočené} other {pozastavené}}");
end Labels_2;
