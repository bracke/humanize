separate (Humanize.Catalogs.Phrase_Data.Locale_Uk)
procedure Labels_2 is
begin
   P ("label.events.event_count_label",
      "{count, plural, =0 {немає подій} other {{count, plural, one "
      & "{{count, number} подія} few {{count, number} події} many "
      & "{{count, number} подій} other {{count, number} події}}}}");
   P ("label.events.event_label",
      "{name}: {state, select, scheduled_event {заплановано} "
      & "tentative_event {попередньо} in_progress_event "
      & "{триває} completed_event {завершено} canceled_event "
      & "{скасовано} other {перенесено}}");
   P ("label.events.event_location_label", "{name}, {location}");
   P ("label.events.event_state_label",
      "{state, select, scheduled_event {запланована подія} "
      & "tentative_event {попередня подія} in_progress_event "
      & "{поточна подія} completed_event {завершена "
      & "подія} canceled_event {скасована подія} other "
      & "{перенесена подія}}");
   P ("label.events.event_time_label", "{name}, {time_text}");
   P ("label.events.event_visibility_label",
      "{visibility, select, public_event {публічна подія} "
      & "private_event {приватна подія} busy_event "
      & "{зайнятий} other {вільний}}");
   P ("label.events.organizer_label", "організатор: {name}");
   P ("label.events.rsvp_label",
      "відповідь на запрошення: {state, select, "
      & "not_responded {немає відповіді} accepted "
      & "{прийнято} declined {відхилено} maybe "
      & "{можливо} other {у списку очікування}}");
   P ("label.events.reminder_label", "нагадування: {time_text}");
   P ("label.events.rescheduled_label", "{name}: перенесено на {time_text}");
   P ("label.forms.character_count_label",
      "{used, plural, one {{used, number} символ} few {{used, number} "
      & "символи} many {{used, number} символів} other {{used, "
      & "number} символу}}");
   P ("label.forms.character_limit_label",
      "{limit, plural, =0 {без обмеження символів} other "
      & "{{limit, plural, one {не більше {limit, number} "
      & "символу} few {не більше {limit, number} "
      & "символів} many {не більше {limit, number} "
      & "символів} other {не більше {limit, number} "
      & "символу}}}}");
   P ("label.forms.character_usage_label",
      "{limit, plural, =0 {{used, plural, one {{used, number} символ} "
      & "few {{used, number} символи} many {{used, number} "
      & "символів} other {{used, number} символу}}} other "
      & "{{limit, plural, one {{used, number} з {limit, number} "
      & "символу} few {{used, number} з {limit, number} "
      & "символів} many {{used, number} з {limit, number} "
      & "символів} other {{used, number} з {limit, number} "
      & "символу}}}}");
   P ("label.forms.field_label",
      "{name}: {required, select, false {необов’язкове "
      & "поле} other {обов’язкове поле}}");
   P ("label.forms.field_state_label",
      "{name}: {state, select, valid_input {коректно} invalid_input "
      & "{некоректно} required_input {обов’язково} "
      & "optional_input {необов’язково} disabled_input "
      & "{вимкнено} other {лише для читання}}");
   P ("label.forms.form_error_summary_label",
      "{errors, plural, =0 {{warnings, plural, =0 {немає проблем "
      & "у формі} other {{warnings, plural, one {{warnings, number} "
      & "попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}}}} other {{warnings, plural, =0 {{errors, "
      & "plural, one {{errors, number} помилка} few {{errors, number} "
      & "помилки} many {{errors, number} помилок} other {{errors, "
      & "number} помилки}}} other {{errors, plural, one {{errors, "
      & "number} помилка} few {{errors, number} помилки} many "
      & "{{errors, number} помилок} other {{errors, number} "
      & "помилки}}, {warnings, plural, one {{warnings, number} "
      & "попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}}}}}");
   P ("label.forms.form_state_label",
      "{state, select, pristine_form {не розпочато} editing_form "
      & "{редагування} dirty_form {незбережені "
      & "зміни} saving_form {збереження} saved_form "
      & "{збережено} submitted_form {надіслано} other "
      & "{помилка надсилання}}");
   P ("label.forms.input_state_label",
      "{state, select, valid_input {коректне значення} "
      & "invalid_input {некоректне значення} required_input "
      & "{обов’язкове поле} optional_input "
      & "{необов’язкове поле} disabled_input "
      & "{вимкнене поле} other {поле лише для "
      & "читання}}");
   P ("label.forms.submission_label",
      "{state, select, pristine_form {не розпочато} editing_form "
      & "{редагування} dirty_form {незбережені "
      & "зміни} saving_form {збереження форми} saved_form "
      & "{форму збережено} submitted_form {форму "
      & "надіслано} other {{errors, plural, =0 {помилка "
      & "надсилання} other {помилка надсилання: "
      & "{errors, plural, one {{errors, number} помилка} few {{errors, "
      & "number} помилки} many {{errors, number} помилок} other "
      & "{{errors, number} помилки}}}}}}");
   P ("label.forms.unsaved_changes_label",
      "{count, plural, =0 {немає незбережених змін} "
      & "other {{count, plural, one {{count, number} незбережена "
      & "зміна} few {{count, number} незбережені зміни} "
      & "many {{count, number} незбережених змін} other "
      & "{{count, number} незбереженої зміни}}}}");
   P ("label.markup.accessibility_issue_label",
      "{target}: {issue, select, missing_accessible_name {немає "
      & "доступного імені} low_contrast {низький "
      & "контраст} skipped_heading_level {пропущено "
      & "рівень заголовка} missing_form_label {немає "
      & "мітки поля форми} invalid_aria "
      & "{неприпустимий ARIA} keyboard_trap {пастка "
      & "клавіатури} other {невідома проблема "
      & "доступності}}");
   P ("label.markup.accessibility_page_summary_label",
      "{title}: зведення доступності — {landmarks, "
      & "plural, one {{landmarks, number} орієнтир} few {{landmarks, "
      & "number} орієнтири} many {{landmarks, number} "
      & "орієнтирів} other {{landmarks, number} орієнтира}}, "
      & "{headings, plural, one {{headings, number} заголовок} few "
      & "{{headings, number} заголовки} many {{headings, number} "
      & "заголовків} other {{headings, number} заголовка}}, "
      & "{issues, plural, one {{issues, number} проблема} few {{issues, "
      & "number} проблеми} many {{issues, number} проблем} other "
      & "{{issues, number} проблеми}}");
   P ("label.markup.accessibility_remediation_label",
      "{issue, select, missing_accessible_name {додайте "
      & "доступне ім’я} low_contrast {збільште "
      & "контрастність тексту} skipped_heading_level "
      & "{використовуйте рівні заголовків по "
      & "порядку} missing_form_label {пов’яжіть мітку з "
      & "елементом форми} invalid_aria "
      & "{використовуйте допустиму роль або "
      & "атрибут ARIA} keyboard_trap {дайте фокусу "
      & "клавіатури покинути компонент} other "
      & "{перевірте проблему доступності}}");
   P ("label.markup.accessibility_summary_label",
      "{target}: {issues, plural, =0 {немає проблем "
      & "доступності} other {{issues, plural, one {{issues, number} "
      & "проблема доступності} few {{issues, number} "
      & "проблеми доступності} many {{issues, number} "
      & "проблем доступності} other {{issues, number} "
      & "проблеми доступності}}}}");
   P ("label.markup.attribute_kind_label",
      "{kind, select, id_attribute {атрибут id} class_attribute "
      & "{атрибут class} data_attribute {атрибут data} "
      & "aria_attribute {атрибут ARIA} role_attribute {атрибут "
      & "role} link_attribute {атрибут посилання} "
      & "media_attribute {атрибут медіа} form_attribute "
      & "{атрибут форми} boolean_attribute {логічний "
      & "атрибут} event_attribute {атрибут обробника "
      & "подій} other {невідомий атрибут}}");
   P ("label.markup.form_error_summary_label",
      "{form_name}: {errors, plural, =0 {{warnings, plural, =0 {немає "
      & "проблем у формі} other {{warnings, plural, one "
      & "{{warnings, number} попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}}}} other {{warnings, plural, =0 {{errors, "
      & "plural, one {{errors, number} помилка} few {{errors, number} "
      & "помилки} many {{errors, number} помилок} other {{errors, "
      & "number} помилки}}} other {{errors, plural, one {{errors, "
      & "number} помилка} few {{errors, number} помилки} many "
      & "{{errors, number} помилок} other {{errors, number} "
      & "помилки}}, {warnings, plural, one {{warnings, number} "
      & "попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}}}}}");
   P ("label.markup.landmark_label",
      "{role, select, banner_role {орієнтир: банер} "
      & "navigation_role {орієнтир: навігація} main_role "
      & "{орієнтир: основний вміст} complementary_role "
      & "{орієнтир: додатковий вміст} contentinfo_role "
      & "{орієнтир: відомості про вміст} search_role "
      & "{орієнтир: пошук} form_role {орієнтир: "
      & "форма} region_role {орієнтир: регіон} dialog_role "
      & "{діалог} alert_role {активна область: "
      & "сповіщення} status_role {активна область: "
      & "стан} other {невідомий орієнтир}}");
   P ("label.markup.live_region_update_label",
      "{region}, {polite, select, false {термінове "
      & "оновлення} other {звичайне оновлення}}: "
      & "{update}");
   P ("label.markup.mime_kind_label",
      "{kind, select, text_content {текст} html_content {HTML} "
      & "json_content {JSON} xml_content {XML} image_content "
      & "{зображення} audio_content {аудіо} video_content "
      & "{відео} font_content {шрифт} archive_content {архів} "
      & "binary_content {двійкові дані} form_content {дані "
      & "форми} other {невідомий вміст}}");
   P ("label.markup.tag_kind_label",
      "{kind, select, document_tag {тег документа} metadata_tag "
      & "{тег метаданих} section_tag {тег розділу} "
      & "text_tag {текстовий тег} link_tag {тег "
      & "посилання} media_tag {тег медіа} form_tag {тег "
      & "форми} table_tag {тег таблиці} interactive_tag "
      & "{інтерактивний тег} scripting_tag {тег "
      & "сценарію} other {невідомий тег}}");
   P ("label.media.duration_label", "тривалість: {duration_text}");
   P ("label.media.media_kind_label",
      "{kind, select, image_media {зображення} video_media "
      & "{відео} audio_media {аудіо} pdf_document {документ "
      & "PDF} text_document {текстовий документ} archive_media "
      & "{архів} other {медіафайл}}");
   P ("label.media.media_state_label",
      "{state, select, ready_media {готово} processing_media "
      & "{обробка} transcoding_media {перекодування} "
      & "thumbnail_missing {мініатюра недоступна} "
      & "metadata_missing {немає метаданих} locked_document "
      & "{документ заблоковано} other "
      & "{недоступно}}");
   P ("label.media.media_summary",
      "{name} ({kind, select, image_media {зображення} video_media "
      & "{відео} audio_media {аудіо} pdf_document {документ "
      & "PDF} text_document {текстовий документ} archive_media "
      & "{архів} other {медіафайл}}): {state, select, ready_media "
      & "{готово} processing_media {обробка} transcoding_media "
      & "{перекодування} thumbnail_missing {мініатюра "
      & "недоступна} metadata_missing {немає метаданих} "
      & "locked_document {заблоковано} other {недоступно}}");
   P ("label.media.page_count_label",
      "{pages, plural, =0 {немає сторінок} other {{pages, "
      & "plural, one {{pages, number} сторінка} few {{pages, number} "
      & "сторінки} many {{pages, number} сторінок} other "
      & "{{pages, number} сторінки}}}}");
   P ("label.media.resolution_label", "{width, number}×{height, number}");
   P ("label.moderation.appeal_label",
      "{item}: апеляція, {state, select, open_report {скаргу "
      & "відкрито} triaged_report {скаргу взято в "
      & "роботу} actioned_report {вжито заходів} "
      & "dismissed_report {скаргу відхилено} appealed_report "
      & "{скаргу оскаржено} other {скаргу закрито}}");
   P ("label.moderation.moderation_action_label",
      "{action, select, no_action {без заходів модерації} "
      & "flagged {позначено} hidden {приховано "
      & "модератором} restored {відновлено} marked_spam "
      & "{позначено як спам} removed {видалено} other "
      & "{передано на ескалацію}}");
   P ("label.moderation.moderation_label",
      "{item}: {action, select, no_action {без заходів "
      & "модерації} flagged {позначено} hidden "
      & "{приховано модератором} restored "
      & "{відновлено} marked_spam {позначено як спам} "
      & "removed {видалено} other {передано на "
      & "ескалацію}}");
   P ("label.moderation.moderation_queue_label",
      "{escalated, plural, =0 {{pending, plural, =0 {черга "
      & "модерації порожня} other {очікують "
      & "перевірки: {pending, number}}}} other {очікують "
      & "перевірки: {pending, number}, передано на "
      & "ескалацію: {escalated, number}}}");
   P ("label.moderation.report_label",
      "{item}: {state, select, open_report {скаргу відкрито} "
      & "triaged_report {скаргу взято в роботу} "
      & "actioned_report {вжито заходів} dismissed_report "
      & "{скаргу відхилено} appealed_report {скаргу "
      & "оскаржено} other {скаргу закрито}}");
   P ("label.moderation.report_state_label",
      "{state, select, open_report {скаргу відкрито} "
      & "triaged_report {скаргу взято в роботу} "
      & "actioned_report {вжито заходів} dismissed_report "
      & "{скаргу відхилено} appealed_report {скаргу "
      & "оскаржено} other {скаргу закрито}}");
   P ("label.moderation.review_label",
      "{item}: {state, select, pending_review {очікує "
      & "перевірки} approved {схвалено} rejected "
      & "{відхилено} needs_changes {потрібні зміни} other "
      & "{перевірку передано на ескалацію}}");
   P ("label.moderation.review_state_label",
      "{state, select, pending_review {очікує перевірки} "
      & "approved {схвалено} rejected {відхилено} "
      & "needs_changes {потрібні зміни} other {перевірку "
      & "передано на ескалацію}}");
   P ("label.navigation.back_label", "назад: {target}");
   P ("label.navigation.breadcrumb_trail_label",
      "{depth, plural, =0 {навігаційний ланцюжок "
      & "порожній} other {навігаційний ланцюжок, "
      & "рівнів: {depth, number}}}");
   P ("label.navigation.current_page_label", "поточна сторінка: {name}");
   P ("label.navigation.external_link_label", "{name}: зовнішнє посилання");
   P ("label.navigation.first_label", "на початок: {target}");
   P ("label.navigation.last_label", "в кінець: {target}");
   P ("label.navigation.menu_count_label",
      "{count, plural, =0 {немає пунктів меню} one {{count, "
      & "number} пункт меню} few {{count, number} пункти "
      & "меню} many {{count, number} пунктів меню} other "
      & "{{count, number} пункту меню}}");
   P ("label.navigation.navigation_item_kind_label",
      "{kind, select, link_item {посилання} menu_item {пункт "
      & "меню} tab_item {вкладка} breadcrumb_item {елемент "
      & "навігаційного ланцюжка} section_item "
      & "{розділ} other {роздільник}}");
   P ("label.navigation.navigation_item_label",
      "{name}: {kind, select, link_item {посилання} menu_item "
      & "{пункт меню} tab_item {вкладка} breadcrumb_item "
      & "{елемент навігаційного ланцюжка} "
      & "section_item {розділ} other {роздільник}}, {kind, "
      & "select, link_item {{state, select, current_item {поточне} "
      & "active_item {активне} inactive_item {неактивне} "
      & "disabled_item {вимкнене} expanded_item {розгорнуте} "
      & "collapsed_item {згорнуте} visited_item {відвідане} "
      & "other {зовнішнє}}} tab_item {{state, select, current_item "
      & "{поточна} active_item {активна} inactive_item "
      & "{неактивна} disabled_item {вимкнена} expanded_item "
      & "{розгорнута} collapsed_item {згорнута} visited_item "
      & "{відвідана} other {зовнішня}}} other {{state, select, "
      & "current_item {поточний} active_item {активний} "
      & "inactive_item {неактивний} disabled_item "
      & "{вимкнений} expanded_item {розгорнутий} "
      & "collapsed_item {згорнутий} visited_item "
      & "{відвіданий} other {зовнішній}}}}");
   P ("label.navigation.navigation_state_label",
      "{state, select, current_item {поточний} active_item "
      & "{активний} inactive_item {неактивний} disabled_item "
      & "{вимкнений} expanded_item {розгорнутий} "
      & "collapsed_item {згорнутий} visited_item "
      & "{відвіданий} other {зовнішній}}");
   P ("label.navigation.next_label", "далі: {target}");
   P ("label.navigation.section_state_label",
      "{name}: {expanded, select, false {розділ згорнуто} other "
      & "{розділ розгорнуто}}{count, plural, =0 {} one {, "
      & "{count, number} елемент} few {, {count, number} "
      & "елементи} many {, {count, number} елементів} other {, "
      & "{count, number} елемента}}");
   P ("label.navigation.skip_link_label", "перейти: {target}");
   P ("label.navigation.submenu_label",
      "{name}: підменю, {count, plural, one {{count, number} "
      & "пункт} few {{count, number} пункти} many {{count, number} "
      & "пунктів} other {{count, number} пункту}}");
   P ("label.notification_preferences.alert_level_label",
      "{level, select, all_alerts {усі сповіщення} "
      & "important_alerts {важливі сповіщення} "
      & "critical_alerts_only {лише критичні сповіщення} "
      & "other {без сповіщень}}");
   P ("label.notification_preferences.channel_preference_label",
      "{channel}: сповіщення {state, select, preference_enabled "
      & "{увімкнено} preference_disabled {вимкнено} "
      & "preference_inherited {успадковано} other "
      & "{обов’язкові}}");
   P ("label.notification_preferences.digest_schedule_label",
      "{schedule, select, no_digest {без зведення} instant_digest "
      & "{миттєве зведення} daily_digest {щоденне "
      & "зведення} other {щотижневе зведення}}");
   P ("label.notification_preferences.preference_state_label",
      "{state, select, preference_enabled {увімкнено} "
      & "preference_disabled {вимкнено} preference_inherited "
      & "{успадковано} other {обов’язково}}");
   P ("label.notification_preferences.quiet_hours_label", "тихі години: {time_text}");
   P ("label.notification_preferences.subscription_label",
      "{name}: {scope, select, thread_subscription {підписка на "
      & "гілку} project_subscription {підписка на проєкт} "
      & "team_subscription {підписка на команду} other "
      & "{підписка на обліковий запис}} {state, select, "
      & "preference_enabled {увімкнена} preference_disabled "
      & "{вимкнена} preference_inherited {успадкована} other "
      & "{обов’язкова}}");
   P ("label.notification_preferences.subscription_scope_label",
      "{scope, select, thread_subscription {підписка на гілку} "
      & "project_subscription {підписка на проєкт} "
      & "team_subscription {підписка на команду} other "
      & "{підписка на обліковий запис}}");
   P ("label.notifications.actor_event_label",
      "{event, select, mention_event {{actor} згадує вас} "
      & "reply_event {{actor} відповідає} assignment_event {{actor} "
      & "призначає вас} approval_event {{actor} запитує "
      & "схвалення} alert_event {{actor} надсилає "
      & "сповіщення} digest_event {{actor} надсилає "
      & "зведення} reminder_event {{actor} надсилає "
      & "нагадування} other {{actor} надсилає "
      & "системне сповіщення}}");
   P ("label.notifications.delivery_label",
      "{channel, select, in_app_channel {сповіщення в "
      & "застосунку} email_channel {сповіщення "
      & "електронною поштою} sms_channel "
      & "{SMS-сповіщення} push_channel {push-сповіщення} "
      & "webhook_channel {сповіщення через вебхук} other "
      & "{сповіщення-зведення}}: {state, select, "
      & "pending_delivery {очікує надсилання} sent_delivery "
      & "{надіслано} delivered_delivery {доставлено} "
      & "failed_delivery {не доставлено} retrying_delivery "
      & "{повторне надсилання} other {скасовано}}");
   P ("label.notifications.delivery_state_label",
      "{state, select, pending_delivery {сповіщення очікує "
      & "надсилання} sent_delivery {сповіщення "
      & "надіслано} delivered_delivery {сповіщення "
      & "доставлено} failed_delivery {сповіщення не "
      & "доставлено} retrying_delivery {повторне "
      & "надсилання сповіщення} other {сповіщення "
      & "скасовано}}");
   P ("label.notifications.delivery_time_label",
      "{state, select, pending_delivery {очікує надсилання: "
      & "{time_text}} sent_delivery {надіслано: {time_text}} "
      & "delivered_delivery {доставлено: {time_text}} failed_delivery "
      & "{не доставлено: {time_text}} retrying_delivery "
      & "{повторне надсилання: {time_text}} other "
      & "{скасовано: {time_text}}}");
   P ("label.notifications.digest_label",
      "зведення {name}: {count, plural, =0 {немає "
      & "сповіщень} one {{count, number} сповіщення} few "
      & "{{count, number} сповіщення} many {{count, number} "
      & "сповіщень} other {{count, number} сповіщення}}");
   P ("label.notifications.event_count_label",
      "{event, select, mention_event {{count, plural, =0 {немає "
      & "згадок} one {{count, number} згадка} few {{count, number} "
      & "згадки} many {{count, number} згадок} other {{count, "
      & "number} згадки}}} reply_event {{count, plural, =0 {немає "
      & "відповідей} one {{count, number} відповідь} few "
      & "{{count, number} відповіді} many {{count, number} "
      & "відповідей} other {{count, number} відповіді}}} "
      & "assignment_event {{count, plural, =0 {немає призначень} "
      & "one {{count, number} призначення} few {{count, number} "
      & "призначення} many {{count, number} призначень} "
      & "other {{count, number} призначення}}} approval_event "
      & "{{count, plural, =0 {немає запитів на "
      & "схвалення} one {{count, number} запит на "
      & "схвалення} few {{count, number} запити на "
      & "схвалення} many {{count, number} запитів на "
      & "схвалення} other {{count, number} запиту на "
      & "схвалення}}} alert_event {{count, plural, =0 {немає "
      & "сповіщень} one {{count, number} сповіщення} few "
      & "{{count, number} сповіщення} many {{count, number} "
      & "сповіщень} other {{count, number} сповіщення}}} "
      & "digest_event {{count, plural, =0 {немає зведень} one "
      & "{{count, number} зведення} few {{count, number} "
      & "зведення} many {{count, number} зведень} other {{count, "
      & "number} зведення}}} reminder_event {{count, plural, =0 "
      & "{немає нагадувань} one {{count, number} "
      & "нагадування} few {{count, number} нагадування} "
      & "many {{count, number} нагадувань} other {{count, number} "
      & "нагадування}}} other {{count, plural, =0 {немає "
      & "системних сповіщень} one {{count, number} "
      & "системне сповіщення} few {{count, number} "
      & "системні сповіщення} many {{count, number} "
      & "системних сповіщень} other {{count, number} "
      & "системного сповіщення}}}}");
   P ("label.notifications.mark_read_label",
      "{count, plural, =1 {позначити сповіщення як "
      & "прочитане} one {позначити {count, number} "
      & "сповіщення як прочитане} few {позначити "
      & "{count, number} сповіщення як прочитані} many "
      & "{позначити {count, number} сповіщень як "
      & "прочитані} other {позначити {count, number} "
      & "сповіщення як прочитані}}");
   P ("label.notifications.mark_unread_label",
      "{count, plural, =1 {позначити сповіщення як "
      & "непрочитане} one {позначити {count, number} "
      & "сповіщення як непрочитане} few "
      & "{позначити {count, number} сповіщення як "
      & "непрочитані} many {позначити {count, number} "
      & "сповіщень як непрочитані} other "
      & "{позначити {count, number} сповіщення як "
      & "непрочитані}}");
   P ("label.notifications.muted_label", "{name}: сповіщення приглушено");
   P ("label.notifications.new_event_label",
      "{event, select, mention_event {нова згадка} reply_event "
      & "{нова відповідь} assignment_event {нове "
      & "призначення} approval_event {новий запит на "
      & "схвалення} alert_event {нове сповіщення} "
      & "digest_event {нове зведення} reminder_event {нове "
      & "нагадування} other {нове системне "
      & "сповіщення}}");
   P ("label.notifications.notification_channel_label",
      "{channel, select, in_app_channel {сповіщення в "
      & "застосунку} email_channel {сповіщення "
      & "електронною поштою} sms_channel "
      & "{SMS-сповіщення} push_channel {push-сповіщення} "
      & "webhook_channel {сповіщення через вебхук} other "
      & "{сповіщення-зведення}}");
   P ("label.notifications.notification_count_label",
      "{count, plural, =0 {немає сповіщень} one {{count, "
      & "number} сповіщення} few {{count, number} "
      & "сповіщення} many {{count, number} сповіщень} other "
      & "{{count, number} сповіщення}}");
   P ("label.notifications.notification_event_label",
      "{event, select, mention_event {згадка} reply_event "
      & "{відповідь} assignment_event {призначення} "
      & "approval_event {запит на схвалення} alert_event "
      & "{сповіщення} digest_event {зведення} reminder_event "
      & "{нагадування} other {системне "
      & "сповіщення}}");
   P ("label.notifications.notification_group_label",
      "{name}: {count, plural, =0 {немає сповіщень} one "
      & "{{count, number} сповіщення} few {{count, number} "
      & "сповіщення} many {{count, number} сповіщень} other "
      & "{{count, number} сповіщення}}");
   P ("label.notifications.notification_label",
      "{subject}: {event, select, mention_event {згадка} reply_event "
      & "{відповідь} assignment_event {призначення} "
      & "approval_event {запит на схвалення} alert_event "
      & "{сповіщення} digest_event {зведення} reminder_event "
      & "{нагадування} other {системне "
      & "сповіщення}}, {event, select, mention_event {{state, select, "
      & "unread_state {непрочитана} read_state {прочитана} "
      & "archived_state {в архіві} muted_state {приглушена} "
      & "snoozed_state {відкладена} other {прихована}}} "
      & "reply_event {{state, select, unread_state {непрочитана} "
      & "read_state {прочитана} archived_state {в архіві} "
      & "muted_state {приглушена} snoozed_state "
      & "{відкладена} other {прихована}}} approval_event "
      & "{{state, select, unread_state {непрочитаний} read_state "
      & "{прочитаний} archived_state {в архіві} muted_state "
      & "{приглушений} snoozed_state {відкладений} other "
      & "{прихований}}} other {{state, select, unread_state "
      & "{непрочитане} read_state {прочитане} "
      & "archived_state {в архіві} muted_state {приглушене} "
      & "snoozed_state {відкладене} other {приховане}}}}");
   P ("label.notifications.notification_state_label",
      "{state, select, unread_state {непрочитане "
      & "сповіщення} read_state {прочитане "
      & "сповіщення} archived_state {архівоване "
      & "сповіщення} muted_state {приглушене "
      & "сповіщення} snoozed_state {відкладене "
      & "сповіщення} other {приховане сповіщення}}");
   P ("label.notifications.snoozed_label", "{name}: сповіщення відкладено");
   P ("label.notifications.suppressed_label",
      "{count, plural, =0 {немає прихованих "
      & "сповіщень} other {приховано сповіщень: "
      & "{count, number}}}");
   P ("label.notifications.unread_label",
      "{count, plural, =0 {немає непрочитаних "
      & "сповіщень} one {{count, number} непрочитане "
      & "сповіщення} few {{count, number} непрочитані "
      & "сповіщення} many {{count, number} непрочитаних "
      & "сповіщень} other {{count, number} непрочитаного "
      & "сповіщення}}");
   P ("label.payments.amount_label", "сума: {amount_text}");
   P ("label.payments.balance_label", "баланс: {amount_text}");
   P ("label.payments.chargeback_label", "чарджбек: {amount_text}");
   P ("label.payments.discount_label", "знижка: {amount_text}");
   P ("label.payments.due_label", "{amount_text}, строк оплати: {due_text}");
   P ("label.payments.invoice_count_label",
      "{count, plural, =0 {немає рахунків} one {{count, number} "
      & "рахунок} few {{count, number} рахунки} many {{count, "
      & "number} рахунків} other {{count, number} рахунку}}");
   P ("label.payments.invoice_label",
      "рахунок {number}: {state, select, draft_invoice "
      & "{чернетка} open_invoice {відкритий} paid_invoice "
      & "{оплачений} overdue_invoice {прострочений} other "
      & "{анульований}}");
   P ("label.payments.invoice_state_label",
      "{state, select, draft_invoice {чернетка рахунку} "
      & "open_invoice {відкритий рахунок} paid_invoice "
      & "{оплачений рахунок} overdue_invoice "
      & "{прострочений рахунок} other "
      & "{анульований рахунок}}");
   P ("label.payments.method_label",
      "{method, select, card_method {оплачено карткою: "
      & "{detail}} bank_transfer_method {оплачено "
      & "банківським переказом: {detail}} cash_method "
      & "{оплачено готівкою: {detail}} wallet_method "
      & "{оплачено через електронний гаманець: "
      & "{detail}} check_method {оплачено чеком: {detail}} other "
      & "{оплачено іншим способом: {detail}}}");
   P ("label.payments.paid_label", "{amount_text}: оплачено {paid_text}");
   P ("label.payments.payment_count_label",
      "{count, plural, =0 {немає платежів} one {{count, number} "
      & "платіж} few {{count, number} платежі} many {{count, "
      & "number} платежів} other {{count, number} платежу}}");
   P ("label.payments.payment_label",
      "{amount_text}: {state, select, pending_payment {платіж в "
      & "обробці} authorized_payment {платіж "
      & "авторизовано} paid_payment {платіж "
      & "проведено} failed_payment {платіж не пройшов} "
      & "refunded_payment {платіж повернуто} other {платіж "
      & "скасовано}}");
   P ("label.payments.payment_link_label", "{name}: посилання для оплати");
   P ("label.payments.payment_method_label",
      "{method, select, card_method {картка} bank_transfer_method "
      & "{банківський переказ} cash_method {готівка} "
      & "wallet_method {електронний гаманець} check_method "
      & "{чек} other {інший спосіб}}");
   P ("label.payments.payment_state_label",
      "{state, select, pending_payment {платіж в обробці} "
      & "authorized_payment {платіж авторизовано} "
      & "paid_payment {платіж проведено} failed_payment "
      & "{платіж не пройшов} refunded_payment {платіж "
      & "повернуто} other {платіж скасовано}}");
   P ("label.payments.receipt_label", "квитанція {number}");
   P ("label.payments.refund_label",
      "{amount_text}: {state, select, pending_payment {повернення "
      & "в обробці} authorized_payment {повернення "
      & "авторизовано} paid_payment {повернення "
      & "виплачено} failed_payment {повернення не "
      & "виконано} refunded_payment {повернення "
      & "завершено} other {повернення скасовано}}");
   P ("label.payments.subtotal_label", "проміжний підсумок: {amount_text}");
   P ("label.payments.tax_label", "податок: {amount_text}");
   P ("label.payments.total_label", "разом: {amount_text}");
   P ("label.permissions.access_expiry_label", "{subject}: доступ спливає {time_text}");
   P ("label.permissions.grant_label",
      "{subject}: {role, select, owner_role {надано роль "
      & "власника} admin_role {надано роль "
      & "адміністратора} editor_role {надано роль "
      & "редактора} viewer_role {надано роль читача} "
      & "other {надано користувацьку роль}}");
   P ("label.permissions.permission_label",
      "{subject}, {action}: {state, select, granted {дозволено} "
      & "denied {заборонено} inherited {успадковано} "
      & "temporary {тимчасовий доступ} expired {строк "
      & "минув} other {потрібне схвалення}}");
   P ("label.permissions.permission_state_label",
      "{state, select, granted {дозволено} denied "
      & "{заборонено} inherited {успадковано} temporary "
      & "{тимчасовий доступ} expired {строк минув} "
      & "other {потрібне схвалення}}");
   P ("label.permissions.policy_result_label",
      "{result, select, policy_allowed {дозволено "
      & "політикою} policy_denied {заборонено "
      & "політикою} policy_warning {попередження "
      & "політики} other {політика не "
      & "застосовується}}");
   P ("label.permissions.revoke_label",
      "{subject}: {role, select, owner_role {відкликано роль "
      & "власника} admin_role {відкликано роль "
      & "адміністратора} editor_role {відкликано "
      & "роль редактора} viewer_role {відкликано "
      & "роль читача} other {відкликано "
      & "користувацьку роль}}");
   P ("label.permissions.role_label",
      "{role, select, owner_role {власник} admin_role "
      & "{адміністратор} editor_role {редактор} "
      & "viewer_role {читач} other {користувацька роль}}");
   P ("label.resources.utilization_band_label",
      "{band, select, empty_utilization {порожньо} low_utilization "
      & "{низьке навантаження} normal_utilization "
      & "{нормальне навантаження} high_utilization "
      & "{високе навантаження} critical_utilization "
      & "{критичне навантаження} full_utilization "
      & "{заповнено} other {перевищено ліміт}}");
   P ("label.schema.array_shape_label",
      "масив {element_type, select, string_field {рядків} "
      & "integer_field {цілих чисел} decimal_field "
      & "{десяткових чисел} boolean_field {логічних "
      & "значень} date_field {дат} date_time_field {значень "
      & "дати й часу} object_field {об’єктів} array_field "
      & "{масивів} enum_field {значень переліку} "
      & "binary_field {двійкових значень} null_field "
      & "{значень null} any_field {значень будь-якого "
      & "типу} other {значень невідомого "
      & "типу}}{count_known, select, false {} other {, елементів: "
      & "{count, number}}}");
   P ("label.schema.constraint_label", "{name}: обмеження {value}");
   P ("label.schema.default_value_label", "поле {field_name}: за замовчуванням {value}");
   P ("label.schema.deprecated_field_label",
      "поле {name} застаріло, використовуйте "
      & "{replacement}");
   P ("label.schema.enum_options_label",
      "{count, plural, one {{count, number} варіант переліку} "
      & "few {{count, number} варіанти переліку} many {{count, "
      & "number} варіантів переліку} other {{count, number} "
      & "варіанта переліку}}");
   P ("label.schema.example_value_label", "поле {field_name}: приклад {value}");
   P ("label.schema.field_state_label",
      "{state, select, normal_field {звичайне поле} "
      & "deprecated_field {застаріле поле} unknown_field "
      & "{невідоме поле} read_only_field {поле лише для "
      & "читання} write_only_field {поле лише для "
      & "запису} other {обчислюване поле}}");
   P ("label.schema.field_type_label",
      "{kind, select, string_field {рядкове поле} integer_field "
      & "{цілочисельне поле} decimal_field {десяткове "
      & "поле} boolean_field {логічне поле} date_field {поле "
      & "дати} date_time_field {поле дати й часу} object_field "
      & "{поле-об’єкт} array_field {поле-масив} enum_field "
      & "{поле-перелік} binary_field {двійкове поле} "
      & "null_field {поле null} any_field {поле будь-якого "
      & "типу} other {поле невідомого типу}}");
   P ("label.schema.missing_required_label",
      "{count, plural, =0 {усі обов’язкові поля "
      & "заповнено} other {не заповнено "
      & "обов’язкових полів: {count, number}}}");
   P ("label.schema.object_shape_label",
      "об’єкт, полів: {fields, number}{required, plural, =0 {} "
      & "other {, обов’язкових: {required, number}}}{optional, "
      & "plural, =0 {} other {, необов’язкових: {optional, "
      & "number}}}");
   P ("label.schema.schema_source_label", "схема {name}, версія {version}");
   P ("label.schema.shape_label",
      "{kind, select, scalar_shape {скалярне значення} "
      & "object_shape {{count, plural, =0 {об’єкт} other {об’єкт, "
      & "полів: {count, number}}}} array_shape {{count, plural, =0 "
      & "{масив} other {масив, елементів: {count, number}}}} "
      & "map_shape {{count, plural, =0 {словник} other {словник, "
      & "записів: {count, number}}}} tuple_shape {{count, plural, =0 "
      & "{кортеж} other {кортеж, елементів: {count, "
      & "number}}}} union_shape {{count, plural, =0 {об’єднання} "
      & "other {об’єднання, типів: {count, number}}}} "
      & "empty_shape {порожня структура} other "
      & "{невідома структура}}");
   P ("label.schema.unknown_field_label", "невідоме поле {name}");
   P ("label.search.active_filter_count_label",
      "{count, plural, =0 {немає активних фільтрів} one "
      & "{{count, number} активний фільтр} few {{count, number} "
      & "активні фільтри} many {{count, number} активних "
      & "фільтрів} other {{count, number} активного "
      & "фільтра}}");
end Labels_2;
