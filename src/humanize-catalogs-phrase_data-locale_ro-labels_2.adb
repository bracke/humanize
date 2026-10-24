separate (Humanize.Catalogs.Phrase_Data.Locale_Ro)
procedure Labels_2 is
begin
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {niciun element de meniu} one {1 element de meniu} "
      & "few {{count, number} elemente de meniu} other {{count, number} de "
      & "elemente de meniu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {element de meniu} tab_item "
      & "{filă} breadcrumb_item {element de navigare} section_item {secțiune} "
      & "other {separator}}");
   P ("label.navigation.navigation_item_label",
      "{name}, {kind, select, link_item {link} menu_item {element de meniu} "
      & "tab_item {filă} breadcrumb_item {element de navigare} section_item "
      & "{secțiune} other {separator}}: {state, select, current_item {{kind, "
      & "select, tab_item {curentă} section_item {curentă} other {curent}}} "
      & "active_item {{kind, select, tab_item {activă} section_item {activă} "
      & "other {activ}}} inactive_item {{kind, select, tab_item {inactivă} "
      & "section_item {inactivă} other {inactiv}}} disabled_item {{kind, "
      & "select, tab_item {dezactivată} section_item {dezactivată} other "
      & "{dezactivat}}} expanded_item {{kind, select, tab_item {extinsă} "
      & "section_item {extinsă} other {extins}}} collapsed_item {{kind, "
      & "select, tab_item {restrânsă} section_item {restrânsă} other "
      & "{restrâns}}} visited_item {{kind, select, tab_item {vizitată} "
      & "section_item {vizitată} other {vizitat}}} other {{kind, select, "
      & "tab_item {externă} section_item {externă} other {extern}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {curent} active_item {activ} "
      & "inactive_item {inactiv} disabled_item {dezactivat} expanded_item "
      & "{extins} collapsed_item {restrâns} visited_item {vizitat} other "
      & "{extern}}");
   P ("label.navigation.next_label", "următorul: {target}");
   P ("label.navigation.section_state_label",
      "{name}, secțiune {expanded, select, false {restrânsă} other "
      & "{extinsă}}{count, plural, =0 {} one {, 1 element} few {, {count, "
      & "number} elemente} other {, {count, number} de elemente}}");
   P ("label.navigation.skip_link_label", "salt la {target}");
   P ("label.navigation.submenu_label",
      "{name}, submeniu, {count, plural, one {1 element} few {{count, number} "
      & "elemente} other {{count, number} de elemente}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {toate alertele} important_alerts {alerte "
      & "importante} critical_alerts_only {doar alerte critice} other {nicio "
      & "alertă}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: notificări {state, select, preference_enabled {activate} "
      & "preference_disabled {dezactivate} preference_inherited {moștenite} "
      & "other {obligatorii}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {fără rezumat} instant_digest {rezumat "
      & "instant} daily_digest {rezumat zilnic} other {rezumat săptămânal}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {activat} preference_disabled "
      & "{dezactivat} preference_inherited {moștenit} other {obligatoriu}}");
   P ("label.notification_preferences.quiet_hours_label", "ore de liniște {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: abonare {scope, select, thread_subscription {la discuție} "
      & "project_subscription {la proiect} team_subscription {la echipă} other "
      & "{la cont}} {state, select, preference_enabled {activată} "
      & "preference_disabled {dezactivată} preference_inherited {moștenită} "
      & "other {obligatorie}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {abonare la discuție} "
      & "project_subscription {abonare la proiect} team_subscription {abonare "
      & "la echipă} other {abonare la cont}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} v-a menționat} reply_event "
      & "{{actor} a răspuns} assignment_event {{actor} v-a atribuit o "
      & "sarcină} approval_event {{actor} a solicitat aprobare} alert_event "
      & "{{actor} a trimis o alertă} digest_event {{actor} a trimis un "
      & "rezumat} reminder_event {{actor} a trimis un memento} other {{actor} a "
      & "trimis o notificare de sistem}}");
   P ("label.notifications.delivery_label",
      "notificare {channel, select, in_app_channel {în aplicație} "
      & "email_channel {prin e-mail} sms_channel {prin SMS} push_channel {push} "
      & "webhook_channel {prin webhook} other {de rezumat}}: {state, select, "
      & "pending_delivery {în așteptare} sent_delivery {trimisă} "
      & "delivered_delivery {livrată} failed_delivery {eșuată} "
      & "retrying_delivery {se reîncearcă} other {anulată}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notificare în așteptare} "
      & "sent_delivery {notificare trimisă} delivered_delivery {notificare "
      & "livrată} failed_delivery {notificare eșuată} retrying_delivery "
      & "{notificare în curs de reîncercare} other {notificare anulată}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {în așteptare {time_text}} "
      & "sent_delivery {trimisă {time_text}} delivered_delivery {livrată "
      & "{time_text}} failed_delivery {eșuată {time_text}} retrying_delivery "
      & "{reîncercare {time_text}} other {anulată {time_text}}}");
   P ("label.notifications.digest_label",
      "{count, plural, =0 {rezumat {name}: nicio notificare} one {rezumat "
      & "{name}: 1 notificare} few {rezumat {name}: {count, number} "
      & "notificări} other {rezumat {name}: {count, number} de notificări}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {nicio mențiune} "
      & "one {1 mențiune} few {{count, number} mențiuni} other {{count, "
      & "number} de mențiuni}}} reply_event {{count, plural, =0 {niciun "
      & "răspuns} one {1 răspuns} few {{count, number} răspunsuri} other "
      & "{{count, number} de răspunsuri}}} assignment_event {{count, plural, "
      & "=0 {nicio atribuire} one {1 atribuire} few {{count, number} atribuiri} "
      & "other {{count, number} de atribuiri}}} approval_event {{count, plural, "
      & "=0 {nicio solicitare de aprobare} one {1 solicitare de aprobare} few "
      & "{{count, number} solicitări de aprobare} other {{count, number} de "
      & "solicitări de aprobare}}} alert_event {{count, plural, =0 {nicio "
      & "alertă} one {1 alertă} few {{count, number} alerte} other {{count, "
      & "number} de alerte}}} digest_event {{count, plural, =0 {niciun rezumat} "
      & "one {1 rezumat} few {{count, number} rezumate} other {{count, number} "
      & "de rezumate}}} reminder_event {{count, plural, =0 {niciun memento} one "
      & "{1 memento} few {{count, number} mementouri} other {{count, number} de "
      & "mementouri}}} other {{count, plural, =0 {nicio notificare de sistem} "
      & "one {1 notificare de sistem} few {{count, number} notificări de "
      & "sistem} other {{count, number} de notificări de sistem}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {marchează notificarea ca citită} few "
      & "{marchează {count, number} notificări ca citite} other {marchează "
      & "{count, number} de notificări ca citite}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {marchează notificarea ca necitită} few "
      & "{marchează {count, number} notificări ca necitite} other {marchează "
      & "{count, number} de notificări ca necitite}}");
   P ("label.notifications.muted_label", "{name}: notificări fără sunet");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {mențiune nouă} reply_event {răspuns "
      & "nou} assignment_event {atribuire nouă} approval_event {aprobare "
      & "nouă} alert_event {alertă nouă} digest_event {rezumat nou} "
      & "reminder_event {memento nou} other {notificare de sistem nouă}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notificări în aplicație} "
      & "email_channel {notificări prin e-mail} sms_channel {notificări prin "
      & "SMS} push_channel {notificări push} webhook_channel {notificări prin "
      & "webhook} other {notificări de rezumat}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {nicio notificare} one {1 notificare} few {{count, "
      & "number} notificări} other {{count, number} de notificări}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {mențiune} reply_event {răspuns} "
      & "assignment_event {atribuire} approval_event {aprobare} alert_event "
      & "{alertă} digest_event {rezumat} reminder_event {memento} other "
      & "{notificare de sistem}}");
   P ("label.notifications.notification_group_label",
      "{count, plural, =0 {{name}: nicio notificare} one {{name}: 1 "
      & "notificare} few {{name}: {count, number} notificări} other {{name}: "
      & "{count, number} de notificări}}");
   P ("label.notifications.notification_label",
      "{subject}, {event, select, mention_event {mențiune} reply_event "
      & "{răspuns} assignment_event {atribuire} approval_event {aprobare} "
      & "alert_event {alertă} digest_event {rezumat} reminder_event {memento} "
      & "other {notificare de sistem}}: {state, select, unread_state {{event, "
      & "select, reply_event {necitit} digest_event {necitit} reminder_event "
      & "{necitit} other {necitită}}} read_state {{event, select, reply_event "
      & "{citit} digest_event {citit} reminder_event {citit} other {citită}}} "
      & "archived_state {{event, select, reply_event {arhivat} digest_event "
      & "{arhivat} reminder_event {arhivat} other {arhivată}}} muted_state "
      & "{fără sunet} snoozed_state {{event, select, reply_event {amânat} "
      & "digest_event {amânat} reminder_event {amânat} other {amânată}}} "
      & "other {{event, select, reply_event {suprimat} digest_event {suprimat} "
      & "reminder_event {suprimat} other {suprimată}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {notificare necitită} read_state "
      & "{notificare citită} archived_state {notificare arhivată} muted_state "
      & "{notificare fără sunet} snoozed_state {notificare amânată} other "
      & "{notificare suprimată}}");
   P ("label.notifications.snoozed_label", "{name}: notificări amânate");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {nicio notificare suprimată} one {1 notificare "
      & "suprimată} few {{count, number} notificări suprimate} other {{count, "
      & "number} de notificări suprimate}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {nicio notificare necitită} one {1 notificare "
      & "necitită} few {{count, number} notificări necitite} other {{count, "
      & "number} de notificări necitite}}");
   P ("label.payments.amount_label", "sumă: {amount_text}");
   P ("label.payments.balance_label", "sold: {amount_text}");
   P ("label.payments.chargeback_label", "chargeback: {amount_text}");
   P ("label.payments.discount_label", "reducere: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, scadent {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {nicio factură} one {1 factură} few {{count, "
      & "number} facturi} other {{count, number} de facturi}}");
   P ("label.payments.invoice_label",
      "factura {number}: {state, select, draft_invoice {ciornă} open_invoice "
      & "{deschisă} paid_invoice {plătită} overdue_invoice {restantă} other "
      & "{anulată}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {factură ciornă} open_invoice "
      & "{factură deschisă} paid_invoice {factură plătită} overdue_invoice "
      & "{factură restantă} other {factură anulată}}");
   P ("label.payments.method_label",
      "{method, select, card_method {plătit cu cardul} bank_transfer_method "
      & "{plătit prin transfer bancar} cash_method {plătit în numerar} "
      & "wallet_method {plătit cu portofel electronic} check_method {plătit "
      & "cu cec} other {plătit prin altă metodă}}: {detail}");
   P ("label.payments.paid_label", "{amount_text} plătit {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {nicio plată} one {1 plată} few {{count, number} "
      & "plăți} other {{count, number} de plăți}}");
   P ("label.payments.payment_label",
      "{amount_text}: plată {state, select, pending_payment {în așteptare} "
      & "authorized_payment {autorizată} paid_payment {efectuată} "
      & "failed_payment {eșuată} refunded_payment {rambursată} other "
      & "{anulată}}");
   P ("label.payments.payment_link_label", "link de plată {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {card} bank_transfer_method {transfer "
      & "bancar} cash_method {numerar} wallet_method {portofel electronic} "
      & "check_method {cec} other {altă metodă}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {plată în așteptare} "
      & "authorized_payment {plată autorizată} paid_payment {plată "
      & "efectuată} failed_payment {plată eșuată} refunded_payment {plată "
      & "rambursată} other {plată anulată}}");
   P ("label.payments.receipt_label", "chitanța {number}");
   P ("label.payments.refund_label",
      "{amount_text}: rambursare {state, select, pending_payment {în "
      & "așteptare} authorized_payment {autorizată} paid_payment {plătită} "
      & "failed_payment {eșuată} refunded_payment {finalizată} other "
      & "{anulată}}");
   P ("label.payments.subtotal_label", "subtotal: {amount_text}");
   P ("label.payments.tax_label", "taxe: {amount_text}");
   P ("label.payments.total_label", "total: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: accesul expiră {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: rolul {role, select, owner_role {de proprietar} admin_role "
      & "{de administrator} editor_role {de editor} viewer_role {de "
      & "vizualizator} other {personalizat}} a fost acordat");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {acordat} denied "
      & "{refuzat} inherited {moștenit} temporary {acces temporar} expired "
      & "{expirat} other {necesită aprobare}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {acordat} denied {refuzat} inherited "
      & "{moștenit} temporary {acces temporar} expired {expirat} other "
      & "{necesită aprobare}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {permis de politică} policy_denied "
      & "{refuzat de politică} policy_warning {avertisment de politică} other "
      & "{politica nu se aplică}}");
   P ("label.permissions.revoke_label",
      "{subject}: rolul {role, select, owner_role {de proprietar} admin_role "
      & "{de administrator} editor_role {de editor} viewer_role {de "
      & "vizualizator} other {personalizat}} a fost revocat");
   P ("label.permissions.role_label",
      "{role, select, owner_role {proprietar} admin_role {administrator} "
      & "editor_role {editor} viewer_role {vizualizator} other {rol "
      & "personalizat}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {gol} low_utilization {utilizare "
      & "scăzută} normal_utilization {utilizare normală} high_utilization "
      & "{utilizare ridicată} critical_utilization {utilizare critică} "
      & "full_utilization {plin} other {peste limită}}");
   P ("label.schema.array_shape_label",
      "matrice {element_type, select, string_field {de șiruri} integer_field "
      & "{de numere întregi} decimal_field {de numere zecimale} boolean_field "
      & "{de valori booleene} date_field {de date calendaristice} "
      & "date_time_field {de date și ore} object_field {de obiecte} "
      & "array_field {de matrice} enum_field {de enumerări} binary_field {de "
      & "date binare} null_field {de valori nule} any_field {de orice tip} "
      & "other {de tip necunoscut}}{count_known, select, false {} other "
      & "{{count, plural, one {, 1 element} few {, {count, number} elemente} "
      & "other {, {count, number} de elemente}}}}");
   P ("label.schema.constraint_label", "constrângere {name}: {value}");
   P ("label.schema.default_value_label", "câmpul {field_name}: valoare implicită {value}");
   P ("label.schema.deprecated_field_label", "câmp învechit {name}, folosiți {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 opțiune de enumerare} few {{count, number} "
      & "opțiuni de enumerare} other {{count, number} de opțiuni de "
      & "enumerare}}");
   P ("label.schema.example_value_label", "câmpul {field_name}: exemplu {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {câmp normal} deprecated_field {câmp "
      & "învechit} unknown_field {câmp necunoscut} read_only_field {câmp "
      & "doar în citire} write_only_field {câmp doar în scriere} other "
      & "{câmp calculat}}");
   P ("label.schema.field_type_label",
      "câmp de tip {kind, select, string_field {șir} integer_field "
      & "{întreg} decimal_field {zecimal} boolean_field {boolean} date_field "
      & "{dată} date_time_field {dată și oră} object_field {obiect} "
      & "array_field {matrice} enum_field {enumerare} binary_field {binar} "
      & "null_field {nul} any_field {oricare} other {necunoscut}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {niciun câmp obligatoriu lipsă} one {1 câmp "
      & "obligatoriu lipsă} few {{count, number} câmpuri obligatorii lipsă} "
      & "other {{count, number} de câmpuri obligatorii lipsă}}");
   P ("label.schema.object_shape_label",
      "obiect cu {fields, plural, one {1 câmp} few {{fields, number} "
      & "câmpuri} other {{fields, number} de câmpuri}}{required, plural, =0 "
      & "{} other {, obligatorii: {required, number}}}{optional, plural, =0 {} "
      & "other {, opționale: {optional, number}}}");
   P ("label.schema.schema_source_label", "schema {name}, versiunea {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {valoare scalară} object_shape {{count, "
      & "plural, =0 {obiect} one {obiect cu 1 câmp} few {obiect cu {count, "
      & "number} câmpuri} other {obiect cu {count, number} de câmpuri}}} "
      & "array_shape {{count, plural, =0 {matrice} one {matrice cu 1 element} "
      & "few {matrice cu {count, number} elemente} other {matrice cu {count, "
      & "number} de elemente}}} map_shape {{count, plural, =0 {hartă} one "
      & "{hartă cu 1 intrare} few {hartă cu {count, number} intrări} other "
      & "{hartă cu {count, number} de intrări}}} tuple_shape {{count, plural, "
      & "=0 {tuplu} one {tuplu cu 1 element} few {tuplu cu {count, number} "
      & "elemente} other {tuplu cu {count, number} de elemente}}} union_shape "
      & "{{count, plural, =0 {uniune} one {uniune de 1 tip} few {uniune de "
      & "{count, number} tipuri} other {uniune de {count, number} de tipuri}}} "
      & "empty_shape {formă goală} other {formă necunoscută}}");
   P ("label.schema.unknown_field_label", "câmp necunoscut {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {niciun filtru activ} one {1 filtru activ} few "
      & "{{count, number} filtre active} other {{count, number} de filtre "
      & "active}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {ștergeți filtrele} one {ștergeți filtrul "
      & "activ} few {ștergeți {count, number} filtre active} other "
      & "{ștergeți {count, number} de filtre active}}");
   P ("label.search.facet_label",
      "{count, plural, one {fațeta {name}, 1 opțiune} few {fațeta {name}, "
      & "{count, number} opțiuni} other {fațeta {name}, {count, number} de "
      & "opțiuni}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {niciun rezultat} one {1 rezultat} few "
      & "{{count, number} rezultate} other {{count, number} de "
      & "rezultate}}{selected, select, true {, selectat} other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {filtru activ} "
      & "inactive_filter {filtru inactiv} other {filtru de excludere}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filtru activ} inactive_filter {filtru "
      & "inactiv} other {filtru de excludere}}");
   P ("label.search.no_results_label", "niciun rezultat pentru „{query}”");
   P ("label.search.recent_search_label", "căutare recentă: „{query}”");
   P ("label.search.saved_search_label",
      "căutare salvată: {name}{count, plural, =0 {} one {, 1 rezultat} few "
      & "{, {count, number} rezultate} other {, {count, number} de rezultate}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {nicio căutare recentă} one {1 căutare recentă} "
      & "few {{count, number} căutări recente} other {{count, number} de "
      & "căutări recente}}");
   P ("label.search.search_query_label", "căutați „{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {niciun rezultat} one {1 rezultat} few {{count, "
      & "number} rezultate} other {{count, number} de rezultate}}");
   P ("label.search.search_result_summary_label",
      "rezultate pentru „{query}”: {count, plural, =0 {niciun rezultat} "
      & "one {1 rezultat} few {{count, number} rezultate} other {{count, "
      & "number} de rezultate}}");
   P ("label.search.search_scope_label",
      "domeniul {name}, {count, plural, =0 {niciun rezultat} one {1 rezultat} "
      & "few {{count, number} rezultate} other {{count, number} de rezultate}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {căutare inactivă} searching_search "
      & "{căutare în curs} complete_search {căutare finalizată} "
      & "empty_search {niciun rezultat al căutării} other {căutare "
      & "eșuată}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {sortare după relevanță} "
      & "ascending_sort {sortare crescătoare} descending_sort {sortare "
      & "descrescătoare} newest_first_sort {sortare: cele mai noi întâi} "
      & "other {sortare: cele mai vechi întâi}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {relevanță} ascending_sort "
      & "{crescător} descending_sort {descrescător} newest_first_sort {cele "
      & "mai noi întâi} other {cele mai vechi întâi}}");
   P ("label.search.suggestion_label", "ați vrut să spuneți „{query}”?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {1 credențial din {source}} few {{count, number} "
      & "credențiale din {source}} other {{count, number} de credențiale din "
      & "{source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valoare ascunsă} masked_value "
      & "{valoare mascată} suffix_only {doar sufixul} other {doar amprenta}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {public} support_profile "
      & "{asistență} audit_profile {audit} other {depanare}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {rotire necesară} other {rotirea nu "
      & "este necesară}}{days_old, plural, =0 {} one {, vechime 1 zi} few {, "
      & "vechime {days_old, number} zile} other {, vechime {days_old, number} "
      & "de zile}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {cheie API} live_api_key {cheie API de "
      & "producție} test_api_key {cheie API de test} github_token {token "
      & "GitHub} aws_access_key {cheie de acces AWS} google_api_key {cheie API "
      & "Google} slack_token {token Slack} npm_token {token npm} bearer_token "
      & "{token bearer} jwt_token {token JWT} basic_auth_credential "
      & "{credențial de autentificare de bază} password_secret {parolă} "
      & "private_key {cheie privată} ssh_private_key {cheie privată SSH} "
      & "webhook_secret {secret webhook} oauth_token {token OAuth} "
      & "database_url_secret {URL secret al bazei de date} sha1_fingerprint "
      & "{amprentă SHA-1} sha256_fingerprint {amprentă SHA-256} other "
      & "{secret}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {telefon} url_value "
      & "{URL} ip_address_value {adresă IP} token_value {token} "
      & "file_path_value {cale de fișier} account_id_value {ID de cont} "
      & "payment_reference_value {referință de plată} log_field_value {câmp "
      & "de jurnal} other {valoare sensibilă}}");
   P ("label.tables.cell_label",
      "rândul {row, number}, coloana {column, number}: {state, select, "
      & "empty_cell {celulă goală} edited_cell {celulă editată} "
      & "invalid_cell {celulă nevalidă} highlighted_cell {celulă "
      & "evidențiată} other {celulă doar în citire}}");
   P ("label.tables.cell_position_label", "rândul {row, number}, coloana {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {celulă goală} edited_cell {celulă "
      & "editată} invalid_cell {celulă nevalidă} highlighted_cell {celulă "
      & "evidențiată} other {celulă doar în citire}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {nicio coloană} one {1 coloană} few {{count, "
      & "number} coloane} other {{count, number} de coloane}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {coloană de text} number_column "
      & "{coloană numerică} date_column {coloană de dată} status_column "
      & "{coloană de stare} action_column {coloană de acțiuni} other "
      & "{coloană ascunsă}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {coloană de text} number_column {coloană "
      & "numerică} date_column {coloană de dată} status_column {coloană de "
      & "stare} action_column {coloană de acțiuni} other {coloană ascunsă}}");
   P ("label.tables.group_label",
      "{count, plural, one {{name}: 1 rând} few {{name}: {count, number} "
      & "rânduri} other {{name}: {count, number} de rânduri}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {niciun rând} one {1 rând} few {{count, number} "
      & "rânduri} other {{count, number} de rânduri}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {nesortat} ascending_sort {crescător} "
      & "other {descrescător}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {nesortat} ascending_sort {sortat după "
      & "{column_name}, crescător} other {sortat după {column_name}, "
      & "descrescător}}");
   P ("label.tables.subtotal_label", "subtotal {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 rând} few {{rows, number} rânduri} other "
      & "{{rows, number} de rânduri}} × {columns, plural, one {1 coloană} "
      & "few {{columns, number} coloane} other {{columns, number} de coloane}}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {neatribuit} assigned "
      & "{atribuit} reassigned {reatribuit} watching {urmărește} other "
      & "{deține sarcina}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {neatribuit} assigned {atribuit} reassigned "
      & "{reatribuit} watching {urmărește} other {deține sarcina}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog gol} one {backlog: 1 sarcină} few "
      & "{backlog: {count, number} sarcini} other {backlog: {count, number} de "
      & "sarcini}}");
   P ("label.tasks.blocker_label", "blocat de {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {finalizați sarcina} few {finalizați {count, "
      & "number} sarcini} other {finalizați {count, number} de sarcini}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {nicio sarcină finalizată} one {1 sarcină "
      & "finalizată} few {{count, number} sarcini finalizate} other {{count, "
      & "number} de sarcini finalizate}}");
   P ("label.tasks.due_label", "termen: {due_text}");
   P ("label.tasks.estimate_label", "estimat: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {nicio sarcină deschisă} one {1 sarcină "
      & "deschisă} few {{count, number} sarcini deschise} other {{count, "
      & "number} de sarcini deschise}}");
   P ("label.tasks.overdue_label", "termen depășit din {due_text}");
   P ("label.tasks.recurring_task_label", "se repetă {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {redeschideți sarcina} few {redeschideți {count, "
      & "number} sarcini} other {redeschideți {count, number} de sarcini}}");
   P ("label.tasks.sprint_label",
      "{count, plural, one {{name}: 1 sarcină} few {{name}: {count, number} "
      & "sarcini} other {{name}: {count, number} de sarcini}}");
   P ("label.tasks.subtask_label",
      "{count, plural, one {{name}: 1 subsarcină} few {{name}: {count, "
      & "number} subsarcini} other {{name}: {count, number} de subsarcini}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {nicio sarcină} one {1 sarcină} few {{count, "
      & "number} sarcini} other {{count, number} de sarcini}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {sarcină deschisă} "
      & "in_progress_task {sarcină în curs} blocked_task {sarcină blocată} "
      & "done_task {sarcină finalizată} canceled_task {sarcină anulată} "
      & "deferred_task {sarcină amânată} other {sarcină "
      & "întârziată}}{priority, select, no_priority {} low_priority {, "
      & "prioritate scăzută} medium_priority {, prioritate medie} "
      & "high_priority {, prioritate ridicată} other {, prioritate critică}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {fără prioritate} low_priority "
      & "{prioritate scăzută} medium_priority {prioritate medie} "
      & "high_priority {prioritate ridicată} other {prioritate critică}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {sarcină deschisă} in_progress_task "
      & "{sarcină în curs} blocked_task {sarcină blocată} done_task "
      & "{sarcină finalizată} canceled_task {sarcină anulată} deferred_task "
      & "{sarcină amânată} other {sarcină întârziată}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {limită superioară} other {limită "
      & "inferioară}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {sub intervalul așteptat} within_range "
      & "{în intervalul așteptat} above_range {peste intervalul așteptat} "
      & "below_target {sub țintă} at_target {la țintă} above_target {peste "
      & "țintă} near_limit {aproape de limită} warning_level {prag de "
      & "avertizare} critical_level {prag critic} breached {prag depășit} "
      & "other {stare necunoscută a pragului}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {la zi} one {cu 1 commit "
      & "înainte} few {cu {ahead, number} commituri înainte} other {cu "
      & "{ahead, number} de commituri înainte}}} other {{ahead, plural, =0 {} "
      & "one {cu 1 commit înainte, } few {cu {ahead, number} commituri "
      & "înainte, } other {cu {ahead, number} de commituri înainte, "
      & "}}{behind, plural, one {cu 1 commit în urmă} few {cu {behind, "
      & "number} commituri în urmă} other {cu {behind, number} de commituri "
      & "în urmă}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {se așteaptă aprobarea de la {approver}} "
      & "other {aprobat de {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {încercarea 1 din 1} other "
      & "{încercarea {attempt, number} din 1, limită depășită}}} other "
      & "{încercarea {attempt, number} din {limit, number}}}");
   P ("label.workflows.blocker_label", "blocat: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {nicio dependență blocantă} one {1 dependență "
      & "blocantă} few {{count, number} dependențe blocante} other {{count, "
      & "number} de dependențe blocante}}");
   P ("label.workflows.handoff_label", "predare de la {from} către {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {etapă viitoare} current_milestone "
      & "{etapă curentă} complete_milestone {etapă finalizată} "
      & "missed_milestone {etapă ratată} other {etapă blocată}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {etapă viitoare} "
      & "current_milestone {etapă curentă} complete_milestone {etapă "
      & "finalizată} missed_milestone {etapă ratată} other {etapă "
      & "blocată}}");
   P ("label.workflows.next_action_label", "pasul următor: {action}");
   P ("label.workflows.owner_label", "proprietar: {owner}");
   P ("label.workflows.resume_label", "reluați {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {în așteptare} active_step {activ} "
      & "waiting_step {așteaptă} blocked_step {blocat} done_step {finalizat} "
      & "failed_step {eșuat} other {omis}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {în așteptare} active_step "
      & "{activ} waiting_step {așteaptă} blocked_step {blocat} done_step "
      & "{finalizat} failed_step {eșuat} other {omis}}");
   P ("label.workflows.waiting_label", "se așteaptă {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {neînceput} "
      & "in_progress_state {în curs} waiting_state {în așteptare} "
      & "waiting_approval_state {așteaptă aprobare} blocked_state {blocat} "
      & "completed_state {finalizat} failed_state {eșuat} cancelled_state "
      & "{anulat} skipped_state {omis} other {întrerupt}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {neînceput} in_progress_state {în "
      & "curs} waiting_state {în așteptare} waiting_approval_state "
      & "{așteaptă aprobare} blocked_state {blocat} completed_state "
      & "{finalizat} failed_state {eșuat} cancelled_state {anulat} "
      & "skipped_state {omis} other {întrerupt}}");
end Labels_2;
