with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Forms.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Character_Count_Label
      (Context : Humanize.Contexts.Context;
       Used    : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Character_Count_Label (Used => Used);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.character_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "used", Long_Long_Integer (Used));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Character_Count_Label;

   function Character_Limit_Label
      (Context : Humanize.Contexts.Context;
       Limit   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Character_Limit_Label (Limit => Limit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.character_limit_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "limit", Long_Long_Integer (Limit));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Character_Limit_Label;

   function Character_Usage_Label
      (Context : Humanize.Contexts.Context;
       Used    : Natural;
       Limit   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Character_Usage_Label (Used => Used, Limit => Limit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.character_usage_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "used", Long_Long_Integer (Used));
      Selection := Sel.With_Arg (Selection, "limit", Long_Long_Integer (Limit));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Character_Usage_Label;

   function Field_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Required : Boolean := False)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Field_Label (Name => Name, Required => Required);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.field_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "required", Lower (Boolean'Image (Required)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Field_Label;

   function Field_State_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Input_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Field_State_Label (Name => Name, State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.field_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "state", Lower (Input_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Field_State_Label;

   function Form_Error_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Form_Error_Summary_Label (Errors => Errors, Warnings => Warnings);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.form_error_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "errors", Long_Long_Integer (Errors));
      Selection := Sel.With_Arg (Selection, "warnings", Long_Long_Integer (Warnings));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Form_Error_Summary_Label;

   function Form_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Form_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Form_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.form_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Form_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Form_State_Label;

   function Input_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Input_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Input_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.input_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Input_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Input_State_Label;

   function Submission_Label
      (Context : Humanize.Contexts.Context;
       State   : Form_State;
       Errors  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Submission_Label (State => State, Errors => Errors);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.submission_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Form_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "errors", Long_Long_Integer (Errors));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Submission_Label;

   function Unsaved_Changes_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Forms.Unsaved_Changes_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.forms.unsaved_changes_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Unsaved_Changes_Label;

   procedure Character_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Character_Count_Label (Context, Used), Target, Written, Status);
   end Character_Count_Label_Into;

   procedure Character_Limit_Label_Into
      (Context : Humanize.Contexts.Context;
       Limit   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Character_Limit_Label (Context, Limit), Target, Written, Status);
   end Character_Limit_Label_Into;

   procedure Character_Usage_Label_Into
      (Context : Humanize.Contexts.Context;
       Used    : Natural;
       Limit   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Character_Usage_Label (Context, Used, Limit), Target, Written, Status);
   end Character_Usage_Label_Into;

   procedure Field_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       Required : Boolean := False;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Field_Label (Context, Name, Required), Target, Written, Status);
   end Field_Label_Into;

   procedure Field_State_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       State   : Input_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Field_State_Label (Context, Name, State), Target, Written, Status);
   end Field_State_Label_Into;

   procedure Form_Error_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Errors   : Natural := 0;
       Warnings : Natural := 0;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Form_Error_Summary_Label (Context, Errors, Warnings), Target, Written, Status);
   end Form_Error_Summary_Label_Into;

   procedure Form_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Form_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Form_State_Label (Context, State), Target, Written, Status);
   end Form_State_Label_Into;

   procedure Input_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Input_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Input_State_Label (Context, State), Target, Written, Status);
   end Input_State_Label_Into;

   procedure Submission_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Form_State;
       Errors  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Submission_Label (Context, State, Errors), Target, Written, Status);
   end Submission_Label_Into;

   procedure Unsaved_Changes_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Unsaved_Changes_Label (Context, Count), Target, Written, Status);
   end Unsaved_Changes_Label_Into;

end Humanize.Forms.Localized;
