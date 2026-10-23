separate (Humanize.Catalogs.Phrase_Data)
function Locale_Ar return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("ar", Name, Template));
begin
   return
     P ("all_count",
          "الكل: {total} {total, plural, zero {{zero}} one {{one}} two "
          & "{{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("filtered_count.none", "لا توجد {other} مطابقة")
     & P ("filtered_count.all",
          "الكل مطابق: {total} {total, plural, zero {{zero}} one {{one}} "
          & "two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("filtered_count.some",
          "المطابق: {matching} من {total} {total, plural, zero {{zero}} "
          & "one {{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("more_count", "المعروض: {visible}، +{remaining} أخرى")
     & P ("others_count",
          "{first} و{remaining, plural, one {واحد آخر} two {اثنان "
          & "آخران} other {{remaining} آخرون}}")
     & P ("page_count", "الصفحة {page} من {total}")
     & P ("page_size",
          "{size} {size, plural, zero {{zero}} one {{one}} two {{two}} few "
          & "{{few}} many {{many}} other {{one}}} لكل صفحة")
     & P ("pagination_range",
          "{first}–{last} من {total} {total, plural, zero {{zero}} one "
          & "{{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("position_count", "{position} من {total}")
     & P ("selection_count",
          "المحدد: {selected} من {total} {total, plural, zero {{zero}} "
          & "one {{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("showing_count",
          "عرض {showing} من {total} {total, plural, zero {{zero}} one "
          & "{{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("validation_count",
          "{count, plural, =0 {لا {severity, select, error {أخطاء} warning "
          & "{تحذيرات} other {ملاحظات}}} one {{severity, select, "
          & "error {خطأ واحد} warning {تحذير واحد} other "
          & "{ملاحظة واحدة}}} two {{severity, select, error {خطآن} "
          & "warning {تحذيران} other {ملاحظتان}}} few {{count} "
          & "{severity, select, error {أخطاء} warning {تحذيرات} other "
          & "{ملاحظات}}} other {{count} {severity, select, error {خطأ} "
          & "warning {تحذير} other {ملاحظة}}}}")
     & P ("collection.empty", "لا توجد {other}")
     & P ("collection.none_shown", "لا توجد {other} معروضة")
     & P ("collection.showing_hidden",
          "عرض {visible} من {total} {total, plural, zero {{zero}} one "
          & "{{one}} two {{two}} few {{few}} many {{many}} other {{one}}}، "
          & "المخفي: {hidden}")
     & P ("collection.showing",
          "عرض {visible} من {total} {total, plural, zero {{zero}} one "
          & "{{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("collection.shown_hidden",
          "المعروض: {visible} {visible, plural, zero {{zero}} one {{one}} "
          & "two {{two}} few {{few}} many {{many}} other {{one}}}، المخفي: "
          & "{hidden}")
     & P ("collection.shown",
          "المعروض: {visible} {visible, plural, zero {{zero}} one {{one}} "
          & "two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("collection.visible_out_of",
          "الظاهر: {visible} من أصل {total} {total, plural, zero "
          & "{{zero}} one {{one}} two {{two}} few {{few}} many {{many}} other "
          & "{{one}}}")
     & P ("complete_count", "اكتمل {done} من {total}")
     & P ("percent_complete", "اكتمل {percent}٪")
     & P ("step_count", "الخطوة {step} من {total}")
     & P ("attempt_count", "المحاولة {attempt} من {total}")
     & P ("throughput_remaining", "المتبقي: {remaining} {unit} بمعدل {rate} {unit}/ث")
     & P ("accessible_progress", "اكتمل {done} من {total}، {percent} بالمئة")
     & P ("business_days",
          "{days, plural, zero {0 يوم عمل} one {يوم عمل واحد} two "
          & "{يوما عمل} few {{days} أيام عمل} many {{days} يوم "
          & "عمل} other {{days} يوم عمل}}")
     & P ("working_hours",
          "{hours, plural, zero {0 ساعة عمل} one {ساعة عمل "
          & "واحدة} two {ساعتا عمل} few {{hours} ساعات عمل} "
          & "many {{hours} ساعة عمل} other {{hours} ساعة عمل}}")
     & P ("due.overdue",
          "متأخر: {days, plural, zero {0 يوم} one {يوم واحد} two "
          & "{يومان} few {{days} أيام} many {{days} يومًا} other "
          & "{{days} يوم}}")
     & P ("due.today", "مستحق اليوم")
     & P ("due.tomorrow", "مستحق غدًا")
     & P ("due.in",
          "مستحق خلال {days, plural, zero {0 يوم} one {يوم "
          & "واحد} two {يومين} few {{days} أيام} many {{days} "
          & "يومًا} other {{days} يوم}}")
     & P ("calendar_difference.future", "خلال {difference}")
     & P ("calendar_difference.past", "قبل {difference}")
     & P ("calendar_difference.same_day", "في اليوم نفسه")
     & P ("calendar_difference.zero", "0 يوم")
     & P ("cpu_load", "حمل المعالج: {measure}")
     & P ("battery", "البطارية: {measure}")
     & P ("screen_size", "الشاشة: {measure}")
     & P ("refresh_rate", "معدل التحديث: {measure}")
     & P ("editorial_percent.symbol", "{value}٪")
     & P ("editorial_percent.word", "{value} بالمئة")
     & P ("recurrence.second",
          "{every, plural, one {كل ثانية} two {كل ثانيتين} few "
          & "{كل {every} ثوانٍ} other {كل {every} ثانية}}")
     & P ("recurrence.minute",
          "{every, plural, one {كل دقيقة} two {كل دقيقتين} few "
          & "{كل {every} دقائق} other {كل {every} دقيقة}}")
     & P ("recurrence.hour",
          "{every, plural, one {كل ساعة} two {كل ساعتين} few {كل "
          & "{every} ساعات} other {كل {every} ساعة}}")
     & P ("recurrence.day",
          "{every, plural, one {كل يوم} two {كل يومين} few {كل "
          & "{every} أيام} other {كل {every} يوم}}")
     & P ("recurrence.week",
          "{every, plural, one {كل أسبوع} two {كل أسبوعين} few "
          & "{كل {every} أسابيع} other {كل {every} أسبوع}}")
     & P ("recurrence.month",
          "{every, plural, one {كل شهر} two {كل شهرين} few {كل "
          & "{every} أشهر} other {كل {every} شهر}}")
     & P ("recurrence.quarter",
          "{every, plural, one {كل ربع سنة} two {كل ربعي سنة} "
          & "few {كل {every} أرباع سنة} other {كل {every} ربع "
          & "سنة}}")
     & P ("recurrence.year",
          "{every, plural, one {كل سنة} two {كل سنتين} few {كل "
          & "{every} سنوات} other {كل {every} سنة}}")
     & P ("cache_summary.empty", "الذاكرة المؤقتة: لا توجد طلبات")
     & P ("cache_summary",
          "الذاكرة المؤقتة: الإصابات {hits}، "
          & "الإخفاقات {misses}، معدل الإصابة {rate}٪")
     & P ("field_change_summary",
          "{total} {total, plural, zero {{zero}} one {{one}} two {{two}} few "
          & "{{few}} many {{many}} other {{one}}}: المعدّل {changed}، "
          & "المضاف {added}، المحذوف {removed}")
     & P ("field_diff", "تغيّر {field} من {before} إلى {after}")
     & P ("field_added", "أُضيف {field} بالقيمة {value}")
     & P ("field_removed", "أُزيل {field} (القيمة السابقة: {value})")
     & P ("field_unchanged", "{field} دون تغيير: {value}")
     & P ("number_comparison.equal", "{current} يساوي {baseline}")
     & P ("number_comparison.higher", "{current} أعلى من {baseline} بمقدار {quantity}")
     & P ("number_comparison.lower", "{current} أقل من {baseline} بمقدار {quantity}")
     & P ("percent_comparison.equal", "{current} يساوي {baseline}")
     & P ("percent_comparison.higher", "{current} أعلى من {baseline} بمقدار {quantity}")
     & P ("percent_comparison.lower", "{current} أقل من {baseline} بمقدار {quantity}")
     & P ("file_size_comparison.same", "{current} بنفس حجم {baseline}")
     & P ("file_size_comparison.larger", "{current} أكبر من {baseline} بمقدار {quantity}")
     & P ("file_size_comparison.smaller", "{current} أصغر من {baseline} بمقدار {quantity}")
     & P ("date_comparison.same", "{current} في نفس تاريخ {baseline}")
     & P ("date_comparison.after", "{current} بعد {baseline} بمقدار {quantity}")
     & P ("date_comparison.before", "{current} قبل {baseline} بمقدار {quantity}")
     & P ("queue_summary", "قائمة الانتظار: {details}")
     & P ("queue_summary.empty", "قائمة الانتظار فارغة")
     & P ("domain_summary",
          "{domain, select, queue {قائمة الانتظار} job "
          & "{المهمة} run {التشغيل} cache {الذاكرة "
          & "المؤقتة} sync {المزامنة} import {الاستيراد} "
          & "export {التصدير} other {{domain}}} – {state, select, queued "
          & "{في قائمة الانتظار} running {قيد التشغيل} "
          & "waiting {قيد الانتظار} paused {متوقف مؤقتًا} "
          & "complete {مكتمل} failed {فشل} stale {قديم} skipped {تم "
          & "التخطي} other {{state}}}: {details}")
     & P ("summary.none", "لا توجد {other}")
     & P ("summary.completed",
          "المكتمل: {count} {count, plural, zero {{zero}} one {{one}} two "
          & "{{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("summary.completed_of",
          "المكتمل: {count} من {total} {total, plural, zero {{zero}} one "
          & "{{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("summary.failed", "الفاشل: {count}")
     & P ("summary.queued",
          "في الانتظار: {count} {count, plural, zero {{zero}} one "
          & "{{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("summary.running", "قيد التشغيل: {count}")
     & P ("summary.complete", "المكتمل: {count}")
     & P ("backup.backup_running", "النسخ الاحتياطي قيد التشغيل")
     & P ("backup.backup_completed", "اكتمل النسخ الاحتياطي")
     & P ("backup.backup_failed", "فشل النسخ الاحتياطي")
     & P ("backup.backup_stale", "النسخة الاحتياطية قديمة")
     & P ("incident.incident_investigating", "جارٍ التحقيق في الحادث")
     & P ("incident.incident_identified", "تم تحديد الحادث")
     & P ("incident.incident_mitigated", "تم احتواء الحادث")
     & P ("incident.incident_resolved", "تم حل الحادث")
     & P ("release.release_drafting", "جارٍ إعداد الإصدار")
     & P ("release.release_ready", "الإصدار جاهز")
     & P ("release.release_published", "تم نشر الإصدار")
     & P ("release.release_rolled_back", "تم التراجع عن الإصدار")
     & P ("audit.audit_created", "تم إنشاء إدخال التدقيق")
     & P ("audit.audit_updated", "تم تحديث إدخال التدقيق")
     & P ("audit.audit_deleted", "تم حذف إدخال التدقيق")
     & P ("audit.audit_restored", "تمت استعادة إدخال التدقيق")
     & P ("flag.flag_enabled", "تم تفعيل علامة الميزة")
     & P ("flag.flag_disabled", "تم تعطيل علامة الميزة")
     & P ("flag.flag_rolling_out", "جارٍ طرح علامة الميزة")
     & P ("flag.flag_rolled_back", "تم التراجع عن علامة الميزة")
     & P ("webhook.webhook_pending", "خطاف الويب معلّق")
     & P ("webhook.webhook_delivered", "تم تسليم خطاف الويب")
     & P ("webhook.webhook_failed", "فشل خطاف الويب")
     & P ("webhook.webhook_retrying", "جارٍ إعادة محاولة خطاف الويب")
     & P ("api_key.api_key_active", "مفتاح API نشط")
     & P ("api_key.api_key_revoked", "تم إبطال مفتاح API")
     & P ("api_key.api_key_expired", "انتهت صلاحية مفتاح API")
     & P ("api_key.api_key_rotated", "تم تدوير مفتاح API")
     & P ("quota.quota_available", "الحصة متاحة")
     & P ("quota.quota_near_limit", "الحصة على وشك النفاد")
     & P ("quota.quota_exceeded", "تم تجاوز الحصة")
     & P ("quota.quota_reset", "تمت إعادة تعيين الحصة")
     & P ("invoice.invoice_draft", "مسودة فاتورة")
     & P ("invoice.invoice_sent", "تم إرسال الفاتورة")
     & P ("invoice.invoice_paid", "تم دفع الفاتورة")
     & P ("invoice.invoice_refunded", "تم استرداد مبلغ الفاتورة")
     & P ("invoice.invoice_overdue", "الفاتورة متأخرة السداد")
     & P ("invoice.refund_failed", "فشل الاسترداد")
     & P ("page_navigation.only", "الصفحة الوحيدة")
     & P ("page_navigation.first", "الصفحة الأولى، التالية متاحة")
     & P ("page_navigation.last", "الصفحة الأخيرة، السابقة متاحة")
     & P ("page_navigation.middle", "السابقة والتالية متاحتان")
     & P ("end_of_week", "نهاية الأسبوع")
     & P ("end_of_month", "نهاية الشهر")
     & P ("end_of_quarter", "نهاية ربع السنة")
     & P ("time_of_day.night", "الليل")
     & P ("time_of_day.morning", "الصباح")
     & P ("time_of_day.afternoon", "بعد الظهر")
     & P ("time_of_day.evening", "المساء")
     & P ("access.allowed", "مسموح")
     & P ("access.denied", "مرفوض")
     & P ("access.owner", "المالك")
     & P ("access.admin", "المسؤول")
     & P ("access.viewer", "مشاهد")
     & P ("access.editor", "محرر")
     & P ("auth.signed_in", "تم تسجيل الدخول")
     & P ("auth.signed_out", "تم تسجيل الخروج")
     & P ("auth.session_expired", "انتهت الجلسة")
     & P ("auth.locked", "مقفل")
     & P ("auth.two_factor_required", "المصادقة الثنائية مطلوبة")
     & P ("billing.trialing", "فترة تجريبية")
     & P ("billing.payment_due", "الدفع مستحق")
     & P ("billing.payment_failed", "فشل الدفع")
     & P ("billing.paid", "مدفوع")
     & P ("billing.past_due", "متأخر السداد")
     & P ("billing.canceled", "ملغى")
     & P ("ci.pipeline_pending", "خط المعالجة معلّق")
     & P ("ci.pipeline_running", "خط المعالجة قيد التشغيل")
     & P ("ci.pipeline_passed", "نجح خط المعالجة")
     & P ("ci.pipeline_failed", "فشل خط المعالجة")
     & P ("ci.review_required", "المراجعة مطلوبة")
     & P ("ci.deploy_blocked", "النشر محظور")
     & P ("collaboration.active_now", "نشط الآن")
     & P ("collaboration.away", "بعيد")
     & P ("collaboration.do_not_disturb", "عدم الإزعاج")
     & P ("collaboration.typing", "يكتب")
     & P ("collaboration.viewing", "يشاهد")
     & P ("collaboration.editing", "يحرر")
     & P ("deployment.deploying", "جارٍ النشر")
     & P ("deployment.deployed", "تم النشر")
     & P ("deployment.rolling_back", "جارٍ التراجع")
     & P ("deployment.rolled_back", "تم التراجع")
     & P ("deployment.build_failed", "فشل البناء")
     & P ("deployment.checks_passed", "نجحت الفحوصات")
     & P ("empty.no_items", "لا توجد عناصر")
     & P ("empty.no_results", "لا توجد نتائج")
     & P ("empty.no_messages", "لا توجد رسائل")
     & P ("empty.no_selection", "لا يوجد تحديد")
     & P ("empty.nothing_to_show", "لا شيء لعرضه")
     & P ("file.uploading", "جارٍ الرفع")
     & P ("file.downloading", "جارٍ التنزيل")
     & P ("file.copying", "جارٍ النسخ")
     & P ("file.moving", "جارٍ النقل")
     & P ("file.deleting", "جارٍ الحذف")
     & P ("file.deleted", "محذوف")
     & P ("file.restoring", "جارٍ الاستعادة")
     & P ("file.synced", "تمت المزامنة")
     & P ("form.valid_input", "إدخال صالح")
     & P ("form.invalid_input", "إدخال غير صالح")
     & P ("form.dirty", "معدّل")
     & P ("form.pristine", "غير معدّل")
     & P ("form.submitted", "تم الإرسال")
     & P ("form.submission_failed", "فشل الإرسال")
     & P ("health.healthy", "سليم")
     & P ("health.degraded", "متدهور")
     & P ("health.unhealthy", "غير سليم")
     & P ("health.incident", "حادث")
     & P ("health.maintenance", "صيانة")
     & P ("health.recovering", "جارٍ التعافي")
     & P ("issue.open", "مفتوح")
     & P ("issue.closed", "مغلق")
     & P ("issue.reopened", "أُعيد فتحه")
     & P ("issue.assigned", "معيّن")
     & P ("issue.unassigned", "غير معيّن")
     & P ("issue.merged", "مدموج")
     & P ("network.offline", "غير متصل")
     & P ("network.online", "متصل")
     & P ("network.connecting", "جارٍ الاتصال")
     & P ("network.syncing", "جارٍ المزامنة")
     & P ("network.sync_failed", "فشلت المزامنة")
     & P ("network.permission_denied", "تم رفض الإذن")
     & P ("network.read_only", "للقراءة فقط")
     & P ("notification.unread", "غير مقروء")
     & P ("notification.read", "مقروء")
     & P ("notification.muted", "مكتوم")
     & P ("notification.snoozed", "مؤجل")
     & P ("notification.sent", "مُرسل")
     & P ("notification.delivered", "تم التسليم")
     & P ("payment.payment_authorized", "تم تفويض الدفع")
     & P ("payment.payment_captured", "تم تحصيل الدفع")
     & P ("payment.payment_refunded", "تم استرداد الدفع")
     & P ("payment.payment_disputed", "الدفع متنازع عليه")
     & P ("payment.payment_requires_action", "الدفع يتطلب إجراءً")
     & P ("payment.payment_expired", "انتهت صلاحية الدفع")
     & P ("ui.empty", "فارغ")
     & P ("ui.loading", "جارٍ التحميل")
     & P ("ui.saving", "جارٍ الحفظ")
     & P ("ui.saved", "محفوظ")
     & P ("ui.unsaved", "غير محفوظ")
     & P ("ui.retrying", "جارٍ إعادة المحاولة")
     & P ("ui.paused", "متوقف مؤقتًا")
     & P ("ui.complete", "مكتمل")
     & P ("ui.failed", "فشل")
     & P ("ui.due_soon", "مستحق قريبًا")
     & P ("ui.overdue", "متأخر")
     & P ("ui.last_seen", "آخر ظهور")
     & P ("ui.updated_just_now", "حُدّث للتو")
     & P ("queue.queued", "في قائمة الانتظار")
     & P ("queue.running", "قيد التشغيل")
     & P ("queue.waiting", "قيد الانتظار")
     & P ("queue.blocked", "محظور")
     & P ("queue.canceled_job", "أُلغيت المهمة")
     & P ("queue.completed_job", "اكتملت المهمة")
     & P ("search.filtering", "جارٍ التصفية")
     & P ("search.filtered", "مُصفّى")
     & P ("search.no_matches", "لا توجد تطابقات")
     & P ("search.search_ready", "البحث جاهز")
     & P ("search.search_failed", "فشل البحث")
     & P ("search.query_too_short", "الاستعلام قصير جدًا")
     & P ("security.secure", "آمن")
     & P ("security.insecure", "غير آمن")
     & P ("security.vulnerable", "معرّض للخطر")
     & P ("security.encrypted", "مشفّر")
     & P ("security.unencrypted", "غير مشفّر")
     & P ("security.token_expired", "انتهت صلاحية الرمز المميز")
     & P ("sync.sync_idle", "المزامنة خاملة")
     & P ("sync.syncing_now", "جارٍ المزامنة الآن")
     & P ("sync.sync_queued", "المزامنة في الانتظار")
     & P ("sync.sync_conflict", "تعارض في المزامنة")
     & P ("sync.sync_complete", "اكتملت المزامنة")
     & P ("sync.sync_error", "خطأ في المزامنة")
     & P ("task.todo", "للتنفيذ")
     & P ("task.in_progress", "قيد التنفيذ")
     & P ("task.done", "تم")
     & P ("task.skipped", "تم التخطي")
     & P ("task.blocked_task", "محظور")
     & P ("task.waiting_on", "في انتظار")
     & P ("ticket.ticket_new", "تذكرة جديدة")
     & P ("ticket.ticket_open", "تذكرة مفتوحة")
     & P ("ticket.ticket_waiting", "تذكرة قيد الانتظار")
     & P ("ticket.ticket_escalated", "تذكرة مُصعّدة")
     & P ("ticket.ticket_resolved", "تذكرة محلولة")
     & P ("ticket.ticket_closed", "تذكرة مغلقة")
     & P ("transfer.importing", "جارٍ الاستيراد")
     & P ("transfer.imported", "تم الاستيراد")
     & P ("transfer.import_failed", "فشل الاستيراد")
     & P ("transfer.exporting", "جارٍ التصدير")
     & P ("transfer.exported", "تم التصدير")
     & P ("transfer.export_failed", "فشل التصدير")
     & P ("validation.required", "مطلوب")
     & P ("validation.optional", "اختياري")
     & P ("validation.invalid", "غير صالح")
     & P ("validation.too_short", "قصير جدًا")
     & P ("validation.too_long", "طويل جدًا")
     & P ("validation.out_of_range", "خارج النطاق")
     & P ("validation.already_exists", "موجود بالفعل")
     & P ("workflow.draft", "مسودة")
     & P ("workflow.in_review", "قيد المراجعة")
     & P ("workflow.approved", "تمت الموافقة")
     & P ("workflow.rejected", "مرفوض")
     & P ("workflow.published", "منشور")
     & P ("workflow.archived", "مؤرشف")
     & P ("database.database_online", "قاعدة البيانات متصلة")
     & P ("database.database_offline", "قاعدة البيانات غير متصلة")
     & P ("database.database_degraded", "قاعدة البيانات متدهورة")
     & P ("database.database_migrating", "جارٍ ترحيل قاعدة البيانات")
     & P ("database.database_migration_failed", "فشل ترحيل قاعدة البيانات")
     & P ("database.database_replicating", "جارٍ النسخ المتماثل لقاعدة البيانات")
     & P ("database.database_replication_lagging",
          "النسخ المتماثل لقاعدة البيانات متأخر")
     & P ("database.database_backup_running",
          "النسخ الاحتياطي لقاعدة البيانات قيد "
          & "التشغيل")
     & P ("database.database_backup_failed", "فشل النسخ الاحتياطي لقاعدة البيانات")
     & P ("count",
          "{count, plural, zero {# {zero}} one {# {one}} two {# {two}} few {# "
          & "{few}} many {# {many}} other {# {one}}}")
     & P ("noun",
          "{count, plural, zero {{zero}} one {{one}} two {{two}} few {{few}} many "
          & "{{many}} other {{one}}}")
     & P ("times_noun",
          "{count, plural, =0 {{other}: ولا مرة} =1 {{one}: مرة "
          & "واحدة} =2 {{two}: مرتان} zero {{zero}: # مرة} one {{one}: "
          & "# مرة} two {{two}: # مرة} few {{few}: # مرات} many {{many}: "
          & "# مرة} other {{one}: # مرة}}")
     & P ("availability.all",
          "المتاح: {available} من {total} {total, plural, zero {{zero}} "
          & "one {{one}} two {{two}} few {{few}} many {{many}} other {{one}}}")
     & P ("availability.none", "لا توجد {other} متاحة")
     & P ("availability.partial",
          "المتاح: {available} من {total} {total, plural, zero {{zero}} "
          & "one {{one}} two {{two}} few {{few}} many {{many}} other {{one}}}، "
          & "غير المتاح: {unavailable}")
     & P ("operation_progress", "{name} – {state}: {details}")
     & P ("operation.queued", "في الانتظار")
     & P ("operation.running", "قيد التشغيل")
     & P ("operation.blocked", "محظور")
     & P ("operation.retrying", "إعادة المحاولة")
     & P ("operation.succeeded", "ناجح")
     & P ("operation.partially_succeeded", "ناجح جزئيًا")
     & P ("operation.failed", "فاشل")
     & P ("operation.canceled", "ملغى")
     & P ("operation.skipped", "متخطى")
     & P ("operation.stale", "قديم")
     & P ("operation.unknown_state", "غير معروف")
     & P ("operation.last_success", "{name} – آخر نجاح: {time}")
     & P ("operation.next_retry", "{name} – المحاولة التالية: {time}")
     & P ("operation.stale_run", "{name} – قديم منذ {time}")
     & P ("summary.skipped", "المتخطى: {count}")
     & P ("summary.retried", "المعاد محاولته: {count}")
     & P ("summary.canceled", "الملغى: {count}")
     & P ("system.service.operational", "يعمل بشكل طبيعي")
     & P ("system.service.degraded", "أداء متراجع")
     & P ("system.service.partial_outage", "انقطاع جزئي")
     & P ("system.service.major_outage", "انقطاع كبير")
     & P ("system.service.maintenance", "قيد الصيانة")
     & P ("system.service.unknown", "حالة الخدمة غير معروفة")
     & P ("system.health.healthy", "سليم")
     & P ("system.health.warning", "تحذير")
     & P ("system.health.critical", "حرج")
     & P ("system.health.unavailable", "غير متاح")
     & P ("system.health.unknown_health", "حالة السلامة غير معروفة")
     & P ("system.readiness.ready", "جاهز")
     & P ("system.readiness.not_ready", "غير جاهز")
     & P ("system.readiness.starting", "قيد البدء")
     & P ("system.readiness.draining", "قيد التصريف")
     & P ("system.readiness.stopped", "متوقف")
     & P ("system.readiness.unknown_readiness", "حالة الجاهزية غير معروفة")
     & P ("system.component.online", "متصل")
     & P ("system.component.offline", "غير متصل")
     & P ("system.component.starting", "قيد البدء")
     & P ("system.component.stopping", "قيد الإيقاف")
     & P ("system.component.restarting", "قيد إعادة التشغيل")
     & P ("system.component.unknown", "حالة المكوّن غير معروفة")
     & P ("system.check.passing", "ناجح")
     & P ("system.check.failing", "فاشل")
     & P ("system.check.warning", "تحذير")
     & P ("system.check.skipped", "تم تخطيه")
     & P ("system.check.timed_out", "انتهت المهلة")
     & P ("system.check.unknown", "حالة الفحص غير معروفة")
     & P ("system.incident.investigating", "قيد التحقيق")
     & P ("system.incident.identified", "تم تحديد السبب")
     & P ("system.incident.monitoring", "قيد المراقبة")
     & P ("system.incident.resolved", "تم الحل")
     & P ("system.incident.scheduled_maintenance", "صيانة مجدولة")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "فحص {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {لا مكونات} one {مكوّن واحد} two "
          & "{مكوّنان} few {{count} مكوّنات} many {{count} "
          & "مكوّنًا} other {{count} مكوّن}}")
     & P ("system.count.checks",
          "{count, plural, =0 {لا فحوصات} one {فحص واحد} two "
          & "{فحصان} few {{count} فحوصات} many {{count} فحصًا} "
          & "other {{count} فحص}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {لا حوادث} one {حادث واحد} two "
          & "{حادثان} few {{count} حوادث} many {{count} حادثًا} "
          & "other {{count} حادث}}")
     & P ("system.uptime", "مدة التشغيل {measure}")
     & P ("system.latency", "زمن الاستجابة {measure}")
     & P ("system.maintenance_window", "نافذة الصيانة {time}")
     & P ("system.last_checked", "آخر فحص {time}")
     & P ("system.http.informational", "معلوماتي")
     & P ("system.http.successful", "نجاح")
     & P ("system.http.redirection", "إعادة توجيه")
     & P ("system.http.client_error", "خطأ من العميل")
     & P ("system.http.server_error", "خطأ في الخادم")
     & P ("system.exit.success", "رمز الخروج {code}: نجاح")
     & P ("system.exit.failure", "رمز الخروج {code}: فشل")
     & P ("system.exit.usage_error", "رمز الخروج {code}: خطأ في الاستخدام")
     & P ("system.exit.not_executable", "رمز الخروج {code}: الأمر غير قابل للتنفيذ")
     & P ("system.exit.not_found", "رمز الخروج {code}: الأمر غير موجود")
     & P ("system.exit.invalid_argument", "رمز الخروج {code}: وسيطة خروج غير صالحة")
     & P ("system.exit.signal", "رمز الخروج {code}: أُنهي بواسطة {signal}");
end Locale_Ar;
