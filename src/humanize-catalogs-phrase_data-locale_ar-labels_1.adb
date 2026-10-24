separate (Humanize.Catalogs.Phrase_Data.Locale_Ar)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {الحساب {name} نشط} "
      & "invited_account {الحساب {name} مدعو} locked_account "
      & "{الحساب {name} مقفل} suspended_account {الحساب {name} "
      & "موقوف} deleted_account {الحساب {name} محذوف} other "
      & "{الحساب {name}: حالة غير معروفة}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {حساب نشط} invited_account "
      & "{حساب مدعو} locked_account {حساب مقفل} "
      & "suspended_account {حساب موقوف} deleted_account {حساب "
      & "محذوف} other {حالة حساب غير معروفة}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {جهاز موثوق} untrusted_device "
      & "{جهاز غير موثوق} new_device {جهاز جديد} other "
      & "{جهاز محظور}}");
   P ("label.accounts.last_active_label", "{name}: آخر نشاط {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: فشل تسجيل الدخول} "
      & "other {{name}: نجح تسجيل الدخول}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA مفعّلة} mfa_disabled {MFA "
      & "معطّلة} mfa_required {MFA مطلوبة} other {إعادة "
      & "تعيين MFA مطلوبة}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {الجلسة {name} نشطة} "
      & "expired_session {الجلسة {name} منتهية} revoked_session "
      & "{الجلسة {name} ملغاة} idle_session {الجلسة {name} "
      & "خاملة} other {الجلسة {name}: حالة غير معروفة}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {جلسة نشطة} expired_session "
      & "{انتهت الجلسة} revoked_session {أُلغيت الجلسة} "
      & "idle_session {جلسة خاملة} other {حالة جلسة غير "
      & "معروفة}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {لا توجد مرفقات} one {مرفق "
      & "واحد} two {مرفقان} few {{count, number} مرفقات} many "
      & "{{count, number} مرفقًا} other {{count, number} مرفق}}");
   P ("label.attachments.attachment_group_label",
      "{name}: {count, plural, =0 {لا توجد مرفقات} one {مرفق "
      & "واحد} two {مرفقان} few {{count, number} مرفقات} many "
      & "{{count, number} مرفقًا} other {{count, number} مرفق}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {مرفق ملف} image_attachment "
      & "{مرفق صورة} video_attachment {مرفق فيديو} "
      & "audio_attachment {مرفق صوتي} document_attachment {مرفق "
      & "مستند} archive_attachment {مرفق أرشيف} other {مرفق "
      & "رابط}}");
   P ("label.attachments.attachment_label",
      "المرفق {name} ({kind, select, file_attachment {ملف} "
      & "image_attachment {صورة} video_attachment {فيديو} "
      & "audio_attachment {صوت} document_attachment {مستند} "
      & "archive_attachment {أرشيف} other {رابط}}): {state, select, "
      & "pending_attachment {معلّق} uploading_attachment {جارٍ "
      & "الرفع} uploaded_attachment {تم الرفع} failed_attachment "
      & "{فشل} removed_attachment {أُزيل} other {محظور}}");
   P ("label.attachments.attachment_size_label", "{name}، {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {مرفق معلّق} "
      & "uploading_attachment {جارٍ رفع المرفق} "
      & "uploaded_attachment {مرفق مرفوع} failed_attachment {مرفق "
      & "فاشل} removed_attachment {مرفق مُزال} other {مرفق "
      & "محظور}}");
   P ("label.attachments.download_label", "تنزيل {name}");
   P ("label.attachments.expiring_link_label", "ينتهي الرابط {name} {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}، {dimensions}");
   P ("label.attachments.preview_label", "معاينة {name}");
   P ("label.attachments.remove_label", "إزالة {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: لم يُفحص} scanning "
      & "{{name}: جارٍ الفحص} safe {{name}: آمن} suspicious "
      & "{{name}: مريب} other {{name}: مصاب}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {لم يُفحص} scanning {جارٍ "
      & "الفحص} safe {الفحص: آمن} suspicious {الفحص: "
      & "مريب} other {الفحص: مصاب}}");
   P ("label.attachments.upload_error_label", "فشل رفع {name}: {reason}");
   P ("label.badges.badge_label",
      "الشارة {name} ({tone, select, neutral_tone {محايدة} "
      & "info_tone {معلومات} success_tone {نجاح} warning_tone "
      & "{تحذير} danger_tone {خطر} other {باهتة}}{state, select, "
      & "default_badge {} new_badge {، جديدة} updated_badge {، "
      & "محدّثة} deprecated_badge {، مهملة} selected_badge {، "
      & "محددة} disabled_badge {، معطّلة} other {، قابلة "
      & "للإغلاق}})");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {شارة أولوية منخفضة} "
      & "medium_priority {شارة أولوية متوسطة} high_priority "
      & "{شارة أولوية عالية} other {شارة أولوية "
      & "حرجة}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {شارة افتراضية} new_badge "
      & "{شارة جديدة} updated_badge {شارة محدّثة} "
      & "deprecated_badge {شارة مهملة} selected_badge {شارة "
      & "محددة} disabled_badge {شارة معطّلة} other {شارة "
      & "قابلة للإغلاق}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {شارة محايدة} info_tone "
      & "{شارة معلومات} success_tone {شارة نجاح} "
      & "warning_tone {شارة تحذير} danger_tone {شارة خطر} other "
      & "{شارة باهتة}}");
   P ("label.badges.chip_label",
      "{selected, select, false {الشريحة {name}} other {الشريحة "
      & "{name}، محددة}}");
   P ("label.badges.count_badge_label", "{name}: {count, plural, =0 {لا يوجد} other {{count, number}}}");
   P ("label.badges.deprecated_label", "الشارة {name} (تحذير، مهملة)");
   P ("label.badges.dismiss_label", "إغلاق {name}");
   P ("label.badges.new_label", "الشارة {name} (معلومات، جديدة)");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {لا توجد شارات مخفية} one "
      & "{+شارة واحدة أخرى} two {+شارتان أخريان} few "
      & "{+{hidden_count, number} شارات أخرى} many {+{hidden_count, "
      & "number} شارةً أخرى} other {+{hidden_count, number} شارة "
      & "أخرى}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {الشارة {name}، أولوية "
      & "منخفضة} medium_priority {الشارة {name}، أولوية "
      & "متوسطة} high_priority {الشارة {name}، أولوية "
      & "عالية} other {الشارة {name}، أولوية حرجة}}");
   P ("label.badges.status_badge_label",
      "حالة {name}: {tone, select, neutral_tone {محايدة} info_tone "
      & "{معلومات} success_tone {نجاح} warning_tone {تحذير} "
      & "danger_tone {خطر} other {باهتة}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {لا توجد وسوم} one {وسم واحد} two "
      & "{وسمان} few {{count, number} وسوم} many {{count, number} "
      & "وسمًا} other {{count, number} وسم}}");
   P ("label.badges.tag_label", "الوسم {name}");
   P ("label.badges.updated_label", "الشارة {name} (نجاح، محدّثة)");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {تم رفع ناتج البناء} "
      & "artifact_missing {ناتج البناء مفقود} artifact_expired "
      & "{انتهت صلاحية ناتج البناء} other {تم "
      & "التحقق من ناتج البناء}}");
   P ("label.builds.benchmark_label", "قياس الأداء {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {البناء {name}: في قائمة "
      & "الانتظار} build_running {البناء {name}: قيد "
      & "التشغيل} build_passed {البناء {name}: ناجح} "
      & "build_failed {البناء {name}: فاشل} snapshot_build {بناء "
      & "لقطة {name}} other {بناء إصدار {name}}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {البناء في قائمة "
      & "الانتظار} build_running {البناء قيد التشغيل} "
      & "build_passed {نجح البناء} build_failed {فشل البناء} "
      & "snapshot_build {بناء لقطة} other {بناء إصدار}}");
   P ("label.builds.coverage_label", "التغطية {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {نجحت بوابة الإصدار} "
      & "gate_failed {فشلت بوابة الإصدار} gate_warning "
      & "{تحذير في بوابة الإصدار} other {بوابة "
      & "الإصدار محظورة}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {لا توجد "
      & "اختبارات ناجحة} other {الاختبارات "
      & "الناجحة: {count, number}}}} failed_test {{count, plural, =0 "
      & "{لا توجد اختبارات فاشلة} other "
      & "{الاختبارات الفاشلة: {count, number}}}} skipped_test "
      & "{{count, plural, =0 {لا توجد اختبارات متخطاة} "
      & "other {الاختبارات المتخطاة: {count, number}}}} "
      & "flaky_test {{count, plural, =0 {لا توجد اختبارات غير "
      & "مستقرة} other {الاختبارات غير المستقرة: "
      & "{count, number}}}} other {{count, plural, =0 {لا توجد "
      & "اختبارات فاشلة كما هو متوقع} other "
      & "{الاختبارات الفاشلة كما هو متوقع: {count, "
      & "number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {ناجح} failed_test {فاشل} "
      & "skipped_test {متخطى} flaky_test {غير مستقر} other {فشل "
      & "متوقع}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name} "
      & "دون تغيير، معطّل} other {{field_name} تغيّر من "
      & "معطّل إلى مفعّل}}} other {{new_value, select, false "
      & "{{field_name} تغيّر من مفعّل إلى معطّل} other "
      & "{{field_name} دون تغيير، مفعّل}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {أُضيف} removed_change {أُزيل} "
      & "modified_change {تغيّر} renamed_change {أُعيدت "
      & "تسميته} unchanged_change {دون تغيير} metadata_change "
      & "{تغيّرت البيانات الوصفية} moved_change {نُقل} "
      & "conflict_change {تعارض} other {تغيير غير معروف}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {تغيير إعلامي} "
      & "minor_change {تغيير طفيف} major_change {تغيير كبير} "
      & "other {تغيير كاسر للتوافق}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name} دون "
      & "تغيير} other {{unchanged, plural, =0 {{field_name} تغيّر: "
      & "المضاف {added, number}} other {{field_name} تغيّر: "
      & "المضاف {added, number}، دون تغيير {unchanged, "
      & "number}}}}}} other {{added, plural, =0 {{unchanged, plural, =0 "
      & "{{field_name} تغيّر: المحذوف {removed, number}} other "
      & "{{field_name} تغيّر: المحذوف {removed, number}، دون "
      & "تغيير {unchanged, number}}}} other {{unchanged, plural, =0 "
      & "{{field_name} تغيّر: المضاف {added, number}، "
      & "المحذوف {removed, number}} other {{field_name} تغيّر: "
      & "المضاف {added, number}، المحذوف {removed, number}، "
      & "دون تغيير {unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {لا توجد تعارضات} one {تعارض "
      & "واحد} two {تعارضان} few {{count, number} تعارضات} "
      & "many {{count, number} تعارضًا} other {{count, number} "
      & "تعارض}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {أُخّر {field_name} من {old_label} "
      & "إلى {new_label}} other {قُدّم {field_name} من {old_label} "
      & "إلى {new_label}}}");
   P ("label.changes.duration_field_change_label", "تغيّر {field_name} من {old_label} إلى {new_label}");
   P ("label.changes.field_change_label", "تغيّر {field_name} من {old_value} إلى {new_value}");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {أُضيف {name}} removed_change "
      & "{أُزيل {name}} modified_change {تغيّر {name}} renamed_change "
      & "{أُعيدت تسمية {name}} unchanged_change {{name} دون "
      & "تغيير} metadata_change {تغيّرت البيانات "
      & "الوصفية لـ{name}} moved_change {نُقل {name}} "
      & "conflict_change {تعارض في {name}} other {{name}: تغيير "
      & "غير معروف}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {تغيّرت البيانات الوصفية "
      & "فقط} one {تغيّر حقل بيانات وصفية واحد "
      & "فقط} two {تغيّر حقلا بيانات وصفية فقط} few "
      & "{تغيّرت {count, number} حقول بيانات وصفية فقط} "
      & "many {تغيّر {count, number} حقلًا من البيانات "
      & "الوصفية فقط} other {تغيّر {count, number} حقل "
      & "بيانات وصفية فقط}}");
   P ("label.changes.move_label", "نُقل {name} من {from} إلى {to}");
   P ("label.changes.no_changes_label", "لا توجد تغييرات");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {لا "
      & "تغييرات في الأسطر} other {أسطر مضافة: "
      & "{lines_added, number}}}} other {{lines_added, plural, =0 {أسطر "
      & "محذوفة: {lines_removed, number}} other {أسطر مضافة: "
      & "{lines_added, number}، أسطر محذوفة: {lines_removed, "
      & "number}}}}}");
   P ("label.changes.rename_label", "أُعيدت التسمية من {old_name} إلى {new_name}");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {صاغ {author} مسودة تعليق} "
      & "published_comment {علّق {author}} edited_comment {عدّل "
      & "{author} تعليقًا} deleted_comment {حذف {author} "
      & "تعليقًا} resolved_comment {حلّ {author} تعليقًا} "
      & "unresolved_comment {أعاد {author} فتح تعليق} "
      & "pinned_comment {ثبّت {author} تعليقًا} other {أخفى "
      & "{author} تعليقًا}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {لا توجد تعليقات} one {تعليق "
      & "واحد} two {تعليقان} few {{count, number} تعليقات} "
      & "many {{count, number} تعليقًا} other {{count, number} "
      & "تعليق}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {تعليق {author}: مسودة} "
      & "published_comment {تعليق {author}: منشور} edited_comment "
      & "{تعليق {author}: معدّل} deleted_comment {تعليق "
      & "{author}: محذوف} resolved_comment {تعليق {author}: "
      & "محلول} unresolved_comment {تعليق {author}: غير "
      & "محلول} pinned_comment {تعليق {author}: مثبّت} other "
      & "{تعليق {author}: مخفي}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {مسودة تعليق} "
      & "published_comment {تعليق منشور} edited_comment {تعليق "
      & "معدّل} deleted_comment {تعليق محذوف} resolved_comment "
      & "{تعليق محلول} unresolved_comment {تعليق غير "
      & "محلول} pinned_comment {تعليق مثبّت} other {تعليق "
      & "مخفي}}");
   P ("label.comments.deleted_label", "حذف {author} تعليقًا");
   P ("label.comments.edited_label", "عُدّل {time_text}");
   P ("label.comments.hide_comment_label", "إخفاء التعليق: {reason}");
   P ("label.comments.lock_thread_label", "قفل سلسلة النقاش {name}");
   P ("label.comments.mention_label", "أشار {actor} إلى {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {لا يوجد مشاركون} one {مشارك "
      & "واحد} two {مشاركان} few {{count, number} مشاركين} "
      & "many {{count, number} مشاركًا} other {{count, number} "
      & "مشارك}}");
   P ("label.comments.pin_label", "تثبيت {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {تفاعل إعجاب} dislike_reaction "
      & "{تفاعل عدم إعجاب} heart_reaction {تفاعل قلب} "
      & "laugh_reaction {تفاعل ضحك} confused_reaction {تفاعل "
      & "حيرة} hooray_reaction {تفاعل احتفال} rocket_reaction "
      & "{تفاعل صاروخ} other {تفاعل عيون}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {إعجاب} dislike_reaction {عدم "
      & "إعجاب} heart_reaction {قلب} laugh_reaction {ضحك} "
      & "confused_reaction {حيرة} hooray_reaction {احتفال} "
      & "rocket_reaction {صاروخ} other {عيون}}: {count, plural, =0 "
      & "{لا يوجد} other {{count, number}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {لا توجد ردود} one {رد واحد} two "
      & "{ردان} few {{count, number} ردود} many {{count, number} "
      & "ردًا} other {{count, number} رد}}");
   P ("label.comments.resolved_label", "تم حل {name}");
   P ("label.comments.subscribe_label", "الاشتراك في {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {لا توجد سلاسل نقاش} one {سلسلة "
      & "نقاش واحدة} two {سلسلتا نقاش} few {{count, number} "
      & "سلاسل نقاش} many {{count, number} سلسلة نقاش} other "
      & "{{count, number} سلسلة نقاش}}");
   P ("label.comments.thread_label",
      "سلسلة النقاش {name}: {state, select, open_thread "
      & "{مفتوحة} resolved_thread {محلولة} locked_thread "
      & "{مقفلة} other {مؤرشفة}}{count, plural, =0 {} one {، "
      & "تعليق واحد} two {، تعليقان} few {، {count, number} "
      & "تعليقات} many {، {count, number} تعليقًا} other {، "
      & "{count, number} تعليق}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {سلسلة نقاش مفتوحة} "
      & "resolved_thread {سلسلة نقاش محلولة} locked_thread "
      & "{سلسلة نقاش مقفلة} other {سلسلة نقاش "
      & "مؤرشفة}}");
   P ("label.comments.unpin_label", "إلغاء تثبيت {name}");
   P ("label.comments.unsubscribe_label", "إلغاء الاشتراك في {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: تحسّن} regressed {{name}: "
      & "تراجع} unchanged {{name}: دون تغيير} within_tolerance "
      & "{{name}: ضمن هامش التسامح} outside_tolerance {{name}: "
      & "خارج هامش التسامح} new_value {{name}: جديد} "
      & "removed_value {{name}: أُزيل} other {{name}: خط الأساس "
      & "غير متاح}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {تحسّن} regressed {تراجع} "
      & "unchanged {دون تغيير} within_tolerance {ضمن هامش "
      & "التسامح} outside_tolerance {خارج هامش التسامح} "
      & "new_value {جديد} removed_value {أُزيل} other {خط "
      & "الأساس غير متاح}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: تحسّن بمقدار "
      & "{difference_text}} regressed {{name}: تراجع بمقدار "
      & "{difference_text}} unchanged {{name}: دون تغيير، الفرق "
      & "{difference_text}} within_tolerance {{name}: ضمن هامش "
      & "التسامح، الفرق {difference_text}} outside_tolerance "
      & "{{name}: خارج هامش التسامح، الفرق "
      & "{difference_text}} new_value {{name}: جديد، الفرق "
      & "{difference_text}} removed_value {{name}: أُزيل، الفرق "
      & "{difference_text}} other {{name}: خط الأساس غير متاح، "
      & "الفرق {difference_text}}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: تحسّن بمقدار "
      & "{difference_text}} regressed {{name}: تراجع بمقدار "
      & "{difference_text}} unchanged {{name}: دون تغيير، الفرق "
      & "{difference_text}} within_tolerance {{name}: ضمن هامش "
      & "التسامح، الفرق {difference_text}} outside_tolerance "
      & "{{name}: خارج هامش التسامح، الفرق "
      & "{difference_text}} new_value {{name}: جديد، الفرق "
      & "{difference_text}} removed_value {{name}: أُزيل، الفرق "
      & "{difference_text}} other {{name}: خط الأساس غير متاح، "
      & "الفرق {difference_text}}}، هامش التسامح "
      & "{tolerance_text}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {صف غير صالح} duplicate_record "
      & "{سجل مكرر} missing_column {عمود مفقود} unknown_field "
      & "{حقل غير معروف} schema_mismatch {عدم تطابق "
      & "المخطط} other {سجل متخطى}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {نجح التشغيل "
      & "التجريبي} dry_run_failed {فشل التشغيل "
      & "التجريبي} import_valid {الاستيراد صالح} "
      & "import_invalid {الاستيراد غير صالح} other "
      & "{استيراد جزئي}}");
   P ("label.data_quality.import_result_label",
      "{name} – {state, select, dry_run_passed {نجح التشغيل "
      & "التجريبي} dry_run_failed {فشل التشغيل "
      & "التجريبي} import_valid {الاستيراد صالح} "
      & "import_invalid {الاستيراد غير صالح} other "
      & "{استيراد جزئي}}: المقبول {accepted, number}، "
      & "المرفوض {rejected, number}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {لا توجد "
      & "صفوف غير صالحة} other {صفوف غير صالحة: {count, "
      & "number}}}} duplicate_record {{count, plural, =0 {لا توجد "
      & "سجلات مكررة} other {سجلات مكررة: {count, "
      & "number}}}} missing_column {{count, plural, =0 {لا توجد "
      & "أعمدة مفقودة} other {أعمدة مفقودة: {count, "
      & "number}}}} unknown_field {{count, plural, =0 {لا توجد حقول "
      & "غير معروفة} other {حقول غير معروفة: {count, "
      & "number}}}} schema_mismatch {{count, plural, =0 {لا توجد "
      & "حالات عدم تطابق للمخطط} other {حالات عدم "
      & "تطابق المخطط: {count, number}}}} other {{count, plural, =0 "
      & "{لا توجد سجلات متخطاة} other {سجلات "
      & "متخطاة: {count, number}}}}}");
   P ("label.data_quality.row_issue_label",
      "الصف {row, number}: {issue, select, invalid_row {صف غير "
      & "صالح} duplicate_record {سجل مكرر} missing_column {عمود "
      & "مفقود} unknown_field {حقل غير معروف} schema_mismatch "
      & "{عدم تطابق المخطط} other {سجل متخطى}}");
   P ("label.data_quality.source_file_issue_label",
      "{file_name}: {issue, select, invalid_row {صف غير صالح} "
      & "duplicate_record {سجل مكرر} missing_column {عمود "
      & "مفقود} unknown_field {حقل غير معروف} schema_mismatch "
      & "{عدم تطابق المخطط} other {سجل متخطى}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {الحزمة جاهزة} "
      & "artifact_uploaded {تم رفع الحزمة} artifact_signed {تم "
      & "توقيع الحزمة} artifact_missing {الحزمة مفقودة} "
      & "other {انتهت صلاحية الحزمة}}");
   P ("label.deployments.deployment_label",
      "{state, select, queued_deployment {نشر {name} إلى {environment} "
      & "في قائمة الانتظار} deploying {جارٍ نشر {name} "
      & "إلى {environment}} deployed {تم نشر {name} إلى "
      & "{environment}} failed_deployment {فشل نشر {name} إلى "
      & "{environment}} rolled_back {تم التراجع عن نشر {name} "
      & "إلى {environment}} blocked_deployment {نشر {name} إلى "
      & "{environment} محظور} other {أُلغي نشر {name} إلى "
      & "{environment}}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {النشر في قائمة "
      & "الانتظار} deploying {جارٍ النشر} deployed {تم "
      & "النشر} failed_deployment {فشل النشر} rolled_back {تم "
      & "التراجع} blocked_deployment {النشر محظور} other "
      & "{أُلغي النشر}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {البيئة سليمة} "
      & "drifting_environment {انحراف في البيئة} "
      & "locked_environment {البيئة مقفلة} maintenance_environment "
      & "{البيئة قيد الصيانة} other {حالة البيئة "
      & "غير معروفة}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {لا يوجد ترحيل} "
      & "migration_pending {الترحيل معلّق} migrating {جارٍ "
      & "الترحيل} migration_complete {اكتمل الترحيل} other "
      & "{فشل الترحيل}}");
   P ("label.deployments.promotion_label",
      "تمت ترقية {name} من {from_environment} إلى "
      & "{to_environment}");
   P ("label.deployments.rollback_label", "تراجع {name} إلى {target}");
   P ("label.deployments.rollout_label", "طرح {name}: {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {لا توجد عناصر متأثرة} one "
      & "{عنصر واحد متأثر} two {عنصران متأثران} few "
      & "{{count, number} عناصر متأثرة} many {{count, number} "
      & "عنصرًا متأثرًا} other {{count, number} عنصر "
      & "متأثر}}");
   P ("label.diagnostics.check_duration_label",
      "{status, select, passed_check {{name}: ناجح خلال {duration_s, "
      & "plural, one {ثانية واحدة} two {ثانيتين} few "
      & "{{duration_s, number} ثوانٍ} many {{duration_s, number} "
      & "ثانيةً} other {{duration_s, number} ثانية}}} failed_check "
      & "{{name}: فاشل خلال {duration_s, plural, one {ثانية "
      & "واحدة} two {ثانيتين} few {{duration_s, number} ثوانٍ} "
      & "many {{duration_s, number} ثانيةً} other {{duration_s, number} "
      & "ثانية}}} warning_check {{name}: تحذيرات خلال "
      & "{duration_s, plural, one {ثانية واحدة} two {ثانيتين} "
      & "few {{duration_s, number} ثوانٍ} many {{duration_s, number} "
      & "ثانيةً} other {{duration_s, number} ثانية}}} skipped_check "
      & "{{name}: تم تخطيه خلال {duration_s, plural, one {ثانية "
      & "واحدة} two {ثانيتين} few {{duration_s, number} ثوانٍ} "
      & "many {{duration_s, number} ثانيةً} other {{duration_s, number} "
      & "ثانية}}} pending_check {{name}: معلّق خلال {duration_s, "
      & "plural, one {ثانية واحدة} two {ثانيتين} few "
      & "{{duration_s, number} ثوانٍ} many {{duration_s, number} "
      & "ثانيةً} other {{duration_s, number} ثانية}}} other {{name}: "
      & "قيد التشغيل خلال {duration_s, plural, one {ثانية "
      & "واحدة} two {ثانيتين} few {{duration_s, number} ثوانٍ} "
      & "many {{duration_s, number} ثانيةً} other {{duration_s, number} "
      & "ثانية}}}}");
   P ("label.diagnostics.check_result_label",
      "{status, select, passed_check {{name}: ناجح} failed_check {{name}: "
      & "فاشل} warning_check {{name}: تحذيرات} skipped_check "
      & "{{name}: تم تخطيه} pending_check {{name}: معلّق} other "
      & "{{name}: قيد التشغيل}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {ناجح} failed_check {فاشل} "
      & "warning_check {تحذيرات} skipped_check {تم تخطيه} "
      & "pending_check {معلّق} other {قيد التشغيل}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {يُتوقع قيمة في "
      & "{subject}{position, plural, =0 {} other { عند الموضع "
      & "{position, number}}}؛ استخدم {suggestion}} expected_unit "
      & "{يُتوقع وحدة في {subject}{position, plural, =0 {} other { "
      & "عند الموضع {position, number}}}؛ استخدم {suggestion}} "
      & "invalid_range {نطاق غير صالح في {subject}{position, "
      & "plural, =0 {} other { عند الموضع {position, number}}}؛ "
      & "استخدم {suggestion}} end_before_start {نهاية النطاق "
      & "قبل بدايته في {subject}{position, plural, =0 {} other { "
      & "عند الموضع {position, number}}}؛ استخدم {suggestion}} "
      & "unknown_field {حقل غير معروف في {subject}{position, "
      & "plural, =0 {} other { عند الموضع {position, number}}}؛ "
      & "استخدم {suggestion}} unsafe_redacted_value {تم حجب قيمة "
      & "غير آمنة في {subject}{position, plural, =0 {} other { عند "
      & "الموضع {position, number}}}؛ استخدم {suggestion}} "
      & "unsupported_syntax {صيغة غير مدعومة في "
      & "{subject}{position, plural, =0 {} other { عند الموضع "
      & "{position, number}}}؛ استخدم {suggestion}} other {شرح "
      & "تشخيصي لـ {subject}{position, plural, =0 {} other { عند "
      & "الموضع {position, number}}}؛ استخدم {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {معلومات} notice_severity "
      & "{ملاحظة} warning_severity {تحذير} error_severity {خطأ} "
      & "critical_severity {حرج} other {مانع}} في {path}{line, plural, "
      & "=0 {} other {، السطر {line, number}}}: {message}");
   P ("label.diagnostics.failed_at_label",
      "فشل في {path}{line, plural, =0 {} other {، السطر {line, "
      & "number}{column, plural, =0 {} other {، العمود {column, "
      & "number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {معلومات} notice_severity "
      & "{ملاحظة} warning_severity {تحذير} error_severity {خطأ} "
      & "critical_severity {حرج} other {مانع}} في {field_name}: "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "أول فشل في {check_name} في {path}{line, plural, =0 {} other "
      & "{، السطر {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 {لا "
      & "توجد مشكلات} other {{notices, plural, one {ملاحظة "
      & "واحدة} two {ملاحظتان} few {{notices, number} "
      & "ملاحظات} many {{notices, number} ملاحظةً} other "
      & "{{notices, number} ملاحظة}}}}} other {{notices, plural, =0 "
      & "{{warnings, plural, one {تحذير واحد} two {تحذيران} few "
      & "{{warnings, number} تحذيرات} many {{warnings, number} "
      & "تحذيرًا} other {{warnings, number} تحذير}}} other "
      & "{{warnings, plural, one {تحذير واحد} two {تحذيران} few "
      & "{{warnings, number} تحذيرات} many {{warnings, number} "
      & "تحذيرًا} other {{warnings, number} تحذير}}، {notices, "
      & "plural, one {ملاحظة واحدة} two {ملاحظتان} few "
      & "{{notices, number} ملاحظات} many {{notices, number} "
      & "ملاحظةً} other {{notices, number} ملاحظة}}}}}}} other "
      & "{{warnings, plural, =0 {{notices, plural, =0 {{errors, plural, one "
      & "{خطأ واحد} two {خطآن} few {{errors, number} أخطاء} "
      & "many {{errors, number} خطأً} other {{errors, number} خطأ}}} "
      & "other {{errors, plural, one {خطأ واحد} two {خطآن} few "
      & "{{errors, number} أخطاء} many {{errors, number} خطأً} other "
      & "{{errors, number} خطأ}}، {notices, plural, one {ملاحظة "
      & "واحدة} two {ملاحظتان} few {{notices, number} "
      & "ملاحظات} many {{notices, number} ملاحظةً} other "
      & "{{notices, number} ملاحظة}}}}} other {{notices, plural, =0 "
      & "{{errors, plural, one {خطأ واحد} two {خطآن} few {{errors, "
      & "number} أخطاء} many {{errors, number} خطأً} other {{errors, "
      & "number} خطأ}}، {warnings, plural, one {تحذير واحد} two "
      & "{تحذيران} few {{warnings, number} تحذيرات} many "
      & "{{warnings, number} تحذيرًا} other {{warnings, number} "
      & "تحذير}}} other {{errors, plural, one {خطأ واحد} two "
      & "{خطآن} few {{errors, number} أخطاء} many {{errors, number} "
      & "خطأً} other {{errors, number} خطأ}}، {warnings, plural, one "
      & "{تحذير واحد} two {تحذيران} few {{warnings, number} "
      & "تحذيرات} many {{warnings, number} تحذيرًا} other "
      & "{{warnings, number} تحذير}}، {notices, plural, one {ملاحظة "
      & "واحدة} two {ملاحظتان} few {{notices, number} "
      & "ملاحظات} many {{notices, number} ملاحظةً} other "
      & "{{notices, number} ملاحظة}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{path}{line, plural, =0 {} other {، السطر {line, number}{column, "
      & "plural, =0 {} other {، العمود {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "{family, select, byte_parser {صيغة غير مدعومة في "
      & "محلل البايتات {error}{position, plural, =0 {} other { "
      & "عند الموضع {position, number}}}؛ استخدم B أو kB أو "
      & "MB أو GB أو KiB أو MiB أو GiB أو TiB} duration_parser "
      & "{صيغة غير مدعومة في محلل المدد "
      & "{error}{position, plural, =0 {} other { عند الموضع {position, "
      & "number}}}؛ استخدم ms أو s أو min أو h أو d أو w أو "
      & "month أو year} date_time_parser {صيغة غير مدعومة في "
      & "محلل التاريخ والوقت {error}{position, plural, =0 {} "
      & "other { عند الموضع {position, number}}}؛ استخدم "
      & "تاريخ ISO أو يومًا بلغة طبيعية أو وقتًا "
      & "على الساعة} color_parser {صيغة غير مدعومة في "
      & "محلل الألوان {error}{position, plural, =0 {} other { عند "
      & "الموضع {position, number}}}؛ استخدم hex أو rgb() أو "
      & "hsl() أو lab() أو lch() أو اسم لون} url_parser {صيغة "
      & "غير مدعومة في محلل عناوين URL {error}{position, "
      & "plural, =0 {} other { عند الموضع {position, number}}}؛ "
      & "استخدم المخطط أو المضيف أو المسار أو "
      & "الاستعلام أو الجزء} unit_parser {صيغة غير "
      & "مدعومة في محلل الوحدات {error}{position, plural, =0 "
      & "{} other { عند الموضع {position, number}}}؛ استخدم "
      & "تسمية وحدة يدعمها Humanize} recurrence_parser {صيغة "
      & "غير مدعومة في محلل التكرار {error}{position, "
      & "plural, =0 {} other { عند الموضع {position, number}}}؛ "
      & "استخدم cron أو صيغة تكرار every/weekday} "
      & "domain_label_parser {صيغة غير مدعومة في محلل "
      & "تسميات المجال {error}{position, plural, =0 {} other { "
      & "عند الموضع {position, number}}}؛ استخدم تسمية "
      & "مجال حتمية من Humanize} other {صيغة غير مدعومة "
      & "في المحلل {error}{position, plural, =0 {} other { عند "
      & "الموضع {position, number}}}؛ استخدم صيغة إدخال "
      & "مدعومة}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {ناجح} failed_check {فاشل} "
      & "warning_check {تحذيرات} skipped_check {تم تخطيه} "
      & "pending_check {معلّق} other {قيد التشغيل}}{notices, "
      & "plural, =0 {، دون ملاحظات} one {، مع ملاحظة "
      & "واحدة} two {، مع ملاحظتين} few {، مع {notices, "
      & "number} ملاحظات} many {، مع {notices, number} "
      & "ملاحظةً} other {، مع {notices, number} ملاحظة}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, one {{attempt, plural, one {إعادة "
      & "المحاولة 1 من 1} other {تم تجاوز حد إعادة "
      & "المحاولة ({attempt, number} من 1)}}} other {إعادة "
      & "المحاولة {attempt, number} من {limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {معلومات} notice_severity "
      & "{ملاحظة} warning_severity {تحذير} error_severity {خطأ} "
      & "critical_severity {حرج} other {مانع}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {تشخيصات البناء} "
      & "test_source {تشخيصات الاختبار} lint_source "
      & "{تشخيصات lint} import_source {تشخيصات "
      & "الاستيراد} validation_source {تشخيصات التحقق} "
      & "runtime_source {تشخيصات وقت التشغيل} security_source "
      & "{تشخيصات الأمان} other {تشخيصات}}");
   P ("label.diagnostics.source_summary_label",
      "{count, plural, one {تشخيص واحد} two {تشخيصان} few "
      & "{{count, number} تشخيصات} many {{count, number} تشخيصًا} "
      & "other {{count, number} تشخيص}}{source, select, build_source { "
      & "من البناء} test_source { من الاختبارات} "
      & "lint_source { من lint} import_source { من الاستيراد} "
      & "validation_source { من التحقق} runtime_source { من وقت "
      & "التشغيل} security_source { من الأمان} other {}}");
   P ("label.diagnostics.suggested_action_label", "التالي: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {مضيف نطاق} ipv4_host {عنوان "
      & "IPv4} ipv6_host {عنوان IPv6} localhost_host {المضيف "
      & "المحلي} private_network_host {عنوان شبكة خاصة} "
      & "other {مضيف غير معروف}}");
   P ("label.events.all_day_label", "{name}، حدث طوال اليوم");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {لم يتم الرد} accepted {تم "
      & "القبول} declined {تم الرفض} maybe {ربما} other {في "
      & "قائمة الانتظار}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {لا يوجد مشاركون} one {مشارك "
      & "واحد} two {مشاركان} few {{count, number} مشاركين} "
      & "many {{count, number} مشاركًا} other {{count, number} "
      & "مشارك}}");
   P ("label.events.canceled_label", "تم إلغاء {name}");
   P ("label.events.check_in_label", "تسجيل الحضور في {name}");
   P ("label.events.conference_link_label", "رابط مؤتمر {name}");
   P ("label.events.event_count_label",
      "{count, plural, =0 {لا توجد أحداث} one {حدث واحد} "
      & "two {حدثان} few {{count, number} أحداث} many {{count, "
      & "number} حدثًا} other {{count, number} حدث}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {حدث مجدول} "
      & "tentative_event {حدث مبدئي} in_progress_event {حدث "
      & "جارٍ} completed_event {حدث مكتمل} canceled_event {حدث "
      & "ملغى} other {حدث مؤجل}}");
   P ("label.events.event_location_label", "{name} في {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {حدث مجدول} tentative_event "
      & "{حدث مبدئي} in_progress_event {حدث جارٍ} "
      & "completed_event {حدث مكتمل} canceled_event {حدث ملغى} "
      & "other {حدث مؤجل}}");
   P ("label.events.event_time_label", "{name} في {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {حدث عام} private_event "
      & "{حدث خاص} busy_event {مشغول} other {متاح}}");
   P ("label.events.organizer_label", "المنظِّم: {name}");
   P ("label.events.rsvp_label",
      "الرد على الدعوة: {state, select, not_responded {لم "
      & "يتم الرد} accepted {تم القبول} declined {تم "
      & "الرفض} maybe {ربما} other {في قائمة الانتظار}}");
   P ("label.events.reminder_label", "تذكير {time_text}");
   P ("label.events.rescheduled_label", "أُعيدت جدولة {name} إلى {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {حرف واحد} two {حرفان} few {{used, "
      & "number} أحرف} many {{used, number} حرفًا} other {{used, "
      & "number} حرف}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {بلا حد للأحرف} one {حرف واحد "
      & "كحد أقصى} two {حرفان كحد أقصى} few {{limit, number} "
      & "أحرف كحد أقصى} many {{limit, number} حرفًا كحد "
      & "أقصى} other {{limit, number} حرف كحد أقصى}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {حرف واحد} two "
      & "{حرفان} few {{used, number} أحرف} many {{used, number} "
      & "حرفًا} other {{used, number} حرف}}} one {{used, number} من "
      & "حرف واحد} two {{used, number} من حرفين} few {{used, "
      & "number} من {limit, number} أحرف} many {{used, number} من "
      & "{limit, number} حرفًا} other {{used, number} من {limit, number} "
      & "حرف}}");
   P ("label.forms.field_label",
      "{required, select, false {{name}: حقل اختياري} other "
      & "{{name}: حقل مطلوب}}");
   P ("label.forms.field_state_label",
      "{state, select, valid_input {{name}: صالح} invalid_input {{name}: "
      & "غير صالح} required_input {{name}: مطلوب} optional_input "
      & "{{name}: اختياري} disabled_input {{name}: معطّل} other "
      & "{{name}: للقراءة فقط}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {لا توجد مشكلات "
      & "في النموذج} other {{warnings, plural, one {تحذير "
      & "واحد} two {تحذيران} few {{warnings, number} تحذيرات} "
      & "many {{warnings, number} تحذيرًا} other {{warnings, number} "
      & "تحذير}}}}} other {{warnings, plural, =0 {{errors, plural, one "
      & "{خطأ واحد} two {خطآن} few {{errors, number} أخطاء} "
      & "many {{errors, number} خطأً} other {{errors, number} خطأ}}} "
      & "other {{errors, plural, one {خطأ واحد} two {خطآن} few "
      & "{{errors, number} أخطاء} many {{errors, number} خطأً} other "
      & "{{errors, number} خطأ}}، {warnings, plural, one {تحذير "
      & "واحد} two {تحذيران} few {{warnings, number} تحذيرات} "
      & "many {{warnings, number} تحذيرًا} other {{warnings, number} "
      & "تحذير}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {لم يبدأ} editing_form {جارٍ "
      & "التحرير} dirty_form {تغييرات غير محفوظة} "
      & "saving_form {جارٍ الحفظ} saved_form {تم الحفظ} "
      & "submitted_form {تم الإرسال} other {فشل الإرسال}}");
end Labels_1;
