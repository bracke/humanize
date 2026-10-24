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
      & "неактивний} other {фільтр {name}: крім {value}}}");
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
   P ("label.contrast.opacity_label",
      "{percent}, {state, select, transparent {прозоро} "
      & "mostly_transparent {майже прозоро} translucent "
      & "{напівпрозоро} mostly_opaque {майже "
      & "непрозоро} other {непрозоро}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {немає спостережень} one {{count, "
      & "number} спостереження, мін. {minimum} {unit}, "
      & "медіана {median} {unit}, макс. {maximum} {unit}} few "
      & "{{count, number} спостереження, мін. {minimum} {unit}, "
      & "медіана {median} {unit}, макс. {maximum} {unit}} many "
      & "{{count, number} спостережень, мін. {minimum} {unit}, "
      & "медіана {median} {unit}, макс. {maximum} {unit}} other "
      & "{{count, number} спостереження, мін. {minimum} {unit}, "
      & "медіана {median} {unit}, макс. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {немає "
      & "спостережень} other {0 викидів із {total, plural, "
      & "one {{total, number} спостереження} few {{total, number} "
      & "спостережень} many {{total, number} "
      & "спостережень} other {{total, number} "
      & "спостереження}}}}} one {{outliers, number} викид "
      & "із {total, plural, one {{total, number} спостереження} "
      & "few {{total, number} спостережень} many {{total, number} "
      & "спостережень} other {{total, number} "
      & "спостереження}}} few {{outliers, number} викиди з "
      & "{total, plural, one {{total, number} спостереження} few "
      & "{{total, number} спостережень} many {{total, number} "
      & "спостережень} other {{total, number} "
      & "спостереження}}} many {{outliers, number} викидів "
      & "із {total, plural, one {{total, number} спостереження} "
      & "few {{total, number} спостережень} many {{total, number} "
      & "спостережень} other {{total, number} "
      & "спостереження}}} other {{outliers, number} викиду "
      & "з {total, plural, one {{total, number} спостереження} "
      & "few {{total, number} спостережень} many {{total, number} "
      & "спостережень} other {{total, number} "
      & "спостереження}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {перевищення місткості: "
      & "{count, number} {unit}} other {залишилося {count, number} з "
      & "{total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {квоту перевищено на {count, "
      & "number} {unit} (використано {percent})} near {квота "
      & "майже вичерпана: залишилося {count, number} "
      & "{unit} (використано {percent})} other {квота "
      & "доступна: залишилося {count, number} {unit} "
      & "(використано {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {частка влучань у кеш "
      & "недоступна: немає запитів} other {частка "
      & "влучань у кеш {percent}: влучань {hits, number}, "
      & "промахів {misses, number}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} атрибут} few {{count, "
      & "number} атрибути} many {{count, number} атрибутів} "
      & "other {{count, number} атрибута}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} атрибут data} few {{count, "
      & "number} атрибути data} many {{count, number} "
      & "атрибутів data} other {{count, number} атрибута "
      & "data}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} атрибут ARIA} few {{count, "
      & "number} атрибути ARIA} many {{count, number} "
      & "атрибутів ARIA} other {{count, number} атрибута "
      & "ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} обробник подій} few "
      & "{{count, number} обробники подій} many {{count, number} "
      & "обробників подій} other {{count, number} "
      & "обробника подій}}");
   P ("label.markup.heading_label", "заголовок рівня {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} тег} few {{count, number} "
      & "теги} many {{count, number} тегів} other {{count, number} "
      & "тега}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} посилання} few {{count, "
      & "number} посилання} many {{count, number} посилань} "
      & "other {{count, number} посилання}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} медіаелемент} few "
      & "{{count, number} медіаелементи} many {{count, number} "
      & "медіаелементів} other {{count, number} "
      & "медіаелемента}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} елемент форми} few "
      & "{{count, number} елементи форми} many {{count, number} "
      & "елементів форми} other {{count, number} елемента "
      & "форми}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} заголовок} few {{count, "
      & "number} заголовки} many {{count, number} "
      & "заголовків} other {{count, number} заголовка}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} орієнтир} few {{count, "
      & "number} орієнтири} many {{count, number} "
      & "орієнтирів} other {{count, number} орієнтира}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} форма} few {{count, number} "
      & "форми} many {{count, number} форм} other {{count, number} "
      & "форми}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} медіаелемент} few "
      & "{{count, number} медіаелементи} many {{count, number} "
      & "медіаелементів} other {{count, number} "
      & "медіаелемента}}");
   P ("label.markup.table_navigation_label",
      "{caption}, рядок {row, number} з {rows, number}, "
      & "стовпець {column, number} з {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} секрет} few {{count, "
      & "number} секрети} many {{count, number} секретів} other "
      & "{{count, number} секрету}}");
   P ("label.secrets.secret_count_label.masked", "замасковано: {count, number}");
   P ("label.secrets.secret_count_label.unset", "не задано: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} відбиток} few {{count, "
      & "number} відбитки} many {{count, number} відбитків} "
      & "other {{count, number} відбитка}}");
   P ("label.schema.type_mismatch_label",
      "поле {field_name}: очікувалося {expected, select, "
      & "string_field {рядок} integer_field {ціле число} "
      & "decimal_field {десяткове число} boolean_field "
      & "{логічне значення} date_field {дата} "
      & "date_time_field {дата й час} object_field {об’єкт} "
      & "array_field {масив} enum_field {перелік} binary_field "
      & "{двійкові дані} null_field {null} any_field "
      & "{будь-який тип} other {невідомий тип}}, "
      & "отримано {actual, select, string_field {рядок} "
      & "integer_field {ціле число} decimal_field {десяткове "
      & "число} boolean_field {логічне значення} date_field "
      & "{дата} date_time_field {дата й час} object_field "
      & "{об’єкт} array_field {масив} enum_field {перелік} "
      & "binary_field {двійкові дані} null_field {null} any_field "
      & "{будь-який тип} other {невідомий тип}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} блокувальна проблема} few {{blocking, "
      & "number} блокувальні проблеми} many {{blocking, "
      & "number} блокувальних проблем} other {{blocking, "
      & "number} блокувальної проблеми}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} блокувальна "
      & "проблема} few {{blocking, number} блокувальні "
      & "проблеми} many {{blocking, number} блокувальних "
      & "проблем} other {{blocking, number} блокувальної "
      & "проблеми}}} only {лише {base}} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {цільовий "
      & "діапазон від {low} до {high}} other {цільове "
      & "вікно від {low} до {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} в очікуваному "
      & "діапазоні} below {{value} нижче очікуваного "
      & "діапазону} other {{value} вище очікуваного "
      & "діапазону}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} на критичному "
      & "порозі} warning {{value} на порозі "
      & "попередження} other {{value} у межах норми}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {не перевищено} other "
      & "{перевищено на {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {на рівні цілі} below {{difference} "
      & "нижче цілі} other {{difference} вище цілі}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {межу перевищено} near "
      & "{близько до межі, залишилося {distance}} other "
      & "{{distance} до межі}}");
   P ("label.thresholds.threshold_summary_label.none", "немає метрик");
   P ("label.thresholds.threshold_summary_label.normal", "у нормі: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} попередження} few "
      & "{{count, number} попередження} many {{count, number} "
      & "попереджень} other {{count, number} "
      & "попередження}}");
   P ("label.thresholds.threshold_summary_label.critical", "критично: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} перевищення} few "
      & "{{count, number} перевищення} many {{count, number} "
      & "перевищень} other {{count, number} перевищення}}");
   P ("label.thresholds.target_window_label", "ціль {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "допуск {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} від межі");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {межу перевищено на {amount}} "
      & "other {залишилося {amount}}}");
   P ("label.thresholds.budget_used_label", "використано {used} з {budget}");
   P ("label.workflows.step_label", "крок {current, number} з {total, number}: {name}");
   P ("label.workflows.milestone_label", "завершено віх {current, number} з {total, number}: {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {немає елементів процесу} "
      & "half {процес виконано наполовину} other "
      & "{завершено {completed, number} з {total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {позиція в черзі {position, number}} "
      & "other {позиція в черзі {position, number} з {total, "
      & "number}}}");
   P ("label.changes.change_set_label.none", "немає змін");
   P ("label.changes.change_set_label.added", "додано: {count, number}");
   P ("label.changes.change_set_label.removed", "видалено: {count, number}");
   P ("label.changes.change_set_label.modified", "змінено: {count, number}");
   P ("label.changes.change_set_label.unchanged", "без змін: {count, number}");
   P ("label.changes.sync_change_label.none", "немає змін синхронізації");
   P ("label.changes.sync_change_label.uploaded", "вивантажено: {count, number}");
   P ("label.changes.sync_change_label.downloaded", "завантажено: {count, number}");
   P ("label.changes.sync_change_label.deleted", "видалено: {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} конфлікт} few {{count, "
      & "number} конфлікти} many {{count, number} "
      & "конфліктів} other {{count, number} конфлікту}}");
   P ("label.changes.net_change_label",
      "{state, select, none {немає підсумкової зміни} up "
      & "{разом +{count, plural, one {{count, number} елемент} few "
      & "{{count, number} елементи} many {{count, number} "
      & "елементів} other {{count, number} елемента}}} other "
      & "{разом -{count, plural, one {{count, number} елемент} few "
      & "{{count, number} елементи} many {{count, number} "
      & "елементів} other {{count, number} елемента}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {немає змін для перевірки} "
      & "all {усі зміни перевірено} other "
      & "{перевірено змін: {reviewed, number} з {total, "
      & "number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: без змін, {new_value}} up "
      & "{{field_name}: збільшено з {old_value} до {new_value}} "
      & "other {{field_name}: зменшено з {old_value} до "
      & "{new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {немає рядків для вибору} "
      & "none {рядки не вибрано} all {{total, plural, one "
      & "{вибрано {total, number} рядок} few {вибрано всі "
      & "{total, number} рядки} many {вибрано всі {total, "
      & "number} рядків} other {вибрано всі {total, number} "
      & "рядка}}} other {вибрано рядків: {selected, number} "
      & "з {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {немає сторінок} other {{pages, plural, "
      & "=0 {немає сторінок} other {{rows, plural, =0 "
      & "{сторінка {page, number} з {pages, number}} one "
      & "{сторінка {page, number} з {pages, number}, {rows, number} "
      & "рядок} few {сторінка {page, number} з {pages, number}, "
      & "{rows, number} рядки} many {сторінка {page, number} з "
      & "{pages, number}, {rows, number} рядків} other {сторінка "
      & "{page, number} з {pages, number}, {rows, number} рядка}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {немає рядків} none {немає "
      & "відповідних рядків} all {{total, plural, one "
      & "{показано {total, number} рядок} few {показано "
      & "всі {total, number} рядки} many {показано всі "
      & "{total, number} рядків} other {показано всі {total, "
      & "number} рядка}}} other {показано рядків: {visible, "
      & "number} з {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {немає рядків} single {рядок "
      & "{first_row, number} з {total, number}} other {рядки {first_row, "
      & "number}–{last_row, number} з {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {без обмеження символів} "
      & "none_left {символів не залишилося} left "
      & "{залишилося символів: {count, number}} other "
      & "{ліміт перевищено на {count, plural, one {{count, "
      & "number} символ} few {{count, number} символи} many "
      & "{{count, number} символів} other {{count, number} "
      & "символу}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {немає обов’язкових полів} "
      & "=1 {{missing, plural, =0 {усі обов’язкові поля "
      & "заповнено} other {не заповнено "
      & "обов’язкове поле (1 з 1)}}} other {{missing, plural, "
      & "=0 {усі обов’язкові поля заповнено} other "
      & "{не заповнено обов’язкових полів: "
      & "{missing, number} з {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {немає полів} all {усі поля "
      & "заповнено} other {заповнено полів: {completed, "
      & "number} з {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: немає полів} all {{name}: "
      & "усі поля заповнено} other {{name}: заповнено "
      & "полів: {completed, number} з {total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {немає кроків форми} =1 {крок 1 "
      & "з 1: {name}} other {крок {current, number} з {total, number}: "
      & "{name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {немає навігаційного "
      & "ланцюжка} =1 {елемент ланцюжка 1 з 1: {name}} "
      & "other {елемент ланцюжка {current, number} з {total, "
      & "number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {немає вкладок} =1 {вкладка 1 з "
      & "1: {name}} other {вкладка {current, number} з {total, number}: "
      & "{name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {вхідні порожні} =1 {{unread, plural, "
      & "=0 {усі сповіщення прочитано} other "
      & "{непрочитаних: 1 з 1}}} other {{unread, plural, =0 "
      & "{усі сповіщення прочитано} other "
      & "{непрочитаних: {unread, number} з {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label",
      "спроба доставки {attempt, number} з {max_attempts, "
      & "number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {немає пунктів списку} =1 {{done, "
      & "plural, =0 {виконано пунктів: 0 з 1} other "
      & "{виконано пунктів: 1 з 1}}} other {виконано "
      & "пунктів: {done, number} з {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {немає вивантажень} =1 {{done, "
      & "plural, =0 {завершено вивантажень: 0 з 1} other "
      & "{завершено вивантажень: 1 з 1}}} other "
      & "{завершено вивантажень: {done, number} з {total, "
      & "number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {немає місць} =1 {{reserved, plural, "
      & "=0 {заброньовано місць: 0 з 1} other "
      & "{заброньовано місць: 1 з 1}}} other "
      & "{заброньовано місць: {reserved, number} з {capacity, "
      & "number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {позиція в списку "
      & "очікування {position, number}} other {позиція в "
      & "списку очікування {position, number} з {total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: змінено {changed, "
      & "number}/{total, number}} other {{name}: змінено {changed, "
      & "number}, без змін {unchanged, number}, усього {total, "
      & "number}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "поточний колір переднього плану "
      & "відповідає контрасту для великого "
      & "тексту при {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "поточний колір переднього плану "
      & "відповідає контрасту для звичайного "
      & "тексту при {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "використайте {v1}: підвищений контраст "
      & "тексту {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "використайте {v1}: контраст {v2, number}:{v3, "
      & "number} для великого тексту");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "використайте {v1}: контраст {v2}:{v3, number} "
      & "для звичайного тексту");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "використайте {v1}: контраст {v2}:{v3, number} "
      & "для великого тексту");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "використайте {v1}: підвищений контраст "
      & "тексту {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "поточний колір переднього плану "
      & "відповідає контрасту для великого "
      & "тексту при {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "поточний колір переднього плану "
      & "відповідає контрасту для звичайного "
      & "тексту при {v1, number}:{v2, number}");
end Labels_3;
