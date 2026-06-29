with AUnit.Assertions;

with Humanize.Contexts;
with Humanize.Durations;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Durations is

   use Humanize.Durations;
   use Humanize.Status;

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
   end Register_Tests;

end Humanize.Tests.Durations;
