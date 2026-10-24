separate (Humanize.Catalogs.Phrase_Data.Locale_Zh)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{name}：{state, select, active_account {活跃账户} invited_account "
      & "{已邀请账户} locked_account {已锁定账户} suspended_account "
      & "{已停用账户} deleted_account {已删除账户} other "
      & "{账户状态未知}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {活跃账户} invited_account "
      & "{已邀请账户} locked_account {已锁定账户} suspended_account "
      & "{已停用账户} deleted_account {已删除账户} other "
      & "{账户状态未知}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {受信任的设备} untrusted_device "
      & "{不受信任的设备} new_device {新设备} other "
      & "{已屏蔽的设备}}");
   P ("label.accounts.last_active_label", "{name}：上次活跃于{time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}：登录失败} other "
      & "{{name}：登录成功}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {已启用 MFA} mfa_disabled {已禁用 "
      & "MFA} mfa_required {需要 MFA} other {需要重置 MFA}}");
   P ("label.accounts.session_label",
      "{name}：{state, select, active_session {活跃会话} expired_session "
      & "{会话已过期} revoked_session {会话已撤销} idle_session "
      & "{空闲会话} other {会话状态未知}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {活跃会话} expired_session "
      & "{会话已过期} revoked_session {会话已撤销} idle_session "
      & "{空闲会话} other {会话状态未知}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {没有附件} other {{count, number}个附件}}");
   P ("label.attachments.attachment_group_label", "{name}：{count, number}个附件");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {文件附件} image_attachment "
      & "{图像附件} video_attachment {视频附件} audio_attachment "
      & "{音频附件} document_attachment {文档附件} archive_attachment "
      & "{归档附件} other {链接附件}}");
   P ("label.attachments.attachment_label",
      "{name}（{kind, select, file_attachment {文件} image_attachment "
      & "{图像} video_attachment {视频} audio_attachment {音频} "
      & "document_attachment {文档} archive_attachment {归档} other "
      & "{链接}}）：{state, select, pending_attachment {待处理} "
      & "uploading_attachment {正在上传} uploaded_attachment {已上传} "
      & "failed_attachment {上传失败} removed_attachment {已移除} other "
      & "{已拦截}}");
   P ("label.attachments.attachment_size_label", "{name}，{size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {待处理的附件} "
      & "uploading_attachment {正在上传的附件} uploaded_attachment "
      & "{已上传的附件} failed_attachment {失败的附件} "
      & "removed_attachment {已移除的附件} other {已拦截的附件}}");
   P ("label.attachments.download_label", "下载{name}");
   P ("label.attachments.expiring_link_label", "{name}链接过期时间：{time_text}");
   P ("label.attachments.image_dimensions_label", "{name}，{dimensions}");
   P ("label.attachments.preview_label", "预览{name}");
   P ("label.attachments.remove_label", "移除{name}");
   P ("label.attachments.scan_result_label",
      "{name}：{state, select, not_scanned {未扫描} scanning "
      & "{正在扫描} safe {扫描结果：安全} suspicious "
      & "{扫描结果：可疑} other {扫描结果：已感染}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {未扫描} scanning {正在扫描} safe "
      & "{扫描结果：安全} suspicious {扫描结果：可疑} other "
      & "{扫描结果：已感染}}");
   P ("label.attachments.upload_error_label", "{name}上传失败：{reason}");
   P ("label.badges.badge_label",
      "{name}：{tone, select, neutral_tone {中性} info_tone {信息} "
      & "success_tone {成功} warning_tone {警告} danger_tone {危险} other "
      & "{弱化}}徽章{state, select, default_badge {} new_badge {，新} "
      & "updated_badge {，已更新} deprecated_badge {，已弃用} "
      & "selected_badge {，已选中} disabled_badge {，已禁用} other "
      & "{，可关闭}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {低优先级徽章} medium_priority "
      & "{中优先级徽章} high_priority {高优先级徽章} other "
      & "{紧急优先级徽章}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {默认徽章} new_badge "
      & "{“新”徽章} updated_badge {“已更新”徽章} "
      & "deprecated_badge {“已弃用”徽章} selected_badge "
      & "{已选中的徽章} disabled_badge {已禁用的徽章} other "
      & "{可关闭的徽章}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {中性徽章} info_tone {信息徽章} "
      & "success_tone {成功徽章} warning_tone {警告徽章} danger_tone "
      & "{危险徽章} other {弱化徽章}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}标签块} other "
      & "{{name}标签块，已选中}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {没有{name}} other {{count, number}个{name}}}");
   P ("label.badges.deprecated_label", "{name}：警告徽章，已弃用");
   P ("label.badges.dismiss_label", "关闭{name}");
   P ("label.badges.new_label", "{name}：信息徽章，新");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {没有隐藏的徽章} other "
      & "{另有{hidden_count, number}个徽章}}");
   P ("label.badges.priority_badge_label",
      "{name}：{priority, select, low_priority {低优先级徽章} "
      & "medium_priority {中优先级徽章} high_priority "
      & "{高优先级徽章} other {紧急优先级徽章}}");
   P ("label.badges.status_badge_label",
      "{name}状态：{tone, select, neutral_tone {中性} info_tone {信息} "
      & "success_tone {成功} warning_tone {警告} danger_tone {危险} other "
      & "{弱化}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {没有标签} other {{count, number}个标签}}");
   P ("label.badges.tag_label", "{name}标签");
   P ("label.badges.updated_label", "{name}：成功徽章，已更新");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {制品已上传} artifact_missing "
      & "{制品缺失} artifact_expired {制品已过期} other "
      & "{制品已验证}}");
   P ("label.builds.benchmark_label", "{name}基准测试：{result_text}");
   P ("label.builds.build_label",
      "{name}：{state, select, build_queued {构建排队中} build_running "
      & "{构建运行中} build_passed {构建成功} build_failed "
      & "{构建失败} snapshot_build {快照构建} other {发布构建}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {构建排队中} build_running "
      & "{构建运行中} build_passed {构建成功} build_failed "
      & "{构建失败} snapshot_build {快照构建} other {发布构建}}");
   P ("label.builds.coverage_label", "覆盖率：{percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {发布门禁已通过} gate_failed "
      & "{发布门禁未通过} gate_warning {发布门禁警告} other "
      & "{发布门禁已阻止}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 "
      & "{没有通过的测试} other {{count, number}个测试通过}}} "
      & "failed_test {{count, plural, =0 {没有失败的测试} other {{count, "
      & "number}个测试失败}}} skipped_test {{count, plural, =0 "
      & "{没有跳过的测试} other {{count, number}个测试已跳过}}} "
      & "flaky_test {{count, plural, =0 {没有不稳定的测试} other "
      & "{{count, number}个不稳定的测试}}} other {{count, plural, =0 "
      & "{没有预期失败的测试} other {{count, "
      & "number}个测试预期失败}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {通过} failed_test {失败} skipped_test "
      & "{已跳过} flaky_test {不稳定} other {预期失败}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false "
      & "{{field_name}未更改，已禁用} other "
      & "{{field_name}已从禁用改为启用}}} other {{new_value, select, "
      & "false {{field_name}已从启用改为禁用} other "
      & "{{field_name}未更改，已启用}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {已添加} removed_change {已移除} "
      & "modified_change {已更改} renamed_change {已重命名} "
      & "unchanged_change {未更改} metadata_change {元数据已更改} "
      & "moved_change {已移动} conflict_change {冲突} other "
      & "{未知更改}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {信息性更改} minor_change "
      & "{次要更改} major_change {重大更改} other {破坏性更改}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}未更改} other "
      & "{{unchanged, plural, =0 {{field_name}已更改：添加{added, "
      & "number}项} other {{field_name}已更改：添加{added, "
      & "number}项，{unchanged, number}项未变}}}}} other {{added, plural, "
      & "=0 {{unchanged, plural, =0 {{field_name}已更改：移除{removed, "
      & "number}项} other {{field_name}已更改：移除{removed, "
      & "number}项，{unchanged, number}项未变}}} other {{unchanged, "
      & "plural, =0 {{field_name}已更改：添加{added, "
      & "number}项，移除{removed, number}项} other "
      & "{{field_name}已更改：添加{added, number}项，移除{removed, "
      & "number}项，{unchanged, number}项未变}}}}}}");
   P ("label.changes.conflict_label", "{count, plural, =0 {没有冲突} other {{count, number}个冲突}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false "
      & "{{field_name}已从{old_label}推迟到{new_label}} other "
      & "{{field_name}已从{old_label}提前到{new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name}已从{old_label}更改为{new_label}");
   P ("label.changes.field_change_label", "{field_name}已从{old_value}更改为{new_value}");
   P ("label.changes.item_change_label",
      "{name}{kind, select, added_change {已添加} removed_change "
      & "{已移除} modified_change {已更改} renamed_change {已重命名} "
      & "unchanged_change {未更改} metadata_change {的元数据已更改} "
      & "moved_change {已移动} conflict_change {存在冲突} other "
      & "{发生未知更改}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {仅元数据已更改} other {仅{count, "
      & "number}个元数据字段已更改}}");
   P ("label.changes.move_label", "{name}已从{from}移至{to}");
   P ("label.changes.no_changes_label", "没有更改");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {没有行更改} "
      & "other {添加{lines_added, number}行}}} other {{lines_added, plural, "
      & "=0 {删除{lines_removed, number}行} other {添加{lines_added, "
      & "number}行，删除{lines_removed, number}行}}}}");
   P ("label.changes.rename_label", "已从{old_name}重命名为{new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author}起草了评论} "
      & "published_comment {{author}发表了评论} edited_comment "
      & "{{author}编辑了评论} deleted_comment {{author}删除了评论} "
      & "resolved_comment {{author}解决了评论} unresolved_comment "
      & "{{author}重新打开了评论} pinned_comment "
      & "{{author}置顶了评论} other {{author}隐藏了评论}}");
   P ("label.comments.comment_count_label", "{count, plural, =0 {没有评论} other {{count, number}条评论}}");
   P ("label.comments.comment_label",
      "{author}的{state, select, draft_comment {评论草稿} "
      & "published_comment {已发布评论} edited_comment {已编辑评论} "
      & "deleted_comment {已删除评论} resolved_comment {已解决评论} "
      & "unresolved_comment {未解决评论} pinned_comment {置顶评论} "
      & "other {已隐藏评论}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {评论草稿} published_comment "
      & "{已发布评论} edited_comment {已编辑评论} deleted_comment "
      & "{已删除评论} resolved_comment {已解决评论} "
      & "unresolved_comment {未解决评论} pinned_comment {置顶评论} "
      & "other {已隐藏评论}}");
   P ("label.comments.deleted_label", "{author}删除了评论");
   P ("label.comments.edited_label", "编辑于{time_text}");
   P ("label.comments.hide_comment_label", "隐藏评论：{reason}");
   P ("label.comments.lock_thread_label", "锁定{name}话题");
   P ("label.comments.mention_label", "{actor}提到了{target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {没有参与者} other {{count, "
      & "number}位参与者}}");
   P ("label.comments.pin_label", "置顶{name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {赞} dislike_reaction {踩} "
      & "heart_reaction {爱心} laugh_reaction {大笑} confused_reaction "
      & "{困惑} hooray_reaction {欢呼} rocket_reaction {火箭} other "
      & "{眼睛}}回应");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {赞} dislike_reaction {踩} "
      & "heart_reaction {爱心} laugh_reaction {大笑} confused_reaction "
      & "{困惑} hooray_reaction {欢呼} rocket_reaction {火箭} other "
      & "{眼睛}}回应：{count, plural, =0 {无} other {{count, number}}}");
   P ("label.comments.reply_count_label", "{count, plural, =0 {没有回复} other {{count, number}条回复}}");
   P ("label.comments.resolved_label", "{name}已解决");
   P ("label.comments.subscribe_label", "订阅{name}");
   P ("label.comments.thread_count_label", "{count, plural, =0 {没有话题} other {{count, number}个话题}}");
   P ("label.comments.thread_label",
      "{name}：{state, select, open_thread {开放话题} resolved_thread "
      & "{已解决话题} locked_thread {已锁定话题} other "
      & "{已归档话题}}{count, plural, =0 {} other {，{count, "
      & "number}条评论}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {开放话题} resolved_thread "
      & "{已解决话题} locked_thread {已锁定话题} other "
      & "{已归档话题}}");
   P ("label.comments.unpin_label", "取消置顶{name}");
   P ("label.comments.unsubscribe_label", "取消订阅{name}");
   P ("label.comparisons.baseline_label",
      "{name}：{result, select, improved {已改善} regressed {已退化} "
      & "unchanged {未变化} within_tolerance {在容差范围内} "
      & "outside_tolerance {超出容差范围} new_value {新增} "
      & "removed_value {已移除} other {无可用基线}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {已改善} regressed {已退化} unchanged "
      & "{未变化} within_tolerance {在容差范围内} outside_tolerance "
      & "{超出容差范围} new_value {新增} removed_value {已移除} "
      & "other {无可用基线}}");
   P ("label.comparisons.difference_label",
      "{name}：{result, select, improved {改善了{difference_text}} "
      & "regressed {退化了{difference_text}} unchanged "
      & "{未变化（差值{difference_text}）} within_tolerance "
      & "{在容差范围内（差值{difference_text}）} outside_tolerance "
      & "{超出容差范围（差值{difference_text}）} new_value "
      & "{新增（差值{difference_text}）} removed_value "
      & "{已移除（差值{difference_text}）} other "
      & "{无可用基线（差值{difference_text}）}}");
   P ("label.comparisons.tolerance_label",
      "{name}：{result, select, improved {改善了{difference_text}} "
      & "regressed {退化了{difference_text}} unchanged "
      & "{未变化（差值{difference_text}）} within_tolerance "
      & "{在容差范围内（差值{difference_text}）} outside_tolerance "
      & "{超出容差范围（差值{difference_text}）} new_value "
      & "{新增（差值{difference_text}）} removed_value "
      & "{已移除（差值{difference_text}）} other "
      & "{无可用基线（差值{difference_text}）}}，容差{tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {无效行} duplicate_record "
      & "{重复记录} missing_column {缺少列} unknown_field {未知字段} "
      & "schema_mismatch {架构不匹配} other {已跳过的记录}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {试运行通过} dry_run_failed "
      & "{试运行失败} import_valid {导入有效} import_invalid "
      & "{导入无效} other {部分导入}}");
   P ("label.data_quality.import_result_label",
      "{name}：{state, select, dry_run_passed {试运行通过} "
      & "dry_run_failed {试运行失败} import_valid {导入有效} "
      & "import_invalid {导入无效} other {部分导入}}，接受{accepted, "
      & "number}条，拒绝{rejected, number}条");
   P ("label.data_quality.issue_count_label",
      "{count, plural, =0 {没有{issue, select, invalid_row {无效行} "
      & "duplicate_record {重复记录} missing_column {缺少的列} "
      & "unknown_field {未知字段} schema_mismatch {架构不匹配} other "
      & "{已跳过的记录}}} other {{count, number}个{issue, select, "
      & "invalid_row {无效行} duplicate_record {重复记录} missing_column "
      & "{缺少的列} unknown_field {未知字段} schema_mismatch "
      & "{架构不匹配} other {已跳过的记录}}}}");
   P ("label.data_quality.row_issue_label",
      "第{row, number}行：{issue, select, invalid_row {无效行} "
      & "duplicate_record {重复记录} missing_column {缺少列} "
      & "unknown_field {未知字段} schema_mismatch {架构不匹配} other "
      & "{已跳过的记录}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}：{issue, select, invalid_row {无效行} duplicate_record "
      & "{重复记录} missing_column {缺少列} unknown_field {未知字段} "
      & "schema_mismatch {架构不匹配} other {已跳过的记录}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {制品已就绪} artifact_uploaded "
      & "{制品已上传} artifact_signed {制品已签名} artifact_missing "
      & "{制品缺失} other {制品已过期}}");
   P ("label.deployments.deployment_label",
      "{name}部署到{environment}：{state, select, queued_deployment "
      & "{已排队} deploying {部署中} deployed {已完成} "
      & "failed_deployment {失败} rolled_back {已回滚} blocked_deployment "
      & "{受阻} other {已取消}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {部署已排队} deploying "
      & "{部署中} deployed {已部署} failed_deployment {部署失败} "
      & "rolled_back {已回滚} blocked_deployment {部署受阻} other "
      & "{部署已取消}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {环境正常} "
      & "drifting_environment {环境漂移} locked_environment "
      & "{环境已锁定} maintenance_environment {环境维护中} other "
      & "{环境状态未知}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {无迁移} migration_pending "
      & "{迁移待处理} migrating {迁移中} migration_complete "
      & "{迁移完成} other {迁移失败}}");
   P ("label.deployments.promotion_label", "{name}已从{from_environment}提升到{to_environment}");
   P ("label.deployments.rollback_label", "{name}回滚到{target}");
   P ("label.deployments.rollout_label", "{name}发布进度：{percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {没有受影响的项} other {{count, "
      & "number}个受影响的项}}");
   P ("label.diagnostics.check_duration_label",
      "{name}：{status, select, passed_check {已通过} failed_check "
      & "{失败} warning_check {有警告} skipped_check {已跳过} "
      & "pending_check {待处理} other {运行中}}（{duration_s, "
      & "number}秒）");
   P ("label.diagnostics.check_result_label",
      "{name}：{status, select, passed_check {已通过} failed_check "
      & "{失败} warning_check {有警告} skipped_check {已跳过} "
      & "pending_check {待处理} other {运行中}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {已通过} failed_check {失败} "
      & "warning_check {有警告} skipped_check {已跳过} pending_check "
      & "{待处理} other {运行中}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{subject}{position, plural, =0 {} other {（位置{position, "
      & "number}）}}：{kind, select, expected_value {需要值} expected_unit "
      & "{需要单位} invalid_range {范围无效} end_before_start "
      & "{范围结束早于开始} unknown_field {未知字段} "
      & "unsafe_redacted_value {不安全的值已隐去} unsupported_syntax "
      & "{不支持的语法} other {诊断说明}}；请使用{suggestion}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {信息} notice_severity {提示} "
      & "warning_severity {警告} error_severity {错误} critical_severity "
      & "{严重} other {阻断}}：{path}{line, plural, =0 {} other {第{line, "
      & "number}行}}：{message}");
   P ("label.diagnostics.failed_at_label",
      "在{line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}第{line, number}行} other {{path}第{line, "
      & "number}行第{column, number}列}}}}失败");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {信息} notice_severity {提示} "
      & "warning_severity {警告} error_severity {错误} critical_severity "
      & "{严重} other {阻断}}（{field_name}）：{message}");
   P ("label.diagnostics.first_failure_label",
      "{check_name}首次失败：{path}{line, plural, =0 {} other {第{line, "
      & "number}行}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{没有问题} other {{notices, number}个提示}}} other {{notices, "
      & "plural, =0 {{warnings, number}个警告} other {{warnings, "
      & "number}个警告，{notices, number}个提示}}}}} other {{warnings, "
      & "plural, =0 {{notices, plural, =0 {{errors, number}个错误} other "
      & "{{errors, number}个错误，{notices, number}个提示}}} other "
      & "{{notices, plural, =0 {{errors, number}个错误，{warnings, "
      & "number}个警告} other {{errors, number}个错误，{warnings, "
      & "number}个警告，{notices, number}个提示}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}第{line, "
      & "number}行} other {{path}第{line, number}行第{column, "
      & "number}列}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {字节解析器} duration_parser "
      & "{时长解析器} date_time_parser {日期时间解析器} "
      & "color_parser {颜色解析器} url_parser {URL解析器} unit_parser "
      & "{单位解析器} recurrence_parser {重复规则解析器} "
      & "domain_label_parser {域标签解析器} other "
      & "{解析器}}不支持的语法：{error}{position, plural, =0 {} other "
      & "{（位置{position, number}）}}；请使用{family, select, "
      & "byte_parser {B、kB、MB、GB、KiB、MiB、GiB或TiB} duration_parser "
      & "{ms、s、min、h、d、w、month或year} date_time_parser "
      & "{ISO日期、自然日期或时钟时间} color_parser "
      & "{十六进制、rgb()、hsl()、lab()、lch()或颜色名称} "
      & "url_parser {协议、主机、路径、查询或片段} unit_parser "
      & "{支持的Humanize单位标签} recurrence_parser "
      & "{cron或every/工作日重复格式} domain_label_parser "
      & "{确定性的Humanize域标签} other {支持的输入格式}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {已通过} failed_check {失败} "
      & "warning_check {有警告} skipped_check {已跳过} pending_check "
      & "{待处理} other {运行中}}，{notices, plural, =0 {没有提示} "
      & "other {{notices, number}个提示}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {第1次重试，共1次} "
      & "other {第{attempt, number}次重试，已超出上限1次}}} other "
      & "{第{attempt, number}次重试，共{limit, number}次}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {信息} notice_severity {提示} "
      & "warning_severity {警告} error_severity {错误} critical_severity "
      & "{严重} other {阻断}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {构建诊断} test_source "
      & "{测试诊断} lint_source {Lint诊断} import_source {导入诊断} "
      & "validation_source {验证诊断} runtime_source {运行时诊断} "
      & "security_source {安全诊断} other {诊断}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number}条{source, select, build_source {构建诊断} "
      & "test_source {测试诊断} lint_source {Lint诊断} import_source "
      & "{导入诊断} validation_source {验证诊断} runtime_source "
      & "{运行时诊断} security_source {安全诊断} other {诊断}}");
   P ("label.diagnostics.suggested_action_label", "下一步：{action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {域名主机} ipv4_host {IPv4地址} "
      & "ipv6_host {IPv6地址} localhost_host {本地主机} "
      & "private_network_host {专用网络地址} other {未知主机}}");
   P ("label.events.all_day_label", "{name}（全天）");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {未回复} accepted {已接受} "
      & "declined {已拒绝} maybe {待定} other {候补}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {没有参与者} other {{count, "
      & "number}位参与者}}");
   P ("label.events.canceled_label", "{name}已取消");
   P ("label.events.check_in_label", "签到{name}");
   P ("label.events.conference_link_label", "{name}会议链接");
   P ("label.events.event_count_label", "{count, plural, =0 {没有活动} other {{count, number}个活动}}");
   P ("label.events.event_label",
      "{name}：{state, select, scheduled_event {已安排} tentative_event "
      & "{暂定} in_progress_event {进行中} completed_event {已完成} "
      & "canceled_event {已取消} other {已推迟}}");
   P ("label.events.event_location_label", "{name}，地点：{location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {已安排的活动} tentative_event "
      & "{暂定的活动} in_progress_event {进行中的活动} "
      & "completed_event {已完成的活动} canceled_event "
      & "{已取消的活动} other {已推迟的活动}}");
   P ("label.events.event_time_label", "{name}，时间：{time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {公开活动} private_event "
      & "{私人活动} busy_event {忙碌} other {空闲}}");
   P ("label.events.organizer_label", "组织者：{name}");
   P ("label.events.rsvp_label",
      "回复：{state, select, not_responded {未回复} accepted "
      & "{已接受} declined {已拒绝} maybe {待定} other {候补}}");
   P ("label.events.reminder_label", "提醒：{time_text}");
   P ("label.events.rescheduled_label", "{name}已改期至{time_text}");
   P ("label.forms.character_count_label", "{used, number}个字符");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {无字符限制} other {最多{limit, "
      & "number}个字符}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number}个字符} other {{used, "
      & "number}/{limit, number}个字符}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}（可选）} other "
      & "{{name}（必填）}}");
   P ("label.forms.field_state_label",
      "{name}：{state, select, valid_input {有效} invalid_input {无效} "
      & "required_input {必填} optional_input {可选} disabled_input "
      & "{已禁用} other {只读}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {表单没有问题} other "
      & "{{warnings, number}个警告}}} other {{warnings, plural, =0 {{errors, "
      & "number}个错误} other {{errors, number}个错误，{warnings, "
      & "number}个警告}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {未开始} editing_form {编辑中} "
      & "dirty_form {有未保存的更改} saving_form {保存中} saved_form "
      & "{已保存} submitted_form {已提交} other {提交失败}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {输入有效} invalid_input "
      & "{输入无效} required_input {必填输入} optional_input "
      & "{可选输入} disabled_input {输入已禁用} other {只读输入}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {未开始} editing_form {编辑中} "
      & "dirty_form {有未保存的更改} saving_form {正在保存表单} "
      & "saved_form {表单已保存} submitted_form {表单已提交} other "
      & "{{errors, plural, =0 {提交失败} other {提交失败，{errors, "
      & "number}个错误}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {没有未保存的更改} other {{count, "
      & "number}项未保存的更改}}");
   P ("label.markup.accessibility_issue_label",
      "{target}：{issue, select, missing_accessible_name "
      & "{缺少无障碍名称} low_contrast {对比度过低} "
      & "skipped_heading_level {跳过了标题级别} missing_form_label "
      & "{缺少表单标签} invalid_aria {ARIA无效} keyboard_trap "
      & "{键盘陷阱} other {未知无障碍问题}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}无障碍摘要：{landmarks, number}个地标，{headings, "
      & "number}个标题，{issues, number}个问题");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {添加无障碍名称} "
      & "low_contrast {提高文本对比度} skipped_heading_level "
      & "{按顺序使用标题级别} missing_form_label "
      & "{为表单控件关联标签} invalid_aria "
      & "{使用有效的ARIA角色或属性} keyboard_trap "
      & "{确保键盘焦点可以离开该组件} other "
      & "{检查无障碍问题}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target}没有无障碍问题} other "
      & "{{target}有{issues, number}个无障碍问题}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {id属性} class_attribute {class属性} "
      & "data_attribute {data属性} aria_attribute {ARIA属性} role_attribute "
      & "{role属性} link_attribute {链接属性} media_attribute "
      & "{媒体属性} form_attribute {表单属性} boolean_attribute "
      & "{布尔属性} event_attribute {事件处理程序属性} other "
      & "{未知属性}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 "
      & "{{form_name}没有表单问题} other {{form_name}：{warnings, "
      & "number}个警告}}} other {{warnings, plural, =0 "
      & "{{form_name}：{errors, number}个错误} other "
      & "{{form_name}：{errors, number}个错误，{warnings, "
      & "number}个警告}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {横幅地标} navigation_role "
      & "{导航地标} main_role {主要地标} complementary_role "
      & "{补充地标} contentinfo_role {内容信息地标} search_role "
      & "{搜索地标} form_role {表单地标} region_role {区域地标} "
      & "dialog_role {对话框} alert_role {警报实时区域} status_role "
      & "{状态实时区域} other {未知地标}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}即时更新：{update}} other "
      & "{{region}常规更新：{update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {文本内容} html_content {HTML内容} "
      & "json_content {JSON内容} xml_content {XML内容} image_content "
      & "{图像内容} audio_content {音频内容} video_content "
      & "{视频内容} font_content {字体内容} archive_content "
      & "{归档内容} binary_content {二进制内容} form_content "
      & "{表单内容} other {未知内容}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {文档标签} metadata_tag "
      & "{元数据标签} section_tag {分节标签} text_tag {文本标签} "
      & "link_tag {链接标签} media_tag {媒体标签} form_tag "
      & "{表单标签} table_tag {表格标签} interactive_tag {交互标签} "
      & "scripting_tag {脚本标签} other {未知标签}}");
   P ("label.media.duration_label", "时长：{duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {图像} video_media {视频} audio_media "
      & "{音频} pdf_document {PDF文档} text_document {文本文档} "
      & "archive_media {归档} other {媒体}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {就绪} processing_media {处理中} "
      & "transcoding_media {转码中} thumbnail_missing {缩略图不可用} "
      & "metadata_missing {缺少元数据} locked_document {文档已锁定} "
      & "other {不可用}}");
   P ("label.media.media_summary",
      "{name}（{kind, select, image_media {图像} video_media {视频} "
      & "audio_media {音频} pdf_document {PDF文档} text_document "
      & "{文本文档} archive_media {归档} other {媒体}}）：{state, "
      & "select, ready_media {就绪} processing_media {处理中} "
      & "transcoding_media {转码中} thumbnail_missing {缩略图不可用} "
      & "metadata_missing {缺少元数据} locked_document {文档已锁定} "
      & "other {不可用}}");
   P ("label.media.page_count_label", "{pages, plural, =0 {没有页面} other {{pages, number}页}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}申诉：{state, select, open_report {未处理} triaged_report "
      & "{已分类} actioned_report {已处理} dismissed_report {已驳回} "
      & "appealed_report {已申诉} other {已关闭}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {无审核操作} flagged {已标记} "
      & "hidden {已被版主隐藏} restored {已恢复} marked_spam "
      & "{已标记为垃圾内容} removed {已移除} other {已升级}}");
   P ("label.moderation.moderation_label",
      "{item}：{action, select, no_action {无审核操作} flagged "
      & "{已标记} hidden {已被版主隐藏} restored {已恢复} "
      & "marked_spam {已标记为垃圾内容} removed {已移除} other "
      & "{已升级}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {审核队列为空} "
      & "other {{pending, number}项待审核}}} other {{pending, "
      & "number}项待审核，{escalated, number}项已升级}}");
   P ("label.moderation.report_label",
      "{item}举报：{state, select, open_report {未处理} triaged_report "
      & "{已分类} actioned_report {已处理} dismissed_report {已驳回} "
      & "appealed_report {已申诉} other {已关闭}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {未处理的举报} triaged_report "
      & "{已分类的举报} actioned_report {已处理} dismissed_report "
      & "{已驳回的举报} appealed_report {已申诉的举报} other "
      & "{已关闭的举报}}");
   P ("label.moderation.review_label",
      "{item}：{state, select, pending_review {待审核} approved "
      & "{已批准} rejected {已拒绝} needs_changes {需要修改} other "
      & "{已升级}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {待审核} approved {已批准} "
      & "rejected {已拒绝} needs_changes {需要修改} other {已升级}}");
   P ("label.navigation.back_label", "返回{target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {没有面包屑导航} other {{depth, "
      & "number}级面包屑导航}}");
   P ("label.navigation.current_page_label", "当前页面：{name}");
   P ("label.navigation.external_link_label", "{name}（外部链接）");
   P ("label.navigation.first_label", "第一个：{target}");
   P ("label.navigation.last_label", "最后一个：{target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {没有菜单项} other {{count, "
      & "number}个菜单项}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {链接} menu_item {菜单项} tab_item "
      & "{标签页} breadcrumb_item {面包屑} section_item {分区} other "
      & "{分隔符}}");
   P ("label.navigation.navigation_item_label",
      "{name}{kind, select, link_item {链接} menu_item {菜单项} tab_item "
      & "{标签页} breadcrumb_item {面包屑} section_item {分区} other "
      & "{分隔符}}：{state, select, current_item {当前} active_item "
      & "{活动} inactive_item {非活动} disabled_item {已禁用} "
      & "expanded_item {已展开} collapsed_item {已折叠} visited_item "
      & "{已访问} other {外部}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {当前} active_item {活动} "
      & "inactive_item {非活动} disabled_item {已禁用} expanded_item "
      & "{已展开} collapsed_item {已折叠} visited_item {已访问} other "
      & "{外部}}");
   P ("label.navigation.next_label", "下一个：{target}");
   P ("label.navigation.section_state_label",
      "{name}分区{expanded, select, false {已折叠} other "
      & "{已展开}}{count, plural, =0 {} other {，{count, number}项}}");
   P ("label.navigation.skip_link_label", "跳转到{target}");
   P ("label.navigation.submenu_label", "{name}子菜单，{count, number}项");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {所有警报} important_alerts "
      & "{重要警报} critical_alerts_only {仅严重警报} other "
      & "{无警报}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}通知：{state, select, preference_enabled {已启用} "
      & "preference_disabled {已禁用} preference_inherited {已继承} other "
      & "{必需}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {不发送摘要} instant_digest "
      & "{即时摘要} daily_digest {每日摘要} other {每周摘要}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {已启用} preference_disabled "
      & "{已禁用} preference_inherited {已继承} other {必需}}");
   P ("label.notification_preferences.quiet_hours_label", "免打扰时段：{time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}{scope, select, thread_subscription {话题} "
      & "project_subscription {项目} team_subscription {团队} other "
      & "{账户}}订阅：{state, select, preference_enabled {已启用} "
      & "preference_disabled {已禁用} preference_inherited {已继承} other "
      & "{必需}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {话题订阅} "
      & "project_subscription {项目订阅} team_subscription {团队订阅} "
      & "other {账户订阅}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor}提到了你} reply_event "
      & "{{actor}回复了} assignment_event {{actor}向你分配了任务} "
      & "approval_event {{actor}请求审批} alert_event "
      & "{{actor}发送了警报} digest_event {{actor}发送了摘要} "
      & "reminder_event {{actor}发送了提醒} other "
      & "{{actor}发送了系统通知}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {应用内通知} email_channel "
      & "{电子邮件通知} sms_channel {短信通知} push_channel "
      & "{推送通知} webhook_channel {Webhook 通知} other "
      & "{摘要通知}}：{state, select, pending_delivery {待发送} "
      & "sent_delivery {已发送} delivered_delivery {已送达} "
      & "failed_delivery {失败} retrying_delivery {重试中} other "
      & "{已取消}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {待发送的通知} sent_delivery "
      & "{已发送的通知} delivered_delivery {已送达的通知} "
      & "failed_delivery {发送失败的通知} retrying_delivery "
      & "{正在重试的通知} other {已取消的通知}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {待发送} sent_delivery {已发送} "
      & "delivered_delivery {已送达} failed_delivery {失败} "
      & "retrying_delivery {重试中} other {已取消}}：{time_text}");
   P ("label.notifications.digest_label",
      "{name}摘要：{count, plural, =0 {没有通知} other {{count, "
      & "number}条通知}}");
end Labels_1;
