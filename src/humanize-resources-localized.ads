with Humanize.Contexts;

--  Resources labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Resources.Localized is

   function Utilization_Band_Label
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Band As for the parent's Utilization_Band_Label.
   --  @return The label in Context's locale.

   procedure Utilization_Band_Label_Into
      (Context : Humanize.Contexts.Context;
       Band    : Utilization_Band;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Band As for the parent's Utilization_Band_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Resources.Localized;
