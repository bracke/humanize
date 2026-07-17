with AUnit.Assertions;

with Ada.Calendar;
with Ada.Strings.Unbounded;

with Humanize.Bytes;
with Humanize.Colors;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Frequencies;
with Humanize.Lists;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Parsing;
with Humanize.Phrases;
with Humanize.Rates;
with Humanize.Status;
with Humanize.Strings;
with Humanize.Tests.Support;
with Humanize.Units;
with Ada.Calendar.Formatting;

package body Humanize.Tests.Parsing is
   use Ada.Strings.Unbounded;
   use type Humanize.Bytes.Byte_Count;
   use type Humanize.Colors.RGB_Color;
   use type Humanize.Colors.Color_Vision_Deficiency;
   use type Humanize.Durations.Duration_Microseconds;
   use type Humanize.Durations.Duration_Seconds;
   use type Humanize.Durations.Recurrence_Unit;
   use type Humanize.Durations.Weekday_Set;
   use type Humanize.Frequencies.Occurrence_Count;
   use type Humanize.Numbers.Approximation_Kind;
   use type Humanize.Numbers.Uncertainty_Style;
   use type Humanize.Parsing.Business_Calendar_Parse_Kind;
   use type Humanize.Parsing.Collection_Display_Kind;
   use type Humanize.Parsing.Comparison_Direction;
   use type Humanize.Parsing.Field_State_Change_Kind;
   use type Humanize.Parsing.Operational_Phrase_Domain;
   use type Humanize.Parsing.Parse_Error_Kind;
   use type Humanize.Parsing.Recurrence_Parse_Kind;
   use type Humanize.Parsing.Selection_Summary_Kind;
   use type Humanize.Parsing.Validation_Severity_Label;
   use type Humanize.Phrases.Phrase_Severity;
   use type Humanize.Phrases.Phrase_Tone;
   use type Humanize.Phrases.Backup_Status;
   use type Humanize.Phrases.Incident_Status;
   use type Humanize.Phrases.Payment_Lifecycle_Status;
   use type Humanize.Phrases.Audit_Status;
   use type Humanize.Phrases.Feature_Flag_Status;
   use type Humanize.Phrases.Webhook_Status;
   use type Humanize.Phrases.API_Key_Status;
   use type Humanize.Phrases.Quota_Status;
   use type Humanize.Phrases.Invoice_Status;
   use type Humanize.Phrases.Database_Status;
   use type Humanize.Phrases.Summary_Domain;
   use type Humanize.Phrases.Summary_State;
   use type Humanize.Rates.Rate_Period;
   use type Humanize.Status.Status_Code;
   use type Humanize.Strings.File_Mode_Kind;
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
      ISO_Mixed : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("P1Y2M3DT4H5M6S");
      ISO_Weeks : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("P2W");
      ISO_Fractional : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Duration ("PT1.5S");
      Scanned_ISO : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Duration ("PT1H30M; cached");
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
      Lenient_Couple : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("a couple of days");
      Fortnight : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Parse_Lenient_Duration ("a fortnight");
      Scanned_Lenient : constant Humanize.Parsing.Duration_Parse_Result :=
        Humanize.Parsing.Scan_Lenient_Duration ("~2m; cached");
      Precise : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Parse_Precise_Duration
          ("1 second and 500 milliseconds");
      Precise_ISO : constant Humanize.Parsing.Precise_Duration_Parse_Result :=
        Humanize.Parsing.Parse_Precise_Duration ("PT1.5S");
      Scanned_Precise_ISO : constant
        Humanize.Parsing.Precise_Duration_Parse_Result :=
          Humanize.Parsing.Scan_Precise_Duration ("PT1.25S; cached");
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
        (ISO_Mixed.Status = Humanize.Status.Ok
         and then ISO_Mixed.Value =
           Humanize.Durations.Duration_Seconds
             ((365 + 60 + 3) * 86_400 + 4 * 3_600 + 5 * 60 + 6),
         "parse ISO mixed duration");
      AUnit.Assertions.Assert
        (ISO_Weeks.Status = Humanize.Status.Ok
         and then ISO_Weeks.Value =
           Humanize.Durations.Duration_Seconds (14 * 86_400),
         "parse ISO week duration");
      AUnit.Assertions.Assert
        (ISO_Fractional.Status = Humanize.Status.Ok
         and then ISO_Fractional.Value = 2,
         "parse ISO fractional duration");
      AUnit.Assertions.Assert
        (Scanned_ISO.Status = Humanize.Status.Ok
         and then Scanned_ISO.Value = 5_400
         and then Scanned_ISO.Consumed = 7,
         "scan ISO duration");
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
        (Fortnight.Status = Humanize.Status.Ok
         and then Fortnight.Value = 14 * 86_400,
         "parse fortnight duration");
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
        (Precise_ISO.Status = Humanize.Status.Ok
         and then Precise_ISO.Value = 1_500_000,
         "parse precise ISO duration");
      AUnit.Assertions.Assert
        (Scanned_Precise_ISO.Status = Humanize.Status.Ok
         and then Scanned_Precise_ISO.Value = 1_250_000
         and then Scanned_Precise_ISO.Consumed = 7,
         "scan precise ISO duration");
      AUnit.Assertions.Assert
        (Lenient_Couple.Status = Humanize.Status.Ok
         and then Lenient_Couple.Value = 172_800,
         "parse couple duration idiom");
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
      Prefix_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD 12.5");
      Attached_Prefix_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD12.5");
      Symbol_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$ 12.5");
      Attached_Symbol_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$12.5");
      Scan_Currency : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Scan_Currency ("$20");
      Currency_Missing_Code : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5");
      Currency_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("12.5 USD now");
      Prefix_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("USD 12.5 now");
      Symbol_With_Trailing_Text : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency ("$ 12.5 now");
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
      Palette_Metadata : constant
        Humanize.Parsing.Palette_Metadata_Parse_Result :=
          Humanize.Parsing.Parse_Palette_Metadata_Label
            ("3 colors, 3 pairs: 1 enhanced, 1 normal, 1 large-only, 0 fail");
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
      Localized_Color_Bucket : constant
        Humanize.Parsing.Color_Bucket_Label_Parse_Result :=
          Humanize.Parsing.Parse_Color_Bucket_Label ("mittleres Chroma");
      Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dark, muted blue, cool, moderate chroma");
      Localized_Color_Description : constant
        Humanize.Parsing.Color_Description_Parse_Result :=
          Humanize.Parsing.Parse_Color_Description
            ("dunkel, gedaempft blau, kuehl, mittleres Chroma");
      Localized_Accessibility : constant
        Humanize.Parsing.Color_Accessibility_Parse_Result :=
          Humanize.Parsing.Parse_Color_Accessibility_Summary
            ("21:1 erhoehter Kontrast; Lc 100, excellent, "
             & "dark text on light background; protanopia distinct");
      Alpha_Contrast : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Alpha_Contrast_Label
            ("3.9:1 large-text contrast after alpha compositing");
      Remediation_Pass : constant
        Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label
            ("current foreground meets normal text contrast at 21:1");
      Remediation_Use : constant
        Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label
            ("use #767676 for 4.5:1 normal text contrast");
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
      CIEDE2000_Difference : constant
        Humanize.Parsing.Color_Difference_Label_Parse_Result :=
          Humanize.Parsing.Parse_Perceptual_Difference_Label
            ("CIEDE2000 delta 12.5, noticeable perceptual difference");
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
      Symbolic_Mode : constant Humanize.Parsing.File_Mode_Parse_Result :=
        Humanize.Parsing.Parse_File_Mode_Label ("-rwsr-xr-x");
      Octal_Mode : constant Humanize.Parsing.File_Mode_Parse_Result :=
        Humanize.Parsing.Parse_File_Mode_Label ("0755");
      Bad_File_Mode : constant Humanize.Parsing.File_Mode_Parse_Result :=
        Humanize.Parsing.Parse_File_Mode_Label ("rwxr-xr-q");
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
             & "backup incident release audit flag webhook api_key quota "
             & "invoice database "
             & "summaries comparisons");
      Phrase_Locales_Text : constant Humanize.Status.Text_Result :=
        Humanize.Phrases.Supported_Phrase_Locales;
      Phrase_Locales : constant
        Humanize.Parsing.Phrase_Locales_Parse_Result :=
          Humanize.Parsing.Parse_Supported_Phrase_Locales
            (Support.Text (Phrase_Locales_Text));
      Invalid_Phrase_Locales : constant
        Humanize.Parsing.Phrase_Locales_Parse_Result :=
          Humanize.Parsing.Parse_Supported_Phrase_Locales ("en ro");
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
           "USD"
         and then Approx_Currency.Approximate
         and then Approx_Currency.Kind = Humanize.Numbers.Under,
         "parse approximate currency output");
      AUnit.Assertions.Assert
        (Prefix_Currency.Status = Humanize.Status.Ok
         and then Prefix_Currency.Amount = 12.5
         and then Prefix_Currency.Code (1 .. Prefix_Currency.Code_Length) = "USD",
         "parse currency prefix format");
      AUnit.Assertions.Assert
        (Prefix_Currency.Consumed = 8,
         "parse currency prefix consumed length");
      AUnit.Assertions.Assert
        (Attached_Prefix_Currency.Status = Humanize.Status.Ok
         and then Attached_Prefix_Currency.Amount = 12.5
         and then Attached_Prefix_Currency.Code
           (1 .. Attached_Prefix_Currency.Code_Length) = "USD",
         "parse currency prefix-attached format");
      AUnit.Assertions.Assert
        (Symbol_Currency.Status = Humanize.Status.Ok
         and then Symbol_Currency.Amount = 12.5
         and then Symbol_Currency.Code (1 .. Symbol_Currency.Code_Length) = "USD"
         and then Symbol_Currency.Consumed = 6,
         "parse currency symbol format");
      AUnit.Assertions.Assert
        (Attached_Symbol_Currency.Status = Humanize.Status.Ok
         and then Attached_Symbol_Currency.Amount = 12.5
         and then Attached_Symbol_Currency.Code
           (1 .. Attached_Symbol_Currency.Code_Length) = "USD",
         "parse currency symbol-attached format");
      AUnit.Assertions.Assert
        (Scan_Currency.Status = Humanize.Status.Ok
         and then Scan_Currency.Amount = 20.0
         and then Scan_Currency.Code (1 .. Scan_Currency.Code_Length) = "USD"
         and then Scan_Currency.Consumed = 3,
         "scan currency output");
      AUnit.Assertions.Assert
        (Currency_Missing_Code.Status = Humanize.Status.Invalid_Argument,
         "reject currency without code");
      AUnit.Assertions.Assert
        (Currency_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (number-first)");
      AUnit.Assertions.Assert
        (Prefix_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (prefix-first)");
      AUnit.Assertions.Assert
        (Symbol_With_Trailing_Text.Status = Humanize.Status.Invalid_Argument,
         "reject currency with trailing text (symbol)");
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
        (Palette_Metadata.Status = Humanize.Status.Ok
         and then Palette_Metadata.Color_Count = 3
         and then Palette_Metadata.Pair_Count = 3
         and then Palette_Metadata.Enhanced = 1
         and then Palette_Metadata.Normal = 1
         and then Palette_Metadata.Large_Only = 1
         and then Palette_Metadata.Fail = 0,
         "parse palette metadata label output");
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
        (Localized_Color_Bucket.Status = Humanize.Status.Ok
         and then Localized_Color_Bucket.Label
           (1 .. Localized_Color_Bucket.Label_Length) = "mittleres chroma",
         "parse localized color bucket label output");
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
        (Localized_Color_Description.Status = Humanize.Status.Ok
         and then Localized_Color_Description.Brightness
           (1 .. Localized_Color_Description.Brightness_Length) = "dunkel"
         and then Localized_Color_Description.Saturation
           (1 .. Localized_Color_Description.Saturation_Length) = "gedaempft"
         and then Localized_Color_Description.Hue
           (1 .. Localized_Color_Description.Hue_Length) = "blau"
         and then Localized_Color_Description.Temperature
           (1 .. Localized_Color_Description.Temperature_Length) = "kuehl"
         and then Localized_Color_Description.Chroma
           (1 .. Localized_Color_Description.Chroma_Length) = "mittleres chroma",
         "parse localized color description output");
      AUnit.Assertions.Assert
        (Localized_Accessibility.Status = Humanize.Status.Ok
         and then Localized_Accessibility.Contrast_Ratio = 21.0
         and then Localized_Accessibility.Contrast_Level
           (1 .. Localized_Accessibility.Contrast_Level_Length)
           = "erhoehter Kontrast",
         "parse localized color accessibility summary output");
      AUnit.Assertions.Assert
        (Alpha_Contrast.Status = Humanize.Status.Ok
         and then Alpha_Contrast.Value = 3.9
         and then Alpha_Contrast.Label
           (1 .. Alpha_Contrast.Label_Length) = "large-text"
         and then not Alpha_Contrast.Perceptual,
         "parse alpha contrast label output");
      AUnit.Assertions.Assert
        (Remediation_Pass.Status = Humanize.Status.Ok
         and then Remediation_Pass.Already_Passes
         and then not Remediation_Pass.Has_Recommended_Color
         and then Remediation_Pass.Ratio = 21.0
         and then Remediation_Pass.Target
           (1 .. Remediation_Pass.Target_Length) = "normal text",
         "parse contrast remediation pass output");
      AUnit.Assertions.Assert
        (Remediation_Use.Status = Humanize.Status.Ok
         and then not Remediation_Use.Already_Passes
         and then Remediation_Use.Has_Recommended_Color
         and then Remediation_Use.Recommended_Color =
           (Red => 16#76#, Green => 16#76#, Blue => 16#76#)
         and then Remediation_Use.Ratio = 4.5
         and then Remediation_Use.Target
           (1 .. Remediation_Use.Target_Length) = "normal text",
         "parse contrast remediation suggestion output");
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
        (CIEDE2000_Difference.Status = Humanize.Status.Ok
         and then CIEDE2000_Difference.Value = 12.5
         and then CIEDE2000_Difference.Label
           (1 .. CIEDE2000_Difference.Label_Length) =
             "noticeable perceptual difference"
         and then CIEDE2000_Difference.Perceptual,
         "parse CIEDE2000 perceptual difference label output");
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
        (Symbolic_Mode.Status = Humanize.Status.Ok
         and then Symbolic_Mode.Mode = 8#4755#
         and then Symbolic_Mode.Kind = Humanize.Strings.Regular_File
         and then Symbolic_Mode.Symbolic
         and then not Symbolic_Mode.Octal,
         "parse symbolic file mode output");
      AUnit.Assertions.Assert
        (Octal_Mode.Status = Humanize.Status.Ok
         and then Octal_Mode.Mode = 8#0755#
         and then Octal_Mode.Kind = Humanize.Strings.Mode_Only
         and then Octal_Mode.Octal
         and then not Octal_Mode.Symbolic,
         "parse octal file mode output");
      AUnit.Assertions.Assert
        (Bad_File_Mode.Status = Humanize.Status.Invalid_Value
         and then Bad_File_Mode.Error_Position = 1
         and then Bad_File_Mode.Error = Humanize.Parsing.Expected_Number,
         "parse invalid file mode diagnostic");
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
         and then Phrase_Packs.Pack_Count = 36
         and then Phrase_Packs.Has_Summaries
         and then Phrase_Packs.Has_Comparisons,
         "parse phrase pack summary output");
      AUnit.Assertions.Assert
        (Phrase_Locales.Status = Humanize.Status.Ok
         and then Phrase_Locales.Locale_Count =
           Humanize.Phrases.Phrase_Locale_Count
         and then Phrase_Locales.Has_Generated_Locales,
         "parse supported phrase locales output");
      AUnit.Assertions.Assert
        (Invalid_Phrase_Locales.Status = Humanize.Status.Invalid_Argument
         and then Invalid_Phrase_Locales.Error =
           Humanize.Parsing.Unsupported_Form
         and then Invalid_Phrase_Locales.Error_Position = 4,
         "parse unsupported phrase locale output");
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

   procedure Test_Localized_Render_Parse_Roundtrips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      type Integer_Value_List is array (Positive range <>)
        of Long_Long_Integer;
      type Natural_Value_List is array (Positive range <>) of Natural;

      Cardinal_Values : constant Integer_Value_List :=
        [-42, 0, 1, 5, 21, 42, 342, 2_345, 1_200_000];
      Ordinal_Values : constant Natural_Value_List :=
        [0, 1, 2, 12, 21, 42, 121, 2_345];

      procedure Check_Cardinal
        (Locale : String;
         Value  : Long_Long_Integer)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Locale_Cardinal
             (Humanize.Tests.Support.Locale (Locale), Value);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Cardinal (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " cardinal render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Value
            and then Parsed.Consumed = Text'Length,
            Locale & " localized cardinal round trip: " & Text);
      end Check_Cardinal;

      procedure Check_Ordinal
        (Locale : String;
         Value  : Natural)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Ordinal_Words
             (Humanize.Tests.Support.Locale (Locale), Value);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Ordinal (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " ordinal render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Long_Long_Integer (Value)
            and then Parsed.Consumed = Text'Length,
            Locale & " localized ordinal round trip: " & Text);
      end Check_Ordinal;

      procedure Check_Unit
        (Locale : String;
         Unit   : Humanize.Units.Unit_Kind)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Units.Format
             (Humanize.Tests.Support.Locale (Locale), 5, Unit);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Unit_Parse_Result :=
           Humanize.Parsing.Parse_Unit (Text);

         function Equivalent_Unit return Boolean is
         begin
            return Parsed.Unit = Unit
              or else
                ((Unit = Humanize.Units.Ton
                  or else Unit = Humanize.Units.Tonne)
                 and then
                   (Parsed.Unit = Humanize.Units.Ton
                    or else Parsed.Unit = Humanize.Units.Tonne));
         end Equivalent_Unit;
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " unit render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Equivalent_Unit
            and then Parsed.Consumed = Text'Length,
            Locale & " localized unit round trip: " & Text);
      end Check_Unit;

      procedure Check_Duration
        (Locale  : String;
         Seconds : Humanize.Durations.Duration_Seconds)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Durations.Format
             (Humanize.Tests.Support.Locale (Locale), Seconds);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Duration_Parse_Result :=
           Humanize.Parsing.Parse_Duration (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " duration render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Seconds
            and then Parsed.Consumed = Text'Length,
            Locale & " localized duration round trip: " & Text);
      end Check_Duration;

      procedure Check_Bytes
        (Locale : String;
         Bytes  : Humanize.Bytes.Byte_Count)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Bytes.Format
             (Humanize.Tests.Support.Locale (Locale), Bytes);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Byte_Parse_Result :=
           Humanize.Parsing.Parse_Bytes (Text);
      begin
         AUnit.Assertions.Assert
           (Rendered.Status = Humanize.Status.Ok,
            Locale & " bytes render status");
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Bytes
            and then Parsed.Consumed = Text'Length,
            Locale & " localized byte round trip: " & Text);
      end Check_Bytes;
   begin
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Name : constant String := Locale_Access.all;
         begin
            for Value of Cardinal_Values loop
               Check_Cardinal (Name, Value);
            end loop;

            for Value of Ordinal_Values loop
               Check_Ordinal (Name, Value);
            end loop;

            Check_Bytes (Name, 1);
            Check_Bytes (Name, 1_536);

            Check_Duration (Name, 2);
            Check_Duration (Name, 120);
            Check_Duration (Name, 7_200);
            Check_Duration (Name, 172_800);
            Check_Duration (Name, 1_209_600);
            Check_Duration (Name, 5_184_000);
            Check_Duration (Name, 63_072_000);

            for Unit in Humanize.Units.Unit_Kind loop
               Check_Unit (Name, Unit);
            end loop;
         end;
      end loop;
   end Test_Localized_Render_Parse_Roundtrips;

   procedure Test_Localized_Semantic_Parse_Roundtrips
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 3, 21, 12.0 * 3_600.0);
      Today : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 21, others => 0);
      Tomorrow : constant Humanize.Datetimes.Civil_Date_Time :=
        (Year => 2026, Month => 3, Day => 22, others => 0);

      procedure Check_Compact
        (Locale : String;
         Value  : Long_Long_Integer)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Compact
             (Humanize.Tests.Support.Locale (Locale), Value);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Compact_Number (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = Value,
            Locale & " localized compact round trip: " & Text);
      end Check_Compact;

      procedure Check_Percent (Locale : String) is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Numbers.Percent
             (Humanize.Tests.Support.Locale (Locale), 12.0);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Percent (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Value = 12,
            Locale & " localized percent round trip: " & Text);
      end Check_Percent;

      procedure Check_Frequency
        (Locale : String;
         Count  : Humanize.Frequencies.Occurrence_Count)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Frequencies.Times
             (Humanize.Tests.Support.Locale (Locale), Count);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Frequency_Parse_Result :=
           Humanize.Parsing.Parse_Frequency (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Count = Count,
            Locale & " localized frequency round trip: " & Text);
      end Check_Frequency;

      procedure Check_Rate
        (Locale    : String;
         Count     : Humanize.Frequencies.Occurrence_Count;
         Less_Than : Boolean := False)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Rates.Pace_Approximate
             (Humanize.Tests.Support.Locale (Locale), Count,
              Humanize.Rates.Per_Week);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Rate_Parse_Result :=
           Humanize.Parsing.Parse_Rate (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Period = Humanize.Rates.Per_Week
            and then Parsed.Less_Than = Less_Than
            and then
              (if Less_Than then Parsed.Count = 1 else Parsed.Count = Count),
            Locale & " localized rate round trip: " & Text);
      end Check_Rate;

      procedure Check_List (Locale : String) is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Lists.Format
             (Humanize.Tests.Support.Locale (Locale),
              [1 => To_Unbounded_String ("alpha"),
               2 => To_Unbounded_String ("beta"),
               3 => To_Unbounded_String ("gamma")]);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.List_Parse_Result :=
           Humanize.Parsing.Parse_List (Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Parsed.Count = 3,
            Locale & " localized list round trip: " & Text);
      end Check_List;

      procedure Check_Natural_Day
        (Locale : String;
         Day    : Humanize.Datetimes.Civil_Date_Time;
         Offset : Integer)
      is
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Datetimes.Natural_Day
             (Humanize.Tests.Support.Locale (Locale), Day, Today);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Date_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date (Reference, Text);
         Expected : constant Ada.Calendar.Time :=
           Reference + Standard.Duration (Offset * 86_400);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Ada.Calendar.Year (Parsed.Value) =
              Ada.Calendar.Year (Expected)
            and then Ada.Calendar.Month (Parsed.Value) =
              Ada.Calendar.Month (Expected)
            and then Ada.Calendar.Day (Parsed.Value) =
              Ada.Calendar.Day (Expected),
            Locale & " localized natural day round trip: " & Text);
      end Check_Natural_Day;

      procedure Check_Relative_Day
        (Locale : String;
         Offset : Integer)
      is
         Target : constant Ada.Calendar.Time :=
           Reference + Standard.Duration (Offset * 86_400);
         Rendered : constant Humanize.Status.Text_Result :=
           Humanize.Datetimes.Relative
             (Humanize.Tests.Support.Locale (Locale), Target, Reference);
         Text : constant String := Humanize.Tests.Support.Text (Rendered);
         Parsed : constant Humanize.Parsing.Date_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date (Reference, Text);
      begin
         AUnit.Assertions.Assert
           (Parsed.Status = Humanize.Status.Ok
            and then Ada.Calendar.Year (Parsed.Value) =
              Ada.Calendar.Year (Target)
            and then Ada.Calendar.Month (Parsed.Value) =
              Ada.Calendar.Month (Target)
            and then Ada.Calendar.Day (Parsed.Value) =
              Ada.Calendar.Day (Target),
            Locale & " localized relative day round trip: " & Text);
      end Check_Relative_Day;
   begin
      for Locale_Access of Humanize.Locales.Shipped_Locales loop
         declare
            Name : constant String := Locale_Access.all;
         begin
            Check_Compact (Name, 1_200);
            Check_Compact (Name, 1_200_000);
            Check_Percent (Name);
            Check_Frequency (Name, 0);
            Check_Frequency (Name, 1);
            Check_Frequency (Name, 2);
            Check_Frequency (Name, 4);
            Check_Rate (Name, 0, Less_Than => True);
            Check_Rate (Name, 4);
            Check_List (Name);
            Check_Natural_Day (Name, Today, 0);
            Check_Natural_Day (Name, Tomorrow, 1);
            Check_Relative_Day (Name, 3);
            Check_Relative_Day (Name, -3);
         end;
      end loop;
   end Test_Localized_Semantic_Parse_Roundtrips;

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
      Bad_Worded_Range :
        constant Humanize.Parsing.Decimal_Range_Parse_Result :=
          Humanize.Parsing.Parse_Decimal_Range_Words
            ("one point two three point four");
      Bad_Remediation :
        constant Humanize.Parsing.Contrast_Remediation_Parse_Result :=
          Humanize.Parsing.Parse_Contrast_Remediation_Label ("use nope");
      Bad_Timezone_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "tomorrow at 5pm XYZ");
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
      AUnit.Assertions.Assert
        (Bad_Worded_Range.Error = Humanize.Parsing.Expected_Separator
         and then Bad_Worded_Range.Error_Position > 0,
         "worded range separator diagnostic");
      AUnit.Assertions.Assert
        (Bad_Remediation.Error = Humanize.Parsing.Expected_Unit
         and then Bad_Remediation.Error_Position = 5,
         "contrast remediation diagnostic");
      AUnit.Assertions.Assert
        (Bad_Timezone_Name.Status = Humanize.Status.Invalid_Argument,
         "invalid timezone name diagnostic");
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
      German_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.De, 42)));
      Finnish_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("fi"), 2_345)));
      French_Large_Word_Cardinal :
        constant Humanize.Parsing.Number_Parse_Result :=
          Humanize.Parsing.Parse_Cardinal
            (Humanize.Tests.Support.Text
               (Humanize.Numbers.Locale_Cardinal
                  (Humanize.Tests.Support.Fr, 2_000_000_001)));
      Japanese_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("ja"), 2_345)));
      Korean_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("ko"), 2_345)));
      Chinese_Word_Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Cardinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Locale_Cardinal
                (Humanize.Tests.Support.Locale ("zh"), 2_345)));
      Polish_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("pl"), 121)));
      Polish_Thousands_Word_Ordinal :
        constant Humanize.Parsing.Number_Parse_Result :=
          Humanize.Parsing.Parse_Ordinal
            (Humanize.Tests.Support.Text
               (Humanize.Numbers.Ordinal_Words
                  (Humanize.Tests.Support.Locale ("pl"), 2_345)));
      Japanese_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("ja"), 12)));
      Korean_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("ko"), 12)));
      Chinese_Word_Ordinal : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Ordinal
          (Humanize.Tests.Support.Text
             (Humanize.Numbers.Ordinal_Words
                (Humanize.Tests.Support.Locale ("zh"), 12)));
      Japanese_Thousands_Word_Ordinal :
        constant Humanize.Parsing.Number_Parse_Result :=
          Humanize.Parsing.Parse_Ordinal
            (Humanize.Tests.Support.Text
               (Humanize.Numbers.Ordinal_Words
                  (Humanize.Tests.Support.Locale ("ja"), 2_345)));
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
      Weekday_Schedule : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every weekday at 09:00");
      First_Monday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "first Monday of each month at 9:30");
      Last_Business : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "last business day");
      Every_Last_Weekday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0), "every last weekday");
      Second_Business : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "second business day of each month at 10:15");
      Cron_Weekday : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("0 9 * * 1-5");
      Cron_Monthly : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("30 8 15 * *");
      Scanned_Cron : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Scan_Cron_Schedule ("0 9 * * 1-5; cached");
      Cron_Step_Minute : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("*/15 * * * *");
      Cron_Step_Hour : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("0 */2 * * *");
      Cron_Named_List : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("30 9 ? * mon,wed,fri");
      Cron_Yearly : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Cron_Schedule ("30 8 15 jan *");
      Italian_Ordinal_Schedule :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Recurrence_Detail
            (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
             "primo luned" & B ("C3AC") & " di ogni mese alle 09:30");
      Finnish_Rendered_Cron :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule
            ("p" & B ("C3A4") & "iv" & B ("C3A4")
             & " 15 joka kuukausi klo 08:30");
      Polish_Rendered_Cron :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule
            ("15. dzie" & B ("C584") & " ka" & B ("C5BC")
             & "dego miesi" & B ("C485") & "ca o 08:30");
      Cron_Quartz_Weekday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 ? * MON-FRI");
      Cron_Quartz_Year :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("30 15 8 15 JAN ? 2027");
      Cron_Last_Day :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 L * ?");
      Cron_Nearest_Weekday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 15W * ?");
      Cron_Last_Friday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 ? * 5L");
      Cron_Second_Monday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("0 0 9 ? * MON#2");
      Danish_Rendered_Weekday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Cron_Schedule ("hver hverdag kl. 09:00");
      Until_Weeks : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 2 weeks until 2026-12-31");
      Windowed : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 2 weeks from 2026-01-01 until 2026-12-31 for 5 times");
      Windowed_Time : constant Humanize.Parsing.Recurrence_Parse_Result :=
        Humanize.Parsing.Parse_Recurrence_Detail
          (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
           "every 15 minutes between 09:00 and 17:00");
      Weekday_Except_Friday :
        constant Humanize.Parsing.Recurrence_Parse_Result :=
          Humanize.Parsing.Parse_Recurrence_Detail
            (Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
             "every weekday except Friday");
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
      Decimal_Range : constant Humanize.Parsing.Decimal_Range_Parse_Result :=
        Humanize.Parsing.Parse_Decimal_Range ("1.25 to 3.5");
      Decimal_Range_Words :
        constant Humanize.Parsing.Decimal_Range_Parse_Result :=
          Humanize.Parsing.Parse_Decimal_Range_Words
            ("one point two five to three point five zero");
      Editorial_Number : constant Humanize.Parsing.Number_Parse_Result :=
        Humanize.Parsing.Parse_Editorial_Number ("1,200%");
      Currency_Words : constant Humanize.Parsing.Currency_Parse_Result :=
        Humanize.Parsing.Parse_Currency_Words
          ("twelve dollars and fifty cents");
      Fraction_Words : constant Humanize.Parsing.Proportion_Parse_Result :=
        Humanize.Parsing.Parse_Fraction_Words ("three quarters");
      Percent_Words : constant Humanize.Parsing.Float_Parse_Result :=
        Humanize.Parsing.Parse_Percent_Words ("twelve point five percent");
      Scanned_Decimal_Range :
        constant Humanize.Parsing.Decimal_Range_Parse_Result :=
          Humanize.Parsing.Scan_Decimal_Range ("1.25 to 3.5 measured");
      Operational_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup stale");
      Backup_Phrase_Case_Running :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup running");
      Backup_Phrase_Case_Completed :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup completed");
      Backup_Phrase_Case_Failed :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("backup failed");
      Payment_Authorized_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment authorized");
      Payment_Captured_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment captured");
      Payment_Refunded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment refunded");
      Payment_Disputed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment disputed");
      Payment_Requires_Action_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("payment requires action");
      Payment_Expired_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("payment expired");
      Incident_Phrase_Created :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("investigating incident");
      Audit_Created_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry created");
      Audit_Updated_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry updated");
      Audit_Deleted_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry deleted");
      Audit_Restored_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("audit entry restored");
      Feature_Flag_Enabled_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag enabled");
      Feature_Flag_Disabled_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag disabled");
      Feature_Flag_Rolling_Out_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag rolling out");
      Feature_Flag_Rolled_Back_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("feature flag rolled back");
      Webhook_Pending_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("webhook pending");
      Webhook_Delivered_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("webhook delivered");
      Webhook_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("webhook failed");
      Webhook_Retrying_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("webhook retrying");
      API_Key_Active_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key active");
      API_Key_Revoked_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key revoked");
      API_Key_Expired_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key expired");
      API_Key_Rotated_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("api key rotated");
      Quota_Available_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota available");
      Quota_Near_Limit_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota near limit");
      Quota_Exceeded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota exceeded");
      Quota_Reset_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("quota reset");
      Invoice_Draft_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice draft");
      Invoice_Sent_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice sent");
      Invoice_Paid_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice paid");
      Invoice_Refunded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice refunded");
      Invoice_Overdue_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("invoice overdue");
      Invoice_Refund_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("refund failed");
      Database_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database replication lagging");
      Database_Backup_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database backup failed");
      Database_Online_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database online");
      Database_Offline_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database offline");
      Database_Degraded_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database degraded");
      Database_Migrating_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase ("database migrating");
      Database_Migration_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database migration failed");
      Database_Replicating_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database replicating");
      Database_Backup_Running_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database backup running");
      Database_Backup_Failed_Phrase :
        constant Humanize.Parsing.Operational_Phrase_Parse_Result :=
          Humanize.Parsing.Parse_Operational_Phrase
            ("database backup failed");
      Field_Change :
        constant Humanize.Parsing.Field_Change_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_Change_Summary
            ("4 fields: 2 changed, 1 added, 1 removed");
      Field_Added :
        constant Humanize.Parsing.Field_State_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_State_Summary
            ("title added as final");
      Field_Removed :
        constant Humanize.Parsing.Field_State_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_State_Summary
            ("title removed (was draft)");
      Field_Unchanged :
        constant Humanize.Parsing.Field_State_Summary_Parse_Result :=
          Humanize.Parsing.Parse_Field_State_Summary
            ("status unchanged at open");
      Uncertainty : constant Humanize.Parsing.Uncertainty_Parse_Result :=
        Humanize.Parsing.Parse_Uncertainty_Label ("12.3 +/- 0.4");
      Uncertainty_Words :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Parse_Uncertainty_Words
            ("twelve point three plus or minus zero point four");
      Parenthesized_Uncertainty :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Parse_Uncertainty_Label ("12.3 (+/- 0.4)");
      Interval_Uncertainty :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Parse_Uncertainty_Label ("11.9 to 12.7");
      Scanned_Uncertainty :
        constant Humanize.Parsing.Uncertainty_Parse_Result :=
          Humanize.Parsing.Scan_Uncertainty_Label ("12.3 +/- 0.4 measured");
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
      Database_Throughput : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Database_Throughput ("12.5 k ops/s");
      Scanned_Database_Throughput :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Scan_Database_Throughput
            ("12.5 k ops/s; cached");
      Data_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Data_Rate ("1.5 MB/s");
      Scanned_Bit_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_Bit_Rate ("1.5 Mbit/s; cached");
      Binary_Data_Rate :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Binary_Data_Rate ("1.5 GiB/s");
      Memory_Bandwidth :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Memory_Bandwidth ("12.5 GB/s");
      Scanned_Latency :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Scan_Latency ("2.5 ms; cached");
      IOPS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_IOPS ("42 k IOPS");
      Scanned_IOPS : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_IOPS ("42 k IOPS; cached");
      Density : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Density ("12.5 kg/m3");
      Acceleration : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Acceleration ("9.8 m/s2");
      Torque : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Torque ("12 N m");
      Fuel_Economy : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Fuel_Economy ("5.5 L/100 km");
      Flow_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Scan_Flow_Rate ("500 mL/s; cached");
      Electric_Current :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Current ("500 mA");
      Voltage : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Voltage ("1.2 kV");
      Pixel_Density : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Pixel_Density ("326 ppi");
      Electric_Resistance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Resistance ("4.7 Mohm");
      Electric_Capacitance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Capacitance ("4.7 nF");
      Electric_Inductance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Electric_Inductance ("4.7 H");
      Concentration : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Concentration ("2.5 mol/L");
      Fuel_Efficiency_MPG :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Fuel_Efficiency_MPG ("30 mpg");
      CPU_Load : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_CPU_Load ("82.5 % CPU");
      Battery : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Battery ("37 % battery");
      Screen_Size : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Screen_Size ("13 in screen");
      Typography_Size : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Typography_Size ("12 pt");
      Audio_Level : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Audio_Level ("-6 dB");
      Signal_Strength : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Signal_Strength ("-67 dBm");
      Storage_Endurance :
        constant Humanize.Parsing.Compound_Unit_Parse_Result :=
          Humanize.Parsing.Parse_Storage_Endurance ("600 TBW");
      Refresh_Rate : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Refresh_Rate ("144 Hz refresh");
      Luminance : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Luminance ("1000 nits");
      Print_Resolution : constant Humanize.Parsing.Compound_Unit_Parse_Result :=
        Humanize.Parsing.Parse_Print_Resolution ("300 dpi");
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
      Friday_After_Next : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "friday after next");
      Next_Fri_Afternoon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday afternoon");
      Next_Fri_At_1730 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday at 17:30");
      Next_Fri_At_1730_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday at 17:30+02:00");
      Next_Fri_At_1730_CEST : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next friday at 17:30 CEST");
      Tomorrow_At_5pm_TZ_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm CET");
      Tomorrow_At_5_PM_TZ_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5 pm CET");
      Tomorrow_At_5pm_UTC_Plus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm UTC+2");
      Tomorrow_At_5pm_UTC_Plus2_NoSpace :
        constant Humanize.Parsing.Date_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date
            (Ref_Date, "tomorrow at 5pmUTC+2");
      Tomorrow_At_5pm_GMT_Minus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm GMT-2:00");
      Tonight_At_5pm_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tonight at 5pm-0700");
      Tomorrow_At_5pm_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5 pm+00");
      Tomorrow_At_5pm_TZ_NoSpace : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow at 5pm+00");
      Tonight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tonight");
      Tomorrow_At_5 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "tomorrow at 5pm");
      Tomorrow_Around_Noon : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "tomorrow around noon");
      End_Next_Business_Month :
        constant Humanize.Parsing.Date_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date
            (Ref_Date, "end of next business month");
      Next_Month_Third : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next month on the 3rd");
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
      Scanned_Tonight_TZ : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tonight at 5pm+0200; cached");
      Scanned_Tonight_TZ_Name : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5pm CET; cached");
      Scanned_Tonight_TZ_Name_With_Space : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5 pm CET; cached");
      Scanned_Tomorrow_At_5pm_UTC_Plus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5pm UTC+2; cached");
      Scanned_Tomorrow_At_5pm_GMT_Minus2 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date
          (Ref_Date, "tomorrow at 5pmGMT-2:00; cached");
      Scanned_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "in 3 days; cached");
      ISO_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-02-29");
      ISO_Ordinal_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-060");
      ISO_Week_Date : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-W09-4");
      ISO_Week_Start : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "2024-W01");
      Scanned_ISO_Week : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date (Ref_Date, "2024-W09-4; cached");
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
      In_Few_Days : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "in a few days");
      In_A_Couple_Of_Weeks : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "in a couple of weeks");
      In_A_Fortnight : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "in a fortnight");
      Fortnight_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "a fortnight ago");
      Month_Ago : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "1 month ago");
      This_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "this friday");
      Last_Fri : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "last friday");
      Two_Fridays : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "two fridays from now");
      Friday_Before_Next : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "Friday before next");
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
      Next_Business_Friday : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "next business friday");
      Three_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "3 business days from now");
      Several_Business : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date
          (Ref_Date, "several business days from now");
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
      Mid_Next_Quarter : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "mid next quarter");
      First_Half_2026 : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "first half of 2026");
      End_FY2027 : constant Humanize.Parsing.Date_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date (Ref_Date, "end of FY2027");
      Week_32_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "week 32");
      ISO_Week_Range : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range (Ref_Date, "2024-W09");
      This_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "this weekend");
      Next_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "next weekend");
      Last_Weekend : constant Humanize.Parsing.Date_Range_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Range
          (Ref_Date, "last weekend");
      Next_Business_Week :
        constant Humanize.Parsing.Date_Range_Parse_Result :=
          Humanize.Parsing.Parse_Natural_Date_Range
            (Ref_Date, "next business week");
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
        (German_Word_Cardinal.Status = Humanize.Status.Ok
         and then German_Word_Cardinal.Value = 42,
         "parse localized German cardinal spellout");
      AUnit.Assertions.Assert
        (Finnish_Word_Cardinal.Status = Humanize.Status.Ok
         and then Finnish_Word_Cardinal.Value = 2_345,
         "parse localized Finnish cardinal spellout");
      AUnit.Assertions.Assert
        (French_Large_Word_Cardinal.Status = Humanize.Status.Ok
         and then French_Large_Word_Cardinal.Value = 2_000_000_001,
         "parse localized French large cardinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Word_Cardinal.Status = Humanize.Status.Ok
         and then Japanese_Word_Cardinal.Value = 2_345,
         "parse localized Japanese cardinal spellout");
      AUnit.Assertions.Assert
        (Korean_Word_Cardinal.Status = Humanize.Status.Ok
         and then Korean_Word_Cardinal.Value = 2_345,
         "parse localized Korean cardinal spellout");
      AUnit.Assertions.Assert
        (Chinese_Word_Cardinal.Status = Humanize.Status.Ok
         and then Chinese_Word_Cardinal.Value = 2_345,
         "parse localized Chinese cardinal spellout");
      AUnit.Assertions.Assert
        (Polish_Word_Ordinal.Status = Humanize.Status.Ok
         and then Polish_Word_Ordinal.Value = 121,
         "parse localized Polish ordinal spellout");
      AUnit.Assertions.Assert
        (Polish_Thousands_Word_Ordinal.Status = Humanize.Status.Ok
         and then Polish_Thousands_Word_Ordinal.Value = 2_345,
         "parse localized Polish thousands ordinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Word_Ordinal.Status = Humanize.Status.Ok
         and then Japanese_Word_Ordinal.Value = 12,
         "parse localized Japanese ordinal spellout");
      AUnit.Assertions.Assert
        (Korean_Word_Ordinal.Status = Humanize.Status.Ok
         and then Korean_Word_Ordinal.Value = 12,
         "parse localized Korean ordinal spellout");
      AUnit.Assertions.Assert
        (Chinese_Word_Ordinal.Status = Humanize.Status.Ok
         and then Chinese_Word_Ordinal.Value = 12,
         "parse localized Chinese ordinal spellout");
      AUnit.Assertions.Assert
        (Japanese_Thousands_Word_Ordinal.Status = Humanize.Status.Ok
         and then Japanese_Thousands_Word_Ordinal.Value = 2_345,
         "parse localized Japanese thousands ordinal spellout");
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
        (Weekday_Schedule.Status = Humanize.Status.Ok
         and then Weekday_Schedule.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Weekday_Schedule.Weekdays = Humanize.Durations.Weekdays
         and then Weekday_Schedule.Has_Time
         and then Weekday_Schedule.Hour = 9
         and then Weekday_Schedule.Minute = 0,
         "parse weekday schedule recurrence");
      AUnit.Assertions.Assert
        (First_Monday.Status = Humanize.Status.Ok
         and then First_Monday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then First_Monday.Unit = Humanize.Durations.Every_Month
         and then First_Monday.Ordinal = 1
         and then First_Monday.Weekday = 1
         and then First_Monday.Has_Time
         and then First_Monday.Hour = 9
         and then First_Monday.Minute = 30,
         "parse ordinal weekday recurrence");
      AUnit.Assertions.Assert
        (Cron_Weekday.Status = Humanize.Status.Ok
         and then Cron_Weekday.Kind = Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Weekday.Weekdays = Humanize.Durations.Weekdays
         and then Cron_Weekday.Has_Time
         and then Cron_Weekday.Hour = 9
         and then Cron_Weekday.Minute = 0,
         "parse cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Monthly.Status = Humanize.Status.Ok
         and then Cron_Monthly.Unit = Humanize.Durations.Every_Month
         and then Cron_Monthly.Day_Of_Month = 15
         and then Cron_Monthly.Has_Time
         and then Cron_Monthly.Hour = 8
         and then Cron_Monthly.Minute = 30,
         "parse cron monthly schedule");
      AUnit.Assertions.Assert
        (Scanned_Cron.Status = Humanize.Status.Ok
         and then Scanned_Cron.Kind = Humanize.Parsing.Recurrence_Weekday_Set
         and then Scanned_Cron.Weekdays = Humanize.Durations.Weekdays
         and then Scanned_Cron.Has_Time
         and then Scanned_Cron.Hour = 9
         and then Scanned_Cron.Consumed = 11,
         "scan cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Step_Minute.Status = Humanize.Status.Ok
         and then Cron_Step_Minute.Every = 15
         and then Cron_Step_Minute.Unit = Humanize.Durations.Every_Minute,
         "parse cron stepped minute schedule");
      AUnit.Assertions.Assert
        (Cron_Step_Hour.Status = Humanize.Status.Ok
         and then Cron_Step_Hour.Every = 2
         and then Cron_Step_Hour.Unit = Humanize.Durations.Every_Hour
         and then Cron_Step_Hour.Has_Time
         and then Cron_Step_Hour.Minute = 0,
         "parse cron stepped hour schedule");
      AUnit.Assertions.Assert
        (Cron_Named_List.Status = Humanize.Status.Ok
         and then Cron_Named_List.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Named_List.Weekdays (1)
         and then Cron_Named_List.Weekdays (3)
         and then Cron_Named_List.Weekdays (5)
         and then not Cron_Named_List.Weekdays (2)
         and then Cron_Named_List.Has_Time
         and then Cron_Named_List.Hour = 9
         and then Cron_Named_List.Minute = 30,
         "parse cron named weekday list");
      AUnit.Assertions.Assert
        (Cron_Yearly.Status = Humanize.Status.Ok
         and then Cron_Yearly.Unit = Humanize.Durations.Every_Year
         and then Cron_Yearly.Month_Of_Year = 1
         and then Cron_Yearly.Day_Of_Month = 15
         and then Cron_Yearly.Has_Time
         and then Cron_Yearly.Hour = 8
         and then Cron_Yearly.Minute = 30,
         "parse cron named month yearly schedule");
      AUnit.Assertions.Assert
        (Cron_Quartz_Weekday.Status = Humanize.Status.Ok
         and then Cron_Quartz_Weekday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Cron_Quartz_Weekday.Has_Second
         and then Cron_Quartz_Weekday.Second = 0
         and then Cron_Quartz_Weekday.Has_Time
         and then Cron_Quartz_Weekday.Hour = 9
         and then Cron_Quartz_Weekday.Minute = 0
         and then Cron_Quartz_Weekday.Weekdays =
           Humanize.Durations.Weekdays,
         "parse quartz cron weekday schedule");
      AUnit.Assertions.Assert
        (Cron_Quartz_Year.Status = Humanize.Status.Ok
         and then Cron_Quartz_Year.Unit = Humanize.Durations.Every_Year
         and then Cron_Quartz_Year.Has_Second
         and then Cron_Quartz_Year.Second = 30
         and then Cron_Quartz_Year.Has_Year
         and then Cron_Quartz_Year.Year = 2027
         and then Cron_Quartz_Year.Month_Of_Year = 1
         and then Cron_Quartz_Year.Day_Of_Month = 15
         and then Cron_Quartz_Year.Hour = 8
         and then Cron_Quartz_Year.Minute = 15,
         "parse quartz cron year field");
      AUnit.Assertions.Assert
        (Cron_Last_Day.Status = Humanize.Status.Ok
         and then Cron_Last_Day.Unit = Humanize.Durations.Every_Month
         and then Cron_Last_Day.Is_Last_Day_Of_Month,
         "parse quartz cron last day of month");
      AUnit.Assertions.Assert
        (Cron_Nearest_Weekday.Status = Humanize.Status.Ok
         and then Cron_Nearest_Weekday.Unit = Humanize.Durations.Every_Month
         and then Cron_Nearest_Weekday.Day_Of_Month = 15
         and then Cron_Nearest_Weekday.Is_Nearest_Weekday,
         "parse quartz cron nearest weekday");
      AUnit.Assertions.Assert
        (Cron_Last_Friday.Status = Humanize.Status.Ok
         and then Cron_Last_Friday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Cron_Last_Friday.Is_Last_Weekday
         and then Cron_Last_Friday.Ordinal = -1
         and then Cron_Last_Friday.Weekday = 5,
         "parse quartz cron last weekday");
      AUnit.Assertions.Assert
        (Cron_Second_Monday.Status = Humanize.Status.Ok
         and then Cron_Second_Monday.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Cron_Second_Monday.Nth_Weekday = 2
         and then Cron_Second_Monday.Ordinal = 2
         and then Cron_Second_Monday.Weekday = 1,
         "parse quartz cron nth weekday");
      AUnit.Assertions.Assert
        (Italian_Ordinal_Schedule.Status = Humanize.Status.Ok
         and then Italian_Ordinal_Schedule.Kind =
           Humanize.Parsing.Recurrence_Ordinal_Weekday
         and then Italian_Ordinal_Schedule.Ordinal = 1
         and then Italian_Ordinal_Schedule.Weekday = 1
         and then Italian_Ordinal_Schedule.Has_Time
         and then Italian_Ordinal_Schedule.Hour = 9
         and then Italian_Ordinal_Schedule.Minute = 30,
         "parse localized rendered ordinal schedule");
      AUnit.Assertions.Assert
        (Finnish_Rendered_Cron.Status = Humanize.Status.Ok
         and then Finnish_Rendered_Cron.Unit = Humanize.Durations.Every_Month
         and then Finnish_Rendered_Cron.Day_Of_Month = 15
         and then Finnish_Rendered_Cron.Has_Time
         and then Finnish_Rendered_Cron.Hour = 8
         and then Finnish_Rendered_Cron.Minute = 30,
         "parse Finnish rendered cron schedule");
      AUnit.Assertions.Assert
        (Polish_Rendered_Cron.Status = Humanize.Status.Ok
         and then Polish_Rendered_Cron.Unit = Humanize.Durations.Every_Month
         and then Polish_Rendered_Cron.Day_Of_Month = 15
         and then Polish_Rendered_Cron.Has_Time
         and then Polish_Rendered_Cron.Hour = 8
         and then Polish_Rendered_Cron.Minute = 30,
         "parse Polish rendered cron schedule");
      AUnit.Assertions.Assert
        (Danish_Rendered_Weekday.Status = Humanize.Status.Ok
         and then Danish_Rendered_Weekday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Danish_Rendered_Weekday.Weekdays =
           Humanize.Durations.Weekdays
         and then Danish_Rendered_Weekday.Has_Time
         and then Danish_Rendered_Weekday.Hour = 9
         and then Danish_Rendered_Weekday.Minute = 0,
         "parse Danish rendered weekday schedule");
      AUnit.Assertions.Assert
        (Last_Business.Status = Humanize.Status.Ok
         and then Last_Business.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Last_Business.Ordinal = -1
         and then Last_Business.Unit = Humanize.Durations.Every_Month,
         "parse last business day recurrence");
      AUnit.Assertions.Assert
        (Every_Last_Weekday.Status = Humanize.Status.Ok
         and then Every_Last_Weekday.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Every_Last_Weekday.Ordinal = -1
         and then Every_Last_Weekday.Unit = Humanize.Durations.Every_Month,
         "parse every last weekday recurrence");
      AUnit.Assertions.Assert
        (Second_Business.Status = Humanize.Status.Ok
         and then Second_Business.Kind =
           Humanize.Parsing.Recurrence_Business_Day
         and then Second_Business.Ordinal = 2
         and then Second_Business.Unit = Humanize.Durations.Every_Month
         and then Second_Business.Has_Time
         and then Second_Business.Hour = 10
         and then Second_Business.Minute = 15,
         "parse ordinal business day recurrence");
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
        (Windowed_Time.Status = Humanize.Status.Ok
         and then Windowed_Time.Every = 15
         and then Windowed_Time.Unit = Humanize.Durations.Every_Minute
         and then Windowed_Time.Has_Time_Window
         and then Windowed_Time.Window_Start_Hour = 9
         and then Windowed_Time.Window_Start_Minute = 0
         and then Windowed_Time.Window_End_Hour = 17
         and then Windowed_Time.Window_End_Minute = 0,
         "parse recurrence time window metadata");
      AUnit.Assertions.Assert
        (Weekday_Except_Friday.Status = Humanize.Status.Ok
         and then Weekday_Except_Friday.Kind =
           Humanize.Parsing.Recurrence_Weekday_Set
         and then Weekday_Except_Friday.Has_Excluded_Weekdays
         and then Weekday_Except_Friday.Excluded_Weekdays (5)
         and then not Weekday_Except_Friday.Weekdays (5),
         "parse recurrence weekday exclusion metadata");
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
        (Decimal_Range.Status = Humanize.Status.Ok
         and then abs (Decimal_Range.Low - 1.25) < 0.0001
         and then abs (Decimal_Range.High - 3.5) < 0.0001,
         "parse decimal range");
      AUnit.Assertions.Assert
        (Decimal_Range_Words.Status = Humanize.Status.Ok
         and then abs (Decimal_Range_Words.Low - 1.25) < 0.0001
         and then abs (Decimal_Range_Words.High - 3.5) < 0.0001,
         "parse worded decimal range");
      AUnit.Assertions.Assert
        (Editorial_Number.Status = Humanize.Status.Ok
         and then Editorial_Number.Value = 1_200
         and then Editorial_Number.Consumed = 6,
         "parse editorial grouped number");
      AUnit.Assertions.Assert
        (Currency_Words.Status = Humanize.Status.Ok
         and then abs (Currency_Words.Amount - 12.5) < 0.0001
         and then Currency_Words.Code
           (1 .. Currency_Words.Code_Length) = "dollar",
         "parse worded currency");
      AUnit.Assertions.Assert
        (Fraction_Words.Status = Humanize.Status.Ok
         and then Fraction_Words.Count = 3
         and then Fraction_Words.Total = 4,
         "parse worded fraction");
      AUnit.Assertions.Assert
        (Percent_Words.Status = Humanize.Status.Ok
         and then abs (Percent_Words.Value - 12.5) < 0.0001,
         "parse worded percent");
      AUnit.Assertions.Assert
        (Scanned_Decimal_Range.Status = Humanize.Status.Ok
         and then abs (Scanned_Decimal_Range.Low - 1.25) < 0.0001
         and then abs (Scanned_Decimal_Range.High - 3.5) < 0.0001,
         "scan decimal range prefix");
      AUnit.Assertions.Assert
        (Operational_Phrase.Status = Humanize.Status.Ok
         and then Operational_Phrase.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Operational_Phrase.Backup_Status =
           Humanize.Phrases.Backup_Stale,
         "parse operational phrase");
      AUnit.Assertions.Assert
        (Backup_Phrase_Case_Running.Status = Humanize.Status.Ok
         and then Backup_Phrase_Case_Running.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Backup_Phrase_Case_Running.Backup_Status =
           Humanize.Phrases.Backup_Running
         and then Backup_Phrase_Case_Completed.Status = Humanize.Status.Ok
         and then Backup_Phrase_Case_Completed.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Backup_Phrase_Case_Completed.Backup_Status =
           Humanize.Phrases.Backup_Completed
         and then Backup_Phrase_Case_Failed.Status = Humanize.Status.Ok
         and then Backup_Phrase_Case_Failed.Domain =
           Humanize.Parsing.Backup_Phrase_Domain
         and then Backup_Phrase_Case_Failed.Backup_Status =
           Humanize.Phrases.Backup_Failed,
         "parse all backup operational phrases");
      AUnit.Assertions.Assert
        (Incident_Phrase_Created.Status = Humanize.Status.Ok
         and then Incident_Phrase_Created.Domain =
           Humanize.Parsing.Incident_Phrase_Domain
         and then Incident_Phrase_Created.Incident_Status =
           Humanize.Phrases.Incident_Investigating
         and then Payment_Authorized_Phrase.Status = Humanize.Status.Ok
         and then Payment_Authorized_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Authorized_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Authorized
         and then Payment_Captured_Phrase.Status = Humanize.Status.Ok
         and then Payment_Captured_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Captured_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Captured
         and then Payment_Refunded_Phrase.Status = Humanize.Status.Ok
         and then Payment_Refunded_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Refunded_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Refunded
         and then Payment_Disputed_Phrase.Status = Humanize.Status.Ok
         and then Payment_Disputed_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Disputed_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Disputed
         and then Payment_Requires_Action_Phrase.Status = Humanize.Status.Ok
         and then Payment_Requires_Action_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Requires_Action_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Requires_Action
         and then Payment_Expired_Phrase.Status = Humanize.Status.Ok
         and then Payment_Expired_Phrase.Domain =
           Humanize.Parsing.Payment_Lifecycle_Phrase_Domain
         and then Payment_Expired_Phrase.Payment_Lifecycle_Status =
           Humanize.Phrases.Payment_Expired,
         "parse payment lifecycle phrases");
      AUnit.Assertions.Assert
        (Audit_Created_Phrase.Status = Humanize.Status.Ok
         and then Audit_Created_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Created_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Created
         and then Audit_Updated_Phrase.Status = Humanize.Status.Ok
         and then Audit_Updated_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Updated_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Updated
         and then Audit_Deleted_Phrase.Status = Humanize.Status.Ok
         and then Audit_Deleted_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Deleted_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Deleted
         and then Audit_Restored_Phrase.Status = Humanize.Status.Ok
         and then Audit_Restored_Phrase.Domain =
           Humanize.Parsing.Audit_Phrase_Domain
         and then Audit_Restored_Phrase.Audit_Status =
           Humanize.Phrases.Audit_Restored,
         "parse audit phrases");
      AUnit.Assertions.Assert
        (Feature_Flag_Enabled_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Enabled_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Enabled_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Enabled
         and then Feature_Flag_Disabled_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Disabled_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Disabled_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Disabled
         and then Feature_Flag_Rolling_Out_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Rolling_Out_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Rolling_Out_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Rolling_Out
         and then Feature_Flag_Rolled_Back_Phrase.Status = Humanize.Status.Ok
         and then Feature_Flag_Rolled_Back_Phrase.Domain =
           Humanize.Parsing.Feature_Flag_Phrase_Domain
         and then Feature_Flag_Rolled_Back_Phrase.Feature_Flag_Status =
           Humanize.Phrases.Flag_Rolled_Back,
         "parse feature flag phrases");
      AUnit.Assertions.Assert
        (Webhook_Pending_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Pending_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Pending_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Pending
         and then Webhook_Delivered_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Delivered_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Delivered_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Delivered
         and then Webhook_Failed_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Failed_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Failed_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Failed
         and then Webhook_Retrying_Phrase.Status = Humanize.Status.Ok
         and then Webhook_Retrying_Phrase.Domain =
           Humanize.Parsing.Webhook_Phrase_Domain
         and then Webhook_Retrying_Phrase.Webhook_Status =
           Humanize.Phrases.Webhook_Retrying,
         "parse webhook phrases");
      AUnit.Assertions.Assert
        (API_Key_Active_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Active_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Active_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Active
         and then API_Key_Revoked_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Revoked_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Revoked_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Revoked
         and then API_Key_Expired_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Expired_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Expired_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Expired
         and then API_Key_Rotated_Phrase.Status = Humanize.Status.Ok
         and then API_Key_Rotated_Phrase.Domain =
           Humanize.Parsing.API_Key_Phrase_Domain
         and then API_Key_Rotated_Phrase.API_Key_Status =
           Humanize.Phrases.API_Key_Rotated,
         "parse API-key phrases");
      AUnit.Assertions.Assert
        (Quota_Available_Phrase.Status = Humanize.Status.Ok
         and then Quota_Available_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Available_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Available
         and then Quota_Near_Limit_Phrase.Status = Humanize.Status.Ok
         and then Quota_Near_Limit_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Near_Limit_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Near_Limit
         and then Quota_Exceeded_Phrase.Status = Humanize.Status.Ok
         and then Quota_Exceeded_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Exceeded_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Exceeded
         and then Quota_Reset_Phrase.Status = Humanize.Status.Ok
         and then Quota_Reset_Phrase.Domain =
           Humanize.Parsing.Quota_Phrase_Domain
         and then Quota_Reset_Phrase.Quota_Status =
           Humanize.Phrases.Quota_Reset,
         "parse quota phrases");
      AUnit.Assertions.Assert
        (Invoice_Draft_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Draft_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Draft_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Draft
         and then Invoice_Sent_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Sent_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Sent_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Sent
         and then Invoice_Paid_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Paid_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Paid_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Paid
         and then Invoice_Refunded_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Refunded_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Refunded_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Refunded
         and then Invoice_Overdue_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Overdue_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Overdue_Phrase.Invoice_Status =
           Humanize.Phrases.Invoice_Overdue
         and then Invoice_Refund_Failed_Phrase.Status = Humanize.Status.Ok
         and then Invoice_Refund_Failed_Phrase.Domain =
           Humanize.Parsing.Invoice_Phrase_Domain
         and then Invoice_Refund_Failed_Phrase.Invoice_Status =
           Humanize.Phrases.Refund_Failed,
         "parse invoice phrases");
      AUnit.Assertions.Assert
        (Database_Phrase.Status = Humanize.Status.Ok
         and then Database_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Phrase.Database_Status =
           Humanize.Phrases.Database_Replication_Lagging
         and then Database_Backup_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Failed,
         "parse database phrases");
      AUnit.Assertions.Assert
        (Database_Online_Phrase.Status = Humanize.Status.Ok
         and then Database_Online_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Online_Phrase.Database_Status =
           Humanize.Phrases.Database_Online
         and then Database_Offline_Phrase.Status = Humanize.Status.Ok
         and then Database_Offline_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Offline_Phrase.Database_Status =
           Humanize.Phrases.Database_Offline
         and then Database_Degraded_Phrase.Status = Humanize.Status.Ok
         and then Database_Degraded_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Degraded_Phrase.Database_Status =
           Humanize.Phrases.Database_Degraded
         and then Database_Migrating_Phrase.Status = Humanize.Status.Ok
         and then Database_Migrating_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Migrating_Phrase.Database_Status =
           Humanize.Phrases.Database_Migrating
         and then Database_Migration_Failed_Phrase.Status = Humanize.Status.Ok
         and then Database_Migration_Failed_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Migration_Failed_Phrase.Database_Status =
           Humanize.Phrases.Database_Migration_Failed
         and then Database_Replicating_Phrase.Status = Humanize.Status.Ok
         and then Database_Replicating_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Replicating_Phrase.Database_Status =
           Humanize.Phrases.Database_Replicating
         and then Database_Backup_Running_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Running_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Running_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Running
         and then Database_Backup_Failed_Phrase.Status = Humanize.Status.Ok
         and then Database_Backup_Failed_Phrase.Domain =
           Humanize.Parsing.Database_Phrase_Domain
         and then Database_Backup_Failed_Phrase.Database_Status =
           Humanize.Phrases.Database_Backup_Failed,
         "parse all database phrases");
      AUnit.Assertions.Assert
        (Field_Change.Status = Humanize.Status.Ok
         and then Field_Change.Total = 4
         and then Field_Change.Changed = 2
         and then Field_Change.Added = 1
         and then Field_Change.Removed = 1
         and then Field_Change.Unit (1 .. Field_Change.Unit_Length) = "fields",
         "parse field change summary");
      AUnit.Assertions.Assert
        (Field_Added.Status = Humanize.Status.Ok
         and then Field_Added.Kind = Humanize.Parsing.Field_State_Added
         and then Field_Added.Field (1 .. Field_Added.Field_Length) = "title"
         and then Field_Added.Value (1 .. Field_Added.Value_Length) = "final",
         "parse field added summary");
      AUnit.Assertions.Assert
        (Field_Removed.Status = Humanize.Status.Ok
         and then Field_Removed.Kind = Humanize.Parsing.Field_State_Removed
         and then Field_Removed.Field (1 .. Field_Removed.Field_Length) =
           "title"
         and then Field_Removed.Value (1 .. Field_Removed.Value_Length) =
           "draft",
         "parse field removed summary");
      AUnit.Assertions.Assert
        (Field_Unchanged.Status = Humanize.Status.Ok
         and then Field_Unchanged.Kind =
           Humanize.Parsing.Field_State_Unchanged
         and then Field_Unchanged.Field
           (1 .. Field_Unchanged.Field_Length) = "status"
         and then Field_Unchanged.Value
           (1 .. Field_Unchanged.Value_Length) = "open",
         "parse field unchanged summary");
      AUnit.Assertions.Assert
        (Uncertainty.Status = Humanize.Status.Ok
         and then abs (Uncertainty.Value - 12.3) < 0.0001
         and then abs (Uncertainty.Uncertainty - 0.4) < 0.0001
         and then Uncertainty.Style =
           Humanize.Numbers.Plus_Minus_Uncertainty,
         "parse plus-minus uncertainty");
      AUnit.Assertions.Assert
        (Uncertainty_Words.Status = Humanize.Status.Ok
         and then abs (Uncertainty_Words.Value - 12.3) < 0.0001
         and then abs (Uncertainty_Words.Uncertainty - 0.4) < 0.0001
         and then Uncertainty_Words.Style =
           Humanize.Numbers.Plus_Minus_Uncertainty,
         "parse worded uncertainty");
      AUnit.Assertions.Assert
        (Parenthesized_Uncertainty.Status = Humanize.Status.Ok
         and then abs (Parenthesized_Uncertainty.Value - 12.3) < 0.0001
         and then abs (Parenthesized_Uncertainty.Uncertainty - 0.4) < 0.0001
         and then Parenthesized_Uncertainty.Style =
           Humanize.Numbers.Parenthesized_Uncertainty,
         "parse parenthesized uncertainty");
      AUnit.Assertions.Assert
        (Interval_Uncertainty.Status = Humanize.Status.Ok
         and then abs (Interval_Uncertainty.Value - 12.3) < 0.0001
         and then abs (Interval_Uncertainty.Uncertainty - 0.4) < 0.0001
         and then abs (Interval_Uncertainty.Low - 11.9) < 0.0001
         and then abs (Interval_Uncertainty.High - 12.7) < 0.0001
         and then Interval_Uncertainty.Style =
           Humanize.Numbers.Interval_Uncertainty,
         "parse interval uncertainty");
      AUnit.Assertions.Assert
        (Scanned_Uncertainty.Status = Humanize.Status.Ok
         and then Scanned_Uncertainty.Consumed = 12,
         "scan uncertainty prefix");
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
        (Database_Throughput.Status = Humanize.Status.Ok
         and then Database_Throughput.Value = 12.5
         and then Database_Throughput.Unit
           (1 .. Database_Throughput.Unit_Length) = "k ops/s",
         "parse database throughput");
      AUnit.Assertions.Assert
        (Scanned_Database_Throughput.Status = Humanize.Status.Ok
         and then Scanned_Database_Throughput.Value = 12.5
         and then Scanned_Database_Throughput.Unit
           (1 .. Scanned_Database_Throughput.Unit_Length) = "k ops/s"
         and then Scanned_Database_Throughput.Consumed = 12,
         "scan database throughput");
      AUnit.Assertions.Assert
        (Data_Rate.Status = Humanize.Status.Ok
         and then Data_Rate.Value = 1.5
         and then Data_Rate.Unit (1 .. Data_Rate.Unit_Length) = "mb/s",
         "parse data rate");
      AUnit.Assertions.Assert
        (Scanned_Bit_Rate.Status = Humanize.Status.Ok
         and then Scanned_Bit_Rate.Value = 1.5
         and then Scanned_Bit_Rate.Unit
           (1 .. Scanned_Bit_Rate.Unit_Length) = "mbit/s"
         and then Scanned_Bit_Rate.Consumed = 10,
         "scan bit rate");
      AUnit.Assertions.Assert
        (Binary_Data_Rate.Status = Humanize.Status.Ok
         and then Binary_Data_Rate.Value = 1.5
         and then Binary_Data_Rate.Unit
           (1 .. Binary_Data_Rate.Unit_Length) = "gib/s",
         "parse binary data rate");
      AUnit.Assertions.Assert
        (Memory_Bandwidth.Status = Humanize.Status.Ok
         and then Memory_Bandwidth.Value = 12.5
         and then Memory_Bandwidth.Unit
           (1 .. Memory_Bandwidth.Unit_Length) = "gb/s",
         "parse memory bandwidth");
      AUnit.Assertions.Assert
        (Scanned_Latency.Status = Humanize.Status.Ok
         and then Scanned_Latency.Value = 2.5
         and then Scanned_Latency.Unit
           (1 .. Scanned_Latency.Unit_Length) = "ms"
         and then Scanned_Latency.Consumed = 6,
         "scan latency");
      AUnit.Assertions.Assert
        (IOPS.Status = Humanize.Status.Ok
         and then IOPS.Value = 42.0
         and then IOPS.Unit (1 .. IOPS.Unit_Length) = "k iops",
         "parse IOPS");
      AUnit.Assertions.Assert
        (Scanned_IOPS.Status = Humanize.Status.Ok
         and then Scanned_IOPS.Value = 42.0
         and then Scanned_IOPS.Unit (1 .. Scanned_IOPS.Unit_Length) = "k iops"
         and then Scanned_IOPS.Consumed = 9,
         "scan IOPS");
      AUnit.Assertions.Assert
        (Density.Status = Humanize.Status.Ok
         and then Density.Unit (1 .. Density.Unit_Length) = "kg/m3",
         "parse density");
      AUnit.Assertions.Assert
        (Acceleration.Status = Humanize.Status.Ok
         and then Acceleration.Unit
           (1 .. Acceleration.Unit_Length) = "m/s2",
         "parse acceleration");
      AUnit.Assertions.Assert
        (Torque.Status = Humanize.Status.Ok
         and then Torque.Unit (1 .. Torque.Unit_Length) = "n m",
         "parse torque");
      AUnit.Assertions.Assert
        (Fuel_Economy.Status = Humanize.Status.Ok
         and then Fuel_Economy.Unit
           (1 .. Fuel_Economy.Unit_Length) = "l/100 km",
         "parse fuel economy");
      AUnit.Assertions.Assert
        (Flow_Rate.Status = Humanize.Status.Ok
         and then Flow_Rate.Unit (1 .. Flow_Rate.Unit_Length) = "ml/s"
         and then Flow_Rate.Consumed = 8,
         "scan flow rate");
      AUnit.Assertions.Assert
        (Electric_Current.Status = Humanize.Status.Ok
         and then Electric_Current.Unit
           (1 .. Electric_Current.Unit_Length) = "ma",
         "parse electric current");
      AUnit.Assertions.Assert
        (Voltage.Status = Humanize.Status.Ok
         and then Voltage.Unit (1 .. Voltage.Unit_Length) = "kv",
         "parse voltage");
      AUnit.Assertions.Assert
        (Pixel_Density.Status = Humanize.Status.Ok
         and then Pixel_Density.Unit
           (1 .. Pixel_Density.Unit_Length) = "ppi",
         "parse pixel density");
      AUnit.Assertions.Assert
        (Electric_Resistance.Status = Humanize.Status.Ok
         and then Electric_Resistance.Unit
           (1 .. Electric_Resistance.Unit_Length) = "mohm",
         "parse electric resistance");
      AUnit.Assertions.Assert
        (Electric_Capacitance.Status = Humanize.Status.Ok
         and then Electric_Capacitance.Unit
           (1 .. Electric_Capacitance.Unit_Length) = "nf",
         "parse electric capacitance");
      AUnit.Assertions.Assert
        (Electric_Inductance.Status = Humanize.Status.Ok
         and then Electric_Inductance.Unit
           (1 .. Electric_Inductance.Unit_Length) = "h",
         "parse electric inductance");
      AUnit.Assertions.Assert
        (Concentration.Status = Humanize.Status.Ok
         and then Concentration.Unit
           (1 .. Concentration.Unit_Length) = "mol/l",
         "parse concentration");
      AUnit.Assertions.Assert
        (Fuel_Efficiency_MPG.Status = Humanize.Status.Ok
         and then Fuel_Efficiency_MPG.Unit
           (1 .. Fuel_Efficiency_MPG.Unit_Length) = "mpg",
         "parse fuel efficiency mpg");
      AUnit.Assertions.Assert
        (CPU_Load.Status = Humanize.Status.Ok
         and then CPU_Load.Unit (1 .. CPU_Load.Unit_Length) = "% cpu",
         "parse CPU load");
      AUnit.Assertions.Assert
        (Battery.Status = Humanize.Status.Ok
         and then Battery.Unit (1 .. Battery.Unit_Length) = "% battery",
         "parse battery");
      AUnit.Assertions.Assert
        (Screen_Size.Status = Humanize.Status.Ok
         and then Screen_Size.Unit
           (1 .. Screen_Size.Unit_Length) = "in screen",
         "parse screen size");
      AUnit.Assertions.Assert
        (Typography_Size.Status = Humanize.Status.Ok
         and then Typography_Size.Unit
           (1 .. Typography_Size.Unit_Length) = "pt",
         "parse typography size");
      AUnit.Assertions.Assert
        (Audio_Level.Status = Humanize.Status.Ok
         and then Audio_Level.Value = -6.0
         and then Audio_Level.Unit
           (1 .. Audio_Level.Unit_Length) = "db",
         "parse audio level");
      AUnit.Assertions.Assert
        (Signal_Strength.Status = Humanize.Status.Ok
         and then Signal_Strength.Value = -67.0
         and then Signal_Strength.Unit
           (1 .. Signal_Strength.Unit_Length) = "dbm",
         "parse signal strength");
      AUnit.Assertions.Assert
        (Storage_Endurance.Status = Humanize.Status.Ok
         and then Storage_Endurance.Unit
           (1 .. Storage_Endurance.Unit_Length) = "tbw",
         "parse storage endurance");
      AUnit.Assertions.Assert
        (Refresh_Rate.Status = Humanize.Status.Ok
         and then Refresh_Rate.Unit
           (1 .. Refresh_Rate.Unit_Length) = "hz refresh",
         "parse refresh rate");
      AUnit.Assertions.Assert
        (Luminance.Status = Humanize.Status.Ok
         and then Luminance.Unit (1 .. Luminance.Unit_Length) = "nits",
         "parse luminance");
      AUnit.Assertions.Assert
        (Print_Resolution.Status = Humanize.Status.Ok
         and then Print_Resolution.Unit
           (1 .. Print_Resolution.Unit_Length) = "dpi",
         "parse print resolution");
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
        (Friday_After_Next.Status = Humanize.Status.Ok
         and then Friday_After_Next.Value = Ref_Date + 11.0 * 86_400.0,
         "parse natural weekday after next");
      AUnit.Assertions.Assert
        (Next_Fri_Afternoon.Status = Humanize.Status.Ok
         and then Next_Fri_Afternoon.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 13.0 * 3_600.0),
         "parse natural weekday with time-of-day");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 17.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730_TZ.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 15.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time and timezone");
      AUnit.Assertions.Assert
        (Next_Fri_At_1730_CEST.Status = Humanize.Status.Ok
         and then Next_Fri_At_1730_CEST.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 15.0 * 3_600.0 + 30.0 * 60.0),
         "parse natural weekday with clock time and timezone name");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ_Name.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "parse natural date with timezone name");
      AUnit.Assertions.Assert
        (Tomorrow_At_5_PM_TZ_Name.Status = Humanize.Status.Ok
         and then Tomorrow_At_5_PM_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "parse natural date with timezone name and split am/pm");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_UTC_Plus2.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_UTC_Plus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0),
         "parse natural date with UTC timezone offset -- status="
         & Humanize.Status.Status_Code'Image (Tomorrow_At_5pm_UTC_Plus2.Status)
         & ", value="
         & Ada.Calendar.Formatting.Image (Tomorrow_At_5pm_UTC_Plus2.Value));
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_UTC_Plus2_NoSpace.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_UTC_Plus2_NoSpace.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0),
         "parse natural date with UTC timezone offset without space");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_GMT_Minus2.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_GMT_Minus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 19.0 * 3_600.0),
         "parse natural date with GMT timezone offset");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ_NoSpace.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ_NoSpace.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with no-space time and timezone suffix");
      AUnit.Assertions.Assert
        (Tonight_At_5pm_TZ.Status = Humanize.Status.Ok
         and then Tonight_At_5pm_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 0.0),
         "parse natural date with pm timezone suffix");
      AUnit.Assertions.Assert
        (Tomorrow_At_5pm_TZ.Status = Humanize.Status.Ok
         and then Tomorrow_At_5pm_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with timezone suffix and space: status="
         & Humanize.Status.Status_Code'Image (Tomorrow_At_5pm_TZ.Status)
         & " value="
         & Ada.Calendar.Formatting.Image (Tomorrow_At_5pm_TZ.Value)
         & " error-pos="
         & Integer'Image (Tomorrow_At_5pm_TZ.Error_Position));
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
        (Scanned_Tonight_TZ.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 15.0 * 3_600.0)
         and then Scanned_Tonight_TZ.Consumed = 19,
         "scan natural weekday with clock time and timezone");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ_Name.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ_Name.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0)
         and then Scanned_Tonight_TZ_Name.Consumed = 19,
         "scan natural date with timezone name");
      AUnit.Assertions.Assert
        (Scanned_Tonight_TZ_Name_With_Space.Status = Humanize.Status.Ok
         and then Scanned_Tonight_TZ_Name_With_Space.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 16.0 * 3_600.0),
         "scan natural date with timezone name and split am/pm");
      AUnit.Assertions.Assert
        (Scanned_Tomorrow_At_5pm_UTC_Plus2.Status = Humanize.Status.Ok
         and then Scanned_Tomorrow_At_5pm_UTC_Plus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 15.0 * 3_600.0)
         and then Scanned_Tomorrow_At_5pm_UTC_Plus2.Consumed = 21,
         "scan natural date with UTC timezone offset");
      AUnit.Assertions.Assert
        (Scanned_Tomorrow_At_5pm_GMT_Minus2.Status = Humanize.Status.Ok
         and then Scanned_Tomorrow_At_5pm_GMT_Minus2.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 19.0 * 3_600.0)
         and then Scanned_Tomorrow_At_5pm_GMT_Minus2.Consumed = 23,
         "scan natural date with GMT timezone offset");
      AUnit.Assertions.Assert
        (Scanned_Date.Status = Humanize.Status.Ok
         and then Scanned_Date.Value = Ref_Date + 3.0 * 86_400.0
         and then Scanned_Date.Consumed = 9,
         "scan natural date");
      AUnit.Assertions.Assert
        (In_A_Couple_Of_Weeks.Status = Humanize.Status.Ok
         and then In_A_Couple_Of_Weeks.Value =
           Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse natural date couple of weeks");
      AUnit.Assertions.Assert
        (In_A_Fortnight.Status = Humanize.Status.Ok
         and then In_A_Fortnight.Value =
           Ada.Calendar.Time_Of (2024, 1, 15, 0.0),
         "parse natural date fortnight");
      AUnit.Assertions.Assert
        (Fortnight_Ago.Status = Humanize.Status.Ok
         and then Fortnight_Ago.Value =
           Ada.Calendar.Time_Of (2023, 12, 18, 0.0),
         "parse natural date fortnight ago");
      AUnit.Assertions.Assert
        (Tomorrow_At_5.Status = Humanize.Status.Ok
         and then Tomorrow_At_5.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 17.0 * 3_600.0),
         "parse natural date with clock time");
      AUnit.Assertions.Assert
        (Tomorrow_Around_Noon.Status = Humanize.Status.Ok
         and then Tomorrow_Around_Noon.Value =
           Ada.Calendar.Time_Of (2024, 1, 2, 12.0 * 3_600.0),
         "parse natural date around noon");
      AUnit.Assertions.Assert
        (End_Next_Business_Month.Status = Humanize.Status.Ok
         and then End_Next_Business_Month.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse end of next business month");
      AUnit.Assertions.Assert
        (Next_Month_Third.Status = Humanize.Status.Ok
         and then Next_Month_Third.Value =
           Ada.Calendar.Time_Of (2024, 2, 3, 0.0),
         "parse next month ordinal date");
      AUnit.Assertions.Assert
        (ISO_Date.Status = Humanize.Status.Ok
         and then ISO_Date.Value = Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO natural date");
      AUnit.Assertions.Assert
        (ISO_Ordinal_Date.Status = Humanize.Status.Ok
         and then ISO_Ordinal_Date.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO ordinal date");
      AUnit.Assertions.Assert
        (ISO_Week_Date.Status = Humanize.Status.Ok
         and then ISO_Week_Date.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0),
         "parse ISO week date");
      AUnit.Assertions.Assert
        (ISO_Week_Start.Status = Humanize.Status.Ok
         and then ISO_Week_Start.Value =
           Ada.Calendar.Time_Of (2024, 1, 1, 0.0),
         "parse ISO week start date");
      AUnit.Assertions.Assert
        (Scanned_ISO_Week.Status = Humanize.Status.Ok
         and then Scanned_ISO_Week.Value =
           Ada.Calendar.Time_Of (2024, 2, 29, 0.0)
         and then Scanned_ISO_Week.Consumed = 10,
         "scan ISO week date");
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
        (In_Few_Days.Status = Humanize.Status.Ok
         and then In_Few_Days.Value = Ada.Calendar.Time_Of (2024, 1, 4, 0.0),
         "parse fuzzy relative days");
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
        (Friday_Before_Next.Status = Humanize.Status.Ok
         and then Friday_Before_Next.Value =
           Ada.Calendar.Time_Of (2023, 12, 29, 0.0),
         "parse weekday before next");
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
        (Next_Business_Friday.Status = Humanize.Status.Ok
         and then Next_Business_Friday.Value =
           Ada.Calendar.Time_Of (2024, 1, 5, 0.0),
         "parse next business weekday");
      AUnit.Assertions.Assert
        (Three_Business.Status = Humanize.Status.Ok
         and then Three_Business.Value = Ref_Date + 3.0 * 86_400.0,
         "parse business days from now");
      AUnit.Assertions.Assert
        (Several_Business.Status = Humanize.Status.Ok
         and then Several_Business.Value =
           Ada.Calendar.Time_Of (2024, 1, 10, 0.0),
         "parse fuzzy business days from now");
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
        (ISO_Week_Range.Status = Humanize.Status.Ok
         and then ISO_Week_Range.Low =
           Ada.Calendar.Time_Of (2024, 2, 26, 0.0)
         and then ISO_Week_Range.High =
           Ada.Calendar.Time_Of (2024, 3, 4, 0.0),
         "parse ISO week date range");
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
        (Mid_Next_Quarter.Status = Humanize.Status.Ok
         and then Mid_Next_Quarter.Low =
           Ada.Calendar.Time_Of (2024, 5, 2, 0.0)
         and then Mid_Next_Quarter.High =
           Ada.Calendar.Time_Of (2024, 6, 1, 0.0),
         "parse mid next quarter range");
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
        (Next_Business_Week.Status = Humanize.Status.Ok
         and then Next_Business_Week.Low =
           Ada.Calendar.Time_Of (2024, 1, 8, 0.0)
         and then Next_Business_Week.High =
           Ada.Calendar.Time_Of (2024, 1, 13, 0.0),
         "parse next business week range");
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

   procedure Test_Natural_Date_Time_And_Diagnostics
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Parsing.Scheduling_Phrase_Kind;
      use type Humanize.Parsing.Parse_Value_Family;
      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 7, 13, 8.0 * 3_600.0);
      Tomorrow : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Time
          (Reference, "tomorrow at 09:30");
      Relative : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
        Humanize.Parsing.Parse_Natural_Date_Time (Reference, "in 2 hours");
      Scanned : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
        Humanize.Parsing.Scan_Natural_Date_Time
          (Reference, "today 14:00; cached");
      Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Parse_Error_Label
          (Humanize.Parsing.Expected_Unit);
      Context : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Parse_Error_Context_Label
          (Humanize.Parsing.Expected_Number, 5);
      Schedule : constant Humanize.Parsing.Scheduling_Phrase_Result :=
        Humanize.Parsing.Classify_Scheduling_Phrase
          ("every business Friday at noon");
      Schedule_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Phrase_Label (Schedule);
      Ambiguity_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Ambiguity_Label (Schedule);
      Resolution_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Resolution_Label
          (Humanize.Parsing.Ambiguous_Scheduling_Phrase);
      Success_Label : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Parse_Success_Explanation_Label
          (Humanize.Parsing.Parsed_Duration, "1.5h", "90 minutes",
           Consumed => 4, Exact => True);
      Byte_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Byte_Parse_Success_Label
          ("1 KiB", Humanize.Parsing.Parse_Bytes ("1 KiB"));
      Duration_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Duration_Parse_Success_Label
          ("2 h", Humanize.Parsing.Parse_Duration ("2 h"));
      Number_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Number_Parse_Success_Label
          ("forty two", Humanize.Parsing.Parse_Cardinal ("forty two"));
      Unit_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Unit_Parse_Success_Label
          ("3 m", Humanize.Parsing.Parse_Unit ("3 m"));
      Schedule_Success : constant Humanize.Status.Text_Result :=
        Humanize.Parsing.Scheduling_Parse_Success_Label
          ("every Friday", Schedule);
      Parsed_Success : constant Humanize.Parsing.Parse_Success_Explanation :=
        Humanize.Parsing.Parse_Success_Explanation_Label
          ("parse success duration: input=""1.5h"" normalized=""90 minutes"" consumed=4 exact=yes");
      Scanned_Success : constant Humanize.Parsing.Parse_Success_Explanation :=
        Humanize.Parsing.Scan_Success_Explanation_Label
          ("parse success duration: input=""1.5h"" normalized=""90 minutes"" consumed=4 exact=yes"
           & ASCII.LF & "next");
      Buffer : String (1 .. 12);
      Written : Natural;
      Code : Humanize.Status.Status_Code;
   begin
      AUnit.Assertions.Assert
        (Tomorrow.Status = Humanize.Status.Ok
         and then Tomorrow.Has_Time
         and then Tomorrow.Value =
           Ada.Calendar.Time_Of (2026, 7, 14, 9.5 * 3_600.0),
         "parse natural date-time with clock time");
      AUnit.Assertions.Assert
        (Relative.Status = Humanize.Status.Ok
         and then Relative.Has_Relative_Offset
         and then Relative.Value = Reference + 2.0 * 3_600.0,
         "parse natural date-time relative offset");
      AUnit.Assertions.Assert
        (Scanned.Status = Humanize.Status.Ok
         and then Scanned.Has_Time
         and then Scanned.Consumed = 11,
         "scan natural date-time prefix");
      AUnit.Assertions.Assert
        (Label.Status = Humanize.Status.Ok
         and then Support.Text (Label) = "expected-unit",
         "parse error stable label");
      AUnit.Assertions.Assert
        (Context.Status = Humanize.Status.Ok
         and then Support.Text (Context) = "expected a number at position 5",
         "parse error context label");
      AUnit.Assertions.Assert
        (Schedule.Status = Humanize.Status.Ok
         and then Schedule.Ambiguous
         and then Schedule.Kind = Humanize.Parsing.Ambiguous_Scheduling_Phrase,
         "classify ambiguous scheduling phrase");
      AUnit.Assertions.Assert
        (Schedule.Has_Date_Time
         and then Schedule.Has_Business_Day
         and then Schedule.Has_Recurrence,
         "scheduling phrase candidate flags");
      AUnit.Assertions.Assert
        (Schedule_Label.Status = Humanize.Status.Ok
         and then Support.Text (Schedule_Label) =
           "ambiguous scheduling phrase, needs caller disambiguation",
         "scheduling phrase label");
      AUnit.Assertions.Assert
        (Ambiguity_Label.Status = Humanize.Status.Ok
         and then Support.Text (Ambiguity_Label) =
           "ambiguous scheduling phrase: choose date-time, business day, recurrence",
         "scheduling ambiguity label");
      AUnit.Assertions.Assert
        (Resolution_Label.Status = Humanize.Status.Ok
         and then Support.Text (Resolution_Label) =
           "ask caller to choose a scheduling interpretation",
         "scheduling resolution label");
      AUnit.Assertions.Assert
        (Success_Label.Status = Humanize.Status.Ok
         and then Support.Text (Success_Label) =
           "parse success duration: input=""1.5h"" normalized=""90 minutes"" consumed=4 exact=yes",
         "parse success explanation label");
      AUnit.Assertions.Assert
        (Byte_Success.Status = Humanize.Status.Ok
         and then Support.Text (Byte_Success) =
           "parse success bytes: input=""1 KiB"" normalized=""1024 bytes"" consumed=5 exact=yes",
         "byte parse success explanation label");
      AUnit.Assertions.Assert
        (Duration_Success.Status = Humanize.Status.Ok
         and then Support.Text (Duration_Success) =
           "parse success duration: input=""2 h"" normalized=""7200 seconds"" consumed=3 exact=yes",
         "duration parse success explanation label");
      AUnit.Assertions.Assert
        (Number_Success.Status = Humanize.Status.Ok
         and then Support.Text (Number_Success) =
           "parse success number: input=""forty two"" normalized=""42"" consumed=9 exact=yes",
         "number parse success explanation label");
      AUnit.Assertions.Assert
        (Unit_Success.Status = Humanize.Status.Ok
         and then Support.Text (Unit_Success) =
           "parse success unit: input=""3 m"" normalized=""3.00000000000000E+00 METER"" consumed=3 exact=yes",
         "unit parse success explanation label");
      AUnit.Assertions.Assert
        (Schedule_Success.Status = Humanize.Status.Ok
         and then Support.Text (Schedule_Success) =
           "parse success recurrence: input=""every Friday"" normalized=""ambiguous scheduling"" consumed=29 exact=no",
         "scheduling parse success explanation label");
      AUnit.Assertions.Assert
        (Parsed_Success.Status = Humanize.Status.Ok
         and then Parsed_Success.Family = Humanize.Parsing.Parsed_Duration
         and then Parsed_Success.Consumed = 4
         and then Parsed_Success.Exact
         and then Parsed_Success.Input_Length = 4
         and then Parsed_Success.Normalized_Length = 10,
         "parse success explanation parse");
      AUnit.Assertions.Assert
        (Scanned_Success.Status = Humanize.Status.Ok
         and then Scanned_Success.Consumed = 4
         and then Scanned_Success.Normalized_Length = 10,
         "parse success explanation scan");
      Humanize.Parsing.Scheduling_Phrase_Label_Into
        (Schedule, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Humanize.Status.Buffer_Overflow
         and then Written = 12
         and then Buffer = "ambiguous sc",
         "scheduling phrase bounded label");
      Humanize.Parsing.Parse_Error_Context_Label_Into
        (Humanize.Parsing.Unsupported_Form, Buffer, Written, Code, 3);
      AUnit.Assertions.Assert
        (Code = Humanize.Status.Buffer_Overflow
         and then Written = 12
         and then Buffer = "unsupported ",
         "parse error bounded label");
      Humanize.Parsing.Parse_Success_Explanation_Label_Into
        (Humanize.Parsing.Parsed_Duration, "1.5h", "90 minutes",
         Buffer, Written, Code, Consumed => 4);
      AUnit.Assertions.Assert
        (Code = Humanize.Status.Buffer_Overflow
         and then Written = 12
         and then Buffer = "parse succes",
         "parse success bounded label");
   end Test_Natural_Date_Time_And_Diagnostics;

   procedure Test_Parser_Malformed_Input_Matrix
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Reference : constant Ada.Calendar.Time :=
        Ada.Calendar.Time_Of (2026, 7, 16, 12.0 * 3_600.0);
   begin
      declare
         Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
           Humanize.Parsing.Parse_Bytes ("not-a-number KiB");
         Duration : constant Humanize.Parsing.Duration_Parse_Result :=
           Humanize.Parsing.Parse_Duration ("PT");
         Compact : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Compact_Number ("glorb");
         Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
           Humanize.Parsing.Parse_Cardinal ("one two nope");
         Unit : constant Humanize.Parsing.Unit_Parse_Result :=
           Humanize.Parsing.Parse_Unit ("5 not-a-unit");
         Rate : constant Humanize.Parsing.Rate_Parse_Result :=
           Humanize.Parsing.Parse_Rate ("times per maybe");
         List : constant Humanize.Parsing.List_Parse_Result :=
           Humanize.Parsing.Parse_List ("");
         CSS : constant Humanize.Parsing.Color_Label_Parse_Result :=
           Humanize.Parsing.Parse_CSS_Color_Label ("rgb(1,,2)");
         Date : constant Humanize.Parsing.Date_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date (Reference, "next someday");
         Date_Time : constant Humanize.Parsing.Natural_Date_Time_Parse_Result :=
           Humanize.Parsing.Parse_Natural_Date_Time
             (Reference, "tomorrow at 99:99");
      begin
         AUnit.Assertions.Assert
           (Bytes.Status /= Humanize.Status.Ok
            and then Bytes.Error = Humanize.Parsing.Expected_Number,
            "malformed byte parser returns expected-number diagnostic");
         AUnit.Assertions.Assert
           (Duration.Status /= Humanize.Status.Ok
            and then Duration.Error = Humanize.Parsing.Unsupported_Form,
            "malformed duration parser returns unsupported-form diagnostic");
         AUnit.Assertions.Assert
           (Compact.Status /= Humanize.Status.Ok
            and then Compact.Error = Humanize.Parsing.Expected_Number,
            "malformed compact-number parser returns expected-number diagnostic");
         AUnit.Assertions.Assert
           (Cardinal.Status /= Humanize.Status.Ok
            and then Cardinal.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed cardinal parser returns diagnostic");
         AUnit.Assertions.Assert
           (Unit.Status /= Humanize.Status.Ok
            and then Unit.Error = Humanize.Parsing.Expected_Unit,
            "malformed unit parser returns expected-unit diagnostic");
         AUnit.Assertions.Assert
           (Rate.Status /= Humanize.Status.Ok
            and then Rate.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed rate parser returns diagnostic");
         AUnit.Assertions.Assert
           (List.Status /= Humanize.Status.Ok
            and then List.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed list parser returns diagnostic");
         AUnit.Assertions.Assert
           (CSS.Status /= Humanize.Status.Ok
            and then CSS.Error = Humanize.Parsing.Expected_Separator,
            "malformed CSS color parser returns expected-separator diagnostic");
         AUnit.Assertions.Assert
           (Date.Status /= Humanize.Status.Ok
            and then Date.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed natural date parser returns diagnostic");
         AUnit.Assertions.Assert
           (Date_Time.Status /= Humanize.Status.Ok
            and then Date_Time.Error /= Humanize.Parsing.No_Parse_Error,
            "malformed natural date-time parser returns diagnostic");
      end;
   end Test_Parser_Malformed_Input_Matrix;

   procedure Test_Parser_Smoke_Baseline
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Total : Natural := 0;
   begin
      for I in 1 .. 250 loop
         declare
            Bytes : constant Humanize.Parsing.Byte_Parse_Result :=
              Humanize.Parsing.Parse_Bytes ("1.5 KiB");
            Duration : constant Humanize.Parsing.Duration_Parse_Result :=
              Humanize.Parsing.Parse_Duration ("2 hours, 30 minutes");
            Cardinal : constant Humanize.Parsing.Number_Parse_Result :=
              Humanize.Parsing.Parse_Cardinal ("forty two");
            Unit : constant Humanize.Parsing.Unit_Parse_Result :=
              Humanize.Parsing.Parse_Unit ("3 meters");
            Rate : constant Humanize.Parsing.Rate_Parse_Result :=
              Humanize.Parsing.Parse_Rate ("4 times per week");
            List : constant Humanize.Parsing.List_Parse_Result :=
              Humanize.Parsing.Parse_List ("Ada, SPARK and Alire");
         begin
            AUnit.Assertions.Assert
              (Bytes.Status = Humanize.Status.Ok
               and then Duration.Status = Humanize.Status.Ok
               and then Cardinal.Status = Humanize.Status.Ok
               and then Unit.Status = Humanize.Status.Ok
               and then Rate.Status = Humanize.Status.Ok
               and then List.Status = Humanize.Status.Ok,
               "parser smoke baseline iteration" & Integer'Image (I));
            Total :=
              Total
              + Bytes.Consumed
              + Duration.Consumed
              + Cardinal.Consumed
              + Unit.Consumed
              + Rate.Consumed
              + List.Consumed;
         end;
      end loop;

      AUnit.Assertions.Assert
        (Total = 250 * (7 + 19 + 9 + 8 + 16 + 20),
         "parser smoke baseline consumed stable representative inputs");
   end Test_Parser_Smoke_Baseline;

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
      Register_Routine (T, Test_Localized_Render_Parse_Roundtrips'Access,
        "parse localized formatter round trips");
      Register_Routine (T, Test_Localized_Semantic_Parse_Roundtrips'Access,
        "parse localized semantic round trips");
      Register_Routine (T, Test_Diagnostics'Access, "parser diagnostics");
      Register_Routine (T, Test_Frequency_Rate_List'Access,
        "parse frequencies rates and lists");
      Register_Routine
        (T, Test_Natural_Date_Time_And_Diagnostics'Access,
         "parse natural date-time and diagnostics");
      Register_Routine
        (T, Test_Parser_Malformed_Input_Matrix'Access,
         "parser malformed input matrix");
      Register_Routine
        (T, Test_Parser_Smoke_Baseline'Access,
         "parser smoke baseline");
   end Register_Tests;

end Humanize.Tests.Parsing;
