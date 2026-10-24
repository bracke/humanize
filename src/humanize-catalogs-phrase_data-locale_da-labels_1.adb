separate (Humanize.Catalogs.Phrase_Data.Locale_Da)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: aktiv konto} invited_account "
      & "{{name}: inviteret konto} locked_account {{name}: låst konto} "
      & "suspended_account {{name}: suspenderet konto} deleted_account {{name}: "
      & "slettet konto} other {{name}: ukendt kontostatus}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktiv konto} invited_account "
      & "{inviteret konto} locked_account {låst konto} suspended_account "
      & "{suspenderet konto} deleted_account {slettet konto} other {ukendt "
      & "kontostatus}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {betroet enhed} untrusted_device "
      & "{ikke-betroet enhed} new_device {ny enhed} other {blokeret enhed}}");
   P ("label.accounts.last_active_label", "{name}, sidst aktiv {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: login mislykkedes} other {{name}: "
      & "login lykkedes}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA aktiveret} mfa_disabled {MFA "
      & "deaktiveret} mfa_required {MFA påkrævet} other {nulstilling af MFA "
      & "påkrævet}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: aktiv session} expired_session "
      & "{{name}: sessionen er udløbet} revoked_session {{name}: sessionen er "
      & "tilbagekaldt} idle_session {{name}: inaktiv session} other {{name}: "
      & "ukendt sessionsstatus}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktiv session} expired_session "
      & "{sessionen er udløbet} revoked_session {sessionen er tilbagekaldt} "
      & "idle_session {inaktiv session} other {ukendt sessionsstatus}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {ingen vedhæftede filer} one {1 vedhæftet fil} "
      & "other {{count, number} vedhæftede filer}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 vedhæftet fil} other {{name}: {count, "
      & "number} vedhæftede filer}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {vedhæftet fil} image_attachment "
      & "{vedhæftet billede} video_attachment {vedhæftet video} "
      & "audio_attachment {vedhæftet lydfil} document_attachment {vedhæftet "
      & "dokument} archive_attachment {vedhæftet arkiv} other {vedhæftet "
      & "link}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {fil} image_attachment "
      & "{billede} video_attachment {video} audio_attachment {lyd} "
      & "document_attachment {dokument} archive_attachment {arkiv} other "
      & "{link}} {state, select, pending_attachment {afventer} "
      & "uploading_attachment {uploades} uploaded_attachment {uploadet} "
      & "failed_attachment {mislykkedes} removed_attachment {fjernet} other "
      & "{blokeret}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {vedhæftet fil afventer} "
      & "uploading_attachment {vedhæftet fil uploades} uploaded_attachment "
      & "{vedhæftet fil uploadet} failed_attachment {vedhæftet fil "
      & "mislykkedes} removed_attachment {vedhæftet fil fjernet} other "
      & "{vedhæftet fil blokeret}}");
   P ("label.attachments.download_label", "download {name}");
   P ("label.attachments.expiring_link_label", "linket til {name} udløber {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "forhåndsvis {name}");
   P ("label.attachments.remove_label", "fjern {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {ikke scannet} scanning {scannes} "
      & "safe {sikker} suspicious {mistænkelig} other {inficeret}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {ikke scannet} scanning {scannes} safe "
      & "{scanning: sikker} suspicious {scanning: mistænkelig} other "
      & "{scanning: inficeret}}");
   P ("label.attachments.upload_error_label", "upload af {name} mislykkedes: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {badge} new_badge {nyt badge} "
      & "updated_badge {opdateret badge} deprecated_badge {forældet badge} "
      & "selected_badge {valgt badge} disabled_badge {deaktiveret badge} other "
      & "{badge, kan lukkes}} ({tone, select, neutral_tone {neutral} info_tone "
      & "{info} success_tone {succes} warning_tone {advarsel} danger_tone "
      & "{fare} other {dæmpet}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {badge med lav prioritet} "
      & "medium_priority {badge med middel prioritet} high_priority {badge med "
      & "høj prioritet} other {badge med kritisk prioritet}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {standardbadge} new_badge {nyt badge} "
      & "updated_badge {opdateret badge} deprecated_badge {forældet badge} "
      & "selected_badge {valgt badge} disabled_badge {deaktiveret badge} other "
      & "{badge, kan lukkes}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutralt badge} info_tone {infobadge} "
      & "success_tone {succesbadge} warning_tone {advarselsbadge} danger_tone "
      & "{farebadge} other {dæmpet badge}}");
   P ("label.badges.chip_label", "{selected, select, false {chip {name}} other {chip {name}, valgt}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: ingen} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: forældet");
   P ("label.badges.dismiss_label", "luk {name}");
   P ("label.badges.new_label", "{name}: ny");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {ingen skjulte badges} one {+1 badge mere} "
      & "other {+{hidden_count, number} badges mere}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: lav prioritet} "
      & "medium_priority {{name}: middel prioritet} high_priority {{name}: høj "
      & "prioritet} other {{name}: kritisk prioritet}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, status: neutral} info_tone "
      & "{{name}, status: info} success_tone {{name}, status: succes} "
      & "warning_tone {{name}, status: advarsel} danger_tone {{name}, status: "
      & "fare} other {{name}, status: dæmpet}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {ingen tags} one {1 tag} other {{count, number} "
      & "tags}}");
   P ("label.badges.tag_label", "tag {name}");
   P ("label.badges.updated_label", "{name}: opdateret");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt uploadet} artifact_missing "
      & "{artefakt mangler} artifact_expired {artefakt udløbet} other "
      & "{artefakt verificeret}}");
   P ("label.builds.benchmark_label", "benchmark {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: build i kø} build_running "
      & "{{name}: build kører} build_passed {{name}: build bestået} "
      & "build_failed {{name}: build mislykkedes} snapshot_build {{name}: "
      & "snapshot-build} other {{name}: release-build}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {build i kø} build_running {build "
      & "kører} build_passed {build bestået} build_failed {build mislykkedes} "
      & "snapshot_build {snapshot-build} other {release-build}}");
   P ("label.builds.coverage_label", "testdækning {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {release-gate bestået} gate_failed "
      & "{release-gate ikke bestået} gate_warning {release-gate med advarsel} "
      & "other {release-gate blokeret}}");
   P ("label.builds.test_count_label",
      "{count, plural, =0 {ingen test} one {1 test} other {{count, number} "
      & "test}} {state, select, passed_test {bestået} failed_test "
      & "{mislykkedes} skipped_test {sprunget over} flaky_test {ustabil} other "
      & "{mislykkedes som forventet}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {bestået} failed_test {mislykkedes} "
      & "skipped_test {sprunget over} flaky_test {ustabil} other {forventet "
      & "fejl}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "uændret, deaktiveret} other {{field_name} ændret fra deaktiveret til "
      & "aktiveret}}} other {{new_value, select, false {{field_name} ændret "
      & "fra aktiveret til deaktiveret} other {{field_name} uændret, "
      & "aktiveret}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {tilføjet} removed_change {fjernet} "
      & "modified_change {ændret} renamed_change {omdøbt} unchanged_change "
      & "{uændret} metadata_change {metadata ændret} moved_change {flyttet} "
      & "conflict_change {konflikt} other {ukendt ændring}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informativ ændring} "
      & "minor_change {mindre ændring} major_change {større ændring} other "
      & "{inkompatibel ændring}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} uændret} other "
      & "{{unchanged, plural, =0 {{field_name} ændret: {added, number} "
      & "tilføjet} other {{field_name} ændret: {added, number} tilføjet, "
      & "{unchanged, number} uændret}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} ændret: {removed, number} "
      & "fjernet} other {{field_name} ændret: {removed, number} fjernet, "
      & "{unchanged, number} uændret}}} other {{unchanged, plural, =0 "
      & "{{field_name} ændret: {added, number} tilføjet, {removed, number} "
      & "fjernet} other {{field_name} ændret: {added, number} tilføjet, "
      & "{removed, number} fjernet, {unchanged, number} uændret}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {ingen konflikter} one {1 konflikt} other {{count, "
      & "number} konflikter}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} udskudt fra {old_label} til "
      & "{new_label}} other {{field_name} fremrykket fra {old_label} til "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} ændret fra {old_label} til {new_label}");
   P ("label.changes.field_change_label", "{field_name} ændret fra {old_value} til {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} tilføjet} removed_change {{name} "
      & "fjernet} modified_change {{name} ændret} renamed_change {{name} "
      & "omdøbt} unchanged_change {{name} uændret} metadata_change {{name}: "
      & "metadata ændret} moved_change {{name} flyttet} conflict_change "
      & "{{name}: konflikt} other {{name}: ukendt ændring}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {kun metadata ændret} one {kun 1 metadatafelt "
      & "ændret} other {kun {count, number} metadatafelter ændret}}");
   P ("label.changes.move_label", "{name} flyttet fra {from} til {to}");
   P ("label.changes.no_changes_label", "ingen ændringer");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {ingen "
      & "linjeændringer} one {1 linje tilføjet} other {{lines_added, number} "
      & "linjer tilføjet}}} one {{lines_added, plural, =0 {1 linje fjernet} "
      & "one {1 linje tilføjet, 1 linje fjernet} other {{lines_added, number} "
      & "linjer tilføjet, 1 linje fjernet}}} other {{lines_added, plural, =0 "
      & "{{lines_removed, number} linjer fjernet} one {1 linje tilføjet, "
      & "{lines_removed, number} linjer fjernet} other {{lines_added, number} "
      & "linjer tilføjet, {lines_removed, number} linjer fjernet}}}}");
   P ("label.changes.rename_label", "omdøbt fra {old_name} til {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} skrev en kommentarkladde} "
      & "published_comment {{author} kommenterede} edited_comment {{author} "
      & "redigerede en kommentar} deleted_comment {{author} slettede en "
      & "kommentar} resolved_comment {{author} markerede en kommentar som "
      & "løst} unresolved_comment {{author} genåbnede en kommentar} "
      & "pinned_comment {{author} fastgjorde en kommentar} other {{author} "
      & "skjulte en kommentar}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {ingen kommentarer} one {1 kommentar} other "
      & "{{count, number} kommentarer}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: kommentarkladde} "
      & "published_comment {{author}: publiceret kommentar} edited_comment "
      & "{{author}: redigeret kommentar} deleted_comment {{author}: slettet "
      & "kommentar} resolved_comment {{author}: løst kommentar} "
      & "unresolved_comment {{author}: uløst kommentar} pinned_comment "
      & "{{author}: fastgjort kommentar} other {{author}: skjult kommentar}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {kommentarkladde} published_comment "
      & "{publiceret kommentar} edited_comment {redigeret kommentar} "
      & "deleted_comment {slettet kommentar} resolved_comment {løst kommentar} "
      & "unresolved_comment {uløst kommentar} pinned_comment {fastgjort "
      & "kommentar} other {skjult kommentar}}");
   P ("label.comments.deleted_label", "{author} slettede en kommentar");
   P ("label.comments.edited_label", "redigeret {time_text}");
   P ("label.comments.hide_comment_label", "skjul kommentar: {reason}");
   P ("label.comments.lock_thread_label", "lås tråden {name}");
   P ("label.comments.mention_label", "{actor} nævnte {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {ingen deltagere} one {1 deltager} other {{count, "
      & "number} deltagere}}");
   P ("label.comments.pin_label", "fastgør {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reaktion »synes godt om«} "
      & "dislike_reaction {reaktion »synes ikke om«} heart_reaction {reaktion "
      & "»hjerte«} laugh_reaction {reaktion »grin«} confused_reaction "
      & "{reaktion »forvirret«} hooray_reaction {reaktion »hurra«} "
      & "rocket_reaction {reaktion »raket«} other {reaktion »øjne«}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {ingen reaktioner} one {1 reaktion} other {{count, "
      & "number} reaktioner}} {kind, select, like_reaction {»synes godt om«} "
      & "dislike_reaction {»synes ikke om«} heart_reaction {»hjerte«} "
      & "laugh_reaction {»grin«} confused_reaction {»forvirret«} "
      & "hooray_reaction {»hurra«} rocket_reaction {»raket«} other "
      & "{»øjne«}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {ingen svar} one {1 svar} other {{count, number} "
      & "svar}}");
   P ("label.comments.resolved_label", "{name} løst");
   P ("label.comments.subscribe_label", "abonner på {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {ingen tråde} one {1 tråd} other {{count, number} "
      & "tråde}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {åben tråd} resolved_thread "
      & "{løst tråd} locked_thread {låst tråd} other {arkiveret "
      & "tråd}}{count, plural, =0 {} one {, 1 kommentar} other {, {count, "
      & "number} kommentarer}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {åben tråd} resolved_thread {løst "
      & "tråd} locked_thread {låst tråd} other {arkiveret tråd}}");
   P ("label.comments.unpin_label", "frigør {name}");
   P ("label.comments.unsubscribe_label", "afmeld abonnement på {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {forbedret} regressed {forværret} "
      & "unchanged {uændret} within_tolerance {inden for tolerance} "
      & "outside_tolerance {uden for tolerance} new_value {ny} removed_value "
      & "{fjernet} other {basislinje ikke tilgængelig}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {forbedret} regressed {forværret} unchanged "
      & "{uændret} within_tolerance {inden for tolerance} outside_tolerance "
      & "{uden for tolerance} new_value {ny} removed_value {fjernet} other "
      & "{basislinje ikke tilgængelig}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {forbedret med {difference_text}} "
      & "regressed {forværret med {difference_text}} unchanged {uændret "
      & "({difference_text})} within_tolerance {inden for tolerance "
      & "({difference_text})} outside_tolerance {uden for tolerance "
      & "({difference_text})} new_value {ny ({difference_text})} removed_value "
      & "{fjernet ({difference_text})} other {basislinje ikke tilgængelig "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {forbedret med {difference_text}} "
      & "regressed {forværret med {difference_text}} unchanged {uændret "
      & "({difference_text})} within_tolerance {inden for tolerance "
      & "({difference_text})} outside_tolerance {uden for tolerance "
      & "({difference_text})} new_value {ny ({difference_text})} removed_value "
      & "{fjernet ({difference_text})} other {basislinje ikke tilgængelig "
      & "({difference_text})}}, tolerance {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ugyldig række} duplicate_record "
      & "{dubleret post} missing_column {manglende kolonne} unknown_field "
      & "{ukendt felt} schema_mismatch {skemauoverensstemmelse} other "
      & "{oversprunget post}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {prøvekørsel bestået} dry_run_failed "
      & "{prøvekørsel mislykkedes} import_valid {import gyldig} "
      & "import_invalid {import ugyldig} other {delvis import}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {prøvekørsel bestået} "
      & "dry_run_failed {prøvekørsel mislykkedes} import_valid {import "
      & "gyldig} import_invalid {import ugyldig} other {delvis import}}: "
      & "{accepted, number} accepteret, {rejected, number} afvist");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {ingen ugyldige "
      & "rækker} one {1 ugyldig række} other {{count, number} ugyldige "
      & "rækker}}} duplicate_record {{count, plural, =0 {ingen dublerede "
      & "poster} one {1 dubleret post} other {{count, number} dublerede "
      & "poster}}} missing_column {{count, plural, =0 {ingen manglende "
      & "kolonner} one {1 manglende kolonne} other {{count, number} manglende "
      & "kolonner}}} unknown_field {{count, plural, =0 {ingen ukendte felter} "
      & "one {1 ukendt felt} other {{count, number} ukendte felter}}} "
      & "schema_mismatch {{count, plural, =0 {ingen skemauoverensstemmelser} "
      & "one {1 skemauoverensstemmelse} other {{count, number} "
      & "skemauoverensstemmelser}}} other {{count, plural, =0 {ingen "
      & "oversprungne poster} one {1 oversprunget post} other {{count, number} "
      & "oversprungne poster}}}}");
   P ("label.data_quality.row_issue_label",
      "række {row, number}: {issue, select, invalid_row {ugyldig} "
      & "duplicate_record {dubleret post} missing_column {manglende kolonne} "
      & "unknown_field {ukendt felt} schema_mismatch {skemauoverensstemmelse} "
      & "other {sprunget over}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {ugyldig række} "
      & "duplicate_record {dubleret post} missing_column {manglende kolonne} "
      & "unknown_field {ukendt felt} schema_mismatch {skemauoverensstemmelse} "
      & "other {oversprunget post}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt klar} artifact_uploaded "
      & "{artefakt uploadet} artifact_signed {artefakt signeret} "
      & "artifact_missing {artefakt mangler} other {artefakt udløbet}}");
   P ("label.deployments.deployment_label",
      "{name} til {environment}: {state, select, queued_deployment {udrulning "
      & "i kø} deploying {udrulles} deployed {udrullet} failed_deployment "
      & "{udrulning mislykkedes} rolled_back {rullet tilbage} "
      & "blocked_deployment {udrulning blokeret} other {udrulning annulleret}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {udrulning i kø} deploying "
      & "{udrulles} deployed {udrullet} failed_deployment {udrulning "
      & "mislykkedes} rolled_back {rullet tilbage} blocked_deployment "
      & "{udrulning blokeret} other {udrulning annulleret}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {miljø sundt} "
      & "drifting_environment {miljø afviger} locked_environment {miljø "
      & "låst} maintenance_environment {miljø under vedligeholdelse} other "
      & "{ukendt miljøstatus}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {ingen migrering} migration_pending "
      & "{migrering afventer} migrating {migrering i gang} migration_complete "
      & "{migrering fuldført} other {migrering mislykkedes}}");
   P ("label.deployments.promotion_label", "{name} flyttet op fra {from_environment} til {to_environment}");
   P ("label.deployments.rollback_label", "{name}: tilbagerulning til {target}");
   P ("label.deployments.rollout_label", "{name}: trinvis udrulning {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {ingen berørte elementer} one {1 berørt element} "
      & "other {{count, number} berørte elementer}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {bestået} failed_check "
      & "{mislykkedes} warning_check {advarsler} skipped_check {sprunget over} "
      & "pending_check {afventer} other {kører}} ({duration_s, plural, one {1 "
      & "sekund} other {{duration_s, number} sekunder}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {bestået} failed_check "
      & "{mislykkedes} warning_check {advarsler} skipped_check {sprunget over} "
      & "pending_check {afventer} other {kører}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {bestået} failed_check {mislykkedes} "
      & "warning_check {advarsler} skipped_check {sprunget over} pending_check "
      & "{afventer} other {kører}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{subject}} other {{subject}, position "
      & "{position, number}}}: {kind, select, expected_value {værdi forventet} "
      & "expected_unit {enhed forventet} invalid_range {ugyldigt interval} "
      & "end_before_start {intervallets slutning ligger før starten} "
      & "unknown_field {ukendt felt} unsafe_redacted_value {usikker værdi blev "
      & "fjernet} unsupported_syntax {ikke-understøttet syntaks} other "
      & "{diagnostisk forklaring}}; forslag: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {info} notice_severity {meddelelse} "
      & "warning_severity {advarsel} error_severity {fejl} critical_severity "
      & "{kritisk fejl} other {blokerende fejl}} i {line, plural, =0 {{path}} "
      & "other {{path}, linje {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "mislykkedes i {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, linje {line, number}} other {{path}, linje {line, number}, "
      & "kolonne {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info} notice_severity {meddelelse} "
      & "warning_severity {advarsel} error_severity {fejl} critical_severity "
      & "{kritisk fejl} other {blokerende fejl}} i feltet {field_name}: "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "første fejl i {check_name} ved {line, plural, =0 {{path}} other "
      & "{{path}, linje {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 "
      & "{ingen problemer} one {1 fejl} other {{errors, number} fejl}}} one "
      & "{{errors, plural, =0 {1 meddelelse} one {1 fejl, 1 meddelelse} other "
      & "{{errors, number} fejl, 1 meddelelse}}} other {{errors, plural, =0 "
      & "{{notices, number} meddelelser} one {1 fejl, {notices, number} "
      & "meddelelser} other {{errors, number} fejl, {notices, number} "
      & "meddelelser}}}}} one {{notices, plural, =0 {{errors, plural, =0 {1 "
      & "advarsel} one {1 fejl, 1 advarsel} other {{errors, number} fejl, 1 "
      & "advarsel}}} one {{errors, plural, =0 {1 advarsel, 1 meddelelse} one {1 "
      & "fejl, 1 advarsel, 1 meddelelse} other {{errors, number} fejl, 1 "
      & "advarsel, 1 meddelelse}}} other {{errors, plural, =0 {1 advarsel, "
      & "{notices, number} meddelelser} one {1 fejl, 1 advarsel, {notices, "
      & "number} meddelelser} other {{errors, number} fejl, 1 advarsel, "
      & "{notices, number} meddelelser}}}}} other {{notices, plural, =0 "
      & "{{errors, plural, =0 {{warnings, number} advarsler} one {1 fejl, "
      & "{warnings, number} advarsler} other {{errors, number} fejl, {warnings, "
      & "number} advarsler}}} one {{errors, plural, =0 {{warnings, number} "
      & "advarsler, 1 meddelelse} one {1 fejl, {warnings, number} advarsler, 1 "
      & "meddelelse} other {{errors, number} fejl, {warnings, number} "
      & "advarsler, 1 meddelelse}}} other {{errors, plural, =0 {{warnings, "
      & "number} advarsler, {notices, number} meddelelser} one {1 fejl, "
      & "{warnings, number} advarsler, {notices, number} meddelelser} other "
      & "{{errors, number} fejl, {warnings, number} advarsler, {notices, "
      & "number} meddelelser}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, linje "
      & "{line, number}} other {{path}, linje {line, number}, kolonne {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {byte-parser} duration_parser "
      & "{varighedsparser} date_time_parser {dato-tid-parser} color_parser "
      & "{farveparser} url_parser {URL-parser} unit_parser {enhedsparser} "
      & "recurrence_parser {gentagelsesparser} domain_label_parser "
      & "{domæneetiket-parser} other {parser}}: {position, plural, =0 "
      & "{ikke-understøttet syntaks {error}} other {ikke-understøttet syntaks "
      & "{error} ved position {position, number}}}; {family, select, "
      & "byte_parser {tilladt: B, kB, MB, GB, KiB, MiB, GiB eller TiB} "
      & "duration_parser {tilladt: ms, s, min, h, d, w, month eller year} "
      & "date_time_parser {tilladt: ISO-dato, naturlig dagsangivelse eller "
      & "klokkeslæt} color_parser {tilladt: hex, rgb(), hsl(), lab(), lch() "
      & "eller farvenavn} url_parser {tilladt: skema, vært, sti, forespørgsel "
      & "eller fragment} unit_parser {tilladt: en understøttet "
      & "Humanize-enhedsetiket} recurrence_parser {tilladt: cron eller en "
      & "every/weekday-gentagelsesform} domain_label_parser {tilladt: en "
      & "deterministisk Humanize-domæneetiket} other {tilladt: en "
      & "understøttet inputform}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {bestået} failed_check {mislykkedes} "
      & "warning_check {advarsler} skipped_check {sprunget over} pending_check "
      & "{afventer} other {kører}}, {notices, plural, =0 {ingen meddelelser} "
      & "one {1 meddelelse} other {{notices, number} meddelelser}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {forsøg 1 af 1} other "
      & "{forsøg {attempt, number} af 1 (grænse overskredet)}}} other "
      & "{forsøg {attempt, number} af {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {meddelelse} "
      & "warning_severity {advarsel} error_severity {fejl} critical_severity "
      & "{kritisk} other {blokerende}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {build-diagnostik} test_source "
      & "{testdiagnostik} lint_source {lint-diagnostik} import_source "
      & "{importdiagnostik} validation_source {valideringsdiagnostik} "
      & "runtime_source {kørselsdiagnostik} security_source "
      & "{sikkerhedsdiagnostik} other {diagnostik}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 {source, select, build_source {build-diagnose} "
      & "test_source {testdiagnose} lint_source {lint-diagnose} import_source "
      & "{importdiagnose} validation_source {valideringsdiagnose} "
      & "runtime_source {kørselsdiagnose} security_source {sikkerhedsdiagnose} "
      & "other {diagnose}}} other {{count, number} {source, select, "
      & "build_source {build-diagnoser} test_source {testdiagnoser} lint_source "
      & "{lint-diagnoser} import_source {importdiagnoser} validation_source "
      & "{valideringsdiagnoser} runtime_source {kørselsdiagnoser} "
      & "security_source {sikkerhedsdiagnoser} other {diagnoser}}}}");
   P ("label.diagnostics.suggested_action_label", "næste trin: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domænevært} ipv4_host {IPv4-adresse} "
      & "ipv6_host {IPv6-adresse} localhost_host {lokal vært} "
      & "private_network_host {adresse på privat netværk} other {ukendt "
      & "vært}}");
   P ("label.events.all_day_label", "{name} (hele dagen)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {ikke besvaret} accepted {accepteret} "
      & "declined {afvist} maybe {måske} other {på venteliste}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {ingen deltagere} one {1 deltager} other {{count, "
      & "number} deltagere}}");
   P ("label.events.canceled_label", "{name} aflyst");
   P ("label.events.check_in_label", "tjek ind til {name}");
   P ("label.events.conference_link_label", "mødelink til {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {ingen begivenheder} one {1 begivenhed} other "
      & "{{count, number} begivenheder}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {planlagt} tentative_event "
      & "{foreløbig} in_progress_event {i gang} completed_event {afsluttet} "
      & "canceled_event {aflyst} other {udsat}}");
   P ("label.events.event_location_label", "{name}, sted: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {planlagt begivenhed} tentative_event "
      & "{foreløbig begivenhed} in_progress_event {igangværende begivenhed} "
      & "completed_event {afsluttet begivenhed} canceled_event {aflyst "
      & "begivenhed} other {udsat begivenhed}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {offentlig begivenhed} private_event "
      & "{privat begivenhed} busy_event {vis som optaget} other {vis som "
      & "ledig}}");
   P ("label.events.organizer_label", "arrangeret af {name}");
   P ("label.events.rsvp_label",
      "svar: {state, select, not_responded {ikke besvaret} accepted "
      & "{accepteret} declined {afvist} maybe {måske} other {på venteliste}}");
   P ("label.events.reminder_label", "påmindelse: {time_text}");
   P ("label.events.rescheduled_label", "{name} flyttet til {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 tegn} other {{used, number} tegn}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {ingen tegngrænse} one {maks. 1 tegn} other {maks. "
      & "{limit, number} tegn}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 tegn} other {{used, number} "
      & "tegn}}} one {{used, number} af 1 tegn} other {{used, number} af "
      & "{limit, number} tegn}}");
   P ("label.forms.field_label",
      "{required, select, false {{name} (valgfrit)} other {{name} "
      & "(påkrævet)}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {gyldigt} invalid_input {ugyldigt} "
      & "required_input {påkrævet} optional_input {valgfrit} disabled_input "
      & "{deaktiveret} other {skrivebeskyttet}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {ingen problemer i "
      & "formularen} one {1 fejl} other {{errors, number} fejl}}} one {{errors, "
      & "plural, =0 {1 advarsel} one {1 fejl, 1 advarsel} other {{errors, "
      & "number} fejl, 1 advarsel}}} other {{errors, plural, =0 {{warnings, "
      & "number} advarsler} one {1 fejl, {warnings, number} advarsler} other "
      & "{{errors, number} fejl, {warnings, number} advarsler}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {ikke påbegyndt} editing_form "
      & "{redigeres} dirty_form {ikke-gemte ændringer} saving_form {gemmer} "
      & "saved_form {gemt} submitted_form {indsendt} other {indsendelse "
      & "mislykkedes}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {gyldigt input} invalid_input {ugyldigt "
      & "input} required_input {påkrævet input} optional_input {valgfrit "
      & "input} disabled_input {deaktiveret input} other {skrivebeskyttet "
      & "input}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {ikke påbegyndt} editing_form "
      & "{redigeres} dirty_form {ikke-gemte ændringer} saving_form {gemmer "
      & "formular} saved_form {formular gemt} submitted_form {formular "
      & "indsendt} other {{errors, plural, =0 {indsendelse mislykkedes} one "
      & "{indsendelse mislykkedes med 1 fejl} other {indsendelse mislykkedes "
      & "med {errors, number} fejl}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {ingen ikke-gemte ændringer} one {1 ikke-gemt "
      & "ændring} other {{count, number} ikke-gemte ændringer}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {tilgængeligt navn "
      & "mangler} low_contrast {lav kontrast} skipped_heading_level "
      & "{overskriftsniveau sprunget over} missing_form_label {formularetiket "
      & "mangler} invalid_aria {ugyldig ARIA} keyboard_trap {tastaturfælde} "
      & "other {ukendt tilgængelighedsproblem}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – tilgængelighed: {landmarks, plural, one {1 landmark} "
      & "other {{landmarks, number} landmarks}}, {headings, plural, one {1 "
      & "overskrift} other {{headings, number} overskrifter}}, {issues, plural, "
      & "one {1 problem} other {{issues, number} problemer}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {tilføj et tilgængeligt "
      & "navn} low_contrast {øg tekstkontrasten} skipped_heading_level {brug "
      & "fortløbende overskriftsniveauer} missing_form_label {knyt en etiket "
      & "til formularfeltet} invalid_aria {brug en gyldig ARIA-rolle eller en "
      & "gyldig ARIA-attribut} keyboard_trap {sørg for, at tastaturfokus kan "
      & "forlade komponenten} other {gennemgå tilgængelighedsproblemet}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {ingen tilgængelighedsproblemer} one {1 "
      & "tilgængelighedsproblem} other {{issues, number} "
      & "tilgængelighedsproblemer}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-attribut} class_attribute "
      & "{class-attribut} data_attribute {data-attribut} aria_attribute "
      & "{ARIA-attribut} role_attribute {role-attribut} link_attribute "
      & "{linkattribut} media_attribute {medieattribut} form_attribute "
      & "{formularattribut} boolean_attribute {boolesk attribut} "
      & "event_attribute {hændelseshåndteringsattribut} other {ukendt "
      & "attribut}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {warnings, plural, =0 {{errors, plural, =0 {ingen "
      & "problemer} one {1 fejl} other {{errors, number} fejl}}} one {{errors, "
      & "plural, =0 {1 advarsel} one {1 fejl, 1 advarsel} other {{errors, "
      & "number} fejl, 1 advarsel}}} other {{errors, plural, =0 {{warnings, "
      & "number} advarsler} one {1 fejl, {warnings, number} advarsler} other "
      & "{{errors, number} fejl, {warnings, number} advarsler}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner-landmark} navigation_role "
      & "{navigationslandmark} main_role {hovedlandmark} complementary_role "
      & "{supplerende landmark} contentinfo_role {indholdsinfo-landmark} "
      & "search_role {søgelandmark} form_role {formularlandmark} region_role "
      & "{områdelandmark} dialog_role {dialog} alert_role {alarm-liveområde} "
      & "status_role {status-liveområde} other {ukendt landmark}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {påtrængende opdatering} other "
      & "{høflig opdatering}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {tekstindhold} html_content {HTML-indhold} "
      & "json_content {JSON-indhold} xml_content {XML-indhold} image_content "
      & "{billedindhold} audio_content {lydindhold} video_content "
      & "{videoindhold} font_content {skrifttypeindhold} archive_content "
      & "{arkivindhold} binary_content {binært indhold} form_content "
      & "{formularindhold} other {ukendt indhold}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumenttag} metadata_tag {metadatatag} "
      & "section_tag {sektionstag} text_tag {teksttag} link_tag {linktag} "
      & "media_tag {medietag} form_tag {formulartag} table_tag {tabeltag} "
      & "interactive_tag {interaktivt tag} scripting_tag {scripttag} other "
      & "{ukendt tag}}");
   P ("label.media.duration_label", "varighed: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {billede} video_media {video} audio_media "
      & "{lyd} pdf_document {PDF-dokument} text_document {tekstdokument} "
      & "archive_media {arkiv} other {medie}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {klar} processing_media {behandles} "
      & "transcoding_media {omkodes} thumbnail_missing {miniature "
      & "utilgængelig} metadata_missing {metadata mangler} locked_document "
      & "{dokument låst} other {utilgængelig}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {billede} video_media {video} "
      & "audio_media {lyd} pdf_document {PDF-dokument} text_document "
      & "{tekstdokument} archive_media {arkiv} other {medie}}): {state, select, "
      & "ready_media {klar} processing_media {behandles} transcoding_media "
      & "{omkodes} thumbnail_missing {miniature utilgængelig} metadata_missing "
      & "{metadata mangler} locked_document {dokument låst} other "
      & "{utilgængelig}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {ingen sider} one {1 side} other {{pages, number} "
      & "sider}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: klage, {state, select, open_report {anmeldelse åben} "
      & "triaged_report {anmeldelse vurderet} actioned_report {handling "
      & "foretaget} dismissed_report {anmeldelse afvist} appealed_report "
      & "{anmeldelse påklaget} other {anmeldelse lukket}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {ingen moderationshandling} flagged "
      & "{markeret} hidden {skjult af moderator} restored {gendannet} "
      & "marked_spam {markeret som spam} removed {fjernet} other {eskaleret}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {ingen moderationshandling} flagged "
      & "{markeret} hidden {skjult af moderator} restored {gendannet} "
      & "marked_spam {markeret som spam} removed {fjernet} other {eskaleret}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderationskø tom} "
      & "other {{pending, number} afventer gennemgang}}} other {{pending, "
      & "number} afventer gennemgang, {escalated, number} eskaleret}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {åben anmeldelse} triaged_report "
      & "{vurderet anmeldelse} actioned_report {handling foretaget} "
      & "dismissed_report {afvist anmeldelse} appealed_report {påklaget "
      & "anmeldelse} other {lukket anmeldelse}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {åben anmeldelse} triaged_report "
      & "{vurderet anmeldelse} actioned_report {handling foretaget} "
      & "dismissed_report {afvist anmeldelse} appealed_report {påklaget "
      & "anmeldelse} other {lukket anmeldelse}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {afventer gennemgang} approved "
      & "{godkendt} rejected {afvist} needs_changes {kræver ændringer} other "
      & "{gennemgang eskaleret}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {afventer gennemgang} approved "
      & "{godkendt} rejected {afvist} needs_changes {kræver ændringer} other "
      & "{gennemgang eskaleret}}");
   P ("label.navigation.back_label", "tilbage til {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {ingen brødkrummer} one {1 brødkrumme} other "
      & "{{depth, number} brødkrummer}}");
   P ("label.navigation.current_page_label", "aktuel side: {name}");
   P ("label.navigation.external_link_label", "{name} (eksternt link)");
   P ("label.navigation.first_label", "første: {target}");
   P ("label.navigation.last_label", "sidste: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {ingen menupunkter} one {1 menupunkt} other "
      & "{{count, number} menupunkter}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {link} menu_item {menupunkt} tab_item {fane} "
      & "breadcrumb_item {brødkrumme} section_item {sektion} other "
      & "{separator}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {link} menu_item {menupunkt} tab_item "
      & "{fane} breadcrumb_item {brødkrumme} section_item {sektion} other "
      & "{separator}}, {state, select, current_item {aktuel} active_item "
      & "{aktiv} inactive_item {inaktiv} disabled_item {deaktiveret} "
      & "expanded_item {udvidet} collapsed_item {sammenklappet} visited_item "
      & "{besøgt} other {ekstern}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {aktuel} active_item {aktiv} "
      & "inactive_item {inaktiv} disabled_item {deaktiveret} expanded_item "
      & "{udvidet} collapsed_item {sammenklappet} visited_item {besøgt} other "
      & "{ekstern}}");
   P ("label.navigation.next_label", "næste: {target}");
end Labels_1;
