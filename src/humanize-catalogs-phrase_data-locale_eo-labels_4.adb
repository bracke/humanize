separate (Humanize.Catalogs.Phrase_Data.Locale_Eo)
procedure Labels_4 is
begin
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
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
