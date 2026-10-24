separate (Humanize.Catalogs.Phrase_Data.Locale_Nb)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}: {state, select, active_account {aktivt konto} invited_account "
      & "{invitert konto} locked_account {låst konto} suspended_account "
      & "{suspendert konto} deleted_account {slettet konto} other {ukjent "
      & "kontostatus}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktivt konto} invited_account "
      & "{invitert konto} locked_account {låst konto} suspended_account "
      & "{suspendert konto} deleted_account {slettet konto} other {ukjent "
      & "kontostatus}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {klarert enhet} untrusted_device "
      & "{uklarert enhet} new_device {ny enhet} other {blokkert enhet}}");
   P ("label.accounts.last_active_label", "{name} sist aktiv {time_text}");
   P ("label.accounts.login_attempt_label",
      "{name}: {succeeded, select, false {påloggingen mislyktes} other "
      & "{påloggingen var vellykket}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA aktivert} mfa_disabled {MFA "
      & "deaktivert} mfa_required {MFA kreves} other {MFA må tilbakestilles}}");
   P ("label.accounts.session_label",
      "{name}: {state, select, active_session {aktiv økt} expired_session "
      & "{økten er utløpt} revoked_session {økten er tilbakekalt} "
      & "idle_session {inaktiv økt} other {ukjent øktstatus}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktiv økt} expired_session {økten er "
      & "utløpt} revoked_session {økten er tilbakekalt} idle_session {inaktiv "
      & "økt} other {ukjent øktstatus}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {ingen vedlegg} one {1 vedlegg} other {{count, "
      & "number} vedlegg}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, one {1 vedlegg} other {{count, number} "
      & "vedlegg}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {filvedlegg} image_attachment "
      & "{bildevedlegg} video_attachment {videovedlegg} audio_attachment "
      & "{lydvedlegg} document_attachment {dokumentvedlegg} archive_attachment "
      & "{arkivvedlegg} other {lenkevedlegg}}");
   P ("label.attachments.attachment_label",
      "{name} ({kind, select, file_attachment {fil} image_attachment {bilde} "
      & "video_attachment {video} audio_attachment {lyd} document_attachment "
      & "{dokument} archive_attachment {arkiv} other {lenke}}): {state, select, "
      & "pending_attachment {venter} uploading_attachment {lastes opp} "
      & "uploaded_attachment {lastet opp} failed_attachment {mislyktes} "
      & "removed_attachment {fjernet} other {blokkert}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {ventende vedlegg} "
      & "uploading_attachment {vedlegg lastes opp} uploaded_attachment "
      & "{opplastet vedlegg} failed_attachment {mislykket vedlegg} "
      & "removed_attachment {fjernet vedlegg} other {blokkert vedlegg}}");
   P ("label.attachments.download_label", "last ned {name}");
   P ("label.attachments.expiring_link_label", "lenken til {name} utløper {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "forhåndsvis {name}");
   P ("label.attachments.remove_label", "fjern {name}");
   P ("label.attachments.scan_result_label",
      "{name}: {state, select, not_scanned {ikke skannet} scanning {skannes} "
      & "safe {trygg} suspicious {mistenkelig} other {infisert}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {ikke skannet} scanning {skannes} safe "
      & "{skanning: trygg} suspicious {skanning: mistenkelig} other {skanning: "
      & "infisert}}");
   P ("label.attachments.upload_error_label", "opplasting av {name} mislyktes: {reason}");
   P ("label.badges.badge_label",
      "{name}, {state, select, default_badge {merke} new_badge {nytt merke} "
      & "updated_badge {oppdatert merke} deprecated_badge {foreldet merke} "
      & "selected_badge {valgt merke} disabled_badge {deaktivert merke} other "
      & "{merke som kan lukkes}} ({tone, select, neutral_tone {nøytral} "
      & "info_tone {info} success_tone {suksess} warning_tone {advarsel} "
      & "danger_tone {fare} other {dempet}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {merke med lav prioritet} "
      & "medium_priority {merke med middels prioritet} high_priority {merke med "
      & "høy prioritet} other {merke med kritisk prioritet}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {standardmerke} new_badge {nytt merke} "
      & "updated_badge {oppdatert merke} deprecated_badge {foreldet merke} "
      & "selected_badge {valgt merke} disabled_badge {deaktivert merke} other "
      & "{merke som kan lukkes}}");
   P ("label.badges.badge_tone_label",
      "merke: {tone, select, neutral_tone {nøytral} info_tone {info} "
      & "success_tone {suksess} warning_tone {advarsel} danger_tone {fare} "
      & "other {dempet}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}, brikke} other {{name}, brikke, "
      & "valgt}}");
   P ("label.badges.count_badge_label", "{name}: {count, plural, =0 {ingen} other {{count, number}}}");
   P ("label.badges.deprecated_label", "{name}, foreldet merke");
   P ("label.badges.dismiss_label", "lukk {name}");
   P ("label.badges.new_label", "{name}, nytt merke");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {ingen skjulte merker} one {+1 merke til} "
      & "other {+{hidden_count, number} merker til}}");
   P ("label.badges.priority_badge_label",
      "{name}, {priority, select, low_priority {merke med lav prioritet} "
      & "medium_priority {merke med middels prioritet} high_priority {merke med "
      & "høy prioritet} other {merke med kritisk prioritet}}");
   P ("label.badges.status_badge_label",
      "{name}, status: {tone, select, neutral_tone {nøytral} info_tone "
      & "{info} success_tone {suksess} warning_tone {advarsel} danger_tone "
      & "{fare} other {dempet}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {ingen etiketter} one {1 etikett} other {{count, "
      & "number} etiketter}}");
   P ("label.badges.tag_label", "etikett {name}");
   P ("label.badges.updated_label", "{name}, oppdatert merke");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefakt lastet opp} "
      & "artifact_missing {artefakt mangler} artifact_expired {artefakt "
      & "utløpt} other {artefakt verifisert}}");
   P ("label.builds.benchmark_label", "ytelsestest {name}: {result_text}");
   P ("label.builds.build_label",
      "{name}: {state, select, build_queued {bygget er i kø} build_running "
      & "{bygget kjører} build_passed {bygget er bestått} build_failed "
      & "{bygget mislyktes} snapshot_build {snapshot-bygg} other "
      & "{release-bygg}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {bygget er i kø} build_running {bygget "
      & "kjører} build_passed {bygget er bestått} build_failed {bygget "
      & "mislyktes} snapshot_build {snapshot-bygg} other {release-bygg}}");
   P ("label.builds.coverage_label", "dekning {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {utgivelseskontroll bestått} gate_failed "
      & "{utgivelseskontroll ikke bestått} gate_warning {utgivelseskontroll: "
      & "advarsel} other {utgivelseskontroll blokkert}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {ingen beståtte "
      & "tester} one {1 bestått test} other {{count, number} beståtte "
      & "tester}}} failed_test {{count, plural, =0 {ingen mislykkede tester} "
      & "one {1 mislykket test} other {{count, number} mislykkede tester}}} "
      & "skipped_test {{count, plural, =0 {ingen tester hoppet over} one {1 "
      & "test hoppet over} other {{count, number} tester hoppet over}}} "
      & "flaky_test {{count, plural, =0 {ingen ustabile tester} one {1 ustabil "
      & "test} other {{count, number} ustabile tester}}} other {{count, plural, "
      & "=0 {ingen tester med forventet feil} one {1 test med forventet feil} "
      & "other {{count, number} tester med forventet feil}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {bestått} failed_test {mislyktes} "
      & "skipped_test {hoppet over} flaky_test {ustabil} other {forventet "
      & "feil}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "uendret: deaktivert} other {{field_name} endret fra deaktivert til "
      & "aktivert}}} other {{new_value, select, false {{field_name} endret fra "
      & "aktivert til deaktivert} other {{field_name} uendret: aktivert}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {lagt til} removed_change {fjernet} "
      & "modified_change {endret} renamed_change {omdøpt} unchanged_change "
      & "{uendret} metadata_change {metadata endret} moved_change {flyttet} "
      & "conflict_change {konflikt} other {ukjent endring}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informativ endring} "
      & "minor_change {mindre endring} major_change {større endring} other "
      & "{inkompatibel endring}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} uendret} other "
      & "{{unchanged, plural, =0 {{field_name} endret: {added, number} lagt "
      & "til} other {{field_name} endret: {added, number} lagt til, {unchanged, "
      & "number} uendret}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name} endret: {removed, number} fjernet} other {{field_name} "
      & "endret: {removed, number} fjernet, {unchanged, number} uendret}}} "
      & "other {{unchanged, plural, =0 {{field_name} endret: {added, number} "
      & "lagt til, {removed, number} fjernet} other {{field_name} endret: "
      & "{added, number} lagt til, {removed, number} fjernet, {unchanged, "
      & "number} uendret}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {ingen konflikter} one {1 konflikt} other {{count, "
      & "number} konflikter}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} utsatt fra {old_label} til "
      & "{new_label}} other {{field_name} fremskyndet fra {old_label} til "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} endret fra {old_label} til {new_label}");
   P ("label.changes.field_change_label", "{field_name} endret fra {old_value} til {new_value}");
   P ("label.changes.item_change_label",
      "{name}: {kind, select, added_change {lagt til} removed_change "
      & "{fjernet} modified_change {endret} renamed_change {omdøpt} "
      & "unchanged_change {uendret} metadata_change {metadata endret} "
      & "moved_change {flyttet} conflict_change {konflikt} other {ukjent "
      & "endring}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {bare metadata endret} one {bare 1 metadatafelt "
      & "endret} other {bare {count, number} metadatafelt endret}}");
   P ("label.changes.move_label", "{name} flyttet fra {from} til {to}");
   P ("label.changes.no_changes_label", "ingen endringer");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {ingen "
      & "linjeendringer} one {1 linje lagt til} other {{lines_added, number} "
      & "linjer lagt til}}} one {{lines_added, plural, =0 {1 linje fjernet} one "
      & "{1 linje lagt til, 1 linje fjernet} other {{lines_added, number} "
      & "linjer lagt til, 1 linje fjernet}}} other {{lines_added, plural, =0 "
      & "{{lines_removed, number} linjer fjernet} one {1 linje lagt til, "
      & "{lines_removed, number} linjer fjernet} other {{lines_added, number} "
      & "linjer lagt til, {lines_removed, number} linjer fjernet}}}}");
   P ("label.changes.rename_label", "omdøpt fra {old_name} til {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} skrev et kommentarutkast} "
      & "published_comment {{author} kommenterte} edited_comment {{author} "
      & "redigerte en kommentar} deleted_comment {{author} slettet en "
      & "kommentar} resolved_comment {{author} løste en kommentar} "
      & "unresolved_comment {{author} gjenåpnet en kommentar} pinned_comment "
      & "{{author} festet en kommentar} other {{author} skjulte en kommentar}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {ingen kommentarer} one {1 kommentar} other "
      & "{{count, number} kommentarer}}");
   P ("label.comments.comment_label",
      "{author}: {state, select, draft_comment {kommentarutkast} "
      & "published_comment {publisert kommentar} edited_comment {redigert "
      & "kommentar} deleted_comment {slettet kommentar} resolved_comment {løst "
      & "kommentar} unresolved_comment {uløst kommentar} pinned_comment "
      & "{festet kommentar} other {skjult kommentar}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {kommentarutkast} published_comment "
      & "{publisert kommentar} edited_comment {redigert kommentar} "
      & "deleted_comment {slettet kommentar} resolved_comment {løst kommentar} "
      & "unresolved_comment {uløst kommentar} pinned_comment {festet "
      & "kommentar} other {skjult kommentar}}");
   P ("label.comments.deleted_label", "{author} slettet en kommentar");
   P ("label.comments.edited_label", "redigert {time_text}");
   P ("label.comments.hide_comment_label", "skjul kommentar: {reason}");
   P ("label.comments.lock_thread_label", "lås tråden {name}");
   P ("label.comments.mention_label", "{actor} nevnte {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {ingen deltakere} one {1 deltaker} other {{count, "
      & "number} deltakere}}");
   P ("label.comments.pin_label", "fest {name}");
   P ("label.comments.reaction_kind_label",
      "reaksjon: {kind, select, like_reaction {liker} dislike_reaction "
      & "{misliker} heart_reaction {hjerte} laugh_reaction {latter} "
      & "confused_reaction {forvirret} hooray_reaction {hurra} rocket_reaction "
      & "{rakett} other {øyne}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {ingen liker} one {1 "
      & "liker} other {{count, number} liker}}} dislike_reaction {{count, "
      & "plural, =0 {ingen misliker} one {1 misliker} other {{count, number} "
      & "misliker}}} heart_reaction {{count, plural, =0 {ingen hjerter} one {1 "
      & "hjerte} other {{count, number} hjerter}}} laugh_reaction {{count, "
      & "plural, =0 {ingen latterreaksjoner} one {1 latterreaksjon} other "
      & "{{count, number} latterreaksjoner}}} confused_reaction {{count, "
      & "plural, =0 {ingen forvirrede reaksjoner} one {1 forvirret reaksjon} "
      & "other {{count, number} forvirrede reaksjoner}}} hooray_reaction "
      & "{{count, plural, =0 {ingen hurrarop} one {1 hurrarop} other {{count, "
      & "number} hurrarop}}} rocket_reaction {{count, plural, =0 {ingen "
      & "raketter} one {1 rakett} other {{count, number} raketter}}} other "
      & "{{count, plural, =0 {ingen øyne-reaksjoner} one {1 øyne-reaksjon} "
      & "other {{count, number} øyne-reaksjoner}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {ingen svar} one {1 svar} other {{count, number} "
      & "svar}}");
   P ("label.comments.resolved_label", "{name} løst");
   P ("label.comments.subscribe_label", "abonner på {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {ingen tråder} one {1 tråd} other {{count, "
      & "number} tråder}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {åpen tråd} resolved_thread "
      & "{løst tråd} locked_thread {låst tråd} other {arkivert "
      & "tråd}}{count, plural, =0 {} one {, 1 kommentar} other {, {count, "
      & "number} kommentarer}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {åpen tråd} resolved_thread {løst "
      & "tråd} locked_thread {låst tråd} other {arkivert tråd}}");
   P ("label.comments.unpin_label", "løsne {name}");
   P ("label.comments.unsubscribe_label", "avslutt abonnementet på {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {forbedret} regressed {forverret} "
      & "unchanged {uendret} within_tolerance {innenfor toleransen} "
      & "outside_tolerance {utenfor toleransen} new_value {ny} removed_value "
      & "{fjernet} other {grunnlinje utilgjengelig}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {forbedret} regressed {forverret} unchanged "
      & "{uendret} within_tolerance {innenfor toleransen} outside_tolerance "
      & "{utenfor toleransen} new_value {ny} removed_value {fjernet} other "
      & "{grunnlinje utilgjengelig}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {forbedret} regressed {forverret} "
      & "unchanged {uendret} within_tolerance {innenfor toleransen} "
      & "outside_tolerance {utenfor toleransen} new_value {ny} removed_value "
      & "{fjernet} other {grunnlinje utilgjengelig}} ({difference_text})");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {forbedret} regressed {forverret} "
      & "unchanged {uendret} within_tolerance {innenfor toleransen} "
      & "outside_tolerance {utenfor toleransen} new_value {ny} removed_value "
      & "{fjernet} other {grunnlinje utilgjengelig}} ({difference_text}, "
      & "toleranse {tolerance_text})");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ugyldig rad} duplicate_record "
      & "{duplikatpost} missing_column {manglende kolonne} unknown_field "
      & "{ukjent felt} schema_mismatch {skjemaavvik} other {overhoppet post}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {prøvekjøring bestått} "
      & "dry_run_failed {prøvekjøring mislyktes} import_valid {importen er "
      & "gyldig} import_invalid {importen er ugyldig} other {delvis import}}");
   P ("label.data_quality.import_result_label",
      "{name} ({state, select, dry_run_passed {prøvekjøring bestått} "
      & "dry_run_failed {prøvekjøring mislyktes} import_valid {importen er "
      & "gyldig} import_invalid {importen er ugyldig} other {delvis import}}): "
      & "{accepted, number} godtatt, {rejected, number} avvist");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {ingen ugyldige rader} "
      & "one {1 ugyldig rad} other {{count, number} ugyldige rader}}} "
      & "duplicate_record {{count, plural, =0 {ingen duplikatposter} one {1 "
      & "duplikatpost} other {{count, number} duplikatposter}}} missing_column "
      & "{{count, plural, =0 {ingen manglende kolonner} one {1 manglende "
      & "kolonne} other {{count, number} manglende kolonner}}} unknown_field "
      & "{{count, plural, =0 {ingen ukjente felt} one {1 ukjent felt} other "
      & "{{count, number} ukjente felt}}} schema_mismatch {{count, plural, =0 "
      & "{ingen skjemaavvik} one {1 skjemaavvik} other {{count, number} "
      & "skjemaavvik}}} other {{count, plural, =0 {ingen overhoppede poster} "
      & "one {1 overhoppet post} other {{count, number} overhoppede poster}}}}");
   P ("label.data_quality.row_issue_label",
      "rad {row, number}: {issue, select, invalid_row {ugyldig} "
      & "duplicate_record {duplikatpost} missing_column {manglende kolonne} "
      & "unknown_field {ukjent felt} schema_mismatch {skjemaavvik} other "
      & "{overhoppet post}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {ugyldig rad} "
      & "duplicate_record {duplikatpost} missing_column {manglende kolonne} "
      & "unknown_field {ukjent felt} schema_mismatch {skjemaavvik} other "
      & "{overhoppet post}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefakt klar} artifact_uploaded "
      & "{artefakt lastet opp} artifact_signed {artefakt signert} "
      & "artifact_missing {artefakt mangler} other {artefakt utløpt}}");
   P ("label.deployments.deployment_label",
      "{name} til {environment}: {state, select, queued_deployment {utrulling "
      & "i kø} deploying {rulles ut} deployed {rullet ut} failed_deployment "
      & "{utrulling mislyktes} rolled_back {rullet tilbake} blocked_deployment "
      & "{utrulling blokkert} other {utrulling avbrutt}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {utrulling i kø} deploying {rulles "
      & "ut} deployed {rullet ut} failed_deployment {utrulling mislyktes} "
      & "rolled_back {rullet tilbake} blocked_deployment {utrulling blokkert} "
      & "other {utrulling avbrutt}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {miljø sunt} drifting_environment "
      & "{miljøavvik} locked_environment {miljø låst} "
      & "maintenance_environment {miljø under vedlikehold} other {ukjent "
      & "miljøtilstand}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {ingen migrering} migration_pending "
      & "{migrering venter} migrating {migrerer} migration_complete {migrering "
      & "fullført} other {migrering mislyktes}}");
   P ("label.deployments.promotion_label", "{name} forfremmet fra {from_environment} til {to_environment}");
   P ("label.deployments.rollback_label", "{name}: tilbakerulling til {target}");
   P ("label.deployments.rollout_label", "{name}: utrulling {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {ingen berørte elementer} one {1 berørt element} "
      & "other {{count, number} berørte elementer}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: bestått ({duration_s, plural, "
      & "one {1 sekund} other {{duration_s, number} sekunder}})} failed_check "
      & "{{name}: mislyktes ({duration_s, plural, one {1 sekund} other "
      & "{{duration_s, number} sekunder}})} warning_check {{name}: advarsler "
      & "({duration_s, plural, one {1 sekund} other {{duration_s, number} "
      & "sekunder}})} skipped_check {{name}: hoppet over ({duration_s, plural, "
      & "one {1 sekund} other {{duration_s, number} sekunder}})} pending_check "
      & "{{name}: venter ({duration_s, plural, one {1 sekund} other "
      & "{{duration_s, number} sekunder}})} other {{name}: kjører "
      & "({duration_s, plural, one {1 sekund} other {{duration_s, number} "
      & "sekunder}})}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: bestått} failed_check {{name}: "
      & "mislyktes} warning_check {{name}: advarsler} skipped_check {{name}: "
      & "hoppet over} pending_check {{name}: venter} other {{name}: kjører}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {bestått} failed_check {mislyktes} "
      & "warning_check {advarsler} skipped_check {hoppet over} pending_check "
      & "{venter} other {kjører}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {forventet en verdi for {subject}} "
      & "expected_unit {forventet en enhet for {subject}} invalid_range "
      & "{ugyldig område for {subject}} end_before_start {områdets slutt er "
      & "før starten for {subject}} unknown_field {ukjent felt for {subject}} "
      & "unsafe_redacted_value {usikker verdi ble sladdet for {subject}} "
      & "unsupported_syntax {syntaks som ikke støttes for {subject}} other "
      & "{diagnoseforklaring for {subject}}}{position, plural, =0 {;} other { "
      & "ved posisjon {position, number};}} bruk {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {info} notice_severity {merknad} "
      & "warning_severity {advarsel} error_severity {feil} critical_severity "
      & "{kritisk} other {blokkerende}} i {path}{line, plural, =0 {:} other {, "
      & "linje {line, number}:}} {message}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {mislyktes i {path}} other {{column, plural, =0 "
      & "{mislyktes i {path}, linje {line, number}} other {mislyktes i {path}, "
      & "linje {line, number}, kolonne {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info} notice_severity {merknad} "
      & "warning_severity {advarsel} error_severity {feil} critical_severity "
      & "{kritisk} other {blokkerende}} i {field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {første feil i {check_name} ved {path}} other "
      & "{første feil i {check_name} ved {path}, linje {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{ingen problemer} one {1 merknad} other {{notices, number} "
      & "merknader}}} one {{notices, plural, =0 {1 advarsel} one {1 advarsel, 1 "
      & "merknad} other {1 advarsel, {notices, number} merknader}}} other "
      & "{{notices, plural, =0 {{warnings, number} advarsler} one {{warnings, "
      & "number} advarsler, 1 merknad} other {{warnings, number} advarsler, "
      & "{notices, number} merknader}}}}} one {{warnings, plural, =0 {{notices, "
      & "plural, =0 {1 feil} one {1 feil, 1 merknad} other {1 feil, {notices, "
      & "number} merknader}}} one {{notices, plural, =0 {1 feil, 1 advarsel} "
      & "one {1 feil, 1 advarsel, 1 merknad} other {1 feil, 1 advarsel, "
      & "{notices, number} merknader}}} other {{notices, plural, =0 {1 feil, "
      & "{warnings, number} advarsler} one {1 feil, {warnings, number} "
      & "advarsler, 1 merknad} other {1 feil, {warnings, number} advarsler, "
      & "{notices, number} merknader}}}}} other {{warnings, plural, =0 "
      & "{{notices, plural, =0 {{errors, number} feil} one {{errors, number} "
      & "feil, 1 merknad} other {{errors, number} feil, {notices, number} "
      & "merknader}}} one {{notices, plural, =0 {{errors, number} feil, 1 "
      & "advarsel} one {{errors, number} feil, 1 advarsel, 1 merknad} other "
      & "{{errors, number} feil, 1 advarsel, {notices, number} merknader}}} "
      & "other {{notices, plural, =0 {{errors, number} feil, {warnings, number} "
      & "advarsler} one {{errors, number} feil, {warnings, number} advarsler, 1 "
      & "merknad} other {{errors, number} feil, {warnings, number} advarsler, "
      & "{notices, number} merknader}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, linje "
      & "{line, number}} other {{path}, linje {line, number}, kolonne {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "syntaks som ikke støttes av {family, select, byte_parser "
      & "{byte-parseren} duration_parser {varighetsparseren} date_time_parser "
      & "{dato/tid-parseren} color_parser {fargeparseren} url_parser "
      & "{URL-parseren} unit_parser {enhetsparseren} recurrence_parser "
      & "{gjentakelsesparseren} domain_label_parser {domeneetikett-parseren} "
      & "other {parseren}}: {error}{position, plural, =0 {;} other { ved "
      & "posisjon {position, number};}} {family, select, byte_parser {bruk B, "
      & "kB, MB, GB, KiB, MiB, GiB eller TiB} duration_parser {bruk ms, s, min, "
      & "h, d, w, month eller year} date_time_parser {bruk ISO-dato, naturlig "
      & "dag eller klokkeslett} color_parser {bruk hex, rgb(), hsl(), lab(), "
      & "lch() eller et fargenavn} url_parser {bruk skjema, vert, sti, "
      & "spørring eller fragment} unit_parser {bruk en enhetsetikett som "
      & "Humanize støtter} recurrence_parser {bruk cron eller "
      & "gjentakelsesformen every/weekday} domain_label_parser {bruk en "
      & "deterministisk Humanize-domeneetikett} other {bruk en støttet "
      & "inndataform}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {bestått} failed_check {mislyktes} "
      & "warning_check {advarsler} skipped_check {hoppet over} pending_check "
      & "{venter} other {kjører}}, {notices, plural, =0 {ingen merknader} one "
      & "{1 merknad} other {{notices, number} merknader}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {nytt forsøk 1 av 1} other "
      & "{nytt forsøk {attempt, number} av 1 – grensen overskredet}}} other "
      & "{nytt forsøk {attempt, number} av {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {merknad} "
      & "warning_severity {advarsel} error_severity {feil} critical_severity "
      & "{kritisk} other {blokkerende}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {byggdiagnostikk} test_source "
      & "{testdiagnostikk} lint_source {lint-diagnostikk} import_source "
      & "{importdiagnostikk} validation_source {valideringsdiagnostikk} "
      & "runtime_source {kjøretidsdiagnostikk} security_source "
      & "{sikkerhetsdiagnostikk} other {diagnostikk}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 {source, select, build_source {byggdiagnose} "
      & "test_source {testdiagnose} lint_source {lint-diagnose} import_source "
      & "{importdiagnose} validation_source {valideringsdiagnose} "
      & "runtime_source {kjøretidsdiagnose} security_source "
      & "{sikkerhetsdiagnose} other {diagnose}}} other {{count, number} "
      & "{source, select, build_source {byggdiagnoser} test_source "
      & "{testdiagnoser} lint_source {lint-diagnoser} import_source "
      & "{importdiagnoser} validation_source {valideringsdiagnoser} "
      & "runtime_source {kjøretidsdiagnoser} security_source "
      & "{sikkerhetsdiagnoser} other {diagnoser}}}}");
   P ("label.diagnostics.suggested_action_label", "neste steg: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domenevert} ipv4_host {IPv4-adresse} "
      & "ipv6_host {IPv6-adresse} localhost_host {lokal vert} "
      & "private_network_host {privat nettverksadresse} other {ukjent vert}}");
   P ("label.events.all_day_label", "{name}, heldagshendelse");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {ikke svart} accepted {godtatt} declined "
      & "{avslått} maybe {kanskje} other {på venteliste}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {ingen deltakere} one {1 deltaker} other {{count, "
      & "number} deltakere}}");
   P ("label.events.canceled_label", "{name} avlyst");
   P ("label.events.check_in_label", "sjekk inn på {name}");
   P ("label.events.conference_link_label", "konferanselenke for {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {ingen hendelser} one {1 hendelse} other {{count, "
      & "number} hendelser}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name}: planlagt} tentative_event "
      & "{{name}: foreløpig} in_progress_event {{name}: pågår} "
      & "completed_event {{name}: fullført} canceled_event {{name}: avlyst} "
      & "other {{name}: utsatt}}");
   P ("label.events.event_location_label", "{name}, sted: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {planlagt hendelse} tentative_event "
      & "{foreløpig hendelse} in_progress_event {pågående hendelse} "
      & "completed_event {fullført hendelse} canceled_event {avlyst hendelse} "
      & "other {utsatt hendelse}}");
   P ("label.events.event_time_label", "{name}, tid: {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {offentlig hendelse} private_event "
      & "{privat hendelse} busy_event {vises som opptatt} other {vises som "
      & "ledig}}");
   P ("label.events.organizer_label", "arrangør: {name}");
   P ("label.events.rsvp_label",
      "svar: {state, select, not_responded {ikke svart} accepted {godtatt} "
      & "declined {avslått} maybe {kanskje} other {på venteliste}}");
   P ("label.events.reminder_label", "påminnelse: {time_text}");
   P ("label.events.rescheduled_label", "{name} flyttet til {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 tegn} other {{used, number} tegn}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {ingen tegngrense} one {maks. 1 tegn} other {maks. "
      & "{limit, number} tegn}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 tegn} other {{used, number} "
      & "tegn}}} other {{used, number} av {limit, number} tegn}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}, valgfritt felt} other {{name}, "
      & "obligatorisk felt}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: gyldig} invalid_input {{name}: "
      & "ugyldig} required_input {{name}: obligatorisk} optional_input {{name}: "
      & "valgfritt} disabled_input {{name}: deaktivert} other {{name}: "
      & "skrivebeskyttet}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {ingen skjemaproblemer} one "
      & "{1 advarsel} other {{warnings, number} advarsler}}} one {{warnings, "
      & "plural, =0 {1 feil} one {1 feil, 1 advarsel} other {1 feil, {warnings, "
      & "number} advarsler}}} other {{warnings, plural, =0 {{errors, number} "
      & "feil} one {{errors, number} feil, 1 advarsel} other {{errors, number} "
      & "feil, {warnings, number} advarsler}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {ikke påbegynt} editing_form "
      & "{redigeres} dirty_form {ulagrede endringer} saving_form {lagrer} "
      & "saved_form {lagret} submitted_form {sendt inn} other {innsending "
      & "mislyktes}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {gyldig inndata} invalid_input {ugyldig "
      & "inndata} required_input {obligatorisk inndata} optional_input {valgfri "
      & "inndata} disabled_input {deaktivert inndata} other {skrivebeskyttet "
      & "inndata}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {ikke påbegynt} editing_form "
      & "{redigeres} dirty_form {ulagrede endringer} saving_form {lagrer "
      & "skjema} saved_form {skjema lagret} submitted_form {skjema sendt inn} "
      & "other {{errors, plural, =0 {innsending mislyktes} one {innsending "
      & "mislyktes med 1 feil} other {innsending mislyktes med {errors, number} "
      & "feil}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {ingen ulagrede endringer} one {1 ulagret endring} "
      & "other {{count, number} ulagrede endringer}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target}: mangler "
      & "tilgjengelig navn} low_contrast {{target}: lav kontrast} "
      & "skipped_heading_level {{target}: hoppet over overskriftsnivå} "
      & "missing_form_label {{target}: mangler skjemaetikett} invalid_aria "
      & "{{target}: ugyldig ARIA} keyboard_trap {{target}: tastaturfelle} other "
      & "{{target}: ukjent tilgjengelighetsproblem}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}, tilgjengelighet: {landmarks, plural, one {1 landemerke} other "
      & "{{landmarks, number} landemerker}}, {headings, plural, one {1 "
      & "overskrift} other {{headings, number} overskrifter}}, {issues, plural, "
      & "one {1 problem} other {{issues, number} problemer}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {legg til et tilgjengelig "
      & "navn} low_contrast {øk tekstkontrasten} skipped_heading_level {bruk "
      & "overskriftsnivåer i rekkefølge} missing_form_label {knytt en etikett "
      & "til skjemakontrollen} invalid_aria {bruk en gyldig ARIA-rolle eller et "
      & "gyldig ARIA-attributt} keyboard_trap {sørg for at tastaturfokus kan "
      & "forlate komponenten} other {gå gjennom tilgjengelighetsproblemet}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} har ingen tilgjengelighetsproblemer} one "
      & "{{target} har 1 tilgjengelighetsproblem} other {{target} har {issues, "
      & "number} tilgjengelighetsproblemer}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-attributt} class_attribute "
      & "{class-attributt} data_attribute {data-attributt} aria_attribute "
      & "{ARIA-attributt} role_attribute {role-attributt} link_attribute "
      & "{lenkeattributt} media_attribute {medieattributt} form_attribute "
      & "{skjemaattributt} boolean_attribute {boolsk attributt} event_attribute "
      & "{hendelsesbehandlerattributt} other {ukjent attributt}}");
   P ("label.markup.form_error_summary_label",
      "{form_name} har {errors, plural, =0 {{warnings, plural, =0 {ingen "
      & "skjemaproblemer} one {1 advarsel} other {{warnings, number} "
      & "advarsler}}} one {{warnings, plural, =0 {1 feil} one {1 feil, 1 "
      & "advarsel} other {1 feil, {warnings, number} advarsler}}} other "
      & "{{warnings, plural, =0 {{errors, number} feil} one {{errors, number} "
      & "feil, 1 advarsel} other {{errors, number} feil, {warnings, number} "
      & "advarsler}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banner-landemerke} navigation_role "
      & "{navigasjonslandemerke} main_role {hovedlandemerke} complementary_role "
      & "{utfyllende landemerke} contentinfo_role {innholdsinfo-landemerke} "
      & "search_role {søkelandemerke} form_role {skjemalandemerke} region_role "
      & "{regionlandemerke} dialog_role {dialogboks} alert_role {levende region "
      & "for varsler} status_role {levende region for status} other {ukjent "
      & "landemerke}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {umiddelbar} other {høflig}} "
      & "oppdatering: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {tekstinnhold} html_content {HTML-innhold} "
      & "json_content {JSON-innhold} xml_content {XML-innhold} image_content "
      & "{bildeinnhold} audio_content {lydinnhold} video_content {videoinnhold} "
      & "font_content {skriftinnhold} archive_content {arkivinnhold} "
      & "binary_content {binært innhold} form_content {skjemainnhold} other "
      & "{ukjent innhold}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumenttagg} metadata_tag {metadatatagg} "
      & "section_tag {seksjonstagg} text_tag {teksttagg} link_tag {lenketagg} "
      & "media_tag {medietagg} form_tag {skjematagg} table_tag {tabelltagg} "
      & "interactive_tag {interaktiv tagg} scripting_tag {skripttagg} other "
      & "{ukjent tagg}}");
   P ("label.media.duration_label", "varighet: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {bilde} video_media {video} audio_media "
      & "{lyd} pdf_document {PDF-dokument} text_document {tekstdokument} "
      & "archive_media {arkiv} other {medier}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {klar} processing_media {behandles} "
      & "transcoding_media {omkodes} thumbnail_missing {miniatyrbilde "
      & "utilgjengelig} metadata_missing {metadata mangler} locked_document "
      & "{dokument låst} other {utilgjengelig}}");
   P ("label.media.media_summary",
      "{name}, {kind, select, image_media {bilde} video_media {video} "
      & "audio_media {lyd} pdf_document {PDF-dokument} text_document "
      & "{tekstdokument} archive_media {arkiv} other {medier}}: {state, select, "
      & "ready_media {klar} processing_media {behandles} transcoding_media "
      & "{omkodes} thumbnail_missing {miniatyrbilde utilgjengelig} "
      & "metadata_missing {metadata mangler} locked_document {låst} other "
      & "{utilgjengelig}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {ingen sider} one {1 side} other {{pages, number} "
      & "sider}}");
   P ("label.media.resolution_label", "{width, number}x{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: anke, {state, select, open_report {åpen rapport} "
      & "triaged_report {vurdert rapport} actioned_report {tiltak iverksatt} "
      & "dismissed_report {avvist rapport} appealed_report {anket rapport} "
      & "other {lukket rapport}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {ingen modereringstiltak} flagged {flagget} "
      & "hidden {skjult av moderator} restored {gjenopprettet} marked_spam "
      & "{merket som søppelpost} removed {fjernet} other {eskalert}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {ingen modereringstiltak} flagged "
      & "{flagget} hidden {skjult av moderator} restored {gjenopprettet} "
      & "marked_spam {merket som søppelpost} removed {fjernet} other "
      & "{eskalert}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {modereringskøen er tom} "
      & "other {{pending, number} venter på gjennomgang}}} other {{pending, "
      & "number} venter på gjennomgang, {escalated, number} eskalert}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {åpen rapport} triaged_report "
      & "{vurdert rapport} actioned_report {tiltak iverksatt} dismissed_report "
      & "{avvist rapport} appealed_report {anket rapport} other {lukket "
      & "rapport}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {åpen rapport} triaged_report {vurdert "
      & "rapport} actioned_report {tiltak iverksatt} dismissed_report {avvist "
      & "rapport} appealed_report {anket rapport} other {lukket rapport}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {venter på gjennomgang} "
      & "approved {godkjent} rejected {avvist} needs_changes {krever endringer} "
      & "other {gjennomgang eskalert}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {venter på gjennomgang} approved "
      & "{godkjent} rejected {avvist} needs_changes {krever endringer} other "
      & "{gjennomgang eskalert}}");
   P ("label.navigation.back_label", "tilbake til {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {ingen brødsmuler} one {1 brødsmule} other "
      & "{{depth, number} brødsmuler}}");
   P ("label.navigation.current_page_label", "gjeldende side: {name}");
   P ("label.navigation.external_link_label", "{name} (ekstern lenke)");
   P ("label.navigation.first_label", "første: {target}");
   P ("label.navigation.last_label", "siste: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {ingen menyelementer} one {1 menyelement} other "
      & "{{count, number} menyelementer}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {lenke} menu_item {menyelement} tab_item "
      & "{fane} breadcrumb_item {brødsmule} section_item {seksjon} other "
      & "{skilletegn}}");
end Labels_1;
