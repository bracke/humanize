separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Ru (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "ru", Name, Template);
   end P;
   --  The domain labels (label.*), in nested subunits.
   procedure Labels_1 is separate;
   procedure Labels_2 is separate;
   procedure Labels_3 is separate;
   procedure Labels_4 is separate;
begin
   P ("all_count",
      "всего {total} {total, plural, one {{one}} few {{few}} many "
      & "{{many}} other {{genitive_one}}}");
   P ("filtered_count.none", "нет совпадающих {genitive_other}");
   P ("filtered_count.all",
      "{total, plural, =1 {совпадает 1 {one}} one "
      & "{совпадают все {total} {one}} few {совпадают "
      & "все {total} {few}} many {совпадают все {total} {many}} "
      & "other {совпадают все {total} {genitive_one}}}");
   P ("filtered_count.some",
      "{matching, plural, one {совпадает} other "
      & "{совпадают}} {matching} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("more_count", "показано {visible}, ещё +{remaining}");
   P ("others_count", "{first} и ещё {remaining}");
   P ("page_count", "страница {page} из {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} few {{few}} many {{many}} other "
      & "{{genitive_one}}} на странице");
   P ("pagination_range",
      "{first}–{last} из {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("position_count", "{position} из {total}");
   P ("selection_count",
      "выбрано {selected} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("showing_count",
      "показано {showing} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("validation_count",
      "{count, plural, =0 {нет {severity, select, error {ошибок} "
      & "warning {предупреждений} other {замечаний}}} "
      & "one {{count} {severity, select, error {ошибка} warning "
      & "{предупреждение} other {замечание}}} few "
      & "{{count} {severity, select, error {ошибки} warning "
      & "{предупреждения} other {замечания}}} many "
      & "{{count} {severity, select, error {ошибок} warning "
      & "{предупреждений} other {замечаний}}} other "
      & "{{count} {severity, select, error {ошибки} warning "
      & "{предупреждения} other {замечания}}}}");
   P ("collection.empty", "нет {genitive_other}");
   P ("collection.none_shown", "нет отображаемых {genitive_other}");
   P ("collection.showing_hidden",
      "показано {visible} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}, скрыто {hidden}");
   P ("collection.showing",
      "показано {visible} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("collection.shown_hidden",
      "показано: {visible} {visible, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}, скрыто: {hidden}");
   P ("collection.shown",
      "показано: {visible} {visible, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}");
   P ("collection.visible_out_of",
      "видно {visible} из {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("complete_count", "выполнено {done} из {total}");
   P ("percent_complete", "выполнено {percent} %");
   P ("step_count", "шаг {step} из {total}");
   P ("attempt_count", "попытка {attempt} из {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {{gender, select, masculine {остался} "
      & "feminine {осталась} neuter {осталось} other "
      & "{осталось}}} other {осталось}} {remaining} {remaining, "
      & "plural, one {{one}} few {{genitive_one}} many {{genitive_other}} other "
      & "{{genitive_one}}}, скорость {rate} {unit}/с");
   P ("accessible_progress",
      "выполнено {done} из {total}, {percent} {percent, plural, "
      & "one {процент} few {процента} many {процентов} "
      & "other {процента}}");
   P ("business_days",
      "{days} {days, plural, one {рабочий день} few "
      & "{рабочих дня} many {рабочих дней} other "
      & "{рабочего дня}}");
   P ("working_hours",
      "{hours} {hours, plural, one {рабочий час} few "
      & "{рабочих часа} many {рабочих часов} other "
      & "{рабочего часа}}");
   P ("due.overdue",
      "просрочено на {days} {days, plural, one {день} few "
      & "{дня} many {дней} other {дня}}");
   P ("due.today", "срок сегодня");
   P ("due.tomorrow", "срок завтра");
   P ("due.in",
      "срок через {days} {days, plural, one {день} few {дня} "
      & "many {дней} other {дня}}");
   P ("calendar_difference.future", "через {difference}");
   P ("calendar_difference.past", "{difference} назад");
   P ("cpu_load", "загрузка ЦП {measure}");
   P ("battery", "заряд батареи {measure}");
   P ("screen_size", "экран {measure}");
   P ("refresh_rate", "частота обновления {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word",
      "{value} {value, plural, one {процент} few {процента} "
      & "many {процентов} other {процента}}");
   P ("recurrence.second",
      "{every, plural, =1 {каждую секунду} one {каждые "
      & "{every} секунду} few {каждые {every} секунды} many "
      & "{каждые {every} секунд} other {каждые {every} "
      & "секунды}}");
   P ("recurrence.minute",
      "{every, plural, =1 {каждую минуту} one {каждые "
      & "{every} минуту} few {каждые {every} минуты} many "
      & "{каждые {every} минут} other {каждые {every} "
      & "минуты}}");
   P ("recurrence.hour",
      "{every, plural, =1 {каждый час} one {каждые {every} "
      & "час} few {каждые {every} часа} many {каждые {every} "
      & "часов} other {каждые {every} часа}}");
   P ("recurrence.day",
      "{every, plural, =1 {каждый день} one {каждые {every} "
      & "день} few {каждые {every} дня} many {каждые {every} "
      & "дней} other {каждые {every} дня}}");
   P ("recurrence.week",
      "{every, plural, =1 {каждую неделю} one {каждые "
      & "{every} неделю} few {каждые {every} недели} many "
      & "{каждые {every} недель} other {каждые {every} "
      & "недели}}");
   P ("recurrence.month",
      "{every, plural, =1 {каждый месяц} one {каждые {every} "
      & "месяц} few {каждые {every} месяца} many {каждые "
      & "{every} месяцев} other {каждые {every} месяца}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {каждый квартал} one {каждые "
      & "{every} квартал} few {каждые {every} квартала} "
      & "many {каждые {every} кварталов} other {каждые "
      & "{every} квартала}}");
   P ("recurrence.year",
      "{every, plural, =1 {каждый год} one {каждые {every} "
      & "год} few {каждые {every} года} many {каждые {every} "
      & "лет} other {каждые {every} года}}");
   P ("cache_summary.empty", "кэш: запросов нет");
   P ("cache_summary",
      "кэш: попаданий {hits}, промахов {misses}, доля "
      & "попаданий {rate} %");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} few {{few}} many {{many}} other "
      & "{{genitive_one}}}: изменено {changed}, добавлено "
      & "{added}, удалено {removed}");
   P ("field_diff", "{field}: было {before}, стало {after}");
   P ("field_added", "{field}: добавлено значение {value}");
   P ("field_removed", "{field}: удалено (было {value})");
   P ("field_unchanged", "{field}: без изменений ({value})");
   P ("number_comparison.equal", "{current} равно {baseline}");
   P ("number_comparison.higher", "{current} на {quantity} больше, чем {baseline}");
   P ("number_comparison.lower", "{current} на {quantity} меньше, чем {baseline}");
   P ("percent_comparison.equal", "{current} равно {baseline}");
   P ("percent_comparison.higher", "{current} на {quantity} больше, чем {baseline}");
   P ("percent_comparison.lower", "{current} на {quantity} меньше, чем {baseline}");
   P ("file_size_comparison.same", "{current} того же размера, что и {baseline}");
   P ("file_size_comparison.larger", "{current} на {quantity} больше, чем {baseline}");
   P ("file_size_comparison.smaller", "{current} на {quantity} меньше, чем {baseline}");
   P ("date_comparison.same", "{current} — та же дата, что и {baseline}");
   P ("queue_summary", "очередь: {details}");
   P ("domain_summary",
      "{domain, select, queue {очередь} job {задание} run "
      & "{запуск} cache {кэш} sync {синхронизация} import "
      & "{импорт} export {экспорт} other {{domain}}} — {state, "
      & "select, queued {в очереди} running {выполняется} "
      & "waiting {ожидание} paused {на паузе} complete "
      & "{завершено} failed {ошибка} stale "
      & "{неактуально} skipped {пропущено} other "
      & "{{state}}}: {details}");
   P ("summary.none", "нет {genitive_other}");
   P ("summary.completed",
      "завершено: {count} {count, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}");
   P ("summary.completed_of",
      "завершено {count} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("summary.failed", "с ошибкой: {count}");
   P ("summary.queued",
      "в очереди: {count} {count, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}");
   P ("summary.running", "выполняется: {count}");
   P ("summary.complete", "завершено: {count}");
   P ("backup.backup_running", "выполняется резервное копирование");
   P ("backup.backup_completed", "резервное копирование завершено");
   P ("backup.backup_failed", "ошибка резервного копирования");
   P ("backup.backup_stale", "резервная копия устарела");
   P ("incident.incident_investigating", "расследование инцидента");
   P ("incident.incident_identified", "инцидент выявлен");
   P ("incident.incident_mitigated", "инцидент локализован");
   P ("incident.incident_resolved", "инцидент устранён");
   P ("release.release_drafting", "подготовка релиза");
   P ("release.release_ready", "релиз готов");
   P ("release.release_published", "релиз опубликован");
   P ("release.release_rolled_back", "релиз откачен");
   P ("audit.audit_created", "запись аудита создана");
   P ("audit.audit_updated", "запись аудита обновлена");
   P ("audit.audit_deleted", "запись аудита удалена");
   P ("audit.audit_restored", "запись аудита восстановлена");
   P ("flag.flag_enabled", "флаг функции включён");
   P ("flag.flag_disabled", "флаг функции отключён");
   P ("flag.flag_rolling_out", "флаг функции развёртывается");
   P ("flag.flag_rolled_back", "флаг функции откачен");
   P ("webhook.webhook_pending", "вебхук ожидает отправки");
   P ("webhook.webhook_delivered", "вебхук доставлен");
   P ("webhook.webhook_failed", "ошибка вебхука");
   P ("webhook.webhook_retrying", "повторная отправка вебхука");
   P ("api_key.api_key_active", "API-ключ активен");
   P ("api_key.api_key_revoked", "API-ключ отозван");
   P ("api_key.api_key_expired", "срок действия API-ключа истёк");
   P ("api_key.api_key_rotated", "API-ключ заменён");
   P ("quota.quota_available", "квота доступна");
   P ("quota.quota_near_limit", "квота почти исчерпана");
   P ("quota.quota_exceeded", "квота превышена");
   P ("quota.quota_reset", "квота сброшена");
   P ("invoice.invoice_draft", "черновик счёта");
   P ("invoice.invoice_sent", "счёт отправлен");
   P ("invoice.invoice_paid", "счёт оплачен");
   P ("invoice.invoice_refunded", "средства по счёту возвращены");
   P ("invoice.invoice_overdue", "счёт просрочен");
   P ("invoice.refund_failed", "ошибка возврата средств");
   P ("page_navigation.only", "единственная страница");
   P ("page_navigation.first", "первая страница, доступна следующая");
   P ("page_navigation.last",
      "последняя страница, доступна "
      & "предыдущая");
   P ("page_navigation.middle", "доступны предыдущая и следующая");
   P ("end_of_week", "конец недели");
   P ("end_of_month", "конец месяца");
   P ("end_of_quarter", "конец квартала");
   P ("time_of_day.night", "ночь");
   P ("time_of_day.morning", "утро");
   P ("time_of_day.afternoon", "день");
   P ("time_of_day.evening", "вечер");
   P ("calendar_difference.same_day", "в тот же день");
   P ("calendar_difference.zero", "0 дней");
   P ("queue_summary.empty", "очередь пуста");
   P ("access.allowed", "разрешено");
   P ("access.denied", "запрещено");
   P ("access.owner", "владелец");
   P ("access.admin", "администратор");
   P ("access.viewer", "читатель");
   P ("access.editor", "редактор");
   P ("auth.signed_in", "вход выполнен");
   P ("auth.signed_out", "выход выполнен");
   P ("auth.session_expired", "сеанс истёк");
   P ("auth.locked", "заблокировано");
   P ("auth.two_factor_required",
      "требуется двухфакторная "
      & "аутентификация");
   P ("billing.trialing", "пробный период");
   P ("billing.payment_due", "ожидается оплата");
   P ("billing.payment_failed", "ошибка оплаты");
   P ("billing.paid", "оплачено");
   P ("billing.past_due", "просрочено");
   P ("billing.canceled", "отменено");
   P ("ci.pipeline_pending", "конвейер ожидает");
   P ("ci.pipeline_running", "конвейер выполняется");
   P ("ci.pipeline_passed", "конвейер пройден");
   P ("ci.pipeline_failed", "сбой конвейера");
   P ("ci.review_required", "требуется проверка");
   P ("ci.deploy_blocked", "развёртывание заблокировано");
   P ("collaboration.active_now", "в сети");
   P ("collaboration.away", "нет на месте");
   P ("collaboration.do_not_disturb", "не беспокоить");
   P ("collaboration.typing", "печатает");
   P ("collaboration.viewing", "просматривает");
   P ("collaboration.editing", "редактирует");
   P ("deployment.deploying", "развёртывание");
   P ("deployment.deployed", "развёрнуто");
   P ("deployment.rolling_back", "откат");
   P ("deployment.rolled_back", "откачено");
   P ("deployment.build_failed", "ошибка сборки");
   P ("deployment.checks_passed", "проверки пройдены");
   P ("empty.no_items", "нет элементов");
   P ("empty.no_results", "нет результатов");
   P ("empty.no_messages", "нет сообщений");
   P ("empty.no_selection", "ничего не выбрано");
   P ("empty.nothing_to_show", "нечего показать");
   P ("file.uploading", "отправка");
   P ("file.downloading", "скачивание");
   P ("file.copying", "копирование");
   P ("file.moving", "перемещение");
   P ("file.deleting", "удаление");
   P ("file.deleted", "удалено");
   P ("file.restoring", "восстановление");
   P ("file.synced", "синхронизировано");
   P ("form.valid_input", "корректное значение");
   P ("form.invalid_input", "некорректное значение");
   P ("form.dirty", "изменено");
   P ("form.pristine", "без изменений");
   P ("form.submitted", "отправлено");
   P ("form.submission_failed", "ошибка отправки");
   P ("health.healthy", "в норме");
   P ("health.degraded", "работает с перебоями");
   P ("health.unhealthy", "неисправно");
   P ("health.incident", "инцидент");
   P ("health.maintenance", "техобслуживание");
   P ("health.recovering", "восстановление");
   P ("issue.open", "открыто");
   P ("issue.closed", "закрыто");
   P ("issue.reopened", "открыто повторно");
   P ("issue.assigned", "назначено");
   P ("issue.unassigned", "не назначено");
   P ("issue.merged", "слито");
   P ("network.offline", "не в сети");
   P ("network.online", "в сети");
   P ("network.connecting", "подключение");
   P ("network.syncing", "синхронизация");
   P ("network.sync_failed", "ошибка синхронизации");
   P ("network.permission_denied", "доступ запрещён");
   P ("network.read_only", "только чтение");
   P ("notification.unread", "не прочитано");
   P ("notification.read", "прочитано");
   P ("notification.muted", "без звука");
   P ("notification.snoozed", "отложено");
   P ("notification.sent", "отправлено");
   P ("notification.delivered", "доставлено");
   P ("payment.payment_authorized", "платёж авторизован");
   P ("payment.payment_captured", "платёж проведён");
   P ("payment.payment_refunded", "платёж возвращён");
   P ("payment.payment_disputed", "платёж оспорен");
   P ("payment.payment_requires_action", "платёж требует действий");
   P ("payment.payment_expired", "срок платежа истёк");
   P ("ui.empty", "пусто");
   P ("ui.loading", "загрузка");
   P ("ui.saving", "сохранение");
   P ("ui.saved", "сохранено");
   P ("ui.unsaved", "не сохранено");
   P ("ui.retrying", "повторная попытка");
   P ("ui.paused", "приостановлено");
   P ("ui.complete", "завершено");
   P ("ui.failed", "ошибка");
   P ("ui.due_soon", "скоро срок");
   P ("ui.overdue", "просрочено");
   P ("ui.last_seen", "последняя активность");
   P ("ui.updated_just_now", "обновлено только что");
   P ("queue.queued", "в очереди");
   P ("queue.running", "выполняется");
   P ("queue.waiting", "ожидание");
   P ("queue.blocked", "заблокировано");
   P ("queue.canceled_job", "задание отменено");
   P ("queue.completed_job", "задание выполнено");
   P ("search.filtering", "фильтрация");
   P ("search.filtered", "отфильтровано");
   P ("search.no_matches", "совпадений нет");
   P ("search.search_ready", "поиск готов");
   P ("search.search_failed", "ошибка поиска");
   P ("search.query_too_short", "слишком короткий запрос");
   P ("security.secure", "защищено");
   P ("security.insecure", "не защищено");
   P ("security.vulnerable", "уязвимо");
   P ("security.encrypted", "зашифровано");
   P ("security.unencrypted", "не зашифровано");
   P ("security.token_expired", "срок действия токена истёк");
   P ("sync.sync_idle", "синхронизация не выполняется");
   P ("sync.syncing_now", "идёт синхронизация");
   P ("sync.sync_queued", "синхронизация в очереди");
   P ("sync.sync_conflict", "конфликт синхронизации");
   P ("sync.sync_complete", "синхронизация завершена");
   P ("sync.sync_error", "ошибка синхронизации");
   P ("task.todo", "к выполнению");
   P ("task.in_progress", "в работе");
   P ("task.done", "готово");
   P ("task.skipped", "пропущено");
   P ("task.blocked_task", "заблокировано");
   P ("task.waiting_on", "ожидает");
   P ("ticket.ticket_new", "новая заявка");
   P ("ticket.ticket_open", "заявка открыта");
   P ("ticket.ticket_waiting", "заявка ожидает");
   P ("ticket.ticket_escalated", "заявка эскалирована");
   P ("ticket.ticket_resolved", "заявка решена");
   P ("ticket.ticket_closed", "заявка закрыта");
   P ("transfer.importing", "импорт");
   P ("transfer.imported", "импортировано");
   P ("transfer.import_failed", "ошибка импорта");
   P ("transfer.exporting", "экспорт");
   P ("transfer.exported", "экспортировано");
   P ("transfer.export_failed", "ошибка экспорта");
   P ("validation.required", "обязательно");
   P ("validation.optional", "необязательно");
   P ("validation.invalid", "некорректно");
   P ("validation.too_short", "слишком коротко");
   P ("validation.too_long", "слишком длинно");
   P ("validation.out_of_range", "вне допустимого диапазона");
   P ("validation.already_exists", "уже существует");
   P ("workflow.draft", "черновик");
   P ("workflow.in_review", "на проверке");
   P ("workflow.approved", "одобрено");
   P ("workflow.rejected", "отклонено");
   P ("workflow.published", "опубликовано");
   P ("workflow.archived", "в архиве");
   P ("database.database_online", "база данных доступна");
   P ("database.database_offline", "база данных недоступна");
   P ("database.database_degraded", "база данных работает с перебоями");
   P ("database.database_migrating", "миграция базы данных");
   P ("database.database_migration_failed", "ошибка миграции базы данных");
   P ("database.database_replicating", "репликация базы данных");
   P ("database.database_replication_lagging", "отставание репликации базы данных");
   P ("database.database_backup_running",
      "выполняется резервное копирование "
      & "базы данных");
   P ("database.database_backup_failed",
      "ошибка резервного копирования базы "
      & "данных");
   P ("calendar_difference.case.future", "accusative");
   P ("calendar_difference.case.past", "accusative");
   P ("date_comparison.after", "{current} на {quantity} позже, чем {baseline}");
   P ("date_comparison.before", "{current} на {quantity} раньше, чем {baseline}");
   P ("date_comparison.case.after", "accusative");
   P ("date_comparison.case.before", "accusative");
   P ("count",
      "{count, plural, one {# {one}} few {# {genitive_one}} many {# "
      & "{genitive_other}} other {# {genitive_one}}}");
   P ("noun",
      "{count, plural, one {{one}} few {{genitive_one}} many "
      & "{{genitive_other}} other {{genitive_one}}}");
   P ("noun.accusative",
      "{count, plural, one {{accusative_one}} few {{genitive_one}} many "
      & "{{genitive_other}} other {{genitive_one}}}");
   P ("number_comparison.case", "accusative");
   P ("times_noun",
      "{count, plural, =0 {{other}: ни разу} =1 {{one}: один "
      & "раз} =2 {{other}: дважды} one {{other}: {count} раз} few "
      & "{{other}: {count} раза} many {{other}: {count} раз} other "
      & "{{other}: {count} раза}}");
   P ("availability.all",
      "доступно {available} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("availability.none", "нет доступных {genitive_other}");
   P ("availability.partial",
      "доступно {available} из {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}, недоступно {unavailable}");
   P ("operation_progress", "{name} — {state}: {details}");
   P ("operation.queued", "в очереди");
   P ("operation.running", "выполняется");
   P ("operation.blocked", "заблокировано");
   P ("operation.retrying", "повторная попытка");
   P ("operation.succeeded", "успешно");
   P ("operation.partially_succeeded", "частично успешно");
   P ("operation.failed", "ошибка");
   P ("operation.canceled", "отменено");
   P ("operation.skipped", "пропущено");
   P ("operation.stale", "устарело");
   P ("operation.unknown_state", "неизвестно");
   P ("operation.last_success", "{name} — последний успешный запуск: {time}");
   P ("operation.next_retry", "{name} — следующая попытка: {time}");
   P ("operation.stale_run", "{name} — не обновлялось {time}");
   P ("summary.skipped", "пропущено: {count}");
   P ("summary.retried", "повторено: {count}");
   P ("summary.canceled", "отменено: {count}");
   P ("system.service.operational", "работает");
   P ("system.service.degraded", "снижена производительность");
   P ("system.service.partial_outage", "частичный сбой");
   P ("system.service.major_outage", "серьёзный сбой");
   P ("system.service.maintenance", "на обслуживании");
   P ("system.service.unknown", "статус сервиса неизвестен");
   P ("system.health.healthy", "в норме");
   P ("system.health.warning", "предупреждение");
   P ("system.health.critical", "критическое состояние");
   P ("system.health.unavailable", "недоступен");
   P ("system.health.unknown_health", "состояние неизвестно");
   P ("system.readiness.ready", "готов");
   P ("system.readiness.not_ready", "не готов");
   P ("system.readiness.starting", "запускается");
   P ("system.readiness.draining", "вывод из работы");
   P ("system.readiness.stopped", "остановлен");
   P ("system.readiness.unknown_readiness", "готовность неизвестна");
   P ("system.component.online", "в сети");
   P ("system.component.offline", "не в сети");
   P ("system.component.starting", "запускается");
   P ("system.component.stopping", "останавливается");
   P ("system.component.restarting", "перезапускается");
   P ("system.component.unknown", "статус компонента неизвестен");
   P ("system.check.passing", "пройдена");
   P ("system.check.failing", "не пройдена");
   P ("system.check.warning", "предупреждение");
   P ("system.check.skipped", "пропущена");
   P ("system.check.timed_out", "превышено время ожидания");
   P ("system.check.unknown", "статус проверки неизвестен");
   P ("system.incident.investigating", "расследуется");
   P ("system.incident.identified", "причина установлена");
   P ("system.incident.monitoring", "наблюдение");
   P ("system.incident.resolved", "устранено");
   P ("system.incident.scheduled_maintenance", "плановое обслуживание");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "проверка {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {нет компонентов} one {{count} "
      & "компонент} few {{count} компонента} many {{count} "
      & "компонентов} other {{count} компонента}}");
   P ("system.count.checks",
      "{count, plural, =0 {нет проверок} one {{count} "
      & "проверка} few {{count} проверки} many {{count} "
      & "проверок} other {{count} проверки}}");
   P ("system.count.incidents",
      "{count, plural, =0 {нет инцидентов} one {{count} "
      & "инцидент} few {{count} инцидента} many {{count} "
      & "инцидентов} other {{count} инцидента}}");
   P ("system.uptime", "время безотказной работы: {measure}");
   P ("system.latency", "задержка: {measure}");
   P ("system.maintenance_window", "окно обслуживания: {time}");
   P ("system.last_checked", "последняя проверка: {time}");
   P ("system.http.informational", "информационный ответ");
   P ("system.http.successful", "успешный ответ");
   P ("system.http.redirection", "перенаправление");
   P ("system.http.client_error", "ошибка клиента");
   P ("system.http.server_error", "ошибка сервера");
   P ("system.exit.success", "код выхода {code}: успех");
   P ("system.exit.failure", "код выхода {code}: сбой");
   P ("system.exit.usage_error", "код выхода {code}: ошибка использования");
   P ("system.exit.not_executable",
      "код выхода {code}: команда не является "
      & "исполняемой");
   P ("system.exit.not_found", "код выхода {code}: команда не найдена");
   P ("system.exit.invalid_argument",
      "код выхода {code}: недопустимый аргумент "
      & "exit");
   P ("system.exit.signal",
      "код выхода {code}: завершение по сигналу "
      & "{signal}");
   P ("validation.problem.required", "{field}: обязательное поле");
   P ("validation.problem.minimum", "{field}: значение меньше минимального");
   P ("validation.problem.maximum", "{field}: значение больше максимального");
   P ("validation.problem.range",
      "{field}: значение вне допустимого "
      & "диапазона");
   P ("validation.problem.pattern", "{field}: не соответствует шаблону");
   P ("validation.problem.choice",
      "{field}: значение должно быть одним из "
      & "допустимых вариантов");
   P ("validation.problem.dependency", "{field}: зависит от другого поля");
   P ("validation.problem.custom", "{field}: недопустимое значение");
   P ("validation.constraint.no_relation",
      "{field}: ожидается допустимое значение "
      & "{value}");
   P ("validation.constraint.less_than",
      "{field}: значение должно быть меньше, чем "
      & "{value}");
   P ("validation.constraint.less_or_equal",
      "{field}: значение должно быть не больше, "
      & "чем {value}");
   P ("validation.constraint.greater_than",
      "{field}: значение должно быть больше, чем "
      & "{value}");
   P ("validation.constraint.greater_or_equal",
      "{field}: значение должно быть не меньше, "
      & "чем {value}");
   P ("validation.constraint.equal_to", "{field}: значение должно быть равно {value}");
   P ("validation.constraint.not_equal_to",
      "{field}: значение не должно быть равно "
      & "{value}");
   P ("validation.constraint.before_field",
      "{field}: значение должно быть раньше, чем "
      & "{value}");
   P ("validation.constraint.after_field",
      "{field}: значение должно быть позже, чем "
      & "{value}");
   P ("validation.choices", "{field}: допустимые значения: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, получено: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, повторная попытка через {time}");
   P ("net_diagnostic.dns", "{endpoint}: не удалось выполнить DNS-запрос");
   P ("net_diagnostic.tcp",
      "{endpoint}: не удалось установить "
      & "TCP-соединение");
   P ("net_diagnostic.tls", "{endpoint}: ошибка TLS-сертификата");
   P ("net_diagnostic.http", "{endpoint}: ошибка HTTP-запроса");
   P ("net_diagnostic.proxy", "{endpoint}: ошибка прокси-сервера");
   P ("net_diagnostic.timeout", "{endpoint}: превышено время ожидания");
   P ("net_diagnostic.reset", "{endpoint}: соединение сброшено");
   P ("net_diagnostic.unknown_network", "{endpoint}: неизвестная проблема сети");
   P ("progress.state.not_started", "не начато");
   P ("progress.state.running", "выполняется");
   P ("progress.state.stalled", "зависло");
   P ("progress.state.retrying", "повторная попытка");
   P ("progress.state.complete", "завершено");
   P ("progress.state.failed", "сбой");
   P ("progress.of",
      "{subject}: выполнено {done} из {total} ({percent} %), "
      & "{state}");
   P ("progress.done", "{subject}: выполнено {done}, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {элемент} few "
      & "{элемента} many {элементов} other "
      & "{элемента}}, {unique} {unique, plural, one "
      & "{уникальное значение} few {уникальных "
      & "значения} many {уникальных значений} other "
      & "{уникального значения}}, {duplicates} {duplicates, "
      & "plural, one {дубликат} few {дубликата} many "
      & "{дубликатов} other {дубликата}}, {outliers} "
      & "{outliers, plural, one {выброс} few {выброса} many "
      & "{выбросов} other {выброса}}");
   P ("top_frequency",
      "{name}: чаще всего {value} ({count} {count, plural, one "
      & "{раз} few {раза} many {раз} other {раза}})");
   P ("calendar_date.fiscal_year", "ФГ {year}");
   P ("calendar_date.fiscal_quarter", "ФГ {year}, {part}-й кв.");
   P ("calendar_date.fiscal_half", "ФГ {year}, {part}-е полуг.");
   P ("calendar_date.fiscal_year_end", "конец ФГ {year}");
   P ("calendar_date.semester", "{part}-й сем. {year}");
   P ("calendar_date.half_year", "{part}-е полуг. {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {первое полугодие {year} г.} other "
      & "{второе полугодие {year} г.}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} (начало)} mid {{text} "
      & "(середина)} other {{text} (конец)}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text} (начало)} mid {{text} "
      & "(середина)} other {{text} (конец)}}");
   P ("calendar_range.weekend.last", "прошлые выходные");
   P ("calendar_range.weekend.this", "эти выходные");
   P ("calendar_range.weekend.next", "следующие выходные");
   P ("calendar_range.weekend_of", "выходные {date}");
   P ("calendar_range.week.last", "прошлая неделя");
   P ("calendar_range.week.this", "эта неделя");
   P ("calendar_range.week.next", "следующая неделя");
   P ("calendar_range.week_of", "неделя с {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "продолжить");
   P ("http.reason.101", "переключение протоколов");
   P ("http.reason.102", "идёт обработка");
   P ("http.reason.103", "ранние подсказки");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "создано");
   P ("http.reason.202", "принято");
   P ("http.reason.203",
      "информация не из авторитетного "
      & "источника");
   P ("http.reason.204", "нет содержимого");
   P ("http.reason.205", "сбросить содержимое");
   P ("http.reason.206", "частичное содержимое");
   P ("http.reason.207", "многостатусный ответ");
   P ("http.reason.208", "уже сообщалось");
   P ("http.reason.226", "использовано IM");
   P ("http.reason.300", "множество выборов");
   P ("http.reason.301", "перемещено навсегда");
   P ("http.reason.302", "найдено");
   P ("http.reason.303", "смотреть другое");
   P ("http.reason.304", "не изменялось");
   P ("http.reason.305", "использовать прокси");
   P ("http.reason.307", "временное перенаправление");
   P ("http.reason.308", "постоянное перенаправление");
   P ("http.reason.400", "неверный запрос");
   P ("http.reason.401", "не авторизован");
   P ("http.reason.402", "необходима оплата");
   P ("http.reason.403", "запрещено");
   P ("http.reason.404", "не найдено");
   P ("http.reason.405", "метод не разрешён");
   P ("http.reason.406", "неприемлемо");
   P ("http.reason.407", "требуется аутентификация прокси");
   P ("http.reason.408", "истекло время ожидания запроса");
   P ("http.reason.409", "конфликт");
   P ("http.reason.410", "удалено");
   P ("http.reason.411", "требуется длина");
   P ("http.reason.412", "условие ложно");
   P ("http.reason.413", "содержимое слишком велико");
   P ("http.reason.414", "URI слишком длинный");
   P ("http.reason.415", "неподдерживаемый тип данных");
   P ("http.reason.416", "диапазон недостижим");
   P ("http.reason.417", "ожидание не оправдалось");
   P ("http.reason.418", "я — чайник");
   P ("http.reason.421", "неверно адресованный запрос");
   P ("http.reason.422", "необрабатываемое содержимое");
   P ("http.reason.423", "заблокировано");
   P ("http.reason.424", "невыполненная зависимость");
   P ("http.reason.425", "слишком рано");
   P ("http.reason.426", "требуется обновление");
   P ("http.reason.428", "требуется предусловие");
   P ("http.reason.429", "слишком много запросов");
   P ("http.reason.431",
      "поля заголовка запроса слишком "
      & "большие");
   P ("http.reason.451", "недоступно по юридическим причинам");
   P ("http.reason.500", "внутренняя ошибка сервера");
   P ("http.reason.501", "не реализовано");
   P ("http.reason.502", "плохой шлюз");
   P ("http.reason.503", "сервис недоступен");
   P ("http.reason.504", "шлюз не отвечает");
   P ("http.reason.505", "версия HTTP не поддерживается");
   P ("http.reason.506", "вариант тоже проводит согласование");
   P ("http.reason.507", "переполнение хранилища");
   P ("http.reason.508", "обнаружен цикл");
   P ("http.reason.510", "не расширено");
   P ("http.reason.511", "требуется сетевая аутентификация");
   P ("errno.reason.0", "выполнено");
   P ("errno.reason.1", "операция не позволена");
   P ("errno.reason.2", "нет такого файла или каталога");
   P ("errno.reason.3", "нет такого процесса");
   P ("errno.reason.4", "прерван системный вызов");
   P ("errno.reason.5", "ошибка ввода/вывода");
   P ("errno.reason.6", "нет такого устройства или адреса");
   P ("errno.reason.9", "неправильный дескриптор файла");
   P ("errno.reason.11", "ресурс временно недоступен");
   P ("errno.reason.12", "невозможно выделить память");
   P ("errno.reason.13", "отказано в доступе");
   P ("errno.reason.17", "файл существует");
   P ("errno.reason.20", "это не каталог");
   P ("errno.reason.21", "это каталог");
   P ("errno.reason.22", "недопустимый аргумент");
   P ("errno.reason.24", "слишком много открытых файлов");
   P ("errno.reason.28",
      "на устройстве не осталось свободного "
      & "места");
   P ("errno.reason.32", "обрыв канала");
   P ("errno.reason.98", "адрес уже используется");
   P ("errno.reason.110", "время ожидания соединения истекло");
   P ("errno.reason.111", "в соединении отказано");
   P ("signal.reason.1", "обрыв терминальной линии");
   P ("signal.reason.2", "прерывание");
   P ("signal.reason.3", "выход");
   P ("signal.reason.4", "недопустимая инструкция");
   P ("signal.reason.5", "ловушка трассировки/останова");
   P ("signal.reason.6", "аварийный останов");
   P ("signal.reason.7", "ошибка шины");
   P ("signal.reason.8",
      "исключение в операции с плавающей "
      & "точкой");
   P ("signal.reason.9", "убито");
   P ("signal.reason.10", "определяемый пользователем сигнал 1");
   P ("signal.reason.11", "ошибка сегментирования");
   P ("signal.reason.12", "определяемый пользователем сигнал 2");
   P ("signal.reason.13", "обрыв канала");
   P ("signal.reason.14", "сигнал таймера");
   P ("signal.reason.15", "завершено");
   P ("signal.reason.17", "дочерний процесс завершился");
   P ("signal.reason.18", "продолжено");
   P ("signal.reason.19", "остановлено (сигнал)");
   P ("signal.reason.20", "остановлено");
   P ("signal.reason.28", "окно изменилось");
   P ("sqlstate.reason.00", "успешное завершение");
   P ("sqlstate.reason.01", "предупреждение");
   P ("sqlstate.reason.02", "нет данных");
   P ("sqlstate.reason.08", "исключение подключения");
   P ("sqlstate.reason.0a", "функциональность не поддерживается");
   P ("sqlstate.reason.22", "исключение в данных");
   P ("sqlstate.reason.23", "нарушение ограничения целостности");
   P ("sqlstate.reason.24", "неверное состояние курсора");
   P ("sqlstate.reason.25", "неверное состояние транзакции");
   P ("sqlstate.reason.28", "неверное указание авторизации");
   P ("sqlstate.reason.2d", "неверное завершение транзакции");
   P ("sqlstate.reason.3d", "неверное имя каталога");
   P ("sqlstate.reason.3f", "неверное имя схемы");
   P ("sqlstate.reason.40", "откат транзакции");
   P ("sqlstate.reason.42",
      "синтаксическая ошибка или нарушение "
      & "правила доступа");
   P ("sqlstate.reason.53", "нехватка ресурсов");
   P ("sqlstate.reason.54", "превышен предел программы");
   P ("sqlstate.reason.55", "объект не в требуемом состоянии");
   P ("sqlstate.reason.57", "вмешательство оператора");
   P ("sqlstate.reason.58", "системная ошибка");
   P ("sqlstate.reason.hv", "ошибка обёртки сторонних данных");
   P ("sqlstate.reason.p0", "ошибка PL/pgSQL");
   P ("sqlstate.reason.xx", "внутренняя ошибка");
   P ("system.signal_numbered", "сигнал {number} {name} {reason}");
   P ("http.reason.unknown", "неизвестный статус");
   P ("errno.reason.unknown", "неизвестная ошибка");
   P ("signal.reason.unknown", "неизвестный сигнал");
   P ("sqlstate.reason.unknown", "неизвестный класс SQLSTATE");
   P ("diff.changed", "различия {path}: изменено с {before} на {after}");
   P ("diff.added", "различия {path}: добавлено {after}");
   P ("diff.removed", "различия {path}: удалено {before}");
   P ("diff.unchanged", "различия {path}: без изменений");
   P ("diff.redacted",
      "различия {path}: изменено; значения "
      & "скрыты");
   P ("validation.result",
      "результат проверки: {fields} {fields, plural, one "
      & "{поле} few {поля} many {полей} other {поля}}, "
      & "{errors} {errors, plural, one {ошибка} few {ошибки} many "
      & "{ошибок} other {ошибки}}, {warnings} {warnings, plural, "
      & "one {предупреждение} few {предупреждения} "
      & "many {предупреждений} other "
      & "{предупреждения}}, {required} {required, plural, one "
      & "{обязательное поле} few {обязательных "
      & "поля} many {обязательных полей} other "
      & "{обязательного поля}}, {hidden} {hidden, plural, one "
      & "{скрытая проблема} few {скрытые "
      & "проблемы} many {скрытых проблем} other "
      & "{скрытой проблемы}}");
   P ("file.kind.plain", "файл");
   P ("file.kind.directory", "каталог");
   P ("file.kind.archive", "архив");
   P ("file.kind.compressed", "сжатый файл");
   P ("file.kind.image", "изображение");
   P ("file.kind.script", "скрипт");
   P ("file.kind.executable", "исполняемый файл");
   P ("file.kind.unknown", "неизвестный файл");
   P ("file.metadata", "файл {name}: {kind}");
   P ("file.checksum", "{text}, контрольная сумма {checksum}");
   P ("file.signature_match",
      "сигнатура файла {name}: {kind}, "
      & "соответствует расширению");
   P ("file.signature_mismatch",
      "сигнатура файла {name}: по расширению — "
      & "{expected}, по содержимому — {actual}");
   P ("network_event.connecting", "подключение");
   P ("network_event.connected", "подключено");
   P ("network_event.redirected", "перенаправлено");
   P ("network_event.retrying", "повторная попытка");
   P ("network_event.rate_limited", "ограничение частоты");
   P ("network_event.tls_failed", "ошибка TLS");
   P ("network_event.stalled", "нет прогресса");
   P ("network_event.complete", "завершено");
   P ("network_event.failed", "сбой");
   P ("network.session", "сеть {endpoint}: {state}");
   P ("diff_node.field", "поле");
   P ("diff_node.object", "объект");
   P ("diff_node.list", "список");
   P ("diff.node",
      "узел различий {path}: {kind}, {count} {count, plural, one "
      & "{изменение} few {изменения} many "
      & "{изменений} other {изменения}}");
   P ("checksum.not_checked", "контрольная сумма не проверена");
   P ("checksum.valid", "контрольная сумма верна");
   P ("checksum.mismatch", "контрольная сумма не совпадает");
   P ("checksum.missing", "контрольная сумма отсутствует");
   P ("product_code", "код товара {kind}: {value}, {state}");
   P ("time_zone.utc", "часовой пояс: UTC");
   P ("time_zone.offset", "часовой пояс: {offset}");
   P ("time_zone.named", "часовой пояс: {name} ({offset})");
   P ("time_zone.local", "часовой пояс: местное время");
   P ("time_zone.unknown", "часовой пояс: неизвестный пояс");
   P ("time_zone.dst", "{text}, с переходом на летнее время");
   P ("zoned_time.plain", "время с поясом: {time} {offset}");
   P ("zoned_time.named", "время с поясом: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, неоднозначное местное время");
   P ("number.under", "ниже {value}");
   P ("number.up_to", "до {value}");
   P ("number.between", "между {low} и {high}");
   P ("number.range_words", "{low} – {high}");
   P ("number.uncertainty_words", "{value} плюс-минус {delta}");
   P ("number.range_inclusive", "от {low} до {high} включительно");
   P ("number.range_exclusive", "больше {low} и меньше {high}");
   P ("number.range_low_inclusive", "не меньше {low} и меньше {high}");
   P ("number.range_high_inclusive", "больше {low} и не больше {high}");
   P ("number.at_least", "не менее {value}");
   P ("number.more_than", "более {value}");
   P ("number.at_most", "не более {value}");
   P ("number.less_than", "менее {value}");
   P ("number.exactly", "ровно {value}");
   P ("number.within", "{value} в пределах {bounds}");
   P ("number.below", "{value} ниже диапазона {bounds}");
   P ("number.above", "{value} выше диапазона {bounds}");
   P ("number.per", "{numerator} на {denominator}");
   P ("number.one_in", "1 из {whole}");
   P ("number.out_of", "{value} из {whole}");
   P ("number.unchanged", "без изменений");
   P ("number.change_up", "рост на {quantity}");
   P ("number.change_down", "снижение на {quantity}");
   P ("number.change_more", "на {quantity} {tail} больше");
   P ("number.change_fewer", "на {quantity} {tail} меньше");
   P ("number.since", "{change} (начиная с: {since})");
   P ("duration.countdown", "осталось: {duration}");
   P ("duration.within", "в течение {duration}");
   P ("duration.next", "на {duration} вперёд");
   P ("duration.between", "от {low} до {high}");
   P ("duration.age", "возраст {duration}");
   P ("duration.stale_for", "не обновлялось {duration}");
   P ("duration.backup_age", "резервной копии {duration}");
   P ("duration.eta", "ожидается через {duration}");
   P ("duration.expires", "истекает {relative}");
   P ("duration.retrying", "повтор {relative}");
   P ("duration.modified", "изменено {relative}");
   P ("duration.synced", "синхронизировано {relative}");
   P ("duration.modified_now", "изменено только что");
   P ("duration.synced_now", "синхронизировано только что");
   P ("duration.natural.less_than_minute", "меньше минуты");
   P ("duration.natural.half_hour", "{case, select, genitive {получаса} other {полчаса}}");
   P ("duration.natural.about_half_hour", "около получаса");
   P ("duration.natural.about", "примерно {duration}");
   P ("duration.natural.almost", "почти {duration}");
   P ("duration.natural.over", "более {duration}");
   P ("duration.natural.just_over", "чуть более {duration}");
   P ("duration.natural.little_under", "чуть менее {duration}");
   P ("duration.natural.few",
      "{unit, select, second {{case, select, genitive {нескольких "
      & "секунд} other {несколько секунд}}} minute {{case, "
      & "select, genitive {нескольких минут} other "
      & "{несколько минут}}} hour {{case, select, genitive "
      & "{нескольких часов} other {несколько "
      & "часов}}} day {{case, select, genitive {нескольких "
      & "дней} other {несколько дней}}} week {{case, select, "
      & "genitive {нескольких недель} other {несколько "
      & "недель}}} month {{case, select, genitive {нескольких "
      & "месяцев} other {несколько месяцев}}} year "
      & "{{case, select, genitive {нескольких лет} other "
      & "{несколько лет}}} other {несколько}}");
   P ("duration.distance.past", "{duration} назад");
   P ("duration.distance.future", "через {duration}");
   P ("duration.case.within", "genitive");
   P ("duration.case.next", "accusative");
   P ("duration.case.between", "genitive");
   P ("duration.case.stale_for", "accusative");
   P ("duration.case.eta", "accusative");
   P ("duration.case.distance.future", "accusative");
   P ("duration.case.natural.over", "genitive");
   P ("duration.case.natural.just_over", "genitive");
   P ("duration.case.natural.little_under", "genitive");
   P ("geo.direction.north", "{style, select, short {С} other {север}}");
   P ("geo.direction.north_north_east",
      "{style, select, short {ССВ} other "
      & "{северо-северо-восток}}");
   P ("geo.direction.north_east", "{style, select, short {СВ} other {северо-восток}}");
   P ("geo.direction.east_north_east",
      "{style, select, short {ВСВ} other "
      & "{восток-северо-восток}}");
   P ("geo.direction.east", "{style, select, short {В} other {восток}}");
   P ("geo.direction.east_south_east",
      "{style, select, short {ВЮВ} other "
      & "{восток-юго-восток}}");
   P ("geo.direction.south_east", "{style, select, short {ЮВ} other {юго-восток}}");
   P ("geo.direction.south_south_east", "{style, select, short {ЮЮВ} other {юго-юго-восток}}");
   P ("geo.direction.south", "{style, select, short {Ю} other {юг}}");
   P ("geo.direction.south_south_west", "{style, select, short {ЮЮЗ} other {юго-юго-запад}}");
   P ("geo.direction.south_west", "{style, select, short {ЮЗ} other {юго-запад}}");
   P ("geo.direction.west_south_west", "{style, select, short {ЗЮЗ} other {запад-юго-запад}}");
   P ("geo.direction.west", "{style, select, short {З} other {запад}}");
   P ("geo.direction.west_north_west",
      "{style, select, short {ЗСЗ} other "
      & "{запад-северо-запад}}");
   P ("geo.direction.north_west", "{style, select, short {СЗ} other {северо-запад}}");
   P ("geo.direction.north_north_west",
      "{style, select, short {ССЗ} other "
      & "{северо-северо-запад}}");
   P ("geo.bearing", "{degrees} {direction}");
   P ("geo.distance_direction", "{distance} {direction}");
   P ("geo.about_distance_direction", "примерно {distance} {direction}");
   P ("geo.coordinate", "{latitude}, {longitude}");
   P ("geo.bounding_box", "юго-запад: {southwest}; северо-восток: {northeast}");
   P ("geo.inside_box", "внутри ограничивающей рамки");
   P ("geo.outside_box", "вне ограничивающей рамки");
   P ("number.about", "около {value}");
   P ("number.almost", "почти {value}");
   P ("number.over", "более {value}");
   P ("number.plus_minus", "{value} ± {delta}");
   P ("number.plus_minus_parenthesized", "{value} (± {delta})");
   Labels_1;
   Labels_2;
   Labels_3;
   Labels_4;
end Locale_Ru;
