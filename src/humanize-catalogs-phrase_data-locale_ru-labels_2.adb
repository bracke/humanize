separate (Humanize.Catalogs.Phrase_Data.Locale_Ru)
procedure Labels_2 is
begin
   P ("label.events.event_count_label",
      "{count, plural, =0 {нет событий} other {{count, plural, one "
      & "{{count, number} событие} few {{count, number} события} "
      & "many {{count, number} событий} other {{count, number} "
      & "события}}}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {запланировано} "
      & "tentative_event {предварительно} in_progress_event "
      & "{идёт} completed_event {завершено} canceled_event "
      & "{отменено} other {перенесено}}");
   P ("label.events.event_location_label", "{name}, {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {запланированное "
      & "событие} tentative_event {предварительное "
      & "событие} in_progress_event {текущее событие} "
      & "completed_event {завершённое событие} canceled_event "
      & "{отменённое событие} other {перенесённое "
      & "событие}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {публичное событие} "
      & "private_event {частное событие} busy_event {занят} "
      & "other {свободен}}");
   P ("label.events.organizer_label", "организатор: {name}");
   P ("label.events.rsvp_label",
      "ответ на приглашение: {state, select, not_responded "
      & "{нет ответа} accepted {принято} declined "
      & "{отклонено} maybe {возможно} other {в листе "
      & "ожидания}}");
   P ("label.events.reminder_label", "напоминание: {time_text}");
   P ("label.events.rescheduled_label", "{name}: перенесено на {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} символ} few {{used, number} "
      & "символа} many {{used, number} символов} other {{used, "
      & "number} символа}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {без ограничения символов} "
      & "other {{limit, plural, one {не более {limit, number} "
      & "символа} few {не более {limit, number} символов} "
      & "many {не более {limit, number} символов} other {не "
      & "более {limit, number} символа}}}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} символ} "
      & "few {{used, number} символа} many {{used, number} "
      & "символов} other {{used, number} символа}}} other "
      & "{{limit, plural, one {{used, number} из {limit, number} "
      & "символа} few {{used, number} из {limit, number} "
      & "символов} many {{used, number} из {limit, number} "
      & "символов} other {{used, number} из {limit, number} "
      & "символа}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {необязательное "
      & "поле} other {обязательное поле}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {корректно} invalid_input "
      & "{некорректно} required_input {обязательно} "
      & "optional_input {необязательно} disabled_input "
      & "{отключено} other {только для чтения}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {нет проблем в "
      & "форме} other {{warnings, plural, one {{warnings, number} "
      & "предупреждение} few {{warnings, number} "
      & "предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {{errors, number} ошибка} few {{errors, "
      & "number} ошибки} many {{errors, number} ошибок} other "
      & "{{errors, number} ошибки}}} other {{errors, plural, one "
      & "{{errors, number} ошибка} few {{errors, number} ошибки} "
      & "many {{errors, number} ошибок} other {{errors, number} "
      & "ошибки}}, {warnings, plural, one {{warnings, number} "
      & "предупреждение} few {{warnings, number} "
      & "предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {не начато} editing_form "
      & "{редактирование} dirty_form {несохранённые "
      & "изменения} saving_form {сохранение} saved_form "
      & "{сохранено} submitted_form {отправлено} other "
      & "{ошибка отправки}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {корректное значение} "
      & "invalid_input {некорректное значение} "
      & "required_input {обязательное поле} optional_input "
      & "{необязательное поле} disabled_input "
      & "{отключённое поле} other {поле только для "
      & "чтения}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {не начато} editing_form "
      & "{редактирование} dirty_form {несохранённые "
      & "изменения} saving_form {сохранение формы} "
      & "saved_form {форма сохранена} submitted_form {форма "
      & "отправлена} other {{errors, plural, =0 {ошибка "
      & "отправки} other {ошибка отправки: {errors, "
      & "plural, one {{errors, number} ошибка} few {{errors, number} "
      & "ошибки} many {{errors, number} ошибок} other {{errors, "
      & "number} ошибки}}}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {нет несохранённых "
      & "изменений} other {{count, plural, one {{count, number} "
      & "несохранённое изменение} few {{count, number} "
      & "несохранённых изменения} many {{count, number} "
      & "несохранённых изменений} other {{count, number} "
      & "несохранённого изменения}}}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {нет "
      & "доступного имени} low_contrast {низкий "
      & "контраст} skipped_heading_level {пропущен "
      & "уровень заголовка} missing_form_label {нет "
      & "метки поля формы} invalid_aria {недопустимый "
      & "ARIA} keyboard_trap {ловушка клавиатуры} other "
      & "{неизвестная проблема доступности}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}: сводка доступности — {landmarks, plural, "
      & "one {{landmarks, number} ориентир} few {{landmarks, number} "
      & "ориентира} many {{landmarks, number} ориентиров} "
      & "other {{landmarks, number} ориентира}}, {headings, plural, "
      & "one {{headings, number} заголовок} few {{headings, number} "
      & "заголовка} many {{headings, number} заголовков} "
      & "other {{headings, number} заголовка}}, {issues, plural, one "
      & "{{issues, number} проблема} few {{issues, number} "
      & "проблемы} many {{issues, number} проблем} other "
      & "{{issues, number} проблемы}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {добавьте "
      & "доступное имя} low_contrast {увеличьте "
      & "контрастность текста} skipped_heading_level "
      & "{используйте уровни заголовков по "
      & "порядку} missing_form_label {свяжите метку с "
      & "элементом формы} invalid_aria {используйте "
      & "допустимую роль или атрибут ARIA} "
      & "keyboard_trap {дайте фокусу клавиатуры "
      & "покинуть компонент} other {проверьте "
      & "проблему доступности}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {нет проблем "
      & "доступности} other {{issues, plural, one {{issues, number} "
      & "проблема доступности} few {{issues, number} "
      & "проблемы доступности} many {{issues, number} "
      & "проблем доступности} other {{issues, number} "
      & "проблемы доступности}}}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {атрибут id} class_attribute "
      & "{атрибут class} data_attribute {атрибут data} "
      & "aria_attribute {атрибут ARIA} role_attribute {атрибут "
      & "role} link_attribute {атрибут ссылки} media_attribute "
      & "{атрибут медиа} form_attribute {атрибут формы} "
      & "boolean_attribute {логический атрибут} "
      & "event_attribute {атрибут обработчика событий} "
      & "other {неизвестный атрибут}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {нет "
      & "проблем в форме} other {{warnings, plural, one "
      & "{{warnings, number} предупреждение} few {{warnings, "
      & "number} предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}}}} other {{warnings, plural, =0 "
      & "{{errors, plural, one {{errors, number} ошибка} few {{errors, "
      & "number} ошибки} many {{errors, number} ошибок} other "
      & "{{errors, number} ошибки}}} other {{errors, plural, one "
      & "{{errors, number} ошибка} few {{errors, number} ошибки} "
      & "many {{errors, number} ошибок} other {{errors, number} "
      & "ошибки}}, {warnings, plural, one {{warnings, number} "
      & "предупреждение} few {{warnings, number} "
      & "предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {ориентир: баннер} "
      & "navigation_role {ориентир: навигация} main_role "
      & "{ориентир: основное содержимое} "
      & "complementary_role {ориентир: дополнительное "
      & "содержимое} contentinfo_role {ориентир: "
      & "сведения о содержимом} search_role "
      & "{ориентир: поиск} form_role {ориентир: "
      & "форма} region_role {ориентир: регион} dialog_role "
      & "{диалог} alert_role {активная область: "
      & "оповещение} status_role {активная область: "
      & "статус} other {неизвестный ориентир}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {срочное обновление} "
      & "other {обычное обновление}}: {update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {текст} html_content {HTML} "
      & "json_content {JSON} xml_content {XML} image_content "
      & "{изображение} audio_content {аудио} video_content "
      & "{видео} font_content {шрифт} archive_content {архив} "
      & "binary_content {двоичные данные} form_content "
      & "{данные формы} other {неизвестное "
      & "содержимое}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {тег документа} metadata_tag "
      & "{тег метаданных} section_tag {тег раздела} "
      & "text_tag {текстовый тег} link_tag {тег ссылки} "
      & "media_tag {тег медиа} form_tag {тег формы} table_tag "
      & "{тег таблицы} interactive_tag {интерактивный "
      & "тег} scripting_tag {тег сценария} other "
      & "{неизвестный тег}}");
   P ("label.media.duration_label", "длительность: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {изображение} video_media "
      & "{видео} audio_media {аудио} pdf_document {документ "
      & "PDF} text_document {текстовый документ} archive_media "
      & "{архив} other {медиафайл}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {готово} processing_media "
      & "{обработка} transcoding_media "
      & "{перекодирование} thumbnail_missing {миниатюра "
      & "недоступна} metadata_missing {нет метаданных} "
      & "locked_document {документ заблокирован} other "
      & "{недоступно}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {изображение} "
      & "video_media {видео} audio_media {аудио} pdf_document "
      & "{документ PDF} text_document {текстовый "
      & "документ} archive_media {архив} other "
      & "{медиафайл}}): {state, select, ready_media {готово} "
      & "processing_media {обработка} transcoding_media "
      & "{перекодирование} thumbnail_missing {миниатюра "
      & "недоступна} metadata_missing {нет метаданных} "
      & "locked_document {заблокировано} other "
      & "{недоступно}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {нет страниц} other {{pages, plural, one "
      & "{{pages, number} страница} few {{pages, number} "
      & "страницы} many {{pages, number} страниц} other {{pages, "
      & "number} страницы}}}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: апелляция, {state, select, open_report {жалоба "
      & "открыта} triaged_report {жалоба принята в "
      & "работу} actioned_report {меры приняты} "
      & "dismissed_report {жалоба отклонена} appealed_report "
      & "{жалоба обжалована} other {жалоба "
      & "закрыта}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {без мер модерации} flagged "
      & "{помечено} hidden {скрыто модератором} "
      & "restored {восстановлено} marked_spam {помечено "
      & "как спам} removed {удалено} other {передано на "
      & "эскалацию}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {без мер модерации} "
      & "flagged {помечено} hidden {скрыто "
      & "модератором} restored {восстановлено} "
      & "marked_spam {помечено как спам} removed "
      & "{удалено} other {передано на эскалацию}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {очередь "
      & "модерации пуста} other {ожидают проверки: "
      & "{pending, number}}}} other {ожидают проверки: {pending, "
      & "number}, передано на эскалацию: {escalated, "
      & "number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {жалоба открыта} "
      & "triaged_report {жалоба принята в работу} "
      & "actioned_report {меры приняты} dismissed_report "
      & "{жалоба отклонена} appealed_report {жалоба "
      & "обжалована} other {жалоба закрыта}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {жалоба открыта} "
      & "triaged_report {жалоба принята в работу} "
      & "actioned_report {меры приняты} dismissed_report "
      & "{жалоба отклонена} appealed_report {жалоба "
      & "обжалована} other {жалоба закрыта}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {ожидает "
      & "проверки} approved {одобрено} rejected "
      & "{отклонено} needs_changes {требуются "
      & "изменения} other {проверка передана на "
      & "эскалацию}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {ожидает проверки} "
      & "approved {одобрено} rejected {отклонено} "
      & "needs_changes {требуются изменения} other "
      & "{проверка передана на эскалацию}}");
   P ("label.navigation.back_label", "назад: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {навигационная цепочка "
      & "пуста} other {навигационная цепочка, "
      & "уровней: {depth, number}}}");
   P ("label.navigation.current_page_label", "текущая страница: {name}");
   P ("label.navigation.external_link_label", "{name}: внешняя ссылка");
   P ("label.navigation.first_label", "в начало: {target}");
   P ("label.navigation.last_label", "в конец: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {нет пунктов меню} one {{count, "
      & "number} пункт меню} few {{count, number} пункта "
      & "меню} many {{count, number} пунктов меню} other "
      & "{{count, number} пункта меню}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {ссылка} menu_item {пункт "
      & "меню} tab_item {вкладка} breadcrumb_item {элемент "
      & "навигационной цепочки} section_item {раздел} "
      & "other {разделитель}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {ссылка} menu_item {пункт "
      & "меню} tab_item {вкладка} breadcrumb_item {элемент "
      & "навигационной цепочки} section_item {раздел} "
      & "other {разделитель}}, {kind, select, link_item {{state, "
      & "select, current_item {текущая} active_item {активная} "
      & "inactive_item {неактивная} disabled_item "
      & "{отключена} expanded_item {развёрнута} "
      & "collapsed_item {свёрнута} visited_item {посещённая} "
      & "other {внешняя}}} tab_item {{state, select, current_item "
      & "{текущая} active_item {активная} inactive_item "
      & "{неактивная} disabled_item {отключена} "
      & "expanded_item {развёрнута} collapsed_item {свёрнута} "
      & "visited_item {посещённая} other {внешняя}}} other "
      & "{{state, select, current_item {текущий} active_item "
      & "{активный} inactive_item {неактивный} disabled_item "
      & "{отключён} expanded_item {развёрнут} collapsed_item "
      & "{свёрнут} visited_item {посещённый} other "
      & "{внешний}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {текущий} active_item "
      & "{активный} inactive_item {неактивный} disabled_item "
      & "{отключён} expanded_item {развёрнут} collapsed_item "
      & "{свёрнут} visited_item {посещённый} other "
      & "{внешний}}");
   P ("label.navigation.next_label", "далее: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {раздел свёрнут} other "
      & "{раздел развёрнут}}{count, plural, =0 {} one {, {count, "
      & "number} элемент} few {, {count, number} элемента} many "
      & "{, {count, number} элементов} other {, {count, number} "
      & "элемента}}");
   P ("label.navigation.skip_link_label", "перейти: {target}");
   P ("label.navigation.submenu_label",
      "{name}: подменю, {count, plural, one {{count, number} "
      & "пункт} few {{count, number} пункта} many {{count, number} "
      & "пунктов} other {{count, number} пункта}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {все оповещения} "
      & "important_alerts {важные оповещения} "
      & "critical_alerts_only {только критические "
      & "оповещения} other {без оповещений}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: уведомления {state, select, preference_enabled "
      & "{включены} preference_disabled {отключены} "
      & "preference_inherited {унаследованы} other "
      & "{обязательны}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {без сводки} instant_digest "
      & "{мгновенная сводка} daily_digest {ежедневная "
      & "сводка} other {еженедельная сводка}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {включено} "
      & "preference_disabled {отключено} preference_inherited "
      & "{унаследовано} other {обязательно}}");
   P ("label.notification_preferences.quiet_hours_label", "тихие часы: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {подписка на "
      & "ветку} project_subscription {подписка на проект} "
      & "team_subscription {подписка на команду} other "
      & "{подписка на учётную запись}} {state, select, "
      & "preference_enabled {включена} preference_disabled "
      & "{отключена} preference_inherited {унаследована} "
      & "other {обязательна}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {подписка на ветку} "
      & "project_subscription {подписка на проект} "
      & "team_subscription {подписка на команду} other "
      & "{подписка на учётную запись}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} упоминает вас} "
      & "reply_event {{actor} отвечает} assignment_event {{actor} "
      & "назначает вас} approval_event {{actor} "
      & "запрашивает одобрение} alert_event {{actor} "
      & "отправляет оповещение} digest_event {{actor} "
      & "отправляет сводку} reminder_event {{actor} "
      & "отправляет напоминание} other {{actor} "
      & "отправляет системное уведомление}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {уведомление в "
      & "приложении} email_channel {уведомление по "
      & "электронной почте} sms_channel "
      & "{SMS-уведомление} push_channel "
      & "{push-уведомление} webhook_channel {уведомление "
      & "через веб-хук} other "
      & "{уведомление-сводка}}: {state, select, "
      & "pending_delivery {ожидает отправки} sent_delivery "
      & "{отправлено} delivered_delivery {доставлено} "
      & "failed_delivery {не доставлено} retrying_delivery "
      & "{повторная отправка} other {отменено}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {уведомление "
      & "ожидает отправки} sent_delivery {уведомление "
      & "отправлено} delivered_delivery {уведомление "
      & "доставлено} failed_delivery {уведомление не "
      & "доставлено} retrying_delivery {повторная "
      & "отправка уведомления} other {уведомление "
      & "отменено}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {ожидает отправки: "
      & "{time_text}} sent_delivery {отправлено: {time_text}} "
      & "delivered_delivery {доставлено: {time_text}} failed_delivery "
      & "{не доставлено: {time_text}} retrying_delivery "
      & "{повторная отправка: {time_text}} other "
      & "{отменено: {time_text}}}");
   P ("label.notifications.digest_label",
      "сводка {name}: {count, plural, =0 {нет "
      & "уведомлений} one {{count, number} уведомление} "
      & "few {{count, number} уведомления} many {{count, number} "
      & "уведомлений} other {{count, number} "
      & "уведомления}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {нет "
      & "упоминаний} one {{count, number} упоминание} few "
      & "{{count, number} упоминания} many {{count, number} "
      & "упоминаний} other {{count, number} упоминания}}} "
      & "reply_event {{count, plural, =0 {нет ответов} one {{count, "
      & "number} ответ} few {{count, number} ответа} many {{count, "
      & "number} ответов} other {{count, number} ответа}}} "
      & "assignment_event {{count, plural, =0 {нет назначений} one "
      & "{{count, number} назначение} few {{count, number} "
      & "назначения} many {{count, number} назначений} "
      & "other {{count, number} назначения}}} approval_event {{count, "
      & "plural, =0 {нет запросов на одобрение} one "
      & "{{count, number} запрос на одобрение} few {{count, "
      & "number} запроса на одобрение} many {{count, number} "
      & "запросов на одобрение} other {{count, number} "
      & "запроса на одобрение}}} alert_event {{count, plural, "
      & "=0 {нет оповещений} one {{count, number} "
      & "оповещение} few {{count, number} оповещения} many "
      & "{{count, number} оповещений} other {{count, number} "
      & "оповещения}}} digest_event {{count, plural, =0 {нет "
      & "сводок} one {{count, number} сводка} few {{count, number} "
      & "сводки} many {{count, number} сводок} other {{count, "
      & "number} сводки}}} reminder_event {{count, plural, =0 {нет "
      & "напоминаний} one {{count, number} напоминание} "
      & "few {{count, number} напоминания} many {{count, number} "
      & "напоминаний} other {{count, number} "
      & "напоминания}}} other {{count, plural, =0 {нет "
      & "системных уведомлений} one {{count, number} "
      & "системное уведомление} few {{count, number} "
      & "системных уведомления} many {{count, number} "
      & "системных уведомлений} other {{count, number} "
      & "системного уведомления}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {отметить уведомление как "
      & "прочитанное} one {отметить {count, number} "
      & "уведомление как прочитанное} few "
      & "{отметить {count, number} уведомления как "
      & "прочитанные} many {отметить {count, number} "
      & "уведомлений как прочитанные} other "
      & "{отметить {count, number} уведомления как "
      & "прочитанные}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {отметить уведомление как "
      & "непрочитанное} one {отметить {count, number} "
      & "уведомление как непрочитанное} few "
      & "{отметить {count, number} уведомления как "
      & "непрочитанные} many {отметить {count, number} "
      & "уведомлений как непрочитанные} other "
      & "{отметить {count, number} уведомления как "
      & "непрочитанные}}");
   P ("label.notifications.muted_label", "{name}: уведомления приглушены");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {новое упоминание} "
      & "reply_event {новый ответ} assignment_event {новое "
      & "назначение} approval_event {новый запрос на "
      & "одобрение} alert_event {новое оповещение} "
      & "digest_event {новая сводка} reminder_event {новое "
      & "напоминание} other {новое системное "
      & "уведомление}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {уведомления в "
      & "приложении} email_channel {уведомления по "
      & "электронной почте} sms_channel "
      & "{SMS-уведомления} push_channel "
      & "{push-уведомления} webhook_channel {уведомления "
      & "через веб-хук} other {уведомления-сводки}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {нет уведомлений} one {{count, "
      & "number} уведомление} few {{count, number} "
      & "уведомления} many {{count, number} уведомлений} "
      & "other {{count, number} уведомления}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {упоминание} reply_event "
      & "{ответ} assignment_event {назначение} approval_event "
      & "{запрос на одобрение} alert_event "
      & "{оповещение} digest_event {сводка} reminder_event "
      & "{напоминание} other {системное "
      & "уведомление}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {нет уведомлений} one "
      & "{{count, number} уведомление} few {{count, number} "
      & "уведомления} many {{count, number} уведомлений} "
      & "other {{count, number} уведомления}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {упоминание} "
      & "reply_event {ответ} assignment_event {назначение} "
      & "approval_event {запрос на одобрение} alert_event "
      & "{оповещение} digest_event {сводка} reminder_event "
      & "{напоминание} other {системное "
      & "уведомление}} {event, select, reply_event {{state, select, "
      & "unread_state {не прочитан} read_state {прочитан} "
      & "archived_state {в архиве} muted_state {приглушён} "
      & "snoozed_state {отложен} other {подавлен}}} "
      & "approval_event {{state, select, unread_state {не прочитан} "
      & "read_state {прочитан} archived_state {в архиве} "
      & "muted_state {приглушён} snoozed_state {отложен} other "
      & "{подавлен}}} digest_event {{state, select, unread_state {не "
      & "прочитана} read_state {прочитана} archived_state {в "
      & "архиве} muted_state {приглушена} snoozed_state "
      & "{отложена} other {подавлена}}} other {{state, select, "
      & "unread_state {не прочитано} read_state {прочитано} "
      & "archived_state {в архиве} muted_state {приглушено} "
      & "snoozed_state {отложено} other {подавлено}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {непрочитанное "
      & "уведомление} read_state {прочитанное "
      & "уведомление} archived_state {архивное "
      & "уведомление} muted_state {приглушённое "
      & "уведомление} snoozed_state {отложенное "
      & "уведомление} other {подавленное "
      & "уведомление}}");
   P ("label.notifications.snoozed_label", "{name}: уведомления отложены");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {нет подавленных "
      & "уведомлений} other {подавлено "
      & "уведомлений: {count, number}}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {нет непрочитанных "
      & "уведомлений} one {{count, number} "
      & "непрочитанное уведомление} few {{count, "
      & "number} непрочитанных уведомления} many "
      & "{{count, number} непрочитанных уведомлений} "
      & "other {{count, number} непрочитанного "
      & "уведомления}}");
   P ("label.payments.amount_label", "сумма: {amount_text}");
   P ("label.payments.balance_label", "баланс: {amount_text}");
   P ("label.payments.chargeback_label", "чарджбэк: {amount_text}");
   P ("label.payments.discount_label", "скидка: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, срок оплаты: {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {нет счетов} one {{count, number} "
      & "счёт} few {{count, number} счёта} many {{count, number} "
      & "счетов} other {{count, number} счёта}}");
   P ("label.payments.invoice_label",
      "счёт {number}: {state, select, draft_invoice {черновик} "
      & "open_invoice {открыт} paid_invoice {оплачен} "
      & "overdue_invoice {просрочен} other {аннулирован}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {черновик счёта} "
      & "open_invoice {открытый счёт} paid_invoice "
      & "{оплаченный счёт} overdue_invoice "
      & "{просроченный счёт} other "
      & "{аннулированный счёт}}");
   P ("label.payments.method_label",
      "{method, select, card_method {оплачено картой: {detail}} "
      & "bank_transfer_method {оплачено банковским "
      & "переводом: {detail}} cash_method {оплачено "
      & "наличными: {detail}} wallet_method {оплачено "
      & "через электронный кошелёк: {detail}} "
      & "check_method {оплачено чеком: {detail}} other "
      & "{оплачено другим способом: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}: оплачено {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {нет платежей} one {{count, number} "
      & "платёж} few {{count, number} платежа} many {{count, "
      & "number} платежей} other {{count, number} платежа}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {платёж в "
      & "обработке} authorized_payment {платёж "
      & "авторизован} paid_payment {платёж проведён} "
      & "failed_payment {платёж не прошёл} refunded_payment "
      & "{платёж возвращён} other {платёж отменён}}");
   P ("label.payments.payment_link_label", "{name}: ссылка для оплаты");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {карта} bank_transfer_method "
      & "{банковский перевод} cash_method {наличные} "
      & "wallet_method {электронный кошелёк} check_method "
      & "{чек} other {другой способ}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {платёж в обработке} "
      & "authorized_payment {платёж авторизован} paid_payment "
      & "{платёж проведён} failed_payment {платёж не "
      & "прошёл} refunded_payment {платёж возвращён} other "
      & "{платёж отменён}}");
   P ("label.payments.receipt_label", "квитанция {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {возврат в "
      & "обработке} authorized_payment {возврат "
      & "авторизован} paid_payment {возврат выплачен} "
      & "failed_payment {возврат не выполнен} refunded_payment "
      & "{возврат завершён} other {возврат "
      & "отменён}}");
   P ("label.payments.subtotal_label", "промежуточный итог: {amount_text}");
   P ("label.payments.tax_label", "налог: {amount_text}");
   P ("label.payments.total_label", "итого: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: доступ истекает {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {назначена роль "
      & "владельца} admin_role {назначена роль "
      & "администратора} editor_role {назначена роль "
      & "редактора} viewer_role {назначена роль "
      & "читателя} other {назначена "
      & "пользовательская роль}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {разрешено} "
      & "denied {запрещено} inherited {унаследовано} "
      & "temporary {временный доступ} expired {срок "
      & "истёк} other {требуется одобрение}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {разрешено} denied "
      & "{запрещено} inherited {унаследовано} temporary "
      & "{временный доступ} expired {срок истёк} other "
      & "{требуется одобрение}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {разрешено "
      & "политикой} policy_denied {запрещено "
      & "политикой} policy_warning {предупреждение "
      & "политики} other {политика неприменима}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {отозвана роль "
      & "владельца} admin_role {отозвана роль "
      & "администратора} editor_role {отозвана роль "
      & "редактора} viewer_role {отозвана роль "
      & "читателя} other {отозвана "
      & "пользовательская роль}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {владелец} admin_role "
      & "{администратор} editor_role {редактор} "
      & "viewer_role {читатель} other {пользовательская "
      & "роль}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {пусто} low_utilization "
      & "{низкая загрузка} normal_utilization "
      & "{нормальная загрузка} high_utilization "
      & "{высокая загрузка} critical_utilization "
      & "{критическая загрузка} full_utilization "
      & "{заполнено} other {превышен лимит}}");
   P ("label.schema.array_shape_label",
      "массив {element_type, select, string_field {строк} "
      & "integer_field {целых чисел} decimal_field "
      & "{десятичных чисел} boolean_field {логических "
      & "значений} date_field {дат} date_time_field "
      & "{значений даты и времени} object_field "
      & "{объектов} array_field {массивов} enum_field "
      & "{значений перечисления} binary_field "
      & "{двоичных значений} null_field {значений null} "
      & "any_field {значений любого типа} other "
      & "{значений неизвестного типа}}{count_known, "
      & "select, false {} other {, элементов: {count, number}}}");
   P ("label.schema.constraint_label", "{name}: ограничение {value}");
   P ("label.schema.default_value_label", "поле {field_name}: по умолчанию {value}");
   P ("label.schema.deprecated_field_label",
      "поле {name} устарело, используйте {replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {{count, number} вариант "
      & "перечисления} few {{count, number} варианта "
      & "перечисления} many {{count, number} вариантов "
      & "перечисления} other {{count, number} варианта "
      & "перечисления}}");
   P ("label.schema.example_value_label", "поле {field_name}: пример {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {обычное поле} "
      & "deprecated_field {устаревшее поле} unknown_field "
      & "{неизвестное поле} read_only_field {поле "
      & "только для чтения} write_only_field {поле "
      & "только для записи} other {вычисляемое "
      & "поле}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {строковое поле} "
      & "integer_field {целочисленное поле} decimal_field "
      & "{десятичное поле} boolean_field {логическое "
      & "поле} date_field {поле даты} date_time_field {поле "
      & "даты и времени} object_field {поле-объект} "
      & "array_field {поле-массив} enum_field "
      & "{поле-перечисление} binary_field {двоичное "
      & "поле} null_field {поле null} any_field {поле любого "
      & "типа} other {поле неизвестного типа}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {все обязательные поля "
      & "заполнены} other {не заполнено "
      & "обязательных полей: {count, number}}}");
   P ("label.schema.object_shape_label",
      "объект, полей: {fields, number}{required, plural, =0 {} "
      & "other {, обязательных: {required, number}}}{optional, "
      & "plural, =0 {} other {, необязательных: {optional, "
      & "number}}}");
   P ("label.schema.schema_source_label", "схема {name}, версия {version}");
end Labels_2;
