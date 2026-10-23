with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Diagnostics;
with Humanize.Status;
with Humanize.System_Status;
with Humanize.System_Status.Localized;
with Humanize.Thresholds;
with Humanize_Demo_Runtime;

procedure System_Status_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;

   Loaded : Messages.Runtime.Load_Result;
begin
   Put_Result
     ("http",
      Humanize.System_Status.HTTP_Status_Label (503));
   Put_Result
     ("service",
      Humanize.System_Status.Service_Status_Label
        ("API", Humanize.System_Status.Degraded_Service));
   Put_Result
     ("diagnostic",
      Humanize.Diagnostics.Issue_Summary_Label
        (Errors => 2, Warnings => 1));
   Put_Result
     ("threshold",
      Humanize.Thresholds.Threshold_Summary_Label
        (Normal => 3, Warnings => 1, Critical => 1, Breaches => 0));
   --  The same status in German.
   Humanize.Catalogs.Load_Defaults (Humanize_Demo_Runtime.Runtime, Loaded, Locale => "de");
   Put_Result
     ("service (de)",
      Humanize.System_Status.Localized.Service_Status_Label
        (Humanize.Contexts.Create (Humanize_Demo_Runtime.Runtime'Access, "de"),
         "API", Humanize.System_Status.Degraded_Service));
end System_Status_Demo;
