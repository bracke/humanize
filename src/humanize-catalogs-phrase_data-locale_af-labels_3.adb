separate (Humanize.Catalogs.Phrase_Data.Locale_Af)
procedure Labels_3 is
begin
   P ("label.schema.type_mismatch_label",
      "veld {field_name}: {expected, select, string_field {string} "
      & "integer_field {heelgetal} decimal_field {desimaal} boolean_field "
      & "{Boolese waarde} date_field {datum} date_time_field {datum-tyd} "
      & "object_field {objek} array_field {skikking} enum_field {enum} "
      & "binary_field {binêr} null_field {nul} any_field {enige} other "
      & "{onbekend}} verwag, {actual, select, string_field {string} "
      & "integer_field {heelgetal} decimal_field {desimaal} boolean_field "
      & "{Boolese waarde} date_field {datum} date_time_field {datum-tyd} "
      & "object_field {objek} array_field {skikking} enum_field {enum} "
      & "binary_field {binêr} null_field {nul} any_field {enige} other "
      & "{onbekend}} ontvang");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 blokkerende "
      & "probleem} other {{blocking, number} blokkerende probleme}}} blocking "
      & "{{base}, {blocking, plural, one {1 blokkerende probleem} other "
      & "{{blocking, number} blokkerende probleme}}} only {slegs {base}} other "
      & "{{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "geen kontroles uitgevoer nie");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} geslaag");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} misluk");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 waarskuwing} other {{count, number} "
      & "waarskuwings}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} oorgeslaan");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} hangend");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {teikenomvang {low} tot en met "
      & "{high}} other {teikenvenster {low} tot {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} binne verwagte omvang} below {{value} "
      & "onder verwagte omvang} other {{value} bo verwagte omvang}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} op kritieke drempel} warning "
      & "{{value} op waarskuwingsdrempel} other {{value} binne normale omvang}}");
   P ("label.thresholds.breach_label", "{state, select, ok {nie oorskry nie} other {oorskry met {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {op teiken} below {{difference} onder teiken} other "
      & "{{difference} bo teiken}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limiet oorskry} near {naby limiet, "
      & "{distance} oor} other {{distance} van limiet}}");
   P ("label.thresholds.threshold_summary_label.none", "geen maatstawwe nie");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normaal");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 waarskuwing} other {{count, number} "
      & "waarskuwings}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} kritiek");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 oorskryding} other {{count, number} "
      & "oorskrydings}}");
   P ("label.thresholds.target_window_label", "teiken {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "toleransie {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} van limiet");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limiet oorskry met {amount}} other {{amount} "
      & "oor}}");
   P ("label.thresholds.budget_used_label", "{used} van {budget} gebruik");
   P ("label.workflows.step_label", "stap {current, number} van {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} van {total, number} mylpale bereik: {name}");
   P ("label.workflows.workflow_summary_label.total", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.workflows.workflow_summary_label.completed", "{count, number} voltooi");
   P ("label.workflows.workflow_summary_label.active", "{count, number} aktief");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} geblokkeer");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} misluk");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} oorgeslaan");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {geen werkvloei-items nie} half {halfpad deur "
      & "werkvloei} other {{completed, number} van {total, number} voltooi}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {posisie {position, number} in tou} other {posisie "
      & "{position, number} van {total, number} in tou}}");
   P ("label.changes.change_set_label.none", "geen wysigings nie");
   P ("label.changes.change_set_label.added", "{count, number} bygevoeg");
   P ("label.changes.change_set_label.removed", "{count, number} verwyder");
   P ("label.changes.change_set_label.modified", "{count, number} gewysig");
   P ("label.changes.change_set_label.unchanged", "{count, number} onveranderd");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.changes.change_summary_label.added", "{count, number} bygevoeg");
   P ("label.changes.change_summary_label.removed", "{count, number} verwyder");
   P ("label.changes.change_summary_label.modified", "{count, number} gewysig");
   P ("label.changes.change_summary_label.renamed", "{count, number} hernoem");
   P ("label.changes.change_summary_label.unchanged", "{count, number} onveranderd");
   P ("label.changes.sync_change_label.none", "geen sinchronisasiewysigings nie");
   P ("label.changes.sync_change_label.uploaded", "{count, number} opgelaai");
   P ("label.changes.sync_change_label.downloaded", "{count, number} afgelaai");
   P ("label.changes.sync_change_label.deleted", "{count, number} geskrap");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 konflik} other {{count, number} konflikte}}");
   P ("label.changes.net_change_label",
      "{state, select, none {geen netto wysiging nie} up {netto +{count, "
      & "plural, one {1 item} other {{count, number} items}}} other {netto "
      & "-{count, plural, one {1 item} other {{count, number} items}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {geen wysigings om te hersien nie} all {alle "
      & "wysigings hersien} other {{reviewed, number} van {total, number} "
      & "wysigings hersien}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} onveranderd op {new_value}} up "
      & "{{field_name} gestyg van {old_value} na {new_value}} other "
      & "{{field_name} gedaal van {old_value} na {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {geen rye kiesbaar nie} none {geen rye gekies "
      & "nie} all {{total, plural, one {1 ry gekies} other {al {total, number} "
      & "rye gekies}}} other {{selected, number} van {total, plural, one {1 ry} "
      & "other {{total, number} rye}} gekies}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {geen bladsye nie} other {{pages, plural, =0 {geen "
      & "bladsye nie} other {{rows, plural, =0 {bladsy {page, number} van "
      & "{pages, number}} one {bladsy {page, number} van {pages, number}, 1 ry} "
      & "other {bladsy {page, number} van {pages, number}, {rows, number} "
      & "rye}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {geen rye nie} none {geen rye pas nie} all "
      & "{{total, plural, one {1 ry sigbaar} other {al {total, number} rye "
      & "sigbaar}}} other {{visible, number} van {total, plural, one {1 ry} "
      & "other {{total, number} rye}} sigbaar}}");
   P ("label.tables.row_range_label",
      "{state, select, none {geen rye nie} single {ry {first_row, number} van "
      & "{total, number}} other {rye {first_row, number}-{last_row, number} van "
      & "{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {geen karakterlimiet nie} none_left {geen "
      & "karakters oor nie} left {{count, plural, one {1 karakter} other "
      & "{{count, number} karakters}} oor} other {{count, plural, one {1 "
      & "karakter} other {{count, number} karakters}} oor die limiet}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {geen verpligte velde nie} one {{missing, plural, "
      & "=0 {alle verpligte velde voltooi} other {1 van 1 verpligte veld "
      & "ontbreek}}} other {{missing, plural, =0 {alle verpligte velde voltooi} "
      & "other {{missing, number} van {total, number} verpligte velde "
      & "ontbreek}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {geen velde nie} all {alle velde voltooi} other "
      & "{{completed, number} van {total, plural, one {1 veld} other {{total, "
      & "number} velde}} voltooi}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: geen velde nie} all {{name}: alle velde "
      & "voltooi} other {{name}: {completed, number} van {total, plural, one {1 "
      & "veld} other {{total, number} velde}} voltooi}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {geen vormstappe nie} one {stap 1 van 1: {name}} "
      & "other {stap {current, number} van {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {geen broodkrummels nie} one {broodkrummel 1 van 1: "
      & "{name}} other {broodkrummel {current, number} van {total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {geen oortjies nie} one {oortjie 1 van 1: {name}} "
      & "other {oortjie {current, number} van {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {leë inkassie} one {{unread, plural, =0 {alle "
      & "kennisgewings gelees} other {1 van 1 kennisgewing ongelees}}} other "
      & "{{unread, plural, =0 {alle kennisgewings gelees} other {{unread, "
      & "number} van {total, number} kennisgewings ongelees}}}}");
   P ("label.notifications.delivery_attempt_label", "afleweringspoging {attempt, number} van {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {geen kontrolelysitems nie} one {{done, plural, =0 "
      & "{0 van 1 item voltooi} other {1 van 1 item voltooi}}} other {{done, "
      & "number} van {total, number} items voltooi}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {geen oplaaie nie} one {{done, plural, =0 {0 van 1 "
      & "oplaai voltooi} other {1 van 1 oplaai voltooi}}} other {{done, number} "
      & "van {total, number} oplaaie voltooi}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {geen kapasiteit nie} one {{reserved, plural, =0 "
      & "{0 van 1 sitplek bespreek} other {1 van 1 sitplek bespreek}}} other "
      & "{{reserved, number} van {capacity, number} sitplekke bespreek}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {waglysposisie {position, number}} other "
      & "{waglysposisie {position, number} van {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} verander} other {{name}: {changed, number} verander, "
      & "{unchanged, number} onveranderd, {total, number} totaal}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {naamlose} other {{name}}} {role, select, "
      & "button_control {knoppie} link_control {skakel} tab_control {oortjie} "
      & "menu_item_control {kieslysitem} checkbox_control {merkblokkie} "
      & "radio_control {radioknoppie} text_field_control {teksveld} "
      & "progress_control {vorderingsbalk} table_cell_control {tabelsel} "
      & "region_control {streek} other {kontrole}}");
   P ("label.markup.accessible_control_label.selected", "gekies");
   P ("label.markup.accessible_control_label.expanded", "uitgevou");
   P ("label.markup.accessible_control_label.current", "huidig");
   P ("label.markup.accessible_control_label.disabled", "gedeaktiveer");
   P ("label.markup.accessible_control_label.required", "verplig");
   P ("label.markup.accessible_control_label.invalid", "ongeldig");
   P ("label.markup.accessible_control_label.count", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.markup.accessible_control_label.position", "item {position} van {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 probleem} other {{count, number} probleme}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "skema");
   P ("label.endpoints.url_component.host", "gasheer");
   P ("label.endpoints.url_component.path", "pad");
   P ("label.endpoints.url_component.query", "navraag");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "rooi");
   P ("label.names.hue_noun.orange", "oranje");
   P ("label.names.hue_noun.yellow", "geel");
   P ("label.names.hue_noun.green", "groen");
   P ("label.names.hue_noun.cyan", "siaan");
   P ("label.names.hue_noun.blue", "blou");
   P ("label.names.hue_noun.purple", "pers");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutraal");
   P ("label.names.hue_noun.pink", "pienk");
   P ("label.names.hue_gender.red", "other");
   P ("label.names.hue_gender.orange", "other");
   P ("label.names.hue_gender.yellow", "other");
   P ("label.names.hue_gender.green", "other");
   P ("label.names.hue_gender.cyan", "other");
   P ("label.names.hue_gender.blue", "other");
   P ("label.names.hue_gender.purple", "other");
   P ("label.names.hue_gender.magenta", "other");
   P ("label.names.hue_gender.neutral", "other");
   P ("label.names.hue_gender.pink", "other");
   P ("label.names.agree.very_dark", "{gender, select, other {baie donker}}");
   P ("label.names.agree.dark", "{gender, select, other {donker}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {mediumhelder}}");
   P ("label.names.agree.light", "{gender, select, other {ligte}}");
   P ("label.names.agree.very_light", "{gender, select, other {baie ligte}}");
   P ("label.names.agree.desaturated", "{gender, select, other {onversadigde}}");
   P ("label.names.agree.muted", "{gender, select, other {gedempte}}");
   P ("label.names.agree.neutral", "{gender, select, other {neutrale}}");
   P ("label.names.agree.saturated", "{gender, select, other {versadigde}}");
   P ("label.names.agree.vivid", "{gender, select, other {helder}}");
   P ("label.names.agree.grayish", "{gender, select, other {grysagtige}}");
   P ("label.names.agree.soft", "{gender, select, other {sagte}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {matig chromatiese}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {hoogs chromatiese}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm", "{gender, select, other {warm}}");
   P ("label.names.agree.cool", "{gender, select, other {koel}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {temperatuurneutrale}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {temperatuurgebalanseerde}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "huidige voorgrondkleur voldoen aan kontras vir groot teks by {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "huidige voorgrondkleur voldoen aan kontras vir normale teks by "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "gebruik {v1} vir verhoogde tekskontras van {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "gebruik {v1} vir kontras vir groot teks van {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "gebruik {v1} vir kontras vir normale teks van {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "gebruik {v1} vir kontras vir groot teks van {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "gebruik {v1} vir verhoogde tekskontras van {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "huidige voorgrondkleur voldoen aan kontras vir groot teks by {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "huidige voorgrondkleur voldoen aan kontras vir normale teks by {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "huidige voorgrondkleur voldoen aan verhoogde tekskontras by {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "huidige voorgrondkleur voldoen aan verhoogde tekskontras by {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopie: lae verwarringsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopie: matige verwarringsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopie: matige verwarringsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsie: hoë verwarringsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstiel delta {v1}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, groot waarneembare verskil");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopie: matige verwarringsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatiese waarneembare verskil");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsie: lae verwarringsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopie: onderskeibaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopie: onderskeibaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopie: onderskeibaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsie: onderskeibaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsie: matige verwarringsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstiel delta {v1}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, merkbare verskil");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopie: hoë verwarringsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopie: hoë verwarringsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, merkbare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstiel delta {v1}, merkbare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, merkbare verskil");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, merkbare verskil");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopie: lae verwarringsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopie: lae verwarringsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, groot waarneembare verskil");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopie: hoë verwarringsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstiel delta {v1, number}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatiese waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstiel delta {v1, number}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, merkbare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstiel delta {v1}, subtiele waarneembare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, merkbare verskil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstiel delta {v1, number}, merkbare verskil");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, skaars waarneembaar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstiel delta {v1}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, groot waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstiel delta {v1, number}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, onwaarneembaar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtiele waarneembare verskil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtiele waarneembare verskil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtiele waarneembare verskil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, skaars waarneembaar");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 woord} other {{v1, number} woorde}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 paragraaf} other {{v1, number} paragrawe}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 minuut spreektyd} other {{v1, number} minute "
      & "spreektyd}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 sin} other {{v1, number} sinne}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 minuut leestyd} other {{v1, number} minute "
      & "leestyd}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 paragraaf} other {{v1, number} paragrawe}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {minder as 1 minuut spreektyd} other {minder as {v1, "
      & "number} minute spreektyd}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {minder as 1 minuut leestyd} other {minder as {v1, "
      & "number} minute leestyd}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 sin} other {{v1, number} sinne}}");
   P ("label.metrics.text_summary.no_words", "geen woorde nie");
   P ("label.metrics.text_summary.no_paragraphs", "geen paragrawe nie");
   P ("label.metrics.text_summary.no_sentences", "geen sinne nie");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 woord} other {{v1, number} woorde}}");
   P ("label.names.hue_family_label.neutral", "neutraal");
   P ("label.names.saturation_label.neutral", "neutraal");
   P ("label.names.temperature_label.neutral_temperature", "neutrale temperatuur");
   P ("label.names.chroma_label.grayish", "grysagtig");
   P ("label.names.nearest_color_name.black", "swart");
   P ("label.models.brightness_label.very_dark", "baie donker");
   P ("label.names.hue_family_label.blue", "blou");
   P ("label.names.saturation_label.vivid", "helder");
   P ("label.names.temperature_label.cool", "koel");
   P ("label.names.chroma_label.moderate_chroma", "matige chroma");
   P ("label.names.nearest_color_name.navy", "vlootblou");
   P ("label.names.chroma_label.high_chroma", "hoë chroma");
   P ("label.names.nearest_color_name.blue", "blou");
   P ("label.names.hue_family_label.green", "groen");
   P ("label.names.temperature_label.balanced_temperature", "gebalanseerde temperatuur");
   P ("label.names.hue_family_label.cyan", "siaan");
   P ("label.names.chroma_label.soft", "sag");
   P ("label.models.brightness_label.dark", "donker");
   P ("label.names.nearest_color_name.green", "groen");
   P ("label.names.nearest_color_name.teal", "blougroen");
   P ("label.models.brightness_label.medium_brightness", "medium helderheid");
   P ("label.names.nearest_color_name.aqua", "akwa");
   P ("label.names.nearest_color_name.lime", "lemmetjiegroen");
   P ("label.models.brightness_label.light", "lig");
   P ("label.names.hue_family_label.red", "rooi");
   P ("label.names.temperature_label.warm", "warm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "pers");
   P ("label.names.hue_family_label.yellow", "geel");
   P ("label.names.saturation_label.muted", "gedemp");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "versadig");
   P ("label.names.nearest_color_name.maroon", "maroen");
   P ("label.names.nearest_color_name.purple", "pers");
   P ("label.names.hue_family_label.orange", "oranje");
   P ("label.names.nearest_color_name.olive", "olyfgroen");
   P ("label.names.nearest_color_name.gray", "grys");
   P ("label.names.saturation_label.desaturated", "onversadig");
   P ("label.names.nearest_color_name.silver", "silwer");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "baie lig");
   P ("label.names.nearest_color_name.fuchsia", "fuchsia");
   P ("label.names.nearest_color_name.yellow", "geel");
   P ("label.names.nearest_color_name.red", "rooi");
   P ("label.names.nearest_color_name.orange", "oranje");
   P ("label.names.nearest_color_name.white", "wit");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} lae kontras");
   P ("label.contrast.readability_label.low_readability", "swak leesbaar");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, onvoldoende, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} lae kontras");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, onvoldoende, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsie: matige verwarringsrisiko");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% sterk verskil");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} lae kontras na alfasamestelling");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, onvoldoende, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, onvoldoende, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopie: hoë verwarringsrisiko");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} kontras vir groot teks");
   P ("label.contrast.readability_label.readable_for_large_text_only", "slegs leesbaar as groot teks");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, groot teks, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} kontras vir groot teks");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, groot teks, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopie: hoë verwarringsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontras vir groot teks na alfasamestelling");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, slegs nie-teks, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, slegs nie-teks, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopie: matige verwarringsrisiko");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} lae kontras");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} lae kontras");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, slegs nie-teks, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, slegs nie-teks, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopie: matige verwarringsrisiko");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopie: hoë verwarringsrisiko");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% baie verskillend");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsie: hoë verwarringsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsie: lae verwarringsrisiko");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} lae kontras na alfasamestelling");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} kontras vir normale teks");
   P ("label.contrast.readability_label.readable_for_normal_text", "leesbaar as normale teks");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, lopende teks, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} kontras vir normale teks");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, lopende teks, ligte teks op donker agtergrond");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, groot teks, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, groot teks, donker teks op ligte agtergrond");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% subtiele verskil");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, lopende teks, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, lopende teks, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopie: lae verwarringsrisiko");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% merkbare verskil");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} kontras vir groot teks");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} kontras vir groot teks");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopie: lae verwarringsrisiko");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} verhoogde kontras");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "leesbaar met verhoogde kontras");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} verhoogde kontras");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtiele waarneembare verskil");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopie: onderskeibaar");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontras vir normale teks na alfasamestelling");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopie: matige verwarringsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontras vir normale teks na alfasamestelling");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontras vir groot teks na alfasamestelling");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, uitstekend, donker teks op ligte agtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, uitstekend, donker teks op ligte agtergrond");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast", "{v1, number}:{v2, number} kontras vir normale teks");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontras vir normale teks");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} verhoogde kontras");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, uitstekend, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} verhoogde kontras");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, uitstekend, ligte teks op donker agtergrond");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopie: onderskeibaar");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} verhoogde kontras na alfasamestelling");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, skaars waarneembaar");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% byna identies");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopie: lae verwarringsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsie: onderskeibaar");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 kleur} other {{v1, number} kleure}}");
   P ("label.palettes.palette_summary.mostly_gray", "meestal grys");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "matige kontrasverspreiding");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "agtergrond {v1}, teks {v2}, aksent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadiese palet");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "beste kontras {v1} op {v2} by {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} van {v2, number} pare slaag vir normale tekskontras");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} verhoog, {v2, number} normaal, {v3, number} slegs groot, "
      & "{v4, number} druip uit {v5, number} pare");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 kleur} other {{v1, number} kleure}}, {v2, plural, "
      & "one {1 paar} other {{v2, number} pare}}: {v3, number} verhoog, {v4, "
      & "number} normaal, {v5, number} slegs groot, {v6, number} druip");
   P ("label.palettes.palette_mood_label.balanced", "gebalanseerd");
   P ("label.palettes.palette_mood_label.vibrant", "lewendig");
   P ("label.palettes.palette_mood_label.warm_mood", "warm stemming");
   P ("label.palettes.palette_summary.mostly_blue", "meestal blou");
   P ("label.palettes.palette_summary.low_contrast_spread", "lae kontrasverspreiding");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palet met een aksent");
   P ("label.palettes.palette_mood_label.dark", "donker");
   P ("label.palettes.palette_mood_label.cool_mood", "koel stemming");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "meestal rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "geen toeganklike tekspare nie");
   P ("label.palettes.palette_mood_label.subtle", "subtiel");
   P ("label.palettes.palette_summary.high_contrast_spread", "hoë kontrasverspreiding");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "beste kontras {v1} op {v2} by {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutrale stemming");
   P ("label.palettes.palette_summary.mostly_purple", "meestal pers");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementêre palet");
   P ("label.palettes.palette_summary.mostly_green", "meestal groen");
   P ("label.palettes.palette_mood_label.moderate", "gematig");
   P ("label.palettes.palette_summary.mostly_silver", "meestal silwer");
   P ("label.palettes.palette_harmony_label.varied_palette", "gevarieerde palet");
   P ("label.palettes.palette_summary.mostly_olive", "meestal olyfgroen");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analoë palet");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} van {v2, number} pare slaag slegs vir groot teks");
   P ("label.palettes.palette_mood_label.light", "lig");
   P ("label.palettes.palette_summary.mostly_teal", "meestal blougroen");
   P ("label.palettes.palette_summary.mostly_aqua", "meestal akwa");
   P ("label.palettes.palette_summary.mostly_lime", "meestal lemmetjiegroen");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochrome palet");
   P ("label.palettes.palette_summary.mostly_black", "meestal swart");
   P ("label.palettes.palette_summary.mostly_yellow", "meestal geel");
   P ("label.palettes.palette_summary.mostly_maroon", "meestal maroen");
   P ("label.palettes.palette_summary.mostly_white", "meestal wit");
   P ("label.palettes.palette_summary.mostly_orange", "meestal oranje");
   P ("label.palettes.palette_summary.mostly_fuchsia", "meestal fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutrale palet");
   P ("label.palettes.palette_summary.mostly_red", "meestal rooi");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 woord} other {{v1, number} woorde}}");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, plural, one {1 sin} other {{v1, number} sinne}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 paragraaf} other {{v1, number} paragrawe}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minuut leestyd} other {{v1, number} minute "
      & "leestyd}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minuut spreektyd} other {{v1, number} minute "
      & "spreektyd}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 woord} other {{v1, number} woorde}}");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, plural, one {1 sin} other {{v1, number} sinne}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 paragraaf} other {{v1, number} paragrawe}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minuut leestyd} other {{v1, number} minute "
      & "leestyd}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 paragraaf} other {{v1, number} paragrawe}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {minder as 1 minuut leestyd} other {minder as {v1, "
      & "number} minute leestyd}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {minder as 1 minuut spreektyd} other {minder as {v1, "
      & "number} minute spreektyd}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 paragraaf} other {{v1, number} paragrawe}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {minder as 1 minuut leestyd} other {minder as {v1, "
      & "number} minute leestyd}}");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, plural, one {1 sin} other {{v1, number} sinne}}");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, plural, one {1 sin} other {{v1, number} sinne}}");
   P ("label.metrics.word_count_summary.no_words", "geen woorde nie");
   P ("label.metrics.sentence_count_summary.no_sentences", "geen sinne nie");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "geen paragrawe nie");
   P ("label.metrics.text_summary_with_options.no_words", "geen woorde nie");
   P ("label.metrics.text_summary_with_options.no_sentences", "geen sinne nie");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "geen paragrawe nie");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 woord} other {{v1, number} woorde}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 woord} other {{v1, number} woorde}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {leë URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {leë URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[verborge gebruiker]");
   P ("label.endpoints.url_label.query",
      "navraag {count, plural, one {1 parameter} other {{count, number} "
      & "parameters}}");
end Labels_3;
