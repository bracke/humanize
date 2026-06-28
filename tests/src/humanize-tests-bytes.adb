with AUnit.Assertions;

with Humanize.Bytes;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Bytes is

   use Humanize.Bytes;
   use Humanize.Status;

   Binary_1  : constant Byte_Options := (Binary, 1, True);
   Decimal_1 : constant Byte_Options := (Decimal, 1, True);

   procedure Check
     (Bytes    : Byte_Count;
      Options  : Byte_Options;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Format (Support.En, Bytes, Options);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Bytes_Unit (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (0, Binary_1, "0 bytes", "zero bytes");
      Check (1, Binary_1, "1 byte", "one byte");
      Check (2, Binary_1, "2 bytes", "two bytes");
      Check (1023, Binary_1, "1023 bytes", "1023 binary stays bytes");
      Check (999, Decimal_1, "999 bytes", "999 decimal stays bytes");
   end Test_Bytes_Unit;

   procedure Test_Binary (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (1024, Binary_1, "1 KiB", "1024 binary is 1 KiB");
      Check (1536, Binary_1, "1.5 KiB", "1536 binary is 1.5 KiB");
   end Test_Binary;

   procedure Test_Decimal (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (1000, Decimal_1, "1 kB", "1000 decimal is 1 kB");
      Check (1500, Decimal_1, "1.5 kB", "1500 decimal is 1.5 kB");
   end Test_Decimal;

   procedure Test_System_Distinction (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (1500, Binary_1, "1.5 KiB", "1500 binary uses KiB");
      Check (1500, Decimal_1, "1.5 kB", "1500 decimal uses kB");
   end Test_System_Distinction;

   procedure Test_Fraction_Suppression (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Keep : constant Byte_Options := (Binary, 1, False);
   begin
      Check (2048, Binary_1, "2 KiB", "trailing .0 suppressed");
      Check (2048, Keep, "2.0 KiB", "trailing .0 kept when not suppressing");
   end Test_Fraction_Suppression;

   procedure Test_Fraction_Digit_Limit (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Two_Digits : constant Byte_Options := (Binary, 2, True);
      Zero_Digit : constant Byte_Options := (Binary, 0, True);
   begin
      Check (1300, Binary_1, "1.3 KiB", "one fraction digit");
      Check (1300, Two_Digits, "1.27 KiB", "two fraction digits");
      Check (1536, Zero_Digit, "2 KiB", "zero digits rounds half away from zero");
   end Test_Fraction_Digit_Limit;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize byte tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Bytes_Unit'Access, "plain byte counts");
      Register_Routine (T, Test_Binary'Access, "binary KiB");
      Register_Routine (T, Test_Decimal'Access, "decimal kB");
      Register_Routine (T, Test_System_Distinction'Access,
        "binary vs decimal distinction");
      Register_Routine (T, Test_Fraction_Suppression'Access,
        "fraction suppression");
      Register_Routine (T, Test_Fraction_Digit_Limit'Access,
        "fraction digit limit");
   end Register_Tests;

end Humanize.Tests.Bytes;
