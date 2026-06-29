with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Numbers;
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
      --  Count integers are locale-grouped (1234 -> 1,234 / 1.234 / 1 234).
      Check_Ordinal (Support.En, 1234, "1,234th", "English grouped ordinal");
      Check_Ordinal (Support.De, 1234, "1.234.", "German grouped ordinal");
      Check_Ordinal (Support.Fr, 1234, "1" & ' ' & "234e",
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

   procedure Test_Number_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Ordinal_Into (Support.En, 22, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "22nd",
         "bounded ordinal, status " & Status_Image (Code));
      Compact_Into (Support.En, 1_200, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.2K",
         "bounded compact, status " & Status_Image (Code));
   end Test_Number_Bounded;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize number tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Ordinal_English'Access, "English ordinals");
      Register_Routine (T, Test_Ordinal_Other_Locales'Access,
        "German/Danish ordinals");
      Register_Routine (T, Test_Compact_English'Access, "English compact");
      Register_Routine (T, Test_Compact_Other_Locales'Access,
        "German/Danish compact suffixes");
      Register_Routine (T, Test_Ordinal_Gender'Access, "feminine ordinals");
      Register_Routine (T, Test_Compact_Long'Access, "long-form compact");
      Register_Routine (T, Test_Percent'Access, "percent formatting");
      Register_Routine (T, Test_Compact_Rollover'Access, "compact tier rollover");
      Register_Routine (T, Test_Count_Grouping'Access, "locale count grouping");
      Register_Routine (T, Test_Number_Bounded'Access, "bounded number APIs");
   end Register_Tests;

end Humanize.Tests.Numbers;
