separate (Humanize.Catalogs.Phrase_Data.Locale_Uk)
procedure Labels_1 is
begin
   P ("label.accounts.account_label",
      "{state, select, active_account {обліковий запис {name}: "
      & "активний} invited_account {обліковий запис "
      & "{name}: запрошений} locked_account {обліковий "
      & "запис {name}: заблокований} suspended_account "
      & "{обліковий запис {name}: призупинений} "
      & "deleted_account {обліковий запис {name}: "
      & "видалений} other {обліковий запис {name}: "
      & "стан невідомий}}");
   P ("label.accounts.account_state_label",
      "{state, select, active_account {активний обліковий "
      & "запис} invited_account {запрошений обліковий "
      & "запис} locked_account {заблокований "
      & "обліковий запис} suspended_account "
      & "{призупинений обліковий запис} "
      & "deleted_account {видалений обліковий запис} "
      & "other {невідомий стан облікового запису}}");
   P ("label.accounts.device_trust_label",
      "{state, select, trusted_device {довірений пристрій} "
      & "untrusted_device {недовірений пристрій} new_device "
      & "{новий пристрій} other {заблокований "
      & "пристрій}}");
   P ("label.accounts.last_active_label", "{name}: остання активність {time_text}");
   P ("label.accounts.login_attempt_label",
      "{succeeded, select, false {{name}: не вдалося увійти} "
      & "other {{name}: вхід виконано}}");
   P ("label.accounts.mfa_state_label",
      "{state, select, mfa_enabled {MFA увімкнено} mfa_disabled {MFA "
      & "вимкнено} mfa_required {MFA обов’язкова} other "
      & "{потрібно скинути MFA}}");
   P ("label.accounts.session_label",
      "{state, select, active_session {{name}: активний сеанс} "
      & "expired_session {{name}: сеанс завершився} "
      & "revoked_session {{name}: сеанс відкликано} idle_session "
      & "{{name}: сеанс неактивний} other {{name}: стан "
      & "сеансу невідомий}}");
   P ("label.accounts.session_state_label",
      "{state, select, active_session {активний сеанс} "
      & "expired_session {сеанс завершився} revoked_session "
      & "{сеанс відкликано} idle_session {сеанс "
      & "неактивний} other {стан сеансу "
      & "невідомий}}");
   P ("label.attachments.attachment_count_label",
      "{count, plural, =0 {немає вкладень} one {{count, number} "
      & "вкладення} few {{count, number} вкладення} many "
      & "{{count, number} вкладень} other {{count, number} "
      & "вкладення}}");
   P ("label.attachments.attachment_group_label",
      "{count, plural, =0 {{name}: немає вкладень} one {{name}: "
      & "{count, number} вкладення} few {{name}: {count, number} "
      & "вкладення} many {{name}: {count, number} вкладень} "
      & "other {{name}: {count, number} вкладення}}");
   P ("label.attachments.attachment_kind_label",
      "{kind, select, file_attachment {вкладений файл} "
      & "image_attachment {вкладене зображення} "
      & "video_attachment {вкладене відео} audio_attachment "
      & "{вкладене аудіо} document_attachment {вкладений "
      & "документ} archive_attachment {вкладений архів} "
      & "other {вкладене посилання}}");
   P ("label.attachments.attachment_label",
      "{kind, select, file_attachment {файл} image_attachment "
      & "{зображення} video_attachment {відео} audio_attachment "
      & "{аудіо} document_attachment {документ} archive_attachment "
      & "{архів} other {посилання}} {name}: {state, select, "
      & "pending_attachment {очікує надсилання} "
      & "uploading_attachment {надсилання} uploaded_attachment "
      & "{надіслано} failed_attachment {помилка "
      & "надсилання} removed_attachment {видалено} other "
      & "{заблоковано}}");
   P ("label.attachments.attachment_size_label", "{name}, {size}");
   P ("label.attachments.attachment_state_label",
      "{state, select, pending_attachment {вкладення очікує "
      & "надсилання} uploading_attachment {вкладення "
      & "надсилається} uploaded_attachment {вкладення "
      & "надіслано} failed_attachment {помилка "
      & "надсилання вкладення} removed_attachment "
      & "{вкладення видалено} other {вкладення "
      & "заблоковано}}");
   P ("label.attachments.download_label", "завантажити {name}");
   P ("label.attachments.expiring_link_label",
      "{name}: термін дії посилання спливає "
      & "{time_text}");
   P ("label.attachments.image_dimensions_label", "{name}, {dimensions}");
   P ("label.attachments.preview_label", "попередній перегляд {name}");
   P ("label.attachments.remove_label", "видалити {name}");
   P ("label.attachments.scan_result_label",
      "{state, select, not_scanned {{name}: перевірку не "
      & "виконано} scanning {{name}: триває перевірка} "
      & "safe {{name}: перевірка — безпечно} suspicious "
      & "{{name}: перевірка — підозріло} other {{name}: "
      & "перевірка — заражено}}");
   P ("label.attachments.scan_state_label",
      "{state, select, not_scanned {перевірку не виконано} "
      & "scanning {триває перевірка} safe {перевірка: "
      & "безпечно} suspicious {перевірка: підозріло} "
      & "other {перевірка: заражено}}");
   P ("label.attachments.upload_error_label", "не вдалося надіслати {name}: {reason}");
   P ("label.badges.badge_label",
      "{name}: {state, select, default_badge {звичайний "
      & "значок} new_badge {новий значок} updated_badge "
      & "{оновлений значок} deprecated_badge "
      & "{застарілий значок} selected_badge {вибраний "
      & "значок} disabled_badge {вимкнений значок} other "
      & "{значок, який можна закрити}}, тон: {tone, "
      & "select, neutral_tone {нейтральний} info_tone "
      & "{інформація} success_tone {успіх} warning_tone "
      & "{попередження} danger_tone {небезпека} other "
      & "{приглушений}}");
   P ("label.badges.badge_priority_label",
      "{priority, select, low_priority {значок низького "
      & "пріоритету} medium_priority {значок "
      & "середнього пріоритету} high_priority {значок "
      & "високого пріоритету} other {значок "
      & "критичного пріоритету}}");
   P ("label.badges.badge_state_label",
      "{state, select, default_badge {звичайний значок} "
      & "new_badge {новий значок} updated_badge {оновлений "
      & "значок} deprecated_badge {застарілий значок} "
      & "selected_badge {вибраний значок} disabled_badge "
      & "{вимкнений значок} other {значок, який "
      & "можна закрити}}");
   P ("label.badges.badge_tone_label",
      "{tone, select, neutral_tone {нейтральний значок} "
      & "info_tone {інформаційний значок} success_tone "
      & "{значок успіху} warning_tone {значок "
      & "попередження} danger_tone {значок "
      & "небезпеки} other {приглушений значок}}");
   P ("label.badges.chip_label",
      "{selected, select, false {{name}: чип} other {{name}: чип, "
      & "вибрано}}");
   P ("label.badges.count_badge_label",
      "{count, plural, =0 {{name}: немає} other {{name}: {count, "
      & "number}}}");
   P ("label.badges.deprecated_label", "{name}: застаріло");
   P ("label.badges.dismiss_label", "закрити {name}");
   P ("label.badges.new_label", "{name}: нове");
   P ("label.badges.overflow_badge_label",
      "{hidden_count, plural, =0 {немає прихованих "
      & "значків} one {ще +{hidden_count, number} значок} few "
      & "{ще +{hidden_count, number} значки} many {ще +{hidden_count, "
      & "number} значків} other {ще +{hidden_count, number} "
      & "значка}}");
   P ("label.badges.priority_badge_label",
      "{priority, select, low_priority {{name}: значок низького "
      & "пріоритету} medium_priority {{name}: значок "
      & "середнього пріоритету} high_priority {{name}: "
      & "значок високого пріоритету} other {{name}: "
      & "значок критичного пріоритету}}");
   P ("label.badges.status_badge_label",
      "статус {name}, тон: {tone, select, neutral_tone "
      & "{нейтральний} info_tone {інформація} success_tone "
      & "{успіх} warning_tone {попередження} danger_tone "
      & "{небезпека} other {приглушений}}");
   P ("label.badges.tag_count_label",
      "{count, plural, =0 {немає тегів} one {{count, number} "
      & "тег} few {{count, number} теги} many {{count, number} "
      & "тегів} other {{count, number} тега}}");
   P ("label.badges.tag_label", "тег {name}");
   P ("label.badges.updated_label", "{name}: оновлено");
   P ("label.builds.artifact_state_label",
      "{state, select, artifact_uploaded {артефакт "
      & "надіслано} artifact_missing {артефакт "
      & "відсутній} artifact_expired {термін "
      & "зберігання артефакту минув} other "
      & "{артефакт перевірено}}");
   P ("label.builds.benchmark_label", "бенчмарк {name}: {result_text}");
   P ("label.builds.build_label",
      "{state, select, build_queued {збірка {name} у черзі} "
      & "build_running {збірка {name} виконується} "
      & "build_passed {збірка {name} успішна} build_failed "
      & "{збірка {name} не вдалася} snapshot_build {{name}: "
      & "снапшот-збірка} other {{name}: релізна "
      & "збірка}}");
   P ("label.builds.build_state_label",
      "{state, select, build_queued {збірка в черзі} "
      & "build_running {збірка виконується} build_passed "
      & "{збірка успішна} build_failed {збірка не "
      & "вдалася} snapshot_build {снапшот-збірка} other "
      & "{релізна збірка}}");
   P ("label.builds.coverage_label", "покриття {percent_text}");
   P ("label.builds.gate_state_label",
      "{state, select, gate_passed {перевірку перед "
      & "випуском пройдено} gate_failed {перевірку "
      & "перед випуском не пройдено} gate_warning "
      & "{перевірка перед випуском: "
      & "попередження} other {випуск заблоковано "
      & "перевіркою}}");
   P ("label.builds.test_count_label",
      "{state, select, passed_test {{count, plural, =0 {немає "
      & "пройдених тестів} other {пройдено тестів: "
      & "{count, number}}}} failed_test {{count, plural, =0 {немає "
      & "непройдених тестів} other {не пройдено "
      & "тестів: {count, number}}}} skipped_test {{count, plural, =0 "
      & "{немає пропущених тестів} other "
      & "{пропущено тестів: {count, number}}}} flaky_test "
      & "{{count, plural, =0 {немає нестабільних тестів} "
      & "other {нестабільних тестів: {count, number}}}} other "
      & "{{count, plural, =0 {немає очікуваних збоїв} other "
      & "{очікуваних збоїв: {count, number}}}}}");
   P ("label.builds.test_state_label",
      "{state, select, passed_test {пройдено} failed_test {не "
      & "пройдено} skipped_test {пропущено} flaky_test "
      & "{нестабільний} other {очікуваний збій}}");
   P ("label.changes.boolean_field_change_label",
      "{old_value, select, false {{new_value, select, false {{field_name}: "
      & "без змін, вимкнено} other {{field_name}: змінено "
      & "з «вимкнено» на «увімкнено»}}} other "
      & "{{new_value, select, false {{field_name}: змінено з "
      & "«увімкнено» на «вимкнено»} other {{field_name}: "
      & "без змін, увімкнено}}}}");
   P ("label.changes.change_kind_label",
      "{kind, select, added_change {додано} removed_change "
      & "{видалено} modified_change {змінено} renamed_change "
      & "{перейменовано} unchanged_change {без змін} "
      & "metadata_change {змінено метадані} moved_change "
      & "{переміщено} conflict_change {конфлікт} other "
      & "{невідома зміна}}");
   P ("label.changes.change_severity_label",
      "{severity, select, informational_change {інформаційна "
      & "зміна} minor_change {незначна зміна} major_change "
      & "{суттєва зміна} other {несумісна зміна}}");
   P ("label.changes.collection_field_change_label",
      "{removed, plural, =0 {{added, plural, =0 {{field_name}: без "
      & "змін} other {{unchanged, plural, =0 {{field_name} — "
      & "додано: {added, number}} other {{field_name} — додано: "
      & "{added, number}, без змін: {unchanged, number}}}}}} other "
      & "{{added, plural, =0 {{unchanged, plural, =0 {{field_name} — "
      & "видалено: {removed, number}} other {{field_name} — "
      & "видалено: {removed, number}, без змін: {unchanged, "
      & "number}}}} other {{unchanged, plural, =0 {{field_name} — "
      & "додано: {added, number}, видалено: {removed, number}} "
      & "other {{field_name} — додано: {added, number}, "
      & "видалено: {removed, number}, без змін: {unchanged, "
      & "number}}}}}}}");
   P ("label.changes.conflict_label",
      "{count, plural, =0 {немає конфліктів} one {{count, "
      & "number} конфлікт} few {{count, number} конфлікти} "
      & "many {{count, number} конфліктів} other {{count, number} "
      & "конфлікту}}");
   P ("label.changes.date_field_change_label",
      "{earlier, select, false {{field_name}: перенесено "
      & "пізніше, з «{old_label}» на «{new_label}»} other "
      & "{{field_name}: перенесено раніше, з «{old_label}» "
      & "на «{new_label}»}}");
   P ("label.changes.duration_field_change_label",
      "{field_name}: змінено з «{old_label}» на «{new_label}»");
   P ("label.changes.field_change_label", "{field_name}: змінено з «{old_value}» на «{new_value}»");
   P ("label.changes.item_change_label",
      "{kind, select, added_change {{name}: додано} removed_change "
      & "{{name}: видалено} modified_change {{name}: змінено} "
      & "renamed_change {{name}: перейменовано} unchanged_change "
      & "{{name}: без змін} metadata_change {{name}: змінено "
      & "метадані} moved_change {{name}: переміщено} "
      & "conflict_change {{name}: конфлікт} other {{name}: "
      & "невідома зміна}}");
   P ("label.changes.metadata_only_label",
      "{count, plural, =0 {змінено лише метадані} other "
      & "{змінено лише полів метаданих: {count, "
      & "number}}}");
   P ("label.changes.move_label", "{name}: переміщено з {from} до {to}");
   P ("label.changes.no_changes_label", "немає змін");
   P ("label.changes.patch_size_label",
      "{lines_removed, plural, =0 {{lines_added, plural, =0 {рядки не "
      & "змінено} other {додано рядків: {lines_added, "
      & "number}}}} other {{lines_added, plural, =0 {видалено "
      & "рядків: {lines_removed, number}} other {додано "
      & "рядків: {lines_added, number}, видалено рядків: "
      & "{lines_removed, number}}}}}");
   P ("label.changes.rename_label", "перейменовано з «{old_name}» на «{new_name}»");
   P ("label.comments.author_action_label",
      "{state, select, draft_comment {{author}: чернетка "
      & "коментаря} published_comment {{author}: коментар "
      & "опубліковано} edited_comment {{author}: коментар "
      & "відредаговано} deleted_comment {{author}: "
      & "коментар видалено} resolved_comment {{author}: "
      & "коментар розв’язано} unresolved_comment {{author}: "
      & "коментар знову відкрито} pinned_comment "
      & "{{author}: коментар закріплено} other {{author}: "
      & "коментар приховано}}");
   P ("label.comments.comment_count_label",
      "{count, plural, =0 {немає коментарів} one {{count, "
      & "number} коментар} few {{count, number} коментарі} "
      & "many {{count, number} коментарів} other {{count, number} "
      & "коментаря}}");
   P ("label.comments.comment_label",
      "{state, select, draft_comment {{author}: чернетка "
      & "коментаря} published_comment {{author}: "
      & "опублікований коментар} edited_comment {{author}: "
      & "відредагований коментар} deleted_comment "
      & "{{author}: видалений коментар} resolved_comment "
      & "{{author}: розв’язаний коментар} "
      & "unresolved_comment {{author}: нерозв’язаний "
      & "коментар} pinned_comment {{author}: закріплений "
      & "коментар} other {{author}: прихований "
      & "коментар}}");
   P ("label.comments.comment_state_label",
      "{state, select, draft_comment {чернетка коментаря} "
      & "published_comment {опублікований коментар} "
      & "edited_comment {відредагований коментар} "
      & "deleted_comment {видалений коментар} resolved_comment "
      & "{розв’язаний коментар} unresolved_comment "
      & "{нерозв’язаний коментар} pinned_comment "
      & "{закріплений коментар} other {прихований "
      & "коментар}}");
   P ("label.comments.deleted_label", "{author}: коментар видалено");
   P ("label.comments.edited_label", "відредаговано {time_text}");
   P ("label.comments.hide_comment_label", "приховати коментар: {reason}");
   P ("label.comments.lock_thread_label", "заблокувати гілку {name}");
   P ("label.comments.mention_label", "{actor} згадує {target}");
   P ("label.comments.participant_count_label",
      "{count, plural, =0 {немає учасників} one {{count, "
      & "number} учасник} few {{count, number} учасники} many "
      & "{{count, number} учасників} other {{count, number} "
      & "учасника}}");
   P ("label.comments.pin_label", "закріпити {name}");
   P ("label.comments.reaction_kind_label",
      "{kind, select, like_reaction {реакція "
      & "«подобається»} dislike_reaction {реакція «не "
      & "подобається»} heart_reaction {реакція "
      & "«серце»} laugh_reaction {реакція «сміх»} "
      & "confused_reaction {реакція «збентеження»} "
      & "hooray_reaction {реакція «ура»} rocket_reaction "
      & "{реакція «ракета»} other {реакція «очі»}}");
   P ("label.comments.reaction_label",
      "{kind, select, like_reaction {{count, plural, =0 {немає "
      & "реакцій «подобається»} other "
      & "{«подобається»: {count, number}}}} dislike_reaction "
      & "{{count, plural, =0 {немає реакцій «не "
      & "подобається»} other {«не подобається»: "
      & "{count, number}}}} heart_reaction {{count, plural, =0 {немає "
      & "реакцій «серце»} other {«серце»: {count, "
      & "number}}}} laugh_reaction {{count, plural, =0 {немає "
      & "реакцій «сміх»} other {«сміх»: {count, number}}}} "
      & "confused_reaction {{count, plural, =0 {немає реакцій "
      & "«збентеження»} other {«збентеження»: {count, "
      & "number}}}} hooray_reaction {{count, plural, =0 {немає "
      & "реакцій «ура»} other {«ура»: {count, number}}}} "
      & "rocket_reaction {{count, plural, =0 {немає реакцій "
      & "«ракета»} other {«ракета»: {count, number}}}} other "
      & "{{count, plural, =0 {немає реакцій «очі»} other "
      & "{«очі»: {count, number}}}}}");
   P ("label.comments.reply_count_label",
      "{count, plural, =0 {немає відповідей} one {{count, "
      & "number} відповідь} few {{count, number} відповіді} "
      & "many {{count, number} відповідей} other {{count, number} "
      & "відповіді}}");
   P ("label.comments.resolved_label", "{name}: розв’язано");
   P ("label.comments.subscribe_label", "підписатися на {name}");
   P ("label.comments.thread_count_label",
      "{count, plural, =0 {немає гілок} one {{count, number} "
      & "гілка} few {{count, number} гілки} many {{count, number} "
      & "гілок} other {{count, number} гілки}}");
   P ("label.comments.thread_label",
      "{state, select, open_thread {{count, plural, =0 {{name}: "
      & "відкрита гілка} other {{name}: відкрита "
      & "гілка, коментарів: {count, number}}}} resolved_thread "
      & "{{count, plural, =0 {{name}: розв’язана гілка} other "
      & "{{name}: розв’язана гілка, коментарів: "
      & "{count, number}}}} locked_thread {{count, plural, =0 {{name}: "
      & "заблокована гілка} other {{name}: "
      & "заблокована гілка, коментарів: {count, "
      & "number}}}} other {{count, plural, =0 {{name}: архівна "
      & "гілка} other {{name}: архівна гілка, "
      & "коментарів: {count, number}}}}}");
   P ("label.comments.thread_state_label",
      "{state, select, open_thread {відкрита гілка} "
      & "resolved_thread {розв’язана гілка} locked_thread "
      & "{заблокована гілка} other {архівна гілка}}");
   P ("label.comments.unpin_label", "відкріпити {name}");
   P ("label.comments.unsubscribe_label", "відписатися від {name}");
   P ("label.comparisons.baseline_label",
      "{result, select, improved {{name}: покращення} regressed "
      & "{{name}: погіршення} unchanged {{name}: без змін} "
      & "within_tolerance {{name}: у межах допуску} "
      & "outside_tolerance {{name}: поза допуском} new_value "
      & "{{name}: нове значення} removed_value {{name}: "
      & "значення видалено} other {{name}: базове "
      & "значення недоступне}}");
   P ("label.comparisons.comparison_result_label",
      "{result, select, improved {покращення} regressed "
      & "{погіршення} unchanged {без змін} within_tolerance "
      & "{у межах допуску} outside_tolerance {поза "
      & "допуском} new_value {нове значення} removed_value "
      & "{значення видалено} other {базове "
      & "значення недоступне}}");
   P ("label.comparisons.difference_label",
      "{result, select, improved {{name}: покращення на "
      & "{difference_text}} regressed {{name}: погіршення на "
      & "{difference_text}} unchanged {{name}: без змін "
      & "({difference_text})} within_tolerance {{name}: у межах "
      & "допуску ({difference_text})} outside_tolerance {{name}: "
      & "поза допуском ({difference_text})} new_value {{name}: "
      & "нове значення ({difference_text})} removed_value {{name}: "
      & "значення видалено ({difference_text})} other {{name}: "
      & "базове значення недоступне "
      & "({difference_text})}}");
   P ("label.comparisons.tolerance_label",
      "{result, select, improved {{name}: покращення на "
      & "{difference_text}, допуск {tolerance_text}} regressed {{name}: "
      & "погіршення на {difference_text}, допуск "
      & "{tolerance_text}} unchanged {{name}: без змін "
      & "({difference_text}), допуск {tolerance_text}} within_tolerance "
      & "{{name}: у межах допуску ({difference_text}), "
      & "допуск {tolerance_text}} outside_tolerance {{name}: поза "
      & "допуском ({difference_text}), допуск {tolerance_text}} "
      & "new_value {{name}: нове значення ({difference_text}), "
      & "допуск {tolerance_text}} removed_value {{name}: значення "
      & "видалено ({difference_text}), допуск {tolerance_text}} "
      & "other {{name}: базове значення недоступне "
      & "({difference_text}), допуск {tolerance_text}}}");
   P ("label.data_quality.data_issue_label",
      "{issue, select, invalid_row {недійсний рядок} "
      & "duplicate_record {дублікат запису} missing_column "
      & "{відсутній стовпець} unknown_field {невідоме "
      & "поле} schema_mismatch {невідповідність схемі} "
      & "other {пропущений запис}}");
   P ("label.data_quality.import_check_state_label",
      "{state, select, dry_run_passed {пробний запуск "
      & "успішний} dry_run_failed {пробний запуск не "
      & "вдався} import_valid {імпорт коректний} "
      & "import_invalid {імпорт некоректний} other "
      & "{частковий імпорт}}");
   P ("label.data_quality.import_result_label",
      "{state, select, dry_run_passed {{name}: пробний запуск "
      & "успішний — прийнято: {accepted, number}, "
      & "відхилено: {rejected, number}} dry_run_failed {{name}: "
      & "пробний запуск не вдався — прийнято: "
      & "{accepted, number}, відхилено: {rejected, number}} "
      & "import_valid {{name}: імпорт коректний — "
      & "прийнято: {accepted, number}, відхилено: {rejected, "
      & "number}} import_invalid {{name}: імпорт некоректний "
      & "— прийнято: {accepted, number}, відхилено: "
      & "{rejected, number}} other {{name}: частковий імпорт — "
      & "прийнято: {accepted, number}, відхилено: {rejected, "
      & "number}}}");
   P ("label.data_quality.issue_count_label",
      "{issue, select, invalid_row {{count, plural, =0 {немає "
      & "недійсних рядків} other {недійсних "
      & "рядків: {count, number}}}} duplicate_record {{count, plural, =0 "
      & "{немає дублікатів записів} other "
      & "{дублікатів записів: {count, number}}}} "
      & "missing_column {{count, plural, =0 {немає відсутніх "
      & "стовпців} other {відсутніх стовпців: {count, "
      & "number}}}} unknown_field {{count, plural, =0 {немає "
      & "невідомих полів} other {невідомих полів: "
      & "{count, number}}}} schema_mismatch {{count, plural, =0 {немає "
      & "невідповідностей схемі} other "
      & "{невідповідностей схемі: {count, number}}}} other "
      & "{{count, plural, =0 {немає пропущених записів} "
      & "other {пропущених записів: {count, number}}}}}");
   P ("label.data_quality.row_issue_label",
      "{issue, select, invalid_row {рядок {row, number}: "
      & "недійсний} duplicate_record {рядок {row, number}: "
      & "дублікат запису} missing_column {рядок {row, "
      & "number}: відсутній стовпець} unknown_field "
      & "{рядок {row, number}: невідоме поле} schema_mismatch "
      & "{рядок {row, number}: невідповідність схемі} "
      & "other {рядок {row, number}: запис пропущено}}");
   P ("label.data_quality.source_file_issue_label",
      "{issue, select, invalid_row {{file_name}: недійсний "
      & "рядок} duplicate_record {{file_name}: дублікат "
      & "запису} missing_column {{file_name}: відсутній "
      & "стовпець} unknown_field {{file_name}: невідоме "
      & "поле} schema_mismatch {{file_name}: невідповідність "
      & "схемі} other {{file_name}: пропущений запис}}");
   P ("label.deployments.artifact_state_label",
      "{state, select, artifact_ready {артефакт готовий} "
      & "artifact_uploaded {артефакт надіслано} "
      & "artifact_signed {артефакт підписано} artifact_missing "
      & "{артефакт відсутній} other {термін дії "
      & "артефакту минув}}");
   P ("label.deployments.deployment_label",
      "{name} → {environment}: {state, select, queued_deployment {у "
      & "черзі на розгортання} deploying "
      & "{розгортання} deployed {розгорнуто} "
      & "failed_deployment {помилка розгортання} rolled_back "
      & "{відкочено} blocked_deployment {розгортання "
      & "заблоковано} other {розгортання "
      & "скасовано}}");
   P ("label.deployments.deployment_state_label",
      "{state, select, queued_deployment {у черзі на "
      & "розгортання} deploying {розгортання} deployed "
      & "{розгорнуто} failed_deployment {помилка "
      & "розгортання} rolled_back {відкочено} "
      & "blocked_deployment {розгортання заблоковано} "
      & "other {розгортання скасовано}}");
   P ("label.deployments.environment_state_label",
      "{state, select, healthy_environment {середовище "
      & "справне} drifting_environment {дрейф середовища} "
      & "locked_environment {середовище заблоковано} "
      & "maintenance_environment {середовище на "
      & "обслуговуванні} other {стан середовища "
      & "невідомий}}");
   P ("label.deployments.migration_state_label",
      "{state, select, no_migration {без міграції} "
      & "migration_pending {міграція очікує} migrating "
      & "{виконується міграція} migration_complete "
      & "{міграцію завершено} other {помилка "
      & "міграції}}");
   P ("label.deployments.promotion_label",
      "{name}: просування з {from_environment} до "
      & "{to_environment}");
   P ("label.deployments.rollback_label", "{name}: відкат до {target}");
   P ("label.deployments.rollout_label", "{name}: викочування {percent_text}");
   P ("label.diagnostics.affected_items_label",
      "{count, plural, =0 {немає зачеплених "
      & "елементів} other {{count, plural, one {{count, number} "
      & "зачеплений елемент} few {{count, number} "
      & "зачеплені елементи} many {{count, number} "
      & "зачеплених елементів} other {{count, number} "
      & "зачепленого елемента}}}}");
   P ("label.diagnostics.check_duration_label",
      "{name}: {status, select, passed_check {пройдено} failed_check "
      & "{помилка} warning_check {попередження} "
      & "skipped_check {пропущено} pending_check {очікує} other "
      & "{виконується}} ({duration_s, plural, one {{duration_s, "
      & "number} секунда} few {{duration_s, number} секунди} many "
      & "{{duration_s, number} секунд} other {{duration_s, number} "
      & "секунди}})");
   P ("label.diagnostics.check_result_label",
      "{name}: {status, select, passed_check {пройдено} failed_check "
      & "{помилка} warning_check {попередження} "
      & "skipped_check {пропущено} pending_check {очікує} other "
      & "{виконується}}");
   P ("label.diagnostics.check_status_label",
      "{status, select, passed_check {пройдено} failed_check "
      & "{помилка} warning_check {попередження} "
      & "skipped_check {пропущено} pending_check {очікує} other "
      & "{виконується}}");
   P ("label.diagnostics.diagnostic_explanation_label",
      "{kind, select, expected_value {очікувалося значення "
      & "для {subject}} expected_unit {очікувалася одиниця "
      & "виміру для {subject}} invalid_range "
      & "{неприпустимий діапазон для {subject}} "
      & "end_before_start {кінець діапазону раніше за "
      & "початок для {subject}} unknown_field {невідоме "
      & "поле {subject}} unsafe_redacted_value {небезпечне "
      & "значення {subject} приховано} unsupported_syntax "
      & "{непідтримуваний синтаксис для {subject}} "
      & "other {пояснення до діагностики для "
      & "{subject}}}{position, plural, =0 {; використайте "
      & "{suggestion}} other { (позиція {position, number}); "
      & "використайте {suggestion}}}");
   P ("label.diagnostics.diagnostic_label",
      "{severity, select, info_severity {інформація} "
      & "notice_severity {зауваження} warning_severity "
      & "{попередження} error_severity {помилка} "
      & "critical_severity {критична помилка} other "
      & "{блокувальна помилка}} ({line, plural, =0 {{path}} "
      & "other {{path}, рядок {line, number}}}): {message}");
   P ("label.diagnostics.failed_at_label",
      "збій: {line, plural, =0 {{path}} other {{column, plural, =0 "
      & "{{path}, рядок {line, number}} other {{path}, рядок {line, "
      & "number}, стовпець {column, number}}}}}");
   P ("label.diagnostics.field_problem_label",
      "{severity, select, info_severity {інформація} "
      & "notice_severity {зауваження} warning_severity "
      & "{попередження} error_severity {помилка} "
      & "critical_severity {критична помилка} other "
      & "{блокувальна помилка}} у полі {field_name}: "
      & "{message}");
   P ("label.diagnostics.first_failure_label",
      "перший збій у {check_name}: {line, plural, =0 {{path}} "
      & "other {{path}, рядок {line, number}}}");
   P ("label.diagnostics.issue_count_label",
      "{errors, plural, =0 {{warnings, plural, =0 {{notices, plural, =0 "
      & "{немає проблем} other {{notices, plural, one {{notices, "
      & "number} зауваження} few {{notices, number} "
      & "зауваження} many {{notices, number} зауважень} "
      & "other {{notices, number} зауваження}}}}} other {{notices, "
      & "plural, =0 {{warnings, plural, one {{warnings, number} "
      & "попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}} other {{warnings, plural, one {{warnings, "
      & "number} попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}, {notices, plural, one {{notices, number} "
      & "зауваження} few {{notices, number} зауваження} "
      & "many {{notices, number} зауважень} other {{notices, number} "
      & "зауваження}}}}}}} other {{warnings, plural, =0 {{notices, "
      & "plural, =0 {{errors, plural, one {{errors, number} помилка} few "
      & "{{errors, number} помилки} many {{errors, number} "
      & "помилок} other {{errors, number} помилки}}} other "
      & "{{errors, plural, one {{errors, number} помилка} few {{errors, "
      & "number} помилки} many {{errors, number} помилок} other "
      & "{{errors, number} помилки}}, {notices, plural, one {{notices, "
      & "number} зауваження} few {{notices, number} "
      & "зауваження} many {{notices, number} зауважень} "
      & "other {{notices, number} зауваження}}}}} other {{notices, "
      & "plural, =0 {{errors, plural, one {{errors, number} помилка} few "
      & "{{errors, number} помилки} many {{errors, number} "
      & "помилок} other {{errors, number} помилки}}, {warnings, "
      & "plural, one {{warnings, number} попередження} few "
      & "{{warnings, number} попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}} other {{errors, plural, one {{errors, "
      & "number} помилка} few {{errors, number} помилки} many "
      & "{{errors, number} помилок} other {{errors, number} "
      & "помилки}}, {warnings, plural, one {{warnings, number} "
      & "попередження} few {{warnings, number} "
      & "попередження} many {{warnings, number} "
      & "попереджень} other {{warnings, number} "
      & "попередження}}, {notices, plural, one {{notices, number} "
      & "зауваження} few {{notices, number} зауваження} "
      & "many {{notices, number} зауважень} other {{notices, number} "
      & "зауваження}}}}}}}}");
   P ("label.diagnostics.location_label",
      "{line, plural, =0 {{path}} other {{column, plural, =0 {{path}, "
      & "рядок {line, number}} other {{path}, рядок {line, number}, "
      & "стовпець {column, number}}}}}");
   P ("label.diagnostics.parser_diagnostic_explanation_label",
      "непідтримуваний синтаксис для {family, "
      & "select, byte_parser {парсера розмірів} duration_parser "
      & "{парсера тривалості} date_time_parser {парсера "
      & "дати й часу} color_parser {парсера кольору} "
      & "url_parser {парсера URL} unit_parser {парсера "
      & "одиниць} recurrence_parser {парсера повторень} "
      & "domain_label_parser {парсера доменних міток} other "
      & "{парсера}} {error}{position, plural, =0 {;} other { "
      & "(позиція {position, number});}} {family, select, byte_parser "
      & "{використайте B, kB, MB, GB, KiB, MiB, GiB або TiB} "
      & "duration_parser {використайте ms, s, min, h, d, w, month "
      & "або year} date_time_parser {використайте дату ISO, "
      & "день словами або час} color_parser "
      & "{використайте hex, rgb(), hsl(), lab(), lch() або "
      & "назву кольору} url_parser {використайте "
      & "схему, хост, шлях, запит або фрагмент} "
      & "unit_parser {використайте підтримувану "
      & "одиницю Humanize} recurrence_parser {використайте "
      & "cron або форму повторення every/weekday} "
      & "domain_label_parser {використайте "
      & "детерміновану доменну мітку Humanize} other "
      & "{використайте підтримувану форму "
      & "введення}}");
   P ("label.diagnostics.result_with_notices_label",
      "{status, select, passed_check {пройдено} failed_check "
      & "{помилка} warning_check {попередження} "
      & "skipped_check {пропущено} pending_check {очікує} other "
      & "{виконується}}, {notices, plural, =0 {без "
      & "зауважень} other {{notices, plural, one {{notices, number} "
      & "зауваження} few {{notices, number} зауваження} "
      & "many {{notices, number} зауважень} other {{notices, number} "
      & "зауваження}}}}");
   P ("label.diagnostics.retry_label",
      "{limit, plural, =1 {{attempt, plural, =1 {спроба 1 з 1} other "
      & "{спроба {attempt, number} з 1: ліміт "
      & "перевищено}}} other {спроба {attempt, number} з "
      & "{limit, number}}}");
   P ("label.diagnostics.severity_label",
      "{severity, select, info_severity {інформація} "
      & "notice_severity {зауваження} warning_severity "
      & "{попередження} error_severity {помилка} "
      & "critical_severity {критична помилка} other "
      & "{блокувальна помилка}}");
   P ("label.diagnostics.source_label",
      "{source, select, build_source {діагностика "
      & "збирання} test_source {діагностика тестів} "
      & "lint_source {діагностика лінтера} import_source "
      & "{діагностика імпорту} validation_source "
      & "{діагностика валідації} runtime_source "
      & "{діагностика виконання} security_source "
      & "{діагностика безпеки} other "
      & "{діагностика}}");
   P ("label.diagnostics.source_summary_label",
      "{source, select, build_source {діагностика "
      & "збирання} test_source {діагностика тестів} "
      & "lint_source {діагностика лінтера} import_source "
      & "{діагностика імпорту} validation_source "
      & "{діагностика валідації} runtime_source "
      & "{діагностика виконання} security_source "
      & "{діагностика безпеки} other "
      & "{діагностика}}: {count, number}");
   P ("label.diagnostics.suggested_action_label", "наступний крок: {action}");
   P ("label.endpoints.host_kind_label",
      "{kind, select, domain_host {доменне ім’я} ipv4_host "
      & "{адреса IPv4} ipv6_host {адреса IPv6} localhost_host "
      & "{локальний хост} private_network_host {адреса "
      & "приватної мережі} other {невідомий хост}}");
   P ("label.events.all_day_label", "{name}: увесь день");
   P ("label.events.attendance_state_label",
      "{state, select, not_responded {немає відповіді} accepted "
      & "{прийнято} declined {відхилено} maybe "
      & "{можливо} other {у списку очікування}}");
   P ("label.events.attendee_count_label",
      "{count, plural, =0 {немає учасників} other {{count, "
      & "plural, one {{count, number} учасник} few {{count, number} "
      & "учасники} many {{count, number} учасників} other "
      & "{{count, number} учасника}}}}");
   P ("label.events.canceled_label", "{name}: скасовано");
   P ("label.events.check_in_label", "відмітитися: {name}");
   P ("label.events.conference_link_label", "{name}: посилання на конференцію");
end Labels_1;
