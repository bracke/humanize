--  Editorial number wording for prose, headlines, ages, measurements, and
--  percentages. These helpers keep deterministic AP-style text decisions
--  separate from scale, range, and spellout number helpers while the parent
--  `Humanize.Numbers` package remains the compatibility facade.
package Humanize.Numbers.Editorial is
   function Editorial_Number
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Number to render for prose or headline usage.
   --  @param Usage Editorial usage category.
   --  @param Options Spelling and grouping policy.
   --  @return Editorially formatted number label.

   procedure Editorial_Number_Into
     (Context : Humanize.Contexts.Context;
      Value   : Long_Long_Integer;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Usage   : Editorial_Number_Use := General_Number;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Number to render for prose or headline usage.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Usage Editorial usage category.
   --  @param Options Spelling and grouping policy.

   function Editorial_Ordinal
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Ordinal value to render.
   --  @param Options Spelling and grouping policy.
   --  @return Editorial ordinal label.

   procedure Editorial_Ordinal_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Options : Editorial_Number_Options :=
        Default_Editorial_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Ordinal value to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Options Spelling and grouping policy.

   function Editorial_Percent
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Percent value to render.
   --  @param Number_Style Fraction digit policy.
   --  @param Include_Symbol True to append a percent sign.
   --  @return Editorial percent label.

   procedure Editorial_Percent_Into
     (Context        : Humanize.Contexts.Context;
      Value          : Long_Float;
      Target         : in out String;
      Written        : out Natural;
      Status         : out Humanize.Status.Status_Code;
      Number_Style   : Number_Options := Default_Number_Options;
      Include_Symbol : Boolean := True);
   --  @param Context Formatting context.
   --  @param Value Percent value to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Number_Style Fraction digit policy.
   --  @param Include_Symbol True to append a percent sign.

   function Editorial_Measurement
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Number_Style : Number_Options := Default_Number_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Measurement value to render.
   --  @param Unit Caller-supplied unit text.
   --  @param Number_Style Fraction digit policy.
   --  @return Editorial measurement label.

   procedure Editorial_Measurement_Into
     (Context      : Humanize.Contexts.Context;
      Value        : Long_Float;
      Unit         : String;
      Target       : in out String;
      Written      : out Natural;
      Status       : out Humanize.Status.Status_Code;
      Number_Style : Number_Options := Default_Number_Options);
   --  @param Context Formatting context.
   --  @param Value Measurement value to render.
   --  @param Unit Caller-supplied unit text.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Number_Style Fraction digit policy.

   function Editorial_Age
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Unit    : String := "years old")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Value Age value to render.
   --  @param Unit Caller-supplied age unit text.
   --  @return Editorial age label.

   procedure Editorial_Age_Into
     (Context : Humanize.Contexts.Context;
      Value   : Natural;
      Target  : in out String;
      Written : out Natural;
      Status  : out Humanize.Status.Status_Code;
      Unit    : String := "years old");
   --  @param Context Formatting context.
   --  @param Value Age value to render.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.
   --  @param Unit Caller-supplied age unit text.
end Humanize.Numbers.Editorial;
