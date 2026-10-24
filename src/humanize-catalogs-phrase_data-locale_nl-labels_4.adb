separate (Humanize.Catalogs.Phrase_Data.Locale_Nl)
procedure Labels_4 is
begin
   P ("label.names.agree.grayish",
      "{gender, select, neuter {grijzig} masculine {grijzige} feminine "
      & "{grijzige} other {grijzig}}");
   P ("label.names.agree.soft",
      "{gender, select, neuter {zacht} masculine {zachte} feminine {zachte} "
      & "other {zacht}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, neuter {matig chromatisch} masculine {matig "
      & "chromatische} feminine {matig chromatische} other {matig chromatisch}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, neuter {sterk chromatisch} masculine {sterk "
      & "chromatische} feminine {sterk chromatische} other {sterk chromatisch}}");
   P ("label.names.agree.pastel", "{gender, select, other {pastel}}");
   P ("label.names.agree.warm",
      "{gender, select, neuter {warm} masculine {warme} feminine {warme} "
      & "other {warm}}");
   P ("label.names.agree.cool",
      "{gender, select, neuter {koel} masculine {koele} feminine {koele} "
      & "other {koel}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, neuter {temperatuurneutraal} masculine "
      & "{temperatuurneutrale} feminine {temperatuurneutrale} other "
      & "{temperatuurneutraal}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, neuter {temperatuurgebalanceerd} masculine "
      & "{temperatuurgebalanceerde} feminine {temperatuurgebalanceerde} other "
      & "{temperatuurgebalanceerd}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {{hue}} other "
      & "{{hue}}}");
end Labels_4;
