with AUnit.Assertions;

with Ada.Calendar;

with Humanize.Bounded_Text;
with Humanize.Bytes;
with Humanize.Capabilities;
with Humanize.Colors;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Parsing;
with Humanize.Phrases;
with Humanize.Status;
with Humanize.Tests.Support;
with Humanize.Units;

package body Humanize.Tests.Bounded is

   use Humanize.Status;
   use Humanize.Durations;

   procedure Assert_Into_Matches
     (Expected : Humanize.Status.Text_Result;
      Buffer   : String;
      Written  : Natural;
      Code     : Status_Code;
      Message  : String)
   is
      Text : constant String := Humanize.Bounded_Text.Result_Text (Expected);
   begin
      AUnit.Assertions.Assert
         (Expected.Status = Ok
         and then Code = Ok
         and then Written = Text'Length
         and then Buffer (Buffer'First .. Buffer'First + Written - 1) = Text,
         Message & ", status " & Status_Image (Code));
   end Assert_Into_Matches;

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

   procedure Test_Bounded_Audit_Coverage
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 80);
      Written : Natural;
      Code    : Status_Code;
   begin
      Humanize.Capabilities.Area_Label_Into
        (Humanize.Capabilities.Parsing_Area, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Capabilities.Area_Label
           (Humanize.Capabilities.Parsing_Area),
         Buffer, Written, Code, "capability area bounded");

      Humanize.Capabilities.Rendering_Source_Label_Into
        (Humanize.Deterministic_Text, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Capabilities.Rendering_Source_Label
           (Humanize.Deterministic_Text),
         Buffer, Written, Code, "rendering source bounded");

      Humanize.Parsing.Normalize_Number_Text_Into
        ("1_234,5", Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Parsing.Normalize_Number_Text ("1_234,5"),
         Buffer, Written, Code, "normalize number bounded");

      Humanize.Parsing.Normalize_Unit_Text_Into
        ("KILO-METERS", Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Parsing.Normalize_Unit_Text ("KILO-METERS"),
         Buffer, Written, Code, "normalize unit bounded");

      Humanize.Parsing.Normalize_List_Text_Into
        ("a og b", Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Parsing.Normalize_List_Text ("a og b"),
         Buffer, Written, Code, "normalize list bounded");

      Humanize.Parsing.Diagnostic_Label_Into
        (Humanize.Parsing.Expected_Unit, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Parsing.Diagnostic_Label (Humanize.Parsing.Expected_Unit),
         Buffer, Written, Code, "diagnostic label bounded");

      Humanize.Colors.Palette_Metadata_Label_Into
        (Humanize.Colors.Color_List'
           ([1 => (Red => 0, Green => 0, Blue => 0),
             2 => (Red => 51, Green => 102, Blue => 153),
             3 => (Red => 255, Green => 255, Blue => 255)]),
         Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Colors.Palette_Metadata_Label
           (Humanize.Colors.Color_List'
              ([1 => (Red => 0, Green => 0, Blue => 0),
                2 => (Red => 51, Green => 102, Blue => 153),
                3 => (Red => 255, Green => 255, Blue => 255)])),
         Buffer, Written, Code, "palette metadata bounded");

      Step_Count_Into (Support.En, 2, 5, Buffer, Written, Code);
      Assert_Into_Matches
        (Step_Count (Support.En, 2, 5),
         Buffer, Written, Code, "step count bounded");

      Progress_Bar_Into (Support.En, 3, 10, Buffer, Written, Code);
      Assert_Into_Matches
        (Progress_Bar (Support.En, 3, 10),
         Buffer, Written, Code, "progress bar bounded");

      Business_Days_Into (Support.En, 3, Buffer, Written, Code);
      Assert_Into_Matches
        (Business_Days (Support.En, 3),
         Buffer, Written, Code, "business days bounded");

      Recurrence_Into (Support.En, 2, Every_Day, Buffer, Written, Code);
      Assert_Into_Matches
        (Recurrence (Support.En, 2, Every_Day),
         Buffer, Written, Code, "recurrence bounded");

      Humanize.Units.Format_Memory_Bandwidth_Into
        (Support.En, 1_500_000.0, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Units.Format_Memory_Bandwidth (Support.En, 1_500_000.0),
         Buffer, Written, Code, "memory bandwidth bounded");

      Humanize.Units.Format_Database_Throughput_Into
        (Support.En, 12_500.0, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Units.Format_Database_Throughput (Support.En, 12_500.0),
         Buffer, Written, Code, "database throughput bounded");

      Humanize.Units.Format_Geographic_Distance_Into
        (Support.En, 1_500.0, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Units.Format_Geographic_Distance (Support.En, 1_500.0),
         Buffer, Written, Code, "geographic distance bounded");

      Humanize.Phrases.Severity_Label_Into
        (Humanize.Phrases.Success_Severity, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Severity_Label
           (Humanize.Phrases.Success_Severity),
         Buffer, Written, Code, "severity label bounded");

      Humanize.Phrases.CI_Phrase_Into
        (Support.En, Humanize.Phrases.Pipeline_Passed, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.CI_Phrase
           (Support.En, Humanize.Phrases.Pipeline_Passed),
         Buffer, Written, Code, "CI phrase bounded");

      Humanize.Phrases.Ticket_Phrase_Into
        (Support.En, Humanize.Phrases.Ticket_Open, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Ticket_Phrase
           (Support.En, Humanize.Phrases.Ticket_Open),
         Buffer, Written, Code, "ticket phrase bounded");

      Humanize.Phrases.Field_Added_Summary_Into
        (Support.En, "title", "final", Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Field_Added_Summary
           (Support.En, "title", "final"),
         Buffer, Written, Code, "field added bounded");

      Humanize.Phrases.Field_Removed_Summary_Into
        (Support.En, "title", "draft", Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Field_Removed_Summary
           (Support.En, "title", "draft"),
         Buffer, Written, Code, "field removed bounded");

      Humanize.Phrases.Field_Unchanged_Summary_Into
        (Support.En, "status", "open", Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Field_Unchanged_Summary
           (Support.En, "status", "open"),
         Buffer, Written, Code, "field unchanged bounded");

      Humanize.Phrases.Payment_Lifecycle_Phrase_Into
        (Support.En, Humanize.Phrases.Payment_Captured, Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Payment_Lifecycle_Phrase
           (Support.En, Humanize.Phrases.Payment_Captured),
         Buffer, Written, Code, "payment phrase bounded");

      Humanize.Phrases.Webhook_Phrase_Into
        (Support.En, Humanize.Phrases.Webhook_Delivered,
         Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Webhook_Phrase
           (Support.En, Humanize.Phrases.Webhook_Delivered),
         Buffer, Written, Code, "webhook phrase bounded");

      Humanize.Phrases.Invoice_Phrase_Into
        (Support.En, Humanize.Phrases.Invoice_Overdue,
         Buffer, Written, Code);
      Assert_Into_Matches
        (Humanize.Phrases.Invoice_Phrase
           (Support.En, Humanize.Phrases.Invoice_Overdue),
         Buffer, Written, Code, "invoice phrase bounded");
   end Test_Bounded_Audit_Coverage;

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
      Register_Routine
        (T, Test_Bounded_Audit_Coverage'Access, "bounded audit coverage");
   end Register_Tests;

end Humanize.Tests.Bounded;
