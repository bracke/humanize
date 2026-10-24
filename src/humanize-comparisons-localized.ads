with Humanize.Contexts;

--  Comparisons labels in a context's locale, through the phrase catalog (docs/PHRASE_TEMPLATES.md, "Domain
--  labels"): each is the parent's function of the same name with a Context first, and that function itself in
--  English, where the locale has no translation, and for every input the parent rejects.
package Humanize.Comparisons.Localized is

   function Baseline_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Result  : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Baseline_Label.
   --  @param Result As for the parent's Baseline_Label.
   --  @return The label in Context's locale.

   function Comparison_Result_Label
      (Context : Humanize.Contexts.Context;
       Result  : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Result As for the parent's Comparison_Result_Label.
   --  @return The label in Context's locale.

   function Difference_Label
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Result          : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Difference_Label.
   --  @param Difference_Text As for the parent's Difference_Label.
   --  @param Result As for the parent's Difference_Label.
   --  @return The label in Context's locale.

   function Tolerance_Label
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Tolerance_Text  : String;
       Result          : Comparison_Result)
      return Humanize.Status.Text_Result;
   --  @param Context Formatting context.
   --  @param Name As for the parent's Tolerance_Label.
   --  @param Difference_Text As for the parent's Tolerance_Label.
   --  @param Tolerance_Text As for the parent's Tolerance_Label.
   --  @param Result As for the parent's Tolerance_Label.
   --  @return The label in Context's locale.

   procedure Baseline_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Result  : Comparison_Result;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Baseline_Label.
   --  @param Result As for the parent's Baseline_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Comparison_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Result  : Comparison_Result;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Result As for the parent's Comparison_Result_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Difference_Label_Into
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Result          : Comparison_Result;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Difference_Label.
   --  @param Difference_Text As for the parent's Difference_Label.
   --  @param Result As for the parent's Difference_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

   procedure Tolerance_Label_Into
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Tolerance_Text  : String;
       Result          : Comparison_Result;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code);
   --  @param Context Formatting context.
   --  @param Name As for the parent's Tolerance_Label.
   --  @param Difference_Text As for the parent's Tolerance_Label.
   --  @param Tolerance_Text As for the parent's Tolerance_Label.
   --  @param Result As for the parent's Tolerance_Label.
   --  @param Target Caller-owned 1-based output buffer.
   --  @param Written Number of characters written, or copied on overflow.
   --  @param Status Humanize status for the operation.

end Humanize.Comparisons.Localized;
