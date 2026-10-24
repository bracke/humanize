separate (Humanize.Catalogs.Phrase_Data.Locale_Ru)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {учётная запись {name}: "
      & "активна} invited_account {учётная запись {name}: "
      & "приглашена} locked_account {учётная запись "
      & "{name}: заблокирована} suspended_account {учётная "
      & "запись {name}: приостановлена} deleted_account "
      & "{учётная запись {name}: удалена} other "
      & "{учётная запись {name}: состояние "
      & "неизвестно}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {активная учётная "
      & "запись} invited_account {приглашённая учётная "
      & "запись} locked_account {заблокированная "
      & "учётная запись} suspended_account "
      & "{приостановленная учётная запись} "
      & "deleted_account {удалённая учётная запись} other "
      & "{неизвестное состояние учётной "
      & "записи}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {доверенное "
      & "устройство} untrusted_device {недоверенное "
      & "устройство} new_device {новое устройство} "
      & "other {заблокированное устройство}}");
   P ("label.accounts.last_active_label", "{name}: последняя активность {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: вход не выполнен} "
      & "other {{name}: вход выполнен}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA включена} mfa_disabled {MFA "
      & "отключена} mfa_required {MFA обязательна} other "
      & "{требуется сброс MFA}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: активный сеанс} "
      & "expired_session {{name}: сеанс истёк} revoked_session "
      & "{{name}: сеанс отозван} idle_session {{name}: сеанс "
      & "бездействует} other {{name}: состояние "
      & "сеанса неизвестно}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {активный сеанс} "
      & "expired_session {сеанс истёк} revoked_session {сеанс "
      & "отозван} idle_session {сеанс бездействует} "
      & "other {состояние сеанса неизвестно}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {нет вложений} one {{count, number} "
      & "вложение} few {{count, number} вложения} many {{count, "
      & "number} вложений} other {{count, number} вложения}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, =0 {{name}: нет вложений} one {{name}: "
      & "{count, number} вложение} few {{name}: {count, number} "
      & "вложения} many {{name}: {count, number} вложений} "
      & "other {{name}: {count, number} вложения}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {вложенный файл} "
      & "image_attachment {вложенное изображение} "
      & "video_attachment {вложенное видео} audio_attachment "
      & "{вложенное аудио} document_attachment "
      & "{вложенный документ} archive_attachment "
      & "{вложенный архив} other {вложенная "
      & "ссылка}}");
   P ("label.attachments.attachment_label",
      "{kind, select, file_attachment {файл} image_attachment "
      & "{изображение} video_attachment {видео} "
      & "audio_attachment {аудио} document_attachment {документ} "
      & "archive_attachment {архив} other {ссылка}} {name}: {state, "
      & "select, pending_attachment {ожидает отправки} "
      & "uploading_attachment {отправка} uploaded_attachment "
      & "{отправлено} failed_attachment {ошибка "
      & "отправки} removed_attachment {удалено} other "
      & "{заблокировано}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {вложение ожидает "
      & "отправки} uploading_attachment {вложение "
      & "отправляется} uploaded_attachment {вложение "
      & "отправлено} failed_attachment {ошибка отправки "
      & "вложения} removed_attachment {вложение удалено} "
      & "other {вложение заблокировано}}");
   P ("label.attachments.download_label", "скачать {name}");
   P ("label.attachments.expiring_link_label", "{name}: ссылка истекает {time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "предпросмотр {name}");
   P ("label.attachments.remove_label", "удалить {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: проверка не "
      & "выполнялась} scanning {{name}: идёт проверка} "
      & "safe {{name}: проверка — безопасно} suspicious "
      & "{{name}: проверка — подозрительно} other "
      & "{{name}: проверка — заражено}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {проверка не "
      & "выполнялась} scanning {идёт проверка} safe "
      & "{проверка: безопасно} suspicious {проверка: "
      & "подозрительно} other {проверка: "
      & "заражено}}");
   P ("label.attachments.upload_error_label", "не удалось отправить {name}: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {обычный значок} "
      & "new_badge {новый значок} updated_badge "
      & "{обновлённый значок} deprecated_badge "
      & "{устаревший значок} selected_badge {выбранный "
      & "значок} disabled_badge {отключённый значок} "
      & "other {закрываемый значок}}, тон: {tone, select, "
      & "neutral_tone {нейтральный} info_tone {информация} "
      & "success_tone {успех} warning_tone {предупреждение} "
      & "danger_tone {опасность} other {приглушённый}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {значок низкого "
      & "приоритета} medium_priority {значок среднего "
      & "приоритета} high_priority {значок высокого "
      & "приоритета} other {значок критического "
      & "приоритета}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {обычный значок} new_badge "
      & "{новый значок} updated_badge {обновлённый "
      & "значок} deprecated_badge {устаревший значок} "
      & "selected_badge {выбранный значок} disabled_badge "
      & "{отключённый значок} other {закрываемый "
      & "значок}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {нейтральный значок} "
      & "info_tone {информационный значок} success_tone "
      & "{значок успеха} warning_tone {значок "
      & "предупреждения} danger_tone {значок "
      & "опасности} other {приглушённый значок}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}: чип} other {{name}: чип, "
      & "выбран}}");
   P ("label.badges.count_badge_label", "{count, plural, =0 {{name}: нет} other {{name}: {count, number}}}");
   P ("label.badges.deprecated_label", "{name}: устарело");
   P ("label.badges.dismiss_label", "закрыть {name}");
   P ("label.badges.new_label", "{name}: новое");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {нет скрытых значков} one "
      & "{ещё +{hidden_count, number} значок} few {ещё "
      & "+{hidden_count, number} значка} many {ещё +{hidden_count, "
      & "number} значков} other {ещё +{hidden_count, number} "
      & "значка}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: значок низкого "
      & "приоритета} medium_priority {{name}: значок "
      & "среднего приоритета} high_priority {{name}: "
      & "значок высокого приоритета} other {{name}: "
      & "значок критического приоритета}}");
   P ("label.badges.status_badge_label",
      "статус {name}, тон: {tone, select, neutral_tone "
      & "{нейтральный} info_tone {информация} success_tone "
      & "{успех} warning_tone {предупреждение} danger_tone "
      & "{опасность} other {приглушённый}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {нет тегов} one {{count, number} тег} "
      & "few {{count, number} тега} many {{count, number} тегов} other "
      & "{{count, number} тега}}");
   P ("label.badges.tag_label", "тег {name}");
   P ("label.badges.updated_label", "{name}: обновлено");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {артефакт загружен} "
      & "artifact_missing {артефакт отсутствует} "
      & "artifact_expired {срок хранения артефакта "
      & "истёк} other {артефакт проверен}}");
   P ("label.builds.benchmark_label", "бенчмарк {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {сборка {name} в очереди} "
      & "build_running {сборка {name} выполняется} "
      & "build_passed {сборка {name} успешна} build_failed "
      & "{сборка {name} не удалась} snapshot_build {{name}: "
      & "снапшот-сборка} other {{name}: релизная "
      & "сборка}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {сборка в очереди} "
      & "build_running {сборка выполняется} build_passed "
      & "{сборка успешна} build_failed {сборка не "
      & "удалась} snapshot_build {снапшот-сборка} other "
      & "{релизная сборка}}");
   P ("label.builds.coverage_label", "покрытие {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {проверка перед "
      & "выпуском пройдена} gate_failed {проверка "
      & "перед выпуском не пройдена} gate_warning "
      & "{проверка перед выпуском: "
      & "предупреждение} other {выпуск "
      & "заблокирован проверкой}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {нет "
      & "пройденных тестов} other {пройдено "
      & "тестов: {count, number}}}} failed_test {{count, plural, =0 "
      & "{нет проваленных тестов} other {провалено "
      & "тестов: {count, number}}}} skipped_test {{count, plural, =0 "
      & "{нет пропущенных тестов} other {пропущено "
      & "тестов: {count, number}}}} flaky_test {{count, plural, =0 "
      & "{нет нестабильных тестов} other "
      & "{нестабильных тестов: {count, number}}}} other "
      & "{{count, plural, =0 {нет ожидаемых сбоев} other "
      & "{ожидаемых сбоев: {count, number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {пройден} failed_test "
      & "{провален} skipped_test {пропущен} flaky_test "
      & "{нестабилен} other {ожидаемый сбой}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "без изменений, выключено} other {{field_name}: "
      & "изменено с «выключено» на "
      & "«включено»}}} other {{new_value, select, false "
      & "{{field_name}: изменено с «включено» на "
      & "«выключено»} other {{field_name}: без "
      & "изменений, включено}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {добавлено} removed_change "
      & "{удалено} modified_change {изменено} renamed_change "
      & "{переименовано} unchanged_change {без "
      & "изменений} metadata_change {изменены "
      & "метаданные} moved_change {перемещено} "
      & "conflict_change {конфликт} other {неизвестное "
      & "изменение}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {информационное "
      & "изменение} minor_change {незначительное "
      & "изменение} major_change {существенное "
      & "изменение} other {несовместимое "
      & "изменение}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: без "
      & "изменений} other {{unchanged, plural, =0 {{field_name} — "
      & "добавлено: {added, number}} other {{field_name} — "
      & "добавлено: {added, number}, без изменений: "
      & "{unchanged, number}}}}}} other {{added, plural, =0 {{unchanged, "
      & "plural, =0 {{field_name} — удалено: {removed, number}} other "
      & "{{field_name} — удалено: {removed, number}, без "
      & "изменений: {unchanged, number}}}} other {{unchanged, plural, "
      & "=0 {{field_name} — добавлено: {added, number}, "
      & "удалено: {removed, number}} other {{field_name} — "
      & "добавлено: {added, number}, удалено: {removed, "
      & "number}, без изменений: {unchanged, number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {нет конфликтов} one {{count, number} "
      & "конфликт} few {{count, number} конфликта} many "
      & "{{count, number} конфликтов} other {{count, number} "
      & "конфликта}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: перенесено "
      & "позже, с «{old_label}» на «{new_label}»} other "
      & "{{field_name}: перенесено раньше, с «{old_label}» "
      & "на «{new_label}»}}");
   P ("label.changes.duration_field_change_label",
      "{field_name}: изменено с «{old_label}» на «{new_label}»");
   P ("label.changes.field_change_label", "{field_name}: изменено с «{old_value}» на «{new_value}»");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: добавлено} "
      & "removed_change {{name}: удалено} modified_change {{name}: "
      & "изменено} renamed_change {{name}: переименовано} "
      & "unchanged_change {{name}: без изменений} metadata_change "
      & "{{name}: изменены метаданные} moved_change {{name}: "
      & "перемещено} conflict_change {{name}: конфликт} other "
      & "{{name}: неизвестное изменение}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {изменены только "
      & "метаданные} other {изменены только поля "
      & "метаданных: {count, number}}}");
   P ("label.changes.move_label", "{name}: перемещено из {from} в {to}");
   P ("label.changes.no_changes_label", "нет изменений");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {строки "
      & "не изменены} other {добавлено строк: "
      & "{lines_added, number}}}} other {{lines_added, plural, =0 "
      & "{удалено строк: {lines_removed, number}} other "
      & "{добавлено строк: {lines_added, number}, удалено "
      & "строк: {lines_removed, number}}}}}");
   P ("label.changes.rename_label", "переименовано из «{old_name}» в «{new_name}»");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author}: черновик "
      & "комментария} published_comment {{author}: "
      & "комментарий опубликован} edited_comment "
      & "{{author}: комментарий отредактирован} "
      & "deleted_comment {{author}: комментарий удалён} "
      & "resolved_comment {{author}: комментарий решён} "
      & "unresolved_comment {{author}: комментарий открыт "
      & "повторно} pinned_comment {{author}: комментарий "
      & "закреплён} other {{author}: комментарий "
      & "скрыт}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {нет комментариев} one {{count, "
      & "number} комментарий} few {{count, number} "
      & "комментария} many {{count, number} "
      & "комментариев} other {{count, number} "
      & "комментария}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: черновик "
      & "комментария} published_comment {{author}: "
      & "опубликованный комментарий} edited_comment "
      & "{{author}: отредактированный комментарий} "
      & "deleted_comment {{author}: удалённый комментарий} "
      & "resolved_comment {{author}: решённый комментарий} "
      & "unresolved_comment {{author}: нерешённый "
      & "комментарий} pinned_comment {{author}: "
      & "закреплённый комментарий} other {{author}: "
      & "скрытый комментарий}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {черновик "
      & "комментария} published_comment "
      & "{опубликованный комментарий} edited_comment "
      & "{отредактированный комментарий} "
      & "deleted_comment {удалённый комментарий} "
      & "resolved_comment {решённый комментарий} "
      & "unresolved_comment {нерешённый комментарий} "
      & "pinned_comment {закреплённый комментарий} other "
      & "{скрытый комментарий}}");
   P ("label.comments.deleted_label", "{author}: комментарий удалён");
   P ("label.comments.edited_label", "отредактировано {time_text}");
   P ("label.comments.hide_comment_label", "скрыть комментарий: {reason}");
   P ("label.comments.lock_thread_label", "заблокировать ветку {name}");
   P ("label.comments.mention_label", "{actor} упоминает {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {нет участников} one {{count, number} "
      & "участник} few {{count, number} участника} many "
      & "{{count, number} участников} other {{count, number} "
      & "участника}}");
   P ("label.comments.pin_label", "закрепить {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {реакция «нравится»} "
      & "dislike_reaction {реакция «не нравится»} "
      & "heart_reaction {реакция «сердце»} laugh_reaction "
      & "{реакция «смех»} confused_reaction {реакция «в "
      & "замешательстве»} hooray_reaction {реакция "
      & "«ура»} rocket_reaction {реакция «ракета»} other "
      & "{реакция «глаза»}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {нет "
      & "реакций «нравится»} other {«нравится»: "
      & "{count, number}}}} dislike_reaction {{count, plural, =0 {нет "
      & "реакций «не нравится»} other {«не "
      & "нравится»: {count, number}}}} heart_reaction {{count, plural, "
      & "=0 {нет реакций «сердце»} other {«сердце»: "
      & "{count, number}}}} laugh_reaction {{count, plural, =0 {нет "
      & "реакций «смех»} other {«смех»: {count, number}}}} "
      & "confused_reaction {{count, plural, =0 {нет реакций «в "
      & "замешательстве»} other {«в "
      & "замешательстве»: {count, number}}}} hooray_reaction "
      & "{{count, plural, =0 {нет реакций «ура»} other "
      & "{«ура»: {count, number}}}} rocket_reaction {{count, plural, =0 "
      & "{нет реакций «ракета»} other {«ракета»: "
      & "{count, number}}}} other {{count, plural, =0 {нет реакций "
      & "«глаза»} other {«глаза»: {count, number}}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {нет ответов} one {{count, number} "
      & "ответ} few {{count, number} ответа} many {{count, number} "
      & "ответов} other {{count, number} ответа}}");
   P ("label.comments.resolved_label", "{name}: решено");
   P ("label.comments.subscribe_label", "подписаться на {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {нет веток} one {{count, number} "
      & "ветка} few {{count, number} ветки} many {{count, number} "
      & "веток} other {{count, number} ветки}}");
   P ("label.comments.thread_label",
      "{state, select, open_thread {{count, plural, =0 {{name}: "
      & "открытая ветка} other {{name}: открытая "
      & "ветка, комментариев: {count, number}}}} "
      & "resolved_thread {{count, plural, =0 {{name}: решённая "
      & "ветка} other {{name}: решённая ветка, "
      & "комментариев: {count, number}}}} locked_thread {{count, "
      & "plural, =0 {{name}: заблокированная ветка} other "
      & "{{name}: заблокированная ветка, "
      & "комментариев: {count, number}}}} other {{count, plural, =0 "
      & "{{name}: архивная ветка} other {{name}: архивная "
      & "ветка, комментариев: {count, number}}}}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {открытая ветка} "
      & "resolved_thread {решённая ветка} locked_thread "
      & "{заблокированная ветка} other {архивная "
      & "ветка}}");
   P ("label.comments.unpin_label", "открепить {name}");
   P ("label.comments.unsubscribe_label", "отписаться от {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: улучшение} regressed "
      & "{{name}: ухудшение} unchanged {{name}: без "
      & "изменений} within_tolerance {{name}: в пределах "
      & "допуска} outside_tolerance {{name}: вне допуска} "
      & "new_value {{name}: новое значение} removed_value {{name}: "
      & "значение удалено} other {{name}: нет "
      & "базового значения}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {улучшение} regressed "
      & "{ухудшение} unchanged {без изменений} "
      & "within_tolerance {в пределах допуска} "
      & "outside_tolerance {вне допуска} new_value {новое "
      & "значение} removed_value {значение удалено} "
      & "other {нет базового значения}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: улучшение на "
      & "{difference_text}} regressed {{name}: ухудшение на "
      & "{difference_text}} unchanged {{name}: без изменений "
      & "({difference_text})} within_tolerance {{name}: в пределах "
      & "допуска ({difference_text})} outside_tolerance {{name}: вне "
      & "допуска ({difference_text})} new_value {{name}: новое "
      & "значение ({difference_text})} removed_value {{name}: "
      & "значение удалено ({difference_text})} other {{name}: "
      & "нет базового значения ({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: улучшение на "
      & "{difference_text}, допуск {tolerance_text}} regressed {{name}: "
      & "ухудшение на {difference_text}, допуск "
      & "{tolerance_text}} unchanged {{name}: без изменений "
      & "({difference_text}), допуск {tolerance_text}} within_tolerance "
      & "{{name}: в пределах допуска ({difference_text}), "
      & "допуск {tolerance_text}} outside_tolerance {{name}: вне "
      & "допуска ({difference_text}), допуск {tolerance_text}} "
      & "new_value {{name}: новое значение ({difference_text}), "
      & "допуск {tolerance_text}} removed_value {{name}: значение "
      & "удалено ({difference_text}), допуск {tolerance_text}} "
      & "other {{name}: нет базового значения "
      & "({difference_text}), допуск {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {недопустимая строка} "
      & "duplicate_record {дубликат записи} missing_column "
      & "{отсутствует столбец} unknown_field "
      & "{неизвестное поле} schema_mismatch "
      & "{несоответствие схеме} other "
      & "{пропущенная запись}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {пробный запуск "
      & "успешен} dry_run_failed {пробный запуск не "
      & "удался} import_valid {импорт корректен} "
      & "import_invalid {импорт некорректен} other "
      & "{частичный импорт}}");
   P ("label.data_quality.import_result_label",
      "{state, select, dry_run_passed {{name}: пробный запуск "
      & "успешен — принято: {accepted, number}, "
      & "отклонено: {rejected, number}} dry_run_failed {{name}: "
      & "пробный запуск не удался — принято: "
      & "{accepted, number}, отклонено: {rejected, number}} "
      & "import_valid {{name}: импорт корректен — "
      & "принято: {accepted, number}, отклонено: {rejected, "
      & "number}} import_invalid {{name}: импорт некорректен "
      & "— принято: {accepted, number}, отклонено: {rejected, "
      & "number}} other {{name}: частичный импорт — "
      & "принято: {accepted, number}, отклонено: {rejected, "
      & "number}}}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {нет "
      & "недопустимых строк} other {недопустимых "
      & "строк: {count, number}}}} duplicate_record {{count, plural, =0 "
      & "{нет дубликатов записей} other "
      & "{дубликатов записей: {count, number}}}} "
      & "missing_column {{count, plural, =0 {нет отсутствующих "
      & "столбцов} other {отсутствующих столбцов: "
      & "{count, number}}}} unknown_field {{count, plural, =0 {нет "
      & "неизвестных полей} other {неизвестных "
      & "полей: {count, number}}}} schema_mismatch {{count, plural, =0 "
      & "{нет несоответствий схеме} other "
      & "{несоответствий схеме: {count, number}}}} other "
      & "{{count, plural, =0 {нет пропущенных записей} "
      & "other {пропущенных записей: {count, number}}}}}");
   P ("label.data_quality.row_issue_label",
      "{issue, select, invalid_row {строка {row, number}: "
      & "недопустима} duplicate_record {строка {row, number}: "
      & "дубликат записи} missing_column {строка {row, "
      & "number}: отсутствует столбец} unknown_field "
      & "{строка {row, number}: неизвестное поле} "
      & "schema_mismatch {строка {row, number}: "
      & "несоответствие схеме} other {строка {row, "
      & "number}: запись пропущена}}");
   P ("label.data_quality.source_file_issue_label",
      "{issue, select, invalid_row {{file_name}: недопустимая "
      & "строка} duplicate_record {{file_name}: дубликат "
      & "записи} missing_column {{file_name}: отсутствует "
      & "столбец} unknown_field {{file_name}: неизвестное "
      & "поле} schema_mismatch {{file_name}: несоответствие "
      & "схеме} other {{file_name}: пропущенная запись}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {артефакт готов} "
      & "artifact_uploaded {артефакт загружен} artifact_signed "
      & "{артефакт подписан} artifact_missing {артефакт "
      & "отсутствует} other {срок действия "
      & "артефакта истёк}}");
   P ("label.deployments.deployment_label",
      "{name} → {environment}: {state, select, queued_deployment {в "
      & "очереди на развёртывание} deploying "
      & "{развёртывание} deployed {развёрнуто} "
      & "failed_deployment {ошибка развёртывания} "
      & "rolled_back {откачено} blocked_deployment "
      & "{развёртывание заблокировано} other "
      & "{развёртывание отменено}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {в очереди на "
      & "развёртывание} deploying {развёртывание} "
      & "deployed {развёрнуто} failed_deployment {ошибка "
      & "развёртывания} rolled_back {откачено} "
      & "blocked_deployment {развёртывание "
      & "заблокировано} other {развёртывание "
      & "отменено}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {окружение "
      & "исправно} drifting_environment {дрейф окружения} "
      & "locked_environment {окружение заблокировано} "
      & "maintenance_environment {окружение на "
      & "обслуживании} other {состояние окружения "
      & "неизвестно}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {без миграции} "
      & "migration_pending {миграция ожидает} migrating "
      & "{выполняется миграция} migration_complete "
      & "{миграция завершена} other {ошибка "
      & "миграции}}");
   P ("label.deployments.promotion_label",
      "{name}: продвижение из {from_environment} в "
      & "{to_environment}");
   P ("label.deployments.rollback_label", "{name}: откат до {target}");
   P ("label.deployments.rollout_label", "{name}: раскатка {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {нет затронутых элементов} "
      & "other {{count, plural, one {{count, number} затронутый "
      & "элемент} few {{count, number} затронутых "
      & "элемента} many {{count, number} затронутых "
      & "элементов} other {{count, number} затронутого "
      & "элемента}}}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {пройдено} failed_check "
      & "{ошибка} warning_check {предупреждения} "
      & "skipped_check {пропущено} pending_check {ожидает} "
      & "other {выполняется}} ({duration_s, plural, one "
      & "{{duration_s, number} секунда} few {{duration_s, number} "
      & "секунды} many {{duration_s, number} секунд} other "
      & "{{duration_s, number} секунды}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {пройдено} failed_check "
      & "{ошибка} warning_check {предупреждения} "
      & "skipped_check {пропущено} pending_check {ожидает} "
      & "other {выполняется}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {пройдено} failed_check "
      & "{ошибка} warning_check {предупреждения} "
      & "skipped_check {пропущено} pending_check {ожидает} "
      & "other {выполняется}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {ожидалось значение "
      & "для {subject}} expected_unit {ожидалась единица "
      & "измерения для {subject}} invalid_range "
      & "{недопустимый диапазон для {subject}} "
      & "end_before_start {конец диапазона раньше "
      & "начала для {subject}} unknown_field {неизвестное "
      & "поле {subject}} unsafe_redacted_value {небезопасное "
      & "значение {subject} скрыто} unsupported_syntax "
      & "{неподдерживаемый синтаксис для {subject}} "
      & "other {пояснение к диагностике для "
      & "{subject}}}{position, plural, =0 {; используйте "
      & "{suggestion}} other { (позиция {position, number}); "
      & "используйте {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {информация} "
      & "notice_severity {замечание} warning_severity "
      & "{предупреждение} error_severity {ошибка} "
      & "critical_severity {критическая ошибка} other "
      & "{блокирующая ошибка}} ({line, plural, =0 {{path}} "
      & "other {{path}, строка {line, number}}}): {message}");
   P ("label.diagnostics.failed_at_label",
      "сбой: {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, строка {line, number}} other {{path}, строка "
      & "{line, number}, столбец {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {информация} "
      & "notice_severity {замечание} warning_severity "
      & "{предупреждение} error_severity {ошибка} "
      & "critical_severity {критическая ошибка} other "
      & "{блокирующая ошибка}} в поле {field_name}: "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "первый сбой в {check_name}: {line, plural, =0 {{path}} "
      & "other {{path}, строка {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{нет проблем} other {{notices, plural, one {{notices, "
      & "number} замечание} few {{notices, number} замечания} "
      & "many {{notices, number} замечаний} other {{notices, number} "
      & "замечания}}}}} other {{notices, plural, =0 {{warnings, "
      & "plural, one {{warnings, number} предупреждение} few "
      & "{{warnings, number} предупреждения} many {{warnings, "
      & "number} предупреждений} other {{warnings, number} "
      & "предупреждения}}} other {{warnings, plural, one "
      & "{{warnings, number} предупреждение} few {{warnings, "
      & "number} предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}, {notices, plural, one {{notices, "
      & "number} замечание} few {{notices, number} замечания} "
      & "many {{notices, number} замечаний} other {{notices, number} "
      & "замечания}}}}}}} other {{warnings, plural, =0 {{notices, "
      & "plural, =0 {{errors, plural, one {{errors, number} ошибка} few "
      & "{{errors, number} ошибки} many {{errors, number} ошибок} "
      & "other {{errors, number} ошибки}}} other {{errors, plural, one "
      & "{{errors, number} ошибка} few {{errors, number} ошибки} "
      & "many {{errors, number} ошибок} other {{errors, number} "
      & "ошибки}}, {notices, plural, one {{notices, number} "
      & "замечание} few {{notices, number} замечания} many "
      & "{{notices, number} замечаний} other {{notices, number} "
      & "замечания}}}}} other {{notices, plural, =0 {{errors, plural, "
      & "one {{errors, number} ошибка} few {{errors, number} "
      & "ошибки} many {{errors, number} ошибок} other {{errors, "
      & "number} ошибки}}, {warnings, plural, one {{warnings, number} "
      & "предупреждение} few {{warnings, number} "
      & "предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}} other {{errors, plural, one {{errors, "
      & "number} ошибка} few {{errors, number} ошибки} many "
      & "{{errors, number} ошибок} other {{errors, number} "
      & "ошибки}}, {warnings, plural, one {{warnings, number} "
      & "предупреждение} few {{warnings, number} "
      & "предупреждения} many {{warnings, number} "
      & "предупреждений} other {{warnings, number} "
      & "предупреждения}}, {notices, plural, one {{notices, "
      & "number} замечание} few {{notices, number} замечания} "
      & "many {{notices, number} замечаний} other {{notices, number} "
      & "замечания}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, "
      & "строка {line, number}} other {{path}, строка {line, "
      & "number}, столбец {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "неподдерживаемый синтаксис для {family, "
      & "select, byte_parser {парсера размеров} duration_parser "
      & "{парсера длительности} date_time_parser "
      & "{парсера даты и времени} color_parser "
      & "{парсера цвета} url_parser {парсера URL} "
      & "unit_parser {парсера единиц} recurrence_parser "
      & "{парсера повторений} domain_label_parser "
      & "{парсера доменных меток} other {парсера}} "
      & "{error}{position, plural, =0 {;} other { (позиция {position, "
      & "number});}} {family, select, byte_parser {используйте B, "
      & "kB, MB, GB, KiB, MiB, GiB или TiB} duration_parser "
      & "{используйте ms, s, min, h, d, w, month или year} "
      & "date_time_parser {используйте дату ISO, день "
      & "словами или время} color_parser {используйте "
      & "hex, rgb(), hsl(), lab(), lch() или название цвета} "
      & "url_parser {используйте схему, хост, путь, "
      & "запрос или фрагмент} unit_parser "
      & "{используйте поддерживаемую единицу "
      & "Humanize} recurrence_parser {используйте cron или "
      & "форму повторения every/weekday} domain_label_parser "
      & "{используйте детерминированную "
      & "доменную метку Humanize} other {используйте "
      & "поддерживаемую форму ввода}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {пройдено} failed_check "
      & "{ошибка} warning_check {предупреждения} "
      & "skipped_check {пропущено} pending_check {ожидает} "
      & "other {выполняется}}, {notices, plural, =0 {без "
      & "замечаний} other {{notices, plural, one {{notices, number} "
      & "замечание} few {{notices, number} замечания} many "
      & "{{notices, number} замечаний} other {{notices, number} "
      & "замечания}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {попытка 1 из 1} "
      & "other {попытка {attempt, number} из 1: лимит "
      & "превышен}}} other {попытка {attempt, number} из "
      & "{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {информация} "
      & "notice_severity {замечание} warning_severity "
      & "{предупреждение} error_severity {ошибка} "
      & "critical_severity {критическая ошибка} other "
      & "{блокирующая ошибка}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {диагностика сборки} "
      & "test_source {диагностика тестов} lint_source "
      & "{диагностика линтера} import_source "
      & "{диагностика импорта} validation_source "
      & "{диагностика валидации} runtime_source "
      & "{диагностика выполнения} security_source "
      & "{диагностика безопасности} other "
      & "{диагностика}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {диагностика сборки} "
      & "test_source {диагностика тестов} lint_source "
      & "{диагностика линтера} import_source "
      & "{диагностика импорта} validation_source "
      & "{диагностика валидации} runtime_source "
      & "{диагностика выполнения} security_source "
      & "{диагностика безопасности} other "
      & "{диагностика}}: {count, number}");
   P ("label.diagnostics.suggested_action_label", "следующий шаг: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {доменное имя} ipv4_host "
      & "{адрес IPv4} ipv6_host {адрес IPv6} localhost_host "
      & "{локальный хост} private_network_host {адрес "
      & "частной сети} other {неизвестный хост}}");
   P ("label.events.all_day_label", "{name}: весь день");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {нет ответа} accepted "
      & "{принято} declined {отклонено} maybe "
      & "{возможно} other {в листе ожидания}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {нет участников} other {{count, "
      & "plural, one {{count, number} участник} few {{count, number} "
      & "участника} many {{count, number} участников} other "
      & "{{count, number} участника}}}}");
   P ("label.events.canceled_label", "{name}: отменено");
   P ("label.events.check_in_label", "отметиться: {name}");
   P ("label.events.conference_link_label", "{name}: ссылка на конференцию");
end Labels_1;
