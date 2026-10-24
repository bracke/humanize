with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Label_Values;
with Humanize.Selections;

package body Humanize.Numbers.Statistics.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Distribution_Summary_Label
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Minimum : Long_Float;
       Median  : Long_Float;
       Maximum : Long_Float;
       Unit    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Statistics.Distribution_Summary_Label
          (Count => Count,
           Minimum => Minimum,
           Median => Median,
           Maximum => Maximum,
           Unit => Unit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.statistics.distribution_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "count", Long_Long_Integer (Count));
      Selection := Sel.With_Arg (Selection, "minimum", Humanize.Label_Values.Plain (Context, Minimum));
      Selection := Sel.With_Arg (Selection, "unit", Humanize.Bounded_Text.Clean (Unit));
      Selection := Sel.With_Arg (Selection, "median", Humanize.Label_Values.Plain (Context, Median));
      Selection := Sel.With_Arg (Selection, "maximum", Humanize.Label_Values.Plain (Context, Maximum));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Distribution_Summary_Label;

   function Outlier_Summary_Label
      (Context  : Humanize.Contexts.Context;
       Outliers : Natural;
       Total    : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Statistics.Outlier_Summary_Label (Outliers => Outliers, Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.statistics.outlier_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "outliers", Long_Long_Integer (Outliers));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Outlier_Summary_Label;

   function Percentile_Summary_Label
      (Context : Humanize.Contexts.Context;
       P50     : Long_Float;
       P95     : Long_Float;
       P99     : Long_Float;
       Unit    : String := "")
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Statistics.Percentile_Summary_Label (P50 => P50, P95 => P95, P99 => P99, Unit => Unit);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.statistics.percentile_summary_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "p50", Humanize.Label_Values.Plain (Context, P50));
      Selection := Sel.With_Arg (Selection, "unit", Humanize.Bounded_Text.Clean (Unit));
      Selection := Sel.With_Arg (Selection, "p95", Humanize.Label_Values.Plain (Context, P95));
      Selection := Sel.With_Arg (Selection, "p99", Humanize.Label_Values.Plain (Context, P99));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Percentile_Summary_Label;

   procedure Distribution_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       Count   : Natural;
       Minimum : Long_Float;
       Median  : Long_Float;
       Maximum : Long_Float;
       Unit    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Distribution_Summary_Label (Context, Count => Count, Minimum => Minimum, Median => Median, Maximum =>
         Maximum, Unit => Unit),
         Target, Written, Status);
   end Distribution_Summary_Label_Into;

   procedure Outlier_Summary_Label_Into
      (Context  : Humanize.Contexts.Context;
       Outliers : Natural;
       Total    : Natural;
       Target   : in out String;
       Written  : out Natural;
       Status   : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Outlier_Summary_Label (Context, Outliers => Outliers, Total => Total),
         Target, Written, Status);
   end Outlier_Summary_Label_Into;

   procedure Percentile_Summary_Label_Into
      (Context : Humanize.Contexts.Context;
       P50     : Long_Float;
       P95     : Long_Float;
       P99     : Long_Float;
       Unit    : String := "";
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Percentile_Summary_Label (Context, P50 => P50, P95 => P95, P99 => P99, Unit => Unit),
         Target, Written, Status);
   end Percentile_Summary_Label_Into;

end Humanize.Numbers.Statistics.Localized;
