with AUnit.Assertions;

with Humanize.Domain_Details;
with Humanize.Status;
with Humanize.System_Status;
with Humanize.Tests.Support;

package body Humanize.Tests.System_Status is
   use Humanize.Status;
   use Humanize.System_Status;

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

   procedure Test_HTTP_Status (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check (HTTP_Status_Label (200), "HTTP 200 ok", "http ok");
      Check (HTTP_Status_Label (404), "HTTP 404 not found", "http not found");
      Check (HTTP_Status_Label (429), "HTTP 429 too many requests", "http rate limit");
      Check (HTTP_Status_Label (503), "HTTP 503 service unavailable", "http unavailable");
      Check (HTTP_Status_Label (599), "HTTP 599 unknown status", "http unknown valid");
      Check (HTTP_Status_Label (404, Include_Code => False), "not found", "http reason only");
      Check (HTTP_Status_Reason (451), "unavailable for legal reasons", "http reason");
      Check (HTTP_Status_Class_Label (Client_Error_Status), "client error", "http class label");
      AUnit.Assertions.Assert
        (HTTP_Status_Class_Of (103) = Informational_Status
         and then HTTP_Status_Class_Of (204) = Successful_Status
         and then HTTP_Status_Class_Of (308) = Redirection_Status
         and then HTTP_Status_Class_Of (404) = Client_Error_Status
         and then HTTP_Status_Class_Of (503) = Server_Error_Status,
         "http status classes");
   end Test_HTTP_Status;

   procedure Test_Errno_Exit_And_Signal
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check (Errno_Label (0), "OK success", "errno success");
      Check (Errno_Label (2), "ENOENT no such file or directory", "errno enoent");
      Check (Errno_Label (13), "EACCES permission denied", "errno access");
      Check (Errno_Label (111), "ECONNREFUSED connection refused", "errno refused");
      Check (Errno_Label (777), "errno 777 unknown error", "errno unknown");
      Check (Errno_Label (13, Include_Code => False), "permission denied", "errno reason");
      Check (Signal_Label (15), "signal 15 SIGTERM termination request", "sigterm");
      Check (Signal_Label (9, Include_Number => False), "SIGKILL killed", "sigkill");
      Check (Signal_Label (64), "signal 64 signal 64 unknown signal", "unknown signal");
      Check (Process_Exit_Label (0), "exit 0 success", "exit success");
      Check (Process_Exit_Label (1), "exit 1 failure", "exit failure");
      Check (Process_Exit_Label (126), "exit 126 command not executable", "exit 126");
      Check (Process_Exit_Label (127), "exit 127 command not found", "exit 127");
      Check
        (Process_Exit_Label (130),
         "exit 130 terminated by SIGINT interrupt", "exit signal");
      Check (Process_Exit_Label (200), "exit 200 failure", "exit fallback");
   end Test_Errno_Exit_And_Signal;

   procedure Test_SQLSTATE (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
   begin
      Check
        (SQLSTATE_Class_Label (SQLSTATE_Class'("23")),
         "SQLSTATE 23 integrity constraint violation", "sqlstate integrity");
      Check
        (SQLSTATE_Class_Label (SQLSTATE_Class'("42"), Include_Code => False),
         "syntax error or access rule violation", "sqlstate reason only");
      Check
        (SQLSTATE_Class_Label (SQLSTATE_Class'("XX")),
         "SQLSTATE XX internal error", "sqlstate internal");
      Check
        (SQLSTATE_Class_Label (SQLSTATE_Class'("ZZ")),
         "SQLSTATE ZZ unknown SQLSTATE class", "sqlstate unknown");
   end Test_SQLSTATE;

   procedure Test_Operational_State_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
   begin
      Check
        (Service_State_Label (Operational_Service),
         "operational", "service operational");
      Check
        (Service_State_Label (Degraded_Service),
         "degraded performance", "service degraded");
      Check
        (Service_State_Label (Partial_Outage_Service),
         "partial outage", "service partial outage");
      Check
        (Service_State_Label (Major_Outage_Service),
         "major outage", "service major outage");
      Check
        (Service_State_Label (Maintenance_Service),
         "under maintenance", "service maintenance");
      Check
        (Health_State_Label (Critical), "critical", "health critical");
      Check
        (Readiness_State_Label (Draining), "draining", "readiness draining");
      Check
        (Component_State_Label (Restarting_Component),
         "restarting", "component restarting");
      Check
        (Check_State_Label (Timed_Out_Check),
         "timed out", "check timed out");
      Check
        (Incident_State_Label (Scheduled_Maintenance_Incident),
         "scheduled maintenance", "incident maintenance");
   end Test_Operational_State_Labels;

   procedure Test_Operational_Dashboard_Labels
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      use type Humanize.Domain_Details.Domain_Severity;
      Service_Detailed : constant Text_Result :=
        Service_Status_Label
          ("API", Degraded_Service,
           (Mode             => System_Status_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Health_Detailed : constant Text_Result :=
        Health_Label
          ("database", Critical,
           (Mode             => System_Status_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Readiness_Detailed : constant Text_Result :=
        Readiness_Label
          ("checkout", Not_Ready,
           (Mode             => System_Status_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Component_Detailed : constant Text_Result :=
        Component_Status_Label
          ("database", Offline_Component,
           (Mode             => System_Status_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Check_Detailed : constant Text_Result :=
        Check_Label
          ("cache", Failing_Check,
           (Mode             => System_Status_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Incident_Detailed : constant Text_Result :=
        Incident_Label
          ("INC-42", Resolved_Incident,
           (Mode             => System_Status_Detailed,
            Include_Surface  => True,
            Include_Severity => True,
            Include_Tone     => False));
      Parsed_Service : constant System_Status_Label_Parse_Result :=
        Parse_Service_Status_Label ("API degraded performance", Degraded_Service);
      Parsed_Health : constant System_Status_Label_Parse_Result :=
        Parse_Health_Label ("database critical", Critical);
      Parsed_Readiness : constant System_Status_Label_Parse_Result :=
        Parse_Readiness_Label ("checkout not ready", Not_Ready);
      Parsed_Component : constant System_Status_Label_Parse_Result :=
        Parse_Component_Status_Label ("database offline", Offline_Component);
      Parsed_Check : constant System_Status_Label_Parse_Result :=
        Parse_Check_Label ("cache check failing", Failing_Check);
      Scanned_Incident : constant System_Status_Label_Parse_Result :=
        Scan_Incident_Label ("INC-42 resolved trailing", Resolved_Incident);
   begin
      Check
        (Service_Status_Label ("API", Operational_Service),
         "API operational", "service status");
      Check
        (Service_Status_Label ("  API  ", Degraded_Service),
         "API degraded performance", "service status trims");
      Check
        (Health_Label ("worker pool", Warning),
         "worker pool warning", "health label");
      Check
        (Readiness_Label ("checkout", Not_Ready),
         "checkout not ready", "readiness label");
      Check
        (Component_Status_Label ("database", Offline_Component),
         "database offline", "component status");
      Check
        (Check_Label ("cache", Passing_Check),
         "cache check passing", "check label");
      Check
        (Incident_Label ("INC-42", Monitoring_Incident),
         "INC-42 monitoring", "incident label");
      Check
        (Component_Count_Label (0), "no components", "zero components");
      Check
        (Component_Count_Label (1), "1 component", "one component");
      Check
        (Component_Count_Label (3), "3 components", "many components");
      Check
        (Check_Count_Label (2), "2 checks", "check count");
      Check
        (Incident_Count_Label (1), "1 incident", "incident count");
      Check
        (Uptime_Label ("99.95%"), "uptime 99.95%", "uptime label");
      Check
        (Latency_Label ("120 ms"), "latency 120 ms", "latency label");
      Check
        (Maintenance_Window_Label ("Sunday 02:00-03:00"),
         "maintenance window Sunday 02:00-03:00", "maintenance window");
      Check
        (Last_Checked_Label ("2 minutes ago"),
         "last checked 2 minutes ago", "last checked");
      Check
        (Service_Detailed,
         "[system-status warning] API degraded performance",
         "service status option metadata");
      AUnit.Assertions.Assert
        (Parsed_Service.Status = Ok
         and then Parsed_Service.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Service.Name_Length = 3,
         "parse service status metadata");
      Check
        (Health_Detailed,
         "[system-status danger] database critical",
         "health option metadata");
      AUnit.Assertions.Assert
        (Parsed_Health.Status = Ok
         and then Parsed_Health.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Health.Name_Length = 8,
         "parse health metadata");
      Check
        (Readiness_Detailed,
         "[system-status warning] checkout not ready",
         "readiness option metadata");
      AUnit.Assertions.Assert
        (Parsed_Readiness.Status = Ok
         and then Parsed_Readiness.Metadata.Severity =
           Humanize.Domain_Details.Warning_Severity
         and then Parsed_Readiness.Name_Length = 8,
         "parse readiness metadata");
      Check
        (Component_Detailed,
         "[system-status danger] database offline",
         "component option metadata");
      AUnit.Assertions.Assert
        (Parsed_Component.Status = Ok
         and then Parsed_Component.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Component.Name_Length = 8,
         "parse component metadata");
      Check
        (Check_Detailed,
         "[system-status danger] cache check failing",
         "check option metadata");
      AUnit.Assertions.Assert
        (Parsed_Check.Status = Ok
         and then Parsed_Check.Metadata.Severity =
           Humanize.Domain_Details.Danger_Severity
         and then Parsed_Check.Name_Length = 5,
         "parse check metadata");
      Check
        (Incident_Detailed,
         "[system-status success] INC-42 resolved",
         "incident option metadata");
      AUnit.Assertions.Assert
        (Scanned_Incident.Status = Ok
         and then Scanned_Incident.Metadata.Severity =
           Humanize.Domain_Details.Success_Severity
         and then Scanned_Incident.Consumed = 15,
         "scan incident metadata");

      AUnit.Assertions.Assert
        (Service_Status_Label (" ", Operational_Service).Status =
         Invalid_Argument,
         "empty service names are invalid");
      AUnit.Assertions.Assert
        (Support.Text (Service_Status_Label (" ", Operational_Service)) =
         "invalid service name",
         "invalid service text");
      AUnit.Assertions.Assert
        (Latency_Label ("").Status = Invalid_Argument,
         "empty latency is invalid");
      AUnit.Assertions.Assert
        (Support.Text (Latency_Label ("")) = "invalid latency",
         "invalid latency text");
   end Test_Operational_Dashboard_Labels;

   procedure Test_Bounded (T : in out AUnit.Test_Cases.Test_Case'Class) is
      pragma Unreferenced (T);
      Buffer : String (1 .. 18);
      Tiny   : String (1 .. 8);
      Offset : String (2 .. 12);
      Written : Natural;
      Code : Status_Code;
   begin
      HTTP_Status_Label_Into (404, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 18 and then Buffer = "HTTP 404 not found",
         "http bounded exact");

      Errno_Label_Into (13, Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 8 and then Tiny = "EACCES p",
         "errno bounded overflow");

      Signal_Label_Into (15, Offset, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Options and then Written = 0,
         "signal bounded rejects non-1-based buffers");
   end Test_Bounded;

   procedure Test_Operational_Bounded
     (T : in out AUnit.Test_Cases.Test_Case'Class)
   is
      pragma Unreferenced (T);
      Buffer : String (1 .. 19);
      Tiny   : String (1 .. 7);
      Written : Natural;
      Code : Status_Code;
   begin
      Service_Status_Label_Into
        ("API", Operational_Service, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Ok and then Written = 15 and then
         Buffer (1 .. Written) = "API operational",
         "service bounded exact");

      Maintenance_Window_Label_Into
        ("Sunday 02:00-03:00", Tiny, Written, Code);
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 7 and then
         Tiny = "mainten",
         "maintenance bounded overflow");

      Health_Label_Into ("", Healthy, Buffer, Written, Code);
      AUnit.Assertions.Assert
        (Code = Invalid_Argument and then Written = 0,
         "health bounded invalid");

      Health_Label_Into
        ("database", Critical, Buffer, Written, Code,
         (Mode             => System_Status_Detailed,
          Include_Surface  => True,
          Include_Severity => True,
          Include_Tone     => False));
      AUnit.Assertions.Assert
        (Code = Buffer_Overflow and then Written = 19 and then
         Buffer = "[system-status dang",
         "health option bounded overflow");
   end Test_Operational_Bounded;

   overriding function Name (T : Test_Case) return AUnit.Message_String is
      pragma Unreferenced (T);
   begin
      return AUnit.Format ("Humanize system status tests");
   end Name;

   overriding procedure Register_Tests (T : in out Test_Case) is
      use AUnit.Test_Cases.Registration;
   begin
      Register_Routine (T, Test_HTTP_Status'Access, "HTTP status labels");
      Register_Routine
        (T, Test_Errno_Exit_And_Signal'Access, "errno exit and signal labels");
      Register_Routine (T, Test_SQLSTATE'Access, "SQLSTATE labels");
      Register_Routine
        (T, Test_Operational_State_Labels'Access, "operational state labels");
      Register_Routine
        (T, Test_Operational_Dashboard_Labels'Access,
         "operational dashboard labels");
      Register_Routine (T, Test_Bounded'Access, "bounded system status labels");
      Register_Routine
        (T, Test_Operational_Bounded'Access, "bounded operational labels");
   end Register_Tests;

end Humanize.Tests.System_Status;
