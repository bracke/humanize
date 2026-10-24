separate (Humanize.Catalogs.Phrase_Data.Locale_Zh_Hant_Hk)
procedure Labels_1 is
begin
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {低優先次序徽章} "
      & "medium_priority {中優先次序徽章} high_priority "
      & "{高優先次序徽章} other {緊急優先次序徽章}}");
   P ("label.badges.priority_badge_label",
      "{name}：{priority, select, low_priority {低優先次序徽章} "
      & "medium_priority {中優先次序徽章} high_priority "
      & "{高優先次序徽章} other {緊急優先次序徽章}}");
   P ("label.builds.coverage_label", "覆蓋率：{percent_text}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {網域主機} ipv4_host {IPv4地址} "
      & "ipv6_host {IPv6地址} localhost_host {本機} private_network_host "
      & "{私人網絡地址} other {不明主機}}");
   P ("label.events.check_in_label", "簽到{name}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {未開始} editing_form {編輯中} "
      & "dirty_form {有未儲存的變更} saving_form {儲存中} saved_form "
      & "{已儲存} submitted_form {已提交} other {提交失敗}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {未開始} editing_form {編輯中} "
      & "dirty_form {有未儲存的變更} saving_form {正在儲存表單} "
      & "saved_form {表單已儲存} submitted_form {表單已提交} other "
      & "{{errors, plural, =0 {提交失敗} other {提交失敗，{errors, "
      & "number}個錯誤}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {橫幅地標} navigation_role "
      & "{導覽地標} main_role {主要地標} complementary_role "
      & "{補充地標} contentinfo_role {內容資訊地標} search_role "
      & "{搜尋地標} form_role {表單地標} region_role {區域地標} "
      & "dialog_role {對話框} alert_role {警示即時區域} status_role "
      & "{狀態即時區域} other {不明地標}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {文字內容} html_content {HTML內容} "
      & "json_content {JSON內容} xml_content {XML內容} image_content "
      & "{圖片內容} audio_content {音訊內容} video_content "
      & "{影片內容} font_content {字體內容} archive_content "
      & "{壓縮檔內容} binary_content {二進位內容} form_content "
      & "{表單內容} other {不明內容}}");
   P ("label.moderation.report_label",
      "{item}舉報：{state, select, open_report {未處理} triaged_report "
      & "{已分類} actioned_report {已處理} dismissed_report {已駁回} "
      & "appealed_report {已申訴} other {已關閉}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {未處理的舉報} triaged_report "
      & "{已分類的舉報} actioned_report {已處理} dismissed_report "
      & "{已駁回的舉報} appealed_report {已申訴的舉報} other "
      & "{已關閉的舉報}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {連結} menu_item {選單項目} tab_item "
      & "{標籤頁} breadcrumb_item {導覽路徑} section_item {區段} other "
      & "{分隔線}}");
   P ("label.navigation.navigation_item_label",
      "{name}{kind, select, link_item {連結} menu_item {選單項目} "
      & "tab_item {標籤頁} breadcrumb_item {導覽路徑} section_item "
      & "{區段} other {分隔線}}：{state, select, current_item {目前} "
      & "active_item {作用中} inactive_item {非作用中} disabled_item "
      & "{已停用} expanded_item {已展開} collapsed_item {已摺疊} "
      & "visited_item {已造訪} other {外部}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor}提及了你} reply_event "
      & "{{actor}已回覆} assignment_event {{actor}指派了工作給你} "
      & "approval_event {{actor}要求核准} alert_event "
      & "{{actor}傳送了警示} digest_event {{actor}傳送了摘要} "
      & "reminder_event {{actor}傳送了提醒} other "
      & "{{actor}傳送了系統通知}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {應用程式內通知} email_channel "
      & "{電郵通知} sms_channel {短訊通知} push_channel {推送通知} "
      & "webhook_channel {Webhook 通知} other {摘要通知}}：{state, "
      & "select, pending_delivery {待傳送} sent_delivery {已傳送} "
      & "delivered_delivery {已送達} failed_delivery {失敗} "
      & "retrying_delivery {重試中} other {已取消}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {應用程式內通知} email_channel "
      & "{電郵通知} sms_channel {短訊通知} push_channel {推送通知} "
      & "webhook_channel {Webhook 通知} other {摘要通知}}");
   P ("label.search.suggestion_label", "你是不是要找「{query}」？");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {公開} support_profile {支援} "
      & "audit_profile {審計} other {除錯}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {電郵} phone_value {電話號碼} "
      & "url_value {URL} ip_address_value {IP 地址} token_value {權杖} "
      & "file_path_value {檔案路徑} account_id_value {帳戶 ID} "
      & "payment_reference_value {付款參考編號} log_field_value "
      & "{記錄欄位} other {敏感值}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {待辦事項列表為空} other "
      & "{待辦事項列表：{count, number}項工作}}");
   P ("label.tasks.task_label",
      "{name}：{state, select, open_task {待處理的工作} "
      & "in_progress_task {進行中的工作} blocked_task {受阻的工作} "
      & "done_task {已完成的工作} canceled_task {已取消的工作} "
      & "deferred_task {已延後的工作} other "
      & "{已逾期的工作}}{priority, select, no_priority {} low_priority "
      & "{，低優先次序} medium_priority {，中優先次序} "
      & "high_priority {，高優先次序} other {，緊急優先次序}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {無優先次序} low_priority "
      & "{低優先次序} medium_priority {中優先次序} high_priority "
      & "{高優先次序} other {緊急優先次序}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {沒有標籤頁} =1 {標籤頁1/1：{name}} other "
      & "{標籤頁{current, number}/{total, number}：{name}}}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {沒有檢查表項目} other {已完成{done, "
      & "number}/{total, number}個項目}}");
   P ("label.names.nearest_color_name.lime", "青檸綠");
   P ("label.names.hue_family_label.orange", "橙色");
   P ("label.names.nearest_color_name.orange", "橙色");
   P ("label.palettes.palette_summary.mostly_lime", "以青檸綠為主");
   P ("label.palettes.palette_summary.mostly_orange", "以橙色為主");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {空白電郵} address {電郵地址} other "
      & "{{domain}的電郵}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {用戶名稱} other {用戶名稱{shown}}}");
   P ("label.endpoints.ip_address_label",
      "{address}：{kind, select, ipv4_host {公用IPv4地址} ipv6_host "
      & "{公用IPv6地址} private_network_host {私人網絡地址} "
      & "localhost_host {本機} other {不是IP地址}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}：無效的CIDR} other "
      & "{{cidr}：{kind}網絡，前置碼{prefix}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {連結標籤} image {圖片標籤} paragraph "
      & "{段落標籤} ordered_list {編號列表標籤} unordered_list "
      & "{項目符號列表標籤} list_item {列表項目標籤} "
      & "table_header_cell {表格標題儲存格標籤} table_cell "
      & "{表格儲存格標籤} table_row {表格列標籤} line_break "
      & "{換行標籤} thematic_break {分隔線標籤} heading_level_n "
      & "{{level, number}級標題標籤} other {{name}標籤}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {文字內容} html_content {HTML文件} "
      & "json_content {JSON文件} xml_content {XML文件} image_content "
      & "{圖片內容} audio_content {音訊內容} video_content "
      & "{影片內容} font_content {字體內容} archive_content "
      & "{壓縮檔內容} binary_content {二進位內容} form_content "
      & "{表單提交} other {不明內容}}（{base}）");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}未設定} redacted {{label}已遮蔽} "
      & "url_redacted {URL已遮蔽} ip_redacted {IP地址已遮蔽} "
      & "path_ending {結尾為{shown}的檔案路徑} at {{shown}的{label}} "
      & "audit {{label}長度{length, number}，結尾為{shown}} debug "
      & "{{label} {shown}} other {{label}，結尾為{shown}}}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {未命名} other {{name}}}{role, select, "
      & "button_control {按鈕} link_control {連結} tab_control {標籤頁} "
      & "menu_item_control {選單項目} checkbox_control {剔選框} "
      & "radio_control {選項按鈕} text_field_control {文字欄位} "
      & "progress_control {進度列} table_cell_control {表格儲存格} "
      & "region_control {區域} other {控制項}}");
   P ("label.names.hue_noun.orange", "橙色");
end Labels_1;
