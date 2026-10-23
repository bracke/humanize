separate (Humanize.Catalogs.Phrase_Data)
function Locale_Ar return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("ar", Name, Template));
begin
   return
     P ("all_count", "الكل: {total} {total, plural, few {{other}} other {{one}}}")
     & P ("filtered_count.none", "لا توجد {other} مطابقة")
     & P ("filtered_count.all",
          "الكل مطابق: {total} {total, plural, few {{other}} other "
          & "{{one}}}")
     & P ("filtered_count.some",
          "المطابق: {matching} من {total} {total, plural, few {{other}} "
          & "other {{one}}}")
     & P ("more_count", "المعروض: {visible}، +{remaining} أخرى")
     & P ("others_count",
          "{first} و{remaining, plural, one {واحد آخر} two {اثنان "
          & "آخران} other {{remaining} آخرون}}")
     & P ("page_count", "الصفحة {page} من {total}")
     & P ("page_size", "{size} {size, plural, few {{other}} other {{one}}} لكل صفحة")
     & P ("pagination_range",
          "{first}–{last} من {total} {total, plural, few {{other}} other "
          & "{{one}}}")
     & P ("position_count", "{position} من {total}")
     & P ("selection_count",
          "المحدد: {selected} من {total} {total, plural, few {{other}} "
          & "other {{one}}}")
     & P ("showing_count",
          "عرض {showing} من {total} {total, plural, few {{other}} other "
          & "{{one}}}")
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
          "عرض {visible} من {total} {total, plural, few {{other}} other "
          & "{{one}}}، المخفي: {hidden}")
     & P ("collection.showing",
          "عرض {visible} من {total} {total, plural, few {{other}} other "
          & "{{one}}}")
     & P ("collection.shown_hidden",
          "المعروض: {visible} {visible, plural, few {{other}} other "
          & "{{one}}}، المخفي: {hidden}")
     & P ("collection.shown",
          "المعروض: {visible} {visible, plural, few {{other}} other "
          & "{{one}}}")
     & P ("collection.visible_out_of",
          "الظاهر: {visible} من أصل {total} {total, plural, few "
          & "{{other}} other {{one}}}")
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
          "{total} {total, plural, few {{other}} other {{one}}}: المعدّل "
          & "{changed}، المضاف {added}، المحذوف {removed}")
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
     & P ("summary.completed", "المكتمل: {count} {count, plural, few {{other}} other {{one}}}")
     & P ("summary.completed_of",
          "المكتمل: {count} من {total} {total, plural, few {{other}} "
          & "other {{one}}}")
     & P ("summary.failed", "الفاشل: {count}")
     & P ("summary.queued",
          "في الانتظار: {count} {count, plural, few {{other}} other "
          & "{{one}}}")
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
     & P ("feature_flag.flag_enabled", "تم تفعيل علامة الميزة")
     & P ("feature_flag.flag_disabled", "تم تعطيل علامة الميزة")
     & P ("feature_flag.flag_rolling_out", "جارٍ طرح علامة الميزة")
     & P ("feature_flag.flag_rolled_back", "تم التراجع عن علامة الميزة")
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
     & P ("time_of_day.evening", "المساء");
end Locale_Ar;
