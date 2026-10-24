separate (Humanize.Catalogs.Phrase_Data.Locale_Fi)
procedure Labels_2 is
begin
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {odottaa tarkistusta} approved "
      & "{hyväksytty} rejected {hylätty} needs_changes {vaatii muutoksia} "
      & "other {tarkistus eskaloitu}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {odottaa tarkistusta} approved "
      & "{hyväksytty} rejected {hylätty} needs_changes {vaatii muutoksia} "
      & "other {tarkistus eskaloitu}}");
   P ("label.navigation.back_label", "takaisin: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {ei murupolkua} one {murupolku, 1 taso} other "
      & "{murupolku, {depth, number} tasoa}}");
   P ("label.navigation.current_page_label", "nykyinen sivu: {name}");
   P ("label.navigation.external_link_label", "{name} (ulkoinen linkki)");
   P ("label.navigation.first_label", "ensimmäinen: {target}");
   P ("label.navigation.last_label", "viimeinen: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {ei valikkokohteita} one {1 valikkokohde} other "
      & "{{count, number} valikkokohdetta}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {linkki} menu_item {valikkokohde} tab_item "
      & "{välilehti} breadcrumb_item {murupolun osa} section_item {osio} other "
      & "{erotin}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {linkki} menu_item {valikkokohde} "
      & "tab_item {välilehti} breadcrumb_item {murupolun osa} section_item "
      & "{osio} other {erotin}}, {state, select, current_item {nykyinen} "
      & "active_item {aktiivinen} inactive_item {ei aktiivinen} disabled_item "
      & "{poistettu käytöstä} expanded_item {laajennettu} collapsed_item "
      & "{tiivistetty} visited_item {vierailtu} other {ulkoinen}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {nykyinen} active_item {aktiivinen} "
      & "inactive_item {ei aktiivinen} disabled_item {poistettu käytöstä} "
      & "expanded_item {laajennettu} collapsed_item {tiivistetty} visited_item "
      & "{vierailtu} other {ulkoinen}}");
   P ("label.navigation.next_label", "seuraava: {target}");
   P ("label.navigation.section_state_label",
      "{name}: osio {expanded, select, false {tiivistetty} other "
      & "{laajennettu}}{count, plural, =0 {} one {, 1 kohde} other {, {count, "
      & "number} kohdetta}}");
   P ("label.navigation.skip_link_label", "siirry: {target}");
   P ("label.navigation.submenu_label",
      "{name}: alivalikko, {count, plural, one {1 kohde} other {{count, "
      & "number} kohdetta}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {kaikki hälytykset} important_alerts "
      & "{tärkeät hälytykset} critical_alerts_only {vain kriittiset "
      & "hälytykset} other {ei hälytyksiä}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: {state, select, preference_enabled {ilmoitukset "
      & "käytössä} preference_disabled {ilmoitukset pois käytöstä} "
      & "preference_inherited {ilmoitusasetus peritty} other {ilmoitukset "
      & "pakollisia}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {ei koostetta} instant_digest {välitön "
      & "kooste} daily_digest {päivittäinen kooste} other {viikoittainen "
      & "kooste}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {käytössä} preference_disabled "
      & "{pois käytöstä} preference_inherited {peritty} other {pakollinen}}");
   P ("label.notification_preferences.quiet_hours_label", "hiljaiset tunnit: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {ketjun tilaus} "
      & "project_subscription {projektin tilaus} team_subscription {tiimin "
      & "tilaus} other {tilin tilaus}} {state, select, preference_enabled "
      & "{käytössä} preference_disabled {pois käytöstä} "
      & "preference_inherited {peritty} other {pakollinen}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {ketjun tilaus} "
      & "project_subscription {projektin tilaus} team_subscription {tiimin "
      & "tilaus} other {tilin tilaus}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} mainitsi sinut} reply_event "
      & "{{actor} vastasi} assignment_event {{actor} osoitti sinulle "
      & "tehtävän} approval_event {{actor} pyysi hyväksyntää} alert_event "
      & "{{actor} lähetti hälytyksen} digest_event {{actor} lähetti "
      & "koosteen} reminder_event {{actor} lähetti muistutuksen} other "
      & "{{actor} lähetti järjestelmäilmoituksen}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {sovelluksen sisäinen ilmoitus} "
      & "email_channel {sähköposti-ilmoitus} sms_channel "
      & "{tekstiviesti-ilmoitus} push_channel {push-ilmoitus} webhook_channel "
      & "{webhook-ilmoitus} other {koosteilmoitus}}: {state, select, "
      & "pending_delivery {odottaa} sent_delivery {lähetetty} "
      & "delivered_delivery {toimitettu} failed_delivery {epäonnistui} "
      & "retrying_delivery {yritetään uudelleen} other {peruttu}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {odottava ilmoitus} sent_delivery "
      & "{lähetetty ilmoitus} delivered_delivery {toimitettu ilmoitus} "
      & "failed_delivery {epäonnistunut ilmoitus} retrying_delivery "
      & "{ilmoitusta yritetään uudelleen} other {peruttu ilmoitus}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {odottaa {time_text}} sent_delivery "
      & "{lähetetty {time_text}} delivered_delivery {toimitettu {time_text}} "
      & "failed_delivery {epäonnistui {time_text}} retrying_delivery {uusi "
      & "yritys {time_text}} other {peruttu {time_text}}}");
   P ("label.notifications.digest_label",
      "kooste {name}: {count, plural, =0 {ei ilmoituksia} one {1 ilmoitus} "
      & "other {{count, number} ilmoitusta}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {ei mainintoja} one "
      & "{1 maininta} other {{count, number} mainintaa}}} reply_event {{count, "
      & "plural, =0 {ei vastauksia} one {1 vastaus} other {{count, number} "
      & "vastausta}}} assignment_event {{count, plural, =0 {ei "
      & "tehtävänantoja} one {1 tehtävänanto} other {{count, number} "
      & "tehtävänantoa}}} approval_event {{count, plural, =0 {ei "
      & "hyväksyntäpyyntöjä} one {1 hyväksyntäpyyntö} other {{count, "
      & "number} hyväksyntäpyyntöä}}} alert_event {{count, plural, =0 {ei "
      & "hälytyksiä} one {1 hälytys} other {{count, number} hälytystä}}} "
      & "digest_event {{count, plural, =0 {ei koosteita} one {1 kooste} other "
      & "{{count, number} koostetta}}} reminder_event {{count, plural, =0 {ei "
      & "muistutuksia} one {1 muistutus} other {{count, number} muistutusta}}} "
      & "other {{count, plural, =0 {ei järjestelmäilmoituksia} one {1 "
      & "järjestelmäilmoitus} other {{count, number} "
      & "järjestelmäilmoitusta}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {merkitse ilmoitus luetuksi} other {merkitse "
      & "{count, number} ilmoitusta luetuiksi}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {merkitse ilmoitus lukemattomaksi} other {merkitse "
      & "{count, number} ilmoitusta lukemattomiksi}}");
   P ("label.notifications.muted_label", "{name}: ilmoitukset mykistetty");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {uusi maininta} reply_event {uusi "
      & "vastaus} assignment_event {uusi tehtävänanto} approval_event {uusi "
      & "hyväksyntä} alert_event {uusi hälytys} digest_event {uusi kooste} "
      & "reminder_event {uusi muistutus} other {uusi järjestelmäilmoitus}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {sovelluksen sisäiset ilmoitukset} "
      & "email_channel {sähköposti-ilmoitukset} sms_channel "
      & "{tekstiviesti-ilmoitukset} push_channel {push-ilmoitukset} "
      & "webhook_channel {webhook-ilmoitukset} other {koosteilmoitukset}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {ei ilmoituksia} one {1 ilmoitus} other {{count, "
      & "number} ilmoitusta}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {maininta} reply_event {vastaus} "
      & "assignment_event {tehtävänanto} approval_event {hyväksyntä} "
      & "alert_event {hälytys} digest_event {kooste} reminder_event "
      & "{muistutus} other {järjestelmäilmoitus}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {ei ilmoituksia} one {1 ilmoitus} other "
      & "{{count, number} ilmoitusta}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {maininta} reply_event "
      & "{vastaus} assignment_event {tehtävänanto} approval_event "
      & "{hyväksyntä} alert_event {hälytys} digest_event {kooste} "
      & "reminder_event {muistutus} other {järjestelmäilmoitus}}, {state, "
      & "select, unread_state {lukematon} read_state {luettu} archived_state "
      & "{arkistoitu} muted_state {mykistetty} snoozed_state {torkutettu} other "
      & "{vaimennettu}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {lukematon ilmoitus} read_state {luettu "
      & "ilmoitus} archived_state {arkistoitu ilmoitus} muted_state {mykistetty "
      & "ilmoitus} snoozed_state {torkutettu ilmoitus} other {vaimennettu "
      & "ilmoitus}}");
   P ("label.notifications.snoozed_label", "{name}: ilmoitukset torkutettu");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {ei vaimennettuja ilmoituksia} one {1 ilmoitus "
      & "vaimennettu} other {{count, number} ilmoitusta vaimennettu}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {ei lukemattomia ilmoituksia} one {1 lukematon "
      & "ilmoitus} other {{count, number} lukematonta ilmoitusta}}");
   P ("label.payments.amount_label", "summa: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "takaisinveloitus: {amount_text}");
   P ("label.payments.discount_label", "alennus: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, eräpäivä {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {ei laskuja} one {1 lasku} other {{count, number} "
      & "laskua}}");
   P ("label.payments.invoice_label",
      "lasku {number}: {state, select, draft_invoice {luonnos} open_invoice "
      & "{avoin} paid_invoice {maksettu} overdue_invoice {erääntynyt} other "
      & "{mitätöity}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {laskuluonnos} open_invoice {avoin "
      & "lasku} paid_invoice {maksettu lasku} overdue_invoice {erääntynyt "
      & "lasku} other {mitätöity lasku}}");
   P ("label.payments.method_label",
      "{method, select, card_method {maksettu kortilla: {detail}} "
      & "bank_transfer_method {maksettu tilisiirrolla: {detail}} cash_method "
      & "{maksettu käteisellä: {detail}} wallet_method {maksettu "
      & "digitaalisella lompakolla: {detail}} check_method {maksettu shekillä: "
      & "{detail}} other {maksettu muulla tavalla: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} maksettu {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {ei maksuja} one {1 maksu} other {{count, number} "
      & "maksua}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {maksu odottaa} "
      & "authorized_payment {maksu hyväksytty} paid_payment {maksettu} "
      & "failed_payment {maksu epäonnistui} refunded_payment {hyvitetty} other "
      & "{maksu peruttu}}");
   P ("label.payments.payment_link_label", "maksulinkki: {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {kortti} bank_transfer_method "
      & "{tilisiirto} cash_method {käteinen} wallet_method {digitaalinen "
      & "lompakko} check_method {shekki} other {muu}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {odottava maksu} authorized_payment "
      & "{hyväksytty maksu} paid_payment {suoritettu maksu} failed_payment "
      & "{epäonnistunut maksu} refunded_payment {hyvitetty maksu} other "
      & "{peruttu maksu}}");
   P ("label.payments.receipt_label", "kuitti {number}");
   P ("label.payments.refund_label",
      "{amount_text}: hyvitys {state, select, pending_payment {odottaa} "
      & "authorized_payment {hyväksytty} paid_payment {maksettu} "
      & "failed_payment {epäonnistui} refunded_payment {valmis} other "
      & "{peruttu}}");
   P ("label.payments.subtotal_label", "välisumma: {amount_text}");
   P ("label.payments.tax_label", "vero: {amount_text}");
   P ("label.payments.total_label", "yhteensä: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: käyttöoikeus päättyy {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {omistajan rooli} admin_role "
      & "{ylläpitäjän rooli} editor_role {muokkaajan rooli} viewer_role "
      & "{katselijan rooli} other {mukautettu rooli}} myönnetty");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {myönnetty} denied "
      & "{evätty} inherited {peritty} temporary {väliaikainen käyttöoikeus} "
      & "expired {vanhentunut} other {vaatii hyväksynnän}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {myönnetty} denied {evätty} inherited "
      & "{peritty} temporary {väliaikainen käyttöoikeus} expired "
      & "{vanhentunut} other {vaatii hyväksynnän}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {käytäntö sallii} policy_denied "
      & "{käytäntö estää} policy_warning {käytäntövaroitus} other "
      & "{käytäntö ei koske}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {omistajan rooli} admin_role "
      & "{ylläpitäjän rooli} editor_role {muokkaajan rooli} viewer_role "
      & "{katselijan rooli} other {mukautettu rooli}} peruttu");
   P ("label.permissions.role_label",
      "{role, select, owner_role {omistaja} admin_role {ylläpitäjä} "
      & "editor_role {muokkaaja} viewer_role {katselija} other {mukautettu "
      & "rooli}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {tyhjä} low_utilization {matala "
      & "käyttöaste} normal_utilization {normaali käyttöaste} "
      & "high_utilization {korkea käyttöaste} critical_utilization "
      & "{kriittinen käyttöaste} full_utilization {täynnä} other {yli "
      & "rajan}}");
   P ("label.schema.array_shape_label",
      "taulukko: {count_known, select, false {{element_type, select, "
      & "string_field {merkkijonoja} integer_field {kokonaislukuja} "
      & "decimal_field {desimaalilukuja} boolean_field {totuusarvoja} "
      & "date_field {päivämääriä} date_time_field {aikaleimoja} "
      & "object_field {objekteja} array_field {taulukoita} enum_field "
      & "{enum-arvoja} binary_field {binääriarvoja} null_field {null-arvoja} "
      & "any_field {vapaatyyppisiä arvoja} other {tuntemattomia arvoja}}} "
      & "other {{count, plural, one {1 {element_type, select, string_field "
      & "{merkkijono} integer_field {kokonaisluku} decimal_field "
      & "{desimaaliluku} boolean_field {totuusarvo} date_field "
      & "{päivämäärä} date_time_field {aikaleima} object_field {objekti} "
      & "array_field {taulukko} enum_field {enum-arvo} binary_field "
      & "{binääriarvo} null_field {null-arvo} any_field {vapaatyyppinen arvo} "
      & "other {tuntematon arvo}}} other {{count, number} {element_type, "
      & "select, string_field {merkkijonoa} integer_field {kokonaislukua} "
      & "decimal_field {desimaalilukua} boolean_field {totuusarvoa} date_field "
      & "{päivämäärää} date_time_field {aikaleimaa} object_field "
      & "{objektia} array_field {taulukkoa} enum_field {enum-arvoa} "
      & "binary_field {binääriarvoa} null_field {null-arvoa} any_field "
      & "{vapaatyyppistä arvoa} other {tuntematonta arvoa}}}}}}");
   P ("label.schema.constraint_label", "rajoite {name}: {value}");
   P ("label.schema.default_value_label", "kenttä {field_name}, oletusarvo {value}");
   P ("label.schema.deprecated_field_label", "kenttä {name} on vanhentunut, käytä: {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 enum-vaihtoehto} other {{count, number} "
      & "enum-vaihtoehtoa}}");
   P ("label.schema.example_value_label", "kenttä {field_name}, esimerkki: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {tavallinen kenttä} deprecated_field "
      & "{vanhentunut kenttä} unknown_field {tuntematon kenttä} "
      & "read_only_field {vain luku -kenttä} write_only_field {vain kirjoitus "
      & "-kenttä} other {laskettu kenttä}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {merkkijonokenttä} integer_field "
      & "{kokonaislukukenttä} decimal_field {desimaalikenttä} boolean_field "
      & "{totuusarvokenttä} date_field {päivämääräkenttä} "
      & "date_time_field {aikaleimakenttä} object_field {objektikenttä} "
      & "array_field {taulukkokenttä} enum_field {enum-kenttä} binary_field "
      & "{binäärikenttä} null_field {null-kenttä} any_field {vapaatyyppinen "
      & "kenttä} other {tuntemattoman tyypin kenttä}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {ei puuttuvia pakollisia kenttiä} one {1 "
      & "pakollinen kenttä puuttuu} other {{count, number} pakollista "
      & "kenttää puuttuu}}");
   P ("label.schema.object_shape_label",
      "objekti, {fields, plural, one {1 kenttä} other {{fields, number} "
      & "kenttää}}{required, plural, =0 {} one {, 1 pakollinen} other {, "
      & "{required, number} pakollista}}{optional, plural, =0 {} one {, 1 "
      & "valinnainen} other {, {optional, number} valinnaista}}");
   P ("label.schema.schema_source_label", "skeema {name}, versio {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {skalaariarvo} object_shape {{count, "
      & "plural, =0 {objekti} one {objekti, 1 kenttä} other {objekti, {count, "
      & "number} kenttää}}} array_shape {{count, plural, =0 {taulukko} one "
      & "{taulukko, 1 alkio} other {taulukko, {count, number} alkiota}}} "
      & "map_shape {{count, plural, =0 {sanakirja} one {sanakirja, 1 merkintä} "
      & "other {sanakirja, {count, number} merkintää}}} tuple_shape {{count, "
      & "plural, =0 {monikko} one {monikko, 1 alkio} other {monikko, {count, "
      & "number} alkiota}}} union_shape {{count, plural, =0 {yhdiste} one "
      & "{yhdiste, 1 tyyppi} other {yhdiste, {count, number} tyyppiä}}} "
      & "empty_shape {tyhjä rakenne} other {tuntematon rakenne}}");
   P ("label.schema.unknown_field_label", "tuntematon kenttä {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {ei aktiivisia suodattimia} one {1 aktiivinen "
      & "suodatin} other {{count, number} aktiivista suodatinta}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {tyhjennä suodattimet} one {tyhjennä aktiivinen "
      & "suodatin} other {tyhjennä {count, number} aktiivista suodatinta}}");
   P ("label.search.facet_label",
      "{name}-rajain, {count, plural, one {1 vaihtoehto} other {{count, "
      & "number} vaihtoehtoa}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {ei tuloksia} one {1 tulos} other {{count, "
      & "number} tulosta}}{selected, select, false {} other {, valittu}}");
   P ("label.search.filter_label",
      "{name}: {value} ({state, select, active_filter {aktiivinen suodatin} "
      & "inactive_filter {ei-aktiivinen suodatin} other {poissulkeva "
      & "suodatin}})");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {aktiivinen suodatin} inactive_filter "
      & "{ei-aktiivinen suodatin} other {poissulkeva suodatin}}");
   P ("label.search.no_results_label", "ei tuloksia haulle ”{query}”");
   P ("label.search.recent_search_label", "viimeaikainen haku: ”{query}”");
   P ("label.search.saved_search_label",
      "tallennettu haku: {name}{count, plural, =0 {} one {, 1 tulos} other {, "
      & "{count, number} tulosta}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {ei viimeaikaisia hakuja} one {1 viimeaikainen "
      & "haku} other {{count, number} viimeaikaista hakua}}");
   P ("label.search.search_query_label", "hae ”{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {ei tuloksia} one {1 tulos} other {{count, number} "
      & "tulosta}}");
   P ("label.search.search_result_summary_label",
      "haun ”{query}” tulokset: {count, plural, =0 {ei tuloksia} one {1 "
      & "tulos} other {{count, number} tulosta}}");
   P ("label.search.search_scope_label",
      "hakualue {name}, {count, plural, =0 {ei tuloksia} one {1 tulos} other "
      & "{{count, number} tulosta}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {haku ei käynnissä} searching_search "
      & "{haetaan} complete_search {haku valmis} empty_search {ei hakutuloksia} "
      & "other {haku epäonnistui}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {lajittele osuvuuden mukaan} "
      & "ascending_sort {lajittele nousevasti} descending_sort {lajittele "
      & "laskevasti} newest_first_sort {lajittele uusin ensin} other {lajittele "
      & "vanhin ensin}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {osuvuus} ascending_sort {nouseva} "
      & "descending_sort {laskeva} newest_first_sort {uusin ensin} other "
      & "{vanhin ensin}}");
   P ("label.search.suggestion_label", "tarkoititko ”{query}”?");
   P ("label.secrets.credential_source_label",
      "{source}: {count, plural, one {1 tunnistetieto} other {{count, number} "
      & "tunnistetietoa}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {arvo piilotettu} masked_value {arvo "
      & "peitetty} suffix_only {vain loppuosa} other {vain sormenjälki}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {julkinen} support_profile {tuki} "
      & "audit_profile {auditointi} other {vianetsintä}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {kierto ei tarpeen} other {kierto "
      & "tarpeen}}{days_old, plural, =0 {} one {, 1 päivä vanha} other {, "
      & "{days_old, number} päivää vanha}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-avain} live_api_key {tuotannon API-avain} "
      & "test_api_key {testi-API-avain} github_token {GitHub-tunnus} "
      & "aws_access_key {AWS-käyttöavain} google_api_key {Google-API-avain} "
      & "slack_token {Slack-tunnus} npm_token {npm-tunnus} bearer_token "
      & "{bearer-tunnus} jwt_token {JWT-tunnus} basic_auth_credential {Basic "
      & "Auth -tunnistetieto} password_secret {salasana} private_key "
      & "{yksityinen avain} ssh_private_key {yksityinen SSH-avain} "
      & "webhook_secret {webhook-salaisuus} oauth_token {OAuth-tunnus} "
      & "database_url_secret {tietokannan URL-salaisuus} sha1_fingerprint "
      & "{SHA-1-sormenjälki} sha256_fingerprint {SHA-256-sormenjälki} other "
      & "{salaisuus}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {sähköposti} phone_value {puhelin} "
      & "url_value {URL} ip_address_value {IP-osoite} token_value {tunnus} "
      & "file_path_value {tiedostopolku} account_id_value {tilin tunniste} "
      & "payment_reference_value {maksuviite} log_field_value {lokikenttä} "
      & "other {arkaluonteinen arvo}}");
   P ("label.tables.cell_label",
      "rivi {row, number}, sarake {column, number}: {state, select, "
      & "empty_cell {tyhjä} edited_cell {muokattu} invalid_cell {virheellinen} "
      & "highlighted_cell {korostettu} other {vain luku}}");
   P ("label.tables.cell_position_label", "rivi {row, number}, sarake {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {tyhjä solu} edited_cell {muokattu solu} "
      & "invalid_cell {virheellinen solu} highlighted_cell {korostettu solu} "
      & "other {vain luku -solu}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {ei sarakkeita} one {1 sarake} other {{count, "
      & "number} saraketta}}");
   P ("label.tables.column_label",
      "{name} ({role, select, text_column {tekstisarake} number_column "
      & "{numerosarake} date_column {päivämääräsarake} status_column "
      & "{tilasarake} action_column {toimintosarake} other {piilotettu "
      & "sarake}})");
   P ("label.tables.column_role_label",
      "{role, select, text_column {tekstisarake} number_column {numerosarake} "
      & "date_column {päivämääräsarake} status_column {tilasarake} "
      & "action_column {toimintosarake} other {piilotettu sarake}}");
   P ("label.tables.group_label", "{name}: {count, plural, one {1 rivi} other {{count, number} riviä}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {ei rivejä} one {1 rivi} other {{count, number} "
      & "riviä}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {ei lajiteltu} ascending_sort {nouseva} "
      & "other {laskeva}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {ei lajiteltu} ascending_sort {lajiteltu: "
      & "{column_name}, nouseva} other {lajiteltu: {column_name}, laskeva}}");
   P ("label.tables.subtotal_label", "välisumma {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {1 rivi} other {{rows, number} riviä}} × "
      & "{columns, plural, one {1 sarake} other {{columns, number} saraketta}}");
   P ("label.tasks.assignment_label",
      "{assignee}: {state, select, unassigned {ei määritetty} assigned "
      & "{määritetty} reassigned {määritetty uudelleen} watching {seuraa} "
      & "other {tehtävän omistaja}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {ei määritetty} assigned {määritetty} "
      & "reassigned {määritetty uudelleen} watching {seuraa} other "
      & "{tehtävän omistaja}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {tyhjä työjono} one {työjono: 1 tehtävä} other "
      & "{työjono: {count, number} tehtävää}}");
   P ("label.tasks.blocker_label", "estää: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {merkitse tehtävä valmiiksi} other {merkitse "
      & "{count, number} tehtävää valmiiksi}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {ei valmiita tehtäviä} one {1 valmis tehtävä} "
      & "other {{count, number} valmista tehtävää}}");
   P ("label.tasks.due_label", "erääntyy {due_text}");
   P ("label.tasks.estimate_label", "arvio {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {ei avoimia tehtäviä} one {1 avoin tehtävä} "
      & "other {{count, number} avointa tehtävää}}");
   P ("label.tasks.overdue_label", "myöhässä, erääntyi {due_text}");
   P ("label.tasks.recurring_task_label", "toistuu {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {avaa tehtävä uudelleen} other {avaa {count, "
      & "number} tehtävää uudelleen}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {1 tehtävä} other {{count, number} "
      & "tehtävää}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {1 alitehtävä} other {{count, number} "
      & "alitehtävää}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {ei tehtäviä} one {1 tehtävä} other {{count, "
      & "number} tehtävää}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {avoin tehtävä} in_progress_task "
      & "{työn alla oleva tehtävä} blocked_task {estetty tehtävä} "
      & "done_task {valmis tehtävä} canceled_task {peruttu tehtävä} "
      & "deferred_task {lykätty tehtävä} other {myöhässä oleva "
      & "tehtävä}}{priority, select, no_priority {} low_priority {, matala "
      & "prioriteetti} medium_priority {, keskitason prioriteetti} "
      & "high_priority {, korkea prioriteetti} other {, kriittinen "
      & "prioriteetti}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {ei prioriteettia} low_priority {matala "
      & "prioriteetti} medium_priority {keskitason prioriteetti} high_priority "
      & "{korkea prioriteetti} other {kriittinen prioriteetti}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {avoin tehtävä} in_progress_task {työn "
      & "alla oleva tehtävä} blocked_task {estetty tehtävä} done_task "
      & "{valmis tehtävä} canceled_task {peruttu tehtävä} deferred_task "
      & "{lykätty tehtävä} other {myöhässä oleva tehtävä}}");
   P ("label.thresholds.threshold_direction_label", "{direction, select, upper_limit {yläraja} other {alaraja}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {alle odotetun vaihteluvälin} "
      & "within_range {odotetulla vaihteluvälillä} above_range {yli odotetun "
      & "vaihteluvälin} below_target {alle tavoitteen} at_target "
      & "{tavoitteessa} above_target {yli tavoitteen} near_limit {lähellä "
      & "rajaa} warning_level {varoituskynnys} critical_level {kriittinen "
      & "kynnys} breached {ylitetty} other {kynnyksen tila tuntematon}}");
   P ("label.versions.commit_distance_label",
      "{ahead, plural, =0 {{behind, plural, =0 {ajan tasalla} one {1 commit "
      & "jäljessä} other {{behind, number} committia jäljessä}}} one {1 "
      & "commit edellä{behind, plural, =0 {} one {, 1 commit jäljessä} other "
      & "{, {behind, number} committia jäljessä}}} other {{ahead, number} "
      & "committia edellä{behind, plural, =0 {} one {, 1 commit jäljessä} "
      & "other {, {behind, number} committia jäljessä}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {hyväksyjä: {approver}} other {odottaa "
      & "hyväksyntää: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {yritys 1/1} other {yritys "
      & "{attempt, number}/1 – raja ylitetty}}} other {yritys {attempt, "
      & "number}/{limit, number}}}");
   P ("label.workflows.blocker_label", "estetty: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {ei estäviä riippuvuuksia} one {1 estävä "
      & "riippuvuus} other {{count, number} estävää riippuvuutta}}");
   P ("label.workflows.handoff_label", "luovutus: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {tuleva välitavoite} "
      & "current_milestone {nykyinen välitavoite} complete_milestone "
      & "{saavutettu välitavoite} missed_milestone {saavuttamatta jäänyt "
      & "välitavoite} other {estetty välitavoite}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {tuleva} current_milestone "
      & "{nykyinen} complete_milestone {saavutettu} missed_milestone "
      & "{saavuttamatta} other {estetty}}");
   P ("label.workflows.next_action_label", "seuraavaksi: {action}");
   P ("label.workflows.owner_label", "omistaja: {owner}");
   P ("label.workflows.resume_label", "jatka: {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {jonossa} active_step {aktiivinen} "
      & "waiting_step {odottaa} blocked_step {estetty} done_step {valmis} "
      & "failed_step {epäonnistui} other {ohitettu}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {jonossa} active_step "
      & "{aktiivinen} waiting_step {odottaa} blocked_step {estetty} done_step "
      & "{valmis} failed_step {epäonnistui} other {ohitettu}}");
   P ("label.workflows.waiting_label", "odottaa: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {ei aloitettu} "
      & "in_progress_state {käynnissä} waiting_state {odottaa} "
      & "waiting_approval_state {odottaa hyväksyntää} blocked_state "
      & "{estetty} completed_state {valmis} failed_state {epäonnistui} "
      & "cancelled_state {peruttu} skipped_state {ohitettu} other "
      & "{keskeytetty}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {ei aloitettu} in_progress_state "
      & "{käynnissä} waiting_state {odottaa} waiting_approval_state {odottaa "
      & "hyväksyntää} blocked_state {estetty} completed_state {valmis} "
      & "failed_state {epäonnistui} cancelled_state {peruttu} skipped_state "
      & "{ohitettu} other {keskeytetty}}");
end Labels_2;
