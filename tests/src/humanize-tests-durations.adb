with AUnit.Assertions;

with Ada.Calendar;

with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Durations is

   use Humanize.Durations;
   use Humanize.Status;

   U_A_Grave : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A0#);

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

   procedure Check
     (Seconds  : Duration_Seconds;
      Expected : String;
      Message  : String)
   is
      Result : constant Text_Result := Format (Support.En, Seconds);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Check_Status
     (Seconds  : Duration_Seconds;
      Options  : Duration_Options;
      Expected : Status_Code;
      Message  : String)
   is
      Result : constant Text_Result := Format (Support.En, Seconds, Options);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Expected,
         Message & " -> expected status " & Status_Image (Expected)
         & " got " & Status_Image (Result.Status));
   end Check_Status;

   procedure Test_Negative (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Status (-1, Default_Duration_Options, Invalid_Value,
                    "negative duration");
   end Test_Negative;

   procedure Test_Whole_Units (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Info : constant Duration_Render_Metadata := Format_Metadata (3_661);
   begin
      Check (0, "0 seconds", "zero");
      Check (1, "1 second", "one second");
      Check (2, "2 seconds", "two seconds");
      Check (59, "59 seconds", "59 seconds");
      Check (60, "1 minute", "60 seconds is 1 minute");
      Check (90, "1 minute", "90 seconds is 1 minute");
      Check (3600, "1 hour", "3600 seconds is 1 hour");
      Check (3661, "1 hour", "3661 seconds is 1 hour");
      Check (86_400, "1 day", "86400 seconds is 1 day");
      Check (7 * 86_400, "1 week", "7 days is 1 week");
      Check (30 * 86_400, "1 month", "30 days is 1 month");
      Check (365 * 86_400, "1 year", "365 days is 1 year");
      AUnit.Assertions.Assert
        (Info.Status = Ok
         and then Info.Hours = 1
         and then Info.Minutes = 1
         and then Info.Seconds = 1
         and then Info.Component_Count = 3,
         "duration render metadata");
   end Test_Whole_Units;

   procedure Check_Multi
     (Context        : Humanize.Contexts.Context;
      Seconds        : Duration_Seconds;
      Max_Components : Positive;
      Expected       : String;
      Message        : String)
   is
      Result : constant Text_Result :=
        Format_Components (Context, Seconds, Max_Components);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check_Multi;

   procedure Test_Multi_Unit (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check_Multi (Support.En, 3661, 2, "1 hour and 1 minute", "two components");
      Check_Multi (Support.En, 90, 2, "1 minute and 30 seconds",
                   "minute+second");
      Check_Multi (Support.En, 3661, 3, "1 hour, 1 minute and 1 second",
                   "three components");
      Check_Multi (Support.En, 60, 1, "1 minute", "single component");
      Check_Multi (Support.En, 0, 2, "0 seconds", "zero stays single");
      Check_Multi
        (Support.En, 400 * 86_400, 3, "1 year, 1 month and 5 days",
         "year month day components");
      Check_Multi (Support.De, 3661, 2, "1 Stunde und 1 Minute", "German multi");
      Check_Multi (Support.Fr, 3661, 2, "1 heure et 1 minute", "French multi");
   end Test_Multi_Unit;

   procedure Test_Multi_Unit_Errors (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Text_Result :=
        Format_Components (Support.En, -1, 2);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Invalid_Value,
         "negative multi-unit duration is Invalid_Value");
   end Test_Multi_Unit_Errors;

   procedure Test_Multi_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer  : String (1 .. 32);
      Written : Natural;
      Code    : Status_Code;
   begin
      Format_Components_Into (Support.En, 3661, 2, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Buffer (1 .. Written) = "1 hour and 1 minute",
         "bounded multi-unit, status " & Status_Image (Code));
   end Test_Multi_Bounded;

   procedure Test_Invalid_Options (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Opts : constant Duration_Options :=
        (Largest_Unit => Second, Smallest_Unit => Day);
   begin
      Check_Status (100, Opts, Invalid_Options,
                    "Largest_Unit < Smallest_Unit");
   end Test_Invalid_Options;

   procedure Test_Precise (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Text_Result :=
        Format_Precise (Support.En, 3_633_123_000, 4, Millisecond);
      Tiny : constant Text_Result :=
        Format_Precise (Support.En, 4, 2, Microsecond);
      Suppressed : constant Text_Result :=
        Format_Precise
          (Support.En, 3_633_000_000, 3,
           (Minimum_Unit     => Precise_Second,
            Suppressed_Units => [Precise_Minute => True, others => False]));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok
         and then Support.Text (Result)
           = "1 hour, 33 seconds and 123 milliseconds",
         "precise duration with milliseconds");
      AUnit.Assertions.Assert
        (Tiny.Status = Ok and then Support.Text (Tiny) = "4 microseconds",
         "precise duration with microseconds");
      AUnit.Assertions.Assert
        (Suppressed.Status = Ok
         and then Support.Text (Suppressed) = "1 hour and 33 seconds",
         "precise duration suppresses minutes");
   end Test_Precise;

   procedure Test_Compact_And_Clock
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Schedule_Phrases
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   procedure Test_Natural_Distance
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is separate;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize duration tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Negative'Access, "negative -> Invalid_Value");
      Register_Routine (T, Test_Whole_Units'Access, "single largest unit");
      Register_Routine (T, Test_Multi_Unit'Access, "multi-unit components");
      Register_Routine (T, Test_Multi_Unit_Errors'Access,
        "multi-unit validation");
      Register_Routine (T, Test_Multi_Bounded'Access, "bounded multi-unit");
      Register_Routine (T, Test_Invalid_Options'Access,
        "invalid unit combination -> Invalid_Options");
      Register_Routine (T, Test_Precise'Access,
        "precise subsecond durations");
      Register_Routine (T, Test_Compact_And_Clock'Access,
        "compact and clock durations");
      Register_Routine (T, Test_Schedule_Phrases'Access,
        "schedule duration phrases");
      Register_Routine (T, Test_Natural_Distance'Access,
        "natural duration distance phrases");
   end Register_Tests;

end Humanize.Tests.Durations;
