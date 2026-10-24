separate (Humanize.Catalogs.Phrase_Data.Locale_Hi)
procedure Labels_5 is
begin
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
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_5;
