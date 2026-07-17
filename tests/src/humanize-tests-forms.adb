with AUnit.Assertions;

with Humanize.Forms;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Forms is
   use Humanize.Forms;
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

   procedure Test_State_And_Field_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Form_State_Label (Pristine_Form), "not started", "pristine form");
      Check (Form_State_Label (Dirty_Form), "unsaved changes", "dirty form");
      Check (Form_State_Label (Failed_Form), "submission failed", "failed form");
      Check (Input_State_Label (Required_Input), "required input", "required input");
      Check (Input_State_Label (Read_Only_Input), "read-only input", "read-only input");
      Check (Field_Label ("email", Required => True), "email required field", "required field");
      Check (Field_Label ("nickname"), "nickname optional field", "optional field");
      Check (Field_State_Label ("email", Invalid_Input), "email invalid", "field state");

      Invalid := Field_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid field name",
         "empty field name rejected");
      Invalid := Field_State_Label (" ", Valid_Input);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid field name",
         "empty field-state name rejected");
   end Test_State_And_Field_Labels;

   procedure Test_Character_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Character_Count_Label (1), "1 character", "single character");
      Check (Character_Count_Label (12), "12 characters", "character count");
      Check (Character_Limit_Label (0), "no character limit", "no limit");
      Check (Character_Limit_Label (50), "50 characters maximum", "limit");
      Check (Character_Usage_Label (12, 50), "12 of 50 characters", "usage");
      Check (Character_Usage_Label (12, 0), "12 characters", "usage no limit");
      Check
        (Remaining_Characters_Label (12, 50),
         "38 characters remaining",
         "remaining");
      Check
        (Remaining_Characters_Label (50, 50),
         "no characters remaining",
         "none remaining");
      Check
        (Remaining_Characters_Label (55, 50),
         "5 characters over limit",
         "over limit");
   end Test_Character_Labels;

   procedure Test_Progress_And_Submission_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Required_Fields_Label (0, 0), "no required fields", "no required");
      Check
        (Required_Fields_Label (0, 4),
         "all required fields complete",
         "required complete");
      Check
        (Required_Fields_Label (2, 5),
         "2 of 5 required fields missing",
         "required missing");
      Check (Form_Progress_Label (0, 0), "no fields", "no fields");
      Check (Form_Progress_Label (5, 5), "all fields complete", "all fields");
      Check (Form_Progress_Label (3, 5), "3 of 5 fields complete", "progress");
      Check (Unsaved_Changes_Label, "no unsaved changes", "no unsaved");
      Check (Unsaved_Changes_Label (2), "2 unsaved changes", "unsaved count");
      Check (Submission_Label (Saving_Form), "saving form", "saving");
      Check (Submission_Label (Saved_Form), "form saved", "saved");
      Check
        (Submission_Label (Failed_Form, Errors => 2),
         "submission failed with 2 errors",
         "failed errors");

      Invalid := Required_Fields_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid required field count",
         "invalid required count rejected");
      Invalid := Form_Progress_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid form progress",
         "invalid form progress rejected");
   end Test_Progress_And_Submission_Labels;

   procedure Test_Section_Step_And_Issue_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Section_Progress_Label ("profile", 2, 4),
         "profile: 2 of 4 fields complete",
         "section progress");
      Check (Form_Step_Label (0, 0), "no form steps", "no steps");
      Check (Form_Step_Label (2, 4), "step 2 of 4", "step");
      Check (Form_Step_Label (2, 4, "billing"), "step 2 of 4: billing", "named step");
      Check (Form_Error_Summary_Label, "no form issues", "no issues");
      Check (Form_Error_Summary_Label (Errors => 2), "2 errors", "errors");
      Check
        (Form_Error_Summary_Label (Errors => 2, Warnings => 1),
         "2 errors, 1 warning",
         "issues");

      Invalid := Section_Progress_Label (" ", 2, 4);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid section name",
         "empty section name rejected");
      Invalid := Form_Step_Label (5, 4);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid form step",
         "invalid step rejected");
   end Test_Section_Step_And_Issue_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 28);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Required_Fields_Label_Into (0, 4, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 28
         and then Exact = "all required fields complete",
         "required fields bounded exact text");

      Character_Usage_Label_Into (12, 50, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "12 of 50 c",
         "character usage bounded overflow prefix");

      Character_Count_Label_Into (12, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 13
         and then Exact (1 .. Written) = "12 characters",
         "character count bounded exact text");

      Character_Limit_Label_Into (50, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 21
         and then Exact (1 .. Written) = "50 characters maximum",
         "character limit bounded exact text");

      Form_State_Label_Into (Saved_Form, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "form state bounded rejects non-1-based buffers");

      Field_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "field bounded returns validation status");

      Form_Step_Label_Into (2, 4, Exact, Written, Code, "billing");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 20
         and then Exact (1 .. Written) = "step 2 of 4: billing",
         "form step bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize form/input tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_And_Field_Labels'Access,
        "state and field labels");
      Register_Routine (T, Test_Character_Labels'Access,
        "character labels");
      Register_Routine (T, Test_Progress_And_Submission_Labels'Access,
        "progress and submission labels");
      Register_Routine (T, Test_Section_Step_And_Issue_Labels'Access,
        "section step and issue labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Forms;
