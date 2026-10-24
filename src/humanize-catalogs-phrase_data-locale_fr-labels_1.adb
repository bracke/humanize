separate (Humanize.Catalogs.Phrase_Data.Locale_Fr)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name} : compte actif} invited_account "
      & "{{name} : compte invité} locked_account {{name} : compte verrouillé} "
      & "suspended_account {{name} : compte suspendu} deleted_account {{name} : "
      & "compte supprimé} other {{name} : état du compte inconnu}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {compte actif} invited_account {compte "
      & "invité} locked_account {compte verrouillé} suspended_account {compte "
      & "suspendu} deleted_account {compte supprimé} other {état du compte "
      & "inconnu}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {appareil de confiance} "
      & "untrusted_device {appareil non approuvé} new_device {nouvel appareil} "
      & "other {appareil bloqué}}");
   P ("label.accounts.last_active_label", "{name} : dernière activité {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name} : échec de la connexion} other "
      & "{{name} : connexion réussie}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA activée} mfa_disabled {MFA "
      & "désactivée} mfa_required {MFA requise} other {réinitialisation de "
      & "la MFA requise}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name} : session active} "
      & "expired_session {{name} : session expirée} revoked_session {{name} : "
      & "session révoquée} idle_session {{name} : session inactive} other "
      & "{{name} : état de session inconnu}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {session active} expired_session "
      & "{session expirée} revoked_session {session révoquée} idle_session "
      & "{session inactive} other {état de session inconnu}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {aucune pièce jointe} one {1 pièce jointe} many "
      & "{{count, number} de pièces jointes} other {{count, number} pièces "
      & "jointes}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name} : 1 pièce jointe} many {{name} : {count, "
      & "number} de pièces jointes} other {{name} : {count, number} pièces "
      & "jointes}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {fichier joint} image_attachment {image "
      & "jointe} video_attachment {vidéo jointe} audio_attachment {fichier "
      & "audio joint} document_attachment {document joint} archive_attachment "
      & "{archive jointe} other {lien joint}}");
   P ("label.attachments.attachment_label",
      "{name} : {kind, select, file_attachment {fichier} image_attachment "
      & "{image} video_attachment {vidéo} audio_attachment {fichier audio} "
      & "document_attachment {document} archive_attachment {archive} other "
      & "{lien}} {state, select, pending_attachment {en attente} "
      & "uploading_attachment {en cours d’envoi} uploaded_attachment {{kind, "
      & "select, image_attachment {envoyée} video_attachment {envoyée} "
      & "archive_attachment {envoyée} other {envoyé}}} failed_attachment {en "
      & "échec} removed_attachment {{kind, select, image_attachment {retirée} "
      & "video_attachment {retirée} archive_attachment {retirée} other "
      & "{retiré}}} other {{kind, select, image_attachment {bloquée} "
      & "video_attachment {bloquée} archive_attachment {bloquée} other "
      & "{bloqué}}}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {pièce jointe en attente} "
      & "uploading_attachment {pièce jointe en cours d’envoi} "
      & "uploaded_attachment {pièce jointe envoyée} failed_attachment {pièce "
      & "jointe en échec} removed_attachment {pièce jointe retirée} other "
      & "{pièce jointe bloquée}}");
   P ("label.attachments.download_label", "télécharger {name}");
   P ("label.attachments.expiring_link_label", "{name} : le lien expire {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "aperçu de {name}");
   P ("label.attachments.remove_label", "retirer {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name} : non analysé} scanning {{name} : "
      & "analyse en cours} safe {{name} : aucune menace détectée} suspicious "
      & "{{name} : suspect} other {{name} : infecté}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {non analysé} scanning {analyse en cours} "
      & "safe {aucune menace détectée} suspicious {suspect} other {infecté}}");
   P ("label.attachments.upload_error_label", "échec de l’envoi de {name} : {reason}");
   P ("label.badges.badge_label",
      "{name} : {state, select, default_badge {badge} new_badge {nouveau "
      & "badge} updated_badge {badge mis à jour} deprecated_badge {badge "
      & "obsolète} selected_badge {badge sélectionné} disabled_badge {badge "
      & "désactivé} other {badge masquable}} ({tone, select, neutral_tone "
      & "{neutre} info_tone {information} success_tone {succès} warning_tone "
      & "{avertissement} danger_tone {danger} other {discret}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {badge priorité basse} "
      & "medium_priority {badge priorité moyenne} high_priority {badge "
      & "priorité haute} other {badge priorité critique}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {badge par défaut} new_badge {nouveau "
      & "badge} updated_badge {badge mis à jour} deprecated_badge {badge "
      & "obsolète} selected_badge {badge sélectionné} disabled_badge {badge "
      & "désactivé} other {badge masquable}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {badge neutre} info_tone {badge "
      & "d’information} success_tone {badge de succès} warning_tone {badge "
      & "d’avertissement} danger_tone {badge de danger} other {badge "
      & "discret}}");
   P ("label.badges.chip_label",
      "{selected, select, false {puce {name}} other {puce {name} "
      & "sélectionnée}}");
   P ("label.badges.count_badge_label", "{name} : {count, number}");
   P ("label.badges.deprecated_label", "{name} : badge obsolète (avertissement)");
   P ("label.badges.dismiss_label", "fermer {name}");
   P ("label.badges.new_label", "{name} : nouveau badge (information)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {aucun badge masqué} one {+1 autre badge} "
      & "many {+{hidden_count, number} autres badges} other {+{hidden_count, "
      & "number} autres badges}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name} : badge priorité basse} "
      & "medium_priority {{name} : badge priorité moyenne} high_priority "
      & "{{name} : badge priorité haute} other {{name} : badge priorité "
      & "critique}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, statut : neutre} info_tone "
      & "{{name}, statut : information} success_tone {{name}, statut : succès} "
      & "warning_tone {{name}, statut : avertissement} danger_tone {{name}, "
      & "statut : danger} other {{name}, statut : discret}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {aucune étiquette} one {1 étiquette} many "
      & "{{count, number} d’étiquettes} other {{count, number} étiquettes}}");
   P ("label.badges.tag_label", "étiquette {name}");
   P ("label.badges.updated_label", "{name} : badge mis à jour (succès)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefact envoyé} artifact_missing "
      & "{artefact manquant} artifact_expired {artefact expiré} other "
      & "{artefact vérifié}}");
   P ("label.builds.benchmark_label", "banc d’essai {name} : {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name} : compilation en file "
      & "d’attente} build_running {{name} : compilation en cours} "
      & "build_passed {{name} : compilation réussie} build_failed {{name} : "
      & "échec de la compilation} snapshot_build {{name} : compilation "
      & "snapshot} other {{name} : compilation de publication}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {compilation en file d’attente} "
      & "build_running {compilation en cours} build_passed {compilation "
      & "réussie} build_failed {échec de la compilation} snapshot_build "
      & "{compilation snapshot} other {compilation de publication}}");
   P ("label.builds.coverage_label", "couverture : {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {contrôle de publication réussi} "
      & "gate_failed {échec du contrôle de publication} gate_warning "
      & "{avertissement du contrôle de publication} other {contrôle de "
      & "publication bloqué}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {aucun test réussi} "
      & "one {1 test réussi} many {{count, number} de tests réussis} other "
      & "{{count, number} tests réussis}}} failed_test {{count, plural, =0 "
      & "{aucun test en échec} one {1 test en échec} many {{count, number} de "
      & "tests en échec} other {{count, number} tests en échec}}} "
      & "skipped_test {{count, plural, =0 {aucun test ignoré} one {1 test "
      & "ignoré} many {{count, number} de tests ignorés} other {{count, "
      & "number} tests ignorés}}} flaky_test {{count, plural, =0 {aucun test "
      & "instable} one {1 test instable} many {{count, number} de tests "
      & "instables} other {{count, number} tests instables}}} other {{count, "
      & "plural, =0 {aucun échec attendu} one {1 test en échec attendu} many "
      & "{{count, number} de tests en échec attendu} other {{count, number} "
      & "tests en échec attendu}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {réussi} failed_test {en échec} "
      & "skipped_test {ignoré} flaky_test {instable} other {échec attendu}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} : "
      & "désactivé (sans changement)} other {{field_name} : de désactivé à "
      & "activé}}} other {{new_value, select, false {{field_name} : "
      & "d’activé à désactivé} other {{field_name} : activé (sans "
      & "changement)}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {ajouté} removed_change {supprimé} "
      & "modified_change {modifié} renamed_change {renommé} unchanged_change "
      & "{inchangé} metadata_change {métadonnées modifiées} moved_change "
      & "{déplacé} conflict_change {conflit} other {modification inconnue}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {modification informative} "
      & "minor_change {modification mineure} major_change {modification "
      & "majeure} other {modification incompatible}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} : aucun "
      & "changement} other {{unchanged, plural, =0 {{field_name} : +{added, "
      & "number}} other {{field_name} : +{added, number}, {unchanged, number} "
      & "sans changement}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name} : -{removed, number}} other {{field_name} : -{removed, "
      & "number}, {unchanged, number} sans changement}}} other {{unchanged, "
      & "plural, =0 {{field_name} : +{added, number}, -{removed, number}} other "
      & "{{field_name} : +{added, number}, -{removed, number}, {unchanged, "
      & "number} sans changement}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {aucun conflit} one {1 conflit} many {{count, "
      & "number} de conflits} other {{count, number} conflits}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} : de {old_label} à {new_label} "
      & "(plus tard)} other {{field_name} : de {old_label} à {new_label} (plus "
      & "tôt)}}");
   P ("label.changes.duration_field_change_label", "{field_name} : de {old_label} à {new_label}");
   P ("label.changes.field_change_label", "{field_name} : de {old_value} à {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} : ajouté} removed_change {{name} "
      & ": supprimé} modified_change {{name} : modifié} renamed_change "
      & "{{name} : renommé} unchanged_change {{name} : inchangé} "
      & "metadata_change {{name} : métadonnées modifiées} moved_change "
      & "{{name} : déplacé} conflict_change {{name} : conflit} other {{name} "
      & ": modification inconnue}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {seules les métadonnées ont changé} one {seul 1 "
      & "champ de métadonnées a changé} many {seuls {count, number} de "
      & "champs de métadonnées ont changé} other {seuls {count, number} "
      & "champs de métadonnées ont changé}}");
   P ("label.changes.move_label", "{name} : déplacé de {from} vers {to}");
   P ("label.changes.no_changes_label", "aucune modification");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {aucune ligne "
      & "modifiée} one {1 ligne ajoutée} many {{lines_added, number} de "
      & "lignes ajoutées} other {{lines_added, number} lignes ajoutées}}} one "
      & "{{lines_added, plural, =0 {1 ligne supprimée} one {1 ligne ajoutée, "
      & "1 ligne supprimée} many {{lines_added, number} de lignes ajoutées, 1 "
      & "ligne supprimée} other {{lines_added, number} lignes ajoutées, 1 "
      & "ligne supprimée}}} many {{lines_added, plural, =0 {{lines_removed, "
      & "number} de lignes supprimées} one {1 ligne ajoutée, {lines_removed, "
      & "number} de lignes supprimées} many {{lines_added, number} de lignes "
      & "ajoutées, {lines_removed, number} de lignes supprimées} other "
      & "{{lines_added, number} lignes ajoutées, {lines_removed, number} de "
      & "lignes supprimées}}} other {{lines_added, plural, =0 {{lines_removed, "
      & "number} lignes supprimées} one {1 ligne ajoutée, {lines_removed, "
      & "number} lignes supprimées} many {{lines_added, number} de lignes "
      & "ajoutées, {lines_removed, number} lignes supprimées} other "
      & "{{lines_added, number} lignes ajoutées, {lines_removed, number} "
      & "lignes supprimées}}}}");
   P ("label.changes.rename_label", "renommé de {old_name} en {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} a rédigé un brouillon de "
      & "commentaire} published_comment {{author} a commenté} edited_comment "
      & "{{author} a modifié un commentaire} deleted_comment {{author} a "
      & "supprimé un commentaire} resolved_comment {{author} a résolu un "
      & "commentaire} unresolved_comment {{author} a rouvert un commentaire} "
      & "pinned_comment {{author} a épinglé un commentaire} other {{author} a "
      & "masqué un commentaire}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {aucun commentaire} one {1 commentaire} many "
      & "{{count, number} de commentaires} other {{count, number} "
      & "commentaires}}");
   P ("label.comments.comment_label",
      "commentaire de {author} ({state, select, draft_comment {brouillon} "
      & "published_comment {publié} edited_comment {modifié} deleted_comment "
      & "{supprimé} resolved_comment {résolu} unresolved_comment {non "
      & "résolu} pinned_comment {épinglé} other {masqué}})");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {brouillon de commentaire} "
      & "published_comment {commentaire publié} edited_comment {commentaire "
      & "modifié} deleted_comment {commentaire supprimé} resolved_comment "
      & "{commentaire résolu} unresolved_comment {commentaire non résolu} "
      & "pinned_comment {commentaire épinglé} other {commentaire masqué}}");
   P ("label.comments.deleted_label", "{author} a supprimé un commentaire");
   P ("label.comments.edited_label", "modifié {time_text}");
   P ("label.comments.hide_comment_label", "masquer le commentaire : {reason}");
   P ("label.comments.lock_thread_label", "verrouiller la discussion {name}");
   P ("label.comments.mention_label", "{actor} a mentionné {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {aucun participant} one {1 participant} many "
      & "{{count, number} de participants} other {{count, number} "
      & "participants}}");
   P ("label.comments.pin_label", "épingler {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {réaction « j’aime »} "
      & "dislike_reaction {réaction « je n’aime pas »} heart_reaction "
      & "{réaction cœur} laugh_reaction {réaction rire} confused_reaction "
      & "{réaction perplexe} hooray_reaction {réaction hourra} "
      & "rocket_reaction {réaction fusée} other {réaction yeux}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {aucun « j’aime "
      & "»} one {1 « j’aime »} other {{count, number} « j’aime »}}} "
      & "dislike_reaction {{count, plural, =0 {aucun « je n’aime pas »} one "
      & "{1 « je n’aime pas »} other {{count, number} « je n’aime pas "
      & "»}}} heart_reaction {{count, plural, =0 {aucun cœur} one {1 cœur} "
      & "many {{count, number} de cœurs} other {{count, number} cœurs}}} "
      & "laugh_reaction {{count, plural, =0 {aucun rire} one {1 rire} many "
      & "{{count, number} de rires} other {{count, number} rires}}} "
      & "confused_reaction {{count, plural, =0 {aucune réaction perplexe} one "
      & "{1 réaction perplexe} many {{count, number} de réactions perplexes} "
      & "other {{count, number} réactions perplexes}}} hooray_reaction "
      & "{{count, plural, =0 {aucun hourra} one {1 hourra} many {{count, "
      & "number} de hourras} other {{count, number} hourras}}} rocket_reaction "
      & "{{count, plural, =0 {aucune fusée} one {1 fusée} many {{count, "
      & "number} de fusées} other {{count, number} fusées}}} other {{count, "
      & "plural, =0 {aucune réaction yeux} one {1 réaction yeux} many "
      & "{{count, number} de réactions yeux} other {{count, number} réactions "
      & "yeux}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {aucune réponse} one {1 réponse} many {{count, "
      & "number} de réponses} other {{count, number} réponses}}");
   P ("label.comments.resolved_label", "{name} : résolu");
   P ("label.comments.subscribe_label", "s’abonner à {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {aucune discussion} one {1 discussion} many "
      & "{{count, number} de discussions} other {{count, number} discussions}}");
   P ("label.comments.thread_label",
      "{name} : discussion {state, select, open_thread {ouverte} "
      & "resolved_thread {résolue} locked_thread {verrouillée} other "
      & "{archivée}}{count, plural, =0 {} one {, 1 commentaire} many {, "
      & "{count, number} de commentaires} other {, {count, number} "
      & "commentaires}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {discussion ouverte} resolved_thread "
      & "{discussion résolue} locked_thread {discussion verrouillée} other "
      & "{discussion archivée}}");
   P ("label.comments.unpin_label", "détacher {name}");
   P ("label.comments.unsubscribe_label", "se désabonner de {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name} : amélioré} regressed {{name} : en "
      & "régression} unchanged {{name} : inchangé} within_tolerance {{name} : "
      & "dans la tolérance} outside_tolerance {{name} : hors tolérance} "
      & "new_value {{name} : nouveau} removed_value {{name} : supprimé} other "
      & "{{name} : référence indisponible}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {amélioré} regressed {en régression} "
      & "unchanged {inchangé} within_tolerance {dans la tolérance} "
      & "outside_tolerance {hors tolérance} new_value {nouveau} removed_value "
      & "{supprimé} other {référence indisponible}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name} : amélioration de "
      & "{difference_text}} regressed {{name} : régression de "
      & "{difference_text}} unchanged {{name} : inchangé ({difference_text})} "
      & "within_tolerance {{name} : dans la tolérance ({difference_text})} "
      & "outside_tolerance {{name} : hors tolérance ({difference_text})} "
      & "new_value {{name} : nouveau ({difference_text})} removed_value {{name} "
      & ": supprimé ({difference_text})} other {{name} : référence "
      & "indisponible ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name} : amélioration de "
      & "{difference_text}, tolérance {tolerance_text}} regressed {{name} : "
      & "régression de {difference_text}, tolérance {tolerance_text}} "
      & "unchanged {{name} : inchangé ({difference_text}), tolérance "
      & "{tolerance_text}} within_tolerance {{name} : dans la tolérance "
      & "({difference_text}), tolérance {tolerance_text}} outside_tolerance "
      & "{{name} : hors tolérance ({difference_text}), tolérance "
      & "{tolerance_text}} new_value {{name} : nouveau ({difference_text}), "
      & "tolérance {tolerance_text}} removed_value {{name} : supprimé "
      & "({difference_text}), tolérance {tolerance_text}} other {{name} : "
      & "référence indisponible ({difference_text}), tolérance "
      & "{tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ligne non valide} duplicate_record "
      & "{enregistrement en double} missing_column {colonne manquante} "
      & "unknown_field {champ inconnu} schema_mismatch {schéma non conforme} "
      & "other {enregistrement ignoré}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {simulation réussie} dry_run_failed "
      & "{échec de la simulation} import_valid {importation valide} "
      & "import_invalid {importation non valide} other {importation partielle}}");
   P ("label.data_quality.import_result_label",
      "{name} : {state, select, dry_run_passed {simulation réussie} "
      & "dry_run_failed {échec de la simulation} import_valid {importation "
      & "valide} import_invalid {importation non valide} other {importation "
      & "partielle}} (acceptés : {accepted, number}, rejetés : {rejected, "
      & "number})");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {aucune ligne non "
      & "valide} one {1 ligne non valide} many {{count, number} de lignes non "
      & "valides} other {{count, number} lignes non valides}}} duplicate_record "
      & "{{count, plural, =0 {aucun enregistrement en double} one {1 "
      & "enregistrement en double} many {{count, number} d’enregistrements en "
      & "double} other {{count, number} enregistrements en double}}} "
      & "missing_column {{count, plural, =0 {aucune colonne manquante} one {1 "
      & "colonne manquante} many {{count, number} de colonnes manquantes} other "
      & "{{count, number} colonnes manquantes}}} unknown_field {{count, plural, "
      & "=0 {aucun champ inconnu} one {1 champ inconnu} many {{count, number} "
      & "de champs inconnus} other {{count, number} champs inconnus}}} "
      & "schema_mismatch {{count, plural, =0 {aucune non-conformité au "
      & "schéma} one {1 non-conformité au schéma} many {{count, number} de "
      & "non-conformités au schéma} other {{count, number} non-conformités "
      & "au schéma}}} other {{count, plural, =0 {aucun enregistrement ignoré} "
      & "one {1 enregistrement ignoré} many {{count, number} "
      & "d’enregistrements ignorés} other {{count, number} enregistrements "
      & "ignorés}}}}");
   P ("label.data_quality.row_issue_label",
      "ligne {row, number} : {issue, select, invalid_row {non valide} "
      & "duplicate_record {enregistrement en double} missing_column {colonne "
      & "manquante} unknown_field {champ inconnu} schema_mismatch {schéma non "
      & "conforme} other {enregistrement ignoré}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name} : {issue, select, invalid_row {ligne non valide} "
      & "duplicate_record {enregistrement en double} missing_column {colonne "
      & "manquante} unknown_field {champ inconnu} schema_mismatch {schéma non "
      & "conforme} other {enregistrement ignoré}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefact prêt} artifact_uploaded "
      & "{artefact envoyé} artifact_signed {artefact signé} artifact_missing "
      & "{artefact manquant} other {artefact expiré}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {déploiement de {name} vers "
      & "{environment} en file d’attente} deploying {déploiement de {name} "
      & "vers {environment} en cours} deployed {{name} déployé vers "
      & "{environment}} failed_deployment {échec du déploiement de {name} "
      & "vers {environment}} rolled_back {déploiement de {name} vers "
      & "{environment} restauré} blocked_deployment {déploiement de {name} "
      & "vers {environment} bloqué} other {déploiement de {name} vers "
      & "{environment} annulé}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {déploiement en file d’attente} "
      & "deploying {déploiement en cours} deployed {déployé} "
      & "failed_deployment {échec du déploiement} rolled_back {restauré} "
      & "blocked_deployment {déploiement bloqué} other {déploiement "
      & "annulé}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {environnement sain} "
      & "drifting_environment {dérive de l’environnement} locked_environment "
      & "{environnement verrouillé} maintenance_environment {environnement en "
      & "maintenance} other {état de l’environnement inconnu}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {aucune migration} migration_pending "
      & "{migration en attente} migrating {migration en cours} "
      & "migration_complete {migration terminée} other {échec de la "
      & "migration}}");
   P ("label.deployments.promotion_label", "{name} promu de {from_environment} vers {to_environment}");
   P ("label.deployments.rollback_label", "restauration de {name} vers {target}");
   P ("label.deployments.rollout_label", "déploiement progressif de {name} : {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {aucun élément concerné} one {{count, number} "
      & "élément concerné} many {{count, number} d’éléments concernés} "
      & "other {{count, number} éléments concernés}}");
   P ("label.diagnostics.check_duration_label",
      "{name} : {status, select, passed_check {réussie} failed_check {en "
      & "échec} warning_check {avertissements} skipped_check {ignorée} "
      & "pending_check {en attente} other {en cours}} ({duration_s, plural, one "
      & "{{duration_s, number} seconde} many {{duration_s, number} de secondes} "
      & "other {{duration_s, number} secondes}})");
   P ("label.diagnostics.check_result_label",
      "{name} : {status, select, passed_check {réussie} failed_check {en "
      & "échec} warning_check {avertissements} skipped_check {ignorée} "
      & "pending_check {en attente} other {en cours}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {réussie} failed_check {en échec} "
      & "warning_check {avertissements} skipped_check {ignorée} pending_check "
      & "{en attente} other {en cours}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {valeur attendue "
      & "pour {subject}} expected_unit {unité attendue pour {subject}} "
      & "invalid_range {plage non valide pour {subject}} end_before_start {fin "
      & "de plage antérieure au début pour {subject}} unknown_field {champ "
      & "inconnu pour {subject}} unsafe_redacted_value {valeur non sûre "
      & "masquée pour {subject}} unsupported_syntax {syntaxe non prise en "
      & "charge pour {subject}} other {explication du diagnostic pour "
      & "{subject}}} ; utilisez {suggestion}} other {{kind, select, "
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
      & "position {position, number}}} ; utilisez {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {info dans {path} "
      & ": {message}} notice_severity {remarque dans {path} : {message}} "
      & "warning_severity {avertissement dans {path} : {message}} "
      & "error_severity {erreur dans {path} : {message}} critical_severity "
      & "{critique dans {path} : {message}} other {bloquant dans {path} : "
      & "{message}}}} other {{severity, select, info_severity {info dans "
      & "{path}, ligne {line, number} : {message}} notice_severity {remarque "
      & "dans {path}, ligne {line, number} : {message}} warning_severity "
      & "{avertissement dans {path}, ligne {line, number} : {message}} "
      & "error_severity {erreur dans {path}, ligne {line, number} : {message}} "
      & "critical_severity {critique dans {path}, ligne {line, number} : "
      & "{message}} other {bloquant dans {path}, ligne {line, number} : "
      & "{message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {échec dans {path}} other {{column, plural, =0 "
      & "{échec dans {path}, ligne {line, number}} other {échec dans {path}, "
      & "ligne {line, number}, colonne {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info dans {field_name} : {message}} "
      & "notice_severity {remarque dans {field_name} : {message}} "
      & "warning_severity {avertissement dans {field_name} : {message}} "
      & "error_severity {erreur dans {field_name} : {message}} "
      & "critical_severity {critique dans {field_name} : {message}} other "
      & "{bloquant dans {field_name} : {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {premier échec dans {check_name} : {path}} other "
      & "{premier échec dans {check_name} : {path}, ligne {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{aucun problème} other {{notices, plural, one {{notices, number} "
      & "remarque} many {{notices, number} de remarques} other {{notices, "
      & "number} remarques}}}}} other {{notices, plural, =0 {{warnings, plural, "
      & "one {{warnings, number} avertissement} many {{warnings, number} "
      & "d’avertissements} other {{warnings, number} avertissements}}} other "
      & "{{warnings, plural, one {{warnings, number} avertissement} many "
      & "{{warnings, number} d’avertissements} other {{warnings, number} "
      & "avertissements}}, {notices, plural, one {{notices, number} remarque} "
      & "many {{notices, number} de remarques} other {{notices, number} "
      & "remarques}}}}}}} other {{warnings, plural, =0 {{notices, plural, =0 "
      & "{{errors, plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}}} other {{errors, "
      & "plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}}, {notices, plural, one "
      & "{{notices, number} remarque} many {{notices, number} de remarques} "
      & "other {{notices, number} remarques}}}}} other {{notices, plural, =0 "
      & "{{errors, plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}}, {warnings, plural, one "
      & "{{warnings, number} avertissement} many {{warnings, number} "
      & "d’avertissements} other {{warnings, number} avertissements}}} other "
      & "{{errors, plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}}, {warnings, plural, one "
      & "{{warnings, number} avertissement} many {{warnings, number} "
      & "d’avertissements} other {{warnings, number} avertissements}}, "
      & "{notices, plural, one {{notices, number} remarque} many {{notices, "
      & "number} de remarques} other {{notices, number} remarques}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, ligne "
      & "{line, number}} other {{path}, ligne {line, number}, colonne {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {syntaxe non prise "
      & "en charge (analyseur de tailles) : {error} ; utilisez B, kB, MB, GB, "
      & "KiB, MiB, GiB ou TiB} duration_parser {syntaxe non prise en charge "
      & "(analyseur de durées) : {error} ; utilisez ms, s, min, h, d, w, month "
      & "ou year} date_time_parser {syntaxe non prise en charge (analyseur de "
      & "dates et heures) : {error} ; utilisez une date ISO, un jour en langage "
      & "naturel ou une heure} color_parser {syntaxe non prise en charge "
      & "(analyseur de couleurs) : {error} ; utilisez hex, rgb(), hsl(), lab(), "
      & "lch() ou un nom de couleur} url_parser {syntaxe non prise en charge "
      & "(analyseur d’URL) : {error} ; utilisez schéma, hôte, chemin, "
      & "requête ou fragment} unit_parser {syntaxe non prise en charge "
      & "(analyseur d’unités) : {error} ; utilisez une unité prise en "
      & "charge par Humanize} recurrence_parser {syntaxe non prise en charge "
      & "(analyseur de récurrences) : {error} ; utilisez cron ou une "
      & "récurrence every/weekday} domain_label_parser {syntaxe non prise en "
      & "charge (analyseur de libellés de domaine) : {error} ; utilisez un "
      & "libellé de domaine Humanize déterministe} other {syntaxe non prise "
      & "en charge (analyseur) : {error} ; utilisez une forme de saisie prise "
      & "en charge}}} other {{family, select, byte_parser {syntaxe non prise en "
      & "charge (analyseur de tailles) : {error} à la position {position, "
      & "number} ; utilisez B, kB, MB, GB, KiB, MiB, GiB ou TiB} "
      & "duration_parser {syntaxe non prise en charge (analyseur de durées) : "
      & "{error} à la position {position, number} ; utilisez ms, s, min, h, d, "
      & "w, month ou year} date_time_parser {syntaxe non prise en charge "
      & "(analyseur de dates et heures) : {error} à la position {position, "
      & "number} ; utilisez une date ISO, un jour en langage naturel ou une "
      & "heure} color_parser {syntaxe non prise en charge (analyseur de "
      & "couleurs) : {error} à la position {position, number} ; utilisez hex, "
      & "rgb(), hsl(), lab(), lch() ou un nom de couleur} url_parser {syntaxe "
      & "non prise en charge (analyseur d’URL) : {error} à la position "
      & "{position, number} ; utilisez schéma, hôte, chemin, requête ou "
      & "fragment} unit_parser {syntaxe non prise en charge (analyseur "
      & "d’unités) : {error} à la position {position, number} ; utilisez "
      & "une unité prise en charge par Humanize} recurrence_parser {syntaxe "
      & "non prise en charge (analyseur de récurrences) : {error} à la "
      & "position {position, number} ; utilisez cron ou une récurrence "
      & "every/weekday} domain_label_parser {syntaxe non prise en charge "
      & "(analyseur de libellés de domaine) : {error} à la position "
      & "{position, number} ; utilisez un libellé de domaine Humanize "
      & "déterministe} other {syntaxe non prise en charge (analyseur) : "
      & "{error} à la position {position, number} ; utilisez une forme de "
      & "saisie prise en charge}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {réussie} failed_check {en échec} "
      & "warning_check {avertissements} skipped_check {ignorée} pending_check "
      & "{en attente} other {en cours}}{notices, plural, =0 {, aucune remarque} "
      & "one {, {notices, number} remarque} many {, {notices, number} de "
      & "remarques} other {, {notices, number} remarques}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {nouvelle tentative 1 sur "
      & "1} other {nouvelle tentative {attempt, number} sur 1 : limite "
      & "dépassée}}} other {nouvelle tentative {attempt, number} sur {limit, "
      & "number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {remarque} "
      & "warning_severity {avertissement} error_severity {erreur} "
      & "critical_severity {critique} other {bloquant}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {diagnostics de compilation} test_source "
      & "{diagnostics de test} lint_source {diagnostics de lint} import_source "
      & "{diagnostics d’importation} validation_source {diagnostics de "
      & "validation} runtime_source {diagnostics d’exécution} "
      & "security_source {diagnostics de sécurité} other {diagnostics}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {{source, select, build_source {{count, number} "
      & "diagnostic de compilation} test_source {{count, number} diagnostic de "
      & "test} lint_source {{count, number} diagnostic de lint} import_source "
      & "{{count, number} diagnostic d’importation} validation_source "
      & "{{count, number} diagnostic de validation} runtime_source {{count, "
      & "number} diagnostic d’exécution} security_source {{count, number} "
      & "diagnostic de sécurité} other {{count, number} diagnostic}}} many "
      & "{{source, select, build_source {{count, number} de diagnostics de "
      & "compilation} test_source {{count, number} de diagnostics de test} "
      & "lint_source {{count, number} de diagnostics de lint} import_source "
      & "{{count, number} de diagnostics d’importation} validation_source "
      & "{{count, number} de diagnostics de validation} runtime_source {{count, "
      & "number} de diagnostics d’exécution} security_source {{count, "
      & "number} de diagnostics de sécurité} other {{count, number} de "
      & "diagnostics}}} other {{source, select, build_source {{count, number} "
      & "diagnostics de compilation} test_source {{count, number} diagnostics "
      & "de test} lint_source {{count, number} diagnostics de lint} "
      & "import_source {{count, number} diagnostics d’importation} "
      & "validation_source {{count, number} diagnostics de validation} "
      & "runtime_source {{count, number} diagnostics d’exécution} "
      & "security_source {{count, number} diagnostics de sécurité} other "
      & "{{count, number} diagnostics}}}}");
   P ("label.diagnostics.suggested_action_label", "étape suivante : {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nom de domaine} ipv4_host {adresse IPv4} "
      & "ipv6_host {adresse IPv6} localhost_host {hôte local} "
      & "private_network_host {adresse de réseau privé} other {hôte "
      & "inconnu}}");
   P ("label.events.all_day_label", "{name} (toute la journée)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {sans réponse} accepted {accepté} "
      & "declined {refusé} maybe {peut-être} other {en liste d’attente}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {aucun participant} one {{count, number} "
      & "participant} many {{count, number} de participants} other {{count, "
      & "number} participants}}");
   P ("label.events.canceled_label", "{name} : annulé");
   P ("label.events.check_in_label", "enregistrement pour {name}");
   P ("label.events.conference_link_label", "lien de visioconférence de {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {aucun événement} one {{count, number} "
      & "événement} many {{count, number} d’événements} other {{count, "
      & "number} événements}}");
   P ("label.events.event_label",
      "{name} : {state, select, scheduled_event {événement planifié} "
      & "tentative_event {événement provisoire} in_progress_event "
      & "{événement en cours} completed_event {événement terminé} "
      & "canceled_event {événement annulé} other {événement reporté}}");
   P ("label.events.event_location_label", "{name} à {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {événement planifié} "
      & "tentative_event {événement provisoire} in_progress_event "
      & "{événement en cours} completed_event {événement terminé} "
      & "canceled_event {événement annulé} other {événement reporté}}");
   P ("label.events.event_time_label", "{name} : {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {événement public} private_event "
      & "{événement privé} busy_event {occupé} other {disponible}}");
   P ("label.events.organizer_label", "organisé par {name}");
   P ("label.events.rsvp_label",
      "réponse : {state, select, not_responded {en attente} accepted "
      & "{acceptée} declined {refusée} maybe {peut-être} other {liste "
      & "d’attente}}");
   P ("label.events.reminder_label", "rappel : {time_text}");
   P ("label.events.rescheduled_label", "{name} reprogrammé : {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} caractère} many {{used, number} de "
      & "caractères} other {{used, number} caractères}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {aucune limite de caractères} one {{limit, number} "
      & "caractère maximum} many {{limit, number} de caractères maximum} "
      & "other {{limit, number} caractères maximum}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} caractère} "
      & "many {{used, number} de caractères} other {{used, number} "
      & "caractères}}} other {{used, number} sur {limit, plural, one {{limit, "
      & "number} caractère} many {{limit, number} de caractères} other "
      & "{{limit, number} caractères}}}}");
   P ("label.forms.field_label",
      "{name} : {required, select, false {champ facultatif} other {champ "
      & "obligatoire}}");
   P ("label.forms.field_state_label",
      "{name} : {state, select, valid_input {valide} invalid_input {non "
      & "valide} required_input {obligatoire} optional_input {facultatif} "
      & "disabled_input {désactivé} other {en lecture seule}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {aucun problème dans le "
      & "formulaire} other {{warnings, plural, one {{warnings, number} "
      & "avertissement} many {{warnings, number} d’avertissements} other "
      & "{{warnings, number} avertissements}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}}} other {{errors, "
      & "plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}}, {warnings, plural, one "
      & "{{warnings, number} avertissement} many {{warnings, number} "
      & "d’avertissements} other {{warnings, number} avertissements}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {non modifié} editing_form "
      & "{modification en cours} dirty_form {modifications non enregistrées} "
      & "saving_form {enregistrement en cours} saved_form {enregistré} "
      & "submitted_form {envoyé} other {échec de l’envoi}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {saisie valide} invalid_input {saisie non "
      & "valide} required_input {saisie obligatoire} optional_input {saisie "
      & "facultative} disabled_input {saisie désactivée} other {saisie en "
      & "lecture seule}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {non modifié} editing_form "
      & "{modification en cours} dirty_form {modifications non enregistrées} "
      & "saving_form {enregistrement du formulaire} saved_form {formulaire "
      & "enregistré} submitted_form {formulaire envoyé} other {{errors, "
      & "plural, =0 {échec de l’envoi} other {échec de l’envoi ({errors, "
      & "plural, one {{errors, number} erreur} many {{errors, number} "
      & "d’erreurs} other {{errors, number} erreurs}})}}}}");
end Labels_1;
