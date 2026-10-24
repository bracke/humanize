separate (Humanize.Catalogs.Phrase_Data.Locale_Pl)
procedure Labels_4 is
begin
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min czytania");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min mówienia");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min czytania");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "mniej niż {v1, number} min czytania");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "mniej niż {v1, number} min mówienia");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "mniej niż {v1, number} min czytania");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.word_count_summary.no_words", "brak słów");
   P ("label.metrics.sentence_count_summary.no_sentences", "brak zdań");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "brak akapitów");
   P ("label.metrics.text_summary_with_options.no_words", "brak słów");
   P ("label.metrics.text_summary_with_options.no_sentences", "brak zdań");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "brak akapitów");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {brak obserwacji} "
      & "sample_too_small_shape {próbka zbyt mała, by opisać kształt: "
      & "{count, plural, one {{count, number} obserwacja} few {{count, number} "
      & "obserwacje} many {{count, number} obserwacji} other {{count, number} "
      & "obserwacji}}} flat_shape {płaski rozkład na poziomie {median}} "
      & "outlier_heavy_shape {rozkład z wieloma wartościami odstającymi "
      & "wokół {median}} volatile_shape {zmienny rozkład wokół {median}} "
      & "clustered_shape {skupiony rozkład wokół {median}} wide_spread_shape "
      & "{szeroko rozproszony rozkład} wide_spread_range {szeroko rozproszony "
      & "rozkład od {minimum} do {maximum}} right_skewed_shape {rozkład "
      & "prawoskośny, mediana {median}} left_skewed_shape {rozkład "
      & "lewoskośny, mediana {median}} other {rozkład w większości "
      & "zrównoważony wokół {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {pusty e-mail} address {adres e-mail} other "
      & "{e-mail w domenie {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {numer telefonu} redacted {numer telefonu ukryty} "
      & "other {telefon z końcówką {digits}}}");
   P ("label.privacy.safe_handle_label",
      "{state, select, none {nazwa użytkownika} other {nazwa użytkownika "
      & "{shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {symbol kodu} other {symbol kodu {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "metadane adresu: {present, plural, one {1 pole obecne} few {{present, "
      & "number} pola obecne} many {{present, number} pól obecnych} other "
      & "{{present, number} pola obecnego}}, {missing, plural, one {1 pole "
      & "brakujące} few {{missing, number} pola brakujące} many {{missing, "
      & "number} pól brakujących} other {{missing, number} pola "
      & "brakującego}}");
   P ("label.endpoints.host_label", "{state, select, none {nieznany host} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {nieznany punkt końcowy} other {punkt końcowy "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {pusty URL} none {URL bez rozpoznanych "
      & "składników} other {URL z {count, plural, one {1 składnikiem} few "
      & "{{count, number} składnikami} many {{count, number} składnikami} "
      & "other {{count, number} składnika}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {brak parametrów zapytania} one {1 parametr "
      & "zapytania} few {{count, number} parametry zapytania} many {{count, "
      & "number} parametrów zapytania} other {{count, number} parametru "
      & "zapytania}}");
   P ("label.endpoints.ip_address_label",
      "{address}: {kind, select, ipv4_host {publiczny adres IPv4} ipv6_host "
      & "{publiczny adres IPv6} private_network_host {adres sieci prywatnej} "
      & "localhost_host {host lokalny} other {to nie jest adres IP}}");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr}: nieprawidłowy CIDR} other {{cidr}: "
      & "{kind}, prefiks sieci {prefix}}}");
   P ("label.resources.utilization_label",
      "wykorzystano {used, number} z {total, number} {unit} ({percent}, "
      & "{band})");
   P ("label.resources.saturation_label", "{named, select, no {zasób} other {{name}}}: {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {wersja {version}, wydanie wstępne {prerelease}, "
      & "kompilacja {build}} prerelease {wersja {version}, wydanie wstępne "
      & "{prerelease}} build {wersja {version}, kompilacja {build}} other "
      & "{wersja {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {ta sama wersja} major_upgrade "
      & "{aktualizacja wersji głównej} minor_upgrade {aktualizacja wersji "
      & "pomocniczej} patch_upgrade {aktualizacja poprawkowa} prerelease_change "
      & "{zmiana wydania wstępnego} build_metadata_change {zmiana metadanych "
      & "kompilacji} downgrade {obniżenie wersji} other {nieznana zmiana "
      & "wersji}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {dokładnie wersja {version}} minimum_range "
      & "{wersja {version} lub nowsza} maximum_range {wersja {version} lub "
      & "starsza} major_compatible_range {zgodne z wersją główną {version}} "
      & "minor_compatible_range {zgodne z wersją pomocniczą {version}} other "
      & "{zakres wersji {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {wstępne wydanie rozwojowe {version}} "
      & "prerelease {wydanie wstępne {version}} major {wydanie główne "
      & "{version}} minor {wydanie pomocnicze {version}} other {wydanie "
      & "poprawkowe {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {znacznik linku} image {znacznik obrazu} paragraph "
      & "{znacznik akapitu} ordered_list {znacznik listy numerowanej} "
      & "unordered_list {znacznik listy punktowanej} list_item {znacznik "
      & "elementu listy} table_header_cell {znacznik komórki nagłówka "
      & "tabeli} table_cell {znacznik komórki tabeli} table_row {znacznik "
      & "wiersza tabeli} line_break {znacznik podziału wiersza} thematic_break "
      & "{znacznik podziału tematycznego} heading_level_n {znacznik nagłówka "
      & "poziomu {level, number}} other {znacznik {name}}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {atrybut {name}} event {atrybut obsługi "
      & "zdarzenia {name}} other {atrybut {name} ustawiony na „{value}”}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {treść tekstowa} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {obraz} audio_content {dźwięk} video_content {wideo} "
      & "font_content {czcionka} archive_content {archiwum} binary_content "
      & "{dane binarne} form_content {przesłanie formularza} other {nieznana "
      & "treść}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: nieustawiono} hidden_value {{kind}: "
      & "ukryto} masked_value {{kind} {shown}} fingerprint_only {{kind}: odcisk "
      & "z końcówką {shown}} other {{kind} z końcówką {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind}: nieustawiono} other {{name} "
      & "{kind} z końcówką {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {nagłówek poświadczeń {name}: nieustawiono} "
      & "other {{name} {kind} z końcówką {shown}}}");
   P ("label.secrets.fingerprint_label", "odcisk {algorithm} z końcówką {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label}: nie ustawiono} redacted {{label}: "
      & "ukryto} url_redacted {URL ukryty} ip_redacted {adres IP ukryty} "
      & "path_ending {ścieżka pliku z końcówką {shown}} at {{label} w "
      & "{shown}} audit {{label}, długość {length, number}, końcówka "
      & "{shown}} debug {{label} {shown}} other {{label} z końcówką "
      & "{shown}}}");
   P ("label.schema.field_label",
      "pole {name}: {state, select, deprecated_field {przestarzałe, } "
      & "unknown_field {nieznane, } read_only_field {tylko do odczytu, } "
      & "write_only_field {tylko do zapisu, } computed_field {obliczane, } "
      & "other {}}{presence, select, required_field {wymagane} optional_field "
      & "{opcjonalne} conditional_field {warunkowe} other {obecność "
      & "nieznana}}{nullable, select, non_nullable {, bez null} nullable {, "
      & "dopuszcza null} other {}}, typ {kind, select, string_field {tekst} "
      & "integer_field {liczba całkowita} decimal_field {liczba dziesiętna} "
      & "boolean_field {wartość logiczna} date_field {data} date_time_field "
      & "{data i godzina} object_field {obiekt} array_field {tablica} "
      & "enum_field {wyliczenie} binary_field {dane binarne} null_field {null} "
      & "any_field {dowolny} other {nieznany}}");
   P ("label.schema.schema_summary_label.fields",
      "{count, plural, one {1 pole} few {{count, number} pola} many {{count, "
      & "number} pól} other {{count, number} pola}}");
   P ("label.schema.schema_summary_label.required", "wymagane: {count, number}");
   P ("label.schema.schema_summary_label.optional", "opcjonalne: {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "przestarzałe: {count, number}");
   P ("label.schema.schema_summary_label.unknown", "nieznane: {count, number}");
   P ("label.diagnostics.check_run_summary_label.none", "nie uruchomiono żadnych kontroli");
   P ("label.diagnostics.check_run_summary_label.passed", "zaliczono: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "niezaliczono: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 ostrzeżenie} few {{count, number} "
      & "ostrzeżenia} many {{count, number} ostrzeżeń} other {{count, "
      & "number} ostrzeżenia}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "pominięto: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "oczekujące: {count, number}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}}");
   P ("label.workflows.workflow_summary_label.completed", "ukończone: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktywne: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "zablokowane: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "nieudane: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "pominięte: {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}}");
   P ("label.changes.change_summary_label.added", "dodano {count, number}");
   P ("label.changes.change_summary_label.removed", "usunięto {count, number}");
   P ("label.changes.change_summary_label.modified", "zmieniono {count, number}");
   P ("label.changes.change_summary_label.renamed", "zmieniono nazwę {count, number}");
   P ("label.changes.change_summary_label.unchanged", "bez zmian {count, number}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {przycisk} link_control {link} "
      & "tab_control {karta} menu_item_control {element menu} checkbox_control "
      & "{pole wyboru} radio_control {przycisk opcji} text_field_control {pole "
      & "tekstowe} progress_control {pasek postępu} table_cell_control "
      & "{komórka tabeli} region_control {region} other {kontrolka}} {named, "
      & "select, no {bez nazwy} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "zaznaczone");
   P ("label.markup.accessible_control_label.expanded", "rozwinięte");
   P ("label.markup.accessible_control_label.current", "bieżące");
   P ("label.markup.accessible_control_label.disabled", "wyłączone");
   P ("label.markup.accessible_control_label.required", "wymagane");
   P ("label.markup.accessible_control_label.invalid", "nieprawidłowe");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}}");
   P ("label.markup.accessible_control_label.position", "element {position} z {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problem} few {{count, number} problemy} many "
      & "{{count, number} problemów} other {{count, number} problemu}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schemat");
   P ("label.endpoints.url_component.host", "host");
   P ("label.endpoints.url_component.path", "ścieżka");
   P ("label.endpoints.url_component.query", "zapytanie");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "czerwony");
   P ("label.names.hue_noun.orange", "pomarańczowy");
   P ("label.names.hue_noun.yellow", "żółty");
   P ("label.names.hue_noun.green", "zielony");
   P ("label.names.hue_noun.cyan", "cyjanowy");
   P ("label.names.hue_noun.blue", "niebieski");
   P ("label.names.hue_noun.purple", "fioletowy");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutralny");
   P ("label.names.hue_noun.pink", "różowy");
   P ("label.names.hue_gender.red", "masculine");
   P ("label.names.hue_gender.orange", "masculine");
   P ("label.names.hue_gender.yellow", "masculine");
   P ("label.names.hue_gender.green", "masculine");
   P ("label.names.hue_gender.cyan", "masculine");
   P ("label.names.hue_gender.blue", "masculine");
   P ("label.names.hue_gender.purple", "masculine");
   P ("label.names.hue_gender.magenta", "feminine");
   P ("label.names.hue_gender.neutral", "masculine");
   P ("label.names.hue_gender.pink", "masculine");
   P ("label.names.agree.very_dark",
      "{gender, select, feminine {bardzo ciemna} neuter {bardzo ciemne} other "
      & "{bardzo ciemny}}");
   P ("label.names.agree.dark", "{gender, select, feminine {ciemna} neuter {ciemne} other {ciemny}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, feminine {średnio jasna} neuter {średnio jasne} "
      & "other {średnio jasny}}");
   P ("label.names.agree.light", "{gender, select, feminine {jasna} neuter {jasne} other {jasny}}");
   P ("label.names.agree.very_light",
      "{gender, select, feminine {bardzo jasna} neuter {bardzo jasne} other "
      & "{bardzo jasny}}");
   P ("label.names.agree.desaturated",
      "{gender, select, feminine {odbarwiona} neuter {odbarwione} other "
      & "{odbarwiony}}");
   P ("label.names.agree.muted",
      "{gender, select, feminine {stonowana} neuter {stonowane} other "
      & "{stonowany}}");
   P ("label.names.agree.neutral",
      "{gender, select, feminine {neutralna} neuter {neutralne} other "
      & "{neutralny}}");
   P ("label.names.agree.saturated",
      "{gender, select, feminine {nasycona} neuter {nasycone} other "
      & "{nasycony}}");
   P ("label.names.agree.vivid", "{gender, select, feminine {żywa} neuter {żywe} other {żywy}}");
   P ("label.names.agree.grayish", "{gender, select, feminine {szarawa} neuter {szarawe} other {szarawy}}");
   P ("label.names.agree.soft",
      "{gender, select, feminine {delikatna} neuter {delikatne} other "
      & "{delikatny}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {umiarkowana chromatyczność}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {wysoka chromatyczność}}");
   P ("label.names.agree.pastel",
      "{gender, select, feminine {pastelowa} neuter {pastelowe} other "
      & "{pastelowy}}");
   P ("label.names.agree.warm", "{gender, select, feminine {ciepła} neuter {ciepłe} other {ciepły}}");
   P ("label.names.agree.cool",
      "{gender, select, feminine {chłodna} neuter {chłodne} other "
      & "{chłodny}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {neutralna temperatura}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {zrównoważona temperatura}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
