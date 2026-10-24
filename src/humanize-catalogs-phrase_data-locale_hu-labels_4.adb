separate (Humanize.Catalogs.Phrase_Data.Locale_Hu)
procedure Labels_4 is
begin
   P ("label.names.agree.neutral", "{gender, select, other {semleges}}");
   P ("label.names.agree.saturated", "{gender, select, other {telített}}");
   P ("label.names.agree.vivid", "{gender, select, other {élénk}}");
   P ("label.names.agree.grayish", "{gender, select, other {szürkés}}");
   P ("label.names.agree.soft", "{gender, select, other {lágy}}");
   P ("label.names.agree.moderate_chroma", "{gender, select, other {közepes krómájú}}");
   P ("label.names.agree.high_chroma", "{gender, select, other {magas krómájú}}");
   P ("label.names.agree.pastel", "{gender, select, other {pasztell}}");
   P ("label.names.agree.warm", "{gender, select, other {meleg}}");
   P ("label.names.agree.cool", "{gender, select, other {hideg}}");
   P ("label.names.agree.neutral_temperature", "{gender, select, other {semleges hőmérsékletű}}");
   P ("label.names.agree.balanced_temperature", "{gender, select, other {kiegyensúlyozott hőmérsékletű}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
