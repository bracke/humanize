with Ada.Characters.Handling;
with Ada.Strings.Fixed;
with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Message_Keys;
with Humanize.Selections;

package body Humanize.System_Status.Localized is

   use type Humanize.Status.Status_Code;

   package Sel renames Humanize.Selections;

   function Ok_Result (Text : String) return Humanize.Status.Text_Result is
     (Status => Humanize.Status.Ok, Text => To_Unbounded_String (Text), Key => Humanize.Message_Keys.No_Message);

   --  Reason Key ("http.reason.503") in Context's locale; English where the
   --  locale is English or has none.
   function Reason (Context : Humanize.Contexts.Context; Key, English : String) return String is
      Rendered : constant Humanize.Status.Text_Result :=
        Humanize.I18N_Rendering.Phrase_Or (Context, Sel.Phrase (Key), Ok_Result (English));
   begin
      return To_String (Rendered.Text);
   end Reason;

   function Text_Of (Result : Humanize.Status.Text_Result) return String is (To_String (Result.Text));

   function Code_Key (Family : String; Code : Integer; English_Reason, Unknown : String) return String is
     (Family & ".reason."
      & (if English_Reason = Unknown then "unknown"
         else Ada.Strings.Fixed.Trim (Integer'Image (Code), Ada.Strings.Left)));

   function HTTP_Status_Reason
     (Context : Humanize.Contexts.Context;
      Code    : HTTP_Status_Code)
      return Humanize.Status.Text_Result
   is
      English : constant String := Text_Of (Humanize.System_Status.HTTP_Status_Reason (Code));
   begin
      return Ok_Result (Reason (Context, Code_Key ("http", Code, English, "unknown status"), English));
   end HTTP_Status_Reason;

   function HTTP_Status_Label
     (Context      : Humanize.Contexts.Context;
      Code         : HTTP_Status_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Local : constant String := Text_Of (HTTP_Status_Reason (Context, Code));
   begin
      return Ok_Result
        (if Include_Code
         then "HTTP " & Ada.Strings.Fixed.Trim (Integer'Image (Code), Ada.Strings.Left) & " " & Local
         else Local);
   end HTTP_Status_Label;

   function Errno_Label
     (Context      : Humanize.Contexts.Context;
      Code         : Errno_Code;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
   is
      English : constant String := Text_Of (Humanize.System_Status.Errno_Label (Code, Include_Code => False));
      Full    : constant String := Text_Of (Humanize.System_Status.Errno_Label (Code));
      Name    : constant String := Full (Full'First .. Full'Last - English'Length - 1);
      Local   : constant String := Reason (Context, Code_Key ("errno", Code, English, "unknown error"), English);
   begin
      return Ok_Result (if Include_Code then Name & " " & Local else Local);
   end Errno_Label;

   function Signal_Label
     (Context        : Humanize.Contexts.Context;
      Number         : Signal_Number;
      Include_Number : Boolean := True)
      return Humanize.Status.Text_Result
   is
      Plain   : constant String := Text_Of (Humanize.System_Status.Signal_Label (Number, Include_Number => False));
      Space   : constant Natural := Ada.Strings.Fixed.Index (Plain, " ");
      --  "SIGKILL killed": the mnemonic, then the reason; an unknown signal is
      --  "signal 40 unknown signal".
      English : constant String :=
        (if Plain'Length > 14 and then Plain (Plain'Last - 13 .. Plain'Last) = "unknown signal" then "unknown signal"
         elsif Space = 0 then Plain else Plain (Space + 1 .. Plain'Last));
      Name    : constant String := Plain (Plain'First .. Plain'Last - English'Length - 1);
      Local   : constant String := Reason (Context, Code_Key ("signal", Number, English, "unknown signal"), English);
   begin
      if not Include_Number then
         return Ok_Result (Name & " " & Local);
      end if;
      return Humanize.I18N_Rendering.Phrase_Or
        (Context,
         Sel.With_Arg (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("system.signal_numbered"), "number",
                                                   Long_Long_Integer (Number)), "name", Name), "reason", Local),
         Humanize.System_Status.Signal_Label (Number));
   end Signal_Label;

   function SQLSTATE_Class_Label
     (Context      : Humanize.Contexts.Context;
      Class        : SQLSTATE_Class;
      Include_Code : Boolean := True)
      return Humanize.Status.Text_Result
   is
      English : constant String := Text_Of (Humanize.System_Status.SQLSTATE_Class_Label (Class, Include_Code => False));
      Key     : constant String :=
        "sqlstate.reason."
        & (if English = "unknown SQLSTATE class" then "unknown"
           else Ada.Characters.Handling.To_Lower (String (Class)));
      Local   : constant String := Reason (Context, Key, English);
   begin
      return Ok_Result (if Include_Code then "SQLSTATE " & String (Class) & " " & Local else Local);
   end SQLSTATE_Class_Label;

   procedure HTTP_Status_Label_Into
     (Context      : Humanize.Contexts.Context;
      Code         : HTTP_Status_Code;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Include_Code : Boolean := True)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (HTTP_Status_Label (Context, Code, Include_Code), Target, Written, Status);
   end HTTP_Status_Label_Into;

   function Key (Family, Image, Suffix : String) return String is
      Lower : constant String := Ada.Characters.Handling.To_Lower (Image);
   begin
      if Lower'Length > Suffix'Length
        and then Lower (Lower'Last - Suffix'Length + 1 .. Lower'Last) = Suffix
      then
         return "system." & Family & "." & Lower (Lower'First .. Lower'Last - Suffix'Length);
      end if;
      return "system." & Family & "." & Lower;
   end Key;

   function State_Label
     (Context : Humanize.Contexts.Context; Key : String; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Phrase_Or (Context, Sel.Phrase (Key), English));

   function Named_Label
     (Context : Humanize.Contexts.Context; Frame, Name : String; State : Humanize.Status.Text_Result;
      English : Humanize.Status.Text_Result) return Humanize.Status.Text_Result
   is
   begin
      if English.Status /= Humanize.Status.Ok or else State.Status /= Humanize.Status.Ok then
         return English;
      end if;
      return Humanize.I18N_Rendering.Phrase_Or
        (Context,
         Sel.With_Arg (Sel.With_Arg (Sel.Phrase (Frame), "name", Name), "state", To_String (State.Text)),
         English);
   end Named_Label;

   function Count_Label
     (Context : Humanize.Contexts.Context; Key : String; Count : Natural; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (Humanize.I18N_Rendering.Phrase_Or
        (Context, Sel.With_Arg (Sel.Phrase (Key), "count", Long_Long_Integer (Count)), English));

   function Text_Label
     (Context : Humanize.Contexts.Context; Key, Argument, Value : String; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result is
     (if English.Status /= Humanize.Status.Ok then English
      else Humanize.I18N_Rendering.Phrase_Or
             (Context, Sel.With_Arg (Sel.Phrase (Key), Argument, Value), English));

   function Exit_Label
     (Context : Humanize.Contexts.Context; Code : Process_Exit_Code; English : Humanize.Status.Text_Result)
      return Humanize.Status.Text_Result
   is
      function Plain (Name : String) return Humanize.Status.Text_Result is
        (Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.With_Arg (Sel.Phrase ("system.exit." & Name), "code", Long_Long_Integer (Code)), English));
   begin
      case Code is
         when 0 => return Plain ("success");
         when 2 => return Plain ("usage_error");
         when 126 => return Plain ("not_executable");
         when 127 => return Plain ("not_found");
         when 128 => return Plain ("invalid_argument");
         when 129 .. 192 =>
            declare
               Signal : constant Humanize.Status.Text_Result :=
                 Signal_Label (Context, Signal_Number (Code - 128), Include_Number => False);
            begin
               if Signal.Status /= Humanize.Status.Ok then
                  return English;
               end if;
               return Humanize.I18N_Rendering.Phrase_Or
                 (Context,
                  Sel.With_Arg
                    (Sel.With_Arg (Sel.Phrase ("system.exit.signal"), "code", Long_Long_Integer (Code)),
                     "signal", To_String (Signal.Text)),
                  English);
            end;
         when others => return Plain ("failure");
      end case;
   end Exit_Label;

   function Service_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Service_State)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("service", Service_State'Image (State), "_service"), Service_State_Label (State)));

   function Health_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Health_State)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("health", Health_State'Image (State), ""), Health_State_Label (State)));

   function Readiness_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Readiness_State)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("readiness", Readiness_State'Image (State), ""), Readiness_State_Label (State)));

   function Component_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Component_State)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("component", Component_State'Image (State), "_component"),
          Component_State_Label (State)));

   function Check_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Check_State)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("check", Check_State'Image (State), "_check"), Check_State_Label (State)));

   function Incident_State_Label
     (Context : Humanize.Contexts.Context;
      State   : Incident_State)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("incident", Incident_State'Image (State), "_incident"),
          Incident_State_Label (State)));

   function Service_Status_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Service_State)
      return Humanize.Status.Text_Result
   is (Named_Label
         (Context, "system.named", Name, Service_State_Label (Context, State), Service_Status_Label (Name, State)));

   function Health_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Health_State)
      return Humanize.Status.Text_Result
   is (Named_Label
         (Context, "system.named", Name, Health_State_Label (Context, State), Health_Label (Name, State)));

   function Readiness_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Readiness_State)
      return Humanize.Status.Text_Result
   is (Named_Label
         (Context, "system.named", Name, Readiness_State_Label (Context, State), Readiness_Label (Name, State)));

   function Component_Status_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Component_State)
      return Humanize.Status.Text_Result
   is (Named_Label
         (Context, "system.named", Name, Component_State_Label (Context, State), Component_Status_Label (Name, State)));

   function Check_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Check_State)
      return Humanize.Status.Text_Result
   is (Named_Label
         (Context, "system.check_named", Name, Check_State_Label (Context, State), Check_Label (Name, State)));

   function Incident_Label
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Incident_State)
      return Humanize.Status.Text_Result
   is (Named_Label
         (Context, "system.named", Name, Incident_State_Label (Context, State), Incident_Label (Name, State)));

   function Component_Count_Label
     (Context : Humanize.Contexts.Context;
      Count   : Natural)
      return Humanize.Status.Text_Result
   is (Count_Label (Context, "system.count.components", Count, Component_Count_Label (Count)));

   function Check_Count_Label
     (Context : Humanize.Contexts.Context;
      Count   : Natural)
      return Humanize.Status.Text_Result
   is (Count_Label (Context, "system.count.checks", Count, Check_Count_Label (Count)));

   function Incident_Count_Label
     (Context : Humanize.Contexts.Context;
      Count   : Natural)
      return Humanize.Status.Text_Result
   is (Count_Label (Context, "system.count.incidents", Count, Incident_Count_Label (Count)));

   function Uptime_Label
     (Context : Humanize.Contexts.Context;
      Percent_Text : String)
      return Humanize.Status.Text_Result
   is (Text_Label (Context, "system.uptime", "measure", Percent_Text, Uptime_Label (Percent_Text)));

   function Latency_Label
     (Context : Humanize.Contexts.Context;
      Latency_Text : String)
      return Humanize.Status.Text_Result
   is (Text_Label (Context, "system.latency", "measure", Latency_Text, Latency_Label (Latency_Text)));

   function Maintenance_Window_Label
     (Context : Humanize.Contexts.Context;
      Window_Text : String)
      return Humanize.Status.Text_Result
   is (Text_Label
         (Context, "system.maintenance_window", "time", Window_Text,
          Maintenance_Window_Label (Window_Text)));

   function Last_Checked_Label
     (Context : Humanize.Contexts.Context;
      Time_Text : String)
      return Humanize.Status.Text_Result
   is (Text_Label (Context, "system.last_checked", "time", Time_Text, Last_Checked_Label (Time_Text)));

   function HTTP_Status_Class_Label
     (Context : Humanize.Contexts.Context;
      Class   : HTTP_Status_Class)
      return Humanize.Status.Text_Result
   is (State_Label
         (Context, Key ("http", HTTP_Status_Class'Image (Class), "_status"),
          HTTP_Status_Class_Label (Class)));

   function Process_Exit_Label
     (Context : Humanize.Contexts.Context;
      Code    : Process_Exit_Code)
      return Humanize.Status.Text_Result
   is (Exit_Label (Context, Code, Process_Exit_Label (Code)));

   procedure Service_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Service_State_Label (Context, State), Target, Written, Status);
   end Service_State_Label_Into;

   procedure Health_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Health_State_Label (Context, State), Target, Written, Status);
   end Health_State_Label_Into;

   procedure Readiness_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Readiness_State_Label (Context, State), Target, Written, Status);
   end Readiness_State_Label_Into;

   procedure Component_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Component_State_Label (Context, State), Target, Written, Status);
   end Component_State_Label_Into;

   procedure Check_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Check_State_Label (Context, State), Target, Written, Status);
   end Check_State_Label_Into;

   procedure Incident_State_Label_Into
     (Context : Humanize.Contexts.Context;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Incident_State_Label (Context, State), Target, Written, Status);
   end Incident_State_Label_Into;

   procedure Service_Status_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Service_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Service_Status_Label (Context, Name, State), Target, Written, Status);
   end Service_Status_Label_Into;

   procedure Health_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Health_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Health_Label (Context, Name, State), Target, Written, Status);
   end Health_Label_Into;

   procedure Readiness_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Readiness_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Readiness_Label (Context, Name, State), Target, Written, Status);
   end Readiness_Label_Into;

   procedure Component_Status_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Component_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Component_Status_Label (Context, Name, State), Target, Written, Status);
   end Component_Status_Label_Into;

   procedure Check_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Check_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Check_Label (Context, Name, State), Target, Written, Status);
   end Check_Label_Into;

   procedure Incident_Label_Into
     (Context : Humanize.Contexts.Context;
      Name    : String;
      State   : Incident_State;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Incident_Label (Context, Name, State), Target, Written, Status);
   end Incident_Label_Into;

   procedure Component_Count_Label_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Component_Count_Label (Context, Count), Target, Written, Status);
   end Component_Count_Label_Into;

   procedure Check_Count_Label_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Check_Count_Label (Context, Count), Target, Written, Status);
   end Check_Count_Label_Into;

   procedure Incident_Count_Label_Into
     (Context : Humanize.Contexts.Context;
      Count   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Incident_Count_Label (Context, Count), Target, Written, Status);
   end Incident_Count_Label_Into;

   procedure Uptime_Label_Into
     (Context      : Humanize.Contexts.Context;
      Percent_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Uptime_Label (Context, Percent_Text), Target, Written, Status);
   end Uptime_Label_Into;

   procedure Latency_Label_Into
     (Context      : Humanize.Contexts.Context;
      Latency_Text : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Latency_Label (Context, Latency_Text), Target, Written, Status);
   end Latency_Label_Into;

   procedure Maintenance_Window_Label_Into
     (Context     : Humanize.Contexts.Context;
      Window_Text : String;
      Target      : in out String;
      Written     : out Natural;
      Status      : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Maintenance_Window_Label (Context, Window_Text), Target, Written, Status);
   end Maintenance_Window_Label_Into;

   procedure Last_Checked_Label_Into
     (Context   : Humanize.Contexts.Context;
      Time_Text : String;
      Target    : in out String;
      Written   : out Natural;
      Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Last_Checked_Label (Context, Time_Text), Target, Written, Status);
   end Last_Checked_Label_Into;

   procedure HTTP_Status_Class_Label_Into
     (Context : Humanize.Contexts.Context;
      Class   : HTTP_Status_Class;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (HTTP_Status_Class_Label (Context, Class), Target, Written, Status);
   end HTTP_Status_Class_Label_Into;

   procedure Process_Exit_Label_Into
     (Context : Humanize.Contexts.Context;
      Code    : Process_Exit_Code;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Process_Exit_Label (Context, Code), Target, Written, Status);
   end Process_Exit_Label_Into;

end Humanize.System_Status.Localized;
