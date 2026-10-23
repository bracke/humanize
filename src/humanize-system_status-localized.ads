with Humanize.Contexts;

--  System status labels in a context's locale, through the phrase catalog
--  (docs/PHRASE_TEMPLATES.md, "System status"); each is the parent's function
--  of the same name in English. Mnemonics and codes (ENOENT, SIGKILL,
--  HTTP 503) stay as their standards write them; their reasons are localized.
package Humanize.System_Status.Localized is

   function Service_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Service_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Service availability state.
   --  @return The state as a localized label.

   function Health_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Health_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Health-check aggregate state.
   --  @return The state as a localized label.

   function Readiness_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Readiness_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Readiness/lifecycle state.
   --  @return The state as a localized label.

   function Component_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Component_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Component runtime state.
   --  @return The state as a localized label.

   function Check_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Check_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Status-check state.
   --  @return The state as a localized label.

   function Incident_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Incident_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State Incident lifecycle state.
   --  @return The state as a localized label.

   function Service_Status_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Service_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Service availability state.
   --  @return Name with its state, localized.

   function Health_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Health_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Health-check aggregate state.
   --  @return Name with its state, localized.

   function Readiness_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Readiness_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Readiness/lifecycle state.
   --  @return Name with its state, localized.

   function Component_Status_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Component_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Component runtime state.
   --  @return Name with its state, localized.

   function Check_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Check_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Status-check state.
   --  @return Name with its state, localized.

   function Incident_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Incident_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Incident lifecycle state.
   --  @return Name with its state, localized.

   function Component_Count_Label
     (Context : Humanize.Contexts.Context;
      Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of components.
   --  @return The localized count ("no components" for 0).

   function Check_Count_Label
     (Context : Humanize.Contexts.Context;
      Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of checks.
   --  @return The localized count ("no checks" for 0).

   function Incident_Count_Label
     (Context : Humanize.Contexts.Context;
      Count   : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count Number of incidents.
   --  @return The localized count ("no incidents" for 0).

   function Uptime_Label
     (Context : Humanize.Contexts.Context;
      Percent_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Percent_Text Caller-formatted uptime, already localized.
   --  @return The localized label.

   function Latency_Label
     (Context : Humanize.Contexts.Context;
      Latency_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Latency_Text Caller-formatted latency, already localized.
   --  @return The localized label.

   function Maintenance_Window_Label
     (Context : Humanize.Contexts.Context;
      Window_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Window_Text Caller-formatted maintenance window, already localized.
   --  @return The localized label.

   function Last_Checked_Label
     (Context : Humanize.Contexts.Context;
      Time_Text : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Time_Text Caller-formatted check time, already localized.
   --  @return The localized label.

   function HTTP_Status_Class_Label
     (Context : Humanize.Contexts.Context;
      Class   : HTTP_Status_Class)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Class HTTP status-code family.
   --  @return The family as a localized label.

   function Process_Exit_Label
     (Context : Humanize.Contexts.Context;
      Code    : Process_Exit_Code)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Code Process exit status.
   --  @return The exit status as a localized label; a signal's name stays
   --  the English of its standard.

   function HTTP_Status_Reason
     (Context : Humanize.Contexts.Context;
      Code    : HTTP_Status_Code)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Code HTTP status code.
   --  @return The status's reason phrase, localized ("Dienst nicht verfügbar").

   function HTTP_Status_Label
     (Context      : Humanize.Contexts.Context;
      Code         : HTTP_Status_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Code HTTP status code.
   --  @param Include_Code Prefix "HTTP <code>".
   --  @return The status with its localized reason.

   function Errno_Label
     (Context      : Humanize.Contexts.Context;
      Code         : Errno_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Code POSIX errno value.
   --  @param Include_Code Prefix the mnemonic ("ENOENT").
   --  @return The error with its localized reason.

   function Signal_Label
     (Context        : Humanize.Contexts.Context;
      Number         : Signal_Number;
      Include_Number : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Number POSIX signal number.
   --  @param Include_Number Say "signal <number>" first.
   --  @return The signal's mnemonic and localized reason.

   function SQLSTATE_Class_Label
     (Context      : Humanize.Contexts.Context;
      Class        : SQLSTATE_Class;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Class Two-character SQLSTATE class.
   --  @param Include_Code Prefix "SQLSTATE <class>".
   --  @return The class with its localized reason.

   procedure HTTP_Status_Label_Into
     (Context      : Humanize.Contexts.Context;
      Code         : HTTP_Status_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True);
   --  @param Context Formatting context.
   --  @param Code HTTP status code.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Include_Code Prefix "HTTP <code>".

   --  Bounded forms: each writes its function's text into Target.

   procedure Service_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Service availability state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Health_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Health-check aggregate state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Readiness_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Readiness/lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Component_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Component runtime state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Status-check state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Incident_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State Incident lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Service_Status_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Service availability state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Health_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Health-check aggregate state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Readiness_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Readiness/lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Component_Status_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Component runtime state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Status-check state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Incident_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name Display name.
   --  @param State Incident lifecycle state.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Component_Count_Label_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of components.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Check_Count_Label_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of checks.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Incident_Count_Label_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count Number of incidents.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Uptime_Label_Into
     (Context      : Humanize.Contexts.Context;
      Percent_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Percent_Text Caller-formatted uptime, already localized.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Latency_Label_Into
     (Context      : Humanize.Contexts.Context;
      Latency_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Latency_Text Caller-formatted latency, already localized.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Maintenance_Window_Label_Into
     (Context     : Humanize.Contexts.Context;
      Window_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Window_Text Caller-formatted maintenance window, already localized.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Last_Checked_Label_Into
     (Context   : Humanize.Contexts.Context;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Time_Text Caller-formatted check time, already localized.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure HTTP_Status_Class_Label_Into
     (Context : Humanize.Contexts.Context;
      Class   : HTTP_Status_Class;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Class HTTP status-code family.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Process_Exit_Label_Into
     (Context : Humanize.Contexts.Context;
      Code    : Process_Exit_Code;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Code Process exit status.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.System_Status.Localized;
