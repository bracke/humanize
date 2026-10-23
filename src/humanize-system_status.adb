with Humanize.System_Status.Support;

package body Humanize.System_Status is

   function HTTP_Status_Class_Of
     (Code : HTTP_Status_Code)
      return HTTP_Status_Class
      renames Humanize.System_Status.Support.HTTP_Status_Class_Of;

   function HTTP_Status_Class_Label
     (Class : HTTP_Status_Class)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.HTTP_Status_Class_Label;

   function HTTP_Status_Reason
     (Code : HTTP_Status_Code)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.HTTP_Status_Reason;

   function HTTP_Status_Label
     (Code         : HTTP_Status_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.HTTP_Status_Label;

   procedure HTTP_Status_Label_Into
     (Code         : HTTP_Status_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
      renames Humanize.System_Status.Support.HTTP_Status_Label_Into;

   function Errno_Label
     (Code         : Errno_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Errno_Label;

   procedure Errno_Label_Into
     (Code         : Errno_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
      renames Humanize.System_Status.Support.Errno_Label_Into;

   function Process_Exit_Label
     (Code : Process_Exit_Code)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Process_Exit_Label;

   procedure Process_Exit_Label_Into
     (Code    : Process_Exit_Code;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Process_Exit_Label_Into;

   function Signal_Label
     (Number         : Signal_Number;
      Include_Number : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Signal_Label;

   procedure Signal_Label_Into
     (Number         : Signal_Number;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Include_Number : Boolean := True)
      renames Humanize.System_Status.Support.Signal_Label_Into;

   function SQLSTATE_Class_Label
     (Class        : SQLSTATE_Class;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.SQLSTATE_Class_Label;

   procedure SQLSTATE_Class_Label_Into
     (Class        : SQLSTATE_Class;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
      renames Humanize.System_Status.Support.SQLSTATE_Class_Label_Into;

   function Service_State_Label
     (State : Service_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Service_State_Label;

   function Health_State_Label
     (State : Health_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Health_State_Label;

   function Readiness_State_Label
     (State : Readiness_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Readiness_State_Label;

   function Component_State_Label
     (State : Component_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Component_State_Label;

   function Check_State_Label
     (State : Check_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Check_State_Label;

   function Incident_State_Label
     (State : Incident_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Incident_State_Label;

   function Service_Status_Label
     (Name  : String;
      State : Service_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Service_Status_Label;

   function Health_Label
     (Name  : String;
      State : Health_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Health_Label;

   function Readiness_Label
     (Name  : String;
      State : Readiness_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Readiness_Label;

   function Component_Status_Label
     (Name  : String;
      State : Component_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Component_Status_Label;

   function Check_Label
     (Name  : String;
      State : Check_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Check_Label;

   function Incident_Label
     (Name  : String;
      State : Incident_State)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Incident_Label;

   function Service_Status_Label
     (Name    : String;
      State   : Service_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Service_Status_Label;

   function Health_Label
     (Name    : String;
      State   : Health_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Health_Label;

   function Readiness_Label
     (Name    : String;
      State   : Readiness_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Readiness_Label;

   function Component_Status_Label
     (Name    : String;
      State   : Component_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Component_Status_Label;

   function Check_Label
     (Name    : String;
      State   : Check_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Check_Label;

   function Incident_Label
     (Name    : String;
      State   : Incident_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Incident_Label;

   function Service_State_Metadata
     (State : Service_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
      renames Humanize.System_Status.Support.Service_State_Metadata;

   function Health_State_Metadata
     (State : Health_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
      renames Humanize.System_Status.Support.Health_State_Metadata;

   function Readiness_State_Metadata
     (State : Readiness_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
      renames Humanize.System_Status.Support.Readiness_State_Metadata;

   function Component_State_Metadata
     (State : Component_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
      renames Humanize.System_Status.Support.Component_State_Metadata;

   function Check_State_Metadata
     (State : Check_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
      renames Humanize.System_Status.Support.Check_State_Metadata;

   function Incident_State_Metadata
     (State : Incident_State)
      return Humanize.Domain_Details.Domain_Label_Metadata
      renames Humanize.System_Status.Support.Incident_State_Metadata;

   function Parse_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Parse_Service_Status_Label;

   function Scan_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Scan_Service_Status_Label;

   function Parse_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Parse_Health_Label;

   function Scan_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Scan_Health_Label;

   function Parse_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Parse_Readiness_Label;

   function Scan_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Scan_Readiness_Label;

   function Parse_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Parse_Component_Status_Label;

   function Scan_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Scan_Component_Status_Label;

   function Parse_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Parse_Check_Label;

   function Scan_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Scan_Check_Label;

   function Parse_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Parse_Incident_Label;

   function Scan_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result
      renames Humanize.System_Status.Support.Scan_Incident_Label;

   function Component_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Component_Count_Label;

   function Check_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Check_Count_Label;

   function Incident_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Incident_Count_Label;

   function Uptime_Label
     (Percent_Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Uptime_Label;

   function Latency_Label
     (Latency_Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Latency_Label;

   function Maintenance_Window_Label
     (Window_Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Maintenance_Window_Label;

   function Last_Checked_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result
      renames Humanize.System_Status.Support.Last_Checked_Label;

   procedure Service_State_Label_Into
     (State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Service_State_Label_Into;

   procedure Health_State_Label_Into
     (State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Health_State_Label_Into;

   procedure Readiness_State_Label_Into
     (State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Readiness_State_Label_Into;

   procedure Component_State_Label_Into
     (State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Component_State_Label_Into;

   procedure Check_State_Label_Into
     (State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Check_State_Label_Into;

   procedure Incident_State_Label_Into
     (State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Incident_State_Label_Into;

   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Service_Status_Label_Into;

   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Health_Label_Into;

   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Readiness_Label_Into;

   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Component_Status_Label_Into;

   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Check_Label_Into;

   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Incident_Label_Into;

   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
      renames Humanize.System_Status.Support.Service_Status_Label_Into;

   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
      renames Humanize.System_Status.Support.Health_Label_Into;

   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
      renames Humanize.System_Status.Support.Readiness_Label_Into;

   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
      renames Humanize.System_Status.Support.Component_Status_Label_Into;

   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
      renames Humanize.System_Status.Support.Check_Label_Into;

   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options)
      renames Humanize.System_Status.Support.Incident_Label_Into;

   procedure Component_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Component_Count_Label_Into;

   procedure Check_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Check_Count_Label_Into;

   procedure Incident_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Incident_Count_Label_Into;

   procedure Uptime_Label_Into
     (Percent_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Uptime_Label_Into;

   procedure Latency_Label_Into
     (Latency_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Latency_Label_Into;

   procedure Maintenance_Window_Label_Into
     (Window_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Maintenance_Window_Label_Into;

   procedure Last_Checked_Label_Into
     (Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
      renames Humanize.System_Status.Support.Last_Checked_Label_Into;

end Humanize.System_Status;
