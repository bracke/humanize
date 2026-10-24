separate (Humanize.Catalogs.Phrase_Data.Locale_Vi)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {tài khoản {name} đang hoạt "
      & "động} invited_account {tài khoản {name} đã được mời} "
      & "locked_account {tài khoản {name} bị khóa} suspended_account "
      & "{tài khoản {name} bị tạm ngưng} deleted_account {tài khoản "
      & "{name} đã bị xóa} other {tài khoản {name}: trạng thái "
      & "không xác định}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {tài khoản đang hoạt động} "
      & "invited_account {tài khoản đã được mời} locked_account "
      & "{tài khoản bị khóa} suspended_account {tài khoản bị tạm "
      & "ngưng} deleted_account {tài khoản đã bị xóa} other {trạng "
      & "thái tài khoản không xác định}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {thiết bị tin cậy} "
      & "untrusted_device {thiết bị không tin cậy} new_device {thiết "
      & "bị mới} other {thiết bị bị chặn}}");
   P ("label.accounts.last_active_label", "{name} hoạt động lần cuối {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name} đăng nhập thất bại} other "
      & "{{name} đăng nhập thành công}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {đã bật MFA} mfa_disabled {đã tắt "
      & "MFA} mfa_required {bắt buộc MFA} other {cần đặt lại MFA}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {phiên {name} đang hoạt động} "
      & "expired_session {phiên {name} đã hết hạn} revoked_session "
      & "{phiên {name} đã bị thu hồi} idle_session {phiên {name} không "
      & "hoạt động} other {phiên {name}: trạng thái không xác "
      & "định}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {phiên đang hoạt động} "
      & "expired_session {phiên đã hết hạn} revoked_session {phiên đã "
      & "bị thu hồi} idle_session {phiên không hoạt động} other "
      & "{trạng thái phiên không xác định}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {không có tệp đính kèm} other {{count, "
      & "number} tệp đính kèm}}");
   P ("label.attachments.attachment_group_label", "{name}: {count, number} tệp đính kèm");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {tệp đính kèm} image_attachment "
      & "{hình ảnh đính kèm} video_attachment {video đính kèm} "
      & "audio_attachment {âm thanh đính kèm} document_attachment {tài "
      & "liệu đính kèm} archive_attachment {tệp nén đính kèm} other "
      & "{liên kết đính kèm}}");
   P ("label.attachments.attachment_label",
      "{kind, select, file_attachment {tệp} image_attachment {hình ảnh} "
      & "video_attachment {video} audio_attachment {âm thanh} "
      & "document_attachment {tài liệu} archive_attachment {tệp nén} "
      & "other {liên kết}} {name} {state, select, pending_attachment {đang "
      & "chờ} uploading_attachment {đang tải lên} uploaded_attachment "
      & "{đã tải lên} failed_attachment {thất bại} removed_attachment "
      & "{đã bị xóa} other {bị chặn}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {tệp đính kèm đang chờ} "
      & "uploading_attachment {tệp đính kèm đang tải lên} "
      & "uploaded_attachment {tệp đính kèm đã tải lên} "
      & "failed_attachment {tệp đính kèm thất bại} removed_attachment "
      & "{tệp đính kèm đã bị xóa} other {tệp đính kèm bị "
      & "chặn}}");
   P ("label.attachments.download_label", "tải xuống {name}");
   P ("label.attachments.expiring_link_label", "liên kết {name} hết hạn {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "xem trước {name}");
   P ("label.attachments.remove_label", "xóa {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: chưa quét} scanning {{name}: "
      & "đang quét} safe {{name}: an toàn} suspicious {{name}: đáng ngờ} "
      & "other {{name}: bị nhiễm mã độc}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {chưa quét} scanning {đang quét} safe "
      & "{quét: an toàn} suspicious {quét: đáng ngờ} other {quét: bị "
      & "nhiễm mã độc}}");
   P ("label.attachments.upload_error_label", "tải lên {name} thất bại: {reason}");
   P ("label.badges.badge_label",
      "huy hiệu {name} ({tone, select, neutral_tone {trung tính} info_tone "
      & "{thông tin} success_tone {thành công} warning_tone {cảnh báo} "
      & "danger_tone {nguy hiểm} other {mờ}}{state, select, default_badge "
      & "{} new_badge {, mới} updated_badge {, đã cập nhật} "
      & "deprecated_badge {, không còn dùng} selected_badge {, đã chọn} "
      & "disabled_badge {, đã tắt} other {, có thể đóng}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {huy hiệu ưu tiên thấp} "
      & "medium_priority {huy hiệu ưu tiên trung bình} high_priority {huy "
      & "hiệu ưu tiên cao} other {huy hiệu ưu tiên nghiêm trọng}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {huy hiệu mặc định} new_badge "
      & "{huy hiệu mới} updated_badge {huy hiệu đã cập nhật} "
      & "deprecated_badge {huy hiệu không còn dùng} selected_badge {huy "
      & "hiệu đã chọn} disabled_badge {huy hiệu đã tắt} other {huy "
      & "hiệu có thể đóng}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {huy hiệu trung tính} info_tone {huy "
      & "hiệu thông tin} success_tone {huy hiệu thành công} warning_tone "
      & "{huy hiệu cảnh báo} danger_tone {huy hiệu nguy hiểm} other "
      & "{huy hiệu mờ}}");
   P ("label.badges.chip_label",
      "{selected, select, false {chip {name}} other {chip {name}, đã "
      & "chọn}}");
   P ("label.badges.count_badge_label",
      "{count, plural, =0 {{name}: không có} other {{name}: {count, "
      & "number}}}");
   P ("label.badges.deprecated_label", "huy hiệu {name} (cảnh báo, không còn dùng)");
   P ("label.badges.dismiss_label", "đóng {name}");
   P ("label.badges.new_label", "huy hiệu {name} (thông tin, mới)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {không có huy hiệu ẩn} other "
      & "{+{hidden_count, number} huy hiệu khác}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {huy hiệu {name}, ưu tiên thấp} "
      & "medium_priority {huy hiệu {name}, ưu tiên trung bình} "
      & "high_priority {huy hiệu {name}, ưu tiên cao} other {huy hiệu "
      & "{name}, ưu tiên nghiêm trọng}}");
   P ("label.badges.status_badge_label",
      "trạng thái {name}: {tone, select, neutral_tone {trung tính} "
      & "info_tone {thông tin} success_tone {thành công} warning_tone "
      & "{cảnh báo} danger_tone {nguy hiểm} other {mờ}}");
   P ("label.badges.tag_count_label", "{count, plural, =0 {không có thẻ} other {{count, number} thẻ}}");
   P ("label.badges.tag_label", "thẻ {name}");
   P ("label.badges.updated_label", "huy hiệu {name} (thành công, đã cập nhật)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {artifact đã tải lên} "
      & "artifact_missing {thiếu artifact} artifact_expired {artifact đã "
      & "hết hạn} other {artifact đã xác minh}}");
   P ("label.builds.benchmark_label", "điểm chuẩn {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {bản dựng {name} đã xếp hàng} "
      & "build_running {bản dựng {name} đang chạy} build_passed {bản "
      & "dựng {name} đạt} build_failed {bản dựng {name} thất bại} "
      & "snapshot_build {bản dựng snapshot {name}} other {bản dựng "
      & "phát hành {name}}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {bản dựng đã xếp hàng} "
      & "build_running {bản dựng đang chạy} build_passed {bản dựng "
      & "đạt} build_failed {bản dựng thất bại} snapshot_build {bản "
      & "dựng snapshot} other {bản dựng phát hành}}");
   P ("label.builds.coverage_label", "độ bao phủ {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {cổng phát hành đã đạt} "
      & "gate_failed {cổng phát hành thất bại} gate_warning {cổng "
      & "phát hành có cảnh báo} other {cổng phát hành bị chặn}}");
   P ("label.builds.test_count_label",
      "{count, plural, =0 {không có kiểm thử nào {state, select, "
      & "passed_test {đạt} failed_test {thất bại} skipped_test {bị "
      & "bỏ qua} flaky_test {không ổn định} other {thất bại như "
      & "dự kiến}}} other {{count, number} kiểm thử {state, select, "
      & "passed_test {đạt} failed_test {thất bại} skipped_test {bị "
      & "bỏ qua} flaky_test {không ổn định} other {thất bại như "
      & "dự kiến}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {đạt} failed_test {thất bại} "
      & "skipped_test {đã bỏ qua} flaky_test {không ổn định} other "
      & "{thất bại như dự kiến}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "không đổi, đang tắt} other {{field_name} chuyển từ tắt "
      & "sang bật}}} other {{new_value, select, false {{field_name} chuyển "
      & "từ bật sang tắt} other {{field_name} không đổi, đang "
      & "bật}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {đã thêm} removed_change {đã xóa} "
      & "modified_change {đã thay đổi} renamed_change {đã đổi tên} "
      & "unchanged_change {không đổi} metadata_change {siêu dữ liệu "
      & "đã thay đổi} moved_change {đã di chuyển} conflict_change "
      & "{xung đột} other {thay đổi không xác định}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {thay đổi mang tính thông "
      & "tin} minor_change {thay đổi nhỏ} major_change {thay đổi lớn} "
      & "other {thay đổi phá vỡ tương thích}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} không đổi} "
      & "other {{unchanged, plural, =0 {{field_name} đã thay đổi: thêm "
      & "{added, number}} other {{field_name} đã thay đổi: thêm {added, "
      & "number}, giữ nguyên {unchanged, number}}}}}} other {{added, plural, "
      & "=0 {{unchanged, plural, =0 {{field_name} đã thay đổi: xóa "
      & "{removed, number}} other {{field_name} đã thay đổi: xóa "
      & "{removed, number}, giữ nguyên {unchanged, number}}}} other "
      & "{{unchanged, plural, =0 {{field_name} đã thay đổi: thêm {added, "
      & "number}, xóa {removed, number}} other {{field_name} đã thay đổi: "
      & "thêm {added, number}, xóa {removed, number}, giữ nguyên "
      & "{unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {không có xung đột} other {{count, number} "
      & "xung đột}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name} dời muộn hơn, từ "
      & "{old_label} sang {new_label}} other {{field_name} dời sớm hơn, "
      & "từ {old_label} sang {new_label}}}");
   P ("label.changes.duration_field_change_label", "{field_name} đã đổi từ {old_label} thành {new_label}");
   P ("label.changes.field_change_label", "{field_name} đã đổi từ {old_value} thành {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {đã thêm {name}} removed_change {đã "
      & "xóa {name}} modified_change {đã thay đổi {name}} renamed_change "
      & "{đã đổi tên {name}} unchanged_change {{name} không đổi} "
      & "metadata_change {siêu dữ liệu của {name} đã thay đổi} "
      & "moved_change {đã di chuyển {name}} conflict_change {xung đột "
      & "ở {name}} other {{name}: thay đổi không xác định}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {chỉ siêu dữ liệu thay đổi} other {chỉ "
      & "{count, number} trường siêu dữ liệu thay đổi}}");
   P ("label.changes.move_label", "đã di chuyển {name} từ {from} sang {to}");
   P ("label.changes.no_changes_label", "không có thay đổi");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {không có dòng "
      & "nào thay đổi} other {thêm {lines_added, number} dòng}}} other "
      & "{{lines_added, plural, =0 {xóa {lines_removed, number} dòng} other "
      & "{thêm {lines_added, number} dòng, xóa {lines_removed, number} "
      & "dòng}}}}");
   P ("label.changes.rename_label", "đã đổi tên từ {old_name} thành {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author} đã soạn nháp bình "
      & "luận} published_comment {{author} đã bình luận} edited_comment "
      & "{{author} đã sửa bình luận} deleted_comment {{author} đã xóa "
      & "bình luận} resolved_comment {{author} đã giải quyết bình "
      & "luận} unresolved_comment {{author} đã mở lại bình luận} "
      & "pinned_comment {{author} đã ghim bình luận} other {{author} đã "
      & "ẩn bình luận}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {không có bình luận} other {{count, number} "
      & "bình luận}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {bình luận nháp của {author}} "
      & "published_comment {bình luận đã đăng của {author}} "
      & "edited_comment {bình luận đã sửa của {author}} "
      & "deleted_comment {bình luận đã xóa của {author}} "
      & "resolved_comment {bình luận đã giải quyết của {author}} "
      & "unresolved_comment {bình luận chưa giải quyết của {author}} "
      & "pinned_comment {bình luận đã ghim của {author}} other {bình "
      & "luận đã ẩn của {author}}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {bình luận nháp} published_comment "
      & "{bình luận đã đăng} edited_comment {bình luận đã sửa} "
      & "deleted_comment {bình luận đã xóa} resolved_comment {bình "
      & "luận đã giải quyết} unresolved_comment {bình luận chưa "
      & "giải quyết} pinned_comment {bình luận đã ghim} other {bình "
      & "luận đã ẩn}}");
   P ("label.comments.deleted_label", "{author} đã xóa bình luận");
   P ("label.comments.edited_label", "đã sửa {time_text}");
   P ("label.comments.hide_comment_label", "ẩn bình luận: {reason}");
   P ("label.comments.lock_thread_label", "khóa chuỗi thảo luận {name}");
   P ("label.comments.mention_label", "{actor} đã nhắc đến {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {không có người tham gia} other {{count, "
      & "number} người tham gia}}");
   P ("label.comments.pin_label", "ghim {name}");
   P ("label.comments.reaction_kind_label",
      "biểu cảm {kind, select, like_reaction {thích} dislike_reaction "
      & "{không thích} heart_reaction {trái tim} laugh_reaction {cười} "
      & "confused_reaction {bối rối} hooray_reaction {hoan hô} "
      & "rocket_reaction {tên lửa} other {đôi mắt}}");
   P ("label.comments.reaction_label",
      "{count, plural, =0 {không có biểu cảm {kind, select, "
      & "like_reaction {thích} dislike_reaction {không thích} heart_reaction "
      & "{trái tim} laugh_reaction {cười} confused_reaction {bối rối} "
      & "hooray_reaction {hoan hô} rocket_reaction {tên lửa} other {đôi "
      & "mắt}}} other {{count, number} biểu cảm {kind, select, "
      & "like_reaction {thích} dislike_reaction {không thích} heart_reaction "
      & "{trái tim} laugh_reaction {cười} confused_reaction {bối rối} "
      & "hooray_reaction {hoan hô} rocket_reaction {tên lửa} other {đôi "
      & "mắt}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {không có trả lời} other {{count, number} "
      & "trả lời}}");
   P ("label.comments.resolved_label", "đã giải quyết {name}");
   P ("label.comments.subscribe_label", "theo dõi {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {không có chuỗi thảo luận} other {{count, "
      & "number} chuỗi thảo luận}}");
   P ("label.comments.thread_label",
      "chuỗi thảo luận {name} {state, select, open_thread {đang mở} "
      & "resolved_thread {đã giải quyết} locked_thread {đã khóa} other "
      & "{đã lưu trữ}}{count, plural, =0 {} other {, {count, number} bình "
      & "luận}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {chuỗi thảo luận đang mở} "
      & "resolved_thread {chuỗi thảo luận đã giải quyết} "
      & "locked_thread {chuỗi thảo luận đã khóa} other {chuỗi thảo "
      & "luận đã lưu trữ}}");
   P ("label.comments.unpin_label", "bỏ ghim {name}");
   P ("label.comments.unsubscribe_label", "hủy theo dõi {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name} đã cải thiện} regressed "
      & "{{name} đã suy giảm} unchanged {{name} không đổi} "
      & "within_tolerance {{name} trong ngưỡng dung sai} outside_tolerance "
      & "{{name} vượt ngưỡng dung sai} new_value {{name} mới} "
      & "removed_value {{name} đã bị xóa} other {{name}: không có "
      & "đường cơ sở}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {đã cải thiện} regressed {đã suy "
      & "giảm} unchanged {không đổi} within_tolerance {trong ngưỡng "
      & "dung sai} outside_tolerance {vượt ngưỡng dung sai} new_value "
      & "{mới} removed_value {đã bị xóa} other {không có đường cơ "
      & "sở}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name} cải thiện {difference_text}} "
      & "regressed {{name} suy giảm {difference_text}} unchanged {{name} "
      & "không đổi, chênh lệch {difference_text}} within_tolerance "
      & "{{name} trong ngưỡng dung sai, chênh lệch {difference_text}} "
      & "outside_tolerance {{name} vượt ngưỡng dung sai, chênh lệch "
      & "{difference_text}} new_value {{name} mới, chênh lệch "
      & "{difference_text}} removed_value {{name} đã bị xóa, chênh lệch "
      & "{difference_text}} other {{name}: không có đường cơ sở, "
      & "chênh lệch {difference_text}}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name} cải thiện {difference_text}} "
      & "regressed {{name} suy giảm {difference_text}} unchanged {{name} "
      & "không đổi, chênh lệch {difference_text}} within_tolerance "
      & "{{name} trong ngưỡng dung sai, chênh lệch {difference_text}} "
      & "outside_tolerance {{name} vượt ngưỡng dung sai, chênh lệch "
      & "{difference_text}} new_value {{name} mới, chênh lệch "
      & "{difference_text}} removed_value {{name} đã bị xóa, chênh lệch "
      & "{difference_text}} other {{name}: không có đường cơ sở, "
      & "chênh lệch {difference_text}}}, dung sai {tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {hàng không hợp lệ} duplicate_record "
      & "{bản ghi trùng lặp} missing_column {thiếu cột} unknown_field "
      & "{trường không xác định} schema_mismatch {lược đồ không "
      & "khớp} other {bản ghi bị bỏ qua}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {chạy thử đạt} dry_run_failed "
      & "{chạy thử thất bại} import_valid {dữ liệu nhập hợp "
      & "lệ} import_invalid {dữ liệu nhập không hợp lệ} other "
      & "{nhập một phần}}");
   P ("label.data_quality.import_result_label",
      "{name} – {state, select, dry_run_passed {chạy thử đạt} "
      & "dry_run_failed {chạy thử thất bại} import_valid {dữ liệu "
      & "nhập hợp lệ} import_invalid {dữ liệu nhập không hợp "
      & "lệ} other {nhập một phần}}: chấp nhận {accepted, number}, "
      & "từ chối {rejected, number}");
   P ("label.data_quality.issue_count_label",
      "{count, plural, =0 {không có {issue, select, invalid_row {hàng "
      & "không hợp lệ} duplicate_record {bản ghi trùng lặp} "
      & "missing_column {cột bị thiếu} unknown_field {trường không "
      & "xác định} schema_mismatch {lỗi không khớp lược đồ} "
      & "other {bản ghi bị bỏ qua}}} other {{count, number} {issue, "
      & "select, invalid_row {hàng không hợp lệ} duplicate_record {bản "
      & "ghi trùng lặp} missing_column {cột bị thiếu} unknown_field "
      & "{trường không xác định} schema_mismatch {lỗi không khớp "
      & "lược đồ} other {bản ghi bị bỏ qua}}}}");
   P ("label.data_quality.row_issue_label",
      "hàng {row, number}: {issue, select, invalid_row {hàng không hợp "
      & "lệ} duplicate_record {bản ghi trùng lặp} missing_column "
      & "{thiếu cột} unknown_field {trường không xác định} "
      & "schema_mismatch {lược đồ không khớp} other {bản ghi bị "
      & "bỏ qua}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {hàng không hợp lệ} "
      & "duplicate_record {bản ghi trùng lặp} missing_column {thiếu "
      & "cột} unknown_field {trường không xác định} schema_mismatch "
      & "{lược đồ không khớp} other {bản ghi bị bỏ qua}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {artifact sẵn sàng} "
      & "artifact_uploaded {đã tải lên artifact} artifact_signed {đã ký "
      & "artifact} artifact_missing {thiếu artifact} other {artifact đã "
      & "hết hạn}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {triển khai {name} lên "
      & "{environment} đang chờ} deploying {đang triển khai {name} lên "
      & "{environment}} deployed {đã triển khai {name} lên {environment}} "
      & "failed_deployment {triển khai {name} lên {environment} thất "
      & "bại} rolled_back {đã hoàn tác {name} trên {environment}} "
      & "blocked_deployment {triển khai {name} lên {environment} bị "
      & "chặn} other {đã hủy triển khai {name} lên {environment}}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {triển khai đang chờ} deploying "
      & "{đang triển khai} deployed {đã triển khai} failed_deployment "
      & "{triển khai thất bại} rolled_back {đã hoàn tác} "
      & "blocked_deployment {triển khai bị chặn} other {đã hủy "
      & "triển khai}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {môi trường ổn định} "
      & "drifting_environment {môi trường bị lệch cấu hình} "
      & "locked_environment {môi trường bị khóa} maintenance_environment "
      & "{môi trường đang bảo trì} other {trạng thái môi trường "
      & "không xác định}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {không có migration} migration_pending "
      & "{migration đang chờ} migrating {đang chạy migration} "
      & "migration_complete {migration hoàn tất} other {migration thất "
      & "bại}}");
   P ("label.deployments.promotion_label", "đã chuyển {name} từ {from_environment} lên {to_environment}");
   P ("label.deployments.rollback_label", "hoàn tác {name} về {target}");
   P ("label.deployments.rollout_label", "phát hành dần {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {không có mục nào bị ảnh hưởng} other "
      & "{{count, number} mục bị ảnh hưởng}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name} đạt trong {duration_s, "
      & "number} giây} failed_check {{name} không đạt trong {duration_s, "
      & "number} giây} warning_check {{name} có cảnh báo trong "
      & "{duration_s, number} giây} skipped_check {{name} đã bỏ qua trong "
      & "{duration_s, number} giây} pending_check {{name} đang chờ trong "
      & "{duration_s, number} giây} other {{name} đang chạy trong "
      & "{duration_s, number} giây}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name} đạt} failed_check {{name} "
      & "không đạt} warning_check {{name} có cảnh báo} skipped_check "
      & "{{name} đã bỏ qua} pending_check {{name} đang chờ} other "
      & "{{name} đang chạy}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {đạt} failed_check {không đạt} "
      & "warning_check {có cảnh báo} skipped_check {đã bỏ qua} "
      & "pending_check {đang chờ} other {đang chạy}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {cần một giá trị cho "
      & "{subject}{position, plural, =0 {} other { tại vị trí {position, "
      & "number}}}; hãy dùng {suggestion}} expected_unit {cần một đơn "
      & "vị cho {subject}{position, plural, =0 {} other { tại vị trí "
      & "{position, number}}}; hãy dùng {suggestion}} invalid_range {phạm "
      & "vi không hợp lệ cho {subject}{position, plural, =0 {} other { "
      & "tại vị trí {position, number}}}; hãy dùng {suggestion}} "
      & "end_before_start {điểm cuối phạm vi nằm trước điểm "
      & "đầu ở {subject}{position, plural, =0 {} other { tại vị trí "
      & "{position, number}}}; hãy dùng {suggestion}} unknown_field "
      & "{trường không xác định ở {subject}{position, plural, =0 {} "
      & "other { tại vị trí {position, number}}}; hãy dùng {suggestion}} "
      & "unsafe_redacted_value {giá trị không an toàn đã bị ẩn ở "
      & "{subject}{position, plural, =0 {} other { tại vị trí {position, "
      & "number}}}; hãy dùng {suggestion}} unsupported_syntax {cú pháp "
      & "không được hỗ trợ ở {subject}{position, plural, =0 {} other "
      & "{ tại vị trí {position, number}}}; hãy dùng {suggestion}} other "
      & "{giải thích chẩn đoán cho {subject}{position, plural, =0 {} "
      & "other { tại vị trí {position, number}}}; hãy dùng "
      & "{suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {thông tin} notice_severity {thông "
      & "báo} warning_severity {cảnh báo} error_severity {lỗi} "
      & "critical_severity {nghiêm trọng} other {chặn}} tại {path}{line, "
      & "plural, =0 {} other { dòng {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "thất bại tại {path}{line, plural, =0 {} other { dòng {line, "
      & "number}{column, plural, =0 {} other {, cột {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {thông tin} notice_severity {thông "
      & "báo} warning_severity {cảnh báo} error_severity {lỗi} "
      & "critical_severity {nghiêm trọng} other {chặn}} ở {field_name}: "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "lỗi đầu tiên trong {check_name} tại {path}{line, plural, =0 {} "
      & "other { dòng {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{không có vấn đề nào} other {{notices, number} thông báo}}} "
      & "other {{notices, plural, =0 {{warnings, number} cảnh báo} other "
      & "{{warnings, number} cảnh báo, {notices, number} thông báo}}}}} "
      & "other {{warnings, plural, =0 {{notices, plural, =0 {{errors, number} "
      & "lỗi} other {{errors, number} lỗi, {notices, number} thông báo}}} "
      & "other {{notices, plural, =0 {{errors, number} lỗi, {warnings, "
      & "number} cảnh báo} other {{errors, number} lỗi, {warnings, number} "
      & "cảnh báo, {notices, number} thông báo}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other { dòng {line, number}{column, "
      & "plural, =0 {} other {, cột {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {cú pháp không được hỗ trợ cho "
      & "trình phân tích byte {error}{position, plural, =0 {} other { tại "
      & "vị trí {position, number}}}; hãy dùng B, kB, MB, GB, KiB, MiB, "
      & "GiB hoặc TiB} duration_parser {cú pháp không được hỗ trợ "
      & "cho trình phân tích thời lượng {error}{position, plural, =0 {} "
      & "other { tại vị trí {position, number}}}; hãy dùng ms, s, min, "
      & "h, d, w, month hoặc year} date_time_parser {cú pháp không "
      & "được hỗ trợ cho trình phân tích ngày giờ "
      & "{error}{position, plural, =0 {} other { tại vị trí {position, "
      & "number}}}; hãy dùng ngày ISO, ngày dạng ngôn ngữ tự nhiên "
      & "hoặc giờ đồng hồ} color_parser {cú pháp không được "
      & "hỗ trợ cho trình phân tích màu {error}{position, plural, =0 {} "
      & "other { tại vị trí {position, number}}}; hãy dùng hex, rgb(), "
      & "hsl(), lab(), lch() hoặc tên màu} url_parser {cú pháp không "
      & "được hỗ trợ cho trình phân tích URL {error}{position, "
      & "plural, =0 {} other { tại vị trí {position, number}}}; hãy dùng "
      & "scheme, máy chủ, đường dẫn, truy vấn hoặc phân đoạn} "
      & "unit_parser {cú pháp không được hỗ trợ cho trình phân "
      & "tích đơn vị {error}{position, plural, =0 {} other { tại vị "
      & "trí {position, number}}}; hãy dùng một nhãn đơn vị được "
      & "Humanize hỗ trợ} recurrence_parser {cú pháp không được hỗ "
      & "trợ cho trình phân tích lặp lại {error}{position, plural, =0 "
      & "{} other { tại vị trí {position, number}}}; hãy dùng cron "
      & "hoặc dạng lặp every/weekday} domain_label_parser {cú pháp "
      & "không được hỗ trợ cho trình phân tích nhãn miền "
      & "{error}{position, plural, =0 {} other { tại vị trí {position, "
      & "number}}}; hãy dùng một nhãn miền Humanize xác định} other "
      & "{cú pháp không được hỗ trợ cho trình phân tích "
      & "{error}{position, plural, =0 {} other { tại vị trí {position, "
      & "number}}}; hãy dùng một dạng đầu vào được hỗ trợ}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {đạt} failed_check {không đạt} "
      & "warning_check {có cảnh báo} skipped_check {đã bỏ qua} "
      & "pending_check {đang chờ} other {đang chạy}}{notices, plural, =0 "
      & "{, không có thông báo} other {, {notices, number} thông báo}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {thử lại lần 1/1} other "
      & "{vượt quá giới hạn thử lại (lần {attempt, number}/1)}}} "
      & "other {thử lại lần {attempt, number}/{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {thông tin} notice_severity {thông "
      & "báo} warning_severity {cảnh báo} error_severity {lỗi} "
      & "critical_severity {nghiêm trọng} other {chặn}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {chẩn đoán bản dựng} test_source "
      & "{chẩn đoán kiểm thử} lint_source {chẩn đoán lint} "
      & "import_source {chẩn đoán nhập} validation_source {chẩn đoán "
      & "xác thực} runtime_source {chẩn đoán thời gian chạy} "
      & "security_source {chẩn đoán bảo mật} other {chẩn đoán}}");
   P ("label.diagnostics.source_summary_label",
      "{count, number} {source, select, build_source {chẩn đoán bản "
      & "dựng} test_source {chẩn đoán kiểm thử} lint_source {chẩn "
      & "đoán lint} import_source {chẩn đoán nhập} validation_source "
      & "{chẩn đoán xác thực} runtime_source {chẩn đoán thời gian "
      & "chạy} security_source {chẩn đoán bảo mật} other {chẩn "
      & "đoán}}");
   P ("label.diagnostics.suggested_action_label", "tiếp theo: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {máy chủ tên miền} ipv4_host {địa "
      & "chỉ IPv4} ipv6_host {địa chỉ IPv6} localhost_host {máy chủ "
      & "cục bộ} private_network_host {địa chỉ mạng riêng} other "
      & "{máy chủ không xác định}}");
   P ("label.events.all_day_label", "{name}, sự kiện cả ngày");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {chưa phản hồi} accepted {đã "
      & "chấp nhận} declined {đã từ chối} maybe {có thể} other "
      & "{trong danh sách chờ}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {không có người tham dự} other {{count, "
      & "number} người tham dự}}");
   P ("label.events.canceled_label", "đã hủy {name}");
   P ("label.events.check_in_label", "điểm danh tại {name}");
   P ("label.events.conference_link_label", "liên kết hội nghị {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {không có sự kiện nào} other {{count, "
      & "number} sự kiện}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {sự kiện đã lên lịch} "
      & "tentative_event {sự kiện dự kiến} in_progress_event {sự "
      & "kiện đang diễn ra} completed_event {sự kiện đã kết thúc} "
      & "canceled_event {sự kiện đã hủy} other {sự kiện đã "
      & "hoãn}}");
   P ("label.events.event_location_label", "{name} tại {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {sự kiện đã lên lịch} "
      & "tentative_event {sự kiện dự kiến} in_progress_event {sự "
      & "kiện đang diễn ra} completed_event {sự kiện đã kết thúc} "
      & "canceled_event {sự kiện đã hủy} other {sự kiện đã "
      & "hoãn}}");
   P ("label.events.event_time_label", "{name} lúc {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {sự kiện công khai} "
      & "private_event {sự kiện riêng tư} busy_event {bận} other "
      & "{rảnh}}");
   P ("label.events.organizer_label", "người tổ chức: {name}");
   P ("label.events.rsvp_label",
      "phản hồi lời mời: {state, select, not_responded {chưa phản "
      & "hồi} accepted {đã chấp nhận} declined {đã từ chối} maybe "
      & "{có thể} other {trong danh sách chờ}}");
   P ("label.events.reminder_label", "nhắc nhở {time_text}");
   P ("label.events.rescheduled_label", "đã dời {name} sang {time_text}");
   P ("label.forms.character_count_label", "{used, number} ký tự");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {không giới hạn ký tự} other {tối đa "
      & "{limit, number} ký tự}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, number} ký tự} other {{used, "
      & "number}/{limit, number} ký tự}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: trường tùy chọn} other "
      & "{{name}: trường bắt buộc}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: hợp lệ} invalid_input "
      & "{{name}: không hợp lệ} required_input {{name}: bắt buộc} "
      & "optional_input {{name}: tùy chọn} disabled_input {{name}: bị vô "
      & "hiệu hóa} other {{name}: chỉ đọc}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {biểu mẫu không có "
      & "vấn đề nào} other {{warnings, number} cảnh báo}}} other "
      & "{{warnings, plural, =0 {{errors, number} lỗi} other {{errors, "
      & "number} lỗi, {warnings, number} cảnh báo}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {chưa bắt đầu} editing_form {đang "
      & "chỉnh sửa} dirty_form {có thay đổi chưa lưu} saving_form "
      & "{đang lưu} saved_form {đã lưu} submitted_form {đã gửi} other "
      & "{gửi thất bại}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {dữ liệu hợp lệ} invalid_input "
      & "{dữ liệu không hợp lệ} required_input {dữ liệu bắt "
      & "buộc} optional_input {dữ liệu tùy chọn} disabled_input {ô "
      & "nhập bị vô hiệu hóa} other {ô nhập chỉ đọc}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {chưa bắt đầu} editing_form {đang "
      & "chỉnh sửa} dirty_form {có thay đổi chưa lưu} saving_form "
      & "{đang lưu biểu mẫu} saved_form {đã lưu biểu mẫu} "
      & "submitted_form {đã gửi biểu mẫu} other {{errors, plural, =0 "
      & "{gửi thất bại} other {gửi thất bại với {errors, number} "
      & "lỗi}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {không có thay đổi chưa lưu} other {{count, "
      & "number} thay đổi chưa lưu}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {thiếu tên truy "
      & "cập} low_contrast {độ tương phản thấp} "
      & "skipped_heading_level {bỏ qua cấp tiêu đề} missing_form_label "
      & "{thiếu nhãn biểu mẫu} invalid_aria {ARIA không hợp lệ} "
      & "keyboard_trap {bẫy bàn phím} other {vấn đề trợ năng không "
      & "xác định}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}, tóm tắt trợ năng: {landmarks, number} vùng mốc, "
      & "{headings, number} tiêu đề, {issues, number} vấn đề");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {thêm tên truy cập} "
      & "low_contrast {tăng độ tương phản văn bản} "
      & "skipped_heading_level {dùng các cấp tiêu đề tuần tự} "
      & "missing_form_label {gắn nhãn cho điều khiển biểu mẫu} "
      & "invalid_aria {dùng vai trò hoặc thuộc tính ARIA hợp lệ} "
      & "keyboard_trap {đảm bảo tiêu điểm bàn phím có thể rời "
      & "khỏi thành phần} other {xem lại vấn đề trợ năng}}");
   P ("label.markup.accessibility_summary_label",
      "{issues, plural, =0 {{target} không có vấn đề trợ năng nào} "
      & "other {{target} có {issues, number} vấn đề trợ năng}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {thuộc tính id} class_attribute "
      & "{thuộc tính class} data_attribute {thuộc tính dữ liệu} "
      & "aria_attribute {thuộc tính ARIA} role_attribute {thuộc tính "
      & "role} link_attribute {thuộc tính liên kết} media_attribute "
      & "{thuộc tính phương tiện} form_attribute {thuộc tính biểu "
      & "mẫu} boolean_attribute {thuộc tính boolean} event_attribute "
      & "{thuộc tính trình xử lý sự kiện} other {thuộc tính "
      & "không xác định}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name} không có "
      & "vấn đề nào} other {{form_name}: {warnings, number} cảnh "
      & "báo}}} other {{warnings, plural, =0 {{form_name}: {errors, number} "
      & "lỗi} other {{form_name}: {errors, number} lỗi, {warnings, number} "
      & "cảnh báo}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {mốc biểu ngữ} navigation_role {mốc "
      & "điều hướng} main_role {mốc chính} complementary_role {mốc "
      & "bổ trợ} contentinfo_role {mốc thông tin nội dung} search_role "
      & "{mốc tìm kiếm} form_role {mốc biểu mẫu} region_role {mốc "
      & "vùng} dialog_role {hộp thoại} alert_role {vùng trực tiếp "
      & "cảnh báo} status_role {vùng trực tiếp trạng thái} other "
      & "{mốc không xác định}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region} cập nhật khẩn: {update}} other "
      & "{{region} cập nhật: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {nội dung văn bản} html_content "
      & "{nội dung HTML} json_content {nội dung JSON} xml_content {nội "
      & "dung XML} image_content {nội dung hình ảnh} audio_content {nội "
      & "dung âm thanh} video_content {nội dung video} font_content {nội "
      & "dung phông chữ} archive_content {nội dung lưu trữ} "
      & "binary_content {nội dung nhị phân} form_content {nội dung "
      & "biểu mẫu} other {nội dung không xác định}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {thẻ tài liệu} metadata_tag {thẻ "
      & "siêu dữ liệu} section_tag {thẻ phân đoạn} text_tag {thẻ "
      & "văn bản} link_tag {thẻ liên kết} media_tag {thẻ phương "
      & "tiện} form_tag {thẻ biểu mẫu} table_tag {thẻ bảng} "
      & "interactive_tag {thẻ tương tác} scripting_tag {thẻ kịch "
      & "bản} other {thẻ không xác định}}");
   P ("label.media.duration_label", "thời lượng {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {hình ảnh} video_media {video} "
      & "audio_media {âm thanh} pdf_document {tài liệu PDF} text_document "
      & "{tài liệu văn bản} archive_media {tệp lưu trữ} other "
      & "{phương tiện}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {sẵn sàng} processing_media {đang xử "
      & "lý} transcoding_media {đang chuyển mã} thumbnail_missing {không "
      & "có hình thu nhỏ} metadata_missing {thiếu siêu dữ liệu} "
      & "locked_document {tài liệu bị khóa} other {không khả dụng}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {hình ảnh} video_media {video} "
      & "audio_media {âm thanh} pdf_document {tài liệu PDF} text_document "
      & "{tài liệu văn bản} archive_media {tệp lưu trữ} other "
      & "{phương tiện}}): {state, select, ready_media {sẵn sàng} "
      & "processing_media {đang xử lý} transcoding_media {đang chuyển "
      & "mã} thumbnail_missing {không có hình thu nhỏ} metadata_missing "
      & "{thiếu siêu dữ liệu} locked_document {tài liệu bị khóa} "
      & "other {không khả dụng}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {không có trang nào} other {{pages, number} "
      & "trang}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "kháng nghị cho {item}: {state, select, open_report {báo cáo đang "
      & "mở} triaged_report {báo cáo đã phân loại} actioned_report "
      & "{đã xử lý} dismissed_report {báo cáo bị bác bỏ} "
      & "appealed_report {báo cáo đã bị kháng nghị} other {báo cáo "
      & "đã đóng}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {không có hành động kiểm duyệt} "
      & "flagged {đã gắn cờ} hidden {bị người kiểm duyệt ẩn} "
      & "restored {đã khôi phục} marked_spam {đã đánh dấu là spam} "
      & "removed {đã gỡ bỏ} other {đã chuyển cấp trên}}");
end Labels_1;
