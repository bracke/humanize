with AUnit.Assertions;

with Humanize.Badges;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Badges is
   use Humanize.Badges;
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

   procedure Test_Tone_State_And_Badge_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Badge_Tone_Label (Info_Tone), "info badge", "info tone");
      Check (Badge_Tone_Label (Danger_Tone), "danger badge", "danger tone");
      Check (Badge_State_Label (New_Badge), "new badge", "new state");
      Check (Badge_State_Label (Dismissible_Badge), "dismissible badge", "dismissible state");
      Check
        (Badge_Priority_Label (High_Priority),
         "high priority badge",
         "priority label");
      Check (Badge_Label ("beta"), "beta neutral badge", "default badge");
      Check
        (Badge_Label ("beta", Info_Tone, New_Badge),
         "beta info new badge",
         "new info badge");
      Check
        (Status_Badge_Label ("healthy", Success_Tone),
         "healthy status, success",
         "status badge");

      Invalid := Badge_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid badge label",
         "empty badge rejected");
      Invalid := Status_Badge_Label (" ", Success_Tone);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid status badge",
         "empty status badge rejected");
   end Test_Tone_State_And_Badge_Labels;

   procedure Test_Tag_Chip_And_Count_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Count_Badge_Label ("issue", 0), "no issues", "zero count badge");
      Check (Count_Badge_Label ("issue", 1), "1 issue", "single count badge");
      Check (Count_Badge_Label ("issue", 3), "3 issues", "many count badge");
      Check (Tag_Label ("backend"), "backend tag", "tag");
      Check (Tag_Count_Label (0), "no tags", "no tags");
      Check (Tag_Count_Label (2), "2 tags", "tag count");
      Check (Chip_Label ("open"), "open chip", "chip");
      Check (Chip_Label ("open", Selected => True), "open chip selected", "selected chip");
      Check (Dismiss_Label ("backend"), "dismiss backend", "dismiss");

      Invalid := Tag_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid tag label",
         "empty tag rejected");
      Invalid := Chip_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid chip label",
         "empty chip rejected");
      Invalid := Dismiss_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid dismiss label",
         "empty dismiss rejected");
   end Test_Tag_Chip_And_Count_Labels;

   procedure Test_Shortcut_And_Overflow_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (New_Label ("feature"), "feature info new badge", "new shortcut");
      Check
        (Updated_Label ("docs"),
         "docs success updated badge",
         "updated shortcut");
      Check
        (Deprecated_Label ("api"),
         "api warning deprecated badge",
         "deprecated shortcut");
      Check (Overflow_Badge_Label (0), "no hidden badges", "no overflow");
      Check (Overflow_Badge_Label (1), "+1 more badge", "single overflow");
      Check (Overflow_Badge_Label (5), "+5 more badges", "many overflow");
      Check
        (Priority_Badge_Label (Critical_Priority),
         "critical priority badge",
         "priority badge");
      Check
        (Priority_Badge_Label (High_Priority, "incident"),
         "incident high priority badge",
         "named priority badge");
   end Test_Shortcut_And_Overflow_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 19);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Badge_Label_Into ("beta", Exact, Written, Code, Info_Tone, New_Badge);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 19
         and then Exact = "beta info new badge",
         "badge bounded exact text");

      Status_Badge_Label_Into ("healthy", Success_Tone, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "healthy st",
         "status badge bounded overflow prefix");

      Badge_Tone_Label_Into (Info_Tone, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "badge tone bounded rejects non-1-based buffers");

      Tag_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "tag bounded returns validation status");

      Overflow_Badge_Label_Into (5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 14
         and then Exact (1 .. Written) = "+5 more badges",
         "overflow bounded exact text");

      Priority_Badge_Label_Into (Low_Priority, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 18
         and then Exact (1 .. Written) = "low priority badge",
         "priority bounded exact text");

      New_Label_Into ("beta", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 19
         and then Exact = "beta info new badge",
         "new shortcut bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize badge/tag tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Tone_State_And_Badge_Labels'Access,
        "tone state and badge labels");
      Register_Routine (T, Test_Tag_Chip_And_Count_Labels'Access,
        "tag chip and count labels");
      Register_Routine (T, Test_Shortcut_And_Overflow_Labels'Access,
        "shortcut and overflow labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Badges;
