separate (Humanize.Catalogs.Phrase_Data.Locale_Eo)
procedure Labels_3 is
begin
   P ("label.schema.field_label",
      "{state, select, deprecated_field {malrekomendita } unknown_field "
      & "{nekonata } read_only_field {nurlega } write_only_field {nurskriba } "
      & "computed_field {kalkulita } other {}}{presence, select, required_field "
      & "{deviga} optional_field {nedeviga} conditional_field {kondiĉa} other "
      & "{nekonate ĉu deviga}}{nullable, select, non_nullable { ne-nulebla} "
      & "nullable { nulebla} other {}} kampo {name} de tipo {kind, select, "
      & "string_field {ĉeno} integer_field {entjero} decimal_field {dekuma "
      & "nombro} boolean_field {bulea} date_field {dato} date_time_field "
      & "{dato-horo} object_field {objekto} array_field {tabelo} enum_field "
      & "{listigo} binary_field {duuma} null_field {nulo} any_field {ajna} "
      & "other {nekonata}}");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {1 kampo} other {{count, number} kampoj}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {1 deviga} other {{count, number} devigaj}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {1 nedeviga} other {{count, number} nedevigaj}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {1 malrekomendita} other {{count, number} "
      & "malrekomenditaj}}");
   P ("label.schema.schema_summary_label.unknown",
      "{count, plural, one {1 nekonata} other {{count, number} nekonataj}}");
   P ("label.schema.type_mismatch_label",
      "kampo {field_name}: atendita {expected, select, string_field {ĉeno} "
      & "integer_field {entjero} decimal_field {dekuma nombro} boolean_field "
      & "{bulea valoro} date_field {dato} date_time_field {dato-horo} "
      & "object_field {objekto} array_field {tabelo} enum_field {listigo} "
      & "binary_field {duuma valoro} null_field {nulo} any_field {ajna} other "
      & "{nekonata}}, ricevita {actual, select, string_field {ĉeno} "
      & "integer_field {entjero} decimal_field {dekuma nombro} boolean_field "
      & "{bulea valoro} date_field {dato} date_time_field {dato-horo} "
      & "object_field {objekto} array_field {tabelo} enum_field {listigo} "
      & "binary_field {duuma valoro} null_field {nulo} any_field {ajna} other "
      & "{nekonata}}");
   P ("label.diagnostics.issue_summary_label",
      "{state, select, blocking_only {{blocking, plural, one {1 bloka "
      & "problemo} other {{blocking, number} blokaj problemoj}}} blocking "
      & "{{base}, {blocking, plural, one {1 bloka problemo} other {{blocking, "
      & "number} blokaj problemoj}}} only {nur {base}} other {{base}}}");
   P ("label.diagnostics.check_run_summary_label.none", "neniuj kontroloj rulitaj");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} sukcesis");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} malsukcesis");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 averto} other {{count, number} avertoj}}");
   P ("label.diagnostics.check_run_summary_label.skipped",
      "{count, plural, one {1 preterlasita} other {{count, number} "
      & "preterlasitaj}}");
   P ("label.diagnostics.check_run_summary_label.pending",
      "{count, plural, one {1 atendanta} other {{count, number} atendantaj}}");
   P ("label.thresholds.metric_value_label", "{name} {value}");
   P ("label.thresholds.range_label",
      "{inclusive, select, inclusive_window {cela intervalo de {low} ĝis "
      & "{high} inkluzive} other {cela fenestro de {low} ĝis {high}}}");
   P ("label.thresholds.window_status_label",
      "{state, select, inside {{value} en la atendata intervalo} below "
      & "{{value} sub la atendata intervalo} other {{value} super la atendata "
      & "intervalo}}");
   P ("label.thresholds.threshold_status_label",
      "{state, select, critical {{value} ĉe la kritika sojlo} warning "
      & "{{value} ĉe la avertosojlo} other {{value} en la normala intervalo}}");
   P ("label.thresholds.breach_label",
      "{state, select, ok {ne transpasita} other {transpasita je "
      & "{difference}}}");
   P ("label.thresholds.target_delta_label",
      "{state, select, at {ĉe la celo} below {{difference} sub la celo} "
      & "other {{difference} super la celo}}");
   P ("label.thresholds.near_limit_label",
      "{state, select, breached {limo transpasita} near {proksime al la limo, "
      & "restas {distance}} other {{distance} ĝis la limo}}");
   P ("label.thresholds.threshold_summary_label.none", "neniuj metrikoj");
   P ("label.thresholds.threshold_summary_label.normal",
      "{count, plural, one {1 normala} other {{count, number} normalaj}}");
   P ("label.thresholds.threshold_summary_label.warnings",
      "{count, plural, one {1 averto} other {{count, number} avertoj}}");
   P ("label.thresholds.threshold_summary_label.critical",
      "{count, plural, one {1 kritika} other {{count, number} kritikaj}}");
   P ("label.thresholds.threshold_summary_label.breaches",
      "{count, plural, one {1 transpaso} other {{count, number} transpasoj}}");
   P ("label.thresholds.target_window_label", "celo {target} plus/minus {tolerance}");
   P ("label.thresholds.tolerance_label", "toleremo {tolerance}");
   P ("label.thresholds.percent_of_limit_label", "{percent} de la limo");
   P ("label.thresholds.remaining_to_limit_label",
      "{state, select, exceeded {limo transpasita je {amount}} other {restas "
      & "{amount}}}");
   P ("label.thresholds.budget_used_label", "{used} uzita el {budget}");
   P ("label.workflows.step_label", "paŝo {current, number} el {total, number}: {name}");
   P ("label.workflows.milestone_label", "{current, number} el {total, number} mejloŝtonoj atingitaj: {name}");
   P ("label.workflows.workflow_summary_label.total", "{count, plural, one {1 ero} other {{count, number} eroj}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {1 finita} other {{count, number} finitaj}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {1 aktiva} other {{count, number} aktivaj}}");
   P ("label.workflows.workflow_summary_label.blocked",
      "{count, plural, one {1 blokita} other {{count, number} blokitaj}}");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} malsukcesis");
   P ("label.workflows.workflow_summary_label.skipped",
      "{count, plural, one {1 preterlasita} other {{count, number} "
      & "preterlasitaj}}");
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {neniuj laborfluaj eroj} half {duonvoje tra la "
      & "laborfluo} other {{completed, number} el {total, number} faritaj}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {vicposicio {position, number}} other {vicposicio "
      & "{position, number} el {total, number}}}");
   P ("label.changes.change_set_label.none", "neniuj ŝanĝoj");
   P ("label.changes.change_set_label.added", "{count, plural, one {1 aldonita} other {{count, number} aldonitaj}}");
   P ("label.changes.change_set_label.removed",
      "{count, plural, one {1 forigita} other {{count, number} forigitaj}}");
   P ("label.changes.change_set_label.modified",
      "{count, plural, one {1 ŝanĝita} other {{count, number} ŝanĝitaj}}");
   P ("label.changes.change_set_label.unchanged",
      "{count, plural, one {1 senŝanĝa} other {{count, number} "
      & "senŝanĝaj}}");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 ero} other {{count, number} eroj}}");
   P ("label.changes.change_summary_label.added",
      "{count, plural, one {1 aldonita} other {{count, number} aldonitaj}}");
   P ("label.changes.change_summary_label.removed",
      "{count, plural, one {1 forigita} other {{count, number} forigitaj}}");
   P ("label.changes.change_summary_label.modified",
      "{count, plural, one {1 ŝanĝita} other {{count, number} ŝanĝitaj}}");
   P ("label.changes.change_summary_label.renamed",
      "{count, plural, one {1 renomita} other {{count, number} renomitaj}}");
   P ("label.changes.change_summary_label.unchanged",
      "{count, plural, one {1 senŝanĝa} other {{count, number} "
      & "senŝanĝaj}}");
   P ("label.changes.sync_change_label.none", "neniuj sinkronigaj ŝanĝoj");
   P ("label.changes.sync_change_label.uploaded",
      "{count, plural, one {1 alŝutita} other {{count, number} alŝutitaj}}");
   P ("label.changes.sync_change_label.downloaded",
      "{count, plural, one {1 elŝutita} other {{count, number} elŝutitaj}}");
   P ("label.changes.sync_change_label.deleted",
      "{count, plural, one {1 forigita} other {{count, number} forigitaj}}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {1 konflikto} other {{count, number} konfliktoj}}");
   P ("label.changes.net_change_label",
      "{state, select, none {neniu neta ŝanĝo} up {nete +{count, plural, "
      & "one {1 ero} other {{count, number} eroj}}} other {nete -{count, "
      & "plural, one {1 ero} other {{count, number} eroj}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {neniuj ŝanĝoj por kontroli} all {ĉiuj "
      & "ŝanĝoj kontrolitaj} other {{reviewed, number} el {total, number} "
      & "ŝanĝoj kontrolitaj}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} senŝanĝa je {new_value}} up "
      & "{{field_name} kreskis de {old_value} al {new_value}} other "
      & "{{field_name} malkreskis de {old_value} al {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {neniuj elekteblaj vicoj} none {neniuj vicoj "
      & "elektitaj} all {{total, plural, one {1 vico elektita} other {ĉiuj "
      & "{total, number} vicoj elektitaj}}} other {{selected, number} el "
      & "{total, plural, one {1 vico} other {{total, number} vicoj}} "
      & "elektitaj}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {neniuj paĝoj} other {{pages, plural, =0 {neniuj "
      & "paĝoj} other {{rows, plural, =0 {paĝo {page, number} el {pages, "
      & "number}} one {paĝo {page, number} el {pages, number}, 1 vico} other "
      & "{paĝo {page, number} el {pages, number}, {rows, number} vicoj}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {neniuj vicoj} none {neniuj kongruaj vicoj} "
      & "all {{total, plural, one {1 vico videbla} other {ĉiuj {total, number} "
      & "vicoj videblaj}}} other {{visible, number} el {total, plural, one {1 "
      & "vico} other {{total, number} vicoj}} videblaj}}");
   P ("label.tables.row_range_label",
      "{state, select, none {neniuj vicoj} single {vico {first_row, number} "
      & "el {total, number}} other {vicoj {first_row, number}–{last_row, "
      & "number} el {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {neniu signolimo} none_left {restas neniuj "
      & "signoj} left {restas {count, plural, one {1 signo} other {{count, "
      & "number} signoj}}} other {{count, plural, one {1 signo} other {{count, "
      & "number} signoj}} super la limo}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {neniuj devigaj kampoj} one {{missing, plural, =0 "
      & "{ĉiuj devigaj kampoj plenigitaj} other {mankas 1 el 1 deviga kampo}}} "
      & "other {{missing, plural, =0 {ĉiuj devigaj kampoj plenigitaj} other "
      & "{mankas {missing, number} el {total, number} devigaj kampoj}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {neniuj kampoj} all {ĉiuj kampoj plenigitaj} "
      & "other {{completed, number} el {total, plural, one {1 kampo} other "
      & "{{total, number} kampoj}} plenigitaj}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: neniuj kampoj} all {{name}: ĉiuj kampoj "
      & "plenigitaj} other {{name}: {completed, number} el {total, plural, one "
      & "{1 kampo} other {{total, number} kampoj}} plenigitaj}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {neniuj formularaj paŝoj} one {paŝo 1 el 1: "
      & "{name}} other {paŝo {current, number} el {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {neniuj navigadaj vojeroj} one {navigada vojero 1 "
      & "el 1: {name}} other {navigada vojero {current, number} el {total, "
      & "number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {neniuj langetoj} one {langeto 1 el 1: {name}} "
      & "other {langeto {current, number} el {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {malplena enirkesto} one {{unread, plural, =0 "
      & "{ĉiuj sciigoj legitaj} other {1 nelegita el 1 sciigo}}} other "
      & "{{unread, plural, =0 {ĉiuj sciigoj legitaj} other {{unread, number} "
      & "nelegitaj el {total, number} sciigoj}}}}");
   P ("label.notifications.delivery_attempt_label", "liverprovo {attempt, number} el {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {neniuj kontrollistaj eroj} one {{done, plural, =0 "
      & "{0 el 1 ero farita} other {1 el 1 ero farita}}} other {{done, number} "
      & "el {total, number} eroj faritaj}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {neniuj alŝutoj} one {{done, plural, =0 {0 el 1 "
      & "alŝuto finita} other {1 el 1 alŝuto finita}}} other {{done, number} "
      & "el {total, number} alŝutoj finitaj}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {neniu kapacito} one {{reserved, plural, =0 {0 "
      & "el 1 sidloko rezervita} other {1 el 1 sidloko rezervita}}} other "
      & "{{reserved, number} el {capacity, number} sidlokoj rezervitaj}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {atendolista posicio {position, number}} other "
      & "{atendolista posicio {position, number} el {total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} ŝanĝitaj} other {{name}: {changed, number} ŝanĝitaj, "
      & "{unchanged, number} senŝanĝaj, {total, number} entute}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {sennoma {role, select, button_control {butono} "
      & "link_control {ligilo} tab_control {langeto} menu_item_control "
      & "{menuero} checkbox_control {markobutono} radio_control {radiobutono} "
      & "text_field_control {tekstokampo} progress_control {progresindikilo} "
      & "table_cell_control {tabelĉelo} region_control {regiono} other "
      & "{regilo}}} other {{role, select, button_control {butono} link_control "
      & "{ligilo} tab_control {langeto} menu_item_control {menuero} "
      & "checkbox_control {markobutono} radio_control {radiobutono} "
      & "text_field_control {tekstokampo} progress_control {progresindikilo} "
      & "table_cell_control {tabelĉelo} region_control {regiono} other "
      & "{regilo}} {name}}}");
   P ("label.markup.accessible_control_label.selected", "elektita");
   P ("label.markup.accessible_control_label.expanded", "malfaldita");
   P ("label.markup.accessible_control_label.current", "nuna");
   P ("label.markup.accessible_control_label.disabled", "malŝaltita");
   P ("label.markup.accessible_control_label.required", "deviga");
   P ("label.markup.accessible_control_label.invalid", "nevalida");
   P ("label.markup.accessible_control_label.count", "{count, plural, one {1 ero} other {{count, number} eroj}}");
   P ("label.markup.accessible_control_label.position", "ero {position} el {total}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problemo} other {{count, number} problemoj}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "skemo");
   P ("label.endpoints.url_component.host", "gastiganto");
   P ("label.endpoints.url_component.path", "vojo");
   P ("label.endpoints.url_component.query", "demando");
   P ("label.endpoints.url_component.fragment", "fragmento");
   P ("label.names.hue_noun.red", "ruĝo");
   P ("label.names.hue_noun.orange", "oranĝo");
   P ("label.names.hue_noun.yellow", "flavo");
   P ("label.names.hue_noun.green", "verdo");
   P ("label.names.hue_noun.cyan", "cejano");
   P ("label.names.hue_noun.blue", "bluo");
   P ("label.names.hue_noun.purple", "purpuro");
   P ("label.names.hue_noun.magenta", "magento");
   P ("label.names.hue_noun.neutral", "neŭtrala koloro");
   P ("label.names.hue_noun.pink", "rozkoloro");
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
   P ("label.names.agree.very_dark", "{gender, select, other {tre malhela}}");
   P ("label.names.agree.dark", "{gender, select, other {malhela}}");
   P ("label.names.agree.medium_brightness", "{gender, select, other {mezhela}}");
   P ("label.names.agree.light", "{gender, select, other {hela}}");
   P ("label.names.agree.very_light", "{gender, select, other {tre hela}}");
   P ("label.names.agree.desaturated", "{gender, select, other {malsaturita}}");
   P ("label.names.agree.muted", "{gender, select, other {obtuza}}");
   P ("label.names.agree.neutral", "{gender, select, other {neŭtrala}}");
   P ("label.names.agree.saturated", "{gender, select, other {saturita}}");
   P ("label.names.agree.vivid", "{gender, select, other {vigla}}");
   P ("label.names.agree.grayish", "{gender, select, other {grizeta}}");
   P ("label.names.agree.soft", "{gender, select, other {mola}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {modere kromata}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {alte kromata}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastela}}");
   P ("label.names.agree.warm", "{gender, select, other {varma}}");
   P ("label.names.agree.cool", "{gender, select, other {malvarmeta}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {temperature neŭtrala}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {temperature ekvilibra}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "la nuna malfona koloro plenumas la kontraston por granda teksto je "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "la nuna malfona koloro plenumas la kontraston por normala teksto je "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "uzu {v1} por plifortigita tekstkontrasto de {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "uzu {v1} por kontrasto por granda teksto de {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "uzu {v1} por kontrasto por normala teksto de {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "uzu {v1} por kontrasto por granda teksto de {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "uzu {v1} por plifortigita tekstkontrasto de {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "la nuna malfona koloro plenumas la kontraston por granda teksto je "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "la nuna malfona koloro plenumas la kontraston por normala teksto je "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "la nuna malfona koloro plenumas la plifortigitan tekstkontraston je "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "la nuna malfona koloro plenumas la plifortigitan tekstkontraston je "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopio: malalta konfuzrisko, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deŭteranopio: modera konfuzrisko, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopio: modera konfuzrisko, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsio: alta konfuzrisko, delto {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delto {v1}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delto {v1}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 teksaĵa delto {v1}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delto {v1, number}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delto {v1}, granda percepta diferenco");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopio: modera konfuzrisko, delto {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delto {v1, number}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delto {v1}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delto {v1}, drasta percepta diferenco");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsio: malalta konfuzrisko, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopio: distingeblaj, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deŭteranopio: distingeblaj, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopio: distingeblaj, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsio: distingeblaj, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsio: modera konfuzrisko, delto {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delto {v1}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delto {v1}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 teksaĵa delto {v1}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delto {v1}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delto {v1}, rimarkebla diferenco");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopio: alta konfuzrisko, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopio: alta konfuzrisko, delto {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delto {v1}, rimarkebla diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 teksaĵa delto {v1}, rimarkebla diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delto {v1}, rimarkebla diferenco");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delto {v1, number}, rimarkebla diferenco");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopio: malalta konfuzrisko, delto {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deŭteranopio: malalta konfuzrisko, delto {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delto {v1, number}, granda percepta diferenco");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deŭteranopio: alta konfuzrisko, delto {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delto {v1, number}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 teksaĵa delto {v1, number}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delto {v1, number}, drasta percepta diferenco");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delto {v1, number}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 teksaĵa delto {v1, number}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delto {v1, number}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delto {v1}, rimarkebla diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 teksaĵa delto {v1}, subtila percepta diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delto {v1, number}, rimarkebla diferenco");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 teksaĵa delto {v1, number}, rimarkebla diferenco");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delto {v1}, apenaŭ perceptebla");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delto {v1}, neperceptebla");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 teksaĵa delto {v1}, neperceptebla");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delto {v1}, neperceptebla");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delto {v1}, neperceptebla");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delto {v1, number}, granda percepta diferenco");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delto {v1, number}, neperceptebla");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delto {v1, number}, neperceptebla");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 teksaĵa delto {v1, number}, neperceptebla");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delto {v1, number}, neperceptebla");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delto {v1, number}, neperceptebla");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delto {v1}, subtila percepta diferenco");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delto {v1}, subtila percepta diferenco");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delto {v1}, subtila percepta diferenco");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delto {v1}, apenaŭ perceptebla");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 vorto} other {{v1, number} vortoj}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 alineo} other {{v1, number} alineoj}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 minuto da parolado} other {{v1, number} minutoj da "
      & "parolado}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 frazo} other {{v1, number} frazoj}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 minuto da legado} other {{v1, number} minutoj da "
      & "legado}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 alineo} other {{v1, number} alineoj}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {malpli ol 1 minuto da parolado} other {malpli ol "
      & "{v1, number} minutoj da parolado}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {malpli ol 1 minuto da legado} other {malpli ol {v1, "
      & "number} minutoj da legado}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 frazo} other {{v1, number} frazoj}}");
   P ("label.metrics.text_summary.no_words", "neniuj vortoj");
   P ("label.metrics.text_summary.no_paragraphs", "neniuj alineoj");
   P ("label.metrics.text_summary.no_sentences", "neniuj frazoj");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 vorto} other {{v1, number} vortoj}}");
   P ("label.names.hue_family_label.neutral", "neŭtrala");
   P ("label.names.saturation_label.neutral", "neŭtrala");
   P ("label.names.temperature_label.neutral_temperature", "neŭtrala temperaturo");
   P ("label.names.chroma_label.grayish", "grizeta");
   P ("label.names.nearest_color_name.black", "nigro");
   P ("label.models.brightness_label.very_dark", "tre malhela");
   P ("label.names.hue_family_label.blue", "bluo");
   P ("label.names.saturation_label.vivid", "vigla");
   P ("label.names.temperature_label.cool", "malvarmeta");
   P ("label.names.chroma_label.moderate_chroma", "modera kromato");
   P ("label.names.nearest_color_name.navy", "marbluo");
   P ("label.names.chroma_label.high_chroma", "alta kromato");
   P ("label.names.nearest_color_name.blue", "bluo");
   P ("label.names.hue_family_label.green", "verdo");
   P ("label.names.temperature_label.balanced_temperature", "ekvilibra temperaturo");
   P ("label.names.hue_family_label.cyan", "cejano");
   P ("label.names.chroma_label.soft", "mola");
   P ("label.models.brightness_label.dark", "malhela");
   P ("label.names.nearest_color_name.green", "verdo");
   P ("label.names.nearest_color_name.teal", "bluverdo");
   P ("label.models.brightness_label.medium_brightness", "meza heleco");
   P ("label.names.nearest_color_name.aqua", "akvobluo");
   P ("label.names.nearest_color_name.lime", "brilverdo");
   P ("label.models.brightness_label.light", "hela");
   P ("label.names.hue_family_label.red", "ruĝo");
   P ("label.names.temperature_label.warm", "varma");
   P ("label.names.hue_family_label.magenta", "magento");
   P ("label.names.hue_family_label.purple", "purpuro");
   P ("label.names.hue_family_label.yellow", "flavo");
   P ("label.names.saturation_label.muted", "obtuza");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturita");
   P ("label.names.nearest_color_name.maroon", "bordoo");
   P ("label.names.nearest_color_name.purple", "purpuro");
   P ("label.names.hue_family_label.orange", "oranĝo");
   P ("label.names.nearest_color_name.olive", "olivverdo");
   P ("label.names.nearest_color_name.gray", "grizo");
   P ("label.names.saturation_label.desaturated", "malsaturita");
   P ("label.names.nearest_color_name.silver", "arĝento");
   P ("label.names.chroma_label.pastel", "pastela");
   P ("label.models.brightness_label.very_light", "tre hela");
   P ("label.names.nearest_color_name.fuchsia", "fuksio");
   P ("label.names.nearest_color_name.yellow", "flavo");
   P ("label.names.nearest_color_name.red", "ruĝo");
   P ("label.names.nearest_color_name.orange", "oranĝo");
   P ("label.names.nearest_color_name.white", "blanko");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} malalta kontrasto");
   P ("label.contrast.readability_label.low_readability", "malalta legebleco");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nesufiĉa, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} malalta kontrasto");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, nesufiĉa, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsio: modera konfuzrisko");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% forta diferenco");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} malalta kontrasto post alfa-komponado");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nesufiĉa, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, nesufiĉa, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deŭteranopio: alta konfuzrisko");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} kontrasto por granda teksto");
   P ("label.contrast.readability_label.readable_for_large_text_only", "legebla nur por granda teksto");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, granda teksto, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} kontrasto por granda teksto");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, granda teksto, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk", "tritanopio: alta konfuzrisko");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrasto por granda teksto post alfa-komponado");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, nur ne-teksto, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, nur ne-teksto, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopio: modera konfuzrisko");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} malalta kontrasto");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} malalta kontrasto");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, nur ne-teksto, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, nur ne-teksto, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deŭteranopio: modera konfuzrisko");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk", "protanopio: alta konfuzrisko");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% tre malsamaj");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsio: alta konfuzrisko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsio: malalta konfuzrisko");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} malalta kontrasto post alfa-komponado");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} kontrasto por normala teksto");
   P ("label.contrast.readability_label.readable_for_normal_text", "legebla por normala teksto");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, korpa teksto, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} kontrasto por normala teksto");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, korpa teksto, hela teksto sur malhela fono");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, granda teksto, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, granda teksto, malhela teksto sur hela fono");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% subtila diferenco");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, korpa teksto, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, korpa teksto, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk", "tritanopio: malalta konfuzrisko");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% rimarkebla diferenco");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number} kontrasto por granda teksto");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} kontrasto por granda teksto");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deŭteranopio: malalta konfuzrisko");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} plifortigita kontrasto");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "legebla laŭ plifortigita kontrasto");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} plifortigita kontrasto");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delto {v1, number}, subtila percepta diferenco");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopio: distingeblaj");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrasto por normala teksto post "
      & "alfa-komponado");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopio: modera konfuzrisko");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrasto por normala teksto post alfa-komponado");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrasto por granda teksto post "
      & "alfa-komponado");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, bonega, malhela teksto sur hela fono");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, bonega, malhela teksto sur hela fono");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrasto por normala teksto");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrasto por normala teksto");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} plifortigita kontrasto");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, bonega, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} plifortigita kontrasto");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, bonega, hela teksto sur malhela fono");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deŭteranopio: distingeblaj");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} plifortigita kontrasto post alfa-komponado");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delto {v1, number}, apenaŭ perceptebla");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% preskaŭ identaj");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk", "protanopio: malalta konfuzrisko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsio: distingeblaj");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 koloro} other {{v1, number} koloroj}}");
   P ("label.palettes.palette_summary.mostly_gray", "ĉefe griza");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "modera kontrasta disvastiĝo");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "fono {v1}, teksto {v2}, akcento {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triada paletro");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "plej bona kontrasto {v1} sur {v2} je {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} el {v2, number} paroj plenumas la kontraston por normala "
      & "teksto");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, plural, one {1 plifortigita} other {{v1, number} plifortigitaj}}, "
      & "{v2, plural, one {1 normala} other {{v2, number} normalaj}}, {v3, "
      & "plural, one {1 nur granda} other {{v3, number} nur grandaj}}, {v4, "
      & "plural, one {1 malsukcesa} other {{v4, number} malsukcesaj}} el {v5, "
      & "number} paroj");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 koloro} other {{v1, number} koloroj}}, {v2, "
      & "plural, one {1 paro} other {{v2, number} paroj}}: {v3, plural, one {1 "
      & "plifortigita} other {{v3, number} plifortigitaj}}, {v4, plural, one {1 "
      & "normala} other {{v4, number} normalaj}}, {v5, plural, one {1 nur "
      & "granda} other {{v5, number} nur grandaj}}, {v6, plural, one {1 "
      & "malsukcesa} other {{v6, number} malsukcesaj}}");
   P ("label.palettes.palette_mood_label.balanced", "ekvilibra");
   P ("label.palettes.palette_mood_label.vibrant", "vigla");
   P ("label.palettes.palette_mood_label.warm_mood", "varma etoso");
   P ("label.palettes.palette_summary.mostly_blue", "ĉefe blua");
   P ("label.palettes.palette_summary.low_contrast_spread", "malalta kontrasta disvastiĝo");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "unuakcenta paletro");
   P ("label.palettes.palette_mood_label.dark", "malhela");
   P ("label.palettes.palette_mood_label.cool_mood", "malvarmeta etoso");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "ĉefe rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "neniuj alireblaj tekstparoj");
   P ("label.palettes.palette_mood_label.subtle", "subtila");
   P ("label.palettes.palette_summary.high_contrast_spread", "alta kontrasta disvastiĝo");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "plej bona kontrasto {v1} sur {v2} je {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neŭtrala etoso");
   P ("label.palettes.palette_summary.mostly_purple", "ĉefe purpura");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementa paletro");
   P ("label.palettes.palette_summary.mostly_green", "ĉefe verda");
   P ("label.palettes.palette_mood_label.moderate", "modera");
   P ("label.palettes.palette_summary.mostly_silver", "ĉefe arĝenta");
   P ("label.palettes.palette_harmony_label.varied_palette", "varia paletro");
   P ("label.palettes.palette_summary.mostly_olive", "ĉefe olivverda");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analoga paletro");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} el {v2, number} paroj plenumas nur por granda teksto");
   P ("label.palettes.palette_mood_label.light", "hela");
   P ("label.palettes.palette_summary.mostly_teal", "ĉefe bluverda");
   P ("label.palettes.palette_summary.mostly_aqua", "ĉefe akvoblua");
   P ("label.palettes.palette_summary.mostly_lime", "ĉefe brilverda");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "unukolora paletro");
   P ("label.palettes.palette_summary.mostly_black", "ĉefe nigra");
   P ("label.palettes.palette_summary.mostly_yellow", "ĉefe flava");
   P ("label.palettes.palette_summary.mostly_maroon", "ĉefe bordoa");
   P ("label.palettes.palette_summary.mostly_white", "ĉefe blanka");
   P ("label.palettes.palette_summary.mostly_orange", "ĉefe oranĝa");
   P ("label.palettes.palette_summary.mostly_fuchsia", "ĉefe fuksia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neŭtrala paletro");
   P ("label.palettes.palette_summary.mostly_red", "ĉefe ruĝa");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 vorto} other {{v1, number} vortoj}}");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, plural, one {1 frazo} other {{v1, number} frazoj}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 alineo} other {{v1, number} alineoj}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minuto da legado} other {{v1, number} minutoj da "
      & "legado}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minuto da parolado} other {{v1, number} minutoj da "
      & "parolado}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 vorto} other {{v1, number} vortoj}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 frazo} other {{v1, number} frazoj}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 alineo} other {{v1, number} alineoj}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minuto da legado} other {{v1, number} minutoj da "
      & "legado}}");
end Labels_3;
