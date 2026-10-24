separate (Humanize.Catalogs.Phrase_Data.Locale_Sv)
procedure Labels_4 is
begin
   P ("label.names.hue_gender.purple", "neuter");
   P ("label.names.hue_gender.magenta", "neuter");
   P ("label.names.hue_gender.neutral", "other");
   P ("label.names.hue_gender.pink", "neuter");
   P ("label.names.agree.very_dark", "{gender, select, neuter {mycket mörkt} other {mycket mörk}}");
   P ("label.names.agree.dark", "{gender, select, neuter {mörkt} other {mörk}}");
   P ("label.names.agree.medium_brightness", "{gender, select, neuter {medelljust} other {medelljus}}");
   P ("label.names.agree.light", "{gender, select, neuter {ljust} other {ljus}}");
   P ("label.names.agree.very_light", "{gender, select, neuter {mycket ljust} other {mycket ljus}}");
   P ("label.names.agree.desaturated", "{gender, select, neuter {avmättat} other {avmättad}}");
   P ("label.names.agree.muted", "{gender, select, neuter {dämpat} other {dämpad}}");
   P ("label.names.agree.neutral", "{gender, select, neuter {neutralt} other {neutral}}");
   P ("label.names.agree.saturated", "{gender, select, neuter {mättat} other {mättad}}");
   P ("label.names.agree.vivid", "{gender, select, neuter {livfullt} other {livfull}}");
   P ("label.names.agree.grayish", "{gender, select, neuter {gråaktigt} other {gråaktig}}");
   P ("label.names.agree.soft", "{gender, select, neuter {mjukt} other {mjuk}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, neuter {måttligt kromatiskt} other {måttligt "
      & "kromatisk}}");
   P ("label.names.agree.high_chroma", "{gender, select, neuter {högkromatiskt} other {högkromatisk}}");
   P ("label.names.agree.pastel", "{gender, select, neuter {pastellfärgat} other {pastellfärgad}}");
   P ("label.names.agree.warm", "{gender, select, neuter {varmt} other {varm}}");
   P ("label.names.agree.cool", "{gender, select, neuter {svalt} other {sval}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, neuter {temperaturneutralt} other "
      & "{temperaturneutral}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, neuter {temperaturbalanserat} other "
      & "{temperaturbalanserad}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {rosa} other "
      & "{{hue}}}");
end Labels_4;
