separate (Humanize.Catalogs.Phrase_Data.Locale_Nl)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: actief account} "
      & "invited_account {{name}: uitgenodigd account} locked_account {{name}: "
      & "vergrendeld account} suspended_account {{name}: opgeschort account} "
      & "deleted_account {{name}: verwijderd account} other {{name}: "
      & "accountstatus onbekend}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {actief account} invited_account "
      & "{uitgenodigd account} locked_account {vergrendeld account} "
      & "suspended_account {opgeschort account} deleted_account {verwijderd "
      & "account} other {accountstatus onbekend}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {vertrouwd apparaat} untrusted_device "
      & "{niet-vertrouwd apparaat} new_device {nieuw apparaat} other "
      & "{geblokkeerd apparaat}}");
   P ("label.accounts.last_active_label", "{name}, laatst actief {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: aanmelding mislukt} other {{name}: "
      & "aanmelding gelukt}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA ingeschakeld} mfa_disabled {MFA "
      & "uitgeschakeld} mfa_required {MFA vereist} other {MFA opnieuw instellen "
      & "vereist}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: actieve sessie} "
      & "expired_session {{name}: sessie verlopen} revoked_session {{name}: "
      & "sessie ingetrokken} idle_session {{name}: inactieve sessie} other "
      & "{{name}: sessiestatus onbekend}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {actieve sessie} expired_session "
      & "{sessie verlopen} revoked_session {sessie ingetrokken} idle_session "
      & "{inactieve sessie} other {sessiestatus onbekend}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {geen bijlagen} one {1 bijlage} other {{count, "
      & "number} bijlagen}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 bijlage} other {{name}: {count, number} "
      & "bijlagen}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {bestandsbijlage} image_attachment "
      & "{afbeeldingsbijlage} video_attachment {videobijlage} audio_attachment "
      & "{audiobijlage} document_attachment {documentbijlage} "
      & "archive_attachment {archiefbijlage} other {linkbijlage}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {bestand} image_attachment "
      & "{afbeelding} video_attachment {video} audio_attachment {audio} "
      & "document_attachment {document} archive_attachment {archief} other "
      & "{link}} {state, select, pending_attachment {in afwachting} "
      & "uploading_attachment {wordt geüpload} uploaded_attachment {geüpload} "
      & "failed_attachment {mislukt} removed_attachment {verwijderd} other "
      & "{geblokkeerd}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {bijlage in afwachting} "
      & "uploading_attachment {bijlage wordt geüpload} uploaded_attachment "
      & "{bijlage geüpload} failed_attachment {bijlage mislukt} "
      & "removed_attachment {bijlage verwijderd} other {bijlage geblokkeerd}}");
   P ("label.attachments.download_label", "{name} downloaden");
   P ("label.attachments.expiring_link_label", "link naar {name} verloopt {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "voorbeeld: {name}");
   P ("label.attachments.remove_label", "{name} verwijderen");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: niet gescand} scanning {{name}: "
      & "wordt gescand} safe {{name}: scan veilig} suspicious {{name}: scan "
      & "verdacht} other {{name}: scan geïnfecteerd}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {niet gescand} scanning {wordt gescand} "
      & "safe {scan veilig} suspicious {scan verdacht} other {scan "
      & "geïnfecteerd}}");
   P ("label.attachments.upload_error_label", "uploaden van {name} mislukt: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {badge} new_badge {nieuwe badge} "
      & "updated_badge {bijgewerkte badge} deprecated_badge {verouderde badge} "
      & "selected_badge {geselecteerde badge} disabled_badge {uitgeschakelde "
      & "badge} other {sluitbare badge}} ({tone, select, neutral_tone "
      & "{neutraal} info_tone {info} success_tone {succes} warning_tone "
      & "{waarschuwing} danger_tone {gevaar} other {gedempt}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {badge met lage prioriteit} "
      & "medium_priority {badge met gemiddelde prioriteit} high_priority {badge "
      & "met hoge prioriteit} other {badge met kritieke prioriteit}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {standaardbadge} new_badge {nieuwe "
      & "badge} updated_badge {bijgewerkte badge} deprecated_badge {verouderde "
      & "badge} selected_badge {geselecteerde badge} disabled_badge "
      & "{uitgeschakelde badge} other {sluitbare badge}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutrale badge} info_tone {infobadge} "
      & "success_tone {succesbadge} warning_tone {waarschuwingsbadge} "
      & "danger_tone {gevarenbadge} other {gedempte badge}}");
   P ("label.badges.chip_label",
      "{selected, select, false {chip {name}} other {chip {name}, "
      & "geselecteerd}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: geen} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: verouderd");
   P ("label.badges.dismiss_label", "{name} sluiten");
   P ("label.badges.new_label", "{name}: nieuw");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {geen verborgen badges} one {+1 badge meer} "
      & "other {+{hidden_count, number} badges meer}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: lage prioriteit} "
      & "medium_priority {{name}: gemiddelde prioriteit} high_priority {{name}: "
      & "hoge prioriteit} other {{name}: kritieke prioriteit}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, status: neutraal} info_tone "
      & "{{name}, status: info} success_tone {{name}, status: succes} "
      & "warning_tone {{name}, status: waarschuwing} danger_tone {{name}, "
      & "status: gevaar} other {{name}, status: gedempt}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {geen tags} one {1 tag} other {{count, number} "
      & "tags}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: bijgewerkt");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefact geüpload} "
      & "artifact_missing {artefact ontbreekt} artifact_expired {artefact "
      & "verlopen} other {artefact geverifieerd}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: build in wachtrij} build_running "
      & "{{name}: build bezig} build_passed {{name}: build geslaagd} "
      & "build_failed {{name}: build mislukt} snapshot_build {{name}: "
      & "snapshotbuild} other {{name}: releasebuild}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {build in wachtrij} build_running {build "
      & "bezig} build_passed {build geslaagd} build_failed {build mislukt} "
      & "snapshot_build {snapshotbuild} other {releasebuild}}");
   P ("label.builds.coverage_label", "testdekking {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {releasegate geslaagd} gate_failed "
      & "{releasegate mislukt} gate_warning {releasegate met waarschuwing} "
      & "other {releasegate geblokkeerd}}");
   P ("label.builds.test_count_label",
      "{count, plural, =0 {geen tests} one {1 test} other {{count, number} "
      & "tests}} {state, select, passed_test {geslaagd} failed_test {mislukt} "
      & "skipped_test {overgeslagen} flaky_test {instabiel} other {mislukt "
      & "zoals verwacht}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {geslaagd} failed_test {mislukt} "
      & "skipped_test {overgeslagen} flaky_test {instabiel} other {verwachte "
      & "mislukking}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "ongewijzigd, uitgeschakeld} other {{field_name} gewijzigd van "
      & "uitgeschakeld naar ingeschakeld}}} other {{new_value, select, false "
      & "{{field_name} gewijzigd van ingeschakeld naar uitgeschakeld} other "
      & "{{field_name} ongewijzigd, ingeschakeld}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {toegevoegd} removed_change {verwijderd} "
      & "modified_change {gewijzigd} renamed_change {hernoemd} unchanged_change "
      & "{ongewijzigd} metadata_change {metadata gewijzigd} moved_change "
      & "{verplaatst} conflict_change {conflict} other {onbekende wijziging}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informatieve wijziging} "
      & "minor_change {kleine wijziging} major_change {grote wijziging} other "
      & "{incompatibele wijziging}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} ongewijzigd} "
      & "other {{unchanged, plural, =0 {{field_name} gewijzigd: {added, number} "
      & "toegevoegd} other {{field_name} gewijzigd: {added, number} toegevoegd, "
      & "{unchanged, number} ongewijzigd}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} gewijzigd: {removed, number} "
      & "verwijderd} other {{field_name} gewijzigd: {removed, number} "
      & "verwijderd, {unchanged, number} ongewijzigd}}} other {{unchanged, "
      & "plural, =0 {{field_name} gewijzigd: {added, number} toegevoegd, "
      & "{removed, number} verwijderd} other {{field_name} gewijzigd: {added, "
      & "number} toegevoegd, {removed, number} verwijderd, {unchanged, number} "
      & "ongewijzigd}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {geen conflicten} one {1 conflict} other {{count, "
      & "number} conflicten}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} uitgesteld van {old_label} naar "
      & "{new_label}} other {{field_name} vervroegd van {old_label} naar "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} gewijzigd van {old_label} naar {new_label}");
   P ("label.changes.field_change_label", "{field_name} gewijzigd van {old_value} naar {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} toegevoegd} removed_change {{name} "
      & "verwijderd} modified_change {{name} gewijzigd} renamed_change {{name} "
      & "hernoemd} unchanged_change {{name} ongewijzigd} metadata_change "
      & "{{name}: metadata gewijzigd} moved_change {{name} verplaatst} "
      & "conflict_change {{name}: conflict} other {{name}: onbekende "
      & "wijziging}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {alleen metadata gewijzigd} one {alleen 1 "
      & "metadataveld gewijzigd} other {alleen {count, number} metadatavelden "
      & "gewijzigd}}");
   P ("label.changes.move_label", "{name} verplaatst van {from} naar {to}");
   P ("label.changes.no_changes_label", "geen wijzigingen");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {geen "
      & "regelwijzigingen} one {1 regel toegevoegd} other {{lines_added, "
      & "number} regels toegevoegd}}} one {{lines_added, plural, =0 {1 regel "
      & "verwijderd} one {1 regel toegevoegd, 1 regel verwijderd} other "
      & "{{lines_added, number} regels toegevoegd, 1 regel verwijderd}}} other "
      & "{{lines_added, plural, =0 {{lines_removed, number} regels verwijderd} "
      & "one {1 regel toegevoegd, {lines_removed, number} regels verwijderd} "
      & "other {{lines_added, number} regels toegevoegd, {lines_removed, "
      & "number} regels verwijderd}}}}");
   P ("label.changes.rename_label", "hernoemd van {old_name} naar {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} heeft een conceptreactie "
      & "opgesteld} published_comment {{author} heeft gereageerd} "
      & "edited_comment {{author} heeft een reactie bewerkt} deleted_comment "
      & "{{author} heeft een reactie verwijderd} resolved_comment {{author} "
      & "heeft een reactie opgelost} unresolved_comment {{author} heeft een "
      & "reactie heropend} pinned_comment {{author} heeft een reactie "
      & "vastgezet} other {{author} heeft een reactie verborgen}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {geen reacties} one {1 reactie} other {{count, "
      & "number} reacties}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: conceptreactie} "
      & "published_comment {{author}: gepubliceerde reactie} edited_comment "
      & "{{author}: bewerkte reactie} deleted_comment {{author}: verwijderde "
      & "reactie} resolved_comment {{author}: opgeloste reactie} "
      & "unresolved_comment {{author}: onopgeloste reactie} pinned_comment "
      & "{{author}: vastgezette reactie} other {{author}: verborgen reactie}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {conceptreactie} published_comment "
      & "{gepubliceerde reactie} edited_comment {bewerkte reactie} "
      & "deleted_comment {verwijderde reactie} resolved_comment {opgeloste "
      & "reactie} unresolved_comment {onopgeloste reactie} pinned_comment "
      & "{vastgezette reactie} other {verborgen reactie}}");
   P ("label.comments.deleted_label", "{author} heeft een reactie verwijderd");
   P ("label.comments.edited_label", "bewerkt {time_text}");
   P ("label.comments.hide_comment_label", "reactie verbergen: {reason}");
   P ("label.comments.lock_thread_label", "discussie {name} vergrendelen");
   P ("label.comments.mention_label", "{actor} heeft {target} vermeld");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {geen deelnemers} one {1 deelnemer} other {{count, "
      & "number} deelnemers}}");
   P ("label.comments.pin_label", "{name} vastzetten");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reactie ‘vind ik leuk’} "
      & "dislike_reaction {reactie ‘vind ik niet leuk’} heart_reaction "
      & "{reactie ‘hart’} laugh_reaction {reactie ‘lachen’} "
      & "confused_reaction {reactie ‘verward’} hooray_reaction {reactie "
      & "‘hoera’} rocket_reaction {reactie ‘raket’} other {reactie "
      & "‘ogen’}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {geen reacties} one {1 reactie} other {{count, "
      & "number} reacties}} {kind, select, like_reaction {‘vind ik leuk’} "
      & "dislike_reaction {‘vind ik niet leuk’} heart_reaction {‘hart’} "
      & "laugh_reaction {‘lachen’} confused_reaction {‘verward’} "
      & "hooray_reaction {‘hoera’} rocket_reaction {‘raket’} other "
      & "{‘ogen’}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {geen antwoorden} one {1 antwoord} other {{count, "
      & "number} antwoorden}}");
   P ("label.comments.resolved_label", "{name} opgelost");
   P ("label.comments.subscribe_label", "abonneren op {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {geen discussies} one {1 discussie} other {{count, "
      & "number} discussies}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {open discussie} resolved_thread "
      & "{opgeloste discussie} locked_thread {vergrendelde discussie} other "
      & "{gearchiveerde discussie}}{count, plural, =0 {} one {, 1 reactie} "
      & "other {, {count, number} reacties}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {open discussie} resolved_thread "
      & "{opgeloste discussie} locked_thread {vergrendelde discussie} other "
      & "{gearchiveerde discussie}}");
   P ("label.comments.unpin_label", "{name} losmaken");
   P ("label.comments.unsubscribe_label", "afmelden voor {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {verbeterd} regressed {verslechterd} "
      & "unchanged {ongewijzigd} within_tolerance {binnen tolerantie} "
      & "outside_tolerance {buiten tolerantie} new_value {nieuw} removed_value "
      & "{verwijderd} other {basislijn niet beschikbaar}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {verbeterd} regressed {verslechterd} "
      & "unchanged {ongewijzigd} within_tolerance {binnen tolerantie} "
      & "outside_tolerance {buiten tolerantie} new_value {nieuw} removed_value "
      & "{verwijderd} other {basislijn niet beschikbaar}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {verbeterd met {difference_text}} "
      & "regressed {verslechterd met {difference_text}} unchanged {ongewijzigd "
      & "({difference_text})} within_tolerance {binnen tolerantie "
      & "({difference_text})} outside_tolerance {buiten tolerantie "
      & "({difference_text})} new_value {nieuw ({difference_text})} "
      & "removed_value {verwijderd ({difference_text})} other {basislijn niet "
      & "beschikbaar ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {verbeterd met {difference_text}} "
      & "regressed {verslechterd met {difference_text}} unchanged {ongewijzigd "
      & "({difference_text})} within_tolerance {binnen tolerantie "
      & "({difference_text})} outside_tolerance {buiten tolerantie "
      & "({difference_text})} new_value {nieuw ({difference_text})} "
      & "removed_value {verwijderd ({difference_text})} other {basislijn niet "
      & "beschikbaar ({difference_text})}}, tolerantie {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ongeldige rij} duplicate_record {dubbel "
      & "record} missing_column {ontbrekende kolom} unknown_field {onbekend "
      & "veld} schema_mismatch {schema komt niet overeen} other {overgeslagen "
      & "record}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {proefrun geslaagd} dry_run_failed "
      & "{proefrun mislukt} import_valid {import geldig} import_invalid {import "
      & "ongeldig} other {gedeeltelijke import}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {proefrun geslaagd} "
      & "dry_run_failed {proefrun mislukt} import_valid {import geldig} "
      & "import_invalid {import ongeldig} other {gedeeltelijke import}}: "
      & "{accepted, number} geaccepteerd, {rejected, number} geweigerd");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {geen ongeldige rijen} "
      & "one {1 ongeldige rij} other {{count, number} ongeldige rijen}}} "
      & "duplicate_record {{count, plural, =0 {geen dubbele records} one {1 "
      & "dubbel record} other {{count, number} dubbele records}}} "
      & "missing_column {{count, plural, =0 {geen ontbrekende kolommen} one {1 "
      & "ontbrekende kolom} other {{count, number} ontbrekende kolommen}}} "
      & "unknown_field {{count, plural, =0 {geen onbekende velden} one {1 "
      & "onbekend veld} other {{count, number} onbekende velden}}} "
      & "schema_mismatch {{count, plural, =0 {geen schemaverschillen} one {1 "
      & "schemaverschil} other {{count, number} schemaverschillen}}} other "
      & "{{count, plural, =0 {geen overgeslagen records} one {1 overgeslagen "
      & "record} other {{count, number} overgeslagen records}}}}");
   P ("label.data_quality.row_issue_label",
      "rij {row, number}: {issue, select, invalid_row {ongeldig} "
      & "duplicate_record {dubbel record} missing_column {ontbrekende kolom} "
      & "unknown_field {onbekend veld} schema_mismatch {schema komt niet "
      & "overeen} other {overgeslagen}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {ongeldige rij} "
      & "duplicate_record {dubbel record} missing_column {ontbrekende kolom} "
      & "unknown_field {onbekend veld} schema_mismatch {schema komt niet "
      & "overeen} other {overgeslagen record}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefact gereed} artifact_uploaded "
      & "{artefact geüpload} artifact_signed {artefact ondertekend} "
      & "artifact_missing {artefact ontbreekt} other {artefact verlopen}}");
   P ("label.deployments.deployment_label",
      "{name} naar {environment}: {state, select, queued_deployment "
      & "{deployment in wachtrij} deploying {wordt geïmplementeerd} deployed "
      & "{geïmplementeerd} failed_deployment {deployment mislukt} rolled_back "
      & "{teruggedraaid} blocked_deployment {deployment geblokkeerd} other "
      & "{deployment geannuleerd}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {deployment in wachtrij} deploying "
      & "{wordt geïmplementeerd} deployed {geïmplementeerd} failed_deployment "
      & "{deployment mislukt} rolled_back {teruggedraaid} blocked_deployment "
      & "{deployment geblokkeerd} other {deployment geannuleerd}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {omgeving gezond} "
      & "drifting_environment {omgeving wijkt af} locked_environment {omgeving "
      & "vergrendeld} maintenance_environment {omgeving in onderhoud} other "
      & "{omgevingsstatus onbekend}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {geen migratie} migration_pending "
      & "{migratie in afwachting} migrating {migratie bezig} migration_complete "
      & "{migratie voltooid} other {migratie mislukt}}");
   P ("label.deployments.promotion_label", "{name} gepromoot van {from_environment} naar {to_environment}");
   P ("label.deployments.rollback_label", "{name}: terugdraaien naar {target}");
   P ("label.deployments.rollout_label", "{name}: uitrol {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {geen getroffen items} one {1 getroffen item} other "
      & "{{count, number} getroffen items}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {geslaagd} failed_check "
      & "{mislukt} warning_check {waarschuwingen} skipped_check {overgeslagen} "
      & "pending_check {in afwachting} other {bezig}} ({duration_s, plural, one "
      & "{1 seconde} other {{duration_s, number} seconden}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {geslaagd} failed_check "
      & "{mislukt} warning_check {waarschuwingen} skipped_check {overgeslagen} "
      & "pending_check {in afwachting} other {bezig}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {geslaagd} failed_check {mislukt} "
      & "warning_check {waarschuwingen} skipped_check {overgeslagen} "
      & "pending_check {in afwachting} other {bezig}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{subject}} other {{subject}, positie {position, "
      & "number}}}: {kind, select, expected_value {waarde verwacht} "
      & "expected_unit {eenheid verwacht} invalid_range {ongeldig bereik} "
      & "end_before_start {einde van bereik ligt vóór begin} unknown_field "
      & "{onbekend veld} unsafe_redacted_value {onveilige waarde is verwijderd} "
      & "unsupported_syntax {niet-ondersteunde syntaxis} other {diagnostische "
      & "toelichting}}; suggestie: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {info} notice_severity {melding} "
      & "warning_severity {waarschuwing} error_severity {fout} "
      & "critical_severity {kritieke fout} other {blokkerende fout}} in {line, "
      & "plural, =0 {{path}} other {{path}, regel {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "mislukt in {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, regel {line, number}} other {{path}, regel {line, number}, "
      & "kolom {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info} notice_severity {melding} "
      & "warning_severity {waarschuwing} error_severity {fout} "
      & "critical_severity {kritieke fout} other {blokkerende fout}} in veld "
      & "{field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "eerste fout in {check_name} bij {line, plural, =0 {{path}} other "
      & "{{path}, regel {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 {geen "
      & "problemen} one {1 fout} other {{errors, number} fouten}}} one "
      & "{{errors, plural, =0 {1 melding} one {1 fout, 1 melding} other "
      & "{{errors, number} fouten, 1 melding}}} other {{errors, plural, =0 "
      & "{{notices, number} meldingen} one {1 fout, {notices, number} "
      & "meldingen} other {{errors, number} fouten, {notices, number} "
      & "meldingen}}}}} one {{notices, plural, =0 {{errors, plural, =0 {1 "
      & "waarschuwing} one {1 fout, 1 waarschuwing} other {{errors, number} "
      & "fouten, 1 waarschuwing}}} one {{errors, plural, =0 {1 waarschuwing, 1 "
      & "melding} one {1 fout, 1 waarschuwing, 1 melding} other {{errors, "
      & "number} fouten, 1 waarschuwing, 1 melding}}} other {{errors, plural, "
      & "=0 {1 waarschuwing, {notices, number} meldingen} one {1 fout, 1 "
      & "waarschuwing, {notices, number} meldingen} other {{errors, number} "
      & "fouten, 1 waarschuwing, {notices, number} meldingen}}}}} other "
      & "{{notices, plural, =0 {{errors, plural, =0 {{warnings, number} "
      & "waarschuwingen} one {1 fout, {warnings, number} waarschuwingen} other "
      & "{{errors, number} fouten, {warnings, number} waarschuwingen}}} one "
      & "{{errors, plural, =0 {{warnings, number} waarschuwingen, 1 melding} "
      & "one {1 fout, {warnings, number} waarschuwingen, 1 melding} other "
      & "{{errors, number} fouten, {warnings, number} waarschuwingen, 1 "
      & "melding}}} other {{errors, plural, =0 {{warnings, number} "
      & "waarschuwingen, {notices, number} meldingen} one {1 fout, {warnings, "
      & "number} waarschuwingen, {notices, number} meldingen} other {{errors, "
      & "number} fouten, {warnings, number} waarschuwingen, {notices, number} "
      & "meldingen}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, regel "
      & "{line, number}} other {{path}, regel {line, number}, kolom {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {byte-parser} duration_parser "
      & "{duurparser} date_time_parser {datum-tijdparser} color_parser "
      & "{kleurparser} url_parser {URL-parser} unit_parser {eenheidparser} "
      & "recurrence_parser {herhalingsparser} domain_label_parser "
      & "{domeinlabelparser} other {parser}}: {position, plural, =0 "
      & "{niet-ondersteunde syntaxis {error}} other {niet-ondersteunde syntaxis "
      & "{error} op positie {position, number}}}; {family, select, byte_parser "
      & "{toegestaan: B, kB, MB, GB, KiB, MiB, GiB of TiB} duration_parser "
      & "{toegestaan: ms, s, min, h, d, w, month of year} date_time_parser "
      & "{toegestaan: ISO-datum, natuurlijke dagaanduiding of kloktijd} "
      & "color_parser {toegestaan: hex, rgb(), hsl(), lab(), lch() of "
      & "kleurnaam} url_parser {toegestaan: schema, host, pad, query of "
      & "fragment} unit_parser {toegestaan: een ondersteund "
      & "Humanize-eenheidslabel} recurrence_parser {toegestaan: cron of een "
      & "every/weekday-herhalingsvorm} domain_label_parser {toegestaan: een "
      & "deterministisch Humanize-domeinlabel} other {toegestaan: een "
      & "ondersteunde invoervorm}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {geslaagd} failed_check {mislukt} "
      & "warning_check {waarschuwingen} skipped_check {overgeslagen} "
      & "pending_check {in afwachting} other {bezig}}, {notices, plural, =0 "
      & "{geen meldingen} one {1 melding} other {{notices, number} meldingen}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {poging 1 van 1} other "
      & "{poging {attempt, number} van 1 (limiet overschreden)}}} other {poging "
      & "{attempt, number} van {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {melding} "
      & "warning_severity {waarschuwing} error_severity {fout} "
      & "critical_severity {kritiek} other {blokkerend}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {builddiagnostiek} test_source "
      & "{testdiagnostiek} lint_source {lintdiagnostiek} import_source "
      & "{importdiagnostiek} validation_source {validatiediagnostiek} "
      & "runtime_source {runtimediagnostiek} security_source "
      & "{beveiligingsdiagnostiek} other {diagnostiek}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 {source, select, build_source {builddiagnose} "
      & "test_source {testdiagnose} lint_source {lintdiagnose} import_source "
      & "{importdiagnose} validation_source {validatiediagnose} runtime_source "
      & "{runtimediagnose} security_source {beveiligingsdiagnose} other "
      & "{diagnose}}} other {{count, number} {source, select, build_source "
      & "{builddiagnoses} test_source {testdiagnoses} lint_source "
      & "{lintdiagnoses} import_source {importdiagnoses} validation_source "
      & "{validatiediagnoses} runtime_source {runtimediagnoses} security_source "
      & "{beveiligingsdiagnoses} other {diagnoses}}}}");
   P ("label.diagnostics.suggested_action_label", "volgende stap: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domeinhost} ipv4_host {IPv4-adres} "
      & "ipv6_host {IPv6-adres} localhost_host {lokale host} "
      & "private_network_host {privénetwerkadres} other {onbekende host}}");
   P ("label.events.all_day_label", "{name} (hele dag)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {niet gereageerd} accepted "
      & "{geaccepteerd} declined {afgewezen} maybe {misschien} other {op "
      & "wachtlijst}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {geen deelnemers} one {1 deelnemer} other {{count, "
      & "number} deelnemers}}");
   P ("label.events.canceled_label", "{name} geannuleerd");
   P ("label.events.check_in_label", "inchecken bij {name}");
   P ("label.events.conference_link_label", "vergaderlink voor {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {geen afspraken} one {1 afspraak} other {{count, "
      & "number} afspraken}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {gepland} tentative_event "
      & "{voorlopig} in_progress_event {bezig} completed_event {afgerond} "
      & "canceled_event {geannuleerd} other {uitgesteld}}");
   P ("label.events.event_location_label", "{name}, locatie: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {geplande afspraak} tentative_event "
      & "{voorlopige afspraak} in_progress_event {lopende afspraak} "
      & "completed_event {afgeronde afspraak} canceled_event {geannuleerde "
      & "afspraak} other {uitgestelde afspraak}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {openbare afspraak} private_event "
      & "{privéafspraak} busy_event {weergeven als bezet} other {weergeven als "
      & "beschikbaar}}");
   P ("label.events.organizer_label", "georganiseerd door {name}");
   P ("label.events.rsvp_label",
      "reactie: {state, select, not_responded {geen} accepted {geaccepteerd} "
      & "declined {afgewezen} maybe {misschien} other {op wachtlijst}}");
   P ("label.events.reminder_label", "herinnering: {time_text}");
   P ("label.events.rescheduled_label", "{name} verplaatst naar {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 teken} other {{used, number} tekens}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {geen tekenlimiet} one {max. 1 teken} other {max. "
      & "{limit, number} tekens}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 teken} other {{used, number} "
      & "tekens}}} one {{used, number} van 1 teken} other {{used, number} van "
      & "{limit, number} tekens}}");
   P ("label.forms.field_label",
      "{required, select, false {{name} (optioneel)} other {{name} "
      & "(verplicht)}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {geldig} invalid_input {ongeldig} "
      & "required_input {verplicht} optional_input {optioneel} disabled_input "
      & "{uitgeschakeld} other {alleen-lezen}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {geen problemen in "
      & "formulier} one {1 fout} other {{errors, number} fouten}}} one "
      & "{{errors, plural, =0 {1 waarschuwing} one {1 fout, 1 waarschuwing} "
      & "other {{errors, number} fouten, 1 waarschuwing}}} other {{errors, "
      & "plural, =0 {{warnings, number} waarschuwingen} one {1 fout, {warnings, "
      & "number} waarschuwingen} other {{errors, number} fouten, {warnings, "
      & "number} waarschuwingen}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {niet begonnen} editing_form {wordt "
      & "bewerkt} dirty_form {niet-opgeslagen wijzigingen} saving_form {wordt "
      & "opgeslagen} saved_form {opgeslagen} submitted_form {verzonden} other "
      & "{verzenden mislukt}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {geldige invoer} invalid_input {ongeldige "
      & "invoer} required_input {verplichte invoer} optional_input {optionele "
      & "invoer} disabled_input {uitgeschakelde invoer} other "
      & "{alleen-lezeninvoer}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {niet begonnen} editing_form {wordt "
      & "bewerkt} dirty_form {niet-opgeslagen wijzigingen} saving_form "
      & "{formulier wordt opgeslagen} saved_form {formulier opgeslagen} "
      & "submitted_form {formulier verzonden} other {{errors, plural, =0 "
      & "{verzenden mislukt} one {verzenden mislukt met 1 fout} other "
      & "{verzenden mislukt met {errors, number} fouten}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {geen niet-opgeslagen wijzigingen} one {1 "
      & "niet-opgeslagen wijziging} other {{count, number} niet-opgeslagen "
      & "wijzigingen}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {toegankelijke naam "
      & "ontbreekt} low_contrast {laag contrast} skipped_heading_level "
      & "{kopniveau overgeslagen} missing_form_label {formulierlabel ontbreekt} "
      & "invalid_aria {ongeldige ARIA} keyboard_trap {toetsenbordval} other "
      & "{onbekend toegankelijkheidsprobleem}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – toegankelijkheid: {landmarks, plural, one {1 landmark} "
      & "other {{landmarks, number} landmarks}}, {headings, plural, one {1 kop} "
      & "other {{headings, number} koppen}}, {issues, plural, one {1 probleem} "
      & "other {{issues, number} problemen}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {voeg een toegankelijke naam "
      & "toe} low_contrast {verhoog het tekstcontrast} skipped_heading_level "
      & "{gebruik opeenvolgende kopniveaus} missing_form_label {koppel een "
      & "label aan het formulierelement} invalid_aria {gebruik een geldige "
      & "ARIA-rol of een geldig ARIA-attribuut} keyboard_trap {zorg dat de "
      & "toetsenbordfocus de component kan verlaten} other {controleer het "
      & "toegankelijkheidsprobleem}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {geen toegankelijkheidsproblemen} one {1 "
      & "toegankelijkheidsprobleem} other {{issues, number} "
      & "toegankelijkheidsproblemen}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-attribuut} class_attribute "
      & "{class-attribuut} data_attribute {data-attribuut} aria_attribute "
      & "{ARIA-attribuut} role_attribute {role-attribuut} link_attribute "
      & "{linkattribuut} media_attribute {media-attribuut} form_attribute "
      & "{formulierattribuut} boolean_attribute {booleaans attribuut} "
      & "event_attribute {eventhandlerattribuut} other {onbekend attribuut}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {warnings, plural, =0 {{errors, plural, =0 {geen "
      & "problemen} one {1 fout} other {{errors, number} fouten}}} one "
      & "{{errors, plural, =0 {1 waarschuwing} one {1 fout, 1 waarschuwing} "
      & "other {{errors, number} fouten, 1 waarschuwing}}} other {{errors, "
      & "plural, =0 {{warnings, number} waarschuwingen} one {1 fout, {warnings, "
      & "number} waarschuwingen} other {{errors, number} fouten, {warnings, "
      & "number} waarschuwingen}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner-landmark} navigation_role "
      & "{navigatielandmark} main_role {hoofdlandmark} complementary_role "
      & "{aanvullende landmark} contentinfo_role {contentinfo-landmark} "
      & "search_role {zoeklandmark} form_role {formulierlandmark} region_role "
      & "{regiolandmark} dialog_role {dialoogvenster} alert_role "
      & "{alert-liveregio} status_role {status-liveregio} other {onbekende "
      & "landmark}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {dringende update} other {beleefde "
      & "update}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {tekstinhoud} html_content {HTML-inhoud} "
      & "json_content {JSON-inhoud} xml_content {XML-inhoud} image_content "
      & "{afbeeldingsinhoud} audio_content {audio-inhoud} video_content "
      & "{video-inhoud} font_content {lettertype-inhoud} archive_content "
      & "{archiefinhoud} binary_content {binaire inhoud} form_content "
      & "{formulierinhoud} other {onbekende inhoud}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {documenttag} metadata_tag {metadatatag} "
      & "section_tag {sectietag} text_tag {teksttag} link_tag {linktag} "
      & "media_tag {mediatag} form_tag {formuliertag} table_tag {tabeltag} "
      & "interactive_tag {interactieve tag} scripting_tag {scripttag} other "
      & "{onbekende tag}}");
   P ("label.media.duration_label", "duur: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {afbeelding} video_media {video} "
      & "audio_media {audio} pdf_document {pdf-document} text_document "
      & "{tekstdocument} archive_media {archief} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {gereed} processing_media {wordt verwerkt} "
      & "transcoding_media {wordt getranscodeerd} thumbnail_missing {miniatuur "
      & "niet beschikbaar} metadata_missing {metadata ontbreken} "
      & "locked_document {document vergrendeld} other {niet beschikbaar}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {afbeelding} video_media {video} "
      & "audio_media {audio} pdf_document {pdf-document} text_document "
      & "{tekstdocument} archive_media {archief} other {media}}): {state, "
      & "select, ready_media {gereed} processing_media {wordt verwerkt} "
      & "transcoding_media {wordt getranscodeerd} thumbnail_missing {miniatuur "
      & "niet beschikbaar} metadata_missing {metadata ontbreken} "
      & "locked_document {document vergrendeld} other {niet beschikbaar}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {geen pagina’s} one {1 pagina} other {{pages, "
      & "number} pagina’s}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: bezwaar, {state, select, open_report {melding open} "
      & "triaged_report {melding beoordeeld} actioned_report {maatregel "
      & "genomen} dismissed_report {melding afgewezen} appealed_report {melding "
      & "aangevochten} other {melding gesloten}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {geen moderatiemaatregel} flagged "
      & "{gemarkeerd} hidden {verborgen door moderator} restored {hersteld} "
      & "marked_spam {gemarkeerd als spam} removed {verwijderd} other "
      & "{geëscaleerd}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {geen moderatiemaatregel} flagged "
      & "{gemarkeerd} hidden {verborgen door moderator} restored {hersteld} "
      & "marked_spam {gemarkeerd als spam} removed {verwijderd} other "
      & "{geëscaleerd}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderatiewachtrij leeg} "
      & "other {{pending, number} wachten op beoordeling}}} other {{pending, "
      & "number} wachten op beoordeling, {escalated, number} geëscaleerd}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {open melding} triaged_report "
      & "{beoordeelde melding} actioned_report {maatregel genomen} "
      & "dismissed_report {afgewezen melding} appealed_report {aangevochten "
      & "melding} other {gesloten melding}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {open melding} triaged_report {beoordeelde "
      & "melding} actioned_report {maatregel genomen} dismissed_report "
      & "{afgewezen melding} appealed_report {aangevochten melding} other "
      & "{gesloten melding}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {wacht op beoordeling} approved "
      & "{goedgekeurd} rejected {afgewezen} needs_changes {wijzigingen nodig} "
      & "other {beoordeling geëscaleerd}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {wacht op beoordeling} approved "
      & "{goedgekeurd} rejected {afgewezen} needs_changes {wijzigingen nodig} "
      & "other {beoordeling geëscaleerd}}");
   P ("label.navigation.back_label", "terug naar {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {geen kruimelpad} one {kruimelpad met 1 niveau} "
      & "other {kruimelpad met {depth, number} niveaus}}");
   P ("label.navigation.current_page_label", "huidige pagina: {name}");
   P ("label.navigation.external_link_label", "{name} (externe link)");
   P ("label.navigation.first_label", "eerste: {target}");
   P ("label.navigation.last_label", "laatste: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {geen menu-items} one {1 menu-item} other {{count, "
      & "number} menu-items}}");
end Labels_1;
