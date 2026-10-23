separate (Humanize.Catalogs.Phrase_Data)
procedure Locale_Uk (Target : in out Catalog_Text) is
   --  One statement an entry: the catalog grows on the heap, not in one
   --  expression on the stack.
   procedure P (Name, Template : Wide_Wide_String) is
   begin
      Add (Target, "uk", Name, Template);
   end P;
begin
   P ("all_count",
      "усього {total} {total, plural, one {{one}} few {{few}} many "
      & "{{many}} other {{genitive_one}}}");
   P ("filtered_count.none", "немає відповідних {genitive_other}");
   P ("filtered_count.all",
      "{total, plural, =1 {збігається 1 {one}} one "
      & "{збігаються всі {total} {one}} few {збігаються "
      & "всі {total} {few}} many {збігаються всі {total} "
      & "{many}} other {збігаються всі {total} {genitive_one}}}");
   P ("filtered_count.some",
      "{matching, plural, one {збігається} other "
      & "{збігаються}} {matching} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("more_count", "показано {visible}, ще +{remaining}");
   P ("others_count", "{first} та ще {remaining}");
   P ("page_count", "сторінка {page} з {total}");
   P ("page_size",
      "{size} {size, plural, one {{one}} few {{few}} many {{many}} other "
      & "{{genitive_one}}} на сторінці");
   P ("pagination_range",
      "{first}–{last} з {total} {total, plural, one {{genitive_one}} few "
      & "{{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("position_count", "{position} з {total}");
   P ("selection_count",
      "вибрано {selected} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("showing_count",
      "показано {showing} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("validation_count",
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
      & "{зауваження}}}}");
   P ("collection.empty", "немає {genitive_other}");
   P ("collection.none_shown", "немає показаних {genitive_other}");
   P ("collection.showing_hidden",
      "показано {visible} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}, приховано {hidden}");
   P ("collection.showing",
      "показано {visible} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("collection.shown_hidden",
      "показано: {visible} {visible, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}, приховано: {hidden}");
   P ("collection.shown",
      "показано: {visible} {visible, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}");
   P ("collection.visible_out_of",
      "видно {visible} з {total} {total, plural, one {{genitive_one}} "
      & "few {{genitive_other}} many {{genitive_other}} other {{genitive_one}}}");
   P ("complete_count", "виконано {done} з {total}");
   P ("percent_complete", "виконано {percent} %");
   P ("step_count", "крок {step} з {total}");
   P ("attempt_count", "спроба {attempt} з {total}");
   P ("throughput_remaining",
      "{remaining, plural, one {{gender, select, masculine "
      & "{залишився} feminine {залишилася} neuter "
      & "{залишилося} other {залишилося}}} other "
      & "{залишилося}} {remaining} {remaining, plural, one {{one}} "
      & "few {{few}} many {{genitive_other}} other {{genitive_one}}}, "
      & "швидкість {rate} {unit}/с");
   P ("accessible_progress",
      "виконано {done} з {total}, {percent} {percent, plural, one "
      & "{відсоток} few {відсотки} many {відсотків} "
      & "other {відсотка}}");
   P ("business_days",
      "{days} {days, plural, one {робочий день} few {робочі "
      & "дні} many {робочих днів} other {робочого "
      & "дня}}");
   P ("working_hours",
      "{hours} {hours, plural, one {робоча година} few "
      & "{робочі години} many {робочих годин} other "
      & "{робочої години}}");
   P ("due.overdue",
      "прострочено на {days} {days, plural, one {день} few "
      & "{дні} many {днів} other {дня}}");
   P ("due.today", "термін — сьогодні");
   P ("due.tomorrow", "термін — завтра");
   P ("due.in",
      "термін через {days} {days, plural, one {день} few "
      & "{дні} many {днів} other {дня}}");
   P ("calendar_difference.future", "через {difference}");
   P ("calendar_difference.past", "{difference} тому");
   P ("cpu_load", "завантаження ЦП {measure}");
   P ("battery", "заряд батареї {measure}");
   P ("screen_size", "екран {measure}");
   P ("refresh_rate", "частота оновлення {measure}");
   P ("editorial_percent.symbol", "{value} %");
   P ("editorial_percent.word",
      "{value} {value, plural, one {відсоток} few {відсотки} "
      & "many {відсотків} other {відсотка}}");
   P ("recurrence.second",
      "{every, plural, =1 {щосекунди} one {кожні {every} "
      & "секунду} few {кожні {every} секунди} many "
      & "{кожні {every} секунд} other {кожні {every} "
      & "секунди}}");
   P ("recurrence.minute",
      "{every, plural, =1 {щохвилини} one {кожні {every} "
      & "хвилину} few {кожні {every} хвилини} many "
      & "{кожні {every} хвилин} other {кожні {every} "
      & "хвилини}}");
   P ("recurrence.hour",
      "{every, plural, =1 {щогодини} one {кожні {every} "
      & "годину} few {кожні {every} години} many {кожні "
      & "{every} годин} other {кожні {every} години}}");
   P ("recurrence.day",
      "{every, plural, =1 {щодня} one {кожні {every} день} few "
      & "{кожні {every} дні} many {кожні {every} днів} other "
      & "{кожні {every} дня}}");
   P ("recurrence.week",
      "{every, plural, =1 {щотижня} one {кожні {every} "
      & "тиждень} few {кожні {every} тижні} many {кожні "
      & "{every} тижнів} other {кожні {every} тижня}}");
   P ("recurrence.month",
      "{every, plural, =1 {щомісяця} one {кожні {every} "
      & "місяць} few {кожні {every} місяці} many {кожні "
      & "{every} місяців} other {кожні {every} місяця}}");
   P ("recurrence.quarter",
      "{every, plural, =1 {щокварталу} one {кожні {every} "
      & "квартал} few {кожні {every} квартали} many "
      & "{кожні {every} кварталів} other {кожні {every} "
      & "кварталу}}");
   P ("recurrence.year",
      "{every, plural, =1 {щороку} one {кожні {every} рік} few "
      & "{кожні {every} роки} many {кожні {every} років} "
      & "other {кожні {every} року}}");
   P ("cache_summary.empty", "кеш: запитів немає");
   P ("cache_summary",
      "кеш: влучань {hits}, промахів {misses}, частка "
      & "влучань {rate} %");
   P ("field_change_summary",
      "{total} {total, plural, one {{one}} few {{few}} many {{many}} other "
      & "{{genitive_one}}}: змінено {changed}, додано {added}, "
      & "видалено {removed}");
   P ("field_diff", "{field}: було {before}, стало {after}");
   P ("field_added", "{field}: додано значення {value}");
   P ("field_removed", "{field}: видалено (було {value})");
   P ("field_unchanged", "{field}: без змін ({value})");
   P ("number_comparison.equal", "{current} дорівнює {baseline}");
   P ("number_comparison.higher", "{current} на {quantity} більше, ніж {baseline}");
   P ("number_comparison.lower", "{current} на {quantity} менше, ніж {baseline}");
   P ("percent_comparison.equal", "{current} дорівнює {baseline}");
   P ("percent_comparison.higher", "{current} на {quantity} більше, ніж {baseline}");
   P ("percent_comparison.lower", "{current} на {quantity} менше, ніж {baseline}");
   P ("file_size_comparison.same", "{current} такого ж розміру, як {baseline}");
   P ("file_size_comparison.larger", "{current} на {quantity} більше, ніж {baseline}");
   P ("file_size_comparison.smaller", "{current} на {quantity} менше, ніж {baseline}");
   P ("date_comparison.same", "{current} — та сама дата, що й {baseline}");
   P ("queue_summary", "черга: {details}");
   P ("domain_summary",
      "{domain, select, queue {черга} job {завдання} run "
      & "{запуск} cache {кеш} sync {синхронізація} import "
      & "{імпорт} export {експорт} other {{domain}}} — {state, "
      & "select, queued {у черзі} running {виконується} "
      & "waiting {очікування} paused {на паузі} complete "
      & "{завершено} failed {помилка} stale "
      & "{застаріло} skipped {пропущено} other {{state}}}: "
      & "{details}");
   P ("summary.none", "немає {genitive_other}");
   P ("summary.completed",
      "завершено: {count} {count, plural, one {{one}} few {{few}} "
      & "many {{many}} other {{genitive_one}}}");
   P ("summary.completed_of",
      "завершено {count} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("summary.failed", "з помилкою: {count}");
   P ("summary.queued",
      "у черзі: {count} {count, plural, one {{one}} few {{few}} many "
      & "{{many}} other {{genitive_one}}}");
   P ("summary.running", "виконується: {count}");
   P ("summary.complete", "завершено: {count}");
   P ("backup.backup_running", "триває резервне копіювання");
   P ("backup.backup_completed", "резервне копіювання завершено");
   P ("backup.backup_failed", "помилка резервного копіювання");
   P ("backup.backup_stale", "резервна копія застаріла");
   P ("incident.incident_investigating", "розслідування інциденту");
   P ("incident.incident_identified", "інцидент виявлено");
   P ("incident.incident_mitigated", "інцидент локалізовано");
   P ("incident.incident_resolved", "інцидент усунуто");
   P ("release.release_drafting", "підготовка релізу");
   P ("release.release_ready", "реліз готовий");
   P ("release.release_published", "реліз опубліковано");
   P ("release.release_rolled_back", "реліз відкочено");
   P ("audit.audit_created", "запис аудиту створено");
   P ("audit.audit_updated", "запис аудиту оновлено");
   P ("audit.audit_deleted", "запис аудиту видалено");
   P ("audit.audit_restored", "запис аудиту відновлено");
   P ("flag.flag_enabled", "прапорець функції увімкнено");
   P ("flag.flag_disabled", "прапорець функції вимкнено");
   P ("flag.flag_rolling_out", "прапорець функції розгортається");
   P ("flag.flag_rolled_back", "прапорець функції відкочено");
   P ("webhook.webhook_pending", "вебхук очікує надсилання");
   P ("webhook.webhook_delivered", "вебхук доставлено");
   P ("webhook.webhook_failed", "помилка вебхука");
   P ("webhook.webhook_retrying", "повторне надсилання вебхука");
   P ("api_key.api_key_active", "API-ключ активний");
   P ("api_key.api_key_revoked", "API-ключ відкликано");
   P ("api_key.api_key_expired", "термін дії API-ключа минув");
   P ("api_key.api_key_rotated", "API-ключ замінено");
   P ("quota.quota_available", "квота доступна");
   P ("quota.quota_near_limit", "квоту майже вичерпано");
   P ("quota.quota_exceeded", "квоту перевищено");
   P ("quota.quota_reset", "квоту скинуто");
   P ("invoice.invoice_draft", "чернетка рахунку");
   P ("invoice.invoice_sent", "рахунок надіслано");
   P ("invoice.invoice_paid", "рахунок оплачено");
   P ("invoice.invoice_refunded", "кошти за рахунком повернено");
   P ("invoice.invoice_overdue", "рахунок прострочено");
   P ("invoice.refund_failed", "помилка повернення коштів");
   P ("page_navigation.only", "єдина сторінка");
   P ("page_navigation.first", "перша сторінка, доступна наступна");
   P ("page_navigation.last", "остання сторінка, доступна попередня");
   P ("page_navigation.middle", "доступні попередня й наступна");
   P ("end_of_week", "кінець тижня");
   P ("end_of_month", "кінець місяця");
   P ("end_of_quarter", "кінець кварталу");
   P ("time_of_day.night", "ніч");
   P ("time_of_day.morning", "ранок");
   P ("time_of_day.afternoon", "день");
   P ("time_of_day.evening", "вечір");
   P ("calendar_difference.same_day", "того ж дня");
   P ("calendar_difference.zero", "0 днів");
   P ("queue_summary.empty", "черга порожня");
   P ("access.allowed", "дозволено");
   P ("access.denied", "заборонено");
   P ("access.owner", "власник");
   P ("access.admin", "адміністратор");
   P ("access.viewer", "читач");
   P ("access.editor", "редактор");
   P ("auth.signed_in", "вхід виконано");
   P ("auth.signed_out", "вихід виконано");
   P ("auth.session_expired", "сеанс завершився");
   P ("auth.locked", "заблоковано");
   P ("auth.two_factor_required", "потрібна двофакторна автентифікація");
   P ("billing.trialing", "пробний період");
   P ("billing.payment_due", "очікується оплата");
   P ("billing.payment_failed", "помилка оплати");
   P ("billing.paid", "оплачено");
   P ("billing.past_due", "прострочено");
   P ("billing.canceled", "скасовано");
   P ("ci.pipeline_pending", "конвеєр очікує");
   P ("ci.pipeline_running", "конвеєр виконується");
   P ("ci.pipeline_passed", "конвеєр пройдено");
   P ("ci.pipeline_failed", "збій конвеєра");
   P ("ci.review_required", "потрібна перевірка");
   P ("ci.deploy_blocked", "розгортання заблоковано");
   P ("collaboration.active_now", "у мережі");
   P ("collaboration.away", "немає на місці");
   P ("collaboration.do_not_disturb", "не турбувати");
   P ("collaboration.typing", "друкує");
   P ("collaboration.viewing", "переглядає");
   P ("collaboration.editing", "редагує");
   P ("deployment.deploying", "розгортання");
   P ("deployment.deployed", "розгорнуто");
   P ("deployment.rolling_back", "відкат");
   P ("deployment.rolled_back", "відкочено");
   P ("deployment.build_failed", "помилка збирання");
   P ("deployment.checks_passed", "перевірки пройдено");
   P ("empty.no_items", "немає елементів");
   P ("empty.no_results", "немає результатів");
   P ("empty.no_messages", "немає повідомлень");
   P ("empty.no_selection", "нічого не вибрано");
   P ("empty.nothing_to_show", "нічого показати");
   P ("file.uploading", "надсилання");
   P ("file.downloading", "завантаження");
   P ("file.copying", "копіювання");
   P ("file.moving", "переміщення");
   P ("file.deleting", "видалення");
   P ("file.deleted", "видалено");
   P ("file.restoring", "відновлення");
   P ("file.synced", "синхронізовано");
   P ("form.valid_input", "коректне значення");
   P ("form.invalid_input", "некоректне значення");
   P ("form.dirty", "змінено");
   P ("form.pristine", "без змін");
   P ("form.submitted", "надіслано");
   P ("form.submission_failed", "помилка надсилання");
   P ("health.healthy", "у нормі");
   P ("health.degraded", "працює з перебоями");
   P ("health.unhealthy", "несправно");
   P ("health.incident", "інцидент");
   P ("health.maintenance", "технічне обслуговування");
   P ("health.recovering", "відновлення");
   P ("issue.open", "відкрито");
   P ("issue.closed", "закрито");
   P ("issue.reopened", "відкрито повторно");
   P ("issue.assigned", "призначено");
   P ("issue.unassigned", "не призначено");
   P ("issue.merged", "злито");
   P ("network.offline", "не в мережі");
   P ("network.online", "у мережі");
   P ("network.connecting", "підключення");
   P ("network.syncing", "синхронізація");
   P ("network.sync_failed", "помилка синхронізації");
   P ("network.permission_denied", "доступ заборонено");
   P ("network.read_only", "лише читання");
   P ("notification.unread", "не прочитано");
   P ("notification.read", "прочитано");
   P ("notification.muted", "без звуку");
   P ("notification.snoozed", "відкладено");
   P ("notification.sent", "надіслано");
   P ("notification.delivered", "доставлено");
   P ("payment.payment_authorized", "платіж авторизовано");
   P ("payment.payment_captured", "платіж проведено");
   P ("payment.payment_refunded", "платіж повернено");
   P ("payment.payment_disputed", "платіж оскаржено");
   P ("payment.payment_requires_action", "платіж потребує дій");
   P ("payment.payment_expired", "термін платежу минув");
   P ("ui.empty", "порожньо");
   P ("ui.loading", "завантаження");
   P ("ui.saving", "збереження");
   P ("ui.saved", "збережено");
   P ("ui.unsaved", "не збережено");
   P ("ui.retrying", "повторна спроба");
   P ("ui.paused", "призупинено");
   P ("ui.complete", "завершено");
   P ("ui.failed", "помилка");
   P ("ui.due_soon", "скоро термін");
   P ("ui.overdue", "прострочено");
   P ("ui.last_seen", "остання активність");
   P ("ui.updated_just_now", "щойно оновлено");
   P ("queue.queued", "у черзі");
   P ("queue.running", "виконується");
   P ("queue.waiting", "очікування");
   P ("queue.blocked", "заблоковано");
   P ("queue.canceled_job", "завдання скасовано");
   P ("queue.completed_job", "завдання виконано");
   P ("search.filtering", "фільтрування");
   P ("search.filtered", "відфільтровано");
   P ("search.no_matches", "збігів немає");
   P ("search.search_ready", "пошук готовий");
   P ("search.search_failed", "помилка пошуку");
   P ("search.query_too_short", "запит закороткий");
   P ("security.secure", "захищено");
   P ("security.insecure", "не захищено");
   P ("security.vulnerable", "вразливо");
   P ("security.encrypted", "зашифровано");
   P ("security.unencrypted", "не зашифровано");
   P ("security.token_expired", "термін дії токена минув");
   P ("sync.sync_idle", "синхронізація неактивна");
   P ("sync.syncing_now", "триває синхронізація");
   P ("sync.sync_queued", "синхронізація в черзі");
   P ("sync.sync_conflict", "конфлікт синхронізації");
   P ("sync.sync_complete", "синхронізацію завершено");
   P ("sync.sync_error", "помилка синхронізації");
   P ("task.todo", "до виконання");
   P ("task.in_progress", "у роботі");
   P ("task.done", "готово");
   P ("task.skipped", "пропущено");
   P ("task.blocked_task", "заблоковано");
   P ("task.waiting_on", "очікує");
   P ("ticket.ticket_new", "нова заявка");
   P ("ticket.ticket_open", "заявка відкрита");
   P ("ticket.ticket_waiting", "заявка очікує");
   P ("ticket.ticket_escalated", "заявку ескальовано");
   P ("ticket.ticket_resolved", "заявку вирішено");
   P ("ticket.ticket_closed", "заявку закрито");
   P ("transfer.importing", "імпорт");
   P ("transfer.imported", "імпортовано");
   P ("transfer.import_failed", "помилка імпорту");
   P ("transfer.exporting", "експорт");
   P ("transfer.exported", "експортовано");
   P ("transfer.export_failed", "помилка експорту");
   P ("validation.required", "обов’язково");
   P ("validation.optional", "необов’язково");
   P ("validation.invalid", "некоректно");
   P ("validation.too_short", "закоротке");
   P ("validation.too_long", "задовге");
   P ("validation.out_of_range", "поза допустимим діапазоном");
   P ("validation.already_exists", "уже існує");
   P ("workflow.draft", "чернетка");
   P ("workflow.in_review", "на перевірці");
   P ("workflow.approved", "схвалено");
   P ("workflow.rejected", "відхилено");
   P ("workflow.published", "опубліковано");
   P ("workflow.archived", "в архіві");
   P ("database.database_online", "база даних доступна");
   P ("database.database_offline", "база даних недоступна");
   P ("database.database_degraded", "база даних працює з перебоями");
   P ("database.database_migrating", "міграція бази даних");
   P ("database.database_migration_failed", "помилка міграції бази даних");
   P ("database.database_replicating", "реплікація бази даних");
   P ("database.database_replication_lagging", "відставання реплікації бази даних");
   P ("database.database_backup_running", "триває резервне копіювання бази даних");
   P ("database.database_backup_failed",
      "помилка резервного копіювання бази "
      & "даних");
   P ("calendar_difference.case.future", "accusative");
   P ("calendar_difference.case.past", "accusative");
   P ("date_comparison.after", "{current} на {quantity} пізніше, ніж {baseline}");
   P ("date_comparison.before", "{current} на {quantity} раніше, ніж {baseline}");
   P ("date_comparison.case.after", "accusative");
   P ("date_comparison.case.before", "accusative");
   P ("count",
      "{count, plural, one {# {one}} few {# {few}} many {# {genitive_other}} "
      & "other {# {genitive_one}}}");
   P ("noun",
      "{count, plural, one {{one}} few {{few}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("noun.accusative",
      "{count, plural, one {{accusative_one}} few {{accusative_other}} many "
      & "{{genitive_other}} other {{genitive_one}}}");
   P ("number_comparison.case", "accusative");
   P ("times_noun",
      "{count, plural, =0 {{other}: жодного разу} =1 {{one}: "
      & "один раз} =2 {{other}: двічі} one {{other}: {count} "
      & "раз} few {{other}: {count} рази} many {{other}: {count} "
      & "разів} other {{other}: {count} раза}}");
   P ("availability.all",
      "доступно {available} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}");
   P ("availability.none", "немає доступних {genitive_other}");
   P ("availability.partial",
      "доступно {available} з {total} {total, plural, one "
      & "{{genitive_one}} few {{genitive_other}} many {{genitive_other}} other "
      & "{{genitive_one}}}, недоступно {unavailable}");
   P ("operation_progress", "{name} — {state}: {details}");
   P ("operation.queued", "у черзі");
   P ("operation.running", "виконується");
   P ("operation.blocked", "заблоковано");
   P ("operation.retrying", "повторна спроба");
   P ("operation.succeeded", "успішно");
   P ("operation.partially_succeeded", "частково успішно");
   P ("operation.failed", "помилка");
   P ("operation.canceled", "скасовано");
   P ("operation.skipped", "пропущено");
   P ("operation.stale", "застаріло");
   P ("operation.unknown_state", "невідомо");
   P ("operation.last_success", "{name} — останній успішний запуск: {time}");
   P ("operation.next_retry", "{name} — наступна спроба: {time}");
   P ("operation.stale_run", "{name} — не оновлювалося {time}");
   P ("summary.skipped", "пропущено: {count}");
   P ("summary.retried", "повторено: {count}");
   P ("summary.canceled", "скасовано: {count}");
   P ("system.service.operational", "працює");
   P ("system.service.degraded", "знижена продуктивність");
   P ("system.service.partial_outage", "частковий збій");
   P ("system.service.major_outage", "серйозний збій");
   P ("system.service.maintenance", "на обслуговуванні");
   P ("system.service.unknown", "стан сервісу невідомий");
   P ("system.health.healthy", "у нормі");
   P ("system.health.warning", "попередження");
   P ("system.health.critical", "критичний стан");
   P ("system.health.unavailable", "недоступний");
   P ("system.health.unknown_health", "стан невідомий");
   P ("system.readiness.ready", "готовий");
   P ("system.readiness.not_ready", "не готовий");
   P ("system.readiness.starting", "запускається");
   P ("system.readiness.draining", "виведення з роботи");
   P ("system.readiness.stopped", "зупинений");
   P ("system.readiness.unknown_readiness", "готовність невідома");
   P ("system.component.online", "у мережі");
   P ("system.component.offline", "не в мережі");
   P ("system.component.starting", "запускається");
   P ("system.component.stopping", "зупиняється");
   P ("system.component.restarting", "перезапускається");
   P ("system.component.unknown", "стан компонента невідомий");
   P ("system.check.passing", "пройдено");
   P ("system.check.failing", "не пройдено");
   P ("system.check.warning", "попередження");
   P ("system.check.skipped", "пропущено");
   P ("system.check.timed_out", "час очікування вичерпано");
   P ("system.check.unknown", "стан перевірки невідомий");
   P ("system.incident.investigating", "розслідується");
   P ("system.incident.identified", "причину встановлено");
   P ("system.incident.monitoring", "спостереження");
   P ("system.incident.resolved", "усунено");
   P ("system.incident.scheduled_maintenance", "планове обслуговування");
   P ("system.named", "{name}: {state}");
   P ("system.check_named", "перевірка {name}: {state}");
   P ("system.count.components",
      "{count, plural, =0 {немає компонентів} one {{count} "
      & "компонент} few {{count} компоненти} many {{count} "
      & "компонентів} other {{count} компонента}}");
   P ("system.count.checks",
      "{count, plural, =0 {немає перевірок} one {{count} "
      & "перевірка} few {{count} перевірки} many {{count} "
      & "перевірок} other {{count} перевірки}}");
   P ("system.count.incidents",
      "{count, plural, =0 {немає інцидентів} one {{count} "
      & "інцидент} few {{count} інциденти} many {{count} "
      & "інцидентів} other {{count} інциденту}}");
   P ("system.uptime", "час безвідмовної роботи: {measure}");
   P ("system.latency", "затримка: {measure}");
   P ("system.maintenance_window", "вікно обслуговування: {time}");
   P ("system.last_checked", "остання перевірка: {time}");
   P ("system.http.informational", "інформаційна відповідь");
   P ("system.http.successful", "успішна відповідь");
   P ("system.http.redirection", "перенаправлення");
   P ("system.http.client_error", "помилка клієнта");
   P ("system.http.server_error", "помилка сервера");
   P ("system.exit.success", "код виходу {code}: успіх");
   P ("system.exit.failure", "код виходу {code}: збій");
   P ("system.exit.usage_error", "код виходу {code}: помилка використання");
   P ("system.exit.not_executable",
      "код виходу {code}: команда не є "
      & "виконуваною");
   P ("system.exit.not_found", "код виходу {code}: команду не знайдено");
   P ("system.exit.invalid_argument",
      "код виходу {code}: неприпустимий "
      & "аргумент exit");
   P ("system.exit.signal",
      "код виходу {code}: завершення за сигналом "
      & "{signal}");
   P ("validation.problem.required", "{field}: обов’язкове поле");
   P ("validation.problem.minimum", "{field}: значення менше за мінімальне");
   P ("validation.problem.maximum", "{field}: значення більше за максимальне");
   P ("validation.problem.range",
      "{field}: значення поза допустимим "
      & "діапазоном");
   P ("validation.problem.pattern", "{field}: не відповідає шаблону");
   P ("validation.problem.choice",
      "{field}: значення має бути одним із "
      & "допустимих варіантів");
   P ("validation.problem.dependency", "{field}: залежить від іншого поля");
   P ("validation.problem.custom", "{field}: недійсне значення");
   P ("validation.constraint.no_relation",
      "{field}: очікується допустиме значення "
      & "{value}");
   P ("validation.constraint.less_than", "{field}: значення має бути менше, ніж {value}");
   P ("validation.constraint.less_or_equal",
      "{field}: значення має бути не більше, ніж "
      & "{value}");
   P ("validation.constraint.greater_than", "{field}: значення має бути більше, ніж {value}");
   P ("validation.constraint.greater_or_equal",
      "{field}: значення має бути не менше, ніж "
      & "{value}");
   P ("validation.constraint.equal_to", "{field}: значення має дорівнювати {value}");
   P ("validation.constraint.not_equal_to", "{field}: значення не має дорівнювати {value}");
   P ("validation.constraint.before_field", "{field}: значення має бути раніше, ніж {value}");
   P ("validation.constraint.after_field",
      "{field}: значення має бути пізніше, ніж "
      & "{value}");
   P ("validation.choices", "{field}: допустимі значення: {choices}");
   P ("frame.detail", "{text} ({detail})");
   P ("frame.got", "{text}, отримано: {actual}");
   P ("frame.also", "{text}, {detail}");
   P ("frame.retry", "{text}, повторна спроба через {time}");
   P ("net_diagnostic.dns", "{endpoint}: не вдалося виконати DNS-запит");
   P ("net_diagnostic.tcp",
      "{endpoint}: не вдалося встановити "
      & "TCP-з’єднання");
   P ("net_diagnostic.tls", "{endpoint}: помилка TLS-сертифіката");
   P ("net_diagnostic.http", "{endpoint}: помилка HTTP-запиту");
   P ("net_diagnostic.proxy", "{endpoint}: помилка проксі-сервера");
   P ("net_diagnostic.timeout", "{endpoint}: перевищено час очікування");
   P ("net_diagnostic.reset", "{endpoint}: з’єднання скинуто");
   P ("net_diagnostic.unknown_network", "{endpoint}: невідома проблема мережі");
   P ("progress.state.not_started", "не розпочато");
   P ("progress.state.running", "виконується");
   P ("progress.state.stalled", "зависло");
   P ("progress.state.retrying", "повторна спроба");
   P ("progress.state.complete", "завершено");
   P ("progress.state.failed", "збій");
   P ("progress.of", "{subject}: виконано {done} з {total} ({percent} %), {state}");
   P ("progress.done", "{subject}: виконано {done}, {state}");
   P ("collection.summary",
      "{name}: {total} {total, plural, one {елемент} few "
      & "{елементи} many {елементів} other "
      & "{елемента}}, {unique} {unique, plural, one {унікальне "
      & "значення} few {унікальні значення} many "
      & "{унікальних значень} other {унікального "
      & "значення}}, {duplicates} {duplicates, plural, one "
      & "{дублікат} few {дублікати} many "
      & "{дублікатів} other {дубліката}}, {outliers} "
      & "{outliers, plural, one {викид} few {викиди} many "
      & "{викидів} other {викиду}}");
   P ("top_frequency",
      "{name}: найчастіше {value} ({count} {count, plural, one "
      & "{раз} few {рази} many {разів} other {разу}})");
   P ("calendar_date.fiscal_year", "ФР {year}");
   P ("calendar_date.fiscal_quarter", "ФР {year}, {part}-й кв.");
   P ("calendar_date.fiscal_half", "ФР {year}, {part}-е півр.");
   P ("calendar_date.fiscal_year_end", "кінець ФР {year}");
   P ("calendar_date.semester", "{part}-й сем. {year}");
   P ("calendar_date.half_year", "{part}-е півр. {year}");
   P ("calendar_date.half_year_phrase",
      "{part, plural, =1 {перше півріччя {year} р.} other "
      & "{друге півріччя {year} р.}}");
   P ("calendar_date.month_phase",
      "{phase, select, early {{text} (початок)} mid {{text} "
      & "(середина)} other {{text} (кінець)}}");
   P ("calendar_date.quarter_phase",
      "{phase, select, early {{text} (початок)} mid {{text} "
      & "(середина)} other {{text} (кінець)}}");
   P ("calendar_range.weekend.last", "минулі вихідні");
   P ("calendar_range.weekend.this", "ці вихідні");
   P ("calendar_range.weekend.next", "наступні вихідні");
   P ("calendar_range.weekend_of", "вихідні {date}");
   P ("calendar_range.week.last", "минулий тиждень");
   P ("calendar_range.week.this", "цей тиждень");
   P ("calendar_range.week.next", "наступний тиждень");
   P ("calendar_range.week_of", "тиждень з {date}");
   P ("calendar_range.between", "{first} – {last}");
   P ("http.reason.100", "продовжити");
   P ("http.reason.101", "перемикання протоколів");
   P ("http.reason.102", "обробляється");
   P ("http.reason.103", "ранні підказки");
   P ("http.reason.200", "OK");
   P ("http.reason.201", "створено");
   P ("http.reason.202", "прийнято");
   P ("http.reason.203", "неавторитетна інформація");
   P ("http.reason.204", "немає вмісту");
   P ("http.reason.205", "скинути вміст");
   P ("http.reason.206", "частковий вміст");
   P ("http.reason.207", "багатостатусна відповідь");
   P ("http.reason.208", "уже повідомлено");
   P ("http.reason.226", "IM використано");
   P ("http.reason.300", "багато варіантів");
   P ("http.reason.301", "переміщено назавжди");
   P ("http.reason.302", "знайдено");
   P ("http.reason.303", "дивіться інше");
   P ("http.reason.304", "не змінено");
   P ("http.reason.305", "використовуйте проксі");
   P ("http.reason.307", "тимчасове перенаправлення");
   P ("http.reason.308", "постійне перенаправлення");
   P ("http.reason.400", "неправильний запит");
   P ("http.reason.401", "не авторизовано");
   P ("http.reason.402", "потрібна оплата");
   P ("http.reason.403", "заборонено");
   P ("http.reason.404", "не знайдено");
   P ("http.reason.405", "метод не дозволено");
   P ("http.reason.406", "неприйнятно");
   P ("http.reason.407", "потрібна автентифікація проксі");
   P ("http.reason.408", "час очікування запиту вичерпано");
   P ("http.reason.409", "конфлікт");
   P ("http.reason.410", "видалено");
   P ("http.reason.411", "потрібна довжина");
   P ("http.reason.412", "передумова не виконана");
   P ("http.reason.413", "вміст завеликий");
   P ("http.reason.414", "URI задовгий");
   P ("http.reason.415", "непідтримуваний тип даних");
   P ("http.reason.416", "діапазон неприйнятний");
   P ("http.reason.417", "очікування не виконано");
   P ("http.reason.418", "я — чайник");
   P ("http.reason.421", "неправильно спрямований запит");
   P ("http.reason.422", "необроблюваний вміст");
   P ("http.reason.423", "заблоковано");
   P ("http.reason.424", "невдала залежність");
   P ("http.reason.425", "зарано");
   P ("http.reason.426", "потрібне оновлення");
   P ("http.reason.428", "потрібна передумова");
   P ("http.reason.429", "забагато запитів");
   P ("http.reason.431", "поля заголовка запиту завеликі");
   P ("http.reason.451", "недоступно з юридичних причин");
   P ("http.reason.500", "внутрішня помилка сервера");
   P ("http.reason.501", "не реалізовано");
   P ("http.reason.502", "поганий шлюз");
   P ("http.reason.503", "сервіс недоступний");
   P ("http.reason.504", "шлюз не відповідає");
   P ("http.reason.505", "версія HTTP не підтримується");
   P ("http.reason.506", "варіант також веде узгодження");
   P ("http.reason.507", "недостатньо місця у сховищі");
   P ("http.reason.508", "виявлено цикл");
   P ("http.reason.510", "не розширено");
   P ("http.reason.511", "потрібна мережева автентифікація");
   P ("errno.reason.0", "успіх");
   P ("errno.reason.1", "дію заборонено");
   P ("errno.reason.2", "немає такого файла або каталогу");
   P ("errno.reason.3", "немає такого процесу");
   P ("errno.reason.4", "перерваний системний виклик");
   P ("errno.reason.5", "помилка введення-виведення");
   P ("errno.reason.6", "немає такого пристрою чи адреси");
   P ("errno.reason.9", "помилковий дескриптор файла");
   P ("errno.reason.11", "ресурс тимчасово недоступний");
   P ("errno.reason.12", "не вдалося розподілити пам’ять");
   P ("errno.reason.13", "відмовлено у доступі");
   P ("errno.reason.17", "файл вже існує");
   P ("errno.reason.20", "не є каталогом");
   P ("errno.reason.21", "є каталогом");
   P ("errno.reason.22", "некоректний аргумент");
   P ("errno.reason.24", "забагато відкритих файлів");
   P ("errno.reason.28", "недостатньо місця на пристрої");
   P ("errno.reason.32", "канал обірвано");
   P ("errno.reason.98", "адресу вже використано");
   P ("errno.reason.110",
      "перевищено інтервал очікування "
      & "з’єднання");
   P ("errno.reason.111", "у з’єднанні відмовлено");
   P ("signal.reason.1", "від’єднання");
   P ("signal.reason.2", "перервати");
   P ("signal.reason.3", "вихід");
   P ("signal.reason.4", "помилкова інструкція");
   P ("signal.reason.5", "переривання на точці зупину");
   P ("signal.reason.6", "перервано");
   P ("signal.reason.7", "помилка каналу обміну даними");
   P ("signal.reason.8", "помилка обчислень з рухомою комою");
   P ("signal.reason.9", "вбито");
   P ("signal.reason.10", "визначений користувачем сигнал 1");
   P ("signal.reason.11", "помилка адресування");
   P ("signal.reason.12", "визначений користувачем сигнал 2");
   P ("signal.reason.13", "канал обірвано");
   P ("signal.reason.14", "сигнал таймера");
   P ("signal.reason.15", "припинено");
   P ("signal.reason.17", "дочірній процес завершив роботу");
   P ("signal.reason.18", "поновлено");
   P ("signal.reason.19", "зупинено (сигнал)");
   P ("signal.reason.20", "зупинено");
   P ("signal.reason.28", "зміна вікна");
   P ("sqlstate.reason.00", "успішне завершення");
   P ("sqlstate.reason.01", "попередження");
   P ("sqlstate.reason.02", "немає даних");
   P ("sqlstate.reason.08", "виняток з’єднання");
   P ("sqlstate.reason.0a", "можливість не підтримується");
   P ("sqlstate.reason.22", "виняток даних");
   P ("sqlstate.reason.23", "порушення обмеження цілісності");
   P ("sqlstate.reason.24", "неприпустимий стан курсора");
   P ("sqlstate.reason.25", "неприпустимий стан транзакції");
   P ("sqlstate.reason.28",
      "неприпустима специфікація "
      & "авторизації");
   P ("sqlstate.reason.2d", "неприпустиме завершення транзакції");
   P ("sqlstate.reason.3d", "неприпустима назва каталогу");
   P ("sqlstate.reason.3f", "неприпустима назва схеми");
   P ("sqlstate.reason.40", "відкат транзакції");
   P ("sqlstate.reason.42",
      "синтаксична помилка або порушення "
      & "правила доступу");
   P ("sqlstate.reason.53", "недостатньо ресурсів");
   P ("sqlstate.reason.54", "перевищено обмеження програми");
   P ("sqlstate.reason.55", "об’єкт не в необхідному стані");
   P ("sqlstate.reason.57", "втручання оператора");
   P ("sqlstate.reason.58", "системна помилка");
   P ("sqlstate.reason.hv", "помилка обгортки сторонніх даних");
   P ("sqlstate.reason.p0", "помилка PL/pgSQL");
   P ("sqlstate.reason.xx", "внутрішня помилка");
   P ("system.signal_numbered", "сигнал {number} {name} {reason}");
   P ("http.reason.unknown", "невідомий статус");
   P ("errno.reason.unknown", "невідома помилка");
   P ("signal.reason.unknown", "невідомий сигнал");
   P ("sqlstate.reason.unknown", "невідомий клас SQLSTATE");
   P ("diff.changed", "різниця {path}: змінено з {before} на {after}");
   P ("diff.added", "різниця {path}: додано {after}");
   P ("diff.removed", "різниця {path}: видалено {before}");
   P ("diff.unchanged", "різниця {path}: без змін");
   P ("diff.redacted",
      "різниця {path}: змінено; значення "
      & "приховано");
   P ("validation.result",
      "результат перевірки: {fields} {fields, plural, one "
      & "{поле} few {поля} many {полів} other {поля}}, "
      & "{errors} {errors, plural, one {помилка} few {помилки} "
      & "many {помилок} other {помилки}}, {warnings} {warnings, "
      & "plural, one {попередження} few {попередження} "
      & "many {попереджень} other {попередження}}, "
      & "{required} {required, plural, one {обов’язкове поле} "
      & "few {обов’язкові поля} many {обов’язкових "
      & "полів} other {обов’язкового поля}}, {hidden} "
      & "{hidden, plural, one {прихована проблема} few "
      & "{приховані проблеми} many {прихованих "
      & "проблем} other {прихованої проблеми}}");
   P ("file.kind.plain", "файл");
   P ("file.kind.directory", "каталог");
   P ("file.kind.archive", "архів");
   P ("file.kind.compressed", "стиснений файл");
   P ("file.kind.image", "зображення");
   P ("file.kind.script", "скрипт");
   P ("file.kind.executable", "виконуваний файл");
   P ("file.kind.unknown", "невідомий файл");
   P ("file.metadata", "файл {name}: {kind}");
   P ("file.checksum", "{text}, контрольна сума {checksum}");
   P ("file.signature_match",
      "сигнатура файлу {name}: {kind}, відповідає "
      & "розширенню");
   P ("file.signature_mismatch",
      "сигнатура файлу {name}: за розширенням — "
      & "{expected}, за вмістом — {actual}");
   P ("network_event.connecting", "підключення");
   P ("network_event.connected", "підключено");
   P ("network_event.redirected", "переспрямовано");
   P ("network_event.retrying", "повторна спроба");
   P ("network_event.rate_limited", "обмеження частоти");
   P ("network_event.tls_failed", "помилка TLS");
   P ("network_event.stalled", "немає прогресу");
   P ("network_event.complete", "завершено");
   P ("network_event.failed", "збій");
   P ("network.session", "мережа {endpoint}: {state}");
   P ("diff_node.field", "поле");
   P ("diff_node.object", "об’єкт");
   P ("diff_node.list", "список");
   P ("diff.node",
      "вузол різниці {path}: {kind}, {count} {count, plural, one "
      & "{зміна} few {зміни} many {змін} other {зміни}}");
   P ("checksum.not_checked", "контрольну суму не перевірено");
   P ("checksum.valid", "контрольна сума правильна");
   P ("checksum.mismatch", "контрольна сума не збігається");
   P ("checksum.missing", "контрольна сума відсутня");
   P ("product_code", "код товару {kind}: {value}, {state}");
   P ("time_zone.utc", "часовий пояс: UTC");
   P ("time_zone.offset", "часовий пояс: {offset}");
   P ("time_zone.named", "часовий пояс: {name} ({offset})");
   P ("time_zone.local", "часовий пояс: місцевий час");
   P ("time_zone.unknown", "часовий пояс: невідомий пояс");
   P ("time_zone.dst", "{text}, з переходом на літній час");
   P ("zoned_time.plain", "час із поясом: {time} {offset}");
   P ("zoned_time.named", "час із поясом: {time} {name} ({offset})");
   P ("zoned_time.ambiguous", "{text}, неоднозначний місцевий час");
   P ("number.under", "нижче {value}");
   P ("number.up_to", "до {value}");
   P ("number.between", "між {low} і {high}");
   P ("number.range_words", "{low} – {high}");
   P ("number.uncertainty_words", "{value} плюс-мінус {delta}");
   P ("number.range_inclusive", "від {low} до {high} включно");
   P ("number.range_exclusive", "більше {low} і менше {high}");
   P ("number.range_low_inclusive", "не менше {low} і менше {high}");
   P ("number.range_high_inclusive", "більше {low} і не більше {high}");
   P ("number.at_least", "щонайменше {value}");
   P ("number.more_than", "понад {value}");
   P ("number.at_most", "щонайбільше {value}");
   P ("number.less_than", "менше {value}");
   P ("number.exactly", "рівно {value}");
   P ("number.within", "{value} у межах {bounds}");
   P ("number.below", "{value} нижче діапазону {bounds}");
   P ("number.above", "{value} вище діапазону {bounds}");
   P ("number.per", "{numerator} на {denominator}");
   P ("number.one_in", "1 з {whole}");
   P ("number.out_of", "{value} з {whole}");
   P ("number.unchanged", "без змін");
   P ("number.change_up", "зростання на {quantity}");
   P ("number.change_down", "зниження на {quantity}");
   P ("number.change_more", "на {quantity} {tail} більше");
   P ("number.change_fewer", "на {quantity} {tail} менше");
   P ("number.since", "{change} (починаючи з: {since})");
end Locale_Uk;
