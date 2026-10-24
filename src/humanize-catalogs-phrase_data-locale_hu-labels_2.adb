separate (Humanize.Catalogs.Phrase_Data.Locale_Hu)
procedure Labels_2 is
begin
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {a moderálási sor "
      & "üres} other {{pending, number} ellenőrzésre vár}}} other "
      & "{{pending, number} ellenőrzésre vár, {escalated, number} "
      & "eszkalálva}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {nyitott bejelentés} "
      & "triaged_report {osztályozott bejelentés} actioned_report "
      & "{intézkedés történt} dismissed_report {elutasított bejelentés} "
      & "appealed_report {megfellebbezett bejelentés} other {lezárt "
      & "bejelentés}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {nyitott bejelentés} triaged_report "
      & "{osztályozott bejelentés} actioned_report {intézkedés történt} "
      & "dismissed_report {elutasított bejelentés} appealed_report "
      & "{megfellebbezett bejelentés} other {lezárt bejelentés}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {ellenőrzésre vár} approved "
      & "{jóváhagyva} rejected {elutasítva} needs_changes {módosítás "
      & "szükséges} other {ellenőrzés eszkalálva}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {ellenőrzésre vár} approved "
      & "{jóváhagyva} rejected {elutasítva} needs_changes {módosítás "
      & "szükséges} other {ellenőrzés eszkalálva}}");
   P ("label.navigation.back_label", "vissza: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {nincs útvonalelem} one {1 útvonalelem} other "
      & "{{depth, number} útvonalelem}}");
   P ("label.navigation.current_page_label", "aktuális oldal: {name}");
   P ("label.navigation.external_link_label", "{name} (külső hivatkozás)");
   P ("label.navigation.first_label", "első: {target}");
   P ("label.navigation.last_label", "utolsó: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {nincs menüpont} one {1 menüpont} other {{count, "
      & "number} menüpont}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {hivatkozás} menu_item {menüpont} tab_item "
      & "{lap} breadcrumb_item {útvonalelem} section_item {szakasz} other "
      & "{elválasztó}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {hivatkozás} menu_item {menüpont} "
      & "tab_item {lap} breadcrumb_item {útvonalelem} section_item {szakasz} "
      & "other {elválasztó}}, {state, select, current_item {aktuális} "
      & "active_item {aktív} inactive_item {inaktív} disabled_item {letiltva} "
      & "expanded_item {kibontva} collapsed_item {összecsukva} visited_item "
      & "{meglátogatott} other {külső}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {aktuális} active_item {aktív} "
      & "inactive_item {inaktív} disabled_item {letiltva} expanded_item "
      & "{kibontva} collapsed_item {összecsukva} visited_item {meglátogatott} "
      & "other {külső}}");
   P ("label.navigation.next_label", "következő: {target}");
   P ("label.navigation.section_state_label",
      "{name}: szakasz {expanded, select, false {összecsukva} other "
      & "{kibontva}}{count, plural, =0 {} one {, 1 elem} other {, {count, "
      & "number} elem}}");
   P ("label.navigation.skip_link_label", "ugrás ide: {target}");
   P ("label.navigation.submenu_label",
      "{name}: almenü, {count, plural, one {1 elem} other {{count, number} "
      & "elem}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {minden riasztás} important_alerts {fontos "
      & "riasztások} critical_alerts_only {csak kritikus riasztások} other "
      & "{nincs riasztás}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: {state, select, preference_enabled {értesítések "
      & "engedélyezve} preference_disabled {értesítések letiltva} "
      & "preference_inherited {értesítések örökölt beállítással} other "
      & "{értesítések kötelezők}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {nincs összesítő} instant_digest "
      & "{azonnali összesítő} daily_digest {napi összesítő} other {heti "
      & "összesítő}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {engedélyezve} preference_disabled "
      & "{letiltva} preference_inherited {örökölt} other {kötelező}}");
   P ("label.notification_preferences.quiet_hours_label", "csendes órák: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {szál-feliratkozás} "
      & "project_subscription {projekt-feliratkozás} team_subscription "
      & "{csapat-feliratkozás} other {fiók-feliratkozás}}, {state, select, "
      & "preference_enabled {engedélyezve} preference_disabled {letiltva} "
      & "preference_inherited {örökölt} other {kötelező}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {szál-feliratkozás} "
      & "project_subscription {projekt-feliratkozás} team_subscription "
      & "{csapat-feliratkozás} other {fiók-feliratkozás}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} megemlített} reply_event "
      & "{{actor} válaszolt} assignment_event {{actor} hozzád rendelt egy "
      & "feladatot} approval_event {{actor} jóváhagyást kért} alert_event "
      & "{{actor} riasztást küldött} digest_event {{actor} összesítőt "
      & "küldött} reminder_event {{actor} emlékeztetőt küldött} other "
      & "{{actor} rendszerértesítést küldött}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {alkalmazáson belüli értesítés} "
      & "email_channel {e-mail-értesítés} sms_channel {SMS-értesítés} "
      & "push_channel {push-értesítés} webhook_channel "
      & "{webhook-értesítés} other {összesítő értesítés}}: {state, "
      & "select, pending_delivery {függőben} sent_delivery {elküldve} "
      & "delivered_delivery {kézbesítve} failed_delivery {sikertelen} "
      & "retrying_delivery {újrapróbálás} other {megszakítva}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {függő értesítés} sent_delivery "
      & "{elküldött értesítés} delivered_delivery {kézbesített "
      & "értesítés} failed_delivery {sikertelen értesítés} "
      & "retrying_delivery {értesítés újrapróbálása} other "
      & "{megszakított értesítés}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {függőben: {time_text}} "
      & "sent_delivery {elküldve: {time_text}} delivered_delivery "
      & "{kézbesítve: {time_text}} failed_delivery {sikertelen: {time_text}} "
      & "retrying_delivery {újrapróbálás: {time_text}} other {megszakítva: "
      & "{time_text}}}");
   P ("label.notifications.digest_label",
      "összesítő ({name}): {count, plural, =0 {nincs értesítés} one {1 "
      & "értesítés} other {{count, number} értesítés}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {nincs említés} "
      & "one {1 említés} other {{count, number} említés}}} reply_event "
      & "{{count, plural, =0 {nincs válasz} one {1 válasz} other {{count, "
      & "number} válasz}}} assignment_event {{count, plural, =0 {nincs "
      & "hozzárendelés} one {1 hozzárendelés} other {{count, number} "
      & "hozzárendelés}}} approval_event {{count, plural, =0 {nincs "
      & "jóváhagyási kérelem} one {1 jóváhagyási kérelem} other "
      & "{{count, number} jóváhagyási kérelem}}} alert_event {{count, "
      & "plural, =0 {nincs riasztás} one {1 riasztás} other {{count, number} "
      & "riasztás}}} digest_event {{count, plural, =0 {nincs összesítő} one "
      & "{1 összesítő} other {{count, number} összesítő}}} reminder_event "
      & "{{count, plural, =0 {nincs emlékeztető} one {1 emlékeztető} other "
      & "{{count, number} emlékeztető}}} other {{count, plural, =0 {nincs "
      & "rendszerértesítés} one {1 rendszerértesítés} other {{count, "
      & "number} rendszerértesítés}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {értesítés megjelölése olvasottként} other "
      & "{{count, number} értesítés megjelölése olvasottként}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {értesítés megjelölése olvasatlanként} other "
      & "{{count, number} értesítés megjelölése olvasatlanként}}");
   P ("label.notifications.muted_label", "{name}: értesítések némítva");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {új említés} reply_event {új "
      & "válasz} assignment_event {új hozzárendelés} approval_event {új "
      & "jóváhagyás} alert_event {új riasztás} digest_event {új "
      & "összesítő} reminder_event {új emlékeztető} other {új "
      & "rendszerértesítés}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {alkalmazáson belüli "
      & "értesítések} email_channel {e-mail-értesítések} sms_channel "
      & "{SMS-értesítések} push_channel {push-értesítések} "
      & "webhook_channel {webhook-értesítések} other {összesítő "
      & "értesítések}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {nincs értesítés} one {1 értesítés} other "
      & "{{count, number} értesítés}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {említés} reply_event {válasz} "
      & "assignment_event {hozzárendelés} approval_event {jóváhagyás} "
      & "alert_event {riasztás} digest_event {összesítő} reminder_event "
      & "{emlékeztető} other {rendszerértesítés}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {nincs értesítés} one {1 értesítés} "
      & "other {{count, number} értesítés}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {említés} reply_event "
      & "{válasz} assignment_event {hozzárendelés} approval_event "
      & "{jóváhagyás} alert_event {riasztás} digest_event {összesítő} "
      & "reminder_event {emlékeztető} other {rendszerértesítés}}, {state, "
      & "select, unread_state {olvasatlan} read_state {olvasott} archived_state "
      & "{archivált} muted_state {némítva} snoozed_state {elhalasztva} other "
      & "{elnyomva}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {olvasatlan értesítés} read_state "
      & "{olvasott értesítés} archived_state {archivált értesítés} "
      & "muted_state {némított értesítés} snoozed_state {elhalasztott "
      & "értesítés} other {elnyomott értesítés}}");
   P ("label.notifications.snoozed_label", "{name}: értesítések elhalasztva");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {nincs elnyomott értesítés} one {1 értesítés "
      & "elnyomva} other {{count, number} értesítés elnyomva}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {nincs olvasatlan értesítés} one {1 olvasatlan "
      & "értesítés} other {{count, number} olvasatlan értesítés}}");
   P ("label.payments.amount_label", "összeg: {amount_text}");
   P ("label.payments.balance_label", "egyenleg: {amount_text}");
   P ("label.payments.chargeback_label", "visszaterhelés: {amount_text}");
   P ("label.payments.discount_label", "kedvezmény: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, esedékes: {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {nincs számla} one {1 számla} other {{count, "
      & "number} számla}}");
   P ("label.payments.invoice_label",
      "számla {number}: {state, select, draft_invoice {piszkozat} "
      & "open_invoice {nyitott} paid_invoice {kifizetve} overdue_invoice "
      & "{lejárt} other {érvénytelenítve}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {számlapiszkozat} open_invoice {nyitott "
      & "számla} paid_invoice {kifizetett számla} overdue_invoice {lejárt "
      & "számla} other {érvénytelenített számla}}");
   P ("label.payments.method_label",
      "{method, select, card_method {kártyával fizetve: {detail}} "
      & "bank_transfer_method {banki átutalással fizetve: {detail}} "
      & "cash_method {készpénzzel fizetve: {detail}} wallet_method "
      & "{digitális pénztárcával fizetve: {detail}} check_method {csekkel "
      & "fizetve: {detail}} other {egyéb módon fizetve: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} kifizetve: {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {nincs fizetés} one {1 fizetés} other {{count, "
      & "number} fizetés}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {fizetés függőben} "
      & "authorized_payment {fizetés engedélyezve} paid_payment {kifizetve} "
      & "failed_payment {sikertelen fizetés} refunded_payment "
      & "{visszatérítve} other {fizetés megszakítva}}");
   P ("label.payments.payment_link_label", "fizetési link: {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kártya} bank_transfer_method {banki "
      & "átutalás} cash_method {készpénz} wallet_method {digitális "
      & "pénztárca} check_method {csekk} other {egyéb}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {függő fizetés} authorized_payment "
      & "{engedélyezett fizetés} paid_payment {teljesített fizetés} "
      & "failed_payment {sikertelen fizetés} refunded_payment "
      & "{visszatérített fizetés} other {megszakított fizetés}}");
   P ("label.payments.receipt_label", "nyugta {number}");
   P ("label.payments.refund_label",
      "{amount_text}: visszatérítés {state, select, pending_payment "
      & "{függőben} authorized_payment {engedélyezve} paid_payment "
      & "{kifizetve} failed_payment {sikertelen} refunded_payment {teljesítve} "
      & "other {megszakítva}}");
   P ("label.payments.subtotal_label", "részösszeg: {amount_text}");
   P ("label.payments.tax_label", "adó: {amount_text}");
   P ("label.payments.total_label", "összesen: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: a hozzáférés lejár: {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {tulajdonosi szerepkör} "
      & "admin_role {rendszergazdai szerepkör} editor_role {szerkesztői "
      & "szerepkör} viewer_role {megtekintői szerepkör} other {egyéni "
      & "szerepkör}} megadva");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {engedélyezve} denied "
      & "{megtagadva} inherited {örökölt} temporary {ideiglenes "
      & "hozzáférés} expired {lejárt} other {jóváhagyás szükséges}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {engedélyezve} denied {megtagadva} inherited "
      & "{örökölt} temporary {ideiglenes hozzáférés} expired {lejárt} "
      & "other {jóváhagyás szükséges}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {a szabályzat engedélyezi} "
      & "policy_denied {a szabályzat tiltja} policy_warning {szabályzati "
      & "figyelmeztetés} other {a szabályzat nem alkalmazható}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {tulajdonosi szerepkör} "
      & "admin_role {rendszergazdai szerepkör} editor_role {szerkesztői "
      & "szerepkör} viewer_role {megtekintői szerepkör} other {egyéni "
      & "szerepkör}} visszavonva");
   P ("label.permissions.role_label",
      "{role, select, owner_role {tulajdonos} admin_role {rendszergazda} "
      & "editor_role {szerkesztő} viewer_role {megtekintő} other {egyéni "
      & "szerepkör}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {üres} low_utilization {alacsony "
      & "kihasználtság} normal_utilization {normál kihasználtság} "
      & "high_utilization {magas kihasználtság} critical_utilization "
      & "{kritikus kihasználtság} full_utilization {megtelt} other {korláton "
      & "felül}}");
   P ("label.schema.array_shape_label",
      "tömb: {count_known, select, false {{element_type, select, "
      & "string_field {karakterláncok} integer_field {egész számok} "
      & "decimal_field {decimális számok} boolean_field {logikai értékek} "
      & "date_field {dátumok} date_time_field {időpontok} object_field "
      & "{objektumok} array_field {tömbök} enum_field {felsorolási "
      & "értékek} binary_field {bináris értékek} null_field {null "
      & "értékek} any_field {tetszőleges értékek} other {ismeretlen "
      & "értékek}}} other {{count, plural, one {1} other {{count, number}}} "
      & "{element_type, select, string_field {karakterlánc} integer_field "
      & "{egész szám} decimal_field {decimális szám} boolean_field {logikai "
      & "érték} date_field {dátum} date_time_field {időpont} object_field "
      & "{objektum} array_field {tömb} enum_field {felsorolási érték} "
      & "binary_field {bináris érték} null_field {null érték} any_field "
      & "{tetszőleges érték} other {ismeretlen érték}}}}");
   P ("label.schema.constraint_label", "megkötés ({name}): {value}");
   P ("label.schema.default_value_label", "{field_name} mező, alapérték: {value}");
   P ("label.schema.deprecated_field_label", "{name} mező elavult, helyette: {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 felsorolási lehetőség} other {{count, "
      & "number} felsorolási lehetőség}}");
   P ("label.schema.example_value_label", "{field_name} mező, példa: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {normál mező} deprecated_field {elavult "
      & "mező} unknown_field {ismeretlen mező} read_only_field {csak "
      & "olvasható mező} write_only_field {csak írható mező} other "
      & "{számított mező}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {karakterlánc-mező} integer_field "
      & "{egész szám mező} decimal_field {decimális mező} boolean_field "
      & "{logikai mező} date_field {dátummező} date_time_field "
      & "{időpontmező} object_field {objektummező} array_field {tömbmező} "
      & "enum_field {felsorolásmező} binary_field {bináris mező} null_field "
      & "{null mező} any_field {tetszőleges típusú mező} other {ismeretlen "
      & "típusú mező}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {nem hiányzik kötelező mező} one {1 kötelező "
      & "mező hiányzik} other {{count, number} kötelező mező hiányzik}}");
   P ("label.schema.object_shape_label",
      "objektum, {fields, plural, one {1 mező} other {{fields, number} "
      & "mező}}{required, plural, =0 {} other {, {required, number} "
      & "kötelező}}{optional, plural, =0 {} other {, {optional, number} "
      & "opcionális}}");
   P ("label.schema.schema_source_label", "séma: {name}, verzió: {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skaláris érték} object_shape {{count, "
      & "plural, =0 {objektum} one {objektum, 1 mező} other {objektum, {count, "
      & "number} mező}}} array_shape {{count, plural, =0 {tömb} one {tömb, 1 "
      & "elem} other {tömb, {count, number} elem}}} map_shape {{count, plural, "
      & "=0 {leképezés} one {leképezés, 1 bejegyzés} other {leképezés, "
      & "{count, number} bejegyzés}}} tuple_shape {{count, plural, =0 "
      & "{rendezett n-es} one {rendezett n-es, 1 elem} other {rendezett n-es, "
      & "{count, number} elem}}} union_shape {{count, plural, =0 {unió} one "
      & "{unió, 1 típus} other {unió, {count, number} típus}}} empty_shape "
      & "{üres szerkezet} other {ismeretlen szerkezet}}");
   P ("label.schema.unknown_field_label", "ismeretlen mező: {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {nincs aktív szűrő} one {1 aktív szűrő} other "
      & "{{count, number} aktív szűrő}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {szűrők törlése} one {az aktív szűrő "
      & "törlése} other {{count, number} aktív szűrő törlése}}");
   P ("label.search.facet_label",
      "{name} szempont, {count, plural, one {1 lehetőség} other {{count, "
      & "number} lehetőség}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {nincs találat} one {1 találat} other "
      & "{{count, number} találat}}{selected, select, false {} other {, "
      & "kijelölve}}");
   P ("label.search.filter_label",
      "{name}: {value} ({state, select, active_filter {aktív szűrő} "
      & "inactive_filter {inaktív szűrő} other {kizáró szűrő}})");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktív szűrő} inactive_filter "
      & "{inaktív szűrő} other {kizáró szűrő}}");
   P ("label.search.no_results_label", "nincs találat erre: „{query}”");
   P ("label.search.recent_search_label", "legutóbbi keresés: „{query}”");
   P ("label.search.saved_search_label",
      "mentett keresés: {name}{count, plural, =0 {} one {, 1 találat} other "
      & "{, {count, number} találat}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {nincs legutóbbi keresés} one {1 legutóbbi "
      & "keresés} other {{count, number} legutóbbi keresés}}");
   P ("label.search.search_query_label", "keresés: „{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {nincs találat} one {1 találat} other {{count, "
      & "number} találat}}");
   P ("label.search.search_result_summary_label",
      "találatok erre: „{query}”: {count, plural, =0 {nincs találat} "
      & "one {1 találat} other {{count, number} találat}}");
   P ("label.search.search_scope_label",
      "keresési hatókör: {name}, {count, plural, =0 {nincs találat} one "
      & "{1 találat} other {{count, number} találat}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {a keresés tétlen} searching_search "
      & "{keresés folyamatban} complete_search {a keresés befejeződött} "
      & "empty_search {nincs keresési találat} other {a keresés sikertelen}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {rendezés relevancia szerint} "
      & "ascending_sort {rendezés növekvő sorrendben} descending_sort "
      & "{rendezés csökkenő sorrendben} newest_first_sort {rendezés: "
      & "legújabb elöl} other {rendezés: legrégebbi elöl}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevancia} ascending_sort {növekvő} "
      & "descending_sort {csökkenő} newest_first_sort {legújabb elöl} other "
      & "{legrégebbi elöl}}");
   P ("label.search.suggestion_label", "erre gondolt: „{query}”?");
   P ("label.secrets.credential_source_label",
      "{source}: {count, plural, one {1 hitelesítő adat} other {{count, "
      & "number} hitelesítő adat}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {az érték rejtett} masked_value {az "
      & "érték maszkolt} suffix_only {csak utótag} other {csak ujjlenyomat}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {nyilvános} support_profile "
      & "{támogatás} audit_profile {auditálás} other {hibakeresés}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {rotáció nem szükséges} other "
      & "{rotáció szükséges}}{days_old, plural, =0 {} one {, 1 napos} other "
      & "{, {days_old, number} napos}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-kulcs} live_api_key {éles API-kulcs} "
      & "test_api_key {teszt API-kulcs} github_token {GitHub-token} "
      & "aws_access_key {AWS hozzáférési kulcs} google_api_key {Google "
      & "API-kulcs} slack_token {Slack-token} npm_token {npm-token} "
      & "bearer_token {bearer token} jwt_token {JWT-token} "
      & "basic_auth_credential {Basic Auth hitelesítő adat} password_secret "
      & "{jelszó} private_key {titkos kulcs} ssh_private_key {titkos "
      & "SSH-kulcs} webhook_secret {webhook-titok} oauth_token {OAuth-token} "
      & "database_url_secret {adatbázis-URL titok} sha1_fingerprint {SHA-1 "
      & "ujjlenyomat} sha256_fingerprint {SHA-256 ujjlenyomat} other {titok}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefon} url_value "
      & "{URL} ip_address_value {IP-cím} token_value {token} file_path_value "
      & "{fájlútvonal} account_id_value {fiókazonosító} "
      & "payment_reference_value {fizetési hivatkozás} log_field_value "
      & "{naplómező} other {érzékeny érték}}");
   P ("label.tables.cell_label",
      "{row, number}. sor, {column, number}. oszlop: {state, select, "
      & "empty_cell {üres} edited_cell {szerkesztve} invalid_cell "
      & "{érvénytelen} highlighted_cell {kiemelve} other {csak olvasható}}");
   P ("label.tables.cell_position_label", "{row, number}. sor, {column, number}. oszlop");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {üres cella} edited_cell {szerkesztett "
      & "cella} invalid_cell {érvénytelen cella} highlighted_cell {kiemelt "
      & "cella} other {csak olvasható cella}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {nincs oszlop} one {1 oszlop} other {{count, "
      & "number} oszlop}}");
   P ("label.tables.column_label",
      "{name} ({role, select, text_column {szöveges oszlop} number_column "
      & "{számoszlop} date_column {dátumoszlop} status_column "
      & "{állapotoszlop} action_column {műveletoszlop} other {rejtett "
      & "oszlop}})");
   P ("label.tables.column_role_label",
      "{role, select, text_column {szöveges oszlop} number_column "
      & "{számoszlop} date_column {dátumoszlop} status_column "
      & "{állapotoszlop} action_column {műveletoszlop} other {rejtett "
      & "oszlop}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 sor} other {{count, number} sor}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {nincs sor} one {1 sor} other {{count, number} "
      & "sor}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {nincs rendezve} ascending_sort "
      & "{növekvő} other {csökkenő}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {nincs rendezve} ascending_sort "
      & "{rendezve: {column_name}, növekvő} other {rendezve: {column_name}, "
      & "csökkenő}}");
   P ("label.tables.subtotal_label", "részösszeg – {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 sor} other {{rows, number} sor}} × {columns, "
      & "plural, one {1 oszlop} other {{columns, number} oszlop}}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {nincs hozzárendelve} assigned "
      & "{hozzárendelve} reassigned {újra hozzárendelve} watching {figyeli} "
      & "other {a feladat tulajdonosa}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {nincs hozzárendelve} assigned "
      & "{hozzárendelve} reassigned {újra hozzárendelve} watching {figyeli} "
      & "other {a feladat tulajdonosa}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {üres teendőlista} one {teendőlista: 1 feladat} "
      & "other {teendőlista: {count, number} feladat}}");
   P ("label.tasks.blocker_label", "blokkolja: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {feladat befejezése} other {{count, number} "
      & "feladat befejezése}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {nincs befejezett feladat} one {1 befejezett "
      & "feladat} other {{count, number} befejezett feladat}}");
   P ("label.tasks.due_label", "határidő: {due_text}");
   P ("label.tasks.estimate_label", "becslés: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {nincs nyitott feladat} one {1 nyitott feladat} "
      & "other {{count, number} nyitott feladat}}");
   P ("label.tasks.overdue_label", "lejárt, határidő: {due_text}");
   P ("label.tasks.recurring_task_label", "ismétlődik: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {feladat újranyitása} other {{count, number} "
      & "feladat újranyitása}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 feladat} other {{count, number} "
      & "feladat}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 részfeladat} other {{count, number} "
      & "részfeladat}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {nincs feladat} one {1 feladat} other {{count, "
      & "number} feladat}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {nyitott feladat} in_progress_task "
      & "{folyamatban lévő feladat} blocked_task {blokkolt feladat} done_task "
      & "{kész feladat} canceled_task {visszavont feladat} deferred_task "
      & "{elhalasztott feladat} other {lejárt feladat}}{priority, select, "
      & "no_priority {} low_priority {, alacsony prioritás} medium_priority {, "
      & "közepes prioritás} high_priority {, magas prioritás} other {, "
      & "kritikus prioritás}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {nincs prioritás} low_priority "
      & "{alacsony prioritás} medium_priority {közepes prioritás} "
      & "high_priority {magas prioritás} other {kritikus prioritás}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {nyitott feladat} in_progress_task "
      & "{folyamatban lévő feladat} blocked_task {blokkolt feladat} done_task "
      & "{kész feladat} canceled_task {visszavont feladat} deferred_task "
      & "{elhalasztott feladat} other {lejárt feladat}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {felső határ} other {alsó határ}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {a várt tartomány alatt} within_range {a "
      & "várt tartományon belül} above_range {a várt tartomány felett} "
      & "below_target {a cél alatt} at_target {a célon} above_target {a cél "
      & "felett} near_limit {a határ közelében} warning_level "
      & "{figyelmeztetési küszöb} critical_level {kritikus küszöb} "
      & "breached {túllépve} other {ismeretlen küszöbállapot}}");
   P ("label.versions.commit_distance_label",
      "{ahead, plural, =0 {{behind, plural, =0 {naprakész} one {1 committal "
      & "lemaradva} other {{behind, number} committal lemaradva}}} one {1 "
      & "committal előrébb{behind, plural, =0 {} one {, 1 committal "
      & "lemaradva} other {, {behind, number} committal lemaradva}}} other "
      & "{{ahead, number} committal előrébb{behind, plural, =0 {} one {, 1 "
      & "committal lemaradva} other {, {behind, number} committal lemaradva}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {jóváhagyta: {approver}} other "
      & "{jóváhagyásra vár: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {próbálkozás: 1/1} other "
      & "{próbálkozás: {attempt, number}/1 – korlát túllépve}}} other "
      & "{próbálkozás: {attempt, number}/{limit, number}}}");
   P ("label.workflows.blocker_label", "blokkolva: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {nincs blokkoló függőség} one {1 blokkoló "
      & "függőség} other {{count, number} blokkoló függőség}}");
   P ("label.workflows.handoff_label", "átadás: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {közelgő mérföldkő} "
      & "current_milestone {aktuális mérföldkő} complete_milestone "
      & "{teljesített mérföldkő} missed_milestone {elmulasztott "
      & "mérföldkő} other {blokkolt mérföldkő}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {közelgő} "
      & "current_milestone {aktuális} complete_milestone {teljesítve} "
      & "missed_milestone {elmulasztva} other {blokkolva}}");
   P ("label.workflows.next_action_label", "következő: {action}");
   P ("label.workflows.owner_label", "tulajdonos: {owner}");
   P ("label.workflows.resume_label", "{name} folytatása");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {függőben} active_step {aktív} "
      & "waiting_step {várakozik} blocked_step {blokkolva} done_step {kész} "
      & "failed_step {sikertelen} other {kihagyva}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {függőben} active_step {aktív} "
      & "waiting_step {várakozik} blocked_step {blokkolva} done_step {kész} "
      & "failed_step {sikertelen} other {kihagyva}}");
   P ("label.workflows.waiting_label", "várakozás: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {nem indult el} "
      & "in_progress_state {folyamatban} waiting_state {várakozik} "
      & "waiting_approval_state {jóváhagyásra vár} blocked_state "
      & "{blokkolva} completed_state {befejeződött} failed_state {sikertelen} "
      & "cancelled_state {megszakítva} skipped_state {kihagyva} other "
      & "{szüneteltetve}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nem indult el} in_progress_state "
      & "{folyamatban} waiting_state {várakozik} waiting_approval_state "
      & "{jóváhagyásra vár} blocked_state {blokkolva} completed_state "
      & "{befejeződött} failed_state {sikertelen} cancelled_state "
      & "{megszakítva} skipped_state {kihagyva} other {szüneteltetve}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {átlátszó} mostly_transparent "
      & "{többnyire átlátszó} translucent {áttetsző} mostly_opaque "
      & "{többnyire átlátszatlan} other {átlátszatlan}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {nincs megfigyelés} other {{count, number} "
      & "megfigyelés, min. {minimum} {unit}, medián {median} {unit}, max. "
      & "{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {nincs megfigyelés} other "
      & "{0 kiugró érték {total, number} megfigyelésből}}} one {1 kiugró "
      & "érték {total, number} megfigyelésből} other {{outliers, number} "
      & "kiugró érték {total, number} megfigyelésből}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {nincs megfigyelés} "
      & "sample_too_small_shape {a minta túl kicsi az alak leírásához, "
      & "{count, plural, one {1 megfigyelés} other {{count, number} "
      & "megfigyelés}}} flat_shape {lapos eloszlás {median} értéknél} "
      & "outlier_heavy_shape {kiugró értékekben gazdag eloszlás {median} "
      & "körül} volatile_shape {ingadozó eloszlás {median} körül} "
      & "clustered_shape {csoportosuló eloszlás {median} körül} "
      & "wide_spread_shape {széles szórású eloszlás} wide_spread_range "
      & "{széles szórású eloszlás {minimum} és {maximum} között} "
      & "right_skewed_shape {jobbra ferde eloszlás, medián: {median}} "
      & "left_skewed_shape {balra ferde eloszlás, medián: {median}} other "
      & "{nagyjából kiegyensúlyozott eloszlás {median} körül}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {üres e-mail} address {e-mail-cím} other "
      & "{e-mail ezen a tartományon: {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonszám} redacted {telefonszám kitakarva} "
      & "other {telefonszám, vége: {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {felhasználónév} other {felhasználónév: "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label",
      "{state, select, none {kódszimbólum} other {kódszimbólum: "
      & "{symbol}}}");
   P ("label.privacy.address_metadata_label",
      "címmetaadatok: {present, plural, one {1 mező megvan} other "
      & "{{present, number} mező megvan}}, {missing, plural, one {1 mező "
      & "hiányzik} other {{missing, number} mező hiányzik}}");
   P ("label.endpoints.host_label", "{state, select, none {ismeretlen gazdagép} other {{host} {kind}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {ismeretlen végpont} other {{scheme}{host}{port} "
      & "{kind} végpont}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {üres URL} none {URL felismert összetevők "
      & "nélkül} other {URL {count, plural, one {1 összetevővel} other "
      & "{{count, number} összetevővel}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {nincs lekérdezési paraméter} one {1 "
      & "lekérdezési paraméter} other {{count, number} lekérdezési "
      & "paraméter}}");
   P ("label.endpoints.ip_address_label",
      "{address} {kind, select, ipv4_host {nyilvános IPv4-cím} ipv6_host "
      & "{nyilvános IPv6-cím} private_network_host {magánhálózati cím} "
      & "localhost_host {helyi gép} other {nem IP-cím}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} érvénytelen CIDR} other {{cidr} "
      & "{kind} hálózati előtag: {prefix}}}");
   P ("label.resources.utilization_label",
      "{used, number}/{total, number} {unit} felhasználva ({percent}, "
      & "{band})");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} a kapacitás felett} "
      & "other {{count, number}/{total, number} {unit} maradt}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvóta túllépve {count, number} {unit} "
      & "értékkel ({percent} felhasználva)} near {kvóta a korlát "
      & "közelében: {count, number} {unit} maradt ({percent} felhasználva)} "
      & "other {kvóta elérhető: {count, number} {unit} maradt ({percent} "
      & "felhasználva)}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {gyorsítótár-találati arány nem érhető el: "
      & "nincs kérés} other {gyorsítótár-találati arány {percent}: "
      & "{hits, number} találat, {misses, number} tévesztés}}");
   P ("label.resources.saturation_label", "{named, select, no {erőforrás} other {{name}}} {percent} {band}");
   P ("label.versions.version_label",
      "{state, select, both {verzió: {version}, előzetes: {prerelease}, "
      & "build: {build}} prerelease {verzió: {version}, előzetes: "
      & "{prerelease}} build {verzió: {version}, build: {build}} other "
      & "{verzió: {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {azonos verzió} major_upgrade "
      & "{főverzió-frissítés} minor_upgrade {alverzió-frissítés} "
      & "patch_upgrade {javítófrissítés} prerelease_change {előzetes "
      & "verzió változása} build_metadata_change {build-metaadat "
      & "változása} downgrade {visszaléptetés} other {ismeretlen "
      & "verzióváltozás}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {pontosan ez a verzió: {version}} "
      & "minimum_range {{version} vagy újabb verzió} maximum_range {{version} "
      & "vagy régebbi verzió} major_compatible_range {kompatibilis ezzel a "
      & "főverzióval: {version}} minor_compatible_range {kompatibilis ezzel "
      & "az alverzióval: {version}} other {verziótartomány: {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {kezdeti fejlesztői kiadás: {version}} "
      & "prerelease {előzetes kiadás: {version}} major {főkiadás: "
      & "{version}} minor {alkiadás: {version}} other {javítókiadás: "
      & "{version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {hivatkozáscímke} image {képcímke} paragraph "
      & "{bekezdéscímke} ordered_list {rendezett lista címke} unordered_list "
      & "{rendezetlen lista címke} list_item {listaelem-címke} "
      & "table_header_cell {táblázatfejléc-cella címke} table_cell "
      & "{táblázatcella-címke} table_row {táblázatsor-címke} line_break "
      & "{sortörés-címke} thematic_break {tematikus elválasztó címke} "
      & "heading_level_n {{level, number}. szintű címsor címke} other "
      & "{{name} címke}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name} attribútum} event {{name} "
      & "eseménykezelő attribútum} other {{name} attribútum, értéke: "
      & "„{value}”}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {1 attribútum} other {{count, number} "
      & "attribútum}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {1 data-attribútum} other {{count, number} "
      & "data-attribútum}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {1 ARIA-attribútum} other {{count, number} "
      & "ARIA-attribútum}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {1 eseménykezelő} other {{count, number} "
      & "eseménykezelő}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {szöveges tartalom} html_content "
      & "{HTML-dokumentum} json_content {JSON-dokumentum} xml_content "
      & "{XML-dokumentum} image_content {képtartalom} audio_content "
      & "{hangtartalom} video_content {videótartalom} font_content "
      & "{betűtípus-tartalom} archive_content {archívumtartalom} "
      & "binary_content {bináris tartalom} form_content {űrlapbeküldés} "
      & "other {ismeretlen tartalom}} ({base})");
   P ("label.markup.heading_label", "{level, number}. szintű címsor");
   P ("label.markup.tag_count_label.total", "{count, plural, one {1 címke} other {{count, number} címke}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {1 hivatkozás} other {{count, number} "
      & "hivatkozás}}");
end Labels_2;
