separate (Humanize.Catalogs.Phrase_Data.Locale_De)
procedure Labels_3 is
begin
   P ("label.tables.filter_label",
      "{state, select, no_rows {keine Zeilen} none {keine passenden Zeilen} "
      & "all {{total, plural, one {1 Zeile} other {alle {total, number} "
      & "Zeilen}} sichtbar} other {{visible, number} von {total, plural, one {1 "
      & "Zeile} other {{total, number} Zeilen}} sichtbar}}");
   P ("label.tables.row_range_label",
      "{state, select, none {keine Zeilen} single {Zeile {first_row, number} "
      & "von {total, number}} other {Zeilen {first_row, number}–{last_row, "
      & "number} von {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {kein Zeichenlimit} none_left {keine Zeichen "
      & "übrig} left {{count, plural, one {1 Zeichen} other {{count, number} "
      & "Zeichen}} übrig} other {{count, plural, one {1 Zeichen} other "
      & "{{count, number} Zeichen}} über dem Limit}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {keine Pflichtfelder} one {{missing, plural, =0 "
      & "{alle Pflichtfelder ausgefüllt} other {1 von 1 Pflichtfeld fehlt}}} "
      & "other {{missing, plural, =0 {alle Pflichtfelder ausgefüllt} one {1 "
      & "von {total, number} Pflichtfeldern fehlt} other {{missing, number} von "
      & "{total, number} Pflichtfeldern fehlen}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {keine Felder} all {alle Felder ausgefüllt} "
      & "other {{completed, number} von {total, plural, one {1 Feld} other "
      & "{{total, number} Feldern}} ausgefüllt}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: keine Felder} all {{name}: alle Felder "
      & "ausgefüllt} other {{name}: {completed, number} von {total, plural, "
      & "one {1 Feld} other {{total, number} Feldern}} ausgefüllt}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {keine Formularschritte} one {Schritt 1 von 1: "
      & "{name}} other {Schritt {current, number} von {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {keine Brotkrümel} one {Brotkrümel 1 von 1: "
      & "{name}} other {Brotkrümel {current, number} von {total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {keine Tabs} one {Tab 1 von 1: {name}} other {Tab "
      & "{current, number} von {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {Posteingang leer} one {{unread, plural, =0 {alle "
      & "Benachrichtigungen gelesen} other {1 von 1 Benachrichtigung "
      & "ungelesen}}} other {{unread, plural, =0 {alle Benachrichtigungen "
      & "gelesen} other {{unread, number} von {total, number} "
      & "Benachrichtigungen ungelesen}}}}");
   P ("label.notifications.delivery_attempt_label", "Zustellversuch {attempt, number} von {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {keine Checklistenpunkte} one {{done, plural, =0 {0 "
      & "von 1 Punkt erledigt} other {1 von 1 Punkt erledigt}}} other {{done, "
      & "number} von {total, number} Punkten erledigt}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {keine Uploads} one {{done, plural, =0 {0 von 1 "
      & "Upload abgeschlossen} other {1 von 1 Upload abgeschlossen}}} other "
      & "{{done, number} von {total, number} Uploads abgeschlossen}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {keine Kapazität} one {{reserved, plural, =0 {0 "
      & "von 1 Platz reserviert} other {1 von 1 Platz reserviert}}} other "
      & "{{reserved, number} von {capacity, number} Plätzen reserviert}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {Position {position, number} auf der Warteliste} "
      & "other {Position {position, number} von {total, number} auf der "
      & "Warteliste}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} geändert} other {{name}: {changed, number} geändert, "
      & "{unchanged, number} unverändert, {total, number} gesamt}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {rosa} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktueller Vordergrund erfüllt den Kontrast für großen Text mit "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "aktueller Vordergrund erfüllt den Kontrast für normalen Text mit "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v1} für erhöhten Textkontrast {v2, number}:{v3, number} verwenden");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v1} für Kontrast {v2, number}:{v3, number} bei großem Text "
      & "verwenden");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v1} für Kontrast {v2}:{v3, number} bei normalem Text verwenden");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v1} für Kontrast {v2}:{v3, number} bei großem Text verwenden");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v1} für erhöhten Textkontrast {v2}:{v3, number} verwenden");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktueller Vordergrund erfüllt den Kontrast für großen Text mit {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "aktueller Vordergrund erfüllt den Kontrast für normalen Text mit "
      & "{v1, number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "aktueller Vordergrund erfüllt den erhöhten Textkontrast mit "
      & "{v1}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "aktueller Vordergrund erfüllt den erhöhten Textkontrast mit {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "Protanopie: geringes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "Deuteranopie: mittleres Verwechslungsrisiko, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "Tritanopie: mittleres Verwechslungsrisiko, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "Achromatopsie: hohes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 Delta {v1}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 Delta {v1}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 Textil Delta {v1}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 Delta {v1, number}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab Delta {v1}, großer Wahrnehmungsunterschied");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "Protanopie: mittleres Verwechslungsrisiko, Delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 Delta {v1, number}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 Delta {v1}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab Delta {v1}, dramatischer Wahrnehmungsunterschied");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "Achromatopsie: geringes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "Protanopie: unterscheidbar, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "Deuteranopie: unterscheidbar, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "Tritanopie: unterscheidbar, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "Achromatopsie: unterscheidbar, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "Achromatopsie: mittleres Verwechslungsrisiko, Delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 Delta {v1}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 Delta {v1}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 Textil Delta {v1}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 Delta {v1}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab Delta {v1}, merklicher Wahrnehmungsunterschied");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "Protanopie: hohes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "Tritanopie: hohes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 Delta {v1}, merklicher Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 Textil Delta {v1}, merklicher Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 Delta {v1}, merklicher Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab Delta {v1, number}, merklicher Wahrnehmungsunterschied");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "Tritanopie: geringes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "Deuteranopie: geringes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab Delta {v1, number}, großer Wahrnehmungsunterschied");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "Deuteranopie: hohes Verwechslungsrisiko, Delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 Delta {v1, number}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 Textil Delta {v1, number}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab Delta {v1, number}, dramatischer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 Delta {v1, number}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 Textil Delta {v1, number}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 Delta {v1, number}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 Delta {v1}, merklicher Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 Textil Delta {v1}, subtiler Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 Delta {v1, number}, merklicher Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 Textil Delta {v1, number}, merklicher Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 Delta {v1}, kaum wahrnehmbar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 Delta {v1}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 Textil Delta {v1}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 Delta {v1}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab Delta {v1}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 Delta {v1, number}, großer Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 Delta {v1, number}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 Delta {v1, number}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 Textil Delta {v1, number}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 Delta {v1, number}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab Delta {v1, number}, nicht wahrnehmbar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab Delta {v1}, subtiler Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 Delta {v1}, subtiler Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 Delta {v1}, subtiler Wahrnehmungsunterschied");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab Delta {v1}, kaum wahrnehmbar");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 Minute Sprechzeit} other {{v1, number} Minuten "
      & "Sprechzeit}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 Minute Lesezeit} other {{v1, number} Minuten "
      & "Lesezeit}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {weniger als 1 Minute Sprechzeit} other {weniger als "
      & "{v1, number} Minuten Sprechzeit}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {weniger als 1 Minute Lesezeit} other {weniger als "
      & "{v1, number} Minuten Lesezeit}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.text_summary.no_words", "keine Wörter");
   P ("label.metrics.text_summary.no_paragraphs", "keine Absätze");
   P ("label.metrics.text_summary.no_sentences", "keine Sätze");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.names.hue_family_label.neutral", "neutral");
   P ("label.names.saturation_label.neutral", "neutral");
   P ("label.names.temperature_label.neutral_temperature", "neutrale Temperatur");
   P ("label.names.chroma_label.grayish", "gräulich");
   P ("label.names.nearest_color_name.black", "Schwarz");
   P ("label.models.brightness_label.very_dark", "sehr dunkel");
   P ("label.names.hue_family_label.blue", "blau");
   P ("label.names.saturation_label.vivid", "lebhaft");
   P ("label.names.temperature_label.cool", "kühl");
   P ("label.names.chroma_label.moderate_chroma", "mittleres Chroma");
   P ("label.names.nearest_color_name.navy", "Marineblau");
   P ("label.names.chroma_label.high_chroma", "hohes Chroma");
   P ("label.names.nearest_color_name.blue", "Blau");
   P ("label.names.hue_family_label.green", "grün");
   P ("label.names.temperature_label.balanced_temperature", "ausgewogene Temperatur");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "sanft");
   P ("label.models.brightness_label.dark", "dunkel");
   P ("label.names.nearest_color_name.green", "Grün");
   P ("label.names.nearest_color_name.teal", "Petrol");
   P ("label.models.brightness_label.medium_brightness", "mittlere Helligkeit");
   P ("label.names.nearest_color_name.aqua", "Aqua");
   P ("label.names.nearest_color_name.lime", "Limettengrün");
   P ("label.models.brightness_label.light", "hell");
   P ("label.names.hue_family_label.red", "rot");
   P ("label.names.temperature_label.warm", "warm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "violett");
   P ("label.names.hue_family_label.yellow", "gelb");
   P ("label.names.saturation_label.muted", "gedämpft");
   P ("label.names.nearest_color_name.rebeccapurple", "Rebeccapurple");
   P ("label.names.saturation_label.saturated", "gesättigt");
   P ("label.names.nearest_color_name.maroon", "Kastanienbraun");
   P ("label.names.nearest_color_name.purple", "Lila");
   P ("label.names.hue_family_label.orange", "orange");
   P ("label.names.nearest_color_name.olive", "Oliv");
   P ("label.names.nearest_color_name.gray", "Grau");
   P ("label.names.saturation_label.desaturated", "entsättigt");
   P ("label.names.nearest_color_name.silver", "Silber");
   P ("label.names.chroma_label.pastel", "pastell");
   P ("label.models.brightness_label.very_light", "sehr hell");
   P ("label.names.nearest_color_name.fuchsia", "Fuchsia");
   P ("label.names.nearest_color_name.yellow", "Gelb");
   P ("label.names.nearest_color_name.red", "Rot");
   P ("label.names.nearest_color_name.orange", "Orange");
   P ("label.names.nearest_color_name.white", "Weiß");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} geringer Kontrast");
   P ("label.contrast.readability_label.low_readability", "geringe Lesbarkeit");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, unzureichend, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} geringer Kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, unzureichend, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "Achromatopsie: mittleres Verwechslungsrisiko");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % starker Unterschied");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} geringer Kontrast nach Alpha-Compositing");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, unzureichend, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, unzureichend, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "Deuteranopie: hohes Verwechslungsrisiko");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} Kontrast für großen Text");
   P ("label.contrast.readability_label.readable_for_large_text_only", "nur für großen Text lesbar");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, großer Text, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} Kontrast für großen Text");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, großer Text, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "Tritanopie: hohes Verwechslungsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} Kontrast für großen Text nach Alpha-Compositing");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, nur Nicht-Text, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, nur Nicht-Text, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "Tritanopie: mittleres Verwechslungsrisiko");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} geringer Kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} geringer Kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, nur Nicht-Text, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, nur Nicht-Text, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "Deuteranopie: mittleres Verwechslungsrisiko");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "Protanopie: hohes Verwechslungsrisiko");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % sehr unterschiedlich");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "Achromatopsie: hohes Verwechslungsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "Achromatopsie: geringes Verwechslungsrisiko");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} geringer Kontrast nach Alpha-Compositing");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} Kontrast für normalen Text");
   P ("label.contrast.readability_label.readable_for_normal_text", "für normalen Text lesbar");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, Fließtext, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} Kontrast für normalen Text");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, Fließtext, heller Text auf dunklem Hintergrund");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, großer Text, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, großer Text, dunkler Text auf hellem Hintergrund");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % subtiler Unterschied");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, Fließtext, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, Fließtext, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "Tritanopie: geringes Verwechslungsrisiko");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % merklicher Unterschied");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number} Kontrast für großen Text");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} Kontrast für großen Text");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "Deuteranopie: geringes Verwechslungsrisiko");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} erhöhter Kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "mit erhöhtem Kontrast lesbar");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} erhöhter Kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab Delta {v1, number}, subtiler Wahrnehmungsunterschied");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "Tritanopie: unterscheidbar");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} Kontrast für normalen Text nach "
      & "Alpha-Compositing");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "Protanopie: mittleres Verwechslungsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} Kontrast für normalen Text nach Alpha-Compositing");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} Kontrast für großen Text nach "
      & "Alpha-Compositing");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, ausgezeichnet, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, ausgezeichnet, dunkler Text auf hellem Hintergrund");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} Kontrast für normalen Text");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} Kontrast für normalen Text");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} erhöhter Kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, ausgezeichnet, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} erhöhter Kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, ausgezeichnet, heller Text auf dunklem Hintergrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "Deuteranopie: unterscheidbar");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} erhöhter Kontrast nach Alpha-Compositing");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab Delta {v1, number}, kaum wahrnehmbar");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % nahezu identisch");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "Protanopie: geringes Verwechslungsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "Achromatopsie: unterscheidbar");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 Farbe} other {{v1, number} Farben}}");
   P ("label.palettes.palette_summary.mostly_gray", "überwiegend Grau");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "mittlere Kontrastspanne");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "Hintergrund {v1}, Text {v2}, Akzent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadische Palette");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "bester Kontrast {v1} auf {v2} mit {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, plural, one {1 von {v2, number} Paaren erfüllt den Kontrast für "
      & "normalen Text} other {{v1, number} von {v2, number} Paaren erfüllen "
      & "den Kontrast für normalen Text}}");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} Paare: {v1, number} erhöht, {v2, number} normal, {v3, "
      & "number} nur großer Text, {v4, number} nicht bestanden");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 Farbe} other {{v1, number} Farben}}, {v2, number} "
      & "Paare: {v3, number} erhöht, {v4, number} normal, {v5, number} nur "
      & "großer Text, {v6, number} nicht bestanden");
   P ("label.palettes.palette_mood_label.balanced", "ausgewogen");
   P ("label.palettes.palette_mood_label.vibrant", "lebendig");
   P ("label.palettes.palette_mood_label.warm_mood", "warme Stimmung");
   P ("label.palettes.palette_summary.mostly_blue", "überwiegend Blau");
   P ("label.palettes.palette_summary.low_contrast_spread", "geringe Kontrastspanne");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "Palette mit einem Akzent");
   P ("label.palettes.palette_mood_label.dark", "dunkel");
   P ("label.palettes.palette_mood_label.cool_mood", "kühle Stimmung");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "überwiegend Rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "keine barrierefreien Textpaare");
   P ("label.palettes.palette_mood_label.subtle", "dezent");
   P ("label.palettes.palette_summary.high_contrast_spread", "hohe Kontrastspanne");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "bester Kontrast {v1} auf {v2} mit {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutrale Stimmung");
   P ("label.palettes.palette_summary.mostly_purple", "überwiegend Lila");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementäre Palette");
   P ("label.palettes.palette_summary.mostly_green", "überwiegend Grün");
   P ("label.palettes.palette_mood_label.moderate", "gemäßigt");
   P ("label.palettes.palette_summary.mostly_silver", "überwiegend Silber");
   P ("label.palettes.palette_harmony_label.varied_palette", "vielfältige Palette");
   P ("label.palettes.palette_summary.mostly_olive", "überwiegend Oliv");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analoge Palette");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, plural, one {1 von {v2, number} Paaren nur für großen Text "
      & "geeignet} other {{v1, number} von {v2, number} Paaren nur für großen "
      & "Text geeignet}}");
   P ("label.palettes.palette_mood_label.light", "hell");
   P ("label.palettes.palette_summary.mostly_teal", "überwiegend Petrol");
   P ("label.palettes.palette_summary.mostly_aqua", "überwiegend Aqua");
   P ("label.palettes.palette_summary.mostly_lime", "überwiegend Limettengrün");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monochrome Palette");
   P ("label.palettes.palette_summary.mostly_black", "überwiegend Schwarz");
   P ("label.palettes.palette_summary.mostly_yellow", "überwiegend Gelb");
   P ("label.palettes.palette_summary.mostly_maroon", "überwiegend Kastanienbraun");
   P ("label.palettes.palette_summary.mostly_white", "überwiegend Weiß");
   P ("label.palettes.palette_summary.mostly_orange", "überwiegend Orange");
   P ("label.palettes.palette_summary.mostly_fuchsia", "überwiegend Fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutrale Palette");
   P ("label.palettes.palette_summary.mostly_red", "überwiegend Rot");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 Minute Lesezeit} other {{v1, number} Minuten "
      & "Lesezeit}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 Minute Sprechzeit} other {{v1, number} Minuten "
      & "Sprechzeit}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 Minute Lesezeit} other {{v1, number} Minuten "
      & "Lesezeit}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {weniger als 1 Minute Lesezeit} other {weniger als "
      & "{v1, number} Minuten Lesezeit}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {weniger als 1 Minute Sprechzeit} other {weniger als "
      & "{v1, number} Minuten Sprechzeit}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 Absatz} other {{v1, number} Absätze}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {weniger als 1 Minute Lesezeit} other {weniger als "
      & "{v1, number} Minuten Lesezeit}}");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, plural, one {1 Satz} other {{v1, number} Sätze}}");
   P ("label.metrics.word_count_summary.no_words", "keine Wörter");
   P ("label.metrics.sentence_count_summary.no_sentences", "keine Sätze");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "keine Absätze");
   P ("label.metrics.text_summary_with_options.no_words", "keine Wörter");
   P ("label.metrics.text_summary_with_options.no_sentences", "keine Sätze");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "keine Absätze");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 Wort} other {{v1, number} Wörter}}");
end Labels_3;
