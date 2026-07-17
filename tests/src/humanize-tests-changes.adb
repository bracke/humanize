with AUnit.Assertions;

with Humanize.Changes;
with Humanize.Domain_Details;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Changes is
   use Humanize.Changes;
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

   procedure Test_Kind_And_Severity_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Change_Kind_Label (Added_Change), "added", "added kind");
      Check (Change_Kind_Label (Removed_Change), "removed", "removed kind");
      Check (Change_Kind_Label (Modified_Change), "changed", "changed kind");
      Check (Change_Kind_Label (Renamed_Change), "renamed", "renamed kind");
      Check (Change_Kind_Label (Metadata_Change), "metadata changed", "metadata kind");
      Check (Change_Kind_Label (Unknown_Change), "unknown change", "unknown kind");
      Check
        (Change_Severity_Label (Informational_Change),
         "informational change",
         "informational severity");
      Check (Change_Severity_Label (Minor_Change), "minor change", "minor severity");
      Check (Change_Severity_Label (Major_Change), "major change", "major severity");
      Check
        (Change_Severity_Label (Breaking_Change),
         "breaking change",
         "breaking severity");
   end Test_Kind_And_Severity_Labels;

   procedure Test_Change_Set_And_Summary
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Change_Set_Label, "no changes", "empty change set");
      Check
        (Change_Set_Label (Added => 3, Removed => 2, Modified => 1),
         "3 added, 2 removed, 1 changed",
         "change set counts");
      Check
        (Change_Set_Label (Unchanged => 5),
         "5 unchanged",
         "unchanged count");
      Check
        (Change_Summary_Label
           (Total => 8, Added => 2, Removed => 1, Modified => 3, Renamed => 1,
            Unchanged => 1),
         "8 items, 2 added, 1 removed, 3 changed, 1 renamed, 1 unchanged",
         "change summary");
   end Test_Change_Set_And_Summary;

   procedure Test_Item_And_Field_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Invalid : Text_Result;
      Item_Detailed : constant Text_Result :=
        Item_Change_Label
          ("config.yml", Conflict_Change,
           Change_Label_Options'
             (Mode             => Change_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
      Parsed_Item : constant Change_Label_Parse_Result :=
        Parse_Item_Change_Label ("config.yml conflict", Conflict_Change);
      Scanned_Item : constant Change_Label_Parse_Result :=
        Scan_Item_Change_Label ("config.yml conflict trailing", Conflict_Change);
   begin
      Check (Item_Change_Label ("config.yml", Added_Change), "config.yml added", "item added");
      Check
        (Item_Detailed,
         "[changes danger] config.yml conflict",
         "item change option metadata");
      AUnit.Assertions.Assert
        (Parsed_Item.Status = Ok
         and then Parsed_Item.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Item.Name_Length = 10,
         "parse item change metadata");
      AUnit.Assertions.Assert
        (Scanned_Item.Status = Ok
         and then Scanned_Item.Consumed = 19,
         "scan item change prefix");
      Check (Rename_Label ("old_name", "new_name"), "renamed from old_name to new_name", "rename");
      Check
        (Move_Label ("config.yml", "drafts", "published"),
         "config.yml moved from drafts to published",
         "move");
      Check
        (Field_Change_Label ("status", "draft", "published"),
         "status changed from draft to published",
         "field value change");
      Check (Field_Change_Label ("title"), "title changed", "field changed");
      Check (Metadata_Only_Label, "only metadata changed", "metadata only");
      Check
        (Metadata_Only_Label (2),
         "only 2 metadata fields changed",
         "metadata count");

      Invalid := Item_Change_Label (" ", Added_Change);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid item name",
         "empty item name rejected");
      Invalid := Rename_Label ("old", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid rename",
         "empty rename target rejected");
      Invalid := Field_Change_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid field name",
         "empty field name rejected");
   end Test_Item_And_Field_Labels;

   procedure Test_Conflict_And_Sync_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Conflict_Detailed : constant Text_Result :=
        Conflict_Label
          (2,
           Change_Label_Options'
             (Mode             => Change_Detailed,
              Include_Surface  => True,
              Include_Severity => True,
              Include_Tone     => False));
   begin
      Check (No_Changes_Label, "no changes", "no changes label");
      Check (Conflict_Label (0), "no conflicts", "no conflicts label");
      Check (Conflict_Label (2), "2 conflicts", "conflict count");
      Check
        (Conflict_Detailed,
         "[changes danger] 2 conflicts",
         "conflict option metadata");
      Check (Sync_Change_Label, "no sync changes", "empty sync changes");
      Check
        (Sync_Change_Label
           (Uploaded => 2, Downloaded => 1, Deleted => 1, Conflicts => 1),
         "2 uploaded, 1 downloaded, 1 deleted, 1 conflict",
         "sync changes");
   end Test_Conflict_And_Sync_Labels;

   procedure Test_Net_Patch_And_Review_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
      Parsed_Numeric : Change_Label_Parse_Result;
   begin
      Check (Net_Change_Label (2, 2), "no net change", "no net change");
      Check (Net_Change_Label (2, 1), "net +1 item", "single positive net change");
      Check (Net_Change_Label (5, 3), "net +2 items", "positive net change");
      Check (Net_Change_Label (1, 2), "net -1 item", "single negative net change");
      Check (Net_Change_Label (1, 4), "net -3 items", "negative net change");
      Check (Patch_Size_Label, "no line changes", "empty patch size");
      Check
        (Patch_Size_Label (Lines_Added => 10, Lines_Removed => 2),
         "10 lines added, 2 lines removed",
         "patch size");
      Check
        (Review_Progress_Label (3, 5),
         "3 of 5 changes reviewed",
         "review progress");
      Check (Review_Progress_Label (0, 0), "no changes to review", "empty review");
      Check
        (Review_Progress_Label (5, 5),
         "all changes reviewed",
         "complete review");
      Check
        (Numeric_Field_Change_Label ("timeout", 30.0, 45.0, "s"),
         "timeout increased from 3.00000000000000E+01 s to 4.50000000000000E+01 s",
         "numeric field change label");
      Check
        (Duration_Field_Change_Label ("retry delay", "30 seconds", "1 minute"),
         "retry delay changed from 30 seconds to 1 minute",
         "duration field change label");
      Check
        (Date_Field_Change_Label ("due date", "Monday", "Friday"),
         "due date moved later from Monday to Friday",
         "date field change label");
      Check
        (Boolean_Field_Change_Label ("MFA", False, True),
         "MFA changed from disabled to enabled",
         "boolean field change label");
      Check
        (Collection_Field_Change_Label ("permissions", Added => 2, Removed => 1),
         "permissions changed: 2 added, 1 removed",
         "collection field change label");
      Parsed_Numeric := Parse_Numeric_Field_Change_Label
        ("timeout increased from 1 to 2");
      AUnit.Assertions.Assert
        (Parsed_Numeric.Status = Ok
         and then Parsed_Numeric.Name_Length = 7
         and then Parsed_Numeric.State_Length = 9,
         "parse numeric field change label");

      Invalid := Review_Progress_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid review progress",
         "invalid review progress rejected");
   end Test_Net_Patch_And_Review_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 29);
      Tiny   : String (1 .. 12);
      Offset : String (2 .. 20);
      Written : Natural;
      Code : Status_Code;
   begin
      Change_Set_Label_Into
        (Exact, Written, Code, Added => 3, Removed => 2, Modified => 1);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 29
         and then Exact = "3 added, 2 removed, 1 changed",
         "change set bounded exact text");

      Rename_Label_Into ("old_name", "new_name", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 12
         and then Tiny = "renamed from",
         "rename bounded overflow prefix");

      Change_Set_Label_Into (Offset, Written, Code, Added => 1);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "change set bounded rejects non-1-based buffers");

      Field_Change_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "field bounded returns validation status");

      Net_Change_Label_Into (5, 3, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 12 and then Tiny = "net +2 items",
         "net change bounded exact text");

      Patch_Size_Label_Into
        (Tiny, Written, Code, Lines_Added => 10, Lines_Removed => 2);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 12
         and then Tiny = "10 lines add",
         "patch size bounded overflow prefix");

      Change_Severity_Label_Into (Major_Change, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 12 and then Tiny = "major change",
         "severity bounded exact text");

      Sync_Change_Label_Into (Tiny, Written, Code, Uploaded => 2);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 10
         and then Tiny (1 .. Written) = "2 uploaded",
         "sync bounded exact text");

      Review_Progress_Label_Into (6, 5, Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "review bounded returns validation status");

      Numeric_Field_Change_Label_Into
        ("timeout", 1.0, 2.0, Tiny, Written, Code, "s");
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 12
         and then Tiny = "timeout incr",
         "numeric field change bounded overflow");

      Item_Change_Label_Into
        ("config.yml", Conflict_Change, Exact, Written, Code,
         Change_Label_Options'
           (Mode             => Change_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 29
         and then Exact = "[changes danger] config.yml c",
         "item change option bounded overflow");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize change-set tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Kind_And_Severity_Labels'Access,
        "change kind and severity labels");
      Register_Routine (T, Test_Change_Set_And_Summary'Access,
        "change-set summaries");
      Register_Routine (T, Test_Item_And_Field_Labels'Access,
        "item and field change labels");
      Register_Routine (T, Test_Conflict_And_Sync_Labels'Access,
        "conflict and sync labels");
      Register_Routine (T, Test_Net_Patch_And_Review_Labels'Access,
        "net, patch, and review labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Changes;
