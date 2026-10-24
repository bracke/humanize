separate (Humanize.Catalogs.Phrase_Data.Locale_Ru)
procedure Labels_5 is
begin
   P ("label.markup.tag_label",
      "{tag, select, link {тег ссылки} image {тег "
      & "изображения} paragraph {тег абзаца} ordered_list "
      & "{тег нумерованного списка} unordered_list "
      & "{тег маркированного списка} list_item {тег "
      & "элемента списка} table_header_cell {тег ячейки "
      & "заголовка таблицы} table_cell {тег ячейки "
      & "таблицы} table_row {тег строки таблицы} "
      & "line_break {тег разрыва строки} thematic_break {тег "
      & "тематического разрыва} heading_level_n {тег "
      & "заголовка уровня {level, number}} other {тег "
      & "{name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {атрибут {name}} event "
      & "{атрибут-обработчик событий {name}} other "
      & "{атрибут {name} со значением «{value}»}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {текстовое содержимое} "
      & "html_content {документ HTML} json_content {документ "
      & "JSON} xml_content {документ XML} image_content "
      & "{изображение} audio_content {аудио} video_content "
      & "{видео} font_content {шрифт} archive_content {архив} "
      & "binary_content {двоичные данные} form_content "
      & "{отправка формы} other {неизвестное "
      & "содержимое}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: не задано} hidden_value "
      & "{{kind}: скрыто} masked_value {{kind} {shown}} fingerprint_only "
      & "{{kind}: отпечаток, окончание {shown}} other "
      & "{{kind}: окончание {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} ({kind}): не задано} other "
      & "{{name} ({kind}): окончание {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {{name}: заголовок с учётными "
      & "данными не задан} other {{name} ({kind}): "
      & "окончание {shown}}}");
   P ("label.secrets.fingerprint_label", "отпечаток {algorithm}: окончание {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: не задано} redacted "
      & "{{label}: скрыто} url_redacted {URL скрыт} ip_redacted "
      & "{IP-адрес скрыт} path_ending {путь к файлу, "
      & "окончание {shown}} at {{label} в {shown}} audit {{label}: "
      & "длина {length, number}, окончание {shown}} debug "
      & "{{label} {shown}} other {{label}: окончание {shown}}}");
   P ("label.schema.field_label",
      "поле {name} ({kind, select, string_field {строка} "
      & "integer_field {целое число} decimal_field "
      & "{десятичное число} boolean_field {логическое "
      & "значение} date_field {дата} date_time_field {дата и "
      & "время} object_field {объект} array_field {массив} "
      & "enum_field {перечисление} binary_field {двоичные "
      & "данные} null_field {null} any_field {любой тип} other "
      & "{неизвестный тип}}): {state, select, deprecated_field "
      & "{устаревшее, } unknown_field {неизвестное, } "
      & "read_only_field {только для чтения, } write_only_field "
      & "{только для записи, } computed_field "
      & "{вычисляемое, } other {}}{presence, select, required_field "
      & "{обязательное} optional_field "
      & "{необязательное} conditional_field {условное} "
      & "other {обязательность неизвестна}}{nullable, "
      & "select, non_nullable {, не допускает null} nullable {, "
      & "допускает null} other {}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {{count, number} поле} few {{count, number} "
      & "поля} many {{count, number} полей} other {{count, number} "
      & "поля}}");
   P ("label.schema.schema_summary_label.required", "обязательных: {count, number}");
   P ("label.schema.schema_summary_label.optional", "необязательных: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "устаревших: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "неизвестных: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "проверки не запускались");
   P ("label.diagnostics.check_run_summary_label.passed", "пройдено: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "не пройдено: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {{count, number} предупреждение} few "
      & "{{count, number} предупреждения} many {{count, number} "
      & "предупреждений} other {{count, number} "
      & "предупреждения}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "пропущено: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "ожидает: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {{count, number} элемент} few {{count, "
      & "number} элемента} many {{count, number} элементов} "
      & "other {{count, number} элемента}}");
   P ("label.workflows.workflow_summary_label.completed", "завершено: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "активно: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "заблокировано: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "с ошибкой: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "пропущено: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {{count, number} элемент} few {{count, "
      & "number} элемента} many {{count, number} элементов} "
      & "other {{count, number} элемента}}");
   P ("label.changes.change_summary_label.added", "добавлено: {count, number}");
   P ("label.changes.change_summary_label.removed", "удалено: {count, number}");
   P ("label.changes.change_summary_label.modified", "изменено: {count, number}");
   P ("label.changes.change_summary_label.renamed", "переименовано: {count, number}");
   P ("label.changes.change_summary_label.unchanged", "без изменений: {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {{role, select, button_control "
      & "{безымянная кнопка} link_control {безымянная "
      & "ссылка} tab_control {безымянная вкладка} "
      & "menu_item_control {безымянный пункт меню} "
      & "checkbox_control {безымянный флажок} radio_control "
      & "{безымянный переключатель} text_field_control "
      & "{безымянное текстовое поле} progress_control "
      & "{безымянный индикатор выполнения} "
      & "table_cell_control {безымянная ячейка таблицы} "
      & "region_control {безымянная область} other "
      & "{безымянный элемент управления}}} other "
      & "{{role, select, button_control {кнопка} link_control "
      & "{ссылка} tab_control {вкладка} menu_item_control "
      & "{пункт меню} checkbox_control {флажок} radio_control "
      & "{переключатель} text_field_control {текстовое "
      & "поле} progress_control {индикатор выполнения} "
      & "table_cell_control {ячейка таблицы} region_control "
      & "{область} other {элемент управления}} {name}}}");
   P ("label.markup.accessible_control_label.selected", "выбрано");
   P ("label.markup.accessible_control_label.expanded", "развёрнуто");
   P ("label.markup.accessible_control_label.current", "текущий");
   P ("label.markup.accessible_control_label.disabled", "недоступно");
   P ("label.markup.accessible_control_label.required", "обязательно");
   P ("label.markup.accessible_control_label.invalid", "недопустимое значение");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {{count, number} элемент} few {{count, "
      & "number} элемента} many {{count, number} элементов} "
      & "other {{count, number} элемента}}");
   P ("label.markup.accessible_control_label.position", "элемент {position} из {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {{count, number} проблема} few {{count, "
      & "number} проблемы} many {{count, number} проблем} other "
      & "{{count, number} проблемы}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "схема");
   P ("label.endpoints.url_component.host", "хост");
   P ("label.endpoints.url_component.path", "путь");
   P ("label.endpoints.url_component.query", "запрос");
   P ("label.endpoints.url_component.fragment", "фрагмент");
   P ("label.names.hue_noun.red", "красный");
   P ("label.names.hue_noun.orange", "оранжевый");
   P ("label.names.hue_noun.yellow", "жёлтый");
   P ("label.names.hue_noun.green", "зелёный");
   P ("label.names.hue_noun.cyan", "голубой");
   P ("label.names.hue_noun.blue", "синий");
   P ("label.names.hue_noun.purple", "фиолетовый");
   P ("label.names.hue_noun.magenta", "пурпурный");
   P ("label.names.hue_noun.neutral", "нейтральный");
   P ("label.names.hue_noun.pink", "розовый");
   P ("label.names.hue_gender.red", "masculine");
   P ("label.names.hue_gender.orange", "masculine");
   P ("label.names.hue_gender.yellow", "masculine");
   P ("label.names.hue_gender.green", "masculine");
   P ("label.names.hue_gender.cyan", "masculine");
   P ("label.names.hue_gender.blue", "masculine");
   P ("label.names.hue_gender.purple", "masculine");
   P ("label.names.hue_gender.magenta", "masculine");
   P ("label.names.hue_gender.neutral", "masculine");
   P ("label.names.hue_gender.pink", "masculine");
   P ("label.names.agree.very_dark",
      "{gender, select, feminine {очень тёмная} neuter {очень "
      & "тёмное} other {очень тёмный}}");
   P ("label.names.agree.dark",
      "{gender, select, feminine {тёмная} neuter {тёмное} other "
      & "{тёмный}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, feminine {средняя по яркости} neuter "
      & "{среднее по яркости} other {средний по "
      & "яркости}}");
   P ("label.names.agree.light",
      "{gender, select, feminine {светлая} neuter {светлое} "
      & "other {светлый}}");
   P ("label.names.agree.very_light",
      "{gender, select, feminine {очень светлая} neuter "
      & "{очень светлое} other {очень светлый}}");
   P ("label.names.agree.desaturated",
      "{gender, select, feminine {ненасыщенная} neuter "
      & "{ненасыщенное} other {ненасыщенный}}");
   P ("label.names.agree.muted",
      "{gender, select, feminine {приглушённая} neuter "
      & "{приглушённое} other {приглушённый}}");
   P ("label.names.agree.neutral",
      "{gender, select, feminine {нейтральная} neuter "
      & "{нейтральное} other {нейтральный}}");
   P ("label.names.agree.saturated",
      "{gender, select, feminine {насыщенная} neuter "
      & "{насыщенное} other {насыщенный}}");
   P ("label.names.agree.vivid",
      "{gender, select, feminine {яркая} neuter {яркое} other "
      & "{яркий}}");
   P ("label.names.agree.grayish",
      "{gender, select, feminine {сероватая} neuter "
      & "{сероватое} other {сероватый}}");
   P ("label.names.agree.soft",
      "{gender, select, feminine {мягкая} neuter {мягкое} other "
      & "{мягкий}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, feminine {умеренно хроматичная} "
      & "neuter {умеренно хроматичное} other "
      & "{умеренно хроматичный}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, feminine {высокохроматичная} neuter "
      & "{высокохроматичное} other "
      & "{высокохроматичный}}");
   P ("label.names.agree.pastel",
      "{gender, select, feminine {пастельная} neuter "
      & "{пастельное} other {пастельный}}");
   P ("label.names.agree.warm",
      "{gender, select, feminine {тёплая} neuter {тёплое} other "
      & "{тёплый}}");
   P ("label.names.agree.cool",
      "{gender, select, feminine {холодная} neuter {холодное} "
      & "other {холодный}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, feminine {нейтральная по "
      & "температуре} neuter {нейтральное по "
      & "температуре} other {нейтральный по "
      & "температуре}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, feminine {сбалансированная по "
      & "температуре} neuter {сбалансированное по "
      & "температуре} other {сбалансированный по "
      & "температуре}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_5;
