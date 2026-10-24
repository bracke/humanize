with Humanize.Contexts;

--  Endpoints labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Endpoints.Localized is

   function Host_Kind_Label
      (Context : Humanize.Contexts.Context;
       Kind    : Host_Kind)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Host_Kind_Label.
   --  @return The label in Context's locale.

   procedure Host_Kind_Label_Into
      (Context : Humanize.Contexts.Context;
       Kind    : Host_Kind;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Kind As for the parent's Host_Kind_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Endpoints.Localized;
