separate (Humanize.Catalogs.Phrase_Data.Locale_Lt)
procedure Labels_3 is
begin
   P ("label.statistics.distribution_summary_label",
      "{count, plural, =0 {stebėjimų nėra} one {{count, number} "
      & "stebėjimas, min. {minimum} {unit}, mediana {median} {unit}, maks. "
      & "{maximum} {unit}} few {{count, number} stebėjimai, min. {minimum} "
      & "{unit}, mediana {median} {unit}, maks. {maximum} {unit}} many {{count, "
      & "number} stebėjimo, min. {minimum} {unit}, mediana {median} {unit}, "
      & "maks. {maximum} {unit}} other {{count, number} stebėjimų, min. "
      & "{minimum} {unit}, mediana {median} {unit}, maks. {maximum} {unit}}}");
   P ("label.statistics.percentile_summary_label", "p50 {p50} {unit}, p95 {p95} {unit}, p99 {p99} {unit}");
   P ("label.statistics.outlier_summary_label",
      "{outliers, plural, =0 {{total, plural, =0 {stebėjimų nėra} other {0 "
      & "išskirčių iš {total, plural, one {{total, number} stebėjimo} few "
      & "{{total, number} stebėjimų} many {{total, number} stebėjimo} other "
      & "{{total, number} stebėjimų}}}}} one {{outliers, number} išskirtis "
      & "iš {total, plural, one {{total, number} stebėjimo} few {{total, "
      & "number} stebėjimų} many {{total, number} stebėjimo} other {{total, "
      & "number} stebėjimų}}} few {{outliers, number} išskirtys iš {total, "
      & "plural, one {{total, number} stebėjimo} few {{total, number} "
      & "stebėjimų} many {{total, number} stebėjimo} other {{total, number} "
      & "stebėjimų}}} many {{outliers, number} išskirties iš {total, "
      & "plural, one {{total, number} stebėjimo} few {{total, number} "
      & "stebėjimų} many {{total, number} stebėjimo} other {{total, number} "
      & "stebėjimų}}} other {{outliers, number} išskirčių iš {total, "
      & "plural, one {{total, number} stebėjimo} few {{total, number} "
      & "stebėjimų} many {{total, number} stebėjimo} other {{total, number} "
      & "stebėjimų}}}}");
   P ("label.resources.remaining_label",
      "{state, select, over {talpa viršyta: {count, number} {unit}} other "
      & "{liko {count, number} iš {total, number} {unit}}}");
   P ("label.resources.quota_label",
      "{state, select, exceeded {kvota viršyta {count, number} {unit} "
      & "(panaudota {percent})} near {kvota beveik išnaudota: liko {count, "
      & "number} {unit} (panaudota {percent})} other {kvota prieinama: liko "
      & "{count, number} {unit} (panaudota {percent})}}");
   P ("label.resources.cache_hit_rate_label",
      "{state, select, none {podėlio pataikymų dalis neprieinama: "
      & "užklausų nėra} other {podėlio pataikymų dalis {percent}: "
      & "pataikymų {hits, number}, praleidimų {misses, number}}}");
   P ("label.markup.attribute_count_label.total",
      "{count, plural, one {{count, number} atributas} few {{count, number} "
      & "atributai} many {{count, number} atributo} other {{count, number} "
      & "atributų}}");
   P ("label.markup.attribute_count_label.data",
      "{count, plural, one {{count, number} data atributas} few {{count, "
      & "number} data atributai} many {{count, number} data atributo} other "
      & "{{count, number} data atributų}}");
   P ("label.markup.attribute_count_label.aria",
      "{count, plural, one {{count, number} ARIA atributas} few {{count, "
      & "number} ARIA atributai} many {{count, number} ARIA atributo} other "
      & "{{count, number} ARIA atributų}}");
   P ("label.markup.attribute_count_label.events",
      "{count, plural, one {{count, number} įvykių doroklė} few {{count, "
      & "number} įvykių doroklės} many {{count, number} įvykių doroklės} "
      & "other {{count, number} įvykių doroklių}}");
   P ("label.markup.heading_label", "{level, number} lygio antraštė");
   P ("label.markup.tag_count_label.total",
      "{count, plural, one {{count, number} žymė} few {{count, number} "
      & "žymės} many {{count, number} žymės} other {{count, number} "
      & "žymių}}");
   P ("label.markup.tag_count_label.links",
      "{count, plural, one {{count, number} nuoroda} few {{count, number} "
      & "nuorodos} many {{count, number} nuorodos} other {{count, number} "
      & "nuorodų}}");
   P ("label.markup.tag_count_label.media",
      "{count, plural, one {{count, number} medijos elementas} few {{count, "
      & "number} medijos elementai} many {{count, number} medijos elemento} "
      & "other {{count, number} medijos elementų}}");
   P ("label.markup.tag_count_label.forms",
      "{count, plural, one {{count, number} formos valdiklis} few {{count, "
      & "number} formos valdikliai} many {{count, number} formos valdiklio} "
      & "other {{count, number} formos valdiklių}}");
   P ("label.markup.document_outline_label.headings",
      "{count, plural, one {{count, number} antraštė} few {{count, number} "
      & "antraštės} many {{count, number} antraštės} other {{count, number} "
      & "antraščių}}");
   P ("label.markup.document_outline_label.landmarks",
      "{count, plural, one {{count, number} orientyras} few {{count, number} "
      & "orientyrai} many {{count, number} orientyro} other {{count, number} "
      & "orientyrų}}");
   P ("label.markup.document_outline_label.forms",
      "{count, plural, one {{count, number} forma} few {{count, number} "
      & "formos} many {{count, number} formos} other {{count, number} formų}}");
   P ("label.markup.document_outline_label.media",
      "{count, plural, one {{count, number} medijos elementas} few {{count, "
      & "number} medijos elementai} many {{count, number} medijos elemento} "
      & "other {{count, number} medijos elementų}}");
   P ("label.markup.table_navigation_label",
      "{caption}, eilutė {row, number} iš {rows, number}, stulpelis "
      & "{column, number} iš {columns, number}");
   P ("label.secrets.secret_count_label.total",
      "{count, plural, one {{count, number} paslaptis} few {{count, number} "
      & "paslaptys} many {{count, number} paslapties} other {{count, number} "
      & "paslapčių}}");
   P ("label.secrets.secret_count_label.masked", "užmaskuota: {count, number}");
   P ("label.secrets.secret_count_label.unset", "nenustatyta: {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {{count, number} kontrolinis kodas} few {{count, "
      & "number} kontroliniai kodai} many {{count, number} kontrolinio kodo} "
      & "other {{count, number} kontrolinių kodų}}");
   P ("label.schema.type_mismatch_label",
      "laukas {field_name}: tikėtasi {expected, select, string_field "
      & "{eilutė} integer_field {sveikasis skaičius} decimal_field "
      & "{dešimtainis skaičius} boolean_field {loginė reikšmė} date_field "
      & "{data} date_time_field {data ir laikas} object_field {objektas} "
      & "array_field {masyvas} enum_field {išvardijimas} binary_field "
      & "{dvejetainiai duomenys} null_field {null} any_field {bet koks tipas} "
      & "other {nežinomas tipas}}, gauta {actual, select, string_field "
      & "{eilutė} integer_field {sveikasis skaičius} decimal_field "
      & "{dešimtainis skaičius} boolean_field {loginė reikšmė} date_field "
      & "{data} date_time_field {data ir laikas} object_field {objektas} "
      & "array_field {masyvas} enum_field {išvardijimas} binary_field "
      & "{dvejetainiai duomenys} null_field {null} any_field {bet koks tipas} "
      & "other {nežinomas tipas}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {{blocking, "
      & "number} blokuojanti problema} few {{blocking, number} blokuojančios "
      & "problemos} many {{blocking, number} blokuojančios problemos} other "
      & "{{blocking, number} blokuojančių problemų}}} blocking {{base}, "
      & "{blocking, plural, one {{blocking, number} blokuojanti problema} few "
      & "{{blocking, number} blokuojančios problemos} many {{blocking, number} "
      & "blokuojančios problemos} other {{blocking, number} blokuojančių "
      & "problemų}}} only {tik {base}} other {{base}}}");
   P ("label.thresholds.metric_value_label", "{name}: {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {tikslinis intervalas nuo {low} "
      & "iki {high}} other {tikslinis langas nuo {low} iki {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} numatytame intervale} below {{value} "
      & "žemiau numatyto intervalo} other {{value} virš numatyto intervalo}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} ties kritiniu slenksčiu} warning "
      & "{{value} ties įspėjimo slenksčiu} other {{value} normos ribose}}");
   P ("label.thresholds.breach_label", "{state, select, ok {neviršyta} other {viršyta {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {ties tikslu} below {{difference} žemiau tikslo} "
      & "other {{difference} virš tikslo}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {riba viršyta} near {arti ribos, liko "
      & "{distance}} other {{distance} iki ribos}}");
   P ("label.thresholds.threshold_summary_label.none", "metrikų nėra");
   P ("label.thresholds.threshold_summary_label.normal", "normalu: {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {{count, number} įspėjimas} few {{count, number} "
      & "įspėjimai} many {{count, number} įspėjimo} other {{count, number} "
      & "įspėjimų}}");
   P ("label.thresholds.threshold_summary_label.critical", "kritiška: {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {{count, number} viršijimas} few {{count, number} "
      & "viršijimai} many {{count, number} viršijimo} other {{count, number} "
      & "viršijimų}}");
   P ("label.thresholds.target_window_label", "tikslas {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "leistinas nuokrypis {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} ribos");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {riba viršyta {amount}} other {liko "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "panaudota {used} iš {budget}");
   P ("label.workflows.step_label", "žingsnis {current, number} iš {total, number}: {name}");
   P ("label.workflows.milestone_label", "užbaigta etapų: {current, number} iš {total, number} ({name})");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {darbo eigos elementų nėra} half {darbo eiga "
      & "įpusėta} other {užbaigta {completed, number} iš {total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {vieta eilėje {position, number}} other {vieta "
      & "eilėje {position, number} iš {total, number}}}");
   P ("label.changes.change_set_label.none", "pakeitimų nėra");
   P ("label.changes.change_set_label.added", "pridėta: {count, number}");
   P ("label.changes.change_set_label.removed", "pašalinta: {count, number}");
   P ("label.changes.change_set_label.modified", "pakeista: {count, number}");
   P ("label.changes.change_set_label.unchanged", "nepakeista: {count, number}");
   P ("label.changes.sync_change_label.none", "sinchronizavimo pakeitimų nėra");
   P ("label.changes.sync_change_label.uploaded", "įkelta: {count, number}");
   P ("label.changes.sync_change_label.downloaded", "atsisiųsta: {count, number}");
   P ("label.changes.sync_change_label.deleted", "ištrinta: {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} konfliktas} few {{count, number} "
      & "konfliktai} many {{count, number} konflikto} other {{count, number} "
      & "konfliktų}}");
   P ("label.changes.net_change_label",
      "{state, select, none {grynojo pokyčio nėra} up {iš viso +{count, "
      & "plural, one {{count, number} elementas} few {{count, number} "
      & "elementai} many {{count, number} elemento} other {{count, number} "
      & "elementų}}} other {iš viso -{count, plural, one {{count, number} "
      & "elementas} few {{count, number} elementai} many {{count, number} "
      & "elemento} other {{count, number} elementų}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {nėra pakeitimų peržiūrai} all {visi "
      & "pakeitimai peržiūrėti} other {peržiūrėta pakeitimų: {reviewed, "
      & "number} iš {total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: nepakito, {new_value}} up "
      & "{{field_name}: padidėjo nuo {old_value} iki {new_value}} other "
      & "{{field_name}: sumažėjo nuo {old_value} iki {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {nėra pasirenkamų eilučių} none {eilutės "
      & "nepasirinktos} all {pasirinktos visos eilutės ({total, number})} "
      & "other {pasirinkta eilučių: {selected, number} iš {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {puslapių nėra} other {{pages, plural, =0 "
      & "{puslapių nėra} other {{rows, plural, =0 {puslapis {page, number} "
      & "iš {pages, number}} one {puslapis {page, number} iš {pages, number}, "
      & "{rows, number} eilutė} few {puslapis {page, number} iš {pages, "
      & "number}, {rows, number} eilutės} many {puslapis {page, number} iš "
      & "{pages, number}, {rows, number} eilutės} other {puslapis {page, "
      & "number} iš {pages, number}, {rows, number} eilučių}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {eilučių nėra} none {atitinkančių "
      & "eilučių nėra} all {rodomos visos eilutės ({total, number})} other "
      & "{rodoma eilučių: {visible, number} iš {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {eilučių nėra} single {eilutė {first_row, "
      & "number} iš {total, number}} other {eilutės {first_row, "
      & "number}–{last_row, number} iš {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {be simbolių ribos} none_left {simbolių "
      & "neliko} left {liko simbolių: {count, number}} other {virš ribos "
      & "simbolių: {count, number}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {privalomų laukų nėra} =1 {{missing, plural, =0 "
      & "{visi privalomi laukai užpildyti} other {neužpildytas privalomas "
      & "laukas (1 iš 1)}}} other {{missing, plural, =0 {visi privalomi laukai "
      & "užpildyti} other {neužpildyta privalomų laukų: {missing, number} "
      & "iš {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {laukų nėra} all {visi laukai užpildyti} other "
      & "{užpildyta laukų: {completed, number} iš {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: laukų nėra} all {{name}: visi laukai "
      & "užpildyti} other {{name}: užpildyta laukų: {completed, number} iš "
      & "{total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {formos žingsnių nėra} =1 {žingsnis 1 iš 1: "
      & "{name}} other {žingsnis {current, number} iš {total, number}: "
      & "{name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {naršymo kelio nėra} =1 {naršymo kelio elementas "
      & "1 iš 1: {name}} other {naršymo kelio elementas {current, number} iš "
      & "{total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {skirtukų nėra} =1 {skirtukas 1 iš 1: {name}} "
      & "other {skirtukas {current, number} iš {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {gautieji tušti} =1 {{unread, plural, =0 {visi "
      & "pranešimai perskaityti} other {neperskaitytų: 1 iš 1}}} other "
      & "{{unread, plural, =0 {visi pranešimai perskaityti} other "
      & "{neperskaitytų: {unread, number} iš {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label",
      "pristatymo bandymas {attempt, number} iš {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {kontrolinio sąrašo punktų nėra} =1 {{done, "
      & "plural, =0 {atlikta punktų: 0 iš 1} other {atlikta punktų: 1 iš "
      & "1}}} other {atlikta punktų: {done, number} iš {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {įkėlimų nėra} =1 {{done, plural, =0 {užbaigta "
      & "įkėlimų: 0 iš 1} other {užbaigta įkėlimų: 1 iš 1}}} other "
      & "{užbaigta įkėlimų: {done, number} iš {total, number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {vietų nėra} =1 {{reserved, plural, =0 "
      & "{rezervuota vietų: 0 iš 1} other {rezervuota vietų: 1 iš 1}}} "
      & "other {rezervuota vietų: {reserved, number} iš {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {vieta laukiančiųjų sąraše {position, number}} "
      & "other {vieta laukiančiųjų sąraše {position, number} iš {total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: pakeista {changed, "
      & "number}/{total, number}} other {{name}: pakeista {changed, number}, "
      & "nepakeista {unchanged, number}, iš viso {total, number}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "dabartinė priekinio plano spalva atitinka didelio teksto kontrastą "
      & "({v1}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "dabartinė priekinio plano spalva atitinka įprasto teksto kontrastą "
      & "({v1}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "naudokite {v1}: padidintas teksto kontrastas {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "naudokite {v1}: didelio teksto kontrastas {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "naudokite {v1}: įprasto teksto kontrastas {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "naudokite {v1}: didelio teksto kontrastas {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "naudokite {v1}: padidintas teksto kontrastas {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "dabartinė priekinio plano spalva atitinka didelio teksto kontrastą "
      & "({v1, number}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "dabartinė priekinio plano spalva atitinka įprasto teksto kontrastą "
      & "({v1, number}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "dabartinė priekinio plano spalva atitinka padidintą teksto "
      & "kontrastą ({v1}:{v2, number})");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "dabartinė priekinio plano spalva atitinka padidintą teksto "
      & "kontrastą ({v1, number}:{v2, number})");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopija: maža spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopija: vidutinė spalvų supainiojimo rizika, delta {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopija: vidutinė spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsija: didelė spalvų supainiojimo rizika, delta {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76, delta {v1}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94, delta {v1}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (tekstilė), delta {v1}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000, delta {v1, number}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab, delta {v1}, didelis vizualus skirtumas");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopija: vidutinė spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94, delta {v1, number}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000, delta {v1}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab, delta {v1}, drastiškas vizualus skirtumas");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsija: maža spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopija: spalvos atskiriamos, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopija: spalvos atskiriamos, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopija: spalvos atskiriamos, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsija: spalvos atskiriamos, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsija: vidutinė spalvų supainiojimo rizika, delta {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76, delta {v1}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94, delta {v1}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (tekstilė), delta {v1}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000, delta {v1}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab, delta {v1}, pastebimas vizualus skirtumas");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopija: didelė spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopija: didelė spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94, delta {v1}, pastebimas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (tekstilė), delta {v1}, pastebimas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000, delta {v1}, pastebimas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab, delta {v1, number}, pastebimas vizualus skirtumas");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopija: maža spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopija: maža spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab, delta {v1, number}, didelis vizualus skirtumas");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopija: didelė spalvų supainiojimo rizika, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76, delta {v1, number}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (tekstilė), delta {v1, number}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab, delta {v1, number}, drastiškas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76, delta {v1, number}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (tekstilė), delta {v1, number}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000, delta {v1, number}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76, delta {v1}, pastebimas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (tekstilė), delta {v1}, subtilus vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000, delta {v1, number}, pastebimas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (tekstilė), delta {v1, number}, pastebimas vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76, delta {v1}, vos pastebima");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94, delta {v1}, nepastebima");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (tekstilė), delta {v1}, nepastebima");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000, delta {v1}, nepastebima");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab, delta {v1}, nepastebima");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94, delta {v1, number}, didelis vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76, delta {v1, number}, nepastebima");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94, delta {v1, number}, nepastebima");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (tekstilė), delta {v1, number}, nepastebima");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000, delta {v1, number}, nepastebima");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab, delta {v1, number}, nepastebima");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab, delta {v1}, subtilus vizualus skirtumas");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94, delta {v1}, subtilus vizualus skirtumas");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000, delta {v1}, subtilus vizualus skirtumas");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab, delta {v1}, vos pastebima");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} žodis} few {{v1, number} žodžiai} "
      & "many {{v1, number} žodžio} other {{v1, number} žodžių}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} pastraipa} few {{v1, number} "
      & "pastraipos} many {{v1, number} pastraipos} other {{v1, number} "
      & "pastraipų}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min. kalbėjimo");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} sakinys} few {{v1, number} sakiniai} "
      & "many {{v1, number} sakinio} other {{v1, number} sakinių}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min. skaitymo");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} pastraipa} few {{v1, number} "
      & "pastraipos} many {{v1, number} pastraipos} other {{v1, number} "
      & "pastraipų}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "mažiau nei {v1, number} min. kalbėjimo");
   P ("label.metrics.text_summary.less_than_n_minute_read", "mažiau nei {v1, number} min. skaitymo");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} sakinys} few {{v1, number} sakiniai} "
      & "many {{v1, number} sakinio} other {{v1, number} sakinių}}");
   P ("label.metrics.text_summary.no_words", "žodžių nėra");
   P ("label.metrics.text_summary.no_paragraphs", "pastraipų nėra");
   P ("label.metrics.text_summary.no_sentences", "sakinių nėra");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} žodis} few {{v1, number} žodžiai} "
      & "many {{v1, number} žodžio} other {{v1, number} žodžių}}");
   P ("label.names.hue_family_label.neutral", "neutrali");
   P ("label.names.saturation_label.neutral", "neutrali");
   P ("label.names.temperature_label.neutral_temperature", "neutrali temperatūra");
   P ("label.names.chroma_label.grayish", "pilkšva");
   P ("label.names.nearest_color_name.black", "juoda");
   P ("label.models.brightness_label.very_dark", "labai tamsi");
   P ("label.names.hue_family_label.blue", "mėlyna");
   P ("label.names.saturation_label.vivid", "ryški");
   P ("label.names.temperature_label.cool", "šalta");
   P ("label.names.chroma_label.moderate_chroma", "vidutinis chromatiškumas");
   P ("label.names.nearest_color_name.navy", "tamsiai mėlyna");
   P ("label.names.chroma_label.high_chroma", "didelis chromatiškumas");
   P ("label.names.nearest_color_name.blue", "mėlyna");
   P ("label.names.hue_family_label.green", "žalia");
   P ("label.names.temperature_label.balanced_temperature", "subalansuota temperatūra");
   P ("label.names.hue_family_label.cyan", "žydra");
   P ("label.names.chroma_label.soft", "švelni");
   P ("label.models.brightness_label.dark", "tamsi");
   P ("label.names.nearest_color_name.green", "žalia");
   P ("label.names.nearest_color_name.teal", "žalsvai mėlyna");
   P ("label.models.brightness_label.medium_brightness", "vidutinis šviesumas");
   P ("label.names.nearest_color_name.aqua", "žydra");
   P ("label.names.nearest_color_name.lime", "salotinė");
   P ("label.models.brightness_label.light", "šviesi");
   P ("label.names.hue_family_label.red", "raudona");
   P ("label.names.temperature_label.warm", "šilta");
   P ("label.names.hue_family_label.magenta", "purpurinė");
   P ("label.names.hue_family_label.purple", "violetinė");
   P ("label.names.hue_family_label.yellow", "geltona");
   P ("label.names.saturation_label.muted", "prislopinta");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "sodri");
   P ("label.names.nearest_color_name.maroon", "kaštoninė");
   P ("label.names.nearest_color_name.purple", "violetinė");
   P ("label.names.hue_family_label.orange", "oranžinė");
   P ("label.names.nearest_color_name.olive", "alyvuogių");
   P ("label.names.nearest_color_name.gray", "pilka");
   P ("label.names.saturation_label.desaturated", "išblukusi");
   P ("label.names.nearest_color_name.silver", "sidabrinė");
   P ("label.names.chroma_label.pastel", "pastelinė");
   P ("label.models.brightness_label.very_light", "labai šviesi");
   P ("label.names.nearest_color_name.fuchsia", "fuksija");
   P ("label.names.nearest_color_name.yellow", "geltona");
   P ("label.names.nearest_color_name.red", "raudona");
   P ("label.names.nearest_color_name.orange", "oranžinė");
   P ("label.names.nearest_color_name.white", "balta");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, mažas kontrastas");
   P ("label.contrast.readability_label.low_readability", "mažas skaitomumas");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nepakankama, tamsus tekstas šviesiame fone");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, mažas kontrastas");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nepakankama, tamsus tekstas šviesiame fone");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsija: vidutinė spalvų supainiojimo rizika");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} %, stiprus skirtumas");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, mažas kontrastas po alfa maišymo");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nepakankama, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nepakankama, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopija: didelė spalvų supainiojimo rizika");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, didelio teksto kontrastas");
   P ("label.contrast.readability_label.readable_for_large_text_only", "skaitoma tik dideliam tekstui");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, didelis tekstas, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, didelio teksto kontrastas");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, didelis tekstas, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopija: didelė spalvų supainiojimo rizika");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, didelio teksto kontrastas po alfa maišymo");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, tik ne teksto elementai, šviesus tekstas tamsiame "
      & "fone");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, tik ne teksto elementai, šviesus tekstas tamsiame "
      & "fone");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopija: vidutinė spalvų supainiojimo rizika");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, mažas kontrastas");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, mažas kontrastas");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, tik ne teksto elementai, tamsus tekstas šviesiame "
      & "fone");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, tik ne teksto elementai, tamsus tekstas šviesiame "
      & "fone");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopija: vidutinė spalvų supainiojimo rizika");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopija: didelė spalvų supainiojimo rizika");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} %, labai skirtingos");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsija: didelė spalvų supainiojimo rizika");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsija: maža spalvų supainiojimo rizika");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, mažas kontrastas po alfa maišymo");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, įprasto teksto kontrastas");
   P ("label.contrast.readability_label.readable_for_normal_text", "skaitoma įprastam tekstui");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, pagrindinis tekstas, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, įprasto teksto kontrastas");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, pagrindinis tekstas, šviesus tekstas tamsiame fone");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, didelis tekstas, tamsus tekstas šviesiame fone");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, didelis tekstas, tamsus tekstas šviesiame fone");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} %, subtilus skirtumas");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, pagrindinis tekstas, tamsus tekstas šviesiame fone");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, pagrindinis tekstas, tamsus tekstas šviesiame fone");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopija: maža spalvų supainiojimo rizika");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} %, pastebimas skirtumas");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, didelio teksto kontrastas");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, didelio teksto kontrastas");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopija: maža spalvų supainiojimo rizika");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, padidintas kontrastas");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "skaitoma padidinto kontrasto tekstui");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, padidintas kontrastas");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab, delta {v1, number}, subtilus vizualus skirtumas");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopija: spalvos atskiriamos");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, įprasto teksto kontrastas po alfa maišymo");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopija: vidutinė spalvų supainiojimo rizika");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, įprasto teksto kontrastas po alfa maišymo");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, didelio teksto kontrastas po alfa maišymo");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, puiku, tamsus tekstas šviesiame fone");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, puiku, tamsus tekstas šviesiame fone");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, įprasto teksto kontrastas");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, įprasto teksto kontrastas");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, padidintas kontrastas");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, puiku, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, padidintas kontrastas");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, puiku, šviesus tekstas tamsiame fone");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopija: spalvos atskiriamos");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, padidintas kontrastas po alfa maišymo");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab, delta {v1, number}, vos pastebima");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} %, beveik identiškos");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopija: maža spalvų supainiojimo rizika");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsija: spalvos atskiriamos");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} spalva} few {{v1, number} spalvos} many "
      & "{{v1, number} spalvos} other {{v1, number} spalvų}}");
   P ("label.palettes.palette_summary.mostly_gray", "daugiausia pilka");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "vidutinė kontrasto sklaida");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "fonas {v1}, tekstas {v2}, akcentas {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadinė paletė");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "geriausias kontrastas: {v1} ant {v2}, {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "poros su įprasto teksto kontrastu: {v1, number} iš {v2, number}");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "padidintas: {v1, number}, įprastas: {v2, number}, tik didelis "
      & "tekstas: {v3, number}, neatitinka: {v4, number}, iš viso porų: {v5, "
      & "number}");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "spalvų: {v1, number}, porų: {v2, number} (padidintas: {v3, number}, "
      & "įprastas: {v4, number}, tik didelis tekstas: {v5, number}, "
      & "neatitinka: {v6, number})");
   P ("label.palettes.palette_mood_label.balanced", "subalansuota");
   P ("label.palettes.palette_mood_label.vibrant", "gyvybinga");
   P ("label.palettes.palette_mood_label.warm_mood", "šilta nuotaika");
   P ("label.palettes.palette_summary.mostly_blue", "daugiausia mėlyna");
   P ("label.palettes.palette_summary.low_contrast_spread", "maža kontrasto sklaida");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "vieno akcento paletė");
   P ("label.palettes.palette_mood_label.dark", "tamsi");
   P ("label.palettes.palette_mood_label.cool_mood", "šalta nuotaika");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "daugiausia rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "prieinamų teksto porų nėra");
   P ("label.palettes.palette_mood_label.subtle", "santūri");
   P ("label.palettes.palette_summary.high_contrast_spread", "didelė kontrasto sklaida");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "geriausias kontrastas: {v1} ant {v2}, {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutrali nuotaika");
   P ("label.palettes.palette_summary.mostly_purple", "daugiausia violetinė");
   P ("label.palettes.palette_harmony_label.complementary_palette", "papildomųjų spalvų paletė");
   P ("label.palettes.palette_summary.mostly_green", "daugiausia žalia");
   P ("label.palettes.palette_mood_label.moderate", "nuosaiki");
   P ("label.palettes.palette_summary.mostly_silver", "daugiausia sidabrinė");
   P ("label.palettes.palette_harmony_label.varied_palette", "įvairi paletė");
   P ("label.palettes.palette_summary.mostly_olive", "daugiausia alyvuogių");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analoginė paletė");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "poros tik dideliam tekstui: {v1, number} iš {v2, number}");
   P ("label.palettes.palette_mood_label.light", "šviesi");
   P ("label.palettes.palette_summary.mostly_teal", "daugiausia žalsvai mėlyna");
   P ("label.palettes.palette_summary.mostly_aqua", "daugiausia žydra");
   P ("label.palettes.palette_summary.mostly_lime", "daugiausia salotinė");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochrominė paletė");
   P ("label.palettes.palette_summary.mostly_black", "daugiausia juoda");
   P ("label.palettes.palette_summary.mostly_yellow", "daugiausia geltona");
   P ("label.palettes.palette_summary.mostly_maroon", "daugiausia kaštoninė");
   P ("label.palettes.palette_summary.mostly_white", "daugiausia balta");
   P ("label.palettes.palette_summary.mostly_orange", "daugiausia oranžinė");
   P ("label.palettes.palette_summary.mostly_fuchsia", "daugiausia fuksija");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutrali paletė");
   P ("label.palettes.palette_summary.mostly_red", "daugiausia raudona");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} žodis} few {{v1, number} žodžiai} "
      & "many {{v1, number} žodžio} other {{v1, number} žodžių}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} sakinys} few {{v1, number} sakiniai} "
      & "many {{v1, number} sakinio} other {{v1, number} sakinių}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} pastraipa} few {{v1, number} "
      & "pastraipos} many {{v1, number} pastraipos} other {{v1, number} "
      & "pastraipų}}");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min. skaitymo");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min. kalbėjimo");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} žodis} few {{v1, number} žodžiai} "
      & "many {{v1, number} žodžio} other {{v1, number} žodžių}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} sakinys} few {{v1, number} sakiniai} "
      & "many {{v1, number} sakinio} other {{v1, number} sakinių}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} pastraipa} few {{v1, number} "
      & "pastraipos} many {{v1, number} pastraipos} other {{v1, number} "
      & "pastraipų}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min. skaitymo");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} pastraipa} few {{v1, number} "
      & "pastraipos} many {{v1, number} pastraipos} other {{v1, number} "
      & "pastraipų}}");
end Labels_3;
