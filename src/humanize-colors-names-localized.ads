with Humanize.Contexts;

--  Names labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"): each
--  is the parent's function of the same name with a Context first, and that function itself in English, where the
--  locale has no translation, and for every input the parent rejects.
package Humanize.Colors.Names.Localized is

   function Chroma_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Chroma_Label.
   --  @return The label in Context's locale.

   function Color_Description
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Color_Description.
   --  @return The label in Context's locale.

   function Descriptive_Color_Name
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Descriptive_Color_Name.
   --  @return The label in Context's locale.

   function Hue_Family_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Hue_Family_Label.
   --  @return The label in Context's locale.

   function Nearest_Color_Name
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Nearest_Color_Name.
   --  @return The label in Context's locale.

   function Saturation_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Saturation_Label.
   --  @return The label in Context's locale.

   function Temperature_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Temperature_Label.
   --  @return The label in Context's locale.

   procedure Chroma_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Chroma_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Description_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Color_Description.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Descriptive_Color_Name_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Descriptive_Color_Name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Hue_Family_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Hue_Family_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Nearest_Color_Name_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Nearest_Color_Name.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Saturation_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Saturation_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Temperature_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Temperature_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Colors.Names.Localized;
