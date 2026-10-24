separate (Humanize.Catalogs.Phrase_Data.Locale_Uk)
procedure Labels_5 is
begin
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} ({kind}): не задано} other "
      & "{{name} ({kind}): закінчення {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {{name}: заголовок з "
      & "обліковими даними не задано} other {{name} "
      & "({kind}): закінчення {shown}}}");
   P ("label.secrets.fingerprint_label", "відбиток {algorithm}: закінчення {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: не задано} redacted "
      & "{{label}: приховано} url_redacted {URL-адресу "
      & "приховано} ip_redacted {IP-адресу приховано} "
      & "path_ending {шлях до файлу, закінчення {shown}} "
      & "at {{label} у {shown}} audit {{label}: довжина {length, "
      & "number}, закінчення {shown}} debug {{label} {shown}} other "
      & "{{label}: закінчення {shown}}}");
   P ("label.schema.field_label",
      "поле {name} ({kind, select, string_field {рядок} "
      & "integer_field {ціле число} decimal_field {десяткове "
      & "число} boolean_field {логічне значення} date_field "
      & "{дата} date_time_field {дата й час} object_field "
      & "{об’єкт} array_field {масив} enum_field {перелік} "
      & "binary_field {двійкові дані} null_field {null} any_field "
      & "{будь-який тип} other {невідомий тип}}): "
      & "{state, select, deprecated_field {застаріле, } unknown_field "
      & "{невідоме, } read_only_field {лише для читання, "
      & "} write_only_field {лише для запису, } computed_field "
      & "{обчислюване, } other {}}{presence, select, required_field "
      & "{обов’язкове} optional_field {необов’язкове} "
      & "conditional_field {умовне} other {обов’язковість "
      & "невідома}}{nullable, select, non_nullable {, не "
      & "допускає null} nullable {, допускає null} other {}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {{count, number} поле} few {{count, number} "
      & "поля} many {{count, number} полів} other {{count, number} "
      & "поля}}");
   P ("label.schema.schema_summary_label.required", "обов’язкових: {count, number}");
   P ("label.schema.schema_summary_label.optional", "необов’язкових: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "застарілих: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "невідомих: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "перевірки не запускалися");
   P ("label.diagnostics.check_run_summary_label.passed", "пройдено: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "не пройдено: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {{count, number} попередження} few "
      & "{{count, number} попередження} many {{count, number} "
      & "попереджень} other {{count, number} "
      & "попередження}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "пропущено: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "в очікуванні: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {{count, number} елемент} few {{count, "
      & "number} елементи} many {{count, number} елементів} "
      & "other {{count, number} елемента}}");
   P ("label.workflows.workflow_summary_label.completed", "завершено: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "активно: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "заблоковано: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "з помилкою: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "пропущено: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {{count, number} елемент} few {{count, "
      & "number} елементи} many {{count, number} елементів} "
      & "other {{count, number} елемента}}");
   P ("label.changes.change_summary_label.added", "додано: {count, number}");
   P ("label.changes.change_summary_label.removed", "видалено: {count, number}");
   P ("label.changes.change_summary_label.modified", "змінено: {count, number}");
   P ("label.changes.change_summary_label.renamed", "перейменовано: {count, number}");
   P ("label.changes.change_summary_label.unchanged", "без змін: {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {{role, select, button_control {безіменна "
      & "кнопка} link_control {безіменне посилання} "
      & "tab_control {безіменна вкладка} menu_item_control "
      & "{безіменний пункт меню} checkbox_control "
      & "{безіменний прапорець} radio_control "
      & "{безіменний перемикач} text_field_control "
      & "{безіменне текстове поле} progress_control "
      & "{безіменний індикатор виконання} "
      & "table_cell_control {безіменна клітинка "
      & "таблиці} region_control {безіменна область} "
      & "other {безіменний елемент керування}}} other "
      & "{{role, select, button_control {кнопка} link_control "
      & "{посилання} tab_control {вкладка} menu_item_control "
      & "{пункт меню} checkbox_control {прапорець} "
      & "radio_control {перемикач} text_field_control "
      & "{текстове поле} progress_control {індикатор "
      & "виконання} table_cell_control {клітинка "
      & "таблиці} region_control {область} other {елемент "
      & "керування}} {name}}}");
   P ("label.markup.accessible_control_label.selected", "вибрано");
   P ("label.markup.accessible_control_label.expanded", "розгорнуто");
   P ("label.markup.accessible_control_label.current", "поточний");
   P ("label.markup.accessible_control_label.disabled", "недоступно");
   P ("label.markup.accessible_control_label.required", "обов’язково");
   P ("label.markup.accessible_control_label.invalid", "недійсне значення");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {{count, number} елемент} few {{count, "
      & "number} елементи} many {{count, number} елементів} "
      & "other {{count, number} елемента}}");
   P ("label.markup.accessible_control_label.position", "елемент {position} з {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {{count, number} проблема} few {{count, "
      & "number} проблеми} many {{count, number} проблем} other "
      & "{{count, number} проблеми}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "схема");
   P ("label.endpoints.url_component.host", "хост");
   P ("label.endpoints.url_component.path", "шлях");
   P ("label.endpoints.url_component.query", "запит");
   P ("label.endpoints.url_component.fragment", "фрагмент");
   P ("label.names.hue_noun.red", "червоний");
   P ("label.names.hue_noun.orange", "помаранчевий");
   P ("label.names.hue_noun.yellow", "жовтий");
   P ("label.names.hue_noun.green", "зелений");
   P ("label.names.hue_noun.cyan", "блакитний");
   P ("label.names.hue_noun.blue", "синій");
   P ("label.names.hue_noun.purple", "фіолетовий");
   P ("label.names.hue_noun.magenta", "пурпуровий");
   P ("label.names.hue_noun.neutral", "нейтральний");
   P ("label.names.hue_noun.pink", "рожевий");
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
      "{gender, select, feminine {дуже темна} neuter {дуже "
      & "темне} other {дуже темний}}");
   P ("label.names.agree.dark",
      "{gender, select, feminine {темна} neuter {темне} other "
      & "{темний}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, feminine {середня за яскравістю} "
      & "neuter {середнє за яскравістю} other "
      & "{середній за яскравістю}}");
   P ("label.names.agree.light",
      "{gender, select, feminine {світла} neuter {світле} other "
      & "{світлий}}");
   P ("label.names.agree.very_light",
      "{gender, select, feminine {дуже світла} neuter {дуже "
      & "світле} other {дуже світлий}}");
   P ("label.names.agree.desaturated",
      "{gender, select, feminine {ненасичена} neuter "
      & "{ненасичене} other {ненасичений}}");
   P ("label.names.agree.muted",
      "{gender, select, feminine {приглушена} neuter "
      & "{приглушене} other {приглушений}}");
   P ("label.names.agree.neutral",
      "{gender, select, feminine {нейтральна} neuter "
      & "{нейтральне} other {нейтральний}}");
   P ("label.names.agree.saturated",
      "{gender, select, feminine {насичена} neuter {насичене} "
      & "other {насичений}}");
   P ("label.names.agree.vivid",
      "{gender, select, feminine {яскрава} neuter {яскраве} "
      & "other {яскравий}}");
   P ("label.names.agree.grayish",
      "{gender, select, feminine {сірувата} neuter {сірувате} "
      & "other {сіруватий}}");
   P ("label.names.agree.soft",
      "{gender, select, feminine {м’яка} neuter {м’яке} other "
      & "{м’який}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, feminine {помірно хроматична} neuter "
      & "{помірно хроматичне} other {помірно "
      & "хроматичний}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, feminine {високохроматична} neuter "
      & "{високохроматичне} other "
      & "{високохроматичний}}");
   P ("label.names.agree.pastel",
      "{gender, select, feminine {пастельна} neuter "
      & "{пастельне} other {пастельний}}");
   P ("label.names.agree.warm",
      "{gender, select, feminine {тепла} neuter {тепле} other "
      & "{теплий}}");
   P ("label.names.agree.cool",
      "{gender, select, feminine {холодна} neuter {холодне} "
      & "other {холодний}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, feminine {нейтральна за "
      & "температурою} neuter {нейтральне за "
      & "температурою} other {нейтральний за "
      & "температурою}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, feminine {збалансована за "
      & "температурою} neuter {збалансоване за "
      & "температурою} other {збалансований за "
      & "температурою}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.endpoints.url_label", "{state, select, empty {порожня URL-адреса} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {порожня URL-адреса} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[прихований користувач]");
   P ("label.endpoints.url_label.query",
      "запит {count, plural, one {{count, number} параметр} few "
      & "{{count, number} параметри} many {{count, number} "
      & "параметрів} other {{count, number} параметра}}");
end Labels_5;
