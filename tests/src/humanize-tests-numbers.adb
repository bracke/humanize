with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Locales;
with Humanize.Numbers;
with Humanize.Numbers.Editorial;
with Humanize.Numbers.Ranges;
with Humanize.Numbers.Scales;
with Humanize.Numbers.Spellout;
with Humanize.Numbers.Statistics;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Numbers is

   use Humanize.Numbers;
   use Humanize.Status;

   --  UTF-8 masculine/feminine ordinal indicators (U+00BA / U+00AA).
   ORDM : constant String :=
     Character'Val (16#C2#) & Character'Val (16#BA#);
   FEMORD : constant String :=
     Character'Val (16#C2#) & Character'Val (16#AA#);
   NNBSP : constant String :=
     Character'Val (16#E2#) & Character'Val (16#80#)
     & Character'Val (16#AF#);
   U_E_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A9#);
   U_E_Circumflex : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AA#);
   U_E_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);
   U_E_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AB#);
   U_A_Ring : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);
   U_A_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A4#);
   U_I_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#AD#);
   U_I_Dotless : constant String :=
     Character'Val (16#C4#) & Character'Val (16#B1#);
   U_O_Acute : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B3#);
   U_A_Tilde : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A3#);
   U_C_Cedilla : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A7#);
   U_U_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#BC#);
   U_O_Umlaut : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B6#);
   U_O_Slash : constant String :=
     Character'Val (16#C3#) & Character'Val (16#B8#);
   U_S_Cedilla : constant String :=
     Character'Val (16#C5#) & Character'Val (16#9F#);

   function U (Code : Natural) return String is
   begin
      if Code <= 16#7F# then
         return String'(1 => Character'Val (Code));
      elsif Code <= 16#7FF# then
         return Character'Val (16#C0# + Code / 64)
           & Character'Val (16#80# + Code mod 64);
      elsif Code <= 16#FFFF# then
         return Character'Val (16#E0# + Code / 4_096)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      else
         return Character'Val (16#F0# + Code / 262_144)
           & Character'Val (16#80# + (Code / 4_096) mod 64)
           & Character'Val (16#80# + (Code / 64) mod 64)
           & Character'Val (16#80# + Code mod 64);
      end if;
   end U;

   procedure Check_Ordinal_F
     (Context  : Humanize.Contexts.Context;
      Value    : Natural;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Ordinal (Context, Value, Feminine);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Ordinal_F;

   procedure Test_Ordinal_Gender (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  Romance feminine ordinals differ from the masculine form.
      Check_Ordinal_F (Support.Fr, 1, "1re", "French feminine 1re");
      Check_Ordinal_F (Support.Fr, 2, "2e", "French feminine 2e");
      Check_Ordinal_F (Support.Es, 1, "1." & FEMORD, "Spanish feminine 1.a");
      Check_Ordinal_F (Support.It, 1, "1" & FEMORD, "Italian feminine 1a");
      --  English has no gender distinction.
      Check_Ordinal_F (Support.En, 1, "1st", "English feminine == masculine");
   end Test_Ordinal_Gender;

   procedure Check_Ordinal
     (Context  : Humanize.Contexts.Context;
      Value    : Natural;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Ordinal (Context, Value);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Ordinal;

   procedure Check_Compact
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Compact (Context, Value);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Compact;

   procedure Check_Regional_Cardinal_Fallbacks is
   begin
      for Locale_Access of Humanize.Locales.Regional_Shipped_Locales loop
         declare
            Locale : constant String := Locale_Access.all;
            Base : constant String := Humanize.Locales.Base_Locale (Locale);
            Regional_Result : constant Text_Result :=
              Locale_Cardinal (Support.Locale (Locale), 2_345);
            Base_Result : constant Text_Result :=
              Locale_Cardinal (Support.Locale (Base), 2_345);
         begin
            AUnit.Assertions.Assert
              (Regional_Result.Status = Ok
               and then Base_Result.Status = Ok
               and then Support.Text (Regional_Result) = Support.Text (Base_Result),
               "regional locale cardinal fallback " & Locale & " -> " & Base);
         end;
      end loop;
   end Check_Regional_Cardinal_Fallbacks;

   procedure Check_Regional_Spellout_Tier_Fallbacks is
   begin
      for Locale_Access of Humanize.Locales.Regional_Shipped_Locales loop
         declare
            Locale : constant String := Locale_Access.all;
            Base : constant String := Humanize.Locales.Base_Locale (Locale);
         begin
            AUnit.Assertions.Assert
              (Spellout_Locale_Tier_For (Support.Locale (Locale)) =
               Spellout_Locale_Tier_For (Support.Locale (Base)),
               "regional spellout tier fallback " & Locale & " -> " & Base);
         end;
      end loop;
   end Check_Regional_Spellout_Tier_Fallbacks;

   procedure Test_Ordinal_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Ordinal (Support.En, 1, "1st", "1st");
      Check_Ordinal (Support.En, 2, "2nd", "2nd");
      Check_Ordinal (Support.En, 3, "3rd", "3rd");
      Check_Ordinal (Support.En, 4, "4th", "4th");
      Check_Ordinal (Support.En, 11, "11th", "11th (teen)");
      Check_Ordinal (Support.En, 21, "21st", "21st");
      Check_Ordinal (Support.En, 22, "22nd", "22nd");
      Check_Ordinal (Support.En, 23, "23rd", "23rd");
   end Test_Ordinal_English;

   procedure Test_Cardinal_Fractional (T : in out AUnit.Test_Cases.Test_Case'Class) is separate;

   procedure Test_Ordinal_Other_Locales (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Ordinal (Support.De, 1, "1.", "German 1.");
      Check_Ordinal (Support.De, 21, "21.", "German 21.");
      Check_Ordinal (Support.Da, 2, "2.", "Danish 2.");
      Check_Ordinal (Support.Fr, 1, "1er", "French 1er");
      Check_Ordinal (Support.Fr, 2, "2e", "French 2e");
      Check_Ordinal (Support.Fr, 21, "21e", "French 21e");
      Check_Ordinal (Support.Es, 1, "1." & ORDM, "Spanish 1.o");
      Check_Ordinal (Support.It, 1, "1" & ORDM, "Italian 1o");
   end Test_Ordinal_Other_Locales;

   procedure Test_Compact_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Compact (Support.En, 999, "999", "below 1000 is plain");
      Check_Compact (Support.En, 1_000, "1K", "exactly 1000");
      Check_Compact (Support.En, 1_200, "1.2K", "1.2K");
      Check_Compact (Support.En, 1_500_000, "1.5M", "1.5M");
      Check_Compact (Support.En, 1_000_000_000, "1B", "1B");
      Check_Compact (Support.En, 1_000_000_000_000, "1T", "1T");
      Check_Compact (Support.En, -1_200, "-1.2K", "negative compact");
   end Test_Compact_English;

   procedure Test_Compact_Other_Locales (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  German/Danish use a comma decimal separator.
      Check_Compact (Support.De, 1_200, "1,2 Tsd.", "German thousand suffix");
      Check_Compact (Support.De, 1_000_000, "1 Mio.", "German million suffix");
      Check_Compact (Support.Da, 1_500, "1,5 t", "Danish comma decimal");
      Check_Compact (Support.Da, 1_000_000, "1 mio.", "Danish million suffix");
      Check_Compact (Support.Fr, 1_200, "1,2 k", "French thousand suffix");
      Check_Compact (Support.Fr, 1_000_000, "1 M", "French million suffix");

      declare
         Base       : constant Text_Result :=
           Compact (Support.Locale ("hi"), 1_200_000);
         Hyphenated : constant Text_Result :=
           Compact (Support.Locale ("hi-IN"), 1_200_000);
         Underscore : constant Text_Result :=
           Compact (Support.Locale ("hi_IN"), 1_200_000);
      begin
         AUnit.Assertions.Assert
           (Base.Status = Ok
            and then Hyphenated.Status = Ok
            and then Underscore.Status = Ok
            and then Support.Text (Hyphenated) = Support.Text (Base)
            and then Support.Text (Underscore) = Support.Text (Base),
            "Hindi regional compact tags use language-code fallback");
      end;
   end Test_Compact_Other_Locales;

   procedure Check_Long
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Long_Integer;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result :=
        Compact (Context, Value, Default_Number_Options, Long);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Long;

   procedure Test_Compact_Long (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Long (Support.En, 1_500, "1.5 thousand", "en long thousand");
      Check_Long (Support.En, 1_200_000, "1.2 million", "en long million");
      Check_Long (Support.En, 2_000_000, "2 million", "en long 2 million");
      --  French pluralizes the scale word; comma decimal.
      Check_Long (Support.Fr, 1_200_000, "1,2 million", "fr long one");
      Check_Long (Support.Fr, 2_500_000, "2,5 millions", "fr long plural");
      --  German plural scale word, comma decimal.
      Check_Long (Support.De, 1_500_000, "1,5 Millionen", "de long");
   end Test_Compact_Long;

   procedure Test_Compact_Rollover (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Compact (Support.En, 999_499, "999.5K", "no rollover");
      --  Rounding must promote the tier instead of showing "1000K".
      Check_Compact (Support.En, 999_999, "1M", "999,999 rolls over to 1M");
      Check_Compact (Support.En, 999_950_000, "1B", "rolls over to 1B");
   end Test_Compact_Rollover;

   procedure Test_Count_Grouping (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  Count integers are formatted by i18n locale number rules.
      Check_Ordinal (Support.En, 1234, "1,234th", "English grouped ordinal");
      Check_Ordinal (Support.De, 1234, "1.234.", "German grouped ordinal");
      Check_Ordinal (Support.Fr, 1234, "1" & NNBSP & "234e",
                     "French grouped ordinal");
   end Test_Count_Grouping;

   procedure Check_Percent
     (Context  : Humanize.Contexts.Context;
      Value    : Long_Float;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Percent (Context, Value);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Percent;

   procedure Test_Percent (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Percent (Support.En, 50.0, "50%", "en whole percent");
      Check_Percent (Support.En, 12.5, "12.5%", "en fractional percent");
      Check_Percent (Support.De, 12.5, "12,5%", "de comma decimal percent");
      Check_Percent (Support.Fr, 50.0, "50 %", "fr spaces the percent sign");
   end Test_Percent;

   procedure Test_Editorial_Numbers
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Small : constant Text_Result := Editorial_Number (Support.En, 9);
      Large : constant Text_Result := Editorial_Number (Support.En, 10);
      Grouped : constant Text_Result := Editorial_Number (Support.En, 12_345);
      Negative_Small : constant Text_Result := Editorial_Number (Support.En, -4);
      Negative_Large : constant Text_Result := Editorial_Number (Support.En, -14);
      Age : constant Text_Result := Editorial_Age (Support.En, 5);
      Measurement : constant Text_Result :=
        Editorial_Measurement (Support.En, 5.5, "miles");
      Percent_Text : constant Text_Result :=
        Editorial_Percent (Support.En, 5.0);
      Percent_Word : constant Text_Result :=
        Editorial_Percent (Support.En, 5.0, Include_Symbol => False);
      Small_Ordinal : constant Text_Result :=
        Editorial_Ordinal (Support.En, 3);
      Large_Ordinal : constant Text_Result :=
        Editorial_Ordinal (Support.En, 11);
      Grouped_Ordinal : constant Text_Result :=
        Editorial_Ordinal (Support.En, 1_021);
      Generic_Ordinal : constant Text_Result :=
        Editorial_Number (Support.En, 22, Ordinal_Number);
      Headline_Word : constant Text_Result :=
        Editorial_Number
          (Support.En, 12, Headline_Number,
           (Spell_Out_Below => 10,
            Headline_Spell_Out_Below => 13,
            Group_Digits => True,
            Spell_Zero => True));
      Headline_Digit : constant Text_Result :=
        Editorial_Number
          (Support.En, 13, Headline_Number,
           (Spell_Out_Below => 10,
            Headline_Spell_Out_Below => 13,
            Group_Digits => True,
            Spell_Zero => True));
      No_Group : constant Text_Result :=
        Editorial_Number
          (Support.En, 12_345, General_Number,
           (Spell_Out_Below => 10,
            Headline_Spell_Out_Below => 10,
            Group_Digits => False,
            Spell_Zero => True));
      Custom_Spell : constant Text_Result :=
        Editorial_Number
          (Support.En, 42, General_Number,
           (Spell_Out_Below => 100,
            Headline_Spell_Out_Below => 10,
            Group_Digits => True,
            Spell_Zero => True));
      Invalid_Ordinal : constant Text_Result :=
        Editorial_Number (Support.En, -1, Ordinal_Number);
      Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Small.Status = Ok and then Support.Text (Small) = "nine",
         "editorial small cardinal words");
      AUnit.Assertions.Assert
        (Large.Status = Ok and then Support.Text (Large) = "10",
         "editorial 10 uses digits");
      AUnit.Assertions.Assert
        (Grouped.Status = Ok and then Support.Text (Grouped) = "12,345",
         "editorial grouped digits");
      AUnit.Assertions.Assert
        (Negative_Small.Status = Ok
         and then Support.Text (Negative_Small) = "minus four",
         "editorial negative small words");
      AUnit.Assertions.Assert
        (Negative_Large.Status = Ok and then Support.Text (Negative_Large) = "-14",
         "editorial negative large digits");
      AUnit.Assertions.Assert
        (Age.Status = Ok and then Support.Text (Age) = "5 years old",
         "editorial age uses digits");
      AUnit.Assertions.Assert
        (Measurement.Status = Ok and then Support.Text (Measurement) = "5.5 miles",
         "editorial measurement uses digits");
      AUnit.Assertions.Assert
        (Percent_Text.Status = Ok and then Support.Text (Percent_Text) = "5%",
         "editorial percent symbol");
      AUnit.Assertions.Assert
        (Percent_Word.Status = Ok and then Support.Text (Percent_Word) = "5 percent",
         "editorial percent word");
      AUnit.Assertions.Assert
        (Small_Ordinal.Status = Ok
         and then Support.Text (Small_Ordinal) = "third",
         "editorial small ordinal words");
      AUnit.Assertions.Assert
        (Large_Ordinal.Status = Ok and then Support.Text (Large_Ordinal) = "11th",
         "editorial large ordinal digits");
      AUnit.Assertions.Assert
        (Grouped_Ordinal.Status = Ok
         and then Support.Text (Grouped_Ordinal) = "1,021st",
         "editorial grouped ordinal");
      AUnit.Assertions.Assert
        (Generic_Ordinal.Status = Ok
         and then Support.Text (Generic_Ordinal) = "22nd",
         "editorial generic ordinal usage");
      AUnit.Assertions.Assert
        (Headline_Word.Status = Ok
         and then Support.Text (Headline_Word) = "twelve",
         "editorial headline custom word threshold");
      AUnit.Assertions.Assert
        (Headline_Digit.Status = Ok
         and then Support.Text (Headline_Digit) = "13",
         "editorial headline threshold boundary");
      AUnit.Assertions.Assert
        (No_Group.Status = Ok and then Support.Text (No_Group) = "12345",
         "editorial grouping can be disabled");
      AUnit.Assertions.Assert
        (Custom_Spell.Status = Ok
         and then Support.Text (Custom_Spell) = "forty-two",
         "editorial custom spell threshold");
      AUnit.Assertions.Assert
        (Invalid_Ordinal.Status = Invalid_Value,
         "editorial ordinal rejects negatives");

      Editorial_Number_Into (Support.En, 1_234, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1,234",
         "bounded editorial number");
      Editorial_Age_Into (Support.En, 7, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "7 years old",
         "bounded editorial age");
      Editorial_Percent_Into (Support.En, 12.5, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "12.5%",
         "bounded editorial percent");
   end Test_Editorial_Numbers;

   procedure Test_Number_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is separate;

   procedure Test_Roman (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Simple : constant Text_Result := Roman (4);
      Middle : constant Text_Result := Roman (944);
      Large  : constant Text_Result := Roman (2026);
      Max    : constant Text_Result := Roman (3999);
      Zero   : constant Text_Result := Roman (0);
      Too_Large : constant Text_Result := Roman (4000);
      Buffer : String (1 .. 16);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Simple.Status = Ok and then Support.Text (Simple) = "IV",
         "roman subtractive four");
      AUnit.Assertions.Assert
        (Middle.Status = Ok and then Support.Text (Middle) = "CMXLIV",
         "roman complex value");
      AUnit.Assertions.Assert
        (Large.Status = Ok and then Support.Text (Large) = "MMXXVI",
         "roman current-style value");
      AUnit.Assertions.Assert
        (Max.Status = Ok and then Support.Text (Max) = "MMMCMXCIX",
         "roman maximum conventional value");
      AUnit.Assertions.Assert
        (Zero.Status = Invalid_Value and then Too_Large.Status = Invalid_Value,
         "roman rejects values outside 1..3999");

      Roman_Into (2026, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "MMXXVI",
         "bounded roman");
      Roman_Into (2026, Buffer (1 .. 4), Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Buffer (1 .. Written) = "MMXX",
         "bounded roman overflow");
      Roman_Into (0, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Value and then Written = 0,
         "bounded roman invalid value");
   end Test_Roman;

   procedure Test_SI_Prefix (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Kilo : constant Text_Result := SI_Prefix (Support.En, 1_500.0, "m");
      Micro : constant Text_Result := SI_Prefix (Support.En, 0.000_002, "s");
      Nano : constant Text_Result := SI_Prefix (Support.En, -0.000_000_42, "s");
      Plain : constant Text_Result := SI_Prefix (Support.En, 42.0, "m");
      Long_Text : constant Text_Result :=
        SI_Prefix
          (Support.En, 2_500_000.0, "bytes",
           (Number_Style => (Maximum_Fraction_Digits => 2,
                             Suppress_Trailing_Zero => True),
            Prefix_Style => SI_Long,
            Space_Before_Unit => True));
      Tight : constant Text_Result :=
        SI_Prefix
          (Support.En, 1_500.0, "m",
           (Number_Style => Default_Number_Options,
            Prefix_Style => SI_Symbol,
            Space_Before_Unit => False));
      Buffer : String (1 .. 16);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Kilo.Status = Ok and then Support.Text (Kilo) = "1.5 km",
         "SI kilo symbol with unit");
      AUnit.Assertions.Assert
        (Micro.Status = Ok and then Support.Text (Micro) = "2 us",
         "SI micro symbol uses ASCII u");
      AUnit.Assertions.Assert
        (Nano.Status = Ok and then Support.Text (Nano) = "-420 ns",
         "SI nano negative value");
      AUnit.Assertions.Assert
        (Plain.Status = Ok and then Support.Text (Plain) = "42 m",
         "SI base unit");
      AUnit.Assertions.Assert
        (Long_Text.Status = Ok
         and then Support.Text (Long_Text) = "2.5 megabytes",
         "SI long prefix with unit");
      AUnit.Assertions.Assert
        (Tight.Status = Ok and then Support.Text (Tight) = "1.5km",
         "SI symbol without spacing");

      SI_Prefix_Into (Support.En, 1_500.0, Buffer, Written, Code, "m");
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.5 km",
         "bounded SI prefix");
   end Test_SI_Prefix;

   procedure Test_Approximate (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      About_Result : constant Text_Result := Approximate (Support.En, 10);
      Over_Result : constant Text_Result :=
        Approximate (Support.En, 1_000, Over);
      Almost_Result : constant Text_Result :=
        Approximate_To (Support.En, 98, 100, (Threshold => 5));
      Under_Result : constant Text_Result :=
        Approximate_To (Support.En, 80, 100, (Threshold => 5));
   begin
      AUnit.Assertions.Assert
        (About_Result.Status = Ok and then Support.Text (About_Result) = "about 10",
         "about approximation");
      AUnit.Assertions.Assert
        (Over_Result.Status = Ok and then Support.Text (Over_Result) = "over 1000",
         "over approximation");
      AUnit.Assertions.Assert
        (Almost_Result.Status = Ok
         and then Support.Text (Almost_Result) = "almost 100",
         "automatic almost approximation");
      AUnit.Assertions.Assert
        (Under_Result.Status = Ok and then Support.Text (Under_Result) = "under 100",
         "automatic under approximation");
   end Test_Approximate;

   procedure Test_Dataset_Summaries (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Distribution : constant Text_Result :=
        Distribution_Summary_Label (3, 10.0, 20.0, 30.0, "ms");
      Percentiles : constant Text_Result :=
        Percentile_Summary_Label (42.0, 120.0, 300.0, "ms");
      Outliers : constant Text_Result := Outlier_Summary_Label (2, 100);
      Shape : constant Text_Result :=
        Distribution_Shape_Label
          (100, 10.0, 18.0, 20.0, 22.0, 40.0, Unit => "ms");
      Shape_Metadata : constant Distribution_Shape_Metadata :=
        Distribution_Shape_Metadata_For
          (100, 10.0, 18.0, 20.0, 22.0, 40.0);
      Shape_Metadata_Label_Result : constant Text_Result :=
        Distribution_Shape_Metadata_Label (Shape_Metadata);
      Buffer : String (1 .. 20);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Distribution.Status = Ok
         and then Support.Text (Distribution) =
           "3 observations, min 1.00000000000000E+01 ms, median "
           & "2.00000000000000E+01 ms, max 3.00000000000000E+01 ms",
         "distribution summary");
      AUnit.Assertions.Assert
        (Percentiles.Status = Ok
         and then Support.Text (Percentiles) =
           "p50 4.20000000000000E+01 ms, p95 "
           & "1.20000000000000E+02 ms, p99 3.00000000000000E+02 ms",
         "percentile summary");
      AUnit.Assertions.Assert
        (Outliers.Status = Ok
         and then Support.Text (Outliers) =
           "2 outliers out of 100 observations",
         "outlier summary");
      AUnit.Assertions.Assert
        (Shape.Status = Ok
         and then Support.Text (Shape) =
           "right-skewed distribution, median 2.00000000000000E+01 ms",
         "distribution shape summary");
      AUnit.Assertions.Assert
        (Shape_Metadata.Kind = Right_Skewed_Shape
         and then Shape_Metadata.Strong_Conclusion,
         "distribution shape metadata");
      AUnit.Assertions.Assert
        (Shape_Metadata_Label_Result.Status = Ok
         and then Support.Text (Shape_Metadata_Label_Result) =
           "shape=right-skewed count=100 spread=3.00000000000000E+01 "
           & "iqr=4.00000000000000E+00 outliers=0 confidence=strong",
         "distribution shape metadata label");
      Distribution_Summary_Label_Into
        (3, 10.0, 20.0, 30.0, Buffer, Written, Code, "ms");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow
         and then Written = 20
         and then Buffer = "3 observations, min ",
         "bounded distribution summary");
      Distribution_Shape_Label_Into
        (100, 10.0, 18.0, 20.0, 22.0, 40.0, Buffer, Written, Code,
         Unit => "ms");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 20
         and then Buffer = "right-skewed distrib",
         "bounded distribution shape");
   end Test_Dataset_Summaries;

   procedure Test_Public_Number_Children
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);

      procedure Check_Same
        (Left    : Text_Result;
         Right   : Text_Result;
         Message : String)
      is
      begin
         AUnit.Assertions.Assert
           (Left.Status = Right.Status
            and then Support.Text (Left) = Support.Text (Right),
            Message & " child/root parity");
      end Check_Same;
   begin
      Check_Same
        (Humanize.Numbers.Editorial.Editorial_Age (Support.En, 7),
         Editorial_Age (Support.En, 7),
         "editorial age");
      Check_Same
        (Humanize.Numbers.Ranges.Between (Support.En, 3, 7),
         Between (Support.En, 3, 7),
         "range between");
      Check_Same
        (Humanize.Numbers.Scales.SI_Prefix (Support.En, 1_500.0, "m"),
         SI_Prefix (Support.En, 1_500.0, "m"),
         "SI prefix");
      Check_Same
        (Humanize.Numbers.Spellout.Ordinal_Words (Support.En, 21),
         Ordinal_Words (Support.En, 21),
         "ordinal words");
      Check_Same
        (Humanize.Numbers.Statistics.Outlier_Summary_Label (2, 100),
         Outlier_Summary_Label (2, 100),
         "outlier summary");
   end Test_Public_Number_Children;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize number tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Ordinal_English'Access, "English ordinals");
      Register_Routine (T, Test_Cardinal_Fractional'Access,
        "cardinal words and fractions");
      Register_Routine (T, Test_Ordinal_Other_Locales'Access,
        "German/Danish ordinals");
      Register_Routine (T, Test_Compact_English'Access, "English compact");
      Register_Routine (T, Test_Compact_Other_Locales'Access,
        "German/Danish compact suffixes");
      Register_Routine (T, Test_Ordinal_Gender'Access, "feminine ordinals");
      Register_Routine (T, Test_Compact_Long'Access, "long-form compact");
      Register_Routine (T, Test_Percent'Access, "percent formatting");
      Register_Routine (T, Test_Editorial_Numbers'Access,
        "editorial number style");
      Register_Routine (T, Test_Compact_Rollover'Access, "compact tier rollover");
      Register_Routine (T, Test_Count_Grouping'Access, "locale count grouping");
      Register_Routine (T, Test_Number_Bounded'Access, "bounded number APIs");
      Register_Routine (T, Test_Roman'Access, "Roman numerals");
      Register_Routine (T, Test_SI_Prefix'Access, "SI prefix formatting");
      Register_Routine (T, Test_Approximate'Access, "approximate numbers");
      Register_Routine (T, Test_Dataset_Summaries'Access, "dataset summaries");
      Register_Routine (T, Test_Public_Number_Children'Access,
        "public number child facades");
   end Register_Tests;

end Humanize.Tests.Numbers;
