separate (Humanize.Catalogs.Phrase_Data.Locale_Sl)
procedure Labels_2 is
begin
   P ("label.markup.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {{form_name}: ni težav} "
      & "other {{form_name}: {errors, plural, one {{errors, number} napaka} two "
      & "{{errors, number} napaki} few {{errors, number} napake} other "
      & "{{errors, number} napak}}}}} other {{errors, plural, =0 {{form_name}: "
      & "{warnings, plural, one {{warnings, number} opozorilo} two {{warnings, "
      & "number} opozorili} few {{warnings, number} opozorila} other "
      & "{{warnings, number} opozoril}}} other {{form_name}: {errors, plural, "
      & "one {{errors, number} napaka} two {{errors, number} napaki} few "
      & "{{errors, number} napake} other {{errors, number} napak}}, {warnings, "
      & "plural, one {{warnings, number} opozorilo} two {{warnings, number} "
      & "opozorili} few {{warnings, number} opozorila} other {{warnings, "
      & "number} opozoril}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {orientacijska točka: pasica} "
      & "navigation_role {orientacijska točka: navigacija} main_role "
      & "{orientacijska točka: glavna vsebina} complementary_role "
      & "{orientacijska točka: dopolnilna vsebina} contentinfo_role "
      & "{orientacijska točka: informacije o vsebini} search_role "
      & "{orientacijska točka: iskanje} form_role {orientacijska točka: "
      & "obrazec} region_role {orientacijska točka: območje} dialog_role "
      & "{pogovorno okno} alert_role {živo območje: opozorilo} status_role "
      & "{živo območje: stanje} other {neznana orientacijska točka}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, nujna posodobitev: {update}} other "
      & "{{region}, običajna posodobitev: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {besedilna vsebina} html_content {vsebina "
      & "HTML} json_content {vsebina JSON} xml_content {vsebina XML} "
      & "image_content {slika} audio_content {zvok} video_content {video} "
      & "font_content {pisava} archive_content {arhiv} binary_content {binarni "
      & "podatki} form_content {podatki obrazca} other {neznana vsebina}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {oznaka dokumenta} metadata_tag {oznaka "
      & "metapodatkov} section_tag {oznaka razdelka} text_tag {besedilna "
      & "oznaka} link_tag {oznaka povezave} media_tag {oznaka medija} form_tag "
      & "{oznaka obrazca} table_tag {oznaka tabele} interactive_tag "
      & "{interaktivna oznaka} scripting_tag {skriptna oznaka} other {neznana "
      & "oznaka}}");
   P ("label.media.duration_label", "trajanje: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {slika} video_media {video} audio_media "
      & "{zvok} pdf_document {dokument PDF} text_document {besedilni dokument} "
      & "archive_media {arhiv} other {medij}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {pripravljeno} processing_media {obdelava} "
      & "transcoding_media {pretvarjanje} thumbnail_missing {sličica ni na "
      & "voljo} metadata_missing {manjkajo metapodatki} locked_document "
      & "{dokument zaklenjen} other {ni na voljo}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {slika} video_media {video} "
      & "audio_media {zvok} pdf_document {dokument PDF} text_document "
      & "{besedilni dokument} archive_media {arhiv} other {medij}}): {state, "
      & "select, ready_media {pripravljeno} processing_media {obdelava} "
      & "transcoding_media {pretvarjanje} thumbnail_missing {sličica ni na "
      & "voljo} metadata_missing {manjkajo metapodatki} locked_document "
      & "{zaklenjeno} other {ni na voljo}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {ni strani} one {{pages, number} stran} two "
      & "{{pages, number} strani} few {{pages, number} strani} other {{pages, "
      & "number} strani}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: {state, select, open_report {pritožba odprta} triaged_report "
      & "{pritožba pregledana} actioned_report {pritožba – ukrep izveden} "
      & "dismissed_report {pritožba zavrnjena} appealed_report {pritožba "
      & "vložena} other {pritožba zaprta}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {brez moderacijskega ukrepa} flagged "
      & "{označeno} hidden {skril moderator} restored {obnovljeno} marked_spam "
      & "{označeno kot neželeno} removed {odstranjeno} other {eskalirano}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {brez moderacijskega ukrepa} "
      & "flagged {označeno} hidden {skril moderator} restored {obnovljeno} "
      & "marked_spam {označeno kot neželeno} removed {odstranjeno} other "
      & "{eskalirano}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {čakalna vrsta "
      & "moderiranja je prazna} other {za pregled: {pending, number}}}} other "
      & "{za pregled: {pending, number}, eskalirano: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {odprta prijava} triaged_report "
      & "{pregledana prijava} actioned_report {prijava – ukrep izveden} "
      & "dismissed_report {zavrnjena prijava} appealed_report {prijava s "
      & "pritožbo} other {zaprta prijava}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {odprta prijava} triaged_report "
      & "{pregledana prijava} actioned_report {prijava – ukrep izveden} "
      & "dismissed_report {zavrnjena prijava} appealed_report {prijava s "
      & "pritožbo} other {zaprta prijava}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {čaka na pregled} approved "
      & "{odobreno} rejected {zavrnjeno} needs_changes {potrebne so spremembe} "
      & "other {pregled eskaliran}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {čaka na pregled} approved {odobreno} "
      & "rejected {zavrnjeno} needs_changes {potrebne so spremembe} other "
      & "{pregled eskaliran}}");
   P ("label.navigation.back_label", "nazaj: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {ni poti drobtin} one {pot drobtin: 1 raven} two "
      & "{pot drobtin: {depth, number} ravni} few {pot drobtin: {depth, number} "
      & "ravni} other {pot drobtin: {depth, number} ravni}}");
   P ("label.navigation.current_page_label", "trenutna stran: {name}");
   P ("label.navigation.external_link_label", "{name} (zunanja povezava)");
   P ("label.navigation.first_label", "prvi: {target}");
   P ("label.navigation.last_label", "zadnji: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {ni postavk menija} one {1 postavka menija} two "
      & "{{count, number} postavki menija} few {{count, number} postavke "
      & "menija} other {{count, number} postavk menija}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {povezava} menu_item {postavka menija} "
      & "tab_item {zavihek} breadcrumb_item {drobtina} section_item {razdelek} "
      & "other {ločilo}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {povezava {state, select, "
      & "current_item {trenutna} active_item {aktivna} inactive_item "
      & "{neaktivna} disabled_item {onemogočena} expanded_item {razširjena} "
      & "collapsed_item {strnjena} visited_item {obiskana} other {zunanja}}} "
      & "menu_item {postavka menija {state, select, current_item {trenutna} "
      & "active_item {aktivna} inactive_item {neaktivna} disabled_item "
      & "{onemogočena} expanded_item {razširjena} collapsed_item {strnjena} "
      & "visited_item {obiskana} other {zunanja}}} tab_item {zavihek {state, "
      & "select, current_item {trenutni} active_item {aktiven} inactive_item "
      & "{neaktiven} disabled_item {onemogočen} expanded_item {razširjen} "
      & "collapsed_item {strnjen} visited_item {obiskan} other {zunanji}}} "
      & "breadcrumb_item {drobtina {state, select, current_item {trenutna} "
      & "active_item {aktivna} inactive_item {neaktivna} disabled_item "
      & "{onemogočena} expanded_item {razširjena} collapsed_item {strnjena} "
      & "visited_item {obiskana} other {zunanja}}} section_item {razdelek "
      & "{state, select, current_item {trenutni} active_item {aktiven} "
      & "inactive_item {neaktiven} disabled_item {onemogočen} expanded_item "
      & "{razširjen} collapsed_item {strnjen} visited_item {obiskan} other "
      & "{zunanji}}} other {ločilo {state, select, current_item {trenutno} "
      & "active_item {aktivno} inactive_item {neaktivno} disabled_item "
      & "{onemogočeno} expanded_item {razširjeno} collapsed_item {strnjeno} "
      & "visited_item {obiskano} other {zunanje}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {trenutni} active_item {aktiven} "
      & "inactive_item {neaktiven} disabled_item {onemogočen} expanded_item "
      & "{razširjen} collapsed_item {strnjen} visited_item {obiskan} other "
      & "{zunanji}}");
   P ("label.navigation.next_label", "naslednji: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {razdelek strnjen} other {razdelek "
      & "razširjen}}{count, plural, =0 {} one {, 1 element} two {, {count, "
      & "number} elementa} few {, {count, number} elementi} other {, {count, "
      & "number} elementov}}");
   P ("label.navigation.skip_link_label", "preskoči na: {target}");
   P ("label.navigation.submenu_label",
      "{name}: podmeni, {count, plural, one {1 element} two {{count, number} "
      & "elementa} few {{count, number} elementi} other {{count, number} "
      & "elementov}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {vsa opozorila} important_alerts {pomembna "
      & "opozorila} critical_alerts_only {samo kritična opozorila} other {brez "
      & "opozoril}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: {state, select, preference_enabled {obvestila omogočena} "
      & "preference_disabled {obvestila onemogočena} preference_inherited "
      & "{obvestila podedovana} other {obvestila obvezna}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {brez povzetka} instant_digest "
      & "{takojšnji povzetek} daily_digest {dnevni povzetek} other {tedenski "
      & "povzetek}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {omogočeno} preference_disabled "
      & "{onemogočeno} preference_inherited {podedovano} other {obvezno}}");
   P ("label.notification_preferences.quiet_hours_label", "tihe ure: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: naročnina na {scope, select, thread_subscription {nit} "
      & "project_subscription {projekt} team_subscription {ekipo} other "
      & "{račun}} {state, select, preference_enabled {omogočena} "
      & "preference_disabled {onemogočena} preference_inherited {podedovana} "
      & "other {obvezna}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {naročnina na nit} "
      & "project_subscription {naročnina na projekt} team_subscription "
      & "{naročnina na ekipo} other {naročnina na račun}}");
   P ("label.notifications.actor_event_label",
      "{actor}: {event, select, mention_event {omemba vas} reply_event "
      & "{odgovor} assignment_event {dodelitev vam} approval_event {prošnja za "
      & "odobritev} alert_event {opozorilo} digest_event {povzetek} "
      & "reminder_event {opomnik} other {sistemsko obvestilo}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {obvestilo v aplikaciji} "
      & "email_channel {e-poštno obvestilo} sms_channel {obvestilo SMS} "
      & "push_channel {potisno obvestilo} webhook_channel {obvestilo webhook} "
      & "other {obvestilo s povzetkom}}: {state, select, pending_delivery "
      & "{čaka} sent_delivery {poslano} delivered_delivery {dostavljeno} "
      & "failed_delivery {ni uspelo} retrying_delivery {ponovni poskus} other "
      & "{preklicano}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {obvestilo čaka} sent_delivery "
      & "{poslano obvestilo} delivered_delivery {dostavljeno obvestilo} "
      & "failed_delivery {neuspelo obvestilo} retrying_delivery {ponovno "
      & "pošiljanje obvestila} other {preklicano obvestilo}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {čaka {time_text}} sent_delivery "
      & "{poslano {time_text}} delivered_delivery {dostavljeno {time_text}} "
      & "failed_delivery {ni uspelo {time_text}} retrying_delivery {ponovni "
      & "poskus {time_text}} other {preklicano {time_text}}}");
   P ("label.notifications.digest_label",
      "{name} – povzetek: {count, plural, =0 {ni obvestil} one {1 "
      & "obvestilo} two {{count, number} obvestili} few {{count, number} "
      & "obvestila} other {{count, number} obvestil}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {ni omemb} one {1 "
      & "omemba} two {{count, number} omembi} few {{count, number} omembe} "
      & "other {{count, number} omemb}}} reply_event {{count, plural, =0 {ni "
      & "odgovorov} one {1 odgovor} two {{count, number} odgovora} few {{count, "
      & "number} odgovori} other {{count, number} odgovorov}}} assignment_event "
      & "{{count, plural, =0 {ni dodelitev} one {1 dodelitev} two {{count, "
      & "number} dodelitvi} few {{count, number} dodelitve} other {{count, "
      & "number} dodelitev}}} approval_event {{count, plural, =0 {ni prošenj "
      & "za odobritev} one {1 prošnja za odobritev} two {{count, number} "
      & "prošnji za odobritev} few {{count, number} prošnje za odobritev} "
      & "other {{count, number} prošenj za odobritev}}} alert_event {{count, "
      & "plural, =0 {ni opozoril} one {1 opozorilo} two {{count, number} "
      & "opozorili} few {{count, number} opozorila} other {{count, number} "
      & "opozoril}}} digest_event {{count, plural, =0 {ni povzetkov} one {1 "
      & "povzetek} two {{count, number} povzetka} few {{count, number} "
      & "povzetki} other {{count, number} povzetkov}}} reminder_event {{count, "
      & "plural, =0 {ni opomnikov} one {1 opomnik} two {{count, number} "
      & "opomnika} few {{count, number} opomniki} other {{count, number} "
      & "opomnikov}}} other {{count, plural, =0 {ni sistemskih obvestil} one {1 "
      & "sistemsko obvestilo} two {{count, number} sistemski obvestili} few "
      & "{{count, number} sistemska obvestila} other {{count, number} "
      & "sistemskih obvestil}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {označi obvestilo kot prebrano} two {označi "
      & "{count, number} obvestili kot prebrani} few {označi {count, number} "
      & "obvestila kot prebrana} other {označi {count, number} obvestil kot "
      & "prebrana}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {označi obvestilo kot neprebrano} two {označi "
      & "{count, number} obvestili kot neprebrani} few {označi {count, number} "
      & "obvestila kot neprebrana} other {označi {count, number} obvestil kot "
      & "neprebrana}}");
   P ("label.notifications.muted_label", "{name}: obvestila utišana");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nova omemba} reply_event {nov odgovor} "
      & "assignment_event {nova dodelitev} approval_event {nova prošnja za "
      & "odobritev} alert_event {novo opozorilo} digest_event {nov povzetek} "
      & "reminder_event {nov opomnik} other {novo sistemsko obvestilo}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {obvestila v aplikaciji} "
      & "email_channel {e-poštna obvestila} sms_channel {obvestila SMS} "
      & "push_channel {potisna obvestila} webhook_channel {obvestila webhook} "
      & "other {obvestila s povzetkom}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {ni obvestil} one {1 obvestilo} two {{count, "
      & "number} obvestili} few {{count, number} obvestila} other {{count, "
      & "number} obvestil}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {omemba} reply_event {odgovor} "
      & "assignment_event {dodelitev} approval_event {prošnja za odobritev} "
      & "alert_event {opozorilo} digest_event {povzetek} reminder_event "
      & "{opomnik} other {sistemsko obvestilo}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {ni obvestil} one {1 obvestilo} two "
      & "{{count, number} obvestili} few {{count, number} obvestila} other "
      & "{{count, number} obvestil}}");
   P ("label.notifications.notification_label",
      "{subject} ({event, select, mention_event {omemba} reply_event "
      & "{odgovor} assignment_event {dodelitev} approval_event {prošnja za "
      & "odobritev} alert_event {opozorilo} digest_event {povzetek} "
      & "reminder_event {opomnik} other {sistemsko obvestilo}}): obvestilo "
      & "{state, select, unread_state {neprebrano} read_state {prebrano} "
      & "archived_state {arhivirano} muted_state {utišano} snoozed_state "
      & "{odloženo} other {zadržano}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {neprebrano obvestilo} read_state "
      & "{prebrano obvestilo} archived_state {arhivirano obvestilo} muted_state "
      & "{utišano obvestilo} snoozed_state {odloženo obvestilo} other "
      & "{zadržano obvestilo}}");
   P ("label.notifications.snoozed_label", "{name}: obvestila odložena");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {ni zadržanih obvestil} one {1 zadržano "
      & "obvestilo} two {{count, number} zadržani obvestili} few {{count, "
      & "number} zadržana obvestila} other {{count, number} zadržanih "
      & "obvestil}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {ni neprebranih obvestil} one {1 neprebrano "
      & "obvestilo} two {{count, number} neprebrani obvestili} few {{count, "
      & "number} neprebrana obvestila} other {{count, number} neprebranih "
      & "obvestil}}");
   P ("label.payments.amount_label", "znesek: {amount_text}");
   P ("label.payments.balance_label", "stanje: {amount_text}");
   P ("label.payments.chargeback_label", "povratna bremenitev: {amount_text}");
   P ("label.payments.discount_label", "popust: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, rok plačila {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {ni računov} one {1 račun} two {{count, number} "
      & "računa} few {{count, number} računi} other {{count, number} "
      & "računov}}");
   P ("label.payments.invoice_label",
      "račun {number}: {state, select, draft_invoice {osnutek} open_invoice "
      & "{odprt} paid_invoice {plačan} overdue_invoice {zapadel} other "
      & "{storniran}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {osnutek računa} open_invoice {odprt "
      & "račun} paid_invoice {plačan račun} overdue_invoice {zapadel račun} "
      & "other {storniran račun}}");
   P ("label.payments.method_label",
      "{method, select, card_method {plačano s kartico: {detail}} "
      & "bank_transfer_method {plačano z bančnim nakazilom: {detail}} "
      & "cash_method {plačano z gotovino: {detail}} wallet_method {plačano z "
      & "digitalno denarnico: {detail}} check_method {plačano s čekom: "
      & "{detail}} other {plačano drugače: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}, plačano {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {ni plačil} one {1 plačilo} two {{count, number} "
      & "plačili} few {{count, number} plačila} other {{count, number} "
      & "plačil}}");
   P ("label.payments.payment_label",
      "{amount_text}: plačilo {state, select, pending_payment {čaka} "
      & "authorized_payment {odobreno} paid_payment {izvedeno} failed_payment "
      & "{ni uspelo} refunded_payment {vrnjeno} other {preklicano}}");
   P ("label.payments.payment_link_label", "{name}: povezava za plačilo");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kartica} bank_transfer_method {bančno "
      & "nakazilo} cash_method {gotovina} wallet_method {digitalna denarnica} "
      & "check_method {ček} other {drug način}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {plačilo v čakanju} "
      & "authorized_payment {odobreno plačilo} paid_payment {izvedeno "
      & "plačilo} failed_payment {neuspelo plačilo} refunded_payment {vrnjeno "
      & "plačilo} other {preklicano plačilo}}");
   P ("label.payments.receipt_label", "potrdilo {number}");
   P ("label.payments.refund_label",
      "{amount_text}: vračilo {state, select, pending_payment {čaka} "
      & "authorized_payment {odobreno} paid_payment {izplačano} failed_payment "
      & "{ni uspelo} refunded_payment {zaključeno} other {preklicano}}");
   P ("label.payments.subtotal_label", "vmesna vsota: {amount_text}");
   P ("label.payments.tax_label", "davek: {amount_text}");
   P ("label.payments.total_label", "skupaj: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: dostop poteče {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {dodeljena vloga lastnika} "
      & "admin_role {dodeljena vloga skrbnika} editor_role {dodeljena vloga "
      & "urednika} viewer_role {dodeljena vloga bralca} other {dodeljena vloga "
      & "po meri}}");
   P ("label.permissions.permission_label",
      "{subject}: {action} – {state, select, granted {dodeljeno} denied "
      & "{zavrnjeno} inherited {podedovano} temporary {začasen dostop} expired "
      & "{poteklo} other {zahteva odobritev}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {dodeljeno} denied {zavrnjeno} inherited "
      & "{podedovano} temporary {začasen dostop} expired {poteklo} other "
      & "{zahteva odobritev}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {pravilnik dovoljuje} policy_denied "
      & "{pravilnik zavrača} policy_warning {opozorilo pravilnika} other "
      & "{pravilnik se ne uporablja}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {odvzeta vloga lastnika} "
      & "admin_role {odvzeta vloga skrbnika} editor_role {odvzeta vloga "
      & "urednika} viewer_role {odvzeta vloga bralca} other {odvzeta vloga po "
      & "meri}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {lastnik} admin_role {skrbnik} editor_role "
      & "{urednik} viewer_role {bralec} other {vloga po meri}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {brez izkoriščenosti} "
      & "low_utilization {nizka izkoriščenost} normal_utilization {običajna "
      & "izkoriščenost} high_utilization {visoka izkoriščenost} "
      & "critical_utilization {kritična izkoriščenost} full_utilization "
      & "{polna izkoriščenost} other {prekoračena omejitev}}");
   P ("label.schema.array_shape_label",
      "polje {element_type, select, string_field {nizov} integer_field {celih "
      & "števil} decimal_field {decimalnih števil} boolean_field {logičnih "
      & "vrednosti} date_field {datumov} date_time_field {vrednosti datuma in "
      & "časa} object_field {objektov} array_field {polj} enum_field "
      & "{naštevnih vrednosti} binary_field {binarnih podatkov} null_field "
      & "{vrednosti null} any_field {poljubnih vrednosti} other {vrednosti "
      & "neznane vrste}}{count_known, select, false {} other { ({count, plural, "
      & "one {1 element} two {{count, number} elementa} few {{count, number} "
      & "elementi} other {{count, number} elementov}})}}");
   P ("label.schema.constraint_label", "{name}: omejitev {value}");
   P ("label.schema.default_value_label", "polje {field_name}: privzeta vrednost {value}");
   P ("label.schema.deprecated_field_label", "polje {name} je zastarelo, uporabite {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 možnost naštevanja} two {{count, number} "
      & "možnosti naštevanja} few {{count, number} možnosti naštevanja} "
      & "other {{count, number} možnosti naštevanja}}");
   P ("label.schema.example_value_label", "polje {field_name}: primer {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {običajno polje} deprecated_field "
      & "{zastarelo polje} unknown_field {neznano polje} read_only_field {polje "
      & "samo za branje} write_only_field {polje samo za pisanje} other "
      & "{izračunano polje}}");
   P ("label.schema.field_type_label",
      "polje vrste {kind, select, string_field {niz} integer_field {celo "
      & "število} decimal_field {decimalno število} boolean_field {logična "
      & "vrednost} date_field {datum} date_time_field {datum in čas} "
      & "object_field {objekt} array_field {polje} enum_field {naštevni tip} "
      & "binary_field {binarni podatki} null_field {null} any_field {poljubno} "
      & "other {neznano}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {ne manjka nobeno obvezno polje} other {manjkajoča "
      & "obvezna polja: {count, number}}}");
   P ("label.schema.object_shape_label",
      "objekt, polja: {fields, number}{required, plural, =0 {} other {, "
      & "obvezna: {required, number}}}{optional, plural, =0 {} other {, "
      & "neobvezna: {optional, number}}}");
   P ("label.schema.schema_source_label", "shema {name}, različica {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalarna vrednost} object_shape {{count, "
      & "plural, =0 {objekt} other {objekt, polja: {count, number}}}} "
      & "array_shape {{count, plural, =0 {polje} other {polje, elementi: "
      & "{count, number}}}} map_shape {{count, plural, =0 {preslikava} other "
      & "{preslikava, vnosi: {count, number}}}} tuple_shape {{count, plural, =0 "
      & "{terka} other {terka, elementi: {count, number}}}} union_shape "
      & "{{count, plural, =0 {unija} other {unija, vrste: {count, number}}}} "
      & "empty_shape {prazna oblika} other {neznana oblika}}");
   P ("label.schema.unknown_field_label", "neznano polje {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {ni aktivnih filtrov} one {{count, number} aktiven "
      & "filter} two {{count, number} aktivna filtra} few {{count, number} "
      & "aktivni filtri} other {{count, number} aktivnih filtrov}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {počisti filtre} =1 {počisti aktivni filter} one "
      & "{počisti {count, number} aktivni filter} two {počisti {count, "
      & "number} aktivna filtra} few {počisti {count, number} aktivne filtre} "
      & "other {počisti {count, number} aktivnih filtrov}}");
   P ("label.search.facet_label",
      "faseta {name}, {count, plural, one {{count, number} možnost} two "
      & "{{count, number} možnosti} few {{count, number} možnosti} other "
      & "{{count, number} možnosti}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {ni zadetkov} one {{count, number} zadetek} "
      & "two {{count, number} zadetka} few {{count, number} zadetki} other "
      & "{{count, number} zadetkov}}{selected, select, false {} other {, "
      & "izbrano}}");
   P ("label.search.filter_label",
      "{name}: {value} – {state, select, active_filter {aktiven filter} "
      & "inactive_filter {neaktiven filter} other {izključevalni filter}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktiven filter} inactive_filter "
      & "{neaktiven filter} other {izključevalni filter}}");
   P ("label.search.no_results_label", "ni zadetkov za „{query}“");
   P ("label.search.recent_search_label", "nedavno iskanje: „{query}“");
   P ("label.search.saved_search_label",
      "shranjeno iskanje: {name}{count, plural, =0 {} one {, {count, number} "
      & "zadetek} two {, {count, number} zadetka} few {, {count, number} "
      & "zadetki} other {, {count, number} zadetkov}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {ni nedavnih iskanj} one {{count, number} nedavno "
      & "iskanje} two {{count, number} nedavni iskanji} few {{count, number} "
      & "nedavna iskanja} other {{count, number} nedavnih iskanj}}");
   P ("label.search.search_query_label", "išči „{query}“");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {ni zadetkov} one {{count, number} zadetek} two "
      & "{{count, number} zadetka} few {{count, number} zadetki} other {{count, "
      & "number} zadetkov}}");
   P ("label.search.search_result_summary_label",
      "zadetki za „{query}“: {count, plural, =0 {ni zadetkov} one "
      & "{{count, number} zadetek} two {{count, number} zadetka} few {{count, "
      & "number} zadetki} other {{count, number} zadetkov}}");
   P ("label.search.search_scope_label",
      "obseg {name}, {count, plural, =0 {ni zadetkov} one {{count, number} "
      & "zadetek} two {{count, number} zadetka} few {{count, number} zadetki} "
      & "other {{count, number} zadetkov}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {iskanje nedejavno} searching_search "
      & "{iskanje poteka} complete_search {iskanje končano} empty_search {ni "
      & "zadetkov iskanja} other {iskanje ni uspelo}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {razvrsti po ustreznosti} ascending_sort "
      & "{razvrsti naraščajoče} descending_sort {razvrsti padajoče} "
      & "newest_first_sort {razvrsti od najnovejših} other {razvrsti od "
      & "najstarejših}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {ustreznost} ascending_sort "
      & "{naraščajoče} descending_sort {padajoče} newest_first_sort {od "
      & "najnovejših} other {od najstarejših}}");
   P ("label.search.suggestion_label", "ste mislili „{query}“?");
   P ("label.secrets.credential_source_label",
      "{source}: {count, plural, one {{count, number} poverilnica} two "
      & "{{count, number} poverilnici} few {{count, number} poverilnice} other "
      & "{{count, number} poverilnic}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {vrednost skrita} masked_value "
      & "{vrednost zakrita} suffix_only {samo pripona} other {samo prstni "
      & "odtis}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {javno} support_profile {podpora} "
      & "audit_profile {revizija} other {razhroščevanje}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotacija ni potrebna} other {potrebna "
      & "rotacija}}{days_old, plural, =0 {} one {, starost: {days_old, number} "
      & "dan} two {, starost: {days_old, number} dneva} few {, starost: "
      & "{days_old, number} dnevi} other {, starost: {days_old, number} dni}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {ključ API} live_api_key {produkcijski ključ "
      & "API} test_api_key {testni ključ API} github_token {žeton GitHub} "
      & "aws_access_key {dostopni ključ AWS} google_api_key {ključ Google "
      & "API} slack_token {žeton Slack} npm_token {žeton npm} bearer_token "
      & "{žeton bearer} jwt_token {žeton JWT} basic_auth_credential "
      & "{poverilnica Basic Auth} password_secret {geslo} private_key {zasebni "
      & "ključ} ssh_private_key {zasebni ključ SSH} webhook_secret {skrivnost "
      & "webhooka} oauth_token {žeton OAuth} database_url_secret {skrivnost v "
      & "URL-ju zbirke podatkov} sha1_fingerprint {prstni odtis SHA-1} "
      & "sha256_fingerprint {prstni odtis SHA-256} other {skrivnost}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-pošta} phone_value {telefon} url_value "
      & "{URL} ip_address_value {naslov IP} token_value {žeton} "
      & "file_path_value {pot do datoteke} account_id_value {ID računa} "
      & "payment_reference_value {sklic plačila} log_field_value {polje "
      & "dnevnika} other {občutljiva vrednost}}");
   P ("label.tables.cell_label",
      "vrstica {row, number}, stolpec {column, number}: {state, select, "
      & "empty_cell {prazna} edited_cell {urejena} invalid_cell {neveljavna} "
      & "highlighted_cell {poudarjena} other {samo za branje}}");
   P ("label.tables.cell_position_label", "vrstica {row, number}, stolpec {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {prazna celica} edited_cell {urejena "
      & "celica} invalid_cell {neveljavna celica} highlighted_cell {poudarjena "
      & "celica} other {celica samo za branje}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {ni stolpcev} one {{count, number} stolpec} two "
      & "{{count, number} stolpca} few {{count, number} stolpci} other {{count, "
      & "number} stolpcev}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {besedilni stolpec} number_column "
      & "{številski stolpec} date_column {datumski stolpec} status_column "
      & "{stolpec stanja} action_column {stolpec dejanj} other {skrit stolpec}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {besedilni stolpec} number_column "
      & "{številski stolpec} date_column {datumski stolpec} status_column "
      & "{stolpec stanja} action_column {stolpec dejanj} other {skrit stolpec}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {{count, number} vrstica} two {{count, "
      & "number} vrstici} few {{count, number} vrstice} other {{count, number} "
      & "vrstic}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {ni vrstic} one {{count, number} vrstica} two "
      & "{{count, number} vrstici} few {{count, number} vrstice} other {{count, "
      & "number} vrstic}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {ni razvrščeno} ascending_sort "
      & "{naraščajoče} other {padajoče}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {ni razvrščeno} ascending_sort "
      & "{razvrščeno po {column_name} naraščajoče} other {razvrščeno po "
      & "{column_name} padajoče}}");
   P ("label.tables.subtotal_label", "vmesna vsota {name}: {value}");
   P ("label.tables.table_size_label", "vrstice: {rows, number}, stolpci: {columns, number}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {nedodeljeno} assigned "
      & "{dodeljeno} reassigned {ponovno dodeljeno} watching {spremlja} other "
      & "{lastnik opravila}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nedodeljeno} assigned {dodeljeno} "
      & "reassigned {ponovno dodeljeno} watching {spremljano} other {lastnik "
      & "opravila}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {prazen zaostanek} one {zaostanek: {count, number} "
      & "opravilo} two {zaostanek: {count, number} opravili} few {zaostanek: "
      & "{count, number} opravila} other {zaostanek: {count, number} opravil}}");
   P ("label.tasks.blocker_label", "blokirano zaradi: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {dokončaj opravilo} one {dokončaj {count, number} "
      & "opravilo} two {dokončaj {count, number} opravili} few {dokončaj "
      & "{count, number} opravila} other {dokončaj {count, number} opravil}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {ni dokončanih opravil} one {{count, number} "
      & "dokončano opravilo} two {{count, number} dokončani opravili} few "
      & "{{count, number} dokončana opravila} other {{count, number} "
      & "dokončanih opravil}}");
   P ("label.tasks.due_label", "rok: {due_text}");
   P ("label.tasks.estimate_label", "ocena: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {ni odprtih opravil} one {{count, number} odprto "
      & "opravilo} two {{count, number} odprti opravili} few {{count, number} "
      & "odprta opravila} other {{count, number} odprtih opravil}}");
   P ("label.tasks.overdue_label", "zamuda od {due_text}");
   P ("label.tasks.recurring_task_label", "ponavljanje: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {znova odpri opravilo} one {znova odpri {count, "
      & "number} opravilo} two {znova odpri {count, number} opravili} few "
      & "{znova odpri {count, number} opravila} other {znova odpri {count, "
      & "number} opravil}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {{count, number} opravilo} two {{count, "
      & "number} opravili} few {{count, number} opravila} other {{count, "
      & "number} opravil}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {{count, number} podopravilo} two {{count, "
      & "number} podopravili} few {{count, number} podopravila} other {{count, "
      & "number} podopravil}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {ni opravil} one {{count, number} opravilo} two "
      & "{{count, number} opravili} few {{count, number} opravila} other "
      & "{{count, number} opravil}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {odprto opravilo} in_progress_task "
      & "{opravilo v teku} blocked_task {blokirano opravilo} done_task "
      & "{dokončano opravilo} canceled_task {preklicano opravilo} "
      & "deferred_task {odloženo opravilo} other {zapoznelo "
      & "opravilo}}{priority, select, no_priority {} low_priority {, nizka "
      & "prioriteta} medium_priority {, srednja prioriteta} high_priority {, "
      & "visoka prioriteta} other {, kritična prioriteta}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {brez prioritete} low_priority {nizka "
      & "prioriteta} medium_priority {srednja prioriteta} high_priority {visoka "
      & "prioriteta} other {kritična prioriteta}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {odprto opravilo} in_progress_task {opravilo "
      & "v teku} blocked_task {blokirano opravilo} done_task {dokončano "
      & "opravilo} canceled_task {preklicano opravilo} deferred_task {odloženo "
      & "opravilo} other {zapoznelo opravilo}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {zgornja meja} other {spodnja meja}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {pod pričakovanim obsegom} within_range "
      & "{znotraj pričakovanega obsega} above_range {nad pričakovanim "
      & "obsegom} below_target {pod ciljem} at_target {cilj dosežen} "
      & "above_target {nad ciljem} near_limit {blizu meje} warning_level "
      & "{opozorilni prag} critical_level {kritični prag} breached "
      & "{preseženo} other {neznano stanje praga}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {na tekočem} other {commiti "
      & "naprej: {ahead, number}}}} other {{ahead, plural, =0 {commiti zadaj: "
      & "{behind, number}} other {commiti naprej: {ahead, number}, zadaj: "
      & "{behind, number}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {odobreno: {approver}} other {čaka na "
      & "odobritev: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {poskus 1 od 1} other {poskus "
      & "{attempt, number} od 1 – omejitev presežena}}} other {poskus "
      & "{attempt, number} od {limit, number}}}");
   P ("label.workflows.blocker_label", "blokirano: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {ni blokirajočih odvisnosti} one {{count, number} "
      & "blokirajoča odvisnost} two {{count, number} blokirajoči odvisnosti} "
      & "few {{count, number} blokirajoče odvisnosti} other {{count, number} "
      & "blokirajočih odvisnosti}}");
   P ("label.workflows.handoff_label", "predaja: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {prihajajoči mejnik} "
      & "current_milestone {trenutni mejnik} complete_milestone {dokončan "
      & "mejnik} missed_milestone {zamujen mejnik} other {blokiran mejnik}}");
   P ("label.workflows.milestone_status_label",
      "mejnik {name}: {state, select, upcoming_milestone {prihajajoči} "
      & "current_milestone {trenutni} complete_milestone {dokončan} "
      & "missed_milestone {zamujen} other {blokiran}}");
   P ("label.workflows.next_action_label", "naslednji korak: {action}");
   P ("label.workflows.owner_label", "lastnik: {owner}");
   P ("label.workflows.resume_label", "nadaljuj {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {v čakalni vrsti} active_step {aktiven} "
      & "waiting_step {čaka} blocked_step {blokiran} done_step {končan} "
      & "failed_step {neuspešen} other {preskočen}}");
   P ("label.workflows.step_status_label",
      "korak {name}: {state, select, pending_step {v čakalni vrsti} "
      & "active_step {aktiven} waiting_step {čaka} blocked_step {blokiran} "
      & "done_step {končan} failed_step {neuspešen} other {preskočen}}");
   P ("label.workflows.waiting_label", "čaka na: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {ni začeto} "
      & "in_progress_state {v teku} waiting_state {čaka} "
      & "waiting_approval_state {čaka na odobritev} blocked_state {blokirano} "
      & "completed_state {dokončano} failed_state {neuspešno} cancelled_state "
      & "{preklicano} skipped_state {preskočeno} other {začasno ustavljeno}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {ni začeto} in_progress_state {v "
      & "teku} waiting_state {čaka} waiting_approval_state {čaka na "
      & "odobritev} blocked_state {blokirano} completed_state {dokončano} "
      & "failed_state {neuspešno} cancelled_state {preklicano} skipped_state "
      & "{preskočeno} other {začasno ustavljeno}}");
   P ("label.contrast.opacity_label",
      "{percent}, {state, select, transparent {prosojna} mostly_transparent "
      & "{večinoma prosojna} translucent {delno prosojna} mostly_opaque "
      & "{večinoma neprosojna} other {neprosojna}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {ni opazovanj} one {{count, number} opazovanje, "
      & "min. {minimum} {unit}, mediana {median} {unit}, maks. {maximum} "
      & "{unit}} two {{count, number} opazovanji, min. {minimum} {unit}, "
      & "mediana {median} {unit}, maks. {maximum} {unit}} few {{count, number} "
      & "opazovanja, min. {minimum} {unit}, mediana {median} {unit}, maks. "
      & "{maximum} {unit}} other {{count, number} opazovanj, min. {minimum} "
      & "{unit}, mediana {median} {unit}, maks. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {ni opazovanj} other {0 "
      & "izstopajočih vrednosti od {total, number} opazovanj}}} one "
      & "{{outliers, number} izstopajoča vrednost od {total, number} "
      & "opazovanj} two {{outliers, number} izstopajoči vrednosti od {total, "
      & "number} opazovanj} few {{outliers, number} izstopajoče vrednosti od "
      & "{total, number} opazovanj} other {{outliers, number} izstopajočih "
      & "vrednosti od {total, number} opazovanj}}");
end Labels_2;
