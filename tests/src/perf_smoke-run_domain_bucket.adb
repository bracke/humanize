with Ada.Calendar;

with Humanize.Builds;
with Humanize.Capabilities;
with Humanize.Cross_Domain;
with Humanize.Diagnostics;
with Humanize.Domain_Details;
with Humanize.Lists;
with Humanize.Operations;
with Humanize.Permissions;
with Humanize.Phrases;
with Humanize.Phrases.Fields;
with Humanize.Phrases.Keys;
with Humanize.Phrases.Locales;
with Humanize.Phrases.Severity;
with Humanize.Phrases.Statuses;
with Humanize.Phrases.Summaries;
with Humanize.Search;
with Humanize.System_Status;

separate (Perf_Smoke)
   procedure Run_Domain_Bucket
     (Context : Humanize.Contexts.Context;
      Started : out Ada.Calendar.Time;
      Stopped : out Ada.Calendar.Time)
   is
   begin
      Started := Ada.Calendar.Clock;
      for I in 1 .. Iterations loop
         declare
            HTTP : constant Humanize.Status.Text_Result :=
              Humanize.System_Status.HTTP_Status_Label (503);
            Operation : constant Humanize.Status.Text_Result :=
              Humanize.Operations.Progress_Summary
                ("sync", Humanize.Operations.Running, 8, 10, Failed => 1);
            Diagnostic : constant Humanize.Status.Text_Result :=
              Humanize.Diagnostics.Issue_Summary_Label
                (Errors => 2, Warnings => 1);
            Search : constant Humanize.Status.Text_Result :=
              Humanize.Search.Search_Result_Summary_Label ("cache", 12);
            Capability : constant Humanize.Status.Text_Result :=
              Humanize.Capabilities.Capability_Matrix_Summary;
            Phrase : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Status_Phrase (Context, Humanize.Phrases.Saved);
            Status_Phrase : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Statuses.Status_Phrase
                (Context, Humanize.Phrases.Saved);
            Field : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Fields.Field_Change_Summary
                (Context, Changed => 3, Added => 1, Removed => 1);
            Key : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Keys.Status_Key (Humanize.Phrases.Saved);
            Severity : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Severity.Severity_Label
                (Humanize.Phrases.Warning_Severity);
            Summary : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Summaries.Queue_Summary
                (Context, Queued => 4, Running => 2, Failed => 1);
            Phrase_Locales : constant Humanize.Status.Text_Result :=
              Humanize.Phrases.Locales.Supported_Phrase_Locales;
            List_Text : constant Humanize.Status.Text_Result :=
              Humanize.Lists.Counted_Noun
                (Context, 1_200, "file", "files",
                 (Number_Style   => Humanize.Lists.Compact_Count,
                  Zero_Style     => Humanize.Lists.No_Zero,
                  Include_Noun   => True,
                  Compact_At     => 1_000,
                  Prefer_Article => False));
            Cross_Domain : constant Humanize.Status.Text_Result :=
              Humanize.Cross_Domain.Metadata_Profile_Label
                ("metadata",
                 (Log_Safe          => True,
                  Privacy_Safe      => True,
                  Parseable         => True,
                  Bounded_Available => True,
                  Stable            => True,
                  Approximate       => False,
                  Lossless          => True));
            Build : constant Humanize.Status.Text_Result :=
              Humanize.Builds.Build_Label
                ("nightly", Humanize.Builds.Build_Running);
            Permission : constant Humanize.Status.Text_Result :=
              Humanize.Permissions.Permission_Label
                ("release-bot", "deploy", Humanize.Permissions.Granted);
            Parsed_Metadata :
              constant Humanize.Domain_Details.Domain_Label_Parse_Result :=
                Humanize.Domain_Details.Parse_Metadata_Summary_Label
                  ("metadata surface=deployments severity=warning "
                   & "tone=caution not final actionable");
         begin
            Check_Status (HTTP.Status, "http status label");
            Check_Status (Operation.Status, "operation progress label");
            Check_Status (Diagnostic.Status, "diagnostic summary label");
            Check_Status (Search.Status, "search result summary label");
            Check_Status (Capability.Status, "capability matrix summary");
            Check_Status (Phrase.Status, "status phrase label");
            Check_Status (Status_Phrase.Status, "child status phrase label");
            Check_Status (Field.Status, "field phrase label");
            Check_Status (Key.Status, "phrase key label");
            Check_Status (Severity.Status, "phrase severity label");
            Check_Status (Summary.Status, "phrase summary label");
            Check_Status (Phrase_Locales.Status, "phrase locale wrapper");
            Check_Status (List_Text.Status, "list counted noun");
            Check_Status (Cross_Domain.Status, "cross-domain metadata profile");
            Check_Status (Build.Status, "build label");
            Check_Status (Permission.Status, "permission label");
            Check_Status (Parsed_Metadata.Status, "metadata summary parse");
            Total := Total + I mod 7;
         end;
      end loop;
      Stopped := Ada.Calendar.Clock;
   end Run_Domain_Bucket;
