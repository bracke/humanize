with AUnit.Assertions;

with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Parsing;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Tests.Support;
with Humanize.Units;

package body Humanize.Tests.Parsing is
   use type Humanize.Bytes.Byte_Count;
   use type Humanize.Colors.Color_Vision_Deficiency;
   use type Humanize.Durations.Duration_Microseconds;
   use type Humanize.Durations.Duration_Seconds;
   use type Humanize.Durations.Recurrence_Unit;
   use type Humanize.Frequencies.Occurrence_Count;
   use type Humanize.Numbers.Approximation_Kind;
   use type Humanize.Parsing.Business_Calendar_Parse_Kind;
   use type Humanize.Parsing.Collection_Display_Kind;
   use type Humanize.Parsing.Comparison_Direction;
   use type Humanize.Parsing.Parse_Error_Kind;
   use type Humanize.Parsing.Recurrence_Parse_Kind;
   use type Humanize.Parsing.Selection_Summary_Kind;
   use type Humanize.Parsing.Validation_Severity_Label;
   use type Humanize.Phrases.Phrase_Severity;
   use type Humanize.Phrases.Phrase_Tone;
   use type Humanize.Phrases.Summary_Domain;
   use type Humanize.Phrases.Summary_State;
   use type Humanize.Rates.Rate_Period;
   use type Humanize.Status.Status_Code;
   use type Humanize.Strings.Inflection_Source;
   use type Humanize.Units.Unit_Kind;
   use type Ada.Calendar.Time;

   function B (Hex : String) return String is
      Result : String (1 .. Hex'Length / 2);

      function Nibble (C : Character) return Natural is
      begin
         case C is
            when '0' .. '9' =>
               return Character'Pos (C) - Character'Pos ('0');
            when 'A' .. 'F' =>
               return 10 + Character'Pos (C) - Character'Pos ('A');
            when 'a' .. 'f' =>
               return 10 + Character'Pos (C) - Character'Pos ('a');
            when others =>
               return 0;
         end case;
      end Nibble;
   begin
      for I in Result'Range loop
         Result (I) :=
           Character'Val
             (Nibble (Hex (Hex'First + 2 * (I - Result'First))) * 16
              + Nibble (Hex (Hex'First + 2 * (I - Result'First) + 1)));
      end loop;

      return Result;
   end B;

   procedure Test_Bytes (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      KiB : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("1.5 KiB");
      MB  : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("2 MB");
      Bad : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("wat bytes");
   begin
      AUnit.Assertions.Assert
        (KiB.Status = Humanize.Status.Ok and then KiB.Value = 1536
         and then KiB.Consumed = 7,
         "parse binary byte size");
      AUnit.Assertions.Assert
        (MB.Status = Humanize.Status.Ok and then MB.Value = 2_000_000,
         "parse decimal byte size");
      AUnit.Assertions.Assert
        (Bad.Status = Humanize.Status.Invalid_Argument,
         "invalid byte size");
   end Test_Bytes;

   procedure Test_Durations (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes and 5 seconds");
      Short : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("1.5 hours");
      Long_Units : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 weeks, 1 month and 1 year");
      Lenient : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("in about 1.5hrs");
      Lenient_Almost : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("almost 2 hours");
      Lenient_Just_Over : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("just over 3 weeks");
      Lenient_Little_Under : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("a little under 1 month");
      Lenient_Half : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("about half an hour");
      Scanned_Lenient : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Lenient_Duration ("~2m; cached");
      Precise : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Parse_Precise_Duration
          ("1 second and 500 milliseconds");
      Localized : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 Stunden");
      Cyrillic : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration
          ("2 " & B ("D187D0B0D181D0B0"));
      CJK : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("2 " & B ("E7A792"));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Humanize.Status.Ok and then Result.Value = 9_005,
         "parse multi-unit duration");
      AUnit.Assertions.Assert
        (Short.Status = Humanize.Status.Ok and then Short.Value = 5_400,
         "parse fractional duration");
      AUnit.Assertions.Assert
        (Long_Units.Status = Humanize.Status.Ok
         and then Long_Units.Value =
           Humanize.Durations.Duration_Seconds
             ((14 + 30 + 365) * 86_400),
         "parse week month year durations");
      AUnit.Assertions.Assert
        (Lenient.Status = Humanize.Status.Ok and then Lenient.Value = 5_400,
         "parse lenient duration");
      AUnit.Assertions.Assert
        (Lenient_Almost.Status = Humanize.Status.Ok
         and then Lenient_Almost.Value = 7_200,
         "parse almost duration");
      AUnit.Assertions.Assert
        (Lenient_Just_Over.Status = Humanize.Status.Ok
         and then Lenient_Just_Over.Value = 21 * 86_400,
         "parse just-over duration");
      AUnit.Assertions.Assert
        (Lenient_Little_Under.Status = Humanize.Status.Ok
         and then Lenient_Little_Under.Value = 30 * 86_400,
         "parse little-under duration");
      AUnit.Assertions.Assert
        (Lenient_Half.Status = Humanize.Status.Ok
         and then Lenient_Half.Value = 1_800,
         "parse approximate half-hour duration");
      AUnit.Assertions.Assert
        (Scanned_Lenient.Status = Humanize.Status.Ok
         and then Scanned_Lenient.Value = 120
         and then Scanned_Lenient.Consumed = 3,
         "scan lenient duration");
      AUnit.Assertions.Assert
        (Precise.Status = Humanize.Status.Ok
         and then Precise.Value = 1_500_000,
         "parse precise duration");
      AUnit.Assertions.Assert
        (Localized.Status = Humanize.Status.Ok and then Localized.Value = 7_200,
         "parse localized duration unit alias");
      AUnit.Assertions.Assert
        (Cyrillic.Status = Humanize.Status.Ok and then Cyrillic.Value = 7_200,
         "parse Cyrillic duration unit alias");
      AUnit.Assertions.Assert
        (CJK.Status = Humanize.Status.Ok and then CJK.Value = 2,
         "parse CJK duration unit alias");
   end Test_Durations;

   procedure Test_Compact (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Short : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("1.2K");
      Long  : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("3.4 million");
      Plain : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("1,234");
      Bounded : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Bounded_Number ("1,000+");
      Localized : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("2 Millionen");
      CJK_Compact : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number ("1.2 " & B ("E58D83"));
      Indic_Compact : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Compact_Number
          ("3 " & B ("E0A4B2E0A4BEE0A496"));
      Normal_Number : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Normalize_Number_Text ("1 234,5");
   begin
      AUnit.Assertions.Assert
        (Short.Status = Humanize.Status.Ok and then Short.Value = 1_200,
         "parse short compact number");
      AUnit.Assertions.Assert
        (Long.Status = Humanize.Status.Ok and then Long.Value = 3_400_000,
         "parse long compact number");
      AUnit.Assertions.Assert
        (Plain.Status = Humanize.Status.Ok and then Plain.Value = 1_234,
         "parse grouped plain number");
      AUnit.Assertions.Assert
        (Bounded.Status = Humanize.Status.Ok and then Bounded.Value = 1_000,
         "parse bounded number");
      AUnit.Assertions.Assert
        (Localized.Status = Humanize.Status.Ok
         and then Localized.Value = 2_000_000,
         "parse localized compact number");
      AUnit.Assertions.Assert
        (CJK_Compact.Status = Humanize.Status.Ok
         and then CJK_Compact.Value = 1_200,
         "parse CJK compact number");
      AUnit.Assertions.Assert
        (Indic_Compact.Status = Humanize.Status.Ok
         and then Indic_Compact.Value = 300_000,
         "parse Indic compact number");
      AUnit.Assertions.Assert
        (Normal_Number.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_Number) = "1234.5",
         "normalize number text");
   end Test_Compact;

   procedure Test_Round_Trip_Parsers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5 USD");
      Approx_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Approximate_Currency ("under 12.5 USD");
      Approx_Number : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Approximate_Number ("about 42");
      Change : constant Humanize.Parsing.Change_Parse_Result :=
        Humanize.Parsing.Parse_Change ("down 12.5%");
      Unit_Change : constant Humanize.Parsing.Change_Parse_Result :=
        Humanize.Parsing.Parse_Change ("5 fewer errors since yesterday");
      Number_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Number_Comparison
          ("value is 3 errors higher than baseline");
      Percent_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Percent_Comparison
          ("value is 12.5% lower than baseline");
      File_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Comparison
          ("file is 1 KiB larger than old file");
      Date_Before : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("updated is 3 days before release");
      Date_After : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("published is 1 year, 2 months and 3 days after release");
      Date_Same : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Parse_Date_Comparison
            ("published is the same date as release");
      Scanned_Date : constant
        Humanize.Parsing.Date_Comparison_Parse_Result :=
          Humanize.Parsing.Scan_Date_Comparison
            ("updated is 3 days before release; cached");
      Equal_Comparison : constant Humanize.Parsing.Comparison_Parse_Result :=
        Humanize.Parsing.Parse_Number_Comparison
          ("value is equal to baseline");
      Matrix : constant
        Humanize.Parsing.Palette_Contrast_Matrix_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Contrast_Matrix
            ("1 enhanced, 1 normal, 1 large-only, 0 fail out of 3 pairs");
      APCA : constant Humanize.Parsing.APCA_Label_Parse_Result :=
        Humanize.Parsing.Parse_APCA_Contrast_Label
          ("Lc 100, excellent, dark text on light background");
      CVD : constant
        Humanize.Parsing.Color_Vision_Deficiency_Parse_Result :=
          Humanize.Parsing.Parse_Color_Vision_Deficiency_Label
            ("deuteranopia low confusion risk, delta 33");
      Summary : constant Humanize.Parsing.Color_Accessibility_Parse_Result :=
        Humanize.Parsing.Parse_Color_Accessibility_Summary
          ("21:1 enhanced contrast; Lc 100, excellent, "
           & "dark text on light background; protanopia distinct");
      RGB_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(51, 102, 153)");
      RGBA_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGBA_Label ("rgba(51, 102, 153, 0.5)");
      CSS_Label : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("currentColor");
      Color_Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary
          ("#336699 rgb(51, 102, 153)");
      HSL_Label : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label ("hsl(210, 50%, 40%)");
      HSV_Label : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSV_Label ("hsv(210, 67%, 60%)");
      Color_Bucket : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Bucket_Label ("moderate chroma");
      Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dark, muted blue, cool, moderate chroma");
      Opacity : constant Humanize.Parsing.Color_Difference_Label_Parse_Result :=
        Humanize.Parsing.Parse_Opacity_Label ("50% translucent");
      Palette_Summary : constant
        Humanize.Parsing.Palette_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Summary
            ("3 colors, mostly blue, high contrast spread");
      Palette_Roles : constant Humanize.Parsing.Palette_Roles_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Roles
          ("background #FFFFFF, text #000000, accent #336699");
      Palette_Harmony : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Harmony_Label
            ("complementary palette");
      Palette_Contrast : constant
        Humanize.Parsing.Palette_Contrast_Suggestion_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Contrast_Suggestion
            ("best contrast #000000 on #FFFFFF at 21:1");
      Palette_Accessibility : constant
        Humanize.Parsing.Palette_Accessibility_Label_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Accessibility_Label
            ("1 of 3 pairs pass normal text contrast");
      Palette_Mood : constant Humanize.Parsing.Palette_Mood_Parse_Result :=
        Humanize.Parsing.Parse_Palette_Mood_Label
          ("dark, subtle, cool mood");
      Advanced_Palette : constant Humanize.Parsing.Palette_Mood_Parse_Result :=
        Humanize.Parsing.Parse_Advanced_Palette_Summary
          ("complementary palette, dark, subtle, cool mood, "
           & "1 of 3 pairs pass normal text contrast; background #FFFFFF, "
           & "text #000000, accent #336699");
      Color_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Difference_Label
            ("12% noticeable difference");
      Perceptual_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Perceptual_Difference_Label
            ("OKLab delta 12.5, noticeable perceptual difference");
      Word_Summary : constant
        Humanize.Parsing.Text_Count_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Word_Count_Summary ("3 words");
      Sentence_Summary : constant
        Humanize.Parsing.Text_Count_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Sentence_Count_Summary ("1 sentence");
      Paragraph_Summary : constant
        Humanize.Parsing.Text_Count_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Paragraph_Count_Summary ("no paragraphs");
      Reading : constant Humanize.Parsing.Text_Time_Parse_Result :=
        Humanize.Parsing.Parse_Reading_Time ("less than 1 minute read");
      Speaking : constant Humanize.Parsing.Text_Time_Parse_Result :=
        Humanize.Parsing.Parse_Speaking_Time ("2 minutes spoken");
      Text_Summary : constant Humanize.Parsing.Text_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Text_Summary
          ("3 words, 1 sentence, 1 paragraph, less than 1 minute read");
      Compact_Text_Summary : constant
        Humanize.Parsing.Text_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Text_Summary
            ("3 w, 1 sent, 1 para, 1 min read, 18 ch, 18 col");
      Masked : constant Humanize.Parsing.Mask_Parse_Result :=
        Humanize.Parsing.Parse_Mask ("******7890");
      Grouped : constant Humanize.Parsing.Grouped_Token_Parse_Result :=
        Humanize.Parsing.Parse_Grouped_Token ("ABCD-EF12-3456");
      Masked_Token : constant Humanize.Parsing.Grouped_Token_Parse_Result :=
        Humanize.Parsing.Parse_Masked_Token ("****-****-3456");
      Safe_Path : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Label ("report-final.pdf");
      Path_Base : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Basename ("report-final.pdf");
      Path_Title : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Path_Title ("Report Final");
      Extension_Label : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Extension_Label ("PDF");
      Shortened_Path : constant Humanize.Parsing.Excerpt_Parse_Result :=
        Humanize.Parsing.Parse_Shortened_Path ("src~/humanize.ads");
      Handle : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Handle_Label ("@ada");
      Name_Label : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Name_Label ("Ada Lovelace");
      Clean_Name : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Clean_Name ("Ada Lovelace");
      Display_Name : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Display_Name ("Ada");
      Name_Part : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Name_Part ("Lovelace");
      Initials : constant Humanize.Parsing.Initials_Parse_Result :=
        Humanize.Parsing.Parse_Initials ("AL");
      Person_Initials : constant Humanize.Parsing.Initials_Parse_Result :=
        Humanize.Parsing.Parse_Person_Initials ("AGH");
      Possessive : constant Humanize.Parsing.Possessive_Parse_Result :=
        Humanize.Parsing.Parse_Possessive_Label ("Ada's");
      Possessive_Name : constant Humanize.Parsing.Possessive_Parse_Result :=
        Humanize.Parsing.Parse_Possessive_Name ("Chris'");
      Email_Local : constant Humanize.Parsing.Email_Local_Part_Parse_Result :=
        Humanize.Parsing.Parse_Email_Local_Part ("ada.lovelace");
      Safe_Filename : constant Humanize.Parsing.Filename_Label_Parse_Result :=
        Humanize.Parsing.Parse_Safe_Filename ("report-final.pdf");
      Search_Key : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Search_Key ("ada lovelace 42");
      Natural_Sort_Key : constant
        Humanize.Parsing.Identifier_Label_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Sort_Key
            ("file {00000002:12}");
      Parameterized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Parameterize_Label ("ada-lovelace");
      Dasherized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Dasherize_Label ("ada-lovelace");
      Underscored : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Underscore_Label ("ada_lovelace");
      Camelized : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Camelize_Label ("AdaLovelace");
      Transliteration : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Transliteration_Label ("Aether");
      Casefold : constant Humanize.Parsing.Identifier_Label_Parse_Result :=
        Humanize.Parsing.Parse_Casefold_Label ("ada lovelace");
      Escaped_HTML : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_Escaped_HTML
          ("&lt;Ada&gt; &amp; &#39;Grace&#39;");
      NL_To_BR : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_NL_To_BR ("Ada<br/>Grace");
      BR_To_NL : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_BR_To_NL ("Ada" & ASCII.LF & "Grace");
      Normalized_Whitespace : constant
        Humanize.Parsing.Cleanup_Label_Parse_Result :=
          Humanize.Parsing.Parse_Normalized_Whitespace ("Ada Grace");
      Squished : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_Squished ("Ada Grace");
      Stripped_Tags : constant Humanize.Parsing.Cleanup_Label_Parse_Result :=
        Humanize.Parsing.Parse_Stripped_Tags ("Ada Grace");
      Preserved_Separator : constant
        Humanize.Parsing.Cleanup_Label_Parse_Result :=
          Humanize.Parsing.Parse_Preserved_Separator ("Ada/Grace", '/');
      Pluralized : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Pluralized_Word ("people");
      Singularized : constant Humanize.Parsing.String_Label_Parse_Result :=
        Humanize.Parsing.Parse_Singularized_Word ("person");
      Person_List : constant Humanize.Parsing.Person_List_Parse_Result :=
        Humanize.Parsing.Parse_Person_List ("Ada, Grace and 2 others");
      Excerpt : constant Humanize.Parsing.Excerpt_Parse_Result :=
        Humanize.Parsing.Parse_Excerpt ("...middle text...");
      Highlight : constant Humanize.Parsing.Highlight_Parse_Result :=
        Humanize.Parsing.Parse_Highlight
          ("hello <mark>Ada</mark> and <mark>Ada</mark>");
      Highlighted_Excerpt : constant Humanize.Parsing.Highlight_Parse_Result :=
        Humanize.Parsing.Parse_Highlighted_Excerpt
          ("...hello <mark>Ada</mark>...");
      Inflection : constant Humanize.Parsing.Inflection_Source_Parse_Result :=
        Humanize.Parsing.Parse_Inflection_Source_Label ("irregular");
      Uncountable_Inflection : constant
        Humanize.Parsing.Inflection_Source_Parse_Result :=
          Humanize.Parsing.Parse_Inflection_Source_Label ("uncountable");
      Domain_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Domain_Summary
          ("job running: 3 of 10 tasks complete, 1 failed");
      Empty_Domain : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Domain_Summary
          ("export running: no files");
      Queue_Summary : constant Humanize.Parsing.Queue_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Queue_Summary
          ("queue: 5 jobs queued, 2 running, 1 failed, 4 complete");
      Empty_Queue : constant Humanize.Parsing.Queue_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Queue_Summary ("queue empty");
      Cache_Summary : constant Humanize.Parsing.Cache_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Cache_Summary
          ("cache: 8 hits, 2 misses, 80% hit rate");
      Empty_Cache : constant Humanize.Parsing.Cache_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Cache_Summary ("cache: no requests");
      Phrase_Severity : constant
        Humanize.Parsing.Phrase_Severity_Parse_Result :=
          Humanize.Parsing.Parse_Phrase_Severity_Label ("danger");
      Phrase_Tone : constant Humanize.Parsing.Phrase_Tone_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Tone_Label ("critical");
      Phrase_Domain : constant Humanize.Parsing.Phrase_Domain_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Domain_Label ("sync");
      Phrase_State : constant Humanize.Parsing.Phrase_State_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_State_Label ("running");
      Phrase_Key : constant Humanize.Parsing.Phrase_Key_Parse_Result :=
        Humanize.Parsing.Parse_Phrase_Key ("ci.pipeline_failed");
      Phrase_Packs : constant
        Humanize.Parsing.Phrase_Pack_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Phrase_Pack_Summary
            ("ui file validation empty network auth billing workflow queue "
             & "security deployment health notification form access sync "
             & "transfer search collaboration issue task ci ticket payment "
             & "summaries comparisons");
      Phrase_Locales : constant
        Humanize.Parsing.Phrase_Locales_Parse_Result :=
          Humanize.Parsing.Parse_Supported_Phrase_Locales
            ("en da de fr es it pt nl sv no nb fi pl cs tr ru uk ja ko zh ar hi");
      Sync_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Sync_Summary
          ("sync running: 8 of 10 items complete, 1 failed");
      Import_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Import_Summary
          ("import running: 1 of 1 record complete");
      Export_Summary : constant Humanize.Parsing.Domain_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Export_Summary ("export running: no files");
      Unknown_Total_Summary : constant
        Humanize.Parsing.Domain_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Domain_Summary
            ("job complete: 3 tasks complete");
      File_Size : constant Humanize.Parsing.File_Size_Summary_Parse_Result :=
        Humanize.Parsing.Parse_File_Size_Summary ("3 files, 1.5 KiB");
      Empty_File_Size : constant
        Humanize.Parsing.File_Size_Summary_Parse_Result :=
          Humanize.Parsing.Parse_File_Size_Summary ("no files, 0 bytes");
      Transfer : constant Humanize.Parsing.Transfer_Remaining_Parse_Result :=
        Humanize.Parsing.Parse_Transfer_Remaining
          ("2 MB remaining at 1 kB/s");
      Transfer_Complete : constant
        Humanize.Parsing.Transfer_Remaining_Parse_Result :=
          Humanize.Parsing.Parse_Transfer_Remaining ("transfer complete");
      Transfer_Stalled : constant
        Humanize.Parsing.Transfer_Remaining_Parse_Result :=
          Humanize.Parsing.Parse_Transfer_Remaining
            ("2 MB remaining, stalled");
      Disk : constant Humanize.Parsing.Disk_Usage_Parse_Result :=
        Humanize.Parsing.Parse_Disk_Usage ("1.5 kB of 10 kB used (15%)");
      Validation : constant Humanize.Parsing.Validation_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Validation_Summary
          ("3 errors: email is invalid, password is too short and 1 other");
      Validation_Headline : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("3 errors");
      Validation_Ok : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("no errors");
      Validation_Warning : constant
        Humanize.Parsing.Validation_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Validation_Summary ("2 warnings");
      Field_Problems : constant Humanize.Parsing.Field_Problem_Parse_Result :=
        Humanize.Parsing.Parse_Field_Problem_Summary
          ("email: 2 errors: is invalid and is already used");
      No_Selection : constant Humanize.Parsing.Selection_Summary_Parse_Result :=
        Humanize.Parsing.Parse_Selection_Summary ("no items selected");
      All_Selected : constant
        Humanize.Parsing.Selection_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Selection_Summary ("all 5 items selected");
      Partial_Selection : constant
        Humanize.Parsing.Selection_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Selection_Summary
            ("3 of 5 items selected");
      More : constant Humanize.Parsing.More_Count_Parse_Result :=
        Humanize.Parsing.Parse_More_Count ("3 shown, +4 more");
      Pagination : constant Humanize.Parsing.Pagination_Range_Parse_Result :=
        Humanize.Parsing.Parse_Pagination_Range ("21-40 of 153 results");
      Collection_Summary : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("3 shown, +4 more");
      Collection_Compact_More : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("+4");
      Collection_Compact_Visible : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display ("3");
      Collection_Screen : constant
        Humanize.Parsing.Collection_Display_Parse_Result :=
          Humanize.Parsing.Parse_Collection_Display
            ("3 items shown, 4 items available");
   begin
      AUnit.Assertions.Assert
        (Currency.Status = Humanize.Status.Ok
         and then Currency.Amount = 12.5
         and then Currency.Code (1 .. Currency.Code_Length) = "USD"
         and then not Currency.Approximate,
         "parse deterministic currency output");
      AUnit.Assertions.Assert
        (Approx_Currency.Status = Humanize.Status.Ok
         and then Approx_Currency.Amount = 12.5
         and then Approx_Currency.Code (1 .. Approx_Currency.Code_Length) =
           "usd"
         and then Approx_Currency.Approximate
         and then Approx_Currency.Kind = Humanize.Numbers.Under,
         "parse approximate currency output");
      AUnit.Assertions.Assert
        (Approx_Number.Status = Humanize.Status.Ok
         and then Approx_Number.Value = 42,
         "parse approximate number output");
      AUnit.Assertions.Assert
        (Change.Status = Humanize.Status.Ok
         and then Change.Value = -12.5
         and then Change.Percent
         and then not Change.Points,
         "parse percent change output");
      AUnit.Assertions.Assert
        (Unit_Change.Status = Humanize.Status.Ok
         and then Unit_Change.Value = -5.0
         and then Unit_Change.Unit (1 .. Unit_Change.Unit_Length) = "errors"
         and then Unit_Change.Since (1 .. Unit_Change.Since_Length) =
           "yesterday",
         "parse comparative unit change output");
      AUnit.Assertions.Assert
        (Number_Comparison.Status = Humanize.Status.Ok
         and then Number_Comparison.Direction =
           Humanize.Parsing.Comparison_Higher
         and then Number_Comparison.Difference = 3.0
         and then Number_Comparison.Unit
           (1 .. Number_Comparison.Unit_Length) = "errors"
         and then Number_Comparison.Current_Label
           (1 .. Number_Comparison.Current_Label_Length) = "value"
         and then Number_Comparison.Baseline_Label
           (1 .. Number_Comparison.Baseline_Label_Length) = "baseline",
         "parse number comparison output");
      AUnit.Assertions.Assert
        (Percent_Comparison.Status = Humanize.Status.Ok
         and then Percent_Comparison.Direction =
           Humanize.Parsing.Comparison_Lower
         and then Percent_Comparison.Difference = 12.5
         and then Percent_Comparison.Percent,
         "parse percent comparison output");
      AUnit.Assertions.Assert
        (File_Comparison.Status = Humanize.Status.Ok
         and then File_Comparison.Direction =
           Humanize.Parsing.Comparison_Larger
         and then File_Comparison.Difference = 1024.0
         and then File_Comparison.Byte_Size,
         "parse file-size comparison output");
      AUnit.Assertions.Assert
        (Date_Before.Status = Humanize.Status.Ok
         and then Date_Before.Direction =
           Humanize.Parsing.Comparison_Before
         and then Date_Before.Days = 3
         and then Date_Before.Current_Label
           (1 .. Date_Before.Current_Label_Length) = "updated"
         and then Date_Before.Baseline_Label
           (1 .. Date_Before.Baseline_Label_Length) = "release",
         "parse date before comparison output");
      AUnit.Assertions.Assert
        (Date_After.Status = Humanize.Status.Ok
         and then Date_After.Direction =
           Humanize.Parsing.Comparison_After
         and then Date_After.Years = 1
         and then Date_After.Months = 2
         and then Date_After.Days = 3,
         "parse date after comparison output");
      AUnit.Assertions.Assert
        (Date_Same.Status = Humanize.Status.Ok
         and then Date_Same.Direction =
           Humanize.Parsing.Comparison_Equal
         and then Date_Same.Years = 0
         and then Date_Same.Months = 0
         and then Date_Same.Days = 0,
         "parse same-date comparison output");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Consumed = 32
         and then Scanned_Date.Direction =
           Humanize.Parsing.Comparison_Before,
         "scan date comparison output");
      AUnit.Assertions.Assert
        (Equal_Comparison.Status = Humanize.Status.Ok
         and then Equal_Comparison.Direction =
           Humanize.Parsing.Comparison_Equal
         and then Equal_Comparison.Difference = 0.0,
         "parse equal comparison output");
      AUnit.Assertions.Assert
        (Matrix.Status = Humanize.Status.Ok
         and then Matrix.Enhanced = 1
         and then Matrix.Normal = 1
         and then Matrix.Large_Only = 1
         and then Matrix.Fail = 0
         and then Matrix.Total = 3,
         "parse palette contrast matrix output");
      AUnit.Assertions.Assert
        (APCA.Status = Humanize.Status.Ok
         and then APCA.Score = 100.0
         and then APCA.Strength (1 .. APCA.Strength_Length) = "excellent"
         and then APCA.Polarity (1 .. APCA.Polarity_Length) =
           "dark text on light background",
         "parse APCA contrast label output");
      AUnit.Assertions.Assert
        (CVD.Status = Humanize.Status.Ok
         and then CVD.Deficiency = Humanize.Colors.Deuteranopia
         and then CVD.Risk (1 .. CVD.Risk_Length) =
           "low confusion risk"
         and then CVD.Difference = 33.0
         and then CVD.Has_Delta,
         "parse color vision deficiency label output");
      AUnit.Assertions.Assert
        (Summary.Status = Humanize.Status.Ok
         and then Summary.Contrast_Ratio = 21.0
         and then Summary.Contrast_Level
           (1 .. Summary.Contrast_Level_Length) = "enhanced"
         and then Summary.APCA.Score = 100.0
         and then Summary.CVD.Deficiency = Humanize.Colors.Protanopia
         and then Summary.CVD.Risk (1 .. Summary.CVD.Risk_Length) =
           "distinct"
         and then not Summary.CVD.Has_Delta,
         "parse combined color accessibility summary output");
      AUnit.Assertions.Assert
        (RGB_Label.Status = Humanize.Status.Ok
         and then RGB_Label.Color.Red = 51
         and then RGB_Label.Color.Green = 102
         and then RGB_Label.Color.Blue = 153
         and then not RGB_Label.Has_Opacity,
         "parse RGB label output");
      AUnit.Assertions.Assert
        (RGBA_Label.Status = Humanize.Status.Ok
         and then RGBA_Label.Color.Red = 51
         and then RGBA_Label.Color.Green = 102
         and then RGBA_Label.Color.Blue = 153
         and then RGBA_Label.Has_Opacity
         and then RGBA_Label.Opacity = 0.5,
         "parse RGBA label output");
      AUnit.Assertions.Assert
        (CSS_Label.Status = Humanize.Status.Ok
         and then CSS_Label.Is_Current,
         "parse CSS currentColor label output");
      AUnit.Assertions.Assert
        (Color_Summary.Status = Humanize.Status.Ok
         and then Color_Summary.Color.Red = 51
         and then Color_Summary.Color.Green = 102
         and then Color_Summary.Color.Blue = 153,
         "parse color summary output");
      AUnit.Assertions.Assert
        (HSL_Label.Status = Humanize.Status.Ok
         and then HSL_Label.First = 210.0
         and then HSL_Label.Second = 50.0
         and then HSL_Label.Third = 40.0,
         "parse HSL label output");
      AUnit.Assertions.Assert
        (HSV_Label.Status = Humanize.Status.Ok
         and then HSV_Label.First = 210.0
         and then HSV_Label.Second = 67.0
         and then HSV_Label.Third = 60.0,
         "parse HSV label output");
      AUnit.Assertions.Assert
        (Color_Bucket.Status = Humanize.Status.Ok
         and then Color_Bucket.Label (1 .. Color_Bucket.Label_Length) =
           "moderate chroma",
         "parse color bucket label output");
      AUnit.Assertions.Assert
        (Color_Description.Status = Humanize.Status.Ok
         and then Color_Description.Brightness
           (1 .. Color_Description.Brightness_Length) = "dark"
         and then Color_Description.Saturation
           (1 .. Color_Description.Saturation_Length) = "muted"
         and then Color_Description.Hue
           (1 .. Color_Description.Hue_Length) = "blue"
         and then Color_Description.Temperature
           (1 .. Color_Description.Temperature_Length) = "cool"
         and then Color_Description.Chroma
           (1 .. Color_Description.Chroma_Length) = "moderate chroma",
         "parse color description output");
      AUnit.Assertions.Assert
        (Opacity.Status = Humanize.Status.Ok
         and then Opacity.Value = 50.0
         and then Opacity.Label (1 .. Opacity.Label_Length) =
           "translucent",
         "parse opacity label output");
      AUnit.Assertions.Assert
        (Palette_Summary.Status = Humanize.Status.Ok
         and then Palette_Summary.Count = 3
         and then Palette_Summary.Dominant_Color
           (1 .. Palette_Summary.Dominant_Color_Length) = "blue"
         and then Palette_Summary.Spread
           (1 .. Palette_Summary.Spread_Length) = "high contrast spread",
         "parse palette summary output");
      AUnit.Assertions.Assert
        (Palette_Roles.Status = Humanize.Status.Ok
         and then Palette_Roles.Background.Red = 255
         and then Palette_Roles.Background.Green = 255
         and then Palette_Roles.Background.Blue = 255
         and then Palette_Roles.Text_Color.Red = 0
         and then Palette_Roles.Accent.Red = 51
         and then Palette_Roles.Accent.Green = 102
         and then Palette_Roles.Accent.Blue = 153,
         "parse palette roles output");
      AUnit.Assertions.Assert
        (Palette_Harmony.Status = Humanize.Status.Ok
         and then Palette_Harmony.Label
           (1 .. Palette_Harmony.Label_Length) = "complementary palette",
         "parse palette harmony output");
      AUnit.Assertions.Assert
        (Palette_Contrast.Status = Humanize.Status.Ok
         and then Palette_Contrast.Foreground.Red = 0
         and then Palette_Contrast.Background.Red = 255
         and then Palette_Contrast.Ratio = 21.0,
         "parse palette contrast suggestion output");
      AUnit.Assertions.Assert
        (Palette_Accessibility.Status = Humanize.Status.Ok
         and then Palette_Accessibility.Passing = 1
         and then Palette_Accessibility.Total = 3
         and then Palette_Accessibility.Normal_Text
         and then Palette_Accessibility.Has_Accessible_Pairs,
         "parse palette accessibility output");
      AUnit.Assertions.Assert
        (Palette_Mood.Status = Humanize.Status.Ok
         and then Palette_Mood.Tone (1 .. Palette_Mood.Tone_Length) = "dark"
         and then Palette_Mood.Energy
           (1 .. Palette_Mood.Energy_Length) = "subtle"
         and then Palette_Mood.Temperature
           (1 .. Palette_Mood.Temperature_Length) = "cool",
         "parse palette mood output");
      AUnit.Assertions.Assert
        (Advanced_Palette.Status = Humanize.Status.Ok
         and then Advanced_Palette.Tone
           (1 .. Advanced_Palette.Tone_Length) = "dark"
         and then Advanced_Palette.Energy
           (1 .. Advanced_Palette.Energy_Length) = "subtle"
         and then Advanced_Palette.Temperature
           (1 .. Advanced_Palette.Temperature_Length) = "cool",
         "parse advanced palette summary output");
      AUnit.Assertions.Assert
        (Color_Difference.Status = Humanize.Status.Ok
         and then Color_Difference.Value = 12.0
         and then Color_Difference.Label
           (1 .. Color_Difference.Label_Length) =
             "noticeable difference"
         and then not Color_Difference.Perceptual,
         "parse color difference label output");
      AUnit.Assertions.Assert
        (Perceptual_Difference.Status = Humanize.Status.Ok
         and then Perceptual_Difference.Value = 12.5
         and then Perceptual_Difference.Label
           (1 .. Perceptual_Difference.Label_Length) =
             "noticeable perceptual difference"
         and then Perceptual_Difference.Perceptual,
         "parse perceptual difference label output");
      AUnit.Assertions.Assert
        (Word_Summary.Status = Humanize.Status.Ok
         and then Word_Summary.Count = 3
         and then Word_Summary.Unit (1 .. Word_Summary.Unit_Length) = "words",
         "parse word count summary output");
      AUnit.Assertions.Assert
        (Sentence_Summary.Status = Humanize.Status.Ok
         and then Sentence_Summary.Count = 1
         and then Sentence_Summary.Unit
           (1 .. Sentence_Summary.Unit_Length) = "sentence",
         "parse sentence count summary output");
      AUnit.Assertions.Assert
        (Paragraph_Summary.Status = Humanize.Status.Ok
         and then Paragraph_Summary.Count = 0
         and then Paragraph_Summary.Unit
           (1 .. Paragraph_Summary.Unit_Length) = "paragraphs",
         "parse paragraph count summary output");
      AUnit.Assertions.Assert
        (Reading.Status = Humanize.Status.Ok
         and then Reading.Minutes = 1
         and then Reading.Less_Than
         and then Reading.Suffix (1 .. Reading.Suffix_Length) = "read",
         "parse reading time output");
      AUnit.Assertions.Assert
        (Speaking.Status = Humanize.Status.Ok
         and then Speaking.Minutes = 2
         and then not Speaking.Less_Than
         and then Speaking.Suffix (1 .. Speaking.Suffix_Length) = "spoken",
         "parse speaking time output");
      AUnit.Assertions.Assert
        (Text_Summary.Status = Humanize.Status.Ok
         and then Text_Summary.Has_Words
         and then Text_Summary.Words = 3
         and then Text_Summary.Has_Sentences
         and then Text_Summary.Sentences = 1
         and then Text_Summary.Has_Paragraphs
         and then Text_Summary.Paragraphs = 1
         and then Text_Summary.Has_Reading_Time
         and then Text_Summary.Reading_Minutes = 1
         and then Text_Summary.Reading_Less_Than,
         "parse natural text summary output");
      AUnit.Assertions.Assert
        (Compact_Text_Summary.Status = Humanize.Status.Ok
         and then Compact_Text_Summary.Words = 3
         and then Compact_Text_Summary.Sentences = 1
         and then Compact_Text_Summary.Paragraphs = 1
         and then Compact_Text_Summary.Reading_Minutes = 1
         and then Compact_Text_Summary.Code_Points = 18
         and then Compact_Text_Summary.Display_Width = 18,
         "parse compact text summary output");
      AUnit.Assertions.Assert
        (Masked.Status = Humanize.Status.Ok
         and then Masked.Masked_Count = 6
         and then Masked.Visible_Count = 4
         and then Masked.Visible_Tail
           (1 .. Masked.Visible_Tail_Length) = "7890",
         "parse masked string output");
      AUnit.Assertions.Assert
        (Grouped.Status = Humanize.Status.Ok
         and then Grouped.Group_Count = 3
         and then Grouped.Token_Length = 12
         and then Grouped.Normalized
           (1 .. Grouped.Normalized_Length) = "ABCDEF123456",
         "parse grouped token output");
      AUnit.Assertions.Assert
        (Masked_Token.Status = Humanize.Status.Ok
         and then Masked_Token.Group_Count = 3
         and then Masked_Token.Token_Length = 12,
         "parse masked token output");
      AUnit.Assertions.Assert
        (Safe_Path.Status = Humanize.Status.Ok
         and then Safe_Path.Value (1 .. Safe_Path.Value_Length) =
           "report-final.pdf"
         and then Safe_Path.Has_Dot
         and then Safe_Path.ASCII_Only,
         "parse path label output");
      AUnit.Assertions.Assert
        (Path_Base.Status = Humanize.Status.Ok
         and then Path_Base.Has_Extension
         and then Path_Base.Extension (1 .. Path_Base.Extension_Length) =
           "pdf",
         "parse path basename output");
      AUnit.Assertions.Assert
        (Path_Title.Status = Humanize.Status.Ok
         and then Path_Title.Value (1 .. Path_Title.Value_Length) =
           "Report Final"
         and then Path_Title.Word_Count = 2
         and then Path_Title.Title_Case,
         "parse path title output");
      AUnit.Assertions.Assert
        (Extension_Label.Status = Humanize.Status.Ok
         and then Extension_Label.Value
           (1 .. Extension_Label.Value_Length) = "PDF"
         and then Extension_Label.Uppercase,
         "parse extension label output");
      AUnit.Assertions.Assert
        (Shortened_Path.Status = Humanize.Status.Ok
         and then Shortened_Path.Starts_With_Ellipsis = False
         and then Shortened_Path.Ends_With_Ellipsis = False
         and then Shortened_Path.Content
           (1 .. Shortened_Path.Content_Length) = "src~/humanize.ads",
         "parse shortened path output");
      AUnit.Assertions.Assert
        (Handle.Status = Humanize.Status.Ok
         and then Handle.Value (1 .. Handle.Value_Length) = "@ada",
         "parse handle label output");
      AUnit.Assertions.Assert
        (Name_Label.Status = Humanize.Status.Ok
         and then Name_Label.Value (1 .. Name_Label.Value_Length) =
           "Ada Lovelace"
         and then Name_Label.Word_Count = 2
         and then Name_Label.Title_Case,
         "parse name label output");
      AUnit.Assertions.Assert
        (Clean_Name.Status = Humanize.Status.Ok
         and then Clean_Name.Value (1 .. Clean_Name.Value_Length) =
           "Ada Lovelace",
         "parse clean name output");
      AUnit.Assertions.Assert
        (Display_Name.Status = Humanize.Status.Ok
         and then Display_Name.Value (1 .. Display_Name.Value_Length) =
           "Ada",
         "parse display name output");
      AUnit.Assertions.Assert
        (Name_Part.Status = Humanize.Status.Ok
         and then Name_Part.Value (1 .. Name_Part.Value_Length) =
           "Lovelace",
         "parse name part output");
      AUnit.Assertions.Assert
        (Initials.Status = Humanize.Status.Ok
         and then Initials.Value (1 .. Initials.Value_Length) = "AL"
         and then Initials.Initial_Count = 2
         and then Initials.All_Uppercase
         and then not Initials.Has_Digit,
         "parse initials output");
      AUnit.Assertions.Assert
        (Person_Initials.Status = Humanize.Status.Ok
         and then Person_Initials.Initial_Count = 3,
         "parse person initials output");
      AUnit.Assertions.Assert
        (Possessive.Status = Humanize.Status.Ok
         and then Possessive.Owner (1 .. Possessive.Owner_Length) = "Ada"
         and then not Possessive.Apostrophe_Only
         and then Possessive.Owner_Word_Count = 1
         and then not Possessive.Owner_Ends_With_S,
         "parse possessive output");
      AUnit.Assertions.Assert
        (Possessive_Name.Status = Humanize.Status.Ok
         and then Possessive_Name.Owner
           (1 .. Possessive_Name.Owner_Length) = "Chris"
         and then Possessive_Name.Apostrophe_Only
         and then Possessive_Name.Owner_Ends_With_S,
         "parse possessive name output");
      AUnit.Assertions.Assert
        (Email_Local.Status = Humanize.Status.Ok
         and then Email_Local.Value (1 .. Email_Local.Value_Length) =
           "ada.lovelace"
         and then not Email_Local.Empty
         and then Email_Local.Has_Dot
         and then Email_Local.Segment_Count = 2
         and then Email_Local.Looks_Local_Part,
         "parse email local-part output");
      AUnit.Assertions.Assert
        (Safe_Filename.Status = Humanize.Status.Ok
         and then Safe_Filename.Has_Extension
         and then Safe_Filename.Extension
           (1 .. Safe_Filename.Extension_Length) = "pdf"
         and then Safe_Filename.Stem_Length = 12
         and then Safe_Filename.Looks_Safe
         and then Safe_Filename.Extension_Lowercase
         and then not Safe_Filename.Reserved_Name
         and then Safe_Filename.Separator = '-'
         and then Safe_Filename.Separator_Count = 1
         and then Safe_Filename.Extension_Preserved,
         "parse safe filename output");
      AUnit.Assertions.Assert
        (Search_Key.Status = Humanize.Status.Ok
         and then Search_Key.Token_Count = 3
         and then Search_Key.Separator = ' '
         and then Search_Key.Lowercase
         and then not Search_Key.Repeated_Separator,
         "parse search key output");
      AUnit.Assertions.Assert
        (Natural_Sort_Key.Status = Humanize.Status.Ok
         and then Natural_Sort_Key.Natural_Sort_Key
         and then Natural_Sort_Key.Numeric_Run_Count = 1
         and then Natural_Sort_Key.Token_Count = 2
         and then not Natural_Sort_Key.Leading_Separator,
         "parse natural sort key output");
      AUnit.Assertions.Assert
        (Parameterized.Status = Humanize.Status.Ok
         and then Parameterized.Token_Count = 2
         and then Parameterized.Separator = '-'
         and then Parameterized.Has_Separator
         and then not Parameterized.Trailing_Separator,
         "parse parameterized label output");
      AUnit.Assertions.Assert
        (Dasherized.Status = Humanize.Status.Ok
         and then Dasherized.Separator = '-'
         and then Dasherized.Has_Separator,
         "parse dasherized label output");
      AUnit.Assertions.Assert
        (Underscored.Status = Humanize.Status.Ok
         and then Underscored.Separator = '_'
         and then Underscored.Has_Separator,
         "parse underscored label output");
      AUnit.Assertions.Assert
        (Camelized.Status = Humanize.Status.Ok
         and then Camelized.Camel_Case
         and then Camelized.Token_Count = 2,
         "parse camelized label output");
      AUnit.Assertions.Assert
        (Transliteration.Status = Humanize.Status.Ok
         and then Transliteration.Value
           (1 .. Transliteration.Value_Length) = "Aether",
         "parse transliteration label output");
      AUnit.Assertions.Assert
        (Casefold.Status = Humanize.Status.Ok
         and then Casefold.Lowercase
         and then Casefold.Token_Count = 2,
         "parse casefold label output");
      AUnit.Assertions.Assert
        (Escaped_HTML.Status = Humanize.Status.Ok
         and then Escaped_HTML.Entity_Count = 5
         and then Escaped_HTML.Tag_Like_Count = 0,
         "parse escaped HTML output");
      AUnit.Assertions.Assert
        (NL_To_BR.Status = Humanize.Status.Ok
         and then NL_To_BR.Break_Count = 1
         and then NL_To_BR.Line_Feed_Count = 0,
         "parse NL-to-BR output");
      AUnit.Assertions.Assert
        (BR_To_NL.Status = Humanize.Status.Ok
         and then BR_To_NL.Line_Feed_Count = 1
         and then BR_To_NL.Break_Count = 0,
         "parse BR-to-NL output");
      AUnit.Assertions.Assert
        (Normalized_Whitespace.Status = Humanize.Status.Ok
         and then Normalized_Whitespace.Whitespace_Run_Count = 1,
         "parse normalized whitespace output");
      AUnit.Assertions.Assert
        (Squished.Status = Humanize.Status.Ok
         and then Squished.Whitespace_Run_Count = 1,
         "parse squished output");
      AUnit.Assertions.Assert
        (Stripped_Tags.Status = Humanize.Status.Ok
         and then Stripped_Tags.Tag_Like_Count = 0,
         "parse stripped tags output");
      AUnit.Assertions.Assert
        (Preserved_Separator.Status = Humanize.Status.Ok
         and then Preserved_Separator.Separator = '/'
         and then Preserved_Separator.Separator_Count = 1
         and then not Preserved_Separator.Repeated_Separator,
         "parse preserved separator output");
      AUnit.Assertions.Assert
        (Pluralized.Status = Humanize.Status.Ok
         and then Pluralized.Value (1 .. Pluralized.Value_Length) =
           "people",
         "parse pluralized word output");
      AUnit.Assertions.Assert
        (Singularized.Status = Humanize.Status.Ok
         and then Singularized.Value (1 .. Singularized.Value_Length) =
           "person",
         "parse singularized word output");
      AUnit.Assertions.Assert
        (Person_List.Status = Humanize.Status.Ok
         and then Person_List.Visible_Count = 2
         and then Person_List.Other_Count = 2
         and then not Person_List.Empty,
         "parse person list output");
      AUnit.Assertions.Assert
        (Excerpt.Status = Humanize.Status.Ok
         and then Excerpt.Starts_With_Ellipsis
         and then Excerpt.Ends_With_Ellipsis
         and then Excerpt.Ellipsis_Length = 3
         and then Excerpt.Ellipsis_Count = 2
         and then not Excerpt.Has_Inner_Ellipsis
         and then Excerpt.Content (1 .. Excerpt.Content_Length) =
           "middle text",
         "parse excerpt output");
      AUnit.Assertions.Assert
        (Highlight.Status = Humanize.Status.Ok
         and then Highlight.Match_Count = 2
         and then Highlight.Has_Markers
         and then Highlight.Before_Length = 6
         and then Highlight.After_Length = 7
         and then not Highlight.Unbalanced_Markers,
         "parse highlight output");
      AUnit.Assertions.Assert
        (Highlighted_Excerpt.Status = Humanize.Status.Ok
         and then Highlighted_Excerpt.Match_Count = 1
         and then Highlighted_Excerpt.Has_Markers,
         "parse highlighted excerpt output");
      AUnit.Assertions.Assert
        (Inflection.Status = Humanize.Status.Ok
         and then Inflection.Source = Humanize.Strings.Irregular_Inflection,
         "parse inflection source label output");
      AUnit.Assertions.Assert
        (Uncountable_Inflection.Status = Humanize.Status.Ok
         and then Uncountable_Inflection.Source =
           Humanize.Strings.Uncountable_Inflection,
         "parse uncountable inflection source label output");
      AUnit.Assertions.Assert
        (Domain_Summary.Status = Humanize.Status.Ok
         and then Domain_Summary.Domain
           (1 .. Domain_Summary.Domain_Length) = "job"
         and then Domain_Summary.State
           (1 .. Domain_Summary.State_Length) = "running"
         and then Domain_Summary.Completed = 3
         and then Domain_Summary.Total = 10
         and then Domain_Summary.Failed = 1
         and then Domain_Summary.Unit
           (1 .. Domain_Summary.Unit_Length) = "tasks",
         "parse domain summary output");
      AUnit.Assertions.Assert
        (Empty_Domain.Status = Humanize.Status.Ok
         and then Empty_Domain.Completed = 0
         and then Empty_Domain.Total = 0
         and then Empty_Domain.Unit
           (1 .. Empty_Domain.Unit_Length) = "files",
         "parse empty domain summary output");
      AUnit.Assertions.Assert
        (Queue_Summary.Status = Humanize.Status.Ok
         and then Queue_Summary.Queued = 5
         and then Queue_Summary.Running = 2
         and then Queue_Summary.Failed = 1
         and then Queue_Summary.Completed = 4
         and then Queue_Summary.Unit
           (1 .. Queue_Summary.Unit_Length) = "jobs",
         "parse queue summary output");
      AUnit.Assertions.Assert
        (Empty_Queue.Status = Humanize.Status.Ok
         and then Empty_Queue.Empty,
         "parse empty queue summary output");
      AUnit.Assertions.Assert
        (Cache_Summary.Status = Humanize.Status.Ok
         and then Cache_Summary.Hits = 8
         and then Cache_Summary.Misses = 2
         and then Cache_Summary.Hit_Rate = 80,
         "parse cache summary output");
      AUnit.Assertions.Assert
        (Empty_Cache.Status = Humanize.Status.Ok
         and then Empty_Cache.Empty,
         "parse empty cache summary output");
      AUnit.Assertions.Assert
        (Phrase_Severity.Status = Humanize.Status.Ok
         and then Phrase_Severity.Severity =
           Humanize.Phrases.Danger_Severity,
         "parse phrase severity label output");
      AUnit.Assertions.Assert
        (Phrase_Tone.Status = Humanize.Status.Ok
         and then Phrase_Tone.Tone = Humanize.Phrases.Critical_Tone,
         "parse phrase tone label output");
      AUnit.Assertions.Assert
        (Phrase_Domain.Status = Humanize.Status.Ok
         and then Phrase_Domain.Domain = Humanize.Phrases.Sync_Domain,
         "parse phrase domain label output");
      AUnit.Assertions.Assert
        (Phrase_State.Status = Humanize.Status.Ok
         and then Phrase_State.State = Humanize.Phrases.Summary_Running,
         "parse phrase state label output");
      AUnit.Assertions.Assert
        (Phrase_Key.Status = Humanize.Status.Ok
         and then Phrase_Key.Prefix (1 .. Phrase_Key.Prefix_Length) = "ci"
         and then Phrase_Key.Name (1 .. Phrase_Key.Name_Length) =
           "pipeline_failed",
         "parse phrase key output");
      AUnit.Assertions.Assert
        (Phrase_Packs.Status = Humanize.Status.Ok
         and then Phrase_Packs.Pack_Count = 26
         and then Phrase_Packs.Has_Summaries
         and then Phrase_Packs.Has_Comparisons,
         "parse phrase pack summary output");
      AUnit.Assertions.Assert
        (Phrase_Locales.Status = Humanize.Status.Ok
         and then Phrase_Locales.Locale_Count = 22
         and then Phrase_Locales.Has_Generated_Locales,
         "parse supported phrase locales output");
      AUnit.Assertions.Assert
        (Sync_Summary.Status = Humanize.Status.Ok
         and then Sync_Summary.Domain (1 .. Sync_Summary.Domain_Length) =
           "sync"
         and then Sync_Summary.Completed = 8
         and then Sync_Summary.Total = 10
         and then Sync_Summary.Failed = 1
         and then Sync_Summary.Unit (1 .. Sync_Summary.Unit_Length) =
           "items",
         "parse sync summary output");
      AUnit.Assertions.Assert
        (Import_Summary.Status = Humanize.Status.Ok
         and then Import_Summary.Domain (1 .. Import_Summary.Domain_Length) =
           "import"
         and then Import_Summary.Completed = 1
         and then Import_Summary.Total = 1
         and then Import_Summary.Unit (1 .. Import_Summary.Unit_Length) =
           "record",
         "parse import summary output");
      AUnit.Assertions.Assert
        (Export_Summary.Status = Humanize.Status.Ok
         and then Export_Summary.Domain (1 .. Export_Summary.Domain_Length) =
           "export"
         and then Export_Summary.Completed = 0
         and then Export_Summary.Total = 0
         and then Export_Summary.Unit (1 .. Export_Summary.Unit_Length) =
           "files",
         "parse export summary output");
      AUnit.Assertions.Assert
        (Unknown_Total_Summary.Status = Humanize.Status.Ok
         and then Unknown_Total_Summary.Completed = 3
         and then Unknown_Total_Summary.Total = 0
         and then Unknown_Total_Summary.Unit
           (1 .. Unknown_Total_Summary.Unit_Length) = "tasks",
         "parse unknown-total domain summary output");
      AUnit.Assertions.Assert
        (File_Size.Status = Humanize.Status.Ok
         and then File_Size.File_Count = 3
         and then File_Size.Total = 1536,
         "parse file-size summary output");
      AUnit.Assertions.Assert
        (Empty_File_Size.Status = Humanize.Status.Ok
         and then Empty_File_Size.File_Count = 0
         and then Empty_File_Size.Total = 0,
         "parse empty file-size summary output");
      AUnit.Assertions.Assert
        (Transfer.Status = Humanize.Status.Ok
         and then Transfer.Remaining = 2_000_000
         and then Transfer.Bytes_Per_Second = 1_000
         and then Transfer.Has_Rate,
         "parse transfer remaining with rate output");
      AUnit.Assertions.Assert
        (Transfer_Complete.Status = Humanize.Status.Ok
         and then Transfer_Complete.Complete,
         "parse transfer complete output");
      AUnit.Assertions.Assert
        (Transfer_Stalled.Status = Humanize.Status.Ok
         and then Transfer_Stalled.Remaining = 2_000_000
         and then Transfer_Stalled.Stalled,
         "parse stalled transfer output");
      AUnit.Assertions.Assert
        (Disk.Status = Humanize.Status.Ok
         and then Disk.Used = 1_500
         and then Disk.Total = 10_000
         and then Disk.Percent_Used = 15,
         "parse disk usage output");
      AUnit.Assertions.Assert
        (Validation.Status = Humanize.Status.Ok
         and then Validation.Count = 3
         and then Validation.Severity =
           Humanize.Parsing.Parsed_Validation_Error
         and then Validation.Has_Details
         and then Validation.Other_Count = 1
         and then Validation.Details (1 .. Validation.Details_Length) =
           "email is invalid, password is too short and 1 other",
         "parse detailed validation summary output");
      AUnit.Assertions.Assert
        (Validation_Headline.Status = Humanize.Status.Ok
         and then Validation_Headline.Count = 3
         and then Validation_Headline.Severity =
           Humanize.Parsing.Parsed_Validation_Error
         and then not Validation_Headline.Has_Details,
         "parse validation summary headline");
      AUnit.Assertions.Assert
        (Validation_Ok.Status = Humanize.Status.Ok
         and then Validation_Ok.Count = 0
         and then Validation_Ok.Severity =
           Humanize.Parsing.Parsed_Validation_Error,
         "parse empty validation summary");
      AUnit.Assertions.Assert
        (Validation_Warning.Status = Humanize.Status.Ok
         and then Validation_Warning.Count = 2
         and then Validation_Warning.Severity =
           Humanize.Parsing.Parsed_Validation_Warning,
         "parse validation warning summary");
      AUnit.Assertions.Assert
        (Field_Problems.Status = Humanize.Status.Ok
         and then Field_Problems.Field
           (1 .. Field_Problems.Field_Length) = "email"
         and then Field_Problems.Summary.Count = 2
         and then Field_Problems.Summary.Details
           (1 .. Field_Problems.Summary.Details_Length) =
             "is invalid and is already used",
         "parse field problem summary output");
      AUnit.Assertions.Assert
        (No_Selection.Status = Humanize.Status.Ok
         and then No_Selection.Kind = Humanize.Parsing.Selection_None
         and then No_Selection.Selected = 0
         and then No_Selection.Total = 0
         and then No_Selection.Unit (1 .. No_Selection.Unit_Length) =
           "items",
         "parse empty selection summary output");
      AUnit.Assertions.Assert
        (All_Selected.Status = Humanize.Status.Ok
         and then All_Selected.Kind = Humanize.Parsing.Selection_All
         and then All_Selected.Selected = 5
         and then All_Selected.Total = 5
         and then All_Selected.Unit (1 .. All_Selected.Unit_Length) =
           "items",
         "parse all selection summary output");
      AUnit.Assertions.Assert
        (Partial_Selection.Status = Humanize.Status.Ok
         and then Partial_Selection.Kind = Humanize.Parsing.Selection_Partial
         and then Partial_Selection.Selected = 3
         and then Partial_Selection.Total = 5
         and then Partial_Selection.Unit
           (1 .. Partial_Selection.Unit_Length) = "items",
         "parse partial selection summary output");
      AUnit.Assertions.Assert
        (More.Status = Humanize.Status.Ok
         and then More.Visible = 3
         and then More.Remaining = 4,
         "parse more-count summary output");
      AUnit.Assertions.Assert
        (Pagination.Status = Humanize.Status.Ok
         and then Pagination.First = 21
         and then Pagination.Last = 40
         and then Pagination.Total = 153
         and then Pagination.Unit (1 .. Pagination.Unit_Length) = "results",
         "parse pagination range output");
      AUnit.Assertions.Assert
        (Collection_Summary.Status = Humanize.Status.Ok
         and then Collection_Summary.Kind =
           Humanize.Parsing.Collection_Summary
         and then Collection_Summary.Visible = 3
         and then Collection_Summary.Remaining = 4,
         "parse collection summary output");
      AUnit.Assertions.Assert
        (Collection_Compact_More.Status = Humanize.Status.Ok
         and then Collection_Compact_More.Kind =
           Humanize.Parsing.Collection_Compact
         and then Collection_Compact_More.Visible = 0
         and then Collection_Compact_More.Remaining = 4,
         "parse compact collection remaining output");
      AUnit.Assertions.Assert
        (Collection_Compact_Visible.Status = Humanize.Status.Ok
         and then Collection_Compact_Visible.Kind =
           Humanize.Parsing.Collection_Compact
         and then Collection_Compact_Visible.Visible = 3
         and then Collection_Compact_Visible.Remaining = 0,
         "parse compact collection visible output");
      AUnit.Assertions.Assert
        (Collection_Screen.Status = Humanize.Status.Ok
         and then Collection_Screen.Kind =
           Humanize.Parsing.Collection_Screen_Reader
         and then Collection_Screen.Visible = 3
         and then Collection_Screen.Remaining = 4
         and then Collection_Screen.Visible_Unit
           (1 .. Collection_Screen.Visible_Unit_Length) = "items"
         and then Collection_Screen.Remaining_Unit
           (1 .. Collection_Screen.Remaining_Unit_Length) = "items",
         "parse screen-reader collection output");
   end Test_Round_Trip_Parsers;

   procedure Test_Diagnostics (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);

      Empty_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("");
      Bad_Byte_Number : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("wat bytes");
      Bad_Byte_Unit : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Parse_Bytes ("42 widgets");
      Bad_Duration_Range :
        constant Humanize.Parsing.Duration_Range_Parse_Result :=
          Humanize.Parsing.Parse_Duration_Range ("1 hour 2 hours");
      Reversed_Duration_Range :
        constant Humanize.Parsing.Duration_Range_Parse_Result :=
          Humanize.Parsing.Parse_Duration_Range ("2 hours-1 hour");
      Bad_Number_Range :
        constant Humanize.Parsing.Number_Range_Parse_Result :=
          Humanize.Parsing.Parse_Number_Range ("between 3 7");
      Reversed_Number_Range :
        constant Humanize.Parsing.Number_Range_Parse_Result :=
          Humanize.Parsing.Parse_Number_Range ("7-3");
      Bad_Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Proportion ("1 of 4");
      Bad_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 widgets");
      Bad_CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Length ("1.5 widget");
      Bad_Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit ("2.5 widgets");
      Bad_Aspect : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio ("16 by 9");
      Bad_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("IIII");
      Bad_Business : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "maintenance");
      Bad_RGB_Range : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(300, 2, 3)");
      Bad_RGB_Syntax : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_RGB_Label ("rgb(1, 2)");
      Bad_CSS_Hex : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("#12xz99");
      Bad_CSS_Name : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Color_Label ("nonesuch-color");
      Bad_Color_Summary : constant Humanize.Parsing.Color_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Summary ("#336699rgb(51, 102, 153)");
      Bad_HSL : constant Humanize.Parsing.Color_Model_Label_Parse_Result :=
        Humanize.Parsing.Parse_HSL_Label ("hsl(210 50% 40%)");
      Bad_Color_Bucket : constant Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
        Humanize.Parsing.Parse_Color_Bucket_Label ("not a bucket");
      Bad_Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dark muted blue cool moderate chroma");
   begin
      AUnit.Assertions.Assert
        (Empty_Bytes.Error = Humanize.Parsing.Empty_Input
         and then Humanize.Parsing.Diagnostic
           (Empty_Bytes.Status, Empty_Bytes.Error_Position, Empty_Bytes.Error)
           = Humanize.Parsing.Empty_Input,
         "empty input diagnostic");
      AUnit.Assertions.Assert
        (Bad_Byte_Number.Error = Humanize.Parsing.Expected_Number,
         "byte parser expected-number diagnostic");
      AUnit.Assertions.Assert
        (Bad_Byte_Unit.Error = Humanize.Parsing.Expected_Unit,
         "byte parser expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_Duration_Range.Error = Humanize.Parsing.Expected_Separator,
         "duration range separator diagnostic");
      AUnit.Assertions.Assert
        (Reversed_Duration_Range.Error = Humanize.Parsing.Out_Of_Range,
         "duration range out-of-range diagnostic");
      AUnit.Assertions.Assert
        (Bad_Number_Range.Error = Humanize.Parsing.Expected_Separator,
         "number range separator diagnostic");
      AUnit.Assertions.Assert
        (Reversed_Number_Range.Error = Humanize.Parsing.Out_Of_Range,
         "number range out-of-range diagnostic");
      AUnit.Assertions.Assert
        (Bad_Proportion.Error = Humanize.Parsing.Expected_Separator,
         "proportion separator diagnostic");
      AUnit.Assertions.Assert
        (Bad_Unit.Error = Humanize.Parsing.Expected_Unit,
         "unit expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_CSS.Error = Humanize.Parsing.Expected_Unit,
         "CSS expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_Compound.Error = Humanize.Parsing.Expected_Unit,
         "compound expected-unit diagnostic");
      AUnit.Assertions.Assert
        (Bad_Aspect.Error = Humanize.Parsing.Expected_Separator,
         "aspect separator diagnostic");
      AUnit.Assertions.Assert
        (Bad_Roman.Error = Humanize.Parsing.Unsupported_Form,
         "Roman unsupported-form diagnostic");
      AUnit.Assertions.Assert
        (Bad_Business.Error = Humanize.Parsing.Unsupported_Form,
         "business-calendar unsupported-form diagnostic");
      AUnit.Assertions.Assert
        (Bad_RGB_Range.Status = Humanize.Status.Invalid_Value
         and then Bad_RGB_Range.Error = Humanize.Parsing.Out_Of_Range
         and then Bad_RGB_Range.Error_Position = 5,
         "RGB out-of-range diagnostic position");
      AUnit.Assertions.Assert
        (Bad_RGB_Syntax.Error = Humanize.Parsing.Expected_Separator
         and then Bad_RGB_Syntax.Error_Position = 8,
         "RGB missing-separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_CSS_Hex.Error = Humanize.Parsing.Expected_Number
         and then Bad_CSS_Hex.Error_Position = 4,
         "CSS hex digit diagnostic position");
      AUnit.Assertions.Assert
        (Bad_CSS_Name.Error = Humanize.Parsing.Unsupported_Form
         and then Bad_CSS_Name.Error_Position = 1,
         "CSS unsupported color diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Color_Summary.Error = Humanize.Parsing.Expected_Separator
         and then Bad_Color_Summary.Error_Position = 8,
         "color summary separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_HSL.Error = Humanize.Parsing.Expected_Separator
         and then Bad_HSL.Error_Position = 5,
         "HSL separator diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Color_Bucket.Error = Humanize.Parsing.Unsupported_Form
         and then Bad_Color_Bucket.Error_Position = 1,
         "color bucket diagnostic position");
      AUnit.Assertions.Assert
        (Bad_Color_Description.Error = Humanize.Parsing.Expected_Separator
         and then Bad_Color_Description.Error_Position = 1,
         "color description separator diagnostic position");
   end Test_Diagnostics;

   procedure Test_Frequency_Rate_List
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Parse_Frequency ("4 times");
      Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("approximately 4 times per week");
      Rate_Alias : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("approximately 4 times per weeks");
      Less : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("less than once per day");
      List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List ("Ada, SPARK and Alire");
      Bad_Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate ("per day");
      Single : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List ("Ada");
      German_List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List ("Ada, SPARK und Alire");
      Japanese_List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_List
          ("Ada " & B ("E381A8") & " SPARK");
      Localized_Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Parse_Frequency
          ("2 " & B ("D180D0B0D0B7D0B0"));
      Localized_Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Parse_Rate
          (B ("756E676566C3A472") & " 2 gange per uge");
      Percent : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Percent ("12.5%");
      Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal ("21st");
      Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal ("twenty one");
      Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal ("twenty first");
      Scientific : constant Humanize.Parsing.Float_Parse_Result :=
        Humanize.Parsing.Parse_Scientific_Number ("1.23e6");
      Duration_Range : constant Humanize.Parsing.Duration_Range_Parse_Result :=
        Humanize.Parsing.Parse_Duration_Range ("1 hour-2 hours");
      Countdown : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Countdown ("1 minute remaining");
      SLA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_SLA_Window ("within 1 day");
      Age : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Age ("3 days old");
      Modified : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Modified_Ago ("modified 2 hours ago");
      Parsed_Progress : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Progress ("3 of 10 complete");
      Results : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Parse_Result_Count ("24 results");
      Counted : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("no files");
      Article_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("an item");
      Compact_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("1.2K files");
      Word_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Parse_Counted_Noun ("twenty one entries");
      Scanned_Count : constant Humanize.Parsing.Counted_Noun_Parse_Result :=
        Humanize.Parsing.Scan_Counted_Noun ("3 boxes; cached");
      Showing : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Showing_Count ("showing 20 of 153 results");
      Page : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Page_Count ("page 2 of 8");
      ETA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_ETA ("ETA 5 minutes");
      Retry : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Retry_In ("retrying in 10 seconds");
      Step : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Step_Count ("step 2 of 5");
      Attempt : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Attempt_Count ("attempt 2 of 3");
      Business : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Business_Days ("3 business days");
      Working : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Working_Hours ("1 working hour");
      Recurrence : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence ("every 2 days");
      Other_Tuesday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "every other Tuesday");
      First_Monday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "first Monday of each month");
      Last_Business : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "last business day");
      Until_Weeks : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 2 weeks until 2026-12-31");
      Windowed : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 2 weeks from 2026-01-01 until 2026-12-31 for 5 times");
      Throughput : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Throughput_Remaining
          ("120 items remaining at 4 item/s");
      Progress_Bar : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Progress_Bar ("[###-------] 30%");
      Scanned_ETA : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_ETA ("ETA 5 minutes; cached");
      Scanned_Retry : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Retry_In ("retrying in 10 seconds; cached");
      Scanned_Step : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Step_Count ("step 2 of 5; cached");
      Scanned_Attempt : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Attempt_Count ("attempt 2 of 3; cached");
      Scanned_Business : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Business_Days ("3 business days; cached");
      Scanned_Working : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Working_Hours ("1 working hour; cached");
      Scanned_Recurrence : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Recurrence ("every 2 days; cached");
      Scanned_Recurrence_Detail :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Scan_Recurrence_Detail
            (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
             "every other Tuesday; cached");
      Scanned_Throughput : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Throughput_Remaining
          ("120 items remaining at 4 item/s; cached");
      Scanned_Bar : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Progress_Bar ("[###-------] 30%; cached");
      Number_Range : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Parse_Number_Range ("between 3 and 7");
      Scanned_Range : constant Humanize.Parsing.Number_Range_Parse_Result :=
        Humanize.Parsing.Scan_Number_Range ("about 10-20 selected");
      Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Proportion ("3 out of 10");
      Scanned_Proportion : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Scan_Proportion ("1 in 4; sampled");
      Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("5 km");
      Localized_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit
          ("5 " & B ("D0BAD0B8D0BBD0BED0BCD0B5D182D180D18B"));
      Ratio : constant Humanize.Parsing.Aspect_Ratio_Parse_Result :=
        Humanize.Parsing.Parse_Aspect_Ratio ("16:9");
      CSS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CSS_Length ("1.5 rem");
      Compound : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Compound_Unit ("2.5 ms");
      Acre : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 acres");
      Pounds : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 lbs");
      Fahrenheit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("350 degrees Fahrenheit");
      Bad_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Parse_Unit ("2 widgets");
      Scanned_Unit : constant Humanize.Parsing.Unit_Parse_Result :=
        Humanize.Parsing.Scan_Unit ("5 km (planned)");
      Scanned_Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
        Humanize.Parsing.Scan_Bytes ("1.5 KiB; cached");
      Scanned_Precise : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Scan_Precise_Duration ("1 second, 5 ms (work)");
      Scanned_Compact : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Compact_Number ("1.2K; cached");
      Scanned_Bounded : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Bounded_Number ("100+ selected");
      Scanned_Frequency : constant Humanize.Parsing.Frequency_Parse_Result :=
        Humanize.Parsing.Scan_Frequency ("4 times; cached");
      Scanned_Rate : constant Humanize.Parsing.Rate_Parse_Result :=
        Humanize.Parsing.Scan_Rate ("less than once per day (low)");
      Scanned_List : constant Humanize.Parsing.List_Parse_Result :=
        Humanize.Parsing.Scan_List ("Ada, SPARK and Alire; done");
      Scanned_Percent : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Percent ("12.5% selected");
      Scanned_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Ordinal ("21st place");
      Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("MMXXVI");
      Lower_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("cmxliv");
      Bad_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Roman ("IIII");
      Scanned_Roman : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Scan_Roman ("MMXXVI edition");
      Normal_Unit : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Normalize_Unit_Text ("  Kilometers-per-Hour ");
      Normal_List : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Normalize_List_Text ("Ada, SPARK und Alire");
      Ref_Date : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2024, 1, 1, 0.0);
      Tomorrow : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tomorrow");
      Russian_Today : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, B ("D181D0B5D0B3D0BED0B4D0BDD18F"));
      Danish_In_Weeks : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "om 2 uger");
      Russian_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "2 " & B ("D0B4D0BDD18F20D0BDD0B0D0B7D0B0D0B4"));
      Next_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "next friday");
      Next_Fri_Afternoon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday afternoon");
      Tonight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tonight");
      Later_Today : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ada.Calendar.Time_Of (2024, 1, 1, 12.0 * 3_600.0),
           "later today");
      Scanned_Tonight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tonight; cached");
      Scanned_Fri_Afternoon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "next friday afternoon; cached");
      Scanned_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "in 3 days; cached");
      ISO_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-02-29");
      Month_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "February 2 2024");
      Month_Day_Ordinal : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "Jan 1st");
      Weekday_Ordinal : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "Wednesday the 3rd");
      Scanned_Month_Day_Ordinal : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "Jan 1st; cached");
      In_Weeks : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "in 2 weeks");
      Month_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "1 month ago");
      This_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "this friday");
      Last_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "last friday");
      Two_Fridays : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two fridays from now");
      End_Next_Month : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "end of next month");
      Start_Q3 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "start of q3");
      End_Next_Quarter : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "end of next quarter");
      Second_Tuesday_March : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "second tuesday in march");
      Last_Friday_March_2024 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "last friday of march 2024");
      Next_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "next business day");
      Three_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "3 business days from now");
      Before_Month_End : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two business days before month end");
      Before_Next_Quarter_End : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "2 business days before end of next quarter");
      Week_32_Start : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "week 32");
      This_Week : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "this week");
      Next_Two_Weeks : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "next 2 weeks");
      Last_Three_Months : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "last 3 months");
      Q3_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "q3 2024");
      Fiscal_Q2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "fy2025 q2");
      Fiscal_Year : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "FY2027");
      Fiscal_Half : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "FY2027 H1");
      Semester_2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "S2 2026");
      Half_Year_2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "H2 2026");
      Scanned_Fiscal_Half : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Range
          (Ref_Date, "FY2027 H1; cached");
      Early_Next_Week : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "early next week");
      Mid_March : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "mid-March");
      Late_Q2 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "late Q2");
      First_Half_2026 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "first half of 2026");
      End_FY2027 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "end of FY2027");
      Week_32_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "week 32");
      This_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "this weekend");
      Next_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "next weekend");
      Last_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "last weekend");
      Scanned_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Range
          (Ref_Date, "this weekend; cached");
      Between_Dates : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "between today and next friday");
      Scanned_Range_Date : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Range
          (Ref_Date, "next 2 weeks; cached");
      Holiday_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date, "holiday 2024-01-02");
      Recurring_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date, "recurring holiday january 2");
      Shutdown_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date, "shutdown 2024-01-02 to 2024-01-03");
      Rule_Next_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business day", Holiday_Rules.Rules);
      Rule_Three_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "3 business days from now", Holiday_Rules.Rules);
      Rule_Before_Month_End : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two business days before month end",
           Holiday_Rules.Rules);
      Rule_Last_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
           "last business day", Holiday_Rules.Rules);
      Rule_Recurring_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business day", Recurring_Rules.Rules);
      Rule_Shutdown_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business day", Shutdown_Rules.Rules);
      Rule_Scanned_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "next business day; cached", Holiday_Rules.Rules);
      Rule_Range_Business : constant
        Humanize.Parsing.Date_Range_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date_Range
            (Ref_Date, "between today and next business day",
             Holiday_Rules.Rules);
      One_Off_Holiday : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "holiday 2026-07-06");
      Recurring_Holiday : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "recurring holiday december 25");
      Half_Day : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "half-day 2026-12-24 until 12");
      Shutdown : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "shutdown 2026-12-24 to 2026-12-31");
      Business_Hours : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ref_Date, "business hours monday 9-17");
      Next_Open : constant Humanize.Parsing.Business_Calendar_Parse_Result :=
        Humanize.Parsing.Parse_Business_Calendar
          (Ada.Calendar.Time_Of (2026, 7, 3, 18.0 * 3_600.0),
           "next open business hour");
      Scanned_Business_Calendar :
        constant Humanize.Parsing.Business_Calendar_Parse_Result :=
          Humanize.Parsing.Scan_Business_Calendar
            (Ref_Date, "business hours friday 10-15; cached");
      Parsed_Rules : constant
        Humanize.Parsing.Business_Calendar_Rules_Parse_Result :=
          Humanize.Parsing.Parse_Business_Calendar_Rules
            (Ref_Date,
             "recurring holiday december 25; "
             & "half-day 2026-12-24 until 12; "
             & "shutdown 2026-12-28 to 2026-12-29; "
             & "business hours monday 8-16");
      Rules_Result : constant Ada.Calendar.Time :=
        Humanize.Durations.Add_Business_Hours
          (Ada.Calendar.Time_Of (2026, 12, 24, 11.0 * 3_600.0),
           2,
           Parsed_Rules.Rules);
      Diag_Message : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Diagnostic_Message
          (Humanize.Parsing.Expected_Number, 4);
   begin
      AUnit.Assertions.Assert
        (Frequency.Status = Humanize.Status.Ok and then Frequency.Count = 4,
         "parse frequency");
      AUnit.Assertions.Assert
        (Rate.Status = Humanize.Status.Ok and then Rate.Count = 4
         and then Rate.Period = Humanize.Rates.Per_Week
         and then not Rate.Less_Than,
         "parse rate");
      AUnit.Assertions.Assert
        (Rate_Alias.Status = Humanize.Status.Ok
         and then Rate_Alias.Period = Humanize.Rates.Per_Week,
         "parse rate period alias");
      AUnit.Assertions.Assert
        (Less.Status = Humanize.Status.Ok and then Less.Count = 1
         and then Less.Period = Humanize.Rates.Per_Day
         and then Less.Less_Than,
         "parse less-than rate");
      AUnit.Assertions.Assert
        (List.Status = Humanize.Status.Ok and then List.Count = 3,
         "parse list count");
      AUnit.Assertions.Assert
        (Bad_Rate.Status = Humanize.Status.Invalid_Argument,
         "reject malformed rate");
      AUnit.Assertions.Assert
        (Single.Status = Humanize.Status.Ok and then Single.Count = 1,
         "parse single-item list count");
      AUnit.Assertions.Assert
        (German_List.Status = Humanize.Status.Ok and then German_List.Count = 3,
         "parse localized list count");
      AUnit.Assertions.Assert
        (Japanese_List.Status = Humanize.Status.Ok
         and then Japanese_List.Count = 2,
         "parse CJK localized list count");
      AUnit.Assertions.Assert
        (Localized_Frequency.Status = Humanize.Status.Ok
         and then Localized_Frequency.Count = 2,
         "parse localized frequency unit");
      AUnit.Assertions.Assert
        (Localized_Rate.Status = Humanize.Status.Ok
         and then Localized_Rate.Count = 2
         and then Localized_Rate.Period = Humanize.Rates.Per_Week,
         "parse localized rate");
      AUnit.Assertions.Assert
        (Percent.Status = Humanize.Status.Ok and then Percent.Value = 13
         and then not Percent.Exact,
         "parse percent");
      AUnit.Assertions.Assert
        (Ordinal.Status = Humanize.Status.Ok and then Ordinal.Value = 21,
         "parse ordinal");
      AUnit.Assertions.Assert
        (Word_Cardinal.Status = Humanize.Status.Ok
         and then Word_Cardinal.Value = 21,
         "parse word cardinal");
      AUnit.Assertions.Assert
        (Word_Ordinal.Status = Humanize.Status.Ok
         and then Word_Ordinal.Value = 21,
         "parse word ordinal");
      AUnit.Assertions.Assert
        (Scientific.Status = Humanize.Status.Ok
         and then Scientific.Value = 1_230_000.0,
         "parse scientific number");
      AUnit.Assertions.Assert
        (Duration_Range.Status = Humanize.Status.Ok
         and then Duration_Range.Low = 3_600
         and then Duration_Range.High = 7_200,
         "parse duration range");
      AUnit.Assertions.Assert
        (Countdown.Status = Humanize.Status.Ok and then Countdown.Value = 60,
         "parse countdown");
      AUnit.Assertions.Assert
        (SLA.Status = Humanize.Status.Ok and then SLA.Value = 86_400,
         "parse SLA window");
      AUnit.Assertions.Assert
        (Age.Status = Humanize.Status.Ok and then Age.Value = 259_200,
         "parse age phrase");
      AUnit.Assertions.Assert
        (Modified.Status = Humanize.Status.Ok and then Modified.Value = 7_200,
         "parse modified-ago phrase");
      AUnit.Assertions.Assert
        (Parsed_Progress.Status = Humanize.Status.Ok
         and then Parsed_Progress.Count = 3
         and then Parsed_Progress.Total = 10,
         "parse progress phrase");
      AUnit.Assertions.Assert
        (Results.Status = Humanize.Status.Ok and then Results.Count = 24,
         "parse result count");
      AUnit.Assertions.Assert
        (Counted.Status = Humanize.Status.Ok
         and then Counted.Count = 0
         and then Counted.Noun (1 .. Counted.Noun_Length) = "files",
         "parse counted noun zero");
      AUnit.Assertions.Assert
        (Article_Count.Status = Humanize.Status.Ok
         and then Article_Count.Count = 1
         and then Article_Count.Noun (1 .. Article_Count.Noun_Length) = "item",
         "parse counted noun article");
      AUnit.Assertions.Assert
        (Compact_Count.Status = Humanize.Status.Ok
         and then Compact_Count.Count = 1_200
         and then Compact_Count.Noun (1 .. Compact_Count.Noun_Length) = "files",
         "parse counted noun compact count");
      AUnit.Assertions.Assert
        (Word_Count.Status = Humanize.Status.Ok
         and then Word_Count.Count = 21
         and then Word_Count.Noun (1 .. Word_Count.Noun_Length) = "entries",
         "parse counted noun word count");
      AUnit.Assertions.Assert
        (Scanned_Count.Status = Humanize.Status.Ok
         and then Scanned_Count.Count = 3
         and then Scanned_Count.Noun (1 .. Scanned_Count.Noun_Length) = "boxes"
         and then Scanned_Count.Consumed = 7,
         "scan counted noun prefix");
      AUnit.Assertions.Assert
        (Showing.Status = Humanize.Status.Ok
         and then Showing.Count = 20
         and then Showing.Total = 153,
         "parse showing count");
      AUnit.Assertions.Assert
        (Page.Status = Humanize.Status.Ok
         and then Page.Count = 2
         and then Page.Total = 8,
         "parse page count");
      AUnit.Assertions.Assert
        (ETA.Status = Humanize.Status.Ok and then ETA.Value = 300,
         "parse ETA phrase");
      AUnit.Assertions.Assert
        (Retry.Status = Humanize.Status.Ok and then Retry.Value = 10,
         "parse retry phrase");
      AUnit.Assertions.Assert
        (Step.Status = Humanize.Status.Ok
         and then Step.Count = 2
         and then Step.Total = 5,
         "parse step count");
      AUnit.Assertions.Assert
        (Attempt.Status = Humanize.Status.Ok
         and then Attempt.Count = 2
         and then Attempt.Total = 3,
         "parse attempt count");
      AUnit.Assertions.Assert
        (Business.Status = Humanize.Status.Ok and then Business.Value = 3,
         "parse business days");
      AUnit.Assertions.Assert
        (Working.Status = Humanize.Status.Ok and then Working.Value = 1,
         "parse working hours");
      AUnit.Assertions.Assert
        (Recurrence.Status = Humanize.Status.Ok and then Recurrence.Value = 2,
         "parse recurrence");
      AUnit.Assertions.Assert
        (Other_Tuesday.Status = Humanize.Status.Ok
         and then Other_Tuesday.Kind = Humanize.Parsing.Recurrence_Weekday
         and then Other_Tuesday.Every = 2
         and then Other_Tuesday.Unit = Humanize.Durations.Every_Week
         and then Other_Tuesday.Weekday = 2,
         "parse every-other weekday recurrence");
      AUnit.Assertions.Assert
        (First_Monday.Status = Humanize.Status.Ok
         and then First_Monday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then First_Monday.Unit = Humanize.Durations.Every_Month
         and then First_Monday.Ordinal = 1
         and then First_Monday.Weekday = 1,
         "parse ordinal weekday recurrence");
      AUnit.Assertions.Assert
        (Last_Business.Status = Humanize.Status.Ok
         and then Last_Business.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Last_Business.Ordinal = -1
         and then Last_Business.Unit = Humanize.Durations.Every_Month,
         "parse last business day recurrence");
      AUnit.Assertions.Assert
        (Until_Weeks.Status = Humanize.Status.Ok
         and then Until_Weeks.Every = 2
         and then Until_Weeks.Unit = Humanize.Durations.Every_Week
         and then Until_Weeks.Has_End_Date
         and then Until_Weeks.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0),
         "parse recurrence until date");
      AUnit.Assertions.Assert
        (Windowed.Status = Humanize.Status.Ok
         and then Windowed.Has_Start_Date
         and then Windowed.Start_Date =
           Ada.Calendar.Time_Of (2026, 1, 1, 0.0)
         and then Windowed.Has_End_Date
         and then Windowed.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0)
         and then Windowed.Has_Occurrences
         and then Windowed.Occurrences = 5,
         "parse recurrence start/end/count window");
      AUnit.Assertions.Assert
        (Throughput.Status = Humanize.Status.Ok
         and then Throughput.Count = 120
         and then Throughput.Total = 4,
         "parse throughput phrase");
      AUnit.Assertions.Assert
        (Progress_Bar.Status = Humanize.Status.Ok
         and then Progress_Bar.Value = 30,
         "parse progress bar");
      AUnit.Assertions.Assert
        (Scanned_ETA.Status = Humanize.Status.Ok
         and then Scanned_ETA.Value = 300
         and then Scanned_ETA.Consumed = 13,
         "scan ETA phrase");
      AUnit.Assertions.Assert
        (Scanned_Retry.Status = Humanize.Status.Ok
         and then Scanned_Retry.Value = 10
         and then Scanned_Retry.Consumed = 22,
         "scan retry phrase");
      AUnit.Assertions.Assert
        (Scanned_Step.Status = Humanize.Status.Ok
         and then Scanned_Step.Count = 2
         and then Scanned_Step.Total = 5
         and then Scanned_Step.Consumed = 11,
         "scan step phrase");
      AUnit.Assertions.Assert
        (Scanned_Attempt.Status = Humanize.Status.Ok
         and then Scanned_Attempt.Count = 2
         and then Scanned_Attempt.Total = 3
         and then Scanned_Attempt.Consumed = 14,
         "scan attempt phrase");
      AUnit.Assertions.Assert
        (Scanned_Business.Status = Humanize.Status.Ok
         and then Scanned_Business.Value = 3
         and then Scanned_Business.Consumed = 15,
         "scan business-days phrase");
      AUnit.Assertions.Assert
        (Scanned_Working.Status = Humanize.Status.Ok
         and then Scanned_Working.Value = 1
         and then Scanned_Working.Consumed = 14,
         "scan working-hours phrase");
      AUnit.Assertions.Assert
        (Scanned_Recurrence.Status = Humanize.Status.Ok
         and then Scanned_Recurrence.Value = 2
         and then Scanned_Recurrence.Consumed = 12,
         "scan recurrence phrase");
      AUnit.Assertions.Assert
        (Scanned_Recurrence_Detail.Status = Humanize.Status.Ok
         and then Scanned_Recurrence_Detail.Kind =
           Humanize.Parsing.Recurrence_Weekday
         and then Scanned_Recurrence_Detail.Consumed = 19,
         "scan detailed recurrence phrase");
      AUnit.Assertions.Assert
        (Scanned_Throughput.Status = Humanize.Status.Ok
         and then Scanned_Throughput.Count = 120
         and then Scanned_Throughput.Total = 4,
         "scan throughput phrase");
      AUnit.Assertions.Assert
        (Scanned_Bar.Status = Humanize.Status.Ok
         and then Scanned_Bar.Value = 30,
         "scan progress bar");
      AUnit.Assertions.Assert
        (Humanize.Parsing.Diagnostic
           (Humanize.Status.Invalid_Argument, 1)
         = Humanize.Parsing.Expected_Number,
         "parser diagnostic category");
      AUnit.Assertions.Assert
        (Diag_Message.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Diag_Message)
           = "expected a number at position 4",
         "parser diagnostic message");
      AUnit.Assertions.Assert
        (Number_Range.Status = Humanize.Status.Ok
         and then Number_Range.Low = 3
         and then Number_Range.High = 7,
         "parse number range");
      AUnit.Assertions.Assert
        (Scanned_Range.Status = Humanize.Status.Ok
         and then Scanned_Range.Low = 10
         and then Scanned_Range.High = 20
         and then Scanned_Range.Consumed = 11,
         "scan number range prefix");
      AUnit.Assertions.Assert
        (Proportion.Status = Humanize.Status.Ok
         and then Proportion.Count = 3
         and then Proportion.Total = 10,
         "parse proportion");
      AUnit.Assertions.Assert
        (Scanned_Proportion.Status = Humanize.Status.Ok
         and then Scanned_Proportion.Count = 1
         and then Scanned_Proportion.Total = 4
         and then Scanned_Proportion.Consumed = 6,
         "scan proportion prefix");
      AUnit.Assertions.Assert
        (Ratio.Status = Humanize.Status.Ok
         and then Ratio.Width = 16 and then Ratio.Height = 9,
         "parse aspect ratio");
      AUnit.Assertions.Assert
        (CSS.Status = Humanize.Status.Ok
         and then CSS.Value = 1.5
         and then CSS.Unit (1 .. CSS.Unit_Length) = "rem",
         "parse CSS length");
      AUnit.Assertions.Assert
        (Compound.Status = Humanize.Status.Ok
         and then Compound.Value = 2.5
         and then Compound.Unit (1 .. Compound.Unit_Length) = "ms",
         "parse compound unit");
      AUnit.Assertions.Assert
        (Unit.Status = Humanize.Status.Ok
         and then Unit.Unit = Humanize.Units.Kilometer
         and then Unit.Value = 5.0,
         "parse unit quantity");
      AUnit.Assertions.Assert
        (Localized_Unit.Status = Humanize.Status.Ok
         and then Localized_Unit.Unit = Humanize.Units.Kilometer
         and then Localized_Unit.Value = 5.0,
         "parse localized unit quantity");
      AUnit.Assertions.Assert
        (Acre.Status = Humanize.Status.Ok
         and then Acre.Unit = Humanize.Units.Acre
         and then Acre.Value = 2.0,
         "parse expanded unit alias");
      AUnit.Assertions.Assert
        (Pounds.Status = Humanize.Status.Ok
         and then Pounds.Unit = Humanize.Units.Pound,
         "parse plural abbreviation unit alias");
      AUnit.Assertions.Assert
        (Fahrenheit.Status = Humanize.Status.Ok
         and then Fahrenheit.Unit = Humanize.Units.Fahrenheit,
         "parse temperature unit alias");
      AUnit.Assertions.Assert
        (Bad_Unit.Status = Humanize.Status.Invalid_Argument
         and then Bad_Unit.Error_Position = 3,
         "parse unit diagnostic position");
      AUnit.Assertions.Assert
        (Scanned_Unit.Status = Humanize.Status.Ok
         and then Scanned_Unit.Unit = Humanize.Units.Kilometer
         and then Scanned_Unit.Consumed = 4,
         "scan unit prefix");
      AUnit.Assertions.Assert
        (Scanned_Bytes.Status = Humanize.Status.Ok
         and then Scanned_Bytes.Value = 1536
         and then Scanned_Bytes.Consumed = 7,
         "scan byte prefix");
      AUnit.Assertions.Assert
        (Scanned_Precise.Status = Humanize.Status.Ok
         and then Scanned_Precise.Value = 1_005_000
         and then Scanned_Precise.Consumed = 14,
         "scan precise duration prefix");
      AUnit.Assertions.Assert
        (Scanned_Compact.Status = Humanize.Status.Ok
         and then Scanned_Compact.Value = 1_200
         and then Scanned_Compact.Consumed = 4,
         "scan compact number prefix");
      AUnit.Assertions.Assert
        (Scanned_Bounded.Status = Humanize.Status.Ok
         and then Scanned_Bounded.Value = 100
         and then Scanned_Bounded.Consumed = 4,
         "scan bounded number prefix");
      AUnit.Assertions.Assert
        (Scanned_Frequency.Status = Humanize.Status.Ok
         and then Scanned_Frequency.Count = 4
         and then Scanned_Frequency.Consumed = 7,
         "scan frequency prefix");
      AUnit.Assertions.Assert
        (Scanned_Rate.Status = Humanize.Status.Ok
         and then Scanned_Rate.Less_Than
         and then Scanned_Rate.Period = Humanize.Rates.Per_Day,
         "scan rate prefix");
      AUnit.Assertions.Assert
        (Scanned_List.Status = Humanize.Status.Ok
         and then Scanned_List.Count = 3
         and then Scanned_List.Consumed = 20,
         "scan list prefix");
      AUnit.Assertions.Assert
        (Scanned_Percent.Status = Humanize.Status.Ok
         and then Scanned_Percent.Value = 13
         and then Scanned_Percent.Consumed = 5,
         "scan percent prefix");
      AUnit.Assertions.Assert
        (Scanned_Ordinal.Status = Humanize.Status.Ok
         and then Scanned_Ordinal.Value = 21
         and then Scanned_Ordinal.Consumed = 4,
         "scan ordinal prefix");
      AUnit.Assertions.Assert
        (Roman.Status = Humanize.Status.Ok and then Roman.Value = 2026,
         "parse Roman numeral");
      AUnit.Assertions.Assert
        (Lower_Roman.Status = Humanize.Status.Ok
         and then Lower_Roman.Value = 944,
         "parse lowercase Roman numeral");
      AUnit.Assertions.Assert
        (Bad_Roman.Status = Humanize.Status.Invalid_Argument,
         "reject noncanonical Roman numeral");
      AUnit.Assertions.Assert
        (Scanned_Roman.Status = Humanize.Status.Ok
         and then Scanned_Roman.Value = 2026
         and then Scanned_Roman.Consumed = 6,
         "scan Roman numeral");
      AUnit.Assertions.Assert
        (Normal_Unit.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_Unit)
           = "kilometers per hour",
         "normalize unit text");
      AUnit.Assertions.Assert
        (Normal_List.Status = Humanize.Status.Ok
         and then Humanize.Tests.Support.Text (Normal_List)
           = "ada, spark and alire",
         "normalize list text");
      AUnit.Assertions.Assert
        (Tomorrow.Status = Humanize.Status.Ok
         and then Tomorrow.Value = Ref_Date + 86_400.0,
         "parse natural date tomorrow");
      AUnit.Assertions.Assert
        (Russian_Today.Status = Humanize.Status.Ok
         and then Russian_Today.Value = Ref_Date,
         "parse localized natural date today");
      AUnit.Assertions.Assert
        (Danish_In_Weeks.Status = Humanize.Status.Ok
         and then Danish_In_Weeks.Value = Ref_Date + 14.0 * 86_400.0,
         "parse localized relative natural date");
      AUnit.Assertions.Assert
        (Russian_Ago.Status = Humanize.Status.Ok
         and then Russian_Ago.Value = Ref_Date - 2.0 * 86_400.0,
         "parse localized natural date ago");
      AUnit.Assertions.Assert
        (Next_Fri.Status = Humanize.Status.Ok
         and then Next_Fri.Value = Ref_Date + 4.0 * 86_400.0,
         "parse natural next weekday");
      AUnit.Assertions.Assert
        (Next_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Next_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0),
         "parse natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Tonight.Status = Humanize.Status.Ok
         and then Tonight.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 21.0 * 3_600.0),
         "parse tonight");
      AUnit.Assertions.Assert
        (Later_Today.Status = Humanize.Status.Ok
         and then Later_Today.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 13.0 * 3_600.0),
         "parse later today");
      AUnit.Assertions.Assert
        (Scanned_Tonight.Status = Humanize.Status.Ok
         and then Scanned_Tonight.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 21.0 * 3_600.0)
         and then Scanned_Tonight.Consumed = 7,
         "scan tonight");
      AUnit.Assertions.Assert
        (Scanned_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Scanned_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0)
         and then Scanned_Fri_Afternoon.Consumed = 21,
         "scan natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Value = Ref_Date + 3.0 * 86_400.0
         and then Scanned_Date.Consumed = 9,
         "scan natural date");
      AUnit.Assertions.Assert
        (ISO_Date.Status = Humanize.Status.Ok
         and then ISO_Date.Value = Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO natural date");
      AUnit.Assertions.Assert
        (Month_Name.Status = Humanize.Status.Ok
         and then Month_Name.Value = Ada.Calendar.Time_Of (2024, 2, 2, 0.0),
         "parse month-name natural date");
      AUnit.Assertions.Assert
        (Month_Day_Ordinal.Status = Humanize.Status.Ok
         and then Month_Day_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse month-day ordinal date");
      AUnit.Assertions.Assert
        (Weekday_Ordinal.Status = Humanize.Status.Ok
         and then Weekday_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse weekday ordinal date");
      AUnit.Assertions.Assert
        (Scanned_Month_Day_Ordinal.Status = Humanize.Status.Ok
         and then Scanned_Month_Day_Ordinal.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0)
         and then Scanned_Month_Day_Ordinal.Consumed = 7,
         "scan month-day ordinal date");
      AUnit.Assertions.Assert
        (In_Weeks.Status = Humanize.Status.Ok
         and then In_Weeks.Value = Ref_Date + 14.0 * 86_400.0,
         "parse relative weeks");
      AUnit.Assertions.Assert
        (Month_Ago.Status = Humanize.Status.Ok
         and then Month_Ago.Value = Ada.Calendar.Time_Of (2023, 12, 1, 0.0),
         "parse relative months ago");
      AUnit.Assertions.Assert
        (This_Fri.Status = Humanize.Status.Ok
         and then This_Fri.Value = Ref_Date + 4.0 * 86_400.0,
         "parse this weekday");
      AUnit.Assertions.Assert
        (Last_Fri.Status = Humanize.Status.Ok
         and then Last_Fri.Value = Ref_Date - 3.0 * 86_400.0,
         "parse last weekday");
      AUnit.Assertions.Assert
        (Two_Fridays.Status = Humanize.Status.Ok
         and then Two_Fridays.Value = Ref_Date + 11.0 * 86_400.0,
         "parse repeated weekday from now");
      AUnit.Assertions.Assert
        (End_Next_Month.Status = Humanize.Status.Ok
         and then End_Next_Month.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse end of next month");
      AUnit.Assertions.Assert
        (Start_Q3.Status = Humanize.Status.Ok
         and then Start_Q3.Value = Ada.Calendar.Time_Of (2024, 7, 1, 0.0),
         "parse start of quarter");
      AUnit.Assertions.Assert
        (End_Next_Quarter.Status = Humanize.Status.Ok
         and then End_Next_Quarter.Value =
           Ada.Calendar.Time_Of (2024, 6, 30, 0.0),
         "parse end of next quarter");
      AUnit.Assertions.Assert
        (Second_Tuesday_March.Status = Humanize.Status.Ok
         and then Second_Tuesday_March.Value =
           Ada.Calendar.Time_Of (2024, 3, 12, 0.0),
         "parse ordinal weekday in month");
      AUnit.Assertions.Assert
        (Last_Friday_March_2024.Status = Humanize.Status.Ok
         and then Last_Friday_March_2024.Value =
           Ada.Calendar.Time_Of (2024, 3, 29, 0.0),
         "parse last weekday in explicit month");
      AUnit.Assertions.Assert
        (Next_Business.Status = Humanize.Status.Ok
         and then Next_Business.Value = Ref_Date + 86_400.0,
         "parse next business day");
      AUnit.Assertions.Assert
        (Three_Business.Status = Humanize.Status.Ok
         and then Three_Business.Value = Ref_Date + 3.0 * 86_400.0,
         "parse business days from now");
      AUnit.Assertions.Assert
        (Before_Month_End.Status = Humanize.Status.Ok
         and then Before_Month_End.Value =
           Ada.Calendar.Time_Of (2024, 1, 29, 0.0),
         "parse business days before month end");
      AUnit.Assertions.Assert
        (Before_Next_Quarter_End.Status = Humanize.Status.Ok
         and then Before_Next_Quarter_End.Value =
           Ada.Calendar.Time_Of (2024, 6, 27, 0.0),
         "parse business days before next quarter end");
      AUnit.Assertions.Assert
        (Rule_Next_Business.Status = Humanize.Status.Ok
         and then Rule_Next_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse next business day with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Three_Business.Status = Humanize.Status.Ok
         and then Rule_Three_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 0.0),
         "parse business days from now with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Before_Month_End.Status = Humanize.Status.Ok
         and then Rule_Before_Month_End.Value =
           Ada.Calendar.Time_Of (2024, 1, 29, 0.0),
         "parse business days before boundary with rules");
      AUnit.Assertions.Assert
        (Rule_Last_Business.Status = Humanize.Status.Ok
         and then Rule_Last_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse previous business day with one-off holiday rules");
      AUnit.Assertions.Assert
        (Rule_Recurring_Business.Status = Humanize.Status.Ok
         and then Rule_Recurring_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse next business day with recurring holiday rules");
      AUnit.Assertions.Assert
        (Rule_Shutdown_Business.Status = Humanize.Status.Ok
         and then Rule_Shutdown_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 4, 0.0),
         "parse next business day with shutdown rules");
      AUnit.Assertions.Assert
        (Rule_Scanned_Business.Status = Humanize.Status.Ok
         and then Rule_Scanned_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0)
         and then Rule_Scanned_Business.Consumed = 17,
         "scan business day with business calendar rules");
      AUnit.Assertions.Assert
        (Rule_Range_Business.Status = Humanize.Status.Ok
         and then Rule_Range_Business.Low =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0)
         and then Rule_Range_Business.High =
           Ada.Calendar.Time_Of (2024, 1, 3, 0.0),
         "parse nested business date range with business calendar rules");
      AUnit.Assertions.Assert
        (Week_32_Start.Status = Humanize.Status.Ok
         and then Week_32_Start.Value =
           Ada.Calendar.Time_Of (2024, 8, 5, 0.0),
         "parse week-number start");
      AUnit.Assertions.Assert
        (This_Week.Status = Humanize.Status.Ok
         and then This_Week.Low = Ref_Date
         and then This_Week.High = Ref_Date + 7.0 * 86_400.0,
         "parse this week range");
      AUnit.Assertions.Assert
        (Next_Two_Weeks.Status = Humanize.Status.Ok
         and then Next_Two_Weeks.Low = Ref_Date
         and then Next_Two_Weeks.High = Ref_Date + 14.0 * 86_400.0,
         "parse next two weeks range");
      AUnit.Assertions.Assert
        (Last_Three_Months.Status = Humanize.Status.Ok
         and then Last_Three_Months.Low =
           Ada.Calendar.Time_Of (2023, 10, 1, 0.0)
         and then Last_Three_Months.High = Ref_Date,
         "parse last three months range");
      AUnit.Assertions.Assert
        (Q3_Range.Status = Humanize.Status.Ok
         and then Q3_Range.Low = Ada.Calendar.Time_Of (2024, 7, 1, 0.0)
         and then Q3_Range.High = Ada.Calendar.Time_Of (2024, 10, 1, 0.0),
         "parse quarter range");
      AUnit.Assertions.Assert
        (Fiscal_Q2.Status = Humanize.Status.Ok
         and then Fiscal_Q2.Low = Ada.Calendar.Time_Of (2025, 4, 1, 0.0)
         and then Fiscal_Q2.High = Ada.Calendar.Time_Of (2025, 7, 1, 0.0),
         "parse fiscal quarter label range");
      AUnit.Assertions.Assert
        (Fiscal_Year.Status = Humanize.Status.Ok
         and then Fiscal_Year.Low = Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Fiscal_Year.High = Ada.Calendar.Time_Of (2028, 1, 1, 0.0),
         "parse fiscal year label range");
      AUnit.Assertions.Assert
        (Fiscal_Half.Status = Humanize.Status.Ok
         and then Fiscal_Half.Low = Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Fiscal_Half.High = Ada.Calendar.Time_Of (2027, 7, 1, 0.0),
         "parse fiscal half label range");
      AUnit.Assertions.Assert
        (Semester_2.Status = Humanize.Status.Ok
         and then Semester_2.Low = Ada.Calendar.Time_Of (2026, 7, 1, 0.0)
         and then Semester_2.High = Ada.Calendar.Time_Of (2027, 1, 1, 0.0),
         "parse semester label range");
      AUnit.Assertions.Assert
        (Half_Year_2.Status = Humanize.Status.Ok
         and then Half_Year_2.Low = Ada.Calendar.Time_Of (2026, 7, 1, 0.0)
         and then Half_Year_2.High = Ada.Calendar.Time_Of (2027, 1, 1, 0.0),
         "parse half-year label range");
      AUnit.Assertions.Assert
        (Scanned_Fiscal_Half.Status = Humanize.Status.Ok
         and then Scanned_Fiscal_Half.Low =
           Ada.Calendar.Time_Of (2027, 1, 1, 0.0)
         and then Scanned_Fiscal_Half.High =
           Ada.Calendar.Time_Of (2027, 7, 1, 0.0)
         and then Scanned_Fiscal_Half.Consumed = 9,
         "scan fiscal half label range");
      AUnit.Assertions.Assert
        (Early_Next_Week.Status = Humanize.Status.Ok
         and then Early_Next_Week.Low =
           Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Early_Next_Week.High =
           Ada.Calendar.Time_Of (2024, 1, 11, 0.0),
         "parse early next week range");
      AUnit.Assertions.Assert
        (Mid_March.Status = Humanize.Status.Ok
         and then Mid_March.Low =
           Ada.Calendar.Time_Of (2024, 3, 12, 0.0)
         and then Mid_March.High =
           Ada.Calendar.Time_Of (2024, 3, 22, 0.0),
         "parse mid-month range");
      AUnit.Assertions.Assert
        (Late_Q2.Status = Humanize.Status.Ok
         and then Late_Q2.Low =
           Ada.Calendar.Time_Of (2024, 6, 1, 0.0)
         and then Late_Q2.High =
           Ada.Calendar.Time_Of (2024, 7, 1, 0.0),
         "parse late quarter range");
      AUnit.Assertions.Assert
        (First_Half_2026.Status = Humanize.Status.Ok
         and then First_Half_2026.Low =
           Ada.Calendar.Time_Of (2026, 1, 1, 0.0)
         and then First_Half_2026.High =
           Ada.Calendar.Time_Of (2026, 7, 1, 0.0),
         "parse first half phrase range");
      AUnit.Assertions.Assert
        (End_FY2027.Status = Humanize.Status.Ok
         and then End_FY2027.Value =
           Ada.Calendar.Time_Of (2027, 12, 31, 0.0),
         "parse fiscal year end boundary");
      AUnit.Assertions.Assert
        (Week_32_Range.Status = Humanize.Status.Ok
         and then Week_32_Range.Low = Ada.Calendar.Time_Of (2024, 8, 5, 0.0)
         and then Week_32_Range.High = Ada.Calendar.Time_Of (2024, 8, 12, 0.0),
         "parse week-number range");
      AUnit.Assertions.Assert
        (This_Weekend.Status = Humanize.Status.Ok
         and then This_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 6, 0.0)
         and then This_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 8, 0.0),
         "parse this weekend range");
      AUnit.Assertions.Assert
        (Next_Weekend.Status = Humanize.Status.Ok
         and then Next_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 13, 0.0)
         and then Next_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse next weekend range");
      AUnit.Assertions.Assert
        (Last_Weekend.Status = Humanize.Status.Ok
         and then Last_Weekend.Low = Ada.Calendar.Time_Of (2023, 12, 30, 0.0)
         and then Last_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse last weekend range");
      AUnit.Assertions.Assert
        (Scanned_Weekend.Status = Humanize.Status.Ok
         and then Scanned_Weekend.Low = Ada.Calendar.Time_Of (2024, 1, 6, 0.0)
         and then Scanned_Weekend.High = Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Scanned_Weekend.Consumed = 12,
         "scan weekend range");
      AUnit.Assertions.Assert
        (Between_Dates.Status = Humanize.Status.Ok
         and then Between_Dates.Low = Ref_Date
         and then Between_Dates.High = Ref_Date + 4.0 * 86_400.0,
         "parse between natural date range");
      AUnit.Assertions.Assert
        (Scanned_Range_Date.Status = Humanize.Status.Ok
         and then Scanned_Range_Date.Consumed = 12
         and then Scanned_Range_Date.High = Ref_Date + 14.0 * 86_400.0,
         "scan natural date range");
      AUnit.Assertions.Assert
        (One_Off_Holiday.Status = Humanize.Status.Ok
         and then One_Off_Holiday.Kind =
           Humanize.Parsing.Business_One_Off_Holiday
         and then One_Off_Holiday.Date =
           Ada.Calendar.Time_Of (2026, 7, 6, 0.0),
         "parse one-off business holiday");
      AUnit.Assertions.Assert
        (Recurring_Holiday.Status = Humanize.Status.Ok
         and then Recurring_Holiday.Kind =
           Humanize.Parsing.Business_Recurring_Holiday
         and then Recurring_Holiday.Month = 12
         and then Recurring_Holiday.Day = 25,
         "parse recurring business holiday");
      AUnit.Assertions.Assert
        (Half_Day.Status = Humanize.Status.Ok
         and then Half_Day.Kind = Humanize.Parsing.Business_Half_Day
         and then Half_Day.Date = Ada.Calendar.Time_Of (2026, 12, 24, 0.0)
         and then Half_Day.End_Hour = 12,
         "parse business half-day");
      AUnit.Assertions.Assert
        (Shutdown.Status = Humanize.Status.Ok
         and then Shutdown.Kind = Humanize.Parsing.Business_Shutdown
         and then Shutdown.Date = Ada.Calendar.Time_Of (2026, 12, 24, 0.0)
         and then Shutdown.End_Date =
           Ada.Calendar.Time_Of (2026, 12, 31, 0.0),
         "parse business shutdown");
      AUnit.Assertions.Assert
        (Business_Hours.Status = Humanize.Status.Ok
         and then Business_Hours.Kind = Humanize.Parsing.Business_Hour_Range
         and then Business_Hours.Weekday = 1
         and then Business_Hours.Start_Hour = 9
         and then Business_Hours.End_Hour = 17,
         "parse business hour range");
      AUnit.Assertions.Assert
        (Next_Open.Status = Humanize.Status.Ok
         and then Next_Open.Kind = Humanize.Parsing.Business_Next_Open_Hour
         and then Next_Open.Date = Ada.Calendar.Time_Of (2026, 7, 6, 0.0)
         and then Next_Open.Start_Hour = 9
         and then Next_Open.End_Hour = 10,
         "parse next open business hour");
      AUnit.Assertions.Assert
        (Scanned_Business_Calendar.Status = Humanize.Status.Ok
         and then Scanned_Business_Calendar.Kind =
           Humanize.Parsing.Business_Hour_Range
         and then Scanned_Business_Calendar.Weekday = 5
         and then Scanned_Business_Calendar.Start_Hour = 10
         and then Scanned_Business_Calendar.End_Hour = 15
         and then Scanned_Business_Calendar.Consumed = 27,
         "scan business calendar phrase");
      AUnit.Assertions.Assert
        (Parsed_Rules.Status = Humanize.Status.Ok
         and then Parsed_Rules.Rules.Recurring_Holiday_Count = 1
         and then Parsed_Rules.Rules.Half_Day_Count = 1
         and then Parsed_Rules.Rules.Shutdown_Count = 1
         and then Parsed_Rules.Rules.Options.Weekday_Hours.Monday_Start = 8
         and then Parsed_Rules.Rules.Options.Weekday_Hours.Monday_End = 16,
         "parse executable business calendar rules");
      AUnit.Assertions.Assert
        (Rules_Result = Ada.Calendar.Time_Of (2026, 12, 30, 10.0 * 3_600.0),
         "apply parsed business calendar rules to business-hour arithmetic");
   end Test_Frequency_Rate_List;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize parsing tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Bytes'Access, "parse byte sizes");
      Register_Routine (T, Test_Durations'Access, "parse durations");
      Register_Routine (T, Test_Compact'Access, "parse compact numbers");
      Register_Routine (T, Test_Round_Trip_Parsers'Access,
        "parse formatter round trips");
      Register_Routine (T, Test_Diagnostics'Access, "parser diagnostics");
      Register_Routine (T, Test_Frequency_Rate_List'Access,
        "parse frequencies rates and lists");
   end Register_Tests;

end Humanize.Tests.Parsing;
