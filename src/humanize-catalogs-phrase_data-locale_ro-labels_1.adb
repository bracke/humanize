separate (Humanize.Catalogs.Phrase_Data.Locale_Ro)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: cont activ} invited_account "
      & "{{name}: cont invitat} locked_account {{name}: cont blocat} "
      & "suspended_account {{name}: cont suspendat} deleted_account {{name}: "
      & "cont șters} other {{name}: stare necunoscută a contului}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {cont activ} invited_account {cont "
      & "invitat} locked_account {cont blocat} suspended_account {cont "
      & "suspendat} deleted_account {cont șters} other {stare necunoscută a "
      & "contului}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {dispozitiv de încredere} "
      & "untrusted_device {dispozitiv nesigur} new_device {dispozitiv nou} "
      & "other {dispozitiv blocat}}");
   P ("label.accounts.last_active_label", "{name}: ultima activitate {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: autentificare eșuată} other "
      & "{{name}: autentificare reușită}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA activată} mfa_disabled {MFA "
      & "dezactivată} mfa_required {MFA obligatorie} other {resetare MFA "
      & "necesară}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: sesiune activă} "
      & "expired_session {{name}: sesiune expirată} revoked_session {{name}: "
      & "sesiune revocată} idle_session {{name}: sesiune inactivă} other "
      & "{{name}: stare necunoscută a sesiunii}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {sesiune activă} expired_session "
      & "{sesiune expirată} revoked_session {sesiune revocată} idle_session "
      & "{sesiune inactivă} other {stare necunoscută a sesiunii}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {niciun atașament} one {1 atașament} few {{count, "
      & "number} atașamente} other {{count, number} de atașamente}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 atașament} few {{name}: {count, "
      & "number} atașamente} other {{name}: {count, number} de atașamente}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {fișier atașat} image_attachment "
      & "{imagine atașată} video_attachment {videoclip atașat} "
      & "audio_attachment {fișier audio atașat} document_attachment {document "
      & "atașat} archive_attachment {arhivă atașată} other {link atașat}}");
   P ("label.attachments.attachment_label",
      "{name}, {kind, select, file_attachment {fișier} image_attachment "
      & "{imagine} video_attachment {videoclip} audio_attachment {fișier "
      & "audio} document_attachment {document} archive_attachment {arhivă} "
      & "other {link}}: {state, select, pending_attachment {în așteptare} "
      & "uploading_attachment {încărcare în curs} uploaded_attachment "
      & "{{kind, select, image_attachment {încărcată} archive_attachment "
      & "{încărcată} other {încărcat}}} failed_attachment {încărcare "
      & "eșuată} removed_attachment {{kind, select, image_attachment "
      & "{eliminată} archive_attachment {eliminată} other {eliminat}}} other "
      & "{{kind, select, image_attachment {blocată} archive_attachment "
      & "{blocată} other {blocat}}}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {atașament în așteptare} "
      & "uploading_attachment {atașament în curs de încărcare} "
      & "uploaded_attachment {atașament încărcat} failed_attachment "
      & "{atașament eșuat} removed_attachment {atașament eliminat} other "
      & "{atașament blocat}}");
   P ("label.attachments.download_label", "descarcă {name}");
   P ("label.attachments.expiring_link_label", "{name}: linkul expiră {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "previzualizează {name}");
   P ("label.attachments.remove_label", "elimină {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: nescanat} scanning {{name}: "
      & "scanare în curs} safe {{name}: fără amenințări} suspicious "
      & "{{name}: suspect} other {{name}: infectat}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nescanat} scanning {scanare în curs} "
      & "safe {fără amenințări} suspicious {suspect} other {infectat}}");
   P ("label.attachments.upload_error_label", "încărcarea {name} a eșuat: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {insignă} new_badge {insignă "
      & "nouă} updated_badge {insignă actualizată} deprecated_badge "
      & "{insignă învechită} selected_badge {insignă selectată} "
      & "disabled_badge {insignă dezactivată} other {insignă care poate fi "
      & "închisă}}, {tone, select, neutral_tone {ton neutru} info_tone {ton "
      & "informativ} success_tone {ton de succes} warning_tone {ton de "
      & "avertizare} danger_tone {ton de pericol} other {ton estompat}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {insignă cu prioritate scăzută} "
      & "medium_priority {insignă cu prioritate medie} high_priority {insignă "
      & "cu prioritate ridicată} other {insignă cu prioritate critică}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {insignă implicită} new_badge "
      & "{insignă nouă} updated_badge {insignă actualizată} "
      & "deprecated_badge {insignă învechită} selected_badge {insignă "
      & "selectată} disabled_badge {insignă dezactivată} other {insignă "
      & "care poate fi închisă}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {insignă neutră} info_tone {insignă "
      & "informativă} success_tone {insignă de succes} warning_tone {insignă "
      & "de avertizare} danger_tone {insignă de pericol} other {insignă "
      & "estompată}}");
   P ("label.badges.chip_label", "{selected, select, false {cip {name}} other {cip {name}, selectat}}");
   P ("label.badges.count_badge_label", "{count, plural, other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: insignă învechită");
   P ("label.badges.dismiss_label", "închide {name}");
   P ("label.badges.new_label", "{name}: insignă nouă");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {nicio insignă ascunsă} one {+1 insignă} "
      & "few {+{hidden_count, number} insigne} other {+{hidden_count, number} "
      & "de insigne}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: prioritate scăzută} "
      & "medium_priority {{name}: prioritate medie} high_priority {{name}: "
      & "prioritate ridicată} other {{name}: prioritate critică}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}: stare neutră} info_tone {{name}: "
      & "stare informativă} success_tone {{name}: stare de succes} "
      & "warning_tone {{name}: stare de avertizare} danger_tone {{name}: stare "
      & "de pericol} other {{name}: stare estompată}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {nicio etichetă} one {1 etichetă} few {{count, "
      & "number} etichete} other {{count, number} de etichete}}");
   P ("label.badges.tag_label", "eticheta {name}");
   P ("label.badges.updated_label", "{name}: insignă actualizată");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefact încărcat} "
      & "artifact_missing {artefact lipsă} artifact_expired {artefact expirat} "
      & "other {artefact verificat}}");
   P ("label.builds.benchmark_label", "test de performanță {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: build în coadă} build_running "
      & "{{name}: build în curs} build_passed {{name}: build reușit} "
      & "build_failed {{name}: build eșuat} snapshot_build {{name}: build "
      & "snapshot} other {{name}: build de lansare}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {build în coadă} build_running {build "
      & "în curs} build_passed {build reușit} build_failed {build eșuat} "
      & "snapshot_build {build snapshot} other {build de lansare}}");
   P ("label.builds.coverage_label", "acoperire: {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {verificare de lansare reușită} "
      & "gate_failed {verificare de lansare eșuată} gate_warning {verificare "
      & "de lansare cu avertismente} other {verificare de lansare blocată}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {teste reușite} failed_test {teste "
      & "eșuate} skipped_test {teste omise} flaky_test {teste instabile} other "
      & "{teste cu eșec așteptat}}: {count, number}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {reușit} failed_test {eșuat} "
      & "skipped_test {omis} flaky_test {instabil} other {eșec așteptat}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "nemodificat, dezactivat} other {{field_name}: din dezactivat în "
      & "activat}}} other {{new_value, select, false {{field_name}: din activat "
      & "în dezactivat} other {{field_name}: nemodificat, activat}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {adăugat} removed_change {eliminat} "
      & "modified_change {modificat} renamed_change {redenumit} "
      & "unchanged_change {nemodificat} metadata_change {metadate modificate} "
      & "moved_change {mutat} conflict_change {conflict} other {modificare "
      & "necunoscută}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {modificare informativă} "
      & "minor_change {modificare minoră} major_change {modificare majoră} "
      & "other {modificare incompatibilă}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: nemodificat} "
      & "other {{unchanged, plural, =0 {{field_name}: adăugate {added, "
      & "number}} other {{field_name}: adăugate {added, number}, nemodificate "
      & "{unchanged, number}}}}}} other {{added, plural, =0 {{unchanged, "
      & "plural, =0 {{field_name}: eliminate {removed, number}} other "
      & "{{field_name}: eliminate {removed, number}, nemodificate {unchanged, "
      & "number}}}} other {{unchanged, plural, =0 {{field_name}: adăugate "
      & "{added, number}, eliminate {removed, number}} other {{field_name}: "
      & "adăugate {added, number}, eliminate {removed, number}, nemodificate "
      & "{unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {niciun conflict} one {1 conflict} few {{count, "
      & "number} conflicte} other {{count, number} de conflicte}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: amânat de la {old_label} la "
      & "{new_label}} other {{field_name}: devansat de la {old_label} la "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}: modificat din {old_label} în {new_label}");
   P ("label.changes.field_change_label", "{field_name}: modificat din {old_value} în {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: adăugat} removed_change {{name}: "
      & "eliminat} modified_change {{name}: modificat} renamed_change {{name}: "
      & "redenumit} unchanged_change {{name}: nemodificat} metadata_change "
      & "{{name}: metadate modificate} moved_change {{name}: mutat} "
      & "conflict_change {{name}: conflict} other {{name}: modificare "
      & "necunoscută}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {s-au modificat doar metadatele} one {s-a modificat "
      & "doar 1 câmp de metadate} few {s-au modificat doar {count, number} "
      & "câmpuri de metadate} other {s-au modificat doar {count, number} de "
      & "câmpuri de metadate}}");
   P ("label.changes.move_label", "{name}: mutat din {from} în {to}");
   P ("label.changes.no_changes_label", "nicio modificare");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {niciun rând "
      & "modificat} other {rânduri adăugate: {lines_added, number}}}} other "
      & "{{lines_added, plural, =0 {rânduri eliminate: {lines_removed, "
      & "number}} other {rânduri adăugate: {lines_added, number}, eliminate: "
      & "{lines_removed, number}}}}}");
   P ("label.changes.rename_label", "redenumit din {old_name} în {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} a scris o ciornă de "
      & "comentariu} published_comment {{author} a comentat} edited_comment "
      & "{{author} a editat un comentariu} deleted_comment {{author} a șters "
      & "un comentariu} resolved_comment {{author} a rezolvat un comentariu} "
      & "unresolved_comment {{author} a redeschis un comentariu} pinned_comment "
      & "{{author} a fixat un comentariu} other {{author} a ascuns un "
      & "comentariu}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {niciun comentariu} one {1 comentariu} few {{count, "
      & "number} comentarii} other {{count, number} de comentarii}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: ciornă de comentariu} "
      & "published_comment {{author}: comentariu publicat} edited_comment "
      & "{{author}: comentariu editat} deleted_comment {{author}: comentariu "
      & "șters} resolved_comment {{author}: comentariu rezolvat} "
      & "unresolved_comment {{author}: comentariu nerezolvat} pinned_comment "
      & "{{author}: comentariu fixat} other {{author}: comentariu ascuns}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {ciornă de comentariu} "
      & "published_comment {comentariu publicat} edited_comment {comentariu "
      & "editat} deleted_comment {comentariu șters} resolved_comment "
      & "{comentariu rezolvat} unresolved_comment {comentariu nerezolvat} "
      & "pinned_comment {comentariu fixat} other {comentariu ascuns}}");
   P ("label.comments.deleted_label", "{author} a șters un comentariu");
   P ("label.comments.edited_label", "editat {time_text}");
   P ("label.comments.hide_comment_label", "ascunde comentariul: {reason}");
   P ("label.comments.lock_thread_label", "blochează firul {name}");
   P ("label.comments.mention_label", "mențiune de la {actor} pentru {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {niciun participant} one {1 participant} few "
      & "{{count, number} participanți} other {{count, number} de "
      & "participanți}}");
   P ("label.comments.pin_label", "fixează {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reacție: îmi place} dislike_reaction "
      & "{reacție: nu-mi place} heart_reaction {reacție: inimă} "
      & "laugh_reaction {reacție: râs} confused_reaction {reacție: confuz} "
      & "hooray_reaction {reacție: ura} rocket_reaction {reacție: rachetă} "
      & "other {reacție: ochi}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {îmi place} dislike_reaction {nu-mi "
      & "place} heart_reaction {inimă} laugh_reaction {râs} confused_reaction "
      & "{confuz} hooray_reaction {ura} rocket_reaction {rachetă} other "
      & "{ochi}}: {count, number}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {niciun răspuns} one {1 răspuns} few {{count, "
      & "number} răspunsuri} other {{count, number} de răspunsuri}}");
   P ("label.comments.resolved_label", "{name}: rezolvat");
   P ("label.comments.subscribe_label", "abonează-te la {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {niciun fir de discuție} one {1 fir de discuție} "
      & "few {{count, number} fire de discuție} other {{count, number} de fire "
      & "de discuție}}");
   P ("label.comments.thread_label",
      "{name}: fir {state, select, open_thread {deschis} resolved_thread "
      & "{rezolvat} locked_thread {blocat} other {arhivat}}{count, plural, =0 "
      & "{} one {, 1 comentariu} few {, {count, number} comentarii} other {, "
      & "{count, number} de comentarii}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {fir deschis} resolved_thread {fir "
      & "rezolvat} locked_thread {fir blocat} other {fir arhivat}}");
   P ("label.comments.unpin_label", "anulează fixarea {name}");
   P ("label.comments.unsubscribe_label", "dezabonează-te de la {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: îmbunătățit} regressed {{name}: "
      & "în regres} unchanged {{name}: nemodificat} within_tolerance {{name}: "
      & "în toleranță} outside_tolerance {{name}: în afara toleranței} "
      & "new_value {{name}: nou} removed_value {{name}: eliminat} other "
      & "{{name}: referință indisponibilă}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {îmbunătățit} regressed {în regres} "
      & "unchanged {nemodificat} within_tolerance {în toleranță} "
      & "outside_tolerance {în afara toleranței} new_value {nou} "
      & "removed_value {eliminat} other {referință indisponibilă}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: îmbunătățit cu "
      & "{difference_text}} regressed {{name}: în regres cu {difference_text}} "
      & "unchanged {{name}: nemodificat ({difference_text})} within_tolerance "
      & "{{name}: în toleranță ({difference_text})} outside_tolerance "
      & "{{name}: în afara toleranței ({difference_text})} new_value {{name}: "
      & "nou ({difference_text})} removed_value {{name}: eliminat "
      & "({difference_text})} other {{name}: referință indisponibilă "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: îmbunătățit cu "
      & "{difference_text}, toleranță {tolerance_text}} regressed {{name}: "
      & "în regres cu {difference_text}, toleranță {tolerance_text}} "
      & "unchanged {{name}: nemodificat ({difference_text}), toleranță "
      & "{tolerance_text}} within_tolerance {{name}: în toleranță "
      & "({difference_text}), toleranță {tolerance_text}} outside_tolerance "
      & "{{name}: în afara toleranței ({difference_text}), toleranță "
      & "{tolerance_text}} new_value {{name}: nou ({difference_text}), "
      & "toleranță {tolerance_text}} removed_value {{name}: eliminat "
      & "({difference_text}), toleranță {tolerance_text}} other {{name}: "
      & "referință indisponibilă ({difference_text}), toleranță "
      & "{tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {rând invalid} duplicate_record "
      & "{înregistrare duplicată} missing_column {coloană lipsă} "
      & "unknown_field {câmp necunoscut} schema_mismatch {schemă "
      & "nepotrivită} other {înregistrare omisă}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {rulare de test reușită} "
      & "dry_run_failed {rulare de test eșuată} import_valid {import valid} "
      & "import_invalid {import invalid} other {import parțial}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {rulare de test reușită} "
      & "dry_run_failed {rulare de test eșuată} import_valid {import valid} "
      & "import_invalid {import invalid} other {import parțial}} (acceptate: "
      & "{accepted, number}, respinse: {rejected, number})");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {rânduri invalide} duplicate_record "
      & "{înregistrări duplicate} missing_column {coloane lipsă} "
      & "unknown_field {câmpuri necunoscute} schema_mismatch {nepotriviri de "
      & "schemă} other {înregistrări omise}}: {count, number}");
   P ("label.data_quality.row_issue_label",
      "rândul {row, number}: {issue, select, invalid_row {rând invalid} "
      & "duplicate_record {înregistrare duplicată} missing_column {coloană "
      & "lipsă} unknown_field {câmp necunoscut} schema_mismatch {schemă "
      & "nepotrivită} other {înregistrare omisă}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {rând invalid} "
      & "duplicate_record {înregistrare duplicată} missing_column {coloană "
      & "lipsă} unknown_field {câmp necunoscut} schema_mismatch {schemă "
      & "nepotrivită} other {înregistrare omisă}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefact pregătit} artifact_uploaded "
      & "{artefact încărcat} artifact_signed {artefact semnat} "
      & "artifact_missing {artefact lipsă} other {artefact expirat}}");
   P ("label.deployments.deployment_label",
      "{name} în {environment}: {state, select, queued_deployment "
      & "{implementare în coadă} deploying {implementare în curs} deployed "
      & "{implementat} failed_deployment {implementare eșuată} rolled_back "
      & "{revenire efectuată} blocked_deployment {implementare blocată} other "
      & "{implementare anulată}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {implementare în coadă} deploying "
      & "{implementare în curs} deployed {implementat} failed_deployment "
      & "{implementare eșuată} rolled_back {revenire efectuată} "
      & "blocked_deployment {implementare blocată} other {implementare "
      & "anulată}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {mediu sănătos} "
      & "drifting_environment {mediu cu abateri} locked_environment {mediu "
      & "blocat} maintenance_environment {mediu în mentenanță} other {stare "
      & "necunoscută a mediului}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {nicio migrare} migration_pending "
      & "{migrare în așteptare} migrating {migrare în curs} "
      & "migration_complete {migrare finalizată} other {migrare eșuată}}");
   P ("label.deployments.promotion_label", "{name} promovat din {from_environment} în {to_environment}");
   P ("label.deployments.rollback_label", "{name}: revenire la {target}");
   P ("label.deployments.rollout_label", "{name}: lansare {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {niciun element afectat} one {1 element afectat} "
      & "few {{count, number} elemente afectate} other {{count, number} de "
      & "elemente afectate}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {reușit} failed_check {eșuat} "
      & "warning_check {cu avertismente} skipped_check {omis} pending_check "
      & "{în așteptare} other {în curs}} ({duration_s, plural, one {1 "
      & "secundă} few {{duration_s, number} secunde} other {{duration_s, "
      & "number} de secunde}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {reușit} failed_check {eșuat} "
      & "warning_check {cu avertismente} skipped_check {omis} pending_check "
      & "{în așteptare} other {în curs}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {reușit} failed_check {eșuat} "
      & "warning_check {avertismente} skipped_check {omis} pending_check {în "
      & "așteptare} other {în curs}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {se aștepta o valoare} expected_unit "
      & "{se aștepta o unitate} invalid_range {interval nevalid} "
      & "end_before_start {sfârșitul intervalului precedă începutul} "
      & "unknown_field {câmp necunoscut} unsafe_redacted_value {valoare "
      & "nesigură ascunsă} unsupported_syntax {sintaxă neacceptată} other "
      & "{explicație de diagnostic}} pentru {subject}{position, plural, =0 {} "
      & "other { la poziția {position, number}}}; folosiți {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {informație} notice_severity "
      & "{notificare} warning_severity {avertisment} error_severity {eroare} "
      & "critical_severity {critic} other {blocant}} în {path}{line, plural, "
      & "=0 {} other {, linia {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "eșuat la {path}{line, plural, =0 {} other {, linia {line, "
      & "number}{column, plural, =0 {} other {, coloana {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {informație} notice_severity "
      & "{notificare} warning_severity {avertisment} error_severity {eroare} "
      & "critical_severity {critic} other {blocant}} în {field_name}: "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "primul eșec în {check_name} la {path}{line, plural, =0 {} other {, "
      & "linia {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{nicio problemă} other {{notices, plural, one {1 notificare} few "
      & "{{notices, number} notificări} other {{notices, number} de "
      & "notificări}}}}} other {{notices, plural, =0 {{warnings, plural, one "
      & "{1 avertisment} few {{warnings, number} avertismente} other "
      & "{{warnings, number} de avertismente}}} other {{warnings, plural, one "
      & "{1 avertisment} few {{warnings, number} avertismente} other "
      & "{{warnings, number} de avertismente}}, {notices, plural, one {1 "
      & "notificare} few {{notices, number} notificări} other {{notices, "
      & "number} de notificări}}}}}}} other {{warnings, plural, =0 {{notices, "
      & "plural, =0 {{errors, plural, one {1 eroare} few {{errors, number} "
      & "erori} other {{errors, number} de erori}}} other {{errors, plural, one "
      & "{1 eroare} few {{errors, number} erori} other {{errors, number} de "
      & "erori}}, {notices, plural, one {1 notificare} few {{notices, number} "
      & "notificări} other {{notices, number} de notificări}}}}} other "
      & "{{notices, plural, =0 {{errors, plural, one {1 eroare} few {{errors, "
      & "number} erori} other {{errors, number} de erori}}, {warnings, plural, "
      & "one {1 avertisment} few {{warnings, number} avertismente} other "
      & "{{warnings, number} de avertismente}}} other {{errors, plural, one {1 "
      & "eroare} few {{errors, number} erori} other {{errors, number} de "
      & "erori}}, {warnings, plural, one {1 avertisment} few {{warnings, "
      & "number} avertismente} other {{warnings, number} de avertismente}}, "
      & "{notices, plural, one {1 notificare} few {{notices, number} "
      & "notificări} other {{notices, number} de notificări}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {, linia {line, number}{column, "
      & "plural, =0 {} other {, coloana {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "sintaxă neacceptată pentru {family, select, byte_parser {parserul de "
      & "octeți} duration_parser {parserul de durate} date_time_parser "
      & "{parserul de dată și oră} color_parser {parserul de culori} "
      & "url_parser {parserul de URL-uri} unit_parser {parserul de unități} "
      & "recurrence_parser {parserul de recurențe} domain_label_parser "
      & "{parserul de etichete de domeniu} other {parser}} {error}{position, "
      & "plural, =0 {} other { la poziția {position, number}}}; {family, "
      & "select, byte_parser {folosiți B, kB, MB, GB, KiB, MiB, GiB sau TiB} "
      & "duration_parser {folosiți ms, s, min, h, d, w, month sau year} "
      & "date_time_parser {folosiți o dată ISO, o zi în limbaj natural sau o "
      & "oră} color_parser {folosiți hex, rgb(), hsl(), lab(), lch() sau un "
      & "nume de culoare} url_parser {folosiți schemă, gazdă, cale, "
      & "interogare sau fragment} unit_parser {folosiți o etichetă de unitate "
      & "Humanize acceptată} recurrence_parser {folosiți cron sau o "
      & "recurență every/weekday} domain_label_parser {folosiți o etichetă "
      & "de domeniu Humanize deterministă} other {folosiți o formă de "
      & "intrare acceptată}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {reușit} failed_check {eșuat} "
      & "warning_check {avertismente} skipped_check {omis} pending_check {în "
      & "așteptare} other {în curs}}, {notices, plural, =0 {fără "
      & "notificări} one {cu 1 notificare} few {cu {notices, number} "
      & "notificări} other {cu {notices, number} de notificări}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {reîncercarea 1 din 1} "
      & "other {limita de reîncercări depășită ({attempt, number} din "
      & "1)}}} other {reîncercarea {attempt, number} din {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {informație} notice_severity "
      & "{notificare} warning_severity {avertisment} error_severity {eroare} "
      & "critical_severity {critic} other {blocant}}");
   P ("label.diagnostics.source_label",
      "diagnostice {source, select, build_source {de compilare} test_source "
      & "{de testare} lint_source {lint} import_source {de import} "
      & "validation_source {de validare} runtime_source {de execuție} "
      & "security_source {de securitate} other {generale}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 diagnostic} few {{count, number} diagnostice} "
      & "other {{count, number} de diagnostice}} {source, select, build_source "
      & "{de compilare} test_source {de testare} lint_source {lint} "
      & "import_source {de import} validation_source {de validare} "
      & "runtime_source {de execuție} security_source {de securitate} other "
      & "{generale}}");
   P ("label.diagnostics.suggested_action_label", "următorul pas: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {nume de domeniu} ipv4_host {adresă IPv4} "
      & "ipv6_host {adresă IPv6} localhost_host {gazdă locală} "
      & "private_network_host {adresă de rețea privată} other {gazdă "
      & "necunoscută}}");
   P ("label.events.all_day_label", "{name}: eveniment pe toată ziua");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {fără răspuns} accepted {acceptat} "
      & "declined {refuzat} maybe {poate} other {pe lista de așteptare}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {niciun participant} one {1 participant} few "
      & "{{count, number} participanți} other {{count, number} de "
      & "participanți}}");
   P ("label.events.canceled_label", "{name}: anulat");
   P ("label.events.check_in_label", "check-in la {name}");
   P ("label.events.conference_link_label", "link de conferință pentru {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {niciun eveniment} one {1 eveniment} few {{count, "
      & "number} evenimente} other {{count, number} de evenimente}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {eveniment programat} "
      & "tentative_event {eveniment provizoriu} in_progress_event {eveniment "
      & "în desfășurare} completed_event {eveniment încheiat} "
      & "canceled_event {eveniment anulat} other {eveniment amânat}}");
   P ("label.events.event_location_label", "{name}, {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {eveniment programat} tentative_event "
      & "{eveniment provizoriu} in_progress_event {eveniment în desfășurare} "
      & "completed_event {eveniment încheiat} canceled_event {eveniment "
      & "anulat} other {eveniment amânat}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {eveniment public} private_event "
      & "{eveniment privat} busy_event {ocupat} other {liber}}");
   P ("label.events.organizer_label", "organizat de {name}");
   P ("label.events.rsvp_label",
      "{state, select, not_responded {participare: fără răspuns} accepted "
      & "{participare acceptată} declined {participare refuzată} maybe "
      & "{participare: poate} other {participare: pe lista de așteptare}}");
   P ("label.events.reminder_label", "memento {time_text}");
   P ("label.events.rescheduled_label", "{name} reprogramat pentru {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {1 caracter} few {{used, number} caractere} other "
      & "{{used, number} de caractere}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {fără limită de caractere} one {maximum 1 "
      & "caracter} few {maximum {limit, number} caractere} other {maximum "
      & "{limit, number} de caractere}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 caracter} few {{used, "
      & "number} caractere} other {{used, number} de caractere}}} other {{used, "
      & "number} din {limit, plural, one {1 caracter} few {{limit, number} "
      & "caractere} other {{limit, number} de caractere}}}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, câmp opțional} other {{name}, "
      & "câmp obligatoriu}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {valid} invalid_input {nevalid} "
      & "required_input {obligatoriu} optional_input {opțional} disabled_input "
      & "{dezactivat} other {doar în citire}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {nicio problemă în "
      & "formular} other {{warnings, plural, one {1 avertisment} few "
      & "{{warnings, number} avertismente} other {{warnings, number} de "
      & "avertismente}}}}} other {{warnings, plural, =0 {{errors, plural, one "
      & "{1 eroare} few {{errors, number} erori} other {{errors, number} de "
      & "erori}}} other {{errors, plural, one {1 eroare} few {{errors, number} "
      & "erori} other {{errors, number} de erori}}, {warnings, plural, one {1 "
      & "avertisment} few {{warnings, number} avertismente} other {{warnings, "
      & "number} de avertismente}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {neînceput} editing_form {editare în "
      & "curs} dirty_form {modificări nesalvate} saving_form {se salvează} "
      & "saved_form {salvat} submitted_form {trimis} other {trimitere "
      & "eșuată}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {valoare validă} invalid_input {valoare "
      & "nevalidă} required_input {câmp obligatoriu} optional_input {câmp "
      & "opțional} disabled_input {câmp dezactivat} other {câmp doar în "
      & "citire}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {neînceput} editing_form {editare în "
      & "curs} dirty_form {modificări nesalvate} saving_form {formularul se "
      & "salvează} saved_form {formular salvat} submitted_form {formular "
      & "trimis} other {{errors, plural, =0 {trimitere eșuată} one {trimitere "
      & "eșuată cu 1 eroare} few {trimitere eșuată cu {errors, number} "
      & "erori} other {trimitere eșuată cu {errors, number} de erori}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {nicio modificare nesalvată} one {1 modificare "
      & "nesalvată} few {{count, number} modificări nesalvate} other {{count, "
      & "number} de modificări nesalvate}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {lipsește numele "
      & "accesibil} low_contrast {contrast scăzut} skipped_heading_level "
      & "{nivel de titlu omis} missing_form_label {lipsește eticheta de "
      & "formular} invalid_aria {ARIA nevalid} keyboard_trap {capcană de "
      & "tastatură} other {problemă de accesibilitate necunoscută}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}, rezumat de accesibilitate: {landmarks, plural, one {1 reper} "
      & "few {{landmarks, number} repere} other {{landmarks, number} de "
      & "repere}}, {headings, plural, one {1 titlu} few {{headings, number} "
      & "titluri} other {{headings, number} de titluri}}, {issues, plural, one "
      & "{1 problemă} few {{issues, number} probleme} other {{issues, number} "
      & "de probleme}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {adăugați un nume accesibil} "
      & "low_contrast {măriți contrastul textului} skipped_heading_level "
      & "{folosiți niveluri de titlu consecutive} missing_form_label "
      & "{asociați o etichetă controlului de formular} invalid_aria "
      & "{folosiți un rol sau un atribut ARIA valid} keyboard_trap "
      & "{asigurați-vă că focalizarea tastaturii poate părăsi componenta} "
      & "other {verificați problema de accesibilitate}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} nu are probleme de accesibilitate} one "
      & "{{target} are 1 problemă de accesibilitate} few {{target} are "
      & "{issues, number} probleme de accesibilitate} other {{target} are "
      & "{issues, number} de probleme de accesibilitate}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {atribut id} class_attribute {atribut "
      & "class} data_attribute {atribut data} aria_attribute {atribut ARIA} "
      & "role_attribute {atribut role} link_attribute {atribut de link} "
      & "media_attribute {atribut media} form_attribute {atribut de formular} "
      & "boolean_attribute {atribut boolean} event_attribute {atribut de "
      & "gestionare a evenimentelor} other {atribut necunoscut}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name} nu are "
      & "probleme} other {{form_name} are {warnings, plural, one {1 "
      & "avertisment} few {{warnings, number} avertismente} other {{warnings, "
      & "number} de avertismente}}}}} other {{warnings, plural, =0 {{form_name} "
      & "are {errors, plural, one {1 eroare} few {{errors, number} erori} other "
      & "{{errors, number} de erori}}} other {{form_name} are {errors, plural, "
      & "one {1 eroare} few {{errors, number} erori} other {{errors, number} de "
      & "erori}}, {warnings, plural, one {1 avertisment} few {{warnings, "
      & "number} avertismente} other {{warnings, number} de avertismente}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {reper banner} navigation_role {reper de "
      & "navigare} main_role {reper principal} complementary_role {reper "
      & "complementar} contentinfo_role {reper de informații despre conținut} "
      & "search_role {reper de căutare} form_role {reper de formular} "
      & "region_role {reper de regiune} dialog_role {dialog} alert_role "
      & "{regiune live de alertă} status_role {regiune live de stare} other "
      & "{reper necunoscut}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}, actualizare imediată: {update}} "
      & "other {{region}, actualizare discretă: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {conținut text} html_content {conținut "
      & "HTML} json_content {conținut JSON} xml_content {conținut XML} "
      & "image_content {conținut de imagine} audio_content {conținut audio} "
      & "video_content {conținut video} font_content {conținut de font} "
      & "archive_content {conținut de arhivă} binary_content {conținut "
      & "binar} form_content {conținut de formular} other {conținut "
      & "necunoscut}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {tag de document} metadata_tag {tag de "
      & "metadate} section_tag {tag de secțiune} text_tag {tag de text} "
      & "link_tag {tag de link} media_tag {tag media} form_tag {tag de "
      & "formular} table_tag {tag de tabel} interactive_tag {tag interactiv} "
      & "scripting_tag {tag de scripting} other {tag necunoscut}}");
   P ("label.media.duration_label", "durată: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {imagine} video_media {video} audio_media "
      & "{audio} pdf_document {document PDF} text_document {document text} "
      & "archive_media {arhivă} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {gata} processing_media {în procesare} "
      & "transcoding_media {transcodare în curs} thumbnail_missing {miniatură "
      & "indisponibilă} metadata_missing {metadate lipsă} locked_document "
      & "{document blocat} other {indisponibil}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {imagine} video_media {video} "
      & "audio_media {audio} pdf_document {document PDF} text_document "
      & "{document text} archive_media {arhivă} other {media}}): {state, "
      & "select, ready_media {gata} processing_media {în procesare} "
      & "transcoding_media {transcodare în curs} thumbnail_missing {miniatură "
      & "indisponibilă} metadata_missing {metadate lipsă} locked_document "
      & "{document blocat} other {indisponibil}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {nicio pagină} one {1 pagină} few {{pages, "
      & "number} pagini} other {{pages, number} de pagini}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: contestație, {state, select, open_report {raport deschis} "
      & "triaged_report {raport triat} actioned_report {măsuri luate} "
      & "dismissed_report {raport respins} appealed_report {raport contestat} "
      & "other {raport închis}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {nicio acțiune de moderare} flagged "
      & "{semnalat} hidden {ascuns de moderator} restored {restaurat} "
      & "marked_spam {marcat ca spam} removed {eliminat} other {escaladat}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {nicio acțiune de moderare} "
      & "flagged {semnalat} hidden {ascuns de moderator} restored {restaurat} "
      & "marked_spam {marcat ca spam} removed {eliminat} other {escaladat}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {coada de moderare este "
      & "goală} other {de verificat: {pending, number}}}} other {de verificat: "
      & "{pending, number}, escaladate: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {raport deschis} triaged_report "
      & "{raport triat} actioned_report {măsuri luate} dismissed_report "
      & "{raport respins} appealed_report {raport contestat} other {raport "
      & "închis}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {raport deschis} triaged_report {raport "
      & "triat} actioned_report {măsuri luate} dismissed_report {raport "
      & "respins} appealed_report {raport contestat} other {raport închis}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {în așteptarea verificării} "
      & "approved {aprobat} rejected {respins} needs_changes {necesită "
      & "modificări} other {verificare escaladată}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {în așteptarea verificării} approved "
      & "{aprobat} rejected {respins} needs_changes {necesită modificări} "
      & "other {verificare escaladată}}");
   P ("label.navigation.back_label", "înapoi la {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {niciun nivel de navigare} one {1 nivel de "
      & "navigare} few {{depth, number} niveluri de navigare} other {{depth, "
      & "number} de niveluri de navigare}}");
   P ("label.navigation.current_page_label", "pagina curentă: {name}");
   P ("label.navigation.external_link_label", "{name}, link extern");
   P ("label.navigation.first_label", "primul: {target}");
   P ("label.navigation.last_label", "ultimul: {target}");
end Labels_1;
