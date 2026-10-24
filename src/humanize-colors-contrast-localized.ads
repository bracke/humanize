with Humanize.Contexts;

--  Contrast labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Colors.Contrast.Localized is

   function APCA_Contrast_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's APCA_Contrast_Label.
   --  @param Background As for the parent's APCA_Contrast_Label.
   --  @return The label in Context's locale.

   function Alpha_Contrast_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Alpha      : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Alpha_Contrast_Label.
   --  @param Background As for the parent's Alpha_Contrast_Label.
   --  @param Alpha As for the parent's Alpha_Contrast_Label.
   --  @return The label in Context's locale.

   function Color_Accessibility_Summary
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Color_Accessibility_Summary.
   --  @param Background As for the parent's Color_Accessibility_Summary.
   --  @return The label in Context's locale.

   function Color_Vision_Deficiency_Label
      (Context    : Humanize.Contexts.Context;
       Left       : RGB_Color;
       Right      : RGB_Color;
       Deficiency : Color_Vision_Deficiency)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Left As for the parent's Color_Vision_Deficiency_Label.
   --  @param Right As for the parent's Color_Vision_Deficiency_Label.
   --  @param Deficiency As for the parent's Color_Vision_Deficiency_Label.
   --  @return The label in Context's locale.

   function Contrast_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Contrast_Label.
   --  @param Background As for the parent's Contrast_Label.
   --  @return The label in Context's locale.

   function Contrast_Remediation_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : Contrast_Target := Target_Normal_Text)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Contrast_Remediation_Label.
   --  @param Background As for the parent's Contrast_Remediation_Label.
   --  @param Target As for the parent's Contrast_Remediation_Label.
   --  @return The label in Context's locale.

   function Opacity_Label
      (Context : Humanize.Contexts.Context;
       Opacity : Long_Float)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Opacity As for the parent's Opacity_Label.
   --  @return The label in Context's locale.

   function Readability_Label
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Readability_Label.
   --  @param Background As for the parent's Readability_Label.
   --  @return The label in Context's locale.

   procedure APCA_Contrast_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's APCA_Contrast_Label.
   --  @param Background As for the parent's APCA_Contrast_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Alpha_Contrast_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Alpha      : Long_Float;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Alpha_Contrast_Label.
   --  @param Background As for the parent's Alpha_Contrast_Label.
   --  @param Alpha As for the parent's Alpha_Contrast_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Accessibility_Summary_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Color_Accessibility_Summary.
   --  @param Background As for the parent's Color_Accessibility_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Color_Vision_Deficiency_Label_Into
      (Context    : Humanize.Contexts.Context;
       Left       : RGB_Color;
       Right      : RGB_Color;
       Deficiency : Color_Vision_Deficiency;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Left As for the parent's Color_Vision_Deficiency_Label.
   --  @param Right As for the parent's Color_Vision_Deficiency_Label.
   --  @param Deficiency As for the parent's Color_Vision_Deficiency_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Contrast_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Contrast_Label.
   --  @param Background As for the parent's Contrast_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Opacity_Label_Into
      (Context : Humanize.Contexts.Context;
       Opacity : Long_Float;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Opacity As for the parent's Opacity_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Readability_Label_Into
      (Context    : Humanize.Contexts.Context;
       Foreground : RGB_Color;
       Background : RGB_Color;
       Target     : in out String;
       Written    : out Natural;
       Status     : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Foreground As for the parent's Readability_Label.
   --  @param Background As for the parent's Readability_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Colors.Contrast.Localized;
