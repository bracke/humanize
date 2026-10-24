with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
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
      Selection := Sel.With_Arg (Selection, "target", Humanize.Bounded_Text.Clean (Target));
      Selection := Sel.With_Arg (Selection, "issue", Lower (Accessibility_Issue_Kind'Image (Issue)));
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
      Selection := Sel.With_Arg (Selection, "title", Humanize.Bounded_Text.Clean (Title));
      Selection := Sel.With_Arg (Selection, "landmarks", Long_Long_Integer (Landmarks));
      Selection := Sel.With_Arg (Selection, "headings", Long_Long_Integer (Headings));
      Selection := Sel.With_Arg (Selection, "issues", Long_Long_Integer (Issues));
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
      Selection := Sel.With_Arg (Selection, "form_name", Humanize.Bounded_Text.Clean (Form_Name));
      Selection := Sel.With_Arg (Selection, "errors", Long_Long_Integer (Errors));
      Selection := Sel.With_Arg (Selection, "warnings", Long_Long_Integer (Warnings));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Form_Error_Summary_Label;

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
      Selection := Sel.With_Arg (Selection, "region", Humanize.Bounded_Text.Clean (Region));
      Selection := Sel.With_Arg (Selection, "update", Humanize.Bounded_Text.Clean (Update));
      Selection := Sel.With_Arg (Selection, "polite", Lower (Boolean'Image (Polite)));
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
        (Accessibility_Page_Summary_Label (Context, Title, Landmarks, Headings, Issues),
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
      Humanize.Bounded_Text.Copy_Text (Accessibility_Remediation_Label (Context, Issue), Target, Written, Status);
   end Accessibility_Remediation_Label_Into;

   procedure Attribute_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Attribute_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Attribute_Kind_Label (Context, Kind), Target, Written, Status);
   end Attribute_Kind_Label_Into;

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
        (Form_Error_Summary_Label (Context, Form_Name, Errors, Warnings),
         Target, Written, Status);
   end Form_Error_Summary_Label_Into;

   procedure Landmark_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Landmark_Label (Context, Role), Target, Written, Status);
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
        (Live_Region_Update_Label (Context, Region, Update, Polite),
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
      Humanize.Bounded_Text.Copy_Text (Mime_Kind_Label (Context, Kind), Target, Written, Status);
   end Mime_Kind_Label_Into;

   procedure Tag_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Tag_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Tag_Kind_Label (Context, Kind), Target, Written, Status);
   end Tag_Kind_Label_Into;

end Humanize.Markup.Localized;
