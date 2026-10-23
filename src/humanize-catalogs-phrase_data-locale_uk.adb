separate (Humanize.Catalogs.Phrase_Data)
function Locale_Uk return Wide_Wide_String is
   function P (Name, Template : Wide_Wide_String) return Wide_Wide_String is (Entry_Line ("uk", Name, Template));
begin
   return
     P ("all_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: усього {total}")
     & P ("filtered_count.none", "{other}: збігів немає")
     & P ("filtered_count.all",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: збігаються всі ({total})")
     & P ("filtered_count.some",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: збігів {matching} з {total}")
     & P ("more_count", "показано {visible}, ще +{remaining}")
     & P ("others_count", "{first} та ще {remaining}")
     & P ("page_count", "сторінка {page} з {total}")
     & P ("page_size",
          "{size, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {size} на сторінку")
     & P ("pagination_range",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: {first}–{last} з {total}")
     & P ("position_count", "{position} з {total}")
     & P ("selection_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: вибрано {selected} з {total}")
     & P ("showing_count",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {showing} з {total}")
     & P ("validation_count",
          "{count, plural, =0 {немає {severity, select, error "
          & "{помилок} warning {попереджень} other "
          & "{зауважень}}} one {{count} {severity, select, error "
          & "{помилка} warning {попередження} other "
          & "{зауваження}}} few {{count} {severity, select, error "
          & "{помилки} warning {попередження} other "
          & "{зауваження}}} many {{count} {severity, select, error "
          & "{помилок} warning {попереджень} other "
          & "{зауважень}}} other {{count} {severity, select, error "
          & "{помилки} warning {попередження} other "
          & "{зауваження}}}}")
     & P ("collection.empty", "{other} відсутні")
     & P ("collection.none_shown", "{other} не показано")
     & P ("collection.showing_hidden",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible} з {total}, приховано "
          & "{hidden}")
     & P ("collection.showing",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible} з {total}")
     & P ("collection.shown_hidden",
          "{visible, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible}, приховано {hidden}")
     & P ("collection.shown",
          "{visible, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: показано {visible}")
     & P ("collection.visible_out_of",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: видно {visible} з {total}")
     & P ("complete_count", "виконано {done} з {total}")
     & P ("percent_complete", "виконано {percent} %")
     & P ("step_count", "крок {step} з {total}")
     & P ("attempt_count", "спроба {attempt} з {total}")
     & P ("throughput_remaining",
          "{unit}: залишилося {remaining}, швидкість {rate} "
          & "{unit}/с")
     & P ("accessible_progress",
          "виконано {done} з {total}, {percent} {percent, plural, one "
          & "{відсоток} few {відсотки} many {відсотків} "
          & "other {відсотка}}")
     & P ("business_days",
          "{days} {days, plural, one {робочий день} few {робочі "
          & "дні} many {робочих днів} other {робочого "
          & "дня}}")
     & P ("working_hours",
          "{hours} {hours, plural, one {робоча година} few "
          & "{робочі години} many {робочих годин} other "
          & "{робочої години}}")
     & P ("due.overdue",
          "прострочено на {days} {days, plural, one {день} few "
          & "{дні} many {днів} other {дня}}")
     & P ("due.today", "термін — сьогодні")
     & P ("due.tomorrow", "термін — завтра")
     & P ("due.in",
          "термін через {days} {days, plural, one {день} few "
          & "{дні} many {днів} other {дня}}")
     & P ("calendar_difference.future", "через {difference}")
     & P ("calendar_difference.past", "{difference} тому")
     & P ("cpu_load", "завантаження ЦП {measure}")
     & P ("battery", "заряд батареї {measure}")
     & P ("screen_size", "екран {measure}")
     & P ("refresh_rate", "частота оновлення {measure}")
     & P ("editorial_percent.symbol", "{value} %")
     & P ("editorial_percent.word",
          "{value} {value, plural, one {відсоток} few {відсотки} "
          & "many {відсотків} other {відсотка}}")
     & P ("recurrence.second",
          "{every, plural, =1 {щосекунди} one {кожні {every} "
          & "секунду} few {кожні {every} секунди} many "
          & "{кожні {every} секунд} other {кожні {every} "
          & "секунди}}")
     & P ("recurrence.minute",
          "{every, plural, =1 {щохвилини} one {кожні {every} "
          & "хвилину} few {кожні {every} хвилини} many "
          & "{кожні {every} хвилин} other {кожні {every} "
          & "хвилини}}")
     & P ("recurrence.hour",
          "{every, plural, =1 {щогодини} one {кожні {every} "
          & "годину} few {кожні {every} години} many {кожні "
          & "{every} годин} other {кожні {every} години}}")
     & P ("recurrence.day",
          "{every, plural, =1 {щодня} one {кожні {every} день} few "
          & "{кожні {every} дні} many {кожні {every} днів} other "
          & "{кожні {every} дня}}")
     & P ("recurrence.week",
          "{every, plural, =1 {щотижня} one {кожні {every} "
          & "тиждень} few {кожні {every} тижні} many {кожні "
          & "{every} тижнів} other {кожні {every} тижня}}")
     & P ("recurrence.month",
          "{every, plural, =1 {щомісяця} one {кожні {every} "
          & "місяць} few {кожні {every} місяці} many {кожні "
          & "{every} місяців} other {кожні {every} місяця}}")
     & P ("recurrence.quarter",
          "{every, plural, =1 {щокварталу} one {кожні {every} "
          & "квартал} few {кожні {every} квартали} many "
          & "{кожні {every} кварталів} other {кожні {every} "
          & "кварталу}}")
     & P ("recurrence.year",
          "{every, plural, =1 {щороку} one {кожні {every} рік} few "
          & "{кожні {every} роки} many {кожні {every} років} "
          & "other {кожні {every} року}}")
     & P ("cache_summary.empty", "кеш: запитів немає")
     & P ("cache_summary",
          "кеш: влучань {hits}, промахів {misses}, частка "
          & "влучань {rate} %")
     & P ("field_change_summary",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}} ({total}): змінено {changed}, додано {added}, "
          & "видалено {removed}")
     & P ("field_diff", "{field}: було {before}, стало {after}")
     & P ("field_added", "{field}: додано значення {value}")
     & P ("field_removed", "{field}: видалено (було {value})")
     & P ("field_unchanged", "{field}: без змін ({value})")
     & P ("number_comparison.equal", "{current} дорівнює {baseline}")
     & P ("number_comparison.higher", "{current} на {quantity} більше, ніж {baseline}")
     & P ("number_comparison.lower", "{current} на {quantity} менше, ніж {baseline}")
     & P ("percent_comparison.equal", "{current} дорівнює {baseline}")
     & P ("percent_comparison.higher", "{current} на {quantity} більше, ніж {baseline}")
     & P ("percent_comparison.lower", "{current} на {quantity} менше, ніж {baseline}")
     & P ("file_size_comparison.same", "{current} такого ж розміру, як {baseline}")
     & P ("file_size_comparison.larger", "{current} на {quantity} більше, ніж {baseline}")
     & P ("file_size_comparison.smaller", "{current} на {quantity} менше, ніж {baseline}")
     & P ("date_comparison.same", "{current} — та сама дата, що й {baseline}")
     & P ("date_comparison.after",
          "{current} пізніше, ніж {baseline} (різниця: "
          & "{quantity})")
     & P ("date_comparison.before", "{current} раніше, ніж {baseline} (різниця: {quantity})")
     & P ("queue_summary", "черга: {details}")
     & P ("domain_summary",
          "{domain, select, queue {черга} job {завдання} run "
          & "{запуск} cache {кеш} sync {синхронізація} import "
          & "{імпорт} export {експорт} other {{domain}}} — {state, "
          & "select, queued {у черзі} running {виконується} "
          & "waiting {очікування} paused {на паузі} complete "
          & "{завершено} failed {помилка} stale "
          & "{застаріло} skipped {пропущено} other {{state}}}: "
          & "{details}")
     & P ("summary.none", "{other} відсутні")
     & P ("summary.completed",
          "{count, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: завершено {count}")
     & P ("summary.completed_of",
          "{total, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: завершено {count} з {total}")
     & P ("summary.failed", "з помилкою: {count}")
     & P ("summary.queued",
          "{count, plural, one {{one}} few {{other}} many {{other}} other "
          & "{{other}}}: у черзі {count}")
     & P ("summary.running", "виконується: {count}")
     & P ("summary.complete", "завершено: {count}")
     & P ("backup.backup_running", "триває резервне копіювання")
     & P ("backup.backup_completed", "резервне копіювання завершено")
     & P ("backup.backup_failed", "помилка резервного копіювання")
     & P ("backup.backup_stale", "резервна копія застаріла")
     & P ("incident.incident_investigating", "розслідування інциденту")
     & P ("incident.incident_identified", "інцидент виявлено")
     & P ("incident.incident_mitigated", "інцидент локалізовано")
     & P ("incident.incident_resolved", "інцидент усунуто")
     & P ("release.release_drafting", "підготовка релізу")
     & P ("release.release_ready", "реліз готовий")
     & P ("release.release_published", "реліз опубліковано")
     & P ("release.release_rolled_back", "реліз відкочено")
     & P ("audit.audit_created", "запис аудиту створено")
     & P ("audit.audit_updated", "запис аудиту оновлено")
     & P ("audit.audit_deleted", "запис аудиту видалено")
     & P ("audit.audit_restored", "запис аудиту відновлено")
     & P ("feature_flag.flag_enabled", "прапорець функції увімкнено")
     & P ("feature_flag.flag_disabled", "прапорець функції вимкнено")
     & P ("feature_flag.flag_rolling_out", "прапорець функції розгортається")
     & P ("feature_flag.flag_rolled_back", "прапорець функції відкочено")
     & P ("webhook.webhook_pending", "вебхук очікує надсилання")
     & P ("webhook.webhook_delivered", "вебхук доставлено")
     & P ("webhook.webhook_failed", "помилка вебхука")
     & P ("webhook.webhook_retrying", "повторне надсилання вебхука")
     & P ("api_key.api_key_active", "API-ключ активний")
     & P ("api_key.api_key_revoked", "API-ключ відкликано")
     & P ("api_key.api_key_expired", "термін дії API-ключа минув")
     & P ("api_key.api_key_rotated", "API-ключ замінено")
     & P ("quota.quota_available", "квота доступна")
     & P ("quota.quota_near_limit", "квоту майже вичерпано")
     & P ("quota.quota_exceeded", "квоту перевищено")
     & P ("quota.quota_reset", "квоту скинуто")
     & P ("invoice.invoice_draft", "чернетка рахунку")
     & P ("invoice.invoice_sent", "рахунок надіслано")
     & P ("invoice.invoice_paid", "рахунок оплачено")
     & P ("invoice.invoice_refunded", "кошти за рахунком повернено")
     & P ("invoice.invoice_overdue", "рахунок прострочено")
     & P ("invoice.refund_failed", "помилка повернення коштів")
     & P ("page_navigation.only", "єдина сторінка")
     & P ("page_navigation.first", "перша сторінка, доступна наступна")
     & P ("page_navigation.last", "остання сторінка, доступна попередня")
     & P ("page_navigation.middle", "доступні попередня й наступна")
     & P ("end_of_week", "кінець тижня")
     & P ("end_of_month", "кінець місяця")
     & P ("end_of_quarter", "кінець кварталу")
     & P ("time_of_day.night", "ніч")
     & P ("time_of_day.morning", "ранок")
     & P ("time_of_day.afternoon", "день")
     & P ("time_of_day.evening", "вечір")
     & P ("calendar_difference.same_day", "того ж дня")
     & P ("calendar_difference.zero", "0 днів")
     & P ("queue_summary.empty", "черга порожня");
end Locale_Uk;
