with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Permissions.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Access_Expiry_Label
      (Context   : Humanize.Contexts.Context;
       Subject   : String;
       Time_Text : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Access_Expiry_Label (Subject => Subject, Time_Text => Time_Text);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.access_expiry_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "subject", Humanize.Bounded_Text.Clean (Subject));
      Selection := Sel.With_Arg (Selection, "time_text", Humanize.Bounded_Text.Clean (Time_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Access_Expiry_Label;

   function Grant_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Grant_Label (Subject => Subject, Role => Role);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.grant_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "role", Lower (Role_Kind'Image (Role)));
      Selection := Sel.With_Arg (Selection, "subject", Humanize.Bounded_Text.Clean (Subject));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Grant_Label;

   function Permission_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Permission_Label (Subject => Subject, Action => Action, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.permission_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Permission_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "subject", Humanize.Bounded_Text.Clean (Subject));
      Selection := Sel.With_Arg (Selection, "action", Humanize.Bounded_Text.Clean (Action));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Permission_Label;

   function Permission_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State;
       Options : Permission_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Permission_Label (Subject => Subject, Action => Action, State => State, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Permissions.Permission_Label (Subject => Subject, Action => Action, State => State);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Permission_Label (Context, Subject => Subject,
        Action => Action, State => State));
   end Permission_Label;

   function Permission_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Permission_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Permission_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.permission_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Permission_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Permission_State_Label;

   function Policy_Result_Label
      (Context : Humanize.Contexts.Context;
       Result  : Policy_Result)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Policy_Result_Label (Result => Result);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.policy_result_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "result", Lower (Policy_Result'Image (Result)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Policy_Result_Label;

   function Revoke_Label
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Revoke_Label (Subject => Subject, Role => Role);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.revoke_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "role", Lower (Role_Kind'Image (Role)));
      Selection := Sel.With_Arg (Selection, "subject", Humanize.Bounded_Text.Clean (Subject));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Revoke_Label;

   function Role_Label
      (Context : Humanize.Contexts.Context;
       Role    : Role_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Permissions.Role_Label (Role => Role);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.permissions.role_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "role", Lower (Role_Kind'Image (Role)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Role_Label;

   procedure Access_Expiry_Label_Into
      (Context   : Humanize.Contexts.Context;
       Subject   : String;
       Time_Text : String;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Access_Expiry_Label (Context, Subject => Subject, Time_Text => Time_Text),
         Target, Written, Status);
   end Access_Expiry_Label_Into;

   procedure Grant_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Grant_Label (Context, Subject => Subject, Role => Role),
         Target, Written, Status);
   end Grant_Label_Into;

   procedure Permission_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Permission_Label (Context, Subject => Subject, Action => Action, State => State),
         Target, Written, Status);
   end Permission_Label_Into;

   procedure Permission_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Action  : String;
       State   : Permission_State;
       Options : Permission_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Permission_Label (Context, Subject => Subject, Action => Action, State => State, Options => Options),
         Target, Written, Status);
   end Permission_Label_Into;

   procedure Permission_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Permission_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Permission_State_Label (Context, State => State), Target, Written, Status);
   end Permission_State_Label_Into;

   procedure Policy_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Result  : Policy_Result;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Policy_Result_Label (Context, Result => Result), Target, Written, Status);
   end Policy_Result_Label_Into;

   procedure Revoke_Label_Into
      (Context : Humanize.Contexts.Context;
       Subject : String;
       Role    : Role_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Revoke_Label (Context, Subject => Subject, Role => Role),
         Target, Written, Status);
   end Revoke_Label_Into;

   procedure Role_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Role_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Role_Label (Context, Role => Role), Target, Written, Status);
   end Role_Label_Into;

end Humanize.Permissions.Localized;
