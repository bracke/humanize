with Ada.Strings.Unbounded;
with Ada.Text_IO;

with Humanize.Builds;
with Humanize.Changes;
with Humanize.Comparisons;
with Humanize.Deployments;
with Humanize.Operations;
with Humanize.Status;
with Humanize.Workflows;

procedure Workflow_Ops_Demo is
   use Ada.Strings.Unbounded;

   procedure Put_Result (Label : String; Result : Humanize.Status.Text_Result) is
   begin
      Ada.Text_IO.Put_Line (Label & " : " & To_String (Result.Text));
   end Put_Result;
begin
   Put_Result
     ("operation",
      Humanize.Operations.Progress_Summary
        ("sync", Humanize.Operations.Running, 8, 10, Failed => 1));
   Put_Result
     ("comparison",
      Humanize.Comparisons.Multi_Value_Summary ("settings", 3, 7, 10));
   Put_Result
     ("workflow",
      Humanize.Workflows.Workflow_Summary_Label
        (Total => 6, Completed => 4, Active => 1, Blocked => 1));
   Put_Result
     ("change",
      Humanize.Changes.Change_Summary_Label
        (Total => 6, Added => 3, Modified => 2, Removed => 1));
   Put_Result
     ("build",
      Humanize.Builds.Build_Label ("nightly", Humanize.Builds.Build_Running));
   Put_Result
     ("deployment",
      Humanize.Deployments.Deployment_Label
        ("api", "production", Humanize.Deployments.Deploying));
end Workflow_Ops_Demo;
