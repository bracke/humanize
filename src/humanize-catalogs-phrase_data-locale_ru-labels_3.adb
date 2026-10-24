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
      & "неактивен} other {фильтр {name}: кроме {value}}}");
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
   P ("label.contrast.opacity_label",
      "{percent}, {state, select, transparent {прозрачно} "
      & "mostly_transparent {почти прозрачно} translucent "
      & "{полупрозрачно} mostly_opaque {почти "
      & "непрозрачно} other {непрозрачно}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {нет наблюдений} one {{count, number} "
      & "наблюдение, мин. {minimum} {unit}, медиана "
      & "{median} {unit}, макс. {maximum} {unit}} few {{count, number} "
      & "наблюдения, мин. {minimum} {unit}, медиана "
      & "{median} {unit}, макс. {maximum} {unit}} many {{count, number} "
      & "наблюдений, мин. {minimum} {unit}, медиана "
      & "{median} {unit}, макс. {maximum} {unit}} other {{count, number} "
      & "наблюдения, мин. {minimum} {unit}, медиана "
      & "{median} {unit}, макс. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {нет "
      & "наблюдений} other {0 выбросов из {total, plural, "
      & "one {{total, number} наблюдения} few {{total, number} "
      & "наблюдений} many {{total, number} наблюдений} "
      & "other {{total, number} наблюдения}}}}} one {{outliers, "
      & "number} выброс из {total, plural, one {{total, number} "
      & "наблюдения} few {{total, number} наблюдений} many "
      & "{{total, number} наблюдений} other {{total, number} "
      & "наблюдения}}} few {{outliers, number} выброса из "
      & "{total, plural, one {{total, number} наблюдения} few "
      & "{{total, number} наблюдений} many {{total, number} "
      & "наблюдений} other {{total, number} наблюдения}}} "
      & "many {{outliers, number} выбросов из {total, plural, one "
      & "{{total, number} наблюдения} few {{total, number} "
      & "наблюдений} many {{total, number} наблюдений} "
      & "other {{total, number} наблюдения}}} other {{outliers, "
      & "number} выброса из {total, plural, one {{total, number} "
      & "наблюдения} few {{total, number} наблюдений} many "
      & "{{total, number} наблюдений} other {{total, number} "
      & "наблюдения}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {превышение ёмкости: {count, "
      & "number} {unit}} other {осталось {count, number} из {total, "
      & "number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {квота превышена на {count, "
      & "number} {unit} (использовано {percent})} near {квота "
      & "почти исчерпана: осталось {count, number} {unit} "
      & "(использовано {percent})} other {квота "
      & "доступна: осталось {count, number} {unit} "
      & "(использовано {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {доля попаданий в кэш "
      & "недоступна: нет запросов} other {доля "
      & "попаданий в кэш {percent}: попаданий {hits, "
      & "number}, промахов {misses, number}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} атрибут} few {{count, "
      & "number} атрибута} many {{count, number} атрибутов} "
      & "other {{count, number} атрибута}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} атрибут data} few {{count, "
      & "number} атрибута data} many {{count, number} "
      & "атрибутов data} other {{count, number} атрибута "
      & "data}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} атрибут ARIA} few {{count, "
      & "number} атрибута ARIA} many {{count, number} "
      & "атрибутов ARIA} other {{count, number} атрибута "
      & "ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} обработчик "
      & "событий} few {{count, number} обработчика "
      & "событий} many {{count, number} обработчиков "
      & "событий} other {{count, number} обработчика "
      & "событий}}");
   P ("label.markup.heading_label", "заголовок уровня {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} тег} few {{count, number} "
      & "тега} many {{count, number} тегов} other {{count, number} "
      & "тега}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} ссылка} few {{count, "
      & "number} ссылки} many {{count, number} ссылок} other "
      & "{{count, number} ссылки}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} медиаэлемент} few "
      & "{{count, number} медиаэлемента} many {{count, number} "
      & "медиаэлементов} other {{count, number} "
      & "медиаэлемента}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} элемент формы} few "
      & "{{count, number} элемента формы} many {{count, number} "
      & "элементов формы} other {{count, number} элемента "
      & "формы}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} заголовок} few {{count, "
      & "number} заголовка} many {{count, number} "
      & "заголовков} other {{count, number} заголовка}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} ориентир} few {{count, "
      & "number} ориентира} many {{count, number} "
      & "ориентиров} other {{count, number} ориентира}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} форма} few {{count, number} "
      & "формы} many {{count, number} форм} other {{count, number} "
      & "формы}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} медиаэлемент} few "
      & "{{count, number} медиаэлемента} many {{count, number} "
      & "медиаэлементов} other {{count, number} "
      & "медиаэлемента}}");
   P ("label.markup.table_navigation_label",
      "{caption}, строка {row, number} из {rows, number}, "
      & "столбец {column, number} из {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} секрет} few {{count, "
      & "number} секрета} many {{count, number} секретов} other "
      & "{{count, number} секрета}}");
   P ("label.secrets.secret_count_label.masked", "замаскировано: {count, number}");
   P ("label.secrets.secret_count_label.unset", "не задано: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} отпечаток} few {{count, "
      & "number} отпечатка} many {{count, number} "
      & "отпечатков} other {{count, number} отпечатка}}");
   P ("label.schema.type_mismatch_label",
      "поле {field_name}: ожидалось {expected, select, "
      & "string_field {строка} integer_field {целое число} "
      & "decimal_field {десятичное число} boolean_field "
      & "{логическое значение} date_field {дата} "
      & "date_time_field {дата и время} object_field {объект} "
      & "array_field {массив} enum_field {перечисление} "
      & "binary_field {двоичные данные} null_field {null} "
      & "any_field {любой тип} other {неизвестный тип}}, "
      & "получено {actual, select, string_field {строка} "
      & "integer_field {целое число} decimal_field "
      & "{десятичное число} boolean_field {логическое "
      & "значение} date_field {дата} date_time_field {дата и "
      & "время} object_field {объект} array_field {массив} "
      & "enum_field {перечисление} binary_field {двоичные "
      & "данные} null_field {null} any_field {любой тип} other "
      & "{неизвестный тип}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} блокирующая проблема} few {{blocking, "
      & "number} блокирующие проблемы} many {{blocking, "
      & "number} блокирующих проблем} other {{blocking, "
      & "number} блокирующей проблемы}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} блокирующая "
      & "проблема} few {{blocking, number} блокирующие "
      & "проблемы} many {{blocking, number} блокирующих "
      & "проблем} other {{blocking, number} блокирующей "
      & "проблемы}}} only {только {base}} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {целевой диапазон "
      & "от {low} до {high}} other {целевое окно от {low} до "
      & "{high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} в ожидаемом "
      & "диапазоне} below {{value} ниже ожидаемого "
      & "диапазона} other {{value} выше ожидаемого "
      & "диапазона}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} на критическом "
      & "пороге} warning {{value} на пороге "
      & "предупреждения} other {{value} в пределах "
      & "нормы}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {не превышено} other {превышено "
      & "на {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {на уровне цели} below {{difference} "
      & "ниже цели} other {{difference} выше цели}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {предел превышен} near "
      & "{близко к пределу, осталось {distance}} other "
      & "{{distance} до предела}}");
   P ("label.thresholds.threshold_summary_label.none", "нет метрик");
   P ("label.thresholds.threshold_summary_label.normal", "в норме: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} предупреждение} few "
      & "{{count, number} предупреждения} many {{count, number} "
      & "предупреждений} other {{count, number} "
      & "предупреждения}}");
   P ("label.thresholds.threshold_summary_label.critical", "критично: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} превышение} few "
      & "{{count, number} превышения} many {{count, number} "
      & "превышений} other {{count, number} превышения}}");
   P ("label.thresholds.target_window_label", "цель {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "допуск {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} от предела");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {предел превышен на {amount}} "
      & "other {осталось {amount}}}");
   P ("label.thresholds.budget_used_label", "использовано {used} из {budget}");
   P ("label.workflows.step_label", "шаг {current, number} из {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "завершено вех {current, number} из {total, number}: "
      & "{name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {нет элементов процесса} half "
      & "{процесс выполнен наполовину} other "
      & "{завершено {completed, number} из {total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {позиция в очереди {position, "
      & "number}} other {позиция в очереди {position, number} "
      & "из {total, number}}}");
   P ("label.changes.change_set_label.none", "нет изменений");
   P ("label.changes.change_set_label.added", "добавлено: {count, number}");
   P ("label.changes.change_set_label.removed", "удалено: {count, number}");
   P ("label.changes.change_set_label.modified", "изменено: {count, number}");
   P ("label.changes.change_set_label.unchanged", "без изменений: {count, number}");
   P ("label.changes.sync_change_label.none", "нет изменений синхронизации");
   P ("label.changes.sync_change_label.uploaded", "загружено: {count, number}");
   P ("label.changes.sync_change_label.downloaded", "скачано: {count, number}");
   P ("label.changes.sync_change_label.deleted", "удалено: {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} конфликт} few {{count, "
      & "number} конфликта} many {{count, number} "
      & "конфликтов} other {{count, number} конфликта}}");
   P ("label.changes.net_change_label",
      "{state, select, none {нет итогового изменения} up "
      & "{итого +{count, plural, one {{count, number} элемент} few "
      & "{{count, number} элемента} many {{count, number} "
      & "элементов} other {{count, number} элемента}}} other "
      & "{итого -{count, plural, one {{count, number} элемент} few "
      & "{{count, number} элемента} many {{count, number} "
      & "элементов} other {{count, number} элемента}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {нет изменений для "
      & "проверки} all {все изменения проверены} "
      & "other {проверено изменений: {reviewed, number} из "
      & "{total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: без изменений, "
      & "{new_value}} up {{field_name}: увеличено с {old_value} до "
      & "{new_value}} other {{field_name}: уменьшено с {old_value} "
      & "до {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {нет строк для выбора} none "
      & "{строки не выбраны} all {{total, plural, one "
      & "{выбрана {total, number} строка} few {выбраны "
      & "все {total, number} строки} many {выбраны все "
      & "{total, number} строк} other {выбраны все {total, "
      & "number} строки}}} other {выбрано строк: {selected, "
      & "number} из {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {нет страниц} other {{pages, plural, =0 "
      & "{нет страниц} other {{rows, plural, =0 {страница "
      & "{page, number} из {pages, number}} one {страница {page, "
      & "number} из {pages, number}, {rows, number} строка} few "
      & "{страница {page, number} из {pages, number}, {rows, number} "
      & "строки} many {страница {page, number} из {pages, "
      & "number}, {rows, number} строк} other {страница {page, "
      & "number} из {pages, number}, {rows, number} строки}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {нет строк} none {нет "
      & "совпадающих строк} all {{total, plural, one "
      & "{показана {total, number} строка} few {показаны "
      & "все {total, number} строки} many {показаны все "
      & "{total, number} строк} other {показаны все {total, "
      & "number} строки}}} other {показано строк: {visible, "
      & "number} из {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {нет строк} single {строка "
      & "{first_row, number} из {total, number}} other {строки "
      & "{first_row, number}–{last_row, number} из {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {без ограничения "
      & "символов} none_left {символов не осталось} "
      & "left {осталось символов: {count, number}} other "
      & "{лимит превышен на {count, plural, one {{count, number} "
      & "символ} few {{count, number} символа} many {{count, "
      & "number} символов} other {{count, number} символа}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {нет обязательных полей} =1 "
      & "{{missing, plural, =0 {все обязательные поля "
      & "заполнены} other {не заполнено "
      & "обязательное поле (1 из 1)}}} other {{missing, "
      & "plural, =0 {все обязательные поля "
      & "заполнены} other {не заполнено "
      & "обязательных полей: {missing, number} из {total, "
      & "number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {нет полей} all {все поля "
      & "заполнены} other {заполнено полей: {completed, "
      & "number} из {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: нет полей} all {{name}: все "
      & "поля заполнены} other {{name}: заполнено "
      & "полей: {completed, number} из {total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {нет шагов формы} =1 {шаг 1 из 1: "
      & "{name}} other {шаг {current, number} из {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {нет навигационной цепочки} "
      & "=1 {элемент цепочки 1 из 1: {name}} other "
      & "{элемент цепочки {current, number} из {total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {нет вкладок} =1 {вкладка 1 из "
      & "1: {name}} other {вкладка {current, number} из {total, "
      & "number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {входящие пусты} =1 {{unread, plural, "
      & "=0 {все уведомления прочитаны} other "
      & "{непрочитанных: 1 из 1}}} other {{unread, plural, =0 "
      & "{все уведомления прочитаны} other "
      & "{непрочитанных: {unread, number} из {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label",
      "попытка доставки {attempt, number} из {max_attempts, "
      & "number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {нет пунктов списка} =1 {{done, "
      & "plural, =0 {выполнено пунктов: 0 из 1} other "
      & "{выполнено пунктов: 1 из 1}}} other "
      & "{выполнено пунктов: {done, number} из {total, "
      & "number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {нет загрузок} =1 {{done, plural, =0 "
      & "{завершено загрузок: 0 из 1} other "
      & "{завершено загрузок: 1 из 1}}} other "
      & "{завершено загрузок: {done, number} из {total, "
      & "number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {нет мест} =1 {{reserved, plural, =0 "
      & "{забронировано мест: 0 из 1} other "
      & "{забронировано мест: 1 из 1}}} other "
      & "{забронировано мест: {reserved, number} из "
      & "{capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {позиция в листе ожидания "
      & "{position, number}} other {позиция в листе "
      & "ожидания {position, number} из {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: изменено {changed, "
      & "number}/{total, number}} other {{name}: изменено {changed, "
      & "number}, без изменений {unchanged, number}, всего "
      & "{total, number}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "текущий цвет переднего плана "
      & "соответствует контрасту для крупного "
      & "текста при {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "текущий цвет переднего плана "
      & "соответствует контрасту для обычного "
      & "текста при {v1}:{v2, number}");
end Labels_3;
