separate (Humanize.Catalogs.Phrase_Data.Locale_Da)
procedure Labels_3 is
begin
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
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
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
   P ("label.statistics.distribution_shape_label",
      "{shape, select, no_distribution_shape {ingen observationer} "
      & "sample_too_small_shape {stikprøven er for lille til at beskrive "
      & "formen, {count, plural, one {1 observation} other {{count, number} "
      & "observationer}}} flat_shape {flad fordeling ved {median}} "
      & "outlier_heavy_shape {fordeling med mange afvigere omkring {median}} "
      & "volatile_shape {svingende fordeling omkring {median}} clustered_shape "
      & "{klyngedelt fordeling omkring {median}} wide_spread_shape {bredt "
      & "spredt fordeling} wide_spread_range {bredt spredt fordeling fra "
      & "{minimum} til {maximum}} right_skewed_shape {højreskæv fordeling, "
      & "median {median}} left_skewed_shape {venstreskæv fordeling, median "
      & "{median}} other {overvejende balanceret fordeling omkring {median}}}");
   P ("label.privacy.safe_email_label",
      "{state, select, empty {tom e-mail} address {e-mailadresse} other "
      & "{e-mail hos {domain}}}");
   P ("label.privacy.safe_phone_label",
      "{state, select, none {telefonnummer} redacted {telefonnummer sløret} "
      & "other {telefonnummer der ender på {digits}}}");
   P ("label.privacy.safe_handle_label", "{state, select, none {brugernavn} other {brugernavn {shown}}}");
   P ("label.privacy.code_symbol_label", "{state, select, none {kodesymbol} other {kodesymbol {symbol}}}");
   P ("label.privacy.address_metadata_label",
      "adressemetadata: {present, plural, one {1 felt til stede} other "
      & "{{present, number} felter til stede}}, {missing, plural, one {1 felt "
      & "mangler} other {{missing, number} felter mangler}}");
   P ("label.endpoints.host_label", "{state, select, none {ukendt vært} other {{kind} {host}}}");
   P ("label.endpoints.endpoint_label",
      "{state, select, none {ukendt endepunkt} other {endepunkt "
      & "{scheme}{host}{port} ({kind})}}");
   P ("label.endpoints.url_component_summary",
      "{state, select, empty {tom URL} none {URL uden genkendte komponenter} "
      & "other {URL med {count, plural, one {1 komponent} other {{count, "
      & "number} komponenter}}: {components}}}");
   P ("label.endpoints.query_summary",
      "{count, plural, =0 {ingen forespørgselsparametre} one {1 "
      & "forespørgselsparameter} other {{count, number} "
      & "forespørgselsparametre}}");
   P ("label.endpoints.ip_address_label",
      "{address} ({kind, select, ipv4_host {offentlig IPv4-adresse} ipv6_host "
      & "{offentlig IPv6-adresse} private_network_host {adresse på privat "
      & "netværk} localhost_host {lokal vært} other {ikke en IP-adresse}})");
   P ("label.endpoints.cidr_label",
      "{state, select, invalid {{cidr} (ugyldig CIDR)} other {{cidr} ({kind}, "
      & "netværkspræfiks {prefix})}}");
   P ("label.resources.utilization_label", "{used, number} af {total, number} {unit} brugt ({percent}, {band})");
   P ("label.resources.saturation_label", "{named, select, no {ressource} other {{name}}} {percent}, {band}");
   P ("label.versions.version_label",
      "{state, select, both {version {version}, forhåndsversion "
      & "{prerelease}, build {build}} prerelease {version {version}, "
      & "forhåndsversion {prerelease}} build {version {version}, build "
      & "{build}} other {version {version}}}");
   P ("label.versions.version_delta_label",
      "{delta, select, same_version {samme version} major_upgrade "
      & "{opgradering af hovedversion} minor_upgrade {opgradering af "
      & "underversion} patch_upgrade {patchopgradering} prerelease_change "
      & "{ændret forhåndsversion} build_metadata_change {ændrede "
      & "buildmetadata} downgrade {nedgradering} other {ukendt "
      & "versionsændring}}: {from} -> {to}");
   P ("label.versions.compatibility_range_label",
      "{kind, select, exact_range {præcis version {version}} minimum_range "
      & "{version {version} eller nyere} maximum_range {version {version} eller "
      & "ældre} major_compatible_range {kompatibel med hovedversion {version}} "
      & "minor_compatible_range {kompatibel med underversion {version}} other "
      & "{versionsinterval {version}}}");
   P ("label.versions.release_label",
      "{state, select, initial {første udviklingsudgivelse {version}} "
      & "prerelease {forhåndsudgivelse {version}} major {hovedudgivelse "
      & "{version}} minor {underudgivelse {version}} other {patchudgivelse "
      & "{version}}}");
   P ("label.markup.tag_label",
      "{tag, select, link {linktag} image {billedtag} paragraph {afsnitstag} "
      & "ordered_list {tag for nummereret liste} unordered_list {tag for "
      & "punktliste} list_item {listeelementtag} table_header_cell {tag for "
      & "tabeloverskriftscelle} table_cell {tabelcelletag} table_row "
      & "{tabelrækketag} line_break {linjeskifttag} thematic_break {tag for "
      & "tematisk skift} heading_level_n {tag for overskrift på niveau {level, "
      & "number}} other {{name}-tag}}");
   P ("label.markup.attribute_label",
      "{state, select, bare {{name}-attribut} event "
      & "{hændelseshåndteringsattribut {name}} other {attribut {name} sat til "
      & "»{value}«}}");
   P ("label.markup.content_type_label",
      "{kind, select, text_content {tekstindhold} html_content "
      & "{HTML-dokument} json_content {JSON-dokument} xml_content "
      & "{XML-dokument} image_content {billedindhold} audio_content "
      & "{lydindhold} video_content {videoindhold} font_content "
      & "{skrifttypeindhold} archive_content {arkivindhold} binary_content "
      & "{binært indhold} form_content {formularindsendelse} other {ukendt "
      & "indhold}} ({base})");
   P ("label.secrets.secret_label",
      "{state, select, unset {{kind} ikke angivet} hidden_value {{kind} "
      & "skjult} masked_value {{kind} {shown}} fingerprint_only {{kind}, "
      & "fingeraftryk der ender på {shown}} other {{kind} der ender på "
      & "{shown}}}");
   P ("label.secrets.environment_secret_label",
      "{state, select, unset {{name}: {kind} ikke angivet} other {{name}: "
      & "{kind} der ender på {shown}}}");
   P ("label.secrets.header_credential_label",
      "{state, select, unset {legitimationsheader {name} ikke angivet} other "
      & "{{name}: {kind} der ender på {shown}}}");
   P ("label.secrets.fingerprint_label", "{algorithm}-fingeraftryk der ender på {shown}");
   P ("label.secrets.safe_display_label",
      "{state, select, not_set {{label} ikke angivet} redacted {{label} "
      & "sløret} url_redacted {URL sløret} ip_redacted {IP-adresse sløret} "
      & "path_ending {filsti der ender på {shown}} at {{label} hos {shown}} "
      & "audit {{label}, længde {length, number}, ender på {shown}} debug "
      & "{{label} {shown}} other {{label} der ender på {shown}}}");
   P ("label.schema.field_label",
      "{state, select, deprecated_field {forældet } unknown_field {ukendt } "
      & "read_only_field {skrivebeskyttet } write_only_field {kun skrivbart } "
      & "computed_field {beregnet } other {}}{kind, select, string_field "
      & "{strengfelt} integer_field {heltalsfelt} decimal_field {decimalfelt} "
      & "boolean_field {boolesk felt} date_field {datofelt} date_time_field "
      & "{dato-tidsfelt} object_field {objektfelt} array_field {arrayfelt} "
      & "enum_field {enum-felt} binary_field {binært felt} null_field "
      & "{null-felt} any_field {felt af vilkårlig type} other {felt af ukendt "
      & "type}} {name} ({presence, select, required_field {obligatorisk} "
      & "optional_field {valgfrit} conditional_field {betinget} other {ukendt "
      & "tilstedeværelse}}{nullable, select, non_nullable {, ikke null} "
      & "nullable {, kan være null} other {}})");
   P ("label.schema.schema_summary_label.fields", "{count, plural, one {1 felt} other {{count, number} felter}}");
   P ("label.schema.schema_summary_label.required",
      "{count, plural, one {1 obligatorisk} other {{count, number} "
      & "obligatoriske}}");
   P ("label.schema.schema_summary_label.optional",
      "{count, plural, one {1 valgfrit} other {{count, number} valgfrie}}");
   P ("label.schema.schema_summary_label.deprecated",
      "{count, plural, one {1 forældet} other {{count, number} forældede}}");
   P ("label.schema.schema_summary_label.unknown", "{count, plural, one {1 ukendt} other {{count, number} ukendte}}");
   P ("label.diagnostics.check_run_summary_label.none", "ingen kontroller kørt");
   P ("label.diagnostics.check_run_summary_label.passed", "{count, number} bestået");
   P ("label.diagnostics.check_run_summary_label.failed", "{count, number} mislykkedes");
   P ("label.diagnostics.check_run_summary_label.warnings",
      "{count, plural, one {1 advarsel} other {{count, number} advarsler}}");
   P ("label.diagnostics.check_run_summary_label.skipped", "{count, number} sprunget over");
   P ("label.diagnostics.check_run_summary_label.pending", "{count, number} afventer");
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
   P ("label.changes.change_summary_label.total",
      "{count, plural, one {1 element} other {{count, number} elementer}}");
   P ("label.changes.change_summary_label.added", "{count, number} tilføjet");
   P ("label.changes.change_summary_label.removed", "{count, number} fjernet");
   P ("label.changes.change_summary_label.modified", "{count, number} ændret");
   P ("label.changes.change_summary_label.renamed", "{count, number} omdøbt");
   P ("label.changes.change_summary_label.unchanged", "{count, number} uændret");
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
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {lyserødt} "
      & "other {{hue}}}");
end Labels_3;
