separate (Humanize.Catalogs.Phrase_Data.Locale_Af)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name}: aktiewe rekening} "
      & "invited_account {{name}: genooide rekening} locked_account {{name}: "
      & "geslote rekening} suspended_account {{name}: opgeskorte rekening} "
      & "deleted_account {{name}: geskrapte rekening} other {{name}: "
      & "rekeningstatus onbekend}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {aktiewe rekening} invited_account "
      & "{genooide rekening} locked_account {geslote rekening} "
      & "suspended_account {opgeskorte rekening} deleted_account {geskrapte "
      & "rekening} other {rekeningstatus onbekend}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {vertroude toestel} untrusted_device "
      & "{onvertroude toestel} new_device {nuwe toestel} other {geblokkeerde "
      & "toestel}}");
   P ("label.accounts.last_active_label", "{name}, laas aktief {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: aanmelding misluk} other {{name}: "
      & "aanmelding geslaag}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA geaktiveer} mfa_disabled {MFA "
      & "gedeaktiveer} mfa_required {MFA vereis} other {MFA-terugstelling "
      & "vereis}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: aktiewe sessie} "
      & "expired_session {{name}: sessie verval} revoked_session {{name}: "
      & "sessie herroep} idle_session {{name}: onaktiewe sessie} other {{name}: "
      & "sessiestatus onbekend}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {aktiewe sessie} expired_session "
      & "{sessie verval} revoked_session {sessie herroep} idle_session "
      & "{onaktiewe sessie} other {sessiestatus onbekend}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {geen aanhegsels nie} one {1 aanhegsel} other "
      & "{{count, number} aanhegsels}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 aanhegsel} other {{name}: {count, "
      & "number} aanhegsels}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {lêeraanhegsel} image_attachment "
      & "{beeldaanhegsel} video_attachment {video-aanhegsel} audio_attachment "
      & "{oudio-aanhegsel} document_attachment {dokumentaanhegsel} "
      & "archive_attachment {argiefaanhegsel} other {skakelaanhegsel}}");
   P ("label.attachments.attachment_label",
      "{name}: {kind, select, file_attachment {lêer} image_attachment "
      & "{beeld} video_attachment {video} audio_attachment {oudio} "
      & "document_attachment {dokument} archive_attachment {argief} other "
      & "{skakel}} {state, select, pending_attachment {hangende} "
      & "uploading_attachment {word opgelaai} uploaded_attachment {opgelaai} "
      & "failed_attachment {misluk} removed_attachment {verwyder} other "
      & "{geblokkeer}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {aanhegsel hangende} "
      & "uploading_attachment {aanhegsel word opgelaai} uploaded_attachment "
      & "{aanhegsel opgelaai} failed_attachment {aanhegsel misluk} "
      & "removed_attachment {aanhegsel verwyder} other {aanhegsel geblokkeer}}");
   P ("label.attachments.download_label", "laai {name} af");
   P ("label.attachments.expiring_link_label", "skakel na {name} verval {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "voorskou: {name}");
   P ("label.attachments.remove_label", "verwyder {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: nie geskandeer nie} scanning "
      & "{{name}: word geskandeer} safe {{name}: skandering veilig} suspicious "
      & "{{name}: skandering verdag} other {{name}: skandering besmet}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {nie geskandeer nie} scanning {word "
      & "geskandeer} safe {skandering veilig} suspicious {skandering verdag} "
      & "other {skandering besmet}}");
   P ("label.attachments.upload_error_label", "oplaai van {name} misluk: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {kenteken} new_badge {nuwe "
      & "kenteken} updated_badge {bygewerkte kenteken} deprecated_badge "
      & "{verouderde kenteken} selected_badge {gekose kenteken} disabled_badge "
      & "{gedeaktiveerde kenteken} other {wegwysbare kenteken}} ({tone, select, "
      & "neutral_tone {neutraal} info_tone {inligting} success_tone {sukses} "
      & "warning_tone {waarskuwing} danger_tone {gevaar} other {gedemp}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {kenteken met lae prioriteit} "
      & "medium_priority {kenteken met medium prioriteit} high_priority "
      & "{kenteken met hoë prioriteit} other {kenteken met kritieke "
      & "prioriteit}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {verstekkenteken} new_badge {nuwe "
      & "kenteken} updated_badge {bygewerkte kenteken} deprecated_badge "
      & "{verouderde kenteken} selected_badge {gekose kenteken} disabled_badge "
      & "{gedeaktiveerde kenteken} other {wegwysbare kenteken}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutrale kenteken} info_tone "
      & "{inligtingskenteken} success_tone {sukseskenteken} warning_tone "
      & "{waarskuwingskenteken} danger_tone {gevaarkenteken} other {gedempte "
      & "kenteken}}");
   P ("label.badges.chip_label",
      "{selected, select, false {skyfie {name}} other {skyfie {name}, "
      & "gekies}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: geen} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: verouderd");
   P ("label.badges.dismiss_label", "wys {name} weg");
   P ("label.badges.new_label", "{name}: nuut");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {geen versteekte kentekens nie} one {+1 "
      & "kenteken meer} other {+{hidden_count, number} kentekens meer}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: lae prioriteit} "
      & "medium_priority {{name}: medium prioriteit} high_priority {{name}: "
      & "hoë prioriteit} other {{name}: kritieke prioriteit}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name}, status: neutraal} info_tone "
      & "{{name}, status: inligting} success_tone {{name}, status: sukses} "
      & "warning_tone {{name}, status: waarskuwing} danger_tone {{name}, "
      & "status: gevaar} other {{name}, status: gedemp}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {geen etikette nie} one {1 etiket} other {{count, "
      & "number} etikette}}");
   P ("label.badges.tag_label", "etiket {name}");
   P ("label.badges.updated_label", "{name}: bygewerk");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artefak opgelaai} artifact_missing "
      & "{artefak ontbreek} artifact_expired {artefak verval} other {artefak "
      & "geverifieer}}");
   P ("label.builds.benchmark_label", "maatstaftoets {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name}: bou in tou} build_running "
      & "{{name}: bou loop} build_passed {{name}: bou geslaag} build_failed "
      & "{{name}: bou misluk} snapshot_build {{name}: momentopname-bou} other "
      & "{{name}: vrystellingsbou}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {bou in tou} build_running {bou loop} "
      & "build_passed {bou geslaag} build_failed {bou misluk} snapshot_build "
      & "{momentopname-bou} other {vrystellingsbou}}");
   P ("label.builds.coverage_label", "toetsdekking {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {vrystellingshek geslaag} gate_failed "
      & "{vrystellingshek misluk} gate_warning {vrystellingshek met "
      & "waarskuwing} other {vrystellingshek geblokkeer}}");
   P ("label.builds.test_count_label",
      "{count, plural, =0 {geen toetse} one {1 toets} other {{count, number} "
      & "toetse}} {state, select, passed_test {geslaag} failed_test {misluk} "
      & "skipped_test {oorgeslaan} flaky_test {onstabiel} other {soos verwag "
      & "misluk}}{count, plural, =0 { nie} other {}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {geslaag} failed_test {misluk} "
      & "skipped_test {oorgeslaan} flaky_test {onstabiel} other {verwagte "
      & "mislukking}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "onveranderd, gedeaktiveer} other {{field_name} verander van "
      & "gedeaktiveer na geaktiveer}}} other {{new_value, select, false "
      & "{{field_name} verander van geaktiveer na gedeaktiveer} other "
      & "{{field_name} onveranderd, geaktiveer}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {bygevoeg} removed_change {verwyder} "
      & "modified_change {gewysig} renamed_change {hernoem} unchanged_change "
      & "{onveranderd} metadata_change {metadata gewysig} moved_change "
      & "{geskuif} conflict_change {konflik} other {onbekende wysiging}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {inligtingswysiging} "
      & "minor_change {klein wysiging} major_change {groot wysiging} other "
      & "{onversoenbare wysiging}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} onveranderd} "
      & "other {{unchanged, plural, =0 {{field_name} gewysig: {added, number} "
      & "bygevoeg} other {{field_name} gewysig: {added, number} bygevoeg, "
      & "{unchanged, number} onveranderd}}}}} other {{added, plural, =0 "
      & "{{unchanged, plural, =0 {{field_name} gewysig: {removed, number} "
      & "verwyder} other {{field_name} gewysig: {removed, number} verwyder, "
      & "{unchanged, number} onveranderd}}} other {{unchanged, plural, =0 "
      & "{{field_name} gewysig: {added, number} bygevoeg, {removed, number} "
      & "verwyder} other {{field_name} gewysig: {added, number} bygevoeg, "
      & "{removed, number} verwyder, {unchanged, number} onveranderd}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {geen konflikte nie} one {1 konflik} other {{count, "
      & "number} konflikte}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} uitgestel van {old_label} na "
      & "{new_label}} other {{field_name} vervroeg van {old_label} na "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} verander van {old_label} na {new_label}");
   P ("label.changes.field_change_label", "{field_name} verander van {old_value} na {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} bygevoeg} removed_change {{name} "
      & "verwyder} modified_change {{name} gewysig} renamed_change {{name} "
      & "hernoem} unchanged_change {{name} onveranderd} metadata_change "
      & "{{name}: metadata gewysig} moved_change {{name} geskuif} "
      & "conflict_change {{name}: konflik} other {{name}: onbekende wysiging}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {slegs metadata gewysig} one {slegs 1 metadataveld "
      & "gewysig} other {slegs {count, number} metadatavelde gewysig}}");
   P ("label.changes.move_label", "{name} geskuif van {from} na {to}");
   P ("label.changes.no_changes_label", "geen wysigings nie");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {geen "
      & "reëlwysigings nie} one {1 reël bygevoeg} other {{lines_added, "
      & "number} reëls bygevoeg}}} one {{lines_added, plural, =0 {1 reël "
      & "verwyder} one {1 reël bygevoeg, 1 reël verwyder} other "
      & "{{lines_added, number} reëls bygevoeg, 1 reël verwyder}}} other "
      & "{{lines_added, plural, =0 {{lines_removed, number} reëls verwyder} "
      & "one {1 reël bygevoeg, {lines_removed, number} reëls verwyder} other "
      & "{{lines_added, number} reëls bygevoeg, {lines_removed, number} reëls "
      & "verwyder}}}}");
   P ("label.changes.rename_label", "hernoem van {old_name} na {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} het ’n konsepkommentaar "
      & "opgestel} published_comment {{author} het kommentaar gelewer} "
      & "edited_comment {{author} het ’n kommentaar gewysig} deleted_comment "
      & "{{author} het ’n kommentaar geskrap} resolved_comment {{author} het "
      & "’n kommentaar as opgelos gemerk} unresolved_comment {{author} het "
      & "’n kommentaar heropen} pinned_comment {{author} het ’n kommentaar "
      & "vasgespeld} other {{author} het ’n kommentaar versteek}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {geen kommentare nie} one {1 kommentaar} other "
      & "{{count, number} kommentare}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: konsepkommentaar} "
      & "published_comment {{author}: gepubliseerde kommentaar} edited_comment "
      & "{{author}: gewysigde kommentaar} deleted_comment {{author}: geskrapte "
      & "kommentaar} resolved_comment {{author}: opgeloste kommentaar} "
      & "unresolved_comment {{author}: onopgeloste kommentaar} pinned_comment "
      & "{{author}: vasgespelde kommentaar} other {{author}: versteekte "
      & "kommentaar}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {konsepkommentaar} published_comment "
      & "{gepubliseerde kommentaar} edited_comment {gewysigde kommentaar} "
      & "deleted_comment {geskrapte kommentaar} resolved_comment {opgeloste "
      & "kommentaar} unresolved_comment {onopgeloste kommentaar} pinned_comment "
      & "{vasgespelde kommentaar} other {versteekte kommentaar}}");
   P ("label.comments.deleted_label", "{author} het ’n kommentaar geskrap");
   P ("label.comments.edited_label", "gewysig {time_text}");
   P ("label.comments.hide_comment_label", "versteek kommentaar: {reason}");
   P ("label.comments.lock_thread_label", "sluit draad {name}");
   P ("label.comments.mention_label", "{actor} het {target} genoem");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {geen deelnemers nie} one {1 deelnemer} other "
      & "{{count, number} deelnemers}}");
   P ("label.comments.pin_label", "speld {name} vas");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {reaksie ‘hou van’} dislike_reaction "
      & "{reaksie ‘hou nie van nie’} heart_reaction {reaksie ‘hart’} "
      & "laugh_reaction {reaksie ‘lag’} confused_reaction {reaksie "
      & "‘verward’} hooray_reaction {reaksie ‘hoera’} rocket_reaction "
      & "{reaksie ‘vuurpyl’} other {reaksie ‘oë’}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {geen reaksies} one {1 reaksie} other {{count, "
      & "number} reaksies}} {kind, select, like_reaction {‘hou van’} "
      & "dislike_reaction {‘hou nie van nie’} heart_reaction {‘hart’} "
      & "laugh_reaction {‘lag’} confused_reaction {‘verward’} "
      & "hooray_reaction {‘hoera’} rocket_reaction {‘vuurpyl’} other "
      & "{‘oë’}}{count, plural, =0 { nie} other {}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {geen antwoorde nie} one {1 antwoord} other "
      & "{{count, number} antwoorde}}");
   P ("label.comments.resolved_label", "{name} opgelos");
   P ("label.comments.subscribe_label", "teken in op {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {geen drade nie} one {1 draad} other {{count, "
      & "number} drade}}");
   P ("label.comments.thread_label",
      "{name}: {state, select, open_thread {oop draad} resolved_thread "
      & "{opgeloste draad} locked_thread {geslote draad} other {geargiveerde "
      & "draad}}{count, plural, =0 {} one {, 1 kommentaar} other {, {count, "
      & "number} kommentare}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {oop draad} resolved_thread {opgeloste "
      & "draad} locked_thread {geslote draad} other {geargiveerde draad}}");
   P ("label.comments.unpin_label", "maak {name} los");
   P ("label.comments.unsubscribe_label", "teken uit van {name}");
   P ("label.comparisons.baseline_label",
      "{name}: {result, select, improved {verbeter} regressed {verswak} "
      & "unchanged {onveranderd} within_tolerance {binne toleransie} "
      & "outside_tolerance {buite toleransie} new_value {nuut} removed_value "
      & "{verwyder} other {basislyn nie beskikbaar nie}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {verbeter} regressed {verswak} unchanged "
      & "{onveranderd} within_tolerance {binne toleransie} outside_tolerance "
      & "{buite toleransie} new_value {nuut} removed_value {verwyder} other "
      & "{basislyn nie beskikbaar nie}}");
   P ("label.comparisons.difference_label",
      "{name}: {result, select, improved {verbeter met {difference_text}} "
      & "regressed {verswak met {difference_text}} unchanged {onveranderd "
      & "({difference_text})} within_tolerance {binne toleransie "
      & "({difference_text})} outside_tolerance {buite toleransie "
      & "({difference_text})} new_value {nuut ({difference_text})} "
      & "removed_value {verwyder ({difference_text})} other {basislyn nie "
      & "beskikbaar nie ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{name}: {result, select, improved {verbeter met {difference_text}} "
      & "regressed {verswak met {difference_text}} unchanged {onveranderd "
      & "({difference_text})} within_tolerance {binne toleransie "
      & "({difference_text})} outside_tolerance {buite toleransie "
      & "({difference_text})} new_value {nuut ({difference_text})} "
      & "removed_value {verwyder ({difference_text})} other {basislyn nie "
      & "beskikbaar nie ({difference_text})}}, toleransie {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {ongeldige ry} duplicate_record "
      & "{duplikaatrekord} missing_column {ontbrekende kolom} unknown_field "
      & "{onbekende veld} schema_mismatch {skema-wanpassing} other {oorgeslane "
      & "rekord}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {proeflopie geslaag} dry_run_failed "
      & "{proeflopie misluk} import_valid {invoer geldig} import_invalid "
      & "{invoer ongeldig} other {gedeeltelike invoer}}");
   P ("label.data_quality.import_result_label",
      "{name}: {state, select, dry_run_passed {proeflopie geslaag} "
      & "dry_run_failed {proeflopie misluk} import_valid {invoer geldig} "
      & "import_invalid {invoer ongeldig} other {gedeeltelike invoer}}: "
      & "{accepted, number} aanvaar, {rejected, number} verwerp");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {geen ongeldige rye "
      & "nie} one {1 ongeldige ry} other {{count, number} ongeldige rye}}} "
      & "duplicate_record {{count, plural, =0 {geen duplikaatrekords nie} one "
      & "{1 duplikaatrekord} other {{count, number} duplikaatrekords}}} "
      & "missing_column {{count, plural, =0 {geen ontbrekende kolomme nie} one "
      & "{1 ontbrekende kolom} other {{count, number} ontbrekende kolomme}}} "
      & "unknown_field {{count, plural, =0 {geen onbekende velde nie} one {1 "
      & "onbekende veld} other {{count, number} onbekende velde}}} "
      & "schema_mismatch {{count, plural, =0 {geen skema-wanpassings nie} one "
      & "{1 skema-wanpassing} other {{count, number} skema-wanpassings}}} other "
      & "{{count, plural, =0 {geen oorgeslane rekords nie} one {1 oorgeslane "
      & "rekord} other {{count, number} oorgeslane rekords}}}}");
   P ("label.data_quality.row_issue_label",
      "ry {row, number}: {issue, select, invalid_row {ongeldig} "
      & "duplicate_record {duplikaatrekord} missing_column {ontbrekende kolom} "
      & "unknown_field {onbekende veld} schema_mismatch {skema-wanpassing} "
      & "other {oorgeslaan}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {ongeldige ry} "
      & "duplicate_record {duplikaatrekord} missing_column {ontbrekende kolom} "
      & "unknown_field {onbekende veld} schema_mismatch {skema-wanpassing} "
      & "other {oorgeslane rekord}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artefak gereed} artifact_uploaded "
      & "{artefak opgelaai} artifact_signed {artefak onderteken} "
      & "artifact_missing {artefak ontbreek} other {artefak verval}}");
   P ("label.deployments.deployment_label",
      "{name} na {environment}: {state, select, queued_deployment "
      & "{ontplooiing in tou} deploying {word ontplooi} deployed {ontplooi} "
      & "failed_deployment {ontplooiing misluk} rolled_back {teruggerol} "
      & "blocked_deployment {ontplooiing geblokkeer} other {ontplooiing "
      & "gekanselleer}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {ontplooiing in tou} deploying {word "
      & "ontplooi} deployed {ontplooi} failed_deployment {ontplooiing misluk} "
      & "rolled_back {teruggerol} blocked_deployment {ontplooiing geblokkeer} "
      & "other {ontplooiing gekanselleer}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {omgewing gesond} "
      & "drifting_environment {omgewing wyk af} locked_environment {omgewing "
      & "gesluit} maintenance_environment {omgewing in onderhoud} other "
      & "{omgewingstatus onbekend}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {geen migrasie nie} migration_pending "
      & "{migrasie hangend} migrating {migrasie aan die gang} "
      & "migration_complete {migrasie voltooi} other {migrasie misluk}}");
   P ("label.deployments.promotion_label", "{name} bevorder van {from_environment} na {to_environment}");
   P ("label.deployments.rollback_label", "{name}: terugrol na {target}");
   P ("label.deployments.rollout_label", "{name}: uitrol {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {geen geraakte items nie} one {1 geraakte item} "
      & "other {{count, number} geraakte items}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {geslaag} failed_check {misluk} "
      & "warning_check {waarskuwings} skipped_check {oorgeslaan} pending_check "
      & "{hangend} other {loop}} ({duration_s, plural, one {1 sekonde} other "
      & "{{duration_s, number} sekondes}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {geslaag} failed_check {misluk} "
      & "warning_check {waarskuwings} skipped_check {oorgeslaan} pending_check "
      & "{hangend} other {loop}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {geslaag} failed_check {misluk} "
      & "warning_check {waarskuwings} skipped_check {oorgeslaan} pending_check "
      & "{hangend} other {loop}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{subject}} other {{subject}, posisie {position, "
      & "number}}}: {kind, select, expected_value {waarde verwag} expected_unit "
      & "{eenheid verwag} invalid_range {ongeldige reeks} end_before_start "
      & "{einde van reeks is voor begin} unknown_field {onbekende veld} "
      & "unsafe_redacted_value {onveilige waarde is verwyder} "
      & "unsupported_syntax {nie-ondersteunde sintaksis} other {diagnostiese "
      & "verduideliking}}; voorstel: {suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {inligting} notice_severity "
      & "{kennisgewing} warning_severity {waarskuwing} error_severity {fout} "
      & "critical_severity {kritieke fout} other {blokkerende fout}} in {line, "
      & "plural, =0 {{path}} other {{path}, reël {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "misluk by {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, reël {line, number}} other {{path}, reël {line, number}, "
      & "kolom {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {inligting} notice_severity "
      & "{kennisgewing} warning_severity {waarskuwing} error_severity {fout} "
      & "critical_severity {kritieke fout} other {blokkerende fout}} in veld "
      & "{field_name}: {message}");
   P ("label.diagnostics.first_failure_label",
      "eerste mislukking in {check_name} by {line, plural, =0 {{path}} other "
      & "{{path}, reël {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 {geen "
      & "probleme nie} one {1 fout} other {{errors, number} foute}}} one "
      & "{{errors, plural, =0 {1 kennisgewing} one {1 fout, 1 kennisgewing} "
      & "other {{errors, number} foute, 1 kennisgewing}}} other {{errors, "
      & "plural, =0 {{notices, number} kennisgewings} one {1 fout, {notices, "
      & "number} kennisgewings} other {{errors, number} foute, {notices, "
      & "number} kennisgewings}}}}} one {{notices, plural, =0 {{errors, plural, "
      & "=0 {1 waarskuwing} one {1 fout, 1 waarskuwing} other {{errors, number} "
      & "foute, 1 waarskuwing}}} one {{errors, plural, =0 {1 waarskuwing, 1 "
      & "kennisgewing} one {1 fout, 1 waarskuwing, 1 kennisgewing} other "
      & "{{errors, number} foute, 1 waarskuwing, 1 kennisgewing}}} other "
      & "{{errors, plural, =0 {1 waarskuwing, {notices, number} kennisgewings} "
      & "one {1 fout, 1 waarskuwing, {notices, number} kennisgewings} other "
      & "{{errors, number} foute, 1 waarskuwing, {notices, number} "
      & "kennisgewings}}}}} other {{notices, plural, =0 {{errors, plural, =0 "
      & "{{warnings, number} waarskuwings} one {1 fout, {warnings, number} "
      & "waarskuwings} other {{errors, number} foute, {warnings, number} "
      & "waarskuwings}}} one {{errors, plural, =0 {{warnings, number} "
      & "waarskuwings, 1 kennisgewing} one {1 fout, {warnings, number} "
      & "waarskuwings, 1 kennisgewing} other {{errors, number} foute, "
      & "{warnings, number} waarskuwings, 1 kennisgewing}}} other {{errors, "
      & "plural, =0 {{warnings, number} waarskuwings, {notices, number} "
      & "kennisgewings} one {1 fout, {warnings, number} waarskuwings, {notices, "
      & "number} kennisgewings} other {{errors, number} foute, {warnings, "
      & "number} waarskuwings, {notices, number} kennisgewings}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, reël "
      & "{line, number}} other {{path}, reël {line, number}, kolom {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {greep-ontleder} duration_parser "
      & "{duurontleder} date_time_parser {datum-tyd-ontleder} color_parser "
      & "{kleurontleder} url_parser {URL-ontleder} unit_parser "
      & "{eenheidontleder} recurrence_parser {herhalingsontleder} "
      & "domain_label_parser {domeinetiket-ontleder} other {ontleder}}: "
      & "{position, plural, =0 {nie-ondersteunde sintaksis {error}} other "
      & "{nie-ondersteunde sintaksis {error} by posisie {position, number}}}; "
      & "{family, select, byte_parser {toegelaat: B, kB, MB, GB, KiB, MiB, GiB "
      & "of TiB} duration_parser {toegelaat: ms, s, min, h, d, w, month of "
      & "year} date_time_parser {toegelaat: ISO-datum, natuurlike dag of "
      & "kloktyd} color_parser {toegelaat: hex, rgb(), hsl(), lab(), lch() of "
      & "kleurnaam} url_parser {toegelaat: skema, gasheer, pad, navraag of "
      & "fragment} unit_parser {toegelaat: ’n ondersteunde "
      & "Humanize-eenheidsetiket} recurrence_parser {toegelaat: cron of ’n "
      & "every/weekday-herhalingsvorm} domain_label_parser {toegelaat: ’n "
      & "deterministiese Humanize-domeinetiket} other {toegelaat: ’n "
      & "ondersteunde invoervorm}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {geslaag} failed_check {misluk} "
      & "warning_check {waarskuwings} skipped_check {oorgeslaan} pending_check "
      & "{hangend} other {loop}}, {notices, plural, =0 {geen kennisgewings nie} "
      & "one {1 kennisgewing} other {{notices, number} kennisgewings}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {poging 1 van 1} other "
      & "{poging {attempt, number} van 1 (limiet oorskry)}}} other {poging "
      & "{attempt, number} van {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {inligting} notice_severity "
      & "{kennisgewing} warning_severity {waarskuwing} error_severity {fout} "
      & "critical_severity {kritiek} other {blokkerend}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {boudiagnostiek} test_source "
      & "{toetsdiagnostiek} lint_source {lint-diagnostiek} import_source "
      & "{invoerdiagnostiek} validation_source {valideringsdiagnostiek} "
      & "runtime_source {looptyddiagnostiek} security_source "
      & "{sekuriteitsdiagnostiek} other {diagnostiek}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {1 {source, select, build_source {boudiagnose} "
      & "test_source {toetsdiagnose} lint_source {lint-diagnose} import_source "
      & "{invoerdiagnose} validation_source {valideringsdiagnose} "
      & "runtime_source {looptyddiagnose} security_source {sekuriteitsdiagnose} "
      & "other {diagnose}}} other {{count, number} {source, select, "
      & "build_source {boudiagnoses} test_source {toetsdiagnoses} lint_source "
      & "{lint-diagnoses} import_source {invoerdiagnoses} validation_source "
      & "{valideringsdiagnoses} runtime_source {looptyddiagnoses} "
      & "security_source {sekuriteitsdiagnoses} other {diagnoses}}}}");
   P ("label.diagnostics.suggested_action_label", "volgende stap: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domeingasheer} ipv4_host {IPv4-adres} "
      & "ipv6_host {IPv6-adres} localhost_host {plaaslike gasheer} "
      & "private_network_host {privaatnetwerkadres} other {onbekende gasheer}}");
   P ("label.events.all_day_label", "{name} (heeldag)");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {nie geantwoord nie} accepted {aanvaar} "
      & "declined {afgewys} maybe {miskien} other {op waglys}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {geen deelnemers nie} one {1 deelnemer} other "
      & "{{count, number} deelnemers}}");
   P ("label.events.canceled_label", "{name} gekanselleer");
   P ("label.events.check_in_label", "meld aan by {name}");
   P ("label.events.conference_link_label", "konferensieskakel vir {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {geen geleenthede nie} one {1 geleentheid} other "
      & "{{count, number} geleenthede}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {geskeduleer} tentative_event "
      & "{voorlopig} in_progress_event {aan die gang} completed_event {voltooi} "
      & "canceled_event {gekanselleer} other {uitgestel}}");
   P ("label.events.event_location_label", "{name}, plek: {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {geskeduleerde geleentheid} "
      & "tentative_event {voorlopige geleentheid} in_progress_event "
      & "{geleentheid aan die gang} completed_event {voltooide geleentheid} "
      & "canceled_event {gekanselleerde geleentheid} other {uitgestelde "
      & "geleentheid}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {openbare geleentheid} private_event "
      & "{private geleentheid} busy_event {wys as besig} other {wys as "
      & "beskikbaar}}");
   P ("label.events.organizer_label", "gereël deur {name}");
   P ("label.events.rsvp_label",
      "antwoord: {state, select, not_responded {geen} accepted {aanvaar} "
      & "declined {afgewys} maybe {miskien} other {op waglys}}");
   P ("label.events.reminder_label", "herinnering: {time_text}");
   P ("label.events.rescheduled_label", "{name} verskuif na {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 karakter} other {{used, number} karakters}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {geen karakterlimiet nie} one {hoogstens 1 "
      & "karakter} other {hoogstens {limit, number} karakters}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 karakter} other {{used, "
      & "number} karakters}}} one {{used, number} van 1 karakter} other {{used, "
      & "number} van {limit, number} karakters}}");
   P ("label.forms.field_label",
      "{required, select, false {{name} (opsioneel)} other {{name} "
      & "(verpligtend)}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {geldig} invalid_input {ongeldig} "
      & "required_input {vereis} optional_input {opsioneel} disabled_input "
      & "{gedeaktiveer} other {leesalleen}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {geen vormprobleme nie} one "
      & "{1 fout} other {{errors, number} foute}}} one {{errors, plural, =0 {1 "
      & "waarskuwing} one {1 fout, 1 waarskuwing} other {{errors, number} "
      & "foute, 1 waarskuwing}}} other {{errors, plural, =0 {{warnings, number} "
      & "waarskuwings} one {1 fout, {warnings, number} waarskuwings} other "
      & "{{errors, number} foute, {warnings, number} waarskuwings}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {nie begin nie} editing_form {word "
      & "geredigeer} dirty_form {ongestoorde veranderinge} saving_form {word "
      & "gestoor} saved_form {gestoor} submitted_form {ingedien} other "
      & "{indiening misluk}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {geldige invoer} invalid_input {ongeldige "
      & "invoer} required_input {vereiste invoer} optional_input {opsionele "
      & "invoer} disabled_input {gedeaktiveerde invoer} other "
      & "{leesalleen-invoer}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {nie begin nie} editing_form {word "
      & "geredigeer} dirty_form {ongestoorde veranderinge} saving_form {vorm "
      & "word gestoor} saved_form {vorm gestoor} submitted_form {vorm ingedien} "
      & "other {{errors, plural, =0 {indiening misluk} one {indiening misluk "
      & "met 1 fout} other {indiening misluk met {errors, number} foute}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {geen ongestoorde veranderinge nie} one {1 "
      & "ongestoorde verandering} other {{count, number} ongestoorde "
      & "veranderinge}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {toeganklike naam "
      & "ontbreek} low_contrast {lae kontras} skipped_heading_level "
      & "{opskrifvlak oorgeslaan} missing_form_label {vormetiket ontbreek} "
      & "invalid_aria {ongeldige ARIA} keyboard_trap {sleutelbordval} other "
      & "{onbekende toeganklikheidsprobleem}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title} – toeganklikheid: {landmarks, plural, one {1 landmerk} other "
      & "{{landmarks, number} landmerke}}, {headings, plural, one {1 opskrif} "
      & "other {{headings, number} opskrifte}}, {issues, plural, one {1 "
      & "probleem} other {{issues, number} probleme}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {voeg ’n toeganklike naam "
      & "by} low_contrast {verhoog die tekskontras} skipped_heading_level "
      & "{gebruik opeenvolgende opskrifvlakke} missing_form_label {koppel ’n "
      & "etiket aan die vormkontrole} invalid_aria {gebruik ’n geldige "
      & "ARIA-rol of -kenmerk} keyboard_trap {verseker dat sleutelbordfokus die "
      & "komponent kan verlaat} other {hersien die toeganklikheidsprobleem}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {geen toeganklikheidsprobleme nie} one "
      & "{1 toeganklikheidsprobleem} other {{issues, number} "
      & "toeganklikheidsprobleme}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id-kenmerk} class_attribute "
      & "{class-kenmerk} data_attribute {data-kenmerk} aria_attribute "
      & "{ARIA-kenmerk} role_attribute {role-kenmerk} link_attribute "
      & "{skakelkenmerk} media_attribute {mediakenmerk} form_attribute "
      & "{vormkenmerk} boolean_attribute {Boole-kenmerk} event_attribute "
      & "{gebeurtenishanteerder-kenmerk} other {onbekende kenmerk}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {warnings, plural, =0 {{errors, plural, =0 {geen probleme "
      & "nie} one {1 fout} other {{errors, number} foute}}} one {{errors, "
      & "plural, =0 {1 waarskuwing} one {1 fout, 1 waarskuwing} other {{errors, "
      & "number} foute, 1 waarskuwing}}} other {{errors, plural, =0 {{warnings, "
      & "number} waarskuwings} one {1 fout, {warnings, number} waarskuwings} "
      & "other {{errors, number} foute, {warnings, number} waarskuwings}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {banier-landmerk} navigation_role "
      & "{navigasielandmerk} main_role {hooflandmerk} complementary_role "
      & "{aanvullende landmerk} contentinfo_role {inhoudsinligting-landmerk} "
      & "search_role {soeklandmerk} form_role {vormlandmerk} region_role "
      & "{streeklandmerk} dialog_role {dialoog} alert_role "
      & "{waarskuwing-regstreekse streek} status_role {status-regstreekse "
      & "streek} other {onbekende landmerk}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {dringende opdatering} other "
      & "{beleefde opdatering}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {teksinhoud} html_content {HTML-inhoud} "
      & "json_content {JSON-inhoud} xml_content {XML-inhoud} image_content "
      & "{beeldinhoud} audio_content {oudio-inhoud} video_content "
      & "{video-inhoud} font_content {lettertipe-inhoud} archive_content "
      & "{argiefinhoud} binary_content {binêre inhoud} form_content "
      & "{vorminhoud} other {onbekende inhoud}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {dokumentmerker} metadata_tag "
      & "{metadatamerker} section_tag {afdelingmerker} text_tag {teksmerker} "
      & "link_tag {skakelmerker} media_tag {mediamerker} form_tag {vormmerker} "
      & "table_tag {tabelmerker} interactive_tag {interaktiewe merker} "
      & "scripting_tag {skripmerker} other {onbekende merker}}");
   P ("label.media.duration_label", "duur: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {beeld} video_media {video} audio_media "
      & "{oudio} pdf_document {PDF-dokument} text_document {teksdokument} "
      & "archive_media {argief} other {media}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {gereed} processing_media {word verwerk} "
      & "transcoding_media {word getranskodeer} thumbnail_missing {duimnael nie "
      & "beskikbaar nie} metadata_missing {metadata ontbreek} locked_document "
      & "{dokument gesluit} other {nie beskikbaar nie}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {beeld} video_media {video} "
      & "audio_media {oudio} pdf_document {PDF-dokument} text_document "
      & "{teksdokument} archive_media {argief} other {media}}): {state, select, "
      & "ready_media {gereed} processing_media {word verwerk} transcoding_media "
      & "{word getranskodeer} thumbnail_missing {duimnael nie beskikbaar nie} "
      & "metadata_missing {metadata ontbreek} locked_document {dokument "
      & "gesluit} other {nie beskikbaar nie}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {geen bladsye nie} one {1 bladsy} other {{pages, "
      & "number} bladsye}}");
   P ("label.media.resolution_label", "{width, number} × {height, number}");
   P ("label.moderation.appeal_label",
      "{item}: appèl, {state, select, open_report {aanmelding oop} "
      & "triaged_report {aanmelding beoordeel} actioned_report {aksie geneem} "
      & "dismissed_report {aanmelding afgewys} appealed_report {aanmelding "
      & "geappelleer} other {aanmelding gesluit}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {geen moderasie-aksie nie} flagged {gevlag} "
      & "hidden {deur moderator versteek} restored {herstel} marked_spam {as "
      & "strooipos gemerk} removed {verwyder} other {geëskaleer}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {geen moderasie-aksie nie} flagged "
      & "{gevlag} hidden {deur moderator versteek} restored {herstel} "
      & "marked_spam {as strooipos gemerk} removed {verwyder} other "
      & "{geëskaleer}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {moderasietou leeg} other "
      & "{{pending, number} wag op hersiening}}} other {{pending, number} wag "
      & "op hersiening, {escalated, number} geëskaleer}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {oop aanmelding} triaged_report "
      & "{beoordeelde aanmelding} actioned_report {aksie geneem} "
      & "dismissed_report {afgewysde aanmelding} appealed_report {geappelleerde "
      & "aanmelding} other {geslote aanmelding}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {oop aanmelding} triaged_report "
      & "{beoordeelde aanmelding} actioned_report {aksie geneem} "
      & "dismissed_report {afgewysde aanmelding} appealed_report {geappelleerde "
      & "aanmelding} other {geslote aanmelding}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {wag op hersiening} approved "
      & "{goedgekeur} rejected {afgekeur} needs_changes {veranderinge nodig} "
      & "other {hersiening geëskaleer}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {wag op hersiening} approved "
      & "{goedgekeur} rejected {afgekeur} needs_changes {veranderinge nodig} "
      & "other {hersiening geëskaleer}}");
   P ("label.navigation.back_label", "terug na {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {geen broodkrummels nie} one {1 broodkrummel} other "
      & "{{depth, number} broodkrummels}}");
   P ("label.navigation.current_page_label", "huidige bladsy: {name}");
   P ("label.navigation.external_link_label", "{name} (eksterne skakel)");
   P ("label.navigation.first_label", "eerste: {target}");
   P ("label.navigation.last_label", "laaste: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {geen kieslysitems nie} one {1 kieslysitem} other "
      & "{{count, number} kieslysitems}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {skakel} menu_item {kieslysitem} tab_item "
      & "{oortjie} breadcrumb_item {broodkrummel} section_item {afdeling} other "
      & "{skeier}}");
end Labels_1;
