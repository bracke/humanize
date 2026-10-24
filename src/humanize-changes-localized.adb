with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Changes.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Boolean_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : Boolean;
       New_Value  : Boolean)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Boolean_Field_Change_Label (Field_Name => Field_Name, Old_Value => Old_Value, New_Value => New_Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.boolean_field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "old_value", Lower (Boolean'Image (Old_Value)));
      Selection := Sel.With_Arg (Selection, "new_value", Lower (Boolean'Image (New_Value)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Boolean_Field_Change_Label;

   function Change_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Change_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Change_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.change_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Change_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Change_Kind_Label;

   function Change_Severity_Label
      (Context  : Humanize.Contexts.Context;
       Severity : Change_Severity)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Change_Severity_Label (Severity => Severity);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.change_severity_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "severity", Lower (Change_Severity'Image (Severity)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Change_Severity_Label;

   function Collection_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Added      : Natural := 0;
       Removed    : Natural := 0;
       Unchanged  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Collection_Field_Change_Label
          (Field_Name => Field_Name,
           Added => Added,
           Removed => Removed,
           Unchanged => Unchanged);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.collection_field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "added", Long_Long_Integer (Added));
      Selection := Sel.With_Arg (Selection, "removed", Long_Long_Integer (Removed));
      Selection := Sel.With_Arg (Selection, "unchanged", Long_Long_Integer (Unchanged));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Collection_Field_Change_Label;

   function Conflict_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Conflict_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.conflict_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Conflict_Label;

   function Date_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String;
       Earlier    : Boolean := False)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Date_Field_Change_Label
          (Field_Name => Field_Name,
           Old_Label => Old_Label,
           New_Label => New_Label,
           Earlier => Earlier);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.date_field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "old_label", Humanize.Bounded_Text.Clean (Old_Label));
      Selection := Sel.With_Arg (Selection, "new_label", Humanize.Bounded_Text.Clean (New_Label));
      Selection := Sel.With_Arg (Selection, "earlier", Lower (Boolean'Image (Earlier)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Date_Field_Change_Label;

   function Duration_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Duration_Field_Change_Label
          (Field_Name => Field_Name,
           Old_Label => Old_Label,
           New_Label => New_Label);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.duration_field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "old_label", Humanize.Bounded_Text.Clean (Old_Label));
      Selection := Sel.With_Arg (Selection, "new_label", Humanize.Bounded_Text.Clean (New_Label));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Duration_Field_Change_Label;

   function Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : String := "";
       New_Value  : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Field_Change_Label (Field_Name => Field_Name, Old_Value => Old_Value, New_Value => New_Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "old_value", Humanize.Bounded_Text.Clean (Old_Value));
      Selection := Sel.With_Arg (Selection, "new_value", Humanize.Bounded_Text.Clean (New_Value));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Field_Change_Label;

   function Item_Change_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Change_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Item_Change_Label (Name => Name, Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.item_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "kind", Lower (Change_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Item_Change_Label;

   function Metadata_Only_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Metadata_Only_Label (Count => Count);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.metadata_only_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Metadata_Only_Label;

   function Move_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       From    : String;
       To      : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Move_Label (Name => Name, From => From, To => To);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.move_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "from", Humanize.Bounded_Text.Clean (From));
      Selection := Sel.With_Arg (Selection, "to", Humanize.Bounded_Text.Clean (To));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Move_Label;

   function No_Changes_Label
      (Context : Humanize.Contexts.Context)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.No_Changes_Label;
      Selection : constant Sel.Message_Selection := Sel.Phrase ("label.changes.no_changes_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end No_Changes_Label;

   function Patch_Size_Label
      (Context       : Humanize.Contexts.Context;
       Lines_Added   : Natural := 0;
       Lines_Removed : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Patch_Size_Label (Lines_Added => Lines_Added, Lines_Removed => Lines_Removed);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.patch_size_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "lines_added", Long_Long_Integer (Lines_Added));
      Selection := Sel.With_Arg (Selection, "lines_removed", Long_Long_Integer (Lines_Removed));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Patch_Size_Label;

   function Rename_Label
      (Context  : Humanize.Contexts.Context;
       Old_Name : String;
       New_Name : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Rename_Label (Old_Name => Old_Name, New_Name => New_Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.rename_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "old_name", Humanize.Bounded_Text.Clean (Old_Name));
      Selection := Sel.With_Arg (Selection, "new_name", Humanize.Bounded_Text.Clean (New_Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Rename_Label;

   procedure Boolean_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : Boolean;
       New_Value  : Boolean;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Boolean_Field_Change_Label (Context, Field_Name, Old_Value, New_Value),
         Target, Written, Status);
   end Boolean_Field_Change_Label_Into;

   procedure Change_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Change_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Change_Kind_Label (Context, Kind), Target, Written, Status);
   end Change_Kind_Label_Into;

   procedure Change_Severity_Label_Into
      (Context  : Humanize.Contexts.Context;
       Severity : Change_Severity;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Change_Severity_Label (Context, Severity), Target, Written, Status);
   end Change_Severity_Label_Into;

   procedure Collection_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Added      : Natural := 0;
       Removed    : Natural := 0;
       Unchanged  : Natural := 0;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Collection_Field_Change_Label (Context, Field_Name, Added, Removed, Unchanged),
         Target, Written, Status);
   end Collection_Field_Change_Label_Into;

   procedure Conflict_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Conflict_Label (Context, Count), Target, Written, Status);
   end Conflict_Label_Into;

   procedure Date_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String;
       Earlier    : Boolean := False;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Date_Field_Change_Label (Context, Field_Name, Old_Label, New_Label, Earlier),
         Target, Written, Status);
   end Date_Field_Change_Label_Into;

   procedure Duration_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Label  : String;
       New_Label  : String;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Duration_Field_Change_Label (Context, Field_Name, Old_Label, New_Label),
         Target, Written, Status);
   end Duration_Field_Change_Label_Into;

   procedure Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : String := "";
       New_Value  : String := "";
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Field_Change_Label (Context, Field_Name, Old_Value, New_Value),
         Target, Written, Status);
   end Field_Change_Label_Into;

   procedure Item_Change_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Change_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Item_Change_Label (Context, Name, Kind), Target, Written, Status);
   end Item_Change_Label_Into;

   procedure Metadata_Only_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Metadata_Only_Label (Context, Count), Target, Written, Status);
   end Metadata_Only_Label_Into;

   procedure Move_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       From    : String;
       To      : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Move_Label (Context, Name, From, To), Target, Written, Status);
   end Move_Label_Into;

   procedure No_Changes_Label_Into
      (Context : Humanize.Contexts.Context;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (No_Changes_Label (Context), Target, Written, Status);
   end No_Changes_Label_Into;

   procedure Patch_Size_Label_Into
      (Context       : Humanize.Contexts.Context;
       Lines_Added   : Natural := 0;
       Lines_Removed : Natural := 0;
       Target        : in out String;
       Written       : out Natural;
       Status        : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Patch_Size_Label (Context, Lines_Added, Lines_Removed),
         Target, Written, Status);
   end Patch_Size_Label_Into;

   procedure Rename_Label_Into
      (Context  : Humanize.Contexts.Context;
       Old_Name : String;
       New_Name : String;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Rename_Label (Context, Old_Name, New_Name), Target, Written, Status);
   end Rename_Label_Into;

end Humanize.Changes.Localized;
