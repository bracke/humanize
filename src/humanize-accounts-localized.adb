with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Accounts.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Account_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Account_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Account_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.account_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Account_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Account_Label;

   function Account_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Account_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Account_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.account_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Account_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Account_State_Label;

   function Device_Trust_Label
      (Context : Humanize.Contexts.Context;
       State   : Device_Trust_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Device_Trust_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.device_trust_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Device_Trust_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Device_Trust_Label;

   function Last_Active_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Last_Active_Label (Name => Name, Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.last_active_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Last_Active_Label;

   function Login_Attempt_Label
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Succeeded : Boolean)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Login_Attempt_Label (Name => Name, Succeeded => Succeeded);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.login_attempt_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "succeeded", Lower (Boolean'Image (Succeeded)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Login_Attempt_Label;

   function MFA_State_Label
      (Context : Humanize.Contexts.Context;
       State   : MFA_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.MFA_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.mfa_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (MFA_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end MFA_State_Label;

   function Session_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Session_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Session_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.session_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Session_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Session_Label;

   function Session_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Session_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Accounts.Session_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.accounts.session_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Session_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Session_State_Label;

   procedure Account_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Account_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Account_Label (Context, Name, State), Target, Written, Status);
   end Account_Label_Into;

   procedure Account_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Account_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Account_State_Label (Context, State), Target, Written, Status);
   end Account_State_Label_Into;

   procedure Device_Trust_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Device_Trust_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Device_Trust_Label (Context, State), Target, Written, Status);
   end Device_Trust_Label_Into;

   procedure Last_Active_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Last_Active_Label (Context, Name, Time_Text), Target, Written, Status);
   end Last_Active_Label_Into;

   procedure Login_Attempt_Label_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Succeeded : Boolean;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Login_Attempt_Label (Context, Name, Succeeded), Target, Written, Status);
   end Login_Attempt_Label_Into;

   procedure MFA_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : MFA_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (MFA_State_Label (Context, State), Target, Written, Status);
   end MFA_State_Label_Into;

   procedure Session_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Session_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Session_Label (Context, Name, State), Target, Written, Status);
   end Session_Label_Into;

   procedure Session_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Session_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Session_State_Label (Context, State), Target, Written, Status);
   end Session_State_Label_Into;

end Humanize.Accounts.Localized;
