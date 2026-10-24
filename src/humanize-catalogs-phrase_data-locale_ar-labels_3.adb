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
end Labels_3;
