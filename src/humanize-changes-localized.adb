with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
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
        Changes.Boolean_Field_Change_Label
          (Field_Name => Field_Name,
           Old_Value => Old_Value,
           New_Value => New_Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.boolean_field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "old_value", Lower (Boolean'Image (Old_Value)));
      Selection := Sel.With_Arg (Selection, "new_value", Lower (Boolean'Image (New_Value)));
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
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

   function Change_Set_Label
      (Context   : Humanize.Contexts.Context;
       Added     : Natural := 0;
       Removed   : Natural := 0;
       Modified  : Natural := 0;
       Unchanged : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Change_Set_Label
          (Added => Added,
           Removed => Removed,
           Modified => Modified,
           Unchanged => Unchanged);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      if Added = 0 and then Removed = 0 and then Modified = 0 and then Unchanged = 0 then
         return Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.Phrase ("label.changes.change_set_label.none"), English);
      end if;
      if Added > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_set_label.added", Long_Long_Integer (Added)));
      end if;
      if Removed > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_set_label.removed", Long_Long_Integer (Removed)));
      end if;
      if Modified > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_set_label.modified", Long_Long_Integer (Modified)));
      end if;
      if Unchanged > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_set_label.unchanged", Long_Long_Integer (Unchanged)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Change_Set_Label;

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

   function Change_Summary_Label
      (Context   : Humanize.Contexts.Context;
       Total     : Natural;
       Added     : Natural := 0;
       Removed   : Natural := 0;
       Modified  : Natural := 0;
       Renamed   : Natural := 0;
       Unchanged : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Change_Summary_Label
          (Total => Total,
           Added => Added,
           Removed => Removed,
           Modified => Modified,
           Renamed => Renamed,
           Unchanged => Unchanged);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
        "label.changes.change_summary_label.total", Long_Long_Integer (Total)));
      if Added > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_summary_label.added", Long_Long_Integer (Added)));
      end if;
      if Removed > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_summary_label.removed", Long_Long_Integer (Removed)));
      end if;
      if Modified > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_summary_label.modified", Long_Long_Integer (Modified)));
      end if;
      if Renamed > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_summary_label.renamed", Long_Long_Integer (Renamed)));
      end if;
      if Unchanged > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.change_summary_label.unchanged", Long_Long_Integer (Unchanged)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Change_Summary_Label;

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
      Selection := Sel.With_Arg (Selection, "removed", Long_Long_Integer (Removed));
      Selection := Sel.With_Arg (Selection, "added", Long_Long_Integer (Added));
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
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

   function Conflict_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Options : Change_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Conflict_Label (Count => Count, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Changes.Conflict_Label (Count => Count);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Conflict_Label (Context, Count => Count));
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
      Selection := Sel.With_Arg (Selection, "earlier", Lower (Boolean'Image (Earlier)));
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "old_label", Humanize.Bounded_Text.Clean (Old_Label));
      Selection := Sel.With_Arg (Selection, "new_label", Humanize.Bounded_Text.Clean (New_Label));
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
      Selection := Sel.With_Arg (Selection, "kind", Lower (Change_Kind'Image (Kind)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Item_Change_Label;

   function Item_Change_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Change_Kind;
       Options : Change_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Item_Change_Label (Name => Name, Kind => Kind, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Changes.Item_Change_Label (Name => Name, Kind => Kind);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Item_Change_Label (Context, Name => Name, Kind
        => Kind));
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

   function Net_Change_Label
      (Context : Humanize.Contexts.Context;
       Added   : Natural;
       Removed : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Net_Change_Label (Added => Added, Removed => Removed);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.net_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Added = Removed then "none" elsif Added > Removed then "up"
        else "down"));
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer ((if Added >= Removed then Added - Removed else
        Removed - Added)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Net_Change_Label;

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

   function Numeric_Field_Change_Label
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : Long_Float;
       New_Value  : Long_Float;
       Unit       : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Numeric_Field_Change_Label
          (Field_Name => Field_Name,
           Old_Value => Old_Value,
           New_Value => New_Value,
           Unit => Unit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.numeric_field_change_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if New_Value > Old_Value then "up" elsif New_Value < Old_Value
        then "down" else "same"));
      Selection := Sel.With_Arg (Selection, "field_name", Humanize.Bounded_Text.Clean (Field_Name));
      Selection := Sel.With_Arg (Selection, "new_value", Humanize.Label_Values.Plain_With_Unit (Context, New_Value,
        Unit));
      Selection := Sel.With_Arg (Selection, "old_value", Humanize.Label_Values.Plain_With_Unit (Context, Old_Value,
        Unit));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Numeric_Field_Change_Label;

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
      Selection := Sel.With_Arg (Selection, "lines_removed", Long_Long_Integer (Lines_Removed));
      Selection := Sel.With_Arg (Selection, "lines_added", Long_Long_Integer (Lines_Added));
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

   function Review_Progress_Label
      (Context  : Humanize.Contexts.Context;
       Reviewed : Natural;
       Total    : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Review_Progress_Label (Reviewed => Reviewed, Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.changes.review_progress_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Total = 0 then "none" elsif Reviewed = Total then "all" else
        "some"));
      Selection := Sel.With_Arg (Selection, "reviewed", Long_Long_Integer (Reviewed));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Review_Progress_Label;

   function Sync_Change_Label
      (Context    : Humanize.Contexts.Context;
       Uploaded   : Natural := 0;
       Downloaded : Natural := 0;
       Deleted    : Natural := 0;
       Conflicts  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Changes.Sync_Change_Label
          (Uploaded => Uploaded,
           Downloaded => Downloaded,
           Deleted => Deleted,
           Conflicts => Conflicts);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      if Uploaded = 0 and then Downloaded = 0 and then Deleted = 0 and then Conflicts = 0 then
         return Humanize.I18N_Rendering.Phrase_Or
           (Context, Sel.Phrase ("label.changes.sync_change_label.none"), English);
      end if;
      if Uploaded > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.sync_change_label.uploaded", Long_Long_Integer (Uploaded)));
      end if;
      if Downloaded > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.sync_change_label.downloaded", Long_Long_Integer (Downloaded)));
      end if;
      if Deleted > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.sync_change_label.deleted", Long_Long_Integer (Deleted)));
      end if;
      if Conflicts > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.changes.sync_change_label.conflicts", Long_Long_Integer (Conflicts)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Sync_Change_Label;

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
        (Boolean_Field_Change_Label (Context, Field_Name => Field_Name, Old_Value => Old_Value, New_Value =>
         New_Value),
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
      Humanize.Bounded_Text.Copy_Text (Change_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Change_Kind_Label_Into;

   procedure Change_Set_Label_Into
      (Context   : Humanize.Contexts.Context;
       Added     : Natural := 0;
       Removed   : Natural := 0;
       Modified  : Natural := 0;
       Unchanged : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Change_Set_Label (Context, Added => Added, Removed => Removed, Modified => Modified, Unchanged => Unchanged),
         Target, Written, Status);
   end Change_Set_Label_Into;

   procedure Change_Severity_Label_Into
      (Context  : Humanize.Contexts.Context;
       Severity : Change_Severity;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Change_Severity_Label (Context, Severity => Severity),
         Target, Written, Status);
   end Change_Severity_Label_Into;

   procedure Change_Summary_Label_Into
      (Context   : Humanize.Contexts.Context;
       Total     : Natural;
       Added     : Natural := 0;
       Removed   : Natural := 0;
       Modified  : Natural := 0;
       Renamed   : Natural := 0;
       Unchanged : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Change_Summary_Label (Context, Total => Total, Added => Added, Removed => Removed, Modified => Modified,
         Renamed => Renamed, Unchanged => Unchanged),
         Target, Written, Status);
   end Change_Summary_Label_Into;

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
        (Collection_Field_Change_Label (Context, Field_Name => Field_Name, Added => Added, Removed => Removed,
         Unchanged => Unchanged),
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
      Humanize.Bounded_Text.Copy_Text (Conflict_Label (Context, Count => Count), Target, Written, Status);
   end Conflict_Label_Into;

   procedure Conflict_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Options : Change_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Conflict_Label (Context, Count => Count, Options => Options),
         Target, Written, Status);
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
        (Date_Field_Change_Label (Context, Field_Name => Field_Name, Old_Label => Old_Label, New_Label => New_Label,
         Earlier => Earlier),
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
        (Duration_Field_Change_Label (Context, Field_Name => Field_Name, Old_Label => Old_Label, New_Label =>
         New_Label),
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
        (Field_Change_Label (Context, Field_Name => Field_Name, Old_Value => Old_Value, New_Value => New_Value),
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
      Humanize.Bounded_Text.Copy_Text
        (Item_Change_Label (Context, Name => Name, Kind => Kind),
         Target, Written, Status);
   end Item_Change_Label_Into;

   procedure Item_Change_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Kind    : Change_Kind;
       Options : Change_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Item_Change_Label (Context, Name => Name, Kind => Kind, Options => Options),
         Target, Written, Status);
   end Item_Change_Label_Into;

   procedure Metadata_Only_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Metadata_Only_Label (Context, Count => Count), Target, Written, Status);
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
      Humanize.Bounded_Text.Copy_Text
        (Move_Label (Context, Name => Name, From => From, To => To),
         Target, Written, Status);
   end Move_Label_Into;

   procedure Net_Change_Label_Into
      (Context : Humanize.Contexts.Context;
       Added   : Natural;
       Removed : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Net_Change_Label (Context, Added => Added, Removed => Removed),
         Target, Written, Status);
   end Net_Change_Label_Into;

   procedure No_Changes_Label_Into
      (Context : Humanize.Contexts.Context;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (No_Changes_Label (Context), Target, Written, Status);
   end No_Changes_Label_Into;

   procedure Numeric_Field_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Field_Name : String;
       Old_Value  : Long_Float;
       New_Value  : Long_Float;
       Unit       : String := "";
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Numeric_Field_Change_Label (Context, Field_Name => Field_Name, Old_Value => Old_Value, New_Value =>
         New_Value, Unit => Unit),
         Target, Written, Status);
   end Numeric_Field_Change_Label_Into;

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
        (Patch_Size_Label (Context, Lines_Added => Lines_Added, Lines_Removed => Lines_Removed),
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
      Humanize.Bounded_Text.Copy_Text
        (Rename_Label (Context, Old_Name => Old_Name, New_Name => New_Name),
         Target, Written, Status);
   end Rename_Label_Into;

   procedure Review_Progress_Label_Into
      (Context  : Humanize.Contexts.Context;
       Reviewed : Natural;
       Total    : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Review_Progress_Label (Context, Reviewed => Reviewed, Total => Total),
         Target, Written, Status);
   end Review_Progress_Label_Into;

   procedure Sync_Change_Label_Into
      (Context    : Humanize.Contexts.Context;
       Uploaded   : Natural := 0;
       Downloaded : Natural := 0;
       Deleted    : Natural := 0;
       Conflicts  : Natural := 0;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Sync_Change_Label (Context, Uploaded => Uploaded, Downloaded => Downloaded, Deleted => Deleted, Conflicts =>
         Conflicts),
         Target, Written, Status);
   end Sync_Change_Label_Into;

end Humanize.Changes.Localized;
