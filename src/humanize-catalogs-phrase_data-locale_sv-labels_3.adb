separate (Humanize.Catalogs.Phrase_Data.Locale_Sv)
procedure Labels_3 is
begin
   P ("label.tables.filter_label",
      "{state, select, no_rows {inga rader} none {inga rader matchar} all "
      & "{{total, plural, one {1 rad} other {alla {total, number} rader}} "
      & "visas} other {{visible, number} av {total, plural, one {1 rad} other "
      & "{{total, number} rader}} visas}}");
   P ("label.tables.row_range_label",
      "{state, select, none {inga rader} single {rad {first_row, number} av "
      & "{total, number}} other {rader {first_row, number}–{last_row, number} "
      & "av {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {ingen teckengräns} none_left {inga tecken "
      & "kvar} left {{count, plural, one {1 tecken} other {{count, number} "
      & "tecken}} kvar} other {{count, plural, one {1 tecken} other {{count, "
      & "number} tecken}} över gränsen}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {inga obligatoriska fält} one {{missing, plural, "
      & "=0 {alla obligatoriska fält ifyllda} other {1 av 1 obligatoriskt "
      & "fält saknas}}} other {{missing, plural, =0 {alla obligatoriska fält "
      & "ifyllda} other {{missing, number} av {total, number} obligatoriska "
      & "fält saknas}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {inga fält} all {alla fält ifyllda} other "
      & "{{completed, number} av {total, plural, one {1 fält} other {{total, "
      & "number} fält}} ifyllda}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: inga fält} all {{name}: alla fält "
      & "ifyllda} other {{name}: {completed, number} av {total, plural, one {1 "
      & "fält} other {{total, number} fält}} ifyllda}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {inga formulärsteg} one {steg 1 av 1: {name}} "
      & "other {steg {current, number} av {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {inga brödsmulor} one {brödsmula 1 av 1: {name}} "
      & "other {brödsmula {current, number} av {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {inga flikar} one {flik 1 av 1: {name}} other {flik "
      & "{current, number} av {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {tom inkorg} one {{unread, plural, =0 {alla "
      & "aviseringar lästa} other {1 oläst av 1 avisering}}} other {{unread, "
      & "plural, =0 {alla aviseringar lästa} other {{unread, number} olästa "
      & "av {total, number} aviseringar}}}}");
   P ("label.notifications.delivery_attempt_label", "leveransförsök {attempt, number} av {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {inga checklistpunkter} one {{done, plural, =0 {0 "
      & "av 1 punkt klar} other {1 av 1 punkt klar}}} other {{done, number} av "
      & "{total, number} punkter klara}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {inga uppladdningar} one {{done, plural, =0 {0 av 1 "
      & "uppladdning klar} other {1 av 1 uppladdning klar}}} other {{done, "
      & "number} av {total, number} uppladdningar klara}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {ingen kapacitet} one {{reserved, plural, =0 {0 "
      & "av 1 plats bokad} other {1 av 1 plats bokad}}} other {{reserved, "
      & "number} av {capacity, number} platser bokade}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {plats {position, number} på väntelistan} other "
      & "{plats {position, number} av {total, number} på väntelistan}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} ändrade} other {{name}: {changed, number} ändrade, "
      & "{unchanged, number} oförändrade, {total, number} totalt}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "aktuell förgrund uppfyller kontrast för stor text vid {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "aktuell förgrund uppfyller kontrast för normal text vid {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "använd {v1} för förhöjd textkontrast {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "använd {v1} för kontrast {v2, number}:{v3, number} för stor text");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "använd {v1} för kontrast {v2}:{v3, number} för normal text");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "använd {v1} för kontrast {v2}:{v3, number} för stor text");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "använd {v1} för förhöjd textkontrast {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "aktuell förgrund uppfyller kontrast för stor text vid {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "aktuell förgrund uppfyller kontrast för normal text vid {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "aktuell förgrund uppfyller förhöjd textkontrast vid {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "aktuell förgrund uppfyller förhöjd textkontrast vid {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopi: låg förväxlingsrisk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopi: måttlig förväxlingsrisk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopi: måttlig förväxlingsrisk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsi: hög förväxlingsrisk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 textil delta {v1}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, stor perceptuell skillnad");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopi: måttlig förväxlingsrisk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatisk perceptuell skillnad");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsi: låg förväxlingsrisk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopi: särskiljbar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopi: särskiljbar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopi: särskiljbar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsi: särskiljbar, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsi: måttlig förväxlingsrisk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 textil delta {v1}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, märkbar perceptuell skillnad");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopi: hög förväxlingsrisk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopi: hög förväxlingsrisk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, märkbar perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 textil delta {v1}, märkbar perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, märkbar perceptuell skillnad");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, märkbar perceptuell skillnad");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopi: låg förväxlingsrisk, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopi: låg förväxlingsrisk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, stor perceptuell skillnad");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopi: hög förväxlingsrisk, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 textil delta {v1, number}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatisk perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 textil delta {v1, number}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, märkbar perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 textil delta {v1}, subtil perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, märkbar perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 textil delta {v1, number}, märkbar perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, knappt märkbar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, omärkbar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 textil delta {v1}, omärkbar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible", "CIEDE2000 delta {v1}, omärkbar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, omärkbar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, stor perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible", "CIE76 delta {v1, number}, omärkbar");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible", "CIE94 delta {v1, number}, omärkbar");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 textil delta {v1, number}, omärkbar");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, omärkbar");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible", "OKLab delta {v1, number}, omärkbar");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtil perceptuell skillnad");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtil perceptuell skillnad");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtil perceptuell skillnad");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, knappt märkbar");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 minuts taltid} other {{v1, number} minuters "
      & "taltid}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 minuts lästid} other {{v1, number} minuters "
      & "lästid}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {mindre än 1 minuts taltid} other {mindre än {v1, "
      & "number} minuters taltid}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {mindre än 1 minuts lästid} other {mindre än {v1, "
      & "number} minuters lästid}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.text_summary.no_words", "inga ord");
   P ("label.metrics.text_summary.no_paragraphs", "inga stycken");
   P ("label.metrics.text_summary.no_sentences", "inga meningar");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.names.hue_family_label.neutral", "neutral");
   P ("label.names.saturation_label.neutral", "neutral");
   P ("label.names.temperature_label.neutral_temperature", "neutral temperatur");
   P ("label.names.chroma_label.grayish", "gråaktig");
   P ("label.names.nearest_color_name.black", "svart");
   P ("label.models.brightness_label.very_dark", "mycket mörk");
   P ("label.names.hue_family_label.blue", "blå");
   P ("label.names.saturation_label.vivid", "livfull");
   P ("label.names.temperature_label.cool", "sval");
   P ("label.names.chroma_label.moderate_chroma", "måttlig kroma");
   P ("label.names.nearest_color_name.navy", "marinblå");
   P ("label.names.chroma_label.high_chroma", "hög kroma");
   P ("label.names.nearest_color_name.blue", "blå");
   P ("label.names.hue_family_label.green", "grön");
   P ("label.names.temperature_label.balanced_temperature", "balanserad temperatur");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "mjuk");
   P ("label.models.brightness_label.dark", "mörk");
   P ("label.names.nearest_color_name.green", "grön");
   P ("label.names.nearest_color_name.teal", "blågrön");
   P ("label.models.brightness_label.medium_brightness", "medelhög ljushet");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "limegrön");
   P ("label.models.brightness_label.light", "ljus");
   P ("label.names.hue_family_label.red", "röd");
   P ("label.names.temperature_label.warm", "varm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "lila");
   P ("label.names.hue_family_label.yellow", "gul");
   P ("label.names.saturation_label.muted", "dämpad");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "mättad");
   P ("label.names.nearest_color_name.maroon", "rödbrun");
   P ("label.names.nearest_color_name.purple", "lila");
   P ("label.names.hue_family_label.orange", "orange");
   P ("label.names.nearest_color_name.olive", "olivgrön");
   P ("label.names.nearest_color_name.gray", "grå");
   P ("label.names.saturation_label.desaturated", "avmättad");
   P ("label.names.nearest_color_name.silver", "silver");
   P ("label.names.chroma_label.pastel", "pastell");
   P ("label.models.brightness_label.very_light", "mycket ljus");
   P ("label.names.nearest_color_name.fuchsia", "fuchsia");
   P ("label.names.nearest_color_name.yellow", "gul");
   P ("label.names.nearest_color_name.red", "röd");
   P ("label.names.nearest_color_name.orange", "orange");
   P ("label.names.nearest_color_name.white", "vit");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} låg kontrast");
   P ("label.contrast.readability_label.low_readability", "låg läsbarhet");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, otillräcklig, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} låg kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, otillräcklig, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsi: måttlig förväxlingsrisk");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % markant skillnad");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} låg kontrast efter alfablandning");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, otillräcklig, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, otillräcklig, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopi: hög förväxlingsrisk");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} kontrast för stor text");
   P ("label.contrast.readability_label.readable_for_large_text_only", "läsbar endast för stor text");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, stor text, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} kontrast för stor text");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, stor text, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopi: hög förväxlingsrisk");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrast för stor text efter alfablandning");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, endast icke-text, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, endast icke-text, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopi: måttlig förväxlingsrisk");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} låg kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} låg kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, endast icke-text, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, endast icke-text, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopi: måttlig förväxlingsrisk");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopi: hög förväxlingsrisk");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % mycket olika");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsi: hög förväxlingsrisk");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsi: låg förväxlingsrisk");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} låg kontrast efter alfablandning");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} kontrast för normal text");
   P ("label.contrast.readability_label.readable_for_normal_text", "läsbar för normal text");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, brödtext, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} kontrast för normal text");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, brödtext, ljus text på mörk bakgrund");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, stor text, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, stor text, mörk text på ljus bakgrund");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % subtil skillnad");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, brödtext, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, brödtext, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopi: låg förväxlingsrisk");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % märkbar skillnad");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} kontrast för stor text");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} kontrast för stor text");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopi: låg förväxlingsrisk");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} förhöjd kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "läsbar med förhöjd kontrast");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} förhöjd kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtil perceptuell skillnad");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopi: särskiljbar");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrast för normal text efter "
      & "alfablandning");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopi: måttlig förväxlingsrisk");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrast för normal text efter alfablandning");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrast för stor text efter alfablandning");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, utmärkt, mörk text på ljus bakgrund");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, utmärkt, mörk text på ljus bakgrund");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrast för normal text");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrast för normal text");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} förhöjd kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, utmärkt, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} förhöjd kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, utmärkt, ljus text på mörk bakgrund");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopi: särskiljbar");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} förhöjd kontrast efter alfablandning");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, knappt märkbar");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % nästan identiska");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopi: låg förväxlingsrisk");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsi: särskiljbar");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 färg} other {{v1, number} färger}}");
   P ("label.palettes.palette_summary.mostly_gray", "mestadels grå");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "måttlig kontrastspridning");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "bakgrund {v1}, text {v2}, accent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadisk palett");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "bästa kontrast {v1} på {v2} vid {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} av {v2, number} par klarar kontrast för normal text");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} par: {v1, number} förhöjd, {v2, number} normal, {v3, "
      & "number} endast stor text, {v4, number} underkända");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 färg} other {{v1, number} färger}}, {v2, number} "
      & "par: {v3, number} förhöjd, {v4, number} normal, {v5, number} endast "
      & "stor text, {v6, number} underkända");
   P ("label.palettes.palette_mood_label.balanced", "balanserad");
   P ("label.palettes.palette_mood_label.vibrant", "livfull");
   P ("label.palettes.palette_mood_label.warm_mood", "varm stämning");
   P ("label.palettes.palette_summary.mostly_blue", "mestadels blå");
   P ("label.palettes.palette_summary.low_contrast_spread", "låg kontrastspridning");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palett med en accent");
   P ("label.palettes.palette_mood_label.dark", "mörk");
   P ("label.palettes.palette_mood_label.cool_mood", "sval stämning");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "mestadels rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "inga tillgängliga textpar");
   P ("label.palettes.palette_mood_label.subtle", "diskret");
   P ("label.palettes.palette_summary.high_contrast_spread", "hög kontrastspridning");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "bästa kontrast {v1} på {v2} vid {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "neutral stämning");
   P ("label.palettes.palette_summary.mostly_purple", "mestadels lila");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementär palett");
   P ("label.palettes.palette_summary.mostly_green", "mestadels grön");
   P ("label.palettes.palette_mood_label.moderate", "måttlig");
   P ("label.palettes.palette_summary.mostly_silver", "mestadels silver");
   P ("label.palettes.palette_harmony_label.varied_palette", "varierad palett");
   P ("label.palettes.palette_summary.mostly_olive", "mestadels olivgrön");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analog palett");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} av {v2, number} par klarar endast stor text");
   P ("label.palettes.palette_mood_label.light", "ljus");
   P ("label.palettes.palette_summary.mostly_teal", "mestadels blågrön");
   P ("label.palettes.palette_summary.mostly_aqua", "mestadels aqua");
   P ("label.palettes.palette_summary.mostly_lime", "mestadels limegrön");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monokrom palett");
   P ("label.palettes.palette_summary.mostly_black", "mestadels svart");
   P ("label.palettes.palette_summary.mostly_yellow", "mestadels gul");
   P ("label.palettes.palette_summary.mostly_maroon", "mestadels rödbrun");
   P ("label.palettes.palette_summary.mostly_white", "mestadels vit");
   P ("label.palettes.palette_summary.mostly_orange", "mestadels orange");
   P ("label.palettes.palette_summary.mostly_fuchsia", "mestadels fuchsia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "neutral palett");
   P ("label.palettes.palette_summary.mostly_red", "mestadels röd");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minuts lästid} other {{v1, number} minuters "
      & "lästid}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minuts taltid} other {{v1, number} minuters "
      & "taltid}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minuts lästid} other {{v1, number} minuters "
      & "lästid}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {mindre än 1 minuts lästid} other {mindre än {v1, "
      & "number} minuters lästid}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {mindre än 1 minuts taltid} other {mindre än {v1, "
      & "number} minuters taltid}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 stycke} other {{v1, number} stycken}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {mindre än 1 minuts lästid} other {mindre än {v1, "
      & "number} minuters lästid}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 mening} other {{v1, number} meningar}}");
   P ("label.metrics.word_count_summary.no_words", "inga ord");
   P ("label.metrics.sentence_count_summary.no_sentences", "inga meningar");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "inga stycken");
   P ("label.metrics.text_summary_with_options.no_words", "inga ord");
   P ("label.metrics.text_summary_with_options.no_sentences", "inga meningar");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "inga stycken");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {inga observationer} "
      & "sample_too_small_shape {urvalet är för litet för att beskriva "
      & "formen, {count, plural, one {1 observation} other {{count, number} "
      & "observationer}}} flat_shape {platt fördelning vid {median}} "
      & "outlier_heavy_shape {fördelning med många extremvärden kring "
      & "{median}} volatile_shape {volatil fördelning kring {median}} "
      & "clustered_shape {klustrad fördelning kring {median}} "
      & "wide_spread_shape {brett spridd fördelning} wide_spread_range {brett "
      & "spridd fördelning från {minimum} till {maximum}} right_skewed_shape "
      & "{högerskev fördelning, median {median}} left_skewed_shape "
      & "{vänsterskev fördelning, median {median}} other {mestadels "
      & "balanserad fördelning kring {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tom e-post} address {e-postadress} other "
      & "{e-post hos {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonnummer} redacted {telefonnummer "
      & "censurerat} other {telefonnummer som slutar på {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {användarnamn} other {användarnamn {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodsymbol} other {kodsymbol {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adressmetadata: {present, plural, one {1 fält finns} other {{present, "
      & "number} fält finns}}, {missing, plural, one {1 fält saknas} other "
      & "{{missing, number} fält saknas}}");
   P ("label.endpoints.host_label", "{state, select, none {okänd värd} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {okänd slutpunkt} other {slutpunkt "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tom URL} none {URL utan identifierade "
      & "komponenter} other {URL med {count, plural, one {1 komponent} other "
      & "{{count, number} komponenter}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {inga frågeparametrar} one {1 frågeparameter} "
      & "other {{count, number} frågeparametrar}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {offentlig IPv4-adress} ipv6_host "
      & "{offentlig IPv6-adress} private_network_host {adress i privat "
      & "nätverk} localhost_host {lokal värd} other {inte en IP-adress}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} (ogiltig CIDR)} other {{cidr} ({kind}, "
      & "nätverksprefix {prefix})}}");
   P ("label.resources.utilization_label", "{used, number} av {total, number} {unit} används ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {resurs} other {{name}}} {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {version {version}, förhandsversion "
      & "{prerelease}, bygge {build}} prerelease {version {version}, "
      & "förhandsversion {prerelease}} build {version {version}, bygge "
      & "{build}} other {version {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {samma version} major_upgrade "
      & "{uppgradering av huvudversion} minor_upgrade {uppgradering av "
      & "delversion} patch_upgrade {patchuppgradering} prerelease_change "
      & "{ändrad förhandsversion} build_metadata_change {ändrade "
      & "byggmetadata} downgrade {nedgradering} other {okänd "
      & "versionsändring}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {exakt version {version}} minimum_range "
      & "{version {version} eller nyare} maximum_range {version {version} eller "
      & "äldre} major_compatible_range {kompatibel med huvudversion {version}} "
      & "minor_compatible_range {kompatibel med delversion {version}} other "
      & "{versionsintervall {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {första utvecklingsversion {version}} "
      & "prerelease {förhandsversion {version}} major {huvudversion {version}} "
      & "minor {delversion {version}} other {patchversion {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {länktagg} image {bildtagg} paragraph {stycketagg} "
      & "ordered_list {tagg för numrerad lista} unordered_list {tagg för "
      & "punktlista} list_item {listobjekttagg} table_header_cell {tagg för "
      & "tabellrubrikcell} table_cell {tabellcelltagg} table_row "
      & "{tabellradstagg} line_break {radbrytningstagg} thematic_break {tagg "
      & "för tematisk brytning} heading_level_n {tagg för rubrik på nivå "
      & "{level, number}} other {{name}-tagg}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name}-attribut} event "
      & "{händelsehanterarattribut {name}} other {attribut {name} satt till "
      & "”{value}”}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {textinnehåll} html_content "
      & "{HTML-dokument} json_content {JSON-dokument} xml_content "
      & "{XML-dokument} image_content {bildinnehåll} audio_content "
      & "{ljudinnehåll} video_content {videoinnehåll} font_content "
      & "{teckensnittsinnehåll} archive_content {arkivinnehåll} "
      & "binary_content {binärt innehåll} form_content {formulärinskick} "
      & "other {okänt innehåll}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} saknas} hidden_value {{kind}, värdet "
      & "dolt} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "fingeravtryck som slutar på {shown}} other {{kind} som slutar på "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name}: {kind} saknas} other {{name}: {kind} "
      & "som slutar på {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {autentiseringshuvud {name} saknas} other "
      & "{{name}: {kind} som slutar på {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-fingeravtryck som slutar på {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} saknas} redacted {{label}, "
      & "censurerat} url_redacted {URL censurerad} ip_redacted {IP-adress "
      & "censurerad} path_ending {filsökväg som slutar på {shown}} at "
      & "{{label} hos {shown}} audit {{label}, längd {length, number}, slutar "
      & "på {shown}} debug {{label} {shown}} other {{label} som slutar på "
      & "{shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {föråldrat } unknown_field {okänt "
      & "} read_only_field {skrivskyddat } write_only_field {endast skrivbart } "
      & "computed_field {beräknat } other {}}{kind, select, string_field "
      & "{strängfält} integer_field {heltalsfält} decimal_field "
      & "{decimalfält} boolean_field {booleskt fält} date_field {datumfält} "
      & "date_time_field {tidpunktsfält} object_field {objektfält} "
      & "array_field {arrayfält} enum_field {uppräkningsfält} binary_field "
      & "{binärt fält} null_field {null-fält} any_field {fält av valfri "
      & "typ} other {fält av okänd typ}} {name} ({presence, select, "
      & "required_field {obligatoriskt} optional_field {valfritt} "
      & "conditional_field {villkorligt} other {okänd förekomst}}{nullable, "
      & "select, non_nullable {, inte null} nullable {, kan vara null} other "
      & "{}})");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {1 fält} other {{count, number} fält}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {1 obligatoriskt} other {{count, number} "
      & "obligatoriska}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {1 valfritt} other {{count, number} valfria}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {1 föråldrat} other {{count, number} "
      & "föråldrade}}");
   P ("label.schema.schema_summary_label.unknown", "{count, plural, one {1 okänt} other {{count, number} okända}}");
   P ("label.diagnostics.check_run_summary_label.none", "inga kontroller körda");
   P ("label.diagnostics.check_run_summary_label.passed",
      "{count, plural, one {1 godkänd} other {{count, number} godkända}}");
   P ("label.diagnostics.check_run_summary_label.failed",
      "{count, plural, one {1 misslyckad} other {{count, number} "
      & "misslyckade}}");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 varning} other {{count, number} varningar}}");
   P ("label.diagnostics.check_run_summary_label.skipped",
      "{count, plural, one {1 överhoppad} other {{count, number} "
      & "överhoppade}}");
   P ("label.diagnostics.check_run_summary_label.pending",
      "{count, plural, one {1 väntande} other {{count, number} väntande}}");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 objekt} other {{count, number} objekt}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {1 slutfört} other {{count, number} slutförda}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {1 aktivt} other {{count, number} aktiva}}");
   P ("label.workflows.workflow_summary_label.blocked",
      "{count, plural, one {1 blockerat} other {{count, number} blockerade}}");
   P ("label.workflows.workflow_summary_label.failed",
      "{count, plural, one {1 misslyckat} other {{count, number} "
      & "misslyckade}}");
   P ("label.workflows.workflow_summary_label.skipped",
      "{count, plural, one {1 överhoppat} other {{count, number} "
      & "överhoppade}}");
   P ("label.changes.change_summary_label.total", "{count, plural, one {1 objekt} other {{count, number} objekt}}");
   P ("label.changes.change_summary_label.added",
      "{count, plural, one {1 tillagt} other {{count, number} tillagda}}");
   P ("label.changes.change_summary_label.removed",
      "{count, plural, one {1 borttaget} other {{count, number} borttagna}}");
   P ("label.changes.change_summary_label.modified",
      "{count, plural, one {1 ändrat} other {{count, number} ändrade}}");
   P ("label.changes.change_summary_label.renamed",
      "{count, plural, one {1 omdöpt} other {{count, number} omdöpta}}");
   P ("label.changes.change_summary_label.unchanged",
      "{count, plural, one {1 oförändrat} other {{count, number} "
      & "oförändrade}}");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {knapp} link_control {länk} tab_control "
      & "{flik} menu_item_control {menyalternativ} checkbox_control {kryssruta} "
      & "radio_control {alternativknapp} text_field_control {textfält} "
      & "progress_control {förloppsindikator} table_cell_control {tabellcell} "
      & "region_control {region} other {kontroll}} {named, select, no {utan "
      & "namn} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "markerad");
   P ("label.markup.accessible_control_label.expanded", "expanderad");
   P ("label.markup.accessible_control_label.current", "aktuell");
   P ("label.markup.accessible_control_label.disabled", "inaktiverad");
   P ("label.markup.accessible_control_label.required", "obligatorisk");
   P ("label.markup.accessible_control_label.invalid", "ogiltig");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 objekt} other {{count, number} objekt}}");
   P ("label.markup.accessible_control_label.position", "objekt {position, number} av {total, number}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problem} other {{count, number} problem}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "schema");
   P ("label.endpoints.url_component.host", "värd");
   P ("label.endpoints.url_component.path", "sökväg");
   P ("label.endpoints.url_component.query", "fråga");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "rött");
   P ("label.names.hue_noun.orange", "orange");
   P ("label.names.hue_noun.yellow", "gult");
   P ("label.names.hue_noun.green", "grönt");
   P ("label.names.hue_noun.cyan", "cyan");
   P ("label.names.hue_noun.blue", "blått");
   P ("label.names.hue_noun.purple", "lila");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "neutral ton");
   P ("label.names.hue_noun.pink", "rosa");
   P ("label.names.hue_gender.red", "neuter");
   P ("label.names.hue_gender.orange", "neuter");
   P ("label.names.hue_gender.yellow", "neuter");
   P ("label.names.hue_gender.green", "neuter");
   P ("label.names.hue_gender.cyan", "neuter");
   P ("label.names.hue_gender.blue", "neuter");
end Labels_3;
