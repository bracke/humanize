with Humanize.Contexts;

--  Metrics labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Strings.Metrics.Localized is

   function Paragraph_Count_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Paragraph_Count_Summary.
   --  @return The label in Context's locale.

   function Reading_Time
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Reading_Time.
   --  @param Options As for the parent's Reading_Time.
   --  @return The label in Context's locale.

   function Sentence_Count_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Sentence_Count_Summary.
   --  @return The label in Context's locale.

   function Speaking_Time
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Speaking_Time.
   --  @param Options As for the parent's Speaking_Time.
   --  @return The label in Context's locale.

   function Text_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Options := Default_Text_Summary_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Text_Summary.
   --  @param Options As for the parent's Text_Summary.
   --  @return The label in Context's locale.

   function Text_Summary_With_Options
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Composition_Options := Default_Text_Summary_Composition_Options)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Text_Summary_With_Options.
   --  @param Options As for the parent's Text_Summary_With_Options.
   --  @return The label in Context's locale.

   function Word_Count_Summary
      (Context : Humanize.Contexts.Context;
       Text    : String)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Text As for the parent's Word_Count_Summary.
   --  @return The label in Context's locale.

   procedure Paragraph_Count_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Paragraph_Count_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Reading_Time_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Reading_Time.
   --  @param Options As for the parent's Reading_Time.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Sentence_Count_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Sentence_Count_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Speaking_Time_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Time_Options := Default_Text_Time_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Speaking_Time.
   --  @param Options As for the parent's Speaking_Time.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Text_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Options := Default_Text_Summary_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Text_Summary.
   --  @param Options As for the parent's Text_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Text_Summary_With_Options_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Options : Text_Summary_Composition_Options := Default_Text_Summary_Composition_Options;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Text_Summary_With_Options.
   --  @param Options As for the parent's Text_Summary_With_Options.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Word_Count_Summary_Into
      (Context : Humanize.Contexts.Context;
       Text    : String;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Text As for the parent's Word_Count_Summary.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Strings.Metrics.Localized;
