separate (Humanize.Catalogs.Phrase_Data.Locale_Nb)
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
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {rosa} other "
      & "{{hue}}}");
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
end Labels_3;
