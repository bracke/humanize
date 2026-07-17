with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Diagnostics;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Diagnostics is
   use Humanize.Diagnostics;
   use Humanize.Status;

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

   procedure Test_Severity_And_Counts (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Severity_Label (Error_Severity), "error", "error severity");
      Check (Severity_Label (Blocking_Severity), "blocking", "blocking severity");
      Check (Check_Status_Label (Passed_Check), "passed", "passed check status");
      Check (Source_Label (Build_Source), "build diagnostics", "build source");
      Check (Issue_Count_Label, "no issues", "no issue count");
      Check (Issue_Count_Label (Errors => 3, Warnings => 12), "3 errors, 12 warnings", "issue count");
      Check (Issue_Summary_Label (Warnings => 2), "2 warnings only", "warnings only");
      Check
        (Issue_Summary_Label (Errors => 3, Warnings => 12, Blocking => 1),
         "3 errors, 12 warnings, 1 blocking issue",
         "blocking issue summary");
   end Test_Severity_And_Counts;

   procedure Test_Locations_And_Checks (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Check_Detailed : constant Text_Result :=
        Check_Result_Label
          ("unit tests", Failed_Check,
           Diagnostic_Label_Options'
             (Mode             => Diagnostic_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Check : constant Diagnostic_Label_Parse_Result :=
        Parse_Check_Result_Label ("unit tests failed", Failed_Check);
      Scanned_Check : constant Diagnostic_Label_Parse_Result :=
        Scan_Check_Result_Label ("unit tests failed trailing", Failed_Check);
   begin
      Check (Location_Label, "unknown location", "unknown location");
      Check (Location_Label (Line => 42), "line 42", "line location");
      Check
        (Location_Label ("src/main.adb", Line => 42, Column => 7),
         "src/main.adb line 42, column 7",
         "path line column location");
      Check (Failed_At_Label ("src/main.adb", 42), "failed at src/main.adb line 42", "failed at");
      Check
        (First_Failure_Label ("parser", "parser.adb", 12),
         "first failure in parser at parser.adb line 12",
         "first failure with location");
      Check (Check_Result_Label ("unit tests", Failed_Check), "unit tests failed", "check failed");
      Check (Source_Summary_Label (Test_Source, 4), "4 test diagnostics", "source summary");
      Check
        (Check_Run_Summary_Label (Passed => 8, Failed => 1, Skipped => 2),
         "8 passed, 1 failed, 2 skipped",
         "check run summary");
      Check
        (Check_Duration_Label ("unit tests", Passed_Check, 12),
         "unit tests passed in 12 seconds",
         "check duration label");
      Check (Retry_Label (2, 5), "retry 2 of 5", "retry label");
      Check (Retry_Label (6, 5), "retry 6 of 5 exceeded", "retry exceeded label");
      Check (Suggested_Action_Label ("rerun with --verbose"), "next: rerun with --verbose", "suggested action");
      Check
        (Check_Detailed,
         "[diagnostics danger] unit tests failed",
         "check result option metadata");
      AUnit.Assertions.Assert
        (Parsed_Check.Status = Ok
         and then Parsed_Check.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Check.Name_Length = 10,
         "parse check result metadata");
      AUnit.Assertions.Assert
        (Scanned_Check.Status = Ok
         and then Scanned_Check.Consumed = 17,
         "scan check result prefix");

      Invalid := Check_Result_Label (" ", Passed_Check);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid check name",
         "invalid check name rejected");

      Invalid := Suggested_Action_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid suggested action",
         "invalid suggested action rejected");
   end Test_Locations_And_Checks;

   procedure Test_Diagnostic_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Diagnostic_With_Metadata : constant Text_Result :=
        Diagnostic_Label
          ("unused import", Warning_Severity,
           Diagnostic_Label_Options'
             (Mode             => Diagnostic_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Field_Detailed : constant Text_Result :=
        Field_Problem_Label
          ("email", "invalid format", Error_Severity,
           Diagnostic_Label_Options'
             (Mode             => Diagnostic_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Diagnostic : constant Diagnostic_Label_Parse_Result :=
        Parse_Diagnostic_Label ("warning: unused import", Warning_Severity);
      Parsed_Explanation : constant Diagnostic_Explanation_Parse_Result :=
        Parse_Diagnostic_Explanation_Label
          ("expected a unit for duration; use ms");
      Scanned_Explanation : constant Diagnostic_Explanation_Parse_Result :=
        Scan_Diagnostic_Explanation_Label
          ("expected a unit for duration; use ms" & ASCII.LF & "next");
   begin
      Check
        (Diagnostic_Label ("missing semicolon", Error_Severity, "main.adb", 10),
         "error at main.adb line 10: missing semicolon",
         "diagnostic with location");
      Check
        (Diagnostic_Label ("unused import", Warning_Severity),
         "warning: unused import",
         "diagnostic without location");
      Check
        (Diagnostic_Label ("all checks passed", Info_Severity),
         "info: all checks passed",
         "info diagnostic");
      Check (Affected_Items_Label (0), "no affected items", "no affected items");
      Check (Affected_Items_Label (4), "4 affected items", "affected items");
      Check
        (Field_Problem_Label ("email", "invalid format", Warning_Severity),
         "warning in email: invalid format",
         "field problem label");
      Check
        (Result_With_Notices_Label (Passed_Check, 2),
         "passed with 2 notices",
         "result with notices label");
      Check
        (Diagnostic_Explanation_Label
           (Expected_Unit, "duration", 4, "ms, s, min, h, d, or w"),
         "expected a unit for duration at position 4; use ms, s, min, h, d, or w",
         "diagnostic explanation label");
      Check
        (Parser_Diagnostic_Explanation_Label
           (Duration_Parser, "expected unit", 4),
         "unsupported syntax for duration parser expected unit at position 4; "
         & "use ms, s, min, h, d, w, month, or year",
         "parser diagnostic explanation label");
      Check
        (Diagnostic_With_Metadata,
         "[diagnostics warning] warning: unused import",
         "diagnostic option metadata");
      AUnit.Assertions.Assert
        (Parsed_Diagnostic.Status = Ok
         and then Parsed_Diagnostic.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Diagnostic.Name_Length = 13
         and then Parsed_Diagnostic.State_Length = 7,
         "parse diagnostic metadata");
      AUnit.Assertions.Assert
        (Parsed_Explanation.Status = Ok
         and then Parsed_Explanation.Kind = Expected_Unit
         and then Parsed_Explanation.Subject_Length = 8
         and then Parsed_Explanation.Suggestion_Length = 2,
         "parse diagnostic explanation");
      AUnit.Assertions.Assert
        (Scanned_Explanation.Status = Ok
         and then Scanned_Explanation.Consumed = 36,
         "scan diagnostic explanation");
      Check
        (Field_Detailed,
         "[diagnostics danger] error in email: invalid format",
         "field problem option metadata");

      Invalid := Diagnostic_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid diagnostic message",
         "invalid diagnostic rejected");

      Invalid := Field_Problem_Label (" ", "invalid");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid field name",
         "invalid field problem rejected");
   end Test_Diagnostic_Labels;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Exact  : String (1 .. 21);
      Tiny   : String (1 .. 8);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Issue_Summary_Label_Into (Exact, Written, Code, Errors => 3, Warnings => 12);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 21 and then Exact = "3 errors, 12 warnings",
         "issue summary bounded exact text");

      Diagnostic_Label_Into ("missing semicolon", Tiny, Written, Code, Error_Severity);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "error: m",
         "diagnostic bounded overflow prefix");

      Diagnostic_Explanation_Label_Into
        (Expected_Unit, Tiny, Written, Code, Subject => "duration");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "expected",
         "diagnostic explanation bounded overflow");

      Location_Label_Into (Offset, Written, Code, Path => "main.adb");
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "location bounded rejects non-1-based buffers");

      Diagnostic_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "diagnostic bounded returns validation status");

      Check_Result_Label_Into
        ("unit tests", Failed_Check, Exact, Written, Code,
         (Mode             => Diagnostic_Detailed,
          Include_Surface  => True,
          Include_Severity => True,
         Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 21 and then
         Exact = "[diagnostics danger] ",
         "check result option bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize diagnostic tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Severity_And_Counts'Access, "severity and counts");
      Register_Routine (T, Test_Locations_And_Checks'Access, "locations and checks");
      Register_Routine (T, Test_Diagnostic_Labels'Access, "diagnostic labels");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Diagnostics;
