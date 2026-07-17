with Humanize.Domain_Details;
with Humanize.Status;

private package Humanize.System_Status.Support is
   function HTTP_Status_Class_Of
     (Code : HTTP_Status_Code)
      return HTTP_Status_Class;
   function HTTP_Status_Class_Label
     (Class : HTTP_Status_Class)
      return Humanize.Status.Text_Result;
   function HTTP_Status_Reason
     (Code : HTTP_Status_Code)
      return Humanize.Status.Text_Result;
   function HTTP_Status_Label
     (Code         : HTTP_Status_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   procedure HTTP_Status_Label_Into
     (Code         : HTTP_Status_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   function Errno_Label
     (Code         : Errno_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   procedure Errno_Label_Into
     (Code         : Errno_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   function Process_Exit_Label
     (Code : Process_Exit_Code)
      return Humanize.Status.Text_Result;
   procedure Process_Exit_Label_Into
     (Code    : Process_Exit_Code;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   function Signal_Label
     (Number         : Signal_Number;
      Include_Number : Boolean := True)
      return Humanize.Status.Text_Result;
   procedure Signal_Label_Into
     (Number         : Signal_Number;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Include_Number : Boolean := True);
   function SQLSTATE_Class_Label
     (Class        : SQLSTATE_Class;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   procedure SQLSTATE_Class_Label_Into
     (Class        : SQLSTATE_Class;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   function Service_State_Label
     (State : Service_State)
      return Humanize.Status.Text_Result;
   function Health_State_Label
     (State : Health_State)
      return Humanize.Status.Text_Result;
   function Readiness_State_Label
     (State : Readiness_State)
      return Humanize.Status.Text_Result;
   function Component_State_Label
     (State : Component_State)
      return Humanize.Status.Text_Result;
   function Check_State_Label
     (State : Check_State)
      return Humanize.Status.Text_Result;
   function Incident_State_Label
     (State : Incident_State)
      return Humanize.Status.Text_Result;
   function Service_Status_Label
     (Name  : String;
      State : Service_State)
      return Humanize.Status.Text_Result;
   function Health_Label
     (Name  : String;
      State : Health_State)
      return Humanize.Status.Text_Result;
   function Readiness_Label
     (Name  : String;
      State : Readiness_State)
      return Humanize.Status.Text_Result;
   function Component_Status_Label
     (Name  : String;
      State : Component_State)
      return Humanize.Status.Text_Result;
   function Check_Label
     (Name  : String;
      State : Check_State)
      return Humanize.Status.Text_Result;
   function Incident_Label
     (Name  : String;
      State : Incident_State)
      return Humanize.Status.Text_Result;
   function Service_Status_Label
     (Name    : String;
      State   : Service_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   function Health_Label
     (Name    : String;
      State   : Health_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   function Readiness_Label
     (Name    : String;
      State   : Readiness_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   function Component_Status_Label
     (Name    : String;
      State   : Component_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   function Check_Label
     (Name    : String;
      State   : Check_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   function Incident_Label
     (Name    : String;
      State   : Incident_State;
      Options : System_Status_Label_Options)
      return Humanize.Status.Text_Result;
   function Service_State_Metadata
     (State : Service_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   function Health_State_Metadata
     (State : Health_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   function Readiness_State_Metadata
     (State : Readiness_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   function Component_State_Metadata
     (State : Component_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   function Check_State_Metadata
     (State : Check_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   function Incident_State_Metadata
     (State : Incident_State)
      return Humanize.Domain_Details.Domain_Label_Metadata;
   function Parse_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result;
   function Scan_Service_Status_Label
     (Text  : String;
      State : Service_State)
      return System_Status_Label_Parse_Result;
   function Parse_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result;
   function Scan_Health_Label
     (Text  : String;
      State : Health_State)
      return System_Status_Label_Parse_Result;
   function Parse_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result;
   function Scan_Readiness_Label
     (Text  : String;
      State : Readiness_State)
      return System_Status_Label_Parse_Result;
   function Parse_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result;
   function Scan_Component_Status_Label
     (Text  : String;
      State : Component_State)
      return System_Status_Label_Parse_Result;
   function Parse_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result;
   function Scan_Check_Label
     (Text  : String;
      State : Check_State)
      return System_Status_Label_Parse_Result;
   function Parse_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result;
   function Scan_Incident_Label
     (Text  : String;
      State : Incident_State)
      return System_Status_Label_Parse_Result;
   function Component_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   function Check_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   function Incident_Count_Label
     (Count : Natural)
      return Humanize.Status.Text_Result;
   function Uptime_Label
     (Percent_Text : String)
      return Humanize.Status.Text_Result;
   function Latency_Label
     (Latency_Text : String)
      return Humanize.Status.Text_Result;
   function Maintenance_Window_Label
     (Window_Text : String)
      return Humanize.Status.Text_Result;
   function Last_Checked_Label
     (Time_Text : String)
      return Humanize.Status.Text_Result;
   procedure Service_State_Label_Into
     (State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Health_State_Label_Into
     (State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Readiness_State_Label_Into
     (State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Component_State_Label_Into
     (State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Check_State_Label_Into
     (State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Incident_State_Label_Into
     (State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Service_Status_Label_Into
     (Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   procedure Health_Label_Into
     (Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   procedure Readiness_Label_Into
     (Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   procedure Component_Status_Label_Into
     (Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   procedure Check_Label_Into
     (Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   procedure Incident_Label_Into
     (Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : System_Status_Label_Options);
   procedure Component_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Check_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Incident_Count_Label_Into
     (Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   procedure Uptime_Label_Into
     (Percent_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   procedure Latency_Label_Into
     (Latency_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   procedure Maintenance_Window_Label_Into
     (Window_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   procedure Last_Checked_Label_Into
     (Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
end Humanize.System_Status.Support;
