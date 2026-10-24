with Humanize.Contexts;

--  Markup labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Markup.Localized is

   function Accessibility_Issue_Label
      (Context : Humanize.Contexts.Context;
       Target  : String;
       Issue   : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Target As for the parent's Accessibility_Issue_Label.
   --  @param Issue As for the parent's Accessibility_Issue_Label.
   --  @return The label in Context's locale.

   function Accessibility_Page_Summary_Label
      (Context   : Humanize.Contexts.Context;
       Title     : String;
       Landmarks : Natural := 0;
       Headings  : Natural := 0;
       Issues    : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Title As for the parent's Accessibility_Page_Summary_Label.
   --  @param Landmarks As for the parent's Accessibility_Page_Summary_Label.
   --  @param Headings As for the parent's Accessibility_Page_Summary_Label.
   --  @param Issues As for the parent's Accessibility_Page_Summary_Label.
   --  @return The label in Context's locale.

   function Accessibility_Remediation_Label
      (Context : Humanize.Contexts.Context;
       Issue   : Accessibility_Issue_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Issue As for the parent's Accessibility_Remediation_Label.
   --  @return The label in Context's locale.

   function Accessibility_Summary_Label
      (Context : Humanize.Contexts.Context;
       Issues  : Natural;
       Target  : String := "document")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Issues As for the parent's Accessibility_Summary_Label.
   --  @param Target As for the parent's Accessibility_Summary_Label.
   --  @return The label in Context's locale.

   function Attribute_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Attribute_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Attribute_Kind_Label.
   --  @return The label in Context's locale.

   function Form_Error_Summary_Label
      (Context   : Humanize.Contexts.Context;
       Form_Name : String;
       Errors    : Natural;
       Warnings  : Natural := 0)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Form_Name As for the parent's Form_Error_Summary_Label.
   --  @param Errors As for the parent's Form_Error_Summary_Label.
   --  @param Warnings As for the parent's Form_Error_Summary_Label.
   --  @return The label in Context's locale.

   function Landmark_Label
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Role As for the parent's Landmark_Label.
   --  @return The label in Context's locale.

   function Live_Region_Update_Label
      (Context : Humanize.Contexts.Context;
       Region  : String;
       Update  : String;
       Polite  : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Region As for the parent's Live_Region_Update_Label.
   --  @param Update As for the parent's Live_Region_Update_Label.
   --  @param Polite As for the parent's Live_Region_Update_Label.
   --  @return The label in Context's locale.

   function Mime_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Mime_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Mime_Kind_Label.
   --  @return The label in Context's locale.

   function Tag_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Tag_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Tag_Kind_Label.
   --  @return The label in Context's locale.

   procedure Accessibility_Page_Summary_Label_Into
      (Context   : Humanize.Contexts.Context;
       Title     : String;
       Landmarks : Natural := 0;
       Headings  : Natural := 0;
       Issues    : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Title As for the parent's Accessibility_Page_Summary_Label.
   --  @param Landmarks As for the parent's Accessibility_Page_Summary_Label.
   --  @param Headings As for the parent's Accessibility_Page_Summary_Label.
   --  @param Issues As for the parent's Accessibility_Page_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Accessibility_Remediation_Label_Into
      (Context : Humanize.Contexts.Context;
       Issue   : Accessibility_Issue_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Issue As for the parent's Accessibility_Remediation_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Attribute_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Attribute_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Attribute_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Form_Error_Summary_Label_Into
      (Context   : Humanize.Contexts.Context;
       Form_Name : String;
       Errors    : Natural;
       Warnings  : Natural := 0;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Form_Name As for the parent's Form_Error_Summary_Label.
   --  @param Errors As for the parent's Form_Error_Summary_Label.
   --  @param Warnings As for the parent's Form_Error_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Landmark_Label_Into
      (Context : Humanize.Contexts.Context;
       Role    : Landmark_Role;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Role As for the parent's Landmark_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Live_Region_Update_Label_Into
      (Context : Humanize.Contexts.Context;
       Region  : String;
       Update  : String;
       Polite  : Boolean := True;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Region As for the parent's Live_Region_Update_Label.
   --  @param Update As for the parent's Live_Region_Update_Label.
   --  @param Polite As for the parent's Live_Region_Update_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Mime_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Mime_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Mime_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tag_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Tag_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Tag_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Markup.Localized;
