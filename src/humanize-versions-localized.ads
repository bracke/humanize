with Humanize.Contexts;

--  Versions labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Versions.Localized is

   function Commit_Distance_Label
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Ahead As for the parent's Commit_Distance_Label.
   --  @param Behind As for the parent's Commit_Distance_Label.
   --  @return The label in Context's locale.

   procedure Commit_Distance_Label_Into
      (Context : Humanize.Contexts.Context;
       Ahead   : Natural;
       Behind  : Natural;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Ahead As for the parent's Commit_Distance_Label.
   --  @param Behind As for the parent's Commit_Distance_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Versions.Localized;
