separate (Humanize.Catalogs.Phrase_Data.Locale_Fr_Ca)
procedure Labels_1 is
begin
   P ("label.attachments.attachment_label",
      "{name} : {kind, select, file_attachment {fichier} image_attachment "
      & "{image} video_attachment {vidéo} audio_attachment {fichier audio} "
      & "document_attachment {document} archive_attachment {archive} other "
      & "{lien}} {state, select, pending_attachment {en attente} "
      & "uploading_attachment {en cours de téléversement} uploaded_attachment "
      & "{{kind, select, image_attachment {téléversée} video_attachment "
      & "{téléversée} archive_attachment {téléversée} other "
      & "{téléversé}}} failed_attachment {en échec} removed_attachment "
      & "{{kind, select, image_attachment {retirée} video_attachment "
      & "{retirée} archive_attachment {retirée} other {retiré}}} other "
      & "{{kind, select, image_attachment {bloquée} video_attachment "
      & "{bloquée} archive_attachment {bloquée} other {bloqué}}}}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {pièce jointe en attente} "
      & "uploading_attachment {pièce jointe en cours de téléversement} "
      & "uploaded_attachment {pièce jointe téléversée} failed_attachment "
      & "{pièce jointe en échec} removed_attachment {pièce jointe retirée} "
      & "other {pièce jointe bloquée}}");
   P ("label.attachments.upload_error_label", "échec du téléversement de {name} : {reason}");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefact téléversé} "
      & "artifact_missing {artefact manquant} artifact_expired {artefact "
      & "expiré} other {artefact vérifié}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefact prêt} artifact_uploaded "
      & "{artefact téléversé} artifact_signed {artefact signé} "
      & "artifact_missing {artefact manquant} other {artefact expiré}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {valeur attendue "
      & "pour {subject}} expected_unit {unité attendue pour {subject}} "
      & "invalid_range {plage non valide pour {subject}} end_before_start {fin "
      & "de plage antérieure au début pour {subject}} unknown_field {champ "
      & "inconnu pour {subject}} unsafe_redacted_value {valeur non sûre "
      & "masquée pour {subject}} unsupported_syntax {syntaxe non prise en "
      & "charge pour {subject}} other {explication du diagnostic pour "
      & "{subject}}}; utilisez {suggestion}} other {{kind, select, "
      & "expected_value {valeur attendue pour {subject} à la position "
      & "{position, number}} expected_unit {unité attendue pour {subject} à "
      & "la position {position, number}} invalid_range {plage non valide pour "
      & "{subject} à la position {position, number}} end_before_start {fin de "
      & "plage antérieure au début pour {subject} à la position {position, "
      & "number}} unknown_field {champ inconnu pour {subject} à la position "
      & "{position, number}} unsafe_redacted_value {valeur non sûre masquée "
      & "pour {subject} à la position {position, number}} unsupported_syntax "
      & "{syntaxe non prise en charge pour {subject} à la position {position, "
      & "number}} other {explication du diagnostic pour {subject} à la "
      & "position {position, number}}}; utilisez {suggestion}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {syntaxe non prise "
      & "en charge (analyseur de tailles) : {error}; utilisez B, kB, MB, GB, "
      & "KiB, MiB, GiB ou TiB} duration_parser {syntaxe non prise en charge "
      & "(analyseur de durées) : {error}; utilisez ms, s, min, h, d, w, month "
      & "ou year} date_time_parser {syntaxe non prise en charge (analyseur de "
      & "dates et heures) : {error}; utilisez une date ISO, un jour en langage "
      & "naturel ou une heure} color_parser {syntaxe non prise en charge "
      & "(analyseur de couleurs) : {error}; utilisez hex, rgb(), hsl(), lab(), "
      & "lch() ou un nom de couleur} url_parser {syntaxe non prise en charge "
      & "(analyseur d’URL) : {error}; utilisez schéma, hôte, chemin, "
      & "requête ou fragment} unit_parser {syntaxe non prise en charge "
      & "(analyseur d’unités) : {error}; utilisez une unité prise en charge "
      & "par Humanize} recurrence_parser {syntaxe non prise en charge "
      & "(analyseur de récurrences) : {error}; utilisez cron ou une "
      & "récurrence every/weekday} domain_label_parser {syntaxe non prise en "
      & "charge (analyseur de libellés de domaine) : {error}; utilisez un "
      & "libellé de domaine Humanize déterministe} other {syntaxe non prise "
      & "en charge (analyseur) : {error}; utilisez une forme de saisie prise en "
      & "charge}}} other {{family, select, byte_parser {syntaxe non prise en "
      & "charge (analyseur de tailles) : {error} à la position {position, "
      & "number}; utilisez B, kB, MB, GB, KiB, MiB, GiB ou TiB} duration_parser "
      & "{syntaxe non prise en charge (analyseur de durées) : {error} à la "
      & "position {position, number}; utilisez ms, s, min, h, d, w, month ou "
      & "year} date_time_parser {syntaxe non prise en charge (analyseur de "
      & "dates et heures) : {error} à la position {position, number}; utilisez "
      & "une date ISO, un jour en langage naturel ou une heure} color_parser "
      & "{syntaxe non prise en charge (analyseur de couleurs) : {error} à la "
      & "position {position, number}; utilisez hex, rgb(), hsl(), lab(), lch() "
      & "ou un nom de couleur} url_parser {syntaxe non prise en charge "
      & "(analyseur d’URL) : {error} à la position {position, number}; "
      & "utilisez schéma, hôte, chemin, requête ou fragment} unit_parser "
      & "{syntaxe non prise en charge (analyseur d’unités) : {error} à la "
      & "position {position, number}; utilisez une unité prise en charge par "
      & "Humanize} recurrence_parser {syntaxe non prise en charge (analyseur de "
      & "récurrences) : {error} à la position {position, number}; utilisez "
      & "cron ou une récurrence every/weekday} domain_label_parser {syntaxe "
      & "non prise en charge (analyseur de libellés de domaine) : {error} à "
      & "la position {position, number}; utilisez un libellé de domaine "
      & "Humanize déterministe} other {syntaxe non prise en charge (analyseur) "
      & ": {error} à la position {position, number}; utilisez une forme de "
      & "saisie prise en charge}}}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {aucune action de modération} flagged "
      & "{signalé} hidden {masqué par un modérateur} restored {restauré} "
      & "marked_spam {marqué comme pourriel} removed {supprimé} other "
      & "{escaladé}}");
   P ("label.moderation.moderation_label",
      "{action, select, no_action {{item} : aucune action de modération} "
      & "flagged {{item} : signalé} hidden {{item} : masqué par un "
      & "modérateur} restored {{item} : restauré} marked_spam {{item} : "
      & "marqué comme pourriel} removed {{item} : supprimé} other {{item} : "
      & "escaladé}}");
   P ("label.notifications.delivery_label",
      "notification {channel, select, in_app_channel {dans l’application} "
      & "email_channel {par courriel} sms_channel {par SMS} push_channel {push} "
      & "webhook_channel {par webhook} other {de récapitulatif}} {state, "
      & "select, pending_delivery {en attente} sent_delivery {envoyée} "
      & "delivered_delivery {remise} failed_delivery {en échec} "
      & "retrying_delivery {en cours de renvoi} other {annulée}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {notifications dans l’application} "
      & "email_channel {notifications par courriel} sms_channel {notifications "
      & "par SMS} push_channel {notifications push} webhook_channel "
      & "{notifications par webhook} other {notifications de récapitulatif}}");
   P ("label.search.suggestion_label", "vouliez-vous dire « {query} »?");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {courriel} phone_value {téléphone} "
      & "url_value {URL} ip_address_value {adresse IP} token_value {jeton} "
      & "file_path_value {chemin de fichier} account_id_value {ID de compte} "
      & "payment_reference_value {référence de paiement} log_field_value "
      & "{champ de journal} other {valeur sensible}}");
   P ("label.changes.sync_change_label.uploaded",
      "{count, plural, one {{count, number} téléversé} many {{count, "
      & "number} téléversés} other {{count, number} téléversés}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {aucun téléversement} one {{done, plural, =0 {0 "
      & "sur 1 téléversement terminé} other {1 sur 1 téléversement "
      & "terminé}}} other {{done, number} sur {total, number} téléversements "
      & "terminés}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {courriel vide} address {adresse courriel} other "
      & "{courriel du domaine {domain}}}");
end Labels_1;
