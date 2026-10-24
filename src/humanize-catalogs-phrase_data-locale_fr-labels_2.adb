separate (Humanize.Catalogs.Phrase_Data.Locale_Fr)
procedure Labels_2 is
begin
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {aucune modification non enregistrée} one {{count, "
      & "number} modification non enregistrée} many {{count, number} de "
      & "modifications non enregistrées} other {{count, number} modifications "
      & "non enregistrées}}");
   P ("label.markup.accessibility_issue_label",
      "{target} : {issue, select, missing_accessible_name {nom accessible "
      & "manquant} low_contrast {contraste insuffisant} skipped_heading_level "
      & "{niveau de titre sauté} missing_form_label {étiquette de formulaire "
      & "manquante} invalid_aria {ARIA non valide} keyboard_trap {piège au "
      & "clavier} other {problème d’accessibilité inconnu}}");
   P ("label.markup.accessibility_page_summary_label",
      "résumé d’accessibilité de {title} : {landmarks, plural, one "
      & "{{landmarks, number} repère} many {{landmarks, number} de repères} "
      & "other {{landmarks, number} repères}}, {headings, plural, one "
      & "{{headings, number} titre} many {{headings, number} de titres} other "
      & "{{headings, number} titres}}, {issues, plural, one {{issues, number} "
      & "problème} many {{issues, number} de problèmes} other {{issues, "
      & "number} problèmes}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {ajouter un nom accessible} "
      & "low_contrast {augmenter le contraste du texte} skipped_heading_level "
      & "{utiliser des niveaux de titre consécutifs} missing_form_label "
      & "{associer une étiquette au champ de formulaire} invalid_aria "
      & "{utiliser un rôle ou un attribut ARIA valide} keyboard_trap "
      & "{permettre au focus clavier de quitter le composant} other {vérifier "
      & "le problème d’accessibilité}}");
   P ("label.markup.accessibility_summary_label",
      "{target} : {issues, plural, =0 {aucun problème d’accessibilité} "
      & "one {{issues, number} problème d’accessibilité} many {{issues, "
      & "number} de problèmes d’accessibilité} other {{issues, number} "
      & "problèmes d’accessibilité}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {attribut id} class_attribute {attribut "
      & "class} data_attribute {attribut data} aria_attribute {attribut ARIA} "
      & "role_attribute {attribut role} link_attribute {attribut de lien} "
      & "media_attribute {attribut multimédia} form_attribute {attribut de "
      & "formulaire} boolean_attribute {attribut booléen} event_attribute "
      & "{attribut de gestionnaire d’événement} other {attribut inconnu}}");
   P ("label.markup.form_error_summary_label",
      "{form_name} : {errors, plural, =0 {{warnings, plural, =0 {aucun "
      & "problème dans le formulaire} other {{warnings, plural, one "
      & "{{warnings, number} avertissement} many {{warnings, number} "
      & "d’avertissements} other {{warnings, number} avertissements}}}}} "
      & "other {{warnings, plural, =0 {{errors, plural, one {{errors, number} "
      & "erreur} many {{errors, number} d’erreurs} other {{errors, number} "
      & "erreurs}}} other {{errors, plural, one {{errors, number} erreur} many "
      & "{{errors, number} d’erreurs} other {{errors, number} erreurs}}, "
      & "{warnings, plural, one {{warnings, number} avertissement} many "
      & "{{warnings, number} d’avertissements} other {{warnings, number} "
      & "avertissements}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {repère bannière} navigation_role "
      & "{repère de navigation} main_role {repère principal} "
      & "complementary_role {repère complémentaire} contentinfo_role {repère "
      & "d’informations sur le contenu} search_role {repère de recherche} "
      & "form_role {repère de formulaire} region_role {repère de région} "
      & "dialog_role {boîte de dialogue} alert_role {région live d’alerte} "
      & "status_role {région live d’état} other {repère inconnu}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, mise à jour assertive : {update}} "
      & "other {{region}, mise à jour polie : {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {contenu texte} html_content {contenu "
      & "HTML} json_content {contenu JSON} xml_content {contenu XML} "
      & "image_content {contenu image} audio_content {contenu audio} "
      & "video_content {contenu vidéo} font_content {contenu de police} "
      & "archive_content {contenu d’archive} binary_content {contenu binaire} "
      & "form_content {contenu de formulaire} other {contenu inconnu}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {balise de document} metadata_tag {balise "
      & "de métadonnées} section_tag {balise de section} text_tag {balise de "
      & "texte} link_tag {balise de lien} media_tag {balise multimédia} "
      & "form_tag {balise de formulaire} table_tag {balise de tableau} "
      & "interactive_tag {balise interactive} scripting_tag {balise de script} "
      & "other {balise inconnue}}");
   P ("label.media.duration_label", "durée : {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {image} video_media {vidéo} audio_media "
      & "{audio} pdf_document {document PDF} text_document {document texte} "
      & "archive_media {archive} other {média}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {prêt} processing_media {en cours de "
      & "traitement} transcoding_media {en cours de transcodage} "
      & "thumbnail_missing {miniature indisponible} metadata_missing "
      & "{métadonnées manquantes} locked_document {document verrouillé} "
      & "other {indisponible}}");
   P ("label.media.media_summary",
      "{name} : {kind, select, image_media {{state, select, ready_media "
      & "{image prête} processing_media {image en cours de traitement} "
      & "transcoding_media {image en cours de transcodage} thumbnail_missing "
      & "{image, miniature indisponible} metadata_missing {image, métadonnées "
      & "manquantes} locked_document {image verrouillée} other {image "
      & "indisponible}}} video_media {{state, select, ready_media {vidéo "
      & "prête} processing_media {vidéo en cours de traitement} "
      & "transcoding_media {vidéo en cours de transcodage} thumbnail_missing "
      & "{vidéo, miniature indisponible} metadata_missing {vidéo, "
      & "métadonnées manquantes} locked_document {vidéo verrouillée} other "
      & "{vidéo indisponible}}} audio_media {{state, select, ready_media "
      & "{audio prêt} processing_media {audio en cours de traitement} "
      & "transcoding_media {audio en cours de transcodage} thumbnail_missing "
      & "{audio, miniature indisponible} metadata_missing {audio, métadonnées "
      & "manquantes} locked_document {audio verrouillé} other {audio "
      & "indisponible}}} pdf_document {{state, select, ready_media {document "
      & "PDF prêt} processing_media {document PDF en cours de traitement} "
      & "transcoding_media {document PDF en cours de transcodage} "
      & "thumbnail_missing {document PDF, miniature indisponible} "
      & "metadata_missing {document PDF, métadonnées manquantes} "
      & "locked_document {document PDF verrouillé} other {document PDF "
      & "indisponible}}} text_document {{state, select, ready_media {document "
      & "texte prêt} processing_media {document texte en cours de traitement} "
      & "transcoding_media {document texte en cours de transcodage} "
      & "thumbnail_missing {document texte, miniature indisponible} "
      & "metadata_missing {document texte, métadonnées manquantes} "
      & "locked_document {document texte verrouillé} other {document texte "
      & "indisponible}}} archive_media {{state, select, ready_media {archive "
      & "prête} processing_media {archive en cours de traitement} "
      & "transcoding_media {archive en cours de transcodage} thumbnail_missing "
      & "{archive, miniature indisponible} metadata_missing {archive, "
      & "métadonnées manquantes} locked_document {archive verrouillée} other "
      & "{archive indisponible}}} other {{state, select, ready_media {média "
      & "prêt} processing_media {média en cours de traitement} "
      & "transcoding_media {média en cours de transcodage} thumbnail_missing "
      & "{média, miniature indisponible} metadata_missing {média, "
      & "métadonnées manquantes} locked_document {média verrouillé} other "
      & "{média indisponible}}}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {aucune page} one {{pages, number} page} many "
      & "{{pages, number} de pages} other {{pages, number} pages}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{state, select, open_report {{item} : recours ouvert} triaged_report "
      & "{{item} : recours trié} actioned_report {{item} : recours, mesure "
      & "prise} dismissed_report {{item} : recours rejeté} appealed_report "
      & "{{item} : recours contesté} other {{item} : recours clos}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {aucune action de modération} flagged "
      & "{signalé} hidden {masqué par un modérateur} restored {restauré} "
      & "marked_spam {marqué comme spam} removed {supprimé} other "
      & "{escaladé}}");
   P ("label.moderation.moderation_label",
      "{action, select, no_action {{item} : aucune action de modération} "
      & "flagged {{item} : signalé} hidden {{item} : masqué par un "
      & "modérateur} restored {{item} : restauré} marked_spam {{item} : "
      & "marqué comme spam} removed {{item} : supprimé} other {{item} : "
      & "escaladé}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {file de modération "
      & "vide} other {{pending, number} en attente d’examen}}} one {{pending, "
      & "number} en attente d’examen, 1 escaladé} other {{pending, number} "
      & "en attente d’examen, {escalated, number} escaladés}}");
   P ("label.moderation.report_label",
      "{state, select, open_report {{item} : signalement ouvert} "
      & "triaged_report {{item} : signalement trié} actioned_report {{item} : "
      & "mesure prise} dismissed_report {{item} : signalement rejeté} "
      & "appealed_report {{item} : signalement contesté} other {{item} : "
      & "signalement clos}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {signalement ouvert} triaged_report "
      & "{signalement trié} actioned_report {mesure prise} dismissed_report "
      & "{signalement rejeté} appealed_report {signalement contesté} other "
      & "{signalement clos}}");
   P ("label.moderation.review_label",
      "{state, select, pending_review {{item} : en attente d’examen} "
      & "approved {{item} : approuvé} rejected {{item} : refusé} "
      & "needs_changes {{item} : modifications requises} other {{item} : examen "
      & "escaladé}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {en attente d’examen} approved "
      & "{approuvé} rejected {refusé} needs_changes {modifications requises} "
      & "other {examen escaladé}}");
   P ("label.navigation.back_label", "retour à {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {fil d’Ariane vide} one {fil d’Ariane : 1 "
      & "niveau} many {fil d’Ariane : {depth, number} de niveaux} other {fil "
      & "d’Ariane : {depth, number} niveaux}}");
   P ("label.navigation.current_page_label", "page actuelle : {name}");
   P ("label.navigation.external_link_label", "{name} (lien externe)");
   P ("label.navigation.first_label", "premier : {target}");
   P ("label.navigation.last_label", "dernier : {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {aucun élément de menu} one {1 élément de menu} "
      & "many {{count, number} d’éléments de menu} other {{count, number} "
      & "éléments de menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {lien} menu_item {élément de menu} tab_item "
      & "{onglet} breadcrumb_item {élément du fil d’Ariane} section_item "
      & "{section} other {séparateur}}");
   P ("label.navigation.navigation_item_label",
      "{name} : {kind, select, link_item {lien} menu_item {élément de menu} "
      & "tab_item {onglet} breadcrumb_item {élément du fil d’Ariane} "
      & "section_item {section} other {séparateur}} {state, select, "
      & "current_item {{kind, select, section_item {actuelle} other {actuel}}} "
      & "active_item {{kind, select, section_item {active} other {actif}}} "
      & "inactive_item {{kind, select, section_item {inactive} other "
      & "{inactif}}} disabled_item {{kind, select, section_item {désactivée} "
      & "other {désactivé}}} expanded_item {{kind, select, section_item "
      & "{développée} other {développé}}} collapsed_item {{kind, select, "
      & "section_item {réduite} other {réduit}}} visited_item {{kind, select, "
      & "section_item {visitée} other {visité}}} other {externe}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {actuel} active_item {actif} "
      & "inactive_item {inactif} disabled_item {désactivé} expanded_item "
      & "{développé} collapsed_item {réduit} visited_item {visité} other "
      & "{externe}}");
   P ("label.navigation.next_label", "suivant : {target}");
   P ("label.navigation.section_state_label",
      "{name} : section {expanded, select, false {réduite} other "
      & "{développée}}{count, plural, =0 {} one {, 1 élément} many {, "
      & "{count, number} d’éléments} other {, {count, number} éléments}}");
   P ("label.navigation.skip_link_label", "aller à {target}");
   P ("label.navigation.submenu_label",
      "{count, plural, one {{name} : sous-menu, {count, number} élément} "
      & "many {{name} : sous-menu, {count, number} d’éléments} other "
      & "{{name} : sous-menu, {count, number} éléments}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {toutes les alertes} important_alerts "
      & "{alertes importantes} critical_alerts_only {alertes critiques "
      & "uniquement} other {aucune alerte}}");
   P ("label.notification_preferences.channel_preference_label",
      "notifications {channel} {state, select, preference_enabled {activées} "
      & "preference_disabled {désactivées} preference_inherited {héritées} "
      & "other {obligatoires}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {aucun récapitulatif} instant_digest "
      & "{récapitulatif instantané} daily_digest {récapitulatif quotidien} "
      & "other {récapitulatif hebdomadaire}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {activé} preference_disabled "
      & "{désactivé} preference_inherited {hérité} other {obligatoire}}");
   P ("label.notification_preferences.quiet_hours_label", "heures silencieuses {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name} : abonnement {scope, select, thread_subscription {à la "
      & "discussion} project_subscription {au projet} team_subscription {à "
      & "l’équipe} other {au compte}} {state, select, preference_enabled "
      & "{activé} preference_disabled {désactivé} preference_inherited "
      & "{hérité} other {obligatoire}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {abonnement à la discussion} "
      & "project_subscription {abonnement au projet} team_subscription "
      & "{abonnement à l’équipe} other {abonnement au compte}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} vous a mentionné} reply_event "
      & "{{actor} a répondu} assignment_event {{actor} vous a assigné} "
      & "approval_event {{actor} a demandé une approbation} alert_event "
      & "{{actor} a envoyé une alerte} digest_event {{actor} a envoyé un "
      & "récapitulatif} reminder_event {{actor} a envoyé un rappel} other "
      & "{{actor} a envoyé une notification système}}");
   P ("label.notifications.delivery_label",
      "notification {channel, select, in_app_channel {dans l’application} "
      & "email_channel {par e-mail} sms_channel {par SMS} push_channel {push} "
      & "webhook_channel {par webhook} other {de récapitulatif}} {state, "
      & "select, pending_delivery {en attente} sent_delivery {envoyée} "
      & "delivered_delivery {remise} failed_delivery {en échec} "
      & "retrying_delivery {en cours de renvoi} other {annulée}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {notification en attente} "
      & "sent_delivery {notification envoyée} delivered_delivery {notification "
      & "remise} failed_delivery {notification en échec} retrying_delivery "
      & "{notification en cours de renvoi} other {notification annulée}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {en attente {time_text}} "
      & "sent_delivery {envoyée {time_text}} delivered_delivery {remise "
      & "{time_text}} failed_delivery {échec {time_text}} retrying_delivery "
      & "{nouvelle tentative {time_text}} other {annulée {time_text}}}");
   P ("label.notifications.digest_label",
      "{count, plural, =0 {récapitulatif {name} : aucune notification} one "
      & "{récapitulatif {name} : 1 notification} many {récapitulatif {name} : "
      & "{count, number} de notifications} other {récapitulatif {name} : "
      & "{count, number} notifications}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {aucune mention} one "
      & "{1 mention} many {{count, number} de mentions} other {{count, number} "
      & "mentions}}} reply_event {{count, plural, =0 {aucune réponse} one {1 "
      & "réponse} many {{count, number} de réponses} other {{count, number} "
      & "réponses}}} assignment_event {{count, plural, =0 {aucune attribution} "
      & "one {1 attribution} many {{count, number} d’attributions} other "
      & "{{count, number} attributions}}} approval_event {{count, plural, =0 "
      & "{aucune demande d’approbation} one {1 demande d’approbation} many "
      & "{{count, number} de demandes d’approbation} other {{count, number} "
      & "demandes d’approbation}}} alert_event {{count, plural, =0 {aucune "
      & "alerte} one {1 alerte} many {{count, number} d’alertes} other "
      & "{{count, number} alertes}}} digest_event {{count, plural, =0 {aucun "
      & "récapitulatif} one {1 récapitulatif} many {{count, number} de "
      & "récapitulatifs} other {{count, number} récapitulatifs}}} "
      & "reminder_event {{count, plural, =0 {aucun rappel} one {1 rappel} many "
      & "{{count, number} de rappels} other {{count, number} rappels}}} other "
      & "{{count, plural, =0 {aucune notification système} one {1 notification "
      & "système} many {{count, number} de notifications système} other "
      & "{{count, number} notifications système}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {marquer la notification comme lue} many {marquer "
      & "{count, number} de notifications comme lues} other {marquer {count, "
      & "number} notifications comme lues}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {marquer la notification comme non lue} many "
      & "{marquer {count, number} de notifications comme non lues} other "
      & "{marquer {count, number} notifications comme non lues}}");
   P ("label.notifications.muted_label", "{name} : notifications en sourdine");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {nouvelle mention} reply_event {nouvelle "
      & "réponse} assignment_event {nouvelle attribution} approval_event "
      & "{nouvelle demande d’approbation} alert_event {nouvelle alerte} "
      & "digest_event {nouveau récapitulatif} reminder_event {nouveau rappel} "
      & "other {nouvelle notification système}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notifications dans l’application} "
      & "email_channel {notifications par e-mail} sms_channel {notifications "
      & "par SMS} push_channel {notifications push} webhook_channel "
      & "{notifications par webhook} other {notifications de récapitulatif}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {aucune notification} one {1 notification} many "
      & "{{count, number} de notifications} other {{count, number} "
      & "notifications}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {mention} reply_event {réponse} "
      & "assignment_event {attribution} approval_event {demande "
      & "d’approbation} alert_event {alerte} digest_event {récapitulatif} "
      & "reminder_event {rappel} other {notification système}}");
   P ("label.notifications.notification_group_label",
      "{count, plural, =0 {{name} : aucune notification} one {{name} : 1 "
      & "notification} many {{name} : {count, number} de notifications} other "
      & "{{name} : {count, number} notifications}}");
   P ("label.notifications.notification_label",
      "{subject} : {event, select, mention_event {mention} reply_event "
      & "{réponse} assignment_event {attribution} approval_event {demande "
      & "d’approbation} alert_event {alerte} digest_event {récapitulatif} "
      & "reminder_event {rappel} other {notification système}} {state, select, "
      & "unread_state {{event, select, digest_event {non lu} reminder_event "
      & "{non lu} other {non lue}}} read_state {{event, select, digest_event "
      & "{lu} reminder_event {lu} other {lue}}} archived_state {{event, select, "
      & "digest_event {archivé} reminder_event {archivé} other {archivée}}} "
      & "muted_state {en sourdine} snoozed_state {{event, select, digest_event "
      & "{reporté} reminder_event {reporté} other {reportée}}} other "
      & "{{event, select, digest_event {masqué} reminder_event {masqué} other "
      & "{masquée}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {notification non lue} read_state "
      & "{notification lue} archived_state {notification archivée} muted_state "
      & "{notification en sourdine} snoozed_state {notification reportée} "
      & "other {notification masquée}}");
   P ("label.notifications.snoozed_label", "{name} : notifications reportées");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {aucune notification masquée} one {1 notification "
      & "masquée} many {{count, number} de notifications masquées} other "
      & "{{count, number} notifications masquées}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {aucune notification non lue} one {1 notification "
      & "non lue} many {{count, number} de notifications non lues} other "
      & "{{count, number} notifications non lues}}");
   P ("label.payments.amount_label", "montant : {amount_text}");
   P ("label.payments.balance_label", "solde : {amount_text}");
   P ("label.payments.chargeback_label", "rétrofacturation : {amount_text}");
   P ("label.payments.discount_label", "remise : {amount_text}");
   P ("label.payments.due_label", "{amount_text}, échéance {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {aucune facture} one {1 facture} many {{count, "
      & "number} de factures} other {{count, number} factures}}");
   P ("label.payments.invoice_label",
      "{state, select, draft_invoice {facture {number} : brouillon} "
      & "open_invoice {facture {number} : ouverte} paid_invoice {facture "
      & "{number} : payée} overdue_invoice {facture {number} : en retard} "
      & "other {facture {number} : annulée}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {brouillon de facture} open_invoice "
      & "{facture ouverte} paid_invoice {facture payée} overdue_invoice "
      & "{facture en retard} other {facture annulée}}");
   P ("label.payments.method_label",
      "{method, select, card_method {payé par carte : {detail}} "
      & "bank_transfer_method {payé par virement bancaire : {detail}} "
      & "cash_method {payé en espèces : {detail}} wallet_method {payé par "
      & "portefeuille électronique : {detail}} check_method {payé par chèque "
      & ": {detail}} other {payé par un autre moyen : {detail}}}");
   P ("label.payments.paid_label", "{amount_text} payé {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {aucun paiement} one {1 paiement} many {{count, "
      & "number} de paiements} other {{count, number} paiements}}");
   P ("label.payments.payment_label",
      "{state, select, pending_payment {{amount_text} : paiement en attente} "
      & "authorized_payment {{amount_text} : paiement autorisé} paid_payment "
      & "{{amount_text} : paiement effectué} failed_payment {{amount_text} : "
      & "échec du paiement} refunded_payment {{amount_text} : paiement "
      & "remboursé} other {{amount_text} : paiement annulé}}");
   P ("label.payments.payment_link_label", "lien de paiement {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {carte} bank_transfer_method {virement "
      & "bancaire} cash_method {espèces} wallet_method {portefeuille "
      & "électronique} check_method {chèque} other {autre}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {paiement en attente} "
      & "authorized_payment {paiement autorisé} paid_payment {paiement "
      & "effectué} failed_payment {échec du paiement} refunded_payment "
      & "{paiement remboursé} other {paiement annulé}}");
   P ("label.payments.receipt_label", "reçu {number}");
   P ("label.payments.refund_label",
      "{state, select, pending_payment {{amount_text} : remboursement en "
      & "attente} authorized_payment {{amount_text} : remboursement autorisé} "
      & "paid_payment {{amount_text} : remboursement versé} failed_payment "
      & "{{amount_text} : échec du remboursement} refunded_payment "
      & "{{amount_text} : remboursement effectué} other {{amount_text} : "
      & "remboursement annulé}}");
   P ("label.payments.subtotal_label", "sous-total : {amount_text}");
   P ("label.payments.tax_label", "taxes : {amount_text}");
   P ("label.payments.total_label", "total : {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject} : l’accès expire {time_text}");
   P ("label.permissions.grant_label",
      "{subject} : rôle {role, select, owner_role {de propriétaire} "
      & "admin_role {d’administrateur} editor_role {d’éditeur} viewer_role "
      & "{de lecteur} other {personnalisé}} accordé");
   P ("label.permissions.permission_label",
      "{subject}, {action} : {state, select, granted {autorisé} denied "
      & "{refusé} inherited {hérité} temporary {accès temporaire} expired "
      & "{expiré} other {approbation requise}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {autorisé} denied {refusé} inherited "
      & "{hérité} temporary {accès temporaire} expired {expiré} other "
      & "{approbation requise}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {autorisé par la politique} "
      & "policy_denied {refusé par la politique} policy_warning {avertissement "
      & "de la politique} other {politique non applicable}}");
   P ("label.permissions.revoke_label",
      "{subject} : rôle {role, select, owner_role {de propriétaire} "
      & "admin_role {d’administrateur} editor_role {d’éditeur} viewer_role "
      & "{de lecteur} other {personnalisé}} révoqué");
   P ("label.permissions.role_label",
      "{role, select, owner_role {propriétaire} admin_role {administrateur} "
      & "editor_role {éditeur} viewer_role {lecteur} other {rôle "
      & "personnalisé}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {vide} low_utilization {utilisation "
      & "faible} normal_utilization {utilisation normale} high_utilization "
      & "{utilisation élevée} critical_utilization {utilisation critique} "
      & "full_utilization {plein} other {limite dépassée}}");
   P ("label.schema.array_shape_label",
      "{count_known, select, false {{element_type, select, string_field "
      & "{tableau de chaînes} integer_field {tableau d’entiers} "
      & "decimal_field {tableau de décimaux} boolean_field {tableau de "
      & "booléens} date_field {tableau de dates} date_time_field {tableau de "
      & "dates-heures} object_field {tableau d’objets} array_field {tableau "
      & "de tableaux} enum_field {tableau d’énumérations} binary_field "
      & "{tableau de données binaires} null_field {tableau de valeurs nulles} "
      & "any_field {tableau de valeurs quelconques} other {tableau "
      & "d’éléments inconnus}}} other {{count, plural, one {tableau de "
      & "{count, number} {element_type, select, string_field {chaîne} "
      & "integer_field {entier} decimal_field {décimal} boolean_field "
      & "{booléen} date_field {date} date_time_field {date-heure} object_field "
      & "{objet} array_field {tableau} enum_field {énumération} binary_field "
      & "{valeur binaire} null_field {valeur nulle} any_field {valeur "
      & "quelconque} other {élément inconnu}}} many {tableau de {count, "
      & "number} {element_type, select, string_field {de chaînes} "
      & "integer_field {d’entiers} decimal_field {de décimaux} boolean_field "
      & "{de booléens} date_field {de dates} date_time_field {de dates-heures} "
      & "object_field {d’objets} array_field {de tableaux} enum_field "
      & "{d’énumérations} binary_field {de valeurs binaires} null_field {de "
      & "valeurs nulles} any_field {de valeurs quelconques} other "
      & "{d’éléments inconnus}}} other {tableau de {count, number} "
      & "{element_type, select, string_field {chaînes} integer_field {entiers} "
      & "decimal_field {décimaux} boolean_field {booléens} date_field {dates} "
      & "date_time_field {dates-heures} object_field {objets} array_field "
      & "{tableaux} enum_field {énumérations} binary_field {valeurs binaires} "
      & "null_field {valeurs nulles} any_field {valeurs quelconques} other "
      & "{éléments inconnus}}}}}}");
   P ("label.schema.constraint_label", "contrainte {name} : {value}");
   P ("label.schema.default_value_label", "champ {field_name} : valeur par défaut {value}");
   P ("label.schema.deprecated_field_label", "champ obsolète {name}, utilisez {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {{count, number} option d’énumération} many "
      & "{{count, number} d’options d’énumération} other {{count, number} "
      & "options d’énumération}}");
   P ("label.schema.example_value_label", "champ {field_name} : exemple {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {champ normal} deprecated_field {champ "
      & "obsolète} unknown_field {champ inconnu} read_only_field {champ en "
      & "lecture seule} write_only_field {champ en écriture seule} other "
      & "{champ calculé}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {champ chaîne} integer_field {champ "
      & "entier} decimal_field {champ décimal} boolean_field {champ booléen} "
      & "date_field {champ date} date_time_field {champ date-heure} "
      & "object_field {champ objet} array_field {champ tableau} enum_field "
      & "{champ énumération} binary_field {champ binaire} null_field {champ "
      & "nul} any_field {champ de tout type} other {champ de type inconnu}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {aucun champ obligatoire manquant} one {1 champ "
      & "obligatoire manquant} many {{count, number} de champs obligatoires "
      & "manquants} other {{count, number} champs obligatoires manquants}}");
   P ("label.schema.object_shape_label",
      "objet à {fields, plural, one {{fields, number} champ} many {{fields, "
      & "number} de champs} other {{fields, number} champs}}{required, plural, "
      & "=0 {} one {, 1 obligatoire} other {, {required, number} "
      & "obligatoires}}{optional, plural, =0 {} one {, 1 facultatif} other {, "
      & "{optional, number} facultatifs}}");
   P ("label.schema.schema_source_label", "schéma {name}, version {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {valeur scalaire} object_shape {{count, "
      & "plural, =0 {objet} one {objet à 1 champ} many {objet à {count, "
      & "number} de champs} other {objet à {count, number} champs}}} "
      & "array_shape {{count, plural, =0 {tableau} one {tableau de 1 élément} "
      & "many {tableau de {count, number} d’éléments} other {tableau de "
      & "{count, number} éléments}}} map_shape {{count, plural, =0 "
      & "{dictionnaire} one {dictionnaire de 1 entrée} many {dictionnaire de "
      & "{count, number} d’entrées} other {dictionnaire de {count, number} "
      & "entrées}}} tuple_shape {{count, plural, =0 {tuple} one {tuple de 1 "
      & "élément} many {tuple de {count, number} d’éléments} other {tuple "
      & "de {count, number} éléments}}} union_shape {{count, plural, =0 "
      & "{union} one {union de 1 type} many {union de {count, number} de types} "
      & "other {union de {count, number} types}}} empty_shape {forme vide} "
      & "other {forme inconnue}}");
   P ("label.schema.unknown_field_label", "champ inconnu {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {aucun filtre actif} one {{count, number} filtre "
      & "actif} many {{count, number} de filtres actifs} other {{count, number} "
      & "filtres actifs}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {effacer les filtres} one {effacer le filtre actif} "
      & "many {effacer les {count, number} de filtres actifs} other {effacer "
      & "les {count, number} filtres actifs}}");
   P ("label.search.facet_label",
      "{count, plural, one {facette {name}, {count, number} option} many "
      & "{facette {name}, {count, number} d’options} other {facette {name}, "
      & "{count, number} options}}");
   P ("label.search.facet_value_label",
      "{selected, select, false {{count, plural, =0 {{name}, aucun résultat} "
      & "one {{name}, {count, number} résultat} many {{name}, {count, number} "
      & "de résultats} other {{name}, {count, number} résultats}}} other "
      & "{{count, plural, =0 {{name}, aucun résultat, sélectionné} one "
      & "{{name}, {count, number} résultat, sélectionné} many {{name}, "
      & "{count, number} de résultats, sélectionné} other {{name}, {count, "
      & "number} résultats, sélectionné}}}}");
   P ("label.search.filter_label",
      "{name} : {value}, {state, select, active_filter {filtre actif} "
      & "inactive_filter {filtre inactif} other {filtre d’exclusion}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {filtre actif} inactive_filter {filtre "
      & "inactif} other {filtre d’exclusion}}");
   P ("label.search.no_results_label", "aucun résultat pour « {query} »");
   P ("label.search.recent_search_label", "recherche récente : « {query} »");
   P ("label.search.saved_search_label",
      "{count, plural, =0 {recherche enregistrée : {name}} one {recherche "
      & "enregistrée : {name}, {count, number} résultat} many {recherche "
      & "enregistrée : {name}, {count, number} de résultats} other {recherche "
      & "enregistrée : {name}, {count, number} résultats}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {aucune recherche récente} one {{count, number} "
      & "recherche récente} many {{count, number} de recherches récentes} "
      & "other {{count, number} recherches récentes}}");
   P ("label.search.search_query_label", "rechercher « {query} »");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {aucun résultat} one {{count, number} résultat} "
      & "many {{count, number} de résultats} other {{count, number} "
      & "résultats}}");
   P ("label.search.search_result_summary_label",
      "{count, plural, =0 {aucun résultat pour « {query} »} one {{count, "
      & "number} résultat pour « {query} »} many {{count, number} de "
      & "résultats pour « {query} »} other {{count, number} résultats pour "
      & "« {query} »}}");
   P ("label.search.search_scope_label",
      "{count, plural, =0 {portée {name}, aucun résultat} one {portée "
      & "{name}, {count, number} résultat} many {portée {name}, {count, "
      & "number} de résultats} other {portée {name}, {count, number} "
      & "résultats}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {recherche inactive} searching_search "
      & "{recherche en cours} complete_search {recherche terminée} "
      & "empty_search {aucun résultat de recherche} other {échec de la "
      & "recherche}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {trier par pertinence} ascending_sort "
      & "{trier par ordre croissant} descending_sort {trier par ordre "
      & "décroissant} newest_first_sort {trier du plus récent au plus ancien} "
      & "other {trier du plus ancien au plus récent}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {pertinence} ascending_sort {croissant} "
      & "descending_sort {décroissant} newest_first_sort {plus récents "
      & "d’abord} other {plus anciens d’abord}}");
   P ("label.search.suggestion_label", "vouliez-vous dire « {query} » ?");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {{count, number} identifiant provenant de "
      & "{source}} many {{count, number} d’identifiants provenant de "
      & "{source}} other {{count, number} identifiants provenant de {source}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {valeur cachée} masked_value {valeur "
      & "masquée} suffix_only {suffixe uniquement} other {empreinte "
      & "uniquement}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {public} support_profile {assistance} "
      & "audit_profile {audit} other {débogage}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {{days_old, plural, =0 {rotation non "
      & "requise} one {rotation non requise, ancienneté : {days_old, number} "
      & "jour} many {rotation non requise, ancienneté : {days_old, number} de "
      & "jours} other {rotation non requise, ancienneté : {days_old, number} "
      & "jours}}} other {{days_old, plural, =0 {rotation requise} one {rotation "
      & "requise, ancienneté : {days_old, number} jour} many {rotation "
      & "requise, ancienneté : {days_old, number} de jours} other {rotation "
      & "requise, ancienneté : {days_old, number} jours}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {clé API} live_api_key {clé API de "
      & "production} test_api_key {clé API de test} github_token {jeton "
      & "GitHub} aws_access_key {clé d’accès AWS} google_api_key {clé API "
      & "Google} slack_token {jeton Slack} npm_token {jeton npm} bearer_token "
      & "{jeton bearer} jwt_token {jeton JWT} basic_auth_credential "
      & "{identifiant d’authentification basique} password_secret {mot de "
      & "passe} private_key {clé privée} ssh_private_key {clé privée SSH} "
      & "webhook_secret {secret de webhook} oauth_token {jeton OAuth} "
      & "database_url_secret {secret d’URL de base de données} "
      & "sha1_fingerprint {empreinte SHA-1} sha256_fingerprint {empreinte "
      & "SHA-256} other {secret}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {e-mail} phone_value {téléphone} "
      & "url_value {URL} ip_address_value {adresse IP} token_value {jeton} "
      & "file_path_value {chemin de fichier} account_id_value {ID de compte} "
      & "payment_reference_value {référence de paiement} log_field_value "
      & "{champ de journal} other {valeur sensible}}");
   P ("label.tables.cell_label",
      "ligne {row, number}, colonne {column, number} : {state, select, "
      & "empty_cell {vide} edited_cell {modifiée} invalid_cell {non valide} "
      & "highlighted_cell {mise en évidence} other {en lecture seule}}");
   P ("label.tables.cell_position_label", "ligne {row, number}, colonne {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {cellule vide} edited_cell {cellule "
      & "modifiée} invalid_cell {cellule non valide} highlighted_cell {cellule "
      & "mise en évidence} other {cellule en lecture seule}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {aucune colonne} one {{count, number} colonne} many "
      & "{{count, number} de colonnes} other {{count, number} colonnes}}");
   P ("label.tables.column_label",
      "{name} : {role, select, text_column {colonne de texte} number_column "
      & "{colonne numérique} date_column {colonne de date} status_column "
      & "{colonne d’état} action_column {colonne d’actions} other {colonne "
      & "masquée}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {colonne de texte} number_column {colonne "
      & "numérique} date_column {colonne de date} status_column {colonne "
      & "d’état} action_column {colonne d’actions} other {colonne "
      & "masquée}}");
   P ("label.tables.group_label",
      "{count, plural, one {{name} : {count, number} ligne} many {{name} : "
      & "{count, number} de lignes} other {{name} : {count, number} lignes}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {aucune ligne} one {{count, number} ligne} many "
      & "{{count, number} de lignes} other {{count, number} lignes}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {non trié} ascending_sort {croissant} "
      & "other {décroissant}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {non trié} ascending_sort {trié par "
      & "{column_name}, ordre croissant} other {trié par {column_name}, ordre "
      & "décroissant}}");
   P ("label.tables.subtotal_label", "sous-total {name} : {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} ligne} many {{rows, number} de "
      & "lignes} other {{rows, number} lignes}} × {columns, plural, one "
      & "{{columns, number} colonne} many {{columns, number} de colonnes} other "
      & "{{columns, number} colonnes}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {attribution à {assignee} retirée} "
      & "assigned {tâche attribuée à {assignee}} reassigned {tâche "
      & "réattribuée à {assignee}} watching {tâche suivie par {assignee}} "
      & "other {tâche détenue par {assignee}}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {non attribuée} assigned {attribuée} "
      & "reassigned {réattribuée} watching {suivie} other {propriétaire de "
      & "la tâche}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog vide} one {backlog : {count, number} "
      & "tâche} many {backlog : {count, number} de tâches} other {backlog : "
      & "{count, number} tâches}}");
   P ("label.tasks.blocker_label", "bloquée par {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {terminer la tâche} many {terminer {count, "
      & "number} de tâches} other {terminer {count, number} tâches}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {aucune tâche terminée} one {{count, number} "
      & "tâche terminée} many {{count, number} de tâches terminées} other "
      & "{{count, number} tâches terminées}}");
   P ("label.tasks.due_label", "échéance : {due_text}");
   P ("label.tasks.estimate_label", "estimation : {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {aucune tâche ouverte} one {{count, number} tâche "
      & "ouverte} many {{count, number} de tâches ouvertes} other {{count, "
      & "number} tâches ouvertes}}");
   P ("label.tasks.overdue_label", "en retard depuis {due_text}");
   P ("label.tasks.recurring_task_label", "se répète {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {rouvrir la tâche} many {rouvrir {count, number} "
      & "de tâches} other {rouvrir {count, number} tâches}}");
   P ("label.tasks.sprint_label",
      "{count, plural, one {{name} : {count, number} tâche} many {{name} : "
      & "{count, number} de tâches} other {{name} : {count, number} tâches}}");
   P ("label.tasks.subtask_label",
      "{count, plural, one {{name} : {count, number} sous-tâche} many "
      & "{{name} : {count, number} de sous-tâches} other {{name} : {count, "
      & "number} sous-tâches}}");
end Labels_2;
