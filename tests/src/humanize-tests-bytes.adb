with AUnit.Assertions;

with Humanize.Bytes;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Bytes is

   use Humanize.Bytes;
   use Humanize.Status;

   Binary_1  : constant Byte_Options := (Binary, 1, True);
   Decimal_1 : constant Byte_Options := (Decimal, 1, True);
   Auto_1    : constant Byte_Options := (Auto, 1, True);

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
      Check (1023, Binary_1, "1,023 bytes", "1023 binary stays bytes (grouped)");
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

   procedure Test_Locale_Decimal (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      --  German/Danish use a comma decimal separator.
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.De, 1536, Binary_1)) = "1,5 KiB",
         "German byte decimal separator");
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.Da, 1536, Binary_1)) = "1,5 KiB",
         "Danish byte decimal separator");
      --  Grouping in the four-digit KiB range (1023 KiB).
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.En, 1_047_552, Binary_1)) = "1,023 KiB",
         "English thousands grouping");
      AUnit.Assertions.Assert
        (Support.Text (Format (Support.De, 1_047_552, Binary_1)) = "1.023 KiB",
         "German thousands grouping");
   end Test_Locale_Decimal;

   procedure Test_Auto_And_File_Polish
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Auto_Decimal : constant Text_Result := Format (Support.En, 2_000, Auto_1);
      Auto_Binary : constant Text_Result := Format (Support.En, 1_536, Auto_1);
      Files : constant Text_Result :=
        File_Size_Summary (Support.En, 3, 1_536, Binary_1);
      One_File : constant Text_Result :=
        File_Size_Summary (Support.En, 1, 1_536, Binary_1);
      No_Files : constant Text_Result :=
        File_Size_Summary (Support.En, 0, 0, Binary_1);
      Remaining : constant Text_Result :=
        Transfer_Remaining_Label (Support.En, 2_000_000, Auto_1);
      Remaining_With_Rate : constant Text_Result :=
        Transfer_Remaining_Label (Support.En, 2_000_000, 1_000, Auto_1);
      Complete : constant Text_Result :=
        Transfer_Remaining_Label (Support.En, 0, Auto_1);
      Stalled : constant Text_Result :=
        Transfer_Remaining_Label (Support.En, 2_000_000, 0, Auto_1);
      Disk : constant Text_Result :=
        Disk_Usage_Label (Support.En, 1_500, 10_000, Decimal_1);
      Bad_Disk : constant Text_Result :=
        Disk_Usage_Label (Support.En, 1, 0, Decimal_1);
      Buffer : String (1 .. 32);
      Written : Natural;
      Code : Status_Code;
   begin
      AUnit.Assertions.Assert
        (Auto_Decimal.Status = Ok and then Support.Text (Auto_Decimal) = "2 kB",
         "auto byte options prefer decimal for decimal-aligned values");
      AUnit.Assertions.Assert
        (Auto_Binary.Status = Ok and then Support.Text (Auto_Binary) = "1.5 KiB",
         "auto byte options keep binary for binary-aligned values");
      AUnit.Assertions.Assert
        (Files.Status = Ok and then Support.Text (Files) = "3 files, 1.5 KiB",
         "file size summary");
      AUnit.Assertions.Assert
        (One_File.Status = Ok
         and then Support.Text (One_File) = "1 file, 1.5 KiB",
         "single file size summary");
      AUnit.Assertions.Assert
        (No_Files.Status = Ok
         and then Support.Text (No_Files) = "no files, 0 bytes",
         "empty file size summary");
      AUnit.Assertions.Assert
        (Remaining.Status = Ok
         and then Support.Text (Remaining) = "2 MB remaining",
         "transfer remaining label");
      AUnit.Assertions.Assert
        (Remaining_With_Rate.Status = Ok
         and then Support.Text (Remaining_With_Rate) =
           "2 MB remaining at 1 kB/s",
         "transfer remaining label with rate");
      AUnit.Assertions.Assert
        (Complete.Status = Ok
         and then Support.Text (Complete) = "transfer complete",
         "transfer complete label");
      AUnit.Assertions.Assert
        (Stalled.Status = Ok
         and then Support.Text (Stalled) = "2 MB remaining, stalled",
         "stalled transfer label");
      AUnit.Assertions.Assert
        (Disk.Status = Ok
         and then Support.Text (Disk) = "1.5 kB of 10 kB used (15%)",
         "disk usage label");
      AUnit.Assertions.Assert
        (Bad_Disk.Status = Invalid_Value,
         "zero total disk usage is invalid");

      File_Size_Summary_Into
        (Support.En, 3, 1_536, Buffer, Written, Code, Binary_1);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "3 files, 1.5 KiB",
         "file summary bounded");
      Transfer_Remaining_Label_Into
        (Support.En, 2_000_000, Buffer, Written, Code, Auto_1);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "2 MB remaining",
         "transfer remaining bounded");
      Transfer_Remaining_Label_Into
        (Support.En, 2_000_000, 1_000, Buffer, Written, Code, Auto_1);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "2 MB remaining at 1 kB/s",
         "transfer remaining rate bounded");
      Disk_Usage_Label_Into
        (Support.En, 1_500, 10_000, Buffer, Written, Code, Decimal_1);
      AUnit.Assertions.Assert
        (Code = Ok
         and then Buffer (1 .. Written) = "1.5 kB of 10 kB used (15%)",
         "disk usage bounded");
   end Test_Auto_And_File_Polish;

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
      Register_Routine (T, Test_Locale_Decimal'Access,
        "locale decimal separator and grouping");
      Register_Routine (T, Test_Auto_And_File_Polish'Access,
        "auto byte and file polish");
   end Register_Tests;

end Humanize.Tests.Bytes;
