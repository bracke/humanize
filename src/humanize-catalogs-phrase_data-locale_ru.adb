separate (Humanize.Catalogs.Phrase_Data)
function Locale_Ru return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("ru", Name, Template));
begin
   return
     P ("all_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: всего {total}")
     & P ("filtered_count.none", "{other}: совпадений нет")
     & P ("filtered_count.all",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: совпадают все ({total})")
     & P ("filtered_count.some",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: совпадений {matching} из {total}")
     & P ("more_count", "показано {visible}, ещё +{remaining}")
     & P ("others_count", "{first} и ещё {remaining}")
     & P ("page_count", "страница {page} из {total}")
     & P ("page_size",
          "{size, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {size} на страницу")
     & P ("pagination_range",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {first}–{last} из {total}")
     & P ("position_count", "{position} из {total}")
     & P ("selection_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: выбрано {selected} из {total}")
     & P ("showing_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {showing} из {total}")
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
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible} из {total}, скрыто "
          & "{hidden}")
     & P ("collection.showing",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible} из {total}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible}, скрыто {hidden}")
     & P ("collection.shown",
          "{visible, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible}")
     & P ("collection.visible_out_of",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: видно {visible} из {total}")
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
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}} ({total}): изменено {changed}, добавлено "
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
          "{count, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: завершено {count}")
     & P ("summary.completed_of",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: завершено {count} из {total}")
     & P ("summary.failed", "с ошибкой: {count}")
     & P ("summary.queued",
          "{count, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: в очереди {count}")
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
     & P ("feature_flag.flag_enabled", "флаг функции включён")
     & P ("feature_flag.flag_disabled", "флаг функции отключён")
     & P ("feature_flag.flag_rolling_out", "флаг функции развёртывается")
     & P ("feature_flag.flag_rolled_back", "флаг функции откачен")
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
     & P ("queue_summary.empty", "очередь пуста");
end Locale_Ru;
