separate (Humanize.Catalogs.Phrase_Data.Locale_Pl)
procedure Labels_3 is
begin
   P ("label.workflows.workflow_state_label",
      "{state, select, not_started_state {nie rozpoczęto} in_progress_state "
      & "{w toku} waiting_state {oczekuje} waiting_approval_state {oczekuje na "
      & "zatwierdzenie} blocked_state {zablokowano} completed_state "
      & "{ukończono} failed_state {niepowodzenie} cancelled_state {anulowano} "
      & "skipped_state {pominięto} other {wstrzymano}}");
   P ("label.contrast.opacity_label",
      "{percent}, {state, select, transparent {przezroczysty} "
      & "mostly_transparent {w większości przezroczysty} translucent "
      & "{półprzezroczysty} mostly_opaque {w większości nieprzezroczysty} "
      & "other {nieprzezroczysty}}");
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {brak obserwacji} one {{count, number} obserwacja, "
      & "min. {minimum} {unit}, mediana {median} {unit}, maks. {maximum} "
      & "{unit}} few {{count, number} obserwacje, min. {minimum} {unit}, "
      & "mediana {median} {unit}, maks. {maximum} {unit}} many {{count, number} "
      & "obserwacji, min. {minimum} {unit}, mediana {median} {unit}, maks. "
      & "{maximum} {unit}} other {{count, number} obserwacji, min. {minimum} "
      & "{unit}, mediana {median} {unit}, maks. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {brak obserwacji} other {0 "
      & "wartości odstających z {total, number} obserwacji}}} one {{outliers, "
      & "number} wartość odstająca z {total, number} obserwacji} few "
      & "{{outliers, number} wartości odstające z {total, number} obserwacji} "
      & "many {{outliers, number} wartości odstających z {total, number} "
      & "obserwacji} other {{outliers, number} wartości odstającej z {total, "
      & "number} obserwacji}}");
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
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} ponad pojemność} other "
      & "{pozostało {count, number} z {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {przydział przekroczony o {count, number} "
      & "{unit} (wykorzystano {percent})} near {przydział bliski wyczerpania: "
      & "pozostało {count, number} {unit} (wykorzystano {percent})} other "
      & "{przydział dostępny: pozostało {count, number} {unit} (wykorzystano "
      & "{percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {współczynnik trafień pamięci podręcznej "
      & "niedostępny: brak żądań} other {współczynnik trafień pamięci "
      & "podręcznej {percent}: {hits, plural, one {{hits, number} trafienie} "
      & "few {{hits, number} trafienia} many {{hits, number} trafień} other "
      & "{{hits, number} trafienia}}, {misses, plural, one {{misses, number} "
      & "chybienie} few {{misses, number} chybienia} many {{misses, number} "
      & "chybień} other {{misses, number} chybienia}}}}");
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
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atrybut} few {{count, number} "
      & "atrybuty} many {{count, number} atrybutów} other {{count, number} "
      & "atrybutu}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} atrybut data} few {{count, "
      & "number} atrybuty data} many {{count, number} atrybutów data} other "
      & "{{count, number} atrybutu data}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atrybut ARIA} few {{count, "
      & "number} atrybuty ARIA} many {{count, number} atrybutów ARIA} other "
      & "{{count, number} atrybutu ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} procedura obsługi zdarzeń} few "
      & "{{count, number} procedury obsługi zdarzeń} many {{count, number} "
      & "procedur obsługi zdarzeń} other {{count, number} procedury obsługi "
      & "zdarzeń}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {treść tekstowa} html_content {dokument "
      & "HTML} json_content {dokument JSON} xml_content {dokument XML} "
      & "image_content {obraz} audio_content {dźwięk} video_content {wideo} "
      & "font_content {czcionka} archive_content {archiwum} binary_content "
      & "{dane binarne} form_content {przesłanie formularza} other {nieznana "
      & "treść}} ({base})");
   P ("label.markup.heading_label", "nagłówek poziomu {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} znacznik} few {{count, number} "
      & "znaczniki} many {{count, number} znaczników} other {{count, number} "
      & "znacznika}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} link} few {{count, number} linki} "
      & "many {{count, number} linków} other {{count, number} linku}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} element multimedialny} few "
      & "{{count, number} elementy multimedialne} many {{count, number} "
      & "elementów multimedialnych} other {{count, number} elementu "
      & "multimedialnego}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} kontrolka formularza} few "
      & "{{count, number} kontrolki formularza} many {{count, number} kontrolek "
      & "formularza} other {{count, number} kontrolki formularza}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} nagłówek} few {{count, number} "
      & "nagłówki} many {{count, number} nagłówków} other {{count, number} "
      & "nagłówka}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} punkt orientacyjny} few {{count, "
      & "number} punkty orientacyjne} many {{count, number} punktów "
      & "orientacyjnych} other {{count, number} punktu orientacyjnego}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formularz} few {{count, number} "
      & "formularze} many {{count, number} formularzy} other {{count, number} "
      & "formularza}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} element multimedialny} few "
      & "{{count, number} elementy multimedialne} many {{count, number} "
      & "elementów multimedialnych} other {{count, number} elementu "
      & "multimedialnego}}");
   P ("label.markup.table_navigation_label",
      "{caption}, wiersz {row, number} z {rows, number}, kolumna {column, "
      & "number} z {columns, number}");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind}: nie ustawiono} hidden_value {{kind}: "
      & "ukryto} masked_value {{kind} {shown}} fingerprint_only {{kind}: odcisk "
      & "z końcówką {shown}} other {{kind} z końcówką {shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind}: nie ustawiono} other {{name} "
      & "{kind} z końcówką {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {nagłówek poświadczeń {name}: nie ustawiono} "
      & "other {{name} {kind} z końcówką {shown}}}");
   P ("label.secrets.fingerprint_label", "odcisk {algorithm} z końcówką {shown}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} sekret} few {{count, number} "
      & "sekrety} many {{count, number} sekretów} other {{count, number} "
      & "sekretu}}");
   P ("label.secrets.secret_count_label.masked", "zamaskowane: {count, number}");
   P ("label.secrets.secret_count_label.unset", "nieustawione: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} odcisk} few {{count, number} "
      & "odciski} many {{count, number} odcisków} other {{count, number} "
      & "odcisku}}");
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
   P ("label.schema.type_mismatch_label",
      "pole {field_name}: oczekiwany typ {expected, select, string_field "
      & "{tekst} integer_field {liczba całkowita} decimal_field {liczba "
      & "dziesiętna} boolean_field {wartość logiczna} date_field {data} "
      & "date_time_field {data i godzina} object_field {obiekt} array_field "
      & "{tablica} enum_field {wyliczenie} binary_field {dane binarne} "
      & "null_field {null} any_field {dowolny} other {nieznany}}, otrzymany "
      & "{actual, select, string_field {tekst} integer_field {liczba "
      & "całkowita} decimal_field {liczba dziesiętna} boolean_field "
      & "{wartość logiczna} date_field {data} date_time_field {data i "
      & "godzina} object_field {obiekt} array_field {tablica} enum_field "
      & "{wyliczenie} binary_field {dane binarne} null_field {null} any_field "
      & "{dowolny} other {nieznany}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} problem blokujący} few {{blocking, number} problemy "
      & "blokujące} many {{blocking, number} problemów blokujących} other "
      & "{{blocking, number} problemu blokującego}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} problem blokujący} few "
      & "{{blocking, number} problemy blokujące} many {{blocking, number} "
      & "problemów blokujących} other {{blocking, number} problemu "
      & "blokującego}}} only {tylko {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "nie uruchomiono żadnych kontroli");
   P ("label.diagnostics.check_run_summary_label.passed", "zaliczono: {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "nie zaliczono: {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 ostrzeżenie} few {{count, number} "
      & "ostrzeżenia} many {{count, number} ostrzeżeń} other {{count, "
      & "number} ostrzeżenia}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "pominięto: {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "oczekujące: {count, number}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {zakres docelowy od {low} do "
      & "{high}} other {okno docelowe od {low} do {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} w oczekiwanym zakresie} below {{value} "
      & "poniżej oczekiwanego zakresu} other {{value} powyżej oczekiwanego "
      & "zakresu}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} na progu krytycznym} warning "
      & "{{value} na progu ostrzegawczym} other {{value} w normalnym zakresie}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {bez przekroczenia} other {przekroczono o "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {cel osiągnięty} below {{difference} poniżej "
      & "celu} other {{difference} powyżej celu}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limit przekroczony} near {blisko limitu, "
      & "pozostało {distance}} other {{distance} do limitu}}");
   P ("label.thresholds.threshold_summary_label.none", "brak metryk");
   P ("label.thresholds.threshold_summary_label.normal", "w normie: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} ostrzeżenie} few {{count, "
      & "number} ostrzeżenia} many {{count, number} ostrzeżeń} other "
      & "{{count, number} ostrzeżenia}}");
   P ("label.thresholds.threshold_summary_label.critical", "krytyczne: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} przekroczenie} few {{count, "
      & "number} przekroczenia} many {{count, number} przekroczeń} other "
      & "{{count, number} przekroczenia}}");
   P ("label.thresholds.target_window_label", "cel {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerancja {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} limitu");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limit przekroczony o {amount}} other "
      & "{pozostało {amount}}}");
   P ("label.thresholds.budget_used_label", "wykorzystano {used} z {budget}");
   P ("label.workflows.step_label", "krok {current, number} z {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "ukończono {current, number} z {total, number} kamieni milowych: "
      & "{name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}}");
   P ("label.workflows.workflow_summary_label.completed", "ukończone: {count, number}");
   P ("label.workflows.workflow_summary_label.active", "aktywne: {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "zablokowane: {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "nieudane: {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "pominięte: {count, number}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {brak elementów przepływu pracy} half "
      & "{półmetek przepływu pracy} other {ukończono {completed, number} z "
      & "{total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {pozycja w kolejce {position, number}} other "
      & "{pozycja w kolejce {position, number} z {total, number}}}");
   P ("label.changes.change_set_label.none", "brak zmian");
   P ("label.changes.change_set_label.added", "dodano {count, number}");
   P ("label.changes.change_set_label.removed", "usunięto {count, number}");
   P ("label.changes.change_set_label.modified", "zmieniono {count, number}");
   P ("label.changes.change_set_label.unchanged", "bez zmian {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}}");
   P ("label.changes.change_summary_label.added", "dodano {count, number}");
   P ("label.changes.change_summary_label.removed", "usunięto {count, number}");
   P ("label.changes.change_summary_label.modified", "zmieniono {count, number}");
   P ("label.changes.change_summary_label.renamed", "zmieniono nazwę {count, number}");
   P ("label.changes.change_summary_label.unchanged", "bez zmian {count, number}");
   P ("label.changes.sync_change_label.none", "brak zmian synchronizacji");
   P ("label.changes.sync_change_label.uploaded", "przesłano {count, number}");
   P ("label.changes.sync_change_label.downloaded", "pobrano {count, number}");
   P ("label.changes.sync_change_label.deleted", "usunięto {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} konflikt} few {{count, number} "
      & "konflikty} many {{count, number} konfliktów} other {{count, number} "
      & "konfliktu}}");
   P ("label.changes.net_change_label",
      "{state, select, none {brak zmiany netto} up {netto +{count, plural, "
      & "one {{count, number} element} few {{count, number} elementy} many "
      & "{{count, number} elementów} other {{count, number} elementu}}} other "
      & "{netto -{count, plural, one {{count, number} element} few {{count, "
      & "number} elementy} many {{count, number} elementów} other {{count, "
      & "number} elementu}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {brak zmian do przejrzenia} all {przejrzano "
      & "wszystkie zmiany} other {przejrzane zmiany: {reviewed, number} z "
      & "{total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: bez zmian ({new_value})} up "
      & "{{field_name}: wzrost z {old_value} do {new_value}} other "
      & "{{field_name}: spadek z {old_value} do {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {brak wierszy do zaznaczenia} none {nie "
      & "zaznaczono wierszy} all {{total, plural, =1 {zaznaczono 1 wiersz} "
      & "other {zaznaczono wszystkie wiersze ({total, number})}}} other "
      & "{zaznaczone wiersze: {selected, number} z {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {brak stron} other {{pages, plural, =0 {brak stron} "
      & "other {{rows, plural, =0 {strona {page, number} z {pages, number}} "
      & "other {strona {page, number} z {pages, number}, {rows, plural, one "
      & "{{rows, number} wiersz} few {{rows, number} wiersze} many {{rows, "
      & "number} wierszy} other {{rows, number} wiersza}}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {brak wierszy} none {brak pasujących wierszy} "
      & "all {{total, plural, =1 {widoczny 1 wiersz} other {widoczne wszystkie "
      & "wiersze ({total, number})}}} other {widoczne wiersze: {visible, "
      & "number} z {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {brak wierszy} single {wiersz {first_row, number} "
      & "z {total, number}} other {wiersze {first_row, number}–{last_row, "
      & "number} z {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {bez limitu znaków} none_left {nie "
      & "pozostał żaden znak} left {{count, plural, one {pozostał {count, "
      & "number} znak} few {pozostały {count, number} znaki} many {pozostało "
      & "{count, number} znaków} other {pozostało {count, number} znaku}}} "
      & "other {przekroczono limit o {count, plural, one {{count, number} znak} "
      & "few {{count, number} znaki} many {{count, number} znaków} other "
      & "{{count, number} znaku}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {brak pól wymaganych} other {{missing, plural, =0 "
      & "{wszystkie pola wymagane wypełnione} other {brakujące pola wymagane: "
      & "{missing, number} z {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {brak pól} all {wszystkie pola wypełnione} "
      & "other {wypełnione pola: {completed, number} z {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: brak pól} all {{name}: wszystkie pola "
      & "wypełnione} other {{name}: wypełnione pola: {completed, number} z "
      & "{total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {brak kroków formularza} =1 {krok 1 z 1: {name}} "
      & "other {krok {current, number} z {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {brak ścieżki nawigacji} =1 {element ścieżki 1 "
      & "z 1: {name}} other {element ścieżki {current, number} z {total, "
      & "number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {brak kart} =1 {karta 1 z 1: {name}} other {karta "
      & "{current, number} z {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {pusta skrzynka odbiorcza} other {{unread, plural, "
      & "=0 {wszystkie powiadomienia przeczytane} other {nieprzeczytane "
      & "powiadomienia: {unread, number} z {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label", "próba dostarczenia {attempt, number} z {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {brak elementów listy kontrolnej} other "
      & "{ukończone elementy: {done, number} z {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {brak przesyłanych plików} other {ukończone "
      & "przesyłania: {done, number} z {total, number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {brak miejsc} other {zarezerwowane miejsca: "
      & "{reserved, number} z {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {pozycja na liście oczekujących {position, "
      & "number}} other {pozycja na liście oczekujących {position, number} z "
      & "{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: zmieniono {changed, "
      & "number}/{total, number}} other {{name}: zmieniono {changed, number}, "
      & "bez zmian {unchanged, number}, łącznie {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
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
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "obecny kolor pierwszego planu zapewnia kontrast dla dużego tekstu na "
      & "poziomie {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "obecny kolor pierwszego planu zapewnia kontrast dla zwykłego tekstu "
      & "na poziomie {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "użyj {v1}, aby uzyskać wzmocniony kontrast tekstu na poziomie {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "użyj {v1}, aby uzyskać kontrast dla dużego tekstu na poziomie {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "użyj {v1}, aby uzyskać kontrast dla zwykłego tekstu na poziomie "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "użyj {v1}, aby uzyskać kontrast dla dużego tekstu na poziomie "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "użyj {v1}, aby uzyskać wzmocniony kontrast tekstu na poziomie "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "obecny kolor pierwszego planu zapewnia kontrast dla dużego tekstu na "
      & "poziomie {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "obecny kolor pierwszego planu zapewnia kontrast dla zwykłego tekstu "
      & "na poziomie {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "obecny kolor pierwszego planu zapewnia wzmocniony kontrast tekstu na "
      & "poziomie {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "obecny kolor pierwszego planu zapewnia wzmocniony kontrast tekstu na "
      & "poziomie {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: niskie ryzyko pomyłki, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: umiarkowane ryzyko pomyłki, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: umiarkowane ryzyko pomyłki, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsja: wysokie ryzyko pomyłki, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (tekstylia) delta {v1}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, duża różnica percepcyjna");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: umiarkowane ryzyko pomyłki, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, drastyczna różnica percepcyjna");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsja: niskie ryzyko pomyłki, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: kolory rozróżnialne, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: kolory rozróżnialne, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: kolory rozróżnialne, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsja: kolory rozróżnialne, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsja: umiarkowane ryzyko pomyłki, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (tekstylia) delta {v1}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, zauważalna różnica percepcyjna");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: wysokie ryzyko pomyłki, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: wysokie ryzyko pomyłki, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, zauważalna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (tekstylia) delta {v1}, zauważalna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, zauważalna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, zauważalna różnica percepcyjna");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: niskie ryzyko pomyłki, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: niskie ryzyko pomyłki, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, duża różnica percepcyjna");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: wysokie ryzyko pomyłki, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (tekstylia) delta {v1, number}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, drastyczna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (tekstylia) delta {v1, number}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, zauważalna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (tekstylia) delta {v1}, subtelna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, zauważalna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (tekstylia) delta {v1, number}, zauważalna różnica "
      & "percepcyjna");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, ledwo dostrzegalna");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (tekstylia) delta {v1}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, duża różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (tekstylia) delta {v1, number}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, niedostrzegalna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtelna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtelna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtelna różnica percepcyjna");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, ledwo dostrzegalna");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min mówienia");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min czytania");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} akapit} few {{v1, number} akapity} many "
      & "{{v1, number} akapitów} other {{v1, number} akapitu}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "mniej niż {v1, number} min mówienia");
   P ("label.metrics.text_summary.less_than_n_minute_read", "mniej niż {v1, number} min czytania");
end Labels_3;
