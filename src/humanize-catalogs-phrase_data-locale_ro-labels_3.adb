separate (Humanize.Catalogs.Phrase_Data.Locale_Ro)
procedure Labels_3 is
begin
   P ("label.workflows.workflow_progress_label",
      "{state, select, none {niciun element de flux} half {flux finalizat pe "
      & "jumătate} other {finalizate {completed, number} din {total, number}}}");
   P ("label.workflows.queue_position_label",
      "{total, plural, =0 {poziția în coadă {position, number}} other "
      & "{poziția în coadă {position, number} din {total, number}}}");
   P ("label.changes.change_set_label.none", "nicio modificare");
   P ("label.changes.change_set_label.added", "adăugate: {count, number}");
   P ("label.changes.change_set_label.removed", "eliminate: {count, number}");
   P ("label.changes.change_set_label.modified", "modificate: {count, number}");
   P ("label.changes.change_set_label.unchanged", "nemodificate: {count, number}");
   P ("label.changes.sync_change_label.none", "nicio modificare de sincronizare");
   P ("label.changes.sync_change_label.uploaded", "încărcate: {count, number}");
   P ("label.changes.sync_change_label.downloaded", "descărcate: {count, number}");
   P ("label.changes.sync_change_label.deleted", "șterse: {count, number}");
   P ("label.changes.sync_change_label.conflicts",
      "{count, plural, one {{count, number} conflict} few {{count, number} "
      & "conflicte} other {{count, number} de conflicte}}");
   P ("label.changes.net_change_label",
      "{state, select, none {nicio modificare netă} up {net +{count, plural, "
      & "one {{count, number} element} few {{count, number} elemente} other "
      & "{{count, number} de elemente}}} other {net -{count, plural, one "
      & "{{count, number} element} few {{count, number} elemente} other "
      & "{{count, number} de elemente}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {nicio modificare de revizuit} all {toate "
      & "modificările revizuite} other {modificări revizuite: {reviewed, "
      & "number} din {total, number}}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name}: nemodificat, {new_value}} up "
      & "{{field_name}: crescut de la {old_value} la {new_value}} other "
      & "{{field_name}: scăzut de la {old_value} la {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {niciun rând selectabil} none {niciun rând "
      & "selectat} all {{total, plural, one {1 rând selectat} few {toate cele "
      & "{total, number} rânduri selectate} other {toate cele {total, number} "
      & "de rânduri selectate}}} other {rânduri selectate: {selected, number} "
      & "din {total, number}}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {nicio pagină} other {{pages, plural, =0 {nicio "
      & "pagină} other {{rows, plural, =0 {pagina {page, number} din {pages, "
      & "number}} one {pagina {page, number} din {pages, number}, 1 rând} few "
      & "{pagina {page, number} din {pages, number}, {rows, number} rânduri} "
      & "other {pagina {page, number} din {pages, number}, {rows, number} de "
      & "rânduri}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {niciun rând} none {niciun rând "
      & "corespunzător} all {{total, plural, one {1 rând vizibil} few {toate "
      & "cele {total, number} rânduri vizibile} other {toate cele {total, "
      & "number} de rânduri vizibile}}} other {rânduri vizibile: {visible, "
      & "number} din {total, number}}}");
   P ("label.tables.row_range_label",
      "{state, select, none {niciun rând} single {rândul {first_row, "
      & "number} din {total, number}} other {rândurile {first_row, "
      & "number}–{last_row, number} din {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {fără limită de caractere} none_left "
      & "{niciun caracter rămas} left {caractere rămase: {count, number}} "
      & "other {limită depășită cu {count, plural, one {{count, number} "
      & "caracter} few {{count, number} caractere} other {{count, number} de "
      & "caractere}}}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {niciun câmp obligatoriu} =1 {{missing, plural, =0 "
      & "{toate câmpurile obligatorii completate} other {lipsește 1 din 1 "
      & "câmp obligatoriu}}} other {{missing, plural, =0 {toate câmpurile "
      & "obligatorii completate} other {câmpuri obligatorii lipsă: {missing, "
      & "number} din {total, number}}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {niciun câmp} all {toate câmpurile completate} "
      & "other {câmpuri completate: {completed, number} din {total, number}}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: niciun câmp} all {{name}: toate "
      & "câmpurile completate} other {{name}: câmpuri completate: {completed, "
      & "number} din {total, number}}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {niciun pas de formular} =1 {pasul 1 din 1: {name}} "
      & "other {pasul {current, number} din {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {nicio cale de navigare} =1 {elementul de cale 1 "
      & "din 1: {name}} other {elementul de cale {current, number} din {total, "
      & "number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {nicio filă} =1 {fila 1 din 1: {name}} other {fila "
      & "{current, number} din {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {căsuță de mesaje goală} =1 {{unread, plural, "
      & "=0 {toate notificările citite} other {necitite: 1 din 1}}} other "
      & "{{unread, plural, =0 {toate notificările citite} other {necitite: "
      & "{unread, number} din {total, number}}}}}");
   P ("label.notifications.delivery_attempt_label",
      "încercarea de livrare {attempt, number} din {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {niciun element în listă} =1 {{done, plural, =0 "
      & "{elemente finalizate: 0 din 1} other {elemente finalizate: 1 din 1}}} "
      & "other {elemente finalizate: {done, number} din {total, number}}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {nicio încărcare} =1 {{done, plural, =0 "
      & "{încărcări finalizate: 0 din 1} other {încărcări finalizate: 1 "
      & "din 1}}} other {încărcări finalizate: {done, number} din {total, "
      & "number}}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {niciun loc} =1 {{reserved, plural, =0 {locuri "
      & "rezervate: 0 din 1} other {locuri rezervate: 1 din 1}}} other {locuri "
      & "rezervate: {reserved, number} din {capacity, number}}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {poziția pe lista de așteptare {position, "
      & "number}} other {poziția pe lista de așteptare {position, number} din "
      & "{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name}: modificate {changed, "
      & "number}/{total, number}} other {{name}: modificate {changed, number}, "
      & "nemodificate {unchanged, number}, total {total, number}}}");
   P ("label.names.color_description", "{brightness}, {hue} {saturation}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{base, select, pink {roz} other {{hue}}} {brightness} {chroma} "
      & "{temperature}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "culoarea actuală a primului plan respectă contrastul pentru text "
      & "mare la {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "culoarea actuală a primului plan respectă contrastul pentru text "
      & "normal la {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "folosiți {v1}: contrast sporit pentru text {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "folosiți {v1}: contrast {v2, number}:{v3, number} pentru text mare");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "folosiți {v1}: contrast {v2}:{v3, number} pentru text normal");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "folosiți {v1}: contrast {v2}:{v3, number} pentru text mare");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "folosiți {v1}: contrast sporit pentru text {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "culoarea actuală a primului plan respectă contrastul pentru text "
      & "mare la {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "culoarea actuală a primului plan respectă contrastul pentru text "
      & "normal la {v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "culoarea actuală a primului plan respectă contrastul sporit pentru "
      & "text la {v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "culoarea actuală a primului plan respectă contrastul sporit pentru "
      & "text la {v1, number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopie: risc scăzut de confuzie a culorilor, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopie: risc moderat de confuzie a culorilor, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopie: risc moderat de confuzie a culorilor, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "acromatopsie: risc ridicat de confuzie a culorilor, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76, delta {v1}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94, delta {v1}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 (textile), delta {v1}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000, delta {v1, number}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab, delta {v1}, diferență perceptuală mare");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopie: risc moderat de confuzie a culorilor, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94, delta {v1, number}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000, delta {v1}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab, delta {v1}, diferență perceptuală dramatică");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "acromatopsie: risc scăzut de confuzie a culorilor, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopie: culori distincte, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopie: culori distincte, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopie: culori distincte, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "acromatopsie: culori distincte, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "acromatopsie: risc moderat de confuzie a culorilor, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76, delta {v1}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94, delta {v1}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 (textile), delta {v1}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000, delta {v1}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab, delta {v1}, diferență perceptuală vizibilă");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopie: risc ridicat de confuzie a culorilor, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopie: risc ridicat de confuzie a culorilor, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94, delta {v1}, diferență perceptuală vizibilă");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 (textile), delta {v1}, diferență perceptuală vizibilă");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000, delta {v1}, diferență perceptuală vizibilă");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab, delta {v1, number}, diferență perceptuală vizibilă");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopie: risc scăzut de confuzie a culorilor, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopie: risc scăzut de confuzie a culorilor, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab, delta {v1, number}, diferență perceptuală mare");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopie: risc ridicat de confuzie a culorilor, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76, delta {v1, number}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 (textile), delta {v1, number}, diferență perceptuală "
      & "dramatică");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab, delta {v1, number}, diferență perceptuală dramatică");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76, delta {v1, number}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 (textile), delta {v1, number}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000, delta {v1, number}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76, delta {v1}, diferență perceptuală vizibilă");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 (textile), delta {v1}, diferență perceptuală subtilă");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000, delta {v1, number}, diferență perceptuală vizibilă");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 (textile), delta {v1, number}, diferență perceptuală "
      & "vizibilă");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76, delta {v1}, abia perceptibil");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94, delta {v1}, imperceptibil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 (textile), delta {v1}, imperceptibil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000, delta {v1}, imperceptibil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab, delta {v1}, imperceptibil");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94, delta {v1, number}, diferență perceptuală mare");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76, delta {v1, number}, imperceptibil");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94, delta {v1, number}, imperceptibil");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 (textile), delta {v1, number}, imperceptibil");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000, delta {v1, number}, imperceptibil");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab, delta {v1, number}, imperceptibil");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab, delta {v1}, diferență perceptuală subtilă");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94, delta {v1}, diferență perceptuală subtilă");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000, delta {v1}, diferență perceptuală subtilă");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab, delta {v1}, abia perceptibil");
   P ("label.metrics.text_summary.n_words",
      "{v1, plural, one {{v1, number} cuvânt} few {{v1, number} cuvinte} "
      & "other {{v1, number} de cuvinte}}");
   P ("label.metrics.text_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} paragraf} few {{v1, number} paragrafe} "
      & "other {{v1, number} de paragrafe}}");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} min de vorbit");
   P ("label.metrics.text_summary.n_sentences",
      "{v1, plural, one {{v1, number} propoziție} few {{v1, number} "
      & "propoziții} other {{v1, number} de propoziții}}");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} min de citit");
   P ("label.metrics.text_summary.n_paragraph",
      "{v1, plural, one {{v1, number} paragraf} few {{v1, number} paragrafe} "
      & "other {{v1, number} de paragrafe}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "sub {v1, number} min de vorbit");
   P ("label.metrics.text_summary.less_than_n_minute_read", "sub {v1, number} min de citit");
   P ("label.metrics.text_summary.n_sentence",
      "{v1, plural, one {{v1, number} propoziție} few {{v1, number} "
      & "propoziții} other {{v1, number} de propoziții}}");
   P ("label.metrics.text_summary.no_words", "niciun cuvânt");
   P ("label.metrics.text_summary.no_paragraphs", "niciun paragraf");
   P ("label.metrics.text_summary.no_sentences", "nicio propoziție");
   P ("label.metrics.text_summary.n_word",
      "{v1, plural, one {{v1, number} cuvânt} few {{v1, number} cuvinte} "
      & "other {{v1, number} de cuvinte}}");
   P ("label.names.hue_family_label.neutral", "neutru");
   P ("label.names.saturation_label.neutral", "neutru");
   P ("label.names.temperature_label.neutral_temperature", "temperatură neutră");
   P ("label.names.chroma_label.grayish", "cenușiu");
   P ("label.names.nearest_color_name.black", "negru");
   P ("label.models.brightness_label.very_dark", "foarte închis");
   P ("label.names.hue_family_label.blue", "albastru");
   P ("label.names.saturation_label.vivid", "viu");
   P ("label.names.temperature_label.cool", "rece");
   P ("label.names.chroma_label.moderate_chroma", "cromă moderată");
   P ("label.names.nearest_color_name.navy", "bleumarin");
   P ("label.names.chroma_label.high_chroma", "cromă ridicată");
   P ("label.names.nearest_color_name.blue", "albastru");
   P ("label.names.hue_family_label.green", "verde");
   P ("label.names.temperature_label.balanced_temperature", "temperatură echilibrată");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "delicat");
   P ("label.models.brightness_label.dark", "închis");
   P ("label.names.nearest_color_name.green", "verde");
   P ("label.names.nearest_color_name.teal", "verde-albastru");
   P ("label.models.brightness_label.medium_brightness", "luminozitate medie");
   P ("label.names.nearest_color_name.aqua", "turcoaz");
   P ("label.names.nearest_color_name.lime", "verde-lime");
   P ("label.models.brightness_label.light", "deschis");
   P ("label.names.hue_family_label.red", "roșu");
   P ("label.names.temperature_label.warm", "cald");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "violet");
   P ("label.names.hue_family_label.yellow", "galben");
   P ("label.names.saturation_label.muted", "estompat");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "saturat");
   P ("label.names.nearest_color_name.maroon", "grena");
   P ("label.names.nearest_color_name.purple", "violet");
   P ("label.names.hue_family_label.orange", "portocaliu");
   P ("label.names.nearest_color_name.olive", "oliv");
   P ("label.names.nearest_color_name.gray", "gri");
   P ("label.names.saturation_label.desaturated", "desaturat");
   P ("label.names.nearest_color_name.silver", "argintiu");
   P ("label.names.chroma_label.pastel", "pastel");
   P ("label.models.brightness_label.very_light", "foarte deschis");
   P ("label.names.nearest_color_name.fuchsia", "fucsia");
   P ("label.names.nearest_color_name.yellow", "galben");
   P ("label.names.nearest_color_name.red", "roșu");
   P ("label.names.nearest_color_name.orange", "portocaliu");
   P ("label.names.nearest_color_name.white", "alb");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number}, contrast scăzut");
   P ("label.contrast.readability_label.low_readability", "lizibilitate scăzută");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuficient, text închis pe fundal deschis");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number}, contrast scăzut");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, insuficient, text închis pe fundal deschis");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "acromatopsie: risc moderat de confuzie a culorilor");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} %, diferență puternică");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contrast scăzut după compunerea alfa");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuficient, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, insuficient, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopie: risc ridicat de confuzie a culorilor");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number}, contrast pentru text mare");
   P ("label.contrast.readability_label.readable_for_large_text_only", "lizibil doar pentru text mare");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, text mare, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number}, contrast pentru text mare");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, text mare, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopie: risc ridicat de confuzie a culorilor");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contrast pentru text mare după compunerea alfa");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, doar elemente non-text, text deschis pe fundal "
      & "închis");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, doar elemente non-text, text deschis pe fundal "
      & "închis");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopie: risc moderat de confuzie a culorilor");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number}, contrast scăzut");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number}, contrast scăzut");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, doar elemente non-text, text închis pe fundal "
      & "deschis");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, doar elemente non-text, text închis pe fundal "
      & "deschis");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopie: risc moderat de confuzie a culorilor");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopie: risc ridicat de confuzie a culorilor");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} %, foarte diferite");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "acromatopsie: risc ridicat de confuzie a culorilor");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "acromatopsie: risc scăzut de confuzie a culorilor");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contrast scăzut după compunerea alfa");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number}, contrast pentru text normal");
   P ("label.contrast.readability_label.readable_for_normal_text", "lizibil pentru text normal");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, text principal, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number}, contrast pentru text normal");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, text principal, text deschis pe fundal închis");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, text mare, text închis pe fundal deschis");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, text mare, text închis pe fundal deschis");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} %, diferență subtilă");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, text principal, text închis pe fundal deschis");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, text principal, text închis pe fundal deschis");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopie: risc scăzut de confuzie a culorilor");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} %, diferență vizibilă");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contrast pentru text mare");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number}, contrast pentru text mare");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopie: risc scăzut de confuzie a culorilor");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number}, contrast sporit");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "lizibil pentru text cu contrast sporit");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number}, contrast sporit");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab, delta {v1, number}, diferență perceptuală subtilă");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopie: culori distincte");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contrast pentru text normal după "
      & "compunerea alfa");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopie: risc moderat de confuzie a culorilor");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contrast pentru text normal după compunerea alfa");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number}, contrast pentru text mare după compunerea "
      & "alfa");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, excelent, text închis pe fundal deschis");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, excelent, text închis pe fundal deschis");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, contrast pentru text normal");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number}, contrast pentru text normal");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number}, contrast sporit");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, excelent, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number}, contrast sporit");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, excelent, text deschis pe fundal închis");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopie: culori distincte");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number}, contrast sporit după compunerea alfa");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab, delta {v1, number}, abia perceptibil");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} %, aproape identice");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopie: risc scăzut de confuzie a culorilor");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "acromatopsie: culori distincte");
   P ("label.palettes.palette_summary.n_colors",
      "{v1, plural, one {{v1, number} culoare} few {{v1, number} culori} "
      & "other {{v1, number} de culori}}");
   P ("label.palettes.palette_summary.mostly_gray", "predominant gri");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "dispersie moderată a contrastului");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "fundal {v1}, text {v2}, accent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "paletă triadică");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "cel mai bun contrast: {v1} pe {v2}, {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "perechi cu contrast pentru text normal: {v1, number} din {v2, number}");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "sporit: {v1, number}, normal: {v2, number}, doar text mare: {v3, "
      & "number}, eșuate: {v4, number}, total perechi: {v5, number}");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "culori: {v1, number}, perechi: {v2, number} (sporit: {v3, number}, "
      & "normal: {v4, number}, doar text mare: {v5, number}, eșuate: {v6, "
      & "number})");
   P ("label.palettes.palette_mood_label.balanced", "echilibrată");
   P ("label.palettes.palette_mood_label.vibrant", "vibrantă");
   P ("label.palettes.palette_mood_label.warm_mood", "atmosferă caldă");
   P ("label.palettes.palette_summary.mostly_blue", "predominant albastru");
   P ("label.palettes.palette_summary.low_contrast_spread", "dispersie scăzută a contrastului");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "paletă cu un singur accent");
   P ("label.palettes.palette_mood_label.dark", "întunecată");
   P ("label.palettes.palette_mood_label.cool_mood", "atmosferă rece");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "predominant rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "nicio pereche de text accesibilă");
   P ("label.palettes.palette_mood_label.subtle", "subtilă");
   P ("label.palettes.palette_summary.high_contrast_spread", "dispersie ridicată a contrastului");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "cel mai bun contrast: {v1} pe {v2}, {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "atmosferă neutră");
   P ("label.palettes.palette_summary.mostly_purple", "predominant violet");
   P ("label.palettes.palette_harmony_label.complementary_palette", "paletă complementară");
   P ("label.palettes.palette_summary.mostly_green", "predominant verde");
   P ("label.palettes.palette_mood_label.moderate", "moderată");
   P ("label.palettes.palette_summary.mostly_silver", "predominant argintiu");
   P ("label.palettes.palette_harmony_label.varied_palette", "paletă variată");
   P ("label.palettes.palette_summary.mostly_olive", "predominant oliv");
   P ("label.palettes.palette_harmony_label.analogous_palette", "paletă analogă");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "perechi doar pentru text mare: {v1, number} din {v2, number}");
   P ("label.palettes.palette_mood_label.light", "luminoasă");
   P ("label.palettes.palette_summary.mostly_teal", "predominant verde-albastru");
   P ("label.palettes.palette_summary.mostly_aqua", "predominant turcoaz");
   P ("label.palettes.palette_summary.mostly_lime", "predominant verde-lime");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "paletă monocromă");
   P ("label.palettes.palette_summary.mostly_black", "predominant negru");
   P ("label.palettes.palette_summary.mostly_yellow", "predominant galben");
   P ("label.palettes.palette_summary.mostly_maroon", "predominant grena");
   P ("label.palettes.palette_summary.mostly_white", "predominant alb");
   P ("label.palettes.palette_summary.mostly_orange", "predominant portocaliu");
   P ("label.palettes.palette_summary.mostly_fuchsia", "predominant fucsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "paletă neutră");
   P ("label.palettes.palette_summary.mostly_red", "predominant roșu");
   P ("label.metrics.word_count_summary.n_words",
      "{v1, plural, one {{v1, number} cuvânt} few {{v1, number} cuvinte} "
      & "other {{v1, number} de cuvinte}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {{v1, number} propoziție} few {{v1, number} "
      & "propoziții} other {{v1, number} de propoziții}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {{v1, number} paragraf} few {{v1, number} paragrafe} "
      & "other {{v1, number} de paragrafe}}");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} min de citit");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} min de vorbit");
   P ("label.metrics.text_summary_with_options.n_words",
      "{v1, plural, one {{v1, number} cuvânt} few {{v1, number} cuvinte} "
      & "other {{v1, number} de cuvinte}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {{v1, number} propoziție} few {{v1, number} "
      & "propoziții} other {{v1, number} de propoziții}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {{v1, number} paragraf} few {{v1, number} paragrafe} "
      & "other {{v1, number} de paragrafe}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} min de citit");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {{v1, number} paragraf} few {{v1, number} paragrafe} "
      & "other {{v1, number} de paragrafe}}");
   P ("label.metrics.reading_time.less_than_n_minute_read", "sub {v1, number} min de citit");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "sub {v1, number} min de vorbit");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {{v1, number} paragraf} few {{v1, number} paragrafe} "
      & "other {{v1, number} de paragrafe}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "sub {v1, number} min de citit");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {{v1, number} propoziție} few {{v1, number} "
      & "propoziții} other {{v1, number} de propoziții}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {{v1, number} propoziție} few {{v1, number} "
      & "propoziții} other {{v1, number} de propoziții}}");
   P ("label.metrics.word_count_summary.no_words", "niciun cuvânt");
   P ("label.metrics.sentence_count_summary.no_sentences", "nicio propoziție");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "niciun paragraf");
   P ("label.metrics.text_summary_with_options.no_words", "niciun cuvânt");
   P ("label.metrics.text_summary_with_options.no_sentences", "nicio propoziție");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "niciun paragraf");
   P ("label.metrics.word_count_summary.n_word",
      "{v1, plural, one {{v1, number} cuvânt} few {{v1, number} cuvinte} "
      & "other {{v1, number} de cuvinte}}");
   P ("label.metrics.text_summary_with_options.n_word",
      "{v1, plural, one {{v1, number} cuvânt} few {{v1, number} cuvinte} "
      & "other {{v1, number} de cuvinte}}");
end Labels_3;
