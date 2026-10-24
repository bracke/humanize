with Ada.Characters.Handling;

with Humanize.Bounded_Text;
with Humanize.I18N_Rendering;
with Humanize.Selections;

package body Humanize.Comparisons.Localized is

   use type Humanize.Status.Status_Code;
   package Sel renames Humanize.Selections;

   function Lower (Text : String) return String renames Ada.Characters.Handling.To_Lower;

   function Baseline_Label
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Result  : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comparisons.Baseline_Label (Name => Name, Result => Result);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comparisons.baseline_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "result", Lower (Comparison_Result'Image (Result)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Baseline_Label;

   function Comparison_Result_Label
      (Context : Humanize.Contexts.Context;
       Result  : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comparisons.Comparison_Result_Label (Result => Result);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comparisons.comparison_result_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "result", Lower (Comparison_Result'Image (Result)));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Comparison_Result_Label;

   function Difference_Label
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Result          : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comparisons.Difference_Label (Name => Name, Difference_Text => Difference_Text, Result => Result);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comparisons.difference_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "result", Lower (Comparison_Result'Image (Result)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "difference_text", Humanize.Bounded_Text.Clean (Difference_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Difference_Label;

   function Multi_Value_Summary
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Changed   : Natural;
       Unchanged : Natural;
       Total     : Natural)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comparisons.Multi_Value_Summary
          (Name => Name,
           Changed => Changed,
           Unchanged => Unchanged,
           Total => Total);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comparisons.multi_value_summary");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "mode", "comparison_detailed");
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "changed", Long_Long_Integer (Changed));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "unchanged", Long_Long_Integer (Unchanged));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Multi_Value_Summary;

   function Multi_Value_Summary
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Changed   : Natural;
       Unchanged : Natural;
       Total     : Natural;
       Options   : Comparison_Summary_Options)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comparisons.Multi_Value_Summary
          (Name => Name,
           Changed => Changed,
           Unchanged => Unchanged,
           Total => Total,
           Options => Options);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comparisons.multi_value_summary");
   begin
      if English.Status /= Humanize.Status.Ok or else Options.Mode = Comparison_Log then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "mode", Lower (Comparison_Output_Mode'Image (Options.Mode)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "changed", Long_Long_Integer (Changed));
      Selection := Sel.With_Arg (Selection, "total", Long_Long_Integer (Total));
      Selection := Sel.With_Arg (Selection, "unchanged", Long_Long_Integer (Unchanged));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Multi_Value_Summary;

   function Tolerance_Label
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Tolerance_Text  : String;
       Result          : Comparison_Result)
      return Humanize.Status.Text_Result
   is
      English : constant Humanize.Status.Text_Result :=
        Comparisons.Tolerance_Label
          (Name => Name,
           Difference_Text => Difference_Text,
           Tolerance_Text => Tolerance_Text,
           Result => Result);
      Selection : Sel.Message_Selection := Sel.Phrase ("label.comparisons.tolerance_label");
   begin
      if English.Status /= Humanize.Status.Ok then
         return English;
      end if;
      Selection := Sel.With_Arg (Selection, "result", Lower (Comparison_Result'Image (Result)));
      Selection := Sel.With_Arg (Selection, "name", Humanize.Bounded_Text.Clean (Name));
      Selection := Sel.With_Arg (Selection, "difference_text", Humanize.Bounded_Text.Clean (Difference_Text));
      Selection := Sel.With_Arg (Selection, "tolerance_text", Humanize.Bounded_Text.Clean (Tolerance_Text));
      return Humanize.I18N_Rendering.Phrase_Or (Context, Selection, English);
   end Tolerance_Label;

   procedure Baseline_Label_Into
      (Context : Humanize.Contexts.Context;
       Name    : String;
       Result  : Comparison_Result;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Baseline_Label (Context, Name => Name, Result => Result),
         Target, Written, Status);
   end Baseline_Label_Into;

   procedure Comparison_Result_Label_Into
      (Context : Humanize.Contexts.Context;
       Result  : Comparison_Result;
       Target  : in out String;
       Written : out Natural;
       Status  : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text (Comparison_Result_Label (Context, Result => Result), Target, Written, Status);
   end Comparison_Result_Label_Into;

   procedure Difference_Label_Into
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Result          : Comparison_Result;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Difference_Label (Context, Name => Name, Difference_Text => Difference_Text, Result => Result),
         Target, Written, Status);
   end Difference_Label_Into;

   procedure Multi_Value_Summary_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Changed   : Natural;
       Unchanged : Natural;
       Total     : Natural;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Multi_Value_Summary (Context, Name => Name, Changed => Changed, Unchanged => Unchanged, Total => Total),
         Target, Written, Status);
   end Multi_Value_Summary_Into;

   procedure Multi_Value_Summary_Into
      (Context   : Humanize.Contexts.Context;
       Name      : String;
       Changed   : Natural;
       Unchanged : Natural;
       Total     : Natural;
       Options   : Comparison_Summary_Options;
       Target    : in out String;
       Written   : out Natural;
       Status    : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Multi_Value_Summary (Context, Name => Name, Changed => Changed, Unchanged => Unchanged, Total => Total,
         Options => Options),
         Target, Written, Status);
   end Multi_Value_Summary_Into;

   procedure Tolerance_Label_Into
      (Context         : Humanize.Contexts.Context;
       Name            : String;
       Difference_Text : String;
       Tolerance_Text  : String;
       Result          : Comparison_Result;
       Target          : in out String;
       Written         : out Natural;
       Status          : out Humanize.Status.Status_Code)
   is
   begin
      Humanize.Bounded_Text.Copy_Text
        (Tolerance_Label (Context, Name => Name, Difference_Text => Difference_Text, Tolerance_Text => Tolerance_Text,
         Result => Result),
         Target, Written, Status);
   end Tolerance_Label_Into;

end Humanize.Comparisons.Localized;
