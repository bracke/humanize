separate (Humanize.Catalogs.Phrase_Data.Locale_En)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {{name} active account} invited_account "
      & "{{name} invited account} locked_account {{name} locked account} "
      & "suspended_account {{name} suspended account} deleted_account {{name} "
      & "deleted account} other {{name} unknown account state}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {active account} invited_account "
      & "{invited account} locked_account {locked account} suspended_account "
      & "{suspended account} deleted_account {deleted account} other {unknown "
      & "account state}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {trusted device} untrusted_device "
      & "{untrusted device} new_device {new device} other {blocked device}}");
   P ("label.accounts.last_active_label", "{name} last active {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name} login failed} other {{name} login "
      & "succeeded}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA enabled} mfa_disabled {MFA disabled} "
      & "mfa_required {MFA required} other {MFA reset required}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name} active session} expired_session "
      & "{{name} session expired} revoked_session {{name} session revoked} "
      & "idle_session {{name} idle session} other {{name} unknown session "
      & "state}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {active session} expired_session "
      & "{session expired} revoked_session {session revoked} idle_session {idle "
      & "session} other {unknown session state}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {no attachments} one {1 attachment} other {{count, "
      & "number} attachments}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, one {{name}: 1 attachment} other {{name}: {count, "
      & "number} attachments}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {file attachment} image_attachment "
      & "{image attachment} video_attachment {video attachment} "
      & "audio_attachment {audio attachment} document_attachment {document "
      & "attachment} archive_attachment {archive attachment} other {link "
      & "attachment}}");
   P ("label.attachments.attachment_label",
      "{state, select, pending_attachment {{kind, select, file_attachment "
      & "{{name} file pending} image_attachment {{name} image pending} "
      & "video_attachment {{name} video pending} audio_attachment {{name} audio "
      & "pending} document_attachment {{name} document pending} "
      & "archive_attachment {{name} archive pending} other {{name} link "
      & "pending}}} uploading_attachment {{kind, select, file_attachment "
      & "{{name} file uploading} image_attachment {{name} image uploading} "
      & "video_attachment {{name} video uploading} audio_attachment {{name} "
      & "audio uploading} document_attachment {{name} document uploading} "
      & "archive_attachment {{name} archive uploading} other {{name} link "
      & "uploading}}} uploaded_attachment {{kind, select, file_attachment "
      & "{{name} file uploaded} image_attachment {{name} image uploaded} "
      & "video_attachment {{name} video uploaded} audio_attachment {{name} "
      & "audio uploaded} document_attachment {{name} document uploaded} "
      & "archive_attachment {{name} archive uploaded} other {{name} link "
      & "uploaded}}} failed_attachment {{kind, select, file_attachment {{name} "
      & "file failed} image_attachment {{name} image failed} video_attachment "
      & "{{name} video failed} audio_attachment {{name} audio failed} "
      & "document_attachment {{name} document failed} archive_attachment "
      & "{{name} archive failed} other {{name} link failed}}} "
      & "removed_attachment {{kind, select, file_attachment {{name} file "
      & "removed} image_attachment {{name} image removed} video_attachment "
      & "{{name} video removed} audio_attachment {{name} audio removed} "
      & "document_attachment {{name} document removed} archive_attachment "
      & "{{name} archive removed} other {{name} link removed}}} other {{kind, "
      & "select, file_attachment {{name} file blocked} image_attachment {{name} "
      & "image blocked} video_attachment {{name} video blocked} "
      & "audio_attachment {{name} audio blocked} document_attachment {{name} "
      & "document blocked} archive_attachment {{name} archive blocked} other "
      & "{{name} link blocked}}}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {pending attachment} "
      & "uploading_attachment {uploading attachment} uploaded_attachment "
      & "{uploaded attachment} failed_attachment {failed attachment} "
      & "removed_attachment {removed attachment} other {blocked attachment}}");
   P ("label.attachments.download_label", "download {name}");
   P ("label.attachments.expiring_link_label", "{name} link expires {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "preview {name}");
   P ("label.attachments.remove_label", "remove {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name} scan not scanned} scanning {{name} "
      & "scan scanning} safe {{name} scan safe} suspicious {{name} scan "
      & "suspicious} other {{name} scan infected}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {scan not scanned} scanning {scan "
      & "scanning} safe {scan safe} suspicious {scan suspicious} other {scan "
      & "infected}}");
   P ("label.attachments.upload_error_label", "{name} upload failed: {reason}");
   P ("label.badges.badge_label",
      "{state, select, default_badge {{tone, select, neutral_tone {{name} "
      & "neutral badge} info_tone {{name} info badge} success_tone {{name} "
      & "success badge} warning_tone {{name} warning badge} danger_tone {{name} "
      & "danger badge} other {{name} muted badge}}} new_badge {{tone, select, "
      & "neutral_tone {{name} neutral new badge} info_tone {{name} info new "
      & "badge} success_tone {{name} success new badge} warning_tone {{name} "
      & "warning new badge} danger_tone {{name} danger new badge} other {{name} "
      & "muted new badge}}} updated_badge {{tone, select, neutral_tone {{name} "
      & "neutral updated badge} info_tone {{name} info updated badge} "
      & "success_tone {{name} success updated badge} warning_tone {{name} "
      & "warning updated badge} danger_tone {{name} danger updated badge} other "
      & "{{name} muted updated badge}}} deprecated_badge {{tone, select, "
      & "neutral_tone {{name} neutral deprecated badge} info_tone {{name} info "
      & "deprecated badge} success_tone {{name} success deprecated badge} "
      & "warning_tone {{name} warning deprecated badge} danger_tone {{name} "
      & "danger deprecated badge} other {{name} muted deprecated badge}}} "
      & "selected_badge {{tone, select, neutral_tone {{name} neutral selected "
      & "badge} info_tone {{name} info selected badge} success_tone {{name} "
      & "success selected badge} warning_tone {{name} warning selected badge} "
      & "danger_tone {{name} danger selected badge} other {{name} muted "
      & "selected badge}}} disabled_badge {{tone, select, neutral_tone {{name} "
      & "neutral disabled badge} info_tone {{name} info disabled badge} "
      & "success_tone {{name} success disabled badge} warning_tone {{name} "
      & "warning disabled badge} danger_tone {{name} danger disabled badge} "
      & "other {{name} muted disabled badge}}} other {{tone, select, "
      & "neutral_tone {{name} neutral dismissible badge} info_tone {{name} info "
      & "dismissible badge} success_tone {{name} success dismissible badge} "
      & "warning_tone {{name} warning dismissible badge} danger_tone {{name} "
      & "danger dismissible badge} other {{name} muted dismissible badge}}}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {low priority badge} medium_priority "
      & "{medium priority badge} high_priority {high priority badge} other "
      & "{critical priority badge}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {default badge} new_badge {new badge} "
      & "updated_badge {updated badge} deprecated_badge {deprecated badge} "
      & "selected_badge {selected badge} disabled_badge {disabled badge} other "
      & "{dismissible badge}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {neutral badge} info_tone {info badge} "
      & "success_tone {success badge} warning_tone {warning badge} danger_tone "
      & "{danger badge} other {muted badge}}");
   P ("label.badges.chip_label", "{selected, select, false {{name} chip} other {{name} chip selected}}");
   P ("label.badges.count_badge_label",
      "{count, plural, =0 {no {name}s} one {1 {name}} other {{count, number} "
      & "{name}s}}");
   P ("label.badges.deprecated_label", "{name} warning deprecated badge");
   P ("label.badges.dismiss_label", "dismiss {name}");
   P ("label.badges.new_label", "{name} info new badge");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {no hidden badges} one {+1 more badge} other "
      & "{+{hidden_count, number} more badges}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name} low priority badge} "
      & "medium_priority {{name} medium priority badge} high_priority {{name} "
      & "high priority badge} other {{name} critical priority badge}}");
   P ("label.badges.status_badge_label",
      "{tone, select, neutral_tone {{name} status, neutral} info_tone {{name} "
      & "status, info} success_tone {{name} status, success} warning_tone "
      & "{{name} status, warning} danger_tone {{name} status, danger} other "
      & "{{name} status, muted}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {no tags} one {1 tag} other {{count, number} tags}}");
   P ("label.badges.tag_label", "{name} tag");
   P ("label.badges.updated_label", "{name} success updated badge");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artifact uploaded} artifact_missing "
      & "{artifact missing} artifact_expired {artifact expired} other {artifact "
      & "verified}}");
   P ("label.builds.benchmark_label", "{name} benchmark {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {{name} build queued} build_running "
      & "{{name} build running} build_passed {{name} build passed} build_failed "
      & "{{name} build failed} snapshot_build {{name} snapshot build} other "
      & "{{name} release build}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {build queued} build_running {build "
      & "running} build_passed {build passed} build_failed {build failed} "
      & "snapshot_build {snapshot build} other {release build}}");
   P ("label.builds.coverage_label", "coverage {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {release gate passed} gate_failed {release "
      & "gate failed} gate_warning {release gate warning} other {release gate "
      & "blocked}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {no tests passed} one "
      & "{1 test passed} other {{count, number} tests passed}}} failed_test "
      & "{{count, plural, =0 {no tests failed} one {1 test failed} other "
      & "{{count, number} tests failed}}} skipped_test {{count, plural, =0 {no "
      & "tests skipped} one {1 test skipped} other {{count, number} tests "
      & "skipped}}} flaky_test {{count, plural, =0 {no tests flaky} one {1 test "
      & "flaky} other {{count, number} tests flaky}}} other {{count, plural, =0 "
      & "{no tests expected failure} one {1 test expected failure} other "
      & "{{count, number} tests expected failure}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {passed} failed_test {failed} skipped_test "
      & "{skipped} flaky_test {flaky} other {expected failure}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "unchanged, disabled} other {{field_name} changed from disabled to "
      & "enabled}}} other {{new_value, select, false {{field_name} changed from "
      & "enabled to disabled} other {{field_name} unchanged, enabled}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {added} removed_change {removed} "
      & "modified_change {changed} renamed_change {renamed} unchanged_change "
      & "{unchanged} metadata_change {metadata changed} moved_change {moved} "
      & "conflict_change {conflict} other {unknown change}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {informational change} "
      & "minor_change {minor change} major_change {major change} other "
      & "{breaking change}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} unchanged} "
      & "other {{unchanged, plural, =0 {{field_name} changed: {added, number} "
      & "added} other {{field_name} changed: {added, number} added, {unchanged, "
      & "number} unchanged}}}}} other {{added, plural, =0 {{unchanged, plural, "
      & "=0 {{field_name} changed: {removed, number} removed} other "
      & "{{field_name} changed: {removed, number} removed, {unchanged, number} "
      & "unchanged}}} other {{unchanged, plural, =0 {{field_name} changed: "
      & "{added, number} added, {removed, number} removed} other {{field_name} "
      & "changed: {added, number} added, {removed, number} removed, {unchanged, "
      & "number} unchanged}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {no conflicts} one {1 conflict} other {{count, "
      & "number} conflicts}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} moved later from {old_label} to "
      & "{new_label}} other {{field_name} moved earlier from {old_label} to "
      & "{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} changed from {old_label} to {new_label}");
   P ("label.changes.field_change_label", "{field_name} changed from {old_value} to {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name} added} removed_change {{name} "
      & "removed} modified_change {{name} changed} renamed_change {{name} "
      & "renamed} unchanged_change {{name} unchanged} metadata_change {{name} "
      & "metadata changed} moved_change {{name} moved} conflict_change {{name} "
      & "conflict} other {{name} unknown change}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {only metadata changed} one {only 1 metadata field "
      & "changed} other {only {count, number} metadata fields changed}}");
   P ("label.changes.move_label", "{name} moved from {from} to {to}");
   P ("label.changes.no_changes_label", "no changes");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {no line changes} "
      & "one {1 line added} other {{lines_added, number} lines added}}} one "
      & "{{lines_added, plural, =0 {1 line removed} one {1 line added, 1 line "
      & "removed} other {{lines_added, number} lines added, 1 line removed}}} "
      & "other {{lines_added, plural, =0 {{lines_removed, number} lines "
      & "removed} one {1 line added, {lines_removed, number} lines removed} "
      & "other {{lines_added, number} lines added, {lines_removed, number} "
      & "lines removed}}}}");
   P ("label.changes.rename_label", "renamed from {old_name} to {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} drafted a comment} "
      & "published_comment {{author} commented} edited_comment {{author} edited "
      & "a comment} deleted_comment {{author} deleted a comment} "
      & "resolved_comment {{author} resolved a comment} unresolved_comment "
      & "{{author} reopened a comment} pinned_comment {{author} pinned a "
      & "comment} other {{author} hid a comment}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {no comments} one {1 comment} other {{count, "
      & "number} comments}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author} draft comment} "
      & "published_comment {{author} published comment} edited_comment "
      & "{{author} edited comment} deleted_comment {{author} deleted comment} "
      & "resolved_comment {{author} resolved comment} unresolved_comment "
      & "{{author} unresolved comment} pinned_comment {{author} pinned comment} "
      & "other {{author} hidden comment}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {draft comment} published_comment "
      & "{published comment} edited_comment {edited comment} deleted_comment "
      & "{deleted comment} resolved_comment {resolved comment} "
      & "unresolved_comment {unresolved comment} pinned_comment {pinned "
      & "comment} other {hidden comment}}");
   P ("label.comments.deleted_label", "{author} deleted a comment");
   P ("label.comments.edited_label", "edited {time_text}");
   P ("label.comments.hide_comment_label", "hide comment: {reason}");
   P ("label.comments.lock_thread_label", "lock {name} thread");
   P ("label.comments.mention_label", "{actor} mentioned {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {no participants} one {1 participant} other "
      & "{{count, number} participants}}");
   P ("label.comments.pin_label", "pin {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {like reaction} dislike_reaction {dislike "
      & "reaction} heart_reaction {heart reaction} laugh_reaction {laugh "
      & "reaction} confused_reaction {confused reaction} hooray_reaction "
      & "{hooray reaction} rocket_reaction {rocket reaction} other {eyes "
      & "reaction}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {no likes} one {1 "
      & "like} other {{count, number} likes}}} dislike_reaction {{count, "
      & "plural, =0 {no dislikes} one {1 dislike} other {{count, number} "
      & "dislikes}}} heart_reaction {{count, plural, =0 {no hearts} one {1 "
      & "heart} other {{count, number} hearts}}} laugh_reaction {{count, "
      & "plural, =0 {no laughs} one {1 laugh} other {{count, number} laughs}}} "
      & "confused_reaction {{count, plural, =0 {no confused reactions} one {1 "
      & "confused} other {{count, number} confused reactions}}} hooray_reaction "
      & "{{count, plural, =0 {no hoorays} one {1 hooray} other {{count, number} "
      & "hoorays}}} rocket_reaction {{count, plural, =0 {no rockets} one {1 "
      & "rocket} other {{count, number} rockets}}} other {{count, plural, =0 "
      & "{no eyes} other {{count, number} eyes}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {no replies} one {1 reply} other {{count, number} "
      & "replies}}");
   P ("label.comments.resolved_label", "{name} resolved");
   P ("label.comments.subscribe_label", "subscribe to {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {no threads} one {1 thread} other {{count, number} "
      & "threads}}");
   P ("label.comments.thread_label",
      "{state, select, open_thread {{count, plural, =0 {{name} open thread} "
      & "one {{name} open thread, 1 comment} other {{name} open thread, {count, "
      & "number} comments}}} resolved_thread {{count, plural, =0 {{name} "
      & "resolved thread} one {{name} resolved thread, 1 comment} other {{name} "
      & "resolved thread, {count, number} comments}}} locked_thread {{count, "
      & "plural, =0 {{name} locked thread} one {{name} locked thread, 1 "
      & "comment} other {{name} locked thread, {count, number} comments}}} "
      & "other {{count, plural, =0 {{name} archived thread} one {{name} "
      & "archived thread, 1 comment} other {{name} archived thread, {count, "
      & "number} comments}}}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {open thread} resolved_thread {resolved "
      & "thread} locked_thread {locked thread} other {archived thread}}");
   P ("label.comments.unpin_label", "unpin {name}");
   P ("label.comments.unsubscribe_label", "unsubscribe from {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name} improved} regressed {{name} "
      & "regressed} unchanged {{name} unchanged} within_tolerance {{name} "
      & "within tolerance} outside_tolerance {{name} outside tolerance} "
      & "new_value {{name} new} removed_value {{name} removed} other {{name} "
      & "baseline unavailable}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {improved} regressed {regressed} unchanged "
      & "{unchanged} within_tolerance {within tolerance} outside_tolerance "
      & "{outside tolerance} new_value {new} removed_value {removed} other "
      & "{baseline unavailable}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name} improved by {difference_text}} "
      & "regressed {{name} regressed by {difference_text}} unchanged {{name} "
      & "unchanged by {difference_text}} within_tolerance {{name} within "
      & "tolerance by {difference_text}} outside_tolerance {{name} outside "
      & "tolerance by {difference_text}} new_value {{name} new by "
      & "{difference_text}} removed_value {{name} removed by {difference_text}} "
      & "other {{name} baseline unavailable by {difference_text}}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name} improved by {difference_text}, "
      & "tolerance {tolerance_text}} regressed {{name} regressed by "
      & "{difference_text}, tolerance {tolerance_text}} unchanged {{name} "
      & "unchanged by {difference_text}, tolerance {tolerance_text}} "
      & "within_tolerance {{name} within tolerance by {difference_text}, "
      & "tolerance {tolerance_text}} outside_tolerance {{name} outside "
      & "tolerance by {difference_text}, tolerance {tolerance_text}} new_value "
      & "{{name} new by {difference_text}, tolerance {tolerance_text}} "
      & "removed_value {{name} removed by {difference_text}, tolerance "
      & "{tolerance_text}} other {{name} baseline unavailable by "
      & "{difference_text}, tolerance {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {invalid row} duplicate_record {duplicate "
      & "record} missing_column {missing column} unknown_field {unknown field} "
      & "schema_mismatch {schema mismatch} other {skipped record}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {dry run passed} dry_run_failed {dry "
      & "run failed} import_valid {import valid} import_invalid {import "
      & "invalid} other {partial import}}");
   P ("label.data_quality.import_result_label",
      "{state, select, dry_run_passed {{name} dry run passed: {accepted, "
      & "number} accepted, {rejected, number} rejected} dry_run_failed {{name} "
      & "dry run failed: {accepted, number} accepted, {rejected, number} "
      & "rejected} import_valid {{name} import valid: {accepted, number} "
      & "accepted, {rejected, number} rejected} import_invalid {{name} import "
      & "invalid: {accepted, number} accepted, {rejected, number} rejected} "
      & "other {{name} partial import: {accepted, number} accepted, {rejected, "
      & "number} rejected}}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {no invalid rows} one "
      & "{1 invalid row} other {{count, number} invalid rows}}} "
      & "duplicate_record {{count, plural, =0 {no duplicate records} one {1 "
      & "duplicate record} other {{count, number} duplicate records}}} "
      & "missing_column {{count, plural, =0 {no missing columns} one {1 missing "
      & "column} other {{count, number} missing columns}}} unknown_field "
      & "{{count, plural, =0 {no unknown fields} one {1 unknown field} other "
      & "{{count, number} unknown fields}}} schema_mismatch {{count, plural, =0 "
      & "{no schema mismatchs} one {1 schema mismatch} other {{count, number} "
      & "schema mismatchs}}} other {{count, plural, =0 {no skipped records} one "
      & "{1 skipped record} other {{count, number} skipped records}}}}");
   P ("label.data_quality.row_issue_label",
      "{issue, select, invalid_row {row {row, number} invalid row} "
      & "duplicate_record {row {row, number} duplicate record} missing_column "
      & "{row {row, number} missing column} unknown_field {row {row, number} "
      & "unknown field} schema_mismatch {row {row, number} schema mismatch} "
      & "other {row {row, number} skipped record}}");
   P ("label.data_quality.source_file_issue_label",
      "{issue, select, invalid_row {{file_name} invalid row} duplicate_record "
      & "{{file_name} duplicate record} missing_column {{file_name} missing "
      & "column} unknown_field {{file_name} unknown field} schema_mismatch "
      & "{{file_name} schema mismatch} other {{file_name} skipped record}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artifact ready} artifact_uploaded "
      & "{artifact uploaded} artifact_signed {artifact signed} artifact_missing "
      & "{artifact missing} other {artifact expired}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {{name} to {environment} deployment "
      & "queued} deploying {{name} to {environment} deploying} deployed {{name} "
      & "to {environment} deployed} failed_deployment {{name} to {environment} "
      & "deployment failed} rolled_back {{name} to {environment} rolled back} "
      & "blocked_deployment {{name} to {environment} deployment blocked} other "
      & "{{name} to {environment} deployment canceled}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {deployment queued} deploying "
      & "{deploying} deployed {deployed} failed_deployment {deployment failed} "
      & "rolled_back {rolled back} blocked_deployment {deployment blocked} "
      & "other {deployment canceled}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {environment healthy} "
      & "drifting_environment {environment drift} locked_environment "
      & "{environment locked} maintenance_environment {environment maintenance} "
      & "other {unknown environment state}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {no migration} migration_pending "
      & "{migration pending} migrating {migrating} migration_complete "
      & "{migration complete} other {migration failed}}");
   P ("label.deployments.promotion_label", "{name} promoted from {from_environment} to {to_environment}");
   P ("label.deployments.rollback_label", "{name} rollback to {target}");
   P ("label.deployments.rollout_label", "{name} rollout {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {no affected items} one {1 affected item} other "
      & "{{count, number} affected items}}");
   P ("label.diagnostics.check_duration_label",
      "{duration_s, plural, one {{status, select, passed_check {{name} passed "
      & "in 1 second} failed_check {{name} failed in 1 second} warning_check "
      & "{{name} warnings in 1 second} skipped_check {{name} skipped in 1 "
      & "second} pending_check {{name} pending in 1 second} other {{name} "
      & "running in 1 second}}} other {{status, select, passed_check {{name} "
      & "passed in {duration_s, number} seconds} failed_check {{name} failed in "
      & "{duration_s, number} seconds} warning_check {{name} warnings in "
      & "{duration_s, number} seconds} skipped_check {{name} skipped in "
      & "{duration_s, number} seconds} pending_check {{name} pending in "
      & "{duration_s, number} seconds} other {{name} running in {duration_s, "
      & "number} seconds}}}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name} passed} failed_check {{name} "
      & "failed} warning_check {{name} warnings} skipped_check {{name} skipped} "
      & "pending_check {{name} pending} other {{name} running}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {passed} failed_check {failed} "
      & "warning_check {warnings} skipped_check {skipped} pending_check "
      & "{pending} other {running}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{position, plural, =0 {{kind, select, expected_value {expected a value "
      & "for {subject}; use {suggestion}} expected_unit {expected a unit for "
      & "{subject}; use {suggestion}} invalid_range {invalid range for "
      & "{subject}; use {suggestion}} end_before_start {range end is before "
      & "start for {subject}; use {suggestion}} unknown_field {unknown field "
      & "for {subject}; use {suggestion}} unsafe_redacted_value {unsafe value "
      & "was redacted for {subject}; use {suggestion}} unsupported_syntax "
      & "{unsupported syntax for {subject}; use {suggestion}} other {diagnostic "
      & "explanation for {subject}; use {suggestion}}}} other {{kind, select, "
      & "expected_value {expected a value for {subject} at position {position, "
      & "number}; use {suggestion}} expected_unit {expected a unit for "
      & "{subject} at position {position, number}; use {suggestion}} "
      & "invalid_range {invalid range for {subject} at position {position, "
      & "number}; use {suggestion}} end_before_start {range end is before start "
      & "for {subject} at position {position, number}; use {suggestion}} "
      & "unknown_field {unknown field for {subject} at position {position, "
      & "number}; use {suggestion}} unsafe_redacted_value {unsafe value was "
      & "redacted for {subject} at position {position, number}; use "
      & "{suggestion}} unsupported_syntax {unsupported syntax for {subject} at "
      & "position {position, number}; use {suggestion}} other {diagnostic "
      & "explanation for {subject} at position {position, number}; use "
      & "{suggestion}}}}}");
   P ("label.diagnostics.diagnostic_label",
      "{line, plural, =0 {{severity, select, info_severity {info at {path}: "
      & "{message}} notice_severity {notice at {path}: {message}} "
      & "warning_severity {warning at {path}: {message}} error_severity {error "
      & "at {path}: {message}} critical_severity {critical at {path}: "
      & "{message}} other {blocking at {path}: {message}}}} other {{severity, "
      & "select, info_severity {info at {path} line {line, number}: {message}} "
      & "notice_severity {notice at {path} line {line, number}: {message}} "
      & "warning_severity {warning at {path} line {line, number}: {message}} "
      & "error_severity {error at {path} line {line, number}: {message}} "
      & "critical_severity {critical at {path} line {line, number}: {message}} "
      & "other {blocking at {path} line {line, number}: {message}}}}}");
   P ("label.diagnostics.failed_at_label",
      "{line, plural, =0 {failed at {path}} other {{column, plural, =0 "
      & "{failed at {path} line {line, number}} other {failed at {path} line "
      & "{line, number}, column {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {info in {field_name}: {message}} "
      & "notice_severity {notice in {field_name}: {message}} warning_severity "
      & "{warning in {field_name}: {message}} error_severity {error in "
      & "{field_name}: {message}} critical_severity {critical in {field_name}: "
      & "{message}} other {blocking in {field_name}: {message}}}");
   P ("label.diagnostics.first_failure_label",
      "{line, plural, =0 {first failure in {check_name} at {path}} other "
      & "{first failure in {check_name} at {path} line {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, =0 {no "
      & "issues} one {1 error} other {{errors, number} errors}}} one {{errors, "
      & "plural, =0 {1 notice} one {1 error, 1 notice} other {{errors, number} "
      & "errors, 1 notice}}} other {{errors, plural, =0 {{notices, number} "
      & "notices} one {1 error, {notices, number} notices} other {{errors, "
      & "number} errors, {notices, number} notices}}}}} one {{notices, plural, "
      & "=0 {{errors, plural, =0 {1 warning} one {1 error, 1 warning} other "
      & "{{errors, number} errors, 1 warning}}} one {{errors, plural, =0 {1 "
      & "warning, 1 notice} one {1 error, 1 warning, 1 notice} other {{errors, "
      & "number} errors, 1 warning, 1 notice}}} other {{errors, plural, =0 {1 "
      & "warning, {notices, number} notices} one {1 error, 1 warning, {notices, "
      & "number} notices} other {{errors, number} errors, 1 warning, {notices, "
      & "number} notices}}}}} other {{notices, plural, =0 {{errors, plural, =0 "
      & "{{warnings, number} warnings} one {1 error, {warnings, number} "
      & "warnings} other {{errors, number} errors, {warnings, number} "
      & "warnings}}} one {{errors, plural, =0 {{warnings, number} warnings, 1 "
      & "notice} one {1 error, {warnings, number} warnings, 1 notice} other "
      & "{{errors, number} errors, {warnings, number} warnings, 1 notice}}} "
      & "other {{errors, plural, =0 {{warnings, number} warnings, {notices, "
      & "number} notices} one {1 error, {warnings, number} warnings, {notices, "
      & "number} notices} other {{errors, number} errors, {warnings, number} "
      & "warnings, {notices, number} notices}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path} line "
      & "{line, number}} other {{path} line {line, number}, column {column, "
      & "number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{position, plural, =0 {{family, select, byte_parser {unsupported "
      & "syntax for byte parser {error}; use B, kB, MB, GB, KiB, MiB, GiB, or "
      & "TiB} duration_parser {unsupported syntax for duration parser {error}; "
      & "use ms, s, min, h, d, w, month, or year} date_time_parser {unsupported "
      & "syntax for date-time parser {error}; use ISO date, natural day, or "
      & "clock time} color_parser {unsupported syntax for color parser {error}; "
      & "use hex, rgb(), hsl(), lab(), lch(), or named color} url_parser "
      & "{unsupported syntax for URL parser {error}; use scheme, host, path, "
      & "query, or fragment} unit_parser {unsupported syntax for unit parser "
      & "{error}; use a supported Humanize unit label} recurrence_parser "
      & "{unsupported syntax for recurrence parser {error}; use cron or "
      & "every/weekday recurrence form} domain_label_parser {unsupported syntax "
      & "for domain-label parser {error}; use a deterministic Humanize domain "
      & "label} other {unsupported syntax for parser {error}; use a supported "
      & "input form}}} other {{family, select, byte_parser {unsupported syntax "
      & "for byte parser {error} at position {position, number}; use B, kB, MB, "
      & "GB, KiB, MiB, GiB, or TiB} duration_parser {unsupported syntax for "
      & "duration parser {error} at position {position, number}; use ms, s, "
      & "min, h, d, w, month, or year} date_time_parser {unsupported syntax for "
      & "date-time parser {error} at position {position, number}; use ISO date, "
      & "natural day, or clock time} color_parser {unsupported syntax for color "
      & "parser {error} at position {position, number}; use hex, rgb(), hsl(), "
      & "lab(), lch(), or named color} url_parser {unsupported syntax for URL "
      & "parser {error} at position {position, number}; use scheme, host, path, "
      & "query, or fragment} unit_parser {unsupported syntax for unit parser "
      & "{error} at position {position, number}; use a supported Humanize unit "
      & "label} recurrence_parser {unsupported syntax for recurrence parser "
      & "{error} at position {position, number}; use cron or every/weekday "
      & "recurrence form} domain_label_parser {unsupported syntax for "
      & "domain-label parser {error} at position {position, number}; use a "
      & "deterministic Humanize domain label} other {unsupported syntax for "
      & "parser {error} at position {position, number}; use a supported input "
      & "form}}}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {{notices, plural, =0 {passed with no "
      & "notices} one {passed with 1 notice} other {passed with {notices, "
      & "number} notices}}} failed_check {{notices, plural, =0 {failed with no "
      & "notices} one {failed with 1 notice} other {failed with {notices, "
      & "number} notices}}} warning_check {{notices, plural, =0 {warnings with "
      & "no notices} one {warnings with 1 notice} other {warnings with "
      & "{notices, number} notices}}} skipped_check {{notices, plural, =0 "
      & "{skipped with no notices} one {skipped with 1 notice} other {skipped "
      & "with {notices, number} notices}}} pending_check {{notices, plural, =0 "
      & "{pending with no notices} one {pending with 1 notice} other {pending "
      & "with {notices, number} notices}}} other {{notices, plural, =0 {running "
      & "with no notices} one {running with 1 notice} other {running with "
      & "{notices, number} notices}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {retry 1 of 1} other {retry "
      & "{attempt, number} of 1 exceeded}}} other {retry {attempt, number} of "
      & "{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {info} notice_severity {notice} "
      & "warning_severity {warning} error_severity {error} critical_severity "
      & "{critical} other {blocking}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {build diagnostics} test_source {test "
      & "diagnostics} lint_source {lint diagnostics} import_source {import "
      & "diagnostics} validation_source {validation diagnostics} runtime_source "
      & "{runtime diagnostics} security_source {security diagnostics} other "
      & "{diagnostic diagnostics}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {{source, select, build_source {1 build "
      & "diagnostic} test_source {1 test diagnostic} lint_source {1 lint "
      & "diagnostic} import_source {1 import diagnostic} validation_source {1 "
      & "validation diagnostic} runtime_source {1 runtime diagnostic} "
      & "security_source {1 security diagnostic} other {1 diagnostic "
      & "diagnostic}}} other {{source, select, build_source {{count, number} "
      & "build diagnostics} test_source {{count, number} test diagnostics} "
      & "lint_source {{count, number} lint diagnostics} import_source {{count, "
      & "number} import diagnostics} validation_source {{count, number} "
      & "validation diagnostics} runtime_source {{count, number} runtime "
      & "diagnostics} security_source {{count, number} security diagnostics} "
      & "other {{count, number} diagnostic diagnostics}}}}");
   P ("label.diagnostics.suggested_action_label", "next: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {domain host} ipv4_host {IPv4 address} "
      & "ipv6_host {IPv6 address} localhost_host {local host} "
      & "private_network_host {private network address} other {unknown host}}");
   P ("label.events.all_day_label", "{name} all-day event");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {not responded} accepted {accepted} "
      & "declined {declined} maybe {maybe} other {waitlisted}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {no attendees} one {1 attendee} other {{count, "
      & "number} attendees}}");
   P ("label.events.canceled_label", "{name} canceled");
   P ("label.events.check_in_label", "check in to {name}");
   P ("label.events.conference_link_label", "{name} conference link");
   P ("label.events.event_count_label",
      "{count, plural, =0 {no events} one {1 event} other {{count, number} "
      & "events}}");
   P ("label.events.event_label",
      "{state, select, scheduled_event {{name} scheduled event} "
      & "tentative_event {{name} tentative event} in_progress_event {{name} in "
      & "progress event} completed_event {{name} completed event} "
      & "canceled_event {{name} canceled event} other {{name} postponed event}}");
   P ("label.events.event_location_label", "{name} at {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {scheduled event} tentative_event "
      & "{tentative event} in_progress_event {in progress event} "
      & "completed_event {completed event} canceled_event {canceled event} "
      & "other {postponed event}}");
   P ("label.events.event_time_label", "{name} at {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {public event} private_event "
      & "{private event} busy_event {busy event} other {free event}}");
   P ("label.events.organizer_label", "organized by {name}");
   P ("label.events.rsvp_label",
      "{state, select, not_responded {RSVP not responded} accepted {RSVP "
      & "accepted} declined {RSVP declined} maybe {RSVP maybe} other {RSVP "
      & "waitlisted}}");
   P ("label.events.reminder_label", "reminder {time_text}");
   P ("label.events.rescheduled_label", "{name} rescheduled to {time_text}");
   P ("label.forms.character_count_label", "{used, plural, one {1 character} other {{used, number} characters}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {no character limit} one {1 character maximum} "
      & "other {{limit, number} characters maximum}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {1 character} other {{used, "
      & "number} characters}}} one {{used, number} of 1 character} other "
      & "{{used, number} of {limit, number} characters}}");
   P ("label.forms.field_label",
      "{required, select, false {{name} optional field} other {{name} "
      & "required field}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name} valid} invalid_input {{name} "
      & "invalid} required_input {{name} required} optional_input {{name} "
      & "optional} disabled_input {{name} disabled} other {{name} read-only}}");
   P ("label.forms.form_error_summary_label",
      "{warnings, plural, =0 {{errors, plural, =0 {no form issues} one {1 "
      & "error} other {{errors, number} errors}}} one {{errors, plural, =0 {1 "
      & "warning} one {1 error, 1 warning} other {{errors, number} errors, 1 "
      & "warning}}} other {{errors, plural, =0 {{warnings, number} warnings} "
      & "one {1 error, {warnings, number} warnings} other {{errors, number} "
      & "errors, {warnings, number} warnings}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {not started} editing_form {editing} "
      & "dirty_form {unsaved changes} saving_form {saving} saved_form {saved} "
      & "submitted_form {submitted} other {submission failed}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {valid input} invalid_input {invalid "
      & "input} required_input {required input} optional_input {optional input} "
      & "disabled_input {disabled input} other {read-only input}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {not started} editing_form {editing} "
      & "dirty_form {unsaved changes} saving_form {saving form} saved_form "
      & "{form saved} submitted_form {form submitted} other {{errors, plural, "
      & "=0 {submission failed} one {submission failed with 1 error} other "
      & "{submission failed with {errors, number} errors}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {no unsaved changes} one {1 unsaved change} other "
      & "{{count, number} unsaved changes}}");
   P ("label.markup.accessibility_issue_label",
      "{issue, select, missing_accessible_name {{target} missing accessible "
      & "name} low_contrast {{target} low contrast} skipped_heading_level "
      & "{{target} skipped heading level} missing_form_label {{target} missing "
      & "form label} invalid_aria {{target} invalid ARIA} keyboard_trap "
      & "{{target} keyboard trap} other {{target} unknown accessibility issue}}");
   P ("label.markup.accessibility_page_summary_label",
      "{landmarks, plural, one {{headings, plural, one {{issues, plural, one "
      & "{{title} accessibility summary: 1 landmark, 1 heading, 1 issue} other "
      & "{{title} accessibility summary: 1 landmark, 1 heading, {issues, "
      & "number} issues}}} other {{issues, plural, one {{title} accessibility "
      & "summary: 1 landmark, {headings, number} headings, 1 issue} other "
      & "{{title} accessibility summary: 1 landmark, {headings, number} "
      & "headings, {issues, number} issues}}}}} other {{headings, plural, one "
      & "{{issues, plural, one {{title} accessibility summary: {landmarks, "
      & "number} landmarks, 1 heading, 1 issue} other {{title} accessibility "
      & "summary: {landmarks, number} landmarks, 1 heading, {issues, number} "
      & "issues}}} other {{issues, plural, one {{title} accessibility summary: "
      & "{landmarks, number} landmarks, {headings, number} headings, 1 issue} "
      & "other {{title} accessibility summary: {landmarks, number} landmarks, "
      & "{headings, number} headings, {issues, number} issues}}}}}}");
end Labels_1;
