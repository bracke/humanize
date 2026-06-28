with AUnit.Assertions;

with Ada.Calendar;
with I18N.Runtime;

with Humanize.Bytes;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.I18N_Rendering;
with Humanize.Messages;
with Humanize.Selections;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Rendering is

   use Humanize.Status;

   LF : constant String := [1 => ASCII.LF];

   --  UTF-8 'å' for Danish expectations.
   AA : constant String :=
     Character'Val (16#C3#) & Character'Val (16#A5#);

   --  A runtime whose bytes.kb key is a plural on the (non-numeric) value
   --  argument, used to provoke an i18n Invalid_Argument.
   Inv_Runtime : aliased I18N.Runtime.Instance;
   Inv_Loaded  : Boolean := False;

   --  A runtime made invalid (Initialize on a missing file) to provoke an i18n
   --  Execution_Error -> Humanize Runtime_Error.
   Bad_Runtime : aliased I18N.Runtime.Instance;
   Bad_Ready   : Boolean := False;

   procedure Ensure_Bad is
   begin
      if not Bad_Ready then
         I18N.Runtime.Initialize
           (Bad_Runtime, "/humanize/no/such/catalog/file.catalog");
         Bad_Ready := True;
      end if;
   end Ensure_Bad;

   procedure Ensure_Inv is
      Result : I18N.Runtime.Load_Result;
   begin
      if not Inv_Loaded then
         I18N.Runtime.Load_Text
           (Inv_Runtime, "inv",
            "en.humanize.bytes.kb = {value, plural, one {one} other {many}}"
            & LF,
            Result);
         Inv_Loaded := True;
      end if;
   end Ensure_Inv;

   procedure Test_English (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.En, 1)) = "1 second",
         "English duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Bytes.Format (Support.En, 1024)) = "1 KiB",
         "English bytes");
   end Test_English;

   procedure Test_Danish (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref   : constant Time := Time_Of (2026, 3, 21, Day_Duration (600));
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100));
   begin
      --  Danish CLDR one/other plural through i18n.
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Da, 1)) = "1 sekund",
         "Danish duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.Da, 2))
           = "2 sekunder",
         "Danish duration other");
      --  Danish calendar word with UTF-8 'å'.
      AUnit.Assertions.Assert
        (Support.Text
           (Humanize.Datetimes.Relative (Support.Da, Value, Ref))
           = "i g" & AA & "r",
         "Danish yesterday is i g" & AA & "r");
   end Test_Danish;

   procedure Test_German (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use Ada.Calendar;
      Ref   : constant Time := Time_Of (2026, 3, 21, Day_Duration (600));
      Value : constant Time := Time_Of (2026, 3, 20, Day_Duration (86_100));
   begin
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.De, 1)) = "1 Sekunde",
         "German duration one");
      AUnit.Assertions.Assert
        (Support.Text (Humanize.Durations.Format (Support.De, 2))
           = "2 Sekunden",
         "German duration other");
      AUnit.Assertions.Assert
        (Support.Text
           (Humanize.Datetimes.Relative (Support.De, Value, Ref)) = "gestern",
         "German yesterday");
   end Test_German;

   procedure Test_Missing_Message (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Result : constant Text_Result :=
        Humanize.Durations.Format (Support.Empty, 5);
   begin
      AUnit.Assertions.Assert
        (Result.Status = Missing_Message,
         "absent catalog key maps to Missing_Message, got "
         & Status_Image (Result.Status));
   end Test_Missing_Message;

   procedure Test_Missing_Argument (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      --  A count key rendered with no arguments -> i18n Missing_Argument.
      Result : constant Text_Result :=
        Humanize.I18N_Rendering.Render
          (Support.En,
           Humanize.Selections.No_Arg
             (Humanize.Messages.Duration_Unit_Second));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Missing_Argument,
         "missing count maps to Missing_Argument, got "
         & Status_Image (Result.Status));
   end Test_Missing_Argument;

   procedure Test_Invalid_Argument (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Ensure_Inv;
      declare
         Ctx : constant Humanize.Contexts.Context :=
           Humanize.Contexts.Create (Inv_Runtime'Access, "en");
         Result : constant Text_Result :=
           Humanize.I18N_Rendering.Render
             (Ctx,
              Humanize.Selections.Text_Value
                (Humanize.Messages.Bytes_KB, "abc"));
      begin
         AUnit.Assertions.Assert
           (Result.Status = Invalid_Argument,
            "non-numeric plural selector maps to Invalid_Argument, got "
            & Status_Image (Result.Status));
      end;
   end Test_Invalid_Argument;

   procedure Test_Runtime_Error (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Ensure_Bad;
      declare
         Ctx : constant Humanize.Contexts.Context :=
           Humanize.Contexts.Create (Bad_Runtime'Access, "en");
         Result : constant Text_Result :=
           Humanize.Durations.Format (Ctx, 5);
      begin
         AUnit.Assertions.Assert
           (Result.Status = Runtime_Error,
            "an invalid runtime maps to Runtime_Error, got "
            & Status_Image (Result.Status));
      end;
   end Test_Runtime_Error;

   procedure Test_Value_Argument (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      --  A value-argument selection flows the deterministic formatter text
      --  through i18n's {value} substitution.
      Result : constant Text_Result :=
        Humanize.I18N_Rendering.Render
          (Support.En,
           Humanize.Selections.Text_Value
             (Humanize.Messages.Bytes_KiB, "1.5"));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = "1.5 KiB",
         "value argument substitutes formatter text");
   end Test_Value_Argument;

   procedure Test_Count_Strict_Decimal (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      --  Count must serialize as a strict decimal with no leading space.
      Result : constant Text_Result :=
        Humanize.I18N_Rendering.Render
          (Support.En,
           Humanize.Selections.Count
             (Humanize.Messages.Duration_Unit_Second, 5));
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = "5 seconds",
         "count renders as strict decimal");
   end Test_Count_Strict_Decimal;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize i18n integration tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_English'Access, "English output");
      Register_Routine (T, Test_Danish'Access, "Danish output (plurals + UTF-8)");
      Register_Routine (T, Test_German'Access, "German output");
      Register_Routine (T, Test_Missing_Message'Access, "missing key");
      Register_Routine (T, Test_Missing_Argument'Access, "missing argument");
      Register_Routine (T, Test_Invalid_Argument'Access, "invalid argument");
      Register_Routine (T, Test_Runtime_Error'Access, "runtime error");
      Register_Routine (T, Test_Value_Argument'Access, "value argument text");
      Register_Routine (T, Test_Count_Strict_Decimal'Access,
        "count is strict decimal");
   end Register_Tests;

end Humanize.Tests.Rendering;
