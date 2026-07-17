with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Humanize.Attachments;
with Humanize.Data_Quality;
with Humanize.Markup;
with Humanize.Media;
with Humanize.Permissions;
with Humanize.Schema;
with Humanize.Secrets;
with Humanize.Status;

procedure Security_Data_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;
begin
   Put_Result
     ("secret",
      Humanize.Secrets.Secret_Label
        ("DATABASE_URL", "postgres://user:secret@example/db",
         Humanize.Secrets.Database_URL_Secret));
   Put_Result
     ("permission",
      Humanize.Permissions.Permission_Label
        ("release-bot", "deploy", Humanize.Permissions.Granted));
   Put_Result
      ("attachment",
      Humanize.Attachments.Attachment_Label
        ("invoice.pdf", Humanize.Attachments.Document_Attachment,
         Humanize.Attachments.Uploaded_Attachment));
   Put_Result
     ("media",
      Humanize.Media.Media_Summary
        ("preview.png", Humanize.Media.Image_Media,
         Humanize.Media.Ready_Media));
   Put_Result
     ("data",
      Humanize.Data_Quality.Import_Result_Label
        ("customers.csv", Humanize.Data_Quality.Import_Partial,
         Accepted => 98, Rejected => 2));
   Put_Result
     ("schema",
      Humanize.Schema.Type_Mismatch_Label
        ("age", Humanize.Schema.Integer_Field, Humanize.Schema.String_Field));
   Put_Result
     ("markup",
      Humanize.Markup.Accessibility_Summary_Label
        (Issues => 2, Target => "checkout form"));
end Security_Data_Demo;
