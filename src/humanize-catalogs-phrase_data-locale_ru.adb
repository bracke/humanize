separate (Humanize.Catalogs.Phrase_Data)
function Locale_Ru return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("ru", Name, Template));
begin
   return
     P ("all_count",
          "всего {total} {total, plural, one {{one}} few {{few}} many "
          & "{{many}} other {{genitive_one}}}")
     & P ("filtered_count.none", "нет совпадающих {genitive_other}")
     & P ("filtered_count.all",
          "{total, plural, =1 {совпадает 1 {one}} one "
          & "{совпадают все {total} {one}} few {совпадают "
          & "все {total} {few}} many {совпадают все {total} {many}} "
          & "other {совпадают все {total} {genitive_one}}}")
     & P ("filtered_count.some",
          "{matching, plural, one {совпадает} other "
          & "{совпадают}} {matching} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("more_count", "показано {visible}, ещё +{remaining}")
     & P ("others_count", "{first} и ещё {remaining}")
     & P ("page_count", "страница {page} из {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{few}} many {{many}} other "
          & "{{genitive_one}}} на странице")
     & P ("pagination_range",
          "{first}–{last} из {total} {total, plural, one {{genitive_one}} few "
          & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("position_count", "{position} из {total}")
     & P ("selection_count",
          "выбрано {selected} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("showing_count",
          "показано {showing} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("validation_count",
          "{count, plural, =0 {нет {severity, select, error {ошибок} "
          & "warning {предупреждений} other {замечаний}}} "
          & "one {{count} {severity, select, error {ошибка} warning "
          & "{предупреждение} other {замечание}}} few "
          & "{{count} {severity, select, error {ошибки} warning "
          & "{предупреждения} other {замечания}}} many "
          & "{{count} {severity, select, error {ошибок} warning "
          & "{предупреждений} other {замечаний}}} other "
          & "{{count} {severity, select, error {ошибки} warning "
          & "{предупреждения} other {замечания}}}}")
     & P ("collection.empty", "нет {genitive_other}")
     & P ("collection.none_shown", "нет отображаемых {genitive_other}")
     & P ("collection.showing_hidden",
          "показано {visible} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}, скрыто {hidden}")
     & P ("collection.showing",
          "показано {visible} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("collection.shown_hidden",
          "показано: {visible} {visible, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{genitive_one}}}, скрыто: {hidden}")
     & P ("collection.shown",
          "показано: {visible} {visible, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{genitive_one}}}")
     & P ("collection.visible_out_of",
          "видно {visible} из {total} {total, plural, one {{genitive_one}} "
          & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}")
     & P ("complete_count", "выполнено {done} из {total}")
     & P ("percent_complete", "выполнено {percent} %")
     & P ("step_count", "шаг {step} из {total}")
     & P ("attempt_count", "попытка {attempt} из {total}")
     & P ("throughput_remaining",
          "{remaining, plural, one {{gender, select, masculine {остался} "
          & "feminine {осталась} neuter {осталось} other "
          & "{осталось}}} other {осталось}} {remaining} {remaining, "
          & "plural, one {{one}} few {{genitive_one}} many {{genitive_other}} other "
          & "{{genitive_one}}}, скорость {rate} {unit}/с")
     & P ("accessible_progress",
          "выполнено {done} из {total}, {percent} {percent, plural, "
          & "one {процент} few {процента} many {процентов} "
          & "other {процента}}")
     & P ("business_days",
          "{days} {days, plural, one {рабочий день} few "
          & "{рабочих дня} many {рабочих дней} other "
          & "{рабочего дня}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {рабочий час} few "
          & "{рабочих часа} many {рабочих часов} other "
          & "{рабочего часа}}")
     & P ("due.overdue",
          "просрочено на {days} {days, plural, one {день} few "
          & "{дня} many {дней} other {дня}}")
     & P ("due.today", "срок сегодня")
     & P ("due.tomorrow", "срок завтра")
     & P ("due.in",
          "срок через {days} {days, plural, one {день} few {дня} "
          & "many {дней} other {дня}}")
     & P ("calendar_difference.future", "через {difference}")
     & P ("calendar_difference.past", "{difference} назад")
     & P ("cpu_load", "загрузка ЦП {measure}")
     & P ("battery", "заряд батареи {measure}")
     & P ("screen_size", "экран {measure}")
     & P ("refresh_rate", "частота обновления {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value} {value, plural, one {процент} few {процента} "
          & "many {процентов} other {процента}}")
     & P ("recurrence.second",
          "{every, plural, =1 {каждую секунду} one {каждые "
          & "{every} секунду} few {каждые {every} секунды} many "
          & "{каждые {every} секунд} other {каждые {every} "
          & "секунды}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {каждую минуту} one {каждые "
          & "{every} минуту} few {каждые {every} минуты} many "
          & "{каждые {every} минут} other {каждые {every} "
          & "минуты}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {каждый час} one {каждые {every} "
          & "час} few {каждые {every} часа} many {каждые {every} "
          & "часов} other {каждые {every} часа}}")
     & P ("recurrence.day",
          "{every, plural, =1 {каждый день} one {каждые {every} "
          & "день} few {каждые {every} дня} many {каждые {every} "
          & "дней} other {каждые {every} дня}}")
     & P ("recurrence.week",
          "{every, plural, =1 {каждую неделю} one {каждые "
          & "{every} неделю} few {каждые {every} недели} many "
          & "{каждые {every} недель} other {каждые {every} "
          & "недели}}")
     & P ("recurrence.month",
          "{every, plural, =1 {каждый месяц} one {каждые {every} "
          & "месяц} few {каждые {every} месяца} many {каждые "
          & "{every} месяцев} other {каждые {every} месяца}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {каждый квартал} one {каждые "
          & "{every} квартал} few {каждые {every} квартала} "
          & "many {каждые {every} кварталов} other {каждые "
          & "{every} квартала}}")
     & P ("recurrence.year",
          "{every, plural, =1 {каждый год} one {каждые {every} "
          & "год} few {каждые {every} года} many {каждые {every} "
          & "лет} other {каждые {every} года}}")
     & P ("cache_summary.empty", "кэш: запросов нет")
     & P ("cache_summary",
          "кэш: попаданий {hits}, промахов {misses}, доля "
          & "попаданий {rate} %")
     & P ("field_change_summary",
          "{total} {total, plural, one {{one}} few {{few}} many {{many}} other "
          & "{{genitive_one}}}: изменено {changed}, добавлено "
          & "{added}, удалено {removed}")
     & P ("field_diff", "{field}: было {before}, стало {after}")
     & P ("field_added", "{field}: добавлено значение {value}")
     & P ("field_removed", "{field}: удалено (было {value})")
     & P ("field_unchanged", "{field}: без изменений ({value})")
     & P ("number_comparison.equal", "{current} равно {baseline}")
     & P ("number_comparison.higher", "{current} на {quantity} больше, чем {baseline}")
     & P ("number_comparison.lower", "{current} на {quantity} меньше, чем {baseline}")
     & P ("percent_comparison.equal", "{current} равно {baseline}")
     & P ("percent_comparison.higher", "{current} на {quantity} больше, чем {baseline}")
     & P ("percent_comparison.lower", "{current} на {quantity} меньше, чем {baseline}")
     & P ("file_size_comparison.same", "{current} того же размера, что и {baseline}")
     & P ("file_size_comparison.larger", "{current} на {quantity} больше, чем {baseline}")
     & P ("file_size_comparison.smaller", "{current} на {quantity} меньше, чем {baseline}")
     & P ("date_comparison.same", "{current} — та же дата, что и {baseline}")
     & P ("queue_summary", "очередь: {details}")
     & P ("domain_summary",
          "{domain, select, queue {очередь} job {задание} run "
          & "{запуск} cache {кэш} sync {синхронизация} import "
          & "{импорт} export {экспорт} other {{domain}}} — {state, "
          & "select, queued {в очереди} running {выполняется} "
          & "waiting {ожидание} paused {на паузе} complete "
          & "{завершено} failed {ошибка} stale "
          & "{неактуально} skipped {пропущено} other "
          & "{{state}}}: {details}")
     & P ("summary.none", "нет {genitive_other}")
     & P ("summary.completed",
          "завершено: {count} {count, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{genitive_one}}}")
     & P ("summary.completed_of",
          "завершено {count} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("summary.failed", "с ошибкой: {count}")
     & P ("summary.queued",
          "в очереди: {count} {count, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{genitive_one}}}")
     & P ("summary.running", "выполняется: {count}")
     & P ("summary.complete", "завершено: {count}")
     & P ("backup.backup_running", "выполняется резервное копирование")
     & P ("backup.backup_completed", "резервное копирование завершено")
     & P ("backup.backup_failed", "ошибка резервного копирования")
     & P ("backup.backup_stale", "резервная копия устарела")
     & P ("incident.incident_investigating", "расследование инцидента")
     & P ("incident.incident_identified", "инцидент выявлен")
     & P ("incident.incident_mitigated", "инцидент локализован")
     & P ("incident.incident_resolved", "инцидент устранён")
     & P ("release.release_drafting", "подготовка релиза")
     & P ("release.release_ready", "релиз готов")
     & P ("release.release_published", "релиз опубликован")
     & P ("release.release_rolled_back", "релиз откачен")
     & P ("audit.audit_created", "запись аудита создана")
     & P ("audit.audit_updated", "запись аудита обновлена")
     & P ("audit.audit_deleted", "запись аудита удалена")
     & P ("audit.audit_restored", "запись аудита восстановлена")
     & P ("flag.flag_enabled", "флаг функции включён")
     & P ("flag.flag_disabled", "флаг функции отключён")
     & P ("flag.flag_rolling_out", "флаг функции развёртывается")
     & P ("flag.flag_rolled_back", "флаг функции откачен")
     & P ("webhook.webhook_pending", "вебхук ожидает отправки")
     & P ("webhook.webhook_delivered", "вебхук доставлен")
     & P ("webhook.webhook_failed", "ошибка вебхука")
     & P ("webhook.webhook_retrying", "повторная отправка вебхука")
     & P ("api_key.api_key_active", "API-ключ активен")
     & P ("api_key.api_key_revoked", "API-ключ отозван")
     & P ("api_key.api_key_expired", "срок действия API-ключа истёк")
     & P ("api_key.api_key_rotated", "API-ключ заменён")
     & P ("quota.quota_available", "квота доступна")
     & P ("quota.quota_near_limit", "квота почти исчерпана")
     & P ("quota.quota_exceeded", "квота превышена")
     & P ("quota.quota_reset", "квота сброшена")
     & P ("invoice.invoice_draft", "черновик счёта")
     & P ("invoice.invoice_sent", "счёт отправлен")
     & P ("invoice.invoice_paid", "счёт оплачен")
     & P ("invoice.invoice_refunded", "средства по счёту возвращены")
     & P ("invoice.invoice_overdue", "счёт просрочен")
     & P ("invoice.refund_failed", "ошибка возврата средств")
     & P ("page_navigation.only", "единственная страница")
     & P ("page_navigation.first", "первая страница, доступна следующая")
     & P ("page_navigation.last",
          "последняя страница, доступна "
          & "предыдущая")
     & P ("page_navigation.middle", "доступны предыдущая и следующая")
     & P ("end_of_week", "конец недели")
     & P ("end_of_month", "конец месяца")
     & P ("end_of_quarter", "конец квартала")
     & P ("time_of_day.night", "ночь")
     & P ("time_of_day.morning", "утро")
     & P ("time_of_day.afternoon", "день")
     & P ("time_of_day.evening", "вечер")
     & P ("calendar_difference.same_day", "в тот же день")
     & P ("calendar_difference.zero", "0 дней")
     & P ("queue_summary.empty", "очередь пуста")
     & P ("access.allowed", "разрешено")
     & P ("access.denied", "запрещено")
     & P ("access.owner", "владелец")
     & P ("access.admin", "администратор")
     & P ("access.viewer", "читатель")
     & P ("access.editor", "редактор")
     & P ("auth.signed_in", "вход выполнен")
     & P ("auth.signed_out", "выход выполнен")
     & P ("auth.session_expired", "сеанс истёк")
     & P ("auth.locked", "заблокировано")
     & P ("auth.two_factor_required",
          "требуется двухфакторная "
          & "аутентификация")
     & P ("billing.trialing", "пробный период")
     & P ("billing.payment_due", "ожидается оплата")
     & P ("billing.payment_failed", "ошибка оплаты")
     & P ("billing.paid", "оплачено")
     & P ("billing.past_due", "просрочено")
     & P ("billing.canceled", "отменено")
     & P ("ci.pipeline_pending", "конвейер ожидает")
     & P ("ci.pipeline_running", "конвейер выполняется")
     & P ("ci.pipeline_passed", "конвейер пройден")
     & P ("ci.pipeline_failed", "сбой конвейера")
     & P ("ci.review_required", "требуется проверка")
     & P ("ci.deploy_blocked", "развёртывание заблокировано")
     & P ("collaboration.active_now", "в сети")
     & P ("collaboration.away", "нет на месте")
     & P ("collaboration.do_not_disturb", "не беспокоить")
     & P ("collaboration.typing", "печатает")
     & P ("collaboration.viewing", "просматривает")
     & P ("collaboration.editing", "редактирует")
     & P ("deployment.deploying", "развёртывание")
     & P ("deployment.deployed", "развёрнуто")
     & P ("deployment.rolling_back", "откат")
     & P ("deployment.rolled_back", "откачено")
     & P ("deployment.build_failed", "ошибка сборки")
     & P ("deployment.checks_passed", "проверки пройдены")
     & P ("empty.no_items", "нет элементов")
     & P ("empty.no_results", "нет результатов")
     & P ("empty.no_messages", "нет сообщений")
     & P ("empty.no_selection", "ничего не выбрано")
     & P ("empty.nothing_to_show", "нечего показать")
     & P ("file.uploading", "отправка")
     & P ("file.downloading", "скачивание")
     & P ("file.copying", "копирование")
     & P ("file.moving", "перемещение")
     & P ("file.deleting", "удаление")
     & P ("file.deleted", "удалено")
     & P ("file.restoring", "восстановление")
     & P ("file.synced", "синхронизировано")
     & P ("form.valid_input", "корректное значение")
     & P ("form.invalid_input", "некорректное значение")
     & P ("form.dirty", "изменено")
     & P ("form.pristine", "без изменений")
     & P ("form.submitted", "отправлено")
     & P ("form.submission_failed", "ошибка отправки")
     & P ("health.healthy", "в норме")
     & P ("health.degraded", "работает с перебоями")
     & P ("health.unhealthy", "неисправно")
     & P ("health.incident", "инцидент")
     & P ("health.maintenance", "техобслуживание")
     & P ("health.recovering", "восстановление")
     & P ("issue.open", "открыто")
     & P ("issue.closed", "закрыто")
     & P ("issue.reopened", "открыто повторно")
     & P ("issue.assigned", "назначено")
     & P ("issue.unassigned", "не назначено")
     & P ("issue.merged", "слито")
     & P ("network.offline", "не в сети")
     & P ("network.online", "в сети")
     & P ("network.connecting", "подключение")
     & P ("network.syncing", "синхронизация")
     & P ("network.sync_failed", "ошибка синхронизации")
     & P ("network.permission_denied", "доступ запрещён")
     & P ("network.read_only", "только чтение")
     & P ("notification.unread", "не прочитано")
     & P ("notification.read", "прочитано")
     & P ("notification.muted", "без звука")
     & P ("notification.snoozed", "отложено")
     & P ("notification.sent", "отправлено")
     & P ("notification.delivered", "доставлено")
     & P ("payment.payment_authorized", "платёж авторизован")
     & P ("payment.payment_captured", "платёж проведён")
     & P ("payment.payment_refunded", "платёж возвращён")
     & P ("payment.payment_disputed", "платёж оспорен")
     & P ("payment.payment_requires_action", "платёж требует действий")
     & P ("payment.payment_expired", "срок платежа истёк")
     & P ("ui.empty", "пусто")
     & P ("ui.loading", "загрузка")
     & P ("ui.saving", "сохранение")
     & P ("ui.saved", "сохранено")
     & P ("ui.unsaved", "не сохранено")
     & P ("ui.retrying", "повторная попытка")
     & P ("ui.paused", "приостановлено")
     & P ("ui.complete", "завершено")
     & P ("ui.failed", "ошибка")
     & P ("ui.due_soon", "скоро срок")
     & P ("ui.overdue", "просрочено")
     & P ("ui.last_seen", "последняя активность")
     & P ("ui.updated_just_now", "обновлено только что")
     & P ("queue.queued", "в очереди")
     & P ("queue.running", "выполняется")
     & P ("queue.waiting", "ожидание")
     & P ("queue.blocked", "заблокировано")
     & P ("queue.canceled_job", "задание отменено")
     & P ("queue.completed_job", "задание выполнено")
     & P ("search.filtering", "фильтрация")
     & P ("search.filtered", "отфильтровано")
     & P ("search.no_matches", "совпадений нет")
     & P ("search.search_ready", "поиск готов")
     & P ("search.search_failed", "ошибка поиска")
     & P ("search.query_too_short", "слишком короткий запрос")
     & P ("security.secure", "защищено")
     & P ("security.insecure", "не защищено")
     & P ("security.vulnerable", "уязвимо")
     & P ("security.encrypted", "зашифровано")
     & P ("security.unencrypted", "не зашифровано")
     & P ("security.token_expired", "срок действия токена истёк")
     & P ("sync.sync_idle", "синхронизация не выполняется")
     & P ("sync.syncing_now", "идёт синхронизация")
     & P ("sync.sync_queued", "синхронизация в очереди")
     & P ("sync.sync_conflict", "конфликт синхронизации")
     & P ("sync.sync_complete", "синхронизация завершена")
     & P ("sync.sync_error", "ошибка синхронизации")
     & P ("task.todo", "к выполнению")
     & P ("task.in_progress", "в работе")
     & P ("task.done", "готово")
     & P ("task.skipped", "пропущено")
     & P ("task.blocked_task", "заблокировано")
     & P ("task.waiting_on", "ожидает")
     & P ("ticket.ticket_new", "новая заявка")
     & P ("ticket.ticket_open", "заявка открыта")
     & P ("ticket.ticket_waiting", "заявка ожидает")
     & P ("ticket.ticket_escalated", "заявка эскалирована")
     & P ("ticket.ticket_resolved", "заявка решена")
     & P ("ticket.ticket_closed", "заявка закрыта")
     & P ("transfer.importing", "импорт")
     & P ("transfer.imported", "импортировано")
     & P ("transfer.import_failed", "ошибка импорта")
     & P ("transfer.exporting", "экспорт")
     & P ("transfer.exported", "экспортировано")
     & P ("transfer.export_failed", "ошибка экспорта")
     & P ("validation.required", "обязательно")
     & P ("validation.optional", "необязательно")
     & P ("validation.invalid", "некорректно")
     & P ("validation.too_short", "слишком коротко")
     & P ("validation.too_long", "слишком длинно")
     & P ("validation.out_of_range", "вне допустимого диапазона")
     & P ("validation.already_exists", "уже существует")
     & P ("workflow.draft", "черновик")
     & P ("workflow.in_review", "на проверке")
     & P ("workflow.approved", "одобрено")
     & P ("workflow.rejected", "отклонено")
     & P ("workflow.published", "опубликовано")
     & P ("workflow.archived", "в архиве")
     & P ("database.database_online", "база данных доступна")
     & P ("database.database_offline", "база данных недоступна")
     & P ("database.database_degraded", "база данных работает с перебоями")
     & P ("database.database_migrating", "миграция базы данных")
     & P ("database.database_migration_failed", "ошибка миграции базы данных")
     & P ("database.database_replicating", "репликация базы данных")
     & P ("database.database_replication_lagging", "отставание репликации базы данных")
     & P ("database.database_backup_running",
          "выполняется резервное копирование "
          & "базы данных")
     & P ("database.database_backup_failed",
          "ошибка резервного копирования базы "
          & "данных")
     & P ("calendar_difference.case.future", "accusative")
     & P ("calendar_difference.case.past", "accusative")
     & P ("date_comparison.after", "{current} на {quantity} позже, чем {baseline}")
     & P ("date_comparison.before", "{current} на {quantity} раньше, чем {baseline}")
     & P ("date_comparison.case.after", "accusative")
     & P ("date_comparison.case.before", "accusative")
     & P ("count",
          "{count, plural, one {# {one}} few {# {genitive_one}} many {# "
          & "{genitive_other}} other {# {genitive_one}}}")
     & P ("noun",
          "{count, plural, one {{one}} few {{genitive_one}} many "
          & "{{genitive_other}} other {{genitive_one}}}")
     & P ("noun.accusative",
          "{count, plural, one {{accusative_one}} few {{genitive_one}} many "
          & "{{genitive_other}} other {{genitive_one}}}")
     & P ("number_comparison.case", "accusative")
     & P ("times_noun",
          "{count, plural, =0 {{other}: ни разу} =1 {{one}: один "
          & "раз} =2 {{other}: дважды} one {{other}: {count} раз} few "
          & "{{other}: {count} раза} many {{other}: {count} раз} other "
          & "{{other}: {count} раза}}")
     & P ("availability.all",
          "доступно {available} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}")
     & P ("availability.none", "нет доступных {genitive_other}")
     & P ("availability.partial",
          "доступно {available} из {total} {total, plural, one "
          & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
          & "{{genitive_one}}}, недоступно {unavailable}")
     & P ("operation_progress", "{name} — {state}: {details}")
     & P ("operation.queued", "в очереди")
     & P ("operation.running", "выполняется")
     & P ("operation.blocked", "заблокировано")
     & P ("operation.retrying", "повторная попытка")
     & P ("operation.succeeded", "успешно")
     & P ("operation.partially_succeeded", "частично успешно")
     & P ("operation.failed", "ошибка")
     & P ("operation.canceled", "отменено")
     & P ("operation.skipped", "пропущено")
     & P ("operation.stale", "устарело")
     & P ("operation.unknown_state", "неизвестно")
     & P ("operation.last_success", "{name} — последний успешный запуск: {time}")
     & P ("operation.next_retry", "{name} — следующая попытка: {time}")
     & P ("operation.stale_run", "{name} — не обновлялось {time}")
     & P ("summary.skipped", "пропущено: {count}")
     & P ("summary.retried", "повторено: {count}")
     & P ("summary.canceled", "отменено: {count}")
     & P ("system.service.operational", "работает")
     & P ("system.service.degraded", "снижена производительность")
     & P ("system.service.partial_outage", "частичный сбой")
     & P ("system.service.major_outage", "серьёзный сбой")
     & P ("system.service.maintenance", "на обслуживании")
     & P ("system.service.unknown", "статус сервиса неизвестен")
     & P ("system.health.healthy", "в норме")
     & P ("system.health.warning", "предупреждение")
     & P ("system.health.critical", "критическое состояние")
     & P ("system.health.unavailable", "недоступен")
     & P ("system.health.unknown_health", "состояние неизвестно")
     & P ("system.readiness.ready", "готов")
     & P ("system.readiness.not_ready", "не готов")
     & P ("system.readiness.starting", "запускается")
     & P ("system.readiness.draining", "вывод из работы")
     & P ("system.readiness.stopped", "остановлен")
     & P ("system.readiness.unknown_readiness", "готовность неизвестна")
     & P ("system.component.online", "в сети")
     & P ("system.component.offline", "не в сети")
     & P ("system.component.starting", "запускается")
     & P ("system.component.stopping", "останавливается")
     & P ("system.component.restarting", "перезапускается")
     & P ("system.component.unknown", "статус компонента неизвестен")
     & P ("system.check.passing", "пройдена")
     & P ("system.check.failing", "не пройдена")
     & P ("system.check.warning", "предупреждение")
     & P ("system.check.skipped", "пропущена")
     & P ("system.check.timed_out", "превышено время ожидания")
     & P ("system.check.unknown", "статус проверки неизвестен")
     & P ("system.incident.investigating", "расследуется")
     & P ("system.incident.identified", "причина установлена")
     & P ("system.incident.monitoring", "наблюдение")
     & P ("system.incident.resolved", "устранено")
     & P ("system.incident.scheduled_maintenance", "плановое обслуживание")
     & P ("system.named", "{name}: {state}")
     & P ("system.check_named", "проверка {name}: {state}")
     & P ("system.count.components",
          "{count, plural, =0 {нет компонентов} one {{count} "
          & "компонент} few {{count} компонента} many {{count} "
          & "компонентов} other {{count} компонента}}")
     & P ("system.count.checks",
          "{count, plural, =0 {нет проверок} one {{count} "
          & "проверка} few {{count} проверки} many {{count} "
          & "проверок} other {{count} проверки}}")
     & P ("system.count.incidents",
          "{count, plural, =0 {нет инцидентов} one {{count} "
          & "инцидент} few {{count} инцидента} many {{count} "
          & "инцидентов} other {{count} инцидента}}")
     & P ("system.uptime", "время безотказной работы: {measure}")
     & P ("system.latency", "задержка: {measure}")
     & P ("system.maintenance_window", "окно обслуживания: {time}")
     & P ("system.last_checked", "последняя проверка: {time}")
     & P ("system.http.informational", "информационный ответ")
     & P ("system.http.successful", "успешный ответ")
     & P ("system.http.redirection", "перенаправление")
     & P ("system.http.client_error", "ошибка клиента")
     & P ("system.http.server_error", "ошибка сервера")
     & P ("system.exit.success", "код выхода {code}: успех")
     & P ("system.exit.failure", "код выхода {code}: сбой")
     & P ("system.exit.usage_error", "код выхода {code}: ошибка использования")
     & P ("system.exit.not_executable",
          "код выхода {code}: команда не является "
          & "исполняемой")
     & P ("system.exit.not_found", "код выхода {code}: команда не найдена")
     & P ("system.exit.invalid_argument",
          "код выхода {code}: недопустимый аргумент "
          & "exit")
     & P ("system.exit.signal",
          "код выхода {code}: завершение по сигналу "
          & "{signal}")
     & P ("validation.problem.required", "{field}: обязательное поле")
     & P ("validation.problem.minimum", "{field}: значение меньше минимального")
     & P ("validation.problem.maximum", "{field}: значение больше максимального")
     & P ("validation.problem.range",
          "{field}: значение вне допустимого "
          & "диапазона")
     & P ("validation.problem.pattern", "{field}: не соответствует шаблону")
     & P ("validation.problem.choice",
          "{field}: значение должно быть одним из "
          & "допустимых вариантов")
     & P ("validation.problem.dependency", "{field}: зависит от другого поля")
     & P ("validation.problem.custom", "{field}: недопустимое значение")
     & P ("validation.constraint.no_relation",
          "{field}: ожидается допустимое значение "
          & "{value}")
     & P ("validation.constraint.less_than",
          "{field}: значение должно быть меньше, чем "
          & "{value}")
     & P ("validation.constraint.less_or_equal",
          "{field}: значение должно быть не больше, "
          & "чем {value}")
     & P ("validation.constraint.greater_than",
          "{field}: значение должно быть больше, чем "
          & "{value}")
     & P ("validation.constraint.greater_or_equal",
          "{field}: значение должно быть не меньше, "
          & "чем {value}")
     & P ("validation.constraint.equal_to", "{field}: значение должно быть равно {value}")
     & P ("validation.constraint.not_equal_to",
          "{field}: значение не должно быть равно "
          & "{value}")
     & P ("validation.constraint.before_field",
          "{field}: значение должно быть раньше, чем "
          & "{value}")
     & P ("validation.constraint.after_field",
          "{field}: значение должно быть позже, чем "
          & "{value}")
     & P ("validation.choices", "{field}: допустимые значения: {choices}")
     & P ("frame.detail", "{text} ({detail})")
     & P ("frame.got", "{text}, получено: {actual}")
     & P ("frame.also", "{text}, {detail}")
     & P ("frame.retry", "{text}, повторная попытка через {time}")
     & P ("net_diagnostic.dns", "{endpoint}: не удалось выполнить DNS-запрос")
     & P ("net_diagnostic.tcp",
          "{endpoint}: не удалось установить "
          & "TCP-соединение")
     & P ("net_diagnostic.tls", "{endpoint}: ошибка TLS-сертификата")
     & P ("net_diagnostic.http", "{endpoint}: ошибка HTTP-запроса")
     & P ("net_diagnostic.proxy", "{endpoint}: ошибка прокси-сервера")
     & P ("net_diagnostic.timeout", "{endpoint}: превышено время ожидания")
     & P ("net_diagnostic.reset", "{endpoint}: соединение сброшено")
     & P ("net_diagnostic.unknown_network", "{endpoint}: неизвестная проблема сети")
     & P ("progress.state.not_started", "не начато")
     & P ("progress.state.running", "выполняется")
     & P ("progress.state.stalled", "зависло")
     & P ("progress.state.retrying", "повторная попытка")
     & P ("progress.state.complete", "завершено")
     & P ("progress.state.failed", "сбой")
     & P ("progress.of",
          "{subject}: выполнено {done} из {total} ({percent} %), "
          & "{state}")
     & P ("progress.done", "{subject}: выполнено {done}, {state}")
     & P ("collection.summary",
          "{name}: {total} {total, plural, one {элемент} few "
          & "{элемента} many {элементов} other "
          & "{элемента}}, {unique} {unique, plural, one "
          & "{уникальное значение} few {уникальных "
          & "значения} many {уникальных значений} other "
          & "{уникального значения}}, {duplicates} {duplicates, "
          & "plural, one {дубликат} few {дубликата} many "
          & "{дубликатов} other {дубликата}}, {outliers} "
          & "{outliers, plural, one {выброс} few {выброса} many "
          & "{выбросов} other {выброса}}")
     & P ("top_frequency",
          "{name}: чаще всего {value} ({count} {count, plural, one "
          & "{раз} few {раза} many {раз} other {раза}})");
end Locale_Ru;
