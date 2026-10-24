with Humanize.Contexts;

--  Thresholds labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Thresholds.Localized is

   function Threshold_Direction_Label
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Direction As for the parent's Threshold_Direction_Label.
   --  @return The label in Context's locale.

   function Threshold_State_Label
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param State As for the parent's Threshold_State_Label.
   --  @return The label in Context's locale.

   procedure Threshold_Direction_Label_Into
      (Context   : Humanize.Contexts.Context;
       Direction : Threshold_Direction;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Direction As for the parent's Threshold_Direction_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Threshold_State_Label_Into
      (Context : Humanize.Contexts.Context;
       State   : Threshold_State;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param State As for the parent's Threshold_State_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Thresholds.Localized;
