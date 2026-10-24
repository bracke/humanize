separate (Humanize.Catalogs.Phrase_Data.Locale_Uk)
procedure Labels_3 is
begin
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {скинути фільтри} =1 {скинути "
      & "активний фільтр} one {скинути {count, number} "
      & "активний фільтр} few {скинути {count, number} "
      & "активні фільтри} many {скинути {count, number} "
      & "активних фільтрів} other {скинути {count, "
      & "number} активного фільтра}}");
   P ("label.search.facet_label",
      "фасет {name}, {count, plural, one {{count, number} "
      & "варіант} few {{count, number} варіанти} many {{count, "
      & "number} варіантів} other {{count, number} варіанта}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {немає результатів} one "
      & "{{count, number} результат} few {{count, number} "
      & "результати} many {{count, number} результатів} "
      & "other {{count, number} результату}}{selected, select, false "
      & "{} other {, вибрано}}");
   P ("label.search.filter_label",
      "{state, select, active_filter {фільтр {name}: {value}, "
      & "активний} inactive_filter {фільтр {name}: {value}, "
      & "неактивний} other {фільтр {name}: виключити "
      & "{value}}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {активний фільтр} "
      & "inactive_filter {неактивний фільтр} other "
      & "{виключальний фільтр}}");
   P ("label.search.no_results_label", "за запитом «{query}» нічого не знайдено");
   P ("label.search.recent_search_label", "нещодавній пошук: «{query}»");
   P ("label.search.saved_search_label",
      "збережений пошук: {name}{count, plural, =0 {} one {, "
      & "{count, number} результат} few {, {count, number} "
      & "результати} many {, {count, number} результатів} "
      & "other {, {count, number} результату}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {немає нещодавніх пошуків} "
      & "one {{count, number} нещодавній пошук} few {{count, "
      & "number} нещодавні пошуки} many {{count, number} "
      & "нещодавніх пошуків} other {{count, number} "
      & "нещодавнього пошуку}}");
   P ("label.search.search_query_label", "пошук «{query}»");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {немає результатів} one {{count, "
      & "number} результат} few {{count, number} результати} "
      & "many {{count, number} результатів} other {{count, number} "
      & "результату}}");
   P ("label.search.search_result_summary_label",
      "за запитом «{query}»: {count, plural, =0 {нічого не "
      & "знайдено} one {{count, number} результат} few "
      & "{{count, number} результати} many {{count, number} "
      & "результатів} other {{count, number} результату}}");
   P ("label.search.search_scope_label",
      "область {name}: {count, plural, =0 {немає "
      & "результатів} one {{count, number} результат} few "
      & "{{count, number} результати} many {{count, number} "
      & "результатів} other {{count, number} результату}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {пошук не виконується} "
      & "searching_search {триває пошук} complete_search {пошук "
      & "завершено} empty_search {нічого не знайдено} "
      & "other {помилка пошуку}}");
   P ("label.search.sort_label",
      "сортування: {mode, select, relevance_sort {за "
      & "релевантністю} ascending_sort {за зростанням} "
      & "descending_sort {за спаданням} newest_first_sort "
      & "{спочатку нові} other {спочатку старі}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {за релевантністю} "
      & "ascending_sort {за зростанням} descending_sort {за "
      & "спаданням} newest_first_sort {спочатку нові} "
      & "other {спочатку старі}}");
   P ("label.search.suggestion_label", "можливо, ви мали на увазі «{query}»?");
   P ("label.secrets.credential_source_label", "облікові дані з {source}: {count, number}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {значення приховано} "
      & "masked_value {значення замасковано} suffix_only "
      & "{лише суфікс} other {лише відбиток}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {публічний} support_profile "
      & "{для підтримки} audit_profile {для аудиту} other "
      & "{для налагодження}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {ротація не "
      & "потрібна{days_old, plural, =0 {} one {, вік: {days_old, "
      & "number} день} few {, вік: {days_old, number} дні} many {, "
      & "вік: {days_old, number} днів} other {, вік: {days_old, "
      & "number} дня}}} other {потрібна ротація{days_old, "
      & "plural, =0 {} one {, вік: {days_old, number} день} few {, "
      & "вік: {days_old, number} дні} many {, вік: {days_old, number} "
      & "днів} other {, вік: {days_old, number} дня}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-ключ} live_api_key {робочий "
      & "API-ключ} test_api_key {тестовий API-ключ} "
      & "github_token {токен GitHub} aws_access_key {ключ "
      & "доступу AWS} google_api_key {API-ключ Google} slack_token "
      & "{токен Slack} npm_token {токен npm} bearer_token "
      & "{bearer-токен} jwt_token {JWT-токен} basic_auth_credential "
      & "{облікові дані Basic Auth} password_secret {пароль} "
      & "private_key {закритий ключ} ssh_private_key "
      & "{закритий ключ SSH} webhook_secret {секрет "
      & "вебхука} oauth_token {токен OAuth} database_url_secret "
      & "{секрет в URL бази даних} sha1_fingerprint "
      & "{відбиток SHA-1} sha256_fingerprint {відбиток SHA-256} "
      & "other {секрет}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {ел. пошта} phone_value "
      & "{телефон} url_value {URL} ip_address_value {IP-адреса} "
      & "token_value {токен} file_path_value {шлях до файлу} "
      & "account_id_value {ID облікового запису} "
      & "payment_reference_value {платіжний "
      & "ідентифікатор} log_field_value {поле журналу} "
      & "other {конфіденційне значення}}");
   P ("label.tables.cell_label",
      "рядок {row, number}, стовпець {column, number}: {state, "
      & "select, empty_cell {порожньо} edited_cell {змінено} "
      & "invalid_cell {недійсне значення} highlighted_cell "
      & "{виділено} other {лише для читання}}");
   P ("label.tables.cell_position_label", "рядок {row, number}, стовпець {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {порожня клітинка} "
      & "edited_cell {змінена клітинка} invalid_cell "
      & "{недійсна клітинка} highlighted_cell {виділена "
      & "клітинка} other {клітинка лише для "
      & "читання}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {немає стовпців} one {{count, number} "
      & "стовпець} few {{count, number} стовпці} many {{count, "
      & "number} стовпців} other {{count, number} стовпця}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {текстовий "
      & "стовпець} number_column {числовий стовпець} "
      & "date_column {стовпець дат} status_column {стовпець "
      & "статусу} action_column {стовпець дій} other "
      & "{прихований стовпець}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {текстовий стовпець} "
      & "number_column {числовий стовпець} date_column "
      & "{стовпець дат} status_column {стовпець "
      & "статусу} action_column {стовпець дій} other "
      & "{прихований стовпець}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {{count, number} рядок} few {{count, "
      & "number} рядки} many {{count, number} рядків} other {{count, "
      & "number} рядка}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {немає рядків} one {{count, number} "
      & "рядок} few {{count, number} рядки} many {{count, number} "
      & "рядків} other {{count, number} рядка}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {не відсортовано} "
      & "ascending_sort {за зростанням} other {за "
      & "спаданням}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {не відсортовано} "
      & "ascending_sort {сортування: {column_name}, за "
      & "зростанням} other {сортування: {column_name}, за "
      & "спаданням}}");
   P ("label.tables.subtotal_label", "{name}, проміжний підсумок: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} рядок} few {{rows, number} "
      & "рядки} many {{rows, number} рядків} other {{rows, number} "
      & "рядка}} × {columns, plural, one {{columns, number} "
      & "стовпець} few {{columns, number} стовпці} many "
      & "{{columns, number} стовпців} other {{columns, number} "
      & "стовпця}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee}: призначення "
      & "знято} assigned {призначено: {assignee}} reassigned "
      & "{перепризначено: {assignee}} watching {{assignee}: "
      & "стежить} other {{assignee}: власник завдання}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {не призначено} assigned "
      & "{призначено} reassigned {перепризначено} "
      & "watching {стежить} other {власник завдання}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {беклог порожній} one {беклог: "
      & "{count, number} завдання} few {беклог: {count, number} "
      & "завдання} many {беклог: {count, number} завдань} "
      & "other {беклог: {count, number} завдання}}");
   P ("label.tasks.blocker_label", "заблоковано: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {завершити завдання} one "
      & "{завершити {count, number} завдання} few "
      & "{завершити {count, number} завдання} many "
      & "{завершити {count, number} завдань} other "
      & "{завершити {count, number} завдання}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {немає завершених завдань} "
      & "one {{count, number} завершене завдання} few {{count, "
      & "number} завершені завдання} many {{count, number} "
      & "завершених завдань} other {{count, number} "
      & "завершеного завдання}}");
   P ("label.tasks.due_label", "термін: {due_text}");
   P ("label.tasks.estimate_label", "оцінка: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {немає відкритих завдань} one "
      & "{{count, number} відкрите завдання} few {{count, "
      & "number} відкриті завдання} many {{count, number} "
      & "відкритих завдань} other {{count, number} "
      & "відкритого завдання}}");
   P ("label.tasks.overdue_label", "прострочено, термін: {due_text}");
   P ("label.tasks.recurring_task_label", "повторюється: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {перевідкрити завдання} one "
      & "{перевідкрити {count, number} завдання} few "
      & "{перевідкрити {count, number} завдання} many "
      & "{перевідкрити {count, number} завдань} other "
      & "{перевідкрити {count, number} завдання}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {{count, number} завдання} few "
      & "{{count, number} завдання} many {{count, number} "
      & "завдань} other {{count, number} завдання}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {{count, number} підзавдання} "
      & "few {{count, number} підзавдання} many {{count, number} "
      & "підзавдань} other {{count, number} підзавдання}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {немає завдань} one {{count, number} "
      & "завдання} few {{count, number} завдання} many {{count, "
      & "number} завдань} other {{count, number} завдання}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {відкрите} in_progress_task "
      & "{у роботі} blocked_task {заблоковане} done_task "
      & "{виконане} canceled_task {скасоване} deferred_task "
      & "{відкладене} other {прострочене}}{priority, "
      & "select, no_priority {} low_priority {, низький "
      & "пріоритет} medium_priority {, середній "
      & "пріоритет} high_priority {, високий "
      & "пріоритет} other {, критичний пріоритет}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {без пріоритету} "
      & "low_priority {низький пріоритет} medium_priority "
      & "{середній пріоритет} high_priority {високий "
      & "пріоритет} other {критичний пріоритет}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {відкрите завдання} "
      & "in_progress_task {завдання в роботі} blocked_task "
      & "{заблоковане завдання} done_task {виконане "
      & "завдання} canceled_task {скасоване завдання} "
      & "deferred_task {відкладене завдання} other "
      & "{прострочене завдання}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {верхня межа} other "
      & "{нижня межа}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {нижче очікуваного "
      & "діапазону} within_range {в очікуваному "
      & "діапазоні} above_range {вище очікуваного "
      & "діапазону} below_target {нижче цілі} at_target {на "
      & "рівні цілі} above_target {вище цілі} near_limit "
      & "{близько до межі} warning_level {поріг "
      & "попередження} critical_level {критичний "
      & "поріг} breached {поріг перевищено} other {стан "
      & "порогу невідомий}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {актуально} other "
      & "{випереджає на {ahead, plural, one {{ahead, number} "
      & "коміт} few {{ahead, number} коміти} many {{ahead, number} "
      & "комітів} other {{ahead, number} коміту}}}}} other "
      & "{{ahead, plural, =0 {відстає на {behind, plural, one "
      & "{{behind, number} коміт} few {{behind, number} коміти} many "
      & "{{behind, number} комітів} other {{behind, number} "
      & "коміту}}} other {випереджає на {ahead, plural, one "
      & "{{ahead, number} коміт} few {{ahead, number} коміти} many "
      & "{{ahead, number} комітів} other {{ahead, number} "
      & "коміту}}, відстає на {behind, plural, one {{behind, "
      & "number} коміт} few {{behind, number} коміти} many {{behind, "
      & "number} комітів} other {{behind, number} коміту}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {схвалено: {approver}} other "
      & "{очікує схвалення: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {спроба 1 з 1} other "
      & "{спроба {attempt, number} з 1, ліміт "
      & "перевищено}}} other {спроба {attempt, number} з "
      & "{limit, number}}}");
   P ("label.workflows.blocker_label", "заблоковано: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {немає блокувальних "
      & "залежностей} one {{count, number} блокувальна "
      & "залежність} few {{count, number} блокувальні "
      & "залежності} many {{count, number} блокувальних "
      & "залежностей} other {{count, number} "
      & "блокувальної залежності}}");
   P ("label.workflows.handoff_label", "передача: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {майбутня віха} "
      & "current_milestone {поточна віха} complete_milestone "
      & "{завершена віха} missed_milestone {пропущена "
      & "віха} other {заблокована віха}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {попереду} "
      & "current_milestone {поточна} complete_milestone "
      & "{завершена} missed_milestone {пропущена} other "
      & "{заблокована}}");
   P ("label.workflows.next_action_label", "далі: {action}");
   P ("label.workflows.owner_label", "власник: {owner}");
   P ("label.workflows.resume_label", "відновити {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {очікує запуску} active_step "
      & "{виконується} waiting_step {очікування} "
      & "blocked_step {заблоковано} done_step {готово} "
      & "failed_step {збій} other {пропущено}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {очікує запуску} "
      & "active_step {виконується} waiting_step "
      & "{очікування} blocked_step {заблоковано} done_step "
      & "{готово} failed_step {збій} other {пропущено}}");
   P ("label.workflows.waiting_label", "очікування: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {не запущено} "
      & "in_progress_state {виконується} waiting_state "
      & "{очікування} waiting_approval_state {очікує "
      & "схвалення} blocked_state {заблоковано} "
      & "completed_state {завершено} failed_state {збій} "
      & "cancelled_state {скасовано} skipped_state "
      & "{пропущено} other {призупинено}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {не запущено} "
      & "in_progress_state {виконується} waiting_state "
      & "{очікування} waiting_approval_state {очікує "
      & "схвалення} blocked_state {заблоковано} "
      & "completed_state {завершено} failed_state {збій} "
      & "cancelled_state {скасовано} skipped_state "
      & "{пропущено} other {призупинено}}");
end Labels_3;
