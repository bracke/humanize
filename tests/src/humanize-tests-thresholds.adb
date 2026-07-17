with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Status;
with Humanize.Tests.Support;
with Humanize.Thresholds;

package body Humanize.Tests.Thresholds is
   use Humanize.Status;
   use Humanize.Thresholds;

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

   procedure Test_Range_And_Window_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Window_Detailed : constant Text_Result :=
        Window_Status_Label
          (8.0, 10.0, 20.0,
           Threshold_Label_Options'
             (Mode             => Threshold_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False),
           Unit => "ms");
      Parsed_Window : constant Threshold_Label_Parse_Result :=
        Parse_Threshold_Value_Label
          ("8 ms below expected range", Below_Range);
      Scanned_Window : constant Threshold_Label_Parse_Result :=
        Scan_Threshold_Value_Label
          ("15 ms within expected range trailing", Within_Range);
   begin
      Check (Threshold_State_Label (Within_Range), "within expected range", "state label");
      Check (Threshold_Direction_Label (Upper_Limit), "upper limit", "direction label");
      Check (Metric_Value_Label ("latency", 12.5, "ms", 1), "latency 12.5 ms", "metric value");
      Check (Range_Label (10.0, 20.0, "ms"), "target range 10 ms to 20 ms", "range label");
      Check
        (Range_Label (10.0, 20.0, "ms", Inclusive => Exclusive_Window),
         "target window 10 ms to 20 ms",
         "exclusive window label");
      Check (Window_Status_Label (15.0, 10.0, 20.0, "ms"), "15 ms within expected range", "inside range");
      Check (Window_Status_Label (8.0, 10.0, 20.0, "ms"), "8 ms below expected range", "below range");
      Check (Window_Status_Label (21.0, 10.0, 20.0, "ms"), "21 ms above expected range", "above range");
      Check
        (Window_Detailed,
         "[thresholds warning] 8 ms below expected range",
         "window option metadata");
      AUnit.Assertions.Assert
        (Parsed_Window.Status = Ok
         and then Parsed_Window.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Window.Name_Length = 4,
         "parse threshold window metadata");
      AUnit.Assertions.Assert
        (Scanned_Window.Status = Ok
         and then Scanned_Window.Consumed = 27,
         "scan threshold window prefix");

      Invalid := Range_Label (20.0, 10.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid range",
         "invalid range rejected");
   end Test_Range_And_Window_Labels;

   procedure Test_Threshold_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
      Warning_Detailed : constant Text_Result :=
        Threshold_Status_Label
          (85.0, Warning => 80.0, Critical => 95.0,
           Options =>
             Threshold_Label_Options'
               (Mode             => Threshold_Detailed,
                Include_Surface  => True,
                Include_Severity => True,
                Include_Tone     => False),
           Unit => "%");
      Critical_Detailed : constant Text_Result :=
        Threshold_Status_Label
          (97.0, Warning => 80.0, Critical => 95.0,
           Options =>
             Threshold_Label_Options'
               (Mode             => Threshold_Detailed,
                Include_Surface  => True,
                Include_Severity => True,
                Include_Tone     => False),
           Unit => "%");
   begin
      Check
        (Threshold_Status_Label (70.0, Warning => 80.0, Critical => 95.0, Unit => "%"),
         "70 % within normal range",
         "upper normal threshold");
      Check
        (Threshold_Status_Label (85.0, Warning => 80.0, Critical => 95.0, Unit => "%"),
         "85 % at warning threshold",
         "upper warning threshold");
      Check
        (Threshold_Status_Label (97.0, Warning => 80.0, Critical => 95.0, Unit => "%"),
         "97 % at critical threshold",
         "upper critical threshold");
      Check
        (Threshold_Status_Label (12.0, 20.0, 10.0, Lower_Limit, "ms"),
         "12 ms at warning threshold",
         "lower warning threshold");
      Check
        (Threshold_Status_Label (8.0, 20.0, 10.0, Lower_Limit, "ms"),
         "8 ms at critical threshold",
         "lower critical threshold");
      Check
        (Warning_Detailed,
         "[thresholds warning] 85 % at warning threshold",
         "threshold warning option metadata");
      Check
        (Critical_Detailed,
         "[thresholds danger] 97 % at critical threshold",
         "threshold critical option metadata");

      Invalid := Threshold_Status_Label (10.0, Warning => 95.0, Critical => 80.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid thresholds",
         "invalid threshold order rejected");
   end Test_Threshold_Labels;

   procedure Test_Breach_Target_And_Summary_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Breach_Label (103.0, 100.0, Unit => "ms"), "breached by 3 ms", "upper breach");
      Check (Breach_Label (97.0, 100.0, Unit => "ms"), "not breached", "not breached");
      Check (Breach_Label (7.0, 10.0, Lower_Limit, "ms"), "breached by 3 ms", "lower breach");
      Check (Target_Delta_Label (97.0, 100.0, "ms"), "3 ms below target", "below target");
      Check (Target_Delta_Label (103.0, 100.0, "ms"), "3 ms above target", "above target");
      Check (Target_Delta_Label (100.0, 100.0, "ms"), "at target", "at target");
      Check (Near_Limit_Label (96.0, 100.0, 5.0, Unit => "%"), "near limit, 4 % remaining", "near limit");
      Check (Near_Limit_Label (80.0, 100.0, 5.0, Unit => "%"), "20 % from limit", "clear from limit");
      Check (Near_Limit_Label (104.0, 100.0, 5.0, Unit => "%"), "limit breached", "limit breached");
      Check
        (Threshold_Summary_Label (Normal => 5, Warnings => 2, Critical => 1, Breaches => 1),
         "5 normal, 2 warnings, 1 critical, 1 breach",
         "threshold summary");
      Check (Target_Window_Label (100.0, 5.0, "ms"), "target 100 ms plus/minus 5 ms", "target window");
      Check (Tolerance_Label (5.0, "ms"), "tolerance 5 ms", "tolerance label");
      Check (Percent_Of_Limit_Label (75.0, 100.0), "75% of limit", "percent of limit");
      Check (Remaining_To_Limit_Label (75.0, 100.0, Unit => "%"), "25 % remaining", "remaining to limit");
      Check (Remaining_To_Limit_Label (105.0, 100.0, Unit => "%"), "limit exceeded by 5 %", "limit exceeded");
      Check (Budget_Used_Label (750.0, 1000.0, "USD"), "750 USD used of 1000 USD", "budget used");

      Invalid := Near_Limit_Label (1.0, 2.0, -1.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid margin",
         "invalid margin rejected");

      Invalid := Percent_Of_Limit_Label (1.0, 0.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid limit",
         "invalid limit rejected");

      Invalid := Budget_Used_Label (-1.0, 100.0);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid budget",
         "invalid budget rejected");
   end Test_Breach_Target_And_Summary_Labels;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Exact  : String (1 .. 27);
      Tiny   : String (1 .. 8);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Window_Status_Label_Into (15.0, 10.0, 20.0, Exact, Written, Code, "ms");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 27 and then Exact = "15 ms within expected range",
         "window bounded exact text");

      Threshold_Status_Label_Into (85.0, 80.0, 95.0, Tiny, Written, Code, Unit => "%");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "85 % at ",
         "threshold bounded overflow prefix");

      Threshold_Summary_Label_Into (Offset, Written, Code, Normal => 1);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "summary bounded rejects non-1-based buffers");

      Window_Status_Label_Into (15.0, 20.0, 10.0, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "window bounded returns validation status");

      Window_Status_Label_Into
        (8.0, 10.0, 20.0, Exact, Written, Code,
         Threshold_Label_Options'
           (Mode             => Threshold_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False),
         Unit => "ms");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 27 and then
         Exact = "[thresholds warning] 8 ms b",
         "window option bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize threshold tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Range_And_Window_Labels'Access, "range and window labels");
      Register_Routine (T, Test_Threshold_Labels'Access, "threshold labels");
      Register_Routine (T, Test_Breach_Target_And_Summary_Labels'Access, "breach target and summary labels");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Thresholds;
