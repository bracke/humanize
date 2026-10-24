separate (Humanize.Catalogs.Phrase_Data.Locale_De)
procedure Labels_4 is
begin
   P ("label.names.agree.very_light",
      "{gender, select, neuter {sehr helles} masculine {sehr heller} feminine "
      & "{sehr helle} other {sehr hell}}");
   P ("label.names.agree.desaturated",
      "{gender, select, neuter {entsättigtes} masculine {entsättigter} "
      & "feminine {entsättigte} other {entsättigt}}");
   P ("label.names.agree.muted",
      "{gender, select, neuter {gedämpftes} masculine {gedämpfter} feminine "
      & "{gedämpfte} other {gedämpft}}");
   P ("label.names.agree.neutral",
      "{gender, select, neuter {neutrales} masculine {neutraler} feminine "
      & "{neutrale} other {neutral}}");
   P ("label.names.agree.saturated",
      "{gender, select, neuter {gesättigtes} masculine {gesättigter} "
      & "feminine {gesättigte} other {gesättigt}}");
   P ("label.names.agree.vivid",
      "{gender, select, neuter {lebhaftes} masculine {lebhafter} feminine "
      & "{lebhafte} other {lebhaft}}");
   P ("label.names.agree.grayish",
      "{gender, select, neuter {gräuliches} masculine {gräulicher} feminine "
      & "{gräuliche} other {gräulich}}");
   P ("label.names.agree.soft",
      "{gender, select, neuter {sanftes} masculine {sanfter} feminine "
      & "{sanfte} other {sanft}}");
   P ("label.names.agree.moderate_chroma",
      "{gender, select, neuter {mittelchromatisches} masculine "
      & "{mittelchromatischer} feminine {mittelchromatische} other "
      & "{mittelchromatisch}}");
   P ("label.names.agree.high_chroma",
      "{gender, select, neuter {hochchromatisches} masculine "
      & "{hochchromatischer} feminine {hochchromatische} other "
      & "{hochchromatisch}}");
   P ("label.names.agree.pastel",
      "{gender, select, neuter {pastellfarbenes} masculine {pastellfarbener} "
      & "feminine {pastellfarbene} other {pastellfarben}}");
   P ("label.names.agree.warm",
      "{gender, select, neuter {warmes} masculine {warmer} feminine {warme} "
      & "other {warm}}");
   P ("label.names.agree.cool",
      "{gender, select, neuter {kühles} masculine {kühler} feminine "
      & "{kühle} other {kühl}}");
   P ("label.names.agree.neutral_temperature",
      "{gender, select, neuter {temperaturneutrales} masculine "
      & "{temperaturneutraler} feminine {temperaturneutrale} other "
      & "{temperaturneutral}}");
   P ("label.names.agree.balanced_temperature",
      "{gender, select, neuter {temperaturausgewogenes} masculine "
      & "{temperaturausgewogener} feminine {temperaturausgewogene} other "
      & "{temperaturausgewogen}}");
   P ("label.names.color_description", "{brightness}, {saturation} {hue}, {temperature}, {chroma}");
   P ("label.names.descriptive_color_name",
      "{brightness} {chroma} {temperature} {base, select, pink {Rosa} other "
      & "{{hue}}}");
end Labels_4;
