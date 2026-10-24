separate (Humanize.Catalogs.Phrase_Data.Locale_Zh_Hant)
procedure Labels_2 is
begin
   P ("label.notifications.event_count_label",
      "{count, plural, =0 {{event, select, mention_event {沒有提及} "
      & "reply_event {沒有回覆} assignment_event {沒有指派} "
      & "approval_event {沒有核准要求} alert_event {沒有警示} "
      & "digest_event {沒有摘要} reminder_event {沒有提醒} other "
      & "{沒有系統通知}}} other {{event, select, mention_event {{count, "
      & "number}次提及} reply_event {{count, number}則回覆} "
      & "assignment_event {{count, number}項指派} approval_event {{count, "
      & "number}個核准要求} alert_event {{count, number}則警示} "
      & "digest_event {{count, number}份摘要} reminder_event {{count, "
      & "number}則提醒} other {{count, number}則系統通知}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {將通知標為已讀} other {將{count, "
      & "number}則通知標為已讀}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {將通知標為未讀} other {將{count, "
      & "number}則通知標為未讀}}");
   P ("label.notifications.muted_label", "{name}通知已靜音");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {新提及} reply_event {新回覆} "
      & "assignment_event {新指派} approval_event {新核准要求} "
      & "alert_event {新警示} digest_event {新摘要} reminder_event "
      & "{新提醒} other {新系統通知}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {應用程式內通知} email_channel "
      & "{電子郵件通知} sms_channel {簡訊通知} push_channel "
      & "{推播通知} webhook_channel {Webhook 通知} other {摘要通知}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {沒有通知} other {{count, number}則通知}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {提及} reply_event {回覆} "
      & "assignment_event {指派} approval_event {核准要求} alert_event "
      & "{警示} digest_event {摘要} reminder_event {提醒} other "
      & "{系統通知}}");
   P ("label.notifications.notification_group_label",
      "{name}：{count, plural, =0 {沒有通知} other {{count, "
      & "number}則通知}}");
   P ("label.notifications.notification_label",
      "{subject}{event, select, mention_event {提及} reply_event {回覆} "
      & "assignment_event {指派} approval_event {核准要求} alert_event "
      & "{警示} digest_event {摘要} reminder_event {提醒} other "
      & "{系統通知}}：{state, select, unread_state {未讀} read_state "
      & "{已讀} archived_state {已封存} muted_state {已靜音} "
      & "snoozed_state {已延後} other {已抑制}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {未讀通知} read_state {已讀通知} "
      & "archived_state {已封存通知} muted_state {已靜音通知} "
      & "snoozed_state {已延後通知} other {已抑制通知}}");
   P ("label.notifications.snoozed_label", "{name}通知已延後");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {沒有通知遭到抑制} other {已抑制{count, "
      & "number}則通知}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {沒有未讀通知} other {{count, "
      & "number}則未讀通知}}");
   P ("label.payments.amount_label", "金額：{amount_text}");
   P ("label.payments.balance_label", "餘額：{amount_text}");
   P ("label.payments.chargeback_label", "退單：{amount_text}");
   P ("label.payments.discount_label", "折扣：{amount_text}");
   P ("label.payments.due_label", "{amount_text}，{due_text}到期");
   P ("label.payments.invoice_count_label", "{count, plural, =0 {沒有發票} other {{count, number}張發票}}");
   P ("label.payments.invoice_label",
      "發票{number}：{state, select, draft_invoice {草稿} open_invoice "
      & "{未付款} paid_invoice {已付款} overdue_invoice {逾期} other "
      & "{已作廢}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {草稿發票} open_invoice "
      & "{未付款發票} paid_invoice {已付款發票} overdue_invoice "
      & "{逾期發票} other {已作廢發票}}");
   P ("label.payments.method_label",
      "{method, select, card_method {刷卡付款} bank_transfer_method "
      & "{銀行轉帳付款} cash_method {現金付款} wallet_method "
      & "{電子錢包付款} check_method {支票付款} other "
      & "{其他方式付款}}：{detail}");
   P ("label.payments.paid_label", "{amount_text}，已於{paid_text}付款");
   P ("label.payments.payment_count_label", "{count, plural, =0 {沒有付款} other {{count, number}筆付款}}");
   P ("label.payments.payment_label",
      "{amount_text}付款：{state, select, pending_payment {待處理} "
      & "authorized_payment {已授權} paid_payment {已完成} failed_payment "
      & "{失敗} refunded_payment {已退款} other {已取消}}");
   P ("label.payments.payment_link_label", "{name}付款連結");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {信用卡} bank_transfer_method "
      & "{銀行轉帳} cash_method {現金} wallet_method {電子錢包} "
      & "check_method {支票} other {其他}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {待處理的付款} "
      & "authorized_payment {已授權的付款} paid_payment "
      & "{已完成的付款} failed_payment {失敗的付款} refunded_payment "
      & "{已退款的付款} other {已取消的付款}}");
   P ("label.payments.receipt_label", "收據{number}");
   P ("label.payments.refund_label",
      "{amount_text}退款：{state, select, pending_payment {待處理} "
      & "authorized_payment {已授權} paid_payment {已完成} failed_payment "
      & "{失敗} refunded_payment {已完成} other {已取消}}");
   P ("label.payments.subtotal_label", "小計：{amount_text}");
   P ("label.payments.tax_label", "稅額：{amount_text}");
   P ("label.payments.total_label", "總計：{amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}的存取權到期時間：{time_text}");
   P ("label.permissions.grant_label",
      "已授予{subject}{role, select, owner_role {擁有者} admin_role "
      & "{管理員} editor_role {編輯者} viewer_role {檢視者} other "
      & "{自訂}}角色");
   P ("label.permissions.permission_label",
      "{subject}的{action}權限：{state, select, granted {已授予} "
      & "denied {已拒絕} inherited {已繼承} temporary {臨時存取} "
      & "expired {已過期} other {需要核准}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {已授予} denied {已拒絕} inherited "
      & "{已繼承} temporary {臨時存取} expired {已過期} other "
      & "{需要核准}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {政策允許} policy_denied "
      & "{政策拒絕} policy_warning {政策警告} other {政策不適用}}");
   P ("label.permissions.revoke_label",
      "已撤銷{subject}的{role, select, owner_role {擁有者} admin_role "
      & "{管理員} editor_role {編輯者} viewer_role {檢視者} other "
      & "{自訂}}角色");
   P ("label.permissions.role_label",
      "{role, select, owner_role {擁有者} admin_role {管理員} "
      & "editor_role {編輯者} viewer_role {檢視者} other {自訂角色}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {空} low_utilization {使用率低} "
      & "normal_utilization {使用率正常} high_utilization {使用率高} "
      & "critical_utilization {使用率危急} full_utilization {已滿} other "
      & "{超出上限}}");
   P ("label.schema.array_shape_label",
      "{element_type, select, string_field {字串} integer_field {整數} "
      & "decimal_field {小數} boolean_field {布林值} date_field {日期} "
      & "date_time_field {日期時間} object_field {物件} array_field "
      & "{陣列} enum_field {列舉} binary_field {二進位} null_field {null "
      & "} any_field {任意值} other {不明}}陣列{count_known, select, "
      & "false {} other {（{count, number}項）}}");
   P ("label.schema.constraint_label", "{name}限制條件：{value}");
   P ("label.schema.default_value_label", "欄位{field_name}預設為{value}");
   P ("label.schema.deprecated_field_label", "欄位{name}已淘汰，請改用{replacement}");
   P ("label.schema.enum_options_label", "{count, number}個列舉選項");
   P ("label.schema.example_value_label", "欄位{field_name}範例：{value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {一般欄位} deprecated_field "
      & "{已淘汰欄位} unknown_field {不明欄位} read_only_field "
      & "{唯讀欄位} write_only_field {唯寫欄位} other {計算欄位}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {字串欄位} integer_field "
      & "{整數欄位} decimal_field {小數欄位} boolean_field "
      & "{布林欄位} date_field {日期欄位} date_time_field "
      & "{日期時間欄位} object_field {物件欄位} array_field "
      & "{陣列欄位} enum_field {列舉欄位} binary_field "
      & "{二進位欄位} null_field {null 欄位} any_field "
      & "{任意類型欄位} other {不明類型欄位}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {沒有缺少必填欄位} other {缺少{count, "
      & "number}個必填欄位}}");
   P ("label.schema.object_shape_label",
      "物件（{fields, number}個欄位{required, plural, =0 {} other "
      & "{，{required, number}個必填}}{optional, plural, =0 {} other "
      & "{，{optional, number}個選填}}）");
   P ("label.schema.schema_source_label", "結構描述{name}，版本{version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {純量值} object_shape {物件{count, "
      & "plural, =0 {} other {（{count, number}個欄位）}}} array_shape "
      & "{陣列{count, plural, =0 {} other {（{count, number}項）}}} "
      & "map_shape {對應表{count, plural, =0 {} other {（{count, "
      & "number}個項目）}}} tuple_shape {元組{count, plural, =0 {} other "
      & "{（{count, number}項）}}} union_shape {聯集類型{count, plural, "
      & "=0 {} other {（{count, number}種類型）}}} empty_shape {空形狀} "
      & "other {不明形狀}}");
   P ("label.schema.unknown_field_label", "不明欄位{name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {沒有套用中的篩選條件} other {{count, "
      & "number}個套用中的篩選條件}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {清除篩選條件} other {清除{count, "
      & "number}個套用中的篩選條件}}");
   P ("label.search.facet_label", "{name}分類面向，{count, number}個選項");
   P ("label.search.facet_value_label",
      "{name}，{count, plural, =0 {沒有結果} other {{count, "
      & "number}個結果}}{selected, select, false {} other {，已選取}}");
   P ("label.search.filter_label",
      "{name}：{value}（{state, select, active_filter "
      & "{套用中的篩選條件} inactive_filter {未套用的篩選條件} "
      & "other {排除篩選條件}}）");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {套用中的篩選條件} "
      & "inactive_filter {未套用的篩選條件} other {排除篩選條件}}");
   P ("label.search.no_results_label", "沒有「{query}」的結果");
   P ("label.search.recent_search_label", "最近的搜尋：「{query}」");
   P ("label.search.saved_search_label",
      "已儲存的搜尋：{name}{count, plural, =0 {} other {，{count, "
      & "number}個結果}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {沒有最近的搜尋} other {{count, "
      & "number}筆最近的搜尋}}");
   P ("label.search.search_query_label", "搜尋「{query}」");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {沒有結果} other {{count, number}個結果}}");
   P ("label.search.search_result_summary_label",
      "「{query}」的結果：{count, plural, =0 {無} other {{count, "
      & "number}個}}");
   P ("label.search.search_scope_label",
      "{name}範圍：{count, plural, =0 {沒有結果} other {{count, "
      & "number}個結果}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {搜尋閒置} searching_search "
      & "{正在搜尋} complete_search {搜尋完成} empty_search "
      & "{沒有搜尋結果} other {搜尋失敗}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {依關聯性排序} ascending_sort "
      & "{依遞增排序} descending_sort {依遞減排序} newest_first_sort "
      & "{依最新優先排序} other {依最舊優先排序}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {關聯性} ascending_sort {遞增} "
      & "descending_sort {遞減} newest_first_sort {最新優先} other "
      & "{最舊優先}}");
   P ("label.search.suggestion_label", "您是不是要找「{query}」？");
   P ("label.secrets.credential_source_label", "來自{source}的{count, number}個憑證");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {值已隱藏} masked_value "
      & "{值已遮罩} suffix_only {僅顯示後綴} other {僅顯示指紋}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {公開} support_profile {支援} "
      & "audit_profile {稽核} other {偵錯}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {不需輪替} other "
      & "{需要輪替}}{days_old, plural, =0 {} other {，已存在{days_old, "
      & "number}天}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API 金鑰} live_api_key {正式環境 API "
      & "金鑰} test_api_key {測試 API 金鑰} github_token {GitHub 權杖} "
      & "aws_access_key {AWS 存取金鑰} google_api_key {Google API 金鑰} "
      & "slack_token {Slack 權杖} npm_token {npm 權杖} bearer_token {Bearer "
      & "權杖} jwt_token {JWT 權杖} basic_auth_credential "
      & "{基本驗證憑證} password_secret {密碼} private_key "
      & "{私密金鑰} ssh_private_key {SSH 私密金鑰} webhook_secret "
      & "{Webhook 密鑰} oauth_token {OAuth 權杖} database_url_secret "
      & "{資料庫 URL} sha1_fingerprint {SHA-1 指紋} sha256_fingerprint "
      & "{SHA-256 指紋} other {機密}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {電子郵件} phone_value {電話號碼} "
      & "url_value {URL} ip_address_value {IP 位址} token_value {權杖} "
      & "file_path_value {檔案路徑} account_id_value {帳戶 ID} "
      & "payment_reference_value {付款參考編號} log_field_value "
      & "{記錄欄位} other {敏感值}}");
   P ("label.tables.cell_label",
      "第{row, number}列第{column, number}欄：{state, select, empty_cell "
      & "{空白} edited_cell {已編輯} invalid_cell {無效} "
      & "highlighted_cell {已醒目提示} other {唯讀}}");
   P ("label.tables.cell_position_label", "第{row, number}列第{column, number}欄");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {空白儲存格} edited_cell "
      & "{已編輯的儲存格} invalid_cell {無效的儲存格} "
      & "highlighted_cell {醒目提示的儲存格} other {唯讀儲存格}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {沒有欄} other {{count, number}欄}}");
   P ("label.tables.column_label",
      "{name}（{role, select, text_column {文字欄} number_column "
      & "{數字欄} date_column {日期欄} status_column {狀態欄} "
      & "action_column {動作欄} other {隱藏欄}}）");
   P ("label.tables.column_role_label",
      "{role, select, text_column {文字欄} number_column {數字欄} "
      & "date_column {日期欄} status_column {狀態欄} action_column "
      & "{動作欄} other {隱藏欄}}");
   P ("label.tables.group_label", "{name}：{count, number}列");
   P ("label.tables.row_count_label", "{count, plural, =0 {沒有列} other {{count, number}列}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {未排序} ascending_sort {遞增} other "
      & "{遞減}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {未排序} ascending_sort "
      & "{已依{column_name}遞增排序} other "
      & "{已依{column_name}遞減排序}}");
   P ("label.tables.subtotal_label", "{name}小計：{value}");
   P ("label.tables.table_size_label", "{rows, number}列×{columns, number}欄");
   P ("label.tasks.assignment_label",
      "{assignee}：{state, select, unassigned {已取消指派} assigned "
      & "{已指派} reassigned {已重新指派} watching {正在關注} other "
      & "{工作負責人}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {未指派} assigned {已指派} reassigned "
      & "{已重新指派} watching {正在關注} other {工作負責人}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {待辦清單為空} other {待辦清單：{count, "
      & "number}項工作}}");
   P ("label.tasks.blocker_label", "被{name}封鎖");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {完成工作} other {完成{count, "
      & "number}項工作}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {沒有已完成的工作} other {{count, "
      & "number}項已完成的工作}}");
   P ("label.tasks.due_label", "截止：{due_text}");
   P ("label.tasks.estimate_label", "預估：{estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {沒有未完成的工作} other {{count, "
      & "number}項未完成的工作}}");
   P ("label.tasks.overdue_label", "自{due_text}起已逾期");
   P ("label.tasks.recurring_task_label", "重複：{schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {重新開啟工作} other {重新開啟{count, "
      & "number}項工作}}");
   P ("label.tasks.sprint_label", "{name}：{count, number}項工作");
   P ("label.tasks.subtask_label", "{name}：{count, number}項子工作");
   P ("label.tasks.task_count_label", "{count, plural, =0 {沒有工作} other {{count, number}項工作}}");
   P ("label.tasks.task_label",
      "{name}：{state, select, open_task {未開始的工作} "
      & "in_progress_task {進行中的工作} blocked_task {受阻的工作} "
      & "done_task {已完成的工作} canceled_task {已取消的工作} "
      & "deferred_task {已延後的工作} other "
      & "{已逾期的工作}}{priority, select, no_priority {} low_priority "
      & "{，低優先順序} medium_priority {，中優先順序} "
      & "high_priority {，高優先順序} other {，緊急優先順序}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {無優先順序} low_priority "
      & "{低優先順序} medium_priority {中優先順序} high_priority "
      & "{高優先順序} other {緊急優先順序}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {未開始的工作} in_progress_task "
      & "{進行中的工作} blocked_task {受阻的工作} done_task "
      & "{已完成的工作} canceled_task {已取消的工作} deferred_task "
      & "{已延後的工作} other {已逾期的工作}}");
   P ("label.thresholds.threshold_direction_label", "{direction, select, upper_limit {上限} other {下限}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {低於預期範圍} within_range "
      & "{在預期範圍內} above_range {高於預期範圍} below_target "
      & "{低於目標} at_target {達到目標} above_target {高於目標} "
      & "near_limit {接近限制} warning_level {警告閾值} critical_level "
      & "{嚴重閾值} breached {已超出閾值} other {閾值狀態不明}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {已是最新} other "
      & "{領先{ahead, number}個提交}}} other {{ahead, plural, =0 "
      & "{落後{behind, number}個提交} other {領先{ahead, "
      & "number}個提交，落後{behind, number}個提交}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {已由{approver}核准} other "
      & "{等待{approver}核准}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {第1次嘗試，共1次} "
      & "other {第{attempt, number}次嘗試，已超過1次的上限}}} other "
      & "{第{attempt, number}次嘗試，共{limit, number}次}}");
   P ("label.workflows.blocker_label", "受阻：{reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {沒有造成阻礙的相依項目} other {{count, "
      & "number}個造成阻礙的相依項目}}");
   P ("label.workflows.handoff_label", "從{from}移交給{to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {即將到來的里程碑} "
      & "current_milestone {目前的里程碑} complete_milestone "
      & "{已完成的里程碑} missed_milestone {已錯過的里程碑} other "
      & "{受阻的里程碑}}");
   P ("label.workflows.milestone_status_label",
      "{name}：{state, select, upcoming_milestone {即將到來} "
      & "current_milestone {目前} complete_milestone {已完成} "
      & "missed_milestone {已錯過} other {受阻}}");
   P ("label.workflows.next_action_label", "下一步：{action}");
   P ("label.workflows.owner_label", "負責人：{owner}");
   P ("label.workflows.resume_label", "繼續{name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {待處理} active_step {進行中} "
      & "waiting_step {等待中} blocked_step {受阻} done_step {已完成} "
      & "failed_step {失敗} other {已略過}}");
   P ("label.workflows.step_status_label",
      "{name}：{state, select, pending_step {待處理} active_step "
      & "{進行中} waiting_step {等待中} blocked_step {受阻} done_step "
      & "{已完成} failed_step {失敗} other {已略過}}");
   P ("label.workflows.waiting_label", "正在等待{reason}");
   P ("label.workflows.workflow_result_label",
      "{name}：{state, select, not_started_state {未開始} "
      & "in_progress_state {進行中} waiting_state {等待中} "
      & "waiting_approval_state {等待核准} blocked_state {受阻} "
      & "completed_state {已完成} failed_state {失敗} cancelled_state "
      & "{已取消} skipped_state {已略過} other {已暫停}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {未開始} in_progress_state "
      & "{進行中} waiting_state {等待中} waiting_approval_state "
      & "{等待核准} blocked_state {受阻} completed_state {已完成} "
      & "failed_state {失敗} cancelled_state {已取消} skipped_state "
      & "{已略過} other {已暫停}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {透明} mostly_transparent "
      & "{大致透明} translucent {半透明} mostly_opaque {大致不透明} "
      & "other {不透明}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {沒有觀測值} other {{count, "
      & "number}個觀測值，最小值{minimum} {unit}，中位數{median} "
      & "{unit}，最大值{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}，p95 {p95} {unit}，p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {沒有觀測值} other "
      & "{{total, number}個觀測值中有0個離群值}}} other {{total, "
      & "number}個觀測值中有{outliers, number}個離群值}}");
   P ("label.resources.remaining_label",
      "{state, select, over {超出容量{count, number} {unit}} other "
      & "{剩餘{count, number}/{total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {配額超出{count, number} "
      & "{unit}（已使用{percent}）} near "
      & "{配額接近上限：剩餘{count, number} "
      & "{unit}（已使用{percent}）} other {配額可用：剩餘{count, "
      & "number} {unit}（已使用{percent}）}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {無法取得快取命中率：沒有要求} "
      & "other {快取命中率{percent}：命中{hits, "
      & "number}次，未命中{misses, number}次}}");
   P ("label.markup.attribute_count_label.total", "{count, number}個屬性");
   P ("label.markup.attribute_count_label.data", "{count, number}個data屬性");
   P ("label.markup.attribute_count_label.aria", "{count, number}個ARIA屬性");
   P ("label.markup.attribute_count_label.events", "{count, number}個事件處理常式");
   P ("label.markup.heading_label", "第{level, number}級標題");
   P ("label.markup.tag_count_label.total", "{count, number}個標籤");
   P ("label.markup.tag_count_label.links", "{count, number}個連結");
   P ("label.markup.tag_count_label.media", "{count, number}個媒體元素");
   P ("label.markup.tag_count_label.forms", "{count, number}個表單控制項");
   P ("label.markup.document_outline_label.headings", "{count, number}個標題");
   P ("label.markup.document_outline_label.landmarks", "{count, number}個地標");
   P ("label.markup.document_outline_label.forms", "{count, number}個表單");
   P ("label.markup.document_outline_label.media", "{count, number}個媒體元素");
   P ("label.markup.table_navigation_label",
      "{caption}，第{row, number}/{rows, number}列，第{column, "
      & "number}/{columns, number}欄");
   P ("label.secrets.secret_count_label.total", "{count, number}項機密");
   P ("label.secrets.secret_count_label.masked", "{count, number}項已遮罩");
   P ("label.secrets.secret_count_label.unset", "{count, number}項未設定");
   P ("label.secrets.secret_count_label.fingerprints", "{count, number}個指紋");
   P ("label.schema.type_mismatch_label",
      "欄位{field_name}應為{expected, select, string_field {字串} "
      & "integer_field {整數} decimal_field {小數} boolean_field "
      & "{布林值} date_field {日期} date_time_field {日期時間} "
      & "object_field {物件} array_field {陣列} enum_field {列舉} "
      & "binary_field {二進位} null_field {null} any_field {任意值} other "
      & "{不明}}，實際為{actual, select, string_field {字串} "
      & "integer_field {整數} decimal_field {小數} boolean_field "
      & "{布林值} date_field {日期} date_time_field {日期時間} "
      & "object_field {物件} array_field {陣列} enum_field {列舉} "
      & "binary_field {二進位} null_field {null} any_field {任意值} other "
      & "{不明}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, number}個阻礙問題} "
      & "blocking {{base}，{blocking, number}個阻礙問題} only {僅{base}} "
      & "other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {目標範圍{low}至{high}} "
      & "other {目標區間{low}至{high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value}，在預期範圍內} below "
      & "{{value}，低於預期範圍} other {{value}，高於預期範圍}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value}，達到嚴重門檻} warning "
      & "{{value}，達到警告門檻} other {{value}，在正常範圍內}}");
   P ("label.thresholds.breach_label", "{state, select, ok {未超出} other {超出{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {達到目標} below {低於目標{difference}} "
      & "other {高於目標{difference}}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {已超出上限} near "
      & "{接近上限，剩餘{distance}} other {距上限{distance}}}");
   P ("label.thresholds.threshold_summary_label.none", "沒有指標");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number}個正常");
   P ("label.thresholds.threshold_summary_label.warnings", "{count, number}個警告");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number}個嚴重");
   P ("label.thresholds.threshold_summary_label.breaches", "{count, number}次超出");
   P ("label.thresholds.target_window_label", "目標{target} ±{tolerance}");
   P ("label.thresholds.tolerance_label", "容許誤差{tolerance}");
   P ("label.thresholds.percent_of_limit_label", "上限的{percent}");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {超出上限{amount}} other "
      & "{剩餘{amount}}}");
   P ("label.thresholds.budget_used_label", "已使用{used}，預算{budget}");
   P ("label.workflows.step_label", "第{current, number}/{total, number}步：{name}");
   P ("label.workflows.milestone_label", "已完成{current, number}/{total, number}個里程碑：{name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {沒有工作流程項目} half "
      & "{工作流程已完成一半} other {已完成{completed, "
      & "number}/{total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {佇列位置{position, number}} other "
      & "{佇列位置{position, number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "沒有變更");
   P ("label.changes.change_set_label.added", "新增{count, number}項");
   P ("label.changes.change_set_label.removed", "移除{count, number}項");
   P ("label.changes.change_set_label.modified", "變更{count, number}項");
   P ("label.changes.change_set_label.unchanged", "{count, number}項未變");
   P ("label.changes.sync_change_label.none", "沒有同步變更");
   P ("label.changes.sync_change_label.uploaded", "上傳{count, number}項");
   P ("label.changes.sync_change_label.downloaded", "下載{count, number}項");
   P ("label.changes.sync_change_label.deleted", "刪除{count, number}項");
   P ("label.changes.sync_change_label.conflicts", "{count, number}個衝突");
   P ("label.changes.net_change_label",
      "{state, select, none {沒有淨變化} up {淨增{count, number}項} "
      & "other {淨減{count, number}項}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {沒有要審查的變更} all "
      & "{所有變更皆已審查} other {已審查{reviewed, number}/{total, "
      & "number}項變更}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}未變更，仍為{new_value}} up "
      & "{{field_name}從{old_value}增加到{new_value}} other "
      & "{{field_name}從{old_value}減少到{new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {沒有可選取的列} none "
      & "{未選取任何列} all {已選取全部{total, number}列} other "
      & "{已選取{selected, number}/{total, number}列}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {沒有頁面} other {{pages, plural, =0 "
      & "{沒有頁面} other {{rows, plural, =0 {第{page, number}/{pages, "
      & "number}頁} other {第{page, number}/{pages, number}頁，{rows, "
      & "number}列}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {沒有列} none {沒有相符的列} all "
      & "{顯示全部{total, number}列} other {顯示{visible, "
      & "number}/{total, number}列}}");
   P ("label.tables.row_range_label",
      "{state, select, none {沒有列} single {第{first_row, "
      & "number}列，共{total, number}列} other {第{first_row, "
      & "number}-{last_row, number}列，共{total, number}列}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {沒有字元限制} none_left "
      & "{沒有剩餘字元} left {剩餘{count, number}個字元} other "
      & "{超出限制{count, number}個字元}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {沒有必填欄位} other {{missing, plural, =0 "
      & "{所有必填欄位皆已完成} other {{total, "
      & "number}個必填欄位中缺少{missing, number}個}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {沒有欄位} all {所有欄位皆已完成} "
      & "other {已完成{completed, number}/{total, number}個欄位}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}：沒有欄位} all "
      & "{{name}：所有欄位皆已完成} other "
      & "{{name}：已完成{completed, number}/{total, number}個欄位}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {沒有表單步驟} =1 {第1/1步：{name}} other "
      & "{第{current, number}/{total, number}步：{name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {沒有導覽路徑} =1 {導覽路徑1/1：{name}} "
      & "other {導覽路徑{current, number}/{total, number}：{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {沒有分頁} =1 {分頁1/1：{name}} other "
      & "{分頁{current, number}/{total, number}：{name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {收件匣是空的} other {{unread, plural, =0 "
      & "{所有通知皆已讀} other {{total, number}則通知中有{unread, "
      & "number}則未讀}}}}");
   P ("label.notifications.delivery_attempt_label", "第{attempt, number}/{max_attempts, number}次傳送嘗試");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {沒有檢查清單項目} other {已完成{done, "
      & "number}/{total, number}個項目}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {沒有上傳} other {已完成{done, "
      & "number}/{total, number}個上傳}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {沒有名額} other {已預訂{reserved, "
      & "number}/{capacity, number}個座位}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {候補第{position, number}位} other "
      & "{候補第{position, number}/{total, number}位}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} 已變更{changed, "
      & "number}/{total, number}} other {{name}：{changed, "
      & "number}項已變更，{unchanged, number}項未變，共{total, "
      & "number}項}}");
   P ("label.names.color_description", "{brightness}，{saturation}的{hue}，{temperature}，{chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness}、{chroma}、{temperature}的{base, select, pink "
      & "{粉紅色} other {{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}，{mood}，{accessibility}；{roles}");
   P ("label.groups", "{first}；{second}");
   P ("label.parts", "{first}，{second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "目前前景色符合大型文字對比（{v1}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "目前前景色符合一般文字對比（{v1}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "使用{v1}以達到增強文字對比 {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "使用{v1}以達到大型文字對比 {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "使用{v1}以達到一般文字對比 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "使用{v1}以達到大型文字對比 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "使用{v1}以達到增強文字對比 {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "目前前景色符合大型文字對比（{v1, number}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "目前前景色符合一般文字對比（{v1, number}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "目前前景色符合增強文字對比（{v1}:{v2, number}）");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "目前前景色符合增強文字對比（{v1, number}:{v2, number}）");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "紅色盲：混淆風險低，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "綠色盲：混淆風險中等，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "藍色盲：混淆風險中等，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "全色盲：混淆風險高，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76差值{v1}，感知差異極大");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94差值{v1}，感知差異極大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94（紡織）差值{v1}，感知差異極大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000差值{v1, number}，感知差異極大");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab差值{v1}，感知差異較大");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "紅色盲：混淆風險中等，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94差值{v1, number}，感知差異極大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000差值{v1}，感知差異極大");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab差值{v1}，感知差異極大");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "全色盲：混淆風險低，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "紅色盲：可區分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "綠色盲：可區分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "藍色盲：可區分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "全色盲：可區分，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "全色盲：混淆風險中等，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76差值{v1}，感知差異較大");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94差值{v1}，感知差異較大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94（紡織）差值{v1}，感知差異較大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000差值{v1}，感知差異較大");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab差值{v1}，感知差異明顯");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "紅色盲：混淆風險高，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "藍色盲：混淆風險高，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94差值{v1}，感知差異明顯");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94（紡織）差值{v1}，感知差異明顯");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000差值{v1}，感知差異明顯");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab差值{v1, number}，感知差異明顯");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "藍色盲：混淆風險低，差值{v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "綠色盲：混淆風險低，差值{v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab差值{v1, number}，感知差異較大");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "綠色盲：混淆風險高，差值{v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76差值{v1, number}，感知差異極大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94（紡織）差值{v1, number}，感知差異極大");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab差值{v1, number}，感知差異極大");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76差值{v1, number}，感知差異較大");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94（紡織）差值{v1, number}，感知差異較大");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000差值{v1, number}，感知差異較大");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76差值{v1}，感知差異明顯");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94（紡織）差值{v1}，感知差異細微");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000差值{v1, number}，感知差異明顯");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94（紡織）差值{v1, number}，感知差異明顯");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76差值{v1}，幾乎無法察覺");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94差值{v1}，無法察覺");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94（紡織）差值{v1}，無法察覺");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000差值{v1}，無法察覺");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab差值{v1}，無法察覺");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94差值{v1, number}，感知差異較大");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76差值{v1, number}，無法察覺");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94差值{v1, number}，無法察覺");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94（紡織）差值{v1, number}，無法察覺");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000差值{v1, number}，無法察覺");
end Labels_2;
