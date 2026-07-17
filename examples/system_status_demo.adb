with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Humanize.Diagnostics;
with Humanize.Status;
with Humanize.System_Status;
with Humanize.Thresholds;

procedure System_Status_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;
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
end System_Status_Demo;
