with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Status;
with Humanize.Units;
with Humanize.Tests.Support;

package body Humanize.Tests.Units is

   use Humanize.Status;
   use Humanize.Units;

   --  UTF-8 'e' grave for French expectations.
   EG : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A8#);

   procedure Check
     (Context  : Humanize.Contexts.Context;
      Value    : Natural;
      Unit     : Unit_Kind;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Format (Context, Value, Unit);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Support.En, 1, Meter, "1 meter", "one meter");
      Check (Support.En, 5, Meter, "5 meters", "five meters");
      Check (Support.En, 3, Kilogram, "3 kilograms", "kilograms");
      Check (Support.En, 1, Liter, "1 liter", "one liter");
      Check (Support.En, 1234, Meter, "1,234 meters", "grouped meters");
   end Test_English;

   procedure Test_Locales (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  German/Danish unit words are plural-invariant.
      Check (Support.De, 5, Meter, "5 Meter", "German invariant meter");
      Check (Support.Da, 5, Meter, "5 meter", "Danish invariant meter");
      Check (Support.De, 2, Kilogram, "2 Kilogramm", "German kilogram");
      --  French pluralizes and uses an accented word.
      Check (Support.Fr, 1, Meter, "1 m" & EG & "tre", "French one metre");
      Check (Support.Fr, 5, Meter, "5 m" & EG & "tres", "French metres");
      Check (Support.Fr, 3, Kilometer, "3 kilom" & EG & "tres",
             "French kilometres");
      Check (Support.Fr, 2, Gram, "2 grammes", "French grams");
   end Test_Locales;

   procedure Test_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 5, Kilometer, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "5 kilometers",
         "bounded unit, status " & Status_Image (Code));
   end Test_Bounded;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize unit tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_English'Access, "English units");
      Register_Routine (T, Test_Locales'Access, "German/Danish/French units");
      Register_Routine (T, Test_Bounded'Access, "bounded unit API");
   end Register_Tests;

end Humanize.Tests.Units;
