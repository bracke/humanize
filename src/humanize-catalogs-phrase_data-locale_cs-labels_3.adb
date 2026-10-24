separate (Humanize.Catalogs.Phrase_Data.Locale_Cs)
procedure Labels_3 is
begin
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {žádná pozorování} one {{count, number} "
      & "pozorování, min. {minimum} {unit}, medián {median} {unit}, max. "
      & "{maximum} {unit}} few {{count, number} pozorování, min. {minimum} "
      & "{unit}, medián {median} {unit}, max. {maximum} {unit}} many {{count, "
      & "number} pozorování, min. {minimum} {unit}, medián {median} {unit}, "
      & "max. {maximum} {unit}} other {{count, number} pozorování, min. "
      & "{minimum} {unit}, medián {median} {unit}, max. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {žádná pozorování} "
      & "other {0 odlehlých hodnot z {total, number} pozorování}}} one "
      & "{{outliers, number} odlehlá hodnota z {total, number} pozorování} "
      & "few {{outliers, number} odlehlé hodnoty z {total, number} "
      & "pozorování} many {{outliers, number} odlehlé hodnoty z {total, "
      & "number} pozorování} other {{outliers, number} odlehlých hodnot z "
      & "{total, number} pozorování}}");
   P ("label.resources.remaining_label",
      "{state, select, over {{count, number} {unit} nad kapacitu} other "
      & "{zbývá {count, number} z {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvóta překročena o {count, number} {unit} "
      & "(využito {percent})} near {kvóta téměř vyčerpána: zbývá "
      & "{count, number} {unit} (využito {percent})} other {kvóta k "
      & "dispozici: zbývá {count, number} {unit} (využito {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {úspěšnost mezipaměti nedostupná: žádné "
      & "požadavky} other {úspěšnost mezipaměti {percent}: {hits, plural, "
      & "one {{hits, number} zásah} few {{hits, number} zásahy} many {{hits, "
      & "number} zásahu} other {{hits, number} zásahů}}, {misses, plural, "
      & "one {{misses, number} minutí} few {{misses, number} minutí} many "
      & "{{misses, number} minutí} other {{misses, number} minutí}}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atribut} few {{count, number} "
      & "atributy} many {{count, number} atributu} other {{count, number} "
      & "atributů}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} datový atribut} few {{count, "
      & "number} datové atributy} many {{count, number} datového atributu} "
      & "other {{count, number} datových atributů}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} atribut ARIA} few {{count, "
      & "number} atributy ARIA} many {{count, number} atributu ARIA} other "
      & "{{count, number} atributů ARIA}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} obslužná rutina událostí} few "
      & "{{count, number} obslužné rutiny událostí} many {{count, number} "
      & "obslužné rutiny událostí} other {{count, number} obslužných "
      & "rutin událostí}}");
   P ("label.markup.heading_label", "nadpis úrovně {level, number}");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} značka} few {{count, number} "
      & "značky} many {{count, number} značky} other {{count, number} "
      & "značek}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} odkaz} few {{count, number} "
      & "odkazy} many {{count, number} odkazu} other {{count, number} odkazů}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} mediální prvek} few {{count, "
      & "number} mediální prvky} many {{count, number} mediálního prvku} "
      & "other {{count, number} mediálních prvků}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} ovládací prvek formuláře} few "
      & "{{count, number} ovládací prvky formuláře} many {{count, number} "
      & "ovládacího prvku formuláře} other {{count, number} ovládacích "
      & "prvků formuláře}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} nadpis} few {{count, number} "
      & "nadpisy} many {{count, number} nadpisu} other {{count, number} "
      & "nadpisů}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} orientační bod} few {{count, "
      & "number} orientační body} many {{count, number} orientačního bodu} "
      & "other {{count, number} orientačních bodů}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} formulář} few {{count, number} "
      & "formuláře} many {{count, number} formuláře} other {{count, number} "
      & "formulářů}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} mediální prvek} few {{count, "
      & "number} mediální prvky} many {{count, number} mediálního prvku} "
      & "other {{count, number} mediálních prvků}}");
   P ("label.markup.table_navigation_label",
      "{caption}, řádek {row, number} z {rows, number}, sloupec {column, "
      & "number} z {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} tajný údaj} few {{count, "
      & "number} tajné údaje} many {{count, number} tajného údaje} other "
      & "{{count, number} tajných údajů}}");
   P ("label.secrets.secret_count_label.masked", "maskováno: {count, number}");
   P ("label.secrets.secret_count_label.unset", "nenastaveno: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} otisk} few {{count, number} "
      & "otisky} many {{count, number} otisku} other {{count, number} otisků}}");
   P ("label.schema.type_mismatch_label",
      "pole {field_name}: očekávaný typ {expected, select, string_field "
      & "{řetězec} integer_field {celé číslo} decimal_field {desetinné "
      & "číslo} boolean_field {logická hodnota} date_field {datum} "
      & "date_time_field {datum a čas} object_field {objekt} array_field "
      & "{pole} enum_field {výčet} binary_field {binární data} null_field "
      & "{null} any_field {libovolný} other {neznámý}}, skutečný {actual, "
      & "select, string_field {řetězec} integer_field {celé číslo} "
      & "decimal_field {desetinné číslo} boolean_field {logická hodnota} "
      & "date_field {datum} date_time_field {datum a čas} object_field "
      & "{objekt} array_field {pole} enum_field {výčet} binary_field "
      & "{binární data} null_field {null} any_field {libovolný} other "
      & "{neznámý}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} blokující problém} few {{blocking, number} blokující "
      & "problémy} many {{blocking, number} blokujícího problému} other "
      & "{{blocking, number} blokujících problémů}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} blokující problém} few "
      & "{{blocking, number} blokující problémy} many {{blocking, number} "
      & "blokujícího problému} other {{blocking, number} blokujících "
      & "problémů}}} only {pouze {base}} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {cílový rozsah {low} až "
      & "{high}} other {cílové okno {low} až {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} v očekávaném rozsahu} below "
      & "{{value} pod očekávaným rozsahem} other {{value} nad očekávaným "
      & "rozsahem}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} na kritickém prahu} warning "
      & "{{value} na prahu varování} other {{value} v normálním rozsahu}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {nepřekročeno} other {překročeno o "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {cíl splněn} below {{difference} pod cílem} "
      & "other {{difference} nad cílem}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limit překročen} near {blízko limitu, "
      & "zbývá {distance}} other {{distance} od limitu}}");
   P ("label.thresholds.threshold_summary_label.none", "žádné metriky");
   P ("label.thresholds.threshold_summary_label.normal", "normální: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} varování} few {{count, number} "
      & "varování} many {{count, number} varování} other {{count, number} "
      & "varování}}");
   P ("label.thresholds.threshold_summary_label.critical", "kritické: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} překročení} few {{count, "
      & "number} překročení} many {{count, number} překročení} other "
      & "{{count, number} překročení}}");
   P ("label.thresholds.target_window_label", "cíl {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerance {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} limitu");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limit překročen o {amount}} other {zbývá "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "využito {used} z {budget}");
   P ("label.workflows.step_label", "krok {current, number} z {total, number}: {name}");
   P ("label.workflows.milestone_label", "dokončené milníky: {current, number} z {total, number}, {name}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {žádné položky pracovního postupu} half "
      & "{pracovní postup v polovině} other {dokončeno {completed, number} z "
      & "{total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {pozice ve frontě {position, number}} other "
      & "{pozice ve frontě {position, number} z {total, number}}}");
   P ("label.changes.change_set_label.none", "žádné změny");
   P ("label.changes.change_set_label.added", "přidáno {count, number}");
   P ("label.changes.change_set_label.removed", "odebráno {count, number}");
   P ("label.changes.change_set_label.modified", "změněno {count, number}");
   P ("label.changes.change_set_label.unchanged", "beze změny {count, number}");
   P ("label.changes.sync_change_label.none", "žádné změny synchronizace");
   P ("label.changes.sync_change_label.uploaded", "nahráno {count, number}");
   P ("label.changes.sync_change_label.downloaded", "staženo {count, number}");
   P ("label.changes.sync_change_label.deleted", "smazáno {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} konflikt} few {{count, number} "
      & "konflikty} many {{count, number} konfliktu} other {{count, number} "
      & "konfliktů}}");
   P ("label.changes.net_change_label",
      "{state, select, none {žádná čistá změna} up {netto +{count, "
      & "plural, one {{count, number} položka} few {{count, number} položky} "
      & "many {{count, number} položky} other {{count, number} položek}}} "
      & "other {netto -{count, plural, one {{count, number} položka} few "
      & "{{count, number} položky} many {{count, number} položky} other "
      & "{{count, number} položek}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {žádné změny ke kontrole} all {všechny "
      & "změny zkontrolovány} other {zkontrolované změny: {reviewed, "
      & "number} z {total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: beze změny ({new_value})} up "
      & "{{field_name}: zvýšeno z {old_value} na {new_value}} other "
      & "{{field_name}: sníženo z {old_value} na {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {žádné řádky k výběru} none {nevybrány "
      & "žádné řádky} all {{total, plural, =1 {vybrán 1 řádek} other "
      & "{vybrány všechny řádky ({total, number})}}} other {vybrané "
      & "řádky: {selected, number} z {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {žádné stránky} other {{pages, plural, =0 "
      & "{žádné stránky} other {{rows, plural, =0 {stránka {page, number} "
      & "z {pages, number}} other {stránka {page, number} z {pages, number}, "
      & "{rows, plural, one {{rows, number} řádek} few {{rows, number} "
      & "řádky} many {{rows, number} řádku} other {{rows, number} "
      & "řádků}}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {žádné řádky} none {žádné "
      & "odpovídající řádky} all {{total, plural, =1 {zobrazen 1 řádek} "
      & "other {zobrazeny všechny řádky ({total, number})}}} other "
      & "{zobrazené řádky: {visible, number} z {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {žádné řádky} single {řádek {first_row, "
      & "number} z {total, number}} other {řádky {first_row, "
      & "number}–{last_row, number} z {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {bez limitu znaků} none_left {nezbývají "
      & "žádné znaky} left {{count, plural, one {zbývá {count, number} "
      & "znak} few {zbývají {count, number} znaky} many {zbývá {count, "
      & "number} znaku} other {zbývá {count, number} znaků}}} other {limit "
      & "překročen o {count, plural, one {{count, number} znak} few {{count, "
      & "number} znaky} many {{count, number} znaku} other {{count, number} "
      & "znaků}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {žádná povinná pole} other {{missing, plural, "
      & "=0 {všechna povinná pole vyplněna} other {chybějící povinná "
      & "pole: {missing, number} z {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {žádná pole} all {všechna pole vyplněna} "
      & "other {vyplněná pole: {completed, number} z {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: žádná pole} all {{name}: všechna "
      & "pole vyplněna} other {{name}: vyplněná pole: {completed, number} z "
      & "{total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {žádné kroky formuláře} =1 {krok 1 z 1: "
      & "{name}} other {krok {current, number} z {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {žádná drobečková navigace} =1 {položka "
      & "drobečkové navigace 1 z 1: {name}} other {položka drobečkové "
      & "navigace {current, number} z {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {žádné karty} =1 {karta 1 z 1: {name}} other "
      & "{karta {current, number} z {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {prázdná doručená pošta} other {{unread, "
      & "plural, =0 {všechna oznámení přečtena} other {nepřečtená "
      & "oznámení: {unread, number} z {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label", "pokus o doručení {attempt, number} z {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {žádné položky kontrolního seznamu} other "
      & "{dokončené položky: {done, number} z {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {žádná nahrávání} other {dokončená "
      & "nahrávání: {done, number} z {total, number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {žádná kapacita} other {rezervovaná místa: "
      & "{reserved, number} z {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {pozice v pořadníku {position, number}} other "
      & "{pozice v pořadníku {position, number} z {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: změněno {changed, "
      & "number}/{total, number}} other {{name}: změněno {changed, number}, "
      & "beze změny {unchanged, number}, celkem {total, number}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktuální barva popředí splňuje kontrast pro velký text při "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "aktuální barva popředí splňuje kontrast pro běžný text při "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "použijte {v1} k dosažení vylepšeného kontrastu textu {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "použijte {v1} k dosažení kontrastu pro velký text {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "použijte {v1} k dosažení kontrastu pro běžný text {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "použijte {v1} k dosažení kontrastu pro velký text {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "použijte {v1} k dosažení vylepšeného kontrastu textu {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktuální barva popředí splňuje kontrast pro velký text při {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "aktuální barva popředí splňuje kontrast pro běžný text při "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "aktuální barva popředí splňuje vylepšený kontrast textu při "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "aktuální barva popředí splňuje vylepšený kontrast textu při "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopie: nízké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopie: střední riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopie: střední riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsie: vysoké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (textil) delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, velký vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopie: střední riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatický vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsie: nízké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsie: barvy rozlišitelné, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsie: střední riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (textil) delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, znatelný vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopie: vysoké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopie: vysoké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (textil) delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, znatelný vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopie: nízké riziko záměny, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopie: nízké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, velký vjemový rozdíl");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopie: vysoké riziko záměny, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatický vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (textil) delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (textil) delta {v1, number}, znatelný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, sotva postřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (textil) delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, velký vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (textil) delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, nepostřehnutelný");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, jemný vjemový rozdíl");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, sotva postřehnutelný");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min mluvení");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min čtení");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "méně než {v1, number} min mluvení");
   P ("label.metrics.text_summary.less_than_n_minute_read", "méně než {v1, number} min čtení");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.text_summary.no_words", "žádná slova");
   P ("label.metrics.text_summary.no_paragraphs", "žádné odstavce");
   P ("label.metrics.text_summary.no_sentences", "žádné věty");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.names.hue_family_label.neutral", "neutrální");
   P ("label.names.saturation_label.neutral", "neutrální");
   P ("label.names.temperature_label.neutral_temperature", "neutrální teplota");
   P ("label.names.chroma_label.grayish", "našedlá");
   P ("label.names.nearest_color_name.black", "černá");
   P ("label.models.brightness_label.very_dark", "velmi tmavá");
   P ("label.names.hue_family_label.blue", "modrá");
   P ("label.names.saturation_label.vivid", "živá");
   P ("label.names.temperature_label.cool", "studená");
   P ("label.names.chroma_label.moderate_chroma", "střední pestrost");
   P ("label.names.nearest_color_name.navy", "námořnická modrá");
   P ("label.names.chroma_label.high_chroma", "vysoká pestrost");
   P ("label.names.nearest_color_name.blue", "modrá");
   P ("label.names.hue_family_label.green", "zelená");
   P ("label.names.temperature_label.balanced_temperature", "vyvážená teplota");
   P ("label.names.hue_family_label.cyan", "azurová");
   P ("label.names.chroma_label.soft", "jemná");
   P ("label.models.brightness_label.dark", "tmavá");
   P ("label.names.nearest_color_name.green", "zelená");
   P ("label.names.nearest_color_name.teal", "modrozelená");
   P ("label.models.brightness_label.medium_brightness", "střední jas");
   P ("label.names.nearest_color_name.aqua", "azurová");
   P ("label.names.nearest_color_name.lime", "limetková");
   P ("label.models.brightness_label.light", "světlá");
   P ("label.names.hue_family_label.red", "červená");
   P ("label.names.temperature_label.warm", "teplá");
   P ("label.names.hue_family_label.magenta", "purpurová");
   P ("label.names.hue_family_label.purple", "fialová");
   P ("label.names.hue_family_label.yellow", "žlutá");
   P ("label.names.saturation_label.muted", "tlumená");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "sytá");
   P ("label.names.nearest_color_name.maroon", "kaštanová");
   P ("label.names.nearest_color_name.purple", "fialová");
   P ("label.names.hue_family_label.orange", "oranžová");
   P ("label.names.nearest_color_name.olive", "olivová");
   P ("label.names.nearest_color_name.gray", "šedá");
   P ("label.names.saturation_label.desaturated", "nenasycená");
   P ("label.names.nearest_color_name.silver", "stříbrná");
   P ("label.names.chroma_label.pastel", "pastelová");
   P ("label.models.brightness_label.very_light", "velmi světlá");
   P ("label.names.nearest_color_name.fuchsia", "fuchsiová");
   P ("label.names.nearest_color_name.yellow", "žlutá");
   P ("label.names.nearest_color_name.red", "červená");
   P ("label.names.nearest_color_name.orange", "oranžová");
   P ("label.names.nearest_color_name.white", "bílá");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, nízký kontrast");
   P ("label.contrast.readability_label.low_readability", "nízká čitelnost");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nedostatečný, tmavý text na světlém pozadí");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, nízký kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nedostatečný, tmavý text na světlém pozadí");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsie: střední riziko záměny");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % – výrazný rozdíl");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, nízký kontrast po alfa kompozici");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nedostatečný, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nedostatečný, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopie: vysoké riziko záměny");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, kontrast pro velký text");
   P ("label.contrast.readability_label.readable_for_large_text_only", "čitelné jen pro velký text");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, velký text, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, kontrast pro velký text");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, velký text, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopie: vysoké riziko záměny");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast pro velký text po alfa kompozici");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, pouze netextové prvky, světlý text na tmavém "
      & "pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, pouze netextové prvky, světlý text na tmavém "
      & "pozadí");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopie: střední riziko záměny");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, nízký kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, nízký kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, pouze netextové prvky, tmavý text na světlém "
      & "pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, pouze netextové prvky, tmavý text na světlém "
      & "pozadí");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopie: střední riziko záměny");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopie: vysoké riziko záměny");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % – velmi odlišné");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsie: vysoké riziko záměny");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsie: nízké riziko záměny");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, nízký kontrast po alfa kompozici");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, kontrast pro běžný text");
   P ("label.contrast.readability_label.readable_for_normal_text", "čitelné pro běžný text");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, základní text, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, kontrast pro běžný text");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, základní text, světlý text na tmavém pozadí");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, velký text, tmavý text na světlém pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, velký text, tmavý text na světlém pozadí");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % – jemný rozdíl");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, základní text, tmavý text na světlém pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, základní text, tmavý text na světlém pozadí");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopie: nízké riziko záměny");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % – znatelný rozdíl");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number}, kontrast pro velký text");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, kontrast pro velký text");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopie: nízké riziko záměny");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, vylepšený kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "čitelné pro text s vylepšeným kontrastem");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, vylepšený kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, jemný vjemový rozdíl");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopie: barvy rozlišitelné");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast pro běžný text po alfa "
      & "kompozici");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopie: střední riziko záměny");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, kontrast pro běžný text po alfa kompozici");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, kontrast pro velký text po alfa kompozici");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, výborný, tmavý text na světlém pozadí");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, výborný, tmavý text na světlém pozadí");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast pro běžný text");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, kontrast pro běžný text");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, vylepšený kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, výborný, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, vylepšený kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, výborný, světlý text na tmavém pozadí");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopie: barvy rozlišitelné");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, vylepšený kontrast po alfa kompozici");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, sotva postřehnutelný");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % – téměř totožné");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopie: nízké riziko záměny");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsie: barvy rozlišitelné");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} barva} few {{v1, number} barvy} many "
      & "{{v1, number} barvy} other {{v1, number} barev}}");
   P ("label.palettes.palette_summary.mostly_gray", "převážně šedá");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "střední rozptyl kontrastu");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "pozadí {v1}, text {v2}, akcent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadická paleta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "nejlepší kontrast: {v1} na {v2} při {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} z {v2, plural, one {1 páru} other {{v2, number} párů}} "
      & "splňuje kontrast pro běžný text");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "vylepšený {v1, number}, běžný {v2, number}, jen velký text {v3, "
      & "number}, nevyhovuje {v4, number} (z {v5, plural, one {1 páru} other "
      & "{{v5, number} párů}})");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {{v1, number} barva} few {{v1, number} barvy} many "
      & "{{v1, number} barvy} other {{v1, number} barev}}, {v2, plural, one "
      & "{{v2, number} pár} few {{v2, number} páry} many {{v2, number} páru} "
      & "other {{v2, number} párů}}: vylepšený {v3, number}, běžný {v4, "
      & "number}, jen velký text {v5, number}, nevyhovuje {v6, number}");
   P ("label.palettes.palette_mood_label.balanced", "vyvážená");
   P ("label.palettes.palette_mood_label.vibrant", "živá");
   P ("label.palettes.palette_mood_label.warm_mood", "teplá nálada");
   P ("label.palettes.palette_summary.mostly_blue", "převážně modrá");
   P ("label.palettes.palette_summary.low_contrast_spread", "nízký rozptyl kontrastu");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paleta s jedním akcentem");
   P ("label.palettes.palette_mood_label.dark", "tmavá");
   P ("label.palettes.palette_mood_label.cool_mood", "chladná nálada");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "převážně rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "žádné přístupné textové páry");
   P ("label.palettes.palette_mood_label.subtle", "jemná");
   P ("label.palettes.palette_summary.high_contrast_spread", "vysoký rozptyl kontrastu");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "nejlepší kontrast: {v1} na {v2} při {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutrální nálada");
   P ("label.palettes.palette_summary.mostly_purple", "převážně fialová");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementární paleta");
   P ("label.palettes.palette_summary.mostly_green", "převážně zelená");
   P ("label.palettes.palette_mood_label.moderate", "umírněná");
   P ("label.palettes.palette_summary.mostly_silver", "převážně stříbrná");
   P ("label.palettes.palette_harmony_label.varied_palette", "různorodá paleta");
   P ("label.palettes.palette_summary.mostly_olive", "převážně olivová");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analogická paleta");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} z {v2, plural, one {1 páru} other {{v2, number} párů}} "
      & "splňuje kontrast jen pro velký text");
   P ("label.palettes.palette_mood_label.light", "světlá");
   P ("label.palettes.palette_summary.mostly_teal", "převážně modrozelená");
   P ("label.palettes.palette_summary.mostly_aqua", "převážně azurová");
   P ("label.palettes.palette_summary.mostly_lime", "převážně limetková");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochromatická paleta");
   P ("label.palettes.palette_summary.mostly_black", "převážně černá");
   P ("label.palettes.palette_summary.mostly_yellow", "převážně žlutá");
   P ("label.palettes.palette_summary.mostly_maroon", "převážně kaštanová");
   P ("label.palettes.palette_summary.mostly_white", "převážně bílá");
   P ("label.palettes.palette_summary.mostly_orange", "převážně oranžová");
   P ("label.palettes.palette_summary.mostly_fuchsia", "převážně fuchsiová");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutrální paleta");
   P ("label.palettes.palette_summary.mostly_red", "převážně červená");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min čtení");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min mluvení");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} slovo} few {{v1, number} slova} many "
      & "{{v1, number} slova} other {{v1, number} slov}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} věta} few {{v1, number} věty} many "
      & "{{v1, number} věty} other {{v1, number} vět}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min čtení");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "méně než {v1, number} min čtení");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "méně než {v1, number} min mluvení");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} odstavec} few {{v1, number} odstavce} "
      & "many {{v1, number} odstavce} other {{v1, number} odstavců}}");
end Labels_3;
