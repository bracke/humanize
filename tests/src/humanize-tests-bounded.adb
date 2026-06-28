with AUnit.Assertions;

with Ada.Calendar;

with Humanize.Bytes;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Bounded is

   use Humanize.Status;
   use Humanize.Durations;

   --  600 seconds -> "10 minutes" (10 characters), a stable fixture.

   procedure Test_Exact_Fit (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 10);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 600, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 10
         and then Buffer (1 .. Written) = "10 minutes",
         "exact-fit buffer, status " & Status_Image (Code));
   end Test_Exact_Fit;

   procedure Test_Oversized (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 40);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 600, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 10
         and then Buffer (1 .. Written) = "10 minutes",
         "oversized buffer, status " & Status_Image (Code));
   end Test_Oversized;

   procedure Test_One_Too_Small (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 9);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 600, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 9
         and then Buffer (1 .. Written) = "10 minute",
         "one-char-too-small overflow, status " & Status_Image (Code)
         & " written" & Natural'Image (Written));
   end Test_One_Too_Small;

   procedure Test_Zero_Length (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 0);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 600, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 0,
         "zero-length buffer overflow, status " & Status_Image (Code));
   end Test_Zero_Length;

   procedure Test_Non_1_Based (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (2 .. 20);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, 600, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "non-1-based buffer is Invalid_Options, status " & Status_Image (Code));
   end Test_Non_1_Based;

   procedure Test_Failure_Written_Zero (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 20);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Into (Support.En, -1, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Value and then Written = 0,
         "non-overflow failure writes nothing, status " & Status_Image (Code));
   end Test_Failure_Written_Zero;

   procedure Test_Datetime_Into (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref     : constant Time := Time_Of (2026, 3, 21, Day_Duration (43_200));
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Humanize.Datetimes.Relative_Into
        (Support.En, Ref - Duration (10), Ref, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "now",
         "datetime bounded render, status " & Status_Image (Code));
   end Test_Datetime_Into;

   procedure Test_Bytes_Into (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 16);
      Written : Natural;
      Code    : Status_Code;
   begin
      Humanize.Bytes.Format_Into (Support.En, 1536, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1.5 KiB",
         "bytes bounded render, status " & Status_Image (Code));
   end Test_Bytes_Into;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize bounded API tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Exact_Fit'Access, "exact-fit buffer");
      Register_Routine (T, Test_Oversized'Access, "oversized buffer");
      Register_Routine (T, Test_One_Too_Small'Access, "one char too small");
      Register_Routine (T, Test_Zero_Length'Access, "zero-length buffer");
      Register_Routine (T, Test_Non_1_Based'Access, "non-1-based buffer");
      Register_Routine (T, Test_Failure_Written_Zero'Access,
        "non-overflow failure writes nothing");
      Register_Routine (T, Test_Datetime_Into'Access, "datetime bounded");
      Register_Routine (T, Test_Bytes_Into'Access, "bytes bounded");
   end Register_Tests;

end Humanize.Tests.Bounded;
