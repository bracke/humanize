separate (Humanize.Catalogs.Phrase_Data.Locale_No)
procedure Labels_3 is
begin
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {ingen obligatoriske felt} one {{missing, plural, "
      & "=0 {alle obligatoriske felt er fylt ut} other {1 av 1 obligatorisk "
      & "felt mangler}}} other {{missing, plural, =0 {alle obligatoriske felt "
      & "er fylt ut} other {{missing, number} av {total, number} obligatoriske "
      & "felt mangler}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {ingen felt} all {alle felt er fylt ut} other "
      & "{{completed, number} av {total, plural, one {1 felt} other {{total, "
      & "number} felt}} fylt ut}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: ingen felt} all {{name}: alle felt er "
      & "fylt ut} other {{name}: {completed, number} av {total, plural, one {1 "
      & "felt} other {{total, number} felt}} fylt ut}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {ingen skjematrinn} one {trinn 1 av 1: {name}} "
      & "other {trinn {current, number} av {total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {ingen brødsmuler} one {brødsmule 1 av 1: {name}} "
      & "other {brødsmule {current, number} av {total, number}: {name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {ingen faner} one {fane 1 av 1: {name}} other {fane "
      & "{current, number} av {total, number}: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {tom innboks} one {{unread, plural, =0 {alle "
      & "varsler lest} other {1 ulest av 1 varsel}}} other {{unread, plural, =0 "
      & "{alle varsler lest} other {{unread, number} uleste av {total, number} "
      & "varsler}}}}");
   P ("label.notifications.delivery_attempt_label", "leveringsforsøk {attempt, number} av {max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {ingen sjekklistepunkter} one {{done, plural, =0 {0 "
      & "av 1 punkt fullført} other {1 av 1 punkt fullført}}} other {{done, "
      & "number} av {total, number} punkter fullført}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {ingen opplastinger} one {{done, plural, =0 {0 av 1 "
      & "opplasting fullført} other {1 av 1 opplasting fullført}}} other "
      & "{{done, number} av {total, number} opplastinger fullført}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {ingen kapasitet} one {{reserved, plural, =0 {0 "
      & "av 1 plass reservert} other {1 av 1 plass reservert}}} other "
      & "{{reserved, number} av {capacity, number} plasser reservert}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {plass {position, number} på ventelisten} other "
      & "{plass {position, number} av {total, number} på ventelisten}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} endret} other {{name}: {changed, number} endret, {unchanged, "
      & "number} uendret, {total, number} totalt}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "gjeldende forgrunn oppfyller kontrast for stor tekst ved {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "gjeldende forgrunn oppfyller kontrast for normal tekst ved {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "bruk {v1} for forsterket tekstkontrast {v2, number}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "bruk {v1} for kontrast {v2, number}:{v3, number} for stor tekst");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "bruk {v1} for kontrast {v2}:{v3, number} for normal tekst");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "bruk {v1} for kontrast {v2}:{v3, number} for stor tekst");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "bruk {v1} for forsterket tekstkontrast {v2}:{v3, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "gjeldende forgrunn oppfyller kontrast for stor tekst ved {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "gjeldende forgrunn oppfyller kontrast for normal tekst ved {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "gjeldende forgrunn oppfyller forsterket tekstkontrast ved {v1}:{v2, "
      & "number}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "gjeldende forgrunn oppfyller forsterket tekstkontrast ved {v1, "
      & "number}:{v2, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanopi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranopi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanopi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatopsi: høy forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, stor perseptuell forskjell");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanopi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, dramatisk perseptuell forskjell");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatopsi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanopi: kan skilles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranopi: kan skilles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanopi: kan skilles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatopsi: kan skilles, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatopsi: moderat forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 tekstil delta {v1}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, merkbar perseptuell forskjell");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanopi: høy forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanopi: høy forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, merkbar perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1}, merkbar perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, merkbar perseptuell forskjell");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, merkbar perseptuell forskjell");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanopi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranopi: lav forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, stor perseptuell forskjell");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranopi: høy forvekslingsrisiko, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, dramatisk perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, merkbar perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 tekstil delta {v1}, subtil perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, merkbar perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 tekstil delta {v1, number}, merkbar perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible", "CIE76 delta {v1}, knapt merkbar");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, umerkelig");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 tekstil delta {v1}, umerkelig");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible", "CIEDE2000 delta {v1}, umerkelig");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, umerkelig");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, stor perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible", "CIE76 delta {v1, number}, umerkelig");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible", "CIE94 delta {v1, number}, umerkelig");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 tekstil delta {v1, number}, umerkelig");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, umerkelig");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible", "OKLab delta {v1, number}, umerkelig");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, subtil perseptuell forskjell");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, subtil perseptuell forskjell");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, subtil perseptuell forskjell");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible", "OKLab delta {v1}, knapt merkbar");
   P ("label.metrics.text_summary.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, plural, one {1 avsnitt} other {{v1, number} avsnitt}}");
   P ("label.metrics.text_summary.n_minutes_spoken",
      "{v1, plural, one {1 minutts taletid} other {{v1, number} minutters "
      & "taletid}}");
   P ("label.metrics.text_summary.n_sentences", "{v1, plural, one {1 setning} other {{v1, number} setninger}}");
   P ("label.metrics.text_summary.n_minutes_read",
      "{v1, plural, one {1 minutts lesetid} other {{v1, number} minutters "
      & "lesetid}}");
   P ("label.metrics.text_summary.n_paragraph", "{v1, plural, one {1 avsnitt} other {{v1, number} avsnitt}}");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "{v1, plural, one {under 1 minutts taletid} other {under {v1, number} "
      & "minutters taletid}}");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "{v1, plural, one {under 1 minutts lesetid} other {under {v1, number} "
      & "minutters lesetid}}");
   P ("label.metrics.text_summary.n_sentence", "{v1, plural, one {1 setning} other {{v1, number} setninger}}");
   P ("label.metrics.text_summary.no_words", "ingen ord");
   P ("label.metrics.text_summary.no_paragraphs", "ingen avsnitt");
   P ("label.metrics.text_summary.no_sentences", "ingen setninger");
   P ("label.metrics.text_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.names.hue_family_label.neutral", "nøytral");
   P ("label.names.saturation_label.neutral", "nøytral");
   P ("label.names.temperature_label.neutral_temperature", "nøytral temperatur");
   P ("label.names.chroma_label.grayish", "gråaktig");
   P ("label.names.nearest_color_name.black", "svart");
   P ("label.models.brightness_label.very_dark", "svært mørk");
   P ("label.names.hue_family_label.blue", "blå");
   P ("label.names.saturation_label.vivid", "livlig");
   P ("label.names.temperature_label.cool", "kjølig");
   P ("label.names.chroma_label.moderate_chroma", "moderat kroma");
   P ("label.names.nearest_color_name.navy", "marineblå");
   P ("label.names.chroma_label.high_chroma", "høy kroma");
   P ("label.names.nearest_color_name.blue", "blå");
   P ("label.names.hue_family_label.green", "grønn");
   P ("label.names.temperature_label.balanced_temperature", "balansert temperatur");
   P ("label.names.hue_family_label.cyan", "cyan");
   P ("label.names.chroma_label.soft", "myk");
   P ("label.models.brightness_label.dark", "mørk");
   P ("label.names.nearest_color_name.green", "grønn");
   P ("label.names.nearest_color_name.teal", "blågrønn");
   P ("label.models.brightness_label.medium_brightness", "middels lysstyrke");
   P ("label.names.nearest_color_name.aqua", "aqua");
   P ("label.names.nearest_color_name.lime", "limegrønn");
   P ("label.models.brightness_label.light", "lys");
   P ("label.names.hue_family_label.red", "rød");
   P ("label.names.temperature_label.warm", "varm");
   P ("label.names.hue_family_label.magenta", "magenta");
   P ("label.names.hue_family_label.purple", "lilla");
   P ("label.names.hue_family_label.yellow", "gul");
   P ("label.names.saturation_label.muted", "dempet");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "mettet");
   P ("label.names.nearest_color_name.maroon", "rødbrun");
   P ("label.names.nearest_color_name.purple", "lilla");
   P ("label.names.hue_family_label.orange", "oransje");
   P ("label.names.nearest_color_name.olive", "olivengrønn");
   P ("label.names.nearest_color_name.gray", "grå");
   P ("label.names.saturation_label.desaturated", "avmettet");
   P ("label.names.nearest_color_name.silver", "sølv");
   P ("label.names.chroma_label.pastel", "pastell");
   P ("label.models.brightness_label.very_light", "svært lys");
   P ("label.names.nearest_color_name.fuchsia", "fuksia");
   P ("label.names.nearest_color_name.yellow", "gul");
   P ("label.names.nearest_color_name.red", "rød");
   P ("label.names.nearest_color_name.orange", "oransje");
   P ("label.names.nearest_color_name.white", "hvit");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} lav kontrast");
   P ("label.contrast.readability_label.low_readability", "lav lesbarhet");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, utilstrekkelig, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} lav kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, utilstrekkelig, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatopsi: moderat forvekslingsrisiko");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number} % markant forskjell");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} lav kontrast etter alfablanding");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, utilstrekkelig, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, utilstrekkelig, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranopi: høy forvekslingsrisiko");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} kontrast for stor tekst");
   P ("label.contrast.readability_label.readable_for_large_text_only", "kun lesbar for stor tekst");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, stor tekst, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} kontrast for stor tekst");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, stor tekst, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanopi: høy forvekslingsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrast for stor tekst etter alfablanding");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, kun ikke-tekst, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, kun ikke-tekst, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanopi: moderat forvekslingsrisiko");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} lav kontrast");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} lav kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, kun ikke-tekst, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, kun ikke-tekst, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranopi: moderat forvekslingsrisiko");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanopi: høy forvekslingsrisiko");
   P ("label.models.color_difference_label.n_very_different", "{v1, number} % svært forskjellige");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatopsi: høy forvekslingsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatopsi: lav forvekslingsrisiko");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} lav kontrast etter alfablanding");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} kontrast for normal tekst");
   P ("label.contrast.readability_label.readable_for_normal_text", "lesbar for normal tekst");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, brødtekst, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} kontrast for normal tekst");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, brødtekst, lys tekst på mørk bakgrunn");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, stor tekst, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, stor tekst, mørk tekst på lys bakgrunn");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number} % subtil forskjell");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, brødtekst, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, brødtekst, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanopi: lav forvekslingsrisiko");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number} % merkbar forskjell");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} kontrast for stor tekst");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} kontrast for stor tekst");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranopi: lav forvekslingsrisiko");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} forsterket kontrast");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "lesbar med forsterket kontrast");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} forsterket kontrast");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, subtil perseptuell forskjell");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanopi: kan skilles");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrast for normal tekst etter alfablanding");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanopi: moderat forvekslingsrisiko");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} kontrast for normal tekst etter alfablanding");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} kontrast for stor tekst etter alfablanding");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, utmerket, mørk tekst på lys bakgrunn");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, utmerket, mørk tekst på lys bakgrunn");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrast for normal tekst");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} kontrast for normal tekst");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} forsterket kontrast");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, utmerket, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} forsterket kontrast");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, utmerket, lys tekst på mørk bakgrunn");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranopi: kan skilles");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} forsterket kontrast etter alfablanding");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, knapt merkbar");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number} % nesten identiske");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanopi: lav forvekslingsrisiko");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatopsi: kan skilles");
   P ("label.palettes.palette_summary.n_colors", "{v1, plural, one {1 farge} other {{v1, number} farger}}");
   P ("label.palettes.palette_summary.mostly_gray", "hovedsakelig grå");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "moderat kontrastspredning");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "bakgrunn {v1}, tekst {v2}, aksent {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triadisk palett");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "beste kontrast {v1} på {v2} ved {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number} av {v2, number} par består kontrast for normal tekst");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} par: {v1, number} forsterket, {v2, number} normal, {v3, "
      & "number} kun stor tekst, {v4, number} ikke bestått");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, plural, one {1 farge} other {{v1, number} farger}}, {v2, number} "
      & "par: {v3, number} forsterket, {v4, number} normal, {v5, number} kun "
      & "stor tekst, {v6, number} ikke bestått");
   P ("label.palettes.palette_mood_label.balanced", "balansert");
   P ("label.palettes.palette_mood_label.vibrant", "livlig");
   P ("label.palettes.palette_mood_label.warm_mood", "varm stemning");
   P ("label.palettes.palette_summary.mostly_blue", "hovedsakelig blå");
   P ("label.palettes.palette_summary.low_contrast_spread", "lav kontrastspredning");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "palett med én aksent");
   P ("label.palettes.palette_mood_label.dark", "mørk");
   P ("label.palettes.palette_mood_label.cool_mood", "kjølig stemning");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "hovedsakelig rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "ingen tilgjengelige tekstpar");
   P ("label.palettes.palette_mood_label.subtle", "diskret");
   P ("label.palettes.palette_summary.high_contrast_spread", "høy kontrastspredning");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "beste kontrast {v1} på {v2} ved {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "nøytral stemning");
   P ("label.palettes.palette_summary.mostly_purple", "hovedsakelig lilla");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementær palett");
   P ("label.palettes.palette_summary.mostly_green", "hovedsakelig grønn");
   P ("label.palettes.palette_mood_label.moderate", "moderat");
   P ("label.palettes.palette_summary.mostly_silver", "hovedsakelig sølv");
   P ("label.palettes.palette_harmony_label.varied_palette", "variert palett");
   P ("label.palettes.palette_summary.mostly_olive", "hovedsakelig olivengrønn");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analog palett");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number} av {v2, number} par består kun for stor tekst");
   P ("label.palettes.palette_mood_label.light", "lys");
   P ("label.palettes.palette_summary.mostly_teal", "hovedsakelig blågrønn");
   P ("label.palettes.palette_summary.mostly_aqua", "hovedsakelig aqua");
   P ("label.palettes.palette_summary.mostly_lime", "hovedsakelig limegrønn");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monokrom palett");
   P ("label.palettes.palette_summary.mostly_black", "hovedsakelig svart");
   P ("label.palettes.palette_summary.mostly_yellow", "hovedsakelig gul");
   P ("label.palettes.palette_summary.mostly_maroon", "hovedsakelig rødbrun");
   P ("label.palettes.palette_summary.mostly_white", "hovedsakelig hvit");
   P ("label.palettes.palette_summary.mostly_orange", "hovedsakelig oransje");
   P ("label.palettes.palette_summary.mostly_fuchsia", "hovedsakelig fuksia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "nøytral palett");
   P ("label.palettes.palette_summary.mostly_red", "hovedsakelig rød");
   P ("label.metrics.word_count_summary.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.sentence_count_summary.n_sentences",
      "{v1, plural, one {1 setning} other {{v1, number} setninger}}");
   P ("label.metrics.paragraph_count_summary.n_paragraphs",
      "{v1, plural, one {1 avsnitt} other {{v1, number} avsnitt}}");
   P ("label.metrics.reading_time.n_minutes_read",
      "{v1, plural, one {1 minutts lesetid} other {{v1, number} minutters "
      & "lesetid}}");
   P ("label.metrics.speaking_time.n_minutes_spoken",
      "{v1, plural, one {1 minutts taletid} other {{v1, number} minutters "
      & "taletid}}");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_sentences",
      "{v1, plural, one {1 setning} other {{v1, number} setninger}}");
   P ("label.metrics.text_summary_with_options.n_paragraphs",
      "{v1, plural, one {1 avsnitt} other {{v1, number} avsnitt}}");
   P ("label.metrics.text_summary_with_options.n_minutes_read",
      "{v1, plural, one {1 minutts lesetid} other {{v1, number} minutters "
      & "lesetid}}");
   P ("label.metrics.paragraph_count_summary.n_paragraph",
      "{v1, plural, one {1 avsnitt} other {{v1, number} avsnitt}}");
   P ("label.metrics.reading_time.less_than_n_minute_read",
      "{v1, plural, one {under 1 minutts lesetid} other {under {v1, number} "
      & "minutters lesetid}}");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken",
      "{v1, plural, one {under 1 minutts taletid} other {under {v1, number} "
      & "minutters taletid}}");
   P ("label.metrics.text_summary_with_options.n_paragraph",
      "{v1, plural, one {1 avsnitt} other {{v1, number} avsnitt}}");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read",
      "{v1, plural, one {under 1 minutts lesetid} other {under {v1, number} "
      & "minutters lesetid}}");
   P ("label.metrics.sentence_count_summary.n_sentence",
      "{v1, plural, one {1 setning} other {{v1, number} setninger}}");
   P ("label.metrics.text_summary_with_options.n_sentence",
      "{v1, plural, one {1 setning} other {{v1, number} setninger}}");
   P ("label.metrics.word_count_summary.no_words", "ingen ord");
   P ("label.metrics.sentence_count_summary.no_sentences", "ingen setninger");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "ingen avsnitt");
   P ("label.metrics.text_summary_with_options.no_words", "ingen ord");
   P ("label.metrics.text_summary_with_options.no_sentences", "ingen setninger");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "ingen avsnitt");
   P ("label.metrics.word_count_summary.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, plural, one {1 ord} other {{v1, number} ord}}");
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {ingen observasjoner} "
      & "sample_too_small_shape {utvalget er for lite til å beskrive formen, "
      & "{count, plural, one {1 observasjon} other {{count, number} "
      & "observasjoner}}} flat_shape {flat fordeling ved {median}} "
      & "outlier_heavy_shape {fordeling med mange uteliggere rundt {median}} "
      & "volatile_shape {ustabil fordeling rundt {median}} clustered_shape "
      & "{gruppert fordeling rundt {median}} wide_spread_shape {bredt spredt "
      & "fordeling} wide_spread_range {bredt spredt fordeling fra {minimum} til "
      & "{maximum}} right_skewed_shape {høyreskjev fordeling, median {median}} "
      & "left_skewed_shape {venstreskjev fordeling, median {median}} other "
      & "{stort sett balansert fordeling rundt {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tom e-post} address {e-postadresse} other "
      & "{e-post hos {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonnummer} redacted {telefonnummer sladdet} "
      & "other {telefonnummer som slutter på {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {brukernavn} other {brukernavn {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodesymbol} other {kodesymbol {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adressemetadata: {present, plural, one {1 felt finnes} other "
      & "{{present, number} felt finnes}}, {missing, plural, one {1 felt "
      & "mangler} other {{missing, number} felt mangler}}");
   P ("label.endpoints.host_label", "{state, select, none {ukjent vert} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {ukjent endepunkt} other {endepunkt "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tom URL} none {URL uten gjenkjente komponenter} "
      & "other {URL med {count, plural, one {1 komponent} other {{count, "
      & "number} komponenter}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {ingen spørreparametere} one {1 spørreparameter} "
      & "other {{count, number} spørreparametere}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {offentlig IPv4-adresse} ipv6_host "
      & "{offentlig IPv6-adresse} private_network_host {privat "
      & "nettverksadresse} localhost_host {lokal vert} other {ikke en "
      & "IP-adresse}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} (ugyldig CIDR)} other {{cidr} ({kind}, "
      & "nettverksprefiks {prefix})}}");
   P ("label.resources.utilization_label", "{used, number} av {total, number} {unit} brukt ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {ressurs} other {{name}}} {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {versjon {version}, forhåndsversjon "
      & "{prerelease}, bygg {build}} prerelease {versjon {version}, "
      & "forhåndsversjon {prerelease}} build {versjon {version}, bygg {build}} "
      & "other {versjon {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {samme versjon} major_upgrade "
      & "{oppgradering av hovedversjon} minor_upgrade {oppgradering av "
      & "delversjon} patch_upgrade {patchoppgradering} prerelease_change "
      & "{endret forhåndsversjon} build_metadata_change {endrede byggmetadata} "
      & "downgrade {nedgradering} other {ukjent versjonsendring}}: {from} -> "
      & "{to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {nøyaktig versjon {version}} minimum_range "
      & "{versjon {version} eller nyere} maximum_range {versjon {version} eller "
      & "eldre} major_compatible_range {kompatibel med hovedversjon {version}} "
      & "minor_compatible_range {kompatibel med delversjon {version}} other "
      & "{versjonsområde {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {første utviklingsversjon {version}} "
      & "prerelease {forhåndsversjon {version}} major {hovedversjon {version}} "
      & "minor {delversjon {version}} other {patchversjon {version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {lenketagg} image {bildetagg} paragraph "
      & "{avsnittstagg} ordered_list {tagg for nummerert liste} unordered_list "
      & "{tagg for punktliste} list_item {listeelementtagg} table_header_cell "
      & "{tagg for tabelloverskriftscelle} table_cell {tabellcelletagg} "
      & "table_row {tabellradtagg} line_break {linjeskifttagg} thematic_break "
      & "{tagg for tematisk skille} heading_level_n {tagg for overskrift på "
      & "nivå {level, number}} other {{name}-tagg}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name}-attributt} event "
      & "{hendelsesbehandlerattributt {name}} other {attributt {name} satt til "
      & "«{value}»}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {tekstinnhold} html_content "
      & "{HTML-dokument} json_content {JSON-dokument} xml_content "
      & "{XML-dokument} image_content {bildeinnhold} audio_content {lydinnhold} "
      & "video_content {videoinnhold} font_content {skriftinnhold} "
      & "archive_content {arkivinnhold} binary_content {binært innhold} "
      & "form_content {skjemainnsending} other {ukjent innhold}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} ikke angitt} hidden_value {{kind} "
      & "skjult} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "fingeravtrykk som slutter på {shown}} other {{kind} som slutter på "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name}: {kind} ikke angitt} other {{name}: "
      & "{kind} som slutter på {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {påloggingshode {name} ikke angitt} other "
      & "{{name}: {kind} som slutter på {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-fingeravtrykk som slutter på {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} ikke angitt} redacted {{label} "
      & "sladdet} url_redacted {URL sladdet} ip_redacted {IP-adresse sladdet} "
      & "path_ending {filbane som slutter på {shown}} at {{label} hos {shown}} "
      & "audit {{label}, lengde {length, number}, slutter på {shown}} debug "
      & "{{label} {shown}} other {{label} som slutter på {shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {foreldet } unknown_field {ukjent } "
      & "read_only_field {skrivebeskyttet } write_only_field {bare skrivbart } "
      & "computed_field {beregnet } other {}}{kind, select, string_field "
      & "{strengfelt} integer_field {heltallsfelt} decimal_field {desimalfelt} "
      & "boolean_field {boolsk felt} date_field {datofelt} date_time_field "
      & "{tidspunktfelt} object_field {objektfelt} array_field {arrayfelt} "
      & "enum_field {enum-felt} binary_field {binærfelt} null_field "
      & "{null-felt} any_field {felt av vilkårlig type} other {felt av ukjent "
      & "type}} {name} ({presence, select, required_field {obligatorisk} "
      & "optional_field {valgfritt} conditional_field {betinget} other {ukjent "
      & "forekomst}}{nullable, select, non_nullable {, ikke null} nullable {, "
      & "kan være null} other {}})");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {1 felt} other {{count, number} felt}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {1 obligatorisk} other {{count, number} "
      & "obligatoriske}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {1 valgfritt} other {{count, number} valgfrie}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {1 foreldet} other {{count, number} foreldede}}");
   P ("label.schema.schema_summary_label.unknown", "{count, plural, one {1 ukjent} other {{count, number} ukjente}}");
   P ("label.diagnostics.check_run_summary_label.none", "ingen kontroller kjørt");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} bestått");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} mislyktes");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 advarsel} other {{count, number} advarsler}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} hoppet over");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} venter");
   P ("label.workflows.workflow_summary_label.total",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.workflows.workflow_summary_label.completed",
      "{count, plural, one {1 fullført} other {{count, number} fullførte}}");
   P ("label.workflows.workflow_summary_label.active",
      "{count, plural, one {1 aktivt} other {{count, number} aktive}}");
   P ("label.workflows.workflow_summary_label.blocked",
      "{count, plural, one {1 blokkert} other {{count, number} blokkerte}}");
   P ("label.workflows.workflow_summary_label.failed", "{count, number} mislyktes");
   P ("label.workflows.workflow_summary_label.skipped", "{count, number} hoppet over");
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.changes.change_summary_label.added", "{count, number} lagt til");
   P ("label.changes.change_summary_label.removed", "{count, number} fjernet");
   P ("label.changes.change_summary_label.modified", "{count, number} endret");
   P ("label.changes.change_summary_label.renamed", "{count, number} omdøpt");
   P ("label.changes.change_summary_label.unchanged", "{count, number} uendret");
   P ("label.markup.accessible_control_label.control",
      "{role, select, button_control {knapp} link_control {lenke} tab_control "
      & "{fane} menu_item_control {menyelement} checkbox_control "
      & "{avmerkingsboks} radio_control {alternativknapp} text_field_control "
      & "{tekstfelt} progress_control {fremdriftsindikator} table_cell_control "
      & "{tabellcelle} region_control {region} other {kontroll}} {named, "
      & "select, no {uten navn} other {{name}}}");
   P ("label.markup.accessible_control_label.selected", "valgt");
   P ("label.markup.accessible_control_label.expanded", "utvidet");
   P ("label.markup.accessible_control_label.current", "gjeldende");
   P ("label.markup.accessible_control_label.disabled", "deaktivert");
   P ("label.markup.accessible_control_label.required", "obligatorisk");
   P ("label.markup.accessible_control_label.invalid", "ugyldig");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.markup.accessible_control_label.position", "element {position, number} av {total, number}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {1 problem} other {{count, number} problemer}}");
   P ("label.markup.accessible_control_label.with_states", "{control}, {states}");
   P ("label.endpoints.url_component.scheme", "skjema");
   P ("label.endpoints.url_component.host", "vert");
   P ("label.endpoints.url_component.path", "bane");
   P ("label.endpoints.url_component.query", "spørring");
   P ("label.endpoints.url_component.fragment", "fragment");
   P ("label.names.hue_noun.red", "rødt");
   P ("label.names.hue_noun.orange", "oransje");
   P ("label.names.hue_noun.yellow", "gult");
   P ("label.names.hue_noun.green", "grønt");
   P ("label.names.hue_noun.cyan", "cyan");
   P ("label.names.hue_noun.blue", "blått");
   P ("label.names.hue_noun.purple", "lilla");
   P ("label.names.hue_noun.magenta", "magenta");
   P ("label.names.hue_noun.neutral", "nøytral tone");
   P ("label.names.hue_noun.pink", "rosa");
   P ("label.names.hue_gender.red", "neuter");
   P ("label.names.hue_gender.orange", "neuter");
   P ("label.names.hue_gender.yellow", "neuter");
   P ("label.names.hue_gender.green", "neuter");
   P ("label.names.hue_gender.cyan", "neuter");
   P ("label.names.hue_gender.blue", "neuter");
   P ("label.names.hue_gender.purple", "neuter");
   P ("label.names.hue_gender.magenta", "neuter");
   P ("label.names.hue_gender.neutral", "masculine");
   P ("label.names.hue_gender.pink", "neuter");
   P ("label.names.agree.very_dark", "{gender, select, neuter {svært mørkt} other {svært mørk}}");
   P ("label.names.agree.dark", "{gender, select, neuter {mørkt} other {mørk}}");
   P ("label.names.agree.medium_brightness", "{gender, select, neuter {middels lyst} other {middels lys}}");
   P ("label.names.agree.light", "{gender, select, neuter {lyst} other {lys}}");
   P ("label.names.agree.very_light", "{gender, select, neuter {svært lyst} other {svært lys}}");
   P ("label.names.agree.desaturated", "{gender, select, other {avmettet}}");
   P ("label.names.agree.muted", "{gender, select, other {dempet}}");
   P ("label.names.agree.neutral", "{gender, select, neuter {nøytralt} other {nøytral}}");
   P ("label.names.agree.saturated", "{gender, select, other {mettet}}");
   P ("label.names.agree.vivid", "{gender, select, other {livlig}}");
   P ("label.names.agree.grayish", "{gender, select, other {gråaktig}}");
   P ("label.names.agree.soft", "{gender, select, neuter {mykt} other {myk}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {moderat kromatisk}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {høykromatisk}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastellfarget}}");
   P ("label.names.agree.warm", "{gender, select, neuter {varmt} other {varm}}");
   P ("label.names.agree.cool", "{gender, select, other {kjølig}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, neuter {temperaturnøytralt} other "
      & "{temperaturnøytral}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {temperaturbalansert}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {rosa} other "
      & "{{hue}}}");
end Labels_3;
