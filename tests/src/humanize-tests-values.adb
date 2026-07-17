with AUnit.Assertions;

with Humanize.Status;
with Humanize.Tests.Support;
with Humanize.Parsing;
with Humanize.Values;

package body Humanize.Tests.Values is
   use Humanize.Status;
   use Humanize.Values;
   use type Humanize.Parsing.Parse_Error_Kind;

   procedure Check
     (Result   : Text_Result;
      Expected : String;
      Message  : String)
   is
   begin
      AUnit.Assertions.Assert
        (Result.Status = Ok and then Support.Text (Result) = Expected,
         Message & " -> expected [" & Expected & "] got ["
         & Support.Text (Result) & "] status " & Status_Image (Result.Status));
   end Check;

   procedure Test_Boolean_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Boolean_Label (True, True_False), "true", "true/false true");
      Check (Boolean_Label (False, True_False), "false", "true/false false");
      Check (Boolean_Label (True, Yes_No), "yes", "yes/no true");
      Check (Boolean_Label (False, Yes_No), "no", "yes/no false");
      Check (Boolean_Label (True, On_Off), "on", "on/off true");
      Check (Boolean_Label (False, On_Off), "off", "on/off false");
      Check (Boolean_Label (True, Enabled_Disabled), "enabled", "enabled true");
      Check (Boolean_Label (False, Enabled_Disabled), "disabled", "enabled false");
      Check (Boolean_Label (True, Active_Inactive), "active", "active true");
      Check (Boolean_Label (False, Active_Inactive), "inactive", "active false");
      Check (Boolean_Label (True, Available_Unavailable), "available", "available true");
      Check (Boolean_Label (False, Available_Unavailable), "unavailable", "available false");
      Check (Boolean_Label (True, Visible_Hidden), "visible", "visible true");
      Check (Boolean_Label (False, Visible_Hidden), "hidden", "visible false");
      Check (Boolean_Label (True, Allowed_Blocked), "allowed", "allowed true");
      Check (Boolean_Label (False, Allowed_Blocked), "blocked", "allowed false");
      Check (Boolean_Label (True, Permitted_Denied), "permitted", "permitted true");
      Check (Boolean_Label (False, Permitted_Denied), "denied", "permitted false");
      Check (Boolean_Label (True, Passed_Failed), "passed", "passed true");
      Check (Boolean_Label (False, Passed_Failed), "failed", "passed false");
      Check (Boolean_Label (True, Healthy_Unhealthy), "healthy", "healthy true");
      Check (Boolean_Label (False, Healthy_Unhealthy), "unhealthy", "healthy false");
      Check (Boolean_Label (True, Valid_Invalid), "valid", "valid true");
      Check (Boolean_Label (False, Valid_Invalid), "invalid", "valid false");
      Check (Boolean_Label (True, Complete_Incomplete), "complete", "complete true");
      Check (Boolean_Label (False, Complete_Incomplete), "incomplete", "complete false");
      Check (Boolean_Label (True, Open_Closed), "open", "open true");
      Check (Boolean_Label (False, Open_Closed), "closed", "open false");
      Check (Boolean_Label (True, Locked_Unlocked), "locked", "locked true");
      Check (Boolean_Label (False, Locked_Unlocked), "unlocked", "locked false");
   end Test_Boolean_Labels;

   procedure Test_Ternary_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Ternary_Label (True_Value, Yes_No_Unknown), "yes", "yes/no/unknown true");
      Check (Ternary_Label (False_Value, Yes_No_Unknown), "no", "yes/no/unknown false");
      Check (Ternary_Label (Unknown_Value, Yes_No_Unknown), "unknown", "yes/no/unknown unknown");
      Check (Ternary_Label (True_Value, True_False_Unknown), "true", "true/false/unknown true");
      Check (Ternary_Label (False_Value, True_False_Unknown), "false", "true/false/unknown false");
      Check (Ternary_Label (Unknown_Value, True_False_Unknown), "unknown", "true/false/unknown unknown");
      Check (Ternary_Label (True_Value, Enabled_Disabled_Unknown), "enabled", "enabled unknown true");
      Check (Ternary_Label (False_Value, Enabled_Disabled_Unknown), "disabled", "enabled unknown false");
      Check (Ternary_Label (Unknown_Value, Enabled_Disabled_Unknown), "unknown", "enabled unknown");
      Check (Ternary_Label (True_Value, On_Off_Auto), "on", "on/off/auto true");
      Check (Ternary_Label (False_Value, On_Off_Auto), "off", "on/off/auto false");
      Check (Ternary_Label (Unknown_Value, On_Off_Auto), "auto", "on/off/auto unknown");
      Check (Ternary_Label (True_Value, Set_Unset_Unknown), "set", "set/unset true");
      Check (Ternary_Label (False_Value, Set_Unset_Unknown), "unset", "set/unset false");
      Check (Ternary_Label (Unknown_Value, Set_Unset_Unknown), "unknown", "set/unset unknown");
      Check (Ternary_Label (True_Value, Present_Absent_Unknown), "present", "present true");
      Check (Ternary_Label (False_Value, Present_Absent_Unknown), "absent", "present false");
      Check (Ternary_Label (Unknown_Value, Present_Absent_Unknown), "unknown", "present unknown");
      Check (Ternary_Label (True_Value, Available_Unavailable_Unknown), "available", "available true");
      Check (Ternary_Label (False_Value, Available_Unavailable_Unknown), "unavailable", "available false");
      Check (Ternary_Label (Unknown_Value, Available_Unavailable_Unknown), "unknown", "available unknown");
      Check (Ternary_Label (True_Value, Passed_Failed_Skipped), "passed", "passed true");
      Check (Ternary_Label (False_Value, Passed_Failed_Skipped), "failed", "passed false");
      Check (Ternary_Label (Unknown_Value, Passed_Failed_Skipped), "skipped", "passed skipped");
      Check (Ternary_Label (True_Value, Healthy_Unhealthy_Unknown), "healthy", "healthy true");
      Check (Ternary_Label (False_Value, Healthy_Unhealthy_Unknown), "unhealthy", "healthy false");
      Check (Ternary_Label (Unknown_Value, Healthy_Unhealthy_Unknown), "unknown", "healthy unknown");
      Check (Ternary_Label (True_Value, Complete_Incomplete_Pending), "complete", "complete true");
      Check (Ternary_Label (False_Value, Complete_Incomplete_Pending), "incomplete", "complete false");
      Check (Ternary_Label (Unknown_Value, Complete_Incomplete_Pending), "pending", "complete pending");
      Check (Ternary_Label (True_Value, Allowed_Blocked_Unknown), "allowed", "allowed true");
      Check (Ternary_Label (False_Value, Allowed_Blocked_Unknown), "blocked", "allowed false");
      Check (Ternary_Label (Unknown_Value, Allowed_Blocked_Unknown), "unknown", "allowed unknown");
      Check (Ternary_Label (True_Value, Visible_Hidden_Mixed), "visible", "visible true");
      Check (Ternary_Label (False_Value, Visible_Hidden_Mixed), "hidden", "visible false");
      Check (Ternary_Label (Unknown_Value, Visible_Hidden_Mixed), "mixed", "visible mixed");
   end Test_Ternary_Labels;

   procedure Test_Style_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Boolean_Label_Style_Label (Enabled_Disabled), "enabled/disabled", "boolean style label");
      Check (Boolean_Label_Style_Label (Locked_Unlocked), "locked/unlocked", "locked style label");
      Check (Ternary_Label_Style_Label (On_Off_Auto), "on/off/auto", "ternary auto style label");
      Check
        (Ternary_Label_Style_Label (Complete_Incomplete_Pending),
         "complete/incomplete/pending", "ternary pending style label");
   end Test_Style_Labels;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer : String (1 .. 8);
      Tiny   : String (1 .. 3);
      Offset : String (2 .. 9);
      Written : Natural;
      Code : Status_Code;
   begin
      Boolean_Label_Into (True, Buffer, Written, Code, Enabled_Disabled);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 7 and then Buffer (1 .. Written) = "enabled",
         "boolean bounded exact text");

      Ternary_Label_Into (Unknown_Value, Tiny, Written, Code, Complete_Incomplete_Pending);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 3 and then Tiny = "pen",
         "ternary bounded overflow prefix");

      Boolean_Label_Into (False, Offset, Written, Code, Yes_No);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "boolean bounded rejects non-1-based buffers");
   end Test_Bounded_Labels;

   procedure Test_Parse_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Bool : Humanize.Parsing.Boolean_Label_Parse_Result;
      Tri  : Humanize.Parsing.Ternary_Label_Parse_Result;
   begin
      Bool := Humanize.Parsing.Parse_Boolean_Label ("Enabled");
      AUnit.Assertions.Assert
        (Bool.Status = Ok
         and then Bool.Value
         and then Bool.Style = Enabled_Disabled
         and then Bool.Exact
         and then Bool.Consumed = 7,
         "parse boolean label");

      Bool := Humanize.Parsing.Scan_Boolean_Label ("blocked by policy");
      AUnit.Assertions.Assert
        (Bool.Status = Ok
         and then not Bool.Value
         and then Bool.Style = Allowed_Blocked
         and then not Bool.Exact
         and then Bool.Consumed = 7,
         "scan boolean label");

      Tri := Humanize.Parsing.Parse_Ternary_Label ("pending");
      AUnit.Assertions.Assert
        (Tri.Status = Ok
         and then Tri.Value = Unknown_Value
         and then Tri.Style = Complete_Incomplete_Pending
         and then Tri.Exact
         and then Tri.Consumed = 7,
         "parse ternary pending label");

      Tri := Humanize.Parsing.Scan_Ternary_Label ("mixed visibility");
      AUnit.Assertions.Assert
        (Tri.Status = Ok
         and then Tri.Value = Unknown_Value
         and then Tri.Style = Visible_Hidden_Mixed
         and then not Tri.Exact
         and then Tri.Consumed = 5,
         "scan ternary mixed label");

      Bool := Humanize.Parsing.Parse_Boolean_Label ("maybe");
      AUnit.Assertions.Assert
        (Bool.Status = Invalid_Argument
         and then Bool.Error = Humanize.Parsing.Unsupported_Form,
         "reject unsupported boolean label");
   end Test_Parse_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize value tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Boolean_Labels'Access, "boolean labels");
      Register_Routine (T, Test_Ternary_Labels'Access, "ternary labels");
      Register_Routine (T, Test_Style_Labels'Access, "style labels");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
      Register_Routine (T, Test_Parse_Labels'Access, "parse labels");
   end Register_Tests;

end Humanize.Tests.Values;
