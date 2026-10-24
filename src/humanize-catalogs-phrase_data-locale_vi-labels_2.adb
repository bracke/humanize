separate (Humanize.Catalogs.Phrase_Data.Locale_Vi)
procedure Labels_2 is
begin
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {không có hành động kiểm "
      & "duyệt} flagged {đã gắn cờ} hidden {bị người kiểm "
      & "duyệt ẩn} restored {đã khôi phục} marked_spam {đã đánh "
      & "dấu là spam} removed {đã gỡ bỏ} other {đã chuyển cấp "
      & "trên}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {hàng đợi kiểm "
      & "duyệt trống} other {{pending, number} mục chờ xem xét}}} "
      & "other {{pending, number} mục chờ xem xét, {escalated, number} "
      & "mục đã chuyển cấp trên}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {báo cáo đang mở} "
      & "triaged_report {báo cáo đã phân loại} actioned_report {đã "
      & "xử lý} dismissed_report {báo cáo bị bác bỏ} appealed_report "
      & "{báo cáo đã bị kháng nghị} other {báo cáo đã đóng}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {báo cáo đang mở} triaged_report "
      & "{báo cáo đã phân loại} actioned_report {đã xử lý} "
      & "dismissed_report {báo cáo bị bác bỏ} appealed_report {báo cáo "
      & "đã bị kháng nghị} other {báo cáo đã đóng}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {đang chờ xem xét} approved "
      & "{đã phê duyệt} rejected {bị từ chối} needs_changes {cần "
      & "thay đổi} other {xem xét đã chuyển cấp trên}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {đang chờ xem xét} approved {đã "
      & "phê duyệt} rejected {bị từ chối} needs_changes {cần thay "
      & "đổi} other {xem xét đã chuyển cấp trên}}");
   P ("label.navigation.back_label", "quay lại {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {không có đường dẫn điều hướng} other "
      & "{đường dẫn điều hướng {depth, number} cấp}}");
   P ("label.navigation.current_page_label", "trang hiện tại: {name}");
   P ("label.navigation.external_link_label", "{name} (liên kết ngoài)");
   P ("label.navigation.first_label", "đầu tiên: {target}");
   P ("label.navigation.last_label", "cuối cùng: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {không có mục menu} other {{count, number} "
      & "mục menu}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {liên kết} menu_item {mục menu} tab_item "
      & "{thẻ} breadcrumb_item {mục đường dẫn điều hướng} "
      & "section_item {phần} other {dấu phân cách}}");
   P ("label.navigation.navigation_item_label",
      "{kind, select, link_item {liên kết} menu_item {mục menu} tab_item "
      & "{thẻ} breadcrumb_item {mục đường dẫn điều hướng} "
      & "section_item {phần} other {dấu phân cách}} {name}, {state, "
      & "select, current_item {hiện tại} active_item {đang hoạt động} "
      & "inactive_item {không hoạt động} disabled_item {bị vô hiệu "
      & "hóa} expanded_item {đã mở rộng} collapsed_item {đã thu gọn} "
      & "visited_item {đã truy cập} other {bên ngoài}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {hiện tại} active_item {đang hoạt "
      & "động} inactive_item {không hoạt động} disabled_item {bị vô "
      & "hiệu hóa} expanded_item {đã mở rộng} collapsed_item {đã thu "
      & "gọn} visited_item {đã truy cập} other {bên ngoài}}");
   P ("label.navigation.next_label", "tiếp theo: {target}");
   P ("label.navigation.section_state_label",
      "phần {name} {expanded, select, false {đã thu gọn} other {đã "
      & "mở rộng}}{count, plural, =0 {} other {, {count, number} mục}}");
   P ("label.navigation.skip_link_label", "chuyển đến {target}");
   P ("label.navigation.submenu_label", "menu con {name}, {count, number} mục");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {tất cả cảnh báo} important_alerts "
      & "{cảnh báo quan trọng} critical_alerts_only {chỉ cảnh báo "
      & "nghiêm trọng} other {không có cảnh báo}}");
   P ("label.notification_preferences.channel_preference_label",
      "thông báo {channel}: {state, select, preference_enabled {đã bật} "
      & "preference_disabled {đã tắt} preference_inherited {kế thừa} "
      & "other {bắt buộc}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {không có bản tóm tắt} "
      & "instant_digest {tóm tắt tức thì} daily_digest {tóm tắt hằng "
      & "ngày} other {tóm tắt hằng tuần}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {đã bật} preference_disabled "
      & "{đã tắt} preference_inherited {kế thừa} other {bắt buộc}}");
   P ("label.notification_preferences.quiet_hours_label", "giờ yên lặng {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{scope, select, thread_subscription {theo dõi chuỗi thảo luận "
      & "{name}} project_subscription {theo dõi dự án {name}} "
      & "team_subscription {theo dõi nhóm {name}} other {theo dõi tài "
      & "khoản {name}}}: {state, select, preference_enabled {đã bật} "
      & "preference_disabled {đã tắt} preference_inherited {kế thừa} "
      & "other {bắt buộc}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {theo dõi chuỗi thảo luận} "
      & "project_subscription {theo dõi dự án} team_subscription {theo dõi "
      & "nhóm} other {theo dõi tài khoản}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} đã nhắc đến bạn} "
      & "reply_event {{actor} đã trả lời} assignment_event {{actor} đã "
      & "giao việc cho bạn} approval_event {{actor} đã yêu cầu phê "
      & "duyệt} alert_event {{actor} đã gửi cảnh báo} digest_event "
      & "{{actor} đã gửi bản tóm tắt} reminder_event {{actor} đã "
      & "gửi lời nhắc} other {{actor} đã gửi thông báo hệ "
      & "thống}}");
   P ("label.notifications.delivery_label",
      "thông báo {channel, select, in_app_channel {trong ứng dụng} "
      & "email_channel {email} sms_channel {SMS} push_channel {đẩy} "
      & "webhook_channel {webhook} other {tóm tắt}} {state, select, "
      & "pending_delivery {đang chờ} sent_delivery {đã gửi} "
      & "delivered_delivery {đã gửi đến} failed_delivery {thất bại} "
      & "retrying_delivery {đang thử lại} other {đã hủy}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {thông báo đang chờ} "
      & "sent_delivery {thông báo đã gửi} delivered_delivery {thông báo "
      & "đã gửi đến} failed_delivery {thông báo thất bại} "
      & "retrying_delivery {thông báo đang thử lại} other {thông báo "
      & "đã hủy}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {đang chờ {time_text}} "
      & "sent_delivery {đã gửi {time_text}} delivered_delivery {đã gửi "
      & "đến {time_text}} failed_delivery {thất bại {time_text}} "
      & "retrying_delivery {thử lại {time_text}} other {đã hủy "
      & "{time_text}}}");
   P ("label.notifications.digest_label",
      "bản tóm tắt {name}: {count, plural, =0 {không có thông báo} "
      & "other {{count, number} thông báo}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {không có lượt "
      & "nhắc đến} other {{count, number} lượt nhắc đến}}} "
      & "reply_event {{count, plural, =0 {không có trả lời} other "
      & "{{count, number} trả lời}}} assignment_event {{count, plural, =0 "
      & "{không có việc được giao} other {{count, number} việc "
      & "được giao}}} approval_event {{count, plural, =0 {không có yêu "
      & "cầu phê duyệt} other {{count, number} yêu cầu phê duyệt}}} "
      & "alert_event {{count, plural, =0 {không có cảnh báo} other "
      & "{{count, number} cảnh báo}}} digest_event {{count, plural, =0 "
      & "{không có bản tóm tắt} other {{count, number} bản tóm "
      & "tắt}}} reminder_event {{count, plural, =0 {không có lời nhắc} "
      & "other {{count, number} lời nhắc}}} other {{count, plural, =0 "
      & "{không có thông báo hệ thống} other {{count, number} thông "
      & "báo hệ thống}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {đánh dấu thông báo là đã đọc} other "
      & "{đánh dấu {count, number} thông báo là đã đọc}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {đánh dấu thông báo là chưa đọc} other "
      & "{đánh dấu {count, number} thông báo là chưa đọc}}");
   P ("label.notifications.muted_label", "đã tắt tiếng thông báo của {name}");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {lượt nhắc đến mới} "
      & "reply_event {trả lời mới} assignment_event {việc được giao "
      & "mới} approval_event {yêu cầu phê duyệt mới} alert_event "
      & "{cảnh báo mới} digest_event {bản tóm tắt mới} "
      & "reminder_event {lời nhắc mới} other {thông báo hệ thống "
      & "mới}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {thông báo trong ứng dụng} "
      & "email_channel {thông báo email} sms_channel {thông báo SMS} "
      & "push_channel {thông báo đẩy} webhook_channel {thông báo "
      & "webhook} other {thông báo tóm tắt}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {không có thông báo} other {{count, number} "
      & "thông báo}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {lượt nhắc đến} reply_event "
      & "{trả lời} assignment_event {việc được giao} approval_event "
      & "{yêu cầu phê duyệt} alert_event {cảnh báo} digest_event "
      & "{bản tóm tắt} reminder_event {lời nhắc} other {thông báo "
      & "hệ thống}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {không có thông báo} other {{count, "
      & "number} thông báo}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {lượt nhắc đến} "
      & "reply_event {trả lời} assignment_event {việc được giao} "
      & "approval_event {yêu cầu phê duyệt} alert_event {cảnh báo} "
      & "digest_event {bản tóm tắt} reminder_event {lời nhắc} other "
      & "{thông báo hệ thống}} {state, select, unread_state {chưa "
      & "đọc} read_state {đã đọc} archived_state {đã lưu trữ} "
      & "muted_state {đã tắt tiếng} snoozed_state {đã tạm hoãn} "
      & "other {đã chặn}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {thông báo chưa đọc} read_state "
      & "{thông báo đã đọc} archived_state {thông báo đã lưu trữ} "
      & "muted_state {thông báo đã tắt tiếng} snoozed_state {thông "
      & "báo đã tạm hoãn} other {thông báo đã chặn}}");
   P ("label.notifications.snoozed_label", "đã tạm hoãn thông báo của {name}");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {không có thông báo nào bị chặn} other "
      & "{đã chặn {count, number} thông báo}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {không có thông báo chưa đọc} other "
      & "{{count, number} thông báo chưa đọc}}");
   P ("label.payments.amount_label", "số tiền {amount_text}");
   P ("label.payments.balance_label", "số dư {amount_text}");
   P ("label.payments.chargeback_label", "bồi hoàn {amount_text}");
   P ("label.payments.discount_label", "giảm giá {amount_text}");
   P ("label.payments.due_label", "{amount_text} đến hạn {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {không có hóa đơn} other {{count, number} hóa "
      & "đơn}}");
   P ("label.payments.invoice_label",
      "hóa đơn {number} {state, select, draft_invoice {bản nháp} "
      & "open_invoice {đang mở} paid_invoice {đã thanh toán} "
      & "overdue_invoice {quá hạn} other {đã hủy}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {hóa đơn nháp} open_invoice {hóa "
      & "đơn đang mở} paid_invoice {hóa đơn đã thanh toán} "
      & "overdue_invoice {hóa đơn quá hạn} other {hóa đơn đã hủy}}");
   P ("label.payments.method_label",
      "{method, select, card_method {thanh toán bằng thẻ} "
      & "bank_transfer_method {thanh toán bằng chuyển khoản} cash_method "
      & "{thanh toán bằng tiền mặt} wallet_method {thanh toán bằng "
      & "ví} check_method {thanh toán bằng séc} other {thanh toán bằng "
      & "hình thức khác}}: {detail}");
   P ("label.payments.paid_label", "đã thanh toán {amount_text} {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {không có khoản thanh toán} other {{count, "
      & "number} khoản thanh toán}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {thanh toán đang "
      & "chờ} authorized_payment {thanh toán đã ủy quyền} paid_payment "
      & "{đã thanh toán} failed_payment {thanh toán thất bại} "
      & "refunded_payment {thanh toán đã hoàn tiền} other {thanh toán "
      & "đã hủy}}");
   P ("label.payments.payment_link_label", "liên kết thanh toán {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {thẻ} bank_transfer_method {chuyển "
      & "khoản ngân hàng} cash_method {tiền mặt} wallet_method {ví} "
      & "check_method {séc} other {khác}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {thanh toán đang chờ} "
      & "authorized_payment {thanh toán đã ủy quyền} paid_payment {đã "
      & "thanh toán} failed_payment {thanh toán thất bại} "
      & "refunded_payment {thanh toán đã hoàn tiền} other {thanh toán "
      & "đã hủy}}");
   P ("label.payments.receipt_label", "biên lai {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {hoàn tiền đang "
      & "chờ} authorized_payment {hoàn tiền đã ủy quyền} "
      & "paid_payment {hoàn tiền đã chi trả} failed_payment {hoàn "
      & "tiền thất bại} refunded_payment {đã hoàn tiền} other {hoàn "
      & "tiền đã hủy}}");
   P ("label.payments.subtotal_label", "tạm tính {amount_text}");
   P ("label.payments.tax_label", "thuế {amount_text}");
   P ("label.payments.total_label", "tổng cộng {amount_text}");
   P ("label.permissions.access_expiry_label", "quyền truy cập của {subject} hết hạn {time_text}");
   P ("label.permissions.grant_label",
      "đã cấp cho {subject} vai trò {role, select, owner_role {chủ "
      & "sở hữu} admin_role {quản trị viên} editor_role {người "
      & "chỉnh sửa} viewer_role {người xem} other {tùy chỉnh}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {đã cấp} denied {bị "
      & "từ chối} inherited {kế thừa} temporary {truy cập tạm "
      & "thời} expired {đã hết hạn} other {cần phê duyệt}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {đã cấp} denied {bị từ chối} "
      & "inherited {kế thừa} temporary {truy cập tạm thời} expired "
      & "{đã hết hạn} other {cần phê duyệt}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {chính sách cho phép} policy_denied "
      & "{chính sách từ chối} policy_warning {cảnh báo chính sách} "
      & "other {chính sách không áp dụng}}");
   P ("label.permissions.revoke_label",
      "đã thu hồi vai trò {role, select, owner_role {chủ sở hữu} "
      & "admin_role {quản trị viên} editor_role {người chỉnh sửa} "
      & "viewer_role {người xem} other {tùy chỉnh}} của {subject}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {chủ sở hữu} admin_role {quản trị "
      & "viên} editor_role {người chỉnh sửa} viewer_role {người xem} "
      & "other {vai trò tùy chỉnh}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {trống} low_utilization {mức sử "
      & "dụng thấp} normal_utilization {mức sử dụng bình thường} "
      & "high_utilization {mức sử dụng cao} critical_utilization {mức "
      & "sử dụng nghiêm trọng} full_utilization {đầy} other {vượt "
      & "giới hạn}}");
   P ("label.schema.array_shape_label",
      "mảng {count_known, select, false {} other {gồm {count, number} "
      & "}}{element_type, select, string_field {chuỗi} integer_field {số "
      & "nguyên} decimal_field {số thập phân} boolean_field {giá trị "
      & "boolean} date_field {ngày} date_time_field {ngày giờ} object_field "
      & "{đối tượng} array_field {mảng} enum_field {giá trị enum} "
      & "binary_field {dữ liệu nhị phân} null_field {giá trị null} "
      & "any_field {giá trị bất kỳ} other {giá trị không xác "
      & "định}}");
   P ("label.schema.constraint_label", "ràng buộc {name}: {value}");
   P ("label.schema.default_value_label", "trường {field_name} mặc định là {value}");
   P ("label.schema.deprecated_field_label", "trường {name} không còn dùng, hãy dùng {replacement}");
   P ("label.schema.enum_options_label", "{count, number} tùy chọn enum");
   P ("label.schema.example_value_label", "trường {field_name}, ví dụ: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {trường thông thường} "
      & "deprecated_field {trường không còn dùng} unknown_field "
      & "{trường không xác định} read_only_field {trường chỉ "
      & "đọc} write_only_field {trường chỉ ghi} other {trường "
      & "được tính toán}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {trường chuỗi} integer_field "
      & "{trường số nguyên} decimal_field {trường số thập phân} "
      & "boolean_field {trường boolean} date_field {trường ngày} "
      & "date_time_field {trường ngày giờ} object_field {trường đối "
      & "tượng} array_field {trường mảng} enum_field {trường enum} "
      & "binary_field {trường nhị phân} null_field {trường null} "
      & "any_field {trường kiểu bất kỳ} other {trường kiểu không "
      & "xác định}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {không thiếu trường bắt buộc nào} other "
      & "{thiếu {count, number} trường bắt buộc}}");
   P ("label.schema.object_shape_label",
      "đối tượng có {fields, number} trường{required, plural, =0 {} "
      & "other {, {required, number} bắt buộc}}{optional, plural, =0 {} "
      & "other {, {optional, number} tùy chọn}}");
   P ("label.schema.schema_source_label", "lược đồ {name} phiên bản {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {giá trị vô hướng} object_shape "
      & "{{count, plural, =0 {đối tượng} other {đối tượng có "
      & "{count, number} trường}}} array_shape {{count, plural, =0 {mảng} "
      & "other {mảng có {count, number} mục}}} map_shape {{count, plural, "
      & "=0 {ánh xạ} other {ánh xạ có {count, number} mục}}} "
      & "tuple_shape {{count, plural, =0 {bộ} other {bộ có {count, number} "
      & "phần tử}}} union_shape {{count, plural, =0 {hợp kiểu} other "
      & "{hợp của {count, number} kiểu}}} empty_shape {cấu trúc "
      & "rỗng} other {cấu trúc không xác định}}");
   P ("label.schema.unknown_field_label", "trường không xác định {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {không có bộ lọc đang bật} other {{count, "
      & "number} bộ lọc đang bật}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {xóa bộ lọc} =1 {xóa bộ lọc đang bật} "
      & "other {xóa {count, number} bộ lọc đang bật}}");
   P ("label.search.facet_label", "nhóm lọc {name}, {count, number} tùy chọn");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {không có kết quả} other {{count, "
      & "number} kết quả}}{selected, select, true {, đã chọn} other {}}");
   P ("label.search.filter_label",
      "{name}: {value}, {state, select, active_filter {bộ lọc đang "
      & "bật} inactive_filter {bộ lọc đang tắt} other {bộ lọc "
      & "loại trừ}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {bộ lọc đang bật} inactive_filter "
      & "{bộ lọc đang tắt} other {bộ lọc loại trừ}}");
   P ("label.search.no_results_label", "không có kết quả cho “{query}”");
   P ("label.search.recent_search_label", "tìm kiếm gần đây: “{query}”");
   P ("label.search.saved_search_label",
      "tìm kiếm đã lưu: {name}{count, plural, =0 {} other {, {count, "
      & "number} kết quả}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {không có tìm kiếm gần đây} other {{count, "
      & "number} tìm kiếm gần đây}}");
   P ("label.search.search_query_label", "tìm “{query}”");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {không có kết quả} other {{count, number} "
      & "kết quả}}");
   P ("label.search.search_result_summary_label",
      "kết quả cho “{query}”: {count, plural, =0 {không có kết "
      & "quả} other {{count, number} kết quả}}");
   P ("label.search.search_scope_label",
      "phạm vi {name}, {count, plural, =0 {không có kết quả} other "
      & "{{count, number} kết quả}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {chưa tìm kiếm} searching_search "
      & "{đang tìm kiếm} complete_search {đã tìm xong} empty_search "
      & "{không có kết quả tìm kiếm} other {tìm kiếm thất bại}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {sắp xếp theo mức độ liên "
      & "quan} ascending_sort {sắp xếp tăng dần} descending_sort {sắp "
      & "xếp giảm dần} newest_first_sort {sắp xếp mới nhất "
      & "trước} other {sắp xếp cũ nhất trước}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {mức độ liên quan} ascending_sort "
      & "{tăng dần} descending_sort {giảm dần} newest_first_sort {mới "
      & "nhất trước} other {cũ nhất trước}}");
   P ("label.search.suggestion_label", "có phải ý bạn là “{query}”?");
   P ("label.secrets.credential_source_label", "{count, number} thông tin xác thực từ {source}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {đã ẩn giá trị} masked_value "
      & "{đã che giá trị} suffix_only {chỉ phần đuôi} other {chỉ "
      & "dấu vân tay}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {công khai} support_profile {hỗ "
      & "trợ} audit_profile {kiểm toán} other {gỡ lỗi}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {cần xoay vòng} other {chưa cần "
      & "xoay vòng}}{days_old, plural, =0 {} other {, đã {days_old, number} "
      & "ngày}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {khóa API} live_api_key {khóa API production} "
      & "test_api_key {khóa API thử nghiệm} github_token {token GitHub} "
      & "aws_access_key {khóa truy cập AWS} google_api_key {khóa API "
      & "Google} slack_token {token Slack} npm_token {token npm} bearer_token "
      & "{bearer token} jwt_token {token JWT} basic_auth_credential {thông tin "
      & "xác thực basic auth} password_secret {mật khẩu} private_key "
      & "{khóa riêng tư} ssh_private_key {khóa riêng tư SSH} "
      & "webhook_secret {bí mật webhook} oauth_token {token OAuth} "
      & "database_url_secret {URL cơ sở dữ liệu} sha1_fingerprint {dấu "
      & "vân tay SHA-1} sha256_fingerprint {dấu vân tay SHA-256} other {bí "
      & "mật}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {email} phone_value {số điện thoại} "
      & "url_value {URL} ip_address_value {địa chỉ IP} token_value {token} "
      & "file_path_value {đường dẫn tệp} account_id_value {ID tài "
      & "khoản} payment_reference_value {mã tham chiếu thanh toán} "
      & "log_field_value {trường nhật ký} other {giá trị nhạy "
      & "cảm}}");
   P ("label.tables.cell_label",
      "hàng {row, number}, cột {column, number}, {state, select, "
      & "empty_cell {trống} edited_cell {đã sửa} invalid_cell {không "
      & "hợp lệ} highlighted_cell {được tô sáng} other {chỉ "
      & "đọc}}");
   P ("label.tables.cell_position_label", "hàng {row, number}, cột {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {ô trống} edited_cell {ô đã sửa} "
      & "invalid_cell {ô không hợp lệ} highlighted_cell {ô được tô "
      & "sáng} other {ô chỉ đọc}}");
   P ("label.tables.column_count_label", "{count, plural, =0 {không có cột} other {{count, number} cột}}");
   P ("label.tables.column_label",
      "{role, select, text_column {cột văn bản {name}} number_column "
      & "{cột số {name}} date_column {cột ngày {name}} status_column "
      & "{cột trạng thái {name}} action_column {cột thao tác {name}} "
      & "other {cột ẩn {name}}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {cột văn bản} number_column {cột "
      & "số} date_column {cột ngày} status_column {cột trạng thái} "
      & "action_column {cột thao tác} other {cột ẩn}}");
   P ("label.tables.group_label", "{name}: {count, number} hàng");
   P ("label.tables.row_count_label", "{count, plural, =0 {không có hàng} other {{count, number} hàng}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {chưa sắp xếp} ascending_sort {tăng "
      & "dần} other {giảm dần}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {chưa sắp xếp} ascending_sort {sắp "
      & "xếp theo {column_name} tăng dần} other {sắp xếp theo "
      & "{column_name} giảm dần}}");
   P ("label.tables.subtotal_label", "tổng phụ {name}: {value}");
   P ("label.tables.table_size_label", "{rows, number} hàng × {columns, number} cột");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {đã bỏ giao cho {assignee}} assigned "
      & "{đã giao cho {assignee}} reassigned {đã giao lại cho {assignee}} "
      & "watching {{assignee} đang theo dõi} other {{assignee} sở hữu "
      & "công việc}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {chưa giao} assigned {đã giao} "
      & "reassigned {đã giao lại} watching {đang theo dõi} other {sở "
      & "hữu công việc}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {backlog trống} other {backlog: {count, number} "
      & "công việc}}");
   P ("label.tasks.blocker_label", "bị chặn bởi {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {hoàn thành công việc} other {hoàn thành "
      & "{count, number} công việc}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {không có công việc đã hoàn thành} other "
      & "{{count, number} công việc đã hoàn thành}}");
   P ("label.tasks.due_label", "hạn {due_text}");
   P ("label.tasks.estimate_label", "ước tính {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {không có công việc đang mở} other {{count, "
      & "number} công việc đang mở}}");
   P ("label.tasks.overdue_label", "quá hạn từ {due_text}");
   P ("label.tasks.recurring_task_label", "lặp lại {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {mở lại công việc} other {mở lại {count, "
      & "number} công việc}}");
   P ("label.tasks.sprint_label", "{name}: {count, number} công việc");
   P ("label.tasks.subtask_label", "{name}: {count, number} công việc con");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {không có công việc} other {{count, number} "
      & "công việc}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {công việc đang mở} "
      & "in_progress_task {công việc đang thực hiện} blocked_task "
      & "{công việc bị chặn} done_task {công việc đã xong} "
      & "canceled_task {công việc đã hủy} deferred_task {công việc "
      & "bị hoãn} other {công việc quá hạn}}{priority, select, "
      & "no_priority {} low_priority {, ưu tiên thấp} medium_priority {, "
      & "ưu tiên trung bình} high_priority {, ưu tiên cao} other {, ưu "
      & "tiên nghiêm trọng}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {không ưu tiên} low_priority {ưu "
      & "tiên thấp} medium_priority {ưu tiên trung bình} high_priority "
      & "{ưu tiên cao} other {ưu tiên nghiêm trọng}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {công việc đang mở} in_progress_task "
      & "{công việc đang thực hiện} blocked_task {công việc bị "
      & "chặn} done_task {công việc đã xong} canceled_task {công việc "
      & "đã hủy} deferred_task {công việc bị hoãn} other {công "
      & "việc quá hạn}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {giới hạn trên} other {giới "
      & "hạn dưới}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {dưới phạm vi dự kiến} "
      & "within_range {trong phạm vi dự kiến} above_range {trên phạm "
      & "vi dự kiến} below_target {dưới mục tiêu} at_target {đạt "
      & "mục tiêu} above_target {vượt mục tiêu} near_limit {gần "
      & "giới hạn} warning_level {ngưỡng cảnh báo} critical_level "
      & "{ngưỡng nghiêm trọng} breached {đã vượt ngưỡng} other "
      & "{trạng thái ngưỡng không xác định}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {đã cập nhật} other {đi "
      & "trước {ahead, number} commit}}} other {{ahead, plural, =0 {} other "
      & "{đi trước {ahead, number} commit, }}đi sau {behind, number} "
      & "commit}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {đang chờ {approver} phê duyệt} other "
      & "{đã được {approver} phê duyệt}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {lần thử 1/1} other "
      & "{lần thử {attempt, number}/1, đã vượt giới hạn}}} other "
      & "{lần thử {attempt, number}/{limit, number}}}");
   P ("label.workflows.blocker_label", "bị chặn: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {không có phụ thuộc gây chặn} other "
      & "{{count, number} phụ thuộc gây chặn}}");
   P ("label.workflows.handoff_label", "chuyển giao từ {from} sang {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {mốc sắp tới} "
      & "current_milestone {mốc hiện tại} complete_milestone {mốc đã "
      & "hoàn thành} missed_milestone {mốc bị lỡ} other {mốc bị "
      & "chặn}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {sắp tới} "
      & "current_milestone {hiện tại} complete_milestone {đã hoàn "
      & "thành} missed_milestone {bị lỡ} other {bị chặn}}");
   P ("label.workflows.next_action_label", "tiếp theo: {action}");
   P ("label.workflows.owner_label", "chủ sở hữu: {owner}");
   P ("label.workflows.resume_label", "tiếp tục {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {đang chờ xử lý} active_step {đang "
      & "hoạt động} waiting_step {đang chờ} blocked_step {bị chặn} "
      & "done_step {đã xong} failed_step {thất bại} other {đã bỏ "
      & "qua}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {đang chờ xử lý} "
      & "active_step {đang hoạt động} waiting_step {đang chờ} "
      & "blocked_step {bị chặn} done_step {đã xong} failed_step {thất "
      & "bại} other {đã bỏ qua}}");
   P ("label.workflows.waiting_label", "đang chờ {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {chưa bắt đầu} "
      & "in_progress_state {đang thực hiện} waiting_state {đang chờ} "
      & "waiting_approval_state {đang chờ phê duyệt} blocked_state {bị "
      & "chặn} completed_state {đã hoàn thành} failed_state {thất "
      & "bại} cancelled_state {đã hủy} skipped_state {đã bỏ qua} "
      & "other {đã tạm dừng}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {chưa bắt đầu} "
      & "in_progress_state {đang thực hiện} waiting_state {đang chờ} "
      & "waiting_approval_state {đang chờ phê duyệt} blocked_state {bị "
      & "chặn} completed_state {đã hoàn thành} failed_state {thất "
      & "bại} cancelled_state {đã hủy} skipped_state {đã bỏ qua} "
      & "other {đã tạm dừng}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {trong suốt} "
      & "mostly_transparent {gần như trong suốt} translucent {mờ} "
      & "mostly_opaque {gần như đục} other {đục}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {không có quan sát nào} other {{count, number} "
      & "quan sát, nhỏ nhất {minimum} {unit}, trung vị {median} {unit}, "
      & "lớn nhất {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {không có quan sát nào} "
      & "other {0 giá trị ngoại lai trên {total, number} quan sát}}} "
      & "other {{outliers, number} giá trị ngoại lai trên {total, number} "
      & "quan sát}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {không có quan sát} "
      & "sample_too_small_shape {mẫu quá nhỏ để mô tả hình dạng, "
      & "{count, number} quan sát} flat_shape {phân phối phẳng tại "
      & "{median}} outlier_heavy_shape {phân phối nhiều giá trị ngoại "
      & "lai quanh {median}} volatile_shape {phân phối biến động quanh "
      & "{median}} clustered_shape {phân phối tập trung theo cụm quanh "
      & "{median}} wide_spread_shape {phân phối trải rộng} "
      & "wide_spread_range {phân phối trải rộng từ {minimum} đến "
      & "{maximum}} right_skewed_shape {phân phối lệch phải, trung vị "
      & "{median}} left_skewed_shape {phân phối lệch trái, trung vị "
      & "{median}} other {phân phối gần cân bằng quanh {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {email trống} address {địa chỉ email} "
      & "other {email tại {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {số điện thoại} redacted {số điện "
      & "thoại đã ẩn} other {số điện thoại kết thúc bằng "
      & "{digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {tên người dùng} other {tên người dùng "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {ký hiệu mã} other {ký hiệu mã {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "siêu dữ liệu địa chỉ: có {present, number} trường, "
      & "thiếu {missing, number} trường");
   P ("label.endpoints.host_label",
      "{state, select, none {máy chủ không xác định} other {{host} "
      & "{kind}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {điểm cuối không xác định} other "
      & "{điểm cuối {kind} {scheme}{host}{port}}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {URL trống} none {URL không có thành phần "
      & "nào được nhận dạng} other {URL có {count, number} thành "
      & "phần: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {không có tham số truy vấn} other {{count, "
      & "number} tham số truy vấn}}");
   P ("label.endpoints.ip_address_label",
      "{address} {kind, select, ipv4_host {địa chỉ IPv4 công khai} "
      & "ipv6_host {địa chỉ IPv6 công khai} private_network_host {địa "
      & "chỉ mạng riêng} localhost_host {máy chủ cục bộ} other "
      & "{không phải địa chỉ IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} CIDR không hợp lệ} other {{cidr} "
      & "tiền tố mạng {kind} {prefix}}}");
   P ("label.resources.utilization_label", "đã dùng {used, number}/{total, number} {unit} ({percent}, {band})");
   P ("label.resources.remaining_label",
      "{state, select, over {vượt dung lượng {count, number} {unit}} "
      & "other {còn {count, number}/{total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {vượt hạn mức {count, number} {unit} "
      & "(đã dùng {percent})} near {sắp hết hạn mức: còn {count, "
      & "number} {unit} (đã dùng {percent})} other {hạn mức khả "
      & "dụng: còn {count, number} {unit} (đã dùng {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {không có tỷ lệ truy cập bộ nhớ "
      & "đệm: không có yêu cầu} other {tỷ lệ truy cập bộ nhớ "
      & "đệm {percent}: {hits, number} lần trúng, {misses, number} lần "
      & "trượt}}");
   P ("label.resources.saturation_label", "{named, select, no {tài nguyên} other {{name}}} {percent} {band}");
   P ("label.versions.version_label",
      "{state, select, both {phiên bản {version} tiền phát hành "
      & "{prerelease} bản dựng {build}} prerelease {phiên bản {version} "
      & "tiền phát hành {prerelease}} build {phiên bản {version} bản "
      & "dựng {build}} other {phiên bản {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {cùng phiên bản} major_upgrade {nâng "
      & "cấp lớn} minor_upgrade {nâng cấp nhỏ} patch_upgrade {nâng "
      & "cấp bản vá} prerelease_change {thay đổi tiền phát hành} "
      & "build_metadata_change {thay đổi siêu dữ liệu bản dựng} "
      & "downgrade {hạ cấp} other {thay đổi phiên bản không xác "
      & "định}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {đúng phiên bản {version}} "
      & "minimum_range {phiên bản {version} trở lên} maximum_range "
      & "{phiên bản {version} trở xuống} major_compatible_range {tương "
      & "thích với phiên bản chính {version}} minor_compatible_range "
      & "{tương thích với phiên bản phụ {version}} other {khoảng "
      & "phiên bản {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {bản phát hành phát triển ban đầu "
      & "{version}} prerelease {bản tiền phát hành {version}} major "
      & "{bản phát hành chính {version}} minor {bản phát hành phụ "
      & "{version}} other {bản vá {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {thẻ liên kết} image {thẻ hình ảnh} "
      & "paragraph {thẻ đoạn văn} ordered_list {thẻ danh sách có "
      & "thứ tự} unordered_list {thẻ danh sách không thứ tự} "
      & "list_item {thẻ mục danh sách} table_header_cell {thẻ ô tiêu "
      & "đề bảng} table_cell {thẻ ô bảng} table_row {thẻ hàng "
      & "bảng} line_break {thẻ ngắt dòng} thematic_break {thẻ ngắt "
      & "chủ đề} heading_level_n {thẻ tiêu đề cấp {level, number}} "
      & "other {thẻ {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {thuộc tính {name}} event {thuộc tính "
      & "trình xử lý sự kiện {name}} other {thuộc tính {name} có "
      & "giá trị “{value}”}}");
   P ("label.markup.attribute_count_label.total", "{count, number} thuộc tính");
   P ("label.markup.attribute_count_label.data", "{count, number} thuộc tính dữ liệu");
   P ("label.markup.attribute_count_label.aria", "{count, number} thuộc tính ARIA");
   P ("label.markup.attribute_count_label.events", "{count, number} trình xử lý sự kiện");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {nội dung văn bản} html_content {tài "
      & "liệu HTML} json_content {tài liệu JSON} xml_content {tài liệu "
      & "XML} image_content {nội dung hình ảnh} audio_content {nội dung "
      & "âm thanh} video_content {nội dung video} font_content {nội dung "
      & "phông chữ} archive_content {nội dung tệp nén} binary_content "
      & "{nội dung nhị phân} form_content {dữ liệu gửi biểu mẫu} "
      & "other {nội dung không xác định}} ({base})");
   P ("label.markup.heading_label", "tiêu đề cấp {level, number}");
   P ("label.markup.tag_count_label.total", "{count, number} thẻ");
   P ("label.markup.tag_count_label.links", "{count, number} liên kết");
   P ("label.markup.tag_count_label.media", "{count, number} phần tử đa phương tiện");
   P ("label.markup.tag_count_label.forms", "{count, number} điều khiển biểu mẫu");
   P ("label.markup.document_outline_label.headings", "{count, number} tiêu đề");
   P ("label.markup.document_outline_label.landmarks", "{count, number} mốc");
   P ("label.markup.document_outline_label.forms", "{count, number} biểu mẫu");
   P ("label.markup.document_outline_label.media", "{count, number} phần tử đa phương tiện");
   P ("label.markup.table_navigation_label",
      "{caption} hàng {row, number}/{rows, number}, cột {column, "
      & "number}/{columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} chưa đặt} hidden_value {{kind} đã "
      & "ẩn} masked_value {{kind} {shown}} fingerprint_only {dấu vân tay "
      & "{kind} kết thúc bằng {shown}} other {{kind} kết thúc bằng "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} chưa đặt} other {{name} "
      & "{kind} kết thúc bằng {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {tiêu đề thông tin xác thực {name} chưa "
      & "đặt} other {{name} {kind} kết thúc bằng {shown}}}");
end Labels_2;
