separate (Humanize.Catalogs.Phrase_Data.Locale_It)
procedure Labels_2 is
begin
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {aggiungi un nome accessibile} "
      & "low_contrast {aumenta il contrasto del testo} skipped_heading_level "
      & "{usa livelli di intestazione consecutivi} missing_form_label {associa "
      & "un’etichetta al controllo del modulo} invalid_aria {usa un ruolo o "
      & "un attributo ARIA valido} keyboard_trap {assicurati che lo stato "
      & "attivo della tastiera possa uscire dal componente} other {verifica il "
      & "problema di accessibilità}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {nessun problema di accessibilità} one "
      & "{{issues, number} problema di accessibilità} many {{issues, number} "
      & "di problemi di accessibilità} other {{issues, number} problemi di "
      & "accessibilità}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {attributo id} class_attribute {attributo "
      & "class} data_attribute {attributo data} aria_attribute {attributo ARIA} "
      & "role_attribute {attributo role} link_attribute {attributo di "
      & "collegamento} media_attribute {attributo multimediale} form_attribute "
      & "{attributo di modulo} boolean_attribute {attributo booleano} "
      & "event_attribute {attributo di gestore eventi} other {attributo "
      & "sconosciuto}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {nessun "
      & "problema nel modulo} other {{warnings, plural, one {{warnings, number} "
      & "avviso} many {{warnings, number} di avvisi} other {{warnings, number} "
      & "avvisi}}}}} other {{warnings, plural, =0 {{errors, plural, one "
      & "{{errors, number} errore} many {{errors, number} di errori} other "
      & "{{errors, number} errori}}} other {{errors, plural, one {{errors, "
      & "number} errore} many {{errors, number} di errori} other {{errors, "
      & "number} errori}}, {warnings, plural, one {{warnings, number} avviso} "
      & "many {{warnings, number} di avvisi} other {{warnings, number} "
      & "avvisi}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {punto di riferimento banner} "
      & "navigation_role {punto di riferimento di navigazione} main_role {punto "
      & "di riferimento principale} complementary_role {punto di riferimento "
      & "complementare} contentinfo_role {punto di riferimento informazioni sul "
      & "contenuto} search_role {punto di riferimento di ricerca} form_role "
      & "{punto di riferimento modulo} region_role {punto di riferimento "
      & "regione} dialog_role {finestra di dialogo} alert_role {area live di "
      & "avviso} status_role {area live di stato} other {punto di riferimento "
      & "sconosciuto}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, aggiornamento immediato: {update}} "
      & "other {{region}, aggiornamento discreto: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {contenuto di testo} html_content "
      & "{contenuto HTML} json_content {contenuto JSON} xml_content {contenuto "
      & "XML} image_content {contenuto immagine} audio_content {contenuto "
      & "audio} video_content {contenuto video} font_content {contenuto di "
      & "font} archive_content {contenuto di archivio} binary_content "
      & "{contenuto binario} form_content {contenuto di modulo} other "
      & "{contenuto sconosciuto}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tag di documento} metadata_tag {tag di "
      & "metadati} section_tag {tag di sezione} text_tag {tag di testo} "
      & "link_tag {tag di collegamento} media_tag {tag multimediale} form_tag "
      & "{tag di modulo} table_tag {tag di tabella} interactive_tag {tag "
      & "interattivo} scripting_tag {tag di script} other {tag sconosciuto}}");
   P ("label.media.duration_label", "durata: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {immagine} video_media {video} audio_media "
      & "{audio} pdf_document {documento PDF} text_document {documento di "
      & "testo} archive_media {archivio} other {contenuto multimediale}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {pronto} processing_media {in "
      & "elaborazione} transcoding_media {in transcodifica} thumbnail_missing "
      & "{miniatura non disponibile} metadata_missing {metadati mancanti} "
      & "locked_document {documento bloccato} other {non disponibile}}");
   P ("label.media.media_summary",
      "{name}: {kind, select, image_media {{state, select, ready_media "
      & "{immagine pronta} processing_media {immagine in elaborazione} "
      & "transcoding_media {immagine in transcodifica} thumbnail_missing "
      & "{immagine, miniatura non disponibile} metadata_missing {immagine, "
      & "metadati mancanti} locked_document {immagine bloccata} other {immagine "
      & "non disponibile}}} video_media {{state, select, ready_media {video "
      & "pronto} processing_media {video in elaborazione} transcoding_media "
      & "{video in transcodifica} thumbnail_missing {video, miniatura non "
      & "disponibile} metadata_missing {video, metadati mancanti} "
      & "locked_document {video bloccato} other {video non disponibile}}} "
      & "audio_media {{state, select, ready_media {audio pronto} "
      & "processing_media {audio in elaborazione} transcoding_media {audio in "
      & "transcodifica} thumbnail_missing {audio, miniatura non disponibile} "
      & "metadata_missing {audio, metadati mancanti} locked_document {audio "
      & "bloccato} other {audio non disponibile}}} pdf_document {{state, "
      & "select, ready_media {documento PDF pronto} processing_media {documento "
      & "PDF in elaborazione} transcoding_media {documento PDF in "
      & "transcodifica} thumbnail_missing {documento PDF, miniatura non "
      & "disponibile} metadata_missing {documento PDF, metadati mancanti} "
      & "locked_document {documento PDF bloccato} other {documento PDF non "
      & "disponibile}}} text_document {{state, select, ready_media {documento "
      & "di testo pronto} processing_media {documento di testo in elaborazione} "
      & "transcoding_media {documento di testo in transcodifica} "
      & "thumbnail_missing {documento di testo, miniatura non disponibile} "
      & "metadata_missing {documento di testo, metadati mancanti} "
      & "locked_document {documento di testo bloccato} other {documento di "
      & "testo non disponibile}}} archive_media {{state, select, ready_media "
      & "{archivio pronto} processing_media {archivio in elaborazione} "
      & "transcoding_media {archivio in transcodifica} thumbnail_missing "
      & "{archivio, miniatura non disponibile} metadata_missing {archivio, "
      & "metadati mancanti} locked_document {archivio bloccato} other {archivio "
      & "non disponibile}}} other {{state, select, ready_media {contenuto "
      & "multimediale pronto} processing_media {contenuto multimediale in "
      & "elaborazione} transcoding_media {contenuto multimediale in "
      & "transcodifica} thumbnail_missing {contenuto multimediale, miniatura "
      & "non disponibile} metadata_missing {contenuto multimediale, metadati "
      & "mancanti} locked_document {contenuto multimediale bloccato} other "
      & "{contenuto multimediale non disponibile}}}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {nessuna pagina} one {{pages, number} pagina} many "
      & "{{pages, number} di pagine} other {{pages, number} pagine}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{state, select, open_report {{item}: ricorso aperto} triaged_report "
      & "{{item}: ricorso smistato} actioned_report {{item}: ricorso con "
      & "provvedimento adottato} dismissed_report {{item}: ricorso respinto} "
      & "appealed_report {{item}: ricorso impugnato} other {{item}: ricorso "
      & "chiuso}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {nessuna azione di moderazione} flagged "
      & "{segnalato} hidden {nascosto da un moderatore} restored {ripristinato} "
      & "marked_spam {contrassegnato come spam} removed {rimosso} other "
      & "{inoltrato a un livello superiore}}");
   P ("label.moderation.moderation_label",
      "{action, select, no_action {{item}: nessuna azione di moderazione} "
      & "flagged {{item}: segnalato} hidden {{item}: nascosto da un moderatore} "
      & "restored {{item}: ripristinato} marked_spam {{item}: contrassegnato "
      & "come spam} removed {{item}: rimosso} other {{item}: inoltrato a un "
      & "livello superiore}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {coda di moderazione "
      & "vuota} other {{pending, number} in attesa di revisione}}} one "
      & "{{pending, number} in attesa di revisione, 1 inoltrato a un livello "
      & "superiore} other {{pending, number} in attesa di revisione, "
      & "{escalated, number} inoltrati a un livello superiore}}");
   P ("label.moderation.report_label",
      "{state, select, open_report {{item}: segnalazione aperta} "
      & "triaged_report {{item}: segnalazione smistata} actioned_report "
      & "{{item}: provvedimento adottato} dismissed_report {{item}: "
      & "segnalazione respinta} appealed_report {{item}: segnalazione "
      & "impugnata} other {{item}: segnalazione chiusa}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {segnalazione aperta} triaged_report "
      & "{segnalazione smistata} actioned_report {provvedimento adottato} "
      & "dismissed_report {segnalazione respinta} appealed_report {segnalazione "
      & "impugnata} other {segnalazione chiusa}}");
   P ("label.moderation.review_label",
      "{state, select, pending_review {{item}: in attesa di revisione} "
      & "approved {{item}: approvato} rejected {{item}: rifiutato} "
      & "needs_changes {{item}: modifiche richieste} other {{item}: revisione "
      & "inoltrata a un livello superiore}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {in attesa di revisione} approved "
      & "{approvato} rejected {rifiutato} needs_changes {modifiche richieste} "
      & "other {revisione inoltrata a un livello superiore}}");
   P ("label.navigation.back_label", "torna a {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {percorso di navigazione vuoto} one {percorso di "
      & "navigazione: 1 livello} many {percorso di navigazione: {depth, number} "
      & "di livelli} other {percorso di navigazione: {depth, number} livelli}}");
   P ("label.navigation.current_page_label", "pagina corrente: {name}");
   P ("label.navigation.external_link_label", "{name} (link esterno)");
   P ("label.navigation.first_label", "primo: {target}");
   P ("label.navigation.last_label", "ultimo: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {nessuna voce di menu} one {1 voce di menu} many "
      & "{{count, number} di voci di menu} other {{count, number} voci di "
      & "menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {voce di menu} tab_item "
      & "{scheda} breadcrumb_item {elemento del percorso di navigazione} "
      & "section_item {sezione} other {separatore}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {link} menu_item {voce di menu} "
      & "tab_item {scheda} breadcrumb_item {elemento del percorso di "
      & "navigazione} section_item {sezione} other {separatore}} {state, "
      & "select, current_item {corrente} active_item {{kind, select, menu_item "
      & "{attiva} tab_item {attiva} section_item {attiva} other {attivo}}} "
      & "inactive_item {{kind, select, menu_item {inattiva} tab_item {inattiva} "
      & "section_item {inattiva} other {inattivo}}} disabled_item {{kind, "
      & "select, menu_item {disattivata} tab_item {disattivata} section_item "
      & "{disattivata} other {disattivato}}} expanded_item {{kind, select, "
      & "menu_item {espansa} tab_item {espansa} section_item {espansa} other "
      & "{espanso}}} collapsed_item {{kind, select, menu_item {compressa} "
      & "tab_item {compressa} section_item {compressa} other {compresso}}} "
      & "visited_item {{kind, select, menu_item {visitata} tab_item {visitata} "
      & "section_item {visitata} other {visitato}}} other {{kind, select, "
      & "menu_item {esterna} tab_item {esterna} section_item {esterna} other "
      & "{esterno}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {corrente} active_item {attivo} "
      & "inactive_item {inattivo} disabled_item {disattivato} expanded_item "
      & "{espanso} collapsed_item {compresso} visited_item {visitato} other "
      & "{esterno}}");
   P ("label.navigation.next_label", "successivo: {target}");
   P ("label.navigation.section_state_label",
      "{name}: sezione {expanded, select, false {compressa} other "
      & "{espansa}}{count, plural, =0 {} one {, 1 elemento} many {, {count, "
      & "number} di elementi} other {, {count, number} elementi}}");
   P ("label.navigation.skip_link_label", "vai a {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {{name}: sottomenu, 1 elemento} many {{name}: "
      & "sottomenu, {count, number} di elementi} other {{name}: sottomenu, "
      & "{count, number} elementi}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {tutti gli avvisi} important_alerts {avvisi "
      & "importanti} critical_alerts_only {solo avvisi critici} other {nessun "
      & "avviso}}");
   P ("label.notification_preferences.channel_preference_label",
      "notifiche {channel} {state, select, preference_enabled {attivate} "
      & "preference_disabled {disattivate} preference_inherited {ereditate} "
      & "other {obbligatorie}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {nessun riepilogo} instant_digest "
      & "{riepilogo immediato} daily_digest {riepilogo giornaliero} other "
      & "{riepilogo settimanale}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {attivato} preference_disabled "
      & "{disattivato} preference_inherited {ereditato} other {obbligatorio}}");
   P ("label.notification_preferences.quiet_hours_label", "orario di silenzio: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: iscrizione {scope, select, thread_subscription {alla "
      & "discussione} project_subscription {al progetto} team_subscription {al "
      & "team} other {all’account}} {state, select, preference_enabled "
      & "{attivata} preference_disabled {disattivata} preference_inherited "
      & "{ereditata} other {obbligatoria}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {iscrizione alla discussione} "
      & "project_subscription {iscrizione al progetto} team_subscription "
      & "{iscrizione al team} other {iscrizione all’account}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} ti ha menzionato} reply_event "
      & "{{actor} ha risposto} assignment_event {{actor} ti ha assegnato} "
      & "approval_event {{actor} ha richiesto un’approvazione} alert_event "
      & "{{actor} ha inviato un avviso} digest_event {{actor} ha inviato un "
      & "riepilogo} reminder_event {{actor} ha inviato un promemoria} other "
      & "{{actor} ha inviato una notifica di sistema}}");
   P ("label.notifications.delivery_label",
      "notifica {channel, select, in_app_channel {in-app} email_channel {via "
      & "email} sms_channel {via SMS} push_channel {push} webhook_channel {via "
      & "webhook} other {di riepilogo}} {state, select, pending_delivery {in "
      & "attesa} sent_delivery {inviata} delivered_delivery {recapitata} "
      & "failed_delivery {non riuscita} retrying_delivery {in attesa di nuovo "
      & "tentativo} other {annullata}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notifica in attesa} sent_delivery "
      & "{notifica inviata} delivered_delivery {notifica recapitata} "
      & "failed_delivery {notifica non riuscita} retrying_delivery {nuovo "
      & "tentativo di notifica} other {notifica annullata}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {in attesa {time_text}} sent_delivery "
      & "{inviata {time_text}} delivered_delivery {recapitata {time_text}} "
      & "failed_delivery {non riuscita {time_text}} retrying_delivery {nuovo "
      & "tentativo {time_text}} other {annullata {time_text}}}");
   P ("label.notifications.digest_label",
      "{count, plural, =0 {riepilogo {name}: nessuna notifica} one {riepilogo "
      & "{name}: 1 notifica} many {riepilogo {name}: {count, number} di "
      & "notifiche} other {riepilogo {name}: {count, number} notifiche}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {nessuna menzione} "
      & "one {1 menzione} many {{count, number} di menzioni} other {{count, "
      & "number} menzioni}}} reply_event {{count, plural, =0 {nessuna risposta} "
      & "one {1 risposta} many {{count, number} di risposte} other {{count, "
      & "number} risposte}}} assignment_event {{count, plural, =0 {nessuna "
      & "assegnazione} one {1 assegnazione} many {{count, number} di "
      & "assegnazioni} other {{count, number} assegnazioni}}} approval_event "
      & "{{count, plural, =0 {nessuna richiesta di approvazione} one {1 "
      & "richiesta di approvazione} many {{count, number} di richieste di "
      & "approvazione} other {{count, number} richieste di approvazione}}} "
      & "alert_event {{count, plural, =0 {nessun avviso} one {1 avviso} many "
      & "{{count, number} di avvisi} other {{count, number} avvisi}}} "
      & "digest_event {{count, plural, =0 {nessun riepilogo} one {1 riepilogo} "
      & "many {{count, number} di riepiloghi} other {{count, number} "
      & "riepiloghi}}} reminder_event {{count, plural, =0 {nessun promemoria} "
      & "one {1 promemoria} many {{count, number} di promemoria} other {{count, "
      & "number} promemoria}}} other {{count, plural, =0 {nessuna notifica di "
      & "sistema} one {1 notifica di sistema} many {{count, number} di "
      & "notifiche di sistema} other {{count, number} notifiche di sistema}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {segna la notifica come letta} many {segna {count, "
      & "number} di notifiche come lette} other {segna {count, number} "
      & "notifiche come lette}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {segna la notifica come non letta} many {segna "
      & "{count, number} di notifiche come non lette} other {segna {count, "
      & "number} notifiche come non lette}}");
   P ("label.notifications.muted_label", "{name}: notifiche silenziate");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nuova menzione} reply_event {nuova "
      & "risposta} assignment_event {nuova assegnazione} approval_event {nuova "
      & "richiesta di approvazione} alert_event {nuovo avviso} digest_event "
      & "{nuovo riepilogo} reminder_event {nuovo promemoria} other {nuova "
      & "notifica di sistema}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notifiche in-app} email_channel "
      & "{notifiche via email} sms_channel {notifiche via SMS} push_channel "
      & "{notifiche push} webhook_channel {notifiche via webhook} other "
      & "{notifiche di riepilogo}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {nessuna notifica} one {1 notifica} many {{count, "
      & "number} di notifiche} other {{count, number} notifiche}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {menzione} reply_event {risposta} "
      & "assignment_event {assegnazione} approval_event {richiesta di "
      & "approvazione} alert_event {avviso} digest_event {riepilogo} "
      & "reminder_event {promemoria} other {notifica di sistema}}");
   P ("label.notifications.notification_group_label",
      "{count, plural, =0 {{name}: nessuna notifica} one {{name}: 1 notifica} "
      & "many {{name}: {count, number} di notifiche} other {{name}: {count, "
      & "number} notifiche}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {menzione} reply_event "
      & "{risposta} assignment_event {assegnazione} approval_event {richiesta "
      & "di approvazione} alert_event {avviso} digest_event {riepilogo} "
      & "reminder_event {promemoria} other {notifica di sistema}} {state, "
      & "select, unread_state {{event, select, alert_event {non letto} "
      & "digest_event {non letto} reminder_event {non letto} other {non "
      & "letta}}} read_state {{event, select, alert_event {letto} digest_event "
      & "{letto} reminder_event {letto} other {letta}}} archived_state {{event, "
      & "select, alert_event {archiviato} digest_event {archiviato} "
      & "reminder_event {archiviato} other {archiviata}}} muted_state {{event, "
      & "select, alert_event {silenziato} digest_event {silenziato} "
      & "reminder_event {silenziato} other {silenziata}}} snoozed_state "
      & "{{event, select, alert_event {posticipato} digest_event {posticipato} "
      & "reminder_event {posticipato} other {posticipata}}} other {{event, "
      & "select, alert_event {soppresso} digest_event {soppresso} "
      & "reminder_event {soppresso} other {soppressa}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {notifica non letta} read_state {notifica "
      & "letta} archived_state {notifica archiviata} muted_state {notifica "
      & "silenziata} snoozed_state {notifica posticipata} other {notifica "
      & "soppressa}}");
   P ("label.notifications.snoozed_label", "{name}: notifiche posticipate");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {nessuna notifica soppressa} one {1 notifica "
      & "soppressa} many {{count, number} di notifiche soppresse} other "
      & "{{count, number} notifiche soppresse}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {nessuna notifica non letta} one {1 notifica non "
      & "letta} many {{count, number} di notifiche non lette} other {{count, "
      & "number} notifiche non lette}}");
   P ("label.payments.amount_label", "importo: {amount_text}");
   P ("label.payments.balance_label", "saldo: {amount_text}");
   P ("label.payments.chargeback_label", "chargeback: {amount_text}");
   P ("label.payments.discount_label", "sconto: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, scadenza {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {nessuna fattura} one {1 fattura} many {{count, "
      & "number} di fatture} other {{count, number} fatture}}");
   P ("label.payments.invoice_label",
      "{state, select, draft_invoice {fattura {number}: bozza} open_invoice "
      & "{fattura {number}: aperta} paid_invoice {fattura {number}: pagata} "
      & "overdue_invoice {fattura {number}: scaduta} other {fattura {number}: "
      & "annullata}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {bozza di fattura} open_invoice {fattura "
      & "aperta} paid_invoice {fattura pagata} overdue_invoice {fattura "
      & "scaduta} other {fattura annullata}}");
   P ("label.payments.method_label",
      "{method, select, card_method {pagato con carta: {detail}} "
      & "bank_transfer_method {pagato con bonifico bancario: {detail}} "
      & "cash_method {pagato in contanti: {detail}} wallet_method {pagato con "
      & "portafoglio digitale: {detail}} check_method {pagato con assegno: "
      & "{detail}} other {pagato con altro metodo: {detail}}}");
   P ("label.payments.paid_label", "{amount_text} pagato {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {nessun pagamento} one {1 pagamento} many {{count, "
      & "number} di pagamenti} other {{count, number} pagamenti}}");
   P ("label.payments.payment_label",
      "{state, select, pending_payment {{amount_text}: pagamento in attesa} "
      & "authorized_payment {{amount_text}: pagamento autorizzato} paid_payment "
      & "{{amount_text}: pagamento effettuato} failed_payment {{amount_text}: "
      & "pagamento non riuscito} refunded_payment {{amount_text}: pagamento "
      & "rimborsato} other {{amount_text}: pagamento annullato}}");
   P ("label.payments.payment_link_label", "link di pagamento {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {carta} bank_transfer_method {bonifico "
      & "bancario} cash_method {contanti} wallet_method {portafoglio digitale} "
      & "check_method {assegno} other {altro}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {pagamento in attesa} "
      & "authorized_payment {pagamento autorizzato} paid_payment {pagamento "
      & "effettuato} failed_payment {pagamento non riuscito} refunded_payment "
      & "{pagamento rimborsato} other {pagamento annullato}}");
   P ("label.payments.receipt_label", "ricevuta {number}");
   P ("label.payments.refund_label",
      "{state, select, pending_payment {{amount_text}: rimborso in attesa} "
      & "authorized_payment {{amount_text}: rimborso autorizzato} paid_payment "
      & "{{amount_text}: rimborso pagato} failed_payment {{amount_text}: "
      & "rimborso non riuscito} refunded_payment {{amount_text}: rimborso "
      & "completato} other {{amount_text}: rimborso annullato}}");
   P ("label.payments.subtotal_label", "subtotale: {amount_text}");
   P ("label.payments.tax_label", "imposte: {amount_text}");
   P ("label.payments.total_label", "totale: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: l’accesso scade {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: ruolo {role, select, owner_role {di proprietario} "
      & "admin_role {di amministratore} editor_role {di editor} viewer_role {di "
      & "visualizzatore} other {personalizzato}} concesso");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {concesso} denied "
      & "{negato} inherited {ereditato} temporary {accesso temporaneo} expired "
      & "{scaduto} other {richiede approvazione}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {concesso} denied {negato} inherited "
      & "{ereditato} temporary {accesso temporaneo} expired {scaduto} other "
      & "{richiede approvazione}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {consentito dal criterio} "
      & "policy_denied {negato dal criterio} policy_warning {avviso del "
      & "criterio} other {criterio non applicabile}}");
   P ("label.permissions.revoke_label",
      "{subject}: ruolo {role, select, owner_role {di proprietario} "
      & "admin_role {di amministratore} editor_role {di editor} viewer_role {di "
      & "visualizzatore} other {personalizzato}} revocato");
   P ("label.permissions.role_label",
      "{role, select, owner_role {proprietario} admin_role {amministratore} "
      & "editor_role {editor} viewer_role {visualizzatore} other {ruolo "
      & "personalizzato}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {vuoto} low_utilization {utilizzo "
      & "basso} normal_utilization {utilizzo normale} high_utilization "
      & "{utilizzo elevato} critical_utilization {utilizzo critico} "
      & "full_utilization {pieno} other {limite superato}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {array di {element_type, select, "
      & "string_field {stringhe} integer_field {interi} decimal_field "
      & "{decimali} boolean_field {booleani} date_field {date} date_time_field "
      & "{date e ore} object_field {oggetti} array_field {array} enum_field "
      & "{enumerazioni} binary_field {valori binari} null_field {valori nulli} "
      & "any_field {valori di qualsiasi tipo} other {valori sconosciuti}}} "
      & "other {{count, plural, one {array di 1 {element_type, select, "
      & "string_field {stringa} integer_field {intero} decimal_field {decimale} "
      & "boolean_field {booleano} date_field {data} date_time_field {data e "
      & "ora} object_field {oggetto} array_field {array} enum_field "
      & "{enumerazione} binary_field {valore binario} null_field {valore nullo} "
      & "any_field {valore di qualsiasi tipo} other {valore sconosciuto}}} many "
      & "{array di {count, number} di {element_type, select, string_field "
      & "{stringhe} integer_field {interi} decimal_field {decimali} "
      & "boolean_field {booleani} date_field {date} date_time_field {date e "
      & "ore} object_field {oggetti} array_field {array} enum_field "
      & "{enumerazioni} binary_field {valori binari} null_field {valori nulli} "
      & "any_field {valori di qualsiasi tipo} other {valori sconosciuti}}} "
      & "other {array di {count, number} {element_type, select, string_field "
      & "{stringhe} integer_field {interi} decimal_field {decimali} "
      & "boolean_field {booleani} date_field {date} date_time_field {date e "
      & "ore} object_field {oggetti} array_field {array} enum_field "
      & "{enumerazioni} binary_field {valori binari} null_field {valori nulli} "
      & "any_field {valori di qualsiasi tipo} other {valori sconosciuti}}}}}}");
   P ("label.schema.constraint_label", "vincolo {name}: {value}");
   P ("label.schema.default_value_label", "campo {field_name}: valore predefinito {value}");
   P ("label.schema.deprecated_field_label", "campo deprecato {name}, usa {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {1 opzione di enumerazione} many {{count, number} "
      & "di opzioni di enumerazione} other {{count, number} opzioni di "
      & "enumerazione}}");
   P ("label.schema.example_value_label", "campo {field_name}: esempio {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {campo normale} deprecated_field {campo "
      & "deprecato} unknown_field {campo sconosciuto} read_only_field {campo di "
      & "sola lettura} write_only_field {campo di sola scrittura} other {campo "
      & "calcolato}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {campo stringa} integer_field {campo "
      & "intero} decimal_field {campo decimale} boolean_field {campo booleano} "
      & "date_field {campo data} date_time_field {campo data e ora} "
      & "object_field {campo oggetto} array_field {campo array} enum_field "
      & "{campo enumerazione} binary_field {campo binario} null_field {campo "
      & "nullo} any_field {campo di qualsiasi tipo} other {campo di tipo "
      & "sconosciuto}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {nessun campo obbligatorio mancante} one {1 campo "
      & "obbligatorio mancante} many {{count, number} di campi obbligatori "
      & "mancanti} other {{count, number} campi obbligatori mancanti}}");
   P ("label.schema.object_shape_label",
      "oggetto con {fields, plural, one {1 campo} many {{fields, number} di "
      & "campi} other {{fields, number} campi}}{required, plural, =0 {} one {, "
      & "1 obbligatorio} other {, {required, number} obbligatori}}{optional, "
      & "plural, =0 {} one {, 1 facoltativo} other {, {optional, number} "
      & "facoltativi}}");
   P ("label.schema.schema_source_label", "schema {name}, versione {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {valore scalare} object_shape {{count, "
      & "plural, =0 {oggetto} one {oggetto con 1 campo} many {oggetto con "
      & "{count, number} di campi} other {oggetto con {count, number} campi}}} "
      & "array_shape {{count, plural, =0 {array} one {array con 1 elemento} "
      & "many {array con {count, number} di elementi} other {array con {count, "
      & "number} elementi}}} map_shape {{count, plural, =0 {mappa} one {mappa "
      & "con 1 voce} many {mappa con {count, number} di voci} other {mappa con "
      & "{count, number} voci}}} tuple_shape {{count, plural, =0 {tupla} one "
      & "{tupla con 1 elemento} many {tupla con {count, number} di elementi} "
      & "other {tupla con {count, number} elementi}}} union_shape {{count, "
      & "plural, =0 {unione} one {unione di 1 tipo} many {unione di {count, "
      & "number} di tipi} other {unione di {count, number} tipi}}} empty_shape "
      & "{forma vuota} other {forma sconosciuta}}");
   P ("label.schema.unknown_field_label", "campo sconosciuto {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {nessun filtro attivo} one {{count, number} filtro "
      & "attivo} many {{count, number} di filtri attivi} other {{count, number} "
      & "filtri attivi}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {cancella filtri} one {cancella il filtro attivo} "
      & "many {cancella {count, number} di filtri attivi} other {cancella "
      & "{count, number} filtri attivi}}");
   P ("label.search.facet_label",
      "{count, plural, one {faccetta {name}, {count, number} opzione} many "
      & "{faccetta {name}, {count, number} di opzioni} other {faccetta {name}, "
      & "{count, number} opzioni}}");
   P ("label.search.facet_value_label",
      "{selected, select, false {{count, plural, =0 {{name}, nessun "
      & "risultato} one {{name}, {count, number} risultato} many {{name}, "
      & "{count, number} di risultati} other {{name}, {count, number} "
      & "risultati}}} other {{count, plural, =0 {{name}, nessun risultato, "
      & "selezionato} one {{name}, {count, number} risultato, selezionato} many "
      & "{{name}, {count, number} di risultati, selezionato} other {{name}, "
      & "{count, number} risultati, selezionato}}}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {filtro attivo} "
      & "inactive_filter {filtro non attivo} other {filtro di esclusione}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filtro attivo} inactive_filter {filtro "
      & "non attivo} other {filtro di esclusione}}");
   P ("label.search.no_results_label", "nessun risultato per «{query}»");
   P ("label.search.recent_search_label", "ricerca recente: «{query}»");
   P ("label.search.saved_search_label",
      "{count, plural, =0 {ricerca salvata: {name}} one {ricerca salvata: "
      & "{name}, {count, number} risultato} many {ricerca salvata: {name}, "
      & "{count, number} di risultati} other {ricerca salvata: {name}, {count, "
      & "number} risultati}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {nessuna ricerca recente} one {{count, number} "
      & "ricerca recente} many {{count, number} di ricerche recenti} other "
      & "{{count, number} ricerche recenti}}");
   P ("label.search.search_query_label", "cerca «{query}»");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {nessun risultato} one {{count, number} risultato} "
      & "many {{count, number} di risultati} other {{count, number} risultati}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {nessun risultato per «{query}»} one {{count, "
      & "number} risultato per «{query}»} many {{count, number} di risultati "
      & "per «{query}»} other {{count, number} risultati per «{query}»}}");
   P ("label.search.search_scope_label",
      "{count, plural, =0 {ambito {name}, nessun risultato} one {ambito "
      & "{name}, {count, number} risultato} many {ambito {name}, {count, "
      & "number} di risultati} other {ambito {name}, {count, number} "
      & "risultati}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {ricerca inattiva} searching_search "
      & "{ricerca in corso} complete_search {ricerca completata} empty_search "
      & "{la ricerca non ha prodotto risultati} other {ricerca non riuscita}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {ordina per pertinenza} ascending_sort "
      & "{ordina in modo crescente} descending_sort {ordina in modo "
      & "decrescente} newest_first_sort {ordina dal più recente} other {ordina "
      & "dal meno recente}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {pertinenza} ascending_sort {crescente} "
      & "descending_sort {decrescente} newest_first_sort {prima i più recenti} "
      & "other {prima i meno recenti}}");
   P ("label.search.suggestion_label", "forse cercavi «{query}»?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {{count, number} credenziale da {source}} many "
      & "{{count, number} di credenziali da {source}} other {{count, number} "
      & "credenziali da {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valore nascosto} masked_value {valore "
      & "mascherato} suffix_only {solo suffisso} other {solo impronta "
      & "digitale}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {pubblico} support_profile "
      & "{assistenza} audit_profile {audit} other {debug}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {{days_old, plural, =0 {rotazione non "
      & "necessaria} one {rotazione non necessaria, anzianità: {days_old, "
      & "number} giorno} many {rotazione non necessaria, anzianità: {days_old, "
      & "number} di giorni} other {rotazione non necessaria, anzianità: "
      & "{days_old, number} giorni}}} other {{days_old, plural, =0 {rotazione "
      & "necessaria} one {rotazione necessaria, anzianità: {days_old, number} "
      & "giorno} many {rotazione necessaria, anzianità: {days_old, number} di "
      & "giorni} other {rotazione necessaria, anzianità: {days_old, number} "
      & "giorni}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {chiave API} live_api_key {chiave API di "
      & "produzione} test_api_key {chiave API di test} github_token {token "
      & "GitHub} aws_access_key {chiave di accesso AWS} google_api_key {chiave "
      & "API Google} slack_token {token Slack} npm_token {token npm} "
      & "bearer_token {token bearer} jwt_token {token JWT} "
      & "basic_auth_credential {credenziale di autenticazione di base} "
      & "password_secret {password} private_key {chiave privata} "
      & "ssh_private_key {chiave privata SSH} webhook_secret {segreto del "
      & "webhook} oauth_token {token OAuth} database_url_secret {segreto "
      & "dell’URL del database} sha1_fingerprint {impronta SHA-1} "
      & "sha256_fingerprint {impronta SHA-256} other {segreto}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {email} phone_value {telefono} url_value "
      & "{URL} ip_address_value {indirizzo IP} token_value {token} "
      & "file_path_value {percorso file} account_id_value {ID account} "
      & "payment_reference_value {riferimento di pagamento} log_field_value "
      & "{campo di log} other {valore sensibile}}");
   P ("label.tables.cell_label",
      "riga {row, number}, colonna {column, number}: {state, select, "
      & "empty_cell {vuota} edited_cell {modificata} invalid_cell {non valida} "
      & "highlighted_cell {evidenziata} other {di sola lettura}}");
   P ("label.tables.cell_position_label", "riga {row, number}, colonna {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {cella vuota} edited_cell {cella "
      & "modificata} invalid_cell {cella non valida} highlighted_cell {cella "
      & "evidenziata} other {cella di sola lettura}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {nessuna colonna} one {{count, number} colonna} "
      & "many {{count, number} di colonne} other {{count, number} colonne}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {colonna di testo} number_column "
      & "{colonna numerica} date_column {colonna di data} status_column "
      & "{colonna di stato} action_column {colonna di azioni} other {colonna "
      & "nascosta}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {colonna di testo} number_column {colonna "
      & "numerica} date_column {colonna di data} status_column {colonna di "
      & "stato} action_column {colonna di azioni} other {colonna nascosta}}");
   P ("label.tables.group_label",
      "{count, plural, one {{name}: {count, number} riga} many {{name}: "
      & "{count, number} di righe} other {{name}: {count, number} righe}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {nessuna riga} one {{count, number} riga} many "
      & "{{count, number} di righe} other {{count, number} righe}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {non ordinato} ascending_sort {crescente} "
      & "other {decrescente}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {non ordinato} ascending_sort {ordinato "
      & "per {column_name}, crescente} other {ordinato per {column_name}, "
      & "decrescente}}");
   P ("label.tables.subtotal_label", "subtotale {name}: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} riga} many {{rows, number} di "
      & "righe} other {{rows, number} righe}} × {columns, plural, one "
      & "{{columns, number} colonna} many {{columns, number} di colonne} other "
      & "{{columns, number} colonne}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {assegnazione a {assignee} rimossa} "
      & "assigned {attività assegnata a {assignee}} reassigned {attività "
      & "riassegnata a {assignee}} watching {attività seguita da {assignee}} "
      & "other {attività di proprietà di {assignee}}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {non assegnata} assigned {assegnata} "
      & "reassigned {riassegnata} watching {seguita} other {proprietario "
      & "dell’attività}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog vuoto} one {backlog: {count, number} "
      & "attività} many {backlog: {count, number} di attività} other "
      & "{backlog: {count, number} attività}}");
   P ("label.tasks.blocker_label", "bloccata da {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {completa l’attività} many {completa {count, "
      & "number} di attività} other {completa {count, number} attività}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {nessuna attività completata} one {{count, number} "
      & "attività completata} many {{count, number} di attività completate} "
      & "other {{count, number} attività completate}}");
   P ("label.tasks.due_label", "scadenza: {due_text}");
   P ("label.tasks.estimate_label", "stima: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {nessuna attività aperta} one {{count, number} "
      & "attività aperta} many {{count, number} di attività aperte} other "
      & "{{count, number} attività aperte}}");
   P ("label.tasks.overdue_label", "in ritardo da {due_text}");
   P ("label.tasks.recurring_task_label", "si ripete {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {riapri l’attività} many {riapri {count, "
      & "number} di attività} other {riapri {count, number} attività}}");
   P ("label.tasks.sprint_label",
      "{count, plural, one {{name}: {count, number} attività} many {{name}: "
      & "{count, number} di attività} other {{name}: {count, number} "
      & "attività}}");
   P ("label.tasks.subtask_label",
      "{count, plural, one {{name}: {count, number} sottoattività} many "
      & "{{name}: {count, number} di sottoattività} other {{name}: {count, "
      & "number} sottoattività}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {nessuna attività} one {{count, number} attività} "
      & "many {{count, number} di attività} other {{count, number} attività}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {attività aperta} in_progress_task "
      & "{attività in corso} blocked_task {attività bloccata} done_task "
      & "{attività completata} canceled_task {attività annullata} "
      & "deferred_task {attività rinviata} other {attività "
      & "scaduta}}{priority, select, no_priority {} low_priority {, priorità "
      & "bassa} medium_priority {, priorità media} high_priority {, priorità "
      & "alta} other {, priorità critica}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {nessuna priorità} low_priority "
      & "{priorità bassa} medium_priority {priorità media} high_priority "
      & "{priorità alta} other {priorità critica}}");
end Labels_2;
