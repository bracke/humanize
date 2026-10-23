separate (Humanize.Catalogs.Phrase_Data)
function Locale_Ru return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("ru", Name, Template));
begin
   return
     P ("all_count",
          "всего {total} {total, plural, one {{one}} few {{few}} many "
          & "{{many}} other {{other}}}")
     & P ("filtered_count.none", "{other}: совпадений нет")
     & P ("filtered_count.all",
          "{total, plural, =1 {совпадает 1 {one}} one "
          & "{совпадают все {total} {one}} few {совпадают "
          & "все {total} {few}} many {совпадают все {total} {many}} "
          & "other {совпадают все {total} {other}}}")
     & P ("filtered_count.some",
          "совпадают: {matching} {matching, plural, one {{one}} few "
          & "{{few}} many {{many}} other {{other}}} из {total}")
     & P ("more_count", "показано {visible}, ещё +{remaining}")
     & P ("others_count", "{first} и ещё {remaining}")
     & P ("page_count", "страница {page} из {total}")
     & P ("page_size",
          "{size} {size, plural, one {{one}} few {{few}} many {{many}} other "
          & "{{other}}} на странице")
     & P ("pagination_range",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {first}–{last} из {total}")
     & P ("position_count", "{position} из {total}")
     & P ("selection_count",
          "выбрано: {selected} {selected, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}} из {total}")
     & P ("showing_count",
          "показано: {showing} {showing, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}} из {total}")
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
     & P ("collection.empty", "{other} отсутствуют")
     & P ("collection.none_shown", "{other} не показаны")
     & P ("collection.showing_hidden",
          "показано: {visible} {visible, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}} из {total}, скрыто: {hidden}")
     & P ("collection.showing",
          "показано: {visible} {visible, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}} из {total}")
     & P ("collection.shown_hidden",
          "показано: {visible} {visible, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}}, скрыто: {hidden}")
     & P ("collection.shown",
          "показано: {visible} {visible, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}}")
     & P ("collection.visible_out_of",
          "видно: {visible} {visible, plural, one {{one}} few {{few}} many "
          & "{{many}} other {{other}}} из {total}")
     & P ("complete_count", "выполнено {done} из {total}")
     & P ("percent_complete", "выполнено {percent} %")
     & P ("step_count", "шаг {step} из {total}")
     & P ("attempt_count", "попытка {attempt} из {total}")
     & P ("throughput_remaining",
          "{unit}: осталось {remaining}, скорость {rate} "
          & "{unit}/с")
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
          & "{{other}}}: изменено {changed}, добавлено {added}, "
          & "удалено {removed}")
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
     & P ("date_comparison.after", "{current} позже, чем {baseline} (разница: {quantity})")
     & P ("date_comparison.before", "{current} раньше, чем {baseline} (разница: {quantity})")
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
     & P ("summary.none", "{other} отсутствуют")
     & P ("summary.completed",
          "завершено: {count} {count, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}}")
     & P ("summary.completed_of",
          "завершено: {count} {count, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}} из {total}")
     & P ("summary.failed", "с ошибкой: {count}")
     & P ("summary.queued",
          "в очереди: {count} {count, plural, one {{one}} few {{few}} "
          & "many {{many}} other {{other}}}")
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
     & P ("calendar_difference.case.past", "accusative");
end Locale_Ru;
