with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Markup.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Accessibility_Issue_Label
      (Context : Humanize.Contexts.Context;
       Target  : String;
       Issue   : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Accessibility_Issue_Label (Target => Target, Issue => Issue);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.accessibility_issue_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issue", Lower (Accessibility_Issue_Kind'Image (Issue)));
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Accessibility_Issue_Label;

   function Accessibility_Page_Summary_Label
      (Context   : Humanize.Contexts.Context;
       Title     : String;
       Landmarks : Natural := 0;
       Headings  : Natural := 0;
       Issues    : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Accessibility_Page_Summary_Label
          (Title => Title,
           Landmarks => Landmarks,
           Headings => Headings,
           Issues => Issues);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.accessibility_page_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "landmarks", Long_Long_Integer (Landmarks));
      Selection := Sel.With_Arg (Selection, "headings", Long_Long_Integer (Headings));
      Selection := Sel.With_Arg (Selection, "issues", Long_Long_Integer (Issues));
      Selection := Sel.With_Arg (Selection, "title", Humanize.Bounded_Text.Clean (Title));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Accessibility_Page_Summary_Label;

   function Accessibility_Remediation_Label
      (Context : Humanize.Contexts.Context;
       Issue   : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Accessibility_Remediation_Label (Issue => Issue);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.accessibility_remediation_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issue", Lower (Accessibility_Issue_Kind'Image (Issue)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Accessibility_Remediation_Label;

   function Accessibility_Summary_Label
      (Context : Humanize.Contexts.Context;
       Issues  : Natural;
       Target  : String := "document")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Accessibility_Summary_Label (Issues => Issues, Target => Target);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.accessibility_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "issues", Long_Long_Integer (Issues));
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Accessibility_Summary_Label;

   function Accessible_Control_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Role    : Accessible_Control_Role;
       State   : Accessible_Control_State := (others => <>))
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Accessible_Control_Label (Name => Name, Role => Role, State => State);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         Control : constant Humanize.Status.Text_Result := Humanize.I18N_Rendering.Render (Context, Sel.With_Arg
           (Sel.With_Arg (Sel.With_Arg (Sel.Phrase ("label.markup.accessible_control_label.control"), "named", (if
           Humanize.Bounded_Text.Clean (Name) = "" then "no" else "yes")), "name", Humanize.Bounded_Text.Clean
           (Name)), "role", Lower (Accessible_Control_Role'Image (Role))));
      begin
         if State.Selected then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.Phrase
              ("label.markup.accessible_control_label.selected")));
         end if;
         if State.Expanded then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.Phrase
              ("label.markup.accessible_control_label.expanded")));
         end if;
         if State.Current then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.Phrase
              ("label.markup.accessible_control_label.current")));
         end if;
         if State.Disabled then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.Phrase
              ("label.markup.accessible_control_label.disabled")));
         end if;
         if State.Required then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.Phrase
              ("label.markup.accessible_control_label.required")));
         end if;
         if State.Invalid then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.Phrase
              ("label.markup.accessible_control_label.invalid")));
         end if;
         if State.Count > 0 then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.With_Arg
              (Sel.Phrase ("label.markup.accessible_control_label.count"), "count", Long_Long_Integer
              (State.Count))));
         end if;
         if State.Position > 0 and then State.Total > 0 then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.With_Arg
              (Sel.With_Arg (Sel.Phrase ("label.markup.accessible_control_label.position"), "position",
              Long_Long_Integer (State.Position)), "total", Long_Long_Integer (State.Total))));
         end if;
         if State.Issues > 0 then
            Text := Humanize.Label_Values.Join (Context, Text, Humanize.I18N_Rendering.Render (Context, Sel.With_Arg
              (Sel.Phrase ("label.markup.accessible_control_label.issues"), "count", Long_Long_Integer
              (State.Issues))));
         end if;
         if Control.Status /= Humanize.Status.Ok or else Text.Status /= Humanize.Status.Ok then
            return English;
         elsif Humanize.Label_Values.Text_Of (Text) = "" then
            return Humanize.Label_Values.Localized_Or (Context, Control, English);
         end if;
         return Humanize.Label_Values.Localized_Or (Context, Humanize.I18N_Rendering.Render (Context, Sel.With_Arg
           (Sel.With_Arg (Sel.Phrase ("label.markup.accessible_control_label.with_states"), "control",
           Humanize.Label_Values.Text_Of (Control)), "states", Humanize.Label_Values.Text_Of (Text))), English);
      end;
   end Accessible_Control_Label;

   function Attribute_Count_Label
      (Context : Humanize.Contexts.Context;
       Total   : Natural;
       Data    : Natural := 0;
       Aria    : Natural := 0;
       Events  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Attribute_Count_Label (Total => Total, Data => Data, Aria => Aria, Events => Events);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
        "label.markup.attribute_count_label.total", Long_Long_Integer (Total)));
      if Data > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.attribute_count_label.data", Long_Long_Integer (Data)));
      end if;
      if Aria > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.attribute_count_label.aria", Long_Long_Integer (Aria)));
      end if;
      if Events > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.attribute_count_label.events", Long_Long_Integer (Events)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Attribute_Count_Label;

   function Attribute_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Attribute_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Attribute_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.attribute_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Attribute_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attribute_Kind_Label;

   function Attribute_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Attribute_Label (Name => Name, Value => Value);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.attribute_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "state", (if Value'Length = 0 then "bare" elsif Attribute_Kind_For
        (Humanize.Bounded_Text.Clean_Lower_Text (Name)) = Event_Attribute then "event" else "value"));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean_Lower_Text (Name));
      Selection := Sel.With_Arg (Selection, "value", Value);
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Attribute_Label;

   function Attribute_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Options : Markup_Label_Options;
       Value   : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Attribute_Label (Name => Name, Options => Options, Value => Value);
      Plain_English : constant Humanize.Status.Text_Result :=
        Markup.Attribute_Label (Name => Name, Value => Value);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Attribute_Label (Context, Name => Name, Value =>
        Value));
   end Attribute_Label;

   function Content_Type_Label
      (Context      : Humanize.Contexts.Context;
       Content_Type : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Content_Type_Label (Content_Type => Content_Type);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.content_type_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Base : constant String := Humanize.Label_Values.Before (Humanize.Label_Values.Value_After (E, " ("), ")");
         D_Kind : constant String := Lower (Mime_Kind'Image (Mime_Kind_For (Content_Type)));
      begin
         Selection := Sel.With_Arg (Selection, "kind", D_Kind);
         Selection := Sel.With_Arg (Selection, "base", D_Base);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Content_Type_Label;

   function Content_Type_Label
      (Context      : Humanize.Contexts.Context;
       Content_Type : String;
       Options      : Markup_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Content_Type_Label (Content_Type => Content_Type, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Markup.Content_Type_Label (Content_Type => Content_Type);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Content_Type_Label (Context, Content_Type =>
        Content_Type));
   end Content_Type_Label;

   function Document_Outline_Label
      (Context   : Humanize.Contexts.Context;
       Headings  : Natural;
       Landmarks : Natural;
       Forms     : Natural := 0;
       Media     : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Document_Outline_Label
          (Headings => Headings,
           Landmarks => Landmarks,
           Forms => Forms,
           Media => Media);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
        "label.markup.document_outline_label.headings", Long_Long_Integer (Headings)));
      Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
        "label.markup.document_outline_label.landmarks", Long_Long_Integer (Landmarks)));
      if Forms > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.document_outline_label.forms", Long_Long_Integer (Forms)));
      end if;
      if Media > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.document_outline_label.media", Long_Long_Integer (Media)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Document_Outline_Label;

   function Form_Error_Summary_Label
      (Context   : Humanize.Contexts.Context;
       Form_Name : String;
       Errors    : Natural;
       Warnings  : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Form_Error_Summary_Label (Form_Name => Form_Name, Errors => Errors, Warnings => Warnings);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.form_error_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "warnings", Long_Long_Integer (Warnings));
      Selection := Sel.With_Arg (Selection, "errors", Long_Long_Integer (Errors));
      Selection := Sel.With_Arg (Selection, "form_name", Humanize.Bounded_Text.Clean (Form_Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Form_Error_Summary_Label;

   function Heading_Label
      (Context : Humanize.Contexts.Context;
       Level   : Positive)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Heading_Label (Level => Level);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.heading_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "level", Long_Long_Integer (Level));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Heading_Label;

   function Landmark_Label
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Landmark_Label (Role => Role);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.landmark_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "role", Lower (Landmark_Role'Image (Role)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Landmark_Label;

   function Landmark_Label
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role;
       Options : Markup_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Landmark_Label (Role => Role, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Markup.Landmark_Label (Role => Role);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Landmark_Label (Context, Role => Role));
   end Landmark_Label;

   function Live_Region_Update_Label
      (Context : Humanize.Contexts.Context;
       Region  : String;
       Update  : String;
       Polite  : Boolean := True)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Live_Region_Update_Label (Region => Region, Update => Update, Polite => Polite);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.live_region_update_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "polite", Lower (Boolean'Image (Polite)));
      Selection := Sel.With_Arg (Selection, "region", Humanize.Bounded_Text.Clean (Region));
      Selection := Sel.With_Arg (Selection, "update", Humanize.Bounded_Text.Clean (Update));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Live_Region_Update_Label;

   function Mime_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Mime_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Mime_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.mime_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Mime_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Mime_Kind_Label;

   function Table_Navigation_Label
      (Context : Humanize.Contexts.Context;
       Caption : String;
       Row     : Positive;
       Column  : Positive;
       Rows    : Positive;
       Columns : Positive)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Table_Navigation_Label
          (Caption => Caption,
           Row => Row,
           Column => Column,
           Rows => Rows,
           Columns => Columns);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.table_navigation_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "caption", Humanize.Bounded_Text.Clean (Caption));
      Selection := Sel.With_Arg (Selection, "row", Long_Long_Integer (Row));
      Selection := Sel.With_Arg (Selection, "rows", Long_Long_Integer (Rows));
      Selection := Sel.With_Arg (Selection, "column", Long_Long_Integer (Column));
      Selection := Sel.With_Arg (Selection, "columns", Long_Long_Integer (Columns));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Table_Navigation_Label;

   function Tag_Count_Label
      (Context : Humanize.Contexts.Context;
       Total   : Natural;
       Links   : Natural := 0;
       Media   : Natural := 0;
       Forms   : Natural := 0)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Tag_Count_Label (Total => Total, Links => Links, Media => Media, Forms => Forms);
      Text : Humanize.Status.Text_Result := Humanize.Label_Values.Nothing;
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
        "label.markup.tag_count_label.total", Long_Long_Integer (Total)));
      if Links > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.tag_count_label.links", Long_Long_Integer (Links)));
      end if;
      if Media > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.tag_count_label.media", Long_Long_Integer (Media)));
      end if;
      if Forms > 0 then
         Text := Humanize.Label_Values.Join (Context, Text, Humanize.Label_Values.Count_Part (Context,
           "label.markup.tag_count_label.forms", Long_Long_Integer (Forms)));
      end if;
      return Humanize.Label_Values.Localized_Or (Context, Text, English);
   end Tag_Count_Label;

   function Tag_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Tag_Kind)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Tag_Kind_Label (Kind => Kind);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.tag_kind_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "kind", Lower (Tag_Kind'Image (Kind)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Tag_Kind_Label;

   function Tag_Label
      (Context : Humanize.Contexts.Context;
       Name    : String)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Tag_Label (Name => Name);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.markup.tag_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      declare
         E : constant String := Humanize.Label_Values.Text_Of (English);
         D_Name : constant String := Humanize.Label_Values.Before (E, " tag");
         D_Tag : constant String := Humanize.Label_Values.Shape_Slug (D_Name);
         D_Level : constant Long_Long_Integer := Humanize.Label_Values.Leading_Count
           (Humanize.Label_Values.Value_After (D_Name, "heading level "));
      begin
         Selection := Sel.With_Arg (Selection, "tag", D_Tag);
         Selection := Sel.With_Arg (Selection, "level", D_Level);
         Selection := Sel.With_Arg (Selection, "name", D_Name);
         return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
      end;
   end Tag_Label;

   function Tag_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Options : Markup_Label_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Markup.Tag_Label (Name => Name, Options => Options);
      Plain_English : constant Humanize.Status.Text_Result :=
        Markup.Tag_Label (Name => Name);
   begin
      return Humanize.Label_Values.Decorated (English, Plain_English, Tag_Label (Context, Name => Name));
   end Tag_Label;

   procedure Accessibility_Page_Summary_Label_Into
      (Context   : Humanize.Contexts.Context;
       Title     : String;
       Landmarks : Natural := 0;
       Headings  : Natural := 0;
       Issues    : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Accessibility_Page_Summary_Label (Context, Title => Title, Landmarks => Landmarks, Headings => Headings,
         Issues => Issues),
         Target, Written, Status);
   end Accessibility_Page_Summary_Label_Into;

   procedure Accessibility_Remediation_Label_Into
      (Context : Humanize.Contexts.Context;
       Issue   : Accessibility_Issue_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Accessibility_Remediation_Label (Context, Issue => Issue),
         Target, Written, Status);
   end Accessibility_Remediation_Label_Into;

   procedure Accessible_Control_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Role    : Accessible_Control_Role;
       State   : Accessible_Control_State := (others => <>);
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Accessible_Control_Label (Context, Name => Name, Role => Role, State => State),
         Target, Written, Status);
   end Accessible_Control_Label_Into;

   procedure Attribute_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Total   : Natural;
       Data    : Natural := 0;
       Aria    : Natural := 0;
       Events  : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Attribute_Count_Label (Context, Total => Total, Data => Data, Aria => Aria, Events => Events),
         Target, Written, Status);
   end Attribute_Count_Label_Into;

   procedure Attribute_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Attribute_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attribute_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Attribute_Kind_Label_Into;

   procedure Attribute_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Value   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Attribute_Label (Context, Name => Name, Value => Value),
         Target, Written, Status);
   end Attribute_Label_Into;

   procedure Attribute_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Options : Markup_Label_Options;
       Value   : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Attribute_Label (Context, Name => Name, Options => Options, Value => Value),
         Target, Written, Status);
   end Attribute_Label_Into;

   procedure Content_Type_Label_Into
      (Context      : Humanize.Contexts.Context;
       Content_Type : String;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Content_Type_Label (Context, Content_Type => Content_Type),
         Target, Written, Status);
   end Content_Type_Label_Into;

   procedure Content_Type_Label_Into
      (Context      : Humanize.Contexts.Context;
       Content_Type : String;
       Options      : Markup_Label_Options;
       Target       : in out String;
       Written      : out Natural;
       Status       : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Content_Type_Label (Context, Content_Type => Content_Type, Options => Options),
         Target, Written, Status);
   end Content_Type_Label_Into;

   procedure Document_Outline_Label_Into
      (Context   : Humanize.Contexts.Context;
       Headings  : Natural;
       Landmarks : Natural;
       Forms     : Natural := 0;
       Media     : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Document_Outline_Label (Context, Headings => Headings, Landmarks => Landmarks, Forms => Forms, Media =>
         Media),
         Target, Written, Status);
   end Document_Outline_Label_Into;

   procedure Form_Error_Summary_Label_Into
      (Context   : Humanize.Contexts.Context;
       Form_Name : String;
       Errors    : Natural;
       Warnings  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Form_Error_Summary_Label (Context, Form_Name => Form_Name, Errors => Errors, Warnings => Warnings),
         Target, Written, Status);
   end Form_Error_Summary_Label_Into;

   procedure Heading_Label_Into
      (Context : Humanize.Contexts.Context;
       Level   : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Heading_Label (Context, Level => Level), Target, Written, Status);
   end Heading_Label_Into;

   procedure Landmark_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Landmark_Label (Context, Role => Role), Target, Written, Status);
   end Landmark_Label_Into;

   procedure Landmark_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role;
       Options : Markup_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Landmark_Label (Context, Role => Role, Options => Options),
         Target, Written, Status);
   end Landmark_Label_Into;

   procedure Live_Region_Update_Label_Into
      (Context : Humanize.Contexts.Context;
       Region  : String;
       Update  : String;
       Polite  : Boolean := True;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Live_Region_Update_Label (Context, Region => Region, Update => Update, Polite => Polite),
         Target, Written, Status);
   end Live_Region_Update_Label_Into;

   procedure Mime_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Mime_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Mime_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Mime_Kind_Label_Into;

   procedure Table_Navigation_Label_Into
      (Context : Humanize.Contexts.Context;
       Caption : String;
       Row     : Positive;
       Column  : Positive;
       Rows    : Positive;
       Columns : Positive;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Table_Navigation_Label (Context, Caption => Caption, Row => Row, Column => Column, Rows => Rows, Columns =>
         Columns),
         Target, Written, Status);
   end Table_Navigation_Label_Into;

   procedure Tag_Count_Label_Into
      (Context : Humanize.Contexts.Context;
       Total   : Natural;
       Links   : Natural := 0;
       Media   : Natural := 0;
       Forms   : Natural := 0;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Tag_Count_Label (Context, Total => Total, Links => Links, Media => Media, Forms => Forms),
         Target, Written, Status);
   end Tag_Count_Label_Into;

   procedure Tag_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Tag_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Tag_Kind_Label (Context, Kind => Kind), Target, Written, Status);
   end Tag_Kind_Label_Into;

   procedure Tag_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Tag_Label (Context, Name => Name), Target, Written, Status);
   end Tag_Label_Into;

   procedure Tag_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Options : Markup_Label_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Tag_Label (Context, Name => Name, Options => Options),
         Target, Written, Status);
   end Tag_Label_Into;

end Humanize.Markup.Localized;
