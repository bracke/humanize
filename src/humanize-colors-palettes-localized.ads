with Humanize.Contexts;

--  Palettes labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Colors.Palettes.Localized is

   function Advanced_Palette_Summary
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Advanced_Palette_Summary.
   --  @return The label in Context's locale.

   function Palette_Accessibility_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Accessibility_Label.
   --  @return The label in Context's locale.

   function Palette_Contrast_Matrix_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Contrast_Matrix_Label.
   --  @return The label in Context's locale.

   function Palette_Contrast_Suggestion
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Contrast_Suggestion.
   --  @return The label in Context's locale.

   function Palette_Harmony_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Harmony_Label.
   --  @return The label in Context's locale.

   function Palette_Metadata_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Metadata_Label.
   --  @return The label in Context's locale.

   function Palette_Mood_Label
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Mood_Label.
   --  @return The label in Context's locale.

   function Palette_Roles
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Roles.
   --  @return The label in Context's locale.

   function Palette_Summary
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Summary.
   --  @return The label in Context's locale.

   procedure Advanced_Palette_Summary_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Advanced_Palette_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Accessibility_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Accessibility_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Contrast_Matrix_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Contrast_Matrix_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Contrast_Suggestion_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Contrast_Suggestion.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Harmony_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Harmony_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Metadata_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Metadata_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Mood_Label_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Mood_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Roles_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Roles.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Palette_Summary_Into
      (Context : Humanize.Contexts.Context;
       Colors  : Color_List;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Colors As for the parent's Palette_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Colors.Palettes.Localized;
