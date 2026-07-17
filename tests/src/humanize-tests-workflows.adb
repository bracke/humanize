with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Status;
with Humanize.Tests.Support;
with Humanize.Workflows;

package body Humanize.Tests.Workflows is
   use Humanize.Status;
   use Humanize.Workflows;

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

   procedure Test_State_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (Workflow_State_Label (Waiting_Approval_State), "waiting for approval", "workflow state");
      Check (Workflow_State_Label (Blocked_State), "blocked", "blocked workflow state");
      Check (Step_State_Label (Active_Step), "active", "active step state");
      Check (Milestone_State_Label (Missed_Milestone), "missed milestone", "missed milestone state");
   end Test_State_Labels;

   procedure Test_Step_And_Milestone_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Step_Detailed : constant Text_Result :=
        Step_Status_Label
          ("review", Blocked_Step,
           Workflow_Label_Options'
             (Mode             => Workflow_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Milestone_Detailed : constant Text_Result :=
        Milestone_Status_Label
          ("release", Blocked_Milestone,
           Workflow_Label_Options'
             (Mode             => Workflow_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Step : constant Workflow_Label_Parse_Result :=
        Parse_Step_Status_Label ("review blocked", Blocked_Step);
      Scanned_Step : constant Workflow_Label_Parse_Result :=
        Scan_Step_Status_Label ("review blocked trailing", Blocked_Step);
      Parsed_Milestone : constant Workflow_Label_Parse_Result :=
        Parse_Milestone_Status_Label ("release blocked", Blocked_Milestone);
   begin
      Check (Step_Label (2, 5), "step 2 of 5", "step label");
      Check (Step_Label (2, 5, "configure"), "step 2 of 5: configure", "named step label");
      Check (Step_Status_Label ("review", Blocked_Step), "review blocked", "step status");
      Check (Milestone_Label (3, 7), "3 of 7 milestones complete", "milestone label");
      Check
        (Milestone_Label (3, 7, "beta"),
         "3 of 7 milestones complete: beta",
         "named milestone label");
      Check (Milestone_Status_Label ("release", Current_Milestone), "release current", "milestone status");
      Check
        (Step_Detailed,
         "[workflows danger] review blocked",
         "step status option metadata");
      AUnit.Assertions.Assert
        (Parsed_Step.Status = Ok
         and then Parsed_Step.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Step.Name_Length = 6,
         "parse step status metadata");
      AUnit.Assertions.Assert
        (Scanned_Step.Status = Ok
         and then Scanned_Step.Consumed = 14,
         "scan step status prefix");
      Check
        (Milestone_Detailed,
         "[workflows danger] release blocked",
         "milestone status option metadata");
      AUnit.Assertions.Assert
        (Parsed_Milestone.Status = Ok
         and then Parsed_Milestone.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Milestone.Name_Length = 7,
         "parse milestone status metadata");

      Invalid := Step_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid step position",
         "invalid step position rejected");

      Invalid := Milestone_Label (8, 7);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid milestone position",
         "invalid milestone position rejected");
   end Test_Step_And_Milestone_Labels;

   procedure Test_Workflow_Summaries (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Workflow_Detailed_Result : constant Text_Result :=
        Workflow_Result_Label
          (Failed_State,
           Workflow_Label_Options'
             (Mode             => Workflow_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False),
           Name => "setup");
      Parsed_Workflow : constant Workflow_Label_Parse_Result :=
        Parse_Workflow_Result_Label ("setup failed", Failed_State);
   begin
      Check
        (Workflow_Summary_Label (7, Completed => 3, Active => 1, Blocked => 1, Skipped => 2),
         "7 items, 3 completed, 1 active, 1 blocked, 2 skipped",
         "workflow summary");
      Check (Workflow_Progress_Label (3, 7), "3 of 7 complete", "workflow progress");
      Check (Workflow_Progress_Label (2, 4), "halfway through workflow", "halfway workflow");
      Check (Workflow_Progress_Label (0, 0), "no workflow items", "empty workflow");
      Check (Approval_Label ("Dana"), "waiting for approval from Dana", "waiting approval");
      Check (Approval_Label ("Dana", Waiting => False), "approved by Dana", "approved by");
      Check (Blocker_Label ("waiting on review"), "blocked: waiting on review", "blocker label");
      Check (Next_Action_Label ("deploy"), "next: deploy", "next action");
      Check (Queue_Position_Label (2, 5), "queue position 2 of 5", "queue position");
      Check (Waiting_Label ("review"), "waiting for review", "waiting reason");
      Check (Owner_Label ("platform"), "owned by platform", "owner label");
      Check (Handoff_Label ("build", "release"), "handoff from build to release", "handoff label");
      Check (Dependency_Label (0), "no blocking dependencies", "no dependencies");
      Check (Dependency_Label (3), "3 blocking dependencies", "dependency count");
      Check (Attempt_Label (2, 5), "attempt 2 of 5", "attempt label");
      Check (Attempt_Label (6, 5), "attempt 6 of 5 exceeded", "attempt exceeded");
      Check (Workflow_Result_Label (Completed_State, "setup"), "setup completed", "named workflow result");
      Check (Workflow_Result_Label (Failed_State), "workflow failed", "workflow result");
      Check
        (Workflow_Detailed_Result,
         "[workflows danger] setup failed",
         "workflow result option metadata");
      AUnit.Assertions.Assert
        (Parsed_Workflow.Status = Ok
         and then Parsed_Workflow.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Workflow.Name_Length = 5,
         "parse workflow result metadata");
      Check (Resume_Label ("setup"), "resume setup", "resume label");

      Invalid := Workflow_Progress_Label (5, 4);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid workflow progress",
         "invalid workflow progress rejected");

      Invalid := Blocker_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid blocker reason",
         "invalid blocker reason rejected");

      Invalid := Queue_Position_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid queue position",
         "invalid queue position rejected");
   end Test_Workflow_Summaries;

   procedure Test_Bounded_Labels (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Exact  : String (1 .. 23);
      Tiny   : String (1 .. 8);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Step_Label_Into (2, 5, Exact, Written, Code, "configure");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 22 and then Exact (1 .. Written) = "step 2 of 5: configure",
         "step bounded exact text");

      Next_Action_Label_Into ("deploy", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "next: de",
         "next action bounded overflow prefix");

      Workflow_Summary_Label_Into (7, Offset, Written, Code, Completed => 3);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "workflow summary bounded rejects non-1-based buffers");

      Step_Label_Into (6, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "step bounded returns validation status");

      Step_Status_Label_Into
        ("review", Blocked_Step, Exact, Written, Code,
         Workflow_Label_Options'
           (Mode             => Workflow_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 23 and then
         Exact = "[workflows danger] revi",
         "step status option bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize workflow tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_Labels'Access, "state labels");
      Register_Routine (T, Test_Step_And_Milestone_Labels'Access, "step and milestone labels");
      Register_Routine (T, Test_Workflow_Summaries'Access, "workflow summaries");
      Register_Routine (T, Test_Bounded_Labels'Access, "bounded labels");
   end Register_Tests;

end Humanize.Tests.Workflows;
