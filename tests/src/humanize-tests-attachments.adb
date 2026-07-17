with AUnit.Assertions;

with Humanize.Attachments;
with Humanize.Status;
with Humanize.Tests.Support;

package body Humanize.Tests.Attachments is
   use Humanize.Attachments;
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

   procedure Test_State_Kind_And_Count_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Attachment_State_Label (Uploading_Attachment),
         "uploading attachment",
         "uploading state");
      Check
        (Attachment_State_Label (Blocked_Attachment),
         "blocked attachment",
         "blocked state");
      Check
        (Attachment_Kind_Label (Image_Attachment),
         "image attachment",
         "image kind");
      Check
        (Scan_State_Label (Suspicious),
         "scan suspicious",
         "scan suspicious");
      Check (Attachment_Count_Label (0), "no attachments", "no attachments");
      Check (Attachment_Count_Label (1), "1 attachment", "one attachment");
      Check (Attachment_Count_Label (4), "4 attachments", "attachments");
   end Test_State_Kind_And_Count_Labels;

   procedure Test_Attachment_Upload_And_Size_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check
        (Attachment_Label ("photo.png", Image_Attachment, Uploaded_Attachment),
         "photo.png image uploaded",
         "attachment label");
      Check (Upload_Progress_Label (0, 0), "no uploads", "no uploads");
      Check
        (Upload_Progress_Label (2, 5),
         "2 of 5 uploads complete",
         "upload progress");
      Check
        (Attachment_Size_Label ("photo.png", "1.5 MiB"),
         "photo.png, 1.5 MiB",
         "attachment size");

      Invalid := Attachment_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid attachment name",
         "empty attachment rejected");
      Invalid := Upload_Progress_Label (6, 5);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid upload progress",
         "invalid upload progress rejected");
      Invalid := Attachment_Size_Label ("photo.png", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid attachment size",
         "empty attachment size rejected");
   end Test_Attachment_Upload_And_Size_Labels;

   procedure Test_Action_Scan_And_Group_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Invalid : Text_Result;
   begin
      Check (Preview_Label, "preview attachment", "preview generic");
      Check (Preview_Label ("photo.png"), "preview photo.png", "preview named");
      Check (Download_Label, "download attachment", "download generic");
      Check
        (Download_Label ("photo.png"),
         "download photo.png",
         "download named");
      Check (Remove_Label, "remove attachment", "remove generic");
      Check (Remove_Label ("photo.png"), "remove photo.png", "remove named");
      Check
        (Scan_Result_Label ("photo.png", Safe),
         "photo.png scan safe",
         "scan result");
      Check
        (Upload_Error_Label ("photo.png"),
         "photo.png upload failed",
         "upload error");
      Check
        (Upload_Error_Label ("photo.png", "too large"),
         "photo.png upload failed: too large",
         "upload error reason");
      Check
        (Attachment_Group_Label ("images", 3),
         "images: 3 attachments",
         "attachment group");
      Check
        (Image_Dimensions_Label ("photo.png", "800 x 600"),
         "photo.png, 800 x 600",
         "image dimensions");
      Check
        (Expiring_Link_Label ("photo.png", "tomorrow"),
         "photo.png link expires tomorrow",
         "expiring link");

      Invalid := Scan_Result_Label (" ", Safe);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid attachment name",
         "empty scan attachment rejected");
      Invalid := Upload_Error_Label (" ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid attachment name",
         "empty upload error attachment rejected");
      Invalid := Attachment_Group_Label (" ", 1);
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid attachment group",
         "empty group rejected");
      Invalid := Image_Dimensions_Label ("photo.png", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid image dimensions",
         "empty dimensions rejected");
      Invalid := Expiring_Link_Label ("photo.png", " ");
      AUnit.Assertions.Assert
        (Invalid.Status = Invalid_Argument
         and then Support.Text (Invalid) = "invalid expiry label",
         "empty expiry rejected");
   end Test_Action_Scan_And_Group_Labels;

   procedure Test_Bounded_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Exact  : String (1 .. 24);
      Tiny   : String (1 .. 10);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      Attachment_Label_Into
        ("photo.png", Exact, Written, Code, Image_Attachment, Uploaded_Attachment);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 24
         and then Exact = "photo.png image uploaded",
         "attachment bounded exact text");

      Upload_Progress_Label_Into (2, 5, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 10
         and then Tiny = "2 of 5 upl",
         "upload progress bounded overflow prefix");

      Attachment_State_Label_Into (Uploaded_Attachment, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "attachment bounded rejects non-1-based buffers");

      Attachment_Label_Into (" ", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "attachment bounded returns validation status");

      Download_Label_Into (Exact, Written, Code, "photo.png");
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 18
         and then Exact (1 .. Written) = "download photo.png",
         "download bounded exact text");

      Image_Dimensions_Label_Into
        ("photo.png", "800 x 600", Exact, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 20
         and then Exact (1 .. Written) = "photo.png, 800 x 600",
         "dimensions bounded exact text");
   end Test_Bounded_Labels;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize attachment/upload tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_State_Kind_And_Count_Labels'Access,
        "state kind and count labels");
      Register_Routine (T, Test_Attachment_Upload_And_Size_Labels'Access,
        "attachment upload and size labels");
      Register_Routine (T, Test_Action_Scan_And_Group_Labels'Access,
        "action scan and group labels");
      Register_Routine (T, Test_Bounded_Labels'Access,
        "bounded labels");
   end Register_Tests;

end Humanize.Tests.Attachments;
