with Ada.Characters.Handling;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with AUnit.Assertions;

with Messages.Runtime;

with Humanize.Catalogs;
with Humanize.Contexts;
with Humanize.Datetimes;
with Humanize.Durations;
with Humanize.Lists;
with Humanize.Frequencies;
with Humanize.Numbers;
with Humanize.Operations;
with Humanize.Resources;
with Humanize.Parsing.Phrases;
with Humanize.Phrases;
with Humanize.Status;
with Humanize.System_Status.Localized;
with Humanize.Units;

--  The English the formatters write in code must be what the catalog's en
--  templates render: each English output reads back through its template
--  (a reading re-renders the text exactly), so a drift fails here.
package body Humanize.Tests.Phrase_Consistency is

   use type Humanize.Status.Status_Code;

   Runtime : aliased Messages.Runtime.Instance;
   Loaded  : Boolean := False;

   function En return Humanize.Contexts.Context is
      Result : Messages.Runtime.Load_Result;
   begin
      if not Loaded then
         Humanize.Catalogs.Load_Defaults (Runtime, Result, Locale => "en");
         Loaded := True;
      end if;
      return Humanize.Contexts.Create (Runtime'Access, "en");
   end En;

   procedure Check (Name : String; Output : Humanize.Status.Text_Result) is
      Text : constant String := To_String (Output.Text);
   begin
      AUnit.Assertions.Assert
        (Output.Status = Humanize.Status.Ok
         and then Humanize.Parsing.Phrases.Parse (En, Name, Text).Status = Humanize.Status.Ok,
         "English " & Name & " differs from its template: [" & Text & "]");
   end Check;

   --  Every value of a status enumeration against "<prefix>.<value>".
   generic
      type Status_Type is (<>);
      Prefix : String;
      with function Phrase (Context : Humanize.Contexts.Context; Status : Status_Type)
        return Humanize.Status.Text_Result;
   procedure Check_Statuses;

   procedure Check_Statuses is
   begin
      for Status in Status_Type loop
         Check (Prefix & "." & Ada.Characters.Handling.To_Lower (Status_Type'Image (Status)), Phrase (En, Status));
      end loop;
   end Check_Statuses;

   procedure Test_Status_Templates (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      package P renames Humanize.Phrases;
      procedure UI is new Check_Statuses (P.UI_Status, "ui", P.Status_Phrase);
      procedure CI is new Check_Statuses (P.CI_Status, "ci", P.CI_Phrase);
      procedure Ticket is new Check_Statuses (P.Ticket_Status, "ticket", P.Ticket_Phrase);
      procedure Payment is new Check_Statuses (P.Payment_Lifecycle_Status, "payment", P.Payment_Lifecycle_Phrase);
      procedure Backup is new Check_Statuses (P.Backup_Status, "backup", P.Backup_Phrase);
      procedure Incident is new Check_Statuses (P.Incident_Status, "incident", P.Incident_Phrase);
      procedure Release is new Check_Statuses (P.Release_Status, "release", P.Release_Phrase);
      procedure Audit is new Check_Statuses (P.Audit_Status, "audit", P.Audit_Phrase);
      procedure Flag is new Check_Statuses (P.Feature_Flag_Status, "flag", P.Feature_Flag_Phrase);
      procedure Webhook is new Check_Statuses (P.Webhook_Status, "webhook", P.Webhook_Phrase);
      procedure API_Key is new Check_Statuses (P.API_Key_Status, "api_key", P.API_Key_Phrase);
      procedure Quota is new Check_Statuses (P.Quota_Status, "quota", P.Quota_Phrase);
      procedure Invoice is new Check_Statuses (P.Invoice_Status, "invoice", P.Invoice_Phrase);
      procedure Database is new Check_Statuses (P.Database_Status, "database", P.Database_Phrase);
      procedure File is new Check_Statuses (P.File_Status, "file", P.File_Phrase);
      procedure Validation is new Check_Statuses (P.Validation_Status, "validation", P.Validation_Phrase);
      procedure Empty is new Check_Statuses (P.Empty_State, "empty", P.Empty_State_Phrase);
      procedure Network is new Check_Statuses (P.Network_Status, "network", P.Network_Phrase);
      procedure Auth is new Check_Statuses (P.Auth_Status, "auth", P.Auth_Phrase);
      procedure Billing is new Check_Statuses (P.Billing_Status, "billing", P.Billing_Phrase);
      procedure Workflow is new Check_Statuses (P.Workflow_Status, "workflow", P.Workflow_Phrase);
      procedure Queue is new Check_Statuses (P.Queue_Status, "queue", P.Queue_Phrase);
      procedure Security is new Check_Statuses (P.Security_Status, "security", P.Security_Phrase);
      procedure Deployment is new Check_Statuses (P.Deployment_Status, "deployment", P.Deployment_Phrase);
      procedure Health is new Check_Statuses (P.Health_Status, "health", P.Health_Phrase);
      procedure Notification is new Check_Statuses (P.Notification_Status, "notification", P.Notification_Phrase);
      procedure Form is new Check_Statuses (P.Form_Status, "form", P.Form_Phrase);
      procedure Access_Status is new Check_Statuses (P.Access_Status, "access", P.Access_Phrase);
      procedure Sync is new Check_Statuses (P.Sync_Status, "sync", P.Sync_Phrase);
      procedure Transfer is new Check_Statuses (P.Transfer_Status, "transfer", P.Transfer_Phrase);
      procedure Search is new Check_Statuses (P.Search_Status, "search", P.Search_Phrase);
      procedure Collaboration is new Check_Statuses (P.Collaboration_Status, "collaboration", P.Collaboration_Phrase);
      procedure Issue is new Check_Statuses (P.Issue_Status, "issue", P.Issue_Phrase);
      procedure Task_Status is new Check_Statuses (P.Task_Status, "task", P.Task_Phrase);
   begin
      UI; CI; Ticket; Payment; Backup; Incident; Release; Audit; Flag; Webhook; API_Key; Quota; Invoice;
      Database; File; Validation; Empty; Network; Auth; Billing; Workflow; Queue; Security; Deployment;
      Health; Notification; Form; Access_Status; Sync; Transfer; Search; Collaboration; Issue; Task_Status;
   end Test_Status_Templates;

   procedure Test_Formatter_Templates (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      package L renames Humanize.Lists;
      package D renames Humanize.Durations;
      package Ph renames Humanize.Phrases;
      Day      : constant Humanize.Datetimes.Civil_Date_Time := (Year => 2026, Month => 3, Day => 10, others => 0);
      Next_Day : constant Humanize.Datetimes.Civil_Date_Time := (Year => 2026, Month => 3, Day => 11, others => 0);
      Later    : constant Humanize.Datetimes.Civil_Date_Time := (Year => 2026, Month => 3, Day => 15, others => 0);
      Next_Week : constant Humanize.Datetimes.Civil_Date_Time := (Year => 2026, Month => 3, Day => 17, others => 0);
   begin
      Check ("all_count", L.All_Count (En, 5, "file", "files"));
      Check ("filtered_count.none", L.Filtered_Count (En, 0, 7, "file", "files"));
      Check ("filtered_count.all", L.Filtered_Count (En, 7, 7, "file", "files"));
      Check ("filtered_count.some", L.Filtered_Count (En, 3, 7, "file", "files"));
      Check ("more_count", L.More_Count (En, 5, 12));
      Check ("others_count", L.Others_Count (En, "Ana", 1));
      Check ("others_count", L.Others_Count (En, "Ana", 4));
      Check ("page_count", L.Page_Count (En, 3, 9));
      Check ("page_navigation.only", L.Page_Navigation_Label (En, 1, 1));
      Check ("page_navigation.first", L.Page_Navigation_Label (En, 1, 4));
      Check ("page_navigation.last", L.Page_Navigation_Label (En, 4, 4));
      Check ("page_navigation.middle", L.Page_Navigation_Label (En, 2, 4));
      Check ("page_size", L.Page_Size_Label (En, 25, "row", "rows"));
      Check ("pagination_range", L.Pagination_Range (En, 11, 20, 95, "row", "rows"));
      Check ("position_count", L.Position_Count (En, 4, 10));
      Check ("selection_count", L.Selection_Count (En, 2, 8, "file", "files"));
      Check ("showing_count", L.Showing_Count (En, 20, 85, "result", "results"));
      Check ("complete_count", D.Complete_Count (En, 3, 10));
      Check ("percent_complete", D.Percent_Complete (En, 42.5));
      Check ("step_count", D.Step_Count (En, 2, 5));
      Check ("attempt_count", D.Attempt_Count (En, 3, 4));
      Check ("throughput_remaining", D.Throughput_Remaining (En, 40, 8, "file"));
      Check ("accessible_progress", D.Accessible_Progress (En, 3, 4));
      Check ("business_days", D.Business_Days (En, 3));
      Check ("working_hours", D.Working_Hours (En, 1));
      Check ("end_of_week", D.End_Of_Week (En));
      Check ("end_of_month", D.End_Of_Month (En));
      Check ("end_of_quarter", D.End_Of_Quarter (En));
      Check ("recurrence.day", D.Recurrence (En, 2, D.Every_Day));
      Check ("recurrence.week", D.Recurrence (En, 1, D.Every_Week));
      Check ("time_of_day.morning", Humanize.Datetimes.Natural_Time_Of_Day (En, (Day with delta Hour => 9)));
      Check ("time_of_day.night", Humanize.Datetimes.Natural_Time_Of_Day (En, (Day with delta Hour => 23)));
      Check ("due.overdue", Humanize.Datetimes.Due_Status (En, Day, Later));
      Check ("due.today", Humanize.Datetimes.Due_Status (En, Day, Day));
      Check ("due.tomorrow", Humanize.Datetimes.Due_Status (En, Next_Day, Day));
      Check ("due.in", Humanize.Datetimes.Due_Status (En, Next_Week, Day));
      Check ("cpu_load", Humanize.Units.Format_CPU_Load (En, 12.5));
      Check ("battery", Humanize.Units.Format_Battery (En, 80.0));
      Check ("screen_size", Humanize.Units.Format_Screen_Size (En, 15.6));
      Check ("refresh_rate", Humanize.Units.Format_Refresh_Rate (En, 144.0));
      Check ("editorial_percent.symbol", Humanize.Numbers.Editorial_Percent (En, 12.5));
      Check ("editorial_percent.word", Humanize.Numbers.Editorial_Percent (En, 12.5, Include_Symbol => False));
      Check ("cache_summary", Ph.Cache_Summary (En, 8, 2));
      Check ("cache_summary.empty", Ph.Cache_Summary (En, 0, 0));
      Check ("queue_summary.empty", Ph.Queue_Summary (En, 0, 0));
      Check ("field_change_summary", Ph.Field_Change_Summary (En, 2, 1, 1));
      Check ("field_diff", Ph.Field_Diff_Summary (En, "title", "draft", "final"));
      Check ("number_comparison.higher", Ph.Number_Comparison (En, 12.0, 10.0));
      Check ("number_comparison.equal", Ph.Number_Comparison (En, 10.0, 10.0));
      Check ("percent_comparison.lower", Ph.Percent_Comparison (En, 8.0, 10.0));
      Check ("date_comparison.same", Ph.Date_Comparison (En, Day, Day));
      Check ("times_noun", Humanize.Frequencies.Times (En, 0, "file", "files"));
      Check ("times_noun", Humanize.Frequencies.Times (En, 1, "file", "files"));
      Check ("times_noun", Humanize.Frequencies.Times (En, 2, "file", "files"));
      Check ("times_noun", Humanize.Frequencies.Times (En, 7, "file", "files"));
      Check ("availability.all", Humanize.Resources.Availability_Label (En, 3, 3));
      Check ("availability.none", Humanize.Resources.Availability_Label (En, 0, 3));
      Check ("availability.partial", Humanize.Resources.Availability_Label (En, 2, 5));
      Check ("operation.partially_succeeded",
             Humanize.Operations.Operation_State_Label (En, Humanize.Operations.Partially_Succeeded));
      Check ("operation.last_success", Humanize.Operations.Last_Success_Label (En, "import", "2 hours ago"));
      Check ("operation.next_retry", Humanize.Operations.Next_Retry_Label (En, "import", "in 5 minutes"));
      Check ("operation.stale_run", Humanize.Operations.Stale_Run_Label (En, "import", "3 days"));
   end Test_Formatter_Templates;

   --  System status: every state of each family, the frames, counts and
   --  labels against "system.*".
   procedure Test_System_Status_Templates (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      package S renames Humanize.System_Status;
      package SL renames Humanize.System_Status.Localized;

      function Key (Family, Image, Suffix : String) return String is
         Lower : constant String := Ada.Characters.Handling.To_Lower (Image);
      begin
         if Lower'Length > Suffix'Length and then Lower (Lower'Last - Suffix'Length + 1 .. Lower'Last) = Suffix then
            return Family & "." & Lower (Lower'First .. Lower'Last - Suffix'Length);
         end if;
         return Family & "." & Lower;
      end Key;
   begin
      for State in S.Service_State loop
         Check (Key ("system.service", State'Image, "_service"), SL.Service_State_Label (En, State));
         Check ("system.named", SL.Service_Status_Label (En, "API", State));
      end loop;
      for State in S.Health_State loop
         Check (Key ("system.health", State'Image, ""), SL.Health_State_Label (En, State));
         Check ("system.named", SL.Health_Label (En, "API", State));
      end loop;
      for State in S.Readiness_State loop
         Check (Key ("system.readiness", State'Image, ""), SL.Readiness_State_Label (En, State));
         Check ("system.named", SL.Readiness_Label (En, "worker", State));
      end loop;
      for State in S.Component_State loop
         Check (Key ("system.component", State'Image, "_component"), SL.Component_State_Label (En, State));
         Check ("system.named", SL.Component_Status_Label (En, "cache", State));
      end loop;
      for State in S.Check_State loop
         Check (Key ("system.check", State'Image, "_check"), SL.Check_State_Label (En, State));
         Check ("system.check_named", SL.Check_Label (En, "disk", State));
      end loop;
      for State in S.Incident_State loop
         Check (Key ("system.incident", State'Image, "_incident"), SL.Incident_State_Label (En, State));
         Check ("system.named", SL.Incident_Label (En, "outage", State));
      end loop;
      for Class in S.HTTP_Status_Class loop
         Check (Key ("system.http", Class'Image, "_status"), SL.HTTP_Status_Class_Label (En, Class));
      end loop;
      for Count in 0 .. 2 loop
         Check ("system.count.components", SL.Component_Count_Label (En, Count));
         Check ("system.count.checks", SL.Check_Count_Label (En, Count));
         Check ("system.count.incidents", SL.Incident_Count_Label (En, Count));
      end loop;
      Check ("system.uptime", SL.Uptime_Label (En, "99.9 %"));
      Check ("system.latency", SL.Latency_Label (En, "120 ms"));
      Check ("system.maintenance_window", SL.Maintenance_Window_Label (En, "Sat 02:00-04:00"));
      Check ("system.last_checked", SL.Last_Checked_Label (En, "2 minutes ago"));
      Check ("system.exit.success", SL.Process_Exit_Label (En, 0));
      Check ("system.exit.failure", SL.Process_Exit_Label (En, 1));
      Check ("system.exit.usage_error", SL.Process_Exit_Label (En, 2));
      Check ("system.exit.not_executable", SL.Process_Exit_Label (En, 126));
      Check ("system.exit.not_found", SL.Process_Exit_Label (En, 127));
      Check ("system.exit.invalid_argument", SL.Process_Exit_Label (En, 128));
      Check ("system.exit.signal", SL.Process_Exit_Label (En, 137));
      Check ("system.exit.failure", SL.Process_Exit_Label (En, 200));
   end Test_System_Status_Templates;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize phrase template consistency tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_Status_Templates'Access, "every English status label is its template");
      Register_Routine (T, Test_Formatter_Templates'Access, "English phrase formatters are their templates");
      Register_Routine (T, Test_System_Status_Templates'Access, "English system status labels are their templates");
   end Register_Tests;

end Humanize.Tests.Phrase_Consistency;
