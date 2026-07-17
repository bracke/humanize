with Humanize.Domain_Details;
with Humanize.Status;

--  Deterministic labels for protocol, OS, and operational status values.
package Humanize.System_Status is
   type System_Status_Output_Mode is
     (System_Status_Detailed,
      System_Status_Compact,
      System_Status_Accessible,
      System_Status_Log);

   type System_Status_Label_Options is record
      Mode             : System_Status_Output_Mode := System_Status_Detailed;
      Include_Surface  : Boolean := False;
      Include_Severity : Boolean := False;
      Include_Tone     : Boolean := False;
   end record;

   Default_System_Status_Label_Options :
     constant System_Status_Label_Options :=
       (Mode             => System_Status_Detailed,
        Include_Surface  => False,
        Include_Severity => False,
        Include_Tone     => False);

   subtype System_Status_Label_Parse_Result is
     Humanize.Domain_Details.Named_Label_Parse_Result;

   subtype HTTP_Status_Code is Natural range 100 .. 599;

   type HTTP_Status_Class is
     (Informational_Status,
      Successful_Status,
      Redirection_Status,
      Client_Error_Status,
      Server_Error_Status);
   --  HTTP status-code families.

   subtype Errno_Code is Integer range 0 .. 9999;

   subtype Process_Exit_Code is Natural range 0 .. 255;

   subtype Signal_Number is Natural range 1 .. 64;

   type SQLSTATE_Class is new String (1 .. 2);
   --  Two-character SQLSTATE class code.

   type Service_State is
     (Operational_Service,
      Degraded_Service,
      Partial_Outage_Service,
      Major_Outage_Service,
      Maintenance_Service,
      Unknown_Service);
   --  Caller-supplied service availability state.

   type Health_State is
     (Healthy,
      Warning,
      Critical,
      Unavailable,
      Unknown_Health);
   --  Caller-supplied health-check aggregate state.

   type Readiness_State is
     (Ready,
      Not_Ready,
      Starting,
      Draining,
      Stopped,
      Unknown_Readiness);
   --  Caller-supplied readiness/lifecycle state.

   type Component_State is
     (Online_Component,
      Offline_Component,
      Starting_Component,
      Stopping_Component,
      Restarting_Component,
      Unknown_Component);
   --  Caller-supplied component runtime state.

   type Check_State is
     (Passing_Check,
      Failing_Check,
      Warning_Check,
      Skipped_Check,
      Timed_Out_Check,
      Unknown_Check);
   --  Caller-supplied status-check state.

   type Incident_State is
     (Investigating_Incident,
      Identified_Incident,
      Monitoring_Incident,
      Resolved_Incident,
      Scheduled_Maintenance_Incident);
   --  Caller-supplied incident or maintenance lifecycle state.

   function HTTP_Status_Class_Of
     (Code : HTTP_Status_Code)
      return HTTP_Status_Class;
   --  @param Code HTTP status code.
   --  @return Status-code family for Code.

   function HTTP_Status_Class_Label
     (Class : HTTP_Status_Class)
      return Humanize.Status.Text_Result;
   --  @param Class HTTP status-code family.
   --  @return Stable human-readable class label.

   function HTTP_Status_Reason
     (Code : HTTP_Status_Code)
      return Humanize.Status.Text_Result;
   --  @param Code HTTP status code.
   --  @return Standard reason phrase, or "unknown status" for unassigned codes.

   function HTTP_Status_Label
     (Code         : HTTP_Status_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Code HTTP status code.
   --  @param Include_Code Include the numeric status code in the label.
   --  @return Human-readable HTTP status label.

   procedure HTTP_Status_Label_Into
     (Code         : HTTP_Status_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   --  @param Code HTTP status code.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Include_Code Include the numeric status code in the label.

   function Errno_Label
     (Code         : Errno_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Code POSIX-style errno value.
   --  @param Include_Code Include the errno mnemonic or number in the label.
   --  @return Human-readable errno label.

   procedure Errno_Label_Into
     (Code         : Errno_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   --  @param Code POSIX-style errno value.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Include_Code Include the errno mnemonic or number in the label.

   function Process_Exit_Label
     (Code : Process_Exit_Code)
      return Humanize.Status.Text_Result;
   --  @param Code Process exit status in the portable shell range.
   --  @return Human-readable process exit label.

   procedure Process_Exit_Label_Into
     (Code    : Process_Exit_Code;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Code Process exit status in the portable shell range.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   function Signal_Label
     (Number         : Signal_Number;
      Include_Number : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Number POSIX-style signal number.
   --  @param Include_Number Include the numeric signal number in the label.
   --  @return Human-readable signal label.

   procedure Signal_Label_Into
     (Number         : Signal_Number;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Include_Number : Boolean := True);
   --  @param Number POSIX-style signal number.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Include_Number Include the numeric signal number in the label.

   function SQLSTATE_Class_Label
     (Class        : SQLSTATE_Class;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Class Two-character SQLSTATE class code.
   --  @param Include_Code Include the class code in the label.
   --  @return Human-readable SQLSTATE class label.

   procedure SQLSTATE_Class_Label_Into
     (Class        : SQLSTATE_Class;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   --  @param Class Two-character SQLSTATE class code.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Include_Code Include the class code in the label.

   function Service_State_Label
     (State : Service_State)
      return Humanize.Status.Text_Result;
   --  @param State Service availability state.
   --  @return Human-readable service-state label.

   function Health_State_Label
     (State : Health_State)
      return Humanize.Status.Text_Result;
   --  @param State Health-check aggregate state.
   --  @return Human-readable health-state label.

   function Readiness_State_Label
     (State : Readiness_State)
      return Humanize.Status.Text_Result;
   --  @param State Readiness/lifecycle state.
   --  @return Human-readable readiness-state label.

   function Component_State_Label
     (State : Component_State)
      return Humanize.Status.Text_Result;
   --  @param State Component runtime state.
   --  @return Human-readable component-state label.

   function Check_State_Label
     (State : Check_State)
      return Humanize.Status.Text_Result;
   --  @param State Status-check state.
   --  @return Human-readable check-state label.

   function Incident_State_Label
     (State : Incident_State)
      return Humanize.Status.Text_Result;
   --  @param State Incident lifecycle state.
   --  @return Human-readable incident-state label.

   function Service_Status_Label
     (Name  : String;
      State : Service_State)
      return Humanize.Status.Text_Result;
   --  @param Name Service display name.
   --  @param State Service availability state.
   --  @return Human-readable service status label.

   function Health_Label
     (Name  : String;
      State : Health_State)
      return Humanize.Status.Text_Result;
   --  @param Name Service, subsystem, or check group display name.
   --  @param State Health-check aggregate state.
   --  @return Human-readable health label.

   function Readiness_Label
     (Name  : String;
      State : Readiness_State)
      return Humanize.Status.Text_Result;
   --  @param Name Service, instance, or worker display name.
   --  @param State Readiness/lifecycle state.
   --  @return Human-readable readiness label.

   function Component_Status_Label
     (Name  : String;
      State : Component_State)
      return Humanize.Status.Text_Result;
   --  @param Name Component display name.
   --  @param State Component runtime state.
   --  @return Human-readable component status label.

   function Check_Label
     (Name  : String;
      State : Check_State)
      return Humanize.Status.Text_Result;
   --  @param Name Status-check display name.
   --  @param State Status-check state.
   --  @return Human-readable check label.

   function Incident_Label
     (Name  : String;
      State : Incident_State)
      return Humanize.Status.Text_Result;
   --  @param Name Incident or maintenance display name.
   --  @param State Incident lifecycle state.
   --  @return Human-readable incident label.

   function Service_Status_Label
     (Name    : String;
      State   : Service_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Service display name.
   --  @param State Service availability state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable service status label with optional metadata.

   function Health_Label
     (Name    : String;
      State   : Health_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Service, subsystem, or check group display name.
   --  @param State Health-check aggregate state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable health label with optional metadata.

   function Readiness_Label
     (Name    : String;
      State   : Readiness_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Service, instance, or worker display name.
   --  @param State Readiness/lifecycle state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable readiness label with optional metadata.

   function Component_Status_Label
     (Name    : String;
      State   : Component_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Component display name.
   --  @param State Component runtime state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable component status label with optional metadata.

   function Check_Label
     (Name    : String;
      State   : Check_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Status-check display name.
   --  @param State Status-check state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable check label with optional metadata.

   function Incident_Label
     (Name    : String;
      State   : Incident_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   --  @param Name Incident or maintenance display name.
   --  @param State Incident lifecycle state.
   --  @param Options Output mode and metadata inclusion policy.
   --  @return Human-readable incident label with optional metadata.

   function Service_State_Metadata
     (State : Service_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Service availability state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Health_State_Metadata
     (State : Health_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Health-check aggregate state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Readiness_State_Metadata
     (State : Readiness_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Readiness/lifecycle state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Component_State_Metadata
     (State : Component_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Component runtime state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Check_State_Metadata
     (State : Check_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Status-check state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Incident_State_Metadata
     (State : Incident_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   --  @param State Incident lifecycle state.
   --  @return Severity, tone, and final/actionable metadata for State.

   function Parse_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Label in rendered service-status form.
   --  @param State Expected service state.
   --  @return Parsed service name span, state span, metadata, and consumed length.

   function Scan_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Text beginning with a service-status label.
   --  @param State Expected service state.
   --  @return Parsed service-status prefix and consumed length.

   function Parse_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Label in rendered health form.
   --  @param State Expected health state.
   --  @return Parsed health name span, state span, metadata, and consumed length.

   function Scan_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Text beginning with a health label.
   --  @param State Expected health state.
   --  @return Parsed health prefix and consumed length.

   function Parse_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Label in rendered readiness form.
   --  @param State Expected readiness state.
   --  @return Parsed readiness name span, state span, metadata, and consumed length.

   function Scan_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Text beginning with a readiness label.
   --  @param State Expected readiness state.
   --  @return Parsed readiness prefix and consumed length.

   function Parse_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Label in rendered component-status form.
   --  @param State Expected component state.
   --  @return Parsed component name span, state span, metadata, and consumed length.

   function Scan_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Text beginning with a component-status label.
   --  @param State Expected component state.
   --  @return Parsed component-status prefix and consumed length.

   function Parse_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Label in rendered check form.
   --  @param State Expected check state.
   --  @return Parsed check name span, state span, metadata, and consumed length.

   function Scan_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Text beginning with a check label.
   --  @param State Expected check state.
   --  @return Parsed check prefix and consumed length.

   function Parse_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Label in rendered incident form.
   --  @param State Expected incident state.
   --  @return Parsed incident name span, state span, metadata, and consumed length.

   function Scan_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result;
   --  @param Text Text beginning with an incident label.
   --  @param State Expected incident state.
   --  @return Parsed incident prefix and consumed length.

   function Component_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Component count.
   --  @return Human-readable component count label.

   function Check_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Status-check count.
   --  @return Human-readable check count label.

   function Incident_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   --  @param Count Incident count.
   --  @return Human-readable incident count label.

   function Uptime_Label
     (Percent_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Percent_Text Caller-supplied uptime percentage label.
   --  @return Human-readable uptime label.

   function Latency_Label
     (Latency_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Latency_Text Caller-supplied latency label.
   --  @return Human-readable latency label.

   function Maintenance_Window_Label
     (Window_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Window_Text Caller-supplied maintenance-window label.
   --  @return Human-readable maintenance-window label.

   function Last_Checked_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Time_Text Caller-supplied last-check time/distance label.
   --  @return Human-readable last-checked label.

   procedure Service_State_Label_Into
     (State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Service availability state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Health_State_Label_Into
     (State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Health-check aggregate state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Readiness_State_Label_Into
     (State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Readiness/lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Component_State_Label_Into
     (State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Component runtime state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_State_Label_Into
     (State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Status-check state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Incident_State_Label_Into
     (State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param State Incident lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Service display name.
   --  @param State Service availability state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Service, subsystem, or check group display name.
   --  @param State Health-check aggregate state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Service, instance, or worker display name.
   --  @param State Readiness/lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Component display name.
   --  @param State Component runtime state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Status-check display name.
   --  @param State Status-check state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Name Incident or maintenance display name.
   --  @param State Incident lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   --  @param Name Service display name.
   --  @param State Service availability state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   --  @param Name Service, subsystem, or check group display name.
   --  @param State Health-check aggregate state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   --  @param Name Service, instance, or worker display name.
   --  @param State Readiness/lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   --  @param Name Component display name.
   --  @param State Component runtime state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   --  @param Name Status-check display name.
   --  @param State Status-check state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   --  @param Name Incident or maintenance display name.
   --  @param State Incident lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Output mode and metadata inclusion policy.

   procedure Component_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Component count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Status-check count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Incident_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Count Incident count.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Uptime_Label_Into
     (Percent_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Percent_Text Caller-supplied uptime percentage label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Latency_Label_Into
     (Latency_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Latency_Text Caller-supplied latency label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Maintenance_Window_Label_Into
     (Window_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Window_Text Caller-supplied maintenance-window label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Last_Checked_Label_Into
     (Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Time_Text Caller-supplied last-check time/distance label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.System_Status;
