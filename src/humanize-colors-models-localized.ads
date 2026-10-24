with Humanize.Contexts;

--  Models labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Colors.Models.Localized is

   function Brightness_Label
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Color As for the parent's Brightness_Label.
   --  @return The label in Context's locale.

   function Color_Difference_Label
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Left As for the parent's Color_Difference_Label.
   --  @param Right As for the parent's Color_Difference_Label.
   --  @return The label in Context's locale.

   function Perceptual_Difference_Label
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Left As for the parent's Perceptual_Difference_Label.
   --  @param Right As for the parent's Perceptual_Difference_Label.
   --  @return The label in Context's locale.

   function Perceptual_Difference_Label
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Method  : Perceptual_Difference_Method)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Left As for the parent's Perceptual_Difference_Label.
   --  @param Right As for the parent's Perceptual_Difference_Label.
   --  @param Method As for the parent's Perceptual_Difference_Label.
   --  @return The label in Context's locale.

   procedure Brightness_Label_Into
      (Context : Humanize.Contexts.Context;
       Color   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Color As for the parent's Brightness_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Difference_Label_Into
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Left As for the parent's Color_Difference_Label.
   --  @param Right As for the parent's Color_Difference_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Perceptual_Difference_Label_Into
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Left As for the parent's Perceptual_Difference_Label.
   --  @param Right As for the parent's Perceptual_Difference_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Perceptual_Difference_Label_Into
      (Context : Humanize.Contexts.Context;
       Left    : RGB_Color;
       Right   : RGB_Color;
       Method  : Perceptual_Difference_Method;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Left As for the parent's Perceptual_Difference_Label.
   --  @param Right As for the parent's Perceptual_Difference_Label.
   --  @param Method As for the parent's Perceptual_Difference_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Colors.Models.Localized;
