with Humanize.Contexts;

--  Statistics labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain labels"):
--  each is the parent's function of the same name with a Context first, and that function itself in English, where
--  the locale has no translation, and for every input the parent rejects.
package Humanize.Numbers.Statistics.Localized is

   function Distribution_Summary_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Minimum : Long_Float;
       Median  : Long_Float;
       Maximum : Long_Float;
       Unit    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Count As for the parent's Distribution_Summary_Label.
   --  @param Minimum As for the parent's Distribution_Summary_Label.
   --  @param Median As for the parent's Distribution_Summary_Label.
   --  @param Maximum As for the parent's Distribution_Summary_Label.
   --  @param Unit As for the parent's Distribution_Summary_Label.
   --  @return The label in Context's locale.

   function Outlier_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Outliers : Natural;
       Total    : Natural)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Outliers As for the parent's Outlier_Summary_Label.
   --  @param Total As for the parent's Outlier_Summary_Label.
   --  @return The label in Context's locale.

   function Percentile_Summary_Label
      (Context : Humanize.Contexts.Context;
       P50     : Long_Float;
       P95     : Long_Float;
       P99     : Long_Float;
       Unit    : String := "")
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param P50 As for the parent's Percentile_Summary_Label.
   --  @param P95 As for the parent's Percentile_Summary_Label.
   --  @param P99 As for the parent's Percentile_Summary_Label.
   --  @param Unit As for the parent's Percentile_Summary_Label.
   --  @return The label in Context's locale.

   procedure Distribution_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Minimum : Long_Float;
       Median  : Long_Float;
       Maximum : Long_Float;
       Unit    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Count As for the parent's Distribution_Summary_Label.
   --  @param Minimum As for the parent's Distribution_Summary_Label.
   --  @param Median As for the parent's Distribution_Summary_Label.
   --  @param Maximum As for the parent's Distribution_Summary_Label.
   --  @param Unit As for the parent's Distribution_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Outlier_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Outliers : Natural;
       Total    : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Outliers As for the parent's Outlier_Summary_Label.
   --  @param Total As for the parent's Outlier_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Percentile_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       P50     : Long_Float;
       P95     : Long_Float;
       P99     : Long_Float;
       Unit    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param P50 As for the parent's Percentile_Summary_Label.
   --  @param P95 As for the parent's Percentile_Summary_Label.
   --  @param P99 As for the parent's Percentile_Summary_Label.
   --  @param Unit As for the parent's Percentile_Summary_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Numbers.Statistics.Localized;
