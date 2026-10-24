separate (Humanize.Catalogs.Phrase_Data.Locale_Da)
procedure Labels_3 is
begin
   P ("label.schema.schema_summary_label.unknown", "{count, plural, one {1 ukendt} other {{count, number} ukendte}}");
   P ("label.schema.type_mismatch_label",
      "feltet {field_name} forventede {expected, select, string_field "
      & "{streng} integer_field {heltal} decimal_field {decimaltal} "
      & "boolean_field {boolesk} date_field {dato} date_time_field {dato-tid} "
      & "object_field {objekt} array_field {array} enum_field {enum} "
      & "binary_field {binær} null_field {null} any_field {vilkårlig} other "
      & "{ukendt}}, fik {actual, select, string_field {streng} integer_field "
      & "{heltal} decimal_field {decimaltal} boolean_field {boolesk} date_field "
      & "{dato} date_time_field {dato-tid} object_field {objekt} array_field "
      & "{array} enum_field {enum} binary_field {binær} null_field {null} "
      & "any_field {vilkårlig} other {ukendt}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 blokerende "
      & "problem} other {{blocking, number} blokerende problemer}}} blocking "
      & "{{base}, {blocking, plural, one {1 blokerende problem} other "
      & "{{blocking, number} blokerende problemer}}} only {kun {base}} other "
      & "{{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "ingen kontroller kørt");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} bestået");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} mislykkedes");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 advarsel} other {{count, number} advarsler}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} sprunget over");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} afventer");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {målinterval {low} til {high}} "
      & "other {målvindue {low} til {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} inden for forventet interval} below "
      & "{{value} under forventet interval} other {{value} over forventet "
      & "interval}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} ved kritisk tærskel} warning "
      & "{{value} ved advarselstærskel} other {{value} inden for "
      & "normalområdet}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {ikke overskredet} other {overskredet med "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {mål nået} below {{difference} under målet} "
      & "other {{difference} over målet}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {grænse overskredet} near {tæt på "
      & "grænsen, {distance} tilbage} other {{distance} fra grænsen}}");
   P ("label.thresholds.threshold_summary_label.none", "ingen målinger");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {1 normal} other {{count, number} normale}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 advarsel} other {{count, number} advarsler}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {1 kritisk} other {{count, number} kritiske}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 overskridelse} other {{count, number} "
      & "overskridelser}}");
   P ("label.thresholds.target_window_label", "mål {target} ± {tolerance}");
   P ("label.thresholds.tolerance_label", "tolerance {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} af grænsen");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {grænse overskredet med {amount}} other "
      & "{{amount} tilbage}}");
   P ("label.thresholds.budget_used_label", "{used} brugt af {budget}");
   P ("label.workflows.step_label", "trin {current, number} af {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} af {total, number} milepæle nået: {name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {1 fuldført} other {{count, number} fuldførte}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {1 aktivt} other {{count, number} aktive}}");
   P ("label.workflows.workflow_summary_label.blocked",
      "{count, plural, one {1 blokeret} other {{count, number} blokerede}}");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} mislykkedes");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} sprunget over");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {ingen workflowelementer} half {halvvejs gennem "
      & "workflowet} other {{completed, number} af {total, number} fuldført}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {position {position, number} i køen} other "
      & "{position {position, number} af {total, number} i køen}}");
   P ("label.changes.change_set_label.none", "ingen ændringer");
   P ("label.changes.change_set_label.added", "{count, number} tilføjet");
   P ("label.changes.change_set_label.removed", "{count, number} fjernet");
   P ("label.changes.change_set_label.modified", "{count, number} ændret");
   P ("label.changes.change_set_label.unchanged", "{count, number} uændret");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.changes.change_summary_label.added", "{count, number} tilføjet");
   P ("label.changes.change_summary_label.removed", "{count, number} fjernet");
   P ("label.changes.change_summary_label.modified", "{count, number} ændret");
   P ("label.changes.change_summary_label.renamed", "{count, number} omdøbt");
   P ("label.changes.change_summary_label.unchanged", "{count, number} uændret");
   P ("label.changes.sync_change_label.none", "ingen synkroniseringsændringer");
   P ("label.changes.sync_change_label.uploaded", "{count, number} uploadet");
   P ("label.changes.sync_change_label.downloaded", "{count, number} downloadet");
   P ("label.changes.sync_change_label.deleted", "{count, number} slettet");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 konflikt} other {{count, number} konflikter}}");
   P ("label.changes.net_change_label",
      "{state, select, none {ingen nettoændring} up {netto +{count, plural, "
      & "one {1 element} other {{count, number} elementer}}} other {netto "
      & "-{count, plural, one {1 element} other {{count, number} elementer}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {ingen ændringer at gennemgå} all {alle "
      & "ændringer gennemgået} other {{reviewed, number} af {total, number} "
      & "ændringer gennemgået}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} uændret på {new_value}} up "
      & "{{field_name} steg fra {old_value} til {new_value}} other "
      & "{{field_name} faldt fra {old_value} til {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {ingen rækker kan vælges} none {ingen "
      & "rækker valgt} all {{total, plural, one {1 række} other {alle {total, "
      & "number} rækker}} valgt} other {{selected, number} af {total, plural, "
      & "one {1 række} other {{total, number} rækker}} valgt}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {ingen sider} other {{pages, plural, =0 {ingen "
      & "sider} other {{rows, plural, =0 {side {page, number} af {pages, "
      & "number}} one {side {page, number} af {pages, number}, 1 række} other "
      & "{side {page, number} af {pages, number}, {rows, number} rækker}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {ingen rækker} none {ingen rækker matcher} "
      & "all {{total, plural, one {1 række} other {alle {total, number} "
      & "rækker}} vist} other {{visible, number} af {total, plural, one {1 "
      & "række} other {{total, number} rækker}} vist}}");
   P ("label.tables.row_range_label",
      "{state, select, none {ingen rækker} single {række {first_row, "
      & "number} af {total, number}} other {rækker {first_row, "
      & "number}–{last_row, number} af {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {ingen tegngrænse} none_left {ingen tegn "
      & "tilbage} left {{count, plural, one {1 tegn} other {{count, number} "
      & "tegn}} tilbage} other {{count, plural, one {1 tegn} other {{count, "
      & "number} tegn}} over grænsen}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {ingen obligatoriske felter} one {{missing, plural, "
      & "=0 {alle obligatoriske felter udfyldt} other {1 af 1 obligatorisk felt "
      & "mangler}}} other {{missing, plural, =0 {alle obligatoriske felter "
      & "udfyldt} other {{missing, number} af {total, number} obligatoriske "
      & "felter mangler}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {ingen felter} all {alle felter udfyldt} other "
      & "{{completed, number} af {total, plural, one {1 felt} other {{total, "
      & "number} felter}} udfyldt}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: ingen felter} all {{name}: alle felter "
      & "udfyldt} other {{name}: {completed, number} af {total, plural, one {1 "
      & "felt} other {{total, number} felter}} udfyldt}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {ingen formulartrin} one {trin 1 af 1: {name}} "
      & "other {trin {current, number} af {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {ingen brødkrummer} one {brødkrumme 1 af 1: "
      & "{name}} other {brødkrumme {current, number} af {total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {ingen faner} one {fane 1 af 1: {name}} other {fane "
      & "{current, number} af {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {tom indbakke} one {{unread, plural, =0 {alle "
      & "meddelelser læst} other {1 ulæst af 1 meddelelse}}} other {{unread, "
      & "plural, =0 {alle meddelelser læst} other {{unread, number} ulæste af "
      & "{total, number} meddelelser}}}}");
   P ("label.notifications.delivery_attempt_label", "leveringsforsøg {attempt, number} af {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {ingen tjeklistepunkter} one {{done, plural, =0 {0 "
      & "af 1 punkt fuldført} other {1 af 1 punkt fuldført}}} other {{done, "
      & "number} af {total, number} punkter fuldført}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {ingen uploads} one {{done, plural, =0 {0 af 1 "
      & "upload fuldført} other {1 af 1 upload fuldført}}} other {{done, "
      & "number} af {total, number} uploads fuldført}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {ingen kapacitet} one {{reserved, plural, =0 {0 "
      & "af 1 plads reserveret} other {1 af 1 plads reserveret}}} other "
      & "{{reserved, number} af {capacity, number} pladser reserveret}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {position {position, number} på ventelisten} other "
      & "{position {position, number} af {total, number} på ventelisten}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} ændret} other {{name}: {changed, number} ændret, {unchanged, "
      & "number} uændret, {total, number} i alt}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {lyserødt} "
      & "other {{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {knap} link_control {link} tab_control "
      & "{fane} menu_item_control {menupunkt} checkbox_control "
      & "{afkrydsningsfelt} radio_control {alternativknap} text_field_control "
      & "{tekstfelt} progress_control {statuslinje} table_cell_control "
      & "{tabelcelle} region_control {område} other {kontrolelement}} {named, "
      & "select, no {uden navn} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "valgt");
   P ("label.markup.accessible_control_label.expanded", "udvidet");
   P ("label.markup.accessible_control_label.current", "aktuel");
   P ("label.markup.accessible_control_label.disabled", "deaktiveret");
   P ("label.markup.accessible_control_label.required", "påkrævet");
   P ("label.markup.accessible_control_label.invalid", "ugyldig");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.markup.accessible_control_label.position", "element {position, number} af {total, number}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problem} other {{count, number} problemer}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "skema");
   P ("label.endpoints.url_component.host", "vært");
   P ("label.endpoints.url_component.path", "sti");
   P ("label.endpoints.url_component.query", "forespørgsel");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "rødt");
   P ("label.names.hue_noun.orange", "orange");
   P ("label.names.hue_noun.yellow", "gult");
   P ("label.names.hue_noun.green", "grønt");
   P ("label.names.hue_noun.cyan", "cyan");
   P ("label.names.hue_noun.blue", "blåt");
   P ("label.names.hue_noun.purple", "lilla");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutral tone");
   P ("label.names.hue_noun.pink", "lyserødt");
   P ("label.names.hue_gender.red", "neuter");
   P ("label.names.hue_gender.orange", "neuter");
   P ("label.names.hue_gender.yellow", "neuter");
   P ("label.names.hue_gender.green", "neuter");
   P ("label.names.hue_gender.cyan", "neuter");
   P ("label.names.hue_gender.blue", "neuter");
   P ("label.names.hue_gender.purple", "neuter");
   P ("label.names.hue_gender.magenta", "neuter");
   P ("label.names.hue_gender.neutral", "other");
   P ("label.names.hue_gender.pink", "neuter");
   P ("label.names.agree.very_dark", "{gender, select, neuter {meget mørkt} other {meget mørk}}");
   P ("label.names.agree.dark", "{gender, select, neuter {mørkt} other {mørk}}");
   P ("label.names.agree.medium_brightness", "{gender, select, neuter {mellemlyst} other {mellemlys}}");
   P ("label.names.agree.light", "{gender, select, neuter {lyst} other {lys}}");
   P ("label.names.agree.very_light", "{gender, select, neuter {meget lyst} other {meget lys}}");
   P ("label.names.agree.desaturated", "{gender, select, other {afmættet}}");
   P ("label.names.agree.muted", "{gender, select, other {dæmpet}}");
   P ("label.names.agree.neutral", "{gender, select, neuter {neutralt} other {neutral}}");
   P ("label.names.agree.saturated", "{gender, select, other {mættet}}");
   P ("label.names.agree.vivid", "{gender, select, neuter {livligt} other {livlig}}");
   P ("label.names.agree.grayish", "{gender, select, neuter {gråligt} other {grålig}}");
   P ("label.names.agree.soft", "{gender, select, neuter {blødt} other {blød}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {moderat kromatisk}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {højkromatisk}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastelfarvet}}");
   P ("label.names.agree.warm", "{gender, select, neuter {varmt} other {varm}}");
   P ("label.names.agree.cool", "{gender, select, neuter {køligt} other {kølig}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, neuter {temperaturneutralt} other "
      & "{temperaturneutral}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {temperaturbalanceret}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktuel forgrund opfylder kontrast til stor tekst ved {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "aktuel forgrund opfylder kontrast til normal tekst ved {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "brug {v1} for forbedret tekstkontrast {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "brug {v1} for kontrast {v2, number}:{v3, number} til stor tekst");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "brug {v1} for kontrast {v2}:{v3, number} til normal tekst");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "brug {v1} for kontrast {v2}:{v3, number} til stor tekst");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "brug {v1} for forbedret tekstkontrast {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktuel forgrund opfylder kontrast til stor tekst ved {v1, number}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "aktuel forgrund opfylder kontrast til normal tekst ved {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "aktuel forgrund opfylder forbedret tekstkontrast ved {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "aktuel forgrund opfylder forbedret tekstkontrast ved {v1, number}:{v2, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsi: høj forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, stor perceptuel forskel");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatisk perceptuel forskel");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopi: kan skelnes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopi: kan skelnes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopi: kan skelnes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsi: kan skelnes, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstil delta {v1}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, mærkbar perceptuel forskel");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopi: høj forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopi: høj forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, mærkbar perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1}, mærkbar perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, mærkbar perceptuel forskel");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, mærkbar perceptuel forskel");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, stor perceptuel forskel");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopi: høj forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatisk perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, mærkbar perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstil delta {v1}, subtil perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, mærkbar perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, mærkbar perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible", "CIE76 delta {v1}, knap mærkbar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, umærkelig");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstil delta {v1}, umærkelig");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible", "CIEDE2000 delta {v1}, umærkelig");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, umærkelig");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, stor perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible", "CIE76 delta {v1, number}, umærkelig");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible", "CIE94 delta {v1, number}, umærkelig");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstil delta {v1, number}, umærkelig");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, umærkelig");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible", "OKLab delta {v1, number}, umærkelig");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtil perceptuel forskel");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtil perceptuel forskel");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtil perceptuel forskel");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible", "OKLab delta {v1}, knap mærkbar");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 afsnit} other {{v1, number} afsnit}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 minuts taletid} other {{v1, number} minutters "
      & "taletid}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 sætning} other {{v1, number} sætninger}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 minuts læsetid} other {{v1, number} minutters "
      & "læsetid}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 afsnit} other {{v1, number} afsnit}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {under 1 minuts taletid} other {under {v1, number} "
      & "minutters taletid}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {under 1 minuts læsetid} other {under {v1, number} "
      & "minutters læsetid}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 sætning} other {{v1, number} sætninger}}");
   P ("label.metrics.text_summary.no_words", "ingen ord");
   P ("label.metrics.text_summary.no_paragraphs", "ingen afsnit");
   P ("label.metrics.text_summary.no_sentences", "ingen sætninger");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.names.hue_family_label.neutral", "neutral");
   P ("label.names.saturation_label.neutral", "neutral");
   P ("label.names.temperature_label.neutral_temperature", "neutral temperatur");
   P ("label.names.chroma_label.grayish", "grålig");
   P ("label.names.nearest_color_name.black", "sort");
   P ("label.models.brightness_label.very_dark", "meget mørk");
   P ("label.names.hue_family_label.blue", "blå");
   P ("label.names.saturation_label.vivid", "livlig");
   P ("label.names.temperature_label.cool", "kølig");
   P ("label.names.chroma_label.moderate_chroma", "moderat kroma");
   P ("label.names.nearest_color_name.navy", "marineblå");
   P ("label.names.chroma_label.high_chroma", "høj kroma");
   P ("label.names.nearest_color_name.blue", "blå");
   P ("label.names.hue_family_label.green", "grøn");
   P ("label.names.temperature_label.balanced_temperature", "balanceret temperatur");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "blød");
   P ("label.models.brightness_label.dark", "mørk");
   P ("label.names.nearest_color_name.green", "grøn");
   P ("label.names.nearest_color_name.teal", "blågrøn");
   P ("label.models.brightness_label.medium_brightness", "middel lysstyrke");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "limegrøn");
   P ("label.models.brightness_label.light", "lys");
   P ("label.names.hue_family_label.red", "rød");
   P ("label.names.temperature_label.warm", "varm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "lilla");
   P ("label.names.hue_family_label.yellow", "gul");
   P ("label.names.saturation_label.muted", "dæmpet");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "mættet");
   P ("label.names.nearest_color_name.maroon", "rødbrun");
   P ("label.names.nearest_color_name.purple", "lilla");
   P ("label.names.hue_family_label.orange", "orange");
   P ("label.names.nearest_color_name.olive", "olivengrøn");
   P ("label.names.nearest_color_name.gray", "grå");
   P ("label.names.saturation_label.desaturated", "afmættet");
   P ("label.names.nearest_color_name.silver", "sølv");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "meget lys");
   P ("label.names.nearest_color_name.fuchsia", "fuchsia");
   P ("label.names.nearest_color_name.yellow", "gul");
   P ("label.names.nearest_color_name.red", "rød");
   P ("label.names.nearest_color_name.orange", "orange");
   P ("label.names.nearest_color_name.white", "hvid");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} lav kontrast");
   P ("label.contrast.readability_label.low_readability", "lav læsbarhed");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, utilstrækkelig, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} lav kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, utilstrækkelig, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsi: moderat forvekslingsrisiko");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % markant forskel");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} lav kontrast efter alfablanding");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, utilstrækkelig, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, utilstrækkelig, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopi: høj forvekslingsrisiko");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} kontrast til stor tekst");
   P ("label.contrast.readability_label.readable_for_large_text_only", "kun læsbar for stor tekst");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, stor tekst, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} kontrast til stor tekst");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, stor tekst, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopi: høj forvekslingsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrast til stor tekst efter alfablanding");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, kun ikke-tekst, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, kun ikke-tekst, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopi: moderat forvekslingsrisiko");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} lav kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} lav kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, kun ikke-tekst, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, kun ikke-tekst, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopi: moderat forvekslingsrisiko");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopi: høj forvekslingsrisiko");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % meget forskellige");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsi: høj forvekslingsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsi: lav forvekslingsrisiko");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} lav kontrast efter alfablanding");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} kontrast til normal tekst");
   P ("label.contrast.readability_label.readable_for_normal_text", "læsbar for normal tekst");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, brødtekst, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} kontrast til normal tekst");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, brødtekst, lys tekst på mørk baggrund");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, stor tekst, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, stor tekst, mørk tekst på lys baggrund");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % subtil forskel");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, brødtekst, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, brødtekst, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopi: lav forvekslingsrisiko");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % mærkbar forskel");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} kontrast til stor tekst");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} kontrast til stor tekst");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopi: lav forvekslingsrisiko");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} forbedret kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "læsbar med forbedret kontrast");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} forbedret kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtil perceptuel forskel");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopi: kan skelnes");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrast til normal tekst efter alfablanding");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopi: moderat forvekslingsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrast til normal tekst efter alfablanding");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrast til stor tekst efter alfablanding");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, fremragende, mørk tekst på lys baggrund");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, fremragende, mørk tekst på lys baggrund");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrast til normal tekst");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrast til normal tekst");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} forbedret kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, fremragende, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} forbedret kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, fremragende, lys tekst på mørk baggrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopi: kan skelnes");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} forbedret kontrast efter alfablanding");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, knap mærkbar");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % næsten identiske");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopi: lav forvekslingsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsi: kan skelnes");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 farve} other {{v1, number} farver}}");
   P ("label.palettes.palette_summary.mostly_gray", "overvejende grå");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "moderat kontrastspænd");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "baggrund {v1}, tekst {v2}, accent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadisk palet");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "bedste kontrast {v1} på {v2} ved {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} af {v2, number} par opfylder kontrast til normal tekst");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} par: {v1, number} forbedret, {v2, number} normal, {v3, "
      & "number} kun stor tekst, {v4, number} ikke bestået");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 farve} other {{v1, number} farver}}, {v2, number} "
      & "par: {v3, number} forbedret, {v4, number} normal, {v5, number} kun "
      & "stor tekst, {v6, number} ikke bestået");
   P ("label.palettes.palette_mood_label.balanced", "balanceret");
   P ("label.palettes.palette_mood_label.vibrant", "livlig");
   P ("label.palettes.palette_mood_label.warm_mood", "varm stemning");
   P ("label.palettes.palette_summary.mostly_blue", "overvejende blå");
   P ("label.palettes.palette_summary.low_contrast_spread", "lavt kontrastspænd");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palet med én accent");
   P ("label.palettes.palette_mood_label.dark", "mørk");
   P ("label.palettes.palette_mood_label.cool_mood", "kølig stemning");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "overvejende rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "ingen tilgængelige tekstpar");
   P ("label.palettes.palette_mood_label.subtle", "afdæmpet");
   P ("label.palettes.palette_summary.high_contrast_spread", "højt kontrastspænd");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "bedste kontrast {v1} på {v2} ved {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutral stemning");
   P ("label.palettes.palette_summary.mostly_purple", "overvejende lilla");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementær palet");
   P ("label.palettes.palette_summary.mostly_green", "overvejende grøn");
   P ("label.palettes.palette_mood_label.moderate", "moderat");
   P ("label.palettes.palette_summary.mostly_silver", "overvejende sølv");
   P ("label.palettes.palette_harmony_label.varied_palette", "varieret palet");
   P ("label.palettes.palette_summary.mostly_olive", "overvejende olivengrøn");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analog palet");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} af {v2, number} par består kun for stor tekst");
   P ("label.palettes.palette_mood_label.light", "lys");
   P ("label.palettes.palette_summary.mostly_teal", "overvejende blågrøn");
   P ("label.palettes.palette_summary.mostly_aqua", "overvejende aqua");
   P ("label.palettes.palette_summary.mostly_lime", "overvejende limegrøn");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monokrom palet");
   P ("label.palettes.palette_summary.mostly_black", "overvejende sort");
   P ("label.palettes.palette_summary.mostly_yellow", "overvejende gul");
   P ("label.palettes.palette_summary.mostly_maroon", "overvejende rødbrun");
   P ("label.palettes.palette_summary.mostly_white", "overvejende hvid");
   P ("label.palettes.palette_summary.mostly_orange", "overvejende orange");
   P ("label.palettes.palette_summary.mostly_fuchsia", "overvejende fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutral palet");
   P ("label.palettes.palette_summary.mostly_red", "overvejende rød");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {1 sætning} other {{v1, number} sætninger}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 afsnit} other {{v1, number} afsnit}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minuts læsetid} other {{v1, number} minutters "
      & "læsetid}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minuts taletid} other {{v1, number} minutters "
      & "taletid}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 sætning} other {{v1, number} sætninger}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 afsnit} other {{v1, number} afsnit}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minuts læsetid} other {{v1, number} minutters "
      & "læsetid}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 afsnit} other {{v1, number} afsnit}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {under 1 minuts læsetid} other {under {v1, number} "
      & "minutters læsetid}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {under 1 minuts taletid} other {under {v1, number} "
      & "minutters taletid}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 afsnit} other {{v1, number} afsnit}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {under 1 minuts læsetid} other {under {v1, number} "
      & "minutters læsetid}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {1 sætning} other {{v1, number} sætninger}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 sætning} other {{v1, number} sætninger}}");
   P ("label.metrics.word_count_summary.no_words", "ingen ord");
   P ("label.metrics.sentence_count_summary.no_sentences", "ingen sætninger");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "ingen afsnit");
   P ("label.metrics.text_summary_with_options.no_words", "ingen ord");
   P ("label.metrics.text_summary_with_options.no_sentences", "ingen sætninger");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "ingen afsnit");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.endpoints.url_label", "{state, select, empty {tom URL} other {{url}}}");
   P ("label.endpoints.safe_url_label", "{state, select, empty {tom URL} other {{url}}}");
   P ("label.endpoints.url_label.redacted_user", "[skjult bruger]");
   P ("label.endpoints.url_label.query",
      "forespørgsel {count, plural, one {1 parameter} other {{count, number} "
      & "parametre}}");
end Labels_3;
