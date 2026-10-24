separate (Humanize.Catalogs.Phrase_Data.Locale_Ar)
procedure Labels_3 is
begin
   P ("label.tables.table_size_label",
      "{rows, plural, one {صف واحد} two {صفان} few {{rows, number} "
      & "صفوف} many {{rows, number} صفًا} other {{rows, number} صف}} "
      & "× {columns, plural, one {عمود واحد} two {عمودان} few "
      & "{{columns, number} أعمدة} many {{columns, number} عمودًا} "
      & "other {{columns, number} عمود}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {أُلغي إسناد {assignee}} assigned "
      & "{أُسندت إلى {assignee}} reassigned {أُعيد إسنادها "
      & "إلى {assignee}} watching {{assignee} يتابع} other {{assignee} "
      & "مالك المهمة}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {غير مُسندة} assigned "
      & "{مُسندة} reassigned {أُعيد إسنادها} watching {قيد "
      & "المتابعة} other {مالك المهمة}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {قائمة المهام المتراكمة "
      & "فارغة} one {المهام المتراكمة: مهمة واحدة} "
      & "two {المهام المتراكمة: مهمتان} few {المهام "
      & "المتراكمة: {count, number} مهام} many {المهام "
      & "المتراكمة: {count, number} مهمةً} other {المهام "
      & "المتراكمة: {count, number} مهمة}}");
   P ("label.tasks.blocker_label", "محظورة بسبب {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, one {إكمال المهمة} two {إكمال "
      & "مهمتين} few {إكمال {count, number} مهام} many "
      & "{إكمال {count, number} مهمةً} other {إكمال {count, "
      & "number} مهمة}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {لا توجد مهام مكتملة} one {مهمة "
      & "مكتملة واحدة} two {مهمتان مكتملتان} few "
      & "{{count, number} مهام مكتملة} many {{count, number} "
      & "مهمةً مكتملة} other {{count, number} مهمة "
      & "مكتملة}}");
   P ("label.tasks.due_label", "مستحقة {due_text}");
   P ("label.tasks.estimate_label", "التقدير: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {لا توجد مهام مفتوحة} one {مهمة "
      & "مفتوحة واحدة} two {مهمتان مفتوحتان} few "
      & "{{count, number} مهام مفتوحة} many {{count, number} "
      & "مهمةً مفتوحة} other {{count, number} مهمة "
      & "مفتوحة}}");
   P ("label.tasks.overdue_label", "متأخرة منذ {due_text}");
   P ("label.tasks.recurring_task_label", "تتكرر {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, one {إعادة فتح المهمة} two {إعادة "
      & "فتح مهمتين} few {إعادة فتح {count, number} مهام} "
      & "many {إعادة فتح {count, number} مهمةً} other {إعادة "
      & "فتح {count, number} مهمة}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {مهمة واحدة} two {مهمتان} "
      & "few {{count, number} مهام} many {{count, number} مهمةً} other "
      & "{{count, number} مهمة}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {مهمة فرعية واحدة} two "
      & "{مهمتان فرعيتان} few {{count, number} مهام "
      & "فرعية} many {{count, number} مهمةً فرعية} other "
      & "{{count, number} مهمة فرعية}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {لا توجد مهام} one {مهمة واحدة} "
      & "two {مهمتان} few {{count, number} مهام} many {{count, "
      & "number} مهمةً} other {{count, number} مهمة}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {مهمة مفتوحة} "
      & "in_progress_task {مهمة قيد التنفيذ} blocked_task "
      & "{مهمة محظورة} done_task {مهمة منجزة} canceled_task "
      & "{مهمة ملغاة} deferred_task {مهمة مؤجلة} other "
      & "{مهمة متأخرة}}{priority, select, no_priority {} low_priority "
      & "{، أولوية منخفضة} medium_priority {، أولوية "
      & "متوسطة} high_priority {، أولوية عالية} other {، "
      & "أولوية حرجة}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {بلا أولوية} low_priority "
      & "{أولوية منخفضة} medium_priority {أولوية "
      & "متوسطة} high_priority {أولوية عالية} other "
      & "{أولوية حرجة}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {مهمة مفتوحة} in_progress_task "
      & "{مهمة قيد التنفيذ} blocked_task {مهمة محظورة} "
      & "done_task {مهمة منجزة} canceled_task {مهمة ملغاة} "
      & "deferred_task {مهمة مؤجلة} other {مهمة متأخرة}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {الحد الأعلى} other "
      & "{الحد الأدنى}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {أقل من النطاق المتوقع} "
      & "within_range {ضمن النطاق المتوقع} above_range "
      & "{أعلى من النطاق المتوقع} below_target {أقل من "
      & "الهدف} at_target {عند الهدف} above_target {أعلى من "
      & "الهدف} near_limit {قريب من الحد} warning_level "
      & "{عتبة التحذير} critical_level {العتبة الحرجة} "
      & "breached {تم تجاوز الحد} other {حالة العتبة "
      & "غير معروفة}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {محدّث} one {متقدم "
      & "بإيداع واحد} two {متقدم بإيداعين} few "
      & "{متقدم بـ{ahead, number} إيداعات} many {متقدم "
      & "بـ{ahead, number} إيداعًا} other {متقدم بـ{ahead, "
      & "number} إيداع}}} other {{ahead, plural, =0 {} one {متقدم "
      & "بإيداع واحد، } two {متقدم بإيداعين، } few "
      & "{متقدم بـ{ahead, number} إيداعات، } many {متقدم "
      & "بـ{ahead, number} إيداعًا، } other {متقدم بـ{ahead, "
      & "number} إيداع، }}{behind, plural, one {متأخر بإيداع "
      & "واحد} two {متأخر بإيداعين} few {متأخر "
      & "بـ{behind, number} إيداعات} many {متأخر بـ{behind, "
      & "number} إيداعًا} other {متأخر بـ{behind, number} "
      & "إيداع}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, true {بانتظار موافقة {approver}} other "
      & "{تمت الموافقة من {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, one {{attempt, plural, one {المحاولة 1 من 1} "
      & "other {المحاولة {attempt, number} من 1، تم تجاوز "
      & "الحد}}} other {المحاولة {attempt, number} من {limit, "
      & "number}}}");
   P ("label.workflows.blocker_label", "محظور: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {لا توجد تبعيات حاجبة} one "
      & "{تبعية حاجبة واحدة} two {تبعيتان حاجبتان} "
      & "few {{count, number} تبعيات حاجبة} many {{count, number} "
      & "تبعيةً حاجبة} other {{count, number} تبعية "
      & "حاجبة}}");
   P ("label.workflows.handoff_label", "تسليم من {from} إلى {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {مرحلة قادمة} "
      & "current_milestone {المرحلة الحالية} complete_milestone "
      & "{مرحلة مكتملة} missed_milestone {مرحلة فائتة} "
      & "other {مرحلة محظورة}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {قادمة} "
      & "current_milestone {حالية} complete_milestone {مكتملة} "
      & "missed_milestone {فائتة} other {محظورة}}");
   P ("label.workflows.next_action_label", "التالي: {action}");
   P ("label.workflows.owner_label", "المالك: {owner}");
   P ("label.workflows.resume_label", "استئناف {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {معلّقة} active_step {نشطة} "
      & "waiting_step {قيد الانتظار} blocked_step {محظورة} "
      & "done_step {منجزة} failed_step {فشلت} other {تم "
      & "تخطيها}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {معلّقة} active_step "
      & "{نشطة} waiting_step {قيد الانتظار} blocked_step "
      & "{محظورة} done_step {منجزة} failed_step {فشلت} other "
      & "{تم تخطيها}}");
   P ("label.workflows.waiting_label", "بانتظار {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {لم يبدأ} "
      & "in_progress_state {قيد التنفيذ} waiting_state {قيد "
      & "الانتظار} waiting_approval_state {بانتظار "
      & "الموافقة} blocked_state {محظور} completed_state "
      & "{مكتمل} failed_state {فشل} cancelled_state {ملغى} "
      & "skipped_state {تم التخطي} other {متوقف مؤقتًا}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {لم يبدأ} in_progress_state "
      & "{قيد التنفيذ} waiting_state {قيد الانتظار} "
      & "waiting_approval_state {بانتظار الموافقة} blocked_state "
      & "{محظور} completed_state {مكتمل} failed_state {فشل} "
      & "cancelled_state {ملغى} skipped_state {تم التخطي} other "
      & "{متوقف مؤقتًا}}");
   P ("label.contrast.opacity_label",
      "{percent} {state, select, transparent {شفاف} mostly_transparent "
      & "{شفاف في الغالب} translucent {شبه شفاف} "
      & "mostly_opaque {معتم في الغالب} other {معتم}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {لا توجد مشاهدات} other "
      & "{المشاهدات: {count, number}، الحد الأدنى {minimum} "
      & "{unit}، الوسيط {median} {unit}، الحد الأقصى "
      & "{maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}، p95 {p95} {unit}، p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {لا توجد "
      & "مشاهدات} other {القيم الشاذة: 0 من أصل {total, "
      & "number} مشاهدة}}} other {القيم الشاذة: {outliers, "
      & "number} من أصل {total, number} مشاهدة}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {لا توجد مشاهدات} "
      & "sample_too_small_shape {العينة أصغر من أن يوصف "
      & "شكلها، {count, plural, one {مشاهدة واحدة} two "
      & "{مشاهدتان} few {{count, number} مشاهدات} many {{count, "
      & "number} مشاهدةً} other {{count, number} مشاهدة}}} "
      & "flat_shape {توزيع مسطّح عند {median}} outlier_heavy_shape "
      & "{توزيع كثير القيم الشاذة حول {median}} "
      & "volatile_shape {توزيع متقلّب حول {median}} "
      & "clustered_shape {توزيع متكتّل حول {median}} "
      & "wide_spread_shape {توزيع واسع الانتشار} "
      & "wide_spread_range {توزيع واسع الانتشار من {minimum} "
      & "إلى {maximum}} right_skewed_shape {توزيع ملتوٍ إلى "
      & "اليمين، الوسيط {median}} left_skewed_shape {توزيع "
      & "ملتوٍ إلى اليسار، الوسيط {median}} other "
      & "{توزيع متوازن غالبًا حول {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {بريد إلكتروني فارغ} address "
      & "{عنوان بريد إلكتروني} other {بريد "
      & "إلكتروني في {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {رقم هاتف} redacted {رقم هاتف "
      & "محجوب} other {هاتف ينتهي بـ {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {اسم مستخدم} other {اسم "
      & "المستخدم {shown}}}");
   P ("label.privacy.code_symbol_label",
      "{state, select, none {رمز برمجي} other {الرمز "
      & "البرمجي {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "بيانات العنوان الوصفية: {present, plural, one "
      & "{حقل واحد موجود} two {حقلان موجودان} few "
      & "{{present, number} حقول موجودة} many {{present, number} "
      & "حقلًا موجودًا} other {{present, number} حقل "
      & "موجود}}، {missing, plural, one {حقل واحد مفقود} two "
      & "{حقلان مفقودان} few {{missing, number} حقول "
      & "مفقودة} many {{missing, number} حقلًا مفقودًا} other "
      & "{{missing, number} حقل مفقود}}");
   P ("label.endpoints.host_label",
      "{state, select, none {مضيف غير معروف} other {{kind} "
      & "{host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {نقطة نهاية غير معروفة} other "
      & "{نقطة نهاية {kind} {scheme}{host}{port}}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {عنوان URL فارغ} none {عنوان URL "
      & "بلا مكوّنات معروفة} other {عنوان URL {count, "
      & "plural, one {بمكوّن واحد} two {بمكوّنين} few "
      & "{بـ{count, number} مكوّنات} many {بـ{count, number} "
      & "مكوّنًا} other {بـ{count, number} مكوّن}}: "
      & "{components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {لا توجد معاملات استعلام} one "
      & "{معامل استعلام واحد} two {معاملا استعلام} "
      & "few {{count, number} معاملات استعلام} many {{count, "
      & "number} معاملَ استعلام} other {{count, number} معامل "
      & "استعلام}}");
   P ("label.endpoints.ip_address_label",
      "{kind, select, ipv4_host {عنوان IPv4 عام {address}} ipv6_host "
      & "{عنوان IPv6 عام {address}} private_network_host {عنوان "
      & "شبكة خاصة {address}} localhost_host {المضيف المحلي "
      & "{address}} other {{address} ليس عنوان IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {نطاق CIDR غير صالح: {cidr}} other "
      & "{{cidr}: {kind}، بادئة الشبكة {prefix}}}");
   P ("label.resources.utilization_label",
      "المستخدم {used, number} من {total, number} {unit} "
      & "({percent}، {band})");
   P ("label.resources.remaining_label",
      "{state, select, over {تجاوز السعة بمقدار {count, "
      & "number} {unit}} other {المتبقي {count, number} من {total, "
      & "number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {تم تجاوز الحصة بمقدار "
      & "{count, number} {unit} (المستخدم {percent})} near {الحصة "
      & "قريبة من الحد: المتبقي {count, number} {unit} "
      & "(المستخدم {percent})} other {الحصة متاحة: "
      & "المتبقي {count, number} {unit} (المستخدم {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {معدل إصابة ذاكرة التخزين "
      & "المؤقت غير متاح: لا توجد طلبات} other "
      & "{معدل إصابة ذاكرة التخزين المؤقت {percent}: "
      & "الإصابات {hits, number}، الإخفاقات {misses, "
      & "number}}}");
   P ("label.resources.saturation_label", "{named, select, no {المورد} other {{name}}} {percent} {band}");
   P ("label.versions.version_label",
      "{state, select, both {الإصدار {version}، الإصدار "
      & "التمهيدي {prerelease}، البناء {build}} prerelease "
      & "{الإصدار {version}، الإصدار التمهيدي "
      & "{prerelease}} build {الإصدار {version}، البناء {build}} "
      & "other {الإصدار {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {الإصدار نفسه} major_upgrade "
      & "{ترقية رئيسية} minor_upgrade {ترقية فرعية} "
      & "patch_upgrade {ترقية تصحيحية} prerelease_change "
      & "{تغيير الإصدار التمهيدي} build_metadata_change "
      & "{تغيير بيانات البناء الوصفية} downgrade "
      & "{رجوع إلى إصدار أقدم} other {تغيير إصدار "
      & "غير معروف}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {الإصدار {version} تحديدًا} "
      & "minimum_range {الإصدار {version} أو أحدث} maximum_range "
      & "{الإصدار {version} أو أقدم} major_compatible_range "
      & "{متوافق مع الإصدار الرئيسي {version}} "
      & "minor_compatible_range {متوافق مع الإصدار الفرعي "
      & "{version}} other {نطاق الإصدارات {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {إصدار التطوير الأولي "
      & "{version}} prerelease {إصدار تمهيدي {version}} major "
      & "{إصدار رئيسي {version}} minor {إصدار فرعي "
      & "{version}} other {إصدار تصحيحي {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {وسم رابط} image {وسم صورة} paragraph "
      & "{وسم فقرة} ordered_list {وسم قائمة مرتبة} "
      & "unordered_list {وسم قائمة غير مرتبة} list_item {وسم "
      & "عنصر قائمة} table_header_cell {وسم خلية رأس "
      & "جدول} table_cell {وسم خلية جدول} table_row {وسم صف "
      & "جدول} line_break {وسم فاصل سطر} thematic_break {وسم "
      & "فاصل موضوعي} heading_level_n {وسم عنوان من "
      & "المستوى {level, number}} other {وسم {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {السمة {name}} event {سمة معالج "
      & "الأحداث {name}} other {السمة {name} بالقيمة "
      & "«{value}»}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {سمة واحدة} two {سمتان} few {{count, "
      & "number} سمات} many {{count, number} سمةً} other {{count, "
      & "number} سمة}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {سمة بيانات واحدة} two {سمتا "
      & "بيانات} few {{count, number} سمات بيانات} many "
      & "{{count, number} سمةَ بيانات} other {{count, number} سمة "
      & "بيانات}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {سمة ARIA واحدة} two {سمتا ARIA} few "
      & "{{count, number} سمات ARIA} many {{count, number} سمةَ ARIA} "
      & "other {{count, number} سمة ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {معالج أحداث واحد} two {معالجا "
      & "أحداث} few {{count, number} معالجات أحداث} many "
      & "{{count, number} معالجَ أحداث} other {{count, number} "
      & "معالج أحداث}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {محتوى نصي} html_content "
      & "{مستند HTML} json_content {مستند JSON} xml_content "
      & "{مستند XML} image_content {محتوى صورة} audio_content "
      & "{محتوى صوتي} video_content {محتوى فيديو} "
      & "font_content {محتوى خط} archive_content {محتوى أرشيف} "
      & "binary_content {محتوى ثنائي} form_content {إرسال "
      & "نموذج} other {محتوى غير معروف}} ({base})");
   P ("label.markup.heading_label", "عنوان من المستوى {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {وسم واحد} two {وسمان} few {{count, "
      & "number} وسوم} many {{count, number} وسمًا} other {{count, "
      & "number} وسم}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {رابط واحد} two {رابطان} few "
      & "{{count, number} روابط} many {{count, number} رابطًا} other "
      & "{{count, number} رابط}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {عنصر وسائط واحد} two {عنصرا "
      & "وسائط} few {{count, number} عناصر وسائط} many {{count, "
      & "number} عنصرَ وسائط} other {{count, number} عنصر "
      & "وسائط}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {عنصر تحكم واحد} two {عنصرا "
      & "تحكم} few {{count, number} عناصر تحكم} many {{count, "
      & "number} عنصرَ تحكم} other {{count, number} عنصر "
      & "تحكم}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {عنوان واحد} two {عنوانان} few "
      & "{{count, number} عناوين} many {{count, number} عنوانًا} "
      & "other {{count, number} عنوان}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {معلم واحد} two {معلمان} few "
      & "{{count, number} معالم} many {{count, number} معلمًا} other "
      & "{{count, number} معلم}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {نموذج واحد} two {نموذجان} few "
      & "{{count, number} نماذج} many {{count, number} نموذجًا} "
      & "other {{count, number} نموذج}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {عنصر وسائط واحد} two {عنصرا "
      & "وسائط} few {{count, number} عناصر وسائط} many {{count, "
      & "number} عنصرَ وسائط} other {{count, number} عنصر "
      & "وسائط}}");
   P ("label.markup.table_navigation_label",
      "{caption} الصف {row, number} من {rows, number}، العمود "
      & "{column, number} من {columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} غير معيّن} hidden_value {{kind} "
      & "مخفي} masked_value {{kind} {shown}} fingerprint_only {بصمة "
      & "{kind} تنتهي بـ {shown}} other {{kind} ينتهي بـ "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{kind} {name} غير معيّن} other {{kind} "
      & "{name} ينتهي بـ {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {ترويسة بيانات الاعتماد "
      & "{name} غير معيّنة} other {{kind} {name} ينتهي بـ "
      & "{shown}}}");
   P ("label.secrets.fingerprint_label", "بصمة {algorithm} تنتهي بـ {shown}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {سر واحد} two {سران} few {{count, "
      & "number} أسرار} many {{count, number} سرًا} other {{count, "
      & "number} سر}}");
   P ("label.secrets.secret_count_label.masked", "المقنّعة: {count, number}");
   P ("label.secrets.secret_count_label.unset", "غير المعيّنة: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {بصمة واحدة} two {بصمتان} few "
      & "{{count, number} بصمات} many {{count, number} بصمةً} other "
      & "{{count, number} بصمة}}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} غير معيّن} redacted {{label} "
      & "محجوب} url_redacted {عنوان URL محجوب} ip_redacted "
      & "{عنوان IP محجوب} path_ending {مسار ملف ينتهي "
      & "بـ {shown}} at {{label} في {shown}} audit {{label} بطول "
      & "{length, number}، ينتهي بـ {shown}} debug {{label} {shown}} "
      & "other {{label} ينتهي بـ {shown}}}");
   P ("label.schema.field_label",
      "الحقل {name} من النوع {kind, select, string_field "
      & "{سلسلة نصية} integer_field {عدد صحيح} decimal_field "
      & "{عدد عشري} boolean_field {منطقي} date_field {تاريخ} "
      & "date_time_field {تاريخ ووقت} object_field {كائن} "
      & "array_field {مصفوفة} enum_field {تعداد} binary_field "
      & "{ثنائي} null_field {null} any_field {أي نوع} other {غير "
      & "معروف}}، {presence, select, required_field {مطلوب} "
      & "optional_field {اختياري} conditional_field {مشروط} other "
      & "{الإلزام غير معروف}}{nullable, select, non_nullable {، "
      & "لا يقبل null} nullable {، يقبل null} other {}}{state, "
      & "select, deprecated_field {، مهمل} unknown_field {، غير "
      & "معروف} read_only_field {، للقراءة فقط} "
      & "write_only_field {، للكتابة فقط} computed_field {، "
      & "محسوب} other {}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {حقل واحد} two {حقلان} few {{count, "
      & "number} حقول} many {{count, number} حقلًا} other {{count, "
      & "number} حقل}}");
   P ("label.schema.schema_summary_label.required", "المطلوبة {count, number}");
   P ("label.schema.schema_summary_label.optional", "الاختيارية {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "المهملة {count, number}");
   P ("label.schema.schema_summary_label.unknown", "غير المعروفة {count, number}");
   P ("label.schema.type_mismatch_label",
      "الحقل {field_name}: المتوقع {expected, select, "
      & "string_field {سلسلة نصية} integer_field {عدد صحيح} "
      & "decimal_field {عدد عشري} boolean_field {منطقي} date_field "
      & "{تاريخ} date_time_field {تاريخ ووقت} object_field "
      & "{كائن} array_field {مصفوفة} enum_field {تعداد} "
      & "binary_field {ثنائي} null_field {null} any_field {أي نوع} "
      & "other {غير معروف}}، الفعلي {actual, select, "
      & "string_field {سلسلة نصية} integer_field {عدد صحيح} "
      & "decimal_field {عدد عشري} boolean_field {منطقي} date_field "
      & "{تاريخ} date_time_field {تاريخ ووقت} object_field "
      & "{كائن} array_field {مصفوفة} enum_field {تعداد} "
      & "binary_field {ثنائي} null_field {null} any_field {أي نوع} "
      & "other {غير معروف}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {مشكلة "
      & "حاجبة واحدة} two {مشكلتان حاجبتان} few "
      & "{{blocking, number} مشكلات حاجبة} many {{blocking, number} "
      & "مشكلةً حاجبة} other {{blocking, number} مشكلة "
      & "حاجبة}}} blocking {{base}، {blocking, plural, one {مشكلة "
      & "حاجبة واحدة} two {مشكلتان حاجبتان} few "
      & "{{blocking, number} مشكلات حاجبة} many {{blocking, number} "
      & "مشكلةً حاجبة} other {{blocking, number} مشكلة "
      & "حاجبة}}} only {{base} فقط} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "لم يُشغَّل أي فحص");
   P ("label.diagnostics.check_run_summary_label.passed", "الناجحة {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "الفاشلة {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {تحذير واحد} two {تحذيران} few "
      & "{{count, number} تحذيرات} many {{count, number} تحذيرًا} "
      & "other {{count, number} تحذير}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "المتخطاة {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "المعلّقة {count, number}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {النطاق المستهدف "
      & "من {low} إلى {high}} other {النافذة المستهدفة "
      & "من {low} إلى {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} ضمن النطاق المتوقع} "
      & "below {{value} دون النطاق المتوقع} other {{value} "
      & "فوق النطاق المتوقع}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} عند العتبة الحرجة} "
      & "warning {{value} عند عتبة التحذير} other {{value} ضمن "
      & "النطاق العادي}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {لم يُتجاوز} other {تم التجاوز "
      & "بمقدار {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {عند الهدف} below {أقل من الهدف "
      & "بمقدار {difference}} other {أعلى من الهدف "
      & "بمقدار {difference}}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {تم تجاوز الحد} near {قريب "
      & "من الحد، المتبقي {distance}} other {على بُعد "
      & "{distance} من الحد}}");
   P ("label.thresholds.threshold_summary_label.none", "لا توجد مقاييس");
   P ("label.thresholds.threshold_summary_label.normal", "عادية: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {تحذير واحد} two {تحذيران} few "
      & "{{count, number} تحذيرات} many {{count, number} تحذيرًا} "
      & "other {{count, number} تحذير}}");
   P ("label.thresholds.threshold_summary_label.critical", "حرجة: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {تجاوز واحد} two {تجاوزان} few "
      & "{{count, number} تجاوزات} many {{count, number} تجاوزًا} "
      & "other {{count, number} تجاوز}}");
   P ("label.thresholds.target_window_label", "الهدف {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "التفاوت المسموح {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} من الحد");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {تم تجاوز الحد بمقدار "
      & "{amount}} other {المتبقي {amount}}}");
   P ("label.thresholds.budget_used_label", "المستخدم {used} من {budget}");
   P ("label.workflows.step_label", "الخطوة {current, number} من {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "المراحل المكتملة {current, number} من {total, "
      & "number}: {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {عنصر واحد} two {عنصران} few "
      & "{{count, number} عناصر} many {{count, number} عنصرًا} other "
      & "{{count, number} عنصر}}");
   P ("label.workflows.workflow_summary_label.completed", "المكتملة {count, number}");
   P ("label.workflows.workflow_summary_label.active", "النشطة {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "المحظورة {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "الفاشلة {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "المتخطاة {count, number}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {لا توجد عناصر في سير العمل} "
      & "half {منتصف سير العمل} other {المكتمل {completed, "
      & "number} من {total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {الموضع في قائمة الانتظار "
      & "{position, number}} other {الموضع في قائمة "
      & "الانتظار {position, number} من {total, number}}}");
   P ("label.changes.change_set_label.none", "لا توجد تغييرات");
   P ("label.changes.change_set_label.added", "المضاف {count, number}");
   P ("label.changes.change_set_label.removed", "المحذوف {count, number}");
   P ("label.changes.change_set_label.modified", "المتغيّر {count, number}");
   P ("label.changes.change_set_label.unchanged", "دون تغيير {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {عنصر واحد} two {عنصران} few "
      & "{{count, number} عناصر} many {{count, number} عنصرًا} other "
      & "{{count, number} عنصر}}");
   P ("label.changes.change_summary_label.added", "المضاف {count, number}");
   P ("label.changes.change_summary_label.removed", "المحذوف {count, number}");
   P ("label.changes.change_summary_label.modified", "المتغيّر {count, number}");
   P ("label.changes.change_summary_label.renamed", "المعاد تسميته {count, number}");
   P ("label.changes.change_summary_label.unchanged", "دون تغيير {count, number}");
   P ("label.changes.sync_change_label.none", "لا توجد تغييرات مزامنة");
   P ("label.changes.sync_change_label.uploaded", "المرفوع {count, number}");
   P ("label.changes.sync_change_label.downloaded", "المنزَّل {count, number}");
   P ("label.changes.sync_change_label.deleted", "المحذوف {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {تعارض واحد} two {تعارضان} few "
      & "{{count, number} تعارضات} many {{count, number} تعارضًا} "
      & "other {{count, number} تعارض}}");
   P ("label.changes.net_change_label",
      "{state, select, none {لا يوجد تغيير صافٍ} up {صافي "
      & "التغيير +{count, plural, one {عنصر واحد} two "
      & "{عنصران} few {{count, number} عناصر} many {{count, number} "
      & "عنصرًا} other {{count, number} عنصر}}} other {صافي "
      & "التغيير -{count, plural, one {عنصر واحد} two "
      & "{عنصران} few {{count, number} عناصر} many {{count, number} "
      & "عنصرًا} other {{count, number} عنصر}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {لا توجد تغييرات للمراجعة} "
      & "all {تمت مراجعة جميع التغييرات} other "
      & "{التغييرات المراجَعة {reviewed, number} من {total, "
      & "number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} دون تغيير عند "
      & "{new_value}} up {زاد {field_name} من {old_value} إلى "
      & "{new_value}} other {انخفض {field_name} من {old_value} إلى "
      & "{new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {لا توجد صفوف قابلة "
      & "للتحديد} none {لم يُحدَّد أي صف} all {تم "
      & "تحديد {total, plural, one {الصف الوحيد} two "
      & "{الصفين كليهما} few {الصفوف الـ{total, number} "
      & "كلها} many {الصفوف الـ{total, number} كلها} other "
      & "{الصفوف الـ{total, number} كلها}}} other {الصفوف "
      & "المحددة {selected, number} من {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {لا توجد صفحات} other {{pages, plural, =0 "
      & "{لا توجد صفحات} other {{rows, plural, =0 {الصفحة "
      & "{page, number} من {pages, number}} other {الصفحة {page, "
      & "number} من {pages, number}، {rows, plural, one {صف واحد} two "
      & "{صفان} few {{rows, number} صفوف} many {{rows, number} "
      & "صفًا} other {{rows, number} صف}}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {لا توجد صفوف} none {لا توجد "
      & "صفوف مطابقة} all {{total, plural, one {الصف الوحيد "
      & "ظاهر} two {الصفان كلاهما ظاهران} few "
      & "{الصفوف الـ{total, number} كلها ظاهرة} many "
      & "{الصفوف الـ{total, number} كلها ظاهرة} other "
      & "{الصفوف الـ{total, number} كلها ظاهرة}}} other "
      & "{الصفوف الظاهرة {visible, number} من {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {لا توجد صفوف} single {الصف "
      & "{first_row, number} من {total, number}} other {الصفوف "
      & "{first_row, number}-{last_row, number} من {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {لا يوجد حد للأحرف} none_left "
      & "{لم يتبقَّ أي حرف} left {المتبقي {count, plural, "
      & "one {حرف واحد} two {حرفان} few {{count, number} أحرف} "
      & "many {{count, number} حرفًا} other {{count, number} حرف}}} "
      & "other {تجاوز الحد {count, plural, one {بحرف واحد} two "
      & "{بحرفين} few {بـ{count, number} أحرف} many {بـ{count, "
      & "number} حرفًا} other {بـ{count, number} حرف}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {لا توجد حقول مطلوبة} one "
      & "{{missing, plural, =0 {اكتملت جميع الحقول "
      & "المطلوبة} other {الحقل المطلوب الوحيد "
      & "ناقص}}} other {{missing, plural, =0 {اكتملت جميع "
      & "الحقول المطلوبة} other {الحقول المطلوبة "
      & "الناقصة {missing, number} من {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {لا توجد حقول} all {اكتملت "
      & "جميع الحقول} other {الحقول المكتملة "
      & "{completed, number} من {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: لا توجد حقول} all {{name}: "
      & "اكتملت جميع الحقول} other {{name}: الحقول "
      & "المكتملة {completed, number} من {total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {لا توجد خطوات في النموذج} one "
      & "{الخطوة 1 من 1: {name}} other {الخطوة {current, number} "
      & "من {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {لا يوجد مسار تنقل} one {مسار "
      & "التنقل 1 من 1: {name}} other {مسار التنقل {current, "
      & "number} من {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {لا توجد علامات تبويب} one "
      & "{علامة التبويب 1 من 1: {name}} other {علامة "
      & "التبويب {current, number} من {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {صندوق الوارد فارغ} one {{unread, "
      & "plural, =0 {تمت قراءة جميع الإشعارات} other "
      & "{الإشعار الوحيد غير مقروء}}} other {{unread, "
      & "plural, =0 {تمت قراءة جميع الإشعارات} other "
      & "{الإشعارات غير المقروءة {unread, number} من "
      & "{total, number}}}}}");
   P ("label.notifications.delivery_attempt_label",
      "محاولة التسليم {attempt, number} من {max_attempts, "
      & "number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {لا توجد عناصر في قائمة "
      & "التحقق} one {{done, plural, =0 {العناصر المكتملة "
      & "0 من 1} other {العناصر المكتملة 1 من 1}}} other "
      & "{العناصر المكتملة {done, number} من {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {لا توجد عمليات رفع} one {{done, "
      & "plural, =0 {عمليات الرفع المكتملة 0 من 1} other "
      & "{عمليات الرفع المكتملة 1 من 1}}} other "
      & "{عمليات الرفع المكتملة {done, number} من {total, "
      & "number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {لا توجد سعة} one {{reserved, plural, "
      & "=0 {المقاعد المحجوزة 0 من 1} other {المقاعد "
      & "المحجوزة 1 من 1}}} other {المقاعد المحجوزة "
      & "{reserved, number} من {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {الموضع في قائمة الانتظار "
      & "{position, number}} other {الموضع في قائمة "
      & "الانتظار {position, number} من {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} متغيّر} other {{name}: المتغيّر {changed, "
      & "number}، دون تغيير {unchanged, number}، الإجمالي "
      & "{total, number}}}");
   P ("label.names.color_description", "{hue} {brightness} {saturation}، {temperature}، {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {{hue}} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.palettes.advanced_palette_summary", "{harmony}، {mood}، {accessibility}؛ {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {زر} link_control {رابط} "
      & "tab_control {علامة تبويب} menu_item_control {عنصر "
      & "قائمة} checkbox_control {خانة اختيار} radio_control "
      & "{زر اختيار} text_field_control {حقل نصي} "
      & "progress_control {شريط تقدّم} table_cell_control {خلية "
      & "جدول} region_control {منطقة} other {عنصر تحكم}} "
      & "{named, select, no {بلا اسم} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "محدَّد");
   P ("label.markup.accessible_control_label.expanded", "موسَّع");
   P ("label.markup.accessible_control_label.current", "حالي");
   P ("label.markup.accessible_control_label.disabled", "معطَّل");
   P ("label.markup.accessible_control_label.required", "مطلوب");
   P ("label.markup.accessible_control_label.invalid", "غير صالح");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {عنصر واحد} two {عنصران} few "
      & "{{count, number} عناصر} many {{count, number} عنصرًا} other "
      & "{{count, number} عنصر}}");
   P ("label.markup.accessible_control_label.position", "العنصر {position, number} من {total, number}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {مشكلة واحدة} two {مشكلتان} few "
      & "{{count, number} مشكلات} many {{count, number} مشكلةً} "
      & "other {{count, number} مشكلة}}");
   P ("label.markup.accessible_control_label.with_states", "{control}، {states}");
   P ("label.endpoints.url_component.scheme", "المخطط");
   P ("label.endpoints.url_component.host", "المضيف");
   P ("label.endpoints.url_component.path", "المسار");
   P ("label.endpoints.url_component.query", "الاستعلام");
   P ("label.endpoints.url_component.fragment", "الجزء");
   P ("label.names.hue_noun.red", "أحمر");
   P ("label.names.hue_noun.orange", "برتقالي");
   P ("label.names.hue_noun.yellow", "أصفر");
   P ("label.names.hue_noun.green", "أخضر");
   P ("label.names.hue_noun.cyan", "سماوي");
   P ("label.names.hue_noun.blue", "أزرق");
   P ("label.names.hue_noun.purple", "بنفسجي");
   P ("label.names.hue_noun.magenta", "أرجواني");
   P ("label.names.hue_noun.neutral", "لون محايد");
   P ("label.names.hue_noun.pink", "وردي");
   P ("label.names.hue_gender.red", "masculine");
   P ("label.names.hue_gender.orange", "masculine");
end Labels_3;
