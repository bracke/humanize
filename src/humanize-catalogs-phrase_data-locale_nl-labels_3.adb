separate (Humanize.Catalogs.Phrase_Data.Locale_Nl)
procedure Labels_3 is
begin
   P ("label.schema.type_mismatch_label",
      "veld {field_name}: {expected, select, string_field {string} "
      & "integer_field {geheel getal} decimal_field {decimaal getal} "
      & "boolean_field {boolean} date_field {datum} date_time_field "
      & "{datum-tijd} object_field {object} array_field {array} enum_field "
      & "{enum} binary_field {binair} null_field {null} any_field {willekeurig} "
      & "other {onbekend}} verwacht, {actual, select, string_field {string} "
      & "integer_field {geheel getal} decimal_field {decimaal getal} "
      & "boolean_field {boolean} date_field {datum} date_time_field "
      & "{datum-tijd} object_field {object} array_field {array} enum_field "
      & "{enum} binary_field {binair} null_field {null} any_field {willekeurig} "
      & "other {onbekend}} ontvangen");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 blokkerend "
      & "probleem} other {{blocking, number} blokkerende problemen}}} blocking "
      & "{{base}, {blocking, plural, one {1 blokkerend probleem} other "
      & "{{blocking, number} blokkerende problemen}}} only {alleen {base}} "
      & "other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "geen controles uitgevoerd");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} geslaagd");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} mislukt");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 waarschuwing} other {{count, number} "
      & "waarschuwingen}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} overgeslagen");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} in afwachting");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {doelbereik {low} tot en met "
      & "{high}} other {doelvenster {low} tot {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} binnen verwacht bereik} below {{value} "
      & "onder verwacht bereik} other {{value} boven verwacht bereik}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} op kritieke drempel} warning "
      & "{{value} op waarschuwingsdrempel} other {{value} binnen normaal "
      & "bereik}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {niet overschreden} other {overschreden met "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {op doelwaarde} below {{difference} onder "
      & "doelwaarde} other {{difference} boven doelwaarde}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limiet overschreden} near {dicht bij limiet, "
      & "{distance} resterend} other {{distance} van limiet}}");
   P ("label.thresholds.threshold_summary_label.none", "geen metrieken");
   P ("label.thresholds.threshold_summary_label.normal", "{count, number} normaal");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 waarschuwing} other {{count, number} "
      & "waarschuwingen}}");
   P ("label.thresholds.threshold_summary_label.critical", "{count, number} kritiek");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 overschrijding} other {{count, number} "
      & "overschrijdingen}}");
   P ("label.thresholds.target_window_label", "doel {target} plus/min {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerantie {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} van limiet");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limiet overschreden met {amount}} other "
      & "{{amount} resterend}}");
   P ("label.thresholds.budget_used_label", "{used} van {budget} gebruikt");
   P ("label.workflows.step_label", "stap {current, number} van {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} van {total, number} mijlpalen behaald: {name}");
   P ("label.workflows.workflow_summary_label.total", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.workflows.workflow_summary_label.completed", "{count, number} voltooid");
   P ("label.workflows.workflow_summary_label.active", "{count, number} actief");
   P ("label.workflows.workflow_summary_label.blocked", "{count, number} geblokkeerd");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} mislukt");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} overgeslagen");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {geen workflowitems} half {workflow halverwege} "
      & "other {{completed, number} van {total, number} voltooid}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {positie {position, number} in wachtrij} other "
      & "{positie {position, number} van {total, number} in wachtrij}}");
   P ("label.changes.change_set_label.none", "geen wijzigingen");
   P ("label.changes.change_set_label.added", "{count, number} toegevoegd");
   P ("label.changes.change_set_label.removed", "{count, number} verwijderd");
   P ("label.changes.change_set_label.modified", "{count, number} gewijzigd");
   P ("label.changes.change_set_label.unchanged", "{count, number} ongewijzigd");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.changes.change_summary_label.added", "{count, number} toegevoegd");
   P ("label.changes.change_summary_label.removed", "{count, number} verwijderd");
   P ("label.changes.change_summary_label.modified", "{count, number} gewijzigd");
   P ("label.changes.change_summary_label.renamed", "{count, number} hernoemd");
   P ("label.changes.change_summary_label.unchanged", "{count, number} ongewijzigd");
   P ("label.changes.sync_change_label.none", "geen synchronisatiewijzigingen");
   P ("label.changes.sync_change_label.uploaded", "{count, number} geüpload");
   P ("label.changes.sync_change_label.downloaded", "{count, number} gedownload");
   P ("label.changes.sync_change_label.deleted", "{count, number} verwijderd");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 conflict} other {{count, number} conflicten}}");
   P ("label.changes.net_change_label",
      "{state, select, none {geen nettowijziging} up {netto +{count, plural, "
      & "one {1 item} other {{count, number} items}}} other {netto -{count, "
      & "plural, one {1 item} other {{count, number} items}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {geen wijzigingen om te beoordelen} all {alle "
      & "wijzigingen beoordeeld} other {{reviewed, number} van {total, number} "
      & "wijzigingen beoordeeld}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} ongewijzigd op {new_value}} up "
      & "{{field_name} gestegen van {old_value} naar {new_value}} other "
      & "{{field_name} gedaald van {old_value} naar {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {geen rijen selecteerbaar} none {geen rijen "
      & "geselecteerd} all {{total, plural, one {1 rij geselecteerd} other "
      & "{alle {total, number} rijen geselecteerd}}} other {{selected, number} "
      & "van {total, plural, one {1 rij} other {{total, number} rijen}} "
      & "geselecteerd}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {geen pagina’s} other {{pages, plural, =0 {geen "
      & "pagina’s} other {{rows, plural, =0 {pagina {page, number} van "
      & "{pages, number}} one {pagina {page, number} van {pages, number}, 1 "
      & "rij} other {pagina {page, number} van {pages, number}, {rows, number} "
      & "rijen}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {geen rijen} none {geen overeenkomende rijen} "
      & "all {{total, plural, one {1 rij zichtbaar} other {alle {total, number} "
      & "rijen zichtbaar}}} other {{visible, number} van {total, plural, one {1 "
      & "rij} other {{total, number} rijen}} zichtbaar}}");
   P ("label.tables.row_range_label",
      "{state, select, none {geen rijen} single {rij {first_row, number} van "
      & "{total, number}} other {rijen {first_row, number}-{last_row, number} "
      & "van {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {geen tekenlimiet} none_left {geen tekens "
      & "over} left {{count, plural, one {1 teken} other {{count, number} "
      & "tekens}} over} other {{count, plural, one {1 teken} other {{count, "
      & "number} tekens}} boven limiet}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {geen verplichte velden} one {{missing, plural, =0 "
      & "{alle verplichte velden ingevuld} other {1 van 1 verplicht veld "
      & "ontbreekt}}} other {{missing, plural, =0 {alle verplichte velden "
      & "ingevuld} one {1 van {total, number} verplichte velden ontbreekt} "
      & "other {{missing, number} van {total, number} verplichte velden "
      & "ontbreken}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {geen velden} all {alle velden ingevuld} other "
      & "{{completed, number} van {total, plural, one {1 veld} other {{total, "
      & "number} velden}} ingevuld}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: geen velden} all {{name}: alle velden "
      & "ingevuld} other {{name}: {completed, number} van {total, plural, one "
      & "{1 veld} other {{total, number} velden}} ingevuld}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {geen formulierstappen} one {stap 1 van 1: {name}} "
      & "other {stap {current, number} van {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {geen kruimelpad} one {kruimelpadniveau 1 van 1: "
      & "{name}} other {kruimelpadniveau {current, number} van {total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {geen tabbladen} one {tabblad 1 van 1: {name}} "
      & "other {tabblad {current, number} van {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {lege inbox} one {{unread, plural, =0 {alle "
      & "meldingen gelezen} other {1 van 1 melding ongelezen}}} other {{unread, "
      & "plural, =0 {alle meldingen gelezen} other {{unread, number} van "
      & "{total, number} meldingen ongelezen}}}}");
   P ("label.notifications.delivery_attempt_label", "bezorgpoging {attempt, number} van {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {geen checklistitems} one {{done, plural, =0 {0 van "
      & "1 item voltooid} other {1 van 1 item voltooid}}} other {{done, number} "
      & "van {total, number} items voltooid}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {geen uploads} one {{done, plural, =0 {0 van 1 "
      & "upload voltooid} other {1 van 1 upload voltooid}}} other {{done, "
      & "number} van {total, number} uploads voltooid}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {geen capaciteit} one {{reserved, plural, =0 {0 "
      & "van 1 plaats gereserveerd} other {1 van 1 plaats gereserveerd}}} other "
      & "{{reserved, number} van {capacity, number} plaatsen gereserveerd}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {positie {position, number} op wachtlijst} other "
      & "{positie {position, number} van {total, number} op wachtlijst}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} gewijzigd} other {{name}: {changed, number} gewijzigd, "
      & "{unchanged, number} ongewijzigd, {total, number} totaal}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {{role, select, button_control {naamloze knop} "
      & "link_control {naamloze link} tab_control {naamloos tabblad} "
      & "menu_item_control {naamloos menu-item} checkbox_control {naamloos "
      & "selectievakje} radio_control {naamloos keuzerondje} text_field_control "
      & "{naamloos tekstveld} progress_control {naamloze voortgangsbalk} "
      & "table_cell_control {naamloze tabelcel} region_control {naamloze regio} "
      & "other {naamloos besturingselement}}} other {{role, select, "
      & "button_control {knop} link_control {link} tab_control {tabblad} "
      & "menu_item_control {menu-item} checkbox_control {selectievakje} "
      & "radio_control {keuzerondje} text_field_control {tekstveld} "
      & "progress_control {voortgangsbalk} table_cell_control {tabelcel} "
      & "region_control {regio} other {besturingselement}} {name}}}");
   P ("label.markup.accessible_control_label.selected", "geselecteerd");
   P ("label.markup.accessible_control_label.expanded", "uitgevouwen");
   P ("label.markup.accessible_control_label.current", "huidig");
   P ("label.markup.accessible_control_label.disabled", "uitgeschakeld");
   P ("label.markup.accessible_control_label.required", "verplicht");
   P ("label.markup.accessible_control_label.invalid", "ongeldig");
   P ("label.markup.accessible_control_label.count", "{count, plural, one {1 item} other {{count, number} items}}");
   P ("label.markup.accessible_control_label.position", "item {position} van {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 probleem} other {{count, number} problemen}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schema");
   P ("label.endpoints.url_component.host", "host");
   P ("label.endpoints.url_component.path", "pad");
   P ("label.endpoints.url_component.query", "query");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "rood");
   P ("label.names.hue_noun.orange", "oranje");
   P ("label.names.hue_noun.yellow", "geel");
   P ("label.names.hue_noun.green", "groen");
   P ("label.names.hue_noun.cyan", "cyaan");
   P ("label.names.hue_noun.blue", "blauw");
   P ("label.names.hue_noun.purple", "paars");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutraal");
   P ("label.names.hue_noun.pink", "roze");
   P ("label.names.hue_gender.red", "neuter");
   P ("label.names.hue_gender.orange", "neuter");
   P ("label.names.hue_gender.yellow", "neuter");
   P ("label.names.hue_gender.green", "neuter");
   P ("label.names.hue_gender.cyan", "neuter");
   P ("label.names.hue_gender.blue", "neuter");
   P ("label.names.hue_gender.purple", "neuter");
   P ("label.names.hue_gender.magenta", "neuter");
   P ("label.names.hue_gender.neutral", "neuter");
   P ("label.names.hue_gender.pink", "neuter");
   P ("label.names.agree.very_dark",
      "{gender, select, neuter {zeer donker} masculine {zeer donkere} "
      & "feminine {zeer donkere} other {zeer donker}}");
   P ("label.names.agree.dark",
      "{gender, select, neuter {donker} masculine {donkere} feminine "
      & "{donkere} other {donker}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, neuter {middelhelder} masculine {middelheldere} "
      & "feminine {middelheldere} other {middelhelder}}");
   P ("label.names.agree.light",
      "{gender, select, neuter {licht} masculine {lichte} feminine {lichte} "
      & "other {licht}}");
   P ("label.names.agree.very_light",
      "{gender, select, neuter {zeer licht} masculine {zeer lichte} feminine "
      & "{zeer lichte} other {zeer licht}}");
   P ("label.names.agree.desaturated",
      "{gender, select, neuter {onverzadigd} masculine {onverzadigde} "
      & "feminine {onverzadigde} other {onverzadigd}}");
   P ("label.names.agree.muted",
      "{gender, select, neuter {gedempt} masculine {gedempte} feminine "
      & "{gedempte} other {gedempt}}");
   P ("label.names.agree.neutral",
      "{gender, select, neuter {neutraal} masculine {neutrale} feminine "
      & "{neutrale} other {neutraal}}");
   P ("label.names.agree.saturated",
      "{gender, select, neuter {verzadigd} masculine {verzadigde} feminine "
      & "{verzadigde} other {verzadigd}}");
   P ("label.names.agree.vivid",
      "{gender, select, neuter {levendig} masculine {levendige} feminine "
      & "{levendige} other {levendig}}");
   P ("label.names.agree.grayish",
      "{gender, select, neuter {grijzig} masculine {grijzige} feminine "
      & "{grijzige} other {grijzig}}");
   P ("label.names.agree.soft",
      "{gender, select, neuter {zacht} masculine {zachte} feminine {zachte} "
      & "other {zacht}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, neuter {matig chromatisch} masculine {matig "
      & "chromatische} feminine {matig chromatische} other {matig chromatisch}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, neuter {sterk chromatisch} masculine {sterk "
      & "chromatische} feminine {sterk chromatische} other {sterk chromatisch}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm",
      "{gender, select, neuter {warm} masculine {warme} feminine {warme} "
      & "other {warm}}");
   P ("label.names.agree.cool",
      "{gender, select, neuter {koel} masculine {koele} feminine {koele} "
      & "other {koel}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, neuter {temperatuurneutraal} masculine "
      & "{temperatuurneutrale} feminine {temperatuurneutrale} other "
      & "{temperatuurneutraal}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, neuter {temperatuurgebalanceerd} masculine "
      & "{temperatuurgebalanceerde} feminine {temperatuurgebalanceerde} other "
      & "{temperatuurgebalanceerd}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "huidige voorgrondkleur voldoet aan contrast voor grote tekst bij "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "huidige voorgrondkleur voldoet aan contrast voor normale tekst bij "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "gebruik {v1} voor verhoogd tekstcontrast van {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "gebruik {v1} voor contrast voor grote tekst van {v2, number}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "gebruik {v1} voor contrast voor normale tekst van {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "gebruik {v1} voor contrast voor grote tekst van {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "gebruik {v1} voor verhoogd tekstcontrast van {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "huidige voorgrondkleur voldoet aan contrast voor grote tekst bij {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "huidige voorgrondkleur voldoet aan contrast voor normale tekst bij "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "huidige voorgrondkleur voldoet aan verhoogd tekstcontrast bij "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "huidige voorgrondkleur voldoet aan verhoogd tekstcontrast bij {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopie: laag verwarringsrisico, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopie: matig verwarringsrisico, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopie: matig verwarringsrisico, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "achromatopsie: hoog verwarringsrisico, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 textiel delta {v1}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, groot waarneembaar verschil");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopie: matig verwarringsrisico, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, zeer groot waarneembaar verschil");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "achromatopsie: laag verwarringsrisico, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopie: onderscheidbaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopie: onderscheidbaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopie: onderscheidbaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "achromatopsie: onderscheidbaar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "achromatopsie: matig verwarringsrisico, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 textiel delta {v1}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, merkbaar verschil");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopie: hoog verwarringsrisico, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopie: hoog verwarringsrisico, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, merkbaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 textiel delta {v1}, merkbaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, merkbaar verschil");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, merkbaar verschil");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopie: laag verwarringsrisico, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopie: laag verwarringsrisico, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, groot waarneembaar verschil");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopie: hoog verwarringsrisico, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 textiel delta {v1, number}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, zeer groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 textiel delta {v1, number}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, merkbaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 textiel delta {v1}, subtiel waarneembaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, merkbaar verschil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 textiel delta {v1, number}, merkbaar verschil");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, nauwelijks waarneembaar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 textiel delta {v1}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, groot waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 textiel delta {v1, number}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, niet waarneembaar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtiel waarneembaar verschil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtiel waarneembaar verschil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtiel waarneembaar verschil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, nauwelijks waarneembaar");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 woord} other {{v1, number} woorden}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 alinea} other {{v1, number} alinea’s}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 minuut spreektijd} other {{v1, number} minuten "
      & "spreektijd}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 zin} other {{v1, number} zinnen}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 minuut leestijd} other {{v1, number} minuten "
      & "leestijd}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 alinea} other {{v1, number} alinea’s}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {minder dan 1 minuut spreektijd} other {minder dan "
      & "{v1, number} minuten spreektijd}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {minder dan 1 minuut leestijd} other {minder dan {v1, "
      & "number} minuten leestijd}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 zin} other {{v1, number} zinnen}}");
   P ("label.metrics.text_summary.no_words", "geen woorden");
   P ("label.metrics.text_summary.no_paragraphs", "geen alinea’s");
   P ("label.metrics.text_summary.no_sentences", "geen zinnen");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 woord} other {{v1, number} woorden}}");
   P ("label.names.hue_family_label.neutral", "neutraal");
   P ("label.names.saturation_label.neutral", "neutraal");
   P ("label.names.temperature_label.neutral_temperature", "neutrale temperatuur");
   P ("label.names.chroma_label.grayish", "grijzig");
   P ("label.names.nearest_color_name.black", "zwart");
   P ("label.models.brightness_label.very_dark", "zeer donker");
   P ("label.names.hue_family_label.blue", "blauw");
   P ("label.names.saturation_label.vivid", "levendig");
   P ("label.names.temperature_label.cool", "koel");
   P ("label.names.chroma_label.moderate_chroma", "matige chroma");
   P ("label.names.nearest_color_name.navy", "marineblauw");
   P ("label.names.chroma_label.high_chroma", "hoge chroma");
   P ("label.names.nearest_color_name.blue", "blauw");
   P ("label.names.hue_family_label.green", "groen");
   P ("label.names.temperature_label.balanced_temperature", "evenwichtige temperatuur");
   P ("label.names.hue_family_label.cyan", "cyaan");
   P ("label.names.chroma_label.soft", "zacht");
   P ("label.models.brightness_label.dark", "donker");
   P ("label.names.nearest_color_name.green", "groen");
   P ("label.names.nearest_color_name.teal", "blauwgroen");
   P ("label.models.brightness_label.medium_brightness", "gemiddelde helderheid");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "limoengroen");
   P ("label.models.brightness_label.light", "licht");
   P ("label.names.hue_family_label.red", "rood");
   P ("label.names.temperature_label.warm", "warm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "paars");
   P ("label.names.hue_family_label.yellow", "geel");
   P ("label.names.saturation_label.muted", "gedempt");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "verzadigd");
   P ("label.names.nearest_color_name.maroon", "kastanjebruin");
   P ("label.names.nearest_color_name.purple", "paars");
   P ("label.names.hue_family_label.orange", "oranje");
   P ("label.names.nearest_color_name.olive", "olijfgroen");
   P ("label.names.nearest_color_name.gray", "grijs");
   P ("label.names.saturation_label.desaturated", "onverzadigd");
   P ("label.names.nearest_color_name.silver", "zilver");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "zeer licht");
   P ("label.names.nearest_color_name.fuchsia", "fuchsia");
   P ("label.names.nearest_color_name.yellow", "geel");
   P ("label.names.nearest_color_name.red", "rood");
   P ("label.names.nearest_color_name.orange", "oranje");
   P ("label.names.nearest_color_name.white", "wit");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} laag contrast");
   P ("label.contrast.readability_label.low_readability", "slecht leesbaar");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, onvoldoende, donkere tekst op lichte achtergrond");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} laag contrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, onvoldoende, donkere tekst op lichte achtergrond");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "achromatopsie: matig verwarringsrisico");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% sterk verschil");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} laag contrast na alfacompositie");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, onvoldoende, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, onvoldoende, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopie: hoog verwarringsrisico");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} contrast voor grote tekst");
   P ("label.contrast.readability_label.readable_for_large_text_only", "alleen leesbaar als grote tekst");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, grote tekst, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} contrast voor grote tekst");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, grote tekst, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopie: hoog verwarringsrisico");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} contrast voor grote tekst na alfacompositie");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, alleen niet-tekst, lichte tekst op donkere "
      & "achtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, alleen niet-tekst, lichte tekst op donkere "
      & "achtergrond");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopie: matig verwarringsrisico");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} laag contrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} laag contrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, alleen niet-tekst, donkere tekst op lichte "
      & "achtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, alleen niet-tekst, donkere tekst op lichte "
      & "achtergrond");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopie: matig verwarringsrisico");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopie: hoog verwarringsrisico");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% zeer verschillend");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "achromatopsie: hoog verwarringsrisico");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "achromatopsie: laag verwarringsrisico");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} laag contrast na alfacompositie");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} contrast voor normale tekst");
   P ("label.contrast.readability_label.readable_for_normal_text", "leesbaar als normale tekst");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, lopende tekst, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} contrast voor normale tekst");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, lopende tekst, lichte tekst op donkere achtergrond");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, grote tekst, donkere tekst op lichte achtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, grote tekst, donkere tekst op lichte achtergrond");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% subtiel verschil");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, lopende tekst, donkere tekst op lichte achtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, lopende tekst, donkere tekst op lichte achtergrond");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopie: laag verwarringsrisico");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% merkbaar verschil");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} contrast voor grote tekst");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} contrast voor grote tekst");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopie: laag verwarringsrisico");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} verhoogd contrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "leesbaar met verhoogd contrast");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} verhoogd contrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtiel waarneembaar verschil");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopie: onderscheidbaar");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} contrast voor normale tekst na "
      & "alfacompositie");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopie: matig verwarringsrisico");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} contrast voor normale tekst na alfacompositie");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} contrast voor grote tekst na alfacompositie");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, uitstekend, donkere tekst op lichte achtergrond");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, uitstekend, donkere tekst op lichte achtergrond");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} contrast voor normale tekst");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} contrast voor normale tekst");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} verhoogd contrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, uitstekend, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} verhoogd contrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, uitstekend, lichte tekst op donkere achtergrond");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopie: onderscheidbaar");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} verhoogd contrast na alfacompositie");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, nauwelijks waarneembaar");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% vrijwel identiek");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopie: laag verwarringsrisico");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "achromatopsie: onderscheidbaar");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 kleur} other {{v1, number} kleuren}}");
   P ("label.palettes.palette_summary.mostly_gray", "overwegend grijs");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "matige contrastspreiding");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "achtergrond {v1}, tekst {v2}, accent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadisch palet");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "beste contrast {v1} op {v2} bij {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} van {v2, number} paren voldoen aan contrast voor normale "
      & "tekst");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} verhoogd, {v2, number} normaal, {v3, number} alleen "
      & "groot, {v4, number} onvoldoende van {v5, number} paren");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 kleur} other {{v1, number} kleuren}}, {v2, plural, "
      & "one {1 paar} other {{v2, number} paren}}: {v3, number} verhoogd, {v4, "
      & "number} normaal, {v5, number} alleen groot, {v6, number} onvoldoende");
   P ("label.palettes.palette_mood_label.balanced", "evenwichtig");
   P ("label.palettes.palette_mood_label.vibrant", "levendig");
   P ("label.palettes.palette_mood_label.warm_mood", "warme sfeer");
   P ("label.palettes.palette_summary.mostly_blue", "overwegend blauw");
   P ("label.palettes.palette_summary.low_contrast_spread", "lage contrastspreiding");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palet met één accent");
   P ("label.palettes.palette_mood_label.dark", "donker");
   P ("label.palettes.palette_mood_label.cool_mood", "koele sfeer");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "overwegend rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "geen toegankelijke tekstparen");
   P ("label.palettes.palette_mood_label.subtle", "subtiel");
   P ("label.palettes.palette_summary.high_contrast_spread", "hoge contrastspreiding");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "beste contrast {v1} op {v2} bij {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutrale sfeer");
   P ("label.palettes.palette_summary.mostly_purple", "overwegend paars");
   P ("label.palettes.palette_harmony_label.complementary_palette", "complementair palet");
   P ("label.palettes.palette_summary.mostly_green", "overwegend groen");
   P ("label.palettes.palette_mood_label.moderate", "gematigd");
   P ("label.palettes.palette_summary.mostly_silver", "overwegend zilver");
   P ("label.palettes.palette_harmony_label.varied_palette", "gevarieerd palet");
   P ("label.palettes.palette_summary.mostly_olive", "overwegend olijfgroen");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analoog palet");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} van {v2, number} paren voldoen alleen voor grote tekst");
   P ("label.palettes.palette_mood_label.light", "licht");
   P ("label.palettes.palette_summary.mostly_teal", "overwegend blauwgroen");
   P ("label.palettes.palette_summary.mostly_aqua", "overwegend aqua");
   P ("label.palettes.palette_summary.mostly_lime", "overwegend limoengroen");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochroom palet");
   P ("label.palettes.palette_summary.mostly_black", "overwegend zwart");
   P ("label.palettes.palette_summary.mostly_yellow", "overwegend geel");
   P ("label.palettes.palette_summary.mostly_maroon", "overwegend kastanjebruin");
   P ("label.palettes.palette_summary.mostly_white", "overwegend wit");
   P ("label.palettes.palette_summary.mostly_orange", "overwegend oranje");
   P ("label.palettes.palette_summary.mostly_fuchsia", "overwegend fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutraal palet");
   P ("label.palettes.palette_summary.mostly_red", "overwegend rood");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 woord} other {{v1, number} woorden}}");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, plural, one {1 zin} other {{v1, number} zinnen}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 alinea} other {{v1, number} alinea’s}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minuut leestijd} other {{v1, number} minuten "
      & "leestijd}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minuut spreektijd} other {{v1, number} minuten "
      & "spreektijd}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 woord} other {{v1, number} woorden}}");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, plural, one {1 zin} other {{v1, number} zinnen}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 alinea} other {{v1, number} alinea’s}}");
end Labels_3;
