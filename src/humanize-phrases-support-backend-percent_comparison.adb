separate (Humanize.Phrases.Support.Backend)
function Percent_Comparison
     (Context        : Humanize.Contexts.Context;
      Current        : Long_Float;
      Baseline       : Long_Float;
      Current_Label  : String := "value";
      Baseline_Label : String := "baseline";
      Options        : Humanize.Numbers.Number_Options :=
        Humanize.Numbers.Default_Number_Options)
      return Humanize.Status.Text_Result
   is
      Difference : Long_Float;
      Quantity   : Humanize.Status.Text_Result;
begin
      if Baseline = 0.0 then
         return Invalid_Text;
      end if;

      Difference := ((Current - Baseline) / abs Baseline) * 100.0;
      Quantity := Humanize.Numbers.Percent (Context, abs Difference, Options);
      if Quantity.Status /= Humanize.Status.Ok then
         return Quantity;
      end if;

      if Difference = 0.0 then
         return Ok_Text (Current_Label & " is equal to " & Baseline_Label);
      elsif Difference > 0.0 then
         return Ok_Text
           (Current_Label & " is " & Result_Text (Quantity)
            & " higher than " & Baseline_Label);
      else
         return Ok_Text
           (Current_Label & " is " & Result_Text (Quantity)
            & " lower than " & Baseline_Label);
      end if;
end Percent_Comparison;
