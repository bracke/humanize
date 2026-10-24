separate (Humanize.Catalogs.Phrase_Data.Locale_Ar)
procedure Labels_2 is
begin
   P ("label.forms.input_state_label",
      "{state, select, valid_input {إدخال صالح} invalid_input "
      & "{إدخال غير صالح} required_input {إدخال مطلوب} "
      & "optional_input {إدخال اختياري} disabled_input {إدخال "
      & "معطّل} other {إدخال للقراءة فقط}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {لم يبدأ} editing_form {جارٍ "
      & "التحرير} dirty_form {تغييرات غير محفوظة} "
      & "saving_form {جارٍ حفظ النموذج} saved_form {تم حفظ "
      & "النموذج} submitted_form {تم إرسال النموذج} other "
      & "{{errors, plural, =0 {فشل الإرسال} one {فشل "
      & "الإرسال بخطأ واحد} two {فشل الإرسال "
      & "بخطأين} few {فشل الإرسال مع {errors, number} "
      & "أخطاء} many {فشل الإرسال مع {errors, number} "
      & "خطأً} other {فشل الإرسال مع {errors, number} "
      & "خطأ}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {لا توجد تغييرات غير محفوظة} "
      & "one {تغيير واحد غير محفوظ} two {تغييران غير "
      & "محفوظين} few {{count, number} تغييرات غير "
      & "محفوظة} many {{count, number} تغييرًا غير محفوظ} "
      & "other {{count, number} تغيير غير محفوظ}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {الاسم "
      & "القابل للوصول مفقود} low_contrast {تباين "
      & "منخفض} skipped_heading_level {تم تخطي مستوى "
      & "عنوان} missing_form_label {تسمية النموذج "
      & "مفقودة} invalid_aria {ARIA غير صالح} keyboard_trap "
      & "{مصيدة لوحة المفاتيح} other {مشكلة غير "
      & "معروفة في إمكانية الوصول}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}، ملخص إمكانية الوصول: {landmarks, plural, "
      & "one {معلم واحد} two {معلمان} few {{landmarks, number} "
      & "معالم} many {{landmarks, number} معلمًا} other {{landmarks, "
      & "number} معلم}}، {headings, plural, one {عنوان واحد} two "
      & "{عنوانان} few {{headings, number} عناوين} many "
      & "{{headings, number} عنوانًا} other {{headings, number} "
      & "عنوان}}، {issues, plural, one {مشكلة واحدة} two "
      & "{مشكلتان} few {{issues, number} مشكلات} many {{issues, "
      & "number} مشكلةً} other {{issues, number} مشكلة}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {أضف اسمًا "
      & "قابلًا للوصول} low_contrast {زِد تباين النص} "
      & "skipped_heading_level {استخدم مستويات عناوين "
      & "متسلسلة} missing_form_label {اربط تسمية بعنصر "
      & "التحكم في النموذج} invalid_aria {استخدم دور "
      & "ARIA أو سمة ARIA صالحة} keyboard_trap {تأكد من أن "
      & "تركيز لوحة المفاتيح يمكنه مغادرة "
      & "المكوّن} other {راجع مشكلة إمكانية "
      & "الوصول}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {لا توجد مشكلات في "
      & "إمكانية الوصول} one {مشكلة واحدة في "
      & "إمكانية الوصول} two {مشكلتان في إمكانية "
      & "الوصول} few {{issues, number} مشكلات في إمكانية "
      & "الوصول} many {{issues, number} مشكلةً في إمكانية "
      & "الوصول} other {{issues, number} مشكلة في إمكانية "
      & "الوصول}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {سمة id} class_attribute {سمة class} "
      & "data_attribute {سمة بيانات} aria_attribute {سمة ARIA} "
      & "role_attribute {سمة role} link_attribute {سمة رابط} "
      & "media_attribute {سمة وسائط} form_attribute {سمة نموذج} "
      & "boolean_attribute {سمة منطقية} event_attribute {سمة "
      & "معالج أحداث} other {سمة غير معروفة}}");
   P ("label.markup.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{form_name}: لا توجد "
      & "مشكلات في النموذج} other {{form_name}: {warnings, "
      & "plural, one {تحذير واحد} two {تحذيران} few {{warnings, "
      & "number} تحذيرات} many {{warnings, number} تحذيرًا} other "
      & "{{warnings, number} تحذير}}}}} other {{warnings, plural, =0 "
      & "{{form_name}: {errors, plural, one {خطأ واحد} two {خطآن} "
      & "few {{errors, number} أخطاء} many {{errors, number} خطأً} "
      & "other {{errors, number} خطأ}}} other {{form_name}: {errors, plural, "
      & "one {خطأ واحد} two {خطآن} few {{errors, number} أخطاء} "
      & "many {{errors, number} خطأً} other {{errors, number} خطأ}}، "
      & "{warnings, plural, one {تحذير واحد} two {تحذيران} few "
      & "{{warnings, number} تحذيرات} many {{warnings, number} "
      & "تحذيرًا} other {{warnings, number} تحذير}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {معلم الشعار} navigation_role "
      & "{معلم التنقل} main_role {المعلم الرئيسي} "
      & "complementary_role {المعلم التكميلي} contentinfo_role "
      & "{معلم معلومات المحتوى} search_role {معلم "
      & "البحث} form_role {معلم النموذج} region_role {معلم "
      & "المنطقة} dialog_role {مربع حوار} alert_role {منطقة "
      & "تنبيه حية} status_role {منطقة حالة حية} other "
      & "{معلم غير معروف}}");
   P ("label.markup.live_region_update_label",
      "{polite, select, false {{region}، تحديث عاجل: {update}} "
      & "other {{region}، تحديث مهذب: {update}}}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {محتوى نصي} html_content "
      & "{محتوى HTML} json_content {محتوى JSON} xml_content "
      & "{محتوى XML} image_content {محتوى صورة} audio_content "
      & "{محتوى صوتي} video_content {محتوى فيديو} "
      & "font_content {محتوى خط} archive_content {محتوى أرشيف} "
      & "binary_content {محتوى ثنائي} form_content {محتوى "
      & "نموذج} other {محتوى غير معروف}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {وسم مستند} metadata_tag {وسم "
      & "بيانات وصفية} section_tag {وسم قسم} text_tag {وسم "
      & "نص} link_tag {وسم رابط} media_tag {وسم وسائط} "
      & "form_tag {وسم نموذج} table_tag {وسم جدول} "
      & "interactive_tag {وسم تفاعلي} scripting_tag {وسم برمجة "
      & "نصية} other {وسم غير معروف}}");
   P ("label.media.duration_label", "المدة {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {صورة} video_media {فيديو} "
      & "audio_media {صوت} pdf_document {مستند PDF} text_document "
      & "{مستند نصي} archive_media {أرشيف} other {وسائط}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {جاهز} processing_media {قيد "
      & "المعالجة} transcoding_media {جارٍ تحويل "
      & "الترميز} thumbnail_missing {الصورة المصغرة غير "
      & "متاحة} metadata_missing {البيانات الوصفية "
      & "مفقودة} locked_document {المستند مقفل} other {غير "
      & "متاح}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {صورة} video_media {فيديو} "
      & "audio_media {صوت} pdf_document {مستند PDF} text_document "
      & "{مستند نصي} archive_media {أرشيف} other {وسائط}}): "
      & "{state, select, ready_media {جاهز} processing_media {قيد "
      & "المعالجة} transcoding_media {جارٍ تحويل "
      & "الترميز} thumbnail_missing {الصورة المصغرة غير "
      & "متاحة} metadata_missing {البيانات الوصفية "
      & "مفقودة} locked_document {المستند مقفل} other {غير "
      & "متاح}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {لا توجد صفحات} one {صفحة "
      & "واحدة} two {صفحتان} few {{pages, number} صفحات} many "
      & "{{pages, number} صفحةً} other {{pages, number} صفحة}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "طعن في {item}: {state, select, open_report {بلاغ مفتوح} "
      & "triaged_report {بلاغ تم فرزه} actioned_report {اتُّخذ "
      & "إجراء} dismissed_report {بلاغ مرفوض} appealed_report "
      & "{بلاغ مطعون فيه} other {بلاغ مغلق}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {لا يوجد إجراء إشرافي} "
      & "flagged {مُعلَّم للمراجعة} hidden {أخفاه "
      & "المشرف} restored {تمت استعادته} marked_spam "
      & "{مُصنَّف كرسالة مزعجة} removed {تمت إزالته} "
      & "other {تم تصعيده}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {لا يوجد إجراء "
      & "إشرافي} flagged {مُعلَّم للمراجعة} hidden "
      & "{أخفاه المشرف} restored {تمت استعادته} "
      & "marked_spam {مُصنَّف كرسالة مزعجة} removed {تمت "
      & "إزالته} other {تم تصعيده}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {قائمة "
      & "الإشراف فارغة} other {بانتظار المراجعة: "
      & "{pending, number}}}} other {بانتظار المراجعة: {pending, "
      & "number}، مُصعَّد: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {بلاغ مفتوح} "
      & "triaged_report {بلاغ تم فرزه} actioned_report {اتُّخذ "
      & "إجراء} dismissed_report {بلاغ مرفوض} appealed_report "
      & "{بلاغ مطعون فيه} other {بلاغ مغلق}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {بلاغ مفتوح} triaged_report "
      & "{بلاغ تم فرزه} actioned_report {اتُّخذ إجراء} "
      & "dismissed_report {بلاغ مرفوض} appealed_report {بلاغ "
      & "مطعون فيه} other {بلاغ مغلق}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {بانتظار "
      & "المراجعة} approved {تمت الموافقة} rejected "
      & "{مرفوض} needs_changes {يحتاج إلى تغييرات} other "
      & "{مراجعة مُصعَّدة}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {بانتظار المراجعة} "
      & "approved {تمت الموافقة} rejected {مرفوض} needs_changes "
      & "{يحتاج إلى تغييرات} other {مراجعة "
      & "مُصعَّدة}}");
   P ("label.navigation.back_label", "العودة إلى {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {لا يوجد مسار تنقل} one {مسار "
      & "تنقل من عنصر واحد} two {مسار تنقل من "
      & "عنصرين} few {مسار تنقل من {depth, number} عناصر} "
      & "many {مسار تنقل من {depth, number} عنصرًا} other "
      & "{مسار تنقل من {depth, number} عنصر}}");
   P ("label.navigation.current_page_label", "الصفحة الحالية: {name}");
   P ("label.navigation.external_link_label", "رابط خارجي: {name}");
   P ("label.navigation.first_label", "الأول: {target}");
   P ("label.navigation.last_label", "الأخير: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {لا توجد عناصر في القائمة} one "
      & "{عنصر واحد في القائمة} two {عنصران في "
      & "القائمة} few {{count, number} عناصر في القائمة} "
      & "many {{count, number} عنصرًا في القائمة} other {{count, "
      & "number} عنصر في القائمة}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {رابط} menu_item {عنصر قائمة} "
      & "tab_item {تبويب} breadcrumb_item {عنصر مسار التنقل} "
      & "section_item {قسم} other {فاصل}}");
   P ("label.navigation.navigation_item_label",
      "{kind, select, link_item {رابط} menu_item {عنصر "
      & "القائمة} tab_item {تبويب} breadcrumb_item {عنصر "
      & "مسار التنقل} section_item {قسم} other {فاصل}} {name}: "
      & "{state, select, current_item {حالي} active_item {نشط} "
      & "inactive_item {غير نشط} disabled_item {معطّل} expanded_item "
      & "{موسّع} collapsed_item {مطوي} visited_item {تمت "
      & "زيارته} other {خارجي}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {حالي} active_item {نشط} "
      & "inactive_item {غير نشط} disabled_item {معطّل} expanded_item "
      & "{موسّع} collapsed_item {مطوي} visited_item {تمت "
      & "زيارته} other {خارجي}}");
   P ("label.navigation.next_label", "التالي: {target}");
   P ("label.navigation.section_state_label",
      "قسم {name} {expanded, select, false {مطوي} other "
      & "{موسّع}}{count, plural, =0 {} one {، عنصر واحد} two {، "
      & "عنصران} few {، {count, number} عناصر} many {، {count, "
      & "number} عنصرًا} other {، {count, number} عنصر}}");
   P ("label.navigation.skip_link_label", "انتقل إلى {target}");
   P ("label.navigation.submenu_label",
      "قائمة فرعية {name}، {count, plural, one {عنصر واحد} "
      & "two {عنصران} few {{count, number} عناصر} many {{count, "
      & "number} عنصرًا} other {{count, number} عنصر}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {كل التنبيهات} important_alerts "
      & "{التنبيهات المهمة} critical_alerts_only "
      & "{التنبيهات الحرجة فقط} other {بلا "
      & "تنبيهات}}");
   P ("label.notification_preferences.channel_preference_label",
      "إشعارات {channel}: {state, select, preference_enabled "
      & "{مفعّلة} preference_disabled {معطّلة} preference_inherited "
      & "{موروثة} other {إلزامية}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {بلا ملخص} instant_digest "
      & "{ملخص فوري} daily_digest {ملخص يومي} other {ملخص "
      & "أسبوعي}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {مفعّل} preference_disabled "
      & "{معطّل} preference_inherited {موروث} other {إلزامي}}");
   P ("label.notification_preferences.quiet_hours_label", "ساعات الهدوء: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{scope, select, thread_subscription {الاشتراك في سلسلة "
      & "النقاش {name}} project_subscription {الاشتراك في "
      & "المشروع {name}} team_subscription {الاشتراك في "
      & "الفريق {name}} other {الاشتراك في الحساب "
      & "{name}}}: {state, select, preference_enabled {مفعّل} "
      & "preference_disabled {معطّل} preference_inherited {موروث} "
      & "other {إلزامي}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {اشتراك في سلسلة "
      & "نقاش} project_subscription {اشتراك في مشروع} "
      & "team_subscription {اشتراك في فريق} other {اشتراك "
      & "في حساب}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {أشار إليك {actor}} reply_event "
      & "{ردّ {actor}} assignment_event {أسند إليك {actor} مهمة} "
      & "approval_event {طلب {actor} موافقة} alert_event {أرسل "
      & "{actor} تنبيهًا} digest_event {أرسل {actor} ملخصًا} "
      & "reminder_event {أرسل {actor} تذكيرًا} other {أرسل "
      & "{actor} إشعار نظام}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {إشعار داخل التطبيق} "
      & "email_channel {إشعار بريد إلكتروني} sms_channel "
      & "{إشعار SMS} push_channel {إشعار فوري} webhook_channel "
      & "{إشعار webhook} other {إشعار ملخص}}: {state, select, "
      & "pending_delivery {معلّق} sent_delivery {تم الإرسال} "
      & "delivered_delivery {تم التسليم} failed_delivery {فشل} "
      & "retrying_delivery {جارٍ إعادة المحاولة} other "
      & "{أُلغي}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {إشعار معلّق} sent_delivery "
      & "{إشعار مُرسَل} delivered_delivery {إشعار "
      & "مُسلَّم} failed_delivery {إشعار فاشل} "
      & "retrying_delivery {إعادة محاولة الإشعار} other "
      & "{إشعار ملغى}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {معلّق {time_text}} "
      & "sent_delivery {أُرسل {time_text}} delivered_delivery "
      & "{سُلِّم {time_text}} failed_delivery {فشل {time_text}} "
      & "retrying_delivery {إعادة المحاولة {time_text}} other "
      & "{أُلغي {time_text}}}");
   P ("label.notifications.digest_label",
      "ملخص {name}: {count, plural, =0 {لا توجد إشعارات} one "
      & "{إشعار واحد} two {إشعاران} few {{count, number} "
      & "إشعارات} many {{count, number} إشعارًا} other {{count, "
      & "number} إشعار}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {لا توجد "
      & "إشارات} one {إشارة واحدة} two {إشارتان} few "
      & "{{count, number} إشارات} many {{count, number} إشارةً} "
      & "other {{count, number} إشارة}}} reply_event {{count, plural, =0 "
      & "{لا توجد ردود} one {رد واحد} two {ردان} few "
      & "{{count, number} ردود} many {{count, number} ردًا} other "
      & "{{count, number} رد}}} assignment_event {{count, plural, =0 {لا "
      & "توجد مهام مُسندة} one {مهمة مُسندة واحدة} "
      & "two {مهمتان مُسندتان} few {{count, number} مهام "
      & "مُسندة} many {{count, number} مهمةً مُسندة} other "
      & "{{count, number} مهمة مُسندة}}} approval_event {{count, "
      & "plural, =0 {لا توجد طلبات موافقة} one {طلب "
      & "موافقة واحد} two {طلبا موافقة} few {{count, "
      & "number} طلبات موافقة} many {{count, number} طلبَ "
      & "موافقة} other {{count, number} طلب موافقة}}} "
      & "alert_event {{count, plural, =0 {لا توجد تنبيهات} one "
      & "{تنبيه واحد} two {تنبيهان} few {{count, number} "
      & "تنبيهات} many {{count, number} تنبيهًا} other {{count, "
      & "number} تنبيه}}} digest_event {{count, plural, =0 {لا توجد "
      & "ملخصات} one {ملخص واحد} two {ملخصان} few {{count, "
      & "number} ملخصات} many {{count, number} ملخصًا} other "
      & "{{count, number} ملخص}}} reminder_event {{count, plural, =0 {لا "
      & "توجد تذكيرات} one {تذكير واحد} two "
      & "{تذكيران} few {{count, number} تذكيرات} many {{count, "
      & "number} تذكيرًا} other {{count, number} تذكير}}} other "
      & "{{count, plural, =0 {لا توجد إشعارات نظام} one "
      & "{إشعار نظام واحد} two {إشعارا نظام} few "
      & "{{count, number} إشعارات نظام} many {{count, number} "
      & "إشعارَ نظام} other {{count, number} إشعار نظام}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, one {تعليم الإشعار كمقروء} two "
      & "{تعليم الإشعارين كمقروءين} few {تعليم "
      & "{count, number} إشعارات كمقروءة} many {تعليم "
      & "{count, number} إشعارًا كمقروءة} other {تعليم "
      & "{count, number} إشعار كمقروءة}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, one {تعليم الإشعار كغير مقروء} "
      & "two {تعليم الإشعارين كغير مقروءين} few "
      & "{تعليم {count, number} إشعارات كغير مقروءة} many "
      & "{تعليم {count, number} إشعارًا كغير مقروءة} "
      & "other {تعليم {count, number} إشعار كغير مقروءة}}");
   P ("label.notifications.muted_label", "تم كتم إشعارات {name}");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {إشارة جديدة} reply_event "
      & "{رد جديد} assignment_event {مهمة مُسندة جديدة} "
      & "approval_event {طلب موافقة جديد} alert_event {تنبيه "
      & "جديد} digest_event {ملخص جديد} reminder_event {تذكير "
      & "جديد} other {إشعار نظام جديد}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {الإشعارات داخل "
      & "التطبيق} email_channel {إشعارات البريد "
      & "الإلكتروني} sms_channel {إشعارات SMS} push_channel "
      & "{الإشعارات الفورية} webhook_channel {إشعارات "
      & "webhook} other {إشعارات الملخص}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {لا توجد إشعارات} one {إشعار "
      & "واحد} two {إشعاران} few {{count, number} إشعارات} "
      & "many {{count, number} إشعارًا} other {{count, number} "
      & "إشعار}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {إشارة} reply_event {رد} "
      & "assignment_event {مهمة مُسندة} approval_event {طلب "
      & "موافقة} alert_event {تنبيه} digest_event {ملخص} "
      & "reminder_event {تذكير} other {إشعار نظام}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {لا توجد إشعارات} one "
      & "{إشعار واحد} two {إشعاران} few {{count, number} "
      & "إشعارات} many {{count, number} إشعارًا} other {{count, "
      & "number} إشعار}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {إشارة {state, select, "
      & "unread_state {غير مقروءة} read_state {مقروءة} "
      & "archived_state {مؤرشفة} muted_state {مكتومة} snoozed_state "
      & "{مؤجلة} other {مكبوتة}}} assignment_event {مهمة "
      & "مُسندة {state, select, unread_state {غير مقروءة} "
      & "read_state {مقروءة} archived_state {مؤرشفة} muted_state "
      & "{مكتومة} snoozed_state {مؤجلة} other {مكبوتة}}} other "
      & "{{event, select, reply_event {رد} approval_event {طلب "
      & "موافقة} alert_event {تنبيه} digest_event {ملخص} "
      & "reminder_event {تذكير} other {إشعار نظام}} {state, "
      & "select, unread_state {غير مقروء} read_state {مقروء} "
      & "archived_state {مؤرشف} muted_state {مكتوم} snoozed_state "
      & "{مؤجل} other {مكبوت}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {إشعار غير مقروء} read_state "
      & "{إشعار مقروء} archived_state {إشعار مؤرشف} "
      & "muted_state {إشعار مكتوم} snoozed_state {إشعار "
      & "مؤجل} other {إشعار مكبوت}}");
   P ("label.notifications.snoozed_label", "تم تأجيل إشعارات {name}");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {لم يُكبت أي إشعار} one {تم كبت "
      & "إشعار واحد} two {تم كبت إشعارين} few {تم كبت "
      & "{count, number} إشعارات} many {تم كبت {count, number} "
      & "إشعارًا} other {تم كبت {count, number} إشعار}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {لا توجد إشعارات غير مقروءة} "
      & "one {إشعار واحد غير مقروء} two {إشعاران غير "
      & "مقروءين} few {{count, number} إشعارات غير "
      & "مقروءة} many {{count, number} إشعارًا غير مقروء} "
      & "other {{count, number} إشعار غير مقروء}}");
   P ("label.payments.amount_label", "المبلغ: {amount_text}");
   P ("label.payments.balance_label", "الرصيد: {amount_text}");
   P ("label.payments.chargeback_label", "رد مبلغ متنازع عليه: {amount_text}");
   P ("label.payments.discount_label", "الخصم: {amount_text}");
   P ("label.payments.due_label", "{amount_text} مستحق {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {لا توجد فواتير} one {فاتورة "
      & "واحدة} two {فاتورتان} few {{count, number} فواتير} "
      & "many {{count, number} فاتورةً} other {{count, number} "
      & "فاتورة}}");
   P ("label.payments.invoice_label",
      "الفاتورة {number}: {state, select, draft_invoice {مسودة} "
      & "open_invoice {مفتوحة} paid_invoice {مدفوعة} "
      & "overdue_invoice {متأخرة} other {ملغاة}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {مسودة فاتورة} open_invoice "
      & "{فاتورة مفتوحة} paid_invoice {فاتورة مدفوعة} "
      & "overdue_invoice {فاتورة متأخرة} other {فاتورة "
      & "ملغاة}}");
   P ("label.payments.method_label",
      "{method, select, card_method {دُفع ببطاقة} "
      & "bank_transfer_method {دُفع بتحويل بنكي} cash_method "
      & "{دُفع نقدًا} wallet_method {دُفع بمحفظة} "
      & "check_method {دُفع بشيك} other {دُفع بطريقة "
      & "أخرى}}: {detail}");
   P ("label.payments.paid_label", "دُفع {amount_text} {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {لا توجد مدفوعات} one {دفعة "
      & "واحدة} two {دفعتان} few {{count, number} دفعات} many "
      & "{{count, number} دفعةً} other {{count, number} دفعة}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {دفعة معلّقة} "
      & "authorized_payment {دفعة مُصرَّح بها} paid_payment "
      & "{دفعة مكتملة} failed_payment {دفعة فاشلة} "
      & "refunded_payment {دفعة مستردة} other {دفعة ملغاة}}");
   P ("label.payments.payment_link_label", "رابط الدفع {name}");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {بطاقة} bank_transfer_method "
      & "{تحويل بنكي} cash_method {نقدًا} wallet_method "
      & "{محفظة} check_method {شيك} other {أخرى}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {دفعة معلّقة} "
      & "authorized_payment {دفعة مُصرَّح بها} paid_payment "
      & "{دفعة مكتملة} failed_payment {دفعة فاشلة} "
      & "refunded_payment {دفعة مستردة} other {دفعة ملغاة}}");
   P ("label.payments.receipt_label", "الإيصال {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {استرداد "
      & "معلّق} authorized_payment {استرداد مُصرَّح به} "
      & "paid_payment {استرداد مكتمل} failed_payment "
      & "{استرداد فاشل} refunded_payment {تم الاسترداد} "
      & "other {استرداد ملغى}}");
   P ("label.payments.subtotal_label", "المجموع الفرعي: {amount_text}");
   P ("label.payments.tax_label", "الضريبة: {amount_text}");
   P ("label.payments.total_label", "الإجمالي: {amount_text}");
   P ("label.permissions.access_expiry_label", "تنتهي صلاحية وصول {subject} {time_text}");
   P ("label.permissions.grant_label",
      "{role, select, owner_role {مُنح {subject} دور المالك} "
      & "admin_role {مُنح {subject} دور المسؤول} editor_role "
      & "{مُنح {subject} دور المحرر} viewer_role {مُنح "
      & "{subject} دور العارض} other {مُنح {subject} دورًا "
      & "مخصصًا}}");
   P ("label.permissions.permission_label",
      "{subject}، {action}: {state, select, granted {ممنوح} denied "
      & "{مرفوض} inherited {موروث} temporary {وصول مؤقت} "
      & "expired {منتهي الصلاحية} other {يتطلب موافقة}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {ممنوح} denied {مرفوض} inherited "
      & "{موروث} temporary {وصول مؤقت} expired {منتهي "
      & "الصلاحية} other {يتطلب موافقة}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {مسموح بموجب السياسة} "
      & "policy_denied {مرفوض بموجب السياسة} policy_warning "
      & "{تحذير من السياسة} other {السياسة غير "
      & "منطبقة}}");
   P ("label.permissions.revoke_label",
      "{role, select, owner_role {سُحب دور المالك من "
      & "{subject}} admin_role {سُحب دور المسؤول من {subject}} "
      & "editor_role {سُحب دور المحرر من {subject}} viewer_role "
      & "{سُحب دور العارض من {subject}} other {سُحب "
      & "الدور المخصص من {subject}}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {مالك} admin_role {مسؤول} "
      & "editor_role {محرر} viewer_role {عارض} other {دور مخصص}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {فارغ} low_utilization "
      & "{استخدام منخفض} normal_utilization {استخدام "
      & "عادي} high_utilization {استخدام مرتفع} "
      & "critical_utilization {استخدام حرج} full_utilization "
      & "{ممتلئ} other {تجاوز الحد}}");
   P ("label.schema.array_shape_label",
      "مصفوفة {element_type, select, string_field {سلاسل نصية} "
      & "integer_field {أعداد صحيحة} decimal_field {أعداد "
      & "عشرية} boolean_field {قيم منطقية} date_field "
      & "{تواريخ} date_time_field {تواريخ وأوقات} "
      & "object_field {كائنات} array_field {مصفوفات} enum_field "
      & "{قيم تعداد} binary_field {بيانات ثنائية} "
      & "null_field {قيم null} any_field {قيم من أي نوع} other "
      & "{قيم من نوع غير معروف}}{count_known, select, false {} "
      & "other { ({count, plural, =0 {بلا عناصر} one {عنصر "
      & "واحد} two {عنصران} few {{count, number} عناصر} many "
      & "{{count, number} عنصرًا} other {{count, number} عنصر}})}}");
   P ("label.schema.constraint_label", "قيد {name}: {value}");
   P ("label.schema.default_value_label", "القيمة الافتراضية للحقل {field_name}: {value}");
   P ("label.schema.deprecated_field_label", "الحقل {name} مُهمَل، استخدم {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {خيار تعداد واحد} two {خيارا "
      & "تعداد} few {{count, number} خيارات تعداد} many "
      & "{{count, number} خيارَ تعداد} other {{count, number} "
      & "خيار تعداد}}");
   P ("label.schema.example_value_label", "مثال للحقل {field_name}: {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {حقل عادي} deprecated_field "
      & "{حقل مُهمَل} unknown_field {حقل غير معروف} "
      & "read_only_field {حقل للقراءة فقط} write_only_field "
      & "{حقل للكتابة فقط} other {حقل محسوب}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {حقل نصي} integer_field {حقل "
      & "عدد صحيح} decimal_field {حقل عدد عشري} boolean_field "
      & "{حقل منطقي} date_field {حقل تاريخ} date_time_field "
      & "{حقل تاريخ ووقت} object_field {حقل كائن} "
      & "array_field {حقل مصفوفة} enum_field {حقل تعداد} "
      & "binary_field {حقل ثنائي} null_field {حقل null} any_field "
      & "{حقل من أي نوع} other {حقل من نوع غير "
      & "معروف}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {لا توجد حقول إلزامية ناقصة} "
      & "one {حقل إلزامي واحد ناقص} two {حقلان "
      & "إلزاميان ناقصان} few {{count, number} حقول "
      & "إلزامية ناقصة} many {{count, number} حقلًا "
      & "إلزاميًا ناقصًا} other {{count, number} حقل "
      & "إلزامي ناقص}}");
   P ("label.schema.object_shape_label",
      "كائن {fields, plural, one {بحقل واحد} two {بحقلين} "
      & "few {بـ{fields, number} حقول} many {بـ{fields, number} "
      & "حقلًا} other {بـ{fields, number} حقل}}{required, plural, =0 "
      & "{} other {، الإلزامية: {required, number}}}{optional, "
      & "plural, =0 {} other {، الاختيارية: {optional, number}}}");
   P ("label.schema.schema_source_label", "المخطط {name}، الإصدار {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {قيمة مفردة} object_shape "
      & "{{count, plural, =0 {كائن} one {كائن بحقل واحد} two "
      & "{كائن بحقلين} few {كائن بـ{count, number} حقول} "
      & "many {كائن بـ{count, number} حقلًا} other {كائن "
      & "بـ{count, number} حقل}}} array_shape {{count, plural, =0 "
      & "{مصفوفة} one {مصفوفة بعنصر واحد} two "
      & "{مصفوفة بعنصرين} few {مصفوفة بـ{count, number} "
      & "عناصر} many {مصفوفة بـ{count, number} عنصرًا} other "
      & "{مصفوفة بـ{count, number} عنصر}}} map_shape {{count, "
      & "plural, =0 {خريطة} one {خريطة بمُدخل واحد} two "
      & "{خريطة بمُدخلين} few {خريطة بـ{count, number} "
      & "مُدخلات} many {خريطة بـ{count, number} مُدخلًا} "
      & "other {خريطة بـ{count, number} مُدخل}}} tuple_shape "
      & "{{count, plural, =0 {صف مرتب} one {صف مرتب بعنصر "
      & "واحد} two {صف مرتب بعنصرين} few {صف مرتب "
      & "بـ{count, number} عناصر} many {صف مرتب بـ{count, "
      & "number} عنصرًا} other {صف مرتب بـ{count, number} "
      & "عنصر}}} union_shape {{count, plural, =0 {اتحاد} one "
      & "{اتحاد من نوع واحد} two {اتحاد من نوعين} few "
      & "{اتحاد من {count, number} أنواع} many {اتحاد من "
      & "{count, number} نوعًا} other {اتحاد من {count, number} "
      & "نوع}}} empty_shape {شكل فارغ} other {شكل غير "
      & "معروف}}");
   P ("label.schema.unknown_field_label", "حقل غير معروف: {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {لا توجد مرشحات نشطة} one {مرشح "
      & "نشط واحد} two {مرشحان نشطان} few {{count, number} "
      & "مرشحات نشطة} many {{count, number} مرشحًا نشطًا} "
      & "other {{count, number} مرشح نشط}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {مسح المرشحات} one {مسح المرشح "
      & "النشط} two {مسح المرشحين النشطين} few {مسح "
      & "{count, number} مرشحات نشطة} many {مسح {count, number} "
      & "مرشحًا نشطًا} other {مسح {count, number} مرشح "
      & "نشط}}");
   P ("label.search.facet_label",
      "فئة {name}، {count, plural, one {خيار واحد} two "
      & "{خياران} few {{count, number} خيارات} many {{count, "
      & "number} خيارًا} other {{count, number} خيار}}");
   P ("label.search.facet_value_label",
      "{name}، {count, plural, =0 {لا توجد نتائج} one {نتيجة "
      & "واحدة} two {نتيجتان} few {{count, number} نتائج} many "
      & "{{count, number} نتيجةً} other {{count, number} "
      & "نتيجة}}{selected, select, true {، محدد} other {}}");
   P ("label.search.filter_label",
      "{name}: {value}، {state, select, active_filter {مرشح نشط} "
      & "inactive_filter {مرشح غير نشط} other {مرشح "
      & "مستبعد}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {مرشح نشط} inactive_filter "
      & "{مرشح غير نشط} other {مرشح مستبعد}}");
   P ("label.search.no_results_label", "لا توجد نتائج لـ«{query}»");
   P ("label.search.recent_search_label", "بحث حديث: «{query}»");
   P ("label.search.saved_search_label",
      "بحث محفوظ: {name}{count, plural, =0 {} one {، نتيجة "
      & "واحدة} two {، نتيجتان} few {، {count, number} "
      & "نتائج} many {، {count, number} نتيجةً} other {، {count, "
      & "number} نتيجة}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {لا توجد عمليات بحث حديثة} one "
      & "{عملية بحث حديثة واحدة} two {عمليتا بحث "
      & "حديثتان} few {{count, number} عمليات بحث حديثة} "
      & "other {{count, number} عملية بحث حديثة}}");
   P ("label.search.search_query_label", "البحث عن «{query}»");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {لا توجد نتائج} one {نتيجة "
      & "واحدة} two {نتيجتان} few {{count, number} نتائج} many "
      & "{{count, number} نتيجةً} other {{count, number} نتيجة}}");
   P ("label.search.search_result_summary_label",
      "نتائج «{query}»: {count, plural, =0 {لا توجد نتائج} "
      & "one {نتيجة واحدة} two {نتيجتان} few {{count, number} "
      & "نتائج} many {{count, number} نتيجةً} other {{count, number} "
      & "نتيجة}}");
   P ("label.search.search_scope_label",
      "نطاق {name}، {count, plural, =0 {لا توجد نتائج} one "
      & "{نتيجة واحدة} two {نتيجتان} few {{count, number} "
      & "نتائج} many {{count, number} نتيجةً} other {{count, number} "
      & "نتيجة}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {البحث خامل} searching_search "
      & "{جارٍ البحث} complete_search {اكتمل البحث} "
      & "empty_search {لا توجد نتائج بحث} other {فشل "
      & "البحث}}");
   P ("label.search.sort_label",
      "{mode, select, relevance_sort {الترتيب حسب الصلة} "
      & "ascending_sort {ترتيب تصاعدي} descending_sort {ترتيب "
      & "تنازلي} newest_first_sort {الترتيب من الأحدث "
      & "إلى الأقدم} other {الترتيب من الأقدم إلى "
      & "الأحدث}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {الصلة} ascending_sort "
      & "{تصاعدي} descending_sort {تنازلي} newest_first_sort "
      & "{الأحدث أولًا} other {الأقدم أولًا}}");
   P ("label.search.suggestion_label", "هل تقصد «{query}»؟");
   P ("label.secrets.credential_source_label",
      "{count, plural, one {بيانات اعتماد واحدة من "
      & "{source}} other {بيانات الاعتماد من {source}: {count, "
      & "number}}}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {القيمة مخفية} masked_value "
      & "{القيمة مقنّعة} suffix_only {اللاحقة فقط} other "
      & "{البصمة فقط}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {عام} support_profile {الدعم} "
      & "audit_profile {التدقيق} other {تصحيح الأخطاء}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, true {يلزم التدوير} other {لا "
      & "يلزم التدوير}}{days_old, plural, =0 {} one {، العمر: "
      & "يوم واحد} two {، العمر: يومان} few {، العمر: "
      & "{days_old, number} أيام} many {، العمر: {days_old, number} "
      & "يومًا} other {، العمر: {days_old, number} يوم}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {مفتاح API} live_api_key {مفتاح API "
      & "للإنتاج} test_api_key {مفتاح API للاختبار} "
      & "github_token {رمز GitHub} aws_access_key {مفتاح وصول AWS} "
      & "google_api_key {مفتاح Google API} slack_token {رمز Slack} "
      & "npm_token {رمز npm} bearer_token {رمز Bearer} jwt_token {رمز "
      & "JWT} basic_auth_credential {بيانات اعتماد المصادقة "
      & "الأساسية} password_secret {كلمة مرور} private_key "
      & "{مفتاح خاص} ssh_private_key {مفتاح SSH خاص} "
      & "webhook_secret {سر webhook} oauth_token {رمز OAuth} "
      & "database_url_secret {عنوان URL لقاعدة البيانات} "
      & "sha1_fingerprint {بصمة SHA-1} sha256_fingerprint {بصمة "
      & "SHA-256} other {سر}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {بريد إلكتروني} phone_value "
      & "{هاتف} url_value {URL} ip_address_value {عنوان IP} "
      & "token_value {رمز مميز} file_path_value {مسار ملف} "
      & "account_id_value {معرّف الحساب} payment_reference_value "
      & "{مرجع الدفع} log_field_value {حقل سجل} other {قيمة "
      & "حساسة}}");
   P ("label.tables.cell_label",
      "الصف {row, number}، العمود {column, number}، {state, "
      & "select, empty_cell {فارغة} edited_cell {معدّلة} "
      & "invalid_cell {غير صالحة} highlighted_cell {مميزة} other "
      & "{للقراءة فقط}}");
   P ("label.tables.cell_position_label", "الصف {row, number}، العمود {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {خلية فارغة} edited_cell {خلية "
      & "معدّلة} invalid_cell {خلية غير صالحة} "
      & "highlighted_cell {خلية مميزة} other {خلية للقراءة "
      & "فقط}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {لا توجد أعمدة} one {عمود واحد} "
      & "two {عمودان} few {{count, number} أعمدة} many {{count, "
      & "number} عمودًا} other {{count, number} عمود}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {عمود نصي} number_column "
      & "{عمود رقمي} date_column {عمود تاريخ} status_column "
      & "{عمود حالة} action_column {عمود إجراءات} other "
      & "{عمود مخفي}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {عمود نصي} number_column {عمود "
      & "رقمي} date_column {عمود تاريخ} status_column {عمود "
      & "حالة} action_column {عمود إجراءات} other {عمود "
      & "مخفي}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {صف واحد} two {صفان} few "
      & "{{count, number} صفوف} many {{count, number} صفًا} other "
      & "{{count, number} صف}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {لا توجد صفوف} one {صف واحد} two "
      & "{صفان} few {{count, number} صفوف} many {{count, number} "
      & "صفًا} other {{count, number} صف}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {غير مرتب} ascending_sort "
      & "{تصاعدي} other {تنازلي}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {غير مرتب} ascending_sort "
      & "{مرتب حسب {column_name} تصاعديًا} other {مرتب "
      & "حسب {column_name} تنازليًا}}");
   P ("label.tables.subtotal_label", "المجموع الفرعي {name}: {value}");
end Labels_2;
