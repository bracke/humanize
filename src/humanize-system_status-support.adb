with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;

package body Humanize.System_Status.Support is
   use type Humanize.Status.Status_Code;

   function Image (Value : Integer) return String
      renames Humanize.Bounded_Text.Signed_Image;

   function Ok_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Ok_Text;

   function Result_Text
     (Result : Humanize.Status.Text_Result)
      return String
      renames Humanize.Bounded_Text.Result_Text;

   function Invalid_Text (Text : String) return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Invalid_Text;

   function Clean (Text : String) return String
      renames Humanize.Bounded_Text.Clean;

   function Count_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Text;
   function Count_Or_No_Text
     (Count    : Natural;
      Singular : String;
      Plural   : String)
      return String
      renames Humanize.Bounded_Text.Count_Or_No_Text;

   procedure Copy_Result
     (Result  : Humanize.Status.Text_Result;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.Bounded_Text.Copy_Text;

   function Domain_Options
     (Options : System_Status_Label_Options)
      return Humanize.Domain_Details.Domain_Label_Options
   is
   begin
      return Humanize.Domain_Details.Make_Label_Options
        ((case Options.Mode is
              when System_Status_Detailed =>
                 Humanize.Domain_Details.Detailed_Output,
              when System_Status_Compact =>
                 Humanize.Domain_Details.Compact_Output,
              when System_Status_Accessible =>
                 Humanize.Domain_Details.Accessible_Output,
              when System_Status_Log =>
                 Humanize.Domain_Details.Log_Output),
         Options.Include_Surface,
         Options.Include_Severity,
         Options.Include_Tone);
   end Domain_Options;

   function Nonempty
     (Text, Message : String)
      return Humanize.Status.Text_Result
      renames Humanize.Bounded_Text.Nonempty_Text;

   function HTTP_Status_Class_Of
     (Code : HTTP_Status_Code)
      return HTTP_Status_Class
   is
   begin
      case Code / 100 is
         when 1 => return Informational_Status;
         when 2 => return Successful_Status;
         when 3 => return Redirection_Status;
         when 4 => return Client_Error_Status;
         when others => return Server_Error_Status;
      end case;
   end HTTP_Status_Class_Of;

   function HTTP_Status_Class_Label
     (Class : HTTP_Status_Class)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text
        (case Class is
            when Informational_Status => "informational",
            when Successful_Status    => "successful",
            when Redirection_Status   => "redirection",
            when Client_Error_Status  => "client error",
            when Server_Error_Status  => "server error");
   end HTTP_Status_Class_Label;

   function HTTP_Reason_Text (Code : HTTP_Status_Code) return String
      is separate;

   function HTTP_Status_Reason
     (Code : HTTP_Status_Code)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (HTTP_Reason_Text (Code));
   end HTTP_Status_Reason;

   function HTTP_Status_Label
     (Code         : HTTP_Status_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Reason : constant String := HTTP_Reason_Text (Code);
   begin
      if Include_Code then
         return Ok_Text ("HTTP " & Image (Code) & " " & Reason);
      else
         return Ok_Text (Reason);
      end if;
   end HTTP_Status_Label;

   procedure HTTP_Status_Label_Into
     (Code         : HTTP_Status_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        HTTP_Status_Label (Code, Include_Code);
   begin
      Copy_Result (Result, Target, Written, Status);
   end HTTP_Status_Label_Into;

   procedure Errno_Info
     (Code     : Errno_Code;
      Mnemonic : out Unbounded_String;
      Reason   : out Unbounded_String)
      is separate;

   function Errno_Label
     (Code         : Errno_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Mnemonic : Unbounded_String;
      Reason   : Unbounded_String;
   begin
      Errno_Info (Code, Mnemonic, Reason);
      if Include_Code then
         return Ok_Text (To_String (Mnemonic) & " " & To_String (Reason));
      else
         return Ok_Text (To_String (Reason));
      end if;
   end Errno_Label;

   procedure Errno_Label_Into
     (Code         : Errno_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        Errno_Label (Code, Include_Code);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Errno_Label_Into;

   procedure Signal_Info
     (Number   : Signal_Number;
      Mnemonic : out Unbounded_String;
      Reason   : out Unbounded_String)
      is separate;

   function Signal_Label
     (Number         : Signal_Number;
      Include_Number : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Mnemonic : Unbounded_String;
      Reason   : Unbounded_String;
   begin
      Signal_Info (Number, Mnemonic, Reason);
      if Include_Number then
         return Ok_Text
           ("signal " & Image (Number) & " "
            & To_String (Mnemonic) & " " & To_String (Reason));
      else
         return Ok_Text (To_String (Mnemonic) & " " & To_String (Reason));
      end if;
   end Signal_Label;

   procedure Signal_Label_Into
     (Number         : Signal_Number;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Include_Number : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        Signal_Label (Number, Include_Number);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Signal_Label_Into;

   function Process_Exit_Label
     (Code : Process_Exit_Code)
      return Humanize.Status.Text_Result
   is
   begin
      case Code is
         when 0 =>
            return Ok_Text ("exit 0 success");
         when 1 =>
            return Ok_Text ("exit 1 failure");
         when 2 =>
            return Ok_Text ("exit 2 usage error");
         when 126 =>
            return Ok_Text ("exit 126 command not executable");
         when 127 =>
            return Ok_Text ("exit 127 command not found");
         when 128 =>
            return Ok_Text ("exit 128 invalid exit argument");
         when 129 .. 192 =>
            declare
               Signal : constant Signal_Number := Signal_Number (Code - 128);
               Label  : constant Humanize.Status.Text_Result :=
                 Signal_Label (Signal, Include_Number => False);
            begin
               return Ok_Text
                 ("exit " & Image (Code) & " terminated by "
                  & Result_Text (Label));
            end;
         when others =>
            return Ok_Text ("exit " & Image (Code) & " failure");
      end case;
   end Process_Exit_Label;

   procedure Process_Exit_Label_Into
     (Code    : Process_Exit_Code;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Process_Exit_Label (Code);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Process_Exit_Label_Into;

   function SQLSTATE_Reason (Class : SQLSTATE_Class) return String
      is separate;

   function SQLSTATE_Class_Label
     (Class        : SQLSTATE_Class;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Code : constant String := String (Class);
      Reason : constant String := SQLSTATE_Reason (Class);
   begin
      if Include_Code then
         return Ok_Text ("SQLSTATE " & Code & " " & Reason);
      else
         return Ok_Text (Reason);
      end if;
   end SQLSTATE_Class_Label;

   procedure SQLSTATE_Class_Label_Into
     (Class        : SQLSTATE_Class;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
   is
      Result : constant Humanize.Status.Text_Result :=
        SQLSTATE_Class_Label (Class, Include_Code);
   begin
      Copy_Result (Result, Target, Written, Status);
   end SQLSTATE_Class_Label_Into;

   function Service_Text (State : Service_State) return String is
   begin
      case State is
         when Operational_Service     => return "operational";
         when Degraded_Service        => return "degraded performance";
         when Partial_Outage_Service  => return "partial outage";
         when Major_Outage_Service    => return "major outage";
         when Maintenance_Service     => return "under maintenance";
         when Unknown_Service         => return "unknown service status";
      end case;
   end Service_Text;

   function Health_Text (State : Health_State) return String is
   begin
      case State is
         when Healthy        => return "healthy";
         when Warning        => return "warning";
         when Critical       => return "critical";
         when Unavailable    => return "unavailable";
         when Unknown_Health => return "unknown health";
      end case;
   end Health_Text;

   function Readiness_Text (State : Readiness_State) return String is
   begin
      case State is
         when Ready             => return "ready";
         when Not_Ready         => return "not ready";
         when Starting          => return "starting";
         when Draining          => return "draining";
         when Stopped           => return "stopped";
         when Unknown_Readiness => return "unknown readiness";
      end case;
   end Readiness_Text;

   function Component_Text (State : Component_State) return String is
   begin
      case State is
         when Online_Component     => return "online";
         when Offline_Component    => return "offline";
         when Starting_Component   => return "starting";
         when Stopping_Component   => return "stopping";
         when Restarting_Component => return "restarting";
         when Unknown_Component    => return "unknown component status";
      end case;
   end Component_Text;

   function Check_Text (State : Check_State) return String is
   begin
      case State is
         when Passing_Check   => return "passing";
         when Failing_Check   => return "failing";
         when Warning_Check   => return "warning";
         when Skipped_Check   => return "skipped";
         when Timed_Out_Check => return "timed out";
         when Unknown_Check   => return "unknown check status";
      end case;
   end Check_Text;

   function Incident_Text (State : Incident_State) return String is
   begin
      case State is
         when Investigating_Incident =>
            return "investigating";
         when Identified_Incident =>
            return "identified";
         when Monitoring_Incident =>
            return "monitoring";
         when Resolved_Incident =>
            return "resolved";
         when Scheduled_Maintenance_Incident =>
            return "scheduled maintenance";
      end case;
   end Incident_Text;

   function Service_State_Metadata
     (State : Service_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.System_Status_Surface, Service_Text (State));
   end Service_State_Metadata;

   function Health_State_Metadata
     (State : Health_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.System_Status_Surface, Health_Text (State));
   end Health_State_Metadata;

   function Readiness_State_Metadata
     (State : Readiness_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.System_Status_Surface, Readiness_Text (State));
   end Readiness_State_Metadata;

   function Component_State_Metadata
     (State : Component_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.System_Status_Surface, Component_Text (State));
   end Component_State_Metadata;

   function Check_State_Metadata
     (State : Check_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.System_Status_Surface, Check_Text (State));
   end Check_State_Metadata;

   function Incident_State_Metadata
     (State : Incident_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
   is
   begin
      return Humanize.Domain_Details.State_Metadata
        (Humanize.Domain_Details.System_Status_Surface, Incident_Text (State));
   end Incident_State_Metadata;

   function Service_State_Label
     (State : Service_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Service_Text (State));
   end Service_State_Label;

   function Health_State_Label
     (State : Health_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Health_Text (State));
   end Health_State_Label;

   function Readiness_State_Label
     (State : Readiness_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Readiness_Text (State));
   end Readiness_State_Label;

   function Component_State_Label
     (State : Component_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Component_Text (State));
   end Component_State_Label;

   function Check_State_Label
     (State : Check_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Check_Text (State));
   end Check_State_Label;

   function Incident_State_Label
     (State : Incident_State)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Incident_Text (State));
   end Incident_State_Label;

   function Service_Status_Label
     (Name  : String;
      State : Service_State)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid service name");
   begin
      if Clean_Name.Status /= Humanize.Status.Ok then
         return Clean_Name;
      else
         return Ok_Text (Result_Text (Clean_Name) & " " & Service_Text (State));
      end if;
   end Service_Status_Label;

   function Health_Label
     (Name  : String;
      State : Health_State)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid health name");
   begin
      if Clean_Name.Status /= Humanize.Status.Ok then
         return Clean_Name;
      else
         return Ok_Text (Result_Text (Clean_Name) & " " & Health_Text (State));
      end if;
   end Health_Label;

   function Readiness_Label
     (Name  : String;
      State : Readiness_State)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid readiness name");
   begin
      if Clean_Name.Status /= Humanize.Status.Ok then
         return Clean_Name;
      else
         return Ok_Text
           (Result_Text (Clean_Name) & " " & Readiness_Text (State));
      end if;
   end Readiness_Label;

   function Component_Status_Label
     (Name  : String;
      State : Component_State)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid component name");
   begin
      if Clean_Name.Status /= Humanize.Status.Ok then
         return Clean_Name;
      else
         return Ok_Text
           (Result_Text (Clean_Name) & " " & Component_Text (State));
      end if;
   end Component_Status_Label;

   function Check_Label
     (Name  : String;
      State : Check_State)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid check name");
   begin
      if Clean_Name.Status /= Humanize.Status.Ok then
         return Clean_Name;
      else
         return Ok_Text
           (Result_Text (Clean_Name) & " check " & Check_Text (State));
      end if;
   end Check_Label;

   function Incident_Label
     (Name  : String;
      State : Incident_State)
      return Humanize.Status.Text_Result
   is
      Clean_Name : constant Humanize.Status.Text_Result :=
        Nonempty (Name, "invalid incident name");
   begin
      if Clean_Name.Status /= Humanize.Status.Ok then
         return Clean_Name;
      else
         return Ok_Text
           (Result_Text (Clean_Name) & " " & Incident_Text (State));
      end if;
   end Incident_Label;

   function Service_Status_Label
     (Name    : String;
      State   : Service_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Service_Status_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Service_State_Metadata (State), Domain_Options (Options));
   end Service_Status_Label;

   function Health_Label
     (Name    : String;
      State   : Health_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Health_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Health_State_Metadata (State), Domain_Options (Options));
   end Health_Label;

   function Readiness_Label
     (Name    : String;
      State   : Readiness_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Readiness_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Readiness_State_Metadata (State), Domain_Options (Options));
   end Readiness_Label;

   function Component_Status_Label
     (Name    : String;
      State   : Component_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result :=
        Component_Status_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Component_State_Metadata (State), Domain_Options (Options));
   end Component_Status_Label;

   function Check_Label
     (Name    : String;
      State   : Check_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Check_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Check_State_Metadata (State), Domain_Options (Options));
   end Check_Label;

   function Incident_Label
     (Name    : String;
      State   : Incident_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
   is
      Base : constant Humanize.Status.Text_Result := Incident_Label (Name, State);
   begin
      return Humanize.Domain_Details.Domain_Label
        (Base, Incident_State_Metadata (State), Domain_Options (Options));
   end Incident_Label;

   function Parse_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Service_Text (State));
      Result.Metadata := Service_State_Metadata (State);
      return Result;
   end Parse_Service_Status_Label;

   function Scan_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Service_Text (State));
      Result.Metadata := Service_State_Metadata (State);
      return Result;
   end Scan_Service_Status_Label;

   function Parse_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Health_Text (State));
      Result.Metadata := Health_State_Metadata (State);
      return Result;
   end Parse_Health_Label;

   function Scan_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Health_Text (State));
      Result.Metadata := Health_State_Metadata (State);
      return Result;
   end Scan_Health_Label;

   function Parse_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Readiness_Text (State));
      Result.Metadata := Readiness_State_Metadata (State);
      return Result;
   end Parse_Readiness_Label;

   function Scan_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Readiness_Text (State));
      Result.Metadata := Readiness_State_Metadata (State);
      return Result;
   end Scan_Readiness_Label;

   function Parse_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Component_Text (State));
      Result.Metadata := Component_State_Metadata (State);
      return Result;
   end Parse_Component_Status_Label;

   function Scan_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Component_Text (State));
      Result.Metadata := Component_State_Metadata (State);
      return Result;
   end Scan_Component_Status_Label;

   function Parse_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         "check " & Check_Text (State));
      Result.Metadata := Check_State_Metadata (State);
      return Result;
   end Parse_Check_Label;

   function Scan_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         "check " & Check_Text (State));
      Result.Metadata := Check_State_Metadata (State);
      return Result;
   end Scan_Check_Label;

   function Parse_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Parse_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Incident_Text (State));
      Result.Metadata := Incident_State_Metadata (State);
      return Result;
   end Parse_Incident_Label;

   function Scan_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result
   is
      Result : System_Status_Label_Parse_Result;
   begin
      Result := Humanize.Domain_Details.Scan_Named_Label
        (Text, Humanize.Domain_Details.System_Status_Surface,
         Incident_Text (State));
      Result.Metadata := Incident_State_Metadata (State);
      return Result;
   end Scan_Incident_Label;

   function Component_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "component", "components"));
   end Component_Count_Label;

   function Check_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "check", "checks"));
   end Check_Count_Label;

   function Incident_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
   is
   begin
      return Ok_Text (Count_Or_No_Text (Count, "incident", "incidents"));
   end Incident_Count_Label;

   function Uptime_Label
     (Percent_Text : String)
      return Humanize.Status.Text_Result
   is
      Value : constant Humanize.Status.Text_Result :=
        Nonempty (Percent_Text, "invalid uptime");
   begin
      if Value.Status /= Humanize.Status.Ok then
         return Value;
      else
         return Ok_Text ("uptime " & Result_Text (Value));
      end if;
   end Uptime_Label;

   function Latency_Label
     (Latency_Text : String)
      return Humanize.Status.Text_Result
   is
      Value : constant Humanize.Status.Text_Result :=
        Nonempty (Latency_Text, "invalid latency");
   begin
      if Value.Status /= Humanize.Status.Ok then
         return Value;
      else
         return Ok_Text ("latency " & Result_Text (Value));
      end if;
   end Latency_Label;

   function Maintenance_Window_Label
     (Window_Text : String)
      return Humanize.Status.Text_Result
   is
      Value : constant Humanize.Status.Text_Result :=
        Nonempty (Window_Text, "invalid maintenance window");
   begin
      if Value.Status /= Humanize.Status.Ok then
         return Value;
      else
         return Ok_Text ("maintenance window " & Result_Text (Value));
      end if;
   end Maintenance_Window_Label;

   function Last_Checked_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result
   is
      Value : constant Humanize.Status.Text_Result :=
        Nonempty (Time_Text, "invalid checked time");
   begin
      if Value.Status /= Humanize.Status.Ok then
         return Value;
      else
         return Ok_Text ("last checked " & Result_Text (Value));
      end if;
   end Last_Checked_Label;

   procedure Service_State_Label_Into
     (State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Service_State_Label (State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Service_State_Label_Into;

   procedure Health_State_Label_Into
     (State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Health_State_Label (State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Health_State_Label_Into;

   procedure Readiness_State_Label_Into
     (State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Readiness_State_Label (State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Readiness_State_Label_Into;

   procedure Component_State_Label_Into
     (State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Component_State_Label (State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Component_State_Label_Into;

   procedure Check_State_Label_Into
     (State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Check_State_Label (State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Check_State_Label_Into;

   procedure Incident_State_Label_Into
     (State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Incident_State_Label (State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Incident_State_Label_Into;

   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Service_Status_Label (Name, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Service_Status_Label_Into;

   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Health_Label (Name, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Health_Label_Into;

   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Readiness_Label (Name, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Readiness_Label_Into;

   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Component_Status_Label (Name, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Component_Status_Label_Into;

   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Check_Label (Name, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Check_Label_Into;

   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Incident_Label (Name, State);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Incident_Label_Into;

   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
   is
   begin
      Copy_Result
        (Service_Status_Label (Name, State, Options), Target, Written, Status);
   end Service_Status_Label_Into;

   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
   is
   begin
      Copy_Result
        (Health_Label (Name, State, Options), Target, Written, Status);
   end Health_Label_Into;

   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
   is
   begin
      Copy_Result
        (Readiness_Label (Name, State, Options), Target, Written, Status);
   end Readiness_Label_Into;

   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
   is
   begin
      Copy_Result
        (Component_Status_Label (Name, State, Options), Target, Written,
         Status);
   end Component_Status_Label_Into;

   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
   is
   begin
      Copy_Result
        (Check_Label (Name, State, Options), Target, Written, Status);
   end Check_Label_Into;

   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
   is
   begin
      Copy_Result
        (Incident_Label (Name, State, Options), Target, Written, Status);
   end Incident_Label_Into;

   procedure Component_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Component_Count_Label (Count);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Component_Count_Label_Into;

   procedure Check_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Check_Count_Label (Count);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Check_Count_Label_Into;

   procedure Incident_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Incident_Count_Label (Count);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Incident_Count_Label_Into;

   procedure Uptime_Label_Into
     (Percent_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Uptime_Label (Percent_Text);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Uptime_Label_Into;

   procedure Latency_Label_Into
     (Latency_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result := Latency_Label (Latency_Text);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Latency_Label_Into;

   procedure Maintenance_Window_Label_Into
     (Window_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Maintenance_Window_Label (Window_Text);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Maintenance_Window_Label_Into;

   procedure Last_Checked_Label_Into
     (Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
      Result : constant Humanize.Status.Text_Result :=
        Last_Checked_Label (Time_Text);
   begin
      Copy_Result (Result, Target, Written, Status);
   end Last_Checked_Label_Into;

end Humanize.System_Status.Support;
