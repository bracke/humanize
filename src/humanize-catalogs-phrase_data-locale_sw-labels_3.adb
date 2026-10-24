separate (Humanize.Catalogs.Phrase_Data.Locale_Sw)
procedure Labels_3 is
begin
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} haijawekwa} hidden_value {{kind} "
      & "imefichwa} masked_value {{kind} {shown}} fingerprint_only {alama ya "
      & "kidole ya {kind} inayoishia na {shown}} other {{kind} inayoishia na "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name} {kind} haijawekwa} other {{name} {kind} "
      & "inayoishia na {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {kichwa cha kitambulisho {name} hakijawekwa} "
      & "other {{name} {kind} inayoishia na {shown}}}");
   P ("label.secrets.fingerprint_label", "alama ya kidole ya {algorithm} inayoishia na {shown}");
   P ("label.secrets.secret_count_label.total", "{count, plural, one {siri 1} other {siri {count, number}}}");
   P ("label.secrets.secret_count_label.masked", "zilizofichwa {count, number}");
   P ("label.secrets.secret_count_label.unset", "ambazo hazijawekwa {count, number}");
   P ("label.secrets.secret_count_label.fingerprints",
      "{count, plural, one {alama ya kidole 1} other {alama za vidole {count, "
      & "number}}}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} haijawekwa} redacted {{label} "
      & "imefichwa} url_redacted {URL imefichwa} ip_redacted {anwani ya IP "
      & "imefichwa} path_ending {njia ya faili inayoishia na {shown}} at "
      & "{{label} kwenye {shown}} audit {{label} urefu {length, number}, "
      & "inayoishia na {shown}} debug {{label} {shown}} other {{label} "
      & "inayoishia na {shown}}}");
   P ("label.schema.field_label",
      "sehemu ya {kind, select, string_field {mfuatano} integer_field "
      & "{nambari kamili} decimal_field {desimali} boolean_field {boolean} "
      & "date_field {tarehe} date_time_field {tarehe na saa} object_field "
      & "{kitu} array_field {safu} enum_field {enum} binary_field {binari} "
      & "null_field {null} any_field {aina yoyote} other {aina isiyojulikana}} "
      & "{name} {presence, select, required_field {inayohitajika} "
      & "optional_field {ya hiari} conditional_field {ya masharti} other {uwepo "
      & "haujulikani}}{nullable, select, non_nullable {, isiyo null} nullable "
      & "{, inaweza kuwa null} other {}}{state, select, deprecated_field {, "
      & "iliyoacha kutumika} unknown_field {, isiyojulikana} read_only_field {, "
      & "ya kusoma tu} write_only_field {, ya kuandika tu} computed_field {, "
      & "iliyokokotolewa} other {}}");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {sehemu 1} other {sehemu {count, number}}}");
   P ("label.schema.schema_summary_label.required", "zinazohitajika {count, number}");
   P ("label.schema.schema_summary_label.optional", "za hiari {count, number}");
   P ("label.schema.schema_summary_label.deprecated", "zilizoacha kutumika {count, number}");
   P ("label.schema.schema_summary_label.unknown", "zisizojulikana {count, number}");
   P ("label.schema.type_mismatch_label",
      "sehemu {field_name} ilitarajia {expected, select, string_field "
      & "{mfuatano} integer_field {nambari kamili} decimal_field {desimali} "
      & "boolean_field {boolean} date_field {tarehe} date_time_field {tarehe na "
      & "saa} object_field {kitu} array_field {safu} enum_field {enum} "
      & "binary_field {binari} null_field {null} any_field {yoyote} other "
      & "{haijulikani}}, ikapata {actual, select, string_field {mfuatano} "
      & "integer_field {nambari kamili} decimal_field {desimali} boolean_field "
      & "{boolean} date_field {tarehe} date_time_field {tarehe na saa} "
      & "object_field {kitu} array_field {safu} enum_field {enum} binary_field "
      & "{binari} null_field {null} any_field {yoyote} other {haijulikani}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {tatizo 1 "
      & "linalozuia} other {matatizo {blocking, number} yanayozuia}}} blocking "
      & "{{base}, {blocking, plural, one {tatizo 1 linalozuia} other {matatizo "
      & "{blocking, number} yanayozuia}}} only {{base} tu} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "hakuna ukaguzi ulioendeshwa");
   P ("label.diagnostics.check_run_summary_label.passed", "zilizofaulu {count, number}");
   P ("label.diagnostics.check_run_summary_label.failed", "zilizoshindwa {count, number}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {onyo 1} other {maonyo {count, number}}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "zilizorukwa {count, number}");
   P ("label.diagnostics.check_run_summary_label.pending", "zinazosubiri {count, number}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {kiwango lengwa {low} hadi "
      & "{high}} other {dirisha lengwa {low} hadi {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} ndani ya kiwango kinachotarajiwa} "
      & "below {{value} chini ya kiwango kinachotarajiwa} other {{value} juu ya "
      & "kiwango kinachotarajiwa}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} kwenye kizingiti muhimu} warning "
      & "{{value} kwenye kizingiti cha onyo} other {{value} ndani ya kiwango "
      & "cha kawaida}}");
   P ("label.thresholds.breach_label", "{state, select, ok {hakijavukwa} other {kimevukwa kwa {difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {kwenye lengo} below {{difference} chini ya lengo} "
      & "other {{difference} juu ya lengo}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {kikomo kimevukwa} near {karibu na kikomo, "
      & "{distance} imebaki} other {{distance} kutoka kikomo}}");
   P ("label.thresholds.threshold_summary_label.none", "hakuna vipimo");
   P ("label.thresholds.threshold_summary_label.normal", "za kawaida {count, number}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {onyo 1} other {maonyo {count, number}}}");
   P ("label.thresholds.threshold_summary_label.critical", "muhimu {count, number}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {ukiukaji 1} other {ukiukaji {count, number}}}");
   P ("label.thresholds.target_window_label", "lengo {target} jumlisha/toa {tolerance}");
   P ("label.thresholds.tolerance_label", "ustahimilivu {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} ya kikomo");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {kikomo kimezidishwa kwa {amount}} other "
      & "{{amount} imebaki}}");
   P ("label.thresholds.budget_used_label", "{used} imetumika kati ya {budget}");
   P ("label.workflows.step_label", "hatua {current, number} kati ya {total, number}: {name}");
   P ("label.workflows.milestone_label",
      "hatua muhimu {current, number} kati ya {total, number} zimekamilika: "
      & "{name}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {kipengee 1} other {vipengee {count, number}}}");
   P ("label.workflows.workflow_summary_label.completed", "vilivyokamilika {count, number}");
   P ("label.workflows.workflow_summary_label.active", "vinavyoendelea {count, number}");
   P ("label.workflows.workflow_summary_label.blocked", "vilivyozuiwa {count, number}");
   P ("label.workflows.workflow_summary_label.failed", "vilivyoshindwa {count, number}");
   P ("label.workflows.workflow_summary_label.skipped", "vilivyorukwa {count, number}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {hakuna vipengee vya mtiririko wa kazi} half "
      & "{nusu ya mtiririko wa kazi imekamilika} other {{completed, number} "
      & "kati ya {total, number} zimekamilika}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {nafasi kwenye foleni {position, number}} other "
      & "{nafasi kwenye foleni {position, number} kati ya {total, number}}}");
   P ("label.changes.change_set_label.none", "hakuna mabadiliko");
   P ("label.changes.change_set_label.added", "zilizoongezwa {count, number}");
   P ("label.changes.change_set_label.removed", "zilizoondolewa {count, number}");
   P ("label.changes.change_set_label.modified", "zilizobadilishwa {count, number}");
   P ("label.changes.change_set_label.unchanged", "zisizobadilika {count, number}");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {kipengee 1} other {vipengee {count, number}}}");
   P ("label.changes.change_summary_label.added", "zilizoongezwa {count, number}");
   P ("label.changes.change_summary_label.removed", "zilizoondolewa {count, number}");
   P ("label.changes.change_summary_label.modified", "zilizobadilishwa {count, number}");
   P ("label.changes.change_summary_label.renamed", "zilizobadilishwa jina {count, number}");
   P ("label.changes.change_summary_label.unchanged", "zisizobadilika {count, number}");
   P ("label.changes.sync_change_label.none", "hakuna mabadiliko ya usawazishaji");
   P ("label.changes.sync_change_label.uploaded", "zilizopakiwa {count, number}");
   P ("label.changes.sync_change_label.downloaded", "zilizopakuliwa {count, number}");
   P ("label.changes.sync_change_label.deleted", "zilizofutwa {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {mgongano 1} other {migongano {count, number}}}");
   P ("label.changes.net_change_label",
      "{state, select, none {hakuna badiliko halisi} up {halisi +{count, "
      & "plural, one {kipengee 1} other {vipengee {count, number}}}} other "
      & "{halisi -{count, plural, one {kipengee 1} other {vipengee {count, "
      & "number}}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {hakuna mabadiliko ya kukagua} all {mabadiliko "
      & "yote yamekaguliwa} other {mabadiliko {reviewed, number} kati ya "
      & "{total, number} yamekaguliwa}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} haijabadilika, {new_value}} up "
      & "{{field_name} imeongezeka kutoka {old_value} hadi {new_value}} other "
      & "{{field_name} imepungua kutoka {old_value} hadi {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {hakuna safu zinazoweza kuchaguliwa} none "
      & "{hakuna safu zilizochaguliwa} all {{total, plural, one {safu 1 "
      & "imechaguliwa} other {safu zote {total, number} zimechaguliwa}}} other "
      & "{safu {selected, number} kati ya {total, number} zimechaguliwa}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {hakuna kurasa} other {{pages, plural, =0 {hakuna "
      & "kurasa} other {{rows, plural, =0 {ukurasa {page, number} kati ya "
      & "{pages, number}} one {ukurasa {page, number} kati ya {pages, number}, "
      & "safu 1} other {ukurasa {page, number} kati ya {pages, number}, safu "
      & "{rows, number}}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {hakuna safu} none {hakuna safu zinazolingana} "
      & "all {{total, plural, one {safu 1 inaonekana} other {safu zote {total, "
      & "number} zinaonekana}}} other {safu {visible, number} kati ya {total, "
      & "number} zinaonekana}}");
   P ("label.tables.row_range_label",
      "{state, select, none {hakuna safu} single {safu {first_row, number} "
      & "kati ya {total, number}} other {safu {first_row, number}-{last_row, "
      & "number} kati ya {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {hakuna kikomo cha herufi} none_left {hakuna "
      & "herufi zilizobaki} left {{count, plural, one {herufi 1 imebaki} other "
      & "{herufi {count, number} zimebaki}}} other {{count, plural, one {herufi "
      & "1 zaidi ya kikomo} other {herufi {count, number} zaidi ya kikomo}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {hakuna sehemu zinazohitajika} one {{missing, "
      & "plural, =0 {sehemu zote zinazohitajika zimejazwa} other {sehemu 1 kati "
      & "ya 1 inayohitajika haijajazwa}}} other {{missing, plural, =0 {sehemu "
      & "zote zinazohitajika zimejazwa} other {sehemu {missing, number} kati ya "
      & "{total, number} zinazohitajika hazijajazwa}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {hakuna sehemu} all {sehemu zote zimekamilika} "
      & "other {sehemu {completed, number} kati ya {total, number} "
      & "zimekamilika}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: hakuna sehemu} all {{name}: sehemu zote "
      & "zimekamilika} other {{name}: sehemu {completed, number} kati ya "
      & "{total, number} zimekamilika}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {hakuna hatua za fomu} other {hatua {current, "
      & "number} kati ya {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {hakuna njia ya urambazaji} other {njia ya "
      & "urambazaji {current, number} kati ya {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {hakuna vichupo} other {kichupo {current, number} "
      & "kati ya {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {kikasha tupu} one {{unread, plural, =0 {arifa zote "
      & "zimesomwa} other {arifa 1 kati ya 1 haijasomwa}}} other {{unread, "
      & "plural, =0 {arifa zote zimesomwa} other {arifa {unread, number} kati "
      & "ya {total, number} hazijasomwa}}}}");
   P ("label.notifications.delivery_attempt_label",
      "jaribio la kuwasilisha {attempt, number} kati ya {max_attempts, "
      & "number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {hakuna vipengee vya orodha hakiki} other {vipengee "
      & "{done, number} kati ya {total, number} vimekamilika}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {hakuna upakiaji} other {upakiaji {done, number} "
      & "kati ya {total, number} umekamilika}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {hakuna nafasi} other {viti {reserved, number} "
      & "kati ya {capacity, number} vimehifadhiwa}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {nafasi kwenye orodha ya kusubiri {position, "
      & "number}} other {nafasi kwenye orodha ya kusubiri {position, number} "
      & "kati ya {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} zimebadilika} other {{name}: zilizobadilika {changed, number}, "
      & "zisizobadilika {unchanged, number}, jumla {total, number}}}");
   P ("label.names.color_description", "{hue} {saturation}, {brightness}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {waridi} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {kitufe} link_control {kiungo} "
      & "tab_control {kichupo} menu_item_control {kipengee cha menyu} "
      & "checkbox_control {kisanduku cha kuteua} radio_control {kitufe cha "
      & "redio} text_field_control {sehemu ya maandishi} progress_control "
      & "{kiashiria cha maendeleo} table_cell_control {kisanduku cha jedwali} "
      & "region_control {eneo} other {kidhibiti}} {named, select, no {kisicho "
      & "na jina} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "kimechaguliwa");
   P ("label.markup.accessible_control_label.expanded", "kimepanuliwa");
   P ("label.markup.accessible_control_label.current", "cha sasa");
   P ("label.markup.accessible_control_label.disabled", "kimezimwa");
   P ("label.markup.accessible_control_label.required", "kinahitajika");
   P ("label.markup.accessible_control_label.invalid", "si sahihi");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {kipengee 1} other {vipengee {count, number}}}");
   P ("label.markup.accessible_control_label.position", "kipengee {position} kati ya {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {tatizo 1} other {matatizo {count, number}}}");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "mpango");
   P ("label.endpoints.url_component.host", "seva");
   P ("label.endpoints.url_component.path", "njia");
   P ("label.endpoints.url_component.query", "hoja");
   P ("label.endpoints.url_component.fragment", "kipande");
   P ("label.names.hue_noun.red", "nyekundu");
   P ("label.names.hue_noun.orange", "rangi ya chungwa");
   P ("label.names.hue_noun.yellow", "njano");
   P ("label.names.hue_noun.green", "kijani");
   P ("label.names.hue_noun.cyan", "siani");
   P ("label.names.hue_noun.blue", "bluu");
   P ("label.names.hue_noun.purple", "zambarau");
   P ("label.names.hue_noun.magenta", "majenta");
   P ("label.names.hue_noun.neutral", "rangi ya kati");
   P ("label.names.hue_noun.pink", "waridi");
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
   P ("label.names.agree.very_dark", "{gender, select, other {giza sana}}");
   P ("label.names.agree.dark", "{gender, select, other {giza}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {yenye mwangaza wa wastani}}");
   P ("label.names.agree.light", "{gender, select, other {angavu}}");
   P ("label.names.agree.very_light", "{gender, select, other {angavu sana}}");
   P ("label.names.agree.desaturated", "{gender, select, other {isiyokolea}}");
   P ("label.names.agree.muted", "{gender, select, other {iliyofifia}}");
   P ("label.names.agree.neutral", "{gender, select, other {ya kati}}");
   P ("label.names.agree.saturated", "{gender, select, other {iliyokolea}}");
   P ("label.names.agree.vivid", "{gender, select, other {kali}}");
   P ("label.names.agree.grayish", "{gender, select, other {kijivujivu}}");
   P ("label.names.agree.soft", "{gender, select, other {laini}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {yenye kroma ya wastani}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {yenye kroma ya juu}}");
   P ("label.names.agree.pastel", "{gender, select, other {pasteli}}");
   P ("label.names.agree.warm", "{gender, select, other {ya joto}}");
   P ("label.names.agree.cool", "{gender, select, other {ya baridi}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {yenye joto la kati}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {yenye joto lililosawazishwa}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "rangi ya mbele ya sasa inafikia utofautishaji wa maandishi makubwa kwa "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "rangi ya mbele ya sasa inafikia utofautishaji wa maandishi ya kawaida "
      & "kwa {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "tumia {v1} kupata utofautishaji ulioimarishwa wa maandishi wa {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "tumia {v1} kupata utofautishaji wa maandishi makubwa wa {v2, "
      & "number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "tumia {v1} kupata utofautishaji wa maandishi ya kawaida wa {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "tumia {v1} kupata utofautishaji wa maandishi makubwa wa {v2}:{v3, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "tumia {v1} kupata utofautishaji ulioimarishwa wa maandishi wa "
      & "{v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "rangi ya mbele ya sasa inafikia utofautishaji wa maandishi makubwa kwa "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "rangi ya mbele ya sasa inafikia utofautishaji wa maandishi ya kawaida "
      & "kwa {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "rangi ya mbele ya sasa inafikia utofautishaji ulioimarishwa wa "
      & "maandishi kwa {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "rangi ya mbele ya sasa inafikia utofautishaji ulioimarishwa wa "
      & "maandishi kwa {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopia: hatari ndogo ya kuchanganya, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopia: hatari ya wastani ya kuchanganya, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopia: hatari ya wastani ya kuchanganya, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsia: hatari kubwa ya kuchanganya, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 nguo delta {v1}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, tofauti kubwa inayoonekana");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopia: hatari ya wastani ya kuchanganya, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, tofauti kubwa mno inayoonekana");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsia: hatari ndogo ya kuchanganya, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopia: zinatofautishika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopia: zinatofautishika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopia: zinatofautishika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsia: zinatofautishika, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsia: hatari ya wastani ya kuchanganya, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 nguo delta {v1}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, tofauti inayoonekana wazi");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopia: hatari kubwa ya kuchanganya, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopia: hatari kubwa ya kuchanganya, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, tofauti inayoonekana wazi");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 nguo delta {v1}, tofauti inayoonekana wazi");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, tofauti inayoonekana wazi");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, tofauti inayoonekana wazi");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopia: hatari ndogo ya kuchanganya, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopia: hatari ndogo ya kuchanganya, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, tofauti kubwa inayoonekana");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopia: hatari kubwa ya kuchanganya, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 nguo delta {v1, number}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, tofauti kubwa mno inayoonekana");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 nguo delta {v1, number}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, tofauti inayoonekana wazi");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 nguo delta {v1}, tofauti ndogo inayoonekana");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, tofauti inayoonekana wazi");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 nguo delta {v1, number}, tofauti inayoonekana wazi");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, haionekani kwa urahisi");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, haionekani");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 nguo delta {v1}, haionekani");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible", "CIEDE2000 delta {v1}, haionekani");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, haionekani");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, tofauti kubwa inayoonekana");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible", "CIE76 delta {v1, number}, haionekani");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible", "CIE94 delta {v1, number}, haionekani");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 nguo delta {v1, number}, haionekani");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, haionekani");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible", "OKLab delta {v1, number}, haionekani");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, tofauti ndogo inayoonekana");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, tofauti ndogo inayoonekana");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, tofauti ndogo inayoonekana");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, haionekani kwa urahisi");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {neno 1} other {maneno {v1, number}}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {aya 1} other {aya {v1, number}}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {dakika 1 ya kuzungumza} other {dakika {v1, number} "
      & "za kuzungumza}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {sentensi 1} other {sentensi {v1, number}}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {dakika 1 ya kusoma} other {dakika {v1, number} za "
      & "kusoma}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {aya 1} other {aya {v1, number}}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "chini ya {v1, plural, one {dakika 1 ya kuzungumza} other {dakika {v1, "
      & "number} za kuzungumza}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "chini ya {v1, plural, one {dakika 1 ya kusoma} other {dakika {v1, "
      & "number} za kusoma}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {sentensi 1} other {sentensi {v1, number}}}");
   P ("label.metrics.text_summary.no_words", "hakuna maneno");
   P ("label.metrics.text_summary.no_paragraphs", "hakuna aya");
   P ("label.metrics.text_summary.no_sentences", "hakuna sentensi");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {neno 1} other {maneno {v1, number}}}");
   P ("label.names.hue_family_label.neutral", "kati");
   P ("label.names.saturation_label.neutral", "kati");
   P ("label.names.temperature_label.neutral_temperature", "joto la kati");
   P ("label.names.chroma_label.grayish", "kijivujivu");
   P ("label.names.nearest_color_name.black", "nyeusi");
   P ("label.models.brightness_label.very_dark", "giza sana");
   P ("label.names.hue_family_label.blue", "bluu");
   P ("label.names.saturation_label.vivid", "kali");
   P ("label.names.temperature_label.cool", "baridi");
   P ("label.names.chroma_label.moderate_chroma", "kroma ya wastani");
   P ("label.names.nearest_color_name.navy", "bluu nzito");
   P ("label.names.chroma_label.high_chroma", "kroma ya juu");
   P ("label.names.nearest_color_name.blue", "bluu");
   P ("label.names.hue_family_label.green", "kijani");
   P ("label.names.temperature_label.balanced_temperature", "joto lililosawazishwa");
   P ("label.names.hue_family_label.cyan", "siani");
   P ("label.names.chroma_label.soft", "laini");
   P ("label.models.brightness_label.dark", "giza");
   P ("label.names.nearest_color_name.green", "kijani");
   P ("label.names.nearest_color_name.teal", "kijani-bluu");
   P ("label.models.brightness_label.medium_brightness", "mwangaza wa wastani");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "kijani cha limau");
   P ("label.models.brightness_label.light", "angavu");
   P ("label.names.hue_family_label.red", "nyekundu");
   P ("label.names.temperature_label.warm", "joto");
   P ("label.names.hue_family_label.magenta", "majenta");
   P ("label.names.hue_family_label.purple", "zambarau");
   P ("label.names.hue_family_label.yellow", "njano");
   P ("label.names.saturation_label.muted", "iliyofifia");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "iliyokolea");
   P ("label.names.nearest_color_name.maroon", "maruni");
   P ("label.names.nearest_color_name.purple", "zambarau");
   P ("label.names.hue_family_label.orange", "rangi ya chungwa");
   P ("label.names.nearest_color_name.olive", "kijani cha zeituni");
   P ("label.names.nearest_color_name.gray", "kijivu");
   P ("label.names.saturation_label.desaturated", "isiyokolea");
   P ("label.names.nearest_color_name.silver", "fedha");
   P ("label.names.chroma_label.pastel", "pasteli");
   P ("label.models.brightness_label.very_light", "angavu sana");
   P ("label.names.nearest_color_name.fuchsia", "fuksia");
   P ("label.names.nearest_color_name.yellow", "njano");
   P ("label.names.nearest_color_name.red", "nyekundu");
   P ("label.names.nearest_color_name.orange", "rangi ya chungwa");
   P ("label.names.nearest_color_name.white", "nyeupe");
   P ("label.contrast.contrast_label.d_n_low_contrast", "utofautishaji mdogo {v1}:{v2, number}");
   P ("label.contrast.readability_label.low_readability", "usomekaji mdogo");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, haitoshi, maandishi meusi kwenye mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "utofautishaji mdogo {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, haitoshi, maandishi meusi kwenye mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsia: hatari ya wastani ya kuchanganya");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% tofauti kubwa");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "utofautishaji mdogo {v1}:{v2, number} baada ya kuunganisha alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, haitoshi, maandishi angavu kwenye mandharinyuma yenye "
      & "giza");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, haitoshi, maandishi angavu kwenye mandharinyuma yenye "
      & "giza");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopia: hatari kubwa ya kuchanganya");
   P ("label.contrast.contrast_label.d_n_large_text_contrast",
      "utofautishaji wa maandishi makubwa {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_large_text_only", "inasomeka kwa maandishi makubwa tu");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, maandishi makubwa, maandishi angavu kwenye "
      & "mandharinyuma yenye giza");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "utofautishaji wa maandishi makubwa {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, maandishi makubwa, maandishi angavu kwenye "
      & "mandharinyuma yenye giza");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopia: hatari kubwa ya kuchanganya");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "utofautishaji wa maandishi makubwa {v1}:{v2, number} baada ya "
      & "kuunganisha alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, yasiyo maandishi tu, maandishi angavu kwenye "
      & "mandharinyuma yenye giza");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, yasiyo maandishi tu, maandishi angavu kwenye "
      & "mandharinyuma yenye giza");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopia: hatari ya wastani ya kuchanganya");
   P ("label.contrast.contrast_label.n_n_low_contrast", "utofautishaji mdogo {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "utofautishaji mdogo {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, yasiyo maandishi tu, maandishi meusi kwenye "
      & "mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, yasiyo maandishi tu, maandishi meusi kwenye "
      & "mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopia: hatari ya wastani ya kuchanganya");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopia: hatari kubwa ya kuchanganya");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% tofauti sana");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsia: hatari kubwa ya kuchanganya");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsia: hatari ndogo ya kuchanganya");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "utofautishaji mdogo {v1, number}:{v2, number} baada ya kuunganisha "
      & "alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast",
      "utofautishaji wa maandishi ya kawaida {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_normal_text", "inasomeka kwa maandishi ya kawaida");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, maandishi ya maudhui, maandishi angavu kwenye "
      & "mandharinyuma yenye giza");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "utofautishaji wa maandishi ya kawaida {v1}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, maandishi ya maudhui, maandishi angavu kwenye "
      & "mandharinyuma yenye giza");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, maandishi makubwa, maandishi meusi kwenye "
      & "mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, maandishi makubwa, maandishi meusi kwenye "
      & "mandharinyuma angavu");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% tofauti ndogo");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, maandishi ya maudhui, maandishi meusi kwenye "
      & "mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, maandishi ya maudhui, maandishi meusi kwenye "
      & "mandharinyuma angavu");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopia: hatari ndogo ya kuchanganya");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% tofauti inayoonekana");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "utofautishaji wa maandishi makubwa {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "utofautishaji wa maandishi makubwa {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopia: hatari ndogo ya kuchanganya");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "utofautishaji ulioimarishwa {v1}:{v2, number}");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "inasomeka kwa utofautishaji ulioimarishwa");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast",
      "utofautishaji ulioimarishwa {v1}:{v2, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, tofauti ndogo inayoonekana");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopia: zinatofautishika");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "utofautishaji wa maandishi ya kawaida {v1, number}:{v2, number} baada "
      & "ya kuunganisha alfa");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopia: hatari ya wastani ya kuchanganya");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "utofautishaji wa maandishi ya kawaida {v1}:{v2, number} baada ya "
      & "kuunganisha alfa");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "utofautishaji wa maandishi makubwa {v1, number}:{v2, number} baada ya "
      & "kuunganisha alfa");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, bora kabisa, maandishi meusi kwenye mandharinyuma "
      & "angavu");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, bora kabisa, maandishi meusi kwenye mandharinyuma "
      & "angavu");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "utofautishaji wa maandishi ya kawaida {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "utofautishaji wa maandishi ya kawaida {v1, number}:{v2, number}");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "utofautishaji ulioimarishwa {v1, number}:{v2, number}");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, bora kabisa, maandishi angavu kwenye mandharinyuma "
      & "yenye giza");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "utofautishaji ulioimarishwa {v1, number}:{v2, number}");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, bora kabisa, maandishi angavu kwenye mandharinyuma "
      & "yenye giza");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopia: zinatofautishika");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "utofautishaji ulioimarishwa {v1}:{v2, number} baada ya kuunganisha "
      & "alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, haionekani kwa urahisi");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% karibu sawa kabisa");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopia: hatari ndogo ya kuchanganya");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsia: zinatofautishika");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {rangi 1} other {rangi {v1, number}}}");
   P ("label.palettes.palette_summary.mostly_gray", "kwa kiasi kikubwa kijivu");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "mtawanyiko wa wastani wa utofautishaji");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c",
      "mandharinyuma {v1}, maandishi {v2}, msisitizo {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "paleti ya utatu");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "utofautishaji bora: {v1} juu ya {v2} kwa {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, plural, one {jozi 1 kati ya {v2, number} inapita} other {jozi "
      & "{v1, number} kati ya {v2, number} zinapita}} utofautishaji wa "
      & "maandishi ya kawaida");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "kati ya jozi {v5, number}: {v1, number} zilizoimarishwa, {v2, number} "
      & "za kawaida, {v3, number} za maandishi makubwa tu, {v4, number} "
      & "zimeshindwa");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {rangi 1} other {rangi {v1, number}}}, jozi {v2, "
      & "number}: {v3, number} zilizoimarishwa, {v4, number} za kawaida, {v5, "
      & "number} za maandishi makubwa tu, {v6, number} zimeshindwa");
   P ("label.palettes.palette_mood_label.balanced", "yenye uwiano");
   P ("label.palettes.palette_mood_label.vibrant", "changamfu");
   P ("label.palettes.palette_mood_label.warm_mood", "hisia ya joto");
   P ("label.palettes.palette_summary.mostly_blue", "kwa kiasi kikubwa bluu");
   P ("label.palettes.palette_summary.low_contrast_spread", "mtawanyiko mdogo wa utofautishaji");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paleti ya msisitizo mmoja");
   P ("label.palettes.palette_mood_label.dark", "giza");
   P ("label.palettes.palette_mood_label.cool_mood", "hisia ya baridi");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "kwa kiasi kikubwa rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "hakuna jozi za maandishi zinazofikika");
   P ("label.palettes.palette_mood_label.subtle", "hafifu");
   P ("label.palettes.palette_summary.high_contrast_spread", "mtawanyiko mkubwa wa utofautishaji");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "utofautishaji bora: {v1} juu ya {v2} kwa {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "hisia ya kati");
   P ("label.palettes.palette_summary.mostly_purple", "kwa kiasi kikubwa zambarau");
   P ("label.palettes.palette_harmony_label.complementary_palette", "paleti kamilishi");
   P ("label.palettes.palette_summary.mostly_green", "kwa kiasi kikubwa kijani");
   P ("label.palettes.palette_mood_label.moderate", "ya wastani");
   P ("label.palettes.palette_summary.mostly_silver", "kwa kiasi kikubwa fedha");
   P ("label.palettes.palette_harmony_label.varied_palette", "paleti mchanganyiko");
   P ("label.palettes.palette_summary.mostly_olive", "kwa kiasi kikubwa kijani cha zeituni");
   P ("label.palettes.palette_harmony_label.analogous_palette", "paleti ya rangi jirani");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, plural, one {jozi 1 kati ya {v2, number} inapita} other {jozi "
      & "{v1, number} kati ya {v2, number} zinapita}} kwa maandishi makubwa tu");
   P ("label.palettes.palette_mood_label.light", "angavu");
   P ("label.palettes.palette_summary.mostly_teal", "kwa kiasi kikubwa kijani-bluu");
   P ("label.palettes.palette_summary.mostly_aqua", "kwa kiasi kikubwa aqua");
   P ("label.palettes.palette_summary.mostly_lime", "kwa kiasi kikubwa kijani cha limau");
end Labels_3;
