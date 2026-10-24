separate (Humanize.Catalogs.Phrase_Data.Locale_Ru)
procedure Labels_3 is
begin
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {скалярное значение} "
      & "object_shape {{count, plural, =0 {объект} other {объект, "
      & "полей: {count, number}}}} array_shape {{count, plural, =0 "
      & "{массив} other {массив, элементов: {count, "
      & "number}}}} map_shape {{count, plural, =0 {словарь} other "
      & "{словарь, записей: {count, number}}}} tuple_shape "
      & "{{count, plural, =0 {кортеж} other {кортеж, "
      & "элементов: {count, number}}}} union_shape {{count, plural, =0 "
      & "{объединение} other {объединение, типов: "
      & "{count, number}}}} empty_shape {пустая структура} other "
      & "{неизвестная структура}}");
   P ("label.schema.unknown_field_label", "неизвестное поле {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {нет активных фильтров} one "
      & "{{count, number} активный фильтр} few {{count, number} "
      & "активных фильтра} many {{count, number} "
      & "активных фильтров} other {{count, number} "
      & "активного фильтра}}");
   P ("label.search.clear_filters_label",
      "{count, plural, =0 {сбросить фильтры} =1 "
      & "{сбросить активный фильтр} one {сбросить "
      & "{count, number} активный фильтр} few {сбросить "
      & "{count, number} активных фильтра} many "
      & "{сбросить {count, number} активных фильтров} "
      & "other {сбросить {count, number} активного "
      & "фильтра}}");
   P ("label.search.facet_label",
      "фасет {name}, {count, plural, one {{count, number} "
      & "вариант} few {{count, number} варианта} many {{count, "
      & "number} вариантов} other {{count, number} варианта}}");
   P ("label.search.facet_value_label",
      "{name}, {count, plural, =0 {нет результатов} one "
      & "{{count, number} результат} few {{count, number} "
      & "результата} many {{count, number} результатов} "
      & "other {{count, number} результата}}{selected, select, false "
      & "{} other {, выбрано}}");
   P ("label.search.filter_label",
      "{state, select, active_filter {фильтр {name}: {value}, "
      & "активен} inactive_filter {фильтр {name}: {value}, "
      & "неактивен} other {фильтр {name}: исключить "
      & "{value}}}");
   P ("label.search.filter_state_label",
      "{state, select, active_filter {активный фильтр} "
      & "inactive_filter {неактивный фильтр} other "
      & "{исключающий фильтр}}");
   P ("label.search.no_results_label", "по запросу «{query}» ничего не найдено");
   P ("label.search.recent_search_label", "недавний поиск: «{query}»");
   P ("label.search.saved_search_label",
      "сохранённый поиск: {name}{count, plural, =0 {} one {, "
      & "{count, number} результат} few {, {count, number} "
      & "результата} many {, {count, number} результатов} "
      & "other {, {count, number} результата}}");
   P ("label.search.search_history_count_label",
      "{count, plural, =0 {нет недавних поисков} one "
      & "{{count, number} недавний поиск} few {{count, number} "
      & "недавних поиска} many {{count, number} недавних "
      & "поисков} other {{count, number} недавнего "
      & "поиска}}");
   P ("label.search.search_query_label", "поиск «{query}»");
   P ("label.search.search_result_count_label",
      "{count, plural, =0 {нет результатов} one {{count, "
      & "number} результат} few {{count, number} результата} "
      & "many {{count, number} результатов} other {{count, number} "
      & "результата}}");
   P ("label.search.search_result_summary_label",
      "по запросу «{query}»: {count, plural, =0 {ничего не "
      & "найдено} one {{count, number} результат} few {{count, "
      & "number} результата} many {{count, number} "
      & "результатов} other {{count, number} результата}}");
   P ("label.search.search_scope_label",
      "область {name}: {count, plural, =0 {нет "
      & "результатов} one {{count, number} результат} few "
      & "{{count, number} результата} many {{count, number} "
      & "результатов} other {{count, number} результата}}");
   P ("label.search.search_state_label",
      "{state, select, idle_search {поиск не выполняется} "
      & "searching_search {идёт поиск} complete_search {поиск "
      & "завершён} empty_search {ничего не найдено} "
      & "other {ошибка поиска}}");
   P ("label.search.sort_label",
      "сортировка: {mode, select, relevance_sort {по "
      & "релевантности} ascending_sort {по "
      & "возрастанию} descending_sort {по убыванию} "
      & "newest_first_sort {сначала новые} other {сначала "
      & "старые}}");
   P ("label.search.sort_mode_label",
      "{mode, select, relevance_sort {по релевантности} "
      & "ascending_sort {по возрастанию} descending_sort {по "
      & "убыванию} newest_first_sort {сначала новые} other "
      & "{сначала старые}}");
   P ("label.search.suggestion_label", "возможно, вы имели в виду «{query}»?");
   P ("label.secrets.credential_source_label", "учётные данные из {source}: {count, number}");
   P ("label.secrets.exposure_label",
      "{exposure, select, hidden_value {значение скрыто} "
      & "masked_value {значение замаскировано} suffix_only "
      & "{только суффикс} other {только отпечаток}}");
   P ("label.secrets.privacy_profile_label",
      "{profile, select, public_profile {публичный} support_profile "
      & "{для поддержки} audit_profile {для аудита} other "
      & "{для отладки}}");
   P ("label.secrets.rotation_status_label",
      "{needs_rotation, select, false {ротация не "
      & "требуется{days_old, plural, =0 {} one {, возраст: "
      & "{days_old, number} день} few {, возраст: {days_old, number} "
      & "дня} many {, возраст: {days_old, number} дней} other {, "
      & "возраст: {days_old, number} дня}}} other {требуется "
      & "ротация{days_old, plural, =0 {} one {, возраст: "
      & "{days_old, number} день} few {, возраст: {days_old, number} "
      & "дня} many {, возраст: {days_old, number} дней} other {, "
      & "возраст: {days_old, number} дня}}}}");
   P ("label.secrets.secret_kind_label",
      "{kind, select, api_key {API-ключ} live_api_key {рабочий "
      & "API-ключ} test_api_key {тестовый API-ключ} "
      & "github_token {токен GitHub} aws_access_key {ключ "
      & "доступа AWS} google_api_key {API-ключ Google} slack_token "
      & "{токен Slack} npm_token {токен npm} bearer_token "
      & "{bearer-токен} jwt_token {JWT-токен} basic_auth_credential "
      & "{учётные данные Basic Auth} password_secret "
      & "{пароль} private_key {закрытый ключ} ssh_private_key "
      & "{закрытый ключ SSH} webhook_secret {секрет "
      & "веб-хука} oauth_token {токен OAuth} database_url_secret "
      & "{секрет в URL базы данных} sha1_fingerprint "
      & "{отпечаток SHA-1} sha256_fingerprint {отпечаток "
      & "SHA-256} other {секрет}}");
   P ("label.secrets.sensitive_value_kind_label",
      "{kind, select, email_value {эл. почта} phone_value "
      & "{телефон} url_value {URL} ip_address_value {IP-адрес} "
      & "token_value {токен} file_path_value {путь к файлу} "
      & "account_id_value {ID учётной записи} "
      & "payment_reference_value {платёжный "
      & "идентификатор} log_field_value {поле журнала} "
      & "other {конфиденциальное значение}}");
   P ("label.tables.cell_label",
      "строка {row, number}, столбец {column, number}: {state, "
      & "select, empty_cell {пусто} edited_cell {изменено} "
      & "invalid_cell {недопустимое значение} "
      & "highlighted_cell {выделено} other {только для "
      & "чтения}}");
   P ("label.tables.cell_position_label", "строка {row, number}, столбец {column, number}");
   P ("label.tables.cell_state_label",
      "{state, select, empty_cell {пустая ячейка} edited_cell "
      & "{изменённая ячейка} invalid_cell "
      & "{недопустимая ячейка} highlighted_cell "
      & "{выделенная ячейка} other {ячейка только "
      & "для чтения}}");
   P ("label.tables.column_count_label",
      "{count, plural, =0 {нет столбцов} one {{count, number} "
      & "столбец} few {{count, number} столбца} many {{count, "
      & "number} столбцов} other {{count, number} столбца}}");
   P ("label.tables.column_label",
      "{name}: {role, select, text_column {текстовый столбец} "
      & "number_column {числовой столбец} date_column "
      & "{столбец дат} status_column {столбец статуса} "
      & "action_column {столбец действий} other {скрытый "
      & "столбец}}");
   P ("label.tables.column_role_label",
      "{role, select, text_column {текстовый столбец} "
      & "number_column {числовой столбец} date_column "
      & "{столбец дат} status_column {столбец статуса} "
      & "action_column {столбец действий} other {скрытый "
      & "столбец}}");
   P ("label.tables.group_label",
      "{name}: {count, plural, one {{count, number} строка} few "
      & "{{count, number} строки} many {{count, number} строк} other "
      & "{{count, number} строки}}");
   P ("label.tables.row_count_label",
      "{count, plural, =0 {нет строк} one {{count, number} "
      & "строка} few {{count, number} строки} many {{count, number} "
      & "строк} other {{count, number} строки}}");
   P ("label.tables.sort_direction_label",
      "{direction, select, unsorted {не отсортировано} "
      & "ascending_sort {по возрастанию} other {по "
      & "убыванию}}");
   P ("label.tables.sort_label",
      "{direction, select, unsorted {не отсортировано} "
      & "ascending_sort {сортировка: {column_name}, по "
      & "возрастанию} other {сортировка: {column_name}, "
      & "по убыванию}}");
   P ("label.tables.subtotal_label", "{name}, промежуточный итог: {value}");
   P ("label.tables.table_size_label",
      "{rows, plural, one {{rows, number} строка} few {{rows, number} "
      & "строки} many {{rows, number} строк} other {{rows, number} "
      & "строки}} на {columns, plural, one {{columns, number} "
      & "столбец} few {{columns, number} столбца} many {{columns, "
      & "number} столбцов} other {{columns, number} столбца}}");
   P ("label.tasks.assignment_label",
      "{state, select, unassigned {{assignee}: назначение "
      & "снято} assigned {назначено: {assignee}} reassigned "
      & "{переназначено: {assignee}} watching {{assignee}: "
      & "наблюдает} other {{assignee}: владелец задачи}}");
   P ("label.tasks.assignment_state_label",
      "{state, select, unassigned {не назначено} assigned "
      & "{назначено} reassigned {переназначено} watching "
      & "{наблюдает} other {владелец задачи}}");
   P ("label.tasks.backlog_label",
      "{count, plural, =0 {бэклог пуст} one {бэклог: {count, "
      & "number} задача} few {бэклог: {count, number} задачи} "
      & "many {бэклог: {count, number} задач} other {бэклог: "
      & "{count, number} задачи}}");
   P ("label.tasks.blocker_label", "заблокировано: {name}");
   P ("label.tasks.complete_action_label",
      "{count, plural, =1 {завершить задачу} one "
      & "{завершить {count, number} задачу} few "
      & "{завершить {count, number} задачи} many "
      & "{завершить {count, number} задач} other "
      & "{завершить {count, number} задачи}}");
   P ("label.tasks.completed_task_count_label",
      "{count, plural, =0 {нет завершённых задач} one "
      & "{{count, number} завершённая задача} few {{count, "
      & "number} завершённые задачи} many {{count, number} "
      & "завершённых задач} other {{count, number} "
      & "завершённой задачи}}");
   P ("label.tasks.due_label", "срок: {due_text}");
   P ("label.tasks.estimate_label", "оценка: {estimate_text}");
   P ("label.tasks.open_task_count_label",
      "{count, plural, =0 {нет открытых задач} one {{count, "
      & "number} открытая задача} few {{count, number} "
      & "открытые задачи} many {{count, number} открытых "
      & "задач} other {{count, number} открытой задачи}}");
   P ("label.tasks.overdue_label", "просрочено, срок: {due_text}");
   P ("label.tasks.recurring_task_label", "повторяется: {schedule_text}");
   P ("label.tasks.reopen_action_label",
      "{count, plural, =1 {переоткрыть задачу} one "
      & "{переоткрыть {count, number} задачу} few "
      & "{переоткрыть {count, number} задачи} many "
      & "{переоткрыть {count, number} задач} other "
      & "{переоткрыть {count, number} задачи}}");
   P ("label.tasks.sprint_label",
      "{name}: {count, plural, one {{count, number} задача} few "
      & "{{count, number} задачи} many {{count, number} задач} other "
      & "{{count, number} задачи}}");
   P ("label.tasks.subtask_label",
      "{name}: {count, plural, one {{count, number} подзадача} few "
      & "{{count, number} подзадачи} many {{count, number} "
      & "подзадач} other {{count, number} подзадачи}}");
   P ("label.tasks.task_count_label",
      "{count, plural, =0 {нет задач} one {{count, number} "
      & "задача} few {{count, number} задачи} many {{count, number} "
      & "задач} other {{count, number} задачи}}");
   P ("label.tasks.task_label",
      "{name}: {state, select, open_task {открыта} in_progress_task "
      & "{в работе} blocked_task {заблокирована} done_task "
      & "{выполнена} canceled_task {отменена} deferred_task "
      & "{отложена} other {просрочена}}{priority, select, "
      & "no_priority {} low_priority {, низкий приоритет} "
      & "medium_priority {, средний приоритет} high_priority {, "
      & "высокий приоритет} other {, критический "
      & "приоритет}}");
   P ("label.tasks.task_priority_label",
      "{priority, select, no_priority {без приоритета} "
      & "low_priority {низкий приоритет} medium_priority "
      & "{средний приоритет} high_priority {высокий "
      & "приоритет} other {критический приоритет}}");
   P ("label.tasks.task_state_label",
      "{state, select, open_task {открытая задача} "
      & "in_progress_task {задача в работе} blocked_task "
      & "{заблокированная задача} done_task "
      & "{выполненная задача} canceled_task "
      & "{отменённая задача} deferred_task "
      & "{отложенная задача} other {просроченная "
      & "задача}}");
   P ("label.thresholds.threshold_direction_label",
      "{direction, select, upper_limit {верхний предел} other "
      & "{нижний предел}}");
   P ("label.thresholds.threshold_state_label",
      "{state, select, below_range {ниже ожидаемого "
      & "диапазона} within_range {в ожидаемом "
      & "диапазоне} above_range {выше ожидаемого "
      & "диапазона} below_target {ниже цели} at_target {на "
      & "уровне цели} above_target {выше цели} near_limit "
      & "{близко к пределу} warning_level {порог "
      & "предупреждения} critical_level {критический "
      & "порог} breached {порог превышен} other "
      & "{состояние порога неизвестно}}");
   P ("label.versions.commit_distance_label",
      "{behind, plural, =0 {{ahead, plural, =0 {актуально} other "
      & "{опережает на {ahead, plural, one {{ahead, number} "
      & "коммит} few {{ahead, number} коммита} many {{ahead, "
      & "number} коммитов} other {{ahead, number} коммита}}}}} "
      & "other {{ahead, plural, =0 {отстаёт на {behind, plural, one "
      & "{{behind, number} коммит} few {{behind, number} коммита} "
      & "many {{behind, number} коммитов} other {{behind, number} "
      & "коммита}}} other {опережает на {ahead, plural, one "
      & "{{ahead, number} коммит} few {{ahead, number} коммита} "
      & "many {{ahead, number} коммитов} other {{ahead, number} "
      & "коммита}}, отстаёт на {behind, plural, one {{behind, "
      & "number} коммит} few {{behind, number} коммита} many "
      & "{{behind, number} коммитов} other {{behind, number} "
      & "коммита}}}}}}");
   P ("label.workflows.approval_label",
      "{waiting, select, false {одобрено: {approver}} other "
      & "{ожидает одобрения: {approver}}}");
   P ("label.workflows.attempt_label",
      "{limit, plural, =1 {{attempt, plural, =1 {попытка 1 из 1} "
      & "other {попытка {attempt, number} из 1, лимит "
      & "превышен}}} other {попытка {attempt, number} из "
      & "{limit, number}}}");
   P ("label.workflows.blocker_label", "заблокировано: {reason}");
   P ("label.workflows.dependency_label",
      "{count, plural, =0 {нет блокирующих "
      & "зависимостей} one {{count, number} блокирующая "
      & "зависимость} few {{count, number} блокирующие "
      & "зависимости} many {{count, number} блокирующих "
      & "зависимостей} other {{count, number} "
      & "блокирующей зависимости}}");
   P ("label.workflows.handoff_label", "передача: {from} → {to}");
   P ("label.workflows.milestone_state_label",
      "{state, select, upcoming_milestone {предстоящая веха} "
      & "current_milestone {текущая веха} complete_milestone "
      & "{завершённая веха} missed_milestone "
      & "{пропущенная веха} other "
      & "{заблокированная веха}}");
   P ("label.workflows.milestone_status_label",
      "{name}: {state, select, upcoming_milestone {предстоит} "
      & "current_milestone {текущая} complete_milestone "
      & "{завершена} missed_milestone {пропущена} other "
      & "{заблокирована}}");
   P ("label.workflows.next_action_label", "далее: {action}");
   P ("label.workflows.owner_label", "владелец: {owner}");
   P ("label.workflows.resume_label", "возобновить {name}");
   P ("label.workflows.step_state_label",
      "{state, select, pending_step {ожидает запуска} "
      & "active_step {выполняется} waiting_step {ожидание} "
      & "blocked_step {заблокировано} done_step {готово} "
      & "failed_step {сбой} other {пропущено}}");
   P ("label.workflows.step_status_label",
      "{name}: {state, select, pending_step {ожидает запуска} "
      & "active_step {выполняется} waiting_step {ожидание} "
      & "blocked_step {заблокировано} done_step {готово} "
      & "failed_step {сбой} other {пропущено}}");
   P ("label.workflows.waiting_label", "ожидание: {reason}");
   P ("label.workflows.workflow_result_label",
      "{name}: {state, select, not_started_state {не запущено} "
      & "in_progress_state {выполняется} waiting_state "
      & "{ожидание} waiting_approval_state {ожидает "
      & "одобрения} blocked_state {заблокировано} "
      & "completed_state {завершено} failed_state {сбой} "
      & "cancelled_state {отменено} skipped_state {пропущено} "
      & "other {приостановлено}}");
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {не запущено} "
      & "in_progress_state {выполняется} waiting_state "
      & "{ожидание} waiting_approval_state {ожидает "
      & "одобрения} blocked_state {заблокировано} "
      & "completed_state {завершено} failed_state {сбой} "
      & "cancelled_state {отменено} skipped_state {пропущено} "
      & "other {приостановлено}}");
end Labels_3;
