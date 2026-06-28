with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Numbers;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Numbers is

   use Humanize.Numbers;
   use Humanize.Status;

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
      Check_Compact (Support.De, 1_200, "1.2 Tsd.", "German thousand suffix");
      Check_Compact (Support.De, 1_000_000, "1 Mio.", "German million suffix");
      Check_Compact (Support.Da, 1_000_000, "1 mio.", "Danish million suffix");
   end Test_Compact_Other_Locales;

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
      Register_Routine (T, Test_Number_Bounded'Access, "bounded number APIs");
   end Register_Tests;

end Humanize.Tests.Numbers;
