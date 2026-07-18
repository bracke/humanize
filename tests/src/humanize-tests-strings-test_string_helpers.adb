separate (Humanize.Tests.Strings)
   procedure Test_String_Helpers (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      LF : constant String := [1 => ASCII.LF];
      CR : constant String := [1 => ASCII.CR];
      AE : constant String := Character'Val (16#C3#) & Character'Val (16#A6#);
      Greek_Athens : constant String :=
        Character'Val (16#CE#) & Character'Val (16#91#)
        & Character'Val (16#CE#) & Character'Val (16#B8#)
        & Character'Val (16#CE#) & Character'Val (16#AE#)
        & Character'Val (16#CE#) & Character'Val (16#BD#)
        & Character'Val (16#CE#) & Character'Val (16#B1#);
      Cyrillic_Moscow : constant String :=
        Character'Val (16#D0#) & Character'Val (16#9C#)
        & Character'Val (16#D0#) & Character'Val (16#BE#)
        & Character'Val (16#D1#) & Character'Val (16#81#)
        & Character'Val (16#D0#) & Character'Val (16#BA#)
        & Character'Val (16#D0#) & Character'Val (16#B2#)
        & Character'Val (16#D0#) & Character'Val (16#B0#);
      Hebrew_Abgd : constant String :=
        Character'Val (16#D7#) & Character'Val (16#90#)
        & Character'Val (16#D7#) & Character'Val (16#91#)
        & Character'Val (16#D7#) & Character'Val (16#92#)
        & Character'Val (16#D7#) & Character'Val (16#93#);
      Arabic_Slam : constant String :=
        Character'Val (16#D8#) & Character'Val (16#B3#)
        & Character'Val (16#D9#) & Character'Val (16#84#)
        & Character'Val (16#D8#) & Character'Val (16#A7#)
        & Character'Val (16#D9#) & Character'Val (16#85#);
      Armenian_Hay : constant String :=
        Character'Val (16#D5#) & Character'Val (16#B0#)
        & Character'Val (16#D5#) & Character'Val (16#A1#)
        & Character'Val (16#D5#) & Character'Val (16#B5#);
      Georgian_Abg : constant String :=
        Character'Val (16#E1#) & Character'Val (16#83#)
        & Character'Val (16#90#)
        & Character'Val (16#E1#) & Character'Val (16#83#)
        & Character'Val (16#91#)
        & Character'Val (16#E1#) & Character'Val (16#83#)
        & Character'Val (16#92#);
      E_Acute : constant String :=
        Character'Val (16#C3#) & Character'Val (16#A9#);
      Combining_Acute : constant String :=
        Character'Val (16#CC#) & Character'Val (16#81#);
      Devanagari_Ka : constant String :=
        Character'Val (16#E0#) & Character'Val (16#A4#)
        & Character'Val (16#95#);
      Devanagari_Vowel_I : constant String :=
        Character'Val (16#E0#) & Character'Val (16#A4#)
        & Character'Val (16#BF#);
      Arabic_Number_Sign : constant String :=
        Character'Val (16#D8#) & Character'Val (16#80#);
      Zero_Width_Space : constant String :=
        Character'Val (16#E2#) & Character'Val (16#80#)
        & Character'Val (16#8B#);
      Invalid_UTF8_Surrogate : constant String :=
        Character'Val (16#ED#) & Character'Val (16#A0#)
        & Character'Val (16#80#);
      World : constant String :=
        Character'Val (16#E4#) & Character'Val (16#B8#)
        & Character'Val (16#96#) & Character'Val (16#E7#)
        & Character'Val (16#95#) & Character'Val (16#8C#);
      Kana_Supplement : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9B#)
        & Character'Val (16#80#) & Character'Val (16#80#);
      Ideographic_Stop : constant String :=
        Character'Val (16#E3#) & Character'Val (16#80#)
        & Character'Val (16#82#);
      Arabic_Question : constant String :=
        Character'Val (16#D8#) & Character'Val (16#9F#);
      Woman_Emoji : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#91#) & Character'Val (16#A9#);
      Girl_Emoji : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#91#) & Character'Val (16#A7#);
      ZWJ : constant String :=
        Character'Val (16#E2#) & Character'Val (16#80#)
        & Character'Val (16#8D#);
      Family_Emoji : constant String := Woman_Emoji & ZWJ & Girl_Emoji;
      Thumbs_Up : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#91#) & Character'Val (16#8D#);
      Medium_Skin_Tone : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#8F#) & Character'Val (16#BD#);
      Flag_DK : constant String :=
        Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#87#) & Character'Val (16#A9#)
        & Character'Val (16#F0#) & Character'Val (16#9F#)
        & Character'Val (16#87#) & Character'Val (16#B0#);
      Variation_16 : constant String :=
        Character'Val (16#EF#) & Character'Val (16#B8#)
        & Character'Val (16#8F#);
      Variation_15 : constant String :=
        Character'Val (16#EF#) & Character'Val (16#B8#)
        & Character'Val (16#8E#);
      Heavy_Black_Heart : constant String :=
        Character'Val (16#E2#) & Character'Val (16#9D#)
        & Character'Val (16#A4#);
      Keycap_Mark : constant String :=
        Character'Val (16#E2#) & Character'Val (16#83#)
        & Character'Val (16#A3#);
      Keycap_One : constant String := "1" & Variation_16 & Keycap_Mark;
      Hangul_Jamo : constant String :=
        Character'Val (16#E1#) & Character'Val (16#84#)
        & Character'Val (16#80#) & Character'Val (16#E1#)
        & Character'Val (16#85#) & Character'Val (16#A1#)
        & Character'Val (16#E1#) & Character'Val (16#86#)
        & Character'Val (16#A8#);
      UTF8_Text : constant String := "h" & AE & "llo";
      L_Stroke : constant String :=
        Character'Val (16#C5#) & Character'Val (16#81#);
      O_Acute : constant String :=
        Character'Val (16#C3#) & Character'Val (16#B3#);
      Z_Acute : constant String :=
        Character'Val (16#C5#) & Character'Val (16#BA#);
      C_Caron : constant String :=
        Character'Val (16#C4#) & Character'Val (16#8C#);
      Red_Start : constant String := ASCII.ESC & "[31m";
      Reset : constant String := ASCII.ESC & "[0m";
      Grapheme_Text : constant String :=
        "e" & Combining_Acute & " "
        & Thumbs_Up & Medium_Skin_Tone & Family_Emoji & Flag_DK & Keycap_One;
      Unicode_Metric_Text : constant String :=
        "H" & E_Acute & "llo " & World & Ideographic_Stop;
      Decomposed_Text : constant String :=
        "cafe" & Combining_Acute & " au lait.";
      Unicode_Metrics : constant Humanize.Strings.Text_Metrics_Result :=
        Humanize.Strings.Text_Metrics (Unicode_Metric_Text);
      Metrics_Text : constant String :=
        "Alpha beta gamma delta epsilon zeta eta. Second sentence!" & LF & LF
        & "Third paragraph line";
      Buffer : String (1 .. 96);
      Written : Natural;
      Code : Status_Code;
      Parsed_Mode : Humanize.Strings.File_Mode_Value;
      Parsed_Kind : Humanize.Strings.File_Mode_Kind;
      Parse_Status : Status_Code;
      procedure Check_Text_And_Path_Labels is separate;
      procedure Check_File_Name_And_Inflection_Labels is separate;
      procedure Check_Bounded_Unicode_And_Display_Labels is separate;
      procedure Check_Terminal_Prose_And_Metadata_Labels is separate;
   begin
      Check_Text_And_Path_Labels;
      Check_File_Name_And_Inflection_Labels;
      Check_Bounded_Unicode_And_Display_Labels;
      Check_Terminal_Prose_And_Metadata_Labels;
   end Test_String_Helpers;
