with AUnit.Assertions;

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
      Register_Routine (T, Test_Invalid_Options'Access,
        "invalid unit combination -> Invalid_Options");
   end Register_Tests;

end Humanize.Tests.Durations;
