separate (Humanize.Catalogs.Phrase_Data.Locale_Vi)
procedure Labels_3 is
begin
   P ("label.secrets.fingerprint_label", "dấu vân tay {algorithm} kết thúc bằng {shown}");
   P ("label.secrets.secret_count_label.total", "{count, number} bí mật");
   P ("label.secrets.secret_count_label.masked", "{count, number} đã che");
   P ("label.secrets.secret_count_label.unset", "{count, number} chưa đặt");
   P ("label.secrets.secret_count_label.fingerprints", "{count, number} dấu vân tay");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} chưa đặt} redacted {{label} đã "
      & "ẩn} url_redacted {URL đã ẩn} ip_redacted {địa chỉ IP đã "
      & "ẩn} path_ending {đường dẫn tệp kết thúc bằng {shown}} "
      & "at {{label} tại {shown}} audit {{label} dài {length, number}, kết "
      & "thúc bằng {shown}} debug {{label} {shown}} other {{label} kết "
      & "thúc bằng {shown}}}");
   P ("label.schema.field_label",
      "trường {kind, select, string_field {chuỗi} integer_field {số "
      & "nguyên} decimal_field {số thập phân} boolean_field {boolean} "
      & "date_field {ngày} date_time_field {ngày giờ} object_field {đối "
      & "tượng} array_field {mảng} enum_field {enum} binary_field {nhị "
      & "phân} null_field {null} any_field {bất kỳ} other {không xác "
      & "định}} {name} {presence, select, required_field {bắt buộc} "
      & "optional_field {tùy chọn} conditional_field {có điều kiện} "
      & "other {không rõ bắt buộc}}{nullable, select, non_nullable {, "
      & "không null} nullable {, có thể null} other {}}{state, select, "
      & "deprecated_field {, không còn dùng} unknown_field {, không xác "
      & "định} read_only_field {, chỉ đọc} write_only_field {, chỉ "
      & "ghi} computed_field {, được tính toán} other {}}");
   P ("label.schema.schema_summary_label.fields", "{count, number} trường");
   P ("label.schema.schema_summary_label.required", "{count, number} bắt buộc");
   P ("label.schema.schema_summary_label.optional", "{count, number} tùy chọn");
   P ("label.schema.schema_summary_label.deprecated", "{count, number} không còn dùng");
   P ("label.schema.schema_summary_label.unknown", "{count, number} không xác định");
   P ("label.schema.type_mismatch_label",
      "trường {field_name} cần {expected, select, string_field {chuỗi} "
      & "integer_field {số nguyên} decimal_field {số thập phân} "
      & "boolean_field {boolean} date_field {ngày} date_time_field {ngày "
      & "giờ} object_field {đối tượng} array_field {mảng} enum_field "
      & "{enum} binary_field {nhị phân} null_field {null} any_field {bất "
      & "kỳ} other {không xác định}}, nhận được {actual, select, "
      & "string_field {chuỗi} integer_field {số nguyên} decimal_field "
      & "{số thập phân} boolean_field {boolean} date_field {ngày} "
      & "date_time_field {ngày giờ} object_field {đối tượng} "
      & "array_field {mảng} enum_field {enum} binary_field {nhị phân} "
      & "null_field {null} any_field {bất kỳ} other {không xác định}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, number} vấn đề chặn} "
      & "blocking {{base}, {blocking, number} vấn đề chặn} only {chỉ "
      & "{base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "không có kiểm tra nào được chạy");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} đạt");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} không đạt");
   P ("label.diagnostics.check_run_summary_label.warnings", "{count, number} cảnh báo");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} đã bỏ qua");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} đang chờ");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {phạm vi mục tiêu từ {low} "
      & "đến {high}} other {khoảng mục tiêu từ {low} đến {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} trong phạm vi dự kiến} below "
      & "{{value} dưới phạm vi dự kiến} other {{value} trên phạm vi "
      & "dự kiến}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} ở ngưỡng nghiêm trọng} "
      & "warning {{value} ở ngưỡng cảnh báo} other {{value} trong "
      & "phạm vi bình thường}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {chưa vượt ngưỡng} other {vượt ngưỡng "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {đạt mục tiêu} below {thấp hơn mục tiêu "
      & "{difference}} other {cao hơn mục tiêu {difference}}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {đã vượt giới hạn} near {gần "
      & "giới hạn, còn {distance}} other {cách giới hạn {distance}}}");
   P ("label.thresholds.threshold_summary_label.none", "không có chỉ số nào");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} bình thường");
   P ("label.thresholds.threshold_summary_label.warnings", "{count, number} cảnh báo");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} nghiêm trọng");
   P ("label.thresholds.threshold_summary_label.breaches", "{count, number} lần vượt ngưỡng");
   P ("label.thresholds.target_window_label", "mục tiêu {target} cộng trừ {tolerance}");
   P ("label.thresholds.tolerance_label", "dung sai {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} của giới hạn");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {vượt giới hạn {amount}} other {còn "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "đã dùng {used}/{budget}");
   P ("label.workflows.step_label", "bước {current, number}/{total, number}: {name}");
   P ("label.workflows.milestone_label",
      "đã hoàn thành {current, number}/{total, number} cột mốc: "
      & "{name}");
   P ("label.workflows.workflow_summary_label.total", "{count, number} mục");
   P ("label.workflows.workflow_summary_label.completed", "{count, number} đã hoàn thành");
   P ("label.workflows.workflow_summary_label.active", "{count, number} đang hoạt động");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} bị chặn");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} thất bại");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} đã bỏ qua");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {không có mục quy trình nào} half {đã đi "
      & "được nửa quy trình} other {đã hoàn thành {completed, "
      & "number}/{total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {vị trí hàng đợi {position, number}} other "
      & "{vị trí hàng đợi {position, number}/{total, number}}}");
   P ("label.changes.change_set_label.none", "không có thay đổi");
   P ("label.changes.change_set_label.added", "đã thêm {count, number}");
   P ("label.changes.change_set_label.removed", "đã xóa {count, number}");
   P ("label.changes.change_set_label.modified", "đã thay đổi {count, number}");
   P ("label.changes.change_set_label.unchanged", "{count, number} không đổi");
   P ("label.changes.change_summary_label.total", "{count, number} mục");
   P ("label.changes.change_summary_label.added", "đã thêm {count, number}");
   P ("label.changes.change_summary_label.removed", "đã xóa {count, number}");
   P ("label.changes.change_summary_label.modified", "đã thay đổi {count, number}");
   P ("label.changes.change_summary_label.renamed", "đã đổi tên {count, number}");
   P ("label.changes.change_summary_label.unchanged", "{count, number} không đổi");
   P ("label.changes.sync_change_label.none", "không có thay đổi đồng bộ");
   P ("label.changes.sync_change_label.uploaded", "đã tải lên {count, number}");
   P ("label.changes.sync_change_label.downloaded", "đã tải xuống {count, number}");
   P ("label.changes.sync_change_label.deleted", "đã xóa {count, number}");
   P ("label.changes.sync_change_label.conflicts", "{count, number} xung đột");
   P ("label.changes.net_change_label",
      "{state, select, none {không có thay đổi ròng} up {ròng +{count, "
      & "number} mục} other {ròng -{count, number} mục}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {không có thay đổi cần xem xét} all {đã "
      & "xem xét mọi thay đổi} other {đã xem xét {reviewed, "
      & "number}/{total, number} thay đổi}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} giữ nguyên ở {new_value}} up "
      & "{{field_name} tăng từ {old_value} lên {new_value}} other "
      & "{{field_name} giảm từ {old_value} xuống {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {không có hàng nào để chọn} none "
      & "{chưa chọn hàng nào} all {đã chọn tất cả {total, number} "
      & "hàng} other {đã chọn {selected, number}/{total, number} hàng}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {không có trang nào} other {{pages, plural, =0 "
      & "{không có trang nào} other {{rows, plural, =0 {trang {page, "
      & "number}/{pages, number}} other {trang {page, number}/{pages, number}, "
      & "{rows, number} hàng}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {không có hàng} none {không có hàng nào "
      & "khớp} all {hiển thị tất cả {total, number} hàng} other "
      & "{hiển thị {visible, number}/{total, number} hàng}}");
   P ("label.tables.row_range_label",
      "{state, select, none {không có hàng} single {hàng {first_row, "
      & "number}/{total, number}} other {hàng {first_row, number}-{last_row, "
      & "number}/{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {không giới hạn ký tự} none_left "
      & "{không còn ký tự nào} left {còn {count, number} ký tự} other "
      & "{vượt giới hạn {count, number} ký tự}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {không có trường bắt buộc} other "
      & "{{missing, plural, =0 {đã điền mọi trường bắt buộc} "
      & "other {thiếu {missing, number}/{total, number} trường bắt "
      & "buộc}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {không có trường nào} all {đã hoàn tất "
      & "mọi trường} other {đã hoàn tất {completed, number}/{total, "
      & "number} trường}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: không có trường nào} all {{name}: "
      & "đã hoàn tất mọi trường} other {{name}: đã hoàn tất "
      & "{completed, number}/{total, number} trường}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {không có bước biểu mẫu} other {bước "
      & "{current, number}/{total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {không có đường dẫn điều hướng} other "
      & "{đường dẫn điều hướng {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {không có thẻ} other {thẻ {current, "
      & "number}/{total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {hộp thư trống} other {{unread, plural, =0 "
      & "{đã đọc mọi thông báo} other {{unread, number}/{total, "
      & "number} thông báo chưa đọc}}}}");
   P ("label.notifications.delivery_attempt_label", "lần gửi thứ {attempt, number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {không có mục danh sách kiểm tra} other "
      & "{đã hoàn thành {done, number}/{total, number} mục}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {không có tệp tải lên} other {đã tải "
      & "lên {done, number}/{total, number} tệp}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {không có sức chứa} other {đã đặt "
      & "{reserved, number}/{capacity, number} chỗ}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {vị trí danh sách chờ {position, number}} "
      & "other {vị trí danh sách chờ {position, number}/{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} thay đổi} other {{name}: {changed, number} thay đổi, "
      & "{unchanged, number} không đổi, tổng {total, number}}}");
   P ("label.names.color_description", "{hue} {saturation}, {brightness}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {hồng} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {nút} link_control {liên kết} "
      & "tab_control {thẻ} menu_item_control {mục menu} checkbox_control "
      & "{hộp kiểm} radio_control {nút radio} text_field_control "
      & "{trường văn bản} progress_control {thanh tiến trình} "
      & "table_cell_control {ô bảng} region_control {vùng} other {điều "
      & "khiển}} {named, select, no {không tên} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "đã chọn");
   P ("label.markup.accessible_control_label.expanded", "đã mở rộng");
   P ("label.markup.accessible_control_label.current", "hiện tại");
   P ("label.markup.accessible_control_label.disabled", "bị vô hiệu hóa");
   P ("label.markup.accessible_control_label.required", "bắt buộc");
   P ("label.markup.accessible_control_label.invalid", "không hợp lệ");
   P ("label.markup.accessible_control_label.count", "{count, number} mục");
   P ("label.markup.accessible_control_label.position", "mục {position}/{total}");
   P ("label.markup.accessible_control_label.issues", "{count, number} vấn đề");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "lược đồ");
   P ("label.endpoints.url_component.host", "máy chủ");
   P ("label.endpoints.url_component.path", "đường dẫn");
   P ("label.endpoints.url_component.query", "truy vấn");
   P ("label.endpoints.url_component.fragment", "phân đoạn");
   P ("label.names.hue_noun.red", "đỏ");
   P ("label.names.hue_noun.orange", "cam");
   P ("label.names.hue_noun.yellow", "vàng");
   P ("label.names.hue_noun.green", "xanh lục");
   P ("label.names.hue_noun.cyan", "lục lam");
   P ("label.names.hue_noun.blue", "xanh lam");
   P ("label.names.hue_noun.purple", "tím");
   P ("label.names.hue_noun.magenta", "hồng cánh sen");
   P ("label.names.hue_noun.neutral", "trung tính");
   P ("label.names.hue_noun.pink", "hồng");
   P ("label.names.hue_gender.red", "other");
   P ("label.names.hue_gender.orange", "other");
   P ("label.names.hue_gender.yellow", "other");
   P ("label.names.hue_gender.green", "other");
   P ("label.names.hue_gender.cyan", "other");
   P ("label.names.hue_gender.blue", "other");
   P ("label.names.hue_gender.purple", "other");
   P ("label.names.hue_gender.magenta", "other");
   P ("label.names.hue_gender.neutral", "other");
   P ("label.names.hue_gender.pink", "other");
   P ("label.names.agree.very_dark", "{gender, select, other {rất tối}}");
   P ("label.names.agree.dark", "{gender, select, other {tối}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {độ sáng trung bình}}");
   P ("label.names.agree.light", "{gender, select, other {sáng}}");
   P ("label.names.agree.very_light", "{gender, select, other {rất sáng}}");
   P ("label.names.agree.desaturated", "{gender, select, other {kém bão hòa}}");
   P ("label.names.agree.muted", "{gender, select, other {trầm}}");
   P ("label.names.agree.neutral", "{gender, select, other {trung tính}}");
   P ("label.names.agree.saturated", "{gender, select, other {bão hòa}}");
   P ("label.names.agree.vivid", "{gender, select, other {rực rỡ}}");
   P ("label.names.agree.grayish", "{gender, select, other {ngả xám}}");
   P ("label.names.agree.soft", "{gender, select, other {dịu}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {sắc độ vừa}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {sắc độ cao}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, other {ấm}}");
   P ("label.names.agree.cool", "{gender, select, other {lạnh}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {nhiệt độ màu trung tính}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {nhiệt độ màu cân bằng}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "màu tiền cảnh hiện tại đạt độ tương phản cho chữ "
      & "lớn ở mức {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "màu tiền cảnh hiện tại đạt độ tương phản cho chữ "
      & "thường ở mức {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "dùng {v1} để đạt độ tương phản nâng cao cho chữ {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "dùng {v1} để đạt độ tương phản cho chữ lớn {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "dùng {v1} để đạt độ tương phản cho chữ thường "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "dùng {v1} để đạt độ tương phản cho chữ lớn {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "dùng {v1} để đạt độ tương phản nâng cao cho chữ "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "màu tiền cảnh hiện tại đạt độ tương phản cho chữ "
      & "lớn ở mức {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "màu tiền cảnh hiện tại đạt độ tương phản cho chữ "
      & "thường ở mức {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "màu tiền cảnh hiện tại đạt độ tương phản nâng cao "
      & "cho chữ ở mức {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "màu tiền cảnh hiện tại đạt độ tương phản nâng cao "
      & "cho chữ ở mức {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "mù màu đỏ: nguy cơ nhầm lẫn thấp, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "mù màu lục: nguy cơ nhầm lẫn trung bình, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "mù màu lam: nguy cơ nhầm lẫn trung bình, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "mù màu toàn phần: nguy cơ nhầm lẫn cao, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 dệt may delta {v1}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, khác biệt cảm nhận lớn");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "mù màu đỏ: nguy cơ nhầm lẫn trung bình, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, khác biệt cảm nhận rất lớn");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "mù màu toàn phần: nguy cơ nhầm lẫn thấp, delta {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "mù màu đỏ: phân biệt được, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "mù màu lục: phân biệt được, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "mù màu lam: phân biệt được, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "mù màu toàn phần: phân biệt được, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "mù màu toàn phần: nguy cơ nhầm lẫn trung bình, delta {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 dệt may delta {v1}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, khác biệt cảm nhận rõ");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "mù màu đỏ: nguy cơ nhầm lẫn cao, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "mù màu lam: nguy cơ nhầm lẫn cao, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, khác biệt cảm nhận rõ");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 dệt may delta {v1}, khác biệt cảm nhận rõ");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, khác biệt cảm nhận rõ");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, khác biệt cảm nhận rõ");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "mù màu lam: nguy cơ nhầm lẫn thấp, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "mù màu lục: nguy cơ nhầm lẫn thấp, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, khác biệt cảm nhận lớn");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "mù màu lục: nguy cơ nhầm lẫn cao, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 dệt may delta {v1, number}, khác biệt cảm nhận rất "
      & "lớn");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, khác biệt cảm nhận rất lớn");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 dệt may delta {v1, number}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, khác biệt cảm nhận rõ");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 dệt may delta {v1}, khác biệt cảm nhận nhẹ");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, khác biệt cảm nhận rõ");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 dệt may delta {v1, number}, khác biệt cảm nhận rõ");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, hầu như không nhận thấy");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible",
      "CIE94 delta {v1}, không nhận thấy");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 dệt may delta {v1}, không nhận thấy");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, không nhận thấy");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible",
      "OKLab delta {v1}, không nhận thấy");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, khác biệt cảm nhận lớn");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, không nhận thấy");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, không nhận thấy");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 dệt may delta {v1, number}, không nhận thấy");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, không nhận thấy");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, không nhận thấy");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, khác biệt cảm nhận nhẹ");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, khác biệt cảm nhận nhẹ");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, khác biệt cảm nhận nhẹ");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, hầu như không nhận thấy");
   P ("label.metrics.text_summary.n_words", "{v1, number} từ");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} đoạn");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} phút nói");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} câu");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} phút đọc");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} đoạn");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "dưới {v1, number} phút nói");
   P ("label.metrics.text_summary.less_than_n_minute_read", "dưới {v1, number} phút đọc");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} câu");
   P ("label.metrics.text_summary.no_words", "không có từ nào");
   P ("label.metrics.text_summary.no_paragraphs", "không có đoạn nào");
   P ("label.metrics.text_summary.no_sentences", "không có câu nào");
   P ("label.metrics.text_summary.n_word", "{v1, number} từ");
   P ("label.names.hue_family_label.neutral", "trung tính");
   P ("label.names.saturation_label.neutral", "trung tính");
   P ("label.names.temperature_label.neutral_temperature", "nhiệt độ màu trung tính");
   P ("label.names.chroma_label.grayish", "ngả xám");
   P ("label.names.nearest_color_name.black", "đen");
   P ("label.models.brightness_label.very_dark", "rất tối");
   P ("label.names.hue_family_label.blue", "xanh lam");
   P ("label.names.saturation_label.vivid", "rực rỡ");
   P ("label.names.temperature_label.cool", "lạnh");
   P ("label.names.chroma_label.moderate_chroma", "sắc độ vừa");
   P ("label.names.nearest_color_name.navy", "xanh hải quân");
   P ("label.names.chroma_label.high_chroma", "sắc độ cao");
   P ("label.names.nearest_color_name.blue", "xanh lam");
   P ("label.names.hue_family_label.green", "xanh lục");
   P ("label.names.temperature_label.balanced_temperature", "nhiệt độ màu cân bằng");
   P ("label.names.hue_family_label.cyan", "lục lam");
   P ("label.names.chroma_label.soft", "dịu");
   P ("label.models.brightness_label.dark", "tối");
   P ("label.names.nearest_color_name.green", "xanh lục");
   P ("label.names.nearest_color_name.teal", "xanh mòng két");
   P ("label.models.brightness_label.medium_brightness", "độ sáng trung bình");
   P ("label.names.nearest_color_name.aqua", "xanh aqua");
   P ("label.names.nearest_color_name.lime", "xanh chanh");
   P ("label.models.brightness_label.light", "sáng");
   P ("label.names.hue_family_label.red", "đỏ");
   P ("label.names.temperature_label.warm", "ấm");
   P ("label.names.hue_family_label.magenta", "hồng cánh sen");
   P ("label.names.hue_family_label.purple", "tím");
   P ("label.names.hue_family_label.yellow", "vàng");
   P ("label.names.saturation_label.muted", "trầm");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "bão hòa");
   P ("label.names.nearest_color_name.maroon", "đỏ nâu");
   P ("label.names.nearest_color_name.purple", "tím");
   P ("label.names.hue_family_label.orange", "cam");
   P ("label.names.nearest_color_name.olive", "xanh ô liu");
   P ("label.names.nearest_color_name.gray", "xám");
   P ("label.names.saturation_label.desaturated", "kém bão hòa");
   P ("label.names.nearest_color_name.silver", "bạc");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "rất sáng");
   P ("label.names.nearest_color_name.fuchsia", "hồng vân anh");
   P ("label.names.nearest_color_name.yellow", "vàng");
   P ("label.names.nearest_color_name.red", "đỏ");
   P ("label.names.nearest_color_name.orange", "cam");
   P ("label.names.nearest_color_name.white", "trắng");
   P ("label.contrast.contrast_label.d_n_low_contrast", "độ tương phản thấp {v1}:{v2, number}");
   P ("label.contrast.readability_label.low_readability", "khó đọc");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, không đạt, chữ tối trên nền sáng");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "độ tương phản thấp {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, không đạt, chữ tối trên nền sáng");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "mù màu toàn phần: nguy cơ nhầm lẫn trung bình");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% khác biệt mạnh");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "độ tương phản thấp {v1}:{v2, number} sau khi trộn alpha");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, không đạt, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, không đạt, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "mù màu lục: nguy cơ nhầm lẫn cao");
   P ("label.contrast.contrast_label.d_n_large_text_contrast",
      "độ tương phản cho chữ lớn {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_large_text_only", "chỉ dễ đọc với chữ lớn");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, chữ lớn, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "độ tương phản cho chữ lớn {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, chữ lớn, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "mù màu lam: nguy cơ nhầm lẫn cao");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "độ tương phản cho chữ lớn {v1}:{v2, number} sau khi trộn "
      & "alpha");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, chỉ cho phi văn bản, chữ sáng trên nền "
      & "tối");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, chỉ cho phi văn bản, chữ sáng trên nền "
      & "tối");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "mù màu lam: nguy cơ nhầm lẫn trung bình");
   P ("label.contrast.contrast_label.n_n_low_contrast", "độ tương phản thấp {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast",
      "độ tương phản thấp {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, chỉ cho phi văn bản, chữ tối trên nền "
      & "sáng");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, chỉ cho phi văn bản, chữ tối trên nền "
      & "sáng");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "mù màu lục: nguy cơ nhầm lẫn trung bình");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "mù màu đỏ: nguy cơ nhầm lẫn cao");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% rất khác");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "mù màu toàn phần: nguy cơ nhầm lẫn cao");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "mù màu toàn phần: nguy cơ nhầm lẫn thấp");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "độ tương phản thấp {v1, number}:{v2, number} sau khi trộn "
      & "alpha");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast",
      "độ tương phản cho chữ thường {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_normal_text", "dễ đọc với chữ thường");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, chữ nội dung, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "độ tương phản cho chữ thường {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, chữ nội dung, chữ sáng trên nền tối");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, chữ lớn, chữ tối trên nền sáng");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, chữ lớn, chữ tối trên nền sáng");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% khác biệt nhẹ");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, chữ nội dung, chữ tối trên nền sáng");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, chữ nội dung, chữ tối trên nền sáng");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "mù màu lam: nguy cơ nhầm lẫn thấp");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% khác biệt rõ");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "độ tương phản cho chữ lớn {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "độ tương phản cho chữ lớn {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "mù màu lục: nguy cơ nhầm lẫn thấp");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "độ tương phản nâng cao {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_enhanced_text",
      "dễ đọc ở mức tương phản nâng cao");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast",
      "độ tương phản nâng cao {v1}:{v2, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, khác biệt cảm nhận nhẹ");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "mù màu lam: phân biệt được");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "độ tương phản cho chữ thường {v1, number}:{v2, number} sau "
      & "khi trộn alpha");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "mù màu đỏ: nguy cơ nhầm lẫn trung bình");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "độ tương phản cho chữ thường {v1}:{v2, number} sau khi "
      & "trộn alpha");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "độ tương phản cho chữ lớn {v1, number}:{v2, number} sau khi "
      & "trộn alpha");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, xuất sắc, chữ tối trên nền sáng");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, xuất sắc, chữ tối trên nền sáng");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "độ tương phản cho chữ thường {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "độ tương phản cho chữ thường {v1, number}:{v2, number}");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast",
      "độ tương phản nâng cao {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, xuất sắc, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "độ tương phản nâng cao {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, xuất sắc, chữ sáng trên nền tối");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "mù màu lục: phân biệt được");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "độ tương phản nâng cao {v1}:{v2, number} sau khi trộn alpha");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, hầu như không nhận thấy");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% gần như giống hệt");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "mù màu đỏ: nguy cơ nhầm lẫn thấp");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct",
      "mù màu toàn phần: phân biệt được");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} màu");
   P ("label.palettes.palette_summary.mostly_gray", "chủ yếu xám");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "độ trải tương phản trung bình");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "nền {v1}, chữ {v2}, điểm nhấn {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "bảng màu bộ ba");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "tương phản tốt nhất: {v1} trên {v2} ở mức {v3}:{v4, "
      & "number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number}/{v2, number} cặp đạt độ tương phản cho chữ "
      & "thường");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} nâng cao, {v2, number} thường, {v3, number} chỉ "
      & "chữ lớn, {v4, number} không đạt trên tổng {v5, number} "
      & "cặp");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} màu, {v2, number} cặp: {v3, number} nâng cao, {v4, "
      & "number} thường, {v5, number} chỉ chữ lớn, {v6, number} không "
      & "đạt");
   P ("label.palettes.palette_mood_label.balanced", "cân bằng");
   P ("label.palettes.palette_mood_label.vibrant", "sống động");
   P ("label.palettes.palette_mood_label.warm_mood", "tông ấm");
   P ("label.palettes.palette_summary.mostly_blue", "chủ yếu xanh lam");
   P ("label.palettes.palette_summary.low_contrast_spread", "độ trải tương phản thấp");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "bảng màu một điểm nhấn");
   P ("label.palettes.palette_mood_label.dark", "tối");
   P ("label.palettes.palette_mood_label.cool_mood", "tông lạnh");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "chủ yếu rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs",
      "không có cặp chữ nào đạt chuẩn tiếp cận");
   P ("label.palettes.palette_mood_label.subtle", "tinh tế");
   P ("label.palettes.palette_summary.high_contrast_spread", "độ trải tương phản cao");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "tương phản tốt nhất: {v1} trên {v2} ở mức {v3, "
      & "number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "tông trung tính");
   P ("label.palettes.palette_summary.mostly_purple", "chủ yếu tím");
   P ("label.palettes.palette_harmony_label.complementary_palette", "bảng màu bổ túc");
   P ("label.palettes.palette_summary.mostly_green", "chủ yếu xanh lục");
   P ("label.palettes.palette_mood_label.moderate", "vừa phải");
   P ("label.palettes.palette_summary.mostly_silver", "chủ yếu bạc");
   P ("label.palettes.palette_harmony_label.varied_palette", "bảng màu đa dạng");
   P ("label.palettes.palette_summary.mostly_olive", "chủ yếu xanh ô liu");
   P ("label.palettes.palette_harmony_label.analogous_palette", "bảng màu tương đồng");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number}/{v2, number} cặp chỉ đạt cho chữ lớn");
   P ("label.palettes.palette_mood_label.light", "sáng");
   P ("label.palettes.palette_summary.mostly_teal", "chủ yếu xanh mòng két");
   P ("label.palettes.palette_summary.mostly_aqua", "chủ yếu xanh aqua");
   P ("label.palettes.palette_summary.mostly_lime", "chủ yếu xanh chanh");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "bảng màu đơn sắc");
   P ("label.palettes.palette_summary.mostly_black", "chủ yếu đen");
   P ("label.palettes.palette_summary.mostly_yellow", "chủ yếu vàng");
   P ("label.palettes.palette_summary.mostly_maroon", "chủ yếu đỏ nâu");
   P ("label.palettes.palette_summary.mostly_white", "chủ yếu trắng");
   P ("label.palettes.palette_summary.mostly_orange", "chủ yếu cam");
   P ("label.palettes.palette_summary.mostly_fuchsia", "chủ yếu hồng vân anh");
   P ("label.palettes.palette_harmony_label.neutral_palette", "bảng màu trung tính");
   P ("label.palettes.palette_summary.mostly_red", "chủ yếu đỏ");
   P ("label.metrics.word_count_summary.n_words", "{v1, number} từ");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number} câu");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number} đoạn");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} phút đọc");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} phút nói");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number} từ");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number} câu");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number} đoạn");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} phút đọc");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number} đoạn");
   P ("label.metrics.reading_time.less_than_n_minute_read", "dưới {v1, number} phút đọc");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "dưới {v1, number} phút nói");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} đoạn");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "dưới {v1, number} phút đọc");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} câu");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} câu");
   P ("label.metrics.word_count_summary.no_words", "không có từ nào");
   P ("label.metrics.sentence_count_summary.no_sentences", "không có câu nào");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "không có đoạn nào");
   P ("label.metrics.text_summary_with_options.no_words", "không có từ nào");
   P ("label.metrics.text_summary_with_options.no_sentences", "không có câu nào");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "không có đoạn nào");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} từ");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} từ");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {URL trống} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {URL trống} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[người dùng bị ẩn]");
   P ("label.endpoints.url_label.query", "truy vấn {count, plural, other {{count, number} tham số}}");
end Labels_3;
