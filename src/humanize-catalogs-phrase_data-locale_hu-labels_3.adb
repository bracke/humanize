separate (Humanize.Catalogs.Phrase_Data.Locale_Hu)
procedure Labels_3 is
begin
   P ("label.changes.net_change_label",
      "{state, select, none {nincs nettó változás} up {nettó +{count, "
      & "plural, one {1 elem} other {{count, number} elem}}} other {nettó "
      & "-{count, plural, one {1 elem} other {{count, number} elem}}}}");
   P ("label.changes.review_progress_label",
      "{state, select, none {nincs áttekintendő változás} all {minden "
      & "változás áttekintve} other {{reviewed, number}/{total, number} "
      & "változás áttekintve}}");
   P ("label.changes.numeric_field_change_label",
      "{state, select, same {{field_name} változatlan: {new_value}} up "
      & "{{field_name} nőtt: {old_value} → {new_value}} other {{field_name} "
      & "csökkent: {old_value} → {new_value}}}");
   P ("label.tables.selection_label",
      "{state, select, no_rows {nincs kijelölhető sor} none {nincs "
      & "kijelölt sor} all {{total, plural, one {1 sor} other {mind a(z) "
      & "{total, number} sor}} kijelölve} other {{selected, number}/{total, "
      & "number} sor kijelölve}}");
   P ("label.tables.page_label",
      "{page, plural, =0 {nincs oldal} other {{pages, plural, =0 {nincs "
      & "oldal} other {{rows, plural, =0 {{page, number}/{pages, number}. "
      & "oldal} one {{page, number}/{pages, number}. oldal, 1 sor} other "
      & "{{page, number}/{pages, number}. oldal, {rows, number} sor}}}}}}");
   P ("label.tables.filter_label",
      "{state, select, no_rows {nincs sor} none {nincs egyező sor} all "
      & "{{total, plural, one {1 sor} other {mind a(z) {total, number} sor}} "
      & "látható} other {{visible, number}/{total, number} sor látható}}");
   P ("label.tables.row_range_label",
      "{state, select, none {nincs sor} single {{first_row, number}. sor "
      & "ennyiből: {total, number}} other {{first_row, number}–{last_row, "
      & "number}. sor ennyiből: {total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {nincs karakterkorlát} none_left {nem "
      & "maradt karakter} left {{count, plural, one {1 karakter} other {{count, "
      & "number} karakter}} maradt} other {{count, plural, one {1 karakter} "
      & "other {{count, number} karakter}} a korlát felett}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {nincs kötelező mező} one {{missing, plural, =0 "
      & "{minden kötelező mező kitöltve} other {1/1 kötelező mező "
      & "hiányzik}}} other {{missing, plural, =0 {minden kötelező mező "
      & "kitöltve} other {{missing, number}/{total, number} kötelező mező "
      & "hiányzik}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {nincs mező} all {minden mező kitöltve} other "
      & "{{completed, number}/{total, number} mező kitöltve}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: nincs mező} all {{name}: minden mező "
      & "kitöltve} other {{name}: {completed, number}/{total, number} mező "
      & "kitöltve}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {nincs űrlaplépés} one {1/1. lépés: {name}} "
      & "other {{current, number}/{total, number}. lépés: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {nincs útvonalelem} one {1/1. útvonalelem: "
      & "{name}} other {{current, number}/{total, number}. útvonalelem: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {nincs lap} one {1/1. lap: {name}} other {{current, "
      & "number}/{total, number}. lap: {name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {üres beérkezett üzenetek} one {{unread, plural, "
      & "=0 {minden értesítés elolvasva} other {1/1 értesítés "
      & "olvasatlan}}} other {{unread, plural, =0 {minden értesítés "
      & "elolvasva} other {{unread, number}/{total, number} értesítés "
      & "olvasatlan}}}}");
   P ("label.notifications.delivery_attempt_label",
      "{attempt, number}/{max_attempts, number}. kézbesítési kísérlet");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {nincs ellenőrzőlista-elem} one {{done, plural, "
      & "=0 {0/1 elem kész} other {1/1 elem kész}}} other {{done, "
      & "number}/{total, number} elem kész}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {nincs feltöltés} one {{done, plural, =0 {0/1 "
      & "feltöltés kész} other {1/1 feltöltés kész}}} other {{done, "
      & "number}/{total, number} feltöltés kész}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {nincs férőhely} one {{reserved, plural, =0 "
      & "{0/1 hely lefoglalva} other {1/1 hely lefoglalva}}} other {{reserved, "
      & "number}/{capacity, number} hely lefoglalva}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {hely a várólistán: {position, number}} other "
      & "{hely a várólistán: {position, number}/{total, number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} módosult} other {{name}: {changed, number} módosult, "
      & "{unchanged, number} változatlan, összesen {total, number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {rózsaszín} "
      & "other {{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.groups", "{first}; {second}");
   P ("label.parts", "{first}, {second}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "a jelenlegi előtér {v1}:{v2, number} aránnyal megfelel a nagy "
      & "szöveg kontrasztkövetelményének");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "a jelenlegi előtér {v1}:{v2, number} aránnyal megfelel a normál "
      & "szöveg kontrasztkövetelményének");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "fokozott szöveg kontraszthoz ({v2, number}:{v3, number}) használja "
      & "ezt: {v1}");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "nagy szöveg kontraszthoz ({v2, number}:{v3, number}) használja ezt: "
      & "{v1}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "normál szöveg kontraszthoz ({v2}:{v3, number}) használja ezt: {v1}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "nagy szöveg kontraszthoz ({v2}:{v3, number}) használja ezt: {v1}");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "fokozott szöveg kontraszthoz ({v2}:{v3, number}) használja ezt: {v1}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "a jelenlegi előtér {v1, number}:{v2, number} aránnyal megfelel a "
      & "nagy szöveg kontrasztkövetelményének");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "a jelenlegi előtér {v1, number}:{v2, number} aránnyal megfelel a "
      & "normál szöveg kontrasztkövetelményének");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "a jelenlegi előtér {v1}:{v2, number} aránnyal megfelel a fokozott "
      & "szöveg kontrasztkövetelményének");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "a jelenlegi előtér {v1, number}:{v2, number} aránnyal megfelel a "
      & "fokozott szöveg kontrasztkövetelményének");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "protanópia: alacsony összetévesztési kockázat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "deuteranópia: közepes összetévesztési kockázat, delta {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "tritanópia: közepes összetévesztési kockázat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "akromatópsia: magas összetévesztési kockázat, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 delta {v1}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 delta {v1}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 textil delta {v1}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1, number}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab delta {v1}, nagy észlelési különbség");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "protanópia: közepes összetévesztési kockázat, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 delta {v1, number}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 delta {v1}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab delta {v1}, drámai észlelési különbség");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "akromatópsia: alacsony összetévesztési kockázat, delta {v1, "
      & "number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "protanópia: megkülönböztethető, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "deuteranópia: megkülönböztethető, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "tritanópia: megkülönböztethető, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "akromatópsia: megkülönböztethető, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "akromatópsia: közepes összetévesztési kockázat, delta {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 delta {v1}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 delta {v1}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 textil delta {v1}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 delta {v1}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab delta {v1}, észrevehető észlelési különbség");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "protanópia: magas összetévesztési kockázat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "tritanópia: magas összetévesztési kockázat, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 delta {v1}, észrevehető észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 textil delta {v1}, észrevehető észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1}, észrevehető észlelési különbség");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab delta {v1, number}, észrevehető észlelési különbség");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "tritanópia: alacsony összetévesztési kockázat, delta {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "deuteranópia: alacsony összetévesztési kockázat, delta {v1, "
      & "number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab delta {v1, number}, nagy észlelési különbség");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "deuteranópia: magas összetévesztési kockázat, delta {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 delta {v1, number}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 textil delta {v1, number}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab delta {v1, number}, drámai észlelési különbség");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 delta {v1, number}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 textil delta {v1, number}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 delta {v1, number}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 delta {v1}, észrevehető észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 textil delta {v1}, finom észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 delta {v1, number}, észrevehető észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 textil delta {v1, number}, észrevehető észlelési "
      & "különbség");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 delta {v1}, alig észlelhető");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible", "CIE94 delta {v1}, nem észlelhető");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 textil delta {v1}, nem észlelhető");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 delta {v1}, nem észlelhető");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible", "OKLab delta {v1}, nem észlelhető");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 delta {v1, number}, nagy észlelési különbség");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 delta {v1, number}, nem észlelhető");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 delta {v1, number}, nem észlelhető");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 textil delta {v1, number}, nem észlelhető");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 delta {v1, number}, nem észlelhető");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab delta {v1, number}, nem észlelhető");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab delta {v1}, finom észlelési különbség");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 delta {v1}, finom észlelési különbség");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 delta {v1}, finom észlelési különbség");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab delta {v1}, alig észlelhető");
   P ("label.metrics.text_summary.n_words", "{v1, number} szó");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} bekezdés");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} perc beszéd");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} mondat");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} perc olvasás");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} bekezdés");
   P ("label.metrics.text_summary.less_than_n_minute_spoken", "kevesebb mint {v1, number} perc beszéd");
   P ("label.metrics.text_summary.less_than_n_minute_read", "kevesebb mint {v1, number} perc olvasás");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} mondat");
   P ("label.metrics.text_summary.no_words", "nincsenek szavak");
   P ("label.metrics.text_summary.no_paragraphs", "nincsenek bekezdések");
   P ("label.metrics.text_summary.no_sentences", "nincsenek mondatok");
   P ("label.metrics.text_summary.n_word", "{v1, number} szó");
   P ("label.names.hue_family_label.neutral", "semleges");
   P ("label.names.saturation_label.neutral", "semleges");
   P ("label.names.temperature_label.neutral_temperature", "semleges hőmérséklet");
   P ("label.names.chroma_label.grayish", "szürkés");
   P ("label.names.nearest_color_name.black", "fekete");
   P ("label.models.brightness_label.very_dark", "nagyon sötét");
   P ("label.names.hue_family_label.blue", "kék");
   P ("label.names.saturation_label.vivid", "élénk");
   P ("label.names.temperature_label.cool", "hideg");
   P ("label.names.chroma_label.moderate_chroma", "közepes króma");
   P ("label.names.nearest_color_name.navy", "sötétkék");
   P ("label.names.chroma_label.high_chroma", "magas króma");
   P ("label.names.nearest_color_name.blue", "kék");
   P ("label.names.hue_family_label.green", "zöld");
   P ("label.names.temperature_label.balanced_temperature", "kiegyensúlyozott hőmérséklet");
   P ("label.names.hue_family_label.cyan", "cián");
   P ("label.names.chroma_label.soft", "lágy");
   P ("label.models.brightness_label.dark", "sötét");
   P ("label.names.nearest_color_name.green", "zöld");
   P ("label.names.nearest_color_name.teal", "kékeszöld");
   P ("label.models.brightness_label.medium_brightness", "közepes világosság");
   P ("label.names.nearest_color_name.aqua", "vízkék");
   P ("label.names.nearest_color_name.lime", "limezöld");
   P ("label.models.brightness_label.light", "világos");
   P ("label.names.hue_family_label.red", "piros");
   P ("label.names.temperature_label.warm", "meleg");
   P ("label.names.hue_family_label.magenta", "bíbor");
   P ("label.names.hue_family_label.purple", "lila");
   P ("label.names.hue_family_label.yellow", "sárga");
   P ("label.names.saturation_label.muted", "tompa");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "telített");
   P ("label.names.nearest_color_name.maroon", "gesztenyebarna");
   P ("label.names.nearest_color_name.purple", "lila");
   P ("label.names.hue_family_label.orange", "narancs");
   P ("label.names.nearest_color_name.olive", "olajzöld");
   P ("label.names.nearest_color_name.gray", "szürke");
   P ("label.names.saturation_label.desaturated", "telítetlen");
   P ("label.names.nearest_color_name.silver", "ezüst");
   P ("label.names.chroma_label.pastel", "pasztell");
   P ("label.models.brightness_label.very_light", "nagyon világos");
   P ("label.names.nearest_color_name.fuchsia", "fukszia");
   P ("label.names.nearest_color_name.yellow", "sárga");
   P ("label.names.nearest_color_name.red", "piros");
   P ("label.names.nearest_color_name.orange", "narancs");
   P ("label.names.nearest_color_name.white", "fehér");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} alacsony kontraszt");
   P ("label.contrast.readability_label.low_readability", "gyenge olvashatóság");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, elégtelen, sötét szöveg világos háttéren");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast", "{v1}:{v2, number} alacsony kontraszt");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, elégtelen, sötét szöveg világos háttéren");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "akromatópsia: közepes összetévesztési kockázat");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% erős különbség");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} alacsony kontraszt alfakeverés után");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, elégtelen, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, elégtelen, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "deuteranópia: magas összetévesztési kockázat");
   P ("label.contrast.contrast_label.d_n_large_text_contrast", "{v1}:{v2, number} nagyszöveg-kontraszt");
   P ("label.contrast.readability_label.readable_for_large_text_only", "csak nagy szövegnél olvasható");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, nagy szöveg, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} nagyszöveg-kontraszt");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, nagy szöveg, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "tritanópia: magas összetévesztési kockázat");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} nagyszöveg-kontraszt alfakeverés után");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, csak nem szöveges elemekhez, világos szöveg "
      & "sötét háttéren");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, csak nem szöveges elemekhez, világos szöveg "
      & "sötét háttéren");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "tritanópia: közepes összetévesztési kockázat");
   P ("label.contrast.contrast_label.n_n_low_contrast", "{v1, number}:{v2, number} alacsony kontraszt");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast", "{v1, number}:{v2, number} alacsony kontraszt");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, csak nem szöveges elemekhez, sötét szöveg "
      & "világos háttéren");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, csak nem szöveges elemekhez, sötét szöveg "
      & "világos háttéren");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "deuteranópia: közepes összetévesztési kockázat");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "protanópia: magas összetévesztési kockázat");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% nagyon eltérő");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "akromatópsia: magas összetévesztési kockázat");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "akromatópsia: alacsony összetévesztési kockázat");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} alacsony kontraszt alfakeverés után");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast", "{v1}:{v2, number} normálszöveg-kontraszt");
   P ("label.contrast.readability_label.readable_for_normal_text", "normál szövegnél olvasható");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, törzsszöveg, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} normálszöveg-kontraszt");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, törzsszöveg, világos szöveg sötét háttéren");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, nagy szöveg, sötét szöveg világos háttéren");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, nagy szöveg, sötét szöveg világos háttéren");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% finom különbség");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, törzsszöveg, sötét szöveg világos háttéren");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, törzsszöveg, sötét szöveg világos háttéren");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "tritanópia: alacsony összetévesztési kockázat");
   P ("label.models.color_difference_label.n_noticeable_difference", "{v1, number}% észrevehető különbség");
   P ("label.contrast.contrast_label.n_n_large_text_contrast", "{v1, number}:{v2, number} nagyszöveg-kontraszt");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} nagyszöveg-kontraszt");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "deuteranópia: alacsony összetévesztési kockázat");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast", "{v1}:{v2, number} fokozott kontraszt");
   P ("label.contrast.readability_label.readable_for_enhanced_text", "fokozott szövegnél olvasható");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast", "{v1}:{v2, number} fokozott kontraszt");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab delta {v1, number}, finom észlelési különbség");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct", "tritanópia: megkülönböztethető");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} normálszöveg-kontraszt alfakeverés után");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "protanópia: közepes összetévesztési kockázat");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} normálszöveg-kontraszt alfakeverés után");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} nagyszöveg-kontraszt alfakeverés után");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, kiváló, sötét szöveg világos háttéren");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, kiváló, sötét szöveg világos háttéren");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast", "{v1, number}:{v2, number} normálszöveg-kontraszt");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} normálszöveg-kontraszt");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast", "{v1, number}:{v2, number} fokozott kontraszt");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, kiváló, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} fokozott kontraszt");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, kiváló, világos szöveg sötét háttéren");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct", "deuteranópia: megkülönböztethető");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} fokozott kontraszt alfakeverés után");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab delta {v1, number}, alig észlelhető");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% szinte azonos");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "protanópia: alacsony összetévesztési kockázat");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct", "akromatópsia: megkülönböztethető");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} szín");
   P ("label.palettes.palette_summary.mostly_gray", "többnyire szürke");
   P ("label.palettes.palette_summary.moderate_contrast_spread", "közepes kontrasztterjedelem");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c", "háttér {v1}, szöveg {v2}, kiemelés {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "triádikus paletta");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "legjobb kontraszt: {v1} ezen: {v2}, {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v1, number}/{v2, number} pár megfelel a normál szöveg "
      & "kontrasztjának");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v1, number} fokozott, {v2, number} normál, {v3, number} csak nagy, "
      & "{v4, number} sikertelen, összesen {v5, number} pár");
   P ("label.palettes.palette_metadata_label.n_colors_n_pairs_n_enhanced_n_normal_n_large_only_n_fail",
      "{v1, number} szín, {v2, number} pár: {v3, number} fokozott, {v4, "
      & "number} normál, {v5, number} csak nagy, {v6, number} sikertelen");
   P ("label.palettes.palette_mood_label.balanced", "kiegyensúlyozott");
   P ("label.palettes.palette_mood_label.vibrant", "élénk");
   P ("label.palettes.palette_mood_label.warm_mood", "meleg hangulat");
   P ("label.palettes.palette_summary.mostly_blue", "többnyire kék");
   P ("label.palettes.palette_summary.low_contrast_spread", "kis kontrasztterjedelem");
   P ("label.palettes.palette_harmony_label.single_accent_palette", "egy kiemelőszínes paletta");
   P ("label.palettes.palette_mood_label.dark", "sötét");
   P ("label.palettes.palette_mood_label.cool_mood", "hűvös hangulat");
   P ("label.palettes.palette_summary.mostly_rebeccapurple", "többnyire rebeccapurple");
   P ("label.palettes.palette_accessibility_label.no_accessible_text_pairs", "nincs akadálymentes szövegpár");
   P ("label.palettes.palette_mood_label.subtle", "visszafogott");
   P ("label.palettes.palette_summary.high_contrast_spread", "nagy kontrasztterjedelem");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_n_n",
      "legjobb kontraszt: {v1} ezen: {v2}, {v3, number}:{v4, number}");
   P ("label.palettes.palette_mood_label.neutral_mood", "semleges hangulat");
   P ("label.palettes.palette_summary.mostly_purple", "többnyire lila");
   P ("label.palettes.palette_harmony_label.complementary_palette", "komplementer paletta");
   P ("label.palettes.palette_summary.mostly_green", "többnyire zöld");
   P ("label.palettes.palette_mood_label.moderate", "mérsékelt");
   P ("label.palettes.palette_summary.mostly_silver", "többnyire ezüst");
   P ("label.palettes.palette_harmony_label.varied_palette", "változatos paletta");
   P ("label.palettes.palette_summary.mostly_olive", "többnyire olajzöld");
   P ("label.palettes.palette_harmony_label.analogous_palette", "analóg paletta");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_large_text_only",
      "{v1, number}/{v2, number} pár csak nagy szövegnél felel meg");
   P ("label.palettes.palette_mood_label.light", "világos");
   P ("label.palettes.palette_summary.mostly_teal", "többnyire kékeszöld");
   P ("label.palettes.palette_summary.mostly_aqua", "többnyire vízkék");
   P ("label.palettes.palette_summary.mostly_lime", "többnyire limezöld");
   P ("label.palettes.palette_harmony_label.monochrome_palette", "monokróm paletta");
   P ("label.palettes.palette_summary.mostly_black", "többnyire fekete");
   P ("label.palettes.palette_summary.mostly_yellow", "többnyire sárga");
   P ("label.palettes.palette_summary.mostly_maroon", "többnyire gesztenyebarna");
   P ("label.palettes.palette_summary.mostly_white", "többnyire fehér");
   P ("label.palettes.palette_summary.mostly_orange", "többnyire narancs");
   P ("label.palettes.palette_summary.mostly_fuchsia", "többnyire fukszia");
   P ("label.palettes.palette_harmony_label.neutral_palette", "semleges paletta");
   P ("label.palettes.palette_summary.mostly_red", "többnyire piros");
   P ("label.metrics.word_count_summary.n_words", "{v1, number} szó");
   P ("label.metrics.sentence_count_summary.n_sentences", "{v1, number} mondat");
   P ("label.metrics.paragraph_count_summary.n_paragraphs", "{v1, number} bekezdés");
   P ("label.metrics.reading_time.n_minutes_read", "{v1, number} perc olvasás");
   P ("label.metrics.speaking_time.n_minutes_spoken", "{v1, number} perc beszéd");
   P ("label.metrics.text_summary_with_options.n_words", "{v1, number} szó");
   P ("label.metrics.text_summary_with_options.n_sentences", "{v1, number} mondat");
   P ("label.metrics.text_summary_with_options.n_paragraphs", "{v1, number} bekezdés");
   P ("label.metrics.text_summary_with_options.n_minutes_read", "{v1, number} perc olvasás");
   P ("label.metrics.paragraph_count_summary.n_paragraph", "{v1, number} bekezdés");
   P ("label.metrics.reading_time.less_than_n_minute_read", "kevesebb mint {v1, number} perc olvasás");
   P ("label.metrics.speaking_time.less_than_n_minute_spoken", "kevesebb mint {v1, number} perc beszéd");
   P ("label.metrics.text_summary_with_options.n_paragraph", "{v1, number} bekezdés");
   P ("label.metrics.text_summary_with_options.less_than_n_minute_read", "kevesebb mint {v1, number} perc olvasás");
   P ("label.metrics.sentence_count_summary.n_sentence", "{v1, number} mondat");
   P ("label.metrics.text_summary_with_options.n_sentence", "{v1, number} mondat");
   P ("label.metrics.word_count_summary.no_words", "nincsenek szavak");
   P ("label.metrics.sentence_count_summary.no_sentences", "nincsenek mondatok");
   P ("label.metrics.paragraph_count_summary.no_paragraphs", "nincsenek bekezdések");
   P ("label.metrics.text_summary_with_options.no_words", "nincsenek szavak");
   P ("label.metrics.text_summary_with_options.no_sentences", "nincsenek mondatok");
   P ("label.metrics.text_summary_with_options.no_paragraphs", "nincsenek bekezdések");
   P ("label.metrics.word_count_summary.n_word", "{v1, number} szó");
   P ("label.metrics.text_summary_with_options.n_word", "{v1, number} szó");
end Labels_3;
