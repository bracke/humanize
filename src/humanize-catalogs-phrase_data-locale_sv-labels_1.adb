separate (Humanize.Catalogs.Phrase_Data.Locale_Sv)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktivt konto} invited_account "
      & "{inbjudet konto} locked_account {låst konto} suspended_account "
      & "{avstängt konto} deleted_account {borttaget konto} other {okänd "
      & "kontostatus}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktivt konto} invited_account "
      & "{inbjudet konto} locked_account {låst konto} suspended_account "
      & "{avstängt konto} deleted_account {borttaget konto} other {okänd "
      & "kontostatus}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {betrodd enhet} untrusted_device {ej "
      & "betrodd enhet} new_device {ny enhet} other {blockerad enhet}}");
   P ("label.accounts.last_active_label", "{name} senast aktiv {time_text}");
   P ("label.accounts.login_attempt_label",
      "{name}: {succeeded, select, false {inloggningen misslyckades} other "
      & "{inloggningen lyckades}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA aktiverad} mfa_disabled {MFA "
      & "inaktiverad} mfa_required {MFA krävs} other {MFA måste "
      & "återställas}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktiv session} expired_session "
      & "{sessionen har gått ut} revoked_session {sessionen har återkallats} "
      & "idle_session {inaktiv session} other {okänd sessionsstatus}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktiv session} expired_session "
      & "{sessionen har gått ut} revoked_session {sessionen har återkallats} "
      & "idle_session {inaktiv session} other {okänd sessionsstatus}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {inga bilagor} one {1 bilaga} other {{count, "
      & "number} bilagor}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, one {1 bilaga} other {{count, number} "
      & "bilagor}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {filbilaga} image_attachment "
      & "{bildbilaga} video_attachment {videobilaga} audio_attachment "
      & "{ljudbilaga} document_attachment {dokumentbilaga} archive_attachment "
      & "{arkivbilaga} other {länkbilaga}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {fil} image_attachment {bild} "
      & "video_attachment {video} audio_attachment {ljud} document_attachment "
      & "{dokument} archive_attachment {arkiv} other {länk}}): {state, select, "
      & "pending_attachment {väntar} uploading_attachment {laddas upp} "
      & "uploaded_attachment {har laddats upp} failed_attachment {misslyckades} "
      & "removed_attachment {har tagits bort} other {har blockerats}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {väntande bilaga} "
      & "uploading_attachment {bilaga laddas upp} uploaded_attachment "
      & "{uppladdad bilaga} failed_attachment {misslyckad bilaga} "
      & "removed_attachment {borttagen bilaga} other {blockerad bilaga}}");
   P ("label.attachments.download_label", "ladda ned {name}");
   P ("label.attachments.expiring_link_label", "länken till {name} går ut {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "förhandsgranska {name}");
   P ("label.attachments.remove_label", "ta bort {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {inte genomsökt} scanning "
      & "{genomsöks} safe {säker} suspicious {misstänkt} other {infekterad}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {inte genomsökt} scanning {genomsöks} "
      & "safe {genomsökning: säker} suspicious {genomsökning: misstänkt} "
      & "other {genomsökning: infekterad}}");
   P ("label.attachments.upload_error_label", "uppladdningen av {name} misslyckades: {reason}");
   P ("label.badges.badge_label",
      "{name}, {state, select, default_badge {märke} new_badge {nytt märke} "
      & "updated_badge {uppdaterat märke} deprecated_badge {föråldrat "
      & "märke} selected_badge {markerat märke} disabled_badge {inaktiverat "
      & "märke} other {stängbart märke}} ({tone, select, neutral_tone "
      & "{neutral} info_tone {info} success_tone {framgång} warning_tone "
      & "{varning} danger_tone {fara} other {nedtonad}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {märke med låg prioritet} "
      & "medium_priority {märke med medelhög prioritet} high_priority {märke "
      & "med hög prioritet} other {märke med kritisk prioritet}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {standardmärke} new_badge {nytt märke} "
      & "updated_badge {uppdaterat märke} deprecated_badge {föråldrat "
      & "märke} selected_badge {markerat märke} disabled_badge {inaktiverat "
      & "märke} other {stängbart märke}}");
   P ("label.badges.badge_tone_label",
      "märke: {tone, select, neutral_tone {neutral} info_tone {info} "
      & "success_tone {framgång} warning_tone {varning} danger_tone {fara} "
      & "other {nedtonad}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}, chip} other {{name}, chip, "
      & "markerat}}");
   P ("label.badges.count_badge_label", "{name}: {count, plural, =0 {inga} other {{count, number}}}");
   P ("label.badges.deprecated_label", "{name}, föråldrat märke");
   P ("label.badges.dismiss_label", "stäng {name}");
   P ("label.badges.new_label", "{name}, nytt märke");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {inga dolda märken} one {+1 märke till} "
      & "other {+{hidden_count, number} märken till}}");
   P ("label.badges.priority_badge_label",
      "{name}, {priority, select, low_priority {märke med låg prioritet} "
      & "medium_priority {märke med medelhög prioritet} high_priority {märke "
      & "med hög prioritet} other {märke med kritisk prioritet}}");
   P ("label.badges.status_badge_label",
      "{name}, status: {tone, select, neutral_tone {neutral} info_tone {info} "
      & "success_tone {framgång} warning_tone {varning} danger_tone {fara} "
      & "other {nedtonad}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {inga taggar} one {1 tagg} other {{count, number} "
      & "taggar}}");
   P ("label.badges.tag_label", "tagg {name}");
   P ("label.badges.updated_label", "{name}, uppdaterat märke");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt uppladdad} "
      & "artifact_missing {artefakt saknas} artifact_expired {artefakt har "
      & "gått ut} other {artefakt verifierad}}");
   P ("label.builds.benchmark_label", "prestandatest {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {bygget i kö} build_running "
      & "{bygget körs} build_passed {bygget lyckades} build_failed {bygget "
      & "misslyckades} snapshot_build {snapshot-bygge} other {release-bygge}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {bygget i kö} build_running {bygget "
      & "körs} build_passed {bygget lyckades} build_failed {bygget "
      & "misslyckades} snapshot_build {snapshot-bygge} other {release-bygge}}");
   P ("label.builds.coverage_label", "täckning {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {releasekontroll godkänd} gate_failed "
      & "{releasekontroll underkänd} gate_warning {releasekontroll: varning} "
      & "other {releasekontroll blockerad}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {inga godkända "
      & "tester} one {1 godkänt test} other {{count, number} godkända "
      & "tester}}} failed_test {{count, plural, =0 {inga misslyckade tester} "
      & "one {1 misslyckat test} other {{count, number} misslyckade tester}}} "
      & "skipped_test {{count, plural, =0 {inga överhoppade tester} one {1 "
      & "överhoppat test} other {{count, number} överhoppade tester}}} "
      & "flaky_test {{count, plural, =0 {inga instabila tester} one {1 "
      & "instabilt test} other {{count, number} instabila tester}}} other "
      & "{{count, plural, =0 {inga förväntat misslyckade tester} one {1 "
      & "förväntat misslyckat test} other {{count, number} förväntat "
      & "misslyckade tester}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {godkänt} failed_test {misslyckat} "
      & "skipped_test {överhoppat} flaky_test {instabilt} other {förväntat "
      & "misslyckande}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "oförändrad: inaktiverad} other {{field_name} ändrad från "
      & "inaktiverad till aktiverad}}} other {{new_value, select, false "
      & "{{field_name} ändrad från aktiverad till inaktiverad} other "
      & "{{field_name} oförändrad: aktiverad}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {tillagd} removed_change {borttagen} "
      & "modified_change {ändrad} renamed_change {omdöpt} unchanged_change "
      & "{oförändrad} metadata_change {metadata ändrad} moved_change "
      & "{flyttad} conflict_change {konflikt} other {okänd ändring}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informativ ändring} "
      & "minor_change {mindre ändring} major_change {större ändring} other "
      & "{bakåtinkompatibel ändring}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} oförändrad} "
      & "other {{unchanged, plural, =0 {{field_name} ändrad: {added, number} "
      & "tillagda} other {{field_name} ändrad: {added, number} tillagda, "
      & "{unchanged, number} oförändrade}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} ändrad: {removed, number} "
      & "borttagna} other {{field_name} ändrad: {removed, number} borttagna, "
      & "{unchanged, number} oförändrade}}} other {{unchanged, plural, =0 "
      & "{{field_name} ändrad: {added, number} tillagda, {removed, number} "
      & "borttagna} other {{field_name} ändrad: {added, number} tillagda, "
      & "{removed, number} borttagna, {unchanged, number} oförändrade}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {inga konflikter} one {1 konflikt} other {{count, "
      & "number} konflikter}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} senarelagd från {old_label} "
      & "till {new_label}} other {{field_name} tidigarelagd från {old_label} "
      & "till {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} ändrad från {old_label} till {new_label}");
   P ("label.changes.field_change_label", "{field_name} ändrad från {old_value} till {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {tillagd} removed_change "
      & "{borttagen} modified_change {ändrad} renamed_change {omdöpt} "
      & "unchanged_change {oförändrad} metadata_change {metadata ändrad} "
      & "moved_change {flyttad} conflict_change {konflikt} other {okänd "
      & "ändring}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {endast metadata ändrad} one {endast 1 "
      & "metadatafält ändrat} other {endast {count, number} metadatafält "
      & "ändrade}}");
   P ("label.changes.move_label", "{name} flyttad från {from} till {to}");
   P ("label.changes.no_changes_label", "inga ändringar");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {inga "
      & "radändringar} one {1 rad tillagd} other {{lines_added, number} rader "
      & "tillagda}}} one {{lines_added, plural, =0 {1 rad borttagen} one {1 rad "
      & "tillagd, 1 rad borttagen} other {{lines_added, number} rader tillagda, "
      & "1 rad borttagen}}} other {{lines_added, plural, =0 {{lines_removed, "
      & "number} rader borttagna} one {1 rad tillagd, {lines_removed, number} "
      & "rader borttagna} other {{lines_added, number} rader tillagda, "
      & "{lines_removed, number} rader borttagna}}}}");
   P ("label.changes.rename_label", "omdöpt från {old_name} till {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} skrev ett kommentarsutkast} "
      & "published_comment {{author} kommenterade} edited_comment {{author} "
      & "redigerade en kommentar} deleted_comment {{author} tog bort en "
      & "kommentar} resolved_comment {{author} markerade en kommentar som "
      & "löst} unresolved_comment {{author} öppnade en kommentar igen} "
      & "pinned_comment {{author} fäste en kommentar} other {{author} dolde en "
      & "kommentar}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {inga kommentarer} one {1 kommentar} other {{count, "
      & "number} kommentarer}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {kommentarsutkast} "
      & "published_comment {publicerad kommentar} edited_comment {redigerad "
      & "kommentar} deleted_comment {borttagen kommentar} resolved_comment "
      & "{löst kommentar} unresolved_comment {olöst kommentar} pinned_comment "
      & "{fäst kommentar} other {dold kommentar}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {kommentarsutkast} published_comment "
      & "{publicerad kommentar} edited_comment {redigerad kommentar} "
      & "deleted_comment {borttagen kommentar} resolved_comment {löst "
      & "kommentar} unresolved_comment {olöst kommentar} pinned_comment {fäst "
      & "kommentar} other {dold kommentar}}");
   P ("label.comments.deleted_label", "{author} tog bort en kommentar");
   P ("label.comments.edited_label", "redigerad {time_text}");
   P ("label.comments.hide_comment_label", "dölj kommentar: {reason}");
   P ("label.comments.lock_thread_label", "lås tråden {name}");
   P ("label.comments.mention_label", "{actor} nämnde {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {inga deltagare} one {1 deltagare} other {{count, "
      & "number} deltagare}}");
   P ("label.comments.pin_label", "fäst {name}");
   P ("label.comments.reaction_kind_label",
      "reaktion: {kind, select, like_reaction {gilla} dislike_reaction "
      & "{ogilla} heart_reaction {hjärta} laugh_reaction {skratt} "
      & "confused_reaction {förvirrad} hooray_reaction {hurra} rocket_reaction "
      & "{raket} other {ögon}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {inga "
      & "gilla-markeringar} one {1 gilla-markering} other {{count, number} "
      & "gilla-markeringar}}} dislike_reaction {{count, plural, =0 {inga "
      & "ogilla-markeringar} one {1 ogilla-markering} other {{count, number} "
      & "ogilla-markeringar}}} heart_reaction {{count, plural, =0 {inga "
      & "hjärtan} one {1 hjärta} other {{count, number} hjärtan}}} "
      & "laugh_reaction {{count, plural, =0 {inga skratt} one {1 skratt} other "
      & "{{count, number} skratt}}} confused_reaction {{count, plural, =0 {inga "
      & "förvirrade reaktioner} one {1 förvirrad reaktion} other {{count, "
      & "number} förvirrade reaktioner}}} hooray_reaction {{count, plural, =0 "
      & "{inga hurrarop} one {1 hurrarop} other {{count, number} hurrarop}}} "
      & "rocket_reaction {{count, plural, =0 {inga raketer} one {1 raket} other "
      & "{{count, number} raketer}}} other {{count, plural, =0 {inga "
      & "ögon-reaktioner} one {1 ögon-reaktion} other {{count, number} "
      & "ögon-reaktioner}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {inga svar} one {1 svar} other {{count, number} "
      & "svar}}");
   P ("label.comments.resolved_label", "{name} löst");
   P ("label.comments.subscribe_label", "prenumerera på {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {inga trådar} one {1 tråd} other {{count, number} "
      & "trådar}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {öppen tråd} resolved_thread "
      & "{löst tråd} locked_thread {låst tråd} other {arkiverad "
      & "tråd}}{count, plural, =0 {} one {, 1 kommentar} other {, {count, "
      & "number} kommentarer}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {öppen tråd} resolved_thread {löst "
      & "tråd} locked_thread {låst tråd} other {arkiverad tråd}}");
   P ("label.comments.unpin_label", "lossa {name}");
   P ("label.comments.unsubscribe_label", "avsluta prenumerationen på {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {förbättrad} regressed "
      & "{försämrad} unchanged {oförändrad} within_tolerance {inom "
      & "toleransen} outside_tolerance {utanför toleransen} new_value {ny} "
      & "removed_value {borttagen} other {baslinje saknas}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {förbättrad} regressed {försämrad} "
      & "unchanged {oförändrad} within_tolerance {inom toleransen} "
      & "outside_tolerance {utanför toleransen} new_value {ny} removed_value "
      & "{borttagen} other {baslinje saknas}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {förbättrad} regressed "
      & "{försämrad} unchanged {oförändrad} within_tolerance {inom "
      & "toleransen} outside_tolerance {utanför toleransen} new_value {ny} "
      & "removed_value {borttagen} other {baslinje saknas}} ({difference_text})");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {förbättrad} regressed "
      & "{försämrad} unchanged {oförändrad} within_tolerance {inom "
      & "toleransen} outside_tolerance {utanför toleransen} new_value {ny} "
      & "removed_value {borttagen} other {baslinje saknas}} ({difference_text}, "
      & "tolerans {tolerance_text})");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ogiltig rad} duplicate_record "
      & "{dubblettpost} missing_column {saknad kolumn} unknown_field {okänt "
      & "fält} schema_mismatch {schemaavvikelse} other {överhoppad post}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {testkörning godkänd} dry_run_failed "
      & "{testkörning misslyckades} import_valid {importen giltig} "
      & "import_invalid {importen ogiltig} other {delvis import}}");
   P ("label.data_quality.import_result_label",
      "{name} ({state, select, dry_run_passed {testkörning godkänd} "
      & "dry_run_failed {testkörning misslyckades} import_valid {importen "
      & "giltig} import_invalid {importen ogiltig} other {delvis import}}): "
      & "{accepted, number} accepterade, {rejected, number} avvisade");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {inga ogiltiga rader} "
      & "one {1 ogiltig rad} other {{count, number} ogiltiga rader}}} "
      & "duplicate_record {{count, plural, =0 {inga dubblettposter} one {1 "
      & "dubblettpost} other {{count, number} dubblettposter}}} missing_column "
      & "{{count, plural, =0 {inga saknade kolumner} one {1 saknad kolumn} "
      & "other {{count, number} saknade kolumner}}} unknown_field {{count, "
      & "plural, =0 {inga okända fält} one {1 okänt fält} other {{count, "
      & "number} okända fält}}} schema_mismatch {{count, plural, =0 {inga "
      & "schemaavvikelser} one {1 schemaavvikelse} other {{count, number} "
      & "schemaavvikelser}}} other {{count, plural, =0 {inga överhoppade "
      & "poster} one {1 överhoppad post} other {{count, number} överhoppade "
      & "poster}}}}");
   P ("label.data_quality.row_issue_label",
      "rad {row, number}: {issue, select, invalid_row {ogiltig} "
      & "duplicate_record {dubblettpost} missing_column {saknad kolumn} "
      & "unknown_field {okänt fält} schema_mismatch {schemaavvikelse} other "
      & "{överhoppad post}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {ogiltig rad} "
      & "duplicate_record {dubblettpost} missing_column {saknad kolumn} "
      & "unknown_field {okänt fält} schema_mismatch {schemaavvikelse} other "
      & "{överhoppad post}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt klar} artifact_uploaded "
      & "{artefakt uppladdad} artifact_signed {artefakt signerad} "
      & "artifact_missing {artefakt saknas} other {artefakt utgången}}");
   P ("label.deployments.deployment_label",
      "{name} till {environment}: {state, select, queued_deployment "
      & "{driftsättning i kö} deploying {driftsätts} deployed {driftsatt} "
      & "failed_deployment {driftsättning misslyckades} rolled_back "
      & "{återställd} blocked_deployment {driftsättning blockerad} other "
      & "{driftsättning avbruten}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {driftsättning i kö} deploying "
      & "{driftsätts} deployed {driftsatt} failed_deployment {driftsättning "
      & "misslyckades} rolled_back {återställd} blocked_deployment "
      & "{driftsättning blockerad} other {driftsättning avbruten}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {miljö felfri} "
      & "drifting_environment {miljöavvikelse} locked_environment {miljö "
      & "låst} maintenance_environment {miljö under underhåll} other {okänt "
      & "miljötillstånd}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {ingen migrering} migration_pending "
      & "{migrering väntar} migrating {migrerar} migration_complete {migrering "
      & "klar} other {migrering misslyckades}}");
   P ("label.deployments.promotion_label", "{name} uppflyttad från {from_environment} till {to_environment}");
   P ("label.deployments.rollback_label", "{name}: återställning till {target}");
   P ("label.deployments.rollout_label", "{name}: utrullning {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {inga berörda objekt} one {1 berört objekt} other "
      & "{{count, number} berörda objekt}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: godkänd ({duration_s, plural, "
      & "one {1 sekund} other {{duration_s, number} sekunder}})} failed_check "
      & "{{name}: misslyckad ({duration_s, plural, one {1 sekund} other "
      & "{{duration_s, number} sekunder}})} warning_check {{name}: varningar "
      & "({duration_s, plural, one {1 sekund} other {{duration_s, number} "
      & "sekunder}})} skipped_check {{name}: överhoppad ({duration_s, plural, "
      & "one {1 sekund} other {{duration_s, number} sekunder}})} pending_check "
      & "{{name}: väntar ({duration_s, plural, one {1 sekund} other "
      & "{{duration_s, number} sekunder}})} other {{name}: körs ({duration_s, "
      & "plural, one {1 sekund} other {{duration_s, number} sekunder}})}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: godkänd} failed_check {{name}: "
      & "misslyckad} warning_check {{name}: varningar} skipped_check {{name}: "
      & "överhoppad} pending_check {{name}: väntar} other {{name}: körs}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {godkänd} failed_check {misslyckad} "
      & "warning_check {varningar} skipped_check {överhoppad} pending_check "
      & "{väntar} other {körs}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {förväntade ett värde för {subject}} "
      & "expected_unit {förväntade en enhet för {subject}} invalid_range "
      & "{ogiltigt intervall för {subject}} end_before_start {intervallets "
      & "slut ligger före starten för {subject}} unknown_field {okänt fält "
      & "för {subject}} unsafe_redacted_value {osäkert värde maskerades för "
      & "{subject}} unsupported_syntax {syntax som inte stöds för {subject}} "
      & "other {diagnosförklaring för {subject}}}{position, plural, =0 {;} "
      & "other { vid position {position, number};}} använd {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {info} notice_severity {meddelande} "
      & "warning_severity {varning} error_severity {fel} critical_severity "
      & "{kritiskt} other {blockerande}} i {path}{line, plural, =0 {:} other {, "
      & "rad {line, number}:}} {message}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {misslyckades i {path}} other {{column, plural, =0 "
      & "{misslyckades i {path}, rad {line, number}} other {misslyckades i "
      & "{path}, rad {line, number}, kolumn {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info} notice_severity {meddelande} "
      & "warning_severity {varning} error_severity {fel} critical_severity "
      & "{kritiskt} other {blockerande}} i {field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {första felet i {check_name} vid {path}} other "
      & "{första felet i {check_name} vid {path}, rad {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 {inga "
      & "problem} one {1 meddelande} other {{notices, number} meddelanden}}} "
      & "one {{notices, plural, =0 {1 varning} one {1 varning, 1 meddelande} "
      & "other {1 varning, {notices, number} meddelanden}}} other {{notices, "
      & "plural, =0 {{warnings, number} varningar} one {{warnings, number} "
      & "varningar, 1 meddelande} other {{warnings, number} varningar, "
      & "{notices, number} meddelanden}}}}} one {{warnings, plural, =0 "
      & "{{notices, plural, =0 {1 fel} one {1 fel, 1 meddelande} other {1 fel, "
      & "{notices, number} meddelanden}}} one {{notices, plural, =0 {1 fel, 1 "
      & "varning} one {1 fel, 1 varning, 1 meddelande} other {1 fel, 1 varning, "
      & "{notices, number} meddelanden}}} other {{notices, plural, =0 {1 fel, "
      & "{warnings, number} varningar} one {1 fel, {warnings, number} "
      & "varningar, 1 meddelande} other {1 fel, {warnings, number} varningar, "
      & "{notices, number} meddelanden}}}}} other {{warnings, plural, =0 "
      & "{{notices, plural, =0 {{errors, number} fel} one {{errors, number} "
      & "fel, 1 meddelande} other {{errors, number} fel, {notices, number} "
      & "meddelanden}}} one {{notices, plural, =0 {{errors, number} fel, 1 "
      & "varning} one {{errors, number} fel, 1 varning, 1 meddelande} other "
      & "{{errors, number} fel, 1 varning, {notices, number} meddelanden}}} "
      & "other {{notices, plural, =0 {{errors, number} fel, {warnings, number} "
      & "varningar} one {{errors, number} fel, {warnings, number} varningar, 1 "
      & "meddelande} other {{errors, number} fel, {warnings, number} varningar, "
      & "{notices, number} meddelanden}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, rad "
      & "{line, number}} other {{path}, rad {line, number}, kolumn {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "syntax som inte stöds av {family, select, byte_parser {byte-tolken} "
      & "duration_parser {varaktighetstolken} date_time_parser "
      & "{datum/tid-tolken} color_parser {färgtolken} url_parser {URL-tolken} "
      & "unit_parser {enhetstolken} recurrence_parser {upprepningstolken} "
      & "domain_label_parser {domänetikett-tolken} other {tolken}}: "
      & "{error}{position, plural, =0 {;} other { vid position {position, "
      & "number};}} {family, select, byte_parser {använd B, kB, MB, GB, KiB, "
      & "MiB, GiB eller TiB} duration_parser {använd ms, s, min, h, d, w, "
      & "month eller year} date_time_parser {använd ISO-datum, naturlig dag "
      & "eller klockslag} color_parser {använd hex, rgb(), hsl(), lab(), lch() "
      & "eller ett färgnamn} url_parser {använd schema, värd, sökväg, "
      & "fråga eller fragment} unit_parser {använd en enhetsetikett som "
      & "Humanize stöder} recurrence_parser {använd cron eller "
      & "upprepningsformen every/weekday} domain_label_parser {använd en "
      & "deterministisk Humanize-domänetikett} other {använd en "
      & "inmatningsform som stöds}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {godkänd} failed_check {misslyckad} "
      & "warning_check {varningar} skipped_check {överhoppad} pending_check "
      & "{väntar} other {körs}}, {notices, plural, =0 {inga meddelanden} one "
      & "{1 meddelande} other {{notices, number} meddelanden}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {nytt försök 1 av 1} "
      & "other {nytt försök {attempt, number} av 1 – gränsen "
      & "överskriden}}} other {nytt försök {attempt, number} av {limit, "
      & "number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {meddelande} "
      & "warning_severity {varning} error_severity {fel} critical_severity "
      & "{kritiskt} other {blockerande}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {byggdiagnostik} test_source "
      & "{testdiagnostik} lint_source {lint-diagnostik} import_source "
      & "{importdiagnostik} validation_source {valideringsdiagnostik} "
      & "runtime_source {körtidsdiagnostik} security_source "
      & "{säkerhetsdiagnostik} other {diagnostik}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 {source, select, build_source {byggdiagnos} "
      & "test_source {testdiagnos} lint_source {lint-diagnos} import_source "
      & "{importdiagnos} validation_source {valideringsdiagnos} runtime_source "
      & "{körtidsdiagnos} security_source {säkerhetsdiagnos} other "
      & "{diagnos}}} other {{count, number} {source, select, build_source "
      & "{byggdiagnoser} test_source {testdiagnoser} lint_source "
      & "{lint-diagnoser} import_source {importdiagnoser} validation_source "
      & "{valideringsdiagnoser} runtime_source {körtidsdiagnoser} "
      & "security_source {säkerhetsdiagnoser} other {diagnoser}}}}");
   P ("label.diagnostics.suggested_action_label", "nästa steg: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domänvärd} ipv4_host {IPv4-adress} "
      & "ipv6_host {IPv6-adress} localhost_host {lokal värd} "
      & "private_network_host {adress i privat nätverk} other {okänd värd}}");
   P ("label.events.all_day_label", "{name}, heldagshändelse");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {inte svarat} accepted {accepterat} "
      & "declined {avböjt} maybe {kanske} other {på väntelista}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {inga deltagare} one {1 deltagare} other {{count, "
      & "number} deltagare}}");
   P ("label.events.canceled_label", "{name} inställd");
   P ("label.events.check_in_label", "checka in på {name}");
   P ("label.events.conference_link_label", "konferenslänk för {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {inga händelser} one {1 händelse} other {{count, "
      & "number} händelser}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: schemalagd} tentative_event "
      & "{{name}: preliminär} in_progress_event {{name}: pågår} "
      & "completed_event {{name}: avslutad} canceled_event {{name}: inställd} "
      & "other {{name}: uppskjuten}}");
   P ("label.events.event_location_label", "{name}, plats: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {schemalagd händelse} tentative_event "
      & "{preliminär händelse} in_progress_event {pågående händelse} "
      & "completed_event {avslutad händelse} canceled_event {inställd "
      & "händelse} other {uppskjuten händelse}}");
   P ("label.events.event_time_label", "{name}, tid: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {offentlig händelse} private_event "
      & "{privat händelse} busy_event {visas som upptagen} other {visas som "
      & "ledig}}");
   P ("label.events.organizer_label", "organisatör: {name}");
   P ("label.events.rsvp_label",
      "OSA: {state, select, not_responded {inte svarat} accepted {accepterat} "
      & "declined {avböjt} maybe {kanske} other {på väntelista}}");
   P ("label.events.reminder_label", "påminnelse: {time_text}");
   P ("label.events.rescheduled_label", "{name} flyttad till {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 tecken} other {{used, number} tecken}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {ingen teckengräns} one {högst 1 tecken} other "
      & "{högst {limit, number} tecken}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 tecken} other {{used, "
      & "number} tecken}}} other {{used, number} av {limit, number} tecken}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, valfritt fält} other {{name}, "
      & "obligatoriskt fält}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: giltigt} invalid_input {{name}: "
      & "ogiltigt} required_input {{name}: obligatoriskt} optional_input "
      & "{{name}: valfritt} disabled_input {{name}: inaktiverat} other {{name}: "
      & "skrivskyddat}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {inga formulärproblem} one "
      & "{1 varning} other {{warnings, number} varningar}}} one {{warnings, "
      & "plural, =0 {1 fel} one {1 fel, 1 varning} other {1 fel, {warnings, "
      & "number} varningar}}} other {{warnings, plural, =0 {{errors, number} "
      & "fel} one {{errors, number} fel, 1 varning} other {{errors, number} "
      & "fel, {warnings, number} varningar}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {inte påbörjat} editing_form "
      & "{redigeras} dirty_form {osparade ändringar} saving_form {sparar} "
      & "saved_form {sparat} submitted_form {skickat} other {inskickning "
      & "misslyckades}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {giltig inmatning} invalid_input {ogiltig "
      & "inmatning} required_input {obligatorisk inmatning} optional_input "
      & "{valfri inmatning} disabled_input {inaktiverad inmatning} other "
      & "{skrivskyddad inmatning}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {inte påbörjat} editing_form "
      & "{redigeras} dirty_form {osparade ändringar} saving_form {sparar "
      & "formulär} saved_form {formulär sparat} submitted_form {formulär "
      & "skickat} other {{errors, plural, =0 {inskickning misslyckades} one "
      & "{inskickning misslyckades med 1 fel} other {inskickning misslyckades "
      & "med {errors, number} fel}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {inga osparade ändringar} one {1 osparad ändring} "
      & "other {{count, number} osparade ändringar}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: saknar "
      & "tillgängligt namn} low_contrast {{target}: låg kontrast} "
      & "skipped_heading_level {{target}: överhoppad rubriknivå} "
      & "missing_form_label {{target}: saknar formuläretikett} invalid_aria "
      & "{{target}: ogiltig ARIA} keyboard_trap {{target}: tangentbordsfälla} "
      & "other {{target}: okänt tillgänglighetsproblem}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}, tillgänglighet: {landmarks, plural, one {1 landmärke} other "
      & "{{landmarks, number} landmärken}}, {headings, plural, one {1 rubrik} "
      & "other {{headings, number} rubriker}}, {issues, plural, one {1 problem} "
      & "other {{issues, number} problem}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {lägg till ett tillgängligt "
      & "namn} low_contrast {öka textkontrasten} skipped_heading_level "
      & "{använd rubriknivåer i följd} missing_form_label {koppla en etikett "
      & "till formulärkontrollen} invalid_aria {använd en giltig ARIA-roll "
      & "eller ett giltigt ARIA-attribut} keyboard_trap {se till att "
      & "tangentbordsfokus kan lämna komponenten} other {granska "
      & "tillgänglighetsproblemet}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} har inga tillgänglighetsproblem} one "
      & "{{target} har 1 tillgänglighetsproblem} other {{target} har {issues, "
      & "number} tillgänglighetsproblem}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-attribut} class_attribute "
      & "{class-attribut} data_attribute {data-attribut} aria_attribute "
      & "{ARIA-attribut} role_attribute {role-attribut} link_attribute "
      & "{länkattribut} media_attribute {mediaattribut} form_attribute "
      & "{formulärattribut} boolean_attribute {booleskt attribut} "
      & "event_attribute {händelsehanterarattribut} other {okänt attribut}}");
   P ("label.markup.form_error_summary_label",
      "{form_name} har {errors, plural, =0 {{warnings, plural, =0 {inga "
      & "formulärproblem} one {1 varning} other {{warnings, number} "
      & "varningar}}} one {{warnings, plural, =0 {1 fel} one {1 fel, 1 varning} "
      & "other {1 fel, {warnings, number} varningar}}} other {{warnings, "
      & "plural, =0 {{errors, number} fel} one {{errors, number} fel, 1 "
      & "varning} other {{errors, number} fel, {warnings, number} varningar}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner-landmärke} navigation_role "
      & "{navigeringslandmärke} main_role {huvudlandmärke} complementary_role "
      & "{kompletterande landmärke} contentinfo_role "
      & "{innehållsinfo-landmärke} search_role {söklandmärke} form_role "
      & "{formulärlandmärke} region_role {regionlandmärke} dialog_role "
      & "{dialogruta} alert_role {levande region för varningar} status_role "
      & "{levande region för status} other {okänt landmärke}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {brådskande} other {artig}} "
      & "uppdatering: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {textinnehåll} html_content "
      & "{HTML-innehåll} json_content {JSON-innehåll} xml_content "
      & "{XML-innehåll} image_content {bildinnehåll} audio_content "
      & "{ljudinnehåll} video_content {videoinnehåll} font_content "
      & "{teckensnittsinnehåll} archive_content {arkivinnehåll} "
      & "binary_content {binärt innehåll} form_content {formulärinnehåll} "
      & "other {okänt innehåll}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumenttagg} metadata_tag {metadatatagg} "
      & "section_tag {sektionstagg} text_tag {texttagg} link_tag {länktagg} "
      & "media_tag {mediatagg} form_tag {formulärtagg} table_tag {tabelltagg} "
      & "interactive_tag {interaktiv tagg} scripting_tag {skripttagg} other "
      & "{okänd tagg}}");
   P ("label.media.duration_label", "längd: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {bild} video_media {video} audio_media "
      & "{ljud} pdf_document {PDF-dokument} text_document {textdokument} "
      & "archive_media {arkiv} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {klar} processing_media {bearbetas} "
      & "transcoding_media {omkodas} thumbnail_missing {miniatyr ej "
      & "tillgänglig} metadata_missing {metadata saknas} locked_document "
      & "{dokument låst} other {otillgänglig}}");
   P ("label.media.media_summary",
      "{name}, {kind, select, image_media {bild} video_media {video} "
      & "audio_media {ljud} pdf_document {PDF-dokument} text_document "
      & "{textdokument} archive_media {arkiv} other {media}}: {state, select, "
      & "ready_media {klar} processing_media {bearbetas} transcoding_media "
      & "{omkodas} thumbnail_missing {miniatyr ej tillgänglig} "
      & "metadata_missing {metadata saknas} locked_document {låst} other "
      & "{otillgänglig}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {inga sidor} one {1 sida} other {{pages, number} "
      & "sidor}}");
   P ("label.media.resolution_label", "{width, number}x{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: överklagande, {state, select, open_report {öppen anmälan} "
      & "triaged_report {bedömd anmälan} actioned_report {åtgärd vidtagen} "
      & "dismissed_report {avvisad anmälan} appealed_report {överklagad "
      & "anmälan} other {stängd anmälan}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {ingen modereringsåtgärd} flagged "
      & "{flaggad} hidden {dold av moderator} restored {återställd} "
      & "marked_spam {markerad som skräppost} removed {borttagen} other "
      & "{eskalerad}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {ingen modereringsåtgärd} flagged "
      & "{flaggad} hidden {dold av moderator} restored {återställd} "
      & "marked_spam {markerad som skräppost} removed {borttagen} other "
      & "{eskalerad}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {modereringskön är tom} "
      & "other {{pending, number} väntar på granskning}}} one {{pending, "
      & "number} väntar på granskning, 1 eskalerad} other {{pending, number} "
      & "väntar på granskning, {escalated, number} eskalerade}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {öppen anmälan} triaged_report "
      & "{bedömd anmälan} actioned_report {åtgärd vidtagen} "
      & "dismissed_report {avvisad anmälan} appealed_report {överklagad "
      & "anmälan} other {stängd anmälan}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {öppen anmälan} triaged_report {bedömd "
      & "anmälan} actioned_report {åtgärd vidtagen} dismissed_report "
      & "{avvisad anmälan} appealed_report {överklagad anmälan} other "
      & "{stängd anmälan}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {väntar på granskning} "
      & "approved {godkänd} rejected {avvisad} needs_changes {kräver "
      & "ändringar} other {granskning eskalerad}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {väntar på granskning} approved "
      & "{godkänd} rejected {avvisad} needs_changes {kräver ändringar} other "
      & "{granskning eskalerad}}");
   P ("label.navigation.back_label", "tillbaka till {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {inga brödsmulor} one {1 brödsmula} other "
      & "{{depth, number} brödsmulor}}");
   P ("label.navigation.current_page_label", "aktuell sida: {name}");
   P ("label.navigation.external_link_label", "{name} (extern länk)");
   P ("label.navigation.first_label", "första: {target}");
   P ("label.navigation.last_label", "sista: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {inga menyalternativ} one {1 menyalternativ} other "
      & "{{count, number} menyalternativ}}");
end Labels_1;
