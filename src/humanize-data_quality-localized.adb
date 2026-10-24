with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Data_Quality.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Data_Issue_Label
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Data_Issue_Label (Issue => Issue);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.data_quality.data_issue_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issue", Lower (Data_Issue'Image (Issue)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Data_Issue_Label;

   function Import_Check_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Import_Check_State)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Import_Check_State_Label (State => State);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.data_quality.import_check_state_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Import_Check_State'Image (State)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Import_Check_State_Label;

   function Import_Result_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Import_Check_State;
       Accepted : Natural;
       Rejected : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Import_Result_Label
          (Name => Name,
           State => State,
           Accepted => Accepted,
           Rejected => Rejected);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.data_quality.import_result_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", Lower (Import_Check_State'Image (State)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "accepted", Long_Long_Integer (Accepted));
      Selection := Sel.With_Arg (Selection, "rejected", Long_Long_Integer (Rejected));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Import_Result_Label;

   function Import_Result_Label
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Import_Check_State;
       Accepted : Natural;
       Rejected : Natural;
       Options  : Data_Quality_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Import_Result_Label
          (Name => Name,
           State => State,
           Accepted => Accepted,
           Rejected => Rejected,
           Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Data_Quality.Import_Result_Label
          (Name => Name,
           State => State,
           Accepted => Accepted,
           Rejected => Rejected);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Import_Result_Label (Context, Name => Name,
        State => State, Accepted => Accepted, Rejected => Rejected));
   end Import_Result_Label;

   function Issue_Count_Label
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Issue_Count_Label (Issue => Issue, Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.data_quality.issue_count_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issue", Lower (Data_Issue'Image (Issue)));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Issue_Count_Label;

   function Row_Issue_Label
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Issue   : Data_Issue)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Row_Issue_Label (Row => Row, Issue => Issue);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.data_quality.row_issue_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issue", Lower (Data_Issue'Image (Issue)));
      Selection := Sel.With_Arg (Selection, "row", Long_Long_Integer (Row));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Row_Issue_Label;

   function Source_File_Issue_Label
      (Context   : Humanize.Contexts.Context;
       File_Name : String;
       Issue     : Data_Issue)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Data_Quality.Source_File_Issue_Label (File_Name => File_Name, Issue => Issue);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.data_quality.source_file_issue_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issue", Lower (Data_Issue'Image (Issue)));
      Selection := Sel.With_Arg (Selection, "file_name", Humanize.Bounded_Text.Clean (File_Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Source_File_Issue_Label;

   procedure Data_Issue_Label_Into
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Data_Issue_Label (Context, Issue => Issue), Target, Written, Status);
   end Data_Issue_Label_Into;

   procedure Import_Check_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Import_Check_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Import_Check_State_Label (Context, State => State), Target, Written, Status);
   end Import_Check_State_Label_Into;

   procedure Import_Result_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Import_Check_State;
       Accepted : Natural;
       Rejected : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Import_Result_Label (Context, Name => Name, State => State, Accepted => Accepted, Rejected => Rejected),
         Target, Written, Status);
   end Import_Result_Label_Into;

   procedure Import_Result_Label_Into
      (Context  : Humanize.Contexts.Context;
       Name     : String;
       State    : Import_Check_State;
       Accepted : Natural;
       Rejected : Natural;
       Options  : Data_Quality_Label_Options;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Import_Result_Label (Context, Name => Name, State => State, Accepted => Accepted, Rejected => Rejected,
         Options => Options),
         Target, Written, Status);
   end Import_Result_Label_Into;

   procedure Issue_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Issue   : Data_Issue;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Issue_Count_Label (Context, Issue => Issue, Count => Count),
         Target, Written, Status);
   end Issue_Count_Label_Into;

   procedure Row_Issue_Label_Into
      (Context : Humanize.Contexts.Context;
       Row     : Positive;
       Issue   : Data_Issue;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Row_Issue_Label (Context, Row => Row, Issue => Issue),
         Target, Written, Status);
   end Row_Issue_Label_Into;

   procedure Source_File_Issue_Label_Into
      (Context   : Humanize.Contexts.Context;
       File_Name : String;
       Issue     : Data_Issue;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Source_File_Issue_Label (Context, File_Name => File_Name, Issue => Issue),
         Target, Written, Status);
   end Source_File_Issue_Label_Into;

end Humanize.Data_Quality.Localized;
