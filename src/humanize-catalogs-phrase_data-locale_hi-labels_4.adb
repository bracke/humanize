separate (Humanize.Catalogs.Phrase_Data.Locale_Hi)
procedure Labels_4 is
begin
   P ("label.tables.row_range_label",
      "{state, select, none {कोई पंक्ति नहीं} "
      & "single {पंक्ति {first_row, number}/{total, number}} other "
      & "{पंक्तियाँ {first_row, number}-{last_row, "
      & "number}/{total, number}}}");
   P ("label.forms.remaining_characters_label",
      "{state, select, unlimited {कोई वर्ण सीमा "
      & "नहीं} none_left {कोई वर्ण शेष "
      & "नहीं} left {{count, plural, one {{count, number} वर्ण} "
      & "other {{count, number} वर्ण}} शेष} other {सीमा "
      & "से {count, plural, one {{count, number} वर्ण} other "
      & "{{count, number} वर्ण}} अधिक}}");
   P ("label.forms.required_fields_label",
      "{total, plural, =0 {कोई आवश्यक फ़ील्ड "
      & "नहीं} one {{missing, plural, =0 {सभी आवश्यक "
      & "फ़ील्ड पूर्ण} other {1 में से 1 "
      & "आवश्यक फ़ील्ड अनुपस्थित}}} "
      & "other {{missing, plural, =0 {सभी आवश्यक "
      & "फ़ील्ड पूर्ण} other {{total, number} में "
      & "से {missing, number} आवश्यक फ़ील्ड "
      & "अनुपस्थित}}}}");
   P ("label.forms.form_progress_label",
      "{state, select, none {कोई फ़ील्ड नहीं} all "
      & "{सभी फ़ील्ड पूर्ण} other {{total, number} "
      & "में से {completed, number} फ़ील्ड "
      & "पूर्ण}}");
   P ("label.forms.section_progress_label",
      "{state, select, none {{name}: कोई फ़ील्ड "
      & "नहीं} all {{name}: सभी फ़ील्ड "
      & "पूर्ण} other {{name}: {total, number} में से "
      & "{completed, number} फ़ील्ड पूर्ण}}");
   P ("label.forms.form_step_label",
      "{total, plural, =0 {कोई फ़ॉर्म चरण "
      & "नहीं} one {चरण 1/1: {name}} other {चरण {current, "
      & "number}/{total, number}: {name}}}");
   P ("label.navigation.breadcrumb_position_label",
      "{total, plural, =0 {कोई ब्रेडक्रंब "
      & "नहीं} one {ब्रेडक्रंब 1/1: {name}} other "
      & "{ब्रेडक्रंब {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.navigation.tab_label",
      "{total, plural, =0 {कोई टैब नहीं} one {टैब "
      & "1/1: {name}} other {टैब {current, number}/{total, number}: "
      & "{name}}}");
   P ("label.notifications.inbox_label",
      "{total, plural, =0 {इनबॉक्स खाली} one {{unread, "
      & "plural, =0 {सभी सूचनाएँ पढ़ी गईं} "
      & "other {1 में से 1 सूचना अपठित}}} other "
      & "{{unread, plural, =0 {सभी सूचनाएँ पढ़ी "
      & "गईं} other {{total, number} में से {unread, number} "
      & "सूचनाएँ अपठित}}}}");
   P ("label.notifications.delivery_attempt_label",
      "डिलीवरी प्रयास {attempt, "
      & "number}/{max_attempts, number}");
   P ("label.tasks.checklist_label",
      "{total, plural, =0 {कोई चेकलिस्ट आइटम "
      & "नहीं} one {{done, plural, =0 {1 में से 0 "
      & "आइटम पूर्ण} other {1 में से 1 आइटम "
      & "पूर्ण}}} other {{total, number} में से {done, "
      & "number} आइटम पूर्ण}}");
   P ("label.attachments.upload_progress_label",
      "{total, plural, =0 {कोई अपलोड नहीं} one "
      & "{{done, plural, =0 {1 में से 0 अपलोड "
      & "पूर्ण} other {1 में से 1 अपलोड "
      & "पूर्ण}}} other {{total, number} में से {done, "
      & "number} अपलोड पूर्ण}}");
   P ("label.events.capacity_label",
      "{capacity, plural, =0 {कोई क्षमता नहीं} one "
      & "{{reserved, plural, =0 {1 में से 0 सीट "
      & "आरक्षित} other {1 में से 1 सीट "
      & "आरक्षित}}} other {{capacity, number} में से "
      & "{reserved, number} सीटें आरक्षित}}");
   P ("label.events.waitlist_label",
      "{total, plural, =0 {प्रतीक्षा सूची में "
      & "स्थान {position, number}} other {प्रतीक्षा "
      & "सूची में स्थान {position, number}/{total, "
      & "number}}}");
   P ("label.comparisons.multi_value_summary",
      "{mode, select, comparison_compact {{name} {changed, number}/{total, "
      & "number} बदले} other {{name}: {changed, number} बदले, "
      & "{unchanged, number} अपरिवर्तित, कुल {total, "
      & "number}}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
   P ("label.palettes.advanced_palette_summary", "{harmony}, {mood}, {accessibility}; {roles}");
   P ("label.markup.accessible_control_label.control",
      "{named, select, no {बेनाम} other {{name}}} {role, select, "
      & "button_control {बटन} link_control {लिंक} tab_control "
      & "{टैब} menu_item_control {मेनू आइटम} "
      & "checkbox_control {चेकबॉक्स} radio_control "
      & "{रेडियो बटन} text_field_control "
      & "{टेक्स्ट फ़ील्ड} progress_control "
      & "{प्रगति} table_cell_control {तालिका सेल} "
      & "region_control {क्षेत्र} other "
      & "{नियंत्रण}}");
   P ("label.markup.accessible_control_label.selected", "चयनित");
   P ("label.markup.accessible_control_label.expanded", "विस्तारित");
   P ("label.markup.accessible_control_label.current", "वर्तमान");
   P ("label.markup.accessible_control_label.disabled", "अक्षम");
   P ("label.markup.accessible_control_label.required", "आवश्यक");
   P ("label.markup.accessible_control_label.invalid", "अमान्य");
   P ("label.markup.accessible_control_label.count",
      "{count, plural, one {{count, number} आइटम} other {{count, "
      & "number} आइटम}}");
   P ("label.markup.accessible_control_label.position",
      "{total, number} में से आइटम {position, number}");
   P ("label.markup.accessible_control_label.issues",
      "{count, plural, one {{count, number} समस्या} other "
      & "{{count, number} समस्याएँ}}");
   P ("label.markup.accessible_control_label.with_states", "{control} {states}");
   P ("label.endpoints.url_component.scheme", "स्कीम");
   P ("label.endpoints.url_component.host", "होस्ट");
   P ("label.endpoints.url_component.path", "पथ");
   P ("label.endpoints.url_component.query", "क्वेरी");
   P ("label.endpoints.url_component.fragment", "फ़्रैगमेंट");
   P ("label.names.hue_noun.red", "लाल");
   P ("label.names.hue_noun.orange", "नारंगी");
   P ("label.names.hue_noun.yellow", "पीला");
   P ("label.names.hue_noun.green", "हरा");
   P ("label.names.hue_noun.cyan", "सियान");
   P ("label.names.hue_noun.blue", "नीला");
   P ("label.names.hue_noun.purple", "बैंगनी");
   P ("label.names.hue_noun.magenta", "मैजेंटा");
   P ("label.names.hue_noun.neutral", "तटस्थ रंग");
   P ("label.names.hue_noun.pink", "गुलाबी");
   P ("label.names.hue_gender.red", "masculine");
   P ("label.names.hue_gender.orange", "masculine");
   P ("label.names.hue_gender.yellow", "masculine");
   P ("label.names.hue_gender.green", "masculine");
   P ("label.names.hue_gender.cyan", "masculine");
   P ("label.names.hue_gender.blue", "masculine");
   P ("label.names.hue_gender.purple", "masculine");
   P ("label.names.hue_gender.magenta", "masculine");
   P ("label.names.hue_gender.neutral", "masculine");
   P ("label.names.hue_gender.pink", "masculine");
   P ("label.names.agree.very_dark",
      "{gender, select, masculine {बहुत गहरा} feminine "
      & "{बहुत गहरी} other {बहुत गहरा}}");
   P ("label.names.agree.dark",
      "{gender, select, masculine {गहरा} feminine {गहरी} "
      & "other {गहरा}}");
   P ("label.names.agree.medium_brightness",
      "{gender, select, masculine {मध्यम चमक वाला} "
      & "feminine {मध्यम चमक वाली} other "
      & "{मध्यम चमक वाला}}");
   P ("label.names.agree.light",
      "{gender, select, masculine {हल्का} feminine "
      & "{हल्की} other {हल्का}}");
   P ("label.names.agree.very_light",
      "{gender, select, masculine {बहुत हल्का} feminine "
      & "{बहुत हल्की} other {बहुत हल्का}}");
   P ("label.names.agree.desaturated", "{gender, select, other {असंतृप्त}}");
   P ("label.names.agree.muted",
      "{gender, select, masculine {फीका} feminine {फीकी} "
      & "other {फीका}}");
   P ("label.names.agree.neutral", "{gender, select, other {तटस्थ}}");
   P ("label.names.agree.saturated", "{gender, select, other {संतृप्त}}");
   P ("label.names.agree.vivid",
      "{gender, select, masculine {चटकीला} feminine "
      & "{चटकीली} other {चटकीला}}");
   P ("label.names.agree.grayish",
      "{gender, select, masculine {धूसर-सा} feminine "
      & "{धूसर-सी} other {धूसर-सा}}");
   P ("label.names.agree.soft", "{gender, select, other {कोमल}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, masculine {मध्यम क्रोमा "
      & "वाला} feminine {मध्यम क्रोमा "
      & "वाली} other {मध्यम क्रोमा वाला}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, masculine {उच्च क्रोमा "
      & "वाला} feminine {उच्च क्रोमा वाली} "
      & "other {उच्च क्रोमा वाला}}");
   P ("label.names.agree.pastel", "{gender, select, other {पेस्टल}}");
   P ("label.names.agree.warm", "{gender, select, other {गर्म}}");
   P ("label.names.agree.cool",
      "{gender, select, masculine {ठंडा} feminine {ठंडी} "
      & "other {ठंडा}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, masculine {तटस्थ तापमान "
      & "वाला} feminine {तटस्थ तापमान "
      & "वाली} other {तटस्थ तापमान वाला}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, masculine {संतुलित तापमान "
      & "वाला} feminine {संतुलित तापमान "
      & "वाली} other {संतुलित तापमान "
      & "वाला}}");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_d_n",
      "वर्तमान अग्रभूमि {v1}:{v2, number} "
      & "पर बड़े टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_d_n",
      "वर्तमान अग्रभूमि {v1}:{v2, number} "
      & "पर सामान्य टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_enhanced_text_contrast",
      "{v2, number}:{v3, number} उन्नत टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_n_n_large_text_contrast",
      "{v2, number}:{v3, number} बड़े टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_normal_text_contrast",
      "{v2}:{v3, number} सामान्य टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_large_text_contrast",
      "{v2}:{v3, number} बड़े टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.use_c_for_d_n_enhanced_text_contrast",
      "{v2}:{v3, number} उन्नत टेक्स्ट के "
      & "कंट्रास्ट के लिए {v1} का "
      & "उपयोग करें");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_large_text_contrast_at_n_n",
      "वर्तमान अग्रभूमि {v1, number}:{v2, "
      & "number} पर बड़े टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_normal_text_contrast_at_n_n",
      "वर्तमान अग्रभूमि {v1, number}:{v2, "
      & "number} पर सामान्य टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_d_n",
      "वर्तमान अग्रभूमि {v1}:{v2, number} "
      & "पर उन्नत टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.contrast_remediation_label.current_foreground_meets_enhanced_text_contrast_at_n_n",
      "वर्तमान अग्रभूमि {v1, number}:{v2, "
      & "number} पर उन्नत टेक्स्ट के "
      & "कंट्रास्ट को पूरा करती है");
   P ("label.contrast.color_vision_deficiency_label.protanopia_low_confusion_risk_delta_n",
      "प्रोटानोपिया: भ्रम का कम "
      & "जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_moderate_confusion_risk_delta_n",
      "ड्यूटेरानोपिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_moderate_confusion_risk_delta_n",
      "ट्राइटानोपिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_high_confusion_risk_delta_n",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "उच्च जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_dramatic_perceptual_difference",
      "CIE76 डेल्टा {v1}, अत्यधिक दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_d_dramatic_perceptual_difference",
      "CIE94 डेल्टा {v1}, अत्यधिक दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_dramatic_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1}, "
      & "अत्यधिक दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_dramatic_perceptual_difference",
      "CIEDE2000 डेल्टा {v1, number}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_large_perceptual_difference",
      "OKLab डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
   P ("label.contrast.color_vision_deficiency_label.protanopia_moderate_confusion_risk_delta_n",
      "प्रोटानोपिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_n_dramatic_perceptual_difference",
      "CIE94 डेल्टा {v1, number}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_dramatic_perceptual_difference",
      "CIEDE2000 डेल्टा {v1}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_dramatic_perceptual_difference",
      "OKLab डेल्टा {v1}, अत्यधिक दृश्य "
      & "अंतर");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_low_confusion_risk_delta_n",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "कम जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.protanopia_distinct_delta_n",
      "प्रोटानोपिया: स्पष्ट रूप "
      & "से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_distinct_delta_n",
      "ड्यूटेरानोपिया: स्पष्ट "
      & "रूप से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_distinct_delta_n",
      "ट्राइटानोपिया: स्पष्ट रूप "
      & "से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_distinct_delta_n",
      "एक्रोमैटोप्सिया: स्पष्ट "
      & "रूप से अलग, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.achromatopsia_moderate_confusion_risk_delta_n",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "मध्यम जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_d_large_perceptual_difference",
      "CIE76 डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_d_large_perceptual_difference",
      "CIE94 डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_large_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1}, "
      & "बड़ा दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_large_perceptual_difference",
      "CIEDE2000 डेल्टा {v1}, बड़ा दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_noticeable_perceptual_difference",
      "OKLab डेल्टा {v1}, ध्यान देने "
      & "योग्य दृश्य अंतर");
   P ("label.contrast.color_vision_deficiency_label.protanopia_high_confusion_risk_delta_n",
      "प्रोटानोपिया: भ्रम का उच्च "
      & "जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_high_confusion_risk_delta_n",
      "ट्राइटानोपिया: भ्रम का "
      & "उच्च जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie94_delta_d_noticeable_perceptual_difference",
      "CIE94 डेल्टा {v1}, ध्यान देने "
      & "योग्य दृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_noticeable_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1}, "
      & "ध्यान देने योग्य दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_noticeable_perceptual_difference",
      "CIEDE2000 डेल्टा {v1}, ध्यान देने "
      & "योग्य दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_n_noticeable_perceptual_difference",
      "OKLab डेल्टा {v1, number}, ध्यान देने "
      & "योग्य दृश्य अंतर");
   P ("label.contrast.color_vision_deficiency_label.tritanopia_low_confusion_risk_delta_n",
      "ट्राइटानोपिया: भ्रम का कम "
      & "जोखिम, डेल्टा {v1, number}");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_low_confusion_risk_delta_n",
      "ड्यूटेरानोपिया: भ्रम का कम "
      & "जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.oklab_delta_n_large_perceptual_difference",
      "OKLab डेल्टा {v1, number}, बड़ा दृश्य "
      & "अंतर");
   P ("label.contrast.color_vision_deficiency_label.deuteranopia_high_confusion_risk_delta_n",
      "ड्यूटेरानोपिया: भ्रम का "
      & "उच्च जोखिम, डेल्टा {v1, number}");
   P ("label.models.perceptual_difference_label.cie76_delta_n_dramatic_perceptual_difference",
      "CIE76 डेल्टा {v1, number}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_dramatic_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1, number}, "
      & "अत्यधिक दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_n_dramatic_perceptual_difference",
      "OKLab डेल्टा {v1, number}, अत्यधिक "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie76_delta_n_large_perceptual_difference",
      "CIE76 डेल्टा {v1, number}, बड़ा दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_large_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1, number}, "
      & "बड़ा दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_large_perceptual_difference",
      "CIEDE2000 डेल्टा {v1, number}, बड़ा "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie76_delta_d_noticeable_perceptual_difference",
      "CIE76 डेल्टा {v1}, ध्यान देने "
      & "योग्य दृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_subtle_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1}, "
      & "सूक्ष्म दृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_noticeable_perceptual_difference",
      "CIEDE2000 डेल्टा {v1, number}, ध्यान "
      & "देने योग्य दृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_noticeable_perceptual_difference",
      "CIE94 टेक्सटाइल डेल्टा {v1, number}, "
      & "ध्यान देने योग्य दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie76_delta_d_barely_perceptible",
      "CIE76 डेल्टा {v1}, मुश्किल से "
      & "दिखने योग्य");
   P ("label.models.perceptual_difference_label.cie94_delta_d_imperceptible",
      "CIE94 डेल्टा {v1}, अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_d_imperceptible",
      "CIE94 टेक्सटाइल डेल्टा {v1}, "
      & "अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_imperceptible",
      "CIEDE2000 डेल्टा {v1}, अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_imperceptible",
      "OKLab डेल्टा {v1}, अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_n_large_perceptual_difference",
      "CIE94 डेल्टा {v1, number}, बड़ा दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie76_delta_n_imperceptible",
      "CIE76 डेल्टा {v1, number}, अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_n_imperceptible",
      "CIE94 डेल्टा {v1, number}, अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.cie94_textile_delta_n_imperceptible",
      "CIE94 टेक्सटाइल डेल्टा {v1, number}, "
      & "अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_n_imperceptible",
      "CIEDE2000 डेल्टा {v1, number}, अदृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_n_imperceptible",
      "OKLab डेल्टा {v1, number}, अदृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_subtle_perceptual_difference",
      "OKLab डेल्टा {v1}, सूक्ष्म दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.cie94_delta_d_subtle_perceptual_difference",
      "CIE94 डेल्टा {v1}, सूक्ष्म दृश्य "
      & "अंतर");
   P ("label.models.perceptual_difference_label.ciede2000_delta_d_subtle_perceptual_difference",
      "CIEDE2000 डेल्टा {v1}, सूक्ष्म "
      & "दृश्य अंतर");
   P ("label.models.perceptual_difference_label.oklab_delta_d_barely_perceptible",
      "OKLab डेल्टा {v1}, मुश्किल से "
      & "दिखने योग्य");
   P ("label.metrics.text_summary.n_words", "{v1, number} शब्द");
   P ("label.metrics.text_summary.n_paragraphs", "{v1, number} अनुच्छेद");
   P ("label.metrics.text_summary.n_minutes_spoken", "{v1, number} मिनट बोलने का समय");
   P ("label.metrics.text_summary.n_sentences", "{v1, number} वाक्य");
   P ("label.metrics.text_summary.n_minutes_read", "{v1, number} मिनट पढ़ने का समय");
   P ("label.metrics.text_summary.n_paragraph", "{v1, number} अनुच्छेद");
   P ("label.metrics.text_summary.less_than_n_minute_spoken",
      "बोलने का समय {v1, number} मिनट से "
      & "कम");
   P ("label.metrics.text_summary.less_than_n_minute_read",
      "पढ़ने का समय {v1, number} मिनट से "
      & "कम");
   P ("label.metrics.text_summary.n_sentence", "{v1, number} वाक्य");
   P ("label.metrics.text_summary.no_words", "कोई शब्द नहीं");
   P ("label.metrics.text_summary.no_paragraphs", "कोई अनुच्छेद नहीं");
   P ("label.metrics.text_summary.no_sentences", "कोई वाक्य नहीं");
   P ("label.metrics.text_summary.n_word", "{v1, number} शब्द");
   P ("label.names.hue_family_label.neutral", "तटस्थ");
   P ("label.names.saturation_label.neutral", "तटस्थ");
   P ("label.names.temperature_label.neutral_temperature", "तटस्थ तापमान");
   P ("label.names.chroma_label.grayish", "धूसर-सा");
   P ("label.names.nearest_color_name.black", "काला");
   P ("label.models.brightness_label.very_dark", "बहुत गहरा");
   P ("label.names.hue_family_label.blue", "नीला");
   P ("label.names.saturation_label.vivid", "चटकीला");
   P ("label.names.temperature_label.cool", "ठंडा");
   P ("label.names.chroma_label.moderate_chroma", "मध्यम क्रोमा");
   P ("label.names.nearest_color_name.navy", "नेवी नीला");
   P ("label.names.chroma_label.high_chroma", "उच्च क्रोमा");
   P ("label.names.nearest_color_name.blue", "नीला");
   P ("label.names.hue_family_label.green", "हरा");
   P ("label.names.temperature_label.balanced_temperature", "संतुलित तापमान");
   P ("label.names.hue_family_label.cyan", "सियान");
   P ("label.names.chroma_label.soft", "कोमल");
   P ("label.models.brightness_label.dark", "गहरा");
   P ("label.names.nearest_color_name.green", "हरा");
   P ("label.names.nearest_color_name.teal", "टील");
   P ("label.models.brightness_label.medium_brightness", "मध्यम चमक");
   P ("label.names.nearest_color_name.aqua", "एक्वा");
   P ("label.names.nearest_color_name.lime", "लाइम हरा");
   P ("label.models.brightness_label.light", "हल्का");
   P ("label.names.hue_family_label.red", "लाल");
   P ("label.names.temperature_label.warm", "गर्म");
   P ("label.names.hue_family_label.magenta", "मैजेंटा");
   P ("label.names.hue_family_label.purple", "बैंगनी");
   P ("label.names.hue_family_label.yellow", "पीला");
   P ("label.names.saturation_label.muted", "फीका");
   P ("label.names.nearest_color_name.rebeccapurple", "rebeccapurple");
   P ("label.names.saturation_label.saturated", "संतृप्त");
   P ("label.names.nearest_color_name.maroon", "मरून");
   P ("label.names.nearest_color_name.purple", "बैंगनी");
   P ("label.names.hue_family_label.orange", "नारंगी");
   P ("label.names.nearest_color_name.olive", "जैतूनी");
   P ("label.names.nearest_color_name.gray", "धूसर");
   P ("label.names.saturation_label.desaturated", "असंतृप्त");
   P ("label.names.nearest_color_name.silver", "चाँदी");
   P ("label.names.chroma_label.pastel", "पेस्टल");
   P ("label.models.brightness_label.very_light", "बहुत हल्का");
   P ("label.names.nearest_color_name.fuchsia", "फ़ुशिया");
   P ("label.names.nearest_color_name.yellow", "पीला");
   P ("label.names.nearest_color_name.red", "लाल");
   P ("label.names.nearest_color_name.orange", "नारंगी");
   P ("label.names.nearest_color_name.white", "सफ़ेद");
   P ("label.contrast.contrast_label.d_n_low_contrast", "{v1}:{v2, number} कम कंट्रास्ट");
   P ("label.contrast.readability_label.low_readability", "कम पठनीयता");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, अपर्याप्त, हल्की "
      & "पृष्ठभूमि पर गहरा टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.d_n_low_contrast",
      "{v1}:{v2, number} कम कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_dark_text_on_light_background",
      "Lc {v1, number}, अपर्याप्त, हल्की "
      & "पृष्ठभूमि पर गहरा टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.achromatopsia_moderate_confusion_risk",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "मध्यम जोखिम");
   P ("label.models.color_difference_label.n_strong_difference", "{v1, number}% प्रबल अंतर");
   P ("label.contrast.alpha_contrast_label.d_n_low_contrast_after_alpha_compositing",
      "{v1}:{v2, number} कम कंट्रास्ट "
      & "(अल्फ़ा कंपोज़िटिंग के "
      & "बाद)");
   P ("label.contrast.apca_contrast_label.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, अपर्याप्त, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_insufficient_light_text_on_dark_background",
      "Lc {v1, number}, अपर्याप्त, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.deuteranopia_high_confusion_risk",
      "ड्यूटेरानोपिया: भ्रम का "
      & "उच्च जोखिम");
   P ("label.contrast.contrast_label.d_n_large_text_contrast",
      "{v1}:{v2, number} बड़े टेक्स्ट का "
      & "कंट्रास्ट");
   P ("label.contrast.readability_label.readable_for_large_text_only",
      "केवल बड़े टेक्स्ट के लिए "
      & "पठनीय");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, बड़ा टेक्स्ट, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.d_n_large_text_contrast",
      "{v1}:{v2, number} बड़े टेक्स्ट का "
      & "कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_light_text_on_dark_background",
      "Lc {v1, number}, बड़ा टेक्स्ट, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.tritanopia_high_confusion_risk",
      "ट्राइटानोपिया: भ्रम का "
      & "उच्च जोखिम");
   P ("label.contrast.alpha_contrast_label.d_n_large_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} बड़े टेक्स्ट का "
      & "कंट्रास्ट (अल्फ़ा "
      & "कंपोज़िटिंग के बाद)");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, केवल गैर-टेक्स्ट, "
      & "गहरी पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_light_text_on_dark_background",
      "Lc {v1, number}, केवल गैर-टेक्स्ट, "
      & "गहरी पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.tritanopia_moderate_confusion_risk",
      "ट्राइटानोपिया: भ्रम का "
      & "मध्यम जोखिम");
   P ("label.contrast.contrast_label.n_n_low_contrast",
      "{v1, number}:{v2, number} कम कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.n_n_low_contrast",
      "{v1, number}:{v2, number} कम कंट्रास्ट");
   P ("label.contrast.apca_contrast_label.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, केवल गैर-टेक्स्ट, "
      & "हल्की पृष्ठभूमि पर गहरा "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_non_text_only_dark_text_on_light_background",
      "Lc {v1, number}, केवल गैर-टेक्स्ट, "
      & "हल्की पृष्ठभूमि पर गहरा "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.deuteranopia_moderate_confusion_risk",
      "ड्यूटेरानोपिया: भ्रम का "
      & "मध्यम जोखिम");
   P ("label.contrast.color_accessibility_summary.protanopia_high_confusion_risk",
      "प्रोटानोपिया: भ्रम का उच्च "
      & "जोखिम");
   P ("label.models.color_difference_label.n_very_different", "{v1, number}% बहुत भिन्न");
   P ("label.contrast.color_accessibility_summary.achromatopsia_high_confusion_risk",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "उच्च जोखिम");
   P ("label.contrast.color_accessibility_summary.achromatopsia_low_confusion_risk",
      "एक्रोमैटोप्सिया: भ्रम का "
      & "कम जोखिम");
   P ("label.contrast.alpha_contrast_label.n_n_low_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} कम कंट्रास्ट "
      & "(अल्फ़ा कंपोज़िटिंग के "
      & "बाद)");
   P ("label.contrast.contrast_label.d_n_normal_text_contrast",
      "{v1}:{v2, number} सामान्य टेक्स्ट का "
      & "कंट्रास्ट");
   P ("label.contrast.readability_label.readable_for_normal_text",
      "सामान्य टेक्स्ट के लिए "
      & "पठनीय");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, मुख्य टेक्स्ट, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.d_n_normal_text_contrast",
      "{v1}:{v2, number} सामान्य टेक्स्ट का "
      & "कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_light_text_on_dark_background",
      "Lc {v1, number}, मुख्य टेक्स्ट, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.apca_contrast_label.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, बड़ा टेक्स्ट, हल्की "
      & "पृष्ठभूमि पर गहरा टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_large_text_dark_text_on_light_background",
      "Lc {v1, number}, बड़ा टेक्स्ट, हल्की "
      & "पृष्ठभूमि पर गहरा टेक्स्ट");
   P ("label.models.color_difference_label.n_subtle_difference", "{v1, number}% सूक्ष्म अंतर");
   P ("label.contrast.apca_contrast_label.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, मुख्य टेक्स्ट, "
      & "हल्की पृष्ठभूमि पर गहरा "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_body_text_dark_text_on_light_background",
      "Lc {v1, number}, मुख्य टेक्स्ट, "
      & "हल्की पृष्ठभूमि पर गहरा "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.tritanopia_low_confusion_risk",
      "ट्राइटानोपिया: भ्रम का कम "
      & "जोखिम");
   P ("label.models.color_difference_label.n_noticeable_difference",
      "{v1, number}% ध्यान देने योग्य "
      & "अंतर");
   P ("label.contrast.contrast_label.n_n_large_text_contrast",
      "{v1, number}:{v2, number} बड़े टेक्स्ट का "
      & "कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.n_n_large_text_contrast",
      "{v1, number}:{v2, number} बड़े टेक्स्ट का "
      & "कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.deuteranopia_low_confusion_risk",
      "ड्यूटेरानोपिया: भ्रम का कम "
      & "जोखिम");
   P ("label.contrast.contrast_label.d_n_enhanced_contrast",
      "{v1}:{v2, number} उन्नत कंट्रास्ट");
   P ("label.contrast.readability_label.readable_for_enhanced_text",
      "उन्नत टेक्स्ट के लिए पठनीय");
   P ("label.contrast.color_accessibility_summary.d_n_enhanced_contrast",
      "{v1}:{v2, number} उन्नत कंट्रास्ट");
   P ("label.models.perceptual_difference_label.oklab_delta_n_subtle_perceptual_difference",
      "OKLab डेल्टा {v1, number}, सूक्ष्म "
      & "दृश्य अंतर");
   P ("label.contrast.color_accessibility_summary.tritanopia_distinct",
      "ट्राइटानोपिया: स्पष्ट रूप "
      & "से अलग");
   P ("label.contrast.alpha_contrast_label.n_n_normal_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} सामान्य टेक्स्ट "
      & "का कंट्रास्ट (अल्फ़ा "
      & "कंपोज़िटिंग के बाद)");
   P ("label.contrast.color_accessibility_summary.protanopia_moderate_confusion_risk",
      "प्रोटानोपिया: भ्रम का "
      & "मध्यम जोखिम");
   P ("label.contrast.alpha_contrast_label.d_n_normal_text_contrast_after_alpha_compositing",
      "{v1}:{v2, number} सामान्य टेक्स्ट का "
      & "कंट्रास्ट (अल्फ़ा "
      & "कंपोज़िटिंग के बाद)");
   P ("label.contrast.alpha_contrast_label.n_n_large_text_contrast_after_alpha_compositing",
      "{v1, number}:{v2, number} बड़े टेक्स्ट का "
      & "कंट्रास्ट (अल्फ़ा "
      & "कंपोज़िटिंग के बाद)");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, उत्कृष्ट, हल्की "
      & "पृष्ठभूमि पर गहरा टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_dark_text_on_light_background",
      "Lc {v1, number}, उत्कृष्ट, हल्की "
      & "पृष्ठभूमि पर गहरा टेक्स्ट");
   P ("label.contrast.contrast_label.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} सामान्य टेक्स्ट "
      & "का कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.n_n_normal_text_contrast",
      "{v1, number}:{v2, number} सामान्य टेक्स्ट "
      & "का कंट्रास्ट");
   P ("label.contrast.contrast_label.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} उन्नत कंट्रास्ट");
   P ("label.contrast.apca_contrast_label.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, उत्कृष्ट, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.n_n_enhanced_contrast",
      "{v1, number}:{v2, number} उन्नत कंट्रास्ट");
   P ("label.contrast.color_accessibility_summary.lc_n_excellent_light_text_on_dark_background",
      "Lc {v1, number}, उत्कृष्ट, गहरी "
      & "पृष्ठभूमि पर हल्का "
      & "टेक्स्ट");
   P ("label.contrast.color_accessibility_summary.deuteranopia_distinct",
      "ड्यूटेरानोपिया: स्पष्ट "
      & "रूप से अलग");
   P ("label.contrast.alpha_contrast_label.d_n_enhanced_contrast_after_alpha_compositing",
      "{v1}:{v2, number} उन्नत कंट्रास्ट "
      & "(अल्फ़ा कंपोज़िटिंग के "
      & "बाद)");
   P ("label.models.perceptual_difference_label.oklab_delta_n_barely_perceptible",
      "OKLab डेल्टा {v1, number}, मुश्किल से "
      & "दिखने योग्य");
   P ("label.models.color_difference_label.n_nearly_identical", "{v1, number}% लगभग समान");
   P ("label.contrast.color_accessibility_summary.protanopia_low_confusion_risk",
      "प्रोटानोपिया: भ्रम का कम "
      & "जोखिम");
   P ("label.contrast.color_accessibility_summary.achromatopsia_distinct",
      "एक्रोमैटोप्सिया: स्पष्ट "
      & "रूप से अलग");
   P ("label.palettes.palette_summary.n_colors", "{v1, number} रंग");
   P ("label.palettes.palette_summary.mostly_gray", "अधिकतर धूसर");
   P ("label.palettes.palette_summary.moderate_contrast_spread",
      "मध्यम कंट्रास्ट फैलाव");
   P ("label.palettes.palette_roles.background_c_text_c_accent_c",
      "पृष्ठभूमि {v1}, टेक्स्ट {v2}, "
      & "एक्सेंट {v3}");
   P ("label.palettes.palette_harmony_label.triadic_palette", "त्रिक पैलेट");
   P ("label.palettes.palette_contrast_suggestion.best_contrast_c_on_c_at_d_n",
      "सर्वोत्तम कंट्रास्ट: {v2} पर "
      & "{v1}, {v3}:{v4, number}");
   P ("label.palettes.palette_accessibility_label.n_of_n_pairs_pass_normal_text_contrast",
      "{v2, number} में से {v1, number} जोड़े "
      & "सामान्य टेक्स्ट "
      & "कंट्रास्ट में सफल");
   P ("label.palettes.palette_contrast_matrix_label.n_enhanced_n_normal_n_large_only_n_fail_out_of_n_pairs",
      "{v5, number} जोड़ों में से {v1, number} "
      & "उन्नत, {v2, number} सामान्य, {v3, number} "
      & "केवल बड़ा, {v4, number} विफल");
end Labels_4;
