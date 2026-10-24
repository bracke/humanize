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
      "{brightness} {chroma} {temperature} {base, select, pink {różowy} "
      & "other {{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
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
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} zdanie} few {{v1, number} zdania} many "
      & "{{v1, number} zdań} other {{v1, number} zdania}}");
   P ("label.metrics.text_summary.no_words", "brak słów");
   P ("label.metrics.text_summary.no_paragraphs", "brak akapitów");
   P ("label.metrics.text_summary.no_sentences", "brak zdań");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
   P ("label.names.hue_family_label.neutral", "neutralny");
   P ("label.names.saturation_label.neutral", "neutralny");
   P ("label.names.temperature_label.neutral_temperature", "neutralna temperatura");
   P ("label.names.chroma_label.grayish", "szarawy");
   P ("label.names.nearest_color_name.black", "czarny");
   P ("label.models.brightness_label.very_dark", "bardzo ciemny");
   P ("label.names.hue_family_label.blue", "niebieski");
   P ("label.names.saturation_label.vivid", "żywy");
   P ("label.names.temperature_label.cool", "chłodny");
   P ("label.names.chroma_label.moderate_chroma", "umiarkowana chromatyczność");
   P ("label.names.nearest_color_name.navy", "granatowy");
   P ("label.names.chroma_label.high_chroma", "wysoka chromatyczność");
   P ("label.names.nearest_color_name.blue", "niebieski");
   P ("label.names.hue_family_label.green", "zielony");
   P ("label.names.temperature_label.balanced_temperature", "zrównoważona temperatura");
   P ("label.names.hue_family_label.cyan", "cyjanowy");
   P ("label.names.chroma_label.soft", "delikatny");
   P ("label.models.brightness_label.dark", "ciemny");
   P ("label.names.nearest_color_name.green", "zielony");
   P ("label.names.nearest_color_name.teal", "morski");
   P ("label.models.brightness_label.medium_brightness", "średnia jasność");
   P ("label.names.nearest_color_name.aqua", "turkusowy");
   P ("label.names.nearest_color_name.lime", "limonkowy");
   P ("label.models.brightness_label.light", "jasny");
   P ("label.names.hue_family_label.red", "czerwony");
   P ("label.names.temperature_label.warm", "ciepły");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "fioletowy");
   P ("label.names.hue_family_label.yellow", "żółty");
   P ("label.names.saturation_label.muted", "stonowany");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "nasycony");
   P ("label.names.nearest_color_name.maroon", "kasztanowy");
   P ("label.names.nearest_color_name.purple", "purpurowy");
   P ("label.names.hue_family_label.orange", "pomarańczowy");
   P ("label.names.nearest_color_name.olive", "oliwkowy");
   P ("label.names.nearest_color_name.gray", "szary");
   P ("label.names.saturation_label.desaturated", "odbarwiony");
   P ("label.names.nearest_color_name.silver", "srebrny");
   P ("label.names.chroma_label.pastel", "pastelowy");
   P ("label.models.brightness_label.very_light", "bardzo jasny");
   P ("label.names.nearest_color_name.fuchsia", "fuksja");
   P ("label.names.nearest_color_name.yellow", "żółty");
   P ("label.names.nearest_color_name.red", "czerwony");
   P ("label.names.nearest_color_name.orange", "pomarańczowy");
   P ("label.names.nearest_color_name.white", "biały");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, niski kontrast");
   P ("label.contrast.readability_label.low_readability", "niska czytelność");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, niewystarczający, ciemny tekst na jasnym tle");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, niski kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, niewystarczający, ciemny tekst na jasnym tle");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsja: umiarkowane ryzyko pomyłki");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% – silna różnica");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, niski kontrast po kompozycji alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, niewystarczający, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, niewystarczający, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: wysokie ryzyko pomyłki");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, kontrast dla dużego tekstu");
   P ("label.contrast.readability_label.readable_for_large_text_only", "czytelne tylko dla dużego tekstu");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, duży tekst, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, kontrast dla dużego tekstu");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, duży tekst, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: wysokie ryzyko pomyłki");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast dla dużego tekstu po kompozycji alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, tylko elementy nietekstowe, jasny tekst na ciemnym "
      & "tle");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, tylko elementy nietekstowe, jasny tekst na ciemnym "
      & "tle");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: umiarkowane ryzyko pomyłki");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, niski kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, niski kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, tylko elementy nietekstowe, ciemny tekst na jasnym "
      & "tle");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, tylko elementy nietekstowe, ciemny tekst na jasnym "
      & "tle");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: umiarkowane ryzyko pomyłki");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: wysokie ryzyko pomyłki");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% – bardzo różne");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsja: wysokie ryzyko pomyłki");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsja: niskie ryzyko pomyłki");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, niski kontrast po kompozycji alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, kontrast dla zwykłego tekstu");
   P ("label.contrast.readability_label.readable_for_normal_text", "czytelne dla zwykłego tekstu");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, tekst główny, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, kontrast dla zwykłego tekstu");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, tekst główny, jasny tekst na ciemnym tle");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, duży tekst, ciemny tekst na jasnym tle");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, duży tekst, ciemny tekst na jasnym tle");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% – subtelna różnica");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, tekst główny, ciemny tekst na jasnym tle");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, tekst główny, ciemny tekst na jasnym tle");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: niskie ryzyko pomyłki");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% – zauważalna różnica");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast dla dużego tekstu");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast dla dużego tekstu");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: niskie ryzyko pomyłki");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, wzmocniony kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "czytelne dla tekstu o wzmocnionym kontraście");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, wzmocniony kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtelna różnica percepcyjna");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: kolory rozróżnialne");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast dla zwykłego tekstu po kompozycji "
      & "alfa");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: umiarkowane ryzyko pomyłki");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast dla zwykłego tekstu po kompozycji alfa");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast dla dużego tekstu po kompozycji "
      & "alfa");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, doskonały, ciemny tekst na jasnym tle");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, doskonały, ciemny tekst na jasnym tle");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast dla zwykłego tekstu");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast dla zwykłego tekstu");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, wzmocniony kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, doskonały, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, wzmocniony kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, doskonały, jasny tekst na ciemnym tle");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: kolory rozróżnialne");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, wzmocniony kontrast po kompozycji alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, ledwo dostrzegalna");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% – niemal identyczne");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: niskie ryzyko pomyłki");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsja: kolory rozróżnialne");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} kolor} few {{v1, number} kolory} many "
      & "{{v1, number} kolorów} other {{v1, number} koloru}}");
   P ("label.palettes.palette_summary.mostly_gray", "głównie szary");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "umiarkowany rozrzut kontrastu");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "tło {v1}, tekst {v2}, akcent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "paleta triadyczna");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "najlepszy kontrast: {v1} na {v2} przy {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} z {v2, plural, one {1 pary} other {{v2, number} par}} "
      & "spełnia kryterium kontrastu dla zwykłego tekstu");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "wzmocniony {v1, number}, zwykły {v2, number}, tylko duży tekst {v3, "
      & "number}, niezaliczone {v4, number} (z {v5, plural, one {1 pary} other "
      & "{{v5, number} par}})");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {{v1, number} kolor} few {{v1, number} kolory} many "
      & "{{v1, number} kolorów} other {{v1, number} koloru}}, {v2, plural, one "
      & "{{v2, number} para} few {{v2, number} pary} many {{v2, number} par} "
      & "other {{v2, number} pary}}: wzmocniony {v3, number}, zwykły {v4, "
      & "number}, tylko duży tekst {v5, number}, niezaliczone {v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "zrównoważona");
   P ("label.palettes.palette_mood_label.vibrant", "żywa");
   P ("label.palettes.palette_mood_label.warm_mood", "ciepły nastrój");
   P ("label.palettes.palette_summary.mostly_blue", "głównie niebieski");
   P ("label.palettes.palette_summary.low_contrast_spread", "niski rozrzut kontrastu");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paleta z jednym akcentem");
   P ("label.palettes.palette_mood_label.dark", "ciemna");
   P ("label.palettes.palette_mood_label.cool_mood", "chłodny nastrój");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "głównie rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "brak dostępnych par tekstowych");
   P ("label.palettes.palette_mood_label.subtle", "subtelna");
   P ("label.palettes.palette_summary.high_contrast_spread", "wysoki rozrzut kontrastu");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "najlepszy kontrast: {v1} na {v2} przy {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutralny nastrój");
   P ("label.palettes.palette_summary.mostly_purple", "głównie purpurowy");
   P ("label.palettes.palette_harmony_label.complementary_palette", "paleta komplementarna");
   P ("label.palettes.palette_summary.mostly_green", "głównie zielony");
   P ("label.palettes.palette_mood_label.moderate", "umiarkowana");
   P ("label.palettes.palette_summary.mostly_silver", "głównie srebrny");
   P ("label.palettes.palette_harmony_label.varied_palette", "paleta zróżnicowana");
   P ("label.palettes.palette_summary.mostly_olive", "głównie oliwkowy");
   P ("label.palettes.palette_harmony_label.analogous_palette", "paleta analogiczna");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} z {v2, plural, one {1 pary} other {{v2, number} par}} "
      & "spełnia kryterium tylko dla dużego tekstu");
   P ("label.palettes.palette_mood_label.light", "jasna");
   P ("label.palettes.palette_summary.mostly_teal", "głównie morski");
   P ("label.palettes.palette_summary.mostly_aqua", "głównie turkusowy");
   P ("label.palettes.palette_summary.mostly_lime", "głównie limonkowy");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "paleta monochromatyczna");
   P ("label.palettes.palette_summary.mostly_black", "głównie czarny");
   P ("label.palettes.palette_summary.mostly_yellow", "głównie żółty");
   P ("label.palettes.palette_summary.mostly_maroon", "głównie kasztanowy");
   P ("label.palettes.palette_summary.mostly_white", "głównie biały");
   P ("label.palettes.palette_summary.mostly_orange", "głównie pomarańczowy");
   P ("label.palettes.palette_summary.mostly_fuchsia", "głównie fuksja");
   P ("label.palettes.palette_harmony_label.neutral_palette", "paleta neutralna");
   P ("label.palettes.palette_summary.mostly_red", "głównie czerwony");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} słowo} few {{v1, number} słowa} many "
      & "{{v1, number} słów} other {{v1, number} słowa}}");
end Labels_3;
