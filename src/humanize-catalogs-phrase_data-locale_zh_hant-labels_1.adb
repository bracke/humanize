separate (Humanize.Catalogs.Phrase_Data.Locale_Zh_Hant)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}：{state, select, active_account {使用中的帳戶} "
      & "invited_account {已邀請的帳戶} locked_account "
      & "{已鎖定的帳戶} suspended_account {已停權的帳戶} "
      & "deleted_account {已刪除的帳戶} other {帳戶狀態不明}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {使用中的帳戶} invited_account "
      & "{已邀請的帳戶} locked_account {已鎖定的帳戶} "
      & "suspended_account {已停權的帳戶} deleted_account "
      & "{已刪除的帳戶} other {帳戶狀態不明}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {信任的裝置} untrusted_device "
      & "{不信任的裝置} new_device {新裝置} other "
      & "{已封鎖的裝置}}");
   P ("label.accounts.last_active_label", "{name}：上次活動 {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}：登入失敗} other "
      & "{{name}：登入成功}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {已啟用 MFA} mfa_disabled {已停用 "
      & "MFA} mfa_required {需要 MFA} other {需要重設 MFA}}");
   P ("label.accounts.session_label",
      "{name}：{state, select, active_session {使用中的工作階段} "
      & "expired_session {工作階段已過期} revoked_session "
      & "{工作階段已撤銷} idle_session {閒置的工作階段} other "
      & "{工作階段狀態不明}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {使用中的工作階段} "
      & "expired_session {工作階段已過期} revoked_session "
      & "{工作階段已撤銷} idle_session {閒置的工作階段} other "
      & "{工作階段狀態不明}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {沒有附件} other {{count, number}個附件}}");
   P ("label.attachments.attachment_group_label", "{name}：{count, number}個附件");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {檔案附件} image_attachment "
      & "{圖片附件} video_attachment {影片附件} audio_attachment "
      & "{音訊附件} document_attachment {文件附件} archive_attachment "
      & "{壓縮檔附件} other {連結附件}}");
   P ("label.attachments.attachment_label",
      "{name}（{kind, select, file_attachment {檔案} image_attachment "
      & "{圖片} video_attachment {影片} audio_attachment {音訊} "
      & "document_attachment {文件} archive_attachment {壓縮檔} other "
      & "{連結}}）：{state, select, pending_attachment {待處理} "
      & "uploading_attachment {正在上傳} uploaded_attachment {已上傳} "
      & "failed_attachment {失敗} removed_attachment {已移除} other "
      & "{已封鎖}}");
   P ("label.attachments.attachment_size_label", "{name}，{size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {待處理的附件} "
      & "uploading_attachment {正在上傳的附件} uploaded_attachment "
      & "{已上傳的附件} failed_attachment {失敗的附件} "
      & "removed_attachment {已移除的附件} other {已封鎖的附件}}");
   P ("label.attachments.download_label", "下載{name}");
   P ("label.attachments.expiring_link_label", "{name}連結到期時間：{time_text}");
   P ("label.attachments.image_dimensions_label", "{name}，{dimensions}");
   P ("label.attachments.preview_label", "預覽{name}");
   P ("label.attachments.remove_label", "移除{name}");
   P ("label.attachments.scan_result_label",
      "{name}：{state, select, not_scanned {未掃描} scanning "
      & "{正在掃描} safe {掃描結果：安全} suspicious "
      & "{掃描結果：可疑} other {掃描結果：已感染}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {未掃描} scanning {正在掃描} safe "
      & "{掃描結果：安全} suspicious {掃描結果：可疑} other "
      & "{掃描結果：已感染}}");
   P ("label.attachments.upload_error_label", "{name}上傳失敗：{reason}");
   P ("label.badges.badge_label",
      "{name}：{tone, select, neutral_tone {中性} info_tone {資訊} "
      & "success_tone {成功} warning_tone {警告} danger_tone {危險} other "
      & "{淡化}}徽章{state, select, default_badge {} new_badge {，新} "
      & "updated_badge {，已更新} deprecated_badge {，已淘汰} "
      & "selected_badge {，已選取} disabled_badge {，已停用} other "
      & "{，可關閉}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {低優先順序徽章} "
      & "medium_priority {中優先順序徽章} high_priority "
      & "{高優先順序徽章} other {緊急優先順序徽章}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {預設徽章} new_badge "
      & "{「新」徽章} updated_badge {「已更新」徽章} "
      & "deprecated_badge {「已淘汰」徽章} selected_badge "
      & "{已選取的徽章} disabled_badge {已停用的徽章} other "
      & "{可關閉的徽章}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {中性徽章} info_tone {資訊徽章} "
      & "success_tone {成功徽章} warning_tone {警告徽章} danger_tone "
      & "{危險徽章} other {淡化徽章}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}方塊標籤} other "
      & "{{name}方塊標籤，已選取}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {沒有{name}} other {{count, number}個{name}}}");
   P ("label.badges.deprecated_label", "{name}：警告徽章，已淘汰");
   P ("label.badges.dismiss_label", "關閉{name}");
   P ("label.badges.new_label", "{name}：資訊徽章，新");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {沒有隱藏的徽章} other "
      & "{另有{hidden_count, number}個徽章}}");
   P ("label.badges.priority_badge_label",
      "{name}：{priority, select, low_priority {低優先順序徽章} "
      & "medium_priority {中優先順序徽章} high_priority "
      & "{高優先順序徽章} other {緊急優先順序徽章}}");
   P ("label.badges.status_badge_label",
      "{name}狀態：{tone, select, neutral_tone {中性} info_tone {資訊} "
      & "success_tone {成功} warning_tone {警告} danger_tone {危險} other "
      & "{淡化}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {沒有標籤} other {{count, number}個標籤}}");
   P ("label.badges.tag_label", "{name}標籤");
   P ("label.badges.updated_label", "{name}：成功徽章，已更新");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {成品已上傳} artifact_missing "
      & "{成品遺失} artifact_expired {成品已過期} other "
      & "{成品已驗證}}");
   P ("label.builds.benchmark_label", "{name}基準測試：{result_text}");
   P ("label.builds.build_label",
      "{name}：{state, select, build_queued {建置排隊中} build_running "
      & "{建置執行中} build_passed {建置成功} build_failed "
      & "{建置失敗} snapshot_build {快照建置} other {發行建置}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {建置排隊中} build_running "
      & "{建置執行中} build_passed {建置成功} build_failed "
      & "{建置失敗} snapshot_build {快照建置} other {發行建置}}");
   P ("label.builds.coverage_label", "涵蓋率：{percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {發行關卡已通過} gate_failed "
      & "{發行關卡未通過} gate_warning {發行關卡警告} other "
      & "{發行關卡已阻擋}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 "
      & "{沒有通過的測試} other {{count, number}個測試通過}}} "
      & "failed_test {{count, plural, =0 {沒有失敗的測試} other {{count, "
      & "number}個測試失敗}}} skipped_test {{count, plural, =0 "
      & "{沒有略過的測試} other {{count, number}個測試已略過}}} "
      & "flaky_test {{count, plural, =0 {沒有不穩定的測試} other "
      & "{{count, number}個不穩定的測試}}} other {{count, plural, =0 "
      & "{沒有預期失敗的測試} other {{count, "
      & "number}個測試預期失敗}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {通過} failed_test {失敗} skipped_test "
      & "{已略過} flaky_test {不穩定} other {預期失敗}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false "
      & "{{field_name}未變更，已停用} other "
      & "{{field_name}已從停用改為啟用}}} other {{new_value, select, "
      & "false {{field_name}已從啟用改為停用} other "
      & "{{field_name}未變更，已啟用}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {已新增} removed_change {已移除} "
      & "modified_change {已變更} renamed_change {已重新命名} "
      & "unchanged_change {未變更} metadata_change {中繼資料已變更} "
      & "moved_change {已移動} conflict_change {衝突} other "
      & "{不明的變更}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {資訊性變更} minor_change "
      & "{次要變更} major_change {重大變更} other {破壞性變更}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}未變更} other "
      & "{{unchanged, plural, =0 {{field_name}已變更：新增{added, "
      & "number}項} other {{field_name}已變更：新增{added, "
      & "number}項，{unchanged, number}項未變}}}}} other {{added, plural, "
      & "=0 {{unchanged, plural, =0 {{field_name}已變更：移除{removed, "
      & "number}項} other {{field_name}已變更：移除{removed, "
      & "number}項，{unchanged, number}項未變}}} other {{unchanged, "
      & "plural, =0 {{field_name}已變更：新增{added, "
      & "number}項，移除{removed, number}項} other "
      & "{{field_name}已變更：新增{added, number}項，移除{removed, "
      & "number}項，{unchanged, number}項未變}}}}}}");
   P ("label.changes.conflict_label", "{count, plural, =0 {沒有衝突} other {{count, number}個衝突}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false "
      & "{{field_name}已從{old_label}延後至{new_label}} other "
      & "{{field_name}已從{old_label}提前至{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}已從{old_label}變更為{new_label}");
   P ("label.changes.field_change_label", "{field_name}已從{old_value}變更為{new_value}");
   P ("label.changes.item_change_label",
      "{name}{kind, select, added_change {已新增} removed_change "
      & "{已移除} modified_change {已變更} renamed_change "
      & "{已重新命名} unchanged_change {未變更} metadata_change "
      & "{的中繼資料已變更} moved_change {已移動} conflict_change "
      & "{有衝突} other {發生不明的變更}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {僅中繼資料已變更} other {僅{count, "
      & "number}個中繼資料欄位已變更}}");
   P ("label.changes.move_label", "{name}已從{from}移至{to}");
   P ("label.changes.no_changes_label", "沒有變更");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {沒有行變更} "
      & "other {新增{lines_added, number}行}}} other {{lines_added, plural, "
      & "=0 {刪除{lines_removed, number}行} other {新增{lines_added, "
      & "number}行，刪除{lines_removed, number}行}}}}");
   P ("label.changes.rename_label", "已從{old_name}重新命名為{new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author}草擬了留言} "
      & "published_comment {{author}發表了留言} edited_comment "
      & "{{author}編輯了留言} deleted_comment {{author}刪除了留言} "
      & "resolved_comment {{author}解決了留言} unresolved_comment "
      & "{{author}重新開啟了留言} pinned_comment "
      & "{{author}釘選了留言} other {{author}隱藏了留言}}");
   P ("label.comments.comment_count_label", "{count, plural, =0 {沒有留言} other {{count, number}則留言}}");
   P ("label.comments.comment_label",
      "{author}的{state, select, draft_comment {留言草稿} "
      & "published_comment {已發表留言} edited_comment {已編輯留言} "
      & "deleted_comment {已刪除留言} resolved_comment {已解決留言} "
      & "unresolved_comment {未解決留言} pinned_comment {釘選留言} "
      & "other {已隱藏留言}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {留言草稿} published_comment "
      & "{已發表留言} edited_comment {已編輯留言} deleted_comment "
      & "{已刪除留言} resolved_comment {已解決留言} "
      & "unresolved_comment {未解決留言} pinned_comment {釘選留言} "
      & "other {已隱藏留言}}");
   P ("label.comments.deleted_label", "{author}刪除了留言");
   P ("label.comments.edited_label", "編輯於{time_text}");
   P ("label.comments.hide_comment_label", "隱藏留言：{reason}");
   P ("label.comments.lock_thread_label", "鎖定{name}討論串");
   P ("label.comments.mention_label", "{actor}提及了{target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {沒有參與者} other {{count, "
      & "number}位參與者}}");
   P ("label.comments.pin_label", "釘選{name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {讚} dislike_reaction {倒讚} "
      & "heart_reaction {愛心} laugh_reaction {大笑} confused_reaction "
      & "{困惑} hooray_reaction {歡呼} rocket_reaction {火箭} other "
      & "{眼睛}}回應");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {讚} dislike_reaction {倒讚} "
      & "heart_reaction {愛心} laugh_reaction {大笑} confused_reaction "
      & "{困惑} hooray_reaction {歡呼} rocket_reaction {火箭} other "
      & "{眼睛}}回應{count, plural, =0 {：無} other {：{count, "
      & "number}個}}");
   P ("label.comments.reply_count_label", "{count, plural, =0 {沒有回覆} other {{count, number}則回覆}}");
   P ("label.comments.resolved_label", "{name}已解決");
   P ("label.comments.subscribe_label", "訂閱{name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {沒有討論串} other {{count, "
      & "number}個討論串}}");
   P ("label.comments.thread_label",
      "{name}：{state, select, open_thread {開放的討論串} "
      & "resolved_thread {已解決的討論串} locked_thread "
      & "{已鎖定的討論串} other {已封存的討論串}}{count, plural, "
      & "=0 {} other {，{count, number}則留言}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {開放的討論串} resolved_thread "
      & "{已解決的討論串} locked_thread {已鎖定的討論串} other "
      & "{已封存的討論串}}");
   P ("label.comments.unpin_label", "取消釘選{name}");
   P ("label.comments.unsubscribe_label", "取消訂閱{name}");
   P ("label.comparisons.baseline_label",
      "{name}：{result, select, improved {已改善} regressed {已退步} "
      & "unchanged {未變化} within_tolerance {在容許範圍內} "
      & "outside_tolerance {超出容許範圍} new_value {新增} "
      & "removed_value {已移除} other {無可用基準}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {已改善} regressed {已退步} unchanged "
      & "{未變化} within_tolerance {在容許範圍內} outside_tolerance "
      & "{超出容許範圍} new_value {新增} removed_value {已移除} "
      & "other {無可用基準}}");
   P ("label.comparisons.difference_label",
      "{name}：{result, select, improved {改善了{difference_text}} "
      & "regressed {退步了{difference_text}} unchanged "
      & "{未變化（差異{difference_text}）} within_tolerance "
      & "{在容許範圍內（差異{difference_text}）} outside_tolerance "
      & "{超出容許範圍（差異{difference_text}）} new_value "
      & "{新增（差異{difference_text}）} removed_value "
      & "{已移除（差異{difference_text}）} other "
      & "{無可用基準（差異{difference_text}）}}");
   P ("label.comparisons.tolerance_label",
      "{name}：{result, select, improved {改善了{difference_text}} "
      & "regressed {退步了{difference_text}} unchanged "
      & "{未變化（差異{difference_text}）} within_tolerance "
      & "{在容許範圍內（差異{difference_text}）} outside_tolerance "
      & "{超出容許範圍（差異{difference_text}）} new_value "
      & "{新增（差異{difference_text}）} removed_value "
      & "{已移除（差異{difference_text}）} other "
      & "{無可用基準（差異{difference_text}）}}，容許誤差{tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {無效的資料列} duplicate_record "
      & "{重複的記錄} missing_column {缺少欄} unknown_field "
      & "{不明的欄位} schema_mismatch {結構描述不符} other "
      & "{已略過的記錄}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {試執行通過} dry_run_failed "
      & "{試執行失敗} import_valid {匯入有效} import_invalid "
      & "{匯入無效} other {部分匯入}}");
   P ("label.data_quality.import_result_label",
      "{name}：{state, select, dry_run_passed {試執行通過} "
      & "dry_run_failed {試執行失敗} import_valid {匯入有效} "
      & "import_invalid {匯入無效} other {部分匯入}}，接受{accepted, "
      & "number}筆，拒絕{rejected, number}筆");
   P ("label.data_quality.issue_count_label",
      "{count, plural, =0 {沒有{issue, select, invalid_row "
      & "{無效的資料列} duplicate_record {重複的記錄} missing_column "
      & "{缺少的欄} unknown_field {不明的欄位} schema_mismatch "
      & "{結構描述不符} other {已略過的記錄}}} other {{count, "
      & "number}個{issue, select, invalid_row {無效的資料列} "
      & "duplicate_record {重複的記錄} missing_column {缺少的欄} "
      & "unknown_field {不明的欄位} schema_mismatch {結構描述不符} "
      & "other {已略過的記錄}}}}");
   P ("label.data_quality.row_issue_label",
      "第{row, number}列：{issue, select, invalid_row {無效的資料列} "
      & "duplicate_record {重複的記錄} missing_column {缺少欄} "
      & "unknown_field {不明的欄位} schema_mismatch {結構描述不符} "
      & "other {已略過的記錄}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}：{issue, select, invalid_row {無效的資料列} "
      & "duplicate_record {重複的記錄} missing_column {缺少欄} "
      & "unknown_field {不明的欄位} schema_mismatch {結構描述不符} "
      & "other {已略過的記錄}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {成品已就緒} artifact_uploaded "
      & "{成品已上傳} artifact_signed {成品已簽署} artifact_missing "
      & "{成品遺失} other {成品已過期}}");
   P ("label.deployments.deployment_label",
      "{name}部署至{environment}：{state, select, queued_deployment "
      & "{已排入佇列} deploying {部署中} deployed {已完成} "
      & "failed_deployment {失敗} rolled_back {已回復} blocked_deployment "
      & "{受阻} other {已取消}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {部署已排入佇列} deploying "
      & "{部署中} deployed {已部署} failed_deployment {部署失敗} "
      & "rolled_back {已回復} blocked_deployment {部署受阻} other "
      & "{部署已取消}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {環境正常} "
      & "drifting_environment {環境漂移} locked_environment "
      & "{環境已鎖定} maintenance_environment {環境維護中} other "
      & "{環境狀態不明}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {無移轉} migration_pending "
      & "{移轉待處理} migrating {移轉中} migration_complete "
      & "{移轉完成} other {移轉失敗}}");
   P ("label.deployments.promotion_label", "{name}已從{from_environment}升級至{to_environment}");
   P ("label.deployments.rollback_label", "{name}回復至{target}");
   P ("label.deployments.rollout_label", "{name}推出進度{percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {沒有受影響的項目} other {{count, "
      & "number}個受影響的項目}}");
   P ("label.diagnostics.check_duration_label",
      "{name}：{status, select, passed_check {已通過} failed_check "
      & "{失敗} warning_check {有警告} skipped_check {已略過} "
      & "pending_check {待處理} other {執行中}}（{duration_s, "
      & "number}秒）");
   P ("label.diagnostics.check_result_label",
      "{name}：{status, select, passed_check {已通過} failed_check "
      & "{失敗} warning_check {有警告} skipped_check {已略過} "
      & "pending_check {待處理} other {執行中}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {已通過} failed_check {失敗} "
      & "warning_check {有警告} skipped_check {已略過} pending_check "
      & "{待處理} other {執行中}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{subject}{position, plural, =0 {} other {（位置{position, "
      & "number}）}}：{kind, select, expected_value {需要值} expected_unit "
      & "{需要單位} invalid_range {範圍無效} end_before_start "
      & "{範圍結束早於開始} unknown_field {不明欄位} "
      & "unsafe_redacted_value {不安全的值已遮蔽} unsupported_syntax "
      & "{不支援的語法} other {診斷說明}}；請使用{suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {資訊} notice_severity {提示} "
      & "warning_severity {警告} error_severity {錯誤} critical_severity "
      & "{嚴重} other {封鎖}}：{path}{line, plural, =0 {} other {第{line, "
      & "number}行}}：{message}");
   P ("label.diagnostics.failed_at_label",
      "在{line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}第{line, number}行} other {{path}第{line, "
      & "number}行第{column, number}欄}}}}失敗");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {資訊} notice_severity {提示} "
      & "warning_severity {警告} error_severity {錯誤} critical_severity "
      & "{嚴重} other {封鎖}}（{field_name}）：{message}");
   P ("label.diagnostics.first_failure_label",
      "{check_name}首次失敗：{path}{line, plural, =0 {} other {第{line, "
      & "number}行}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{沒有問題} other {{notices, number}個提示}}} other {{notices, "
      & "plural, =0 {{warnings, number}個警告} other {{warnings, "
      & "number}個警告，{notices, number}個提示}}}}} other {{warnings, "
      & "plural, =0 {{notices, plural, =0 {{errors, number}個錯誤} other "
      & "{{errors, number}個錯誤，{notices, number}個提示}}} other "
      & "{{notices, plural, =0 {{errors, number}個錯誤，{warnings, "
      & "number}個警告} other {{errors, number}個錯誤，{warnings, "
      & "number}個警告，{notices, number}個提示}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}第{line, "
      & "number}行} other {{path}第{line, number}行第{column, "
      & "number}欄}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {位元組剖析器} duration_parser "
      & "{持續時間剖析器} date_time_parser {日期時間剖析器} "
      & "color_parser {色彩剖析器} url_parser {URL剖析器} unit_parser "
      & "{單位剖析器} recurrence_parser {週期規則剖析器} "
      & "domain_label_parser {網域標籤剖析器} other "
      & "{剖析器}}不支援的語法：{error}{position, plural, =0 {} other "
      & "{（位置{position, number}）}}；請使用{family, select, "
      & "byte_parser {B、kB、MB、GB、KiB、MiB、GiB或TiB} duration_parser "
      & "{ms、s、min、h、d、w、month或year} date_time_parser "
      & "{ISO日期、自然日期或時鐘時間} color_parser "
      & "{十六進位、rgb()、hsl()、lab()、lch()或色彩名稱} "
      & "url_parser {配置、主機、路徑、查詢或片段} unit_parser "
      & "{支援的Humanize單位標籤} recurrence_parser "
      & "{cron或every/工作日週期格式} domain_label_parser "
      & "{確定性的Humanize網域標籤} other {支援的輸入格式}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {已通過} failed_check {失敗} "
      & "warning_check {有警告} skipped_check {已略過} pending_check "
      & "{待處理} other {執行中}}，{notices, plural, =0 {沒有提示} "
      & "other {{notices, number}個提示}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {第1次重試，共1次} "
      & "other {第{attempt, number}次重試，已超出上限1次}}} other "
      & "{第{attempt, number}次重試，共{limit, number}次}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {資訊} notice_severity {提示} "
      & "warning_severity {警告} error_severity {錯誤} critical_severity "
      & "{嚴重} other {封鎖}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {建置診斷} test_source "
      & "{測試診斷} lint_source {Lint診斷} import_source {匯入診斷} "
      & "validation_source {驗證診斷} runtime_source {執行階段診斷} "
      & "security_source {安全性診斷} other {診斷}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number}則{source, select, build_source {建置診斷} "
      & "test_source {測試診斷} lint_source {Lint診斷} import_source "
      & "{匯入診斷} validation_source {驗證診斷} runtime_source "
      & "{執行階段診斷} security_source {安全性診斷} other {診斷}}");
   P ("label.diagnostics.suggested_action_label", "下一步：{action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {網域主機} ipv4_host {IPv4位址} "
      & "ipv6_host {IPv6位址} localhost_host {本機} private_network_host "
      & "{私人網路位址} other {不明主機}}");
   P ("label.events.all_day_label", "{name}（全天）");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {未回覆} accepted {已接受} "
      & "declined {已拒絕} maybe {未定} other {候補}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {沒有參與者} other {{count, "
      & "number}位參與者}}");
   P ("label.events.canceled_label", "{name}已取消");
   P ("label.events.check_in_label", "報到{name}");
   P ("label.events.conference_link_label", "{name}會議連結");
   P ("label.events.event_count_label", "{count, plural, =0 {沒有活動} other {{count, number}個活動}}");
   P ("label.events.event_label",
      "{name}：{state, select, scheduled_event {已排定} tentative_event "
      & "{暫定} in_progress_event {進行中} completed_event {已完成} "
      & "canceled_event {已取消} other {已延期}}");
   P ("label.events.event_location_label", "{name}，地點：{location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {已排定的活動} tentative_event "
      & "{暫定的活動} in_progress_event {進行中的活動} "
      & "completed_event {已完成的活動} canceled_event "
      & "{已取消的活動} other {已延期的活動}}");
   P ("label.events.event_time_label", "{name}，時間：{time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {公開活動} private_event "
      & "{私人活動} busy_event {忙碌} other {有空}}");
   P ("label.events.organizer_label", "主辦人：{name}");
   P ("label.events.rsvp_label",
      "回覆：{state, select, not_responded {未回覆} accepted "
      & "{已接受} declined {已拒絕} maybe {未定} other {候補}}");
   P ("label.events.reminder_label", "提醒：{time_text}");
   P ("label.events.rescheduled_label", "{name}已改期至{time_text}");
   P ("label.forms.character_count_label", "{used, number}個字元");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {無字元限制} other {最多{limit, "
      & "number}個字元}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number}個字元} other {{used, "
      & "number}/{limit, number}個字元}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}（選填）} other "
      & "{{name}（必填）}}");
   P ("label.forms.field_state_label",
      "{name}：{state, select, valid_input {有效} invalid_input {無效} "
      & "required_input {必填} optional_input {選填} disabled_input "
      & "{已停用} other {唯讀}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {表單沒有問題} other "
      & "{{warnings, number}個警告}}} other {{warnings, plural, =0 {{errors, "
      & "number}個錯誤} other {{errors, number}個錯誤，{warnings, "
      & "number}個警告}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {未開始} editing_form {編輯中} "
      & "dirty_form {有未儲存的變更} saving_form {儲存中} saved_form "
      & "{已儲存} submitted_form {已送出} other {送出失敗}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {輸入有效} invalid_input "
      & "{輸入無效} required_input {必填輸入} optional_input "
      & "{選填輸入} disabled_input {輸入已停用} other {唯讀輸入}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {未開始} editing_form {編輯中} "
      & "dirty_form {有未儲存的變更} saving_form {正在儲存表單} "
      & "saved_form {表單已儲存} submitted_form {表單已送出} other "
      & "{{errors, plural, =0 {送出失敗} other {送出失敗，{errors, "
      & "number}個錯誤}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {沒有未儲存的變更} other {{count, "
      & "number}項未儲存的變更}}");
   P ("label.markup.accessibility_issue_label",
      "{target}：{issue, select, missing_accessible_name "
      & "{缺少無障礙名稱} low_contrast {對比度過低} "
      & "skipped_heading_level {略過了標題層級} missing_form_label "
      & "{缺少表單標籤} invalid_aria {ARIA無效} keyboard_trap "
      & "{鍵盤陷阱} other {不明的無障礙問題}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}無障礙摘要：{landmarks, number}個地標，{headings, "
      & "number}個標題，{issues, number}個問題");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {新增無障礙名稱} "
      & "low_contrast {提高文字對比度} skipped_heading_level "
      & "{依序使用標題層級} missing_form_label "
      & "{為表單控制項關聯標籤} invalid_aria "
      & "{使用有效的ARIA角色或屬性} keyboard_trap "
      & "{確保鍵盤焦點可以離開該元件} other "
      & "{檢查無障礙問題}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target}沒有無障礙問題} other "
      & "{{target}有{issues, number}個無障礙問題}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id屬性} class_attribute {class屬性} "
      & "data_attribute {data屬性} aria_attribute {ARIA屬性} role_attribute "
      & "{role屬性} link_attribute {連結屬性} media_attribute "
      & "{媒體屬性} form_attribute {表單屬性} boolean_attribute "
      & "{布林屬性} event_attribute {事件處理常式屬性} other "
      & "{不明屬性}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 "
      & "{{form_name}沒有表單問題} other {{form_name}：{warnings, "
      & "number}個警告}}} other {{warnings, plural, =0 "
      & "{{form_name}：{errors, number}個錯誤} other "
      & "{{form_name}：{errors, number}個錯誤，{warnings, "
      & "number}個警告}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {橫幅地標} navigation_role "
      & "{導覽地標} main_role {主要地標} complementary_role "
      & "{補充地標} contentinfo_role {內容資訊地標} search_role "
      & "{搜尋地標} form_role {表單地標} region_role {區域地標} "
      & "dialog_role {對話方塊} alert_role {警示即時區域} status_role "
      & "{狀態即時區域} other {不明地標}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}立即更新：{update}} other "
      & "{{region}一般更新：{update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {文字內容} html_content {HTML內容} "
      & "json_content {JSON內容} xml_content {XML內容} image_content "
      & "{影像內容} audio_content {音訊內容} video_content "
      & "{影片內容} font_content {字型內容} archive_content "
      & "{封存內容} binary_content {二進位內容} form_content "
      & "{表單內容} other {不明內容}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {文件標籤} metadata_tag "
      & "{中繼資料標籤} section_tag {區段標籤} text_tag "
      & "{文字標籤} link_tag {連結標籤} media_tag {媒體標籤} "
      & "form_tag {表單標籤} table_tag {表格標籤} interactive_tag "
      & "{互動標籤} scripting_tag {指令碼標籤} other {不明標籤}}");
   P ("label.media.duration_label", "時長：{duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {影像} video_media {影片} audio_media "
      & "{音訊} pdf_document {PDF文件} text_document {文字文件} "
      & "archive_media {封存檔} other {媒體}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {就緒} processing_media {處理中} "
      & "transcoding_media {轉碼中} thumbnail_missing {縮圖無法使用} "
      & "metadata_missing {缺少中繼資料} locked_document "
      & "{文件已鎖定} other {無法使用}}");
   P ("label.media.media_summary",
      "{name}（{kind, select, image_media {影像} video_media {影片} "
      & "audio_media {音訊} pdf_document {PDF文件} text_document "
      & "{文字文件} archive_media {封存檔} other {媒體}}）：{state, "
      & "select, ready_media {就緒} processing_media {處理中} "
      & "transcoding_media {轉碼中} thumbnail_missing {縮圖無法使用} "
      & "metadata_missing {缺少中繼資料} locked_document "
      & "{文件已鎖定} other {無法使用}}");
   P ("label.media.page_count_label", "{pages, plural, =0 {沒有頁面} other {{pages, number}頁}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}申訴：{state, select, open_report {未處理} triaged_report "
      & "{已分類} actioned_report {已處理} dismissed_report {已駁回} "
      & "appealed_report {已申訴} other {已關閉}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {無審核動作} flagged {已標記} "
      & "hidden {已由版主隱藏} restored {已還原} marked_spam "
      & "{已標記為垃圾內容} removed {已移除} other {已提報}}");
   P ("label.moderation.moderation_label",
      "{item}：{action, select, no_action {無審核動作} flagged "
      & "{已標記} hidden {已由版主隱藏} restored {已還原} "
      & "marked_spam {已標記為垃圾內容} removed {已移除} other "
      & "{已提報}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {審核佇列是空的} "
      & "other {{pending, number}項待審核}}} other {{pending, "
      & "number}項待審核，{escalated, number}項已提報}}");
   P ("label.moderation.report_label",
      "{item}檢舉：{state, select, open_report {未處理} triaged_report "
      & "{已分類} actioned_report {已處理} dismissed_report {已駁回} "
      & "appealed_report {已申訴} other {已關閉}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {未處理的檢舉} triaged_report "
      & "{已分類的檢舉} actioned_report {已處理} dismissed_report "
      & "{已駁回的檢舉} appealed_report {已申訴的檢舉} other "
      & "{已關閉的檢舉}}");
   P ("label.moderation.review_label",
      "{item}：{state, select, pending_review {待審核} approved "
      & "{已核准} rejected {已拒絕} needs_changes {需要修改} other "
      & "{已提報}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {待審核} approved {已核准} "
      & "rejected {已拒絕} needs_changes {需要修改} other {已提報}}");
   P ("label.navigation.back_label", "返回{target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {沒有導覽路徑} other {{depth, "
      & "number}層導覽路徑}}");
   P ("label.navigation.current_page_label", "目前頁面：{name}");
   P ("label.navigation.external_link_label", "{name}（外部連結）");
   P ("label.navigation.first_label", "第一個：{target}");
   P ("label.navigation.last_label", "最後一個：{target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {沒有選單項目} other {{count, "
      & "number}個選單項目}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {連結} menu_item {選單項目} tab_item "
      & "{分頁} breadcrumb_item {導覽路徑} section_item {區段} other "
      & "{分隔線}}");
   P ("label.navigation.navigation_item_label",
      "{name}{kind, select, link_item {連結} menu_item {選單項目} "
      & "tab_item {分頁} breadcrumb_item {導覽路徑} section_item {區段} "
      & "other {分隔線}}：{state, select, current_item {目前} active_item "
      & "{作用中} inactive_item {非作用中} disabled_item {已停用} "
      & "expanded_item {已展開} collapsed_item {已摺疊} visited_item "
      & "{已造訪} other {外部}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {目前} active_item {作用中} "
      & "inactive_item {非作用中} disabled_item {已停用} expanded_item "
      & "{已展開} collapsed_item {已摺疊} visited_item {已造訪} other "
      & "{外部}}");
   P ("label.navigation.next_label", "下一個：{target}");
   P ("label.navigation.section_state_label",
      "{name}區段{expanded, select, false {已摺疊} other "
      & "{已展開}}{count, plural, =0 {} other {，{count, number}個項目}}");
   P ("label.navigation.skip_link_label", "跳至{target}");
   P ("label.navigation.submenu_label", "{name}子選單，{count, number}個項目");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {所有警示} important_alerts "
      & "{重要警示} critical_alerts_only {僅限嚴重警示} other "
      & "{不接收警示}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}通知：{state, select, preference_enabled {已啟用} "
      & "preference_disabled {已停用} preference_inherited {已繼承} other "
      & "{必要}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {不寄送摘要} instant_digest "
      & "{即時摘要} daily_digest {每日摘要} other {每週摘要}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {已啟用} preference_disabled "
      & "{已停用} preference_inherited {已繼承} other {必要}}");
   P ("label.notification_preferences.quiet_hours_label", "勿擾時段：{time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}{scope, select, thread_subscription {討論串} "
      & "project_subscription {專案} team_subscription {團隊} other "
      & "{帳戶}}訂閱：{state, select, preference_enabled {已啟用} "
      & "preference_disabled {已停用} preference_inherited {已繼承} other "
      & "{必要}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {討論串訂閱} "
      & "project_subscription {專案訂閱} team_subscription {團隊訂閱} "
      & "other {帳戶訂閱}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor}提及了你} reply_event "
      & "{{actor}已回覆} assignment_event {{actor}指派了工作給你} "
      & "approval_event {{actor}要求核准} alert_event "
      & "{{actor}傳送了警示} digest_event {{actor}傳送了摘要} "
      & "reminder_event {{actor}傳送了提醒} other "
      & "{{actor}傳送了系統通知}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {應用程式內通知} email_channel "
      & "{電子郵件通知} sms_channel {簡訊通知} push_channel "
      & "{推播通知} webhook_channel {Webhook 通知} other "
      & "{摘要通知}}：{state, select, pending_delivery {待傳送} "
      & "sent_delivery {已傳送} delivered_delivery {已送達} "
      & "failed_delivery {失敗} retrying_delivery {重試中} other "
      & "{已取消}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {待傳送的通知} sent_delivery "
      & "{已傳送的通知} delivered_delivery {已送達的通知} "
      & "failed_delivery {傳送失敗的通知} retrying_delivery "
      & "{正在重試的通知} other {已取消的通知}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {待傳送} sent_delivery {已傳送} "
      & "delivered_delivery {已送達} failed_delivery {失敗} "
      & "retrying_delivery {重試中} other {已取消}}：{time_text}");
   P ("label.notifications.digest_label",
      "{name}摘要：{count, plural, =0 {沒有通知} other {{count, "
      & "number}則通知}}");
end Labels_1;
