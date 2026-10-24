separate (Humanize.Catalogs.Phrase_Data.Locale_De)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: aktives Konto} invited_account "
      & "{{name}: eingeladenes Konto} locked_account {{name}: gesperrtes Konto} "
      & "suspended_account {{name}: suspendiertes Konto} deleted_account "
      & "{{name}: gelöschtes Konto} other {{name}: Kontostatus unbekannt}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktives Konto} invited_account "
      & "{eingeladenes Konto} locked_account {gesperrtes Konto} "
      & "suspended_account {suspendiertes Konto} deleted_account {gelöschtes "
      & "Konto} other {Kontostatus unbekannt}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {vertrauenswürdiges Gerät} "
      & "untrusted_device {nicht vertrauenswürdiges Gerät} new_device {neues "
      & "Gerät} other {blockiertes Gerät}}");
   P ("label.accounts.last_active_label", "{name}, zuletzt aktiv {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: Anmeldung fehlgeschlagen} other "
      & "{{name}: Anmeldung erfolgreich}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA aktiviert} mfa_disabled {MFA "
      & "deaktiviert} mfa_required {MFA erforderlich} other {MFA-Zurücksetzung "
      & "erforderlich}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: aktive Sitzung} "
      & "expired_session {{name}: Sitzung abgelaufen} revoked_session {{name}: "
      & "Sitzung widerrufen} idle_session {{name}: inaktive Sitzung} other "
      & "{{name}: Sitzungsstatus unbekannt}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktive Sitzung} expired_session "
      & "{Sitzung abgelaufen} revoked_session {Sitzung widerrufen} idle_session "
      & "{inaktive Sitzung} other {Sitzungsstatus unbekannt}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {keine Anhänge} one {1 Anhang} other {{count, "
      & "number} Anhänge}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 Anhang} other {{name}: {count, number} "
      & "Anhänge}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {Dateianhang} image_attachment "
      & "{Bildanhang} video_attachment {Videoanhang} audio_attachment "
      & "{Audioanhang} document_attachment {Dokumentanhang} archive_attachment "
      & "{Archivanhang} other {Linkanhang}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {Datei} image_attachment {Bild} "
      & "video_attachment {Video} audio_attachment {Audio} document_attachment "
      & "{Dokument} archive_attachment {Archiv} other {Link}} {state, select, "
      & "pending_attachment {ausstehend} uploading_attachment {wird "
      & "hochgeladen} uploaded_attachment {hochgeladen} failed_attachment "
      & "{fehlgeschlagen} removed_attachment {entfernt} other {blockiert}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {Anhang ausstehend} "
      & "uploading_attachment {Anhang wird hochgeladen} uploaded_attachment "
      & "{Anhang hochgeladen} failed_attachment {Anhang fehlgeschlagen} "
      & "removed_attachment {Anhang entfernt} other {Anhang blockiert}}");
   P ("label.attachments.download_label", "{name} herunterladen");
   P ("label.attachments.expiring_link_label", "Link für {name} läuft {time_text} ab");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "Vorschau: {name}");
   P ("label.attachments.remove_label", "{name} entfernen");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: nicht gescannt} scanning {{name}: "
      & "wird gescannt} safe {{name}: Scan unbedenklich} suspicious {{name}: "
      & "Scan verdächtig} other {{name}: Scan infiziert}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nicht gescannt} scanning {wird gescannt} "
      & "safe {Scan unbedenklich} suspicious {Scan verdächtig} other {Scan "
      & "infiziert}}");
   P ("label.attachments.upload_error_label", "Hochladen von {name} fehlgeschlagen: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {Badge} new_badge {neues Badge} "
      & "updated_badge {aktualisiertes Badge} deprecated_badge {veraltetes "
      & "Badge} selected_badge {ausgewähltes Badge} disabled_badge "
      & "{deaktiviertes Badge} other {schließbares Badge}} ({tone, select, "
      & "neutral_tone {neutral} info_tone {Info} success_tone {Erfolg} "
      & "warning_tone {Warnung} danger_tone {Gefahr} other {gedämpft}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {Badge mit niedriger Priorität} "
      & "medium_priority {Badge mit mittlerer Priorität} high_priority {Badge "
      & "mit hoher Priorität} other {Badge mit kritischer Priorität}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {Standard-Badge} new_badge {neues Badge} "
      & "updated_badge {aktualisiertes Badge} deprecated_badge {veraltetes "
      & "Badge} selected_badge {ausgewähltes Badge} disabled_badge "
      & "{deaktiviertes Badge} other {schließbares Badge}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutrales Badge} info_tone {Info-Badge} "
      & "success_tone {Erfolgs-Badge} warning_tone {Warnungs-Badge} danger_tone "
      & "{Gefahren-Badge} other {gedämpftes Badge}}");
   P ("label.badges.chip_label",
      "{selected, select, false {Chip {name}} other {Chip {name}, "
      & "ausgewählt}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: keine} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: veraltet");
   P ("label.badges.dismiss_label", "{name} schließen");
   P ("label.badges.new_label", "{name}: neu");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {keine ausgeblendeten Badges} one {+1 "
      & "weiteres Badge} other {+{hidden_count, number} weitere Badges}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: niedrige Priorität} "
      & "medium_priority {{name}: mittlere Priorität} high_priority {{name}: "
      & "hohe Priorität} other {{name}: kritische Priorität}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, Status: neutral} info_tone "
      & "{{name}, Status: Info} success_tone {{name}, Status: Erfolg} "
      & "warning_tone {{name}, Status: Warnung} danger_tone {{name}, Status: "
      & "Gefahr} other {{name}, Status: gedämpft}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {keine Tags} one {1 Tag} other {{count, number} "
      & "Tags}}");
   P ("label.badges.tag_label", "Tag {name}");
   P ("label.badges.updated_label", "{name}: aktualisiert");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {Artefakt hochgeladen} "
      & "artifact_missing {Artefakt fehlt} artifact_expired {Artefakt "
      & "abgelaufen} other {Artefakt verifiziert}}");
   P ("label.builds.benchmark_label", "Benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: Build in Warteschlange} "
      & "build_running {{name}: Build läuft} build_passed {{name}: Build "
      & "erfolgreich} build_failed {{name}: Build fehlgeschlagen} "
      & "snapshot_build {{name}: Snapshot-Build} other {{name}: Release-Build}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {Build in Warteschlange} build_running "
      & "{Build läuft} build_passed {Build erfolgreich} build_failed {Build "
      & "fehlgeschlagen} snapshot_build {Snapshot-Build} other {Release-Build}}");
   P ("label.builds.coverage_label", "Testabdeckung {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {Release-Gate bestanden} gate_failed "
      & "{Release-Gate nicht bestanden} gate_warning {Release-Gate mit Warnung} "
      & "other {Release-Gate blockiert}}");
   P ("label.builds.test_count_label",
      "{count, plural, =0 {keine Tests} one {1 Test} other {{count, number} "
      & "Tests}} {state, select, passed_test {bestanden} failed_test "
      & "{fehlgeschlagen} skipped_test {übersprungen} flaky_test {instabil} "
      & "other {erwartungsgemäß fehlgeschlagen}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {bestanden} failed_test {fehlgeschlagen} "
      & "skipped_test {übersprungen} flaky_test {instabil} other "
      & "{erwartungsgemäß fehlgeschlagen}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "unverändert, deaktiviert} other {{field_name} von deaktiviert auf "
      & "aktiviert geändert}}} other {{new_value, select, false {{field_name} "
      & "von aktiviert auf deaktiviert geändert} other {{field_name} "
      & "unverändert, aktiviert}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {hinzugefügt} removed_change {entfernt} "
      & "modified_change {geändert} renamed_change {umbenannt} "
      & "unchanged_change {unverändert} metadata_change {Metadaten geändert} "
      & "moved_change {verschoben} conflict_change {Konflikt} other {unbekannte "
      & "Änderung}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informative Änderung} "
      & "minor_change {kleine Änderung} major_change {größere Änderung} "
      & "other {inkompatible Änderung}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} unverändert} "
      & "other {{unchanged, plural, =0 {{field_name} geändert: {added, number} "
      & "hinzugefügt} other {{field_name} geändert: {added, number} "
      & "hinzugefügt, {unchanged, number} unverändert}}}}} other {{added, "
      & "plural, =0 {{unchanged, plural, =0 {{field_name} geändert: {removed, "
      & "number} entfernt} other {{field_name} geändert: {removed, number} "
      & "entfernt, {unchanged, number} unverändert}}} other {{unchanged, "
      & "plural, =0 {{field_name} geändert: {added, number} hinzugefügt, "
      & "{removed, number} entfernt} other {{field_name} geändert: {added, "
      & "number} hinzugefügt, {removed, number} entfernt, {unchanged, number} "
      & "unverändert}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {keine Konflikte} one {1 Konflikt} other {{count, "
      & "number} Konflikte}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} von {old_label} auf {new_label} "
      & "verschoben (später)} other {{field_name} von {old_label} auf "
      & "{new_label} vorgezogen}}");
   P ("label.changes.duration_field_change_label", "{field_name} von {old_label} auf {new_label} geändert");
   P ("label.changes.field_change_label", "{field_name} von {old_value} auf {new_value} geändert");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} hinzugefügt} removed_change "
      & "{{name} entfernt} modified_change {{name} geändert} renamed_change "
      & "{{name} umbenannt} unchanged_change {{name} unverändert} "
      & "metadata_change {{name}: Metadaten geändert} moved_change {{name} "
      & "verschoben} conflict_change {{name}: Konflikt} other {{name}: "
      & "unbekannte Änderung}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {nur Metadaten geändert} one {nur 1 Metadatenfeld "
      & "geändert} other {nur {count, number} Metadatenfelder geändert}}");
   P ("label.changes.move_label", "{name} von {from} nach {to} verschoben");
   P ("label.changes.no_changes_label", "keine Änderungen");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {keine "
      & "Zeilenänderungen} one {1 Zeile hinzugefügt} other {{lines_added, "
      & "number} Zeilen hinzugefügt}}} one {{lines_added, plural, =0 {1 Zeile "
      & "entfernt} one {1 Zeile hinzugefügt, 1 Zeile entfernt} other "
      & "{{lines_added, number} Zeilen hinzugefügt, 1 Zeile entfernt}}} other "
      & "{{lines_added, plural, =0 {{lines_removed, number} Zeilen entfernt} "
      & "one {1 Zeile hinzugefügt, {lines_removed, number} Zeilen entfernt} "
      & "other {{lines_added, number} Zeilen hinzugefügt, {lines_removed, "
      & "number} Zeilen entfernt}}}}");
   P ("label.changes.rename_label", "umbenannt von {old_name} in {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} hat einen Kommentarentwurf "
      & "erstellt} published_comment {{author} hat kommentiert} edited_comment "
      & "{{author} hat einen Kommentar bearbeitet} deleted_comment {{author} "
      & "hat einen Kommentar gelöscht} resolved_comment {{author} hat einen "
      & "Kommentar als gelöst markiert} unresolved_comment {{author} hat einen "
      & "Kommentar wieder geöffnet} pinned_comment {{author} hat einen "
      & "Kommentar angeheftet} other {{author} hat einen Kommentar "
      & "ausgeblendet}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {keine Kommentare} one {1 Kommentar} other {{count, "
      & "number} Kommentare}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: Kommentarentwurf} "
      & "published_comment {{author}: veröffentlichter Kommentar} "
      & "edited_comment {{author}: bearbeiteter Kommentar} deleted_comment "
      & "{{author}: gelöschter Kommentar} resolved_comment {{author}: "
      & "gelöster Kommentar} unresolved_comment {{author}: ungelöster "
      & "Kommentar} pinned_comment {{author}: angehefteter Kommentar} other "
      & "{{author}: ausgeblendeter Kommentar}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {Kommentarentwurf} published_comment "
      & "{veröffentlichter Kommentar} edited_comment {bearbeiteter Kommentar} "
      & "deleted_comment {gelöschter Kommentar} resolved_comment {gelöster "
      & "Kommentar} unresolved_comment {ungelöster Kommentar} pinned_comment "
      & "{angehefteter Kommentar} other {ausgeblendeter Kommentar}}");
   P ("label.comments.deleted_label", "{author} hat einen Kommentar gelöscht");
   P ("label.comments.edited_label", "bearbeitet {time_text}");
   P ("label.comments.hide_comment_label", "Kommentar ausblenden: {reason}");
   P ("label.comments.lock_thread_label", "Thread {name} sperren");
   P ("label.comments.mention_label", "{actor} hat {target} erwähnt");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {keine Teilnehmer} one {1 Teilnehmer} other "
      & "{{count, number} Teilnehmer}}");
   P ("label.comments.pin_label", "{name} anheften");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {Reaktion „Gefällt mir“} "
      & "dislike_reaction {Reaktion „Gefällt mir nicht“} heart_reaction "
      & "{Reaktion „Herz“} laugh_reaction {Reaktion „Lachen“} "
      & "confused_reaction {Reaktion „Verwirrt“} hooray_reaction {Reaktion "
      & "„Hurra“} rocket_reaction {Reaktion „Rakete“} other {Reaktion "
      & "„Augen“}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {keine Reaktionen} one {1 Reaktion} other {{count, "
      & "number} Reaktionen}} {kind, select, like_reaction {„Gefällt mir“} "
      & "dislike_reaction {„Gefällt mir nicht“} heart_reaction "
      & "{„Herz“} laugh_reaction {„Lachen“} confused_reaction "
      & "{„Verwirrt“} hooray_reaction {„Hurra“} rocket_reaction "
      & "{„Rakete“} other {„Augen“}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {keine Antworten} one {1 Antwort} other {{count, "
      & "number} Antworten}}");
   P ("label.comments.resolved_label", "{name} gelöst");
   P ("label.comments.subscribe_label", "{name} abonnieren");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {keine Threads} one {1 Thread} other {{count, "
      & "number} Threads}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {offener Thread} resolved_thread "
      & "{gelöster Thread} locked_thread {gesperrter Thread} other "
      & "{archivierter Thread}}{count, plural, =0 {} one {, 1 Kommentar} other "
      & "{, {count, number} Kommentare}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {offener Thread} resolved_thread "
      & "{gelöster Thread} locked_thread {gesperrter Thread} other "
      & "{archivierter Thread}}");
   P ("label.comments.unpin_label", "Anheften von {name} aufheben");
   P ("label.comments.unsubscribe_label", "{name} abbestellen");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {verbessert} regressed "
      & "{verschlechtert} unchanged {unverändert} within_tolerance {innerhalb "
      & "der Toleranz} outside_tolerance {außerhalb der Toleranz} new_value "
      & "{neu} removed_value {entfernt} other {Basiswert nicht verfügbar}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {verbessert} regressed {verschlechtert} "
      & "unchanged {unverändert} within_tolerance {innerhalb der Toleranz} "
      & "outside_tolerance {außerhalb der Toleranz} new_value {neu} "
      & "removed_value {entfernt} other {Basiswert nicht verfügbar}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {um {difference_text} verbessert} "
      & "regressed {um {difference_text} verschlechtert} unchanged "
      & "{unverändert ({difference_text})} within_tolerance {innerhalb der "
      & "Toleranz ({difference_text})} outside_tolerance {außerhalb der "
      & "Toleranz ({difference_text})} new_value {neu ({difference_text})} "
      & "removed_value {entfernt ({difference_text})} other {Basiswert nicht "
      & "verfügbar ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {um {difference_text} verbessert} "
      & "regressed {um {difference_text} verschlechtert} unchanged "
      & "{unverändert ({difference_text})} within_tolerance {innerhalb der "
      & "Toleranz ({difference_text})} outside_tolerance {außerhalb der "
      & "Toleranz ({difference_text})} new_value {neu ({difference_text})} "
      & "removed_value {entfernt ({difference_text})} other {Basiswert nicht "
      & "verfügbar ({difference_text})}}, Toleranz {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ungültige Zeile} duplicate_record "
      & "{doppelter Datensatz} missing_column {fehlende Spalte} unknown_field "
      & "{unbekanntes Feld} schema_mismatch {Schemaabweichung} other "
      & "{übersprungener Datensatz}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {Probelauf erfolgreich} dry_run_failed "
      & "{Probelauf fehlgeschlagen} import_valid {Import gültig} "
      & "import_invalid {Import ungültig} other {Teilimport}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {Probelauf erfolgreich} "
      & "dry_run_failed {Probelauf fehlgeschlagen} import_valid {Import "
      & "gültig} import_invalid {Import ungültig} other {Teilimport}}: "
      & "{accepted, number} übernommen, {rejected, number} abgelehnt");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {keine ungültigen "
      & "Zeilen} one {1 ungültige Zeile} other {{count, number} ungültige "
      & "Zeilen}}} duplicate_record {{count, plural, =0 {keine doppelten "
      & "Datensätze} one {1 doppelter Datensatz} other {{count, number} "
      & "doppelte Datensätze}}} missing_column {{count, plural, =0 {keine "
      & "fehlenden Spalten} one {1 fehlende Spalte} other {{count, number} "
      & "fehlende Spalten}}} unknown_field {{count, plural, =0 {keine "
      & "unbekannten Felder} one {1 unbekanntes Feld} other {{count, number} "
      & "unbekannte Felder}}} schema_mismatch {{count, plural, =0 {keine "
      & "Schemaabweichungen} one {1 Schemaabweichung} other {{count, number} "
      & "Schemaabweichungen}}} other {{count, plural, =0 {keine übersprungenen "
      & "Datensätze} one {1 übersprungener Datensatz} other {{count, number} "
      & "übersprungene Datensätze}}}}");
   P ("label.data_quality.row_issue_label",
      "Zeile {row, number}: {issue, select, invalid_row {ungültig} "
      & "duplicate_record {doppelter Datensatz} missing_column {fehlende "
      & "Spalte} unknown_field {unbekanntes Feld} schema_mismatch "
      & "{Schemaabweichung} other {übersprungen}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {ungültige Zeile} "
      & "duplicate_record {doppelter Datensatz} missing_column {fehlende "
      & "Spalte} unknown_field {unbekanntes Feld} schema_mismatch "
      & "{Schemaabweichung} other {übersprungener Datensatz}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {Artefakt bereit} artifact_uploaded "
      & "{Artefakt hochgeladen} artifact_signed {Artefakt signiert} "
      & "artifact_missing {Artefakt fehlt} other {Artefakt abgelaufen}}");
   P ("label.deployments.deployment_label",
      "{name} nach {environment}: {state, select, queued_deployment "
      & "{Deployment eingereiht} deploying {wird bereitgestellt} deployed "
      & "{bereitgestellt} failed_deployment {Deployment fehlgeschlagen} "
      & "rolled_back {zurückgesetzt} blocked_deployment {Deployment blockiert} "
      & "other {Deployment abgebrochen}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {Deployment eingereiht} deploying "
      & "{wird bereitgestellt} deployed {bereitgestellt} failed_deployment "
      & "{Deployment fehlgeschlagen} rolled_back {zurückgesetzt} "
      & "blocked_deployment {Deployment blockiert} other {Deployment "
      & "abgebrochen}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {Umgebung fehlerfrei} "
      & "drifting_environment {Umgebung weicht ab} locked_environment {Umgebung "
      & "gesperrt} maintenance_environment {Umgebung in Wartung} other "
      & "{Umgebungsstatus unbekannt}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {keine Migration} migration_pending "
      & "{Migration ausstehend} migrating {Migration läuft} migration_complete "
      & "{Migration abgeschlossen} other {Migration fehlgeschlagen}}");
   P ("label.deployments.promotion_label", "{name} von {from_environment} nach {to_environment} hochgestuft");
   P ("label.deployments.rollback_label", "{name}: Rollback auf {target}");
   P ("label.deployments.rollout_label", "{name}: Rollout {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {keine betroffenen Elemente} one {1 betroffenes "
      & "Element} other {{count, number} betroffene Elemente}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {bestanden} failed_check "
      & "{fehlgeschlagen} warning_check {Warnungen} skipped_check "
      & "{übersprungen} pending_check {ausstehend} other {läuft}} "
      & "({duration_s, plural, one {1 Sekunde} other {{duration_s, number} "
      & "Sekunden}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {bestanden} failed_check "
      & "{fehlgeschlagen} warning_check {Warnungen} skipped_check "
      & "{übersprungen} pending_check {ausstehend} other {läuft}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {bestanden} failed_check "
      & "{fehlgeschlagen} warning_check {Warnungen} skipped_check "
      & "{übersprungen} pending_check {ausstehend} other {läuft}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{subject}} other {{subject}, Position "
      & "{position, number}}}: {kind, select, expected_value {Wert erwartet} "
      & "expected_unit {Einheit erwartet} invalid_range {ungültiger Bereich} "
      & "end_before_start {Bereichsende liegt vor dem Anfang} unknown_field "
      & "{unbekanntes Feld} unsafe_redacted_value {unsicherer Wert wurde "
      & "geschwärzt} unsupported_syntax {nicht unterstützte Syntax} other "
      & "{Diagnosehinweis}}; Vorschlag: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {Info} notice_severity {Hinweis} "
      & "warning_severity {Warnung} error_severity {Fehler} critical_severity "
      & "{kritischer Fehler} other {blockierender Fehler}} in {line, plural, =0 "
      & "{{path}} other {{path}, Zeile {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "fehlgeschlagen in {line, plural, =0 {{path}} other {{column, plural, "
      & "=0 {{path}, Zeile {line, number}} other {{path}, Zeile {line, number}, "
      & "Spalte {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {Info} notice_severity {Hinweis} "
      & "warning_severity {Warnung} error_severity {Fehler} critical_severity "
      & "{kritischer Fehler} other {blockierender Fehler}} im Feld "
      & "{field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "erster Fehlschlag in {check_name} bei {line, plural, =0 {{path}} other "
      & "{{path}, Zeile {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 "
      & "{keine Probleme} one {1 Fehler} other {{errors, number} Fehler}}} one "
      & "{{errors, plural, =0 {1 Hinweis} one {1 Fehler, 1 Hinweis} other "
      & "{{errors, number} Fehler, 1 Hinweis}}} other {{errors, plural, =0 "
      & "{{notices, number} Hinweise} one {1 Fehler, {notices, number} "
      & "Hinweise} other {{errors, number} Fehler, {notices, number} "
      & "Hinweise}}}}} one {{notices, plural, =0 {{errors, plural, =0 {1 "
      & "Warnung} one {1 Fehler, 1 Warnung} other {{errors, number} Fehler, 1 "
      & "Warnung}}} one {{errors, plural, =0 {1 Warnung, 1 Hinweis} one {1 "
      & "Fehler, 1 Warnung, 1 Hinweis} other {{errors, number} Fehler, 1 "
      & "Warnung, 1 Hinweis}}} other {{errors, plural, =0 {1 Warnung, {notices, "
      & "number} Hinweise} one {1 Fehler, 1 Warnung, {notices, number} "
      & "Hinweise} other {{errors, number} Fehler, 1 Warnung, {notices, number} "
      & "Hinweise}}}}} other {{notices, plural, =0 {{errors, plural, =0 "
      & "{{warnings, number} Warnungen} one {1 Fehler, {warnings, number} "
      & "Warnungen} other {{errors, number} Fehler, {warnings, number} "
      & "Warnungen}}} one {{errors, plural, =0 {{warnings, number} Warnungen, 1 "
      & "Hinweis} one {1 Fehler, {warnings, number} Warnungen, 1 Hinweis} other "
      & "{{errors, number} Fehler, {warnings, number} Warnungen, 1 Hinweis}}} "
      & "other {{errors, plural, =0 {{warnings, number} Warnungen, {notices, "
      & "number} Hinweise} one {1 Fehler, {warnings, number} Warnungen, "
      & "{notices, number} Hinweise} other {{errors, number} Fehler, {warnings, "
      & "number} Warnungen, {notices, number} Hinweise}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, Zeile "
      & "{line, number}} other {{path}, Zeile {line, number}, Spalte {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {Byte-Parser} duration_parser "
      & "{Dauer-Parser} date_time_parser {Datum-Zeit-Parser} color_parser "
      & "{Farb-Parser} url_parser {URL-Parser} unit_parser {Einheiten-Parser} "
      & "recurrence_parser {Wiederholungs-Parser} domain_label_parser "
      & "{Domänenlabel-Parser} other {Parser}}: {position, plural, =0 {nicht "
      & "unterstützte Syntax {error}} other {nicht unterstützte Syntax "
      & "{error} an Position {position, number}}}; {family, select, byte_parser "
      & "{erlaubt: B, kB, MB, GB, KiB, MiB, GiB oder TiB} duration_parser "
      & "{erlaubt: ms, s, min, h, d, w, month oder year} date_time_parser "
      & "{erlaubt: ISO-Datum, natürliche Tagesangabe oder Uhrzeit} "
      & "color_parser {erlaubt: Hex, rgb(), hsl(), lab(), lch() oder Farbname} "
      & "url_parser {erlaubt: Schema, Host, Pfad, Query oder Fragment} "
      & "unit_parser {erlaubt: ein unterstütztes Humanize-Einheitenlabel} "
      & "recurrence_parser {erlaubt: Cron oder eine "
      & "every/weekday-Wiederholungsform} domain_label_parser {erlaubt: ein "
      & "deterministisches Humanize-Domänenlabel} other {erlaubt: eine "
      & "unterstützte Eingabeform}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {bestanden} failed_check "
      & "{fehlgeschlagen} warning_check {Warnungen} skipped_check "
      & "{übersprungen} pending_check {ausstehend} other {läuft}}, {notices, "
      & "plural, =0 {keine Hinweise} one {1 Hinweis} other {{notices, number} "
      & "Hinweise}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {Wiederholung 1 von 1} "
      & "other {Wiederholung {attempt, number} von 1 (Limit überschritten)}}} "
      & "other {Wiederholung {attempt, number} von {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {Info} notice_severity {Hinweis} "
      & "warning_severity {Warnung} error_severity {Fehler} critical_severity "
      & "{kritisch} other {blockierend}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {Build-Diagnose} test_source "
      & "{Test-Diagnose} lint_source {Lint-Diagnose} import_source "
      & "{Import-Diagnose} validation_source {Validierungsdiagnose} "
      & "runtime_source {Laufzeitdiagnose} security_source "
      & "{Sicherheitsdiagnose} other {Diagnose}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 {source, select, build_source {Build-Diagnose} "
      & "test_source {Test-Diagnose} lint_source {Lint-Diagnose} import_source "
      & "{Import-Diagnose} validation_source {Validierungsdiagnose} "
      & "runtime_source {Laufzeitdiagnose} security_source "
      & "{Sicherheitsdiagnose} other {Diagnose}}} other {{count, number} "
      & "{source, select, build_source {Build-Diagnosen} test_source "
      & "{Test-Diagnosen} lint_source {Lint-Diagnosen} import_source "
      & "{Import-Diagnosen} validation_source {Validierungsdiagnosen} "
      & "runtime_source {Laufzeitdiagnosen} security_source "
      & "{Sicherheitsdiagnosen} other {Diagnosen}}}}");
   P ("label.diagnostics.suggested_action_label", "nächster Schritt: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {Domain-Host} ipv4_host {IPv4-Adresse} "
      & "ipv6_host {IPv6-Adresse} localhost_host {lokaler Host} "
      & "private_network_host {Adresse im privaten Netz} other {unbekannter "
      & "Host}}");
   P ("label.events.all_day_label", "{name} (ganztägig)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {keine Antwort} accepted {zugesagt} "
      & "declined {abgesagt} maybe {vielleicht} other {auf der Warteliste}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {keine Teilnehmer} one {1 Teilnehmer} other "
      & "{{count, number} Teilnehmer}}");
   P ("label.events.canceled_label", "{name} abgesagt");
   P ("label.events.check_in_label", "bei {name} einchecken");
   P ("label.events.conference_link_label", "Konferenzlink für {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {keine Termine} one {1 Termin} other {{count, "
      & "number} Termine}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {geplant} tentative_event "
      & "{vorläufig} in_progress_event {läuft} completed_event "
      & "{abgeschlossen} canceled_event {abgesagt} other {verschoben}}");
   P ("label.events.event_location_label", "{name}, Ort: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {geplanter Termin} tentative_event "
      & "{vorläufiger Termin} in_progress_event {laufender Termin} "
      & "completed_event {abgeschlossener Termin} canceled_event {abgesagter "
      & "Termin} other {verschobener Termin}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {öffentlicher Termin} private_event "
      & "{privater Termin} busy_event {als beschäftigt angezeigt} other {als "
      & "frei angezeigt}}");
   P ("label.events.organizer_label", "organisiert von {name}");
   P ("label.events.rsvp_label",
      "Antwort: {state, select, not_responded {ausstehend} accepted "
      & "{zugesagt} declined {abgesagt} maybe {vielleicht} other {Warteliste}}");
   P ("label.events.reminder_label", "Erinnerung: {time_text}");
   P ("label.events.rescheduled_label", "{name} verschoben auf {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 Zeichen} other {{used, number} Zeichen}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {kein Zeichenlimit} one {max. 1 Zeichen} other "
      & "{max. {limit, number} Zeichen}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 Zeichen} other {{used, "
      & "number} Zeichen}}} one {{used, number} von 1 Zeichen} other {{used, "
      & "number} von {limit, number} Zeichen}}");
   P ("label.forms.field_label",
      "{required, select, false {{name} (optional)} other {{name} "
      & "(Pflichtfeld)}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {gültig} invalid_input "
      & "{ungültig} required_input {erforderlich} optional_input {optional} "
      & "disabled_input {deaktiviert} other {schreibgeschützt}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {keine Probleme im "
      & "Formular} one {1 Fehler} other {{errors, number} Fehler}}} one "
      & "{{errors, plural, =0 {1 Warnung} one {1 Fehler, 1 Warnung} other "
      & "{{errors, number} Fehler, 1 Warnung}}} other {{errors, plural, =0 "
      & "{{warnings, number} Warnungen} one {1 Fehler, {warnings, number} "
      & "Warnungen} other {{errors, number} Fehler, {warnings, number} "
      & "Warnungen}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {nicht begonnen} editing_form {wird "
      & "bearbeitet} dirty_form {ungespeicherte Änderungen} saving_form {wird "
      & "gespeichert} saved_form {gespeichert} submitted_form {gesendet} other "
      & "{Senden fehlgeschlagen}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {gültige Eingabe} invalid_input "
      & "{ungültige Eingabe} required_input {erforderliche Eingabe} "
      & "optional_input {optionale Eingabe} disabled_input {deaktivierte "
      & "Eingabe} other {schreibgeschützte Eingabe}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {nicht begonnen} editing_form {wird "
      & "bearbeitet} dirty_form {ungespeicherte Änderungen} saving_form "
      & "{Formular wird gespeichert} saved_form {Formular gespeichert} "
      & "submitted_form {Formular gesendet} other {{errors, plural, =0 {Senden "
      & "fehlgeschlagen} one {Senden mit 1 Fehler fehlgeschlagen} other {Senden "
      & "mit {errors, number} Fehlern fehlgeschlagen}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {keine ungespeicherten Änderungen} one {1 "
      & "ungespeicherte Änderung} other {{count, number} ungespeicherte "
      & "Änderungen}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {zugänglicher Name "
      & "fehlt} low_contrast {geringer Kontrast} skipped_heading_level "
      & "{Überschriftenebene übersprungen} missing_form_label "
      & "{Formularbeschriftung fehlt} invalid_aria {ungültiges ARIA} "
      & "keyboard_trap {Tastaturfalle} other {unbekanntes "
      & "Barrierefreiheitsproblem}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – Barrierefreiheit: {landmarks, plural, one {1 Landmark} "
      & "other {{landmarks, number} Landmarks}}, {headings, plural, one {1 "
      & "Überschrift} other {{headings, number} Überschriften}}, {issues, "
      & "plural, one {1 Problem} other {{issues, number} Probleme}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {zugänglichen Namen "
      & "hinzufügen} low_contrast {Textkontrast erhöhen} "
      & "skipped_heading_level {Überschriftenebenen fortlaufend verwenden} "
      & "missing_form_label {Beschriftung mit dem Formularelement verknüpfen} "
      & "invalid_aria {gültige ARIA-Rolle oder gültiges ARIA-Attribut "
      & "verwenden} keyboard_trap {sicherstellen, dass der Tastaturfokus die "
      & "Komponente verlassen kann} other {Barrierefreiheitsproblem prüfen}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {keine Barrierefreiheitsprobleme} one {1 "
      & "Barrierefreiheitsproblem} other {{issues, number} "
      & "Barrierefreiheitsprobleme}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-Attribut} class_attribute "
      & "{class-Attribut} data_attribute {data-Attribut} aria_attribute "
      & "{ARIA-Attribut} role_attribute {role-Attribut} link_attribute "
      & "{Link-Attribut} media_attribute {Medienattribut} form_attribute "
      & "{Formularattribut} boolean_attribute {boolesches Attribut} "
      & "event_attribute {Event-Handler-Attribut} other {unbekanntes Attribut}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {warnings, plural, =0 {{errors, plural, =0 {keine "
      & "Probleme} one {1 Fehler} other {{errors, number} Fehler}}} one "
      & "{{errors, plural, =0 {1 Warnung} one {1 Fehler, 1 Warnung} other "
      & "{{errors, number} Fehler, 1 Warnung}}} other {{errors, plural, =0 "
      & "{{warnings, number} Warnungen} one {1 Fehler, {warnings, number} "
      & "Warnungen} other {{errors, number} Fehler, {warnings, number} "
      & "Warnungen}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {Banner-Landmark} navigation_role "
      & "{Navigations-Landmark} main_role {Haupt-Landmark} complementary_role "
      & "{ergänzende Landmark} contentinfo_role {Inhaltsinfo-Landmark} "
      & "search_role {Such-Landmark} form_role {Formular-Landmark} region_role "
      & "{Bereichs-Landmark} dialog_role {Dialog} alert_role "
      & "{Alert-Live-Region} status_role {Status-Live-Region} other {unbekannte "
      & "Landmark}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {dringliche Aktualisierung} other "
      & "{höfliche Aktualisierung}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {Textinhalt} html_content {HTML-Inhalt} "
      & "json_content {JSON-Inhalt} xml_content {XML-Inhalt} image_content "
      & "{Bildinhalt} audio_content {Audioinhalt} video_content {Videoinhalt} "
      & "font_content {Schriftinhalt} archive_content {Archivinhalt} "
      & "binary_content {Binärinhalt} form_content {Formularinhalt} other "
      & "{unbekannter Inhalt}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {Dokument-Tag} metadata_tag "
      & "{Metadaten-Tag} section_tag {Abschnitts-Tag} text_tag {Text-Tag} "
      & "link_tag {Link-Tag} media_tag {Medien-Tag} form_tag {Formular-Tag} "
      & "table_tag {Tabellen-Tag} interactive_tag {interaktives Tag} "
      & "scripting_tag {Skript-Tag} other {unbekanntes Tag}}");
   P ("label.media.duration_label", "Dauer: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {Bild} video_media {Video} audio_media "
      & "{Audio} pdf_document {PDF-Dokument} text_document {Textdokument} "
      & "archive_media {Archiv} other {Medium}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {bereit} processing_media {wird "
      & "verarbeitet} transcoding_media {wird transkodiert} thumbnail_missing "
      & "{Vorschaubild nicht verfügbar} metadata_missing {Metadaten fehlen} "
      & "locked_document {Dokument gesperrt} other {nicht verfügbar}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {Bild} video_media {Video} "
      & "audio_media {Audio} pdf_document {PDF-Dokument} text_document "
      & "{Textdokument} archive_media {Archiv} other {Medium}}): {state, "
      & "select, ready_media {bereit} processing_media {wird verarbeitet} "
      & "transcoding_media {wird transkodiert} thumbnail_missing {Vorschaubild "
      & "nicht verfügbar} metadata_missing {Metadaten fehlen} locked_document "
      & "{Dokument gesperrt} other {nicht verfügbar}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {keine Seiten} one {1 Seite} other {{pages, number} "
      & "Seiten}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: Einspruch, {state, select, open_report {Meldung offen} "
      & "triaged_report {Meldung gesichtet} actioned_report {Maßnahme "
      & "ergriffen} dismissed_report {Meldung abgewiesen} appealed_report "
      & "{Meldung angefochten} other {Meldung geschlossen}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {keine Moderationsmaßnahme} flagged "
      & "{gekennzeichnet} hidden {vom Moderator ausgeblendet} restored "
      & "{wiederhergestellt} marked_spam {als Spam markiert} removed {entfernt} "
      & "other {eskaliert}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {keine Moderationsmaßnahme} "
      & "flagged {gekennzeichnet} hidden {vom Moderator ausgeblendet} restored "
      & "{wiederhergestellt} marked_spam {als Spam markiert} removed {entfernt} "
      & "other {eskaliert}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {Moderationswarteschlange "
      & "leer} other {{pending, number} zur Prüfung ausstehend}}} other "
      & "{{pending, number} zur Prüfung ausstehend, {escalated, number} "
      & "eskaliert}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {offene Meldung} triaged_report "
      & "{gesichtete Meldung} actioned_report {Maßnahme ergriffen} "
      & "dismissed_report {abgewiesene Meldung} appealed_report {angefochtene "
      & "Meldung} other {geschlossene Meldung}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {offene Meldung} triaged_report "
      & "{gesichtete Meldung} actioned_report {Maßnahme ergriffen} "
      & "dismissed_report {abgewiesene Meldung} appealed_report {angefochtene "
      & "Meldung} other {geschlossene Meldung}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {Prüfung ausstehend} approved "
      & "{genehmigt} rejected {abgelehnt} needs_changes {Änderungen "
      & "erforderlich} other {Prüfung eskaliert}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {Prüfung ausstehend} approved "
      & "{genehmigt} rejected {abgelehnt} needs_changes {Änderungen "
      & "erforderlich} other {Prüfung eskaliert}}");
   P ("label.navigation.back_label", "zurück zu {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {keine Brotkrümel} one {1 Brotkrümel} other "
      & "{{depth, number} Brotkrümel}}");
   P ("label.navigation.current_page_label", "aktuelle Seite: {name}");
   P ("label.navigation.external_link_label", "{name} (externer Link)");
   P ("label.navigation.first_label", "erste: {target}");
   P ("label.navigation.last_label", "letzte: {target}");
end Labels_1;
