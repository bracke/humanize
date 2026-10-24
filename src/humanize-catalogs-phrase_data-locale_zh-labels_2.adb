separate (Humanize.Catalogs.Phrase_Data.Locale_Zh)
procedure Labels_2 is
begin
   P ("label.notifications.event_count_label",
      "{count, plural, =0 {{event, select, mention_event {没有提及} "
      & "reply_event {没有回复} assignment_event {没有分配} "
      & "approval_event {没有审批请求} alert_event {没有警报} "
      & "digest_event {没有摘要} reminder_event {没有提醒} other "
      & "{没有系统通知}}} other {{event, select, mention_event {{count, "
      & "number}次提及} reply_event {{count, number}条回复} "
      & "assignment_event {{count, number}项分配} approval_event {{count, "
      & "number}个审批请求} alert_event {{count, number}条警报} "
      & "digest_event {{count, number}份摘要} reminder_event {{count, "
      & "number}条提醒} other {{count, number}条系统通知}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {将通知标为已读} other {将{count, "
      & "number}条通知标为已读}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {将通知标为未读} other {将{count, "
      & "number}条通知标为未读}}");
   P ("label.notifications.muted_label", "{name}通知已静音");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {新提及} reply_event {新回复} "
      & "assignment_event {新分配} approval_event {新审批请求} "
      & "alert_event {新警报} digest_event {新摘要} reminder_event "
      & "{新提醒} other {新系统通知}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {应用内通知} email_channel "
      & "{电子邮件通知} sms_channel {短信通知} push_channel "
      & "{推送通知} webhook_channel {Webhook 通知} other {摘要通知}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {没有通知} other {{count, number}条通知}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {提及} reply_event {回复} "
      & "assignment_event {分配} approval_event {审批请求} alert_event "
      & "{警报} digest_event {摘要} reminder_event {提醒} other "
      & "{系统通知}}");
   P ("label.notifications.notification_group_label",
      "{name}：{count, plural, =0 {没有通知} other {{count, "
      & "number}条通知}}");
   P ("label.notifications.notification_label",
      "{subject}{event, select, mention_event {提及} reply_event {回复} "
      & "assignment_event {分配} approval_event {审批请求} alert_event "
      & "{警报} digest_event {摘要} reminder_event {提醒} other "
      & "{系统通知}}：{state, select, unread_state {未读} read_state "
      & "{已读} archived_state {已归档} muted_state {已静音} "
      & "snoozed_state {已延后} other {已抑制}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {未读通知} read_state {已读通知} "
      & "archived_state {已归档通知} muted_state {已静音通知} "
      & "snoozed_state {已延后通知} other {已抑制通知}}");
   P ("label.notifications.snoozed_label", "{name}通知已延后");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {没有通知被抑制} other {已抑制{count, "
      & "number}条通知}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {没有未读通知} other {{count, "
      & "number}条未读通知}}");
   P ("label.payments.amount_label", "金额：{amount_text}");
   P ("label.payments.balance_label", "余额：{amount_text}");
   P ("label.payments.chargeback_label", "拒付：{amount_text}");
   P ("label.payments.discount_label", "折扣：{amount_text}");
   P ("label.payments.due_label", "{amount_text}，{due_text}到期");
   P ("label.payments.invoice_count_label", "{count, plural, =0 {没有发票} other {{count, number}张发票}}");
   P ("label.payments.invoice_label",
      "发票{number}：{state, select, draft_invoice {草稿} open_invoice "
      & "{未付款} paid_invoice {已付款} overdue_invoice {逾期} other "
      & "{已作废}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {草稿发票} open_invoice "
      & "{未付款发票} paid_invoice {已付款发票} overdue_invoice "
      & "{逾期发票} other {已作废发票}}");
   P ("label.payments.method_label",
      "{method, select, card_method {刷卡支付} bank_transfer_method "
      & "{银行转账支付} cash_method {现金支付} wallet_method "
      & "{钱包支付} check_method {支票支付} other "
      & "{其他方式支付}}：{detail}");
   P ("label.payments.paid_label", "{amount_text}，已于{paid_text}支付");
   P ("label.payments.payment_count_label", "{count, plural, =0 {没有付款} other {{count, number}笔付款}}");
   P ("label.payments.payment_label",
      "{amount_text}付款：{state, select, pending_payment {待处理} "
      & "authorized_payment {已授权} paid_payment {已完成} failed_payment "
      & "{失败} refunded_payment {已退款} other {已取消}}");
   P ("label.payments.payment_link_label", "{name}付款链接");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {卡} bank_transfer_method {银行转账} "
      & "cash_method {现金} wallet_method {钱包} check_method {支票} "
      & "other {其他}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {待处理的付款} "
      & "authorized_payment {已授权的付款} paid_payment "
      & "{已完成的付款} failed_payment {失败的付款} refunded_payment "
      & "{已退款的付款} other {已取消的付款}}");
   P ("label.payments.receipt_label", "收据{number}");
   P ("label.payments.refund_label",
      "{amount_text}退款：{state, select, pending_payment {待处理} "
      & "authorized_payment {已授权} paid_payment {已完成} failed_payment "
      & "{失败} refunded_payment {已完成} other {已取消}}");
   P ("label.payments.subtotal_label", "小计：{amount_text}");
   P ("label.payments.tax_label", "税费：{amount_text}");
   P ("label.payments.total_label", "总计：{amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}的访问权限到期时间：{time_text}");
   P ("label.permissions.grant_label",
      "已授予{subject}{role, select, owner_role {所有者} admin_role "
      & "{管理员} editor_role {编辑者} viewer_role {查看者} other "
      & "{自定义}}角色");
   P ("label.permissions.permission_label",
      "{subject}的{action}权限：{state, select, granted {已授予} "
      & "denied {已拒绝} inherited {已继承} temporary {临时访问} "
      & "expired {已过期} other {需要审批}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {已授予} denied {已拒绝} inherited "
      & "{已继承} temporary {临时访问} expired {已过期} other "
      & "{需要审批}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {策略允许} policy_denied "
      & "{策略拒绝} policy_warning {策略警告} other {策略不适用}}");
   P ("label.permissions.revoke_label",
      "已撤销{subject}的{role, select, owner_role {所有者} admin_role "
      & "{管理员} editor_role {编辑者} viewer_role {查看者} other "
      & "{自定义}}角色");
   P ("label.permissions.role_label",
      "{role, select, owner_role {所有者} admin_role {管理员} "
      & "editor_role {编辑者} viewer_role {查看者} other "
      & "{自定义角色}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {空} low_utilization {利用率低} "
      & "normal_utilization {利用率正常} high_utilization {利用率高} "
      & "critical_utilization {利用率危急} full_utilization {已满} other "
      & "{超出限制}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {字符串} integer_field {整数} "
      & "decimal_field {小数} boolean_field {布尔值} date_field {日期} "
      & "date_time_field {日期时间} object_field {对象} array_field "
      & "{数组} enum_field {枚举} binary_field {二进制} null_field {null "
      & "} any_field {任意值} other {未知}}数组{count_known, select, "
      & "false {} other {（{count, number}项）}}");
   P ("label.schema.constraint_label", "{name}约束：{value}");
   P ("label.schema.default_value_label", "字段{field_name}默认为{value}");
   P ("label.schema.deprecated_field_label", "字段{name}已弃用，请使用{replacement}");
   P ("label.schema.enum_options_label", "{count, number}个枚举选项");
   P ("label.schema.example_value_label", "字段{field_name}示例：{value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {普通字段} deprecated_field "
      & "{已弃用字段} unknown_field {未知字段} read_only_field "
      & "{只读字段} write_only_field {只写字段} other {计算字段}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {字符串字段} integer_field "
      & "{整数字段} decimal_field {小数字段} boolean_field "
      & "{布尔字段} date_field {日期字段} date_time_field "
      & "{日期时间字段} object_field {对象字段} array_field "
      & "{数组字段} enum_field {枚举字段} binary_field "
      & "{二进制字段} null_field {null 字段} any_field "
      & "{任意类型字段} other {未知类型字段}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {没有缺少必填字段} other {缺少{count, "
      & "number}个必填字段}}");
   P ("label.schema.object_shape_label",
      "对象（{fields, number}个字段{required, plural, =0 {} other "
      & "{，{required, number}个必填}}{optional, plural, =0 {} other "
      & "{，{optional, number}个可选}}）");
   P ("label.schema.schema_source_label", "架构{name}，版本{version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {标量值} object_shape {对象{count, "
      & "plural, =0 {} other {（{count, number}个字段）}}} array_shape "
      & "{数组{count, plural, =0 {} other {（{count, number}项）}}} "
      & "map_shape {映射{count, plural, =0 {} other {（{count, "
      & "number}个条目）}}} tuple_shape {元组{count, plural, =0 {} other "
      & "{（{count, number}项）}}} union_shape {联合类型{count, plural, "
      & "=0 {} other {（{count, number}种类型）}}} empty_shape {空形状} "
      & "other {未知形状}}");
   P ("label.schema.unknown_field_label", "未知字段{name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {没有生效的筛选条件} other {{count, "
      & "number}个生效的筛选条件}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {清除筛选条件} other {清除{count, "
      & "number}个生效的筛选条件}}");
   P ("label.search.facet_label", "{name}分面，{count, number}个选项");
   P ("label.search.facet_value_label",
      "{name}，{count, plural, =0 {没有结果} other {{count, "
      & "number}个结果}}{selected, select, false {} other {，已选中}}");
   P ("label.search.filter_label",
      "{name}：{value}（{state, select, active_filter "
      & "{生效的筛选条件} inactive_filter {未生效的筛选条件} "
      & "other {排除筛选条件}}）");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {生效的筛选条件} inactive_filter "
      & "{未生效的筛选条件} other {排除筛选条件}}");
   P ("label.search.no_results_label", "没有“{query}”的结果");
   P ("label.search.recent_search_label", "最近搜索：“{query}”");
   P ("label.search.saved_search_label",
      "已保存的搜索：{name}{count, plural, =0 {} other {，{count, "
      & "number}个结果}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {没有最近搜索} other {{count, "
      & "number}条最近搜索}}");
   P ("label.search.search_query_label", "搜索“{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {没有结果} other {{count, number}个结果}}");
   P ("label.search.search_result_summary_label",
      "“{query}”的结果：{count, plural, =0 {无} other {{count, "
      & "number}个}}");
   P ("label.search.search_scope_label",
      "{name}范围：{count, plural, =0 {没有结果} other {{count, "
      & "number}个结果}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {搜索空闲} searching_search "
      & "{正在搜索} complete_search {搜索完成} empty_search "
      & "{没有搜索结果} other {搜索失败}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {按相关性排序} ascending_sort "
      & "{按升序排序} descending_sort {按降序排序} newest_first_sort "
      & "{按最新优先排序} other {按最早优先排序}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {相关性} ascending_sort {升序} "
      & "descending_sort {降序} newest_first_sort {最新优先} other "
      & "{最早优先}}");
   P ("label.search.suggestion_label", "您是不是要找“{query}”？");
   P ("label.secrets.credential_source_label", "来自{source}的{count, number}个凭据");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {值已隐藏} masked_value "
      & "{值已掩码} suffix_only {仅显示后缀} other {仅显示指纹}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {公开} support_profile {支持} "
      & "audit_profile {审计} other {调试}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {无需轮换} other "
      & "{需要轮换}}{days_old, plural, =0 {} other {，已存在{days_old, "
      & "number}天}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API 密钥} live_api_key {生产环境 API "
      & "密钥} test_api_key {测试 API 密钥} github_token {GitHub 令牌} "
      & "aws_access_key {AWS 访问密钥} google_api_key {Google API 密钥} "
      & "slack_token {Slack 令牌} npm_token {npm 令牌} bearer_token {Bearer "
      & "令牌} jwt_token {JWT 令牌} basic_auth_credential "
      & "{基本身份验证凭据} password_secret {密码} private_key "
      & "{私钥} ssh_private_key {SSH 私钥} webhook_secret {Webhook 密钥} "
      & "oauth_token {OAuth 令牌} database_url_secret {数据库 URL} "
      & "sha1_fingerprint {SHA-1 指纹} sha256_fingerprint {SHA-256 指纹} "
      & "other {机密}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {电子邮件} phone_value {电话号码} "
      & "url_value {URL} ip_address_value {IP 地址} token_value {令牌} "
      & "file_path_value {文件路径} account_id_value {账户 ID} "
      & "payment_reference_value {付款参考号} log_field_value "
      & "{日志字段} other {敏感值}}");
   P ("label.tables.cell_label",
      "第{row, number}行第{column, number}列：{state, select, empty_cell "
      & "{空} edited_cell {已编辑} invalid_cell {无效} highlighted_cell "
      & "{已突出显示} other {只读}}");
   P ("label.tables.cell_position_label", "第{row, number}行第{column, number}列");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {空单元格} edited_cell "
      & "{已编辑的单元格} invalid_cell {无效单元格} "
      & "highlighted_cell {突出显示的单元格} other {只读单元格}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {没有列} other {{count, number}列}}");
   P ("label.tables.column_label",
      "{name}（{role, select, text_column {文本列} number_column "
      & "{数字列} date_column {日期列} status_column {状态列} "
      & "action_column {操作列} other {隐藏列}}）");
   P ("label.tables.column_role_label",
      "{role, select, text_column {文本列} number_column {数字列} "
      & "date_column {日期列} status_column {状态列} action_column "
      & "{操作列} other {隐藏列}}");
   P ("label.tables.group_label", "{name}：{count, number}行");
   P ("label.tables.row_count_label", "{count, plural, =0 {没有行} other {{count, number}行}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {未排序} ascending_sort {升序} other "
      & "{降序}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {未排序} ascending_sort "
      & "{已按{column_name}升序排序} other "
      & "{已按{column_name}降序排序}}");
   P ("label.tables.subtotal_label", "{name}小计：{value}");
   P ("label.tables.table_size_label", "{rows, number}行×{columns, number}列");
   P ("label.tasks.assignment_label",
      "{assignee}：{state, select, unassigned {已取消分配} assigned "
      & "{已分配} reassigned {已重新分配} watching {正在关注} other "
      & "{任务负责人}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {未分配} assigned {已分配} reassigned "
      & "{已重新分配} watching {正在关注} other {任务负责人}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {待办列表为空} other {待办列表：{count, "
      & "number}个任务}}");
   P ("label.tasks.blocker_label", "被{name}阻塞");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {完成任务} other {完成{count, "
      & "number}个任务}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {没有已完成的任务} other {{count, "
      & "number}个已完成的任务}}");
   P ("label.tasks.due_label", "截止：{due_text}");
   P ("label.tasks.estimate_label", "预计：{estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {没有未完成的任务} other {{count, "
      & "number}个未完成的任务}}");
   P ("label.tasks.overdue_label", "自{due_text}起已逾期");
   P ("label.tasks.recurring_task_label", "重复：{schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {重新打开任务} other {重新打开{count, "
      & "number}个任务}}");
   P ("label.tasks.sprint_label", "{name}：{count, number}个任务");
   P ("label.tasks.subtask_label", "{name}：{count, number}个子任务");
   P ("label.tasks.task_count_label", "{count, plural, =0 {没有任务} other {{count, number}个任务}}");
   P ("label.tasks.task_label",
      "{name}：{state, select, open_task {未开始的任务} "
      & "in_progress_task {进行中的任务} blocked_task {受阻的任务} "
      & "done_task {已完成的任务} canceled_task {已取消的任务} "
      & "deferred_task {已推迟的任务} other "
      & "{已逾期的任务}}{priority, select, no_priority {} low_priority "
      & "{，低优先级} medium_priority {，中优先级} high_priority "
      & "{，高优先级} other {，紧急优先级}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {无优先级} low_priority "
      & "{低优先级} medium_priority {中优先级} high_priority "
      & "{高优先级} other {紧急优先级}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {未开始的任务} in_progress_task "
      & "{进行中的任务} blocked_task {受阻的任务} done_task "
      & "{已完成的任务} canceled_task {已取消的任务} deferred_task "
      & "{已推迟的任务} other {已逾期的任务}}");
   P ("label.thresholds.threshold_direction_label", "{direction, select, upper_limit {上限} other {下限}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {低于预期范围} within_range "
      & "{在预期范围内} above_range {高于预期范围} below_target "
      & "{低于目标} at_target {达到目标} above_target {高于目标} "
      & "near_limit {接近限值} warning_level {警告阈值} critical_level "
      & "{严重阈值} breached {已超出阈值} other {阈值状态未知}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {已是最新} other "
      & "{领先{ahead, number}个提交}}} other {{ahead, plural, =0 "
      & "{落后{behind, number}个提交} other {领先{ahead, "
      & "number}个提交，落后{behind, number}个提交}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {已由{approver}批准} other "
      & "{等待{approver}批准}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {第1次尝试，共1次} "
      & "other {第{attempt, number}次尝试，已超过1次的上限}}} other "
      & "{第{attempt, number}次尝试，共{limit, number}次}}");
   P ("label.workflows.blocker_label", "受阻：{reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {没有阻塞依赖项} other {{count, "
      & "number}个阻塞依赖项}}");
   P ("label.workflows.handoff_label", "从{from}移交给{to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {即将到来的里程碑} "
      & "current_milestone {当前里程碑} complete_milestone "
      & "{已完成的里程碑} missed_milestone {已错过的里程碑} other "
      & "{受阻的里程碑}}");
   P ("label.workflows.milestone_status_label",
      "{name}：{state, select, upcoming_milestone {即将到来} "
      & "current_milestone {当前} complete_milestone {已完成} "
      & "missed_milestone {已错过} other {受阻}}");
   P ("label.workflows.next_action_label", "下一步：{action}");
   P ("label.workflows.owner_label", "负责人：{owner}");
   P ("label.workflows.resume_label", "恢复{name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {待处理} active_step {进行中} "
      & "waiting_step {等待中} blocked_step {受阻} done_step {已完成} "
      & "failed_step {失败} other {已跳过}}");
   P ("label.workflows.step_status_label",
      "{name}：{state, select, pending_step {待处理} active_step "
      & "{进行中} waiting_step {等待中} blocked_step {受阻} done_step "
      & "{已完成} failed_step {失败} other {已跳过}}");
   P ("label.workflows.waiting_label", "正在等待{reason}");
   P ("label.workflows.workflow_result_label",
      "{name}：{state, select, not_started_state {未开始} "
      & "in_progress_state {进行中} waiting_state {等待中} "
      & "waiting_approval_state {等待批准} blocked_state {受阻} "
      & "completed_state {已完成} failed_state {失败} cancelled_state "
      & "{已取消} skipped_state {已跳过} other {已暂停}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {未开始} in_progress_state "
      & "{进行中} waiting_state {等待中} waiting_approval_state "
      & "{等待批准} blocked_state {受阻} completed_state {已完成} "
      & "failed_state {失败} cancelled_state {已取消} skipped_state "
      & "{已跳过} other {已暂停}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {透明} mostly_transparent "
      & "{大部分透明} translucent {半透明} mostly_opaque "
      & "{大部分不透明} other {不透明}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {没有观测值} other {{count, "
      & "number}个观测值，最小值{minimum} {unit}，中位数{median} "
      & "{unit}，最大值{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}，p95 {p95} {unit}，p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {没有观测值} other "
      & "{{total, number}个观测值中有0个离群值}}} other {{total, "
      & "number}个观测值中有{outliers, number}个离群值}}");
   P ("label.resources.remaining_label",
      "{state, select, over {超出容量{count, number} {unit}} other "
      & "{剩余{count, number}/{total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {配额超出{count, number} "
      & "{unit}（已用{percent}）} near {配额接近上限：剩余{count, "
      & "number} {unit}（已用{percent}）} other "
      & "{配额可用：剩余{count, number} {unit}（已用{percent}）}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {缓存命中率不可用：没有请求} other "
      & "{缓存命中率{percent}：命中{hits, "
      & "number}次，未命中{misses, number}次}}");
   P ("label.markup.attribute_count_label.total", "{count, number}个属性");
   P ("label.markup.attribute_count_label.data", "{count, number}个data属性");
   P ("label.markup.attribute_count_label.aria", "{count, number}个ARIA属性");
   P ("label.markup.attribute_count_label.events", "{count, number}个事件处理程序");
   P ("label.markup.heading_label", "{level, number}级标题");
   P ("label.markup.tag_count_label.total", "{count, number}个标签");
   P ("label.markup.tag_count_label.links", "{count, number}个链接");
   P ("label.markup.tag_count_label.media", "{count, number}个媒体元素");
   P ("label.markup.tag_count_label.forms", "{count, number}个表单控件");
   P ("label.markup.document_outline_label.headings", "{count, number}个标题");
   P ("label.markup.document_outline_label.landmarks", "{count, number}个地标");
   P ("label.markup.document_outline_label.forms", "{count, number}个表单");
   P ("label.markup.document_outline_label.media", "{count, number}个媒体元素");
   P ("label.markup.table_navigation_label",
      "{caption}，第{row, number}/{rows, number}行，第{column, "
      & "number}/{columns, number}列");
   P ("label.secrets.secret_count_label.total", "{count, number}项机密");
   P ("label.secrets.secret_count_label.masked", "{count, number}项已掩码");
   P ("label.secrets.secret_count_label.unset", "{count, number}项未设置");
   P ("label.secrets.secret_count_label.fingerprints", "{count, number}个指纹");
   P ("label.schema.type_mismatch_label",
      "字段{field_name}应为{expected, select, string_field {字符串} "
      & "integer_field {整数} decimal_field {小数} boolean_field "
      & "{布尔值} date_field {日期} date_time_field {日期时间} "
      & "object_field {对象} array_field {数组} enum_field {枚举} "
      & "binary_field {二进制} null_field {null} any_field {任意值} other "
      & "{未知}}，实际为{actual, select, string_field {字符串} "
      & "integer_field {整数} decimal_field {小数} boolean_field "
      & "{布尔值} date_field {日期} date_time_field {日期时间} "
      & "object_field {对象} array_field {数组} enum_field {枚举} "
      & "binary_field {二进制} null_field {null} any_field {任意值} other "
      & "{未知}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, number}个阻塞问题} "
      & "blocking {{base}，{blocking, number}个阻塞问题} only {仅{base}} "
      & "other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {目标范围{low}至{high}} "
      & "other {目标区间{low}至{high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value}，在预期范围内} below "
      & "{{value}，低于预期范围} other {{value}，高于预期范围}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value}，达到严重阈值} warning "
      & "{{value}，达到警告阈值} other {{value}，在正常范围内}}");
   P ("label.thresholds.breach_label", "{state, select, ok {未突破} other {突破{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {达到目标} below {低于目标{difference}} "
      & "other {高于目标{difference}}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {已突破上限} near "
      & "{接近上限，剩余{distance}} other {距上限{distance}}}");
   P ("label.thresholds.threshold_summary_label.none", "没有指标");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number}个正常");
   P ("label.thresholds.threshold_summary_label.warnings", "{count, number}个警告");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number}个严重");
   P ("label.thresholds.threshold_summary_label.breaches", "{count, number}次突破");
   P ("label.thresholds.target_window_label", "目标{target} ±{tolerance}");
   P ("label.thresholds.tolerance_label", "容差{tolerance}");
   P ("label.thresholds.percent_of_limit_label", "上限的{percent}");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {超出上限{amount}} other "
      & "{剩余{amount}}}");
   P ("label.thresholds.budget_used_label", "已用{used}，预算{budget}");
   P ("label.workflows.step_label", "第{current, number}/{total, number}步：{name}");
   P ("label.workflows.milestone_label", "已完成{current, number}/{total, number}个里程碑：{name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {没有工作流项目} half "
      & "{工作流已完成一半} other {已完成{completed, number}/{total, "
      & "number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {队列位置{position, number}} other "
      & "{队列位置{position, number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "没有更改");
   P ("label.changes.change_set_label.added", "添加{count, number}项");
   P ("label.changes.change_set_label.removed", "移除{count, number}项");
   P ("label.changes.change_set_label.modified", "更改{count, number}项");
   P ("label.changes.change_set_label.unchanged", "{count, number}项未变");
   P ("label.changes.sync_change_label.none", "没有同步更改");
   P ("label.changes.sync_change_label.uploaded", "上传{count, number}项");
   P ("label.changes.sync_change_label.downloaded", "下载{count, number}项");
   P ("label.changes.sync_change_label.deleted", "删除{count, number}项");
   P ("label.changes.sync_change_label.conflicts", "{count, number}个冲突");
   P ("label.changes.net_change_label",
      "{state, select, none {没有净变化} up {净增{count, number}项} "
      & "other {净减{count, number}项}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {没有要审阅的更改} all "
      & "{所有更改均已审阅} other {已审阅{reviewed, number}/{total, "
      & "number}项更改}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}未变，仍为{new_value}} up "
      & "{{field_name}从{old_value}增加到{new_value}} other "
      & "{{field_name}从{old_value}减少到{new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {没有可选择的行} none "
      & "{未选择任何行} all {已选择全部{total, number}行} other "
      & "{已选择{selected, number}/{total, number}行}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {没有页面} other {{pages, plural, =0 "
      & "{没有页面} other {{rows, plural, =0 {第{page, number}/{pages, "
      & "number}页} other {第{page, number}/{pages, number}页，{rows, "
      & "number}行}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {没有行} none {没有匹配的行} all "
      & "{显示全部{total, number}行} other {显示{visible, "
      & "number}/{total, number}行}}");
   P ("label.tables.row_range_label",
      "{state, select, none {没有行} single {第{first_row, "
      & "number}行，共{total, number}行} other {第{first_row, "
      & "number}-{last_row, number}行，共{total, number}行}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {没有字符限制} none_left "
      & "{没有剩余字符} left {剩余{count, number}个字符} other "
      & "{超出限制{count, number}个字符}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {没有必填字段} other {{missing, plural, =0 "
      & "{所有必填字段均已完成} other {{total, "
      & "number}个必填字段中缺少{missing, number}个}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {没有字段} all {所有字段均已完成} "
      & "other {已完成{completed, number}/{total, number}个字段}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}：没有字段} all "
      & "{{name}：所有字段均已完成} other "
      & "{{name}：已完成{completed, number}/{total, number}个字段}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {没有表单步骤} =1 {第1/1步：{name}} other "
      & "{第{current, number}/{total, number}步：{name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {没有面包屑} =1 {面包屑1/1：{name}} other "
      & "{面包屑{current, number}/{total, number}：{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {没有标签页} =1 {标签页1/1：{name}} other "
      & "{标签页{current, number}/{total, number}：{name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {收件箱为空} other {{unread, plural, =0 "
      & "{所有通知均已读} other {{total, number}条通知中有{unread, "
      & "number}条未读}}}}");
   P ("label.notifications.delivery_attempt_label", "第{attempt, number}/{max_attempts, number}次投递尝试");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {没有清单项目} other {已完成{done, "
      & "number}/{total, number}项}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {没有上传} other {已完成{done, "
      & "number}/{total, number}个上传}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {没有名额} other {已预订{reserved, "
      & "number}/{capacity, number}个座位}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {候补第{position, number}位} other "
      & "{候补第{position, number}/{total, number}位}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} 已更改{changed, "
      & "number}/{total, number}} other {{name}：{changed, "
      & "number}项已更改，{unchanged, number}项未变，共{total, "
      & "number}项}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}，{mood}，{accessibility}；{roles}");
   P ("label.groups", "{first}；{second}");
   P ("label.parts", "{first}，{second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "当前前景色满足大号文本对比度（{v1}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "当前前景色满足普通文本对比度（{v1}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "使用{v1}以达到增强文本对比度 {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "使用{v1}以达到大号文本对比度 {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "使用{v1}以达到普通文本对比度 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "使用{v1}以达到大号文本对比度 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "使用{v1}以达到增强文本对比度 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "当前前景色满足大号文本对比度（{v1, number}:{v2, "
      & "number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "当前前景色满足普通文本对比度（{v1, number}:{v2, "
      & "number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "当前前景色满足增强文本对比度（{v1}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "当前前景色满足增强文本对比度（{v1, number}:{v2, "
      & "number}）");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "红色盲：混淆风险低，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "绿色盲：混淆风险中等，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "蓝色盲：混淆风险中等，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "全色盲：混淆风险高，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76差值{v1}，感知差异极大");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94差值{v1}，感知差异极大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94（纺织）差值{v1}，感知差异极大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000差值{v1, number}，感知差异极大");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab差值{v1}，感知差异较大");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "红色盲：混淆风险中等，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94差值{v1, number}，感知差异极大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000差值{v1}，感知差异极大");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab差值{v1}，感知差异极大");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "全色盲：混淆风险低，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "红色盲：可区分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "绿色盲：可区分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "蓝色盲：可区分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "全色盲：可区分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "全色盲：混淆风险中等，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76差值{v1}，感知差异较大");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94差值{v1}，感知差异较大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94（纺织）差值{v1}，感知差异较大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000差值{v1}，感知差异较大");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab差值{v1}，感知差异明显");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "红色盲：混淆风险高，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "蓝色盲：混淆风险高，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94差值{v1}，感知差异明显");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94（纺织）差值{v1}，感知差异明显");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000差值{v1}，感知差异明显");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab差值{v1, number}，感知差异明显");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "蓝色盲：混淆风险低，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "绿色盲：混淆风险低，差值{v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab差值{v1, number}，感知差异较大");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "绿色盲：混淆风险高，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76差值{v1, number}，感知差异极大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94（纺织）差值{v1, number}，感知差异极大");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab差值{v1, number}，感知差异极大");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76差值{v1, number}，感知差异较大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94（纺织）差值{v1, number}，感知差异较大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000差值{v1, number}，感知差异较大");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76差值{v1}，感知差异明显");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94（纺织）差值{v1}，感知差异细微");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000差值{v1, number}，感知差异明显");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94（纺织）差值{v1, number}，感知差异明显");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76差值{v1}，几乎无法察觉");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94差值{v1}，无法察觉");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94（纺织）差值{v1}，无法察觉");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000差值{v1}，无法察觉");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab差值{v1}，无法察觉");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94差值{v1, number}，感知差异较大");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76差值{v1, number}，无法察觉");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94差值{v1, number}，无法察觉");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94（纺织）差值{v1, number}，无法察觉");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000差值{v1, number}，无法察觉");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab差值{v1, number}，无法察觉");
end Labels_2;
